Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853BC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=; b=FZzs6/JX9IO8AHYyva+CHNN6wT
	BNqwElwUTdV+qBCgzh11nztaOObVcKP2dsdtkcxe+bNYgjzmfmpb7YuV19sqdtkpMih3lFwmSyYC0
	4NQrG8+ClxEngPkkTwRwHpTvqTL2okqqrpS/E8sN85x2X/EmsdPQaFmjVgCIO3sYJvgNdRDj2pJd9
	4J2ZdCYSsaZZvf6Cb4psl5JclPvJH7NS/pVdDvGR+NQGXQ4V8XdG9Oi8mjJ6SEWsHrzOu4esqtZVl
	J8fpNlfxjGjt0r4dUGjyD7ZAYsKiao/ltJXqCS5mE+gVWSwAGduF1muYWPFz8gw/a3d8HIAqwwdBL
	Gid/ySQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fPR-1TXz;
	Mon, 14 Sep 2026 21:10:01 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw5-00000004fMN-0zB5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:09:59 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae7166edso1689671eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420196; x=1790024996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=lO0GEOOKSPVx1BzoMDRMkXi50460P3ravSYnt3A6UkpcHyCrUFqvsC4oJWm/4fCOWO
         PRD6G2/F/kTdPJQ42DpTN8uCz887RJ6q+K3rM4OJK3H+JP74uqQe3oLHZySVMiChfeVe
         DEJWYUGwATOK+yBDMau9XwIBz3e89UR4xdNFwR0Ik081RSkwLwioudsGuu9qnk3Hzcja
         p+JG72Ehzmg0KK+fPu+DTwlcIU5QzK63xBo23fnPO6CCIbq3//ncsAMfT3uZSZ3A3md8
         WlTcUcEGQLuKTy+WrDt3L+i5fE/5joH46XrAdSx0hMMDnxyi3N4UIK5X9Y7H2x8iCsgH
         5kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420196; x=1790024996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=hAY+SeAfZInA9jeX9wENdxUK2ciZZwZa1Q9BQ3xN32xUioIR7C3ZiRAL9xM2NKpcTS
         x+KZEOwx7DkFl3cCbo66yaJGZ0Y0yH4/3K2D+eUsVl52wAm5boKjNROkcyZbpYcVbkln
         oF6B2UtzyZfxpGwdrCxuh3K/48b6KxAHNoDkOIQ4lKwl+ADWoe0vKSr2TeXK/Z7qVQbk
         VdFUHqG97ryIvRhZlHzo1vJxeFX4t2q7QkKCWPnH/n7Yfo0dFrAZp3kqwXH+68WNDg4u
         Ll0JbQ08AlbDFMd+9Kpayi+C+tz1nm9X/nFUATjYTdFnl5d7QM00jPea3gs9wUP7O3st
         mHGA==
X-Forwarded-Encrypted: i=1; AKwUvByAMfiKmO1yq9rUNebSDBqGn4TaW4LVmsTKV+UQ2iMghVuirwoHFVlWeV6/jTlXdoZuaSeutH9zZPBcwatPoZIf@lists.infradead.org
X-Gm-Message-State: AFuF++lBTKeWd7Lhw7TE9Xr0AiyIrXPvlY6I1mLXwCCI84MJu4lbnEvU
	x51/mQN5BQCiqpVHWAkDu0N9ybVyw51M2xqVKq8Cdj05zkUxgK8XgaU3
X-Gm-Gg: AYBFou1PpGu89f3Qaqu7dZc5SmvlAoZlRqD5VRkkraTMwfwJDsPDZMjF66EXkoTvjqC
	9L1FCaiiDo8JTNlrvNAdmO1Js1v8WgAfGjNkVUjaMEDIEe0JcvGkQoOSwAXvwCubyny/D/GZq9F
	7Qlk98gdTTnhVV7liS58T+37JPij8dQejwYrziuuHp5DD1nZoYJ43gfuLaiB6M+1gW/zBCl63um
	oDoE32Oe4qoHBNYnxJv0Nd99tfvVJUSxk3TDKCFcjQISn+ZbfAenYzMv+Tpund9oJ9uw/rRt6el
	T/6hi9am5J4an9sjxfbGD4p1Q0qcUwhxcJUKNh7uMYMUjTlgIB+9GRaubtKedtHqhTrjiSB1nMG
	6bVqlbcOxzryLmTpfS9BvBtLsYLMDruakCl+yShj+aWxMH7ko/SODtQRoBi8lkmaHbFT8pcoHcW
	B1RaS9hsGmkVAhW5jjBEFHyJExBOJcXF2fElXOhkDrPfw6UdqTZ6qxcUC2FTa4Rsb5fJBw+zcTl
	GyjWsfLgSxIBr8F+s57h5IxuufYSEyeujuVZN9b0Zdx/IpfIOjNHWKU0+ZM1apR3eDkYZ0OoBqr
	7P8Bxg0LnJqXNPI0uLU+FLzecSkUwBdSZcwgvwxsBtxenE//zrtt802Jr105CO3irDcjJCUd9YC
	66ehZF8xyss8AsDBXBMGT67rajvAa
X-Received: by 2002:a05:6820:4d01:b0:6a1:4507:3544 with SMTP id 006d021491bc7-6c540d62bbfmr2624632eaf.28.1789420196428;
        Mon, 14 Sep 2026 14:09:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:47 -0600
Subject: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140957_276922_32B19C96 
X-CRM114-Status: GOOD (  22.37  )
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

A timed-out wait can return while the interrupt handler is still using
the previous operation's interrupt status and enable mask. Starting the
next wait calls init_completion() on the same object, which can reset its
waitqueue lock while the old handler calls complete(). The old handler
can also complete the new wait or restore an obsolete interrupt mask.

Initialize the completion once in probe and use reinit_completion() for
each interrupt-driven wait. On timeout, disable and synchronize the IRQ
before masking controller interrupts and acknowledging the waited-for
events. Draining the handler first also prevents a partial-event handler
from rewriting the enable mask after it has been cleared. Flush these
register writes before re-enabling the IRQ line, leaving the controller's
interrupt sources masked.

For successful waits, move complete() after the handler's register updates
so that the next operation cannot race with those updates. Keep polling
unchanged and leave controller and DMA abort handling to the existing
callers.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..e50cf5b6a730 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -374,6 +374,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -393,6 +394,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
@@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
+		if (!ret) {
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
 			ret = -ETIMEDOUT;
-		else
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -457,6 +463,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2617,6 +2629,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2625,6 +2638,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0


