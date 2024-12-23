Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8043E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIOMv/ZX7DfnjB481tjdJsECxraC80hKmeHfTaJarPE=; b=NJyHJ50OSXr3s2uo8bh7XZ+N6V
	mNsrQD5Taz+XZ133qtGl8Heyx82J0zaMMyqfU9wMFuYdGDYGOPJIbacDirHLRdwl/5AZBCyGNWuzM
	sPfZUB9oGUfmD+MFJ6SYPjfsaBuceaOR7qXFGhyu14SvuXiytrXwMTf6ZJlqx2LJQFqpCfej85bSx
	VGdSZw7f3xRb0DwzmXgBJO7j1EwNqGUU3JC4azHmYErU4Trri82W9NRJKKJ3HwoUsnyY/RIitQWHQ
	fqKS86lAmqRahXgzBZfgdnDpOgUXMv2jFctHjaNhpISneLsabg4YjgrC0UEGV80lNmSrVP576aqBH
	jNaSTU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYpU-00000009EYR-408V;
	Mon, 23 Dec 2024 03:10:00 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYfB-00000009Bz6-2nq4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:22 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso48240911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 18:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922760; x=1735527560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIOMv/ZX7DfnjB481tjdJsECxraC80hKmeHfTaJarPE=;
        b=nmcRW2dApGMxgkBjKpPW2hYhQoIkty+jy/xlJyLA8Pfy3DIOICVxwQ0/DUHFfBcScu
         Uy0mVwtuDAg3wju/+n4cI8fimrESl7x+TeIzVwJe90x5csZ/2rzThP13/YtyT0FKlln7
         Q/hl3phaEWHn6oe2EIFkBPM25+N0P22DM/bo4Ik0XrU7KOMifGCNCKsnbcmQ+ESBZZq1
         PU8TXC3gUKjQVw3mbcd6cjnc0X0WJyTdpvbYRSZhCUD2BG2HnHu8i9DGaih6ddEMCFaB
         cObqJxn58+R+O//4nHNzeeEbqEM3XeXswoSqCNKp8vm+Bx1IH7bzLAekhmebeCYq/wTN
         myPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922760; x=1735527560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIOMv/ZX7DfnjB481tjdJsECxraC80hKmeHfTaJarPE=;
        b=u2jHbDBN9EIyP0YHAK9q2RnhpgTS/FNDIrLeCm552pReZg25HhjnrVhJM6HjWhGSw2
         92gqZhKqgYIXVCIzVSOb+KDTnCoPs6ZFD5NJoivYe1JkQZZoUQYBhVUYj7J3IZNOeg4w
         PRb625PlvMXXBgZDnXroZq6Y8+71L9PJzsr0pjypsw/WntODnjiQbiBRfEN1LMfC4v7e
         OZOtycFV51teIDWRHYnIQQprIAu2I5osENGnZn8vfGODuid4odDBvfAfGASsoD8+5QkB
         1e34FDYkfN18HxCJ7WJdeqvyZcSF8WPSpkq9W6p7FhdVXaBrOfF/3DHVGz89aUdjI7Oa
         fHmg==
X-Forwarded-Encrypted: i=1; AJvYcCXde96ns3kArLmwcBydJ+AxPhMXCKbQ6xvoFEC1sKY0rFHDIdG0lh+JBuk7PciXbeU5DcMB1k+Ze4s4NAS/qfBc@lists.infradead.org
X-Gm-Message-State: AOJu0YziozwEZ9CUt7CN3y30j1/rmp9N8DmpAFTmm4nfx7+Qofj+Upf/
	tH+Nt0DPdP/XPyXk4Hbrrrf2RzVsxvj/SbaPWUBVL8SikPAFxOBhKFbikMWxQ0E=
X-Gm-Gg: ASbGncs8G8l7SlNfMClGqa4XxwRWp5BNjrXiwDLlDhpHpuRPvnZNQvSsY5F3N3Avp8p
	YBl79b1V6+DCRrCKE2aT1oJCUMn0UXwOnS1+I0l3rRApNUEpXGt/P+hSkYt++mg8O74jX6xSx2X
	H+gNxdpdmuR1I3ylV3O9DKUsCfBZhQyKcTQDeIQJTfuoNVIJ6pvrjixyw0i4Up+CIhilWa//Wes
	AFV0SEceZEbRL85RtgU5+F4cigxSURK7IetxY3f0pQatqd21rZoC0yjyjKyjslh
