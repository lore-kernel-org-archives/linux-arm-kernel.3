Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4751DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9ZEit07XSaKhijhujdfFMRxB0N42Z8dTjST1Vdxaqs=; b=kIt62Ax+R4relBVcI/sAaglO8M
	OmkuTdHbuzZANhfCjkdhXxyZexKkixomlhXGO+69QQmVa7FSNOcl6Ir4I+W5o9po/mHlbMjY/SVM4
	/bcwyKzcnUzBfhFm75vtcPys2Tvv1j8knBc9eIEQvl7nFYSd+NOelbl8t72Xu9hr6h1TuAtLUY7Nm
	4Op4g3cIMEGalJkxeI5zdxV/qc9kKSOzE8Cu5OC2bAO0etH3NxS9R2MpJ8b4bJVFV6AXU8CiwD39G
	gB85LOyHhIqAwJX+B2BV2ysa7czhkMeqGzTd7Inci936aqTImDY4HsDGGZSx4P6W1RR3L8YYvHIMi
	3bDorMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82lb-0000000FHCq-1kSr;
	Thu, 24 Apr 2025 20:01:51 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81pJ-0000000F6ly-0qX0;
	Thu, 24 Apr 2025 19:01:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EC6F43B79;
	Thu, 24 Apr 2025 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9ZEit07XSaKhijhujdfFMRxB0N42Z8dTjST1Vdxaqs=;
	b=bwZ35GkBDmSaOdeaLFEQd/QRXTn04kDtym2DVFHLpHgAqM/ZPxeM5SY872hQFH1n0OMUo2
	oIhUIIfOY2KPzUNzIZgjwrEmlReBdNDLhdm3jjjFYaifOzGObZXc0vcdi7UbAPdjb4M56K
	qNjtqW9u3H5Ic9jeqaj4flvn4drXoopzc4ICMPQOrFOK3WBcq0/DPbRCkFGjBh1cuIE6Ds
	ZzMspnMeKhRU+apHL+iQfq1wPgrtM9uP9jFdjXcp6jbKMbjeaYpmSwFkKzq3ZvOTgG/IBg
	Hd7/qxK8C2CQNH53oapJe2ypIwEKXBAak00ijoUebQ9JuJVJFldThnkZq4SDVQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:39 +0200
Subject: [PATCH v2 32/34] drm/bridge: tc358767: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-32-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_120137_375309_A77B4B62 
X-CRM114-Status: GOOD (  21.80  )
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


