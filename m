Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9182FC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=; b=kRNypdRs32mgm+cRU6WjcmREKY
	vl/2VC1VdoZuwNwSl3EqUEprKQkqGP09moFW1O1oRaQtS2fwKjW+IpG/NSx4dqnEu6399s07MxEeM
	8o0m8gRnF5m0sQMBEA44hyu77u1NWrhBWHf35zu2VmrzQ7ekBrshnJK9uTIF9pBSyL3Oj9nBjdRkg
	VS/NGRRgEn0IhR2xvKo7caXn8NSp4bLiEQyvILVovKDcoC/I1nwkHkWJdOufBYz5MyNUV+0io/jGm
	7eXSuHFevBC3VXbvyJzQrkThINL8hYvPKssUb+jAErYmYrF2nbHZfrdVjs/4+BZHk/KEQsi302koN
	hE2o4H+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TV-00000001l7T-2m01;
	Wed, 26 Aug 2026 01:30:45 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TH-00000001l2K-3SSY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 01:30:32 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-92e6a434cabso18018685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707830; x=1788312630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=;
        b=T9A4cQ2Zf2dkWlhRr+mQO+de8ZZBfW5TF0lIGl7bKUrUjeYET8jBIVdk1LjZNBY5QH
         t49m73D4IAwemsPfV6fWiIQNNKsL4t6sKqe0ogNwwkXn7DcuwnjogTXeKAr85WsTvbGG
         5f5nvkesDokI8RpkyHpTDIO/Eotw8jmrKH0SAOet78F3HRN5NvHYLSGqEUo/AAM8IfwP
         Mb2F9ysQMoP6f6RhYWlIToTBCRtV/5C56MMtkkuTGYwwcvfx0dMOtq+fQkaGuRtaoCTs
         5owrUfy214jwh62XbYi/NwDges1zH7zgqMSdObAAv9cVO/6Olty7b1qVcOXT1a1HDbFO
         zONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707830; x=1788312630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=;
        b=kLwwWFPblQekWyFNOY/yPYCrtJzhtdmwc9ENgiKSfbvSti3yPOv65Oji5gn7vsjPy6
         C1pXzahLnuRNTpKpRFhTE0WpaYsICe1rOT14x2IcmWEpY9njEQinjhIxYITuuE5mm1P1
         mJ5ipexDLGz551ue3F27OeiEtep1am9dJjL/poABa5k5eorju2cZU8NTcAsfU0vVjj8l
         PnDafPchhPGljcI9lKRBnk7Gd+puHRPH44PxeGD0CHXReqzYxGxnJeRBq+tmGQT1/1+l
         r1GDhBE6xGPqUMQUOtjsO4jE4qZkKXDMacW7tKP3t/qRwQjk3+Rk4664RS5dMBoy97FM
         2p8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpYzCS6a0N+e4QIKiqwz4RUpPE7iv6dWGPNvlEN4Xf0a5vhq6211JbqIqMP7Uh/JsJmuoFEA9i2et+fAMRRcv64@lists.infradead.org
X-Gm-Message-State: AFuF++nwkWXc4C/gyLCBxPAcgr18taweGQhDmJRZEnoJxhzjwyHd+rrL
	DcdF58rSCHXWaDogvWMC0FevRIXqVbdCLtholrMt+rsR3x8wiHOA6z9Z
X-Gm-Gg: AR+sD10TMJu09MjTL+dWwOXmn/Y50u4WhzZGx3N9eLbqyoBUtjFgUvJUfKUaQuG87ci
	50lH1EJRoCvOCrZfVGFz9hJDIehDqyIYqUMHHp6yUiNeSfV2NzcjA5HHHFxZ3WKNCa5nn57s7Yl
	z3A2Nf9ZyyxmCdSnf2eFcBzYsJJsxpbc5a+sjtrW88GwM+HRc5fNyi87eZ0Q1k8KyNLo65kdvYe
	+i+JIrpGhDNIIaDDXcSwuR+JfR6ZJ+ERFiEvqcZpXVHizCD6qKaw5DVNoXiKxGYCfwjbPCKdRpG
	VK5mJfjx9lZn64ACGemtSZTQRJwbSaJlk9RuKWORO4UAvCmnx2weZ8v51DoXXHXeffczjXvQiOU
	dCNwM+gIjkdpuiK5xjgTe4NlSbKxe39E4lbxoBtdIOSDde0ROErhd7uYB9iZLG8YdFvTVodx7Zz
	s/fQQTu2L63kPsxtvPurzl2tBtSHH5sQwzsebURI7m83k+0g5vhVpo/eg063248A==
X-Received: by 2002:a05:620a:8306:b0:937:11c9:37f1 with SMTP id af79cd13be357-9378015274emr224520185a.16.1787707830137;
        Tue, 25 Aug 2026 18:30:30 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:07 +0000
Subject: [PATCH v4 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_183031_883616_4DA8FD11 
X-CRM114-Status: GOOD (  14.78  )
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
 drivers/dma/sun6i-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index b96d7d90f6b5..fb371b57d792 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -57,10 +57,14 @@
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
@@ -110,6 +114,8 @@
  */
 #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
 #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
+#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
+#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
 
 /*
  * Various hardware related defines
@@ -1321,6 +1327,29 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
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
@@ -1355,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.55.0


