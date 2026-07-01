Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C412C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTntK73e4Z+Ed0kCMaYIzAE0mP21FfBJukzLfREkeMY=; b=CDkEnS/wr5gHx5xLFEsBt+OlMU
	75fxE/gZrYHpDGTg+S+ndRI4O/SgTOTpvwoYnKKFNDyZlzkgIWF2ASuvycQUoco1v2e9ge8UWaIuH
	jp3fAzKQrsjliNe1ZhCa9QzXbgnE7b3xxfJLBSED8ajUkTG4j808K9QqYO2dcYoTyTnjrzi9qyMnL
	y/ucM/m4gldVazqlr3xCmkkOMlLhivX7CIN5MkFmzJ9KWeTfUEq6hkA2XkROLuw31QVmb5ZsmcNXn
	+p8FdcnQh+Z70xXVMFT08/cUQdmvli6sRYl1t9skxzuiPA60BoOIJZ9Bdx7xpUEZOQnbDW7dgWsiX
	l+jjnN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TW-00000003AW0-3wgT;
	Wed, 01 Jul 2026 23:36:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TG-000000039nS-0EGr;
	Wed, 01 Jul 2026 23:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=XnItvzgC6BhyoIOgvg5cwmULp2Ra4K6S2OcJ7rS//do=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fJmVD3i0rODkltHYcFrShd+r9punSQnFCf53+lFVN/dXJI97Z8JYDZzk2O8MBx0js
	 gE4Od/i/lFzrhOo82VUoRC6oBZx1+4Jw3y4M7euGzYEZhmjEun0ksqRmYRqVN2HBcJ
	 ZnRhSse5iwyaGyTVpJDggMdv3ZKH7+XUTJ3NRI4swXLqc8a1aH9e4UOcZJ6ni/OzRB
	 bv0PSmMGhNC+lriRZ6ZctcksofGc6rBOeSAcQ3Dzl9i+hYoR97lsLeSZRci6T1p8KN
	 il7xRlDllM26f5w6fb0EGWlWEunYlD0IKuv38KwG8hE8GMtZI3tqUqeKnXIw/Sp+BI
	 nLR1cr1F3nmBQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 754BA17E15D0;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BCAEF480048; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:49 +0200
Subject: [PATCH v9 11/38] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-11-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=XnItvzgC6BhyoIOgvg5cwmULp2Ra4K6S2OcJ7rS//do=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFNVQMY7McYSaD9BPup5APlcc9Rr7hN3s
 UbieS163DieaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaTuAP/Ri1ot5hObPtouOKAuUcQUkTAwGuComT3sKP70enDWwkDxE2PZj2Evc++/YW3bsrgwE
 2qP8KfNhxBu8BpAz9ltDyq5kznQLqYy3KYka0O4+uYjhG0X8FCOmkFynR7BQogpNCB6mXX32H4C
 F9HTaJJvHW1lBj6vzdIyJcDl5CjTxQAyLX/zKoBv++HQ+auziEyxnmKNHb2BJHMShkYiznDveQr
 CnppoBuVF0hJkCFKNU4/qN37mc3qLdlaTJcz5M9SLmODYW2Lrdt2ZeJix4QocsxUDNNkc9NZQsM
 k0EJKP8u8isatd3qHh7IHaZDVu8S3zfRAQuUFSn/sKtTZBgM6Zkxd+bP0ZjVofmDJAKS5i80afv
 mQeMRw9kH1ra/pUWtnTsQ7u8FDiAErr1m5VDrQhxauV6WtKfWukLpai8CXy1qeMiKWw9Gm6X2WB
 l31DmPN4AMRK3KmFAMqpufKO8kcbwYbXiPsGFLeswpo8C2gl1Gv8hjZUx3ATRxAeB5i5gq2hmGp
 OJW3YByKu1NyRygByZ2v6DENBd+OpyTJJhgXVZhZ1CO1w75dypPMSSHbh6zRKNpjvbjn642ZQle
 vcRrthcDFIiPpp5gzvxqjabpirqG1rM+3FW7OsF21+bshEs8ROMEr8xYBujc4P036XuQhGvLrkC
 Bp0RZqBjP1iA3LYZO/VAh5g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163558_288610_B4B74FC9 
X-CRM114-Status: GOOD (  13.00  )
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

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8202abab4274..6333b5cc7151 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -622,6 +622,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -652,7 +661,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1396,10 +1405,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0


