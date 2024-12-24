Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2584E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 00:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkuAahAf8W+lppm/Zglud67b2SqLzah4TgosvvOEGfc=; b=LY3I0WOGEoqT54VYKiWfz3SdMq
	t4SIJG46Wd906yoeHdLVHgs3EUdabnbiDXzUfGCYujTOAsF/OUmyJtfv+k6B+cZkRQyyY59brw9Py
	W3l5piS7qozVtuZaDQ7efKW4J3GmL41uxzHK2zC3G7ah0ZNPtkQyNgmlTnPj02tUcVd+K4f1YTFg6
	b8W1+XgqkJSz3Cj/1fcEAo1LHpJx+yibRs+bbPXefudmZTB7HpJewGWcJrqiDq8IV+LAl6eSbsuz3
	RG8cq4nLlla4YSNQo2PLjDXU+IxfYi3UbZwL/pgDH0GjoaOk5pnwoNpb7OarhXuHNDn4hM9lTFWtT
	JAPkYSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPsdM-0000000AvtM-2leN;
	Tue, 24 Dec 2024 00:18:48 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPscA-0000000AvmQ-2rof
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 00:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=SkuAahAf8W+lppm/Zglud67b2SqLzah4TgosvvOEGfc=; b=SeoanKNlTVXq29FJ
	Se633hZabWsrg+MaHfYYZ9NpwVqWvZ4Sud1lcMt7DH306m6HIBcRk2OIgGjCiEYLg7AsiPsHK6jKU
	CK90YgXlpIxMsWK5sbzcXTrG5Q4bdi1NnGjcX1WSgpBijK2Z8GMpFHCBbuFiKORDvGtY8kSur8kh6
	UV2bBhdQhsK/OfAUqVsA7UgvnhhMCJdwf5SR7KIZszhm9CqS6jb9pOY3+UaTY86Vx3W5izzSiaast
	KlRlSWTyQAtHiKFqg6ud0DmNtGDHADveHGWlb1cOWzTRxHSbzKldfPToRmCqnxJr2Ey9ekcSkZXns
	8d/+hakImSfq3X/5Kw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tPsc3-006vtl-2U;
	Tue, 24 Dec 2024 00:17:27 +0000
From: linux@treblig.org
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	tglx@linutronix.de
Cc: linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack by generic
Date: Tue, 24 Dec 2024 00:17:27 +0000
Message-ID: <20241224001727.149337-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_161734_816866_3E9E1D40 
X-CRM114-Status: GOOD (  13.99  )
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

brcmstb_l2_mask_and_ack() was added by
commit 49aa6ef0b439 ("irqchip/brcmstb-l2: Remove some processing from the
handler") in September 2017 with a comment saying it was actually
generic and someone should add it to the generic code.

commit 20608924cc2e ("genirq: generic chip: Add
irq_gc_mask_disable_and_ack_set()") did that a few weeks later,
however no one went back and took the original out.

Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/irqchip/irq-brcmstb-l2.c | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

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
-- 
2.47.1


