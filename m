Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A537AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lHS2U5muP6CVh+3AVqYCA4VkdDHDIvWeOna5PFBWNg=; b=SfpjEBC1vthaXLJB7DG8HSmf0a
	+FMphx5GOmPkgba659MT0hSfplxtYJLA/OQdAa/dgYlQ46BKElF+SXBPZ3OXfw/8FSq42XbYxgAMi
	rCECDBIpHVIwh0B0egE3+8Lrjb6aBVoCRkWYbiP9tUD/5vzFciJSow5tM5qh4Fc9cCYfiEPSqtC8m
	5Bkman4Mv2qQ/ON8/lhcdBzyANOlXIVBzgL0fH4hNOD66k305axctYwBUdNVIPVuVRUg88p86FCDZ
	N9BqSpXbVZjOsfUejfeYRpfkOwHNL4za0NOTBkdNzEsuw4UkZY3HQM6G2bx5d9UVXWVBMrJZePAs5
	56nNvcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZBN-0000000E2Sa-2l0F;
	Mon, 24 Feb 2025 14:11:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrU-0000000DyEn-2Jfj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA8EE5C6E05;
	Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A68A9C4CEF9;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405064;
	bh=9rsK2DyiLn0rGQVW5aqBw0QCdbVsaOqhBOHIuUKMsyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cwGk/4lFw/RV2zrHR2vk91lDkKP5hvOnqTQdpmGo2xFPdw3nxcVg9FD0E3a5RHR5Y
	 JamEKWh9/tTYr8GO9eETAoDXd5uJQk1xuRB1/nHviJMWUq6ogD5QbqAIIwcR/oSu1h
	 Gy+a4iFYyE5iIPNDLc8iy1bDbd8Wil95t9NKUB7wJxita3AiR9pOUd9rq2bTBlCDVH
	 kyHn+4o3EW3J5L8281qM4nE4m/c66qnhus0e0fAopXmp2RPjpbK4/bLH1j1AiHdgaF
	 8Z4XqC6BPMleA+iSBu7Bf8LQ8nX5fqJw0qCF16OWfrlk3XCAcq4c976SPGAM0LEYHR
	 2zamrqgVtKikQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B318C021BB;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:58 +0100
Subject: [PATCH 08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1908;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=vOVkRssMq+0b54M++/GbRnRh45tiCsN1h3cNEf5At7g=;
 b=mIAf7wLfiBaXHgCEU4/8qvWOFXgtpexk2cgZKBPGdS9xQHEzRlSLaQGkNSxpz1dAA+cZucueh
 uDLvxXs5uZfBwENboFcPxubRl6D9NJ9o9TOrax33cAGbmns59TckZj6
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055108_766536_895D605F 
X-CRM114-Status: GOOD (  10.37  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a52977ab73dc2edab0d1954c702fd797d6a5b969..232b03c1a259eb15e423b9d452d28e2ff95c70f8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1403,6 +1403,35 @@ static const struct panel_desc boe_av101hdt_a10 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing boe_av123z7m_n17_timing = {
+	.pixelclock = { 86600000, 88000000, 90800000, },
+	.hactive = { 1920, 1920, 1920, },
+	.hfront_porch = { 10, 10, 10, },
+	.hback_porch = { 10, 10, 10, },
+	.hsync_len = { 9, 12, 25, },
+	.vactive = { 720, 720, 720, },
+	.vfront_porch = { 7, 10, 13, },
+	.vback_porch = { 7, 10, 13, },
+	.vsync_len = { 7, 11, 14, },
+	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc boe_av123z7m_n17 = {
+	.timings = &boe_av123z7m_n17_timing,
+	.bpc = 8,
+	.num_timings = 1,
+	.size = {
+		.width = 292,
+		.height = 110,
+	},
+	.delay = {
+		.prepare = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode boe_bp101wx1_100_mode = {
 	.clock = 78945,
 	.hdisplay = 1280,
@@ -4845,6 +4874,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,av101hdt-a10",
 		.data = &boe_av101hdt_a10,
+	}, {
+		.compatible = "boe,av123z7m-n17",
+		.data = &boe_av123z7m_n17,
 	}, {
 		.compatible = "boe,bp082wx1-100",
 		.data = &boe_bp082wx1_100,

-- 
2.48.1



