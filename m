Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACCCC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zfr1FxKnwbpctfjbuiNE4yeSOO96FeDYnCjvLxn2mhs=; b=T2ldwbRdXEt4F90gAtYBGz01E0
	FTlw7Ks2nrfkaPsYUBfhEbkPDuXSiRlhyqIsJkJizYILFi13pOY3SpDNomFbLpZO+XQlSwnH79Ax8
	68yhhwPRiQMgcggzIIdyL++iHmaB92eTip1h9TCxXxHI03OlMAVsLRtx7uRY7DfzrbPPEc+fkDDoR
	gTCI6pqvm2vB7n4LYSz0GmBgIPoS/E5mLPB+FhQYM9V++rv5WwMSkOul30hThMz0Xg9Yt+8H/K3i3
	5474bR7cPFw2GlbHeYWyyH6ut9BsjJAqTjqTC5bG1DjqXQpCQvS6mxX661ckpzPyzm9iYDiGKNuAo
	3zA2eiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1jh-0000000FAiL-34aR;
	Thu, 23 Jul 2026 22:17:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1jP-0000000FAGE-3WkF;
	Thu, 23 Jul 2026 22:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845043;
	bh=5Emg1P7aYnNrqvJHMMWV75eJl4VXwFOwz5WWzAJ6RkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BjLed+NDJXf0Od7gN0zdmz6BapBZZYkTxWx7ILW94N8rQjV7TZ0FMHU/+xSJNw/GU
	 zqrLz2K2h0KAAsec0n4woW3OQT9Am5Lq/v/H2VsnDzY2W16wvX6S+ikBbjosgQTZo6
	 pxHAhU/Smei+047pEEmFOg91BgTb8PLCeLR87jmR9K5mzqUhgjsTHA0nEtzXyTS1v8
	 yPEcGGhlrLnqJUHU7pmSA/TggJYjkuc3F2TbEp/EIoCdjYa/iIPfr1NJH8mg6WES/5
	 0TCpVfI18jhBp4rTNyPNRiNNhzaLapcwCHudM2N28WFyU5IZjnqWJUixPjHO+kOh1R
	 WJMFTSE2PEaBw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2C6517E3C47;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 229B8480055; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:23 +0200
Subject: [PATCH v5 15/15] drm/bridge: synopsys: dw-dp: Add audio support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-15-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10614;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5Emg1P7aYnNrqvJHMMWV75eJl4VXwFOwz5WWzAJ6RkE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvGzNHFpT0lXO2Ybms2cKUkxzzgmssQmB
 uPXXIg2riFvGokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qaNNIP/2a3gy7XaaiaTc94q0exBbVAl7FaUsLPzzr0S86ZdtNLHPyXnELtiFtAN/ZQcFt6L2Y
 VZQtkS6Em+zkrpjyF2ZvS4XOJCdAKmk6Vvl3BbLnPe4kBRsnwcuTIJJOGC3dtIBB1/vuxdFTQ8c
 Z+vkyiOrLz2xFZtvxj0+JihiZmbELkNIGU7iKFcCyMA8+AEo3A4wPuM5vCbYtBrzKCZTAoAMlnR
 bNRnqPQcwelupU0GkzD00PMnUgU8reqqVFd9jtU3EfuplN/nLBiPoWMO1CV++MkaBfUuVUloAqP
 oTluOlpt1C+iJq4yJ+jf2nh1FH82lkluWVQPVmI3Mx73lDyktg5wnUT7aoXFBnKwPbmAoApG3NG
 KKJ9pyNB8k+OE4QbnCeSblwp5rX9co//tQWAvF+/UFGG25Mh9708i2RDW5zH77/Es46Txq/xKZU
 GWs0h7Mm/p/OeCeK/spX7Grbzi1M1QV+dsdlRlDBtWIrjRuh+9QTI+G6JIlc5pQ0mMGHIpeIFzT
 ECIGGLjB1tHF4zL68egDsKfJk8p+gmSf8VYjijU7zQfJjKoOOVr7q/AlDgzKnnoXyoHJ/H+fwbA
 sOJ8dexswwWt3Lmb3lO7ZT6lkOHgy8iAfSOLGihc45fK0mcvAYi55MhaSS+4Tjd5W+gaItguU58
 iqLsTFE2D+UcvZHVh2b0tew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_151732_206528_8C8CC999 