X-Google-Smtp-Source: AGHT+IF29fGSwjDuO2lT/HKPdLTtxV1DjZjhv/UHw/U7a5hJJxzd/nVxbT5mqutiPlcJSuC/BdRjKQ==
X-Received: by 2002:a05:6512:10c3:b0:542:23a9:bd2f with SMTP id 2adb3069b0e04-5422954d7fbmr2800003e87.29.1734922759686;
        Sun, 22 Dec 2024 18:59:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:59 +0200
Subject: [PATCH v9 08/10] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-8-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FQQ7Ux5POC+XmasT6HD/kMeYFfKPQf2L4EdJSjEp530=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHx5S6dCQLh7PjI3tkAt37A/fwO3ghHt/Z+K
 AmXGpTG1h2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1eyUB/9CSmk94x8hc7aV/34jscAVeqoxLoOP2faD/9JVeuU0/TAT9fAFG/NE6lC/uwazgcImECf
 FdWa8PwGfz1d6aGJKKOiGKrg2tsVAJMc+38rQQSwM692YnHVseqJMB0uW9ImP3gaE8yK/rTX4TM
 jRHKmhHVV+MSzSFAOSKEogY+jTzdpll3zVmv+D0ZNTuMR3IGKraIVJde1BNfT6d7P6OphO/kX30
 8U2gtCoY2yjCyn4FZyaOv+1cFApkgKMQNJSvzMEHGhRXv2PXthM1R3b47TMwW/d2tWEk60K3Va4
 lN8m8Ltfocm0FMQufbJfXCt8wk9nlsAhcb6u1gtZK96Meh5c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185921_713353_9C511C08 
X-CRM114-Status: GOOD (  18.33  )
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

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/Kconfig    |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 73 +++++++++++-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 3 files changed, 19 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index c5f30b317698a1285ae14c07c0f12a2ceb08dde4..6cc7b7e6294a1bfa54137ca65296cd47e46b1e1e 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -10,6 +10,7 @@ config DRM_VC4
 	depends on COMMON_CLK
 	depends on PM
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 203293a8beca738dbfeaaf15f350026e263e646b..24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -584,6 +584,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
@@ -609,6 +610,12 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
+					    &vc4_hdmi_audio_funcs,
+					    8, false, -1);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -1921,9 +1928,9 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 	return true;
 }
 
-static int vc4_hdmi_audio_startup(struct device *dev, void *data)
+static int vc4_hdmi_audio_startup(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int ret = 0;
@@ -1985,9 +1992,9 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
+static void vc4_hdmi_audio_shutdown(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2057,13 +2064,12 @@ static int sample_rate_to_mai_fmt(int samplerate)
 }
 
 /* HDMI audio codec callbacks */
-static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
+static int vc4_hdmi_audio_prepare(struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -2075,7 +2081,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	int ret = 0;
 	int idx;
 
-	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+	dev_dbg(&vc4_hdmi->pdev->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -2214,40 +2220,12 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
-static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
-				  uint8_t *buf, size_t len)
-{
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	mutex_lock(&connector->eld_mutex);
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&connector->eld_mutex);
-
-	return 0;
-}
-
-static const struct hdmi_codec_ops vc4_hdmi_codec_ops = {
-	.get_eld = vc4_hdmi_audio_get_eld,
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
+	.startup = vc4_hdmi_audio_startup,
 	.prepare = vc4_hdmi_audio_prepare,
-	.audio_shutdown = vc4_hdmi_audio_shutdown,
-	.audio_startup = vc4_hdmi_audio_startup,
-};
-
-static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
-	.ops = &vc4_hdmi_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
+	.shutdown = vc4_hdmi_audio_shutdown,
 };
 
-static void vc4_hdmi_audio_codec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
-	vc4_hdmi->audio.codec_pdev = NULL;
-}
-
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2255,7 +2233,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index, len;
 	int ret;
@@ -2348,20 +2325,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
-	codec_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-						   PLATFORM_DEVID_AUTO,
-						   &vc4_hdmi_codec_pdata,
-						   sizeof(vc4_hdmi_codec_pdata));
-	if (IS_ERR(codec_pdev)) {
-		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
-		return PTR_ERR(codec_pdev);
-	}
-	vc4_hdmi->audio.codec_pdev = codec_pdev;
-
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2374,7 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	dai_link->stream_name = "MAI PCM";
 	dai_link->codecs->dai_name = "i2s-hifi";
 	dai_link->cpus->dai_name = dev_name(dev);
-	dai_link->codecs->name = dev_name(&codec_pdev->dev);
+	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b2424a21da230db99db207efa293417faccd254d..e3d989ca302b72533c374dfa3fd0d5bd7fe64a82 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -104,8 +104,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
-	struct hdmi_audio_infoframe infoframe;
-	struct platform_device *codec_pdev;
 	bool streaming;
 };
 

-- 
2.39.5


