Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41F606D805
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N738GzB5;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=r+U9+j8D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rzS1pqBiw15pMgxk9TSnRWGkT5Q/k8VRABLjXcavQtA=; b=N738GzB5BRePAM
	UfccDRH3DFzeHi1Uc6HxVHNPB/ImmE9FBQer1TlTQjFpeAdgfw/f5w6kA6JhWoZB08aEhedqKm9/t
	MdPASR4vHcRPiF9QMN9Cs5l1dC0ufbvXpkfVAUNC8Jm1kHr4HFA931cgBGtKhGm9hydQSwA96hWQk
	vEpVYZP6/sTPe0aZFI6rtw/nOM97iuRTYJxguX16tls4OgILc4ImH6qpFm2/R+kBCVKkE/j5yuOAw
	BFbur09gZpmqNByVcHtoEIp7wi/rc0aQRHIVuhYvuwClm3FpDgLCKnXkHKn5hQdVmQmhDik9QlV5X
	yrVmwffAqxsLfr/p275A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99g-00000001NGx-44V6;
	Tue, 03 Nov 2026 07:42:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98w-00000001MLU-01wI;
	Tue, 03 Nov 2026 07:41:42 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7B904F05;
	Tue,  3 Nov 2026 08:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691538;
	bh=Pk+zTSPs/3IO+/9gsdqpALVhiUk5t9gpckpN2KaolWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r+U9+j8DSNwdA1Ohu7RLlSxTaKBJnlynqVKbUbk1+XwtxyUlb7oE46wBSkl2k+E2S
	 XUlH0ztroDK2l5WoWGwMnAfn10HAmh2KjtOE8xYt0zHESjL3pCqfvT2W/NyAAoCtJN
	 ++ZauDXcyJsXrOwqPGI90ModaRTs+HURkPYaEYck=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:48 +0000
Subject: [PATCH 12/16] media: rkisp1: Switch ISP subdevice to
 .enable/disable_streams()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-12-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4743;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Pk+zTSPs/3IO+/9gsdqpALVhiUk5t9gpckpN2KaolWE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAR3jIpblxA0JMz6nJDYUdcIQBa7yBjPXJSK
 es/oxGLoAaJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEQAKCRDISVd6bEV1
 MsiJD/0Stbt1AsUJCAA9Xet5akRvZTmfKCHRcCWNAk0uce5NmHJ0vvM7wn/69nlzxm8lrMhilxr
 fuz4GaJQdTrL99DTiuuqb6J9ML8CrTFIzaIHDXHmkIvyw5McKe3LXtuuxLkAhxVuneVUi0I8iuz
 YgW66Ql6uFqOgCXLBULQX0P48egrFVJ74XBznimiMI3M8LGOKKSZJIVzGBuTeSd9xwWI389KWIZ
 cwy5yP4J3hiRz8qbGrvF9Qwdm6CxQAbfzPGSPSAqSvCXq15jwQjLm05Sa0Cm2Sw/QyrBQhm2tmn
 cf74Go9YjvQTcL6fmmAihISq4Zkz58EOlE+/t8nVnmE0QnwlKpR7QohCko/0iY6ffi6C8VI0MJR
 x9mk6x1bivjFUMP3EVx19HAign4oXtt6ihxRW/YOIjYGDBBsci0GjtsIuSYvB3tVHbmkzU/G2dq
 lZjFDnsEhcOczGJYNx/t76l0TacDcOH5AF/iuVTy41ZAKUlt00sd0xhBtQQB1VDeXWDVxNoCeAv
 hpvq0N3fbIptUfJFAFveLZ8ebqCGJd6ZAeQjlvMTsRnJ9cAu/8Ws2Yj8+LA8F3p6Ip2HdGKrUgM
 0IC2/aA+q6mIxlaWJIucAy7f6to+aS7s5s83E+WrzjdI4u94IoP1tx7WdbzIrq5rYrxyBb+EEN5
 hfdpZsUlYZuPKcA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234119_990205_29DB5EDC 
X-CRM114-Status: GOOD (  13.74  )
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

