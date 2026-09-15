Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40BCC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSl5w1eVeHUcTwttR6K4tIGdxgx+1BIxEpQ10DQqSYo=; b=zSOmV1Vo/x0+Pv/QR/O6Ci0bHg
	FIJrcJj2mjTSpPSeKCaqi+K5kJEt5JzRiJYA7mVEJPveO+53NviuG6ZZTvuUvYjFsz8bULK2LPlWD
	OENCslLcT3TN/yXuQ7Vo0n3FRQdglG4i6PEWTmUfz5YhZrPjxyN9y70W/qyFWbqz0XtbhE3vLFSaw
	zGNBcB3hYpce5gYpVg+pCaIK3CVug2Tmde/KnQm5vtTpo09eGjHG+S8gEeIjRXZkpbHtEKg+7cU19
	iA50GHJWBR97uelMo4Jv2sVeS6sTS3ingg/cwD1LiJp/hbHHgm9S4bEbsTJGAjvQmsTWTW3j6i8qK
	a7cmDXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VB4-00000007EJl-3d0r;
	Tue, 15 Sep 2026 15:34:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9d-00000007BNd-1XPs;
	Tue, 15 Sep 2026 15:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789486380;
	bh=0dA/iRJjR2HD//0H5yoXiwGPwr5a1ETtxoxNoN4NgYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=abOF9tqldIrp8Bb8M8bd/QkhllZml5cGnNEgcEO3C+cuZgSI9Fbmgb0v1Ro88myE1
	 bDQXLU/BFzbFo2J8nhryEHMpGegzQ3gCNlLbdleAF+sI25LFUBGDJYANll5UtcNGbz
	 TQMGmihEyzBlM2NDjnp6RilkHXjH5Bmz3nQxR1bebpg7Y1n2O034FTRr9W4rJdjEg+
	 D7OaHyj/wJ0EZBLKBAdk6k07USFAClEvgAYfKqV+DMDz0X+4JA6vluvmJsojNP9Lyo
	 U45vxcOk4hVFQcbqp6JOrhhlnIlN/kkqYXvGfjHd2dSbSGoUTbHRphfRhoTlDkK1LB
	 nJGk8moYmxgJA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0ACDC17E0D43;
	Tue, 15 Sep 2026 17:33:00 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 711C9480038; Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:32:53 +0200
Subject: [PATCH v15 6/6] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-6-9ad90a456953@collabora.com>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3456;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0dA/iRJjR2HD//0H5yoXiwGPwr5a1ETtxoxNoN4NgYU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpZSsKW7CuuSqGqzD9MkOgosmZKQx+VwFCq
 l84aPIXVolfAYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWUrAAoJENju1/PI
 O/qajnsQAJ7lNWRi9w5S3bx+dzvRkFvuQgVCU8xpQyXmDgwgTX0d09Gh4bArSIHJkwRx3S2vPHb
 Qw1JcWf7DGp1Y1Ba/tLedqnWA68fwyY+Bz7Hjpx4VQiu05JVEPnZuvNY3HST4mGm/4wi9hQQPDZ
 cy8PR7RsBBncokZbzHW8tC3tAbT3DyoyLsKZ8RnjftSbKqg9+t7VHhkgBzRH22Vty9/STFcO0mC
 /aho/BuUptjUSi2yD5fFLFXZ8+vo238niOSuxReOM+TwAKA6tZ2hT/HR4x/0CMHur7fOmYL4G1s
 Uf1IPG7xW+6iS0Fwi5NhCYrS3lfvEdR0KGl8hEMCOT2u/IcS0XVr58k19Eeqz6PJuWAVC9kC57f
 7yQrDI5kpXXASNzLlpSDAe5F6jguaukYazrlhT/G/fEDkF1M1v994JGgj6OGWgCxGL1afJqJg6s
 AIGfPt5P2PIcuqiQP34mu4rdyGJw09aKyMW9WJK9Y86/uD/bRiaQiVnwnIM0xIPb/l3JQ0USzcm
 jYmfYKUyMXqB9TBlUSo7VK0QnEE8qOYw4+8Js5waxVNbLGSPBF6/qm62kj+hxD9ep5wHCoBcEAC
 IzrsXAwF4TbAk6g6+WwwGscobYJQuz+zfbHtaaaTGGK2rrZI6bwVLPBmLqhZYzOu1OeX3U3P9j0
 HMvVdYHxkp60rdAcskact2w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083305_577268_B5CC6585 
X-CRM114-Status: GOOD (  15.22  )
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

The driver currently only differs between 4 lanes DP mode or combined DP
+ USB3 mode. This makes sense from a lane routing point of view, as the
hardware only has 2 lanes of USB3.

But adding a separate state for USB-only helps with power management,
since we always power up all PHY parts according to the current hardware
setup to avoid data stream interruptions. Even if some lanes are muxed
to the DP controller there is no need to keep the DP side enabled if
something without DP AltMode is plugged into USB-C.

This potentially triggers some more USB reconnections during the PD
AltMode negotiation when switching from USB-only to combined USB+DP
mode. This should be fine, as the cable is freshly plugged at this
point.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 57 ++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ca01c1112c0f..f95c3216364f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -579,32 +579,14 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
+static void rk_udphy_set_lane_mux(struct rk_udphy *udphy)
 {
-	if (udphy->hw_mode == hw_mode)
-		return;
-
-	udphy->phy_needs_reinit = true;
-	udphy->hw_mode = hw_mode;
-}
-
-static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
-{
-	u8 hw_mode;
-
-	switch (state) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
+	if (udphy->dp_lanes == 4) {
 		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		hw_mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
+	} else {
 		if (udphy->flip) {
 			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
@@ -616,12 +598,39 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		hw_mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
+	}
+}
+
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode, u8 dp_lanes)
+{
+	if (udphy->hw_mode == hw_mode && udphy->dp_lanes == dp_lanes)
+		return;
+
+	udphy->phy_needs_reinit = true;
+	udphy->hw_mode = hw_mode;
+	udphy->dp_lanes = dp_lanes;
+}
+
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP, 4);
+		break;
+
+	case TYPEC_DP_STATE_D:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB, 2);
+		break;
+
+	case TYPEC_STATE_SAFE:
+	case TYPEC_STATE_USB:
+	default:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_USB, 0);
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, hw_mode);
+	rk_udphy_set_lane_mux(udphy);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)

-- 
2.53.0


