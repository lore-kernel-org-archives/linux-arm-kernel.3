Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F94D277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 05:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwF/unBnaFW1rvIB2VegLLFRYP2bQTcQU4jqjcGifVk=; b=chk+y10+yQ/Ctu2FNa0osmdosy
	Tf2euVNzagRO6Bhkizn87ABZrMOM2JeF5ViMCpHnu7H5MiToH2wNvjpaLy2G/ouSmCXF1BP8ldSCz
	8F9eVEFKypQNb9+HdE0z7HQGE9u/+wqg9OIGJEYyk8gAsyO2SW4T33m+Ywph1WGtlGSFpeYWxjOV9
	KE0rdrcro0xpIxkSWCpha/5bQ7APeTBDt/Gvqf4v4mUUGEI7y1zv9no/Cu97l9jS1Br4mPROLZGgy
	mj/rrFqWlOhbyDSEW5pwA7X7t3442aEJ1hcUTHVtlqRuzYoStQN+lQo7RWP66lZ6v8ta2wNkIGFrZ
	fKTh4gLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRfV-00000003HP3-1W5V;
	Sat, 10 Jan 2026 05:37:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRfR-00000003HKz-3brv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 05:37:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47796a837c7so35146425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 21:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768023460; x=1768628260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwF/unBnaFW1rvIB2VegLLFRYP2bQTcQU4jqjcGifVk=;
        b=D67QE1saGbuQPbfQ7kyn7Sc+SOAcmtGm+PL+PCtayhOuORjkbm50VvsghP+56llJob
         fuxO20oWgEEukKykNeWScuDu7IG2487u6i77sxOLW0ydXP/Il2Zok0dshqQ9xp1vlCVt
         PPcPSFQIyu1ozO5VWI9H7RfyNNhjIqY6GTkoC3wxT40UxiTPHQ+A9mUIqd1e5Jqvpjvo
         5W5Hh4sTcFw4MGTgp51apSLMejhsRJ5/+62j4jZeMk7X5oXkR7xshKUjkPeDaGAP3hri
         q077k4I8zbBHYL/z2LQ6YBWgMoRBKGi/svKzr0fHIMoqAzRHU95WSZaAaNIOLHLYCpfO
         pvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768023460; x=1768628260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SwF/unBnaFW1rvIB2VegLLFRYP2bQTcQU4jqjcGifVk=;
        b=PAAHHFXmApwPZybW1GEd7TsG7M0bDqbXuFjluvMGB0cvZjeAPRSt5jYXq6ucn+Khdm
         0Xcx8IbndX3m41gzEbiJAjkepbUa6pWdDLGbEN/XLeBmlHhu8ifnccX3FyIEwkOTPYi8
         lHvyyUJ6Tm/NxekN3ruusJmzYBW0BLDBHPifhnJyZvG3FuS8eUpY+zjxL0y1invl1sER
         Ox2xJoVg2RHQtUOFA3qTVaB8P3p7/RhrX5m/roKIt2UhwfiXewovjtN7+BiayjIyydOi
         l87IGREt6g/IuafzmDIEp1zhdACRWZNW4+xA6BnN3DAJFeANyN1FdL6ib+KG7cBBC3yo
         GpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmOmXOrb3V4Og0ZOTgHGGC1w9q1UOdEgtrRRPnuba+3eAa1NhJYpr+aWEQyWgObrV74mg1gN6cjDQ/VATi5F7Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzB7DnEJ0Vi6F3loQU4X8aO5/X/8M8vdxK3e3+pOdYzZbAf5wmM
	/HZYXiC/IwYlZbEz5A7Xc4p7+2zxL3foxdAgaRlnYw94YK+sCTJe8VtG
X-Gm-Gg: AY/fxX6r1Qr5GdvMwbtpywSqZ/fYlCYsnpGqVaGfadXA90JPRz6rEIYQrGnfaQ4aNYc
	vFRMerrSThEbyWT9zSYEAvz3zKlAT1C1M5iKgxjsegVIfuwvisJ3LDm4PHHO+MQ08vWFvs3qkRS
	LRXC4yUVWSyUGQSMq9+hC6zb7PiYPbobvAq6JzIe5ufVGA3HFY89bmXGAcrow2rCgCUPVV/wXpD
	PbiXOa3tQgFk+N6buN8FmWvPgahXZ0lYTTUkv8y9MVJ1KtRJUYH0bPIxU42uuOc0h6Eu/T86NIh
	RQVwKzhk4WWXTySDGHnELNb82C5ejH1f/cdCSjL9K2a3osWFnJG3EneFYi7zTov835whVuTWMLL
	6e5m03jZFL/MPRLKBKZKUlsdIrhXEB/SdMOrVWA9aDYesshJB/ViUoJLU3FSDrvONA6kLRoM+m0
	r8M2urOwpx2RJvPVY=
X-Google-Smtp-Source: AGHT+IETNRaHMNAZQeH2gwTg4jdbHnvg19YnwNKOZH/s/Wk/33B+6YxgXnlQIAepe6DAJfUBCWI5ig==
X-Received: by 2002:a05:600c:8b65:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-47d8fbda479mr66222065e9.17.1768023459645;
        Fri, 09 Jan 2026 21:37:39 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm25973825f8f.3.2026.01.09.21.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:37:39 -0800 (PST)
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
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Dang Huynh <dang.huynh@mainlining.org>
Subject: [PATCH v3 2/3] media: rkvdec: Add support for the VDPU346 variant
Date: Sat, 10 Jan 2026 05:37:26 +0000
Message-ID: <20260110053727.2295260-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110053727.2295260-1-christianshewitt@gmail.com>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_213741_962722_6774EC29 
X-CRM114-Status: GOOD (  12.98  )
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

VDPU346 is similar to VDPU381 but with a single core and limited
to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Dang Huynh <dang.huynh@mainlining.org> # Pinetab2
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index a5cf6f3240f8..6e49b129d11f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -236,6 +236,62 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
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
@@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc rk3288_coded_fmts[] = {
 	}
 };
 
+static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 4096,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 2304,
+			.step_height = 16,
+		},
+		.ctrls = &vdpu346_hevc_ctrls,
+		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
+		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width =  4096,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height =  2304,
+			.step_height = 16,
+		},
+		.ctrls = &rkvdec_h264_ctrls,
+		.ops = &rkvdec_vdpu381_h264_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
+		.decoded_fmts = rkvdec_h264_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+	},
+};
+
 static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
@@ -1657,6 +1748,14 @@ static const struct rkvdec_variant_ops vdpu381_variant_ops = {
 	.flatten_matrices = transpose_and_flatten_matrices,
 };
 
+static const struct rkvdec_variant vdpu346_variant = {
+	.coded_fmts = vdpu346_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(vdpu346_coded_fmts),
+	.rcb_sizes = vdpu381_rcb_sizes,
+	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
+	.ops = &vdpu381_variant_ops,
+};
+
 static const struct rkvdec_variant vdpu381_variant = {
 	.coded_fmts = vdpu381_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(vdpu381_coded_fmts),
@@ -1705,6 +1804,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3568-vdec",
+		.data = &vdpu346_variant,
+	},
 	{
 		.compatible = "rockchip,rk3588-vdec",
 		.data = &vdpu381_variant,
-- 
2.43.0


