Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB8CE69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKxuA/GZoZV4nj2Ju80QC05X27nwM4uJ+tgDF6pfHco=; b=3DYlx7jlJDvs6mk965WwaKYtBC
	xDMLiJ505u6K4Jm8biSsQE3nDdR2YGBb4yFC7X5Ych6QGH+pRFFY7FFZDSdhWnf1kfsPogcaKjLV8
	JZpE2765CwZfuYUdzaYO9R/g2Th9XwKjhim3PTxOQyoxkoaTqSgHL9SVNqrFtpTLdZX+OCX7EaOQj
	WEyBL2vBT2UKSoBFnAeX3RJCiyuV0h+BO1OcZse669xTjwGHWSX6vw4ZKePraq4EHvEojz8+Nqjvh
	4hX5h83oFrqY1DFUg1baIczO5q2k5550pvED35zjNRY14l1eqdYAcj8pQUhvcakvuAMBzIJw9xmc5
	CAHVmTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQps-00000009Dez-3M3N;
	Tue, 03 Dec 2024 11:12:56 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQeY-00000009Auj-1D6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gKxuA/GZoZV4nj2Ju80QC05X27nwM4uJ+tgDF6pfHco=; b=i3ranUoS3Ik3W1unoFODySTEs/
	rpyJQ9fM8M96nYsew/CCeKHx+AGLdeW1ibJ5Ba4uyJwxXv4VENA2haSL9Enk5SUdzLoyFgAVpO6zm
	TGbqHGl9l00wjfzDSTQQLhG5Wk5pipb7RdMY1G5bVNOejgh67yAMA1wENshbUFAoGfQqGRFqzkgow
	bqacljrfW7zE9BMkZiD/NduA/Gklev9KZNkZGHmcFE3TvuDoeNcbZFciCvgTkdH83luiUtislqSZN
	2W2tYvI1f1CIxwyru+MfKhP1KKxra5nxMK21aWvw5JMQhNqiQD3CyDp7VrbvU2gs/uo6ZCttdNLGe
	l15GObVQ==;
