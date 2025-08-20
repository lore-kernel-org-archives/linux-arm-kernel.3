Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E421BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kHX3BHOVyKDr1vkSjiBcFwyG72/E1SLSWwTaTy9ZuNQ=; b=PEO9dwqlROtG9zgoyYdS43bMgl
	NH/wOQCJSjUDqiS4664/gB+CGUEtt1WevSHtggKqiWgWhTiZXAb2GNN6lVDujf9hUHK/GBg+8JXyY
	I4SAPwb0+oOgdGa26nm/pzjyZULFLjh3hh/VXvM0PdMpuThXdXzyijNZwhRDGC+gtP9vhQEi8Kim7
	fWEU3jA7R8KHSO6aRJgbpVcwHxSOi+/t5+iTDkSAiDys/jca9gpl99mXFW7KOOj17eZT2TxyTqC8m
	mETAiF9Ld0U4P/GrpdieBwlP9uEdVFdExOW0pvi6coLyS6aAaKyTlQQhzIqZ0uZH/2ibQ732JErl+
	qRg6ZV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopmE-0000000EuOF-0wut;
	Wed, 20 Aug 2025 20:51:22 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoliH-0000000EP9X-2QPP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:31:02 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c6X4z71W5z9vMg;
	Wed, 20 Aug 2025 18:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kHX3BHOVyKDr1vkSjiBcFwyG72/E1SLSWwTaTy9ZuNQ=;
	b=VhqdhUpNPmGW+KEPWH6K5tDuGBxQhOK+BGOvOoemCrvixzTc2IRS57TWliX55pIxjryPUA
	DRu730wmT/NgWQ+9cKc4WOB+AZAeu4xPo3oxS5zy87i2aLWrfhOsXX8EjfaVM+3UPBo+dW
	xOi6+ULU0nrt560SEfgZnSi0zU3WujWWngNYUIn3fv5e3IQh/7ajFsDkxX0n7IKdgQZ7oM
	AhgGGLc+JYU5aryhs0PnUpAgFjwmBSSGKx7LiuWE+wFoaT2ebswnqdsPBpnDXGxvdUQKmc
	0dAkLnm5Sw9tlAVHRHMDB1uaGvCJeI3HCnkp+8t2y/2r0z8oVm7A72Fq/K1SAg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JYM4aPen;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kHX3BHOVyKDr1vkSjiBcFwyG72/E1SLSWwTaTy9ZuNQ=;
	b=JYM4aPenlEoMXC6t6hOptefkWXAlhy0cTi+IJjzx2EvtnWkADM6mROMswJmluONAQUYC0O
	J+rEAqilgqXrl4BIsGSR7a3jQ/ubR4kCxAb/riipYolwzzUCBmc8WqiuZ7v1VNFivDHBcX
	JdLpcnMnqGwSRWZm2FgLT/135Qhyr/8zShtJR+NGDr2EnKm4s/1ObXNKM/6sNlAoHIJ8qh
	hB0m/nargpm2Br38aW4xGzCv6IASzd3g2Nt1xunc4sYkgliEtZ465HeIZvucscjmVr4cR5
	XlxLwbZUjaw4IsbJe21FZGOFNUo24BWVpmR14AJ/QfeuiNwtcZaeGN4nofnAZA==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-jpeg: Add support for descriptor allocation from SRAM
Date: Wed, 20 Aug 2025 18:29:53 +0200
Message-ID: <20250820163046.209917-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 533af5eeeb0adf48f1b
X-MBO-RS-META: it9z8mmorgymzt8d999x7urox1a7z8ws
X-Rspamd-Queue-Id: 4c6X4z71W5z9vMg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_093101_758458_CDF8F9F5 
X-CRM114-Status: GOOD (  18.18  )
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

Add support for optional allocation of bitstream descriptors from SRAM
instead of DRAM. In case the encoder/decoder DT node contains 'sram'
property which points to 'mmio-sram', the driver will attempt to use
the SRAM instead of DRAM for descriptor allocation, which might improve
performance.

This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
being triggered during JPEG encoding. The following pipeline triggers the
problem when descriptors get allocated from DRAM, the pipeline often hangs
after a few seconds and the encoder driver indicates "timeout, cancel it" :

gst-launch-1.0 videotestsrc ! video/x-raw,width=256,height=256,format=YUY2 ! \
               queue ! v4l2jpegenc ! queue ! fakesink

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 69 +++++++++++--------
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
 2 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index aef1d6473eb8d..0095c2182ed39 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -44,6 +44,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/genalloc.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -783,32 +784,40 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free(struct mxc_jpeg_dev *jpeg, size_t size, void *addr, dma_addr_t handle)
