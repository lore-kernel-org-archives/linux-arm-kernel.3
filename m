Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5661FD7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bEU1BOXLCCU/MHT0ARlCQbWJaL+XgXZR+h2HUR10Pvw=; b=etNZyAmrNCRgRVBtPB6saRP7dc
	OFeUIsBoSKJZO4UtmEnO2EMz3sLM730PpyQjiYpoqRtoCkjHRNbz8+dmI2pLeEiE05QkV63O0ZHQW
	sMbFlMePDwM1wFj1llzzq70IeXOgczzABru/oC3K+YnIpalO7NPc9HRCx+GOkWtFUveoMLUS0HVBG
	NVp2s9iqq8E/XBuJyMT8MZgI5cC7pv11mHzCkyU83wvOJLi2eqZ/Qemvk01jFcGY3dexJbCRK/1ER
	5e4CX2ugC5F8K9ROKMPgbPqzIipD5LNHrr6XV3/dZFDOvf3iJdi0wSTMveLNmqLqLmc5FOYfxXYGV
	4C0fJeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4kp-00000005vwG-2jZb;
	Mon, 02 Dec 2024 11:38:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4YN-00000005suk-0nBz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FC315C6229;
	Mon,  2 Dec 2024 11:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD8C4CED1;
	Mon,  2 Dec 2024 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733138721;
	bh=2uqvsHsmU2KBwBwiLQTzowJxyoJ4ZywdDrBFU4cFoz8=;
	h=From:To:Cc:Subject:Date:From;
	b=q2l4/4dYLd5Q/ezlwWOV7BXqyEPORxadCRJTrRR6vcu9Mm/ma2nKaGjRHP+rAOQym
	 XgrASSijumDPfZCE0yqXOmTTCQWlDs0OPhgrtqPfq6+d+B9muIhdmQGlStADavzYVN
	 f86jYFV67MKADRRfiMbsgCzE5nQr/gyRIESPbvmxkIf6OREoYlP+U/n6oaRXRm7XBo
	 AAgrfaqbNu28MDiF9zyyDdWr12XJj8bd+FxR7jBAAx4bqgHZvpus+BoS8zPWQ7SURe
	 sQic2bjVDoN4qw0vq+3vnr8ZXqz7G0eL285Ui/7a7s8T1GG77hgqeSzJ4x83872JD2
	 WBbxH8jHM4GhQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v3: Fix irq_complete_ack() comment
Date: Mon,  2 Dec 2024 12:25:18 +0100
Message-ID: <20241202112518.51178-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_032523_268042_7BCD9304 
X-CRM114-Status: GOOD (  12.58  )
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

When the GIC is in EOImode == 1 in irq_complete_ack() we
execute a priority drop not a deactivation.

Fix the function comment to clarify the behaviour.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 8b6159f4cdaf..34db379d066a 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -817,7 +817,7 @@ static void gic_deactivate_unhandled(u32 irqnr)
  *     register state is not stale, as these may have been indirectly written
  *     *after* exception entry.
  *
- * (2) Deactivate the interrupt when EOI mode 1 is in use.
+ * (2) Execute an interrupt priority drop when EOI mode 1 is in use.
  */
 static inline void gic_complete_ack(u32 irqnr)
 {
-- 
2.47.0


