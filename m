Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA455606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MbpZPsrP;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OjD/kQep
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5hrZabNFOEE2fTsOJmX7Zpyv2dPEjjVvxwfajCPa+GU=; b=MbpZPsrPj5gMbA
	u7E68dcBKLxWiZhUHOaoeK/Sb/sLuZLk4WdwWYlQO+XFZN+Pm2P9Ma9S/1s7enHvttQfU36lQFhJ9
	Hd49OgBCVnbyErpXK/jqE6nDSzM8T7w7EmjjaHG3XSdkEjPIfF2vt+uFLTWwXOEdxVZLPqU1JC7xo
	bJ3OWrxB95MVmuVUmkhEHamK37Gk+8durzUsc8vOMMKQH+FZcgi2XJGXpl0/QKigtaxnPAlOE7wa6
	eSSDaFwWxv6Wf7BfUk2Dz/aQXwxCwnSFftmgy9P8xgRypsLZr/3/KuZ4nQTCohnDkzFkl/YmZvyKd
	2aymC0s2g8jtmInHR48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99S-00000001N5A-37vW;
	Tue, 03 Nov 2026 07:41:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98v-00000001MJp-0q7d;
	Tue, 03 Nov 2026 07:41:35 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68F6F2022;
	Tue,  3 Nov 2026 08:38:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691533;
	bh=1m0EI6jXYg3GPIBBBk0hCAb7W25j6BmYYaX2ojD4BAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OjD/kQepfKpl47L2j1vDuI5IdJhDJ0/Lmb5u9TmnRLoMZYmc0mw5hRDvaVJEXPMEg
	 VP4DEHjJuNTFv+zecJKo9vlZRomQwcJ7JuLvimg8qij7meU10mSf8MuXalIZ7V+g8w
	 WRNNO3a23qTgsNoyD5vX/fvi9jB/caKJOk7GH5B0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:41 +0000
Subject: [PATCH 05/16] media: rkisp1: Store the current params buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-5-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8386;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=1m0EI6jXYg3GPIBBBk0hCAb7W25j6BmYYaX2ojD4BAc=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAPAY6xzACdc+xrrve+tvecz32ph6uRTA3U+
 9+8FiEBaYaJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDwAKCRDISVd6bEV1
 Mv60D/9wnJ8lKUC69v7OoDiqToWhLcK1NoV/Fuc5TCK/gdEnbeGhUF8IxPcNgYxMj/etWs5BOve
 +KbvcoWHyN3U70GD4WiRnVwvp0bxn4wIORVRga/70/05kG8zdc2JUb1nfOA4yEGdhXdHAdFQKbr
 narsN0LomrvrttLC2/Re3IB243HM9Me3gBlgg5VkpGFW4LTfrbRLCa7naFDnUNFnc+7Uq/UTmFg
 TukkR0Xiqjn3WU21WNDTQhbHHpjqPk3GVbXBOiS6p/a1x0NUJDoGAtpvBRWyFmegDZcFg0yR1Z/
 s+Bi9jiVlICOQkybbhSoB3pV2zPUgjPs85jvmeUccYavzLtwFpJz96yM/zYzFZekoSsFxkBbdAH
 qoNKZIAohbczwI6tLDqxo+hTbCU52k474rAvUyGk4OuBW0C7k61lm0rxiVH83LPVqM8ShUJchVz
 pBIDvdOpOmEESec/ifwHiL/L+BtFzs9EmC+BICP4c7ZVpuH0NP3c+mX0Lxx67c1GIJYrI6mcFiW
 27jwEOAkBDZ8t/yC9q1KL2tc6Ac1qcaKsoaz8X+MTWJdAUv79eBIt85/svgYc591qGt837e+hG3
 B/QEexVF3qX6DfUsBxL4JmmrY68ejp+MpseKDjF6DsEy/9Q8ewog81JuiK2nm0oCUVHQWQAOPvN
 +N/pqBVVmPt+hWA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234119_915308_D6E6E305 
X-CRM114-Status: GOOD (  19.32  )
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

