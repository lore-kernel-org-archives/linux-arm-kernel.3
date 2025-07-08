Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76BCC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAkBTT9KlrO7apx7qUbiEWJ4PRN5U2M1lzwF6AxFLek=; b=d7AavtgYYcq8xjshndZlPNLglH
	OI3cXxuXMtgCZHuSIH6EkMmi2pEZDQKAR2PwTWFnfngyVNVP2mmmtBA4KreXKRCuxu5AmRjRFiuNa
	goEYNkhVbAQElO+2xRQ6vuZUt+G3ZqZcU3/OUBfyfIY5bcX4JTBx+tn6SqK9AHC3aV4Gl0b6/023D
	2GLZj4b4MTkoIU4e/EYapNihjP/JbU4ZY5NPzruPl6fceNYtZCgnKd4LhZYYC3b3FZxNOufsWRnd8
	huwxJJbqJp+fmE/urqTveuT21cnAZTxypMASHTR7vTkh/0G+ZuaM/NC25WTXhPkjmIcf8s6Wjcj8D
	SXRgK6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA2-00000006McN-2lBE;
	Tue, 08 Jul 2025 19:39:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCp-000000067mb-3nom
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DA340C1E;
	Tue,  8 Jul 2025 17:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B06C4CEED;
	Tue,  8 Jul 2025 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996050;
	bh=eO//bdZjML2f/yBZKp3pfm6LXOZ7G6limhAcR80kGHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q1uXX1a9l+I8CG9FADpHMOcZ3yd7vIohUDkbLuCoFJL29a5uBH6HmBitz7BcBI3Pi
	 22oA/96TYkhn4RUhUWX/1AuGTw1UEdedkbTuR4ds/nZcEI8eqap3HSrUksWw+bXvxD
	 Ci0oxoqFkzjbVGl7W79dh5RmobXurAXbrGOPIi7W6yS+sR8P557cfhMY1/kCqEdG7e
	 ejVw4rq7LRZnzLHmLG4QXdw88ixV07LXBNqGqCXSqCvvRdPbISzyf9EGKtj6Bh9BLO
	 N3GdHsSMbf3pI5s0Zjn2VJ2baD2cXY1tUYDOHRIqI0Ke6kIAxBkKVg/YwEQ8MiARpg
	 rNZVXwjCv1HjA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCm-00Dqhw-Pt;
	Tue, 08 Jul 2025 18:34:08 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 01/13] genirq: Teach handle_simple_irq() to resend an in-progress interrupt
Date: Tue,  8 Jul 2025 18:33:52 +0100
Message-Id: <20250708173404.1278635-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103411_971161_9621B5CA 
X-CRM114-Status: GOOD (  13.79  )
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

It appears that the defect outlined in 9c15eeb5362c4 ("genirq: Allow
fasteoi handler to resend interrupts on concurrent handling") also
affects some other less stellar MSI controllers, this time using
the handle_simple_irq() flow.

Teach this flow about irqd_needs_resend_when_in_progress(). Given
the invasive nature of this workaround, only this flow is updated.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 2b274007e8bab..6e789035919f7 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -559,7 +559,13 @@ void handle_simple_irq(struct irq_desc *desc)
 {
 	guard(raw_spinlock)(&desc->lock);
 
-	if (!irq_can_handle(desc))
+	if (!irq_can_handle_pm(desc)) {
+		if (irqd_needs_resend_when_in_progress(&desc->irq_data))
+			desc->istate |= IRQS_PENDING;
+		return;
+	}
+
+	if (!irq_can_handle_actions(desc))
 		return;
 
 	kstat_incr_irqs_this_cpu(desc);
-- 
2.39.2