Received: from [89.212.21.243] (port=52296 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tIQeX-00Bd83-06;
	Tue, 03 Dec 2024 12:01:13 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
Date: Tue,  3 Dec 2024 12:00:53 +0100
Message-Id: <20241203110054.2506123-3-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203110054.2506123-1-andrej.picej@norik.com>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030114_485094_623BFF8E 
X-CRM114-Status: GOOD (  18.25  )
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

Add a optional properties to change LVDS output voltage. This should not
be static as this depends mainly on the connected display voltage
requirement. We have three properties:
- "ti,lvds-termination-ohms", which sets near end termination,
- "ti,lvds-vod-swing-data-microvolt" and
- "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
output voltage for data and clock lanes. They are defined as an array
with min and max values. The appropriate bitfiled will be set if
selected constraints can be met.

If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
end termination will be used. Selecting only one:
"ti,lvds-vod-swing-data-microvolt" or
"ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
constraint for only data/clock lanes will be met. Setting both is
recommended.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v3:
- use microvolts for default array values 1000 mV -> 1000000 uV.
Changes in v2:
- use datasheet tables to get the proper configuration
- since major change was done change the authorship to myself
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 144 +++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 57a7ed13f996..1a070df5ea12 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -132,6 +132,16 @@
 #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
 #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
 
+enum sn65dsi83_channel {
+	CHANNEL_A,
+	CHANNEL_B
+};
+
+enum sn65dsi83_lvds_term {
+	OHM_100,
+	OHM_200
+};
+
 enum sn65dsi83_model {
 	MODEL_SN65DSI83,
 	MODEL_SN65DSI84,
@@ -147,6 +157,10 @@ struct sn65dsi83 {
 	struct regulator		*vcc;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
+	int				lvdsA_vod_swing_conf;
+	int				lvdsB_vod_swing_conf;
+	int				lvdsA_term_conf;
+	int				lvdsB_term_conf;
 };
 
 static const struct regmap_range sn65dsi83_readable_ranges[] = {
@@ -237,6 +251,36 @@ static const struct regmap_config sn65dsi83_regmap_config = {
 	.max_register = REG_IRQ_STAT,
 };
 
+static const int lvds_vod_swing_data_table[2][4][2] = {
+	{	/* 100 Ohm */
+		{ 180000, 313000 },
+		{ 215000, 372000 },
+		{ 250000, 430000 },
+		{ 290000, 488000 },
+	},
+	{	/* 200 Ohm */
+		{ 150000, 261000 },
+		{ 200000, 346000 },
+		{ 250000, 428000 },
+		{ 300000, 511000 },
+	},
+};
+
+static const int lvds_vod_swing_clock_table[2][4][2] = {
+	{	/* 100 Ohm */
+		{ 140000, 244000 },
+		{ 168000, 290000 },
+		{ 195000, 335000 },
+		{ 226000, 381000 },
+	},
+	{	/* 200 Ohm */
+		{ 117000, 204000 },
+		{ 156000, 270000 },
+		{ 195000, 334000 },
+		{ 234000, 399000 },
+	},
+};
+
 static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct sn65dsi83, bridge);
@@ -435,12 +479,16 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
 
 	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
-	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
+	regmap_write(ctx->regmap, REG_LVDS_VCOM,
+			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvdsA_vod_swing_conf) |
+			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvdsB_vod_swing_conf));
 	regmap_write(ctx->regmap, REG_LVDS_LANE,
 		     (ctx->lvds_dual_link_even_odd_swap ?
 		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
-		     REG_LVDS_LANE_CHA_LVDS_TERM |
-		     REG_LVDS_LANE_CHB_LVDS_TERM);
+		     (ctx->lvdsA_term_conf ?
+			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
+		     (ctx->lvdsB_term_conf ?
+			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
 	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
 
 	le16val = cpu_to_le16(mode->hdisplay);
@@ -576,10 +624,96 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
 };
 
+static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
+	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
+{
+	int i;
+
+	for (i = 0; i <= 3; i++) {
+		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
+		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
+		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
+		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])
+			return i;
+	}
+
+	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
+	return -EINVAL;
+}
+
+static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
+{
+	struct device *dev = ctx->dev;
+	struct device_node *endpoint;
+	/* Set so the property can be freely selected if not defined */
+	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
+	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
+	u32 lvds_term = 200;
+	u8 lvds_term_conf;
+	int endpoint_reg;
+	int lvds_vod_swing_conf;
+	int ret = 0;
+	int ret_data;
+	int ret_clock;
+
+	if (channel == CHANNEL_A)
+		endpoint_reg = 2;
+	else
+		endpoint_reg = 3;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
+	of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term);
+
+	if (lvds_term == 200)
+		lvds_term_conf = OHM_200;
+	else
+		lvds_term_conf = OHM_100;
+
+	if (channel == CHANNEL_A)
+		ctx->lvdsA_term_conf = lvds_term_conf;
+	else
+		ctx->lvdsB_term_conf = lvds_term_conf;
+
+	ret_data = of_property_read_u32_array(endpoint,
+			"ti,lvds-vod-swing-data-microvolt", lvds_vod_swing_data,
+			ARRAY_SIZE(lvds_vod_swing_data));
+	ret_clock = of_property_read_u32_array(endpoint,
+			"ti,lvds-vod-swing-clock-microvolt", lvds_vod_swing_clk,
+			ARRAY_SIZE(lvds_vod_swing_clk));
+	/* If any of the two properties is defined. */
+	if (!ret_data || !ret_clock) {
+		lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev,
+			lvds_vod_swing_data, lvds_vod_swing_clk,
+			lvds_term_conf);
+		if (lvds_vod_swing_conf < 0) {
+			ret = lvds_vod_swing_conf;
+			goto exit;
+		}
+		if (channel == CHANNEL_A)
+			ctx->lvdsA_vod_swing_conf = lvds_vod_swing_conf;
+		else
+			ctx->lvdsB_vod_swing_conf = lvds_vod_swing_conf;
+	}
+	ret = 0;
+exit:
+	of_node_put(endpoint);
+	return ret;
+}
+
 static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
+	int ret;
+
+	ctx->lvdsA_vod_swing_conf = 0x1;
+	ctx->lvdsB_vod_swing_conf = 0x1;
+	ctx->lvdsA_term_conf = 0x1;
+	ctx->lvdsB_term_conf = 0x1;
+
+	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
+	if (ret < 0)
+		return ret;
 
 	ctx->lvds_dual_link = false;
 	ctx->lvds_dual_link_even_odd_swap = false;
@@ -587,6 +721,10 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		struct device_node *port2, *port3;
 		int dual_link;
 
+		ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_B);
+		if (ret < 0)
+			return ret;
+
 		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		port3 = of_graph_get_port_by_id(dev->of_node, 3);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
-- 
2.34.1


