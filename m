Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CAAD29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XA9PZwf+sJz4LH3JCk5SCD3ppC+GHhEdRkZJEIAPoq4=; b=GhKbKGuE4pWVa4AtUkzY8t+RSe
	1zwLBlWz76Mgxi7fl6o3RFzMrrH+t3aLlFSxbVj5CWBrsOKtTZQGz9Pi1blDyyn7dtLlRxNTOa/if
	wEJmCpEw2Ibq9L/RRqa97gWJxg3W1jkuDYeInNW//ZQnu+wi22c6EvM2zDF5yXIc4eerw3AqWi9dE
	Xo1JBT9J9nJtlkWrj1xoQoL4uap2iPD3Q9ieXrsdEEHQNWTK7GHK0a80abO4o3dt/WM3Ya9WFLI+c
	mycOOJNfGh807pVCpNjBqis62u85Ox1Gi0ri0JDRM2UIthzJ3J5SyIUcJx9ZiJRcYG+ddDfc5J6gv
	AWGfPUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8biT-00000002Lor-06ot;
	Wed, 06 Nov 2024 08:48:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8beN-00000002L6c-2ude
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDDC05C4A65;
	Wed,  6 Nov 2024 08:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E91CC4CECD;
	Wed,  6 Nov 2024 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730882666;
	bh=epVEU2AYAhlpV2xVETpPhEIE78lqpbGzb/PrPhs7GSM=;
	h=From:To:Cc:Subject:Date:From;
	b=sgMe4KmOH7KJ1IcKn+B9Q79s6G9NZe5vOEBlKBzaiZHzZeOK0+NotQ+v2nOORZdpA
	 46AIMqkYAd2Tmt+NDDGwIgyv++GFm6xhc9geukIkjFPthX+nxH5EtcezUywjY7Wkti
	 mpq2aRs1pxyUMnJoJNpnM/3B0xt/Fk7FGC4WPflxBD6VVjNQiAa5+ga4GQNChoER6F
	 mgoIr5qxqLTFZwexUfgLZuvjLAIJ80KrX9GZbHetq6TtgkucijjkI8WN8eMGu91C2f
	 0KuhZQ6jvGo8Go5MpOzXYlgK09OYNZVczVQDGlBGLE743vpGiPNlSF+QH4ZrRfiBvV
	 P8mFZzxa+0Zfw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t8beJ-00AHp5-UJ;
	Wed, 06 Nov 2024 08:44:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Christoffer Dall <christoffer.dall@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/gic-v3: Force propagation of the active state with a read-back
Date: Wed,  6 Nov 2024 08:44:18 +0000
Message-Id: <20241106084418.3794612-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tglx@linutronix.de, christoffer.dall@arm.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_004428_867359_2958ADCA 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Christoffer reports that on some implementations, writing to
GICR_ISACTIVER0 (and similar GICD registers) can race badly
with a guest issuing a deactivation of that interrupt via the
system register interface.

There are multiple reasons to this:

- we use an early write-acknoledgement memory type (nGnRE), meaning
  that the write may only have made it as far as some interconnect
  by the time the store is considered "done"

- the GIC itself is allowed to buffer the write until it decides to
  take it into account (as long as it is in finite time)

The effects are that the activation may not have taken effect by the
time we enter the guest, forcing an immediate exit, or that a guest
deactivation occurs before the interrupt is active, doing nothing.

In order to guarantee that the write to the ISACTIVER register has
taken effect, read back from it, forcing the interconnect to propagate
the write, and the GIC to process the write before returning the read.

Reported-by: Christoffer Dall <christoffer.dall@arm.com>
Acked-by: Christoffer Dall <christoffer.dall@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v3.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index ce87205e3e823..8b6159f4cdafa 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -524,6 +524,13 @@ static int gic_irq_set_irqchip_state(struct irq_data *d,
 	}
 
 	gic_poke_irq(d, reg);
+
+	/*
+	 * Force read-back to guarantee that the active state has taken
+	 * effect, and won't race with a guest-driven deactivation.
+	 */
+	if (reg == GICD_ISACTIVER)
+		gic_peek_irq(d, reg);
 	return 0;
 }
 
-- 
2.39.2


