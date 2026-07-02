Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05410C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=; b=xIz8SU57uxCLP42qxSuqKGvf2m
	UfPjBwenrtHhH0W6+A1lniztRz0kk/OVzwh7wRyGZqpwrKNJXyh/90GVJMMTpi9ScCbzF1kydHQfU
	Lg6AQKU4baFV1wQahLkSR0UiQgDtyqeWqByLvb3HZEYSJjhjKIoe8NSCYrb3gNBtOOXwCMNvqc7a+
	unbfNlneJbxzI9FJeEAf/mYwmVC3J6wWjfZvTC4rZ2iS9PqdiFewVjGJlZJyZzA+NaowXA91cSDaS
	HMutEmQMGEm96u8AFjAue/dDD3wMMEPpKaZcspNqjeYBRTYKb+oID6eU8bvnDceiSVnp8hCKZnsbT
	IJThabWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGQ-00000005ZB7-1pjr;
	Thu, 02 Jul 2026 21:48:06 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGN-00000005Z8A-3jS8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:48:05 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-664b05d408bso2195343d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028883; x=1783633683; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=;
        b=pG2W9Nij84DRvLM13tKhBIGkDG7l0+vbM9HTg0Wd0VYSCKEavOlZzll6py3v5BtwB/
         NjBkTY49FoceQvXBfDYhCCl1hmknGkZ/J1nF4ta8nJS6bLqWxsZm4gwYCLKmVYDsEL9O
         eBo5KPexSGMvMVWDFMOncEQ++9ljAlcXykLOYkQgYMa/kl4gYkGvb1t6QEwF0Olh/fLk
         QHH/CSbCpusltyNTQOEmCq7JMoO/jRIbkFHRb/Jb0kNUYN5aLrRGmdIETzA1dhyKzPYq
         WEre9UL/tX5iortZEOu7mlC1FDcpIjP8GAJic2EOo9RAYYjD/J9F7js0ayPVjivA4gGO
         TA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028883; x=1783633683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=;
        b=M1tMAbSyGSUJvPpbDzju+7WhMSjkKeMQT97wu40eoXqZgUmja1Dh/1CPIRLf5r6X2C
         tJai8/JJH5rR/t1TH44dp6VXtmfwO7hNFXBdBkt8r3jy0EFNop6bHMklx7MBVV6BFb2i
         WQ4GKSY+jJVoaZtjnn3bBEcnzOBCxPY/ue1KGYNxC7EfnDXYvAIWT/dCA/gOlWgoRE5q
         8VBy5tO/9WfmKI36oP2F837uojplap9Qi92ZQBzI0fiIHO9MNa+2S10GrmrHz8jzMEjw
         BTGAW7SfF16JJrDCSVmhYVWmFVn3t23JeNHqBYuPOC5Ahm5e9hMNAWxDF/AkzHL6m4NN
         hk1g==
X-Forwarded-Encrypted: i=1; AHgh+RoEjoBABvyOKDSv8B+D/apxn4g2YxRwWR5k2KMbTiK8X/Fs4FMLJSrOFbp5touIFYk8/GmCT+ddcDdzeA8jWHed@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8E6NLAylFpHXTYzFVujdLot7+BPgL5+VlSbbKKIpchiAA2vCG
	M0yV+KFw/RjZHyJD55K8cN380qswrMLCrIedqcTM01KQP4qge77EGYr8
X-Gm-Gg: AfdE7clsHjQGpu9PL3nFyABZB4Wf5DP//RGwKZctLTcQY4DxfgHWRXvTBZAfXPPGvRB
	76TKkk9NrHJOZXdIVNNeZ8gnbv9yloQcJFj7FVjtkslHPlYByIPjQabWrJmG23oIiFcM90MBMdR
	K3543tzB4MLOX5NRPXWIGkyK8pLfVZ+ZMOHwjr2DItBwAnRIF/wAlI605evtgElFHCPM69dRkx0
	oC1gSFbUr3upUnf7cu7PYw+Sx3Saz7vFYkCmLu0+a0gnKgihI3Wo4iVRL2YyoLB1+/pxjKKskRw
	4jsqKpZ4nEGcg5HKGKQbWzOnM4DDijs6mbIx8eL+vAMw2AES9X82A5Iwbh97V2iSyBtm8x/3HL8
	o3FKMSNTQZBSkvLu5PFZxi37s2skvKNs0r5QOYzPqiIjkfsseUVjlR9WUvTeO4DCMlhQmN/UMiU
	ESZ+ROx4EN4/ZhhtgyHaLLQbkwMS7wB9gLanH1owJ3nUuC2cc=
