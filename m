Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6989C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9WaWuQzWCBMf/i1JGXiTFCvQ0vQKm7G5pEWFUvxGmc=; b=sGTAf+3X3xnL6Tfix1HKX6x1yR
	+/KMDpah+/CIFdvqKtEFa+9QLNdwnzCxfyXyDodaVz8ibcXgfx2uSWD4269gQ9Z9dj7DhyH145p3s
	t8e3lOsyPxX5B1i2WRE2QXKzJpMMbMd0V7nceYw7MWxcUxVEL4vqOlG6fFWboEbBLc/KXT160vEvD
	x6eJDIJtDRFjCWH8RPjhah3TLn4RP9X2qK1tJP4O+JcbM/fnNqz+lKlpzbb91ILBDWLCXVTpQ5ig9
	lEppYh9zoAVbL+A+r160q6t8Yj7bYTd6qEQ6+i6B0iqXPKlroqkFGGs72Mt+ZphpIkXdNU6d1PQ8y
	g0OF63sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuptt-00000008WiZ-14Rn;
	Wed, 19 Mar 2025 09:39:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupnQ-00000008Uz8-0da6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B714861559;
	Wed, 19 Mar 2025 09:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D22C4CEEA;
	Wed, 19 Mar 2025 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376785;
	bh=lpe2nMjBH6bRGUp97awppdXuPJprE/OB2HYTkQFwj2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CS9SLPm3ODFm7grX0xT8oSAGpraaWE481ovNpwZZOPIHEcQZ10Zoi8cmasGql60us
	 KFGXkSaL6cFW/8eNM9cVDTiSexUCg2LLTxXthv976G0uuA41tNbOCrdEOQtPhIPkX9
	 DDRvHfvb03tE2DLHaga2iDgPDL9d8bHb5YTx9M5FA7gj8r2KDJU+avAvtmuzK67hqi
	 x5BmMm3FLMpPcdToibK3SURlyUjyQhcQBehTSeiSP2N3wy2dl+hlI9Nt+jdQwHLoF6
	 bIOzVa3TdWXCoKbBmls/FijoMCsYtLcpY4QY5gyLbqxQt9n82I86TSke8j9jyS8T7z
	 3tzHfHsIMQzeg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 46/57] irqdomain: irqchip: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:39 +0100
Message-ID: <20250319092951.37667-47-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-armada-370-xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index e51612992735..67b672a78862 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -546,7 +546,7 @@ static void mpic_reenable_percpu(struct mpic *mpic)
 {
 	/* Re-enable per-CPU interrupts that were enabled before suspend */
 	for (irq_hw_number_t i = 0; i < MPIC_PER_CPU_IRQS_NR; i++) {
-		unsigned int virq = irq_linear_revmap(mpic->domain, i);
+		unsigned int virq = irq_find_mapping(mpic->domain, i);
 		struct irq_data *d;
 
 		if (!virq || !irq_percpu_is_enabled(virq))
@@ -740,7 +740,7 @@ static void mpic_resume(void)
 
 	/* Re-enable interrupts */
 	for (irq_hw_number_t i = 0; i < mpic->domain->hwirq_max; i++) {
-		unsigned int virq = irq_linear_revmap(mpic->domain, i);
+		unsigned int virq = irq_find_mapping(mpic->domain, i);
 		struct irq_data *d;
 
 		if (!virq)
-- 
2.49.0


