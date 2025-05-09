Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B2C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfk1kaPUb8jTQgYvcZdTdUyZhZFAInoALAL+cRhzIsQ=; b=hJoMcGYLs8wBXBoIXXTsHRIxYl
	RPCkNxZszJ13x30pf87SmxP4LcCs5ongqKXU6voNDBzyvqg/wWQb9L3YNEdHOZB2nItPtT+WCqmcm
	fG9feqaIvZczsViTZqLy6oHvq95xuI8B07K4hVm7YeXGPdKeJ4gT58qb3C6Ab9vkDIrvr/DKaF7Bl
	ncla3Ryl8x4xS7os6o7k+oHUNV3jItBa0tdeNO60HyYe+kXD6Ut4eggNpnFx5nPQGkOY5m/o0d8G2
	VQGLAFjomuvIM+3qsSfwwor1nd6OrqDwJgSrDR7DdIRrXY1LUPnhbm0Cm1oK3VmIF1lcZeqi28FUr
	XvyaU+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQ3X-00000004Alv-40CS;
	Fri, 09 May 2025 15:54:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDODt-00000003rWk-1u7E;
	Fri, 09 May 2025 13:57:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FE0243B50;
	Fri,  9 May 2025 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfk1kaPUb8jTQgYvcZdTdUyZhZFAInoALAL+cRhzIsQ=;
	b=gr40Nsj/K3gt1sHPwjmwgXS8PmCtELSUUoucRIEba5ZLQ2uwuVV8Od6CcVl78pA1e7sceo
	6KL4Jce/PdY228FDoL8v4DVa5oDvkqBrKDRxV1k0e0bD/kAbZ1v8TYEks9P67tmtnVExGa
	8rdbKLhKpiVv54mmEkIjv4jXA+hqACO2ypt9jdCLny47Nf4cKKCGCEfwdPQIRdjrEszRkI
	P7+smrGlq8DyVjCOhWlIHWTRfxW9nRivwUo/7iP/oqGnbEnnaN/WejR+Jg6CSwONp0gjSL
	RGhffOyQ1nPeLbcMLMq001MdWX/N5fD+J0Q230rtrOSUrigYYBtMdD6WNcdYdw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:43 +0200
Subject: [PATCH v3 17/22] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065709_646010_1B28341C 
X-CRM114-Status: GOOD (  16.32  )
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

This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
which delegates to a submodule (zynqmp_dp.c) the allocation of a
sub-structure embedding the drm_bridge and its initialization, however it
does not delegate the drm_bridge_add(). Hence, following carefully the code
flow, it is correct to change the allocation function and .funcs assignment
in the submodule, while the drm_bridge_add() is not in that submodule.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Changes in v2:
- rebased on current drm-misc-next
- remove the kfree() calls too, as we are converting from kzalloc+kfree,
  not from devm_kzalloc
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 31 +++++++++++--------------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  1 -
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 238cbb49963efa6e8cc737d8a6e76250f6531276..02e1feaa611596a24217136ee8ce7f5d2f1900a2 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2439,9 +2439,9 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	struct zynqmp_dp *dp;
 	int ret;
 
-	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
-	if (!dp)
-		return -ENOMEM;
+	dp = devm_drm_bridge_alloc(&pdev->dev, struct zynqmp_dp, bridge, &zynqmp_dp_bridge_funcs);
+	if (IS_ERR(dp))
+		return PTR_ERR(dp);
 
 	dp->dev = &pdev->dev;
 	dp->dpsub = dpsub;
@@ -2454,31 +2454,25 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	/* Acquire all resources (IOMEM, IRQ and PHYs). */
 	dp->iomem = devm_platform_ioremap_resource_byname(pdev, "dp");
-	if (IS_ERR(dp->iomem)) {
-		ret = PTR_ERR(dp->iomem);
-		goto err_free;
-	}
+	if (IS_ERR(dp->iomem))
+		return PTR_ERR(dp->iomem);
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (dp->irq < 0) {
-		ret = dp->irq;
-		goto err_free;
-	}
+	if (dp->irq < 0)
+		return dp->irq;
 
 	dp->reset = devm_reset_control_get(dp->dev, NULL);
-	if (IS_ERR(dp->reset)) {
-		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
+	if (IS_ERR(dp->reset))
+		return dev_err_probe(dp->dev, PTR_ERR(dp->reset),
 				    "failed to get reset\n");
-		goto err_free;
-	}
 
 	ret = zynqmp_dp_reset(dp, true);
 	if (ret < 0)
-		goto err_free;
+		return ret;
 
 	ret = zynqmp_dp_reset(dp, false);
 	if (ret < 0)
-		goto err_free;
+		return ret;
 
 	ret = zynqmp_dp_phy_probe(dp);
 	if (ret)
@@ -2486,7 +2480,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	/* Initialize the bridge. */
 	bridge = &dp->bridge;
-	bridge->funcs = &zynqmp_dp_bridge_funcs;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
@@ -2539,8 +2532,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	zynqmp_dp_phy_exit(dp);
 err_reset:
 	zynqmp_dp_reset(dp, true);
-err_free:
-	kfree(dp);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 3a9544b97bc5311f9adeb57c08c837a04b6922fa..2764c4b17c5e49611db8adf41dd09e3134c2d524 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -180,7 +180,6 @@ static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
 void zynqmp_dpsub_release(struct zynqmp_dpsub *dpsub)
 {
 	kfree(dpsub->disp);
-	kfree(dpsub->dp);
 	kfree(dpsub);
 }
 

-- 
2.49.0