X-Received: by 2002:a05:690e:4089:b0:664:ae6a:ef2 with SMTP id 956f58d0204a3-66596695a62mr6927006d50.80.1783028882666;
        Thu, 02 Jul 2026 14:48:02 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:02 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 2/4] media: rc: sunxi-cir: add support for the A523
Date: Thu,  2 Jul 2026 17:47:48 -0400
Message-ID: <20260702214750.3428694-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_144803_954164_5469E528 
X-CRM114-Status: GOOD (  25.36  )
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

The A523 (sun55i) has a newer revision of the CIR receiver IP. Two
register fields that do not exist on older SoCs must be programmed
for reception to work:

 - CTL bits [7:6] select which pulse polarities are captured into the
   RX FIFO. The reset value of 0 captures nothing, so program "both
   pulse" mode, which captures regardless of header polarity.

 - SPLCFG (the sample configuration register) bits [1:0] select the
   sample clock as a division of the module clock, replacing the
   fixed module clock / 64 sample rate of the older IP. Select
   module clock / 256, which together with the 24 MHz module clock
   used on the A523 gives a 10.7 μs sample period, close to the 8 μs
   of the previous 8 MHz / 64 configuration, and keeps the default
   125 ms idle timeout representable in the 8-bit idle threshold
   field.

Parameterize the sample divisor in the resolution/timeout
calculations, which older SoCs keep at the fixed 64, and add the
A523 quirks and compatible.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 76 ++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index cb4c56bf0752..82ada9dc0347 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -31,6 +31,11 @@
 /* CIR mode */
 #define REG_CTL_MD			(BIT(4) | BIT(5))
 
+/* Pulse mode selector (bits [7:6]) */
+#define REG_CTL_PMD(m)			((m) << 6)
+/* Capture both pulse polarities */
+#define REG_CTL_PMD_BOTH		REG_CTL_PMD(1)
+
 /* Rx Config */
 #define SUNXI_IR_RXCTL_REG    0x10
 /* Pulse Polarity Invert flag */
@@ -66,6 +71,13 @@
 
 /* IR Sample Config */
 #define SUNXI_IR_CIR_REG      0x34
+/*
+ * Sample clock divider select (bits [1:0]), present on newer IP revisions
+ * (e.g. sun55i). Selects the sample clock as a fraction of the module clock;
+ * must be programmed for the sampler to run. Older SoCs lack the field and
+ * use a fixed module-clock/64 sample rate, so they leave it 0.
+ */
+#define REG_CIR_SDIV(val)    ((val) & GENMASK(1, 0))
 /* CIR_REG register noise threshold */
 #define REG_CIR_NTHR(val)    (((val) << 2) & (GENMASK(7, 2)))
 /* CIR_REG register idle threshold */
@@ -73,6 +85,8 @@
 
 /* Required frequency for IR0 or IR1 clock in CIR mode (default) */
 #define SUNXI_IR_BASE_CLK     8000000
+/* Default sample clock divisor: module clock / 64 (legacy fixed rate) */
+#define SUNXI_IR_SAMPLE_DIV   64
 /* Noise threshold in samples  */
 #define SUNXI_IR_RXNOISE      1
 
@@ -81,10 +95,18 @@
  *
  * @has_reset: SoC needs reset deasserted.
  * @fifo_size: size of the fifo.
