Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E60CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfhebTiep4x/BC0n6iM387V6LU/TNbW6vjqr7tNlefI=; b=xSc+AexIPZnm+tcF4PhNDEstUu
	odNWdtkuUif/T03buOe48Jl6+HkM2Q51ivtKkwRIo+6lVbi/SCF32Uzj5/6T+DlI1ayYBt2xh9Fli
	SXwYQl8e17f7posDSw9N78WhpccBvY2nZXuZP8jItt/zsnPzENLm1UYIdLN8+AslCpe54NxvMk6IF
	W0N+5HU8F+/AfAFQ/nZRY4Q7oy/NaiXQhgUn1PXCW6Vn5mt+d+PhgEj1M7bsDRZ2gNgTcVZA0+3bh
	rUuUdfNrz5njiTHfkUfFp2EwVjauy5CfeMpuo7WGcBqopzH/e5GqQ8TXkxoUilAp6UpgL+899S2cd
	2LFnHA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkg-000000062Cb-3ldz;
	Thu, 30 Apr 2026 22:20:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkP-000000061zt-1KxM;
	Thu, 30 Apr 2026 22:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587637;
	bh=OijgcevSjCiOGz6Nc6QVwg9r32SSHhJKUL/h/pxw0pM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C3vZDblN+F4lCzIJoqmOmKMq9WiQMeuYaSNxRhdE8NHuoy5XJNRfrjn4cpgHkqhN2
	 bsoYqaSCVOQ+lUpWN6nevFkLREyRGnStIHhRxi02gUmxd/JvzK+HLqah6wF3aFxgKB
	 8y7JtuIeoblAA+0pwQp0QPllb7dLmnbLnOOYUiyCJgC2ZGu1M5NsZ/gYlRDZEFJw/f
	 jhybhn0HUaOznYjV8KYVj3cTIZH0K0NYpJZdtispMaXBBG8vatH9EuSuox2AiXyOqX
	 52VH5w89paZbrCQKrHLoa1VAyhnRWDUsHFYI1tDhWzvrYDUkJNE10tnO6cCRwKn5t2
	 rbAvoPjBoZQbA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FADE17E1523;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1246F480031; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:30 +0200
Subject: [PATCH v2 03/12] drm/bridge: synopsys: dw-dp: Simplify driver data
 setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-3-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=OijgcevSjCiOGz6Nc6QVwg9r32SSHhJKUL/h/pxw0pM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bQWdKYHd1mOXjoZ1HOaIaLbGPI9pWHms
 TsHpiwQ+P5G8YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qapPwP/RFUHzS5+gmXTvcBllxXxyN6Z9eENH9J/LNnyOia2ml7fu0h3dlT1S9OF2qKNv/K+/F
 YujpBqOkZLwGCEKUi92HS/wJCQ61wVR8yi+OJSYHAlfc7T5sMfYFD6kZ+2L22CucYEKI9SbV0DV
 xinsAwsZm9/UzP51xfMuRPWszm4LA0sg6dKmmSzxAeab4EGl4MJRmc8yZm7TswZBhnWCDEXs+/g
 AY8FtvHwHk7/pJtnZ18rIXM8GqTMz08i2OdlK6dc7nIE+OG8nE27s+DqacXIGnvjHq97wsNyLAs
 aakVy7QLeJWiy/DnNa/LQ5wg9tsm6JO/NRNtMqL1ZAIMs5LbXJFBQ8SCCxvZSSkH3U3tG6Qmqqd
 iemr604pC7wZzCprMUBi6XZAtGO0riRbOP860zVlpst6m2Rs7JvVDtEqCnFYMDWZp+qnsPVet2P
 gxrsn2sbvH7m8wfYu1gVe3aAJE393SMa9ZXBznuZbVU1F5Ba1iyOmDpmaQvaOuMaZpvSS8X7oDo
 K7L8lJijc2u9aVzk8m1ANq5NSDExxPzCtGchti8CbQwc+OLYUqWQFf1WzfXR7Inp2yYWoG/fcb0
 6gw3dN3RSHyUsXUMMz5ZBDIpQUTrMq8kJ+6/Cffeqp+BYVjG+ZC8grzq8sBoyLCiBdu+FKuAuqY
 ltYEfnY7tkPhLYHimkLY2Kg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152041_507909_1CC7A773 
X-CRM114-Status: GOOD (  13.48  )
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

There is no need to get the platform device just for setting up
the driver data. Simplify the logic.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 150c2da8fee5..52e956bffb12 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -74,7 +74,6 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	const struct dw_dp_plat_data *plat_data;
 	struct drm_device *drm_dev = data;
 	struct rockchip_dw_dp *dp;
@@ -87,7 +86,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return -ENOMEM;
 
 	dp->dev = dev;
-	platform_set_drvdata(pdev, dp);
+	dev_set_drvdata(dev, dp);
 
 	plat_data = of_device_get_match_data(dev);
 	if (!plat_data)

-- 
2.53.0


