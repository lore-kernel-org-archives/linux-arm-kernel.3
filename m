Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662BDC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=; b=1lClaFfUTHEHoJu6YbdRqZJ0Mc
	m6IidPO5mdh4qqg96jxckjtwxhqchU6mJYGwqkk9ayqwoMtWh0edcSXTVzS52by4SwvYnNVxavQZl
	0dwTX4JpzGajCzwAOlTbHaNbPnDjE4uolk6cpxbYjbp95ISz5YgYCcj8BAAOp80mhtrzV8IgOxqTb
	LdZcEQNUuyTld/xzfferGE5RdZKO4VpDHpmLaF7r+FHNFmN9ATB5Xfe2MWS4WMRjPnh9N2VId8Rdy
	ip6z/M7bCw2qJkEH0nTRmk4p7jhnAPDCd5jl5JYKRZbLPN4XqLD9UDf/Uk+baV/pdLTyyxzHZ+JyF
	nJTOSTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSw-00000001MGa-2Qj5;
	Sun, 13 Sep 2026 04:05:18 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSn-00000001MAS-488l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:11 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 46e09a7af769-7fcb425fc2bso609799a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272309; x=1789877109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=Cl+FOqpQ7qsw09tG2GdyRS+8kAhltdg9NE5JBEgEnxzY6UtjtiDU7V4Ibp5xtDqioB
         ekREdgtCNlOvd87kyr7UeEz5a1fFI7TB7szO/4ildtFO/7X/3PZvzHOZLpNDPzSneIsn
         Zi/NVIrV13+YhFn64TC3Q0+SD5pPhmSDXnzdFVbMg4VXzJOHj1Zp0lXqwQhhFE3sBiRK
         97VxnXlsx65/EkCK4G/gSZn62e3FxeZkdmoXPDE/JvFugzIfr9eLWss8fbpg80Pa5C9M
         RjzYkFjIIrDDK29qJp4MWMgLw9aTr6+ntO7Obh6rlurGYYGNl0ZbpA96t2mn/Yqdts1+
         LTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272309; x=1789877109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=o1cy2jWSE1pFO0+hfeOA1wq1KP7ZwzbI9qIAF3CPLWQMXUPmcf2KZKGk6JhtPQrkOY
         AGry662Yxal7NjDLebu2SiYTfvc8MQjhJfDCPyXthPm517fXTKtbEZhpXe6idmEyqKqu
         cYPwESGk/JS/FRwIiRRg4ShgfcLC5U70ZRIL5OFFTpselLLls/k8M1Hm0JsPvSUGWawc
         CbLRe5HTf9KvX8fIyYq2MxxWM7/RB6pM7Uf3daisNy3JmSSrv3YQ4RePgr2v5by/M0ny
         3F9Wy6o/8fPWE3eBKjf0ymdWGmfgpS2dQtCDzjMzRMMKf30gkkW2tJNk8mXY06p+R6vj
         4gqw==
X-Forwarded-Encrypted: i=1; AKwUvByj7zyowE9nDXHl6+a4brR70r6cjfXYI6ng1KX5JzU8+YhuOF+7bauRH19vqvl/PoJTwMQZ51YzkudXFEr0PAVy@lists.infradead.org
X-Gm-Message-State: AFuF++n7F/2mDCfIW+g1EPMEiUqLL4zsA14DgubaGYeD+rtseOvD0XrZ
	LkkX6+XK2cHZ/99lel8grTDoZu9rnNDifPuwjDSGHR65mqKRo8TlTqDbJnou9Q==
X-Gm-Gg: AYBFou10lClIEQwRl3uLdhHz9yW+SXhGcMc7/Z991j2doT/I5HqTwU927VZM4/V3Pzm
	3lqcl4N+z4hMiYPJ1pnQLFtM6+eOhZgV13SSSL2wF+wuWI6xCkOzX4+KiDGOjK35Q7dip93bUeW
	UkXwT0Oeofqyrf0V+IeT39uGLRCsooO5fPTH1G8uzYFdDa9MP39WMHM4jtvNFFEnD/khbrZ3r2o
	0NVIXy58TjPZxbhvPUDe46RVG+VdccIJO6Y7G9BnIGpY/ImqrVntPtpmYrCiKn4aBZejukievZ1
	UH7g2aNzOTTUzBRnGx4yuW0oiTqihPl+fLTIdEG8pOnpZjc99AI0hd9TUex05BwxoVB7PWOMVZ3
	ZcEGtMs1AxFt4UkSBmelm14HD1GDQKTszEt+wF3yjaa0+JhzH/nVTbyPfzOHvHpI+SqvYPFBl3o
	DnmGJCgdITuU1jxA2l+QNsgRqgP6ko0FGAKKYcSmE/XkyliMQu3csYN0PDny2zU6Akz2MFZt/T2
	DI2K+ah0N4/vKCLJmi97BKr0TAcBLLQh70VEKT75sLCoqy1//CFAVx8JFg1zgyENCtKYuE+5aHg
	5UEKlNONvEJTtfdbF+3Hm7cA3qvqpQ0k2ecSzQPJ7L60DUtzuNvjbEeTUmM4GHFmcp/YU4uj6LF
	f2k4E9S2ZgFusXnvez5i970T1D1vcWA==
X-Received: by 2002:a4a:e90a:0:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c24f2660eemr2474010eaf.67.1789272308682;
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:52 -0600
Subject: [PATCH v4 01/17] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-1-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210510_028846_A6009948 
X-CRM114-Status: GOOD (  22.36  )
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


