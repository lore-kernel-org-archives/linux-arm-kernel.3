Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE97CD3B7D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HePzOK2YwREM++8Zxr7PF7Xhi3Zuwv6TtIklSs2K0TA=; b=QD+LNPOw5WpWGOROuhMU9YPSLF
	6FWSn5W6GWwwRZwxocPQ5accm8eAXS1nkQKxQegrlaWZXS1Xt+l7zoZD1cCUawdsPDGs94JwJsUtn
	pDidoYYB16W2RLnXGJTaR5LaSasi1K2VrypLw8n6u0myukQ9qRMa3l5805YCU39DSRiASSzPwbpFJ
	p58dt6rStlDUtmVYvRMuuwoOGizkcYJefRHjzjoghd4DQnvZS5wcV8PhvFJlp9CfT9nn8CNT8x0GL
	azBpILeAzHcfa/PKhpbvxNCR3nKzn/K8hVL879q/q+WWAUq67mhlBaDO/tDdJ13EUjagukzKkSudn
	/Kg3kl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqlf-0000000Asv8-3w5p;
	Sat, 06 Dec 2025 11:48:03 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqld-0000000Asun-2DUk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 11:48:02 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-594270ec7f9so3384919e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 03:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765021679; x=1765626479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HePzOK2YwREM++8Zxr7PF7Xhi3Zuwv6TtIklSs2K0TA=;
        b=gMl/kfrb6HAtyxXrxBAzZ/Ay6L9dryMRA7uQ2miCgTp7JRbYs/vBDwzXWmiFWFVlop
         p3wwZ/mPxZNnQtsRuYjna/8e7uR05ybH9PxI0Q4E1DLXnczTyLVtRlJt1+3N2hmhAWwl
         0ngdGYUZ6Wa/lOu91e44ii20UYT6wdtya1/Rn6FiaEUh0wFpYCuZcFDCzJzH5AhVYF+i
         LCglIYGWorFJIk5ifdkwzzhTYn6jbgv+RyxQH/ejKJ5wdAcgj5lokJqkCS5JVy5iqC9g
         uz7ZH8/vB6aZ53bWPO0IZth9kDFX03tJnxgcVl6tblnBglEpZwH61LHoL5j8KD4o90lp
         zK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021679; x=1765626479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HePzOK2YwREM++8Zxr7PF7Xhi3Zuwv6TtIklSs2K0TA=;
        b=Evyv0i84+IiwUT0tDIxl7/OnQ2hmWPKnTgpemADGOs0tP+voKE5fTRjXXy89op3l6I
         l3wYHuK7VIJWL/nxAF9ZbAKfnf39wPEVCK7epJHK+5FRFEzaQkLiFDsADPvRXmPeZfHu
         D4Zknd1K3ky4sulNm7tfg1vH1o8uZcg984yFz2tkiBGUphArhT/qfP56V268IVwnraBM
         RO0CIYWoSVbah5ooSpkwzQ4+Ig6VLVkTjDuuo/xqDZi2AYrr+GepMaMQP6xL40uuLi3o
         JenWg1lAkW6l5b1oMeVylcWUEbaonOA+QBaHhXWkVweISsiwO2FzZ9hYHbes7FaZ5Sjs
         8mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3XSxs2rK49TPYHKA8xjmqV0XMzFwbr0bLJBoqG3OMr2J/JqLLWXBJ8r8gwoCMpGGQYl8YCLuk80h321chQUhS@lists.infradead.org
X-Gm-Message-State: AOJu0YxlZjCIhWrLBBZzVC27lk3zf9ZtAA5wR7KVKZfId/zy+sSrTpbA
	R1lRG2Mq4VSxPqtd7fF6UIrBttxGqwhrNz4K7tSsOdYDk8GtxKdjRck4
