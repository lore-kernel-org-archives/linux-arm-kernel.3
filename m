Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF53D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLNNI3dyPekiVFzUVXYnxWYt0ysODDClT6WNNcz6EaA=; b=I74fzY7O8Ql37JERc/i0TwRXKP
	l/fvjYQ67NKoIDKbpVEsN+hn3/dHD6cZZ9AKiVVT+JP223t3I1dx41R7OD7M0cbNsyFJkDRD7Sm1m
	v7MiNkTEx8mpXjPQZJIEYO+1fc8khYdA9/WkVeVH1jMuPMHNKH1LFc9y6YG9AAoxxjNrJrWsLFRO4
	iVrNAarF2Vh9j1Qkz81CROJ10HI8LARyhjr/MCmFQrbugoR8AdQBrUtOERkIs9Gf6gkFS/mHiWaDa
	ZMS4XIKYTsdArKWF1TB7mx76HJfCMrb7Z45eFnh9i7N7T8XmAC+Ug7NrDlxLuwJP4VkWKDgVoDzps
	agHDeKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3yB-00000000p9V-36F0;
	Fri, 28 Nov 2025 19:17:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3xp-00000000oun-3x4Q;
	Fri, 28 Nov 2025 19:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764357423;
	bh=oNY6R0rAfFGsoKbfh/1b/5kMouL/RKSRsCa8WAjLKyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=muBzDKfJPPhEO/eLnmkzX9E+KQbQHdBvqg7NlmV8CUHs6kFaZPr34Falf1XfQB9Lp
	 IcoI3l4txK5fr+vbQ2JXq5qNIiAbi+dIWJq9Uora7fuj+EFIYL+O9UQ+MO1MPjPFuR
	 RTO+LSolGcG4+mOIBm3TKHAn7WHKuKvV9lH+lT2Z2r8QGp5l0aKUeOdWObX/qB1ogE
	 cwRPIF25RYtNRVUDtCkuzkQDUvGUupstTIMWc8oNE8aoDS1PMoI4Lg9BggolJcCAPf
	 IceFYqDDtPSQ5U7Z0mSd6hy9AXaFF83vtzHZEzyQPjit8QAhrAkwv+Ulxin1QvgBOA
	 gtK5OScgAah0g==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:7b4b::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C33C517E1203;
	Fri, 28 Nov 2025 20:17:01 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Fri, 28 Nov 2025 14:16:16 -0500
Subject: [PATCH v4 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-5-c166bdd4625c@collabora.com>
References: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
In-Reply-To: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_111706_196944_4605C2D5 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
index 6598a9e160b7a5a952c118e873a893e21e2f71e7..8e1cf16a168a7769c71459483e785948e259a828 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -518,6 +518,12 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
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
2.51.0


