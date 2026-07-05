Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B169C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHSShcJl397/HFNYBPP/veNd+JpVpT3y1XWR8oMTxew=; b=DxffVwpSbqWOYdGQUPh9Cg5BQQ
	rwhZZJTkPyT38PDkRsVApkFNY2IXrCeB5mmIsZKz7RFVoT9m+WYVdtwW8IzvFZ7DO8JeEpaHzn0Bz
	CqW1t/SdTHJhfAKOfdKqcd0ZDOLxKAa07/5070+8vXlWi3goVEG4xwnETJQKFBgBbU64bw56K1LWq
	cHXbuzze2BT9QaJkEaLJCLii//bfHqUUyoM9sj4QXbJJLBYTpF1zzz59hyW5ZXK2aCmhZ3IN5ZkLQ
	RiS4I5trYx1gfk4y3CRt7PEUmItmn9sSAesEY8/UTZvXAS4ShKBK4BexTk9mOUjlrcXlgkogiPBpT
	HUSFAdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPp9-00000009U3Z-1iW5;
	Sun, 05 Jul 2026 16:36:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPp6-00000009U1O-47sw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 16:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oHSShcJl397/HFNYBPP/veNd+JpVpT3y1XWR8oMTxew=; b=K9agOq
	9EfbMhjGoL6xdXXD2iruAtiKiCJ8sRV41oQoAfXPKxUNejUIbjGE9tKTbgQ3+Clf
	gyGX1ir87Jqal/RMSePdYGpxLxmi1fW+WrqRAu1uded4o8XMuH3j7GNk4Dv9Lhbd
	RVdz7+H0yVcPa0Zhod7Sx3yuL/8syDrN766Ri3Y6AypneDT1djO+yl/ZhGohkIH4
	kh/LjL5oIzs6Y2mYwjedS+zd2qK8noyiZYGE6Ft3Z/XXvWT/uWTF3V0d3VhSlWvy
	SoHWmjPuR/dEDsvcGuw5BDvDS+5tGe/koFETGpLPKVPhpfQoJdqczweiOzmAEV2f
	2TOSIUwdx+/uK1tQ==
Received: (qmail 2287450 invoked from network); 5 Jul 2026 18:36:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:36:01 +0200
X-UD-Smtp-Session: l3s3148p1@TAfQwN9V+gdtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] drm/imx: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:37 +0200
Message-ID: <20260705163536.1850-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_093605_369220_2107F589 
X-CRM114-Status: GOOD (  10.51  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/gpu/drm/imx/dc/dc-cf.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-de.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-ed.c      | 2 --
 drivers/gpu/drm/imx/dc/dc-fg.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-fl.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-fw.c      | 2 --
 drivers/gpu/drm/imx/dc/dc-ic.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-lb.c      | 2 --
 drivers/gpu/drm/imx/dc/dc-tc.c      | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 2 --
 10 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 2f077161e912..6431ecd442c9 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -45,7 +45,6 @@ static const struct regmap_config dc_cf_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_cf_regmap_access_table,
 	.rd_table = &dc_cf_regmap_access_table,
 	.max_register = CONSTANTCOLOR,
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
index 5a3125596fdf..7a93dda20c59 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.c
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -37,7 +37,6 @@ static const struct regmap_config dc_de_top_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_de_regmap_access_table,
 	.rd_table = &dc_de_regmap_access_table,
 	.max_register = POLARITYCTRL,
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index d42f33d6f3fc..bde6173615eb 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -77,7 +77,6 @@ static const struct regmap_config dc_ed_pec_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_ed_pec_regmap_write_table,
 	.rd_table = &dc_ed_pec_regmap_read_table,
 	.volatile_table = &dc_ed_pec_regmap_volatile_table,
@@ -99,7 +98,6 @@ static const struct regmap_config dc_ed_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_ed_regmap_access_table,
 	.rd_table = &dc_ed_regmap_access_table,
 	.max_register = CONTROL,
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 28f372be9247..fdf5bc34554d 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -122,7 +122,6 @@ static const struct regmap_config dc_fg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fg_regmap_write_table,
 	.rd_table = &dc_fg_regmap_read_table,
 	.max_register = FGCHSTATCLR,
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13..003476ac2fa1 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -49,7 +49,6 @@ static const struct regmap_config dc_fl_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fl_regmap_access_table,
 	.rd_table = &dc_fl_regmap_access_table,
 	.max_register = FRAMEDIMENSIONS,
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ec..96bc3c7c8f9b 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -51,7 +51,6 @@ static const struct regmap_config dc_fw_pec_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fw_pec_regmap_access_table,
 	.rd_table = &dc_fw_pec_regmap_access_table,
 	.max_register = PIXENGCFG_DYNAMIC,
@@ -72,7 +71,6 @@ static const struct regmap_config dc_fw_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fw_regmap_access_table,
 	.rd_table = &dc_fw_regmap_access_table,
 	.max_register = CONTROL,
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index a270ae4030cd..f1c371a95cae 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -76,7 +76,6 @@ static const struct regmap_config dc_ic_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_ic_regmap_write_table,
 	.rd_table = &dc_ic_regmap_read_table,
 	.volatile_table = &dc_ic_regmap_volatile_table,
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index ca1d714c8d6e..4f5c15833efa 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -92,7 +92,6 @@ static const struct regmap_config dc_lb_pec_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_lb_pec_regmap_access_table,
 	.rd_table = &dc_lb_pec_regmap_access_table,
 	.max_register = PIXENGCFG_DYNAMIC,
@@ -112,7 +111,6 @@ static const struct regmap_config dc_lb_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_lb_regmap_access_table,
 	.rd_table = &dc_lb_regmap_access_table,
 	.max_register = POSITION,
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea..54b56dadbe36 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -44,7 +44,6 @@ static const struct regmap_config dc_tc_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_tc_regmap_access_table,
 	.rd_table = &dc_tc_regmap_access_table,
 	.max_register = MAPBIT31_28,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index e861b8b9d8fa..cb09c3f23312 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -460,8 +460,6 @@ static struct regmap_config tve_regmap_config = {
 
 	.readable_reg = imx_tve_readable_reg,
 
-	.fast_io = true,
-
 	.max_register = 0xdc,
 };
 
-- 
2.51.0


