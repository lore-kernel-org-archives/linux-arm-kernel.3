Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082DE60711E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWgzBEh2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZW5A/9IXSg0XusU+xisBXwWnIzUkmQpU2C4w+l5Rqw=; b=YWgzBEh2dCVaxFc0whTRnDqqar
	OmfQRdnaCjocY6XDlQnZIBZ/OJ7/SIqGrPgvOJ1zc2+Ko1xgY5dPtfnwFLE/gmBYrGfiTXQ2jtBbl
	AibRIPGJySUXukDV5LtRqpfUYpWRpvD9ZL8dwi7LmCkHn2znfUEi8w8qrY82Piuxc58F+Rczh4L/l
	e0QGNaWC7aH4YYbqVe6LDBIe1wQzMA7zMEPHAD5IcgkpvFaltNwWgNLUjeikXhQ6kh7SxpZDuab90
	EsL+DaPmgzAD3StqNDXVOB0zszIjwfNdTQZbWqW4MmADak8k5e+GKWeVgGrgKZnamc2CCtE2fkvUI
	pfI9CkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1V-000000024BB-3Ejs;
	Tue, 03 Nov 2026 10:45:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1Q-0000000245e-3YvL;
	Tue, 03 Nov 2026 10:45:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1K-00000000321-0DsA;
	Tue, 03 Nov 2026 10:45:38 +0000