X-CRM114-Status: GOOD (  22.83  )
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

Implement audio support for the Synopsys DesignWare DisplayPort
controller.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 255 +++++++++++++++++++++++++++++++-
 1 file changed, 253 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 2bd37e5c36da..a9e04cee002e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -23,17 +23,21 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 #define DW_DP_VERSION_NUMBER			0x0000
 #define DW_DP_VERSION_TYPE			0x0004
 #define DW_DP_ID				0x0008
 
 #define DW_DP_CONFIG_REG1			0x0100
+#define AUDIO_SELECT				GENMASK(2, 1)
 #define DW_DP_CONFIG_REG2			0x0104
 #define DW_DP_CONFIG_REG3			0x0108
 
@@ -110,6 +114,10 @@
 #define HBR_MODE_ENABLE				BIT(10)
 #define AUDIO_DATA_WIDTH			GENMASK(9, 5)
 #define AUDIO_DATA_IN_EN			GENMASK(4, 1)
+#define AUDIO_DATA_IN_EN_CHANNEL12		BIT(0)
+#define AUDIO_DATA_IN_EN_CHANNEL34		BIT(1)
+#define AUDIO_DATA_IN_EN_CHANNEL56		BIT(2)
+#define AUDIO_DATA_IN_EN_CHANNEL78		BIT(3)
 #define AUDIO_INF_SELECT			BIT(0)
 
 #define DW_DP_SDP_VERTICAL_CTRL			0x0500
@@ -253,6 +261,8 @@
 
 #define SDP_REG_BANK_SIZE			16
 
+#define DW_DP_SDP_VERSION			0x12
+
 struct dw_dp_link_caps {
 	bool enhanced_framing;
 	bool tps3_supported;
@@ -305,6 +315,19 @@ struct dw_dp_hotplug {
 	bool long_hpd;
 };
 
+enum dw_dp_audio_interface_support {
+	DW_DP_AUDIO_I2S_ONLY = 0,
+	DW_DP_AUDIO_SPDIF_ONLY = 1,
+	DW_DP_AUDIO_I2S_AND_SPDIF = 2,
+	DW_DP_AUDIO_NONE = 3,
+};
+
+enum dw_dp_audio_interface {
+	DW_DP_AUDIO_I2S = 0,
+	DW_DP_AUDIO_SPDIF = 1,
+	DW_DP_AUDIO_UNUSED,
+};
+
 struct dw_dp {
 	struct drm_bridge bridge;
 	struct device *dev;
@@ -320,6 +343,9 @@ struct dw_dp {
 	int irq;
 	struct work_struct hpd_work;
 	struct dw_dp_hotplug hotplug;
+	enum dw_dp_audio_interface audio_interface;
+	int audio_channels;
+	int audio_sdp_nr;
 	/* Serialize hpd status access */
 	struct mutex irq_lock;
 	/* Serialize sdp_reg_bank access */
@@ -1073,7 +1099,19 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
 				EN_HORIZONTAL_SDP << nr);
 
-	return 0;
+	return nr;
+}
+
+static void dw_dp_clear_sdp(struct dw_dp *dp, int nr)
+{
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+			  EN_VERTICAL_SDP << nr);
+
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+			  EN_HORIZONTAL_SDP << nr);
+
+	scoped_guard(mutex, &dp->sdp_lock)
+		clear_bit(nr, dp->sdp_reg_bank);
 }
 
 static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
@@ -1890,6 +1928,205 @@ static void dw_dp_bridge_oob_notify(struct drm_bridge *bridge,
 		dev_err_once(dp->dev, "Missing platform handler for OOB HPD handling\n");
 }
 
