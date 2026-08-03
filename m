Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B42C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoqwZRVw88M/jChrvMG6oIHOxkUrFVheXEnmqUVviwk=; b=ha6I7ewl3MOEoGVa4FWkF9FhdK
	GokDtg7n3AjEyBFTW5RMyU7O4dAngyx6l73Fee/dak9nRS16AKsYm7SbJzw/BDFnsPGyDL4xVER4Q
	Ee7b4dWDkPgQNb8XZqGVVucMcHQ4Eq1fhIXoNJuPbURkvZir2cg0HQZVr3vITwAVg79SeGto8yRLn
	VQ0mV1w7EDMvyqdLx8xapb02pTQci48U8NKJjywPIUqgq560eGmykpJggrcnd0j4AWS7yRvjFeM2/
	/pjZTJXLtiC3XUqKoWYopmS1WtWFqtJijaZDBpqiFdNohu5fEMtnb3UX5Uousr0rk8LMd8i5+sveh
	HX1BkqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2W-00000000IdT-0gFB;
	Mon, 03 Aug 2026 18:05:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2F-00000000Hxj-24mg;
	Mon, 03 Aug 2026 18:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=vWHtus49X0hw1sn+NkpE62a91N52LNCAbMBD695LMik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QgldZm3HZ596a7+ZAgIJJ3KGQ39ltqVuo+XHbifbcaGT30m5Bp3AgcNFzBG5UjjzW
	 A3t5xQCsD7SC+XykgOXN2s2WxGhpisxx8e3RdF9Uo/JmKqtoAyIAo1uXf9mZ0tC1qj
	 oHaJqGt/BzsFQPDeUDiqVAEN2z57vKnZpKjBswUvqCHEpxISe5K+IJo76jXLC31R47
	 vGG5LCePCudaPLUQy1DrwxpIFeMUHv/hkHIKgc090EqTwBVQ5y4PepnoeJnBZDvCGp
	 yIYZ+UwxKRLgpWCdTlPOOhOOjGfzYpTxyAlcIIuv8B2OfcOR17JxuKJHRMv9QevLv1
	 fR6F4YNVzr8lA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BD6517E11E4;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 707A5480048; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:12 +0200
Subject: [PATCH v9 11/22] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-11-2e6e46135312@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vWHtus49X0hw1sn+NkpE62a91N52LNCAbMBD695LMik=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E6snqkjQpQJoi0luDT4tnhQYhv3lMHaf
 msTkh3eVHWWIIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaWfYQAI87lpMK3uwNe3zeQu6zC4e7IS7Ze6gpM3Sb0wAdWcSpxAHBGioyqZwT5c4rip0EYnM
 SfUP4Ll7zdO/n48x/BhlZ2r5w+GSKgk5jNc1XmHpDSYvg1DnD4kPcT5wiYTSsURRlvXFnBpEa5M
 JtxB8BytquQfx8PZsEsUjlZ73Kt2l/A+ydrNya3flif2DOe2SEoGDXVkihxUSi4iinjvC7xx4FM
 ffVOnDx4wjluznyMQmOwJyW/RERNSLIJ/GACJfmhnsddcAUbjk+lRonghpOe4oqZR4pEP23yr3H
 FHdvwLJ61BlRQ0h4O+uNz9pFXsgU9XML9/8uRiJNlaEsJf5nAAbDF9qFWBcuQHK4BXXRIEhwY/5
 iOa/NFBB945//Z13Uddz+0V8QEMBPzkLLFy/dI+uPe26Sl7XxUlhW0qwGOqGw+/4jjqXS+tnLIL
 2/c5Q/lsBm02Y4hYoMXsU/h/KMQ8lPmt6y+gKK8YnL8XRS3I7L8sHJP+4Vs3WU208VVDBP3ror0
 ZkY2v3kDG1JIOpOwaMSmxzOpeMlDOzxQ5ftRwXtSeymWjJE0CdTZO+u10CHjY/tOfH8CBKwL2N/
 Lhm8z9GIjT8V7H7EoA4rXi76rmimaIGYLBBZpmjzu5+pJ2VOcbUVDEtkKufuQzAWLigCjUdUFMc
 ZPmbz3BuUD86I1JTEzz4tIw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110511_757813_493687FA 
X-CRM114-Status: GOOD (  15.20  )
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
index e60dab0d3b9d..577ec42c94a4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -330,6 +330,8 @@ struct dw_dp {
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
 
+	struct drm_bridge *next_bridge;
+
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -2049,13 +2051,31 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to attach bridge\n");
 
+	dp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		return dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
+	}
+
+	ret = drm_bridge_attach(encoder, dp->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to attach next bridge\n");
+		goto put_next_bridge;
+	}
+
 	return 0;
+
+put_next_bridge:
+	drm_bridge_put(dp->next_bridge);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
 void dw_dp_unbind(struct dw_dp *dp)
 {
-	/* nothing to do */
+	drm_bridge_put(dp->next_bridge);
 }
 EXPORT_SYMBOL_GPL(dw_dp_unbind);
 

-- 
2.53.0