The rkisp1 driver's ISP subdevice currently uses the legacy
.s_stream() operation. Switch to the newer .enable_streams() and
.disable_streams()

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 95e9cdccd650b7bcf89dd6cdd42bdf8af2113ced..a480fc3547b989865406380560ed57b57e0350c1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -905,40 +905,22 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
 	return v4l2_subdev_link_validate(link);
 }
 
-static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
-	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
-	.enum_frame_size = rkisp1_isp_enum_frame_size,
-	.get_selection = rkisp1_isp_get_selection,
-	.set_selection = rkisp1_isp_set_selection,
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = rkisp1_isp_set_fmt,
-	.link_validate = v4l2_subdev_link_validate_default,
-};
-
 /* ----------------------------------------------------------------------------
  * Stream operations
  */
 
-static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
+static int rkisp1_isp_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
 {
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	struct v4l2_subdev_state *sd_state;
 	enum v4l2_mbus_type mbus_type;
 	struct media_pad *sink_pad;
 	struct v4l2_subdev *src_sd;
 	u32 mbus_flags;
 	int ret;
 
-	if (!enable) {
-		src_sd = media_entity_to_v4l2_subdev(rkisp1->source->entity);
-		if (!src_sd)
-			return -EPIPE;
-
-		v4l2_subdev_disable_streams(src_sd, rkisp1->source->index, BIT(0));
-		rkisp1_isp_stop(isp);
-		return 0;
-	}
 
 	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
 	rkisp1->source = media_pad_remote_pad_unique(sink_pad);
@@ -974,27 +956,50 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	isp->frame_sequence = -1;
 	isp->frame_active = false;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	ret = rkisp1_config_cif(isp, sd_state, mbus_type, mbus_flags);
+	ret = rkisp1_config_cif(isp, state, mbus_type, mbus_flags);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
-	ret = rkisp1_isp_start(isp, sd_state, rkisp1->source);
+	ret = rkisp1_isp_start(isp, state, rkisp1->source);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	ret = v4l2_subdev_enable_streams(src_sd, rkisp1->source->index, BIT(0));
 	if (ret) {
 		rkisp1_isp_stop(isp);
-		goto out_unlock;
+		return ret;
 	}
 
-out_unlock:
-	v4l2_subdev_unlock_state(sd_state);
-	return ret;
+	return 0;
 }
 
+static int rkisp1_isp_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state, u32 pad,
+				      u64 streams_mask)
+{
+	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
+	struct rkisp1_device *rkisp1 = isp->rkisp1;
+	struct v4l2_subdev *src_sd;
+
+	src_sd = media_entity_to_v4l2_subdev(rkisp1->source->entity);
+	v4l2_subdev_disable_streams(src_sd, rkisp1->source->index, BIT(0));
+	rkisp1_isp_stop(isp);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
+	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
+	.enum_frame_size = rkisp1_isp_enum_frame_size,
+	.get_selection = rkisp1_isp_get_selection,
+	.set_selection = rkisp1_isp_set_selection,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkisp1_isp_set_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+	.enable_streams = rkisp1_isp_enable_streams,
+	.disable_streams = rkisp1_isp_disable_streams,
+};
+
 static int rkisp1_isp_subs_evt(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 			       struct v4l2_event_subscription *sub)
 {
@@ -1012,10 +1017,6 @@ static const struct media_entity_operations rkisp1_isp_media_ops = {
 	.link_validate = rkisp1_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_video_ops rkisp1_isp_video_ops = {
-	.s_stream = rkisp1_isp_s_stream,
-};
-
 static const struct v4l2_subdev_core_ops rkisp1_isp_core_ops = {
 	.subscribe_event = rkisp1_isp_subs_evt,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
@@ -1023,7 +1024,6 @@ static const struct v4l2_subdev_core_ops rkisp1_isp_core_ops = {
 
 static const struct v4l2_subdev_ops rkisp1_isp_ops = {
 	.core = &rkisp1_isp_core_ops,
-	.video = &rkisp1_isp_video_ops,
 	.pad = &rkisp1_isp_pad_ops,
 };
 

-- 
2.43.0


