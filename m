Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B474CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvpTP8r9OEXgtzMYgQeTLCb2/tpv7Xa8E0AxN7OcwqA=; b=b0O11sHVEDSOPodHsArxZfXFe2
	9hFCePvJKmbyI8zY1Rb5fjphNRiKC8K4m3/S58sof5ymvEexUuk9H4B44HVHjaF5rPJyjqQejzq71
	w+i4U0FxNiRrRKC1e2GQVClQ0OSbiQ80dond2+1/UaGJ0MenuZSR1VjIw1Z83ETSN2B4epPjzxdPQ
	a822KltNJzdS8eWPaZAkRm1YO3KRq7VJaiTEFQUTPvDg2TIxbfB6yn+MEMLlUCn1wjpKe2uLzYQgC
	TDkcvfc6rCCPEHZkwgUfRc06u2hhJV9R3aloGGZsmyfdIX8TkE9iIpg/zlF+1LDoasj1CeuVsArHh
	HWXUvrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pBy-000000018px-1ji5;
	Mon, 07 Apr 2025 16:19:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oLc-00000000wqB-1J84;
	Mon, 07 Apr 2025 15:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EvpTP8r9OEXgtzMYgQeTLCb2/tpv7Xa8E0AxN7OcwqA=; b=dq2K0c6d2xe0GSLAyb1cRW/cNc
	ygc4Gq+prbUUeaqjHHe1lOVDwP/htFkjKQ8j3frsiu0sF1WKrZ1GatsTJ7rmT6HQWPT4wxRpUgzs2
	irR2pdeUd+bF68Kb1OGDokUhVFhGPxTMOM/stxz2Gi9dkSzG4ImCqmrKmf4DFSb+PhLni602DlqWV
	wxtL69W+IGt0i10qNDvoGTYTBcz/aa64M2UPLX63bBtYsbQTbjbFtuCB/4rBw5/OYbp0fNECkBtDy
	AS2gnA1HVs8cFr8zhioqUs5cAcJe47B5ExtpymSnHj9SH8K10hO/MELK5VCGfsqLU+z3UNR4LBGV8
	ctaNgpRQ==;
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oLZ-0000000814s-1UFd;
	Mon, 07 Apr 2025 15:25:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50C8C20483;
	Mon,  7 Apr 2025 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744039510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EvpTP8r9OEXgtzMYgQeTLCb2/tpv7Xa8E0AxN7OcwqA=;
	b=g72CNr1LxMYTtMOyi8LuOyg0/SZhTQyeoQsRh/EIwlX356xMzMhj1jyuNmK/4Lpq0IpiSA
	XXCw7E1OkkaIe2XftSQvzuuRH/X75+TAB/xcKzi+P5Www4E8DcKfN9M3n4Z+mGinFNpJpC
	y4wfMYVMOz/6bK5p+lae3ShAkyu8rgb9LmqrABIA0j8V/sqP4i/jTOEaszkFDLFKzEntxl
	t1vIokF9gzle/BMLDC21k40bzbESs5VIvbNAxqa3BwQoe7mumATrnMsjLaMWYEh84Erh/a
	BcIZBmsNS0b37k6PRKv9s/CWTMhxauc+XMtMrB/+BxDcPKQSmFMmceB2f//n6A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 32/34] drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
Date: Mon,  7 Apr 2025 17:24:31 +0200
Message-ID: <20250407-drm-bridge-convert-to-alloc-api-v1-32-42113ff8d9c0@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvp
 dhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_162513_582743_BA230D74 
X-CRM114-Status: GOOD (  25.63  )
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

This is the new API for allocating DRM bridges.

Converting this driver is a bit convoluted because the drm_bridge funcs
pointer differs based on the bridge mode. So the current code does:

 * tc_probe()
   * devm_kzalloc() private struct embedding drm_bridge
   * call tc_probe_bridge_endpoint() which
     * parses DT description into struct fields
     * computes the mode
     * calls different bridge init functions based on the mode
       * each sets a different bridge.funcs pointer

The new API expects the funcs pointer to be known at alloc time, which does
not fit in the current code structure.

Solve this by moving the part of tc_probe_bridge_endpoint() computing the
mode into a separate function, tc_probe_get_mode(), which does not need the
private driver structure. So now the mode is known before allocation and so
is the funcs pointer, while all other operations are still happening after
allocation, directly into the private struct data, as they used to.

