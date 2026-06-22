Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0CACDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1foQu9ZR0ZkXVncJfdfO5ydJpyzZO7HD2rH+AoeqgA=; b=DC7DIHhB44rdKvIiCFMw7E4F5C
	GI94b0u2HeoJ0jnA/Appb1Z0sHiqsoMiVSZ4dXxks3Ix/y3t+PJTCrjKxwK4jnGg5EoWzKRmqYXGe
	yFAehCCqnI8fIWDwM847FiJSkMYj6lAusB0dSXw/NoRmCon3ShjgDQjer7Y2g08xp09fCL5g3af5u
	mwJhtggW538t06dkX33BBlEFdog/aq689Bg5l36/bSQ7KB4Zx0PbI2/VgmmqsDcMD3dMKyEUvjrUV
	YlWFXlUL55bb6mO/2Axdwxjn+Ml0U/p8R0RG5QKgmnTfQGxPIGc6Zn1nsocSiZZa92tPpk2ZB2kNI
	MXwNIXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcp-00000004HAp-0y7m;
	Mon, 22 Jun 2026 01:38:59 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcb-00000004H4j-1xY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:38:46 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51a019e9ea9so22618531cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092324; x=1782697124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1foQu9ZR0ZkXVncJfdfO5ydJpyzZO7HD2rH+AoeqgA=;
        b=c1VXC8tAH49cN+K8BnCeugifkybLh7VoJCubH/st6qpcgSvWjsch2Z1KJa27qKKaBp
         eUbyIjf3SbOXr382kMQdy6NBs9TGkctHv+I37mLlGN0wfnu2RXIMi3QK2ySDwrnMo3LD
         AV75/Gm/EgVRop1BZ/FmNt5ilcI8gkN1FMaEmV8LMAcix94guEhI0eXUSiF+OVFEs1TC
         I+ihGAWmmnUcirrbvWaRiOHh9yHLIDsrVAcAW4tbPCnPFTuvupdPOn4rrzlT85VO6a98
         v3gl7zOAyLKH9P9HBQNtxLv48vE+d2guCLmSfIgpLoVXRjmqK6IMfpWAqVZcMMb8qg7e
         QBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092324; x=1782697124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1foQu9ZR0ZkXVncJfdfO5ydJpyzZO7HD2rH+AoeqgA=;
        b=ll7VCdJ3mLB6FspDSeJU4h16ikEUgg8B3vFJds6mphml+lYJvmqMT02W6A+sGgtFQO
         NFN2pyHikEQCXjA9xdAS01OoOwJ6s3Ny23mvQcS4GcicsfLhmwAro+DFiqZnCNify2Gn
         WSvzVDbWQNzen2+dfWrHv8QsHrmiIPwoz+ROY1wsFrjnn2aejhXIJo9gzmQG7i7oOa60
         orxAHfg1l3I3clcwbieCf1RF9FchLqfEcoDscVqSQtjEzgTtH8T73puyfKy/kCPreSMs
         RK/Km143AEPR5D4y2voxRe3hfCOpWXZgiRzGWfku2VFCQUpkxz92YwreDUm/9aM+bbcS
         UlMA==
X-Forwarded-Encrypted: i=1; AFNElJ+t+7b8tqjYjWQrO9xt1G3Y/1h9M9IW9PNi7foUIdopJHf1e0oxBvKb6rWfmDQ5woTqc6YUXEqMnGXQahMpv+sE@lists.infradead.org
X-Gm-Message-State: AOJu0YzU8Ee4q4zg34PoiVhJfquzO2szHBVKsnta5WUBEMyr5XMUuFMa
	/W6+V5uLT0LQmuSrmlL2nJs851nuq7vtLGBfEZC7xQyrJSSmOft3BLb7
X-Gm-Gg: AfdE7clpAsC3q0uU7HTmlvXJNhmm98vz9Nodj+hheCklqVAVAGLqe5ZnSG5Q5cW6gJT
	Hj+8xOxztTKHxlkDwJ6Q+mpAqTys7PNuxrse2JwBgskejpvsDamHrQzgRtWIZcEqEZToi947DV5
	C03dJuDjwJ7HvqJ95nh2zMW0td7SoNEipwu3p7z5pXDPr6srN9BthW/q6ku6LDYDf3OXj6sukD4
	5EHIeM8eO+eUeb51PD53WErN7T0qei6tJdLVNoEB461rKB+X4hiEF3nnfLuRX26+LyO93eqwB5G
	rIqzFkspuTyNmw9K5H/BhtFANsHYrD6QJzSbmjWDqzUSkRpizlIuAu7nGnevbRQi0DOxClX/drM
	uL54ZXZz+xevTe5giltwoBb2HsSN38g/CIMs9qE5kkj/HGkZB/LXsv0bVLayP8mQ7FFLlT2MjYQ
	dU1aS0opzQWPqVgg==
X-Received: by 2002:a05:622a:550a:b0:51a:348:87b9 with SMTP id d75a77b69052e-51a0693a1eamr125530191cf.29.1782092323963;
        Sun, 21 Jun 2026 18:38:43 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:43 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:27 +0000
Subject: [PATCH v3 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-5-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_183845_543064_F378CA67 
X-CRM114-Status: GOOD (  17.03  )
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

Support Allwinner A733 DMA controller. Define new register offsets,
bitfield mappings and dma_config required for the A733, which slightly
differs from the older `sun6i` DMA controllers.

Changes:
- New register macros for A733 interrupt enable `DMA_IRQ_EN_A733`,
  status `DMA_IRQ_STAT_A733`, and channel count `DMA_IRQ_CHAN_NR_A733`.
- New `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` macro to handle the
  32G high-address field in the LLI.
- Implemented `sun6i_dma_set_addr_a733` and A733-specific interrupt
  register accessors.
- Added `sun60i_a733_dma_cfg`, which ties all the refactored
  functionality together for this specific hardware.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 196a0d73b221..4808015934cc 100644
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
@@ -360,21 +388,41 @@ static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
 	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
 }
 
+static u32 sun6i_read_irq_en_a733(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_EN_A733(irq_reg));
+}
+
 static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
 {
 	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
 }
 
+static void sun6i_write_irq_en_a733(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN_A733(irq_reg));
+}
+
 static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
 {
 	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
 }
 
+static u32 sun6i_read_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_STAT_A733(irq_reg));
+}
+
 static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
 {
 	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
 }
 
+static void sun6i_write_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT_A733(irq_reg));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -695,6 +743,17 @@ static void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
+static void sun6i_dma_set_addr_a733(struct sun6i_dma_dev *sdev,
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
 static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
@@ -1339,6 +1398,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
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
@@ -1375,6 +1461,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.54.0


