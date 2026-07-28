Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A58C54F55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYF5DcZcBF5HiwdgPjpSTOYVR0b25zgxSFUDzq+0tnI=; b=pnq3O/fnT9vu8a7oT3KQXCGePh
	wlJXRpznRzWRBvOddOu9WSNgTWlOEEBtLbFIhQNkbhny5RzgppjfEtv7RAkud8xhUIH5vqVGV6W1F
	cXvmsJdjSnVn/wPLtjzGHX7tmYnyt7DvzJfKT0K5WLVcQN4Txsy9eFTh1e+E8+3f+q89o/L1lIe9z
	zLQNO5eK8HQxyT4KY8MyFXIiap+l1tZHtNQWHVikVSP62mRUJjGVdTZSwGlyd4P7Rds6Tt9ZWDiiW
	ABTzwREt6s+5Ya78DefcHCFAJH8JbrL0aBVg9qi3QdD3NhEQt0ya/P6DsGzMNU8iR4g3nv5lIAFVP
	lXMcjlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnw-00000005zU9-0Q67;
	Tue, 28 Jul 2026 17:41:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnV-00000005z7C-0i5Z;
	Tue, 28 Jul 2026 17:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YYF5DcZcBF5HiwdgPjpSTOYVR0b25zgxSFUDzq+0tnI=; b=ZsEhygrP0mzkeAbtHv5nFoVIy8
	H+oMZbZGFUVU0Jzfrwj0bE7afPxkJE34Mg6DKHR+2hj44NZyZZLgauvm/L+gylKRKEm+UJYkkFgFp
	1M5OeB9ZW8wnPMcL+x6Vtk2g2QNOfzPxt1Qvo99VVdFCVzfhz4v1lcnxfM16xU0rYzZ8riGGm+owR
	43w0BIxIcQpJUfi2S9QWLpLGJZrayW1T+dcQ2gm5eXCgWww3pWD9EBvwTZ5823gcm3R3c9i2aL3v8
	4ZjuJgWR9/Cbwfl/mv6alOy+T+V6yKTjgJAapiCHgdwMTgh7TcNvrcA07aUaCnn9TJBbNryWFkRBO
	v7n6oxag==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolnS-00000005ARc-09CW;
	Tue, 28 Jul 2026 17:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=iuepzF46vx4t40BFUI2mkkHoErvXD0YpFQPdNln7noo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kB0vlKJ7E2nSeV2e9/cDGGWi76DwUHw1MGJxgav/F0QGci4zz5JW3Ws+SOJcM8IJk
	 Y1gUlYMayTBqvN3F70r/6TlxQCZ7ejg1POQPh0Ln5yJzz5cvYS8gIK2aS9E6qH/T9N
	 +Gp/nYuRBYR/u4HK4lMVUaOQGPYtjPKrjUD8fHuZ8nz3b/4LxQ1gbK6I5bIfpu6v/e
	 7EgLBDVW5kDc0Qct3/oPj+p2kjnIJfbpBqXCnrzopfcQG7/I/qmC9B2x3CjGeBkWGB
	 ds7PJa0mx0ynQ3iGO6ux2penU+5083AWs0Fge+IBLvnZqKgXBEFVOHcU4FZr8NyX4F
	 PlJ8rPf9uGaZQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B05FC17E074F;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 156A848003A; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:44 +0200
Subject: [PATCH v7 08/18] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-8-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=iuepzF46vx4t40BFUI2mkkHoErvXD0YpFQPdNln7noo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z0MWfpmmaLhNYjXgeNpJ1pmy+gXb8Oiz
 Xayi6XSa5MkOIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaYjwQAJaw2rroWtoNVAd1WszsVq/YikSnc0ks6pSu/QeJJx8oUEbdBvvISAEMN7IB47ZPw1i
 hbOBIIQ/tpNitEIprliJoRhaFUUmQ//XrWkle/73iS9aYQcOHG9YjwRZoOetwwlApBM4nR9muP+
 K/grYXptyk/pWn2IwKvmuLOraKiZlgYy8bFb8Rk6C40cBlkOXs81vewv0hXJctDy1g8n3qSbUNZ
 xzyccJpjkwDNw9FyQ0VLeED0cu/7cQlYWd3XCwTdwlPU8K0nm+bzDH+wTcBzCYAMMZ1DABnEFEw
 Pf5JvvioLRcTjFfdxElj4JONlO/10wOOjeeUCRLEYPslff88JUQ2JzBMnirN+zSb8Kyp7VPGLMi
 fNLL0dLZFLesQj7TaR/ljzxMjGvblVWzZfveTjbZmvP0bosM6WJT8I/sFj7eVff4NdwEAi5T5UC
 mOawo83+qN8+nu2974P5ib4eMouRmb4DQOHLuAmZi1d4yXBIPStCzfPqmSB0LHyrKJ/ypQsQjLm
 +hDKGUeaopyAvJJL0wztgH5W8/jPZ58SKhv+8hyb7pz+Cxmth7GWVpqLyomiKr8yws8qZl1wE62
 6J1RGzm0AeX2kvr4MNISqW1Yz/hRYmdzvlpQZbVmMhcksCG+cN3ijoC+knZ4BT84jI9CMoZL7XF
 YpbYX6vOvfqWgssr4X/Eyzw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184054_289255_D7D8C408 
X-CRM114-Status: GOOD (  14.21  )
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
index 2a1ed27a19fe..719f22578ed6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -329,6 +329,8 @@ struct dw_dp {
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
 
+	struct drm_bridge *next_bridge;
+
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -2016,18 +2018,35 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
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
 
@@ -2040,6 +2059,7 @@ void dw_dp_unbind(struct dw_dp *dp)
 	disable_irq(dp->irq);
 	cancel_work_sync(&dp->hpd_work);
 	phy_exit(dp->phy);
+	drm_bridge_put(dp->next_bridge);
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(dw_dp_unbind);

-- 
2.53.0