This solution is chosen to minimize the changes in the driver logical code
flow. The drawback is we now iterate twice over the endpoints.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Hervé Codina <herve.codina@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: chrome-platform@lists.linux.dev
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/gpu/drm/bridge/tc358767.c | 56 ++++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7e5449fb86a3fcdae8255bc490d12c543ef3f8ae..61559467e2d22b4b1b4223c97766ca3bf58908fd 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -344,6 +344,14 @@
 #define COLOR_BAR_MODE_BARS	2
 #define PLL_DBG			0x0a04
 
+enum tc_mode {
+	mode_dpi_to_edp = BIT(1) | BIT(2),
+	mode_dpi_to_dp  = BIT(1),
+	mode_dsi_to_edp = BIT(0) | BIT(2),
+	mode_dsi_to_dp  = BIT(0),
+	mode_dsi_to_dpi = BIT(0) | BIT(1),
+};
+
 static bool tc_test_pattern;
 module_param_named(test, tc_test_pattern, bool, 0644);
 
@@ -2327,7 +2335,6 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 	if (bridge) {
 		tc->panel_bridge = bridge;
 		tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
-		tc->bridge.funcs = &tc_dpi_bridge_funcs;
 
 		return 0;
 	}
@@ -2360,7 +2367,6 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	}
 
-	tc->bridge.funcs = &tc_edp_bridge_funcs;
 	if (tc->hpd_pin >= 0)
 		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
@@ -2368,17 +2374,11 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 	return 0;
 }
 
-static int tc_probe_bridge_endpoint(struct tc_data *tc)
+static enum tc_mode tc_probe_get_mode(struct device *dev)
 {
-	struct device *dev = tc->dev;
 	struct of_endpoint endpoint;
 	struct device_node *node = NULL;
-	const u8 mode_dpi_to_edp = BIT(1) | BIT(2);
-	const u8 mode_dpi_to_dp = BIT(1);
-	const u8 mode_dsi_to_edp = BIT(0) | BIT(2);
-	const u8 mode_dsi_to_dp = BIT(0);
-	const u8 mode_dsi_to_dpi = BIT(0) | BIT(1);
-	u8 mode = 0;
+	enum tc_mode mode = 0;
 
 	/*
 	 * Determine bridge configuration.
@@ -2401,7 +2401,27 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 			return -EINVAL;
 		}
 		mode |= BIT(endpoint.port);
+	}
+
+	if (mode != mode_dpi_to_edp &&
+	    mode != mode_dpi_to_dp  &&
+	    mode != mode_dsi_to_dpi &&
+	    mode != mode_dsi_to_edp &&
+	    mode != mode_dsi_to_dp) {
+		dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
+		return -EINVAL;
+	}
+
+	return mode;
+}
 
+static int tc_probe_bridge_endpoint(struct tc_data *tc, enum tc_mode mode)
+{
+	struct device *dev = tc->dev;
+	struct of_endpoint endpoint;
+	struct device_node *node = NULL;
+
+	for_each_endpoint_of_node(dev->of_node, node) {
 		if (endpoint.port == 2) {
 			of_property_read_u8_array(node, "toshiba,pre-emphasis",
 						  tc->pre_emphasis,
@@ -2427,24 +2447,28 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 		return tc_probe_edp_bridge_endpoint(tc);
 	}
 
-	dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
-
+	/* Should never happen, mode was validated by tc_probe_get_mode() */
 	return -EINVAL;
 }
 
 static int tc_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	const struct drm_bridge_funcs *funcs;
 	struct tc_data *tc;
+	int mode;
 	int ret;
 
-	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
-	if (!tc)
-		return -ENOMEM;
+	mode = tc_probe_get_mode(dev);
+	funcs = (mode == mode_dsi_to_dpi) ? &tc_dpi_bridge_funcs : &tc_edp_bridge_funcs;
+
+	tc = devm_drm_bridge_alloc(dev, struct tc_data, bridge, funcs);
+	if (IS_ERR(tc))
+		return PTR_ERR(tc);
 
 	tc->dev = dev;
 
-	ret = tc_probe_bridge_endpoint(tc);
+	ret = tc_probe_bridge_endpoint(tc, mode);
 	if (ret)
 		return ret;
 

-- 
2.49.0


