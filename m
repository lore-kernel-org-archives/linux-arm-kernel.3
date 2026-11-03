Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i8DcyZxg;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fLsxZiZM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jb9k7NJwiGOsLAwtgqFgWnrDEmjdfphexebrynwYSD0=; b=i8DcyZxgdAyfAU
	tmkHiYCUKz3QDjT71tPmpHVK/dSSIrexUrqdP2qFwi1/Og0rnMrkyNNel3yYKrarCfSEuOAQsgend
	9Hh1dxH/MLtIcisjkhu4K2DASsM42B6fsGfMDIG8WBSbUSW2u8BmSadXTD/zNNBd/W4e9w03+HVL0
	QSLbMQNGrKhrmFf1ktGs/p3RLyy0QOh9FNJczEbDydhigFM+zhMsRKC7ZsyIkSW15fAJSfpM2+/pw
	6K1NZIrKpxwsWqv3T9EsRfUKLicDVM4d7nAuVrZyY7HPy9fLBC2udpMe5uIsbcwU/EJkHuLVHkHb7
	bxHSAeBQ3RQKzylxgWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9A9-00000001O4b-3JDs;
	Tue, 03 Nov 2026 07:42:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO993-00000001MVS-1Jzh;
	Tue, 03 Nov 2026 07:41:48 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63FC15211;
	Tue,  3 Nov 2026 08:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691539;
	bh=DouAP44a/xjibckQCvicq+7yx5PPwPBXllkSkwoGU2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fLsxZiZMpxrLkQsmwLZcMdTJa1BISAYiyNJXJgJ2X51UsdJEOEy8+kwk/6j5Aeb3m
	 I4peTF0otNxB0EbeKSJG5cSFlq3xFcknQ/Jk+Hk+US72Y0mJGJtP51gvoGWXloJe9G
	 nA5l9dQtHiS2nrEYcV9H6jTMUcuTrxGJb9uLKDNQ=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:51 +0000
Subject: [PATCH 15/16] media: rkisp1: Expose startup and shutdown functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-15-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6524;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=DouAP44a/xjibckQCvicq+7yx5PPwPBXllkSkwoGU2o=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZARpgUmCDOM+khdRQ/VsWiwUjbzVfmKaYkSG
 2UPUGM6n42JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEQAKCRDISVd6bEV1
 MrFSD/oCYZ2DCfv1gx/oCLCKsyMHwLZ9w4U7O6MCYkI5QKCicPOKfpx6glxCSIa0UsvI2/RRSlG
 f5UNkd2NAZ78ujD3QmAamjmaWZpPj7U89pZ9eJ06fxrkPyb1Pke9gY6xHu8Wgah0Jcn2y6gHWfB
 F6s5/E+SMOu3lZcV/05FQIcHgGLBslok72+r4s3YEJwoPTfoPq/FM6wOAOmyZKfwhi+PcOG3kkO
 X5wdGHUaNP6lEJ7Q9kOEdJi2P1PgsBim/t8saL02AHLVvL2s1/BDdylAEdc3+m+89lX5S+jEHMH
 Yode3QMwxe2/mfz05P62WrUGaDuwDYqkoBXSbHWelKHIhRQfxjwI8bY1MmChFOcZm/F/XpiL7ZG
 qSedP9YmLqpRLrxehRpNVe7OGZDTc+jNaIGLhx7RGMgRcDVfVu/2HYJsQXLiWXbyLv7W9ZvrjgV
 rlPawwMwjIoMKImW6Z55fgofNAhrZi/dnWF/iutQicPNkTEPURotpn/c/J+n3YlTUhFj1azuMfT
 2sIw3m62xGvZ9r6IgKY6bOcBE7QUpCj+VbmAHv+4ynwd5a6vgr+bqDLvcf+tbCHTjUyD6t9n/QC
 84m5ZeLEF4zmWXCPclwpQyX+H8O3m7wjS29p7l4tkDLP7t3z7MVfFuNKgcjs+lP3DvHgcBGZots
 Xy4ee5GaaC9pMTg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234131_805783_1622D89E 
