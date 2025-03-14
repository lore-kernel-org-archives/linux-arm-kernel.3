Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B026AC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCoDkNxle5kYQxEYElD69IYy2zg+RTAZoMqICiRmeUE=; b=GZP5Pcr+8N8Pq7is2IOENpP36S
	eVx/d/lL8w+LSnAQAV88gx5FRjdB5ADkuxFp6E6uaiRIIXiy0Rk2ZEG6JmNY1pLrXz41ojzLdu+Lf
	BvA/MNsdrZPNMMQ8XVYbpNwnkubyhzSHxMUyxykNZ0EW2VLZnnQBQv98EQciZZzygl6M0DB1Eq7ZO
	pt04xV+v24d4XDZu+K5czTYHmVkuUmAkKWHmBlklBIIdVLYz+gHzLzHcMHOusryY09WJxW4YYJSJH
	LAh7CP6t4LaTcnei4sn0kj2LhCPn2HJvmUddzzrg3Xn1W1ZvkGDJ/y5iMq8xAsluDkSTQb8wIBPQw
	aNpvfc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Ds-0000000EIdb-1OXm;
	Fri, 14 Mar 2025 13:37:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt54O-0000000EGxv-1CCX;
	Fri, 14 Mar 2025 13:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741958834; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NsS4F1K90WlNKnGrraMnXP8XW5Y09jO/+BORJJ/hXkN31ua4XWH/RKftru+7EEzjC+F7HY9AWte1a9XuK1I2MfwvY2FliqOqcWLDQjGNAiPbCwak5PbuGLZbOH64dYa1M+MnmPDkPel9g3zgJqkHmwi9O12x1iFfmt1EsWjEuek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741958834; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uCoDkNxle5kYQxEYElD69IYy2zg+RTAZoMqICiRmeUE=; 
	b=dnDjZQFKOG7k/KbiuZUiIiVSMTxgB+oKf66bO0JbxU6isK/TJhs0NPODkf63CnCyse/WR/Nq6MT7s03RkGPd+GqOvPikdra40TXSQRPCg2DGTlvTPE+EzyN3ArTSf/MeoyIVAwlj9F4qLj9EXaV+HGj+qBmBi4FNStcTHQ+lopo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741958834;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=uCoDkNxle5kYQxEYElD69IYy2zg+RTAZoMqICiRmeUE=;
	b=AzLZgyEoRHU2ZMpk6ReS0fi31DtyDvOCHBnCOaQGxESo8INRr8lrr9Bl/rCKhYTd
	78kkeLeO6zBJIp8PFLK1NNGGAFA7HAwztquhc53d7CM32iUKSfYJUWO50azwBShvaS1
	9OMKrHoCqppyJggRmwjTEzY2F3t+y7lUOei7jXi4=
Received: by mx.zohomail.com with SMTPS id 1741958831940301.9413422942897;
	Fri, 14 Mar 2025 06:27:11 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Fri, 14 Mar 2025 14:26:30 +0100
Subject: [PATCH 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-5-5e277a3d695b@collabora.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741958789; l=1233;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=emJE1X62MuP0DezjydZOlvtEYLKSLG8mtfx8cJ7l/Ak=;
 b=8osgM6j4VT/PtVsmE7tkbG8dQ7JBOV2MAMNuNrQGJk5n2F7j6aPuW/gs9ohRwuBFlnr3mskub
 7aWEdfocOPcDm1ourg2ImJ9zqwCQiJegWK3m+BOYhhMj0jR6xd3YVrj
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_062724_394549_C3F7DE76 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This is not supported by the hardware and trying to decode
these leads to LAT timeout errors.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 9187d7bcfc8aea17f3fc98d94419777d8026db51..3dbd251034b85e521c3c93538d9ecf9078ef3820 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -496,6 +496,12 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
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
2.34.1


