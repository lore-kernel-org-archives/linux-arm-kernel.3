Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0957C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHfC6bAi9NzJZ707k/0qAsUGniDszH2rGLbaZ7gzJrA=; b=beESvks6a/s9I0RUekd+HD2hNA
	cQfydRdoQq6MMufo3aWi9YBL4sZxyJ9lCmEEC8+nHOdd0VrWsE0/JXYjsZ6rD/V+I/bXo7MzNNUxb
	Ii/rzN/MQaNiOa6FLitu61XX1yA6fp8704SIssPT/XSmL/YjAj+xMobwJ77lTy3lxJew0sqTj8p1J
	3gMzpPOMBEG45fxMUr2mpBo0KOvIVFTsLtZK2+dm6ojicm3Qib02iAS2hlfPDLTsbOnWWG/Xb2t2o
	LXxAsLo8DT+FHL3sAjzLJ++BkoZWq3g1R7PLGiz8hzhvWpIH0QdmV0pMqzquqbNACvXaxvXH3j07U
	vzGrlyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2R-00000000IQt-3Nd7;
	Mon, 03 Aug 2026 18:05:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2H-00000000HzQ-1CYh;
	Mon, 03 Aug 2026 18:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=0v+PxdjpHW4h3oTbY1aMZqJNHKlUwANCX2XcVTK3J3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EGDis56UIC5qyG1cFE4oepqmAt3oPFfKE+y76TNPz0Xvax+Px3N4RMI+MPwTDA8zn
	 7F2fNus2Wbeno5CfnTCcYeO15fiBRssQnvG/ZSTY9VGClZc0TlVq8KZpiO/rLA0DcM
	 aeeI7JXYiXSj4shagp4qF6Aa26oRfINARcEWujWuD0SAAXH1cAQxZyqDpZPyXDqRR7
	 ZOGnr2nluAVFG8+EEBZ0Ogij1Z42JTa4WwOGTrvHZHdrX2uVQV15a8Jyms7AYSI7Ky
	 tI0pIkMTEVXtoWQmTwARZIGlSph1QNRxGJhShAKJZVHQvxHX5doKI0HYhQmqnA+DA5
	 X2B8aLolzD8KQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FE9317E10BC;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 68EDB480035; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:07 +0200
Subject: [PATCH v9 06/22] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-6-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0v+PxdjpHW4h3oTbY1aMZqJNHKlUwANCX2XcVTK3J3I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E5UBZDC904i2kVSP/eGlEpm3MrxGSNOY
 X8/9JRzs0Ajz4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaMscP/1bWEh7KpG7yuSW61iQTIMqOBJCO8vpY4xiyp/dG9lE8e8ZFZTJkYRjlJsygNJCyT8Z
 zwt+AuS3ZGRQ3WMzbjx3OnChdN/Go2lDOuDhS4As72n+zgx9N36z4fPXvqAejw0X81rnjs8XrZ1
 U4X5F4rON8OzZI2ulwVGY85aLl4vASosRpZ1ItW2W+y3iWzu1QFrtroskJmt3hNtdkSDRkw/KqW
 x3eKprsLfeRRyv4b5TxGBC4vj6Rds7jjTxSuVKZ90efKz4b9dv0EjZpguUFOvP13EPH/JGDR5QD
 TN4tMrf/LUeTfrehLYeZ7WJ3+TzV02VdrAGfW5hzyr74ukEe/3v80jn7y6rjrfuI4cFKoBrcCQd
 ze0FXbxlbZKrooBoSfREUkfHJDqx2jsVKryAnqPFDCv9ekMBkYHzfAdOklZQr8jFc60Kp6sLdbg
 wX14XLkz/tk20hxnpU3zwy9aLyfDAkcJx/FMWEF5vW9flkKQ3OlWNS+7tGzkK/JZ93Jh4fLCdzA
 XSnEedys8OMFWDNrXRnIM0u4h5/GmH6NPmHul9o/rQ0qiH2PB5S4O8uY9ZaUorwLdAG6hQ8BTyA
 ByDl4kK/wqW6YCWh5o43CN5sWyraqWR14tNHeN+9COrPrmLJo1nV/dmJF2iK1mWL50pWSr9ZJ1h
 NLt6xhBqDIE+DfthGh7E5HQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110513_583716_9BBC5D08 
X-CRM114-Status: GOOD (  12.59  )
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

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index facd1c479992..af3fa7886429 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2039,9 +2039,12 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	dp->pixel_mode = plat_data->pixel_mode;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
-	mutex_init(&dp->irq_lock);
 	init_completion(&dp->complete);
 
+	ret = devm_mutex_init(dev, &dp->irq_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return ERR_CAST(res);

-- 
2.53.0


