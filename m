Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoleB9uM4R4PMRS34WZ1f0fiJir4Q2Sjr/UasdJ2o3c=; b=seUVZjQojXzU41DlOGoJ3sV9B7
	w8uv/NLj8F9nmnzZfSyDJ3Gq6QkPSAP+SK2VXValZjY0uzwokLDb01SwAKtoiuB0Vlan4duLuHYOu
	hoFtV7P50/pgh6+IXr3kjDubLtyF5vT07bIMgcrgywuB+3T/k6rON9eVfKXxfLs0HKNKFOyMkgQ15
	X1+03IHdCQ+WZNthdAcmgZ9H7awdfl4LGYQiZ94Qc1nra67soDDfl0oO63l6sgDkj0LhGaDXJsXtW
	mvOpnjCgvhNuyDUEjvpp5nzyH5uSHip8syIQU+hfAMHUFIfvyqcJXZN17BIw8P6lbGkLxsQJGlf5C
	/AdNcInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLgl-0000000BliR-3KGf;
	Tue, 17 Dec 2024 00:43:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLdb-0000000BkcE-0AoM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 00:40:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54026562221so4914797e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 16:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396033; x=1735000833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoleB9uM4R4PMRS34WZ1f0fiJir4Q2Sjr/UasdJ2o3c=;
        b=kBG/EZt7iA9w3tnXrr5EDy/Yma3WMfngEAOCyhVNgB2VlMuq2Hsgd7itBUPgt/VHQG
         17tlTBGBzoZsLkz6mgLRBL64W2CJzOvMNddjc0X70xmjI5h6AI9Ampr5/fy8pJXxjQMK
         DbF3lxz/e76OXCN++h39jWVC3N2Ocphyr+UhkRNnFjzrHbJp2WBrBVHvOLp+dBY7Qw6O
         TcZd1BgI5IZ5tU+JFQMgiDnYocB7kxhaJ80JkNxoRupYVzI/uhGg+o8p0v827sF05MHg
         cBNa5Y+D7k5A6lXeUM5GsXomL/6zCkoSxdWhaAOelzwnu0j9oxL+OCmZztEOr10yBKIc
         WQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396033; x=1735000833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoleB9uM4R4PMRS34WZ1f0fiJir4Q2Sjr/UasdJ2o3c=;
        b=kr1kXwWXS0oyp2FQHkpP3bO1JkC886e5nGBNXSBeTslSnfh7I5Ik79BmLrkKrn8os2
         W6OzdWzPBJRxerKEKIb8wghTgx7zywhBfXSv6ErV+QeDESi8I6lVGzGW1ZUtOTgX90mQ
         zbp3imd4NiQD56ftbvLgN3sf8uLoD4iL5w+r1tYtcCcjAULDssWc2O1DMygrSAdauEu8
         gOmYa2kEv69ggWC7tBLJU0UnsEn9MCcpz+pIgQeGkdyz/AVZaVvb25RslsNovk13zF4M
         h4emzgbFTYora/BqQWbO8s8TZYnPCOf2zSaIlgI7WodfLlOIAnlNRIVzdnfxwcsHrrkQ
         dcxA==
X-Forwarded-Encrypted: i=1; AJvYcCVxvNEpoprXZT8hu6EPlHePg3+5VEmX9sL/WC3evnTQBLFb0Ae/+O08xtmAId7MSXKVD7eWSUoY+cIEFF7EwlnT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7kZmKu+94r2Ve/8OYhhrSouRx7qzFlU6M+hSA3+jhRyjaHeEF
	jPROeiLwMhGr0ii9KamNRGlwPZqIkXbNkos2ETrECknIqT3fSs+ilNv3joxmtbY=
X-Gm-Gg: ASbGnctfUh4W3r2WluodEtO0lp4YHuxaXlHYtkOUZkQJG6OhR9DctlXwd9b/1SWwjeG
	54gQmzu0ZcKtazcHG411uZKolyn8A5R4vfz9oMNSa4QljVDMb1XusvjIvCoGWYM+JgY+4TVr+eE
	vY3nBmrSu5BnoL/NCthY+Ewkel9xycaFueoCDXuG8gRZ8IJr+qtuX90jlRRagshf04HCzM0hQxu
	QUG3h9ldbGQQUcYiKJs74LUuxOVnEPHNsBEwmCoQomktVNRfhcK4jXJYsEkuSka
