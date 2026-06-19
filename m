Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F327CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN7WKbhfeumQPMyegObyH/92wLelx5H5tDsCdrLnzyo=; b=4wJyg31epTrtK0uiTwRrj6YrYJ
	6SBN+KcRN29ZfHVYVCe6iYqR6nnugnlKofZx6C5GQc/Q2wrz+yOKls/MbO7fsju5sJ6U+ITvYJIrp
	HDIp/oe3KY34F3MxogcTvO9Y9AfiKZ4S5ZxNRPDhBJsAoOgfjF32R3sS7sxAT0mMltbxxOgHDNf8l
	RbgNRPtlj+gNHt8IAtYP2OhWwi5QDd6rQmdkeCH+LikZX+GIyHPehSBXxGs3Llfu8Onby5lnMlP/S
	Yrhi5rsePU5Ii6Fy/e3Lrq5jcq8Ulf2l7MpOIKhfKx31k1s7PbCDKMiRWuoZ+bSWcQlAAIPRmrzHR
	2agMRMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFe-00000001zAa-0GHa;
	Fri, 19 Jun 2026 04:54:46 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFT-00000001z49-1B4q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:54:36 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so19106806d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 21:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844874; x=1782449674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN7WKbhfeumQPMyegObyH/92wLelx5H5tDsCdrLnzyo=;
        b=Q0zAWMNTz04Y9fdB8TjIalD4xu1uwAAPCYqzbc/VbAQgbs5+gtALFV6DB22ALLzcZy
         JZsOkx3zRfzzo6XikBBi81wkLECFYL6907m0ysYOF47z/oMk2uatMyPvXE1olksLZmPS
         +geUEwr7OuiNRFOjt+UYt+KO98ELNqW2+iJfXBN3NHYNBbKSPrRpm2e3o9Yr1ORkrgyW
         BXb5hLSK53y1G1krGwaaWv1W1KgrPRsY+YXeu4hPTWkdcGyTpS0m9RX1XWZGEBVvzSDn
         +fo9f6woId+NtWOXEhXQrCMUv7AqPDZIjJLn8PCAt9+WhIkIPo32CX7eZfd2aVFhkhkJ
         3YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844874; x=1782449674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EN7WKbhfeumQPMyegObyH/92wLelx5H5tDsCdrLnzyo=;
        b=G7BuITMOBl8wozlOOkGwVYan7n68+jwXVF2oZNPhlmAMEDz3uyQVrz3gEGzcBuz6L6
         vn3CDwZuwXhxZFf9Y1lqZ8PkrJxL0XORpJKTwu0yMkkETOtRrBWbrDcdFDrBiC91vW4F
         4Zj/mw6c5u5iLcSGLxtKSxILrFlsmOoRRTJuw647nurOek3nscEupm1UTLi1oUQmJOrC
         MVUIurp5vquhCB5d+fq0g/EBUXFo4pzUz6E17VYF0nhp6nP7SGciOEDvWzfwbuSLq/vk
         EtAd4WwAJN/36U62c+1fGPpSAsv4PoglcMsdJp1r2OlmknxClcfyYgRSjYn21x41rC/+
         4SIw==
X-Forwarded-Encrypted: i=1; AFNElJ+9niZf4fQqpQtziigzh0BJBGe49LwVu799XXrr5T0EwS+BRCqCuIfVJaovoo4m94Kg54gudt4oqvOL3Irak84R@lists.infradead.org
X-Gm-Message-State: AOJu0YwXes91dag+0nFctat5bOdnJkXhNqPs0m0+KE46bQd0TOIKs+WI
	7czm/iWJCEA2U0Xrzk2sWVMI0Iwo+Z8E4JVorP13AA7zR5G1kvYh0Z6e
X-Gm-Gg: AfdE7cl+iuXEfsSofIaLhM+0H4cKYlMcxoxyRr7oOEy69a9GJcVC/B3qqYynDhkrrSR
	AKx2dXU3ZwAFFp2b8OIjxID9U419YKNeXFgW+W5GWcTvI1b/gpYMfDbtcWijrfgL+saXWVy+2Ll
	V7OIOh2tr4yOvpce9VEwvES4W4BXk4RcE+gycTfstbAeU22L212H0A0NpojEJtMtgOIvKFE3lSh
	C5NvKZp2/sDgmW4vyIU1dQt/Fz72UeRbUY/imuuBswJGRzp2yEeEjyEwUgE9M3nat+S1Y8gndG5
	5/tpyCFQikbcr2Zk271dcmoES0aIsJwDPEiQ08lD3sFr4p5qLS1mCUAvUAtN3WBhs5780vRuf7T
	1jLGO/JKHj14ooalyDtmjl/aOk/BWOk0rxDZqzpHPTeyLTwvEWDxKiqyNlsrLl67EvxG9LMYMxV
	DIzOAGVASjCX4BqQ==
