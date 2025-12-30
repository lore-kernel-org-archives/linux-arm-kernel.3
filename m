Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17549EE498E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9uMm3rSbQlpCTjjn29mzd71nhDh071bBAUlV4E9oyM=; b=lWmzs1qVtWeVOeKFPzq5+/BzXj
	GHGkctiU4pFMCq6O1TCRfUe4lcG4BsSEG0vf2uz516/6Bx04/XCp5KZv+2pD83TZagqaEqcORUspR
	iG1wNuMQqXu5JRUnJmflwOVMc9Qar47PHVT5DJn2H+i3hdB6GJkADzwQmV4YF1tlXZCdfA5xsQn7N
	mjXUdzX5puWfJTnIsN88YRG07o83WMV1So+m9+FvOf+cnQLiRD3JuuRdg0o3sPKVmzN1nJSDmKs8Z
	Gxxv8s1ENrfbC6Pm/cQYMeKfJDIVtvAWeKZ78CbIM0o7xQUkbY4AGPt5l5VM9LCxciWq8Tre2yNvM
	hywNuU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadPQ-00000005729-1B7X;
	Tue, 30 Dec 2025 17:21:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadOy-000000056pj-23eY;
	Tue, 30 Dec 2025 17:21:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E45CA1515;
	Tue, 30 Dec 2025 09:20:47 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B9BC53F63F;
	Tue, 30 Dec 2025 09:20:52 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de,
	neil.armstrong@linaro.org,
	dianders@chromium.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: jesszhan0024@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] drm/panel-edp: Move FriendlyELEC HD702E
Date: Tue, 30 Dec 2025 17:20:32 +0000
Message-Id: <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_092058_881211_05056D80 
X-CRM114-Status: GOOD (  10.01  )
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

FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
to the eDP driver, also resolving the warning about the missing bpc
value in the process.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..dd53ccc209ce 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 = {
 	},
 };
 
+static const struct drm_display_mode friendlyarm_hd702e_mode = {
+	.clock		= 67185,
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 20,
+	.hsync_end	= 800 + 20 + 24,
+	.htotal		= 800 + 20 + 24 + 20,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 4,
+	.vsync_end	= 1280 + 4 + 8,
+	.vtotal		= 1280 + 4 + 8 + 4,
+	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc friendlyarm_hd702e = {
+	.modes = &friendlyarm_hd702e_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width	= 94,
+		.height	= 151,
+	},
+};
+
 static const struct drm_display_mode innolux_n116bca_ea1_mode = {
 	.clock = 76420,
 	.hdisplay = 1366,
@@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
+	}, {
+		.compatible = "friendlyarm,hd702e",
+		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "innolux,n116bca-ea1",
 		.data = &innolux_n116bca_ea1,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b26b682826bc..3ea52667b858 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2359,28 +2359,6 @@ static const struct panel_desc frida_frd350h54004 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-static const struct drm_display_mode friendlyarm_hd702e_mode = {
-	.clock		= 67185,
-	.hdisplay	= 800,
-	.hsync_start	= 800 + 20,
-	.hsync_end	= 800 + 20 + 24,
-	.htotal		= 800 + 20 + 24 + 20,
-	.vdisplay	= 1280,
-	.vsync_start	= 1280 + 4,
-	.vsync_end	= 1280 + 4 + 8,
-	.vtotal		= 1280 + 4 + 8 + 4,
-	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc friendlyarm_hd702e = {
-	.modes = &friendlyarm_hd702e_mode,
-	.num_modes = 1,
-	.size = {
-		.width	= 94,
-		.height	= 151,
-	},
-};
-
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -5235,9 +5213,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "frida,frd350h54004",
 		.data = &frida_frd350h54004,
-	}, {
-		.compatible = "friendlyarm,hd702e",
-		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.34.1


