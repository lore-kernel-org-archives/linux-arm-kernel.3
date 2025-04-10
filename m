Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbGw4RTUr22Dmsi7vQbqepOtki9ujPNaTWKA2AVJqYU=; b=A30+//Z8B/ZwnXSV4cdBNzt/Xl
	8V4jGcbfDK5SiT93KJwPgx2DJVuFabSyrwC8vIqmyxUb80T6A6kb7UgR468OTL48du4WiXHLtEYgm
	rsJz13u3u1nIkzdLtm2FKUynChEXv1FAsL/fHAwVkSn489o4BufSi7EhQcHJqWn9XMWI3bFuTIfre
	xOvJ73DJjQpzcVbCfifyZ860BhvLbGYy7u5OjfneamLy3clH1NbCPjcio6Y4roqXLXYaVHsEkbp/5
	1D2gY+7dI8F6kBFDL/JLKHSzGfhTLp7+JEffRTyo8kYDImJiBKZaP3XN/8NnBvkBkqpRtdOT1ruhm
	nYc0zPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2v2B-0000000BFeT-1ow2;
	Thu, 10 Apr 2025 16:45:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u0j-0000000B3Uw-3QSC;
	Thu, 10 Apr 2025 15:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744299612;
	bh=sYHUv9c2J/bW3e3pKAK6dhvM8isdWLfu3/aJgKmmQAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B+JplglOyc37V+r+6c35ApCFQpCh+3wLwskOatNhYatyYtHxgYyA7beYAKW0J2uiF
	 0DxobBqM12+r7MDosajLlfhZnMmgoh/V0i73YRnz0vYmXFD9jrdI7spdyHXkqER8bz
	 IIKuH1Wzv3tF1FSnaQb0F+PzQswZYfZEWQqSKViBeAa5+PnhRt2d2n0ngpcwldnkYN
	 LGh4lasrI3kyyVAE1WgN0F66T2Ni/EmDoWpYzeJSkPC9DHeXekgddWatWUOoUh9Vmo
	 woTB8pF+kSXRR+gS8YjVMH8k1kBzcR8OITGwvKz2xAcO3WFuwZ/Rb1axTfMbjcNxYo
	 inXeCL90JVezA==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFCF817E0808;
	Thu, 10 Apr 2025 17:40:10 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 10 Apr 2025 11:40:00 -0400
Subject: [PATCH v2 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-5-5b99ec0450e6@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
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
X-CRM114-CacheID: sfid-20250410_084014_006351_B1176594 
X-CRM114-Status: UNSURE (   9.59  )
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

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 1b08f95ba04ee137b46d61d866b030857f439429..ab6ab9ef33dbd0d4735f82e74526b376f2502550 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -492,6 +492,12 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
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


