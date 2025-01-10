Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D69FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzWcnDig7PeaWlg6arGkLmtPMhz1FO65auOQguUgNZY=; b=W38NjHGifEMQB3OjmCaUfIxPNW
	+eF1lZN0x6J56t7A75K4QDrlGGBh0yl77FlE264P8Sks/2PE8o8/F6RL2bfFpnHZ1InglmZ2Tex5M
	yuEpaDkY1NU0VIi6EBNDoFli1VbhBm1Fy18LvB0qjhmJaaI7q4lljOLjHcW8mgJGYENbF9uK+kHHL
	5WohUogYFXsFcWZNWlbLNKBjjfGKuPm1HDvp+yuuJgVRclGyOHIcxaO4MMb3l0LKT7zlwxZW47fXh
	CBSVwU3p6GigWynUvSHHlcGDuK4PwB+P6cn+uDrw6n1usdJCJGpu67kJSVDLOmyeEsj5fPRV+DS/8
	69YDl2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7rm-0000000E4s3-49L7;
	Fri, 10 Jan 2025 05:47:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7kT-0000000E3HC-3NFw;
	Fri, 10 Jan 2025 05:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBAAA5C5D7D;
	Fri, 10 Jan 2025 05:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21CD4C4CEF5;
	Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736487596;
	bh=8ZRw3syLVNYKAZHbvSYXlq0vVH0Cy1rPscvTJmdz8Ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LkN4DSzGs6FlTkGFlNGb407Ro6cFmDL89x1QBZIH/zL3lutCt5/HY7EpCDSUdbGqV
	 HN36Ij4tYzJKdaaOI+4Cf+jR4l2lhUdxnCI99S5CqEIrGk+pta2J/n+AFwmaBp7OdZ
	 Wh30MbzZZ5s62XOoXl7TVu4AthZZnA0hv9kXIfCWRf0UV73Cribo0Ju5nJh3Y8IgeK
	 UVT6DWotEy9jLM1UFYPeECYe8xnREnGYnSPck3vFguFcFIbR7n1j20EL20Y+yHAZrM
	 Qxx1AgCpspnS4qH4z5UOqQohHTBgrbG/3w7ZblakF0evQyaGDExnGemo3P1uhgdPwx
	 xqjH8L4Crrqsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F16E77188;
	Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:58 +0800
Subject: [PATCH 08/11] drm: meson: add hdmitx vmode timing support for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-8-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=13515;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=LUyI3uauXSbgx+44CE2avmgLudmjXAgvYaFzCLYO4dg=;
 b=b2kywszPo9FhOjdnZxbuQsTAluRutnZmUFDo8KF25E1GNv4T2fnh6TLRqUPuHNDyIWq0QmpDX
 V6X75yGyvmcBlA/FWBI4oQ+m51rmR48NlnO1h29lGgrUh6URt0qzD/g
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_213957_935002_3E235AA2 
X-CRM114-Status: GOOD (  15.96  )
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
Reply-To: ao.xu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ao Xu <ao.xu@amlogic.com>

Introduce support for HDMI TX video mode (vmode) timing in the
Meson VENC driver for the Amlogic S4 SoC. These updates enable
reliable HDMI output with correct timing for S4 devices.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 334 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 328 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 5c461b27ae49317d8f430dc55606c8e11a536240..58e8e3bc854070ba152ee6dd4abde38ee1e28266 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -68,6 +68,12 @@
 #define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbc offset in data sheet */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 offset in data sheet */
 
+/* ANA Registers */
+#define CLKCTRL_SYS_CLK_EN0_REG2	0x04c /* 0x13 offset in data sheet */
+#define ANACTRL_HDMIPHY_CTRL0		0x200 /* 0x80 */
+#define ANACTRL_VDAC_CTRL0		0x2c0 /* 0xb0 offset in data sheet */
+#define ANACTRL_VDAC_CTRL1		0x2c4 /* 0xb1 offset in data sheet */
+
 struct meson_cvbs_enci_mode meson_cvbs_enci_pal = {
 	.mode_tag = MESON_VENC_MODE_CVBS_PAL,
 	.hso_begin = 3,
@@ -228,6 +234,52 @@ static union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
 	},
 };
 
