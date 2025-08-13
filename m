Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A23C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JM9SpV/fnrsLvvM+Go1VUM4DNlcYiERXiLNTjdx9OJo=; b=JreWmX7iDlxr2Jzru7R6sZkYbe
	9fFuZ0ue3RXZnWVxkHNqyl9Yqmo4/JbLxQjRzDMZImzA97CjhTPgIrDMCmquJaG+KOvZm+QB1VwLT
	rPk/wR+7s4vkqIVJKDk2PKkobRLWHbf0R23WgndICHPQeb5rRNvbcVF2yg5dyPOfQrlEQlExOeGGO
	j52ppYAqdxQ+6QHnpohljGxfwCfPtmLgDLDiVRz+lsSewL/aMdFvbHWKPU9DH6tI7pNgY0adpRtw8
	v+aecFMnIFWOeJleh4TKoiYFVY5+wt3/0Gba3extuTip6op4oA8NQfiz3Qy697XU4NMOuT+JXU1gR
	ZE38Gaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umElt-0000000EU6O-3dr5;
	Wed, 13 Aug 2025 16:56:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9Q-0000000ELif-13aP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JM9SpV/fnrsLvvM+Go1VUM4DNlcYiERXiLNTjdx9OJo=; b=Bl4jGz
	19fCVHEkw3GF9z/XPPvj6W0oFoFPA4oyVLyTay1YOjYq/cUbOU0gz2M9cv/StJt5
	sYW/iA+17QUVaXMeCgsb4sRxA18MUEqjh6qY3z/cbwKNlRbkGIyujiz+1I4D1sLq
	4DSoO25xGzEBl7sAK8DKuVviOi2QncDrj6cgtzaUjjqwXHGlCLxNFww69Xuh6WG3
	4g2ibSfe63bjqBj/aVosx4tQH8z1d3UhPmKkwoDvcX0li5f0gjfFYJj6xlif6vLh
	BIrNJN8cBzoGFA2QuLwCB7LcO32aWRqp+xNwHBl/MiATlnMP2h1O83iqOm+hmI1c
	XJjkX/jq6h4NAOdA==
Received: (qmail 695217 invoked from network); 13 Aug 2025 18:16:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:19 +0200
X-UD-Smtp-Session: l3s3148p1@EGQLekE8npFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 12/21] phy: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:58 +0200
Message-ID: <20250813161517.4746-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091632_574420_0B33CDDE 
X-CRM114-Status: GOOD (  10.64  )
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

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c         | 1 -
 drivers/phy/ti/phy-am654-serdes.c                 | 1 -
 drivers/phy/ti/phy-j721e-wiz.c                    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 79db57ee90d1..01bbf668e05e 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -795,7 +795,6 @@ static const struct regmap_config rk_hdptx_phy_regmap_config = {
 	.val_bits = 32,
 	.writeable_reg = rk_hdptx_phy_is_rw_reg,
 	.readable_reg = rk_hdptx_phy_is_rw_reg,
-	.fast_io = true,
 	.max_register = 0x18b4,
 };
 
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c066cc0a7b4f..010e9d2d6fac 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1430,7 +1430,6 @@ static const struct regmap_config rk_udphy_pma_regmap_cfg = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.max_register = 0x20dc,
 };
 
diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 431b223996e0..5b6c27aa7e8b 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -99,7 +99,6 @@ static const struct regmap_config serdes_am654_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 	.max_register = 0x1ffc,
 };
 
diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ab2a4f2c0a5b..a8b440c6c46b 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1319,7 +1319,6 @@ static const struct regmap_config wiz_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static struct wiz_data j721e_16g_data = {
-- 
2.47.2