X-Google-Smtp-Source: AGHT+IEiSo9Wl/lWfsmvhuI0Gto3Mw3bw0fKfynOQQ2ZWh0KzytbD2EhIA/Z6iIDmTScHkdcwFEI/Q==
X-Received: by 2002:a05:6512:3d8a:b0:540:5253:9673 with SMTP id 2adb3069b0e04-54090555489mr4334707e87.22.1734396033102;
        Mon, 16 Dec 2024 16:40:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:24 +0200
Subject: [PATCH v7 02/10] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-2-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8709;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FOrB9GsEuPUo6Wc8cmeLxms9yMBFdVb5QgBc0yAL/uw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh4h34iUrr5Pqub6AQ/PVcknATTph6iYunkl
 rGQ+SZgSamJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeAAKCRCLPIo+Aiko
 1Y63CACMX7xPucHOpjPW3jbL27EKQ3Uo2688xILJtGJuWpmZHoQ4GoXUZw9wslBVRKQ5bvquWmo
 e2BfMKQ3TxvUnuBo/tfRI1AanHC10kSQHopoIdTmzscLx/oMoq5O3dqBMt04Fhmpm+WcX+R8GNY
 eSWKjOYl0AYjes2jlsHPKkJPcG+dTpOgyRBgvefv1BVidPaQwL68YPph99QOE7HMq8ee0+DBFm4
 9qFwGOA5S/VHYe64x3W/DEUL2QlHy1wleU3oq1jmd5Wh0APQPpV/8dD4XuvWgd+gouK52crwotE
 VXQeB9Zq7iogJY/hnjlaJE5wZlbPTpALVOgLtaWvcD7lEZv+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164035_084001_03067481 
X-CRM114-Status: GOOD (  16.29  )
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

