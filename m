Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APOw7S4+4y4l/nf/nDC60mpDDgMQlw+vtgaNOP/SUbI=; b=YmoHRpRZ/k91td9M5Gd1U0EKQR
	rIOKRJTRoGH+gt5bREeDL6ObT97/K4kWC5KYghWTNPfw3AQueiN52JIrNjUHIdEa8QqV0wMbYObuz
	qiO4MGYaxhWdXwcfaSDf2Z3wqrclnoP0CVbiBqLlyjvSoEKfeHa6oX1HSj/R4o4OZpWFbQicMf3jw
	f26j8TyFTqlhj420Hy4cVxoIeGblMCIUQg141vAOxHHRJ9yktE3KlRjdGVeY9b96Ui0gwYKgDXyRB
	fP0hKlpPgqHbZyNE4G2+ybAS5tFUlRvK/6//ua1fQ9MWgawxaTUFmLJyLPQqs7XdYrMjizWDB2Zbt
	u0Xwmx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENI-00000005Jrf-05jY;
	Fri, 10 Jul 2026 16:46:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMs-00000005J9Y-0lCx;
	Fri, 10 Jul 2026 16:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M+yyFOesIJuTg5LN8lmyNa1UeukZ3bQcPmyuqQwEupm5dORucIrNpOGZOZFpXpTFE
	 GJrM/GbNMGttIOHxnzLgLZBKv7ruS1ToUw9peuugLZV+QmuwRTkHxK3vsvFqdVr2hQ
	 UhVC03wgICVS/Xc79oUufL7eq0A7beVrTVXjXRnSd8JKXk7w025c8l5We5O0tq2krw
	 Rp4/31KM2otUapY0mRTVWbtazpdau6K0S4pI4mkkCFht9zhaYmqv74VmQS4WwhJjJH
	 syUmv8R/tl2YJXAvVmjoyg/LQ+EqzVI41U8fCKg7tJlfW0bp/1W0gCncmDS7jct7ez
	 R7UR+6Y8QAaRw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9288517E0FAC;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EA99C480047; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:48 +0200
Subject: [PATCH v12 10/36] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-10-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdjWfsU3j+/kpXmTSJa/LAr/ZCc0tRP+u
 g80fA7J+CsmnYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qav5cQAIDXlutx8s8SmRu8Aj9GBw6EEei6Nb+mDvuEuL412p7h/4zXAStSQVbPVfxFrs1DVnV
 iVUutWzPt2vTwgiQJ09JmCMECN9/2JdsVWaw3tMRnGPHQ0dTJ/PRlXmmn5D2Qq34kbr85lW8TTd
 c7uLOKzlNOV8s+fPg0GA9odVc9PNrB05WHIGVv7aL8nqJZm80Zenqq6lGA1kBSAbtXlWGeHa1+H
 QeHHBRNlQt735WCm+u6OdbeJuMKocFuVCuuqzE8pVG58ZLykZLazMujShihJzsy0t0t4Y/yU0bz
 ioUR2NQsGxG05hHTl0rbJmi3yEHtrUuL+uBNED2dkNamVoTzcjlUDPVcWwNmoGUGYxVVAEkKHTl
 hiOpnIqCpunZeQT/ke2jFCGe1V5pLQFg8Jk1lRPU3HU/EGLlD6gfRgapCxKtZmskyEfXfRRtASb
 6gSAuwCFIuTMa5W0/XI6CHn61nxEu/FhWNeyRNiiFK4Jt85Hr82MRH2orIctywt+igK2Ehk3oYp
 y+Gq9dHybyZisXqdo40JyUbrfPoimwHpLZgsxV58PaZ0iDUjCVu0oJqxQSDJwX4kcEb19gyfmXa
 sjz/6Xq86ct9HTuSFXudR4cfKhq2h7tELjGiAMtCuS82MuGh+YzdA9C0PQH40i96b/LuLKDVNkq
 Gxw3JV16qGWsA9HGTpoIsiA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094626_386019_5614F908 
X-CRM114-Status: GOOD (  12.78  )
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
index 982315535caf..7540c897dde1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
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
@@ -647,7 +656,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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