+static union meson_hdmi_venc_mode meson_s4_hdmi_encp_mode_480p = {
+	.encp = {
+		.dvi_settings = 0x21,
+		.video_mode = 0x4000,
+		.video_mode_adv = 0x8,
+		.video_prog_mode = 0,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 7,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		.video_filt_ctrl = 0x2052,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 244,
+		.yfp2_htime = 1630,
+		.max_pxcnt = 857,
+		.hspuls_begin = 0x22,
+		.hspuls_end = 0xa0,
+		.hspuls_switch = 88,
+		.vspuls_begin = 0,
+		.vspuls_end = 1589,
+		.vspuls_bline = 0,
+		.vspuls_eline = 5,
+		.havon_begin = 122,
+		.havon_end = 841,
+		.vavon_bline = 36,
+		.vavon_eline = 515,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 0,
+		.hso_end = 62,
+		.vso_begin = 30,
+		.vso_end = 50,
+		.vso_bline = 0,
+		/* vso_eline */
+		.sy_val = 8,
+		.sy_val_present = true,
+		.sy2_val = 0x1d8,
+		.sy2_val_present = true,
+		.max_lncnt = 524,
+	},
+};
+
 static union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
 	.encp = {
 		.dvi_settings = 0x21,
@@ -320,6 +372,52 @@ static union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
 	},
 };
 
+static union meson_hdmi_venc_mode meson_s4_hdmi_encp_mode_576p = {
+	.encp = {
+		.dvi_settings = 0x21,
+		.video_mode = 0x4000,
+		.video_mode_adv = 0x8,
+		.video_prog_mode = 0,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 7,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		.video_filt_ctrl = 0x52,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 235,
+		.yfp2_htime = 1674,
+		.max_pxcnt = 863,
+		.hspuls_begin = 0,
+		.hspuls_end = 0x80,
+		.hspuls_switch = 88,
+		.vspuls_begin = 0,
+		.vspuls_end = 1599,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 132,
+		.havon_end = 851,
+		.vavon_bline = 44,
+		.vavon_eline = 619,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 0,
+		.hso_end = 64,
+		.vso_begin = 30,
+		.vso_end = 50,
+		.vso_bline = 5,
+		/* vso_eline */
+		.sy_val = 8,
+		.sy_val_present = true,
+		.sy2_val = 0x1d8,
+		.sy2_val_present = true,
+		.max_lncnt = 624,
+	},
+};
+
 static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
 	.encp = {
 		.dvi_settings = 0x2029,
@@ -362,6 +460,48 @@ static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
 	},
 };
 
+static union meson_hdmi_venc_mode meson_s4_hdmi_encp_mode_720p60 = {
+	.encp = {
+		.dvi_settings = 0x2029,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x18,
+		/* video_prog_mode */
+		/* video_sync_mode */
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 648,
+		.yfp2_htime = 3207,
+		.max_pxcnt = 1649,
+		.hspuls_begin = 80,
+		.hspuls_end = 240,
+		.hspuls_switch = 80,
+		.vspuls_begin = 688,
+		.vspuls_end = 3248,
+		.vspuls_bline = 4,
+		.vspuls_eline = 8,
+		.havon_begin = 260,
+		.havon_end = 1539,
+		.vavon_bline = 29,
+		.vavon_eline = 749,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 0,
+		.hso_end = 168,
+		.vso_begin = 168,
+		.vso_end = 256,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 749,
+	},
+};
+
 static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
 	.encp = {
 		.dvi_settings = 0x202d,
@@ -407,6 +547,51 @@ static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
 	},
 };
 
