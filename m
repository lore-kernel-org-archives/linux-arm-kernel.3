Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzJ1pamq9XarUrPJoVrKJ+o1LJpxGt0oCpOFUrS2n2o=; b=vqVnBxoPjC/Vo7ggKH4hLHFqhe
	bF0JoLAa+5hIV5dC7/jtIQu/nFlEZaN27S2F1ZKmFwL4NWEFXDu9/fckAxgH6+zJ5NumHy/WV4Kfh
	vRkNileGzdTt6599AP+YQ99duCyiCiWjlbVexJhWwFu0jyP7hf6K0nqqS7siSQXF3ggKNoR7RVDHh
	T28FclXpxK/Zfkr4Wec4zd3LEvthHy7N87ByX5uG0n9TebC7O4eJRr0c0hAWrsrX4B5+ONiaz29MT
	q0tC5xUX6JLL9TfXu+N4+IIg2loO/ROMLWKkSd3HY0kccapeyxCwG6M1eaVap6zllxUCo+ZvTBoGd
	QXcHyayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPpD-00000009U60-2Ayw;
	Sun, 05 Jul 2026 16:36:11 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPp8-00000009U1t-0lTM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 16:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SzJ1pamq9XarUrPJoVrKJ+o1LJpxGt0oCpOFUrS2n2o=; b=XZuDf1
	d4KCxB0e97FE9UKI27Tj70vpA/yW8GO+Tmg25PjClrmDJ2oBDi2/eBlXj7EkBm2N
	Oxj9+pKCySI4rAzvGDSiST/lkQkpRLGC0PXKJSCWDT5F8J5oPyKcl0xRJC2nHg+c
	0QUQFxUBjINve80z3B13cnCpHp20E3Psk8gxXIKolk7Epr57POSeP5SPuEr91oB2
	4+PEvjiMOzT3GIw4O7N6VjY/1In1FWhr+Zrg986Zr5LSRDOYffNNeYqw+6DmEcaN
	dsyx6XbnbjDtELXOjwFxbLZRjbQBI4C3P0x5/w9/QldN7HdS6EerOA1tSl8n9wkY
	2zf+gG3Qd0iPFLSQ==
Received: (qmail 2287514 invoked from network); 5 Jul 2026 18:36:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:36:02 +0200
X-UD-Smtp-Session: l3s3148p1@BFbiwN9VHlRtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 3/3] drm/rockchip: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:38 +0200
Message-ID: <20260705163536.1850-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_093606_516298_A8B2B093 
X-CRM114-Status: GOOD (  10.62  )
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

 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
index d2e76d36d724..aa8642e5b621 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
@@ -368,7 +368,6 @@ static const struct regmap_config dw_mipi_dsi2_rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static int dw_mipi_dsi2_rockchip_probe(struct platform_device *pdev)
-- 
2.51.0


