Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725B1C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=; b=i/WMqPrmSiqTRhPRNKWhpV8myv
	SGjUMTNeVkgGhjJ+or0j9eNwOG7BHod8ICVMQaOKqVOJNHDoLx9gY6ceT/2HFE2p/eK/FPVnsuri3
	Otw1k77DPoDKYVmRU3WxHSH3geHj9wLCZEWQgjD7uMT/li/JCH3AeKYXmYfiL6xh1f4GqfK9qDz37
	KI6YWaLBtuphpnA/KzYoUwKfkP09mg/6sBCE1SUlJ6nqfu9u8uQkjtcEh+SndFN5miFHCZzusGO/i
	qOhWjGvV0z/T7ZiIpwvPN1JS7tEuPn2IKM8srtNTac47GQagZi10jewyxvCgG7IBwoUkPH3FRhs/3
	SyagAqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3Zj-00000001o93-2Ogi;
	Wed, 26 Aug 2026 02:41:15 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3ZH-00000001o2f-1cuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 02:40:53 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-836ce6cbe1eso3264017b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712046; x=1788316846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=;
        b=OmBfZQy0brp7nnL7gDlZJEG1y0SKixwqN3Ose0vxnyWpVO13LXxzJB5f/F86cwsXjP
         XisfNWHIXVuhZQbIKbRQjn2czySZf1+XAlwN/7ZJyODkvcfVpQM5NI8CbpCsfPbI1o/6
         mIIvG0AscO6061tGE46aai9KT3LP4DX9/X8xSC5SSnUs7NnhQUQSfozIQI633ha4vp9n
         9EbzJj/NMl/UTzrdJI7twFGLd8nedppZyC88GVpWFU2tUtT4YiB97ElTwrtdp9EoksmQ
         eNQlWOtmSS/yDFx8eFKRVtfZ5PQXnRJP/0dZGSdbh0MHH9BNzZDzma8MNCgWCvBywj6v
         VVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712046; x=1788316846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=;
        b=noxpbZYb5jjGJN1SkVdOLOfWQwrzYR8CSKW29wQ7ZI8RRmFd3Bk89MBgGTVAhi/cQs
         2EBAFnejUx2mrnBmynBY0+i6hnKE0NajpYZxP6trvwUrPSRvle8/B1Xf1hnGPJH3/2tb
         n5WHFEPNBZXCHlkPhUxqhUvEstThdWIUn8PPRP9KhNtgHDXvkSvlc2VVWZ2o/3Xtyy7/
         wBmvICXwfBZzsxkXCSoiDkQXhOPUmXWNcDuQJcLotBhqoaDxpo2/jBWfAUcqxortvM99
         wktwRTYErAytQzumDtuMtZ4g7tV0S5tzHjuJkIkUSI3cFF7vcSPrGQpYQTnwpKPiFc8u
         Ha0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqf6lT1IlBCOVTXnb/ZrfvJuHJ2FCaM1qXAySO1EUxQby508HRYafxa8Bhz3LDNIMt7T1Anq8GteQcDaFiiDIfV@lists.infradead.org
X-Gm-Message-State: AFuF++klrhlxzp+xLr9VMTESqFAMLD/erBoVogbYCp2F0A0ImVUsw3w6
	d1rKsSu5tStr+shSkPQSv8RBlD+yKYKhZX1vYkegEJz4zNb9CF0xDxgN
X-Gm-Gg: AR+sD12c724vugQdupI1yhMWUPHj4ZboVpBELX0kLbofFoTKfMOd4ayvgJq1gYpuO2S
	gJvDCJOT6d9XpOBevnfCqxvcwtvlmyr8T0tX9jr75RY+O1ZdEHl2PMRLCU/msvk1moBlflFYW7A
	zi6JQtDIsaTMBJYdlRqsIIEzF8U8Yr+ZaxK5hDP23sOtX0+ezLPzdWwXD4Mfeq9JolThr8HX/ru
	5T6iqDfR1IDRuaToOsMdJPf2Cp/qJBB6NTwLgPk1jCh8wafNKNUucrA458VQtsDdm4hnJrBEoNg
	+sRUDmopdRzxBzkjws7wa8UnUIgyEDi741KoGmWEFFtMvsWLdifKztHj/TtxJTBmMwBJGzV3rXA
	G8sXOOiq8HXKAqkQStwPa7PYuBmOhFgkHH4NKfwYTpAKtPZh+W/xAN4IlbFG5qb4k78AfMeI/Cs
	+y2Ggoph27xEycShlpFt8cyJdT7NveJYsJvImQARp4oC/W3EUR35WpYtd1luSeeQ==
X-Received: by 2002:a05:690c:a583:b0:845:23cf:7c01 with SMTP id 00721157ae682-8573c7dfc2dmr13611677b3.10.1787712045994;
        Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:31 +0000
Subject: [PATCH v5 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_194047_681805_B5131527 
X-CRM114-Status: GOOD (  14.85  )
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

Implement support for the Allwinner A733 DMA controller by defining
A733-specific register offsets, bitfield masks, and the
`sun60i_a733_dma_cfg` configuration structure.

This includes the IRQ stride, offsets, and channel counts specific to the
A733, as well as the 32G mask for high-address fields in the LLI. Add
`sun60i_a733_dma_cfg`, which ties all the refactored functionality
together for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ffb63212bea7..66281e01972d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -54,10 +54,14 @@
  * Interrupts specific registers
  */
 #define DMA_IRQ_STRIDE_A31		0x04
+#define DMA_IRQ_STRIDE_A733		0x40
 #define DMA_IRQ_EN_OFFSET_A31		0x00
+#define DMA_IRQ_EN_OFFSET_A733		0x134
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
+#define DMA_IRQ_STAT_OFFSET_A733		0x138
 
 #define DMA_IRQ_CHAN_NR_A31		8
+#define DMA_IRQ_CHAN_NR_A733		1
 
 /*
  * Channels specific registers
@@ -107,6 +111,8 @@
  */
 #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
 #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
+#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
+#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
 
 /*
  * Various hardware related defines
@@ -1318,6 +1324,32 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
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
+	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.src_high_addr_mask = SRC_HIGH_ADDR_32G_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_32G_MASK,
+	.has_mbus_clk = true,
+	.irq_stride      = DMA_IRQ_STRIDE_A733,
+	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A733,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A733,
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,
+};
+
 /*
  * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
  * and a total of 24 usable source and destination endpoints.
@@ -1352,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.55.0


