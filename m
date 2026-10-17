Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366B3CCF2CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=; b=SF6fU+Bj9IuQ/SCHT1q6TTeyfH
	/wcRX5Md/a9+X7j/gRpj7w2A3tZqME/D/9XkoWN54mL4PoMUZ6YcNBAoGCWFMAvGYA8+2mPhUrrDX
	+LhrGDxzMT809pRxTgVuZ4/BCIo9BSj0IGOhU5a58rZ8t93EBCP9o8FW1bMtuRolqGop9++Mvx5g8
	AaVBM96H5SS3CQcfDOHL3fZb85BSQKjV7u5AsPJsh05nvElkza96F5ir2dnW2ZU8qHTblgd/rp/ne
	5gJ6ptf7kBb7JAEP07RT/cGUZ3HbdJx5oAW21CG0Pfv6Nexqz7R8w317ZlBZC2JCqwEg/q8gFm3aS
	eKLWHLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMS-0000000596Q-2aXd;
	Sat, 17 Oct 2026 19:46:32 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMH-000000058tJ-0E04
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:24 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-53ec92375d2so275424b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266380; x=1792871180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=;
        b=m4AuBxI3J/+bBNgRIm/9z2u/NSKiQEu4J4jBv6maaKdE54DbM3nO0kE8SJM3ZVlTFg
         GElqRUta+kfY+lFqGtJ63pujQy6JoVyQufwEQBIQ/e6+59O8CDmovrsqgLJyXYiolvRN
         gWjUIglVxz1Z/UeJc/2SXwcrkM8TV7cJ1xRNdxC7K3lcJbu4jK04KlwhrC8rrwPpwWEo
         l0FnLxA2ivxH5sNp2NfXGYiq879ANn31QV6lw8qH89HabRk6KvhYNv+fi3BJxPbLGtRE
         6e2Cs7EsxtLMaRwtAEUcuF3+PnHtMGFaQ9S6v4WKpgWOAVZdYTSruXh0oYeAxh8Gk1qr
         B/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266380; x=1792871180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=;
        b=IWr19jkI2GgvwLOa0eqUmIRlHHtpWhckC6tEUy8lEPc5kgzx4EHXGeIulRqMWGK0Db
         LuBK0HJ3bzFbBvDFQjTroTTIE1aqYVFOqR9LTROysuMUqCvaOORHRu+vxNbm/blCi6eX
         PmrIIZNuMljDGXS9942YflEs1z5L2HnOheJzmSKobYeeYm0PwJq8f2BUTvYxUebeRY+i
         k6ZkL21x9ADNPkdnQYUtdCBKttuFwaj7MtCtSQxTF4rQvmpqWJTfuP2ZJaYpcJAc0/6E
         uAOagNOkCU5X15RkXAzMcGJWUlGMPSX+4nhsZ19gFf1TMIMl2RLSu7LqXezX1ATinqey
         8pNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3RrSS7Kykrp+N7UivafwgWVnOe6FDlCp2HtstLrEVYl1+l9idtsSN6H42F4xv1WRZackmGAuDBo5QMvtkLydm@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6vvMe5tdMafJTtusJx5qpzU8qgs2Vhs+FZiuK3/XbJEn1lKrN
	nKnCk24E3U6Bu4Sd1AHL/AgXWNrPDaBRyBLA+7M7LbOdBtWi89qVeYNX
