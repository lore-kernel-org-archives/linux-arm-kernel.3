Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30D4E8FDA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhf0TH4eJNjuHSmbRZBfmqwPKHrm+PMdGGpE2aA2ePg=; b=nBUZG56dZ80eICt2RCeO4/kKSV
	msXvJTI996K+B9XBkAKoPedYCgCO25nar4DTmi6Zmsch1bGmmUaXA0QcavCbey+CQN0drg2PNsHDb
	3LvpyR0sOafEPKF0OVnNHDodiMFqUfjSCsJSyqKFS6ANjjCtvmeT8fzzJEYI7GzOG3v9crzMrKNH2
	7UXBuVa1Ojw/Vm6EweRmlYsbpHCShjFVuTMihZEJ55G4lOysRCVnqx7PFAQLGWUt53Vac26iJCmHT
	DBcqrWsICcwHX98dXzE8ZG9f1MHl47b6pg4JIjAXrjvajaxv+ZSy++Kwy1uAhxcIdOGb3ZvlEqL9M
	dZtJUOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ637-000000018vf-0eqb;
	Fri, 26 Dec 2025 11:32:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ630-000000018rA-4AlJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 11:31:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso10925175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 03:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748713; x=1767353513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhf0TH4eJNjuHSmbRZBfmqwPKHrm+PMdGGpE2aA2ePg=;
        b=gW4v4L98bgFklQ3TlBX43AW/HrUQXJmeoNhZmytO4GYupo2U0hJIGc7rvpoLqi6tWm
         IyvhpnmTXyG0xx+nt5WLL2Jk53Rdou63mByqczG/Hx14AnG1bHd7/dMbV7s4c2eVaxlr
         UeAcPnm1ujQ+iMTIQrET/2vpsomTZvNfYZv8WFrW7A3mklf0AgUhcCrLBcWDm94H9K/+
         +WwDpKjAOZjCBVhwmDQkObR4Ej3xNg5OBszhPViPKT+WRfZZHJVPQrQiJjCJFzF3Gnf7
         2IekyhLFt/b3k9oW/77l6JXdKqBiROdOprAtqM8IIksuHrc792UYWqLaAxjv0PyE04j4
         Xvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748713; x=1767353513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rhf0TH4eJNjuHSmbRZBfmqwPKHrm+PMdGGpE2aA2ePg=;
        b=aanReg01x7V5xjKQi8HgywLxb6SAWdM6TQkYOS5mPSG/wQrJwoStmZ5lgcSbJF7UdO
         K6NduGQ3vpnLyEX8zNQ9dvxvYOgBk3PP3iUnoKalcntNON9enuO4nK2cmxkgFUCKWp1H
         VqLqfe24gYx8/AYyiekC9TMXYS3QIhxLWsF1XZpdFcHKkoFXYIXTocx9+LApmGTf805I
         lXseVEf22mE1bEsoMvUrZQAPP3tp6WnXH4/VK1GPH/K72AxDO8fH4IPQBjcWcPv7m22R
         tIOefad9gGyVQ5UAISiouXivX4R2CS4/VKPwLBl0bsKGq5TP0GQ4fiNDCwFi39TKInih
         vwhg==
X-Forwarded-Encrypted: i=1; AJvYcCWg/wBa/Dp9CCFXvK9d9SHaAmkZhcGVWLs/jbbqHihACAhazgdjKMCy4iIQULKPlZWvClg9nR0kUGq8N7vwip2r@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmjow6qXa0yA8rdhh+qeqyX64/AxTl8Bg65LA8gqWwIRBPLNj
	7IPN+YXBVOG5cc62WauM7DlzMTkQyL/NBsUSDizIk8YESCOJzQZDjELi
X-Gm-Gg: AY/fxX4+6T8YnsoZxekON7pBdYS5ld497Pbgxjt0Eic6nEXw5UqY9Md1mOs2KOUUVkW
	+6RsZZGaztOu7CuDdDkHG/d5tsowUnrPAEK68/5iQgrakHsIOY0PGsErr3rXMG5Maf+uRV70bI3
	qUf1I67jy8emZkNbTUgzAarpEszBCnzDdDaQBwDbbaJTuEE6z/mzR5GEPyJ9dL/RkQqTNcfgV2l
	zMzkadmsQmarvXe0a/lYiz8wszKEjyoIASGB9yvSnbbxtsHo52vqlplVkx8nXQBPI5jdwFRmnI2
	yDB4WH20lIkgcMNjfiv7Zv00UQLBBOiQf0bq0ipcFoKm6FH+AC/ow/Ckeg0By14PNaQ4W8OAyTD
	Hyi9Y3lqDID84T81JtD48YuiwgKP0IjGrwMTgvsOW47LyWOvE0WyfK9BAlnMgiIPLiVgKtnLWxc
	tXgq8j7fCre8UbDXs=
X-Google-Smtp-Source: AGHT+IEdX/opTeKmbf9vs+IfU8RNLfI0e1Jx0FbC8ZOgZmZVG+BhcxQJNX7MD2OXkK7u+x0+7A8c8A==
X-Received: by 2002:a05:600c:3506:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-47d195499e5mr211765625e9.2.1766748712900;
        Fri, 26 Dec 2025 03:31:52 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:52 -0800 (PST)
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
Cc: Nicolas Dufresne <nicolas.collabora@collabora.com>
Subject: [PATCH v2 2/3] media: rkvdec: Add support for the VDPU346 variant
Date: Fri, 26 Dec 2025 11:31:39 +0000
Message-Id: <20251226113140.573759-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_033155_083300_32AE7212 
X-CRM114-Status: GOOD (  12.74  )
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
Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index e547057dc75f..6b39e99d8a8b 100644
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
+	},
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
+	},
+};
+
 static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
@@ -1643,6 +1734,14 @@ static const struct rkvdec_variant_ops vdpu381_variant_ops = {
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
@@ -1691,6 +1790,10 @@ static const struct of_device_id of_rkvdec_match[] = {
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
2.34.1


