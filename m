Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B6CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NEACNtD9AMp/3i2ugMhnbog8OjzcHTOvl7Vh5dzlVDI=; b=tWe2yhcMb8mLnS2u6jI4DfVWPb
	2+sduYesR6ZxHaeS7qi1Rw+A2KQ9iF2mQf2X81aU63UXQSKA7AEwsJCSMhVjXdpbC+dE/CqOpDTry
	jUTQscyzkFojZPIv28/thNISPtTJS8KyaXEChnX6P82yCWIfT2u3gWRtLu56SYfh4taVI2TzRJEZA
	vxOD4KJYSfId6Vwgyxiftb7eCWrqHWFNu9i6ofq07fTN40Sk9rbcGb2L8nzGQbU7aiWoCoOkkHbNW
	l7G44fObZokggaJ3u8oBOYMqbLoSo+P+3oK/7C4sXkWpZNLXq5i3brUd9mSCQrOIarGS2rx646uIN
	XWL/hAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEFe-0000000DUv8-1JvA;
	Thu, 16 Jan 2025 01:00:50 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEEO-0000000DUqG-2KEL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 00:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=NEACNtD9AMp/3i2ugMhnbog8OjzcHTOvl7Vh5dzlVDI=; b=RJsCC+H5frD2Hp4K
	TA87oddvahGe8umxGnJwA6ynYtUBNhlH2N95io5HfSDqv27GcwOvQFeUoDAopPUCV3QEbn8mpdru6
	Es7RzQ2mPYA2KEzO4XjhtwQOjBul1D4KfgEHGKher0vcGM/f3mM5zqoCR9DhOhXxZ5C1iEgkyjkk8
	z45q7CQ6E3VHCWpC57ilJAlqupB8dxYVkyY/zNu9lqF5qN+BqLyvFAjdiQT6gKpjktMSssb5IDX1L
	hRnYSdIwWqDYyvubBYpe/8XXFdFjMxeM+CygU/hsvDevZEa3phSmGXscYFTONTZG4ktHWIjnbmuLo
	2wqvaP6St3GXbUTi4w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tYEEC-00AW4x-31;
	Thu, 16 Jan 2025 00:59:20 +0000
From: linux@treblig.org
To: florian.fainelli@broadcom.com,
	tglx@linutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com,
	x86@kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
Date: Thu, 16 Jan 2025 00:59:20 +0000
Message-ID: <20250116005920.626822-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_165932_582664_49D08969 
X-CRM114-Status: GOOD (  16.32  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Replace brcmstb_l2_mask_and_ack() by the generic
irq_gc_mask_disable_and_ack_set().

brcmstb_l2_mask_and_ack() was added in commit 49aa6ef0b439
("irqchip/brcmstb-l2: Remove some processing from the handler") in
September 2017 with a comment saying it was actually generic and someone
should add it to the generic code.

commit 20608924cc2e ("genirq: generic chip: Add
irq_gc_mask_disable_and_ack_set()") did that a few weeks later, however no
one went back and took the brcmstb variant out.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Link: https://lore.kernel.org/all/20241224001727.149337-1-linux@treblig.org
---
v2
  Add EXPORT_SYMBOL_GPL as spotted by kernel test robot and
  fix suggested by Florian

 drivers/irqchip/irq-brcmstb-l2.c | 28 +---------------------------
 kernel/irq/generic-chip.c        |  1 +
 2 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index c988886917f7..db4c9721fcf2 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -61,32 +61,6 @@ struct brcmstb_l2_intc_data {
 	u32 saved_mask; /* for suspend/resume */
 };
 
-/**
- * brcmstb_l2_mask_and_ack - Mask and ack pending interrupt
- * @d: irq_data
- *
- * Chip has separate enable/disable registers instead of a single mask
- * register and pending interrupt is acknowledged by setting a bit.
- *
- * Note: This function is generic and could easily be added to the
- * generic irqchip implementation if there ever becomes a will to do so.
- * Perhaps with a name like irq_gc_mask_disable_and_ack_set().
- *
- * e.g.: https://patchwork.kernel.org/patch/9831047/
- */
-static void brcmstb_l2_mask_and_ack(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = d->mask;
-
-	irq_gc_lock(gc);
-	irq_reg_writel(gc, mask, ct->regs.disable);
-	*ct->mask_cache &= ~mask;
-	irq_reg_writel(gc, mask, ct->regs.ack);
-	irq_gc_unlock(gc);
-}
-
 static void brcmstb_l2_intc_irq_handle(struct irq_desc *desc)
 {
 	struct brcmstb_l2_intc_data *b = irq_desc_get_handler_data(desc);
@@ -248,7 +222,7 @@ static int __init brcmstb_l2_intc_of_init(struct device_node *np,
 	if (init_params->cpu_clear >= 0) {
 		ct->regs.ack = init_params->cpu_clear;
 		ct->chip.irq_ack = irq_gc_ack_set_bit;
-		ct->chip.irq_mask_ack = brcmstb_l2_mask_and_ack;
+		ct->chip.irq_mask_ack = irq_gc_mask_disable_and_ack_set;
 	} else {
 		/* No Ack - but still slightly more efficient to define this */
 		ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 32ffcbb87fa1..c4a8bca5f2b0 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -162,6 +162,7 @@ void irq_gc_mask_disable_and_ack_set(struct irq_data *d)
 	irq_reg_writel(gc, mask, ct->regs.ack);
 	irq_gc_unlock(gc);
 }
+EXPORT_SYMBOL_GPL(irq_gc_mask_disable_and_ack_set);
 
 /**
  * irq_gc_eoi - EOI interrupt
-- 
2.48.0