+ * @both_pulse: program the CTRL pulse-mode field (newer IP revisions).
+ * @sample_div_sel: value for the SPLCFG sample-clock divider field (0 on
+ *		    legacy SoCs that lack the field).
+ * @sample_divisor: module-clock divisor that yields the sample clock; matches
+ *		    @sample_div_sel on newer IP, or the fixed /64 on legacy SoCs.
  */
 struct sunxi_ir_quirks {
 	bool		has_reset;
 	int		fifo_size;
+	bool		both_pulse;
+	u8		sample_div_sel;
+	u32		sample_divisor;
 };
 
 struct sunxi_ir {
@@ -92,6 +114,9 @@ struct sunxi_ir {
 	void __iomem    *base;
 	int             irq;
 	int		fifo_size;
+	bool		both_pulse;
+	u8		sample_div_sel;
+	u32		sample_divisor;
 	struct clk      *clk;
 	struct clk      *apb_clk;
 	struct reset_control *rst;
@@ -140,17 +165,19 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 }
 
 /* Convert idle threshold to usec */
-static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
+static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int div,
+				       unsigned int ithr)
 {
 	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
-				 base_clk / (128 * 64));
+				 base_clk / (128 * div));
 }
 
 /* Convert usec to idle threshold */
-static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
+static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int div,
+				       unsigned int usec)
 {
 	/* make sure we don't end up with a timeout less than requested */
-	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
+	return DIV_ROUND_UP((base_clk / (128 * div)) * usec,  USEC_PER_SEC) - 1;
 }
 
 static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
@@ -158,15 +185,17 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
 	struct sunxi_ir *ir = rc_dev->priv;
 	unsigned int base_clk = clk_get_rate(ir->clk);
 
-	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
+	unsigned int ithr = sunxi_usec_to_ithr(base_clk, ir->sample_divisor,
+					       timeout);
 
 	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
 
-	/* Set noise threshold and idle threshold */
-	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
+	/* Set sample clock divider, noise threshold and idle threshold */
+	writel(REG_CIR_SDIV(ir->sample_div_sel) |
+	       REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
 	       ir->base + SUNXI_IR_CIR_REG);
 
-	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
+	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ir->sample_divisor, ithr);
 
 	return 0;
 }
@@ -193,8 +222,14 @@ static int sunxi_ir_hw_init(struct device *dev)
 		goto exit_disable_apb_clk;
 	}
 
-	/* Enable CIR Mode */
-	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
+	/*
+	 * Enable CIR Mode. On newer IP revisions the pulse-mode field must
+	 * also be set, otherwise no pulses are captured into the RX FIFO.
+	 */
+	tmp = REG_CTL_MD;
+	if (ir->both_pulse)
+		tmp |= REG_CTL_PMD_BOTH;
+	writel(tmp, ir->base + SUNXI_IR_CTL_REG);
 
 	/* Set noise threshold and idle threshold */
 	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
@@ -271,6 +306,9 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	}
 
 	ir->fifo_size = quirks->fifo_size;
+	ir->both_pulse = quirks->both_pulse;
+	ir->sample_div_sel = quirks->sample_div_sel;
+	ir->sample_divisor = quirks->sample_divisor ?: SUNXI_IR_SAMPLE_DIV;
 
 	/* Clock */
 	ir->apb_clk = devm_clk_get(dev, "apb");
@@ -325,10 +363,10 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->dev.parent = dev;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* Frequency after IR internal divider with sample period in us */
-	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
+	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / ir->sample_divisor));
 	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
-	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
-	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
+	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 0);
+	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 255);
 	ir->rc->s_timeout = sunxi_ir_set_timeout;
 	ir->rc->driver_name = SUNXI_IR_DEV;
 
@@ -395,6 +433,14 @@ static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
 	.fifo_size = 64,
 };
 
+static const struct sunxi_ir_quirks sun55i_a523_ir_quirks = {
+	.has_reset = true,
+	.fifo_size = 64,
+	.both_pulse = true,
+	.sample_div_sel = 2,	/* sample clock = module clock / 256 */
+	.sample_divisor = 256,
+};
+
 static const struct of_device_id sunxi_ir_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-ir",
@@ -408,6 +454,10 @@ static const struct of_device_id sunxi_ir_match[] = {
 		.compatible = "allwinner,sun6i-a31-ir",
 		.data = &sun6i_a31_ir_quirks,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-ir",
+		.data = &sun55i_a523_ir_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.54.0