+{
+	if (jpeg->sram_pool)
+		gen_pool_free(jpeg->sram_pool, (unsigned long)addr, size);
+	else
+		dma_free_coherent(jpeg->dev, size, addr, handle);
+}
+
 static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	/* free descriptor for decoding/encoding phase */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.desc,
-			  jpeg->slot_data.desc_handle);
+	mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
+		      jpeg->slot_data.desc,
+		      jpeg->slot_data.desc_handle);
 	jpeg->slot_data.desc = NULL;
 	jpeg->slot_data.desc_handle = 0;
 
 	/* free descriptor for encoder configuration phase / decoder DHT */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.cfg_desc,
-			  jpeg->slot_data.cfg_desc_handle);
+	mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
+		      jpeg->slot_data.cfg_desc,
+		      jpeg->slot_data.cfg_desc_handle);
 	jpeg->slot_data.cfg_desc_handle = 0;
 	jpeg->slot_data.cfg_desc = NULL;
 
 	/* free configuration stream */
-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
-			  jpeg->slot_data.cfg_stream_vaddr,
-			  jpeg->slot_data.cfg_stream_handle);
+	mxc_jpeg_free(jpeg, MXC_JPEG_MAX_CFG_STREAM,
+		      jpeg->slot_data.cfg_stream_vaddr,
+		      jpeg->slot_data.cfg_stream_handle);
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
-	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
-			  jpeg->slot_data.cfg_dec_vaddr,
-			  jpeg->slot_data.cfg_dec_daddr);
+	mxc_jpeg_free(jpeg, jpeg->slot_data.cfg_dec_size,
+		      jpeg->slot_data.cfg_dec_vaddr,
+		      jpeg->slot_data.cfg_dec_daddr);
 	jpeg->slot_data.cfg_dec_size = 0;
 	jpeg->slot_data.cfg_dec_vaddr = NULL;
 	jpeg->slot_data.cfg_dec_daddr = 0;
@@ -816,6 +825,14 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.used = false;
 }
 
+static struct mxc_jpeg_desc *mxc_jpeg_alloc(struct mxc_jpeg_dev *jpeg, size_t size, dma_addr_t *handle)
+{
+	if (jpeg->sram_pool)
+		return gen_pool_dma_zalloc(jpeg->sram_pool, size, handle);
+	else
+		return dma_alloc_coherent(jpeg->dev, size, handle, GFP_ATOMIC);
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -826,37 +843,29 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto skip_alloc; /* already allocated, reuse it */
 
 	/* allocate descriptor for decoding/encoding phase */
-	desc = dma_alloc_coherent(jpeg->dev,
-				  sizeof(struct mxc_jpeg_desc),
-				  &jpeg->slot_data.desc_handle,
-				  GFP_ATOMIC);
+	desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
+			      &jpeg->slot_data.desc_handle);
 	if (!desc)
 		goto err;
 	jpeg->slot_data.desc = desc;
 
 	/* allocate descriptor for configuration phase (encoder only) */
-	cfg_desc = dma_alloc_coherent(jpeg->dev,
-				      sizeof(struct mxc_jpeg_desc),
-				      &jpeg->slot_data.cfg_desc_handle,
-				      GFP_ATOMIC);
+	cfg_desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
+				  &jpeg->slot_data.cfg_desc_handle);
 	if (!cfg_desc)
 		goto err;
 	jpeg->slot_data.cfg_desc = cfg_desc;
 
 	/* allocate configuration stream */
-	cfg_stm = dma_alloc_coherent(jpeg->dev,
-				     MXC_JPEG_MAX_CFG_STREAM,
-				     &jpeg->slot_data.cfg_stream_handle,
-				     GFP_ATOMIC);
+	cfg_stm = mxc_jpeg_alloc(jpeg, MXC_JPEG_MAX_CFG_STREAM,
+				 &jpeg->slot_data.cfg_stream_handle);
 	if (!cfg_stm)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
 	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
-	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
-							   jpeg->slot_data.cfg_dec_size,
-							   &jpeg->slot_data.cfg_dec_daddr,
-							   GFP_ATOMIC);
+	jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
+						       &jpeg->slot_data.cfg_dec_daddr);
 	if (!jpeg->slot_data.cfg_dec_vaddr)
 		goto err;
 
@@ -2902,6 +2911,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dev = dev;
 	jpeg->mode = mode;
 
+	/* SRAM pool is optional */
+	jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	dev_info(dev, "Using DMA descriptor pool in %cRAM\n", jpeg->sram_pool ? 'S' : 'D');
+
 	/* Get clocks */
 	ret = devm_clk_bulk_get_all(&pdev->dev, &jpeg->clks);
 	if (ret < 0) {
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 7f0910fc9b47e..311f2f2ac519f 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -142,6 +142,7 @@ struct mxc_jpeg_dev {
 	int				num_domains;
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
+	struct gen_pool			*sram_pool;
 };
 
 /**
-- 
2.50.1