The no_capture_mute flag might differ from platform to platform,
especially in the case of the wrapping implementations, like the
upcoming DRM HDMI Codec framework. Move the flag next to all other flags
in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c   | 2 +-
 drivers/gpu/drm/bridge/sii902x.c       | 2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c   | 2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c    | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 drivers/gpu/drm/sti/sti_hdmi.c         | 2 +-
 include/sound/hdmi-codec.h             | 4 +---
 sound/soc/codecs/hdmi-codec.c          | 2 +-
 10 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 940083e5d2ddbfc56f14e2bdc6ddd0b9dd50b1f8..7734e389ca7692f7880aa9b8650e45aab228c7fd 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1466,7 +1466,6 @@ static const struct hdmi_codec_ops it66121_audio_codec_ops = {
 	.audio_shutdown = it66121_audio_shutdown,
 	.mute_stream = it66121_audio_mute,
 	.get_eld = it66121_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
@@ -1476,6 +1475,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 		.i2s = 1, /* Only i2s support for now */
 		.spdif = 0,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dev_dbg(dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index a02d30c0ba4221d7fee0eb50892ab4d8e8436004..2a0af0f09defa2994ddece755ecf9742b418473b 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -841,7 +841,6 @@ static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
 	.mute_stream = sii902x_audio_mute,
 	.get_eld = sii902x_audio_get_eld,
 	.get_dai_id = sii902x_audio_get_dai_id,
-	.no_capture_mute = 1,
 };
 
 static int sii902x_audio_codec_init(struct sii902x *sii902x,
@@ -864,6 +863,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		.i2s = 1, /* Only i2s support for now. */
 		.spdif = 0,
 		.max_i2s_channels = 0,
+		.no_capture_mute = 1,
 	};
 	u8 lanes[4];
 	int num_lanes, i;
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7a57d4a23e410db1d4d3a11bb9285d34c784f2d5..176fd88717597c37824fbf825ca6b893b083e0ca 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1660,7 +1660,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int hdmi_register_audio_device(struct hdmi_context *hdata)
@@ -1669,6 +1668,7 @@ static int hdmi_register_audio_device(struct hdmi_context *hdata)
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 6,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	hdata->audio.pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 57ce77c2be2458fff5b752332ae51e016582ddca..82d4a4e206a584e045a8fcd593fc12b7c1257bfe 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1165,7 +1165,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = tda998x_audio_shutdown,
 	.mute_stream = tda998x_audio_mute_stream,
 	.get_eld = tda998x_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int tda998x_audio_codec_init(struct tda998x_priv *priv,
@@ -1176,6 +1175,7 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 		.max_i2s_channels = 2,
 		.no_i2s_capture = 1,
 		.no_spdif_capture = 1,
+		.no_capture_mute = 1,
 	};
 
 	if (priv->audio_port_enable[AUDIO_ROUTE_I2S])
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 36713c176cfcf1af2d365280700d06f4c1239e09..5c805094daf6d4678355fec43648552b34508bec 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2615,7 +2615,6 @@ static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
 	.audio_shutdown = mtk_dp_audio_shutdown,
 	.get_eld = mtk_dp_audio_get_eld,
 	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int mtk_dp_register_audio_driver(struct device *dev)
@@ -2626,6 +2625,7 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 		.max_i2s_channels = 8,
 		.i2s = 1,
 		.data = mtk_dp,
+		.no_capture_mute = 1,
 	};
 
 	mtk_dp->audio_pdev = platform_device_register_data(dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 70dc1d4460adfc04b5c40263d11184aae826c658..ca82bc829cb96446d4d34eeef45848df03bd716b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1660,7 +1660,6 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.mute_stream = mtk_hdmi_audio_mute,
 	.get_eld = mtk_hdmi_audio_get_eld,
 	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int mtk_hdmi_register_audio_driver(struct device *dev)
@@ -1671,6 +1670,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 		.max_i2s_channels = 2,
 		.i2s = 1,
 		.data = hdmi,
+		.no_capture_mute = 1,
 	};
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b76337f690ec2fdfbf4dac08a04aa4de4eff257f..b17de83b988b1f1afb2f6d12b1d155761ff9ca50 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -885,7 +885,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.mute_stream = cdn_dp_audio_mute_stream,
 	.get_eld = cdn_dp_audio_get_eld,
 	.hook_plugged_cb = cdn_dp_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
@@ -896,6 +895,7 @@ static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
 		.spdif = 1,
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dp->audio_pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index f8bbae6393ef8c0bd1deb75d1e131c1d83c1ebfe..ca2fe17de4a5d1e0199e59a97e6c7601e139ed9e 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1237,7 +1237,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int sti_hdmi_register_audio_driver(struct device *dev,
@@ -1247,6 +1246,7 @@ static int sti_hdmi_register_audio_driver(struct device *dev,
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 8,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	DRM_DEBUG_DRIVER("\n");
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index b3407b47b4a7878532ecf3b08eeecd443d6fdb07..b220072cfa1baf503efbe2d530d7e8392dc16603 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -115,9 +115,6 @@ struct hdmi_codec_ops {
 	int (*hook_plugged_cb)(struct device *dev, void *data,
 			       hdmi_codec_plugged_cb fn,
 			       struct device *codec_dev);
-
-	/* bit field */
-	unsigned int no_capture_mute:1;
 };
 
 /* HDMI codec initalization data */
@@ -129,6 +126,7 @@ struct hdmi_codec_pdata {
 	uint spdif:1;
 	uint no_spdif_playback:1;
 	uint no_spdif_capture:1;
+	uint no_capture_mute:1;
 	int max_i2s_channels;
 	void *data;
 };
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index f536ca60e162dca6b50b37854ca6de2c114bc2a1..69f98975e14ae367f482862724a358eb138ebf6a 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -714,7 +714,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
 	 */
 	if (hcp->hcd.ops->mute_stream &&
 	    (direction == SNDRV_PCM_STREAM_PLAYBACK ||
-	     !hcp->hcd.ops->no_capture_mute))
+	     !hcp->hcd.no_capture_mute))
 		return hcp->hcd.ops->mute_stream(dai->dev->parent,
 						 hcp->hcd.data,
 						 mute, direction);

-- 
2.39.5


