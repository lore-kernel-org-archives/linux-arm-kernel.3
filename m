Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA57DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiQAmyj2ZUuUzxjBP8hkUwvdrU9xi0TypULYAy8ZoA4=; b=JayBcXpH3AFEbJn2PHeIvZrwBf
	qMIlx4/yc18+x547+KJ3vBkRzCGWkpiw8rZxof5lOsneQwVFm8/JstQXSfEZCRwAKmkRYIRqG5fEd
	6FU3fTrqN0cIp7N2GhBUyqZ/iTux7y0DutUD5953B1PCvc9mzxOEUwjdjfLiX2LEC+ZkFbRG1qF0O
	tOG25k0ahtc65NS4w0bVNHbN+x2WijsYuz/x3uYnR3DKXujgbDrwoo/AdIl4SHLsPfB7j8+Vjfdqv
	C2yUjuIo1Dv/GTOrx9ixqL+uzOdk5BEVmcoT2AI8DlnlCAWlBNDldU//iYlAeeVR5fSWEOnLs4Cc6
	GzkXI5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ePf-0000000AU6m-2bUK;
	Sat, 11 Oct 2025 18:33:51 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ePc-0000000AU5Z-2d9H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 18:33:50 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckXLb6RqTz9t8P;
	Sat, 11 Oct 2025 20:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiQAmyj2ZUuUzxjBP8hkUwvdrU9xi0TypULYAy8ZoA4=;
	b=OVW0JGB/ZKSWGeLNvZUq2g9XQ0NsxWk5neL05g+do93+YGshCrYZmTx8K+3obBSbGV3qd/
	iY8l4lyoRA5bbefmtvuNeyMrRi/HZ2h0cYSanQmELI46W6A7YNyJRycYa0+kP+jMlN1e13
	vhUFs+Q3TPCaEnbxM3H5r6zSVBMYkXMGYI/nkBHiEl/VFeEb3Krivicff5cwfrVo5KzH78
	u733KomW+3NE8Ig2XFQh4osSi5nm20m20vQy6AEZS5I9fh3drtaZQ9Z3Ht1RJ/4/hfaWhY
	S2lVccxxNe5wG//sZprKU5VoZXZK+xsRU53dCBGTQL7pMehWp5h5Sd1ZBOLxGQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiQAmyj2ZUuUzxjBP8hkUwvdrU9xi0TypULYAy8ZoA4=;
	b=hQonwEDbLw77FsuK9s379NR4Dm8FXVI8zP952488O8PaA2QsLE273syPxsqFQfag//Pw4b
	sScAp4Sfr0VzKWOCY0ihOXDZvE7EcnwOyAy1UehLJWqwtfuSu8PxdTXOFx57rJLirkCZGW
	keEzS3kIfYcy4Rj0ri01TMXuk5EwTuk7yjAPVK/TiEvnPivCTnoW4f2DGrKPMfV3D/7Tmg
	jwamJtgkrKPQwMrKsW8KkrmDOHe/7AevrwzxXXWafqV3v73esuUs7o6ZrLaCxSwHHSzvlm
	pNm3z2nmr3SZRa8DnLaUAZvUaIzZZvyLIVMjSl6GpRFP7fyM/BKDiKeuCNSvOg==
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
Subject: [PATCH v2 2/2] media: imx-jpeg: Add support for descriptor allocation from SRAM
Date: Sat, 11 Oct 2025 20:32:26 +0200
Message-ID: <20251011183306.163564-2-marek.vasut@mailbox.org>
In-Reply-To: <20251011183306.163564-1-marek.vasut@mailbox.org>
References: <20251011183306.163564-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5651df3771ec20da4f6
X-MBO-RS-META: xomt5nkpeeqy9zscf3nk1tra1y5eoc5g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_113348_816858_99B1B8E5 
X-CRM114-Status: GOOD (  19.21  )
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

This also helps on i.MX95 rev.A with sporadic SLOTn_STATUS IMG_RD_ERR
bit 11 being triggered during JPEG encoding, which is caused by a bug
fixed on later SoC revisions. The bug occurs less often when using the
SRAM for descriptor storage, but is not entirely mitigated. The following
pipeline triggers the bug when descriptors get allocated from DRAM, the
pipeline often hangs after a few seconds and the encoder driver indicates
"timeout, cancel it":

gst-launch-1.0 videotestsrc ! \
               video/x-raw,width=256,height=256,format=YUY2 ! \
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
V2: - Wrap lines to 100
    - Update commit message
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 70 +++++++++++--------
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
 2 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767baf..a1e9878ec517f 100644
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
@@ -816,6 +825,15 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.used = false;
 }
 
+static struct mxc_jpeg_desc *mxc_jpeg_alloc(struct mxc_jpeg_dev *jpeg, size_t size,
+					    dma_addr_t *handle)
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
@@ -826,37 +844,29 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
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
 
@@ -2888,6 +2898,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
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
index 44e46face6d1d..9c5b4f053deda 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -141,6 +141,7 @@ struct mxc_jpeg_dev {
 	int				num_domains;
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
+	struct gen_pool			*sram_pool;
 };
 
 /**
-- 
2.51.0


