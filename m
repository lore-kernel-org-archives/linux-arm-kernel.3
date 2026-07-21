Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85198C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Qkcc0zXS9xB3yqXihx56yfVxdOV+exgN6RPovcPeX4=; b=w6SRzMIMN4WZGlTidKK3JiDx5l
	nqCaIeCKd1a7s8k5vI8dVMA9KaSnLMeI/S4DIeDzjKgMHKDwyYEtz/JcuGnw8ElIr5YouusiFPuF9
	Do57UDELpcnwrVNVy2HiYBc2r6RFUgve4z99CJmmSbX0J0PYYcG1xD5DEWQQxv+xIbxqkF9JV+vXi
	CN1iEZHN1zEsurBJf/8d6Vajodv//RFIcVCcJ+uGsvdm5Sjj4fTxIEg/4Ozsk12BB+F2MGj+vH63T
	1XVlwFXayPn08OgeQ044mroYTx1e+FFxTcbJenwXxLu0Iw5CUiMApy9bAYPKwpC6850a5h6codnrr
	JEIYMoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEeB-0000000A6xW-24zc;
	Tue, 21 Jul 2026 17:52:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEe1-0000000A6pi-2lv2;
	Tue, 21 Jul 2026 17:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784656358;
	bh=F4BrRjFviO71BqTa0/M+DJMgwptFTQA7fNEwqLzoieE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XMfaaq0DZkW0JTJElZ6n/tBjEjfcrYdDTEx38afJX/DvZrhqB8amk2d4Ry/11FVJS
	 4xdtrpDcfbiziG84bOh5xMcL9eF4wLHtYdhrNV3rBFO9/Pv7tbtPYdYfTPxeHdlrzI
	 Gc1+874ps7gdLuye7AhA63n97WPtA6GfSLbDdXA+H1bVCyE62qZQ1DpeJ6qzin7sOS
	 2uvSLMNGKvIcRhb9cPq7sLWce8D+H/uAhtwoeyv7aVltj4gEP7L46+kyjJBV8FrMY0
	 L7C/c22PQ/3Z0I0daQ7Eqf3y70RMNstIEBNb5836/Gc5bp1HWK/60VMpN9zHCOpiye
	 u/8DVElLgWo7Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E499017E1078;
	Tue, 21 Jul 2026 19:52:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9819048002F; Tue, 21 Jul 2026 19:52:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 21 Jul 2026 19:52:33 +0200
Subject: [PATCH v4 03/10] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-synopsys-dw-dp-improvements-v4-3-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
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
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=F4BrRjFviO71BqTa0/M+DJMgwptFTQA7fNEwqLzoieE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpfseXu2xeAkd/HPdm6crAbguEIl46uzZE6g
 +dqFbJRl5j/04kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqX7HlAAoJENju1/PI
 O/qaj8UP/3zFA7fAGLscxeldf6FxsgEdelxSp3mitYjuztqDM2nrIS1b8vowQZfijZQRqS/d7n5
 I1FSjp6KJ78TdXd21w65YUewsjM5nXdMP8+kGC+cfVwZwRxrBHzZk0g7zlBEoj3cX317qLz0rsI
 CcVwI9Wd54NpH275UFvlm7yLyUarQbvlTR2zl4K+TiDK8gLwhKuyvDLGLJOfz4ePZhmB+SW5riw
 PU8viG/InMtGjrG5ucU7MDFG2jbGg5Z0gvPTSB8bFHs2sbjezjvHg9HoZBZ9z/QDN3g5PtimPKk
 Fgw2HnXPlqJn2/2Up7lgApcj2zhCP70Yx3h81Zd5xOSiTC6zIOWDoHiYfJmQzzT3BXOlc5HpGwl
 qdf8pGzHQcg6TDQGHKxLaBjjb+y4Fu7fwlzZLHhzPaIHIWmIA0PUlXGnQvyPBuSt+wGiEUehlfj
 CxTlrKwjsXCdChFcpKI8VLsFy4a12ZSJa0vSq+DnsamQ27iIA933rfzBDqYdBCjBv8pxuFRuidO
 miV//IbSLyp0KXNVhtfXriOHWCqE7ekMogZ07MbnRv3DOmIkMGLTuuyRxVFsin0Gn7DLV7Dz7LK
 19M1+wNbXMQZXDUAPcUS4iny7vGr0zJh6JWasYrUDLj+BcsiebmVrIv1QUpEoWNkNNuqyzjpLv5
 8TjC08JHri+hdrpsv2d816g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_105241_857763_11F48AC5 
X-CRM114-Status: GOOD (  14.81  )
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

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

It's fine to fatally error out when there is no follow-up bridge
as the Rockchip Designware Displayport controller is the only
user of the bridge helper and has the port marked as required
in its binding.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index aca6816febe6..0e8ecd73a000 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -329,6 +329,8 @@ struct dw_dp {
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
 
+	struct drm_bridge *next_bridge;
+
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1988,18 +1990,35 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 		goto unregister_aux;
 	}
 
+	dp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
+		goto unregister_aux;
+	}
+
+	ret = drm_bridge_attach(encoder, dp->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to attach next bridge\n");
+		goto put_next_bridge;
+	}
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);
 	if (ret) {
 		dev_err_probe(dev, ret, "phy init failed\n");
-		goto unregister_aux;
+		goto put_next_bridge;
 	}
 
 	enable_irq(dp->irq);
 
 	return 0;
 
+put_next_bridge:
+	drm_bridge_put(dp->next_bridge);
+
 unregister_aux:
 	drm_dp_aux_unregister(&dp->aux);
 
@@ -2014,6 +2033,7 @@ void dw_dp_unbind(struct dw_dp *dp)
 {
 	disable_irq(dp->irq);
 	phy_exit(dp->phy);
+	drm_bridge_put(dp->next_bridge);
 	drm_dp_aux_unregister(&dp->aux);
 	drm_bridge_remove(&dp->bridge);
 }

-- 
2.53.0


