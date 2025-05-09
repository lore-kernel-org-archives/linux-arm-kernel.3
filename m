Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12448C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOcho37MvrVhiA5dQkVJX8FlRBRSDHiJRf+zEmA1rlY=; b=ld5cEUoAxKKpOAAqvgIypWCmae
	I6RkVTKmf9+tiAIHqfE9qa7SIyoOq5mJNm/DG6DVg/YGLcXF4xY8ZfXzUPuiCM2L3slQyH7aFAb5b
	Zn0CY9Hs4jHEtRX/1TkVbpEDfelxnWC7jhIpM7q89lm0ZbtvdBSG1+iMruOUIEuUMV9B+gPOsOXgh
	pWRSt8Nv4ntBk/1GX27Xz7L+A3Um2yzhJsRMwAOO6KZQE+T2mmqEzfhpmMVtvlgAmyH5WZdw1Ee6Q
	I9dyeZhpVQ9qHmX9UlUAJnlt9/rWaJOUdvAkneunxcUyqfaW16JHj7HpJb6SALuVLviStKrWG5i07
	8nBThJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPvm-000000049LG-0Aze;
	Fri, 09 May 2025 15:46:34 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDODg-00000003rQn-29yt;
	Fri, 09 May 2025 13:56:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8D1743B63;
	Fri,  9 May 2025 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOcho37MvrVhiA5dQkVJX8FlRBRSDHiJRf+zEmA1rlY=;
	b=CndV2qgaPqO3LuApWCi1K2vmBzFmnB9puzhxZvWpn+taK86Eei7N1/UlnpOWvycXKcm3ei
	OXJsDcIbdqC5pA3dFPg8A58jlTSmqYWRlMBc+2FtdYRHwysUfZibXtR/3yoxjZj3W+kmRP
	Oaz8BhvT2/QeOUuRzgYpcvpljb31GBY8rxKQO6QG3aidrRFJWL+Qc4wwu2ToefYP0GWT2V
	Duos+FswOXgHcaFjdeL/UsBg4qF+mVh63yAcG+V3t0cY88WvumDcdAYtClHKsHciG8qvrS
	BbGt1cmgbE5BG3vhsmNZyUrxcTZHX3hAPwkbXSik46YKw0hUpKEeHXbB7rlLSw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:39 +0200
Subject: [PATCH v3 13/22] drm/omap: dss: venc: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-13-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065656_696749_D1BCCA7F 
X-CRM114-Status: GOOD (  14.30  )
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


