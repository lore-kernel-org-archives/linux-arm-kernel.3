Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6D7D6ED2B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6VXupjnTEVVWDbEaH7UOHhbUPZqhwx1VwGrB1UH9yU=; b=eqprGZ/Ev79X9eFuBXPNhDsRTi
	nmiPqb2ZsWKZwIu2aCIhsZkysZFDuz9FGEt1sIZ/b27raqoYo9Qc6/ZLsGYV/rn6oYY6tN044pp7Z
	nR1DKlLpt4pQyaH1jsoCkYAg/xow20SJI/Z7MSS13r+PFL1kqV/tbep5mNfWNWspRySSzigVFdA4S
	hatAtxqIrtESqQML2I3Rm2Ji8VLtfPqrVG1+Q3o/94uIKZzUbh965FMe/RMt9YRhmQia6CyqVYBtY
	Zl9Z9ATt2ep0N93aII1SYRiOO9npA6ZlpA5tVTs/06RHYWWYTwJl+vFx5KIZ/Gc7sFgU1xIKbL4AF
	tvrdWtKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7Bu-000000006cw-3iZe;
	Thu, 21 Nov 2024 13:25:50 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE78P-000000005yE-20ci;
	Thu, 21 Nov 2024 13:22:15 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALAXHH1002018;
	Thu, 21 Nov 2024 14:21:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	q6VXupjnTEVVWDbEaH7UOHhbUPZqhwx1VwGrB1UH9yU=; b=wGNVmgNeT2/V4w9V
	my1uP2fOyC4FGUIydvyH99C0JUWz4p8howTZsncn324xTCNAiuzWAsh8dcAlr1aq
	krW/hVjCnP0wnl/1khp0bYYpOJcqganzOPGc+H9cUKNiAZiDgOejLfQhGOdEePxe
	LtZgRxy3FVIjRMubb3j9RgHDXlPqhCU928UP/Ol4ZPkqJqWrzK4mswJ62zvKpyOX
	Yqu6WZSkug3Q1Sq1RbHsXBMm7sOZ+LGcRVLvngbbwSvOkJvclt2Av5YBcyUFegqu
	lZ4vhp+Cl9bG3lvSxpvTu7Ck+E2hgxTPEVeVHb6pWugFaktS4t+Vv2HuRU2tsfUg
	Pjq7JA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77nmea8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 14:21:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5D484004A;
	Thu, 21 Nov 2024 14:20:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D9A32843CC;
	Thu, 21 Nov 2024 14:19:08 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 14:19:08 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Erling Ljunggren <hljunggr@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/3] media: verisilicon: add WebP decoding support
Date: Thu, 21 Nov 2024 14:19:03 +0100
Message-ID: <20241121131904.261230-3-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_052213_806903_1D8D1AA7 
X-CRM114-Status: GOOD (  15.86  )
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

Add WebP picture decoding support to VP8 stateless decoder.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../media/platform/verisilicon/hantro_g1_regs.h |  1 +
 .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
 .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
 .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
index c623b3b0be18..e7d4db788e57 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
@@ -232,6 +232,7 @@
 #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
 #define G1_REG_ADDR_STR					0x030
 #define G1_REG_ADDR_DST					0x034
+#define G1_REG_ADDR_DST_CHROMA				0x038
 #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
 #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
 #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
index 851eb67f19f5..c83ee6f5edc8 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
@@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
 			   G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
 			   G1_REG_DEC_CTRL3);
 
+	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
+		vdpu_write_relaxed(vpu,
+				   G1_REG_DEC_CTRL3_STREAM_LEN_EXT
+					(dct_part_total_len >> 24),
+				   G1_REG_DEC_CTRL3);
+
 	/* DCT partitions base address */
 	for (i = 0; i < hdr->num_dct_parts; i++) {
 		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
@@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 
 	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
+
+	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
+		vdpu_write_relaxed(vpu, dst_dma +
+				   ctx->dst_fmt.plane_fmt[0].bytesperline *
+				   ctx->dst_fmt.height,
+				   G1_REG_ADDR_DST_CHROMA);
 }
 
 int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
@@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
 	if (hdr->lf.level == 0)
 		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
+	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
+		reg |= G1_REG_DEC_CTRL0_WEBP_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
 	/* Frame dimensions */
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2513adfbd825..7075b2ba1ec2 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
 		break;
 	case V4L2_PIX_FMT_MPEG2_SLICE:
 	case V4L2_PIX_FMT_VP8_FRAME:
+	case V4L2_PIX_FMT_WEBP_FRAME:
 	case V4L2_PIX_FMT_H264_SLICE:
 	case V4L2_PIX_FMT_HEVC_SLICE:
 	case V4L2_PIX_FMT_VP9_FRAME:
@@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
 	case V4L2_PIX_FMT_JPEG:
 	case V4L2_PIX_FMT_MPEG2_SLICE:
 	case V4L2_PIX_FMT_VP8_FRAME:
+	case V4L2_PIX_FMT_WEBP_FRAME:
 	case V4L2_PIX_FMT_HEVC_SLICE:
 	case V4L2_PIX_FMT_VP9_FRAME:
 		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
index 833821120b20..c291b1560e20 100644
--- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
@@ -22,10 +22,10 @@ static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
 		.codec_mode = HANTRO_MODE_NONE,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
-			.max_width = FMT_FHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = FMT_MIN_HEIGHT,
-			.max_height = FMT_FHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -42,6 +42,19 @@ static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_WEBP_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_4K_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,
-- 
2.25.1


