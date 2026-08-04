Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED9C55ABC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=; b=MUo3FLhVmxRYvy7cViyj76UrR0
	hGXNjRXSOdX5d/1dq+P3JwnK29ucZtr5Yn6EY6w2XFlY650KOZSUoDxEcrACkrI6fZtjOR7SSysTt
	j0p0tbYCboWwL35mtNZ9f7u8WeoysQ5Xch7qu8uxHQu5i8v0Xojx+xY+3c+hT5TR/NT/t/nLRaaUY
	QK4IoprSYDIx0QxP3khhQ9UYMLgaM4O2atV2YtcShjo3p2tk+YlJuuiMn2d0xtVEAaxV+KX2J/oxP
	cryJZwRpEpIPb1ybSeYC+rupW7M22qfqpmu/km/qAUDc9ZDEQxDBqvqtfGoXV/76XlGss26LPKGfM
	jiObFTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Os-00000001Cxx-1xH4;
	Tue, 04 Aug 2026 07:17:22 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Om-00000001CYt-1dPe;
	Tue, 04 Aug 2026 07:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827298;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=;
	h=From:To:Subject:Date:Message-Id;
	b=pgysLPSKhco3sMM/jci2VixwgqgdEP3DVtJY8+ymFeeCsM28uQX7zoNoMDJ+3nxrG
	 NMqGb1KVrq0NYFAlgkNPnKcq4GSmfbnz9Nf6lge8n2S84JDI4lBmVndCWGcWnGofdw
	 q77SdDhYGXx1pAndrQoApW9YSAhUC0QjSDEZisRE=
X-QQ-mid: esmtpsz19t1785827296t5d5c1fbd
X-QQ-Originating-IP: 0cHwMQcP2BBEqYGFtlahXAYAHyCJF7V6tqtxURYr1Mg=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:08:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9911778146744449110
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 5/7] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Tue,  4 Aug 2026 15:07:28 +0800
Message-Id: <20260804070730.68-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260804070730.68-1-kernel@airkyi.com>
References: <20260804070730.68-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OaUS/vBL36PcEzQO6Z6f+WAeEsVjZiLXs40cvGfyr6DfYpua82S4ajAE
	v+tcsSbUfU0wlnsUSHKp21ylXmQs/2BLeQrnf+6eESzo+mXQERHA4JoIWqc6PVXV9Cy9Dy4
	vUNdHNk3wzCeKQXobmuXHZhty7CviVNIDG/Nee1KxnbSBotqMJ0V38cxatAuhTMTcVCGNYP
	ZaQPYDQrCVLEJ6GqlxnnSXD/pLj5F60MbdO5Oao6zFqaoQ91I1sVKN0ZTI5/G/xMbBoSfE3
	XcEXmMEfPfAwX4S19ABDGsSGprWRN/NUY58xSWl14l53PKcD4jCUuIxtXQrNAoT+HbEPbj8
	6cp/UbAKf/3WEolc0q6x3tOAIXowJvR9MDt7sGgxIpWlkTO6tuEHoXYkKuS2LsgAu9iu6aZ
	NdBuB3M4Z0YD+GAOQ2CClPLPEaEjK69pyJxlMiDhG8aLRr8gJGDrwOXEnHY4p2XTjEo5N/L
	hhi5BZE5TWQu8jJwQi29hiewTUhiZQkalwho4v0rJsNGRwknAgdLi0F0qE8y9QfGNnr/gQe
	NqGX0lDhOz2pPJn6kujxZ6VwOKtBLCkAzhFjIcKI1o5zEz2jH5oLuT6N+iWLIaE9AmsR1gp
	86bXZQM9NKko2/DIxExaE/D+iIvv9aXh6ie/tu7yf5CR0llthu8i5LiSuW00HLjZWUlf3o+
	xAC9dtj17MP+B1DfXQ+utmep9AAaosmuC3oLtWsWiRFV4dMXltppmZki9pzaa6ttkPM/VvR
	zDos0NPTfpPwiwvwn28/tW8etg9CSBRhKVd43oTiaQzXTlDRZiG2nRisiJnL7XuyqvI+ZKh
	6rPw9weY3JcmMMmZFtQ9IBbYh2T1frtUWaFjNDvMKJf4Dfb2ThjRGYkoxt5hcFAgKPmK72N
	chSxTzd+1GDLWAitJ/ymgBbQJQXfGE14TFxWdUB8ki3c7dXq/oIzU1UTs4eJx1njsH/Ii13
	4iIloOLjHj12qaDX2TlqVsJ4haggC3GIFt9p+GdBcS+hjAxJ8KD17aoCJkmPj6oeDCSu8us
	Rl46kl/ibWJ7c9hyS4pqU9bcRa2msZyNOiaeKnqQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001717_378506_0FC48799 
X-CRM114-Status: GOOD (  11.94  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
device.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

(no changes since v1)

---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-typec.c | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..9173d3b4fef4 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -119,6 +119,8 @@ config PHY_ROCKCHIP_SNPS_PCIE3
 config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index d9701b6106d5..48070b50416e 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -54,6 +54,7 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -1162,16 +1163,24 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node(np, child_np) {
 		struct phy *phy;
+		ret = 0;
 
-		if (of_node_name_eq(child_np, "dp-port"))
+		if (of_node_name_eq(child_np, "dp-port")) {
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_dp_phy_ops);
-		else if (of_node_name_eq(child_np, "usb3-port"))
+			ret = drm_aux_bridge_register_from_node(dev, child_np);
+		} else if (of_node_name_eq(child_np, "usb3-port"))
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_usb3_phy_ops);
 		else
 			continue;
 
+		if (ret) {
+			pm_runtime_disable(dev);
+			of_node_put(child_np);
+			return ret;
+		}
+
 		if (IS_ERR(phy)) {
 			dev_err(dev, "failed to create phy: %pOFn\n",
 				child_np);
-- 
2.53.0