+static int dw_dp_audio_infoframe_send(struct dw_dp *dp)
+{
+	struct hdmi_audio_infoframe frame;
+	struct dw_dp_sdp sdp;
+	int ret;
+
+	ret = hdmi_audio_infoframe_init(&frame);
+	if (ret < 0)
+		return ret;
+
+	frame.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	frame.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+	frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	frame.channels = dp->audio_channels;
+
+	ret = hdmi_audio_infoframe_pack_for_dp(&frame, &sdp.base, DW_DP_SDP_VERSION);
+	if (ret < 0)
+		return ret;
+
+	sdp.flags = DW_DP_SDP_VERTICAL_INTERVAL;
+
+	return dw_dp_send_sdp(dp, &sdp);
+}
+
+static int dw_dp_audio_startup(struct drm_bridge *bridge,
+			       struct drm_connector *connector)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	dev_dbg(dp->dev, "audio startup\n");
+
+	return pm_runtime_resume_and_get(dp->dev);
+}
+
+static void dw_dp_audio_unprepare(struct drm_bridge *bridge,
+				  struct drm_connector *connector)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	/* Disable all audio streams */
+	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1, AUDIO_DATA_IN_EN,
+			   FIELD_PREP(AUDIO_DATA_IN_EN, 0));
+
+	if (dp->audio_interface == DW_DP_AUDIO_SPDIF)
+		clk_disable_unprepare(dp->spdif_clk);
+	else if (dp->audio_interface == DW_DP_AUDIO_I2S)
+		clk_disable_unprepare(dp->i2s_clk);
+
+	dp->audio_interface = DW_DP_AUDIO_UNUSED;
+
+	dw_dp_clear_sdp(dp, dp->audio_sdp_nr);
+}
+
+static int dw_dp_audio_prepare(struct drm_bridge *bridge,
+			       struct drm_connector *connector,
+			       struct hdmi_codec_daifmt *daifmt,
+			       struct hdmi_codec_params *params)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+	u8 audio_data_in_en, supported_audio_interfaces;
+	enum dw_dp_audio_interface audio_interface;
+	u32 cfg1;
+	int ret;
+
+	/*
+	 * prepare might be called multiple times, so release the clocks
+	 * from previous calls to keep the calls in balance.
+	 */
+	if (dp->audio_interface != DW_DP_AUDIO_UNUSED)
+		dw_dp_audio_unprepare(bridge, connector);
+
+	/* The hardware is limited to 1,2 or 8 channels */
+	dp->audio_channels = params->cea.channels;
+	switch (params->cea.channels) {
+	case 1:
+	case 2:
+		audio_data_in_en = AUDIO_DATA_IN_EN_CHANNEL12;
+		break;
+	case 8:
+		audio_data_in_en = AUDIO_DATA_IN_EN_CHANNEL12 |
+				   AUDIO_DATA_IN_EN_CHANNEL34 |
+				   AUDIO_DATA_IN_EN_CHANNEL56 |
+				   AUDIO_DATA_IN_EN_CHANNEL78;
+		break;
+	default:
+		dev_err(dp->dev, "invalid audio channels %d\n", dp->audio_channels);
+		return -EINVAL;
+	}
+
+	if (params->sample_width < 16 || params->sample_width >> 24) {
+		dev_err(dp->dev, "invalid data sample width %d\n", params->sample_width);
+		return -EINVAL;
+	}
+
+	switch (daifmt->fmt) {
+	case HDMI_SPDIF:
+		audio_interface = DW_DP_AUDIO_SPDIF;
+		break;
+	case HDMI_I2S:
+		/*
+		 * It is recommended to use SPDIF instead of I2S, since I2S mode requires
+		 * manually inserting PCUV control bits from userspace and this is done
+		 * automatically in hardware for SPDIF mode.
+		 */
+		audio_interface = DW_DP_AUDIO_I2S;
+		break;
+	default:
+		dev_err(dp->dev, "invalid DAI format %d\n", daifmt->fmt);
+		return -EINVAL;
+	}
+
+	regmap_read(dp->regmap, DW_DP_CONFIG_REG1, &cfg1);
+	supported_audio_interfaces = FIELD_GET(AUDIO_SELECT, cfg1);
+
+	if (supported_audio_interfaces != DW_DP_AUDIO_I2S_AND_SPDIF &&
+	    supported_audio_interfaces != audio_interface) {
+		dev_err(dp->dev, "unsupported DAI %d\n", daifmt->fmt);
+		return -EINVAL;
+	}
+
+	ret = clk_prepare_enable(dp->spdif_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(dp->i2s_clk);
+	if (ret) {
+		clk_disable_unprepare(dp->spdif_clk);
+		return ret;
+	}
+
+	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1,
+			   AUDIO_DATA_IN_EN | NUM_CHANNELS | AUDIO_DATA_WIDTH |
+			   AUDIO_INF_SELECT | HBR_MODE_ENABLE,
+			   FIELD_PREP(AUDIO_DATA_IN_EN, audio_data_in_en) |
+			   FIELD_PREP(NUM_CHANNELS, dp->audio_channels - 1) |
+			   FIELD_PREP(AUDIO_DATA_WIDTH, params->sample_width) |
+			   FIELD_PREP(AUDIO_INF_SELECT, audio_interface) |
+			   FIELD_PREP(HBR_MODE_ENABLE, 0));
+
+	/* Wait for inf switch */
+	usleep_range(20, 40);
+
+	if (audio_interface == DW_DP_AUDIO_I2S)
+		clk_disable_unprepare(dp->spdif_clk);
+	else if (audio_interface == DW_DP_AUDIO_SPDIF)
+		clk_disable_unprepare(dp->i2s_clk);
+
+	dp->audio_interface = audio_interface;
+
+	/*
+	 * Send audio stream during vertical and horizontal blanking periods.
+	 * Send out audio timestamp SDP once per video frame during the vertical
+	 * blanking period
+	 */
+	regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+			   EN_AUDIO_STREAM_SDP | EN_AUDIO_TIMESTAMP_SDP,
+			   FIELD_PREP(EN_AUDIO_STREAM_SDP, 1) |
+			   FIELD_PREP(EN_AUDIO_TIMESTAMP_SDP, 1));
+	regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+			   EN_AUDIO_STREAM_SDP,
+			   FIELD_PREP(EN_AUDIO_STREAM_SDP, 1));
+
+	ret = dw_dp_audio_infoframe_send(dp);
+	if (ret < 0)
+		dev_err(dp->dev, "failed to send audio infoframe\n");
+
+	dp->audio_sdp_nr = ret;
+
+	dev_dbg(dp->dev, "audio prepare with %d channels using DAI=%d\n",
+		dp->audio_channels, dp->audio_interface);
+
+	return 0;
+}
+
+static void dw_dp_audio_shutdown(struct drm_bridge *bridge,
+				 struct drm_connector *connector)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	dev_dbg(dp->dev, "audio shutdown\n");
+
+	dw_dp_audio_unprepare(bridge, connector);
+	pm_runtime_put_autosuspend(dp->dev);
+}
+
+static int dw_dp_audio_mute_stream(struct drm_bridge *bridge,
+				   struct drm_connector *connector,
+				   bool enable, int direction)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	dev_dbg(dp->dev, "audio %smute\n", enable ? "" : "un");
+
+	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1, AUDIO_MUTE,
+			   FIELD_PREP(AUDIO_MUTE, enable));
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1903,6 +2140,11 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.detect = dw_dp_bridge_detect,
 	.edid_read = dw_dp_bridge_edid_read,
 	.oob_notify = dw_dp_bridge_oob_notify,
+
+	.dp_audio_startup = dw_dp_audio_startup,
+	.dp_audio_prepare = dw_dp_audio_prepare,
+	.dp_audio_shutdown = dw_dp_audio_shutdown,
+	.dp_audio_mute_stream = dw_dp_audio_mute_stream,
 };
 
 static int dw_dp_link_retrain(struct dw_dp *dp)
@@ -2061,10 +2303,19 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 
 	bridge = &dp->bridge;
 	bridge->of_node = dev->of_node;
-	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+	bridge->ops = DRM_BRIDGE_OP_DP_AUDIO |
+		      DRM_BRIDGE_OP_DETECT |
+		      DRM_BRIDGE_OP_EDID |
+		      DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 	bridge->ycbcr_420_allowed = true;
 
+	dp->audio_interface = DW_DP_AUDIO_UNUSED;
+	bridge->hdmi_audio_dev = dev;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_dai_port = 1;
+	bridge->hdmi_audio_spdif_playback = true;
+
 	drm_bridge_add(bridge);
 
 	dp->aux.dev = dev;

-- 
2.53.0