Date: Tue, 3 Nov 2026 10:45:35 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] media: rockchip: rkcif: count the MIPI capture errors
Message-ID: <bf877ac0f299655334549304b14fe9fb78d281ef.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024545_053788_0942A474 
X-CRM114-Status: GOOD (  22.81  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VICAP MIPI block flags DMA FIFO overflows, a bandwidth shortage and
an RX FIFO overflow in its interrupt status, but the driver never
enables these sources and clears the status bits unread, so a capture
that loses data does so silently.

Enable the error sources while a stream runs on the interface, count
every class in a debugfs directory named after the interface and warn
with the raw status under a rate limit. The RK3588 lays out the error
bits differently and adds a per-ID size error; both layouts follow the
vendor driver.

Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 94 +++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-common.h    | 12 +++
 .../media/platform/rockchip/rkcif/rkcif-dev.c |  5 +
 .../platform/rockchip/rkcif/rkcif-regs.h      |  2 +
 4 files changed, 113 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 53cfd37bf02bd..af0134e6c4c67 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2025 Collabora, Ltd.
  */
 
+#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 
 #include <media/mipi-csi2.h>
@@ -44,6 +45,35 @@
 
 #define RKCIF_MIPI_INT_FRAME0_END(id) BIT(8 + (id) * 2 + 0)
 #define RKCIF_MIPI_INT_FRAME1_END(id) BIT(8 + (id) * 2 + 1)
+#define RKCIF_MIPI_INT_ALL_END GENMASK(15, 8)
+
+#define RK3568_MIPI_INT_DMA_Y_FIFO_OVERFLOW BIT(16)
+#define RK3568_MIPI_INT_DMA_UV_FIFO_OVERFLOW BIT(17)
+#define RK3568_MIPI_INT_CONFIG_FIFO_OVERFLOW BIT(18)
+#define RK3568_MIPI_INT_BANDWIDTH_LACK BIT(19)
+#define RK3568_MIPI_INT_RX_FIFO_OVERFLOW BIT(20)
+
+#define RK3588_MIPI_INT_DMA_Y_FIFO_OVERFLOW BIT(16)
+#define RK3588_MIPI_INT_DMA_UV_FIFO_OVERFLOW BIT(17)
+#define RK3588_MIPI_INT_BANDWIDTH_LACK BIT(18)
+#define RK3588_MIPI_INT_RX_FIFO_OVERFLOW BIT(19)
+#define RK3588_MIPI_INT_SIZE_ERROR GENMASK(27, 24)
+
+static const struct rkcif_mipi_error rk3568_mipi_errors[] = {
+	{ RK3568_MIPI_INT_DMA_Y_FIFO_OVERFLOW, "dma_y_fifo_overflow" },
+	{ RK3568_MIPI_INT_DMA_UV_FIFO_OVERFLOW, "dma_uv_fifo_overflow" },
+	{ RK3568_MIPI_INT_CONFIG_FIFO_OVERFLOW, "config_fifo_overflow" },
+	{ RK3568_MIPI_INT_BANDWIDTH_LACK, "bandwidth_lack" },
+	{ RK3568_MIPI_INT_RX_FIFO_OVERFLOW, "rx_fifo_overflow" },
+};
+
+static const struct rkcif_mipi_error rk3588_mipi_errors[] = {
+	{ RK3588_MIPI_INT_DMA_Y_FIFO_OVERFLOW, "dma_y_fifo_overflow" },
+	{ RK3588_MIPI_INT_DMA_UV_FIFO_OVERFLOW, "dma_uv_fifo_overflow" },
+	{ RK3588_MIPI_INT_BANDWIDTH_LACK, "bandwidth_lack" },
+	{ RK3588_MIPI_INT_RX_FIFO_OVERFLOW, "rx_fifo_overflow" },
+	{ RK3588_MIPI_INT_SIZE_ERROR, "size_error" },
+};
 
 static const struct rkcif_output_fmt mipi_out_fmts[] = {
 	/* YUV formats */
@@ -420,10 +450,14 @@ rkcif_rk3568_mipi_ctrl0(struct rkcif_stream *stream,
 const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 	.mipi_num = 1,
 	.mipi_ctrl0 = rkcif_rk3568_mipi_ctrl0,
+	.errors = rk3568_mipi_errors,
+	.errors_num = ARRAY_SIZE(rk3568_mipi_errors),
 	.regs = {
 		[RKCIF_MIPI_CTRL] = 0x20,
 		[RKCIF_MIPI_INTEN] = 0xa4,
 		[RKCIF_MIPI_INTSTAT] = 0xa8,
+		[RKCIF_MIPI_LINE_CNT_ID0_1] = 0xb4,
+		[RKCIF_MIPI_LINE_CNT_ID2_3] = 0xb8,
 	},
 	.regs_id = {
 		[RKCIF_ID0] = {
@@ -531,10 +565,14 @@ rkcif_rk3588_mipi_ctrl0(struct rkcif_stream *stream,
 const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 	.mipi_num = 6,
 	.mipi_ctrl0 = rkcif_rk3588_mipi_ctrl0,
+	.errors = rk3588_mipi_errors,
+	.errors_num = ARRAY_SIZE(rk3588_mipi_errors),
 	.regs = {
 		[RKCIF_MIPI_CTRL] = 0x20,
 		[RKCIF_MIPI_INTEN] = 0x74,
 		[RKCIF_MIPI_INTSTAT] = 0x78,
+		[RKCIF_MIPI_LINE_CNT_ID0_1] = 0x84,
+		[RKCIF_MIPI_LINE_CNT_ID2_3] = 0x88,
 	},
 	.regs_id = {
 		[RKCIF_ID0] = {
@@ -699,6 +737,53 @@ rkcif_mipi_stream_read(struct rkcif_stream *stream, unsigned int index)
 	return readl(stream->rkcif->base_addr + addr);
 }
 
+static u32 rkcif_mipi_error_mask(struct rkcif_interface *interface)
+{
+	const struct rkcif_mipi_match_data *match_data =
+		interface->rkcif->match_data->mipi;
+	unsigned int i;
+	u32 mask = 0;
+
+	for (i = 0; i < match_data->errors_num; i++)
+		mask |= match_data->errors[i].mask;
+
+	return mask;
+}
+
+static void rkcif_mipi_handle_errors(struct rkcif_interface *interface,
+				     u32 intstat)
+{
+	const struct rkcif_mipi_match_data *match_data =
+		interface->rkcif->match_data->mipi;
+	unsigned int i;
+
+	intstat &= rkcif_mipi_error_mask(interface);
+	if (!intstat)
+		return;
+
+	for (i = 0; i < match_data->errors_num; i++)
+		if (intstat & match_data->errors[i].mask)
+			interface->error_count[i]++;
+
+	dev_warn_ratelimited(interface->rkcif->dev, "%s: capture errors %#x\n",
+			     interface->sd.name, intstat);
+}
+
+static void rkcif_mipi_debugfs_init(struct rkcif_interface *interface)
+{
+	const struct rkcif_mipi_match_data *match_data =
+		interface->rkcif->match_data->mipi;
+	struct dentry *parent = interface->rkcif->debugfs_dir;
+	unsigned int i;
+
+	interface->debugfs_dir = debugfs_create_dir(interface->sd.name, parent);
+
+	for (i = 0; i < match_data->errors_num; i++)
+		debugfs_create_ulong(match_data->errors[i].name, 0444,
+				     interface->debugfs_dir,
+				     &interface->error_count[i]);
+}
+
 static void rkcif_mipi_queue_buffer(struct rkcif_stream *stream,
 				    unsigned int index)
 {
@@ -742,6 +827,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+	int_mask |= rkcif_mipi_error_mask(interface);
 
 	spin_lock_irqsave(&interface->irq_lock, flags);
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
@@ -785,6 +871,8 @@ static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
 	spin_lock_irqsave(&interface->irq_lock, flags);
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
 	int_temp &= ~int_mask;
+	if (!(int_temp & RKCIF_MIPI_INT_ALL_END))
+		int_temp &= ~rkcif_mipi_error_mask(interface);
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
 
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
@@ -836,6 +924,8 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 		if (intstat)
 			ret = IRQ_HANDLED;
 
+		rkcif_mipi_handle_errors(interface, intstat);
+
 		for (unsigned int j = 0; j < interface->streams_num; j++) {
 			struct rkcif_stream *stream = &interface->streams[j];
 
@@ -879,6 +969,8 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
 		if (ret)
 			continue;
 
+		rkcif_mipi_debugfs_init(interface);
+
 		for (unsigned int j = 0; j < RKCIF_ID_MAX; j++) {
 			struct rkcif_stream *stream = &interface->streams[j];
 
@@ -906,6 +998,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
 		for (unsigned int j = 0; j < interface->streams_num; j++)
 			rkcif_stream_unregister(&interface->streams[j]);
 
+		debugfs_remove_recursive(interface->debugfs_dir);
 		rkcif_interface_unregister(interface);
 	}
 	return ret;
@@ -923,6 +1016,7 @@ void rkcif_mipi_unregister(struct rkcif_device *rkcif)
 		for (unsigned int j = 0; j < interface->streams_num; j++)
 			rkcif_stream_unregister(&interface->streams[j]);
 
+		debugfs_remove_recursive(interface->debugfs_dir);
 		rkcif_interface_unregister(interface);
 	}
 }
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 16a5ecb25c2fb..13708435dd432 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -28,6 +28,7 @@
 
 #define RKCIF_DRIVER_NAME "rockchip-cif"
 #define RKCIF_CLK_MAX	  5
+#define RKCIF_MIPI_ERRORS_MAX 5
 
 enum rkcif_format_type {
 	RKCIF_FMT_TYPE_INVALID,
@@ -198,18 +199,28 @@ struct rkcif_interface {
 		struct rkcif_dvp dvp;
 	};
 
+	struct dentry *debugfs_dir;
+	unsigned long error_count[RKCIF_MIPI_ERRORS_MAX];
+
 	/* interrupt enable and status are shared by the streams of a block */
 	spinlock_t irq_lock;
 
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
+struct rkcif_mipi_error {
+	u32 mask;
+	const char *name;
+};
+
 struct rkcif_mipi_match_data {
 	unsigned int mipi_num;
 	unsigned int regs[RKCIF_MIPI_REGISTER_MAX];
 	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
 	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
 			  const struct rkcif_output_fmt *active_out_fmt);
+	const struct rkcif_mipi_error *errors;
+	unsigned int errors_num;
 	struct {
 		unsigned int offset;
 	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
@@ -248,6 +259,7 @@ struct rkcif_device {
 	struct media_device media_dev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_async_notifier notifier;
+	struct dentry *debugfs_dir;
 };
 
 #endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index fbc8ed78d99ea..630a5ccf59c11 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
@@ -231,6 +232,8 @@ static int rkcif_probe(struct platform_device *pdev)
 	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
 	rkcif->notifier.ops = &rkcif_notifier_ops;
 
+	rkcif->debugfs_dir = debugfs_create_dir(dev_name(dev), NULL);
+
 	ret = rkcif_register(rkcif);
 	if (ret) {
 		dev_err(dev, "failed to register media entities: %d\n", ret);
@@ -246,6 +249,7 @@ static int rkcif_probe(struct platform_device *pdev)
 err_rkcif_unregister:
 	rkcif_unregister(rkcif);
 err_notifier_cleanup:
+	debugfs_remove_recursive(rkcif->debugfs_dir);
 	v4l2_async_nf_cleanup(&rkcif->notifier);
 	media_device_unregister(&rkcif->media_dev);
 err_v4l2_dev_unregister:
@@ -262,6 +266,7 @@ static void rkcif_remove(struct platform_device *pdev)
 
 	v4l2_async_nf_unregister(&rkcif->notifier);
 	rkcif_unregister(rkcif);
+	debugfs_remove_recursive(rkcif->debugfs_dir);
 	v4l2_async_nf_cleanup(&rkcif->notifier);
 	media_device_unregister(&rkcif->media_dev);
 	v4l2_device_unregister(&rkcif->v4l2_dev);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 3cf7ee19de300..92da7497b902a 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -132,6 +132,8 @@ enum rkcif_mipi_register_index {
 	RKCIF_MIPI_CTRL,
 	RKCIF_MIPI_INTEN,
 	RKCIF_MIPI_INTSTAT,
+	RKCIF_MIPI_LINE_CNT_ID0_1,
+	RKCIF_MIPI_LINE_CNT_ID2_3,
 	RKCIF_MIPI_REGISTER_MAX
 };
 
-- 
2.56.0