X-Gm-Gg: AYBFou1TGWmOmAPb14B2VssQEmoDJt3F/0HVlmWh9MxiUMA9zcdqdn10nTRwx1as1BX
	PDuaPKQYpjUkNSKO17jN8BdfifIF2o3BKIZ7nNY/LwT1+iMdbEVETtwPDOJoz9SauMp1LgOeGkA
	SnsLUa7gnt3rLOXyyooCQ5y9cJuZwMhiZtOe8Dr4BWWjrLLoQOkkL650FYQ8N5owiMeEwfvWFuJ
	jdUdYS/5VxyQe6CTtLB41n/1vMHprJKzAvTBLRHlFgU8G/Ol8jWYFUY4QFeNzjG9UtUhQfBAqwu
	qoS8uw+mZsQ659+PHCWu1iOGnL+GlY+X2B3DZuFfGb21xWHWs7DcrO7ITemoAjYXGvd348X4YQk
	ZepamEdDbVVPeRzpQ/EkyB6y0FPc31d+kG9AYgQq9gxYf2ZjYvR4Yu7aAk5y7BNsr8uXUKHJO0W
	RsSZG0KcgLAZF83ZVmL16FQVbFxB8XiyV0rOaQ60HA/SpK/n3rNWc62u5lpBze4OM8AIqfbk9vF
	pr053WUbjmzwvVZGohz7aDXlzPdSywqDyWTxS5PUDNRDX4pmTssLT3it6RmmqPTyc+rFfCosteP
	XUmqFe0VEzhyg7V3iyV47YEjs8tzh0nxQm7Mk9h4O3G9WoZwqDpCoS5cvGE5LeGoMCqI+Gs9bwU
	E1xad9oqyrruNHutmBecNkw==
X-Received: by 2002:a05:6808:4f28:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-53cd1cb5c49mr3420662b6e.58.1792266379933;
        Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:00 -0600
Subject: [PATCH v9 05/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124621_213741_5CD2CBBC 
X-CRM114-Status: GOOD (  25.62  )
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

The controller uses one completion for successive interrupt-driven
waits. Some transfers wait for both command completion and DMA
completion. The handler acknowledges each event and masks it, leaving
any outstanding event enabled; it calls complete() when all requested
events have arrived.

sunxi_nfc_interrupt() currently calls complete() before updating those
registers. A successful waiter can wake on another CPU and start the
next operation before the old handler acknowledges status or rewrites
the mask. Move complete() after those updates so waking the waiter
cannot precede the handler's last controller access.

A timeout also needs to exclude an unfinished handler. With PREEMPT_RT,
the flags-zero IRQ request is forced threaded. Near the timeout
boundary, that thread can be preempted after reading status and enable
bits while the waiter times out, clears the device mask and rearms the
next wait. The saved snapshot can then restore an obsolete
remaining-event mask or, if it satisfies the old wait, complete the new
wait. Masking the device does not invalidate the running handler's local
values. Repeating init_completion() can also reset its waitqueue lock
during complete(). This lifetime problem was identified by code
inspection during review.

Initialize the completion once in probe and use reinit_completion() for
each wait. On timeout, call disable_irq() before clearing controller
state so existing handling finishes and no new handler can enter during
cleanup.

The hardware may have finished before the delayed handler runs, or the
handler may complete the wait while disable_irq() drains it. Recheck
status against the remaining enabled events before clearing either
register. Events already acknowledged by the handler no longer appear
in that mask; if none remain, the wait has completed. This also handles
command and DMA events arriving separately without requiring an
already acknowledged status bit to be set again.

Then mask and acknowledge the events, read back the mask to flush those
writes, and re-enable the IRQ line even if the recheck changed the
timeout to success. Keep partial-event handling in the IRQ handler and
leave polling and controller/DMA abort handling unchanged.

This keeps additional synchronization on the timeout path, without a
driver lock in every interrupt and wait. The caller can sleep, this IRQ
is not registered as shared, and the handler does not acquire the
controller mutex held by the caller. The tradeoff is unbounded cleanup
latency and no priority inheritance: a starved IRQ thread can prevent
timeout cleanup from returning and block other operations on the
controller. This is a handler-lifetime boundary, not an RT
recovery-latency guarantee.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 29715d179d22..5b736a4a7fe9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -401,6 +401,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -420,6 +421,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -441,18 +443,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -462,16 +466,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -484,6 +500,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2664,6 +2686,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2672,6 +2695,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0


