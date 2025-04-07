Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E5DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOcho37MvrVhiA5dQkVJX8FlRBRSDHiJRf+zEmA1rlY=; b=vZDNNDlmpnGxMGI4XIWSB+Zjxf
	neNlDcG/tM6B6MKbZhnKrJHvATtlyQxnjSL6FnYgq7WU4vRgcKKtDv3mZiThpAjThOjCM6RoN3xxO
	76OeHC7gvgRg1xeiQyU5eHLnTO3EZ7VGuIC4VTEThU8QZ12FoIZapproMX1omxjZdIjeFqa99Uxnq
	l2ptQrJCGtrV3uYGVOoEGZKNcIT6C0hX+NCFqddEa6/8sS/SygXKQy7MWFKjfaNBxD9NDwe03SQC4
	/skCxVGv5ItmhJL3L1myV6n23Zgt5cemYZemuHO5SLb9Q0M6qi5vX8aMiLT21Q/wxeddH8+Ys728X
	rExdbuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o7i-00000000t6w-1nVL;
	Mon, 07 Apr 2025 15:10:54 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nPb-00000000iXv-2fti;
	Mon, 07 Apr 2025 14:25:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40B91443B4;
	Mon,  7 Apr 2025 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOcho37MvrVhiA5dQkVJX8FlRBRSDHiJRf+zEmA1rlY=;
	b=D0danf4qUYVlA+OsldSLv5VeHErZ5R+XS/EI8G0W7/pw96QLLVqQb0JXQ0xb1gSBQyZ++6
	Ibam302Oi5QFRZJ8GKfAK4a/hXpaO3kWUZfFeyz/faD1NLQn/HyMK2c/1YR46fNeTYS/Sx
	ACx7UuOmXwY+heqjzhLMeXqVUH7KREOd4z1yxEy+MwZHGaBhFgWLC1dpyBYvZfFV+W5bLY
	72t0OyQUQm/Yx0iNXUiOulOJnzkhptEL9IlBXtAUKFXlYBT/6mhvXUf8x23h/Rn8bpjSv5
	rMzkF1i0m307tf7x6AFrZMmToPWWGw7WZQOJCriAy8F+dUyhEdF0q65NyPOb3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:39 +0200
Subject: [PATCH 24/34] drm/omap: dss: venc: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-24-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_072519_871126_2402F9C4 
X-CRM114-Status: GOOD (  13.73  )
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
 drivers/gpu/drm/omapdrm/dss/venc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 50349518eda1630400529caf27ca4469bb09fc82..9b5d53dc361e654a2e4009c3c81b726f9ef76ced 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -664,7 +664,6 @@ static const struct drm_bridge_funcs venc_bridge_funcs = {
 
 static void venc_bridge_init(struct venc_device *venc)
 {
-	venc->bridge.funcs = &venc_bridge_funcs;
 	venc->bridge.of_node = venc->pdev->dev.of_node;
 	venc->bridge.ops = DRM_BRIDGE_OP_MODES;
 	venc->bridge.type = DRM_MODE_CONNECTOR_SVIDEO;
@@ -809,9 +808,9 @@ static int venc_probe(struct platform_device *pdev)
 	struct venc_device *venc;
 	int r;
 
-	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
-	if (!venc)
-		return -ENOMEM;
+	venc = devm_drm_bridge_alloc(&pdev->dev, struct venc_device, bridge, &venc_bridge_funcs);
+	if (IS_ERR(venc))
+		return PTR_ERR(venc);
 
 	venc->pdev = pdev;
 
@@ -824,26 +823,24 @@ static int venc_probe(struct platform_device *pdev)
 	venc->config = &venc_config_pal_trm;
 
 	venc->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(venc->base)) {
-		r = PTR_ERR(venc->base);
-		goto err_free;
-	}
+	if (IS_ERR(venc->base))
+		return PTR_ERR(venc->base);
 
 	venc->vdda_dac_reg = devm_regulator_get(&pdev->dev, "vdda");
 	if (IS_ERR(venc->vdda_dac_reg)) {
 		r = PTR_ERR(venc->vdda_dac_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDA_DAC regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	r = venc_get_clocks(venc);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = venc_probe_of(venc);
 	if (r)
-		goto err_free;
+		return r;
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -861,8 +858,6 @@ static int venc_probe(struct platform_device *pdev)
 	venc_uninit_output(venc);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free:
-	kfree(venc);
 	return r;
 }
 
@@ -875,8 +870,6 @@ static void venc_remove(struct platform_device *pdev)
 	venc_uninit_output(venc);
 
 	pm_runtime_disable(&pdev->dev);
-
-	kfree(venc);
 }
 
 static __maybe_unused int venc_runtime_suspend(struct device *dev)

-- 
2.49.0