If we suspend the ISP during an active stream, we need to be able to
re-apply the last-applied configuration when we re-start the stream
on resume. Store a pointer to the current params buffer within a
re-organised struct rkisp1_params.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h | 10 ++-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 75 +++++++++++-----------
 2 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 5e6a4d5f6fd12baf45a0083eff75de1095162b2d..6a017a2077f6fdef3a3fd0998f182baa19bfc5b6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -405,6 +405,9 @@ struct rkisp1_params_ops {
  * @vnode:		video node
  * @rkisp1:		pointer to the rkisp1 device
  * @ops:		pointer to the variant-specific operations
+ * @buf.lock:		locks the buffer list 'params'
+ * @buf.queue:		queue of rkisp1_params_buffer
+ * @buf.curr:		pointer to the current rkisp1_params_buffer
  * @config_lock:	locks the buffer list 'params'
  * @params:		queue of rkisp1_buffer
  * @metafmt		the currently enabled metadata format
@@ -418,8 +421,11 @@ struct rkisp1_params {
 	struct rkisp1_device *rkisp1;
 	const struct rkisp1_params_ops *ops;
 
-	spinlock_t config_lock; /* locks the buffers list 'params' */
-	struct list_head params;
+	struct {
+		spinlock_t lock; /* locks the buffers list 'params' */
+		struct list_head queue;
+		struct rkisp1_params_buffer *curr;
+	} buf;
 
 	struct v4l2_ctrl_handler ctrls;
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 042b759eba625e00c65d27710e9db3aa7f09ab7f..e5913f8b73726d16362e429960e251b48b62d9aa 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2338,21 +2338,21 @@ static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
-	struct rkisp1_params_buffer *cur_buf;
 
-	spin_lock(&params->config_lock);
+	spin_lock(&params->buf.lock);
 
-	cur_buf = list_first_entry_or_null(&params->params,
-					   struct rkisp1_params_buffer, queue);
-	if (!cur_buf)
+	params->buf.curr = list_first_entry_or_null(&params->buf.queue,
+						    struct rkisp1_params_buffer,
+						    queue);
+	if (!params->buf.curr)
 		goto unlock;
 
 	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
-		rkisp1_isp_isr_other_config(params, cur_buf->cfg);
-		rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
-		rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
+		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
 	} else {
-		rkisp1_ext_params_config(params, cur_buf->cfg,
+		rkisp1_ext_params_config(params, params->buf.curr->cfg,
 					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
 					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
 	}
@@ -2369,11 +2369,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	 * indicate to userspace on which frame these parameters are being
 	 * applied.
 	 */
-	rkisp1_params_complete_buffer(params, cur_buf,
+	rkisp1_params_complete_buffer(params, params->buf.curr,
 				      rkisp1->isp.frame_sequence + 1);
 
 unlock:
-	spin_unlock(&params->config_lock);
+	spin_unlock(&params->buf.lock);
 }
 
 static const struct rkisp1_cif_isp_awb_meas_config rkisp1_awb_params_default_config = {
@@ -2421,7 +2421,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 				 enum v4l2_ycbcr_encoding ycbcr_encoding)
 {
 	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
-	struct rkisp1_params_buffer *cur_buf;
 
 	params->quantization = quantization;
 	params->ycbcr_encoding = ycbcr_encoding;
@@ -2446,20 +2445,21 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 	rkisp1_csm_config(params);
 
-	spin_lock_irq(&params->config_lock);
+	spin_lock_irq(&params->buf.lock);
 
 	/* apply the first buffer if there is one already */
 
-	cur_buf = list_first_entry_or_null(&params->params,
-					   struct rkisp1_params_buffer, queue);
-	if (!cur_buf)
+	params->buf.curr = list_first_entry_or_null(&params->buf.queue,
+						    struct rkisp1_params_buffer,
+						    queue);
+	if (!params->buf.curr)
 		goto unlock;
 
 	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
-		rkisp1_isp_isr_other_config(params, cur_buf->cfg);
-		rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
+		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
 	} else {
-		rkisp1_ext_params_config(params, cur_buf->cfg,
+		rkisp1_ext_params_config(params, params->buf.curr->cfg,
 					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS);
 	}
 
@@ -2468,14 +2468,12 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
 
 unlock:
-	spin_unlock_irq(&params->config_lock);
+	spin_unlock_irq(&params->buf.lock);
 }
 
 void rkisp1_params_post_configure(struct rkisp1_params *params)
 {
-	struct rkisp1_params_buffer *cur_buf;
-
-	spin_lock_irq(&params->config_lock);
+	spin_lock_irq(&params->buf.lock);
 
 	/*
 	 * Apply LSC parameters from the first buffer (if any is already
@@ -2485,25 +2483,26 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 	 * ordering doesn't affect other ISP versions negatively, do so
 	 * unconditionally.
 	 */
-	cur_buf = list_first_entry_or_null(&params->params,
-					   struct rkisp1_params_buffer, queue);
-	if (!cur_buf)
+	params->buf.curr = list_first_entry_or_null(&params->buf.queue,
+						    struct rkisp1_params_buffer,
+						    queue);
+	if (!params->buf.curr)
 		goto unlock;
 
 	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
-		rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
+		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
 	else
-		rkisp1_ext_params_config(params, cur_buf->cfg,
+		rkisp1_ext_params_config(params, params->buf.curr->cfg,
 					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
 
-	rkisp1_params_complete_buffer(params, cur_buf, 0);
+	rkisp1_params_complete_buffer(params, params->buf.curr, 0);
 
 unlock:
-	spin_unlock_irq(&params->config_lock);
+	spin_unlock_irq(&params->buf.lock);
 }
 
 /*
@@ -2711,9 +2710,9 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
 
-	spin_lock_irq(&params->config_lock);
-	list_add_tail(&params_buf->queue, &params->params);
-	spin_unlock_irq(&params->config_lock);
+	spin_lock_irq(&params->buf.lock);
+	list_add_tail(&params_buf->queue, &params->buf.queue);
+	spin_unlock_irq(&params->buf.lock);
 }
 
 static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
@@ -2782,9 +2781,9 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 	 * and then we can iterate it and call vb2_buffer_done
 	 * without holding the lock
 	 */
-	spin_lock_irq(&params->config_lock);
-	list_splice_init(&params->params, &tmp_list);
-	spin_unlock_irq(&params->config_lock);
+	spin_lock_irq(&params->buf.lock);
+	list_splice_init(&params->buf.queue, &tmp_list);
+	spin_unlock_irq(&params->buf.lock);
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
@@ -2875,8 +2874,8 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 
 	params->rkisp1 = rkisp1;
 	mutex_init(&node->vlock);
-	INIT_LIST_HEAD(&params->params);
-	spin_lock_init(&params->config_lock);
+	INIT_LIST_HEAD(&params->buf.queue);
+	spin_lock_init(&params->buf.lock);
 
 	strscpy(vdev->name, RKISP1_PARAMS_DEV_NAME, sizeof(vdev->name));
 

-- 
2.43.0