+static union meson_hdmi_venc_mode meson_s4_hdmi_encp_mode_720p50 = {
+	.encp = {
+		.dvi_settings = 0x202d,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x407,
+		.video_sync_mode_present = true,
+		.video_yc_dly = 0,
+		.video_yc_dly_present = true,
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 648,
+		.yfp2_htime = 3207,
+		.max_pxcnt = 1979,
+		.hspuls_begin = 80,
+		.hspuls_end = 240,
+		.hspuls_switch = 80,
+		.vspuls_begin = 688,
+		.vspuls_end = 3248,
+		.vspuls_bline = 4,
+		.vspuls_eline = 8,
+		.havon_begin = 260,
+		.havon_end = 1539,
+		.vavon_bline = 25,
+		.vavon_eline = 744,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 0,
+		.hso_end = 40,
+		.vso_begin = 30,
+		.vso_end = 50,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 749,
+	},
+};
+
 static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
 	.encp = {
 		.dvi_settings = 0x2029,
@@ -456,6 +641,55 @@ static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
 	},
 };
 
+static union meson_hdmi_venc_mode meson_s4_hdmi_encp_mode_1080i60 = {
+	.encp = {
+		.dvi_settings = 0x2029,
+		.video_mode = 0x5ffc,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x207,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		.video_ofld_voav_ofst = 0x11,
+		.video_ofld_voav_ofst_present = true,
+		.yfp1_htime = 516,
+		.yfp2_htime = 4355,
+		.max_pxcnt = 2199,
+		.hspuls_begin = 88,
+		.hspuls_end = 264,
+		.hspuls_switch = 88,
+		.vspuls_begin = 440,
+		.vspuls_end = 2200,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 192,
+		.havon_end = 2111,
+		.vavon_bline = 20,
+		.vavon_eline = 559,
+		.eqpuls_begin = 2288,
+		.eqpuls_begin_present = true,
+		.eqpuls_end = 2464,
+		.eqpuls_end_present = true,
+		.eqpuls_bline = 0,
+		.eqpuls_bline_present = true,
+		.eqpuls_eline = 4,
+		.eqpuls_eline_present = true,
+		.hso_begin = 0,
+		.hso_end = 44,
+		.vso_begin = 30,
+		.vso_end = 50,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
 static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
 	.encp = {
 		.dvi_settings = 0x202d,
@@ -505,6 +739,55 @@ static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
 	},
 };
 
+static union meson_hdmi_venc_mode meson_s4_hdmi_encp_mode_1080i50 = {
+	.encp = {
+		.dvi_settings = 0x202d,
+		.video_mode = 0x5ffc,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x7,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		.video_ofld_voav_ofst = 0x11,
+		.video_ofld_voav_ofst_present = true,
+		.yfp1_htime = 526,
+		.yfp2_htime = 4365,
+		.max_pxcnt = 2639,
+		.hspuls_begin = 88,
+		.hspuls_end = 264,
+		.hspuls_switch = 88,
+		.vspuls_begin = 440,
+		.vspuls_end = 2200,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 192,
+		.havon_end = 2111,
+		.vavon_bline = 20,
+		.vavon_eline = 559,
+		.eqpuls_begin = 2288,
+		.eqpuls_begin_present = true,
+		.eqpuls_end = 2464,
+		.eqpuls_end_present = true,
+		.eqpuls_bline = 0,
+		.eqpuls_bline_present = true,
+		.eqpuls_eline = 4,
+		.eqpuls_eline_present = true,
+		.hso_begin = 0,
+		.hso_end = 44,
+		.vso_begin = 30,
+		.vso_end = 50,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
 static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
 	.encp = {
 		.dvi_settings = 0xd,
@@ -816,10 +1099,12 @@ static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
 	},
 };
 
-static struct meson_hdmi_venc_vic_mode {
+struct meson_hdmi_venc_vic_mode {
 	unsigned int vic;
 	union meson_hdmi_venc_mode *mode;
-} meson_hdmi_venc_vic_modes[] = {
+};
+
+static struct meson_hdmi_venc_vic_mode meson_hdmi_venc_vic_modes[] = {
 	{ 6, &meson_hdmi_enci_mode_480i },
 	{ 7, &meson_hdmi_enci_mode_480i },
 	{ 21, &meson_hdmi_enci_mode_576i },
@@ -845,6 +1130,23 @@ static struct meson_hdmi_venc_vic_mode {
 	{ 0, NULL}, /* sentinel */
 };
 
+static struct meson_hdmi_venc_vic_mode meson_s4_hdmi_venc_vic_modes[] = {
+	{ 2, &meson_s4_hdmi_encp_mode_480p },
+	{ 3, &meson_s4_hdmi_encp_mode_480p },
+	{ 17, &meson_s4_hdmi_encp_mode_576p },
+	{ 18, &meson_s4_hdmi_encp_mode_576p },
+	{ 4, &meson_s4_hdmi_encp_mode_720p60 },
+	{ 19, &meson_s4_hdmi_encp_mode_720p50 },
+	{ 5, &meson_s4_hdmi_encp_mode_1080i60 },
+	{ 20, &meson_s4_hdmi_encp_mode_1080i50 },
+	{ 32, &meson_hdmi_encp_mode_1080p24 },
+	{ 33, &meson_hdmi_encp_mode_1080p50 },
+	{ 34, &meson_hdmi_encp_mode_1080p30 },
+	{ 31, &meson_hdmi_encp_mode_1080p50 },
+	{ 16, &meson_hdmi_encp_mode_1080p60 },
+	{ 0, NULL}, /* sentinel */
+};
+
 static signed int to_signed(unsigned int a)
 {
 	if (a <= 7)
@@ -882,6 +1184,9 @@ bool meson_venc_hdmi_supported_vic(struct meson_drm *priv, int vic)
 {
 	struct meson_hdmi_venc_vic_mode *vmode = meson_hdmi_venc_vic_modes;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		vmode = meson_s4_hdmi_venc_vic_modes;
+
 	while (vmode->vic && vmode->mode) {
 		if (vmode->vic == vic)
 			return true;
@@ -921,6 +1226,9 @@ static union meson_hdmi_venc_mode *meson_venc_hdmi_get_vic_vmode(struct meson_dr
 {
 	struct meson_hdmi_venc_vic_mode *vmode = meson_hdmi_venc_vic_modes;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		vmode = meson_s4_hdmi_venc_vic_modes;
+
 	while (vmode->vic && vmode->mode) {
 		if (vmode->vic == vic)
 			return vmode->mode;
@@ -932,6 +1240,8 @@ static union meson_hdmi_venc_mode *meson_venc_hdmi_get_vic_vmode(struct meson_dr
 
 bool meson_venc_hdmi_venc_repeat(struct meson_drm *priv, int vic)
 {
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		return false;
 	/* Repeat VENC pixels for 480/576i/p, 720p50/60 and 1080p50/60 */
 	if (vic == 6 || vic == 7 || /* 480i */
 	    vic == 21 || vic == 22 || /* 576i */
@@ -1957,12 +2267,19 @@ void meson_venc_enable_vsync(struct meson_drm *priv)
 		writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
 			       priv->io_base + _REG(VENC_INTCTRL));
 	}
-	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), BIT(25));
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		regmap_update_bits(priv->clkctrl, CLKCTRL_SYS_CLK_EN0_REG2, BIT(4), BIT(4));
+	else
+		regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), BIT(25));
 }
 
 void meson_venc_disable_vsync(struct meson_drm *priv)
 {
-	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), 0);
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		regmap_update_bits(priv->clkctrl, CLKCTRL_SYS_CLK_EN0_REG2, BIT(4), 0);
+	else
+		regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), 0);
 	writel_relaxed(0, priv->io_base + _REG(VENC_INTCTRL));
 }
 
@@ -1972,6 +2289,9 @@ void meson_venc_init(struct meson_drm *priv)
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 8);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL0, 0);
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL1, 8);
 	} else {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
@@ -1981,8 +2301,10 @@ void meson_venc_init(struct meson_drm *priv)
 	writel_relaxed(0xff, priv->io_base + _REG(VENC_VDAC_SETTING));
 
 	/* Disable HDMI PHY */
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
-
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL0, 0);
+	else
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
 	/* Disable HDMI */
 	writel_bits_relaxed(VPU_HDMI_ENCI_DATA_TO_HDMI |
 			    VPU_HDMI_ENCP_DATA_TO_HDMI, 0,

-- 
2.43.0