X-Received: by 2002:a05:620a:c45:b0:915:9f28:6748 with SMTP id af79cd13be357-9208ff01e88mr299770985a.23.1781844873790;
        Thu, 18 Jun 2026 21:54:33 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:33 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:33 +0000
Subject: [PATCH 4/5] dmaengine: sun6i-dma: Implement support for Allwinner
 A733 DMA controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-4-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_215435_356270_727A0EBE 
X-CRM114-Status: GOOD (  19.06  )
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

This patch implements the actual support for the Allwinner A733 DMA
controller. It defines the new register offsets and bitfield mappings
required for the A733, which slightly differs from the older `sun6i`
series.

Changes:
- New register macros for A733 interrupt enable `DMA_IRQ_EN_A733` and
  status `DMA_IRQ_STAT_A733`.
- New `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` macro to handle the
  32G high-address field in the LLI.
- Implemented `sun6i_dma_set_addr_a733` and A733-specific interrupt
  register accessors.
- Added `sun60i_a733_dma_config`, which ties all the refactored
  functionality together for this specific hardware.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index fb1c1a28744b..9585b4a9e00d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -52,6 +52,15 @@
 #define SUNXI_H3_SECURE_REG		0x20
 #define SUNXI_H3_DMA_GATE		0x28
 #define SUNXI_H3_DMA_GATE_ENABLE	0x4
+
+/*
+ * sun60i specific registers
+ */
+#define DMA_IRQ_EN_A733(x)		((x) * 0x40 + 0x134)
+#define DMA_IRQ_STAT_A733(x)		((x) * 0x40 + 0x138)
+
+#define DMA_IRQ_CHAN_NR_A733		1
+
 /*
  * Channels specific registers
  */
@@ -100,6 +109,8 @@
  */
 #define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
 #define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_32G(x)	(((x) & 0x7U) << 11)
+#define DST_HIGH_ADDR_32G(x)	(((x) & 0x7U) << 15)
 
 /*
  * Various hardware related defines
@@ -257,6 +268,23 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 		DMA_STAT, readl(sdev->base + DMA_STAT));
 }
 
+static inline void sun6i_dma_dump_com_regs_a733(struct sun6i_dma_dev *sdev)
+{
+	int i;
+
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+		dev_dbg(sdev->slave.dev, "Common register:\n"
+			"chan num %d\n"
+			"\tmask(%04x): 0x%08x\n"
+			"\tpend(%04x): 0x%08x\n"
+			"\tstats(%04x): 0x%08x\n",
+			i,
+			DMA_IRQ_EN_A733(i), readl(sdev->base + DMA_IRQ_EN_A733(i)),
+			DMA_IRQ_STAT_A733(i), readl(sdev->base + DMA_IRQ_STAT_A733(i)),
+			DMA_STAT, readl(sdev->base + DMA_STAT));
+	}
+}
+
 static inline void sun6i_dma_dump_chan_regs(struct sun6i_dma_dev *sdev,
 					    struct sun6i_pchan *pchan)
 {
@@ -360,20 +388,41 @@ static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num)
 	return readl(sdev->base + DMA_IRQ_EN(chan_num));
 }
 
+static u32 sun6i_read_irq_en_a733(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_EN_A733(chan_num));
+}
+
 static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val)
 {
 	writel(irq_val, sdev->base + DMA_IRQ_EN(chan_num));
 }
+
+static void sun6i_write_irq_en_a733(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN_A733(chan_num));
+}
+
 static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num)
 {
 	return readl(sdev->base + DMA_IRQ_STAT(chan_num));
 }
 
+static u32 sun6i_read_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_STAT_A733(chan_num));
+}
+
 static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status)
 {
 	writel(status, sdev->base + DMA_IRQ_STAT(chan_num));
 }
 
+static void sun6i_write_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT_A733(chan_num));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -694,6 +743,17 @@ static inline void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
+static inline void sun6i_dma_set_addr_a733(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+
+	v_lli->para |= SRC_HIGH_ADDR_32G(upper_32_bits(src)) |
+				DST_HIGH_ADDR_32G(upper_32_bits(dst));
+}
+
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 		struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 		size_t len, unsigned long flags)
@@ -1352,6 +1412,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.has_mbus_clk = true,
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
+	.set_burst_length = sun6i_set_burst_length_h3,
+	.set_drq          = sun6i_set_drq_h6,
+	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a733,
+	.dump_com_regs    = sun6i_dma_dump_com_regs_a733,
+	.read_irq_en      = sun6i_read_irq_en_a733,
+	.write_irq_en     = sun6i_write_irq_en_a733,
+	.read_irq_stat    = sun6i_read_irq_stat_a733,
+	.write_irq_stat   = sun6i_write_irq_stat_a733,
+	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,
+	.has_mbus_clk = true,
+};
+
 /*
  * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
  * and a total of 24 usable source and destination endpoints.
@@ -1392,6 +1479,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.54.0


