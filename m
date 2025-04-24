Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4132C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41vTHyL+V115rpzV8yiJOSt8o1/SbibksvBOkcYUztI=; b=nHUflvvlmtNURXoalqDDnHUyOf
	xiRExBRc91oP4pe4Xo0O2fOILkgJPdBgdUiXAFn2U88yTBRGDA/7CUpznOZlPB3HvV42JluuRw9Aq
	oexhDpIdO3mufwsheXw/kjLJ2nAGtRKotW9ZEhMt48dIkokwrhByjLF2dpteBTjmGrY4iSNQK4w+e
	hSom8fehCqH0Yjohx+Yn6Qpy3lqICmmBV3Xbn6wl9F+HDO4rQiVtKlHZrqtGcqlV6n+tTAFVpjrXN
	mKIz7SZN/x1p/2dryMU786Dzm9z1Tv2k5IZa6pmESg+2UbGry/VPH1JrbQ6ZwXoHE89951DALDP4D
	o/kOKQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82RY-0000000FDfE-093G;
	Thu, 24 Apr 2025 19:41:08 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81oP-0000000F6Su-3cFq;
	Thu, 24 Apr 2025 19:00:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8385243B79;
	Thu, 24 Apr 2025 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41vTHyL+V115rpzV8yiJOSt8o1/SbibksvBOkcYUztI=;
	b=N4Q352QUWWC2juvAFq8ON9A8+gVXITAU+AGTB9dxNDzd7HJYK2Q4dtTrW04zfS/VXKS860
	fDviDi7xt2nHaQxWENZ641S1ZL0dqfsJQC7ycn/7iMRSaKG/Mj13ds6lWFZxsIc0dX7nBR
	JoxwurvW9KW2GzzBfo+L0eemRiH3EgreHKyyc8yQ4XHSqIj3PZI1dybHzjRbWaFKumWcKl
	+WHTmofzHaIVWY4yBNEJOzuyxEl1A2ItMpgs4uSjV/bK31empFNtemVeGtlLa70++WwZYT
	vp+PLTHbgLwwUtsjnxAY6vR5zXRehsIXZtgOQYZyoGsn6m8XVehJ2DpVzQbe6w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:28 +0200
Subject: [PATCH v2 21/34] drm/omap: dss: hdmi4: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-21-8f91a404d86b@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_120042_095253_A7E33906 
X-CRM114-Status: GOOD (  13.59  )
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

Switching from a non-devm to a devm allocation allows removing the kfree()
in the remove function and in the probe error management code, and as a
consequence to simplify the code flow by removing now unnecessary gotos.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a3b22952fdc32b5899dae82d413108c5c0a1c3c8..3cd612af24498b057c33eaecb3d43c8df76cd23e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -505,7 +505,6 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 
 static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
 {
-	hdmi->bridge.funcs = &hdmi4_bridge_funcs;
 	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
@@ -761,9 +760,9 @@ static int hdmi4_probe(struct platform_device *pdev)
 	int irq;
 	int r;
 
-	hdmi = kzalloc(sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(&pdev->dev, struct omap_hdmi, bridge, &hdmi4_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->pdev = pdev;
 
@@ -774,25 +773,24 @@ static int hdmi4_probe(struct platform_device *pdev)
 
 	r = hdmi4_probe_of(hdmi);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi_wp_init(pdev, &hdmi->wp, 4);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi_phy_init(pdev, &hdmi->phy, 4);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi4_core_init(pdev, &hdmi->core);
 	if (r)
-		goto err_free;
+		return r;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		DSSERR("platform_get_irq failed\n");
-		r = -ENODEV;
-		goto err_free;
+		return -ENODEV;
 	}
 
 	r = devm_request_threaded_irq(&pdev->dev, irq,
@@ -800,7 +798,7 @@ static int hdmi4_probe(struct platform_device *pdev)
 			IRQF_ONESHOT, "OMAP HDMI", hdmi);
 	if (r) {
 		DSSERR("HDMI IRQ request failed\n");
-		goto err_free;
+		return r;
 	}
 
 	hdmi->vdda_reg = devm_regulator_get(&pdev->dev, "vdda");
@@ -808,7 +806,7 @@ static int hdmi4_probe(struct platform_device *pdev)
 		r = PTR_ERR(hdmi->vdda_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDA regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -827,8 +825,6 @@ static int hdmi4_probe(struct platform_device *pdev)
 	hdmi4_uninit_output(hdmi);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free:
-	kfree(hdmi);
 	return r;
 }
 
@@ -841,8 +837,6 @@ static void hdmi4_remove(struct platform_device *pdev)
 	hdmi4_uninit_output(hdmi);
 
 	pm_runtime_disable(&pdev->dev);
-
-	kfree(hdmi);
 }
 
 static const struct of_device_id hdmi_of_match[] = {

-- 
2.49.0