X-Gm-Gg: ASbGncv/PxRmPu6tMYqoSk7dYFeDoyymAKO62T1rzNJe3t0id4hFG9+M46qcwTUoSbE
	BkQguqU37/rUMLIdjeVE2mAWZZe979EJLc0GGCMZBhySGdky0c+XVRyYSYNX3M/6wd0EOz0QZdN
	aX0Ed9pj7x0xRDKahro6lFGc2LL8nEZbrsAVubS9UJXTtifCkds3htGQmBcO15vqUIZCR5prMdC
	FdGIW4fX1U0urDp0/WnTaqgbJPT+2eiSP9NAp/ho9ACyr25t8EaSWsePu4TXmnuMFy6Sagv5Slm
	R6Qom2GAn+u/Yb0Gn1L3SfbYsp/xncL27mUFNMqJRKBxRPe3bG7dr39vsFPWBADpEYDeBhaQzog
	UhXhKIwB6XqFRaoZGJAl67ZijVpb8P9sD7pOYX8+FcDlfoiDhLYiTL92ANcka8BfWCc8sRt0BRF
	3ZZAianqGzav5MMFA=
X-Google-Smtp-Source: AGHT+IHLtSSBaH5vwkicDwq4VHYkBOA2QyJRB3rOh/XN2E2xH2ybmyHraxYc+LAfhlTKju/XpBChLA==
X-Received: by 2002:a05:600c:828d:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-47939df0045mr23564235e9.7.1765015327245;
        Sat, 06 Dec 2025 02:02:07 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310c802bsm126055205e9.6.2025.12.06.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 02:02:06 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: rkvdec: Add support for the VDPU346 variant
Date: Sat,  6 Dec 2025 10:01:58 +0000
Message-Id: <20251206100158.2041439-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206100158.2041439-1-christianshewitt@gmail.com>
References: <20251206100158.2041439-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_034801_598257_F84700C6 
X-CRM114-Status: GOOD (  12.52  )
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

VDPU346 is derived from VDPU381 but with a single core and limited
to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
AVS2 capabilities. It is used with RK3566 and RK3568.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index a1c02ef3a97c..cf68454b2217 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -295,6 +295,62 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
 };
 
+static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] = {
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
+		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.cfg.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.cfg.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.dims = { 65 },
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.dims = { 65 },
+	},
+};
+
+static const struct rkvdec_ctrls vdpu346_hevc_ctrls = {
+	.ctrls = vdpu346_hevc_ctrl_descs,
+	.num_ctrls = ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
+};
+
 static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
@@ -449,6 +505,43 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 	}
 };
 
+static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width =  65520,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height =  65520,
+			.step_height = 16,
+		},
+		.ctrls = &rkvdec_h264_ctrls,
+		.ops = &rkvdec_vdpu381_h264_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
+		.decoded_fmts = rkvdec_h264_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_H264,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 65472,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 65472,
+			.step_height = 16,
+		},
+		.ctrls = &vdpu346_hevc_ctrls,
+		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
+		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_HEVC,
+	},
+};
+
 static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
@@ -1654,6 +1747,19 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 			RKVDEC_CAPABILITY_VP9,
 };
 
+static const struct rkvdec_variant rk3568_vdpu346_variant = {
+	.coded_fmts = vdpu346_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(vdpu346_coded_fmts),
+	.rcb_sizes = vdpu381_rcb_sizes,
+	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
+	.irq_handler = vdpu381_irq_handler,
+	.colmv_size = rkvdec_colmv_size,
+	.flatten_matrices = transpose_and_flatten_matrices,
+	.named_regs = true,
+	.capabilities = RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_HEVC,
+};
+
 static const struct rkvdec_variant rk3588_vdpu381_variant = {
 	.coded_fmts = vdpu381_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(vdpu381_coded_fmts),
@@ -1693,6 +1799,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3568-vdec",
+		.data = &rk3568_vdpu346_variant,
+	},
 	{
 		.compatible = "rockchip,rk3588-vdec",
 		.data = &rk3588_vdpu381_variant,
-- 
2.34.1


