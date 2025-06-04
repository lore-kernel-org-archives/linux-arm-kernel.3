Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53224C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hv6JhVA/f+5+KQmDS6iAXUwZUeXq8d80KGKP92Mg9I=; b=AXt+F0ir/JT8qKmdErFi2PbZ3h
	KqsVNWQkuGt/M5PGHJ0fEWpkbZu+1mDUIH+7R4ozxIl+Z5GO20TMJuyX+U3SjTHh6WtBXVcwFpOcW
	+rk0fb8PsHsOPtYhZkjjBqznTrS4FyYnAguCW2yNErXUhAYQHtSDVGIJbU0LRv+0QlxFf5TJ+hmtW
	jH2Rhm1hgl6CGyFrC57zpjr/zMes5UnNoM2V0UVQy+b/C0Q5jwBsdTgc3XsrlXe4+10iExmOsdVFY
	sVJLZNy2QpBThjR9Tfhz+hy/XmJ4aRInPiizwRfk3AHxoDHKbDbTvx62e4OOGy+dkt08nzeIi1P7Q
	B3QOWIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuhS-0000000EBYd-2pT6;
	Wed, 04 Jun 2025 20:27:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuR8-0000000E9tB-0XYz;
	Wed, 04 Jun 2025 20:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749067808;
	bh=JA52+QnvbuG3EENYM7JPRyaiysq+VkS9i9fM+g1A6bU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LJPEJVvDRnf3DFmydzCHmJWaQ4mxNwo7hUrucAjedI04PXtyJr5NHsE4JEdOmKNjd
	 UWWGAW8OTYDTFWWVoSGPi9gOXazR/ij2mrw4HoiQl3Q9lbcYq3oBPd0kwrTIWD6O/L
	 l5GCAQ8/og+OwAYCtpm2c9caoYfEryHUgcf2UeZ+9aGTEhp9YI08unkln8LsNsNGg5
	 VU0gEpeDQKd6OG6mJiG4O0yYZ5XnRmpfGDDFa2c7MjG8dC8FFq9UMfXrbaPdyYI7Zd
	 H0DLmQGJzUFSU/b+nVBfz5loagrpuVBT3n8X6etqqWAY/1AR8sc7MawIqx5lm47H4q
	 maY7n/v7UCmkA==
Received: from [192.168.13.145] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D84AA17E378F;
	Wed,  4 Jun 2025 22:10:06 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 04 Jun 2025 16:09:39 -0400
Subject: [PATCH v3 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-5-603db4749d90@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_131010_314491_4E712723 
X-CRM114-Status: GOOD (  10.07  )
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

This is not supported by the hardware and trying to decode
these leads to LAT timeout errors.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index eea0050eacc1c41abd8e0a1cd546c1ecce90a311..65bd344a12f65d4cb3a81d34f41710f0089a2349 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -551,6 +551,12 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
 			mtk_v4l2_vdec_err(ctx, "VP9: bit_depth:%d", frame->bit_depth);
 			return -EINVAL;
 		}
+
+		if (!(frame->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) ||
+		    !(frame->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)) {
+			mtk_v4l2_vdec_err(ctx, "VP9: only 420 subsampling is supported");
+			return -EINVAL;
+		}
 		break;
 	case V4L2_CID_STATELESS_AV1_SEQUENCE:
 		seq = (struct v4l2_ctrl_av1_sequence *)hdr_ctrl->p_new.p;

-- 
2.49.0


