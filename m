Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uQieH2k4;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OQACus3l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6BX4ptosb3zXCGw5cuO8Zr/LEUNpLY7gLsDERXLD6Bc=; b=uQieH2k4uASHdw
	elY3NmvhuI6qgaDrxickkuDLBUS1O11Kjk190Q7yxkYclo7UIKHv7/RRqIuY34KEHIt4ijFboxQh7
	kdpy0dVTnB0xuuPqlObBdqyKuYxGbnjUH2qYv7FPw2sIewx6GaLrYup8HN5HnRn10pBsz9fhd1333
	2RoSKyYEJ6prOhQ7i/yo8x7arXJuf+BC/YQfwNH/5Szufo6Lr9oKXVaZ1caIER/VnDq++WNhTi5n3
	VpaxP2mY2ML0qm8c432mB5km7OalPtaF+gfc2pufwqF8lLOQInHI512jGCiNiVhtBaTFIaJbeAOeQ
	CuXDX2k4pR01mwwDouIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99k-00000001NOh-2nmM;
	Tue, 03 Nov 2026 07:42:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98v-00000001MKx-2gPr;
	Tue, 03 Nov 2026 07:41:44 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11B98422F;
	Tue,  3 Nov 2026 08:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691536;
	bh=B4IuErsE0ZtmqC7OPc4Onr+D+8JFakQNbHoSSz9bMdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OQACus3l8pDtEVzHnl8Oo1HuasCGMdP2Le35NQvG201tjHShNEpYlKiJPeiB2tnY4
	 3V1v3BAmXYFi+xbHAAN0DyZjuoKqN1Z6TpyikFtORz2JKebF2Jv5kJ/KoLxT+viSRM
	 gEmBqSp82M1BPlAG9U5aXP6gpiu3lC+/8EqRGY/c=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:45 +0000
Subject: [PATCH 09/16] media: rkisp1: Switch to calling
 .enable/disable_streams() in ISP subdev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-9-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4090;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=B4IuErsE0ZtmqC7OPc4Onr+D+8JFakQNbHoSSz9bMdo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQtKOXlOoHWmeelfBP04wKkHEooRw8nOOkK
 YwazKRdJuOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 Mq9nD/9i1RonCQN7w2YS2xRJxdZTknT6VIgtCLurxREArRzz7TBsq5GqsXqe3j4kzFWOCWOOjZI
 eeKyeO/zdpmfdq3d+mIQB44QyJxkP74PyjI/WUQco2xIqj7ORA5qWJIA+cu3kvuf3x+rbn9qyI7
 o47y8tCSme7YMqNTnriLQ6hKaxdz1DVsblZoFS1smeJKEZunNCVfEV6PZcUsMZ3s8uzgrIe8/bn
 Oz1QoQp+SWC7I3gAsDfLWclkh9vKE0QCg+pwJZ2j4bZHSpke/gbjc/IkXAeHH/k5hO3vkz3LqrO
 3Yz5Zaw0wLQ8PnStLl68J+ZkxNcZNjAL9w25PpDwYnvpx4iPgCrpwFXiI0Z6QvOr9iG0JXHlbJS
 3phKBp22qiT5/3Q81WZx+QbQLzBOS8BHhQu91RSORElX3u3zBaba8r0scysWhw8TqWzFXvVZcfj
 nmW7tbB4UinEWo7qHXHrqBGlZHGND2Pa+0+adUzOxhWv03IN5QphpXxx0z1n20wVIhC0XUvj/lD
 zdAdRK4oAuDD0L4Mqe+qiprsfVa0y6oVi/a1K5cjjGykoGcW4jgeTbnezCN5n+NUhvQI5x0TJT7
 BVafX2aUch6YSmi7ds7McDFrUanEb0LJA2tJNUAlBkUXbOMVFvrCT+QuDIqw8dkD6CY+yoQHXta
 f7qeTw/iOoiRNBA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234119_927891_57E92A53 
X-CRM114-Status: GOOD (  17.00  )
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

Switch to calling .enable_streams() and .disable_streams() for the
downstream subdevice in the rkisp1 ISP subdevice's .s_stream()
operation.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  4 ++--
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 28 ++++++++++++----------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 357a6bd8db7da4c881e4cba5b5f54e40fd21c38c..90942b22df313d83d9722cc550f01758cda9fa27 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -501,7 +501,7 @@ struct rkisp1_debug {
  * @v4l2_dev:	   v4l2_device variable
  * @media_dev:	   media_device variable
  * @notifier:	   a notifier to register on the v4l2-async API to be notified on the sensor
- * @source:        source subdev in-use, set when starting streaming
+ * @source:        source media pad in-use, set when starting streaming
  * @csi:	   internal CSI-2 receiver
  * @isp:	   ISP sub-device
  * @resizer_devs:  resizer sub-devices
@@ -526,7 +526,7 @@ struct rkisp1_device {
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
 	struct v4l2_async_notifier notifier;
-	struct v4l2_subdev *source;
+	struct media_pad *source;
 	struct rkisp1_csi csi;
 	struct rkisp1_isp isp;
 	struct rkisp1_resizer resizer_devs[2];
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 4043a75ca3f0c5e0373b7fb01468cf2ad350de6b..95e9cdccd650b7bcf89dd6cdd42bdf8af2113ced 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -924,40 +924,44 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	struct v4l2_subdev_state *sd_state;
-	struct media_pad *source_pad;
-	struct media_pad *sink_pad;
 	enum v4l2_mbus_type mbus_type;
+	struct media_pad *sink_pad;
+	struct v4l2_subdev *src_sd;
 	u32 mbus_flags;
 	int ret;
 
 	if (!enable) {
-		v4l2_subdev_call(rkisp1->source, video, s_stream, false);
+		src_sd = media_entity_to_v4l2_subdev(rkisp1->source->entity);
+		if (!src_sd)
+			return -EPIPE;
+
+		v4l2_subdev_disable_streams(src_sd, rkisp1->source->index, BIT(0));
 		rkisp1_isp_stop(isp);
 		return 0;
 	}
 
 	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
-	source_pad = media_pad_remote_pad_unique(sink_pad);
-	if (IS_ERR(source_pad)) {
+	rkisp1->source = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(rkisp1->source)) {
 		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %pe\n",
-			source_pad);
+			rkisp1->source);
 		return -EPIPE;
 	}
 
-	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
-	if (!rkisp1->source) {
+	src_sd = media_entity_to_v4l2_subdev(rkisp1->source->entity);
+	if (!src_sd) {
 		/* This should really not happen, so is not worth a message. */
 		return -EPIPE;
 	}
 
-	if (rkisp1->source == &rkisp1->csi.sd) {
+	if (src_sd == &rkisp1->csi.sd) {
 		mbus_type = V4L2_MBUS_CSI2_DPHY;
 		mbus_flags = 0;
 	} else {
 		const struct rkisp1_sensor_async *asd;
 		struct v4l2_async_connection *asc;
 
-		asc = v4l2_async_connection_unique(rkisp1->source);
+		asc = v4l2_async_connection_unique(src_sd);
 		if (!asc)
 			return -EPIPE;
 
@@ -976,11 +980,11 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		goto out_unlock;
 
-	ret = rkisp1_isp_start(isp, sd_state, source_pad);
+	ret = rkisp1_isp_start(isp, sd_state, rkisp1->source);
 	if (ret)
 		goto out_unlock;
 
-	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
+	ret = v4l2_subdev_enable_streams(src_sd, rkisp1->source->index, BIT(0));
 	if (ret) {
 		rkisp1_isp_stop(isp);
 		goto out_unlock;

-- 
2.43.0