X-CRM114-Status: GOOD (  14.97  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the startup and shutdown functions throughout the module so
that they can be called from different source files to the one that
they are defined in - this is in preparation for the runtime resume
and suspend operations being updated to accommodate hibernation and
suspension with an active stream.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 14 ++++++++++----
 .../media/platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-params.c   |  9 +++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c    | 20 +++++++++++---------
 4 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 3204f5afe3bbf1a5de88d57b50a120e716b1345b..3e199814a50f4042624393ee28bbf3b6485e5844 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -953,8 +953,8 @@ static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
-				      enum vb2_buffer_state state)
+void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
+			       enum vb2_buffer_state state)
 {
 	struct rkisp1_buffer *buf;
 
@@ -1061,7 +1061,7 @@ static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
  * rkisp1_pipeline_stream_enable() and disable the DMA engine.
  * Should be called before video_device_pipeline_stop()
  */
-static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
+void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 	__must_hold(&cap->rkisp1->stream_lock)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
@@ -1077,7 +1077,7 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
  * Enable the DMA Engine and call s_stream(true) through the pipeline.
  * Should be called after video_device_pipeline_start()
  */
-static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
+int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 	__must_hold(&cap->rkisp1->stream_lock)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
@@ -1173,6 +1173,12 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	return ret;
 }
 
+bool rkisp1_vb2_is_streaming(struct rkisp1_capture *cap)
+{
+	return vb2_is_streaming(&cap->vnode.buf_queue) &&
+	       vb2_start_streaming_called(&cap->vnode.buf_queue);
+}
+
 static const struct vb2_ops rkisp1_vb2_ops = {
 	.queue_setup = rkisp1_vb2_queue_setup,
 	.buf_init = rkisp1_vb2_buf_init,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 90942b22df313d83d9722cc550f01758cda9fa27..8f379a783da1fa97a330a7ec547354eb936cfadd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -691,6 +691,15 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
 int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
+/* suspend / resume handling helpers */
+bool rkisp1_vb2_is_streaming(struct rkisp1_capture *cap);
+void rkisp1_stats_vb2_return_all_buffers(struct rkisp1_stats *stats);
+void rkisp1_params_vb2_return_buffers(struct rkisp1_params *params);
+void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
+			       enum vb2_buffer_state state);
+int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap);
+void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 void rkisp1_debug_init(struct rkisp1_device *rkisp1);
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index cc42b5afbf65a9a992323c40cff1a6fe2d8b61e4..1f08b57e616159a389411e13f9217c4f4fcddd57 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2761,9 +2761,8 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
+void rkisp1_params_vb2_return_buffers(struct rkisp1_params *params)
 {
-	struct rkisp1_params *params = vq->drv_priv;
 	struct rkisp1_params_buffer *buf;
 	LIST_HEAD(tmp_list);
 
@@ -2778,7 +2777,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+}
+
+static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkisp1_params *params = vq->drv_priv;
 
+	rkisp1_params_vb2_return_buffers(params);
 	params->enabled_blocks = 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index fba95a1786be0d6782829a5604d41893dda8e826..c476310b401b39c3bf1784fcc6b521421192877f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -128,23 +128,25 @@ static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
+void rkisp1_stats_vb2_return_all_buffers(struct rkisp1_stats *stats)
 {
-	struct rkisp1_stats *stats = vq->drv_priv;
-	struct rkisp1_buffer *buf;
-	unsigned int i;
+	struct rkisp1_buffer *buf, *tmp;
 
 	guard(spinlock_irq)(&stats->lock);
-	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
-		if (list_empty(&stats->stat))
-			break;
-		buf = list_first_entry(&stats->stat,
-				       struct rkisp1_buffer, queue);
+
+	list_for_each_entry_safe(buf, tmp, &stats->stat, queue) {
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
 }
 
+static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkisp1_stats *stats = vq->drv_priv;
+
+	rkisp1_stats_vb2_return_all_buffers(stats);
+}
+
 static const struct vb2_ops rkisp1_stats_vb2_ops = {
 	.queue_setup = rkisp1_stats_vb2_queue_setup,
 	.buf_queue = rkisp1_stats_vb2_buf_queue,

-- 
2.43.0


