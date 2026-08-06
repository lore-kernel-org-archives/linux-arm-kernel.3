Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783EFC56203
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh5hn+oPX1WvIOyNZAvzyAZ0FIrpCN71Q4YfJ1TjBZM=; b=lCsEECN+aJhWyufu+rbXDz5qIW
	gssnIiPKSljq4jJRjlHgYxcD/dko0vuuEXMK5FLq2A+bi01JJKvP2vG/NOxj/JmH4vumkQAciU9ne
	lwN/fD4diOBYmgqCr6G3OvA5TCcHdCLuRGQuEHq01vPXn6XE9VBX+l5/k4MDuH+FVWpk6gFtV+QcO
	y4JBK8OeB3HfrPXo4E5X8MUOY3eMq/ioXEmQH6MkrNRY8qu4gxiOzqG7EIHFTmh5nPuKAZmrQGWk6
	Ad/t3uiB1iJbRNAqdCAqj6fWYUYed/mAYXOERtFvNOuZOcTNmpw9sd9QvAjcN2nZ6mlJHYgmjj4E3
	firNB40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8y-00000004h0g-0LGm;
	Thu, 06 Aug 2026 00:39:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8l-00000004gc5-35tM;
	Thu, 06 Aug 2026 00:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=9FpV3bb9Yf8xHPTcxEl1re2wN0q3D7uWMoett4BthOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mguQgjGmYeyZbzDZHA9Yh1SLVEHzr69GNCUncsHiEUgT3fUKr8Jm09gyeLG2knvoO
	 PpwWsUtBlsJvCA+si9lh+F5z37LLjn5FWa0jM6OFTyNTQFJcwXs3y5EX2yQ2JIwY6T
	 yDqJNdfm2gGqMW/bV8aBYIwJg4G2GUBAR5KO5JnSlZdEEbrrlOrtdCeP9KwRdELsWb
	 YPcGVHJFgRqip1ZZyZBVTGS3IyZ3GJsfRK91DJ/4oWz7VA/sGX5tITwaawFlXtZf85
	 f4nJK2xR/dEVXrjBguSNCpXM42TFsikf4CDnzo6FXVmgiYwtHamjSjtqQ8cUjvl9rk
	 5HOk01SS2wKmQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4802517E07EF;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 957A8480047; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:16 +0200
Subject: [PATCH v10 10/21] drm/bridge: synopsys: dw-dp: Add follow-up
 bridge support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-10-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2690;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9FpV3bb9Yf8xHPTcxEl1re2wN0q3D7uWMoett4BthOc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz166l8Qx4il2hZc+l9xFnjgOZyqG1wg0CB
 v+yNeUO1cKD+okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9euAAoJENju1/PI
 O/qazyMQAIhAmg7+0ZYXGv0P1r5+bX/faYShLMUu4zd14bDEZHkUC3qDcV4FTco/1z4haxN3U/+
 QwrfUTg6+013T5lBS7Cshyfz+aRiA2AKDGISFuI21StD1W9m8omi/OW9WQcwL2RWXoGOY8RoCCW
 eTPm0xKtkhXoZQIZUcbnbQ0pSLPbrZTl2WmrC1/H/6MJ+y5OjpfMVt9/qyru5zcVnd30pEPZKXR
 sPaCaei3r0E2b2GTxRVY/0N4n5U9ntkF2U2iwA09XOe2NLtqnhpYZcf0L95jhCxuKOwp05PcS2h
 6j9IIz/9KGgWEkWQvlauKVG5FzkHkgZf1O4lB+a8sgG7gxT4WkHrmD+8wQ0TNK0iLSSHTrZETme
 33jKu+oaBgP6hA2BMpcSNxtIap/lDBwAFwwdeHkmY3wsuwzADRFEIzO7Y9uv/d0bkTuOtRXpvtL
 RxW3Tx6VmN7vtctTDbUbiPuVwIXKsvsxxTBsSan9bNCHuCMT6FoBMb24fOmQ7XAjPEbp4QNbQ7w
 /5GhfNh+TaL1Sr1IMsBtPc5mDyoM+FcV4jJxCZXgZOF3NFx7ac61/+o+WALlwkU4ImYdzPPa2tw
 HvyW6JiMu3tq+eMzrvqpYd8MRg6wT8uv6uDk1adOf6OG1pVwjQlUufItebFFLfsrPTTcUSq7lzi
 LWQ2KikgdjTMapAPs/zYygQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_173919_946789_9DECFBB9 
X-CRM114-Status: GOOD (  13.56  )
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
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 106978544cdf..ce5bf9f107cd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -330,6 +330,8 @@ struct dw_dp {
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
 
+	struct drm_bridge *next_bridge;
+
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1893,8 +1895,28 @@ static int dw_dp_bridge_attach(struct drm_bridge *bridge,
 		goto err_disable_irq;
 	}
 
+	dp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		dev_err(dev, "failed to get follow-up bridge: %d\n", ret);
+		goto err_unregister_dp_aux;
+	}
+
+	ret = drm_bridge_attach(encoder, dp->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(dev, "Failed to attach next bridge: %d\n", ret);
+		goto err_put_next_bridge;
+	}
+
 	return 0;
 
+err_put_next_bridge:
+	drm_bridge_put(dp->next_bridge);
+
+err_unregister_dp_aux:
+	drm_dp_aux_unregister(&dp->aux);
+
 err_disable_irq:
 	disable_irq(dp->irq);
 	cancel_work_sync(&dp->hpd_work);
@@ -1905,6 +1927,7 @@ static void dw_dp_bridge_detach(struct drm_bridge *bridge)
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 
+	drm_bridge_put(dp->next_bridge);
 	drm_dp_aux_unregister(&dp->aux);
 	disable_irq(dp->irq);
 	cancel_work_sync(&dp->hpd_work);

-- 
2.53.0


