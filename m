Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412E2C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPZjvNpy4Igp1Vuwq5+1EgqW66KUH8qdEbEoQFJVDRw=; b=rY6y9oZX34nOM7D4Eyqd0BKT9f
	EgJ0QIjXYQH+JF4mR42qH5nbbWY3PcdFT5FrJK+mjPeMhcOKlyB0kmBgMfy0nkGJ4Ww/lt5sRTnzz
	rG+1MaRWRMNecfJg1aZ5K+tedwQeK+VbGKA4nkbuLn8Crn8sXMdtHklzyO2oztSWr/ZDq+9JzVkA2
	VY6QVyJXlT7giuMTZncghQTKlLcnP26eJU4DUlNNqBy7AC+Zq6AWj2wJo65shlokIKjXv7iSAfp8F
	ESyWIp7usqbpofPlZckYsQopjQxNRZ3AavjsZylCb0NbQdSN2mEYfWCMO1JiA41JqV0hYig2T7zjl
	eQtrlXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TZY-00000006p7O-1Rzf;
	Tue, 15 Sep 2026 13:51:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXw-00000006nT3-1Pql;
	Tue, 15 Sep 2026 13:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=N+INfekjBuMMcmVtdluU91Yp7X4HAVVFxtjs5huV+jE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R8QbAGbJSkoD0RntpphifopB/AELDqPSo/VA7wvmeTRF4bgUpcboQTCBBgB8ydJtx
	 bn7Qw5yvV8XRy/f/L33YVUJkfPOuv6TUtMs5FGOK4LxbqXlommrkVSS2+4Z7ieMhuy
	 bKb0d/DhNIfT2fcQJwk5xCtzVWlASCcyghoEF7bjXGpP78e9togsUHkehNv/q848yB
	 vaEqtZKa6n5/0ILavnn5IlV9xT9mQO2C4CaliLgQqBkjtNNNuCkvkQbCgePNwhO7cg
	 N6rvGwFNrT+b4c4IJaWyRDB8CFYBNh7PW7IKdb4mxEGL1iFcbI1OpbYfTSC1xi1KVF
	 a/wLkZLrKceqg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D10E617E0D43;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 32177480038; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:53 +0200
Subject: [PATCH v15 06/16] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-6-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=N+INfekjBuMMcmVtdluU91Yp7X4HAVVFxtjs5huV+jE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQVXaiHDpK/jYvhJuEZ8yqy2vpCUkBS9w
 6OWjAY4PIZ29IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa+7QQAKQXQuiI1Hlx3jJoBPi0Bgv2RUKweW6KGUL8ffYIDK8nFLOpYmVQ/w/JoHxKTBWsrcS
 zfZcR4VXTCAuthPe4qLxfwfn7/slcc5xny2im54RShzqVMmAcWBfF6jX5P4gLoWCUBeIYEfc36d
 kG2v+2LoYCXn6BDwF17WX36hgNfcP26X5WI0rcNeGKhF8klzNzWiSf1bR3XL2kH1YBXAqvW7Qgj
 fPX9qx2lEEITyj2ytmCuQ9quFcSQjopUVQtcKS2Hc5aZFF5/w2l2hKz101uQYVDCod/a3xNB58p
 5BPe8enJs3XkBq8eMdC5eoTBwHx56JUnHwRGcECZJSDitC2Y4tpLO6c11WTZkG2pCiWdjsyrkP4
 Na0OT5WC+oxwAlCpgcQqJ1pmT+6+ntYGFDOoHrKBqE2vGnsb0MQ4K7E/uFo5SIjnDR8TofHgHON
 ggbAOBwjc03xk+oGBrXIjUEFWgLegfRZWpmTfPupcQP8Cadk+gbJ06cQ/9TVNO0BHfZcN+1VSrB
 ry1NqpEPifMLUqOKXa84Z92wWYO98S3b/99s5VDqWr45eFAsy7aJWYmlc++8VjdHeqGCuN7Kd+x
 gwg6cyzwyawJSrrCZXhtcIRqn0qPUFqLGwCUN3G8rf9igQwpJlRU1R+mafeq8GADDAS53SiVp2f
 VwUrr3XqTKYkdnX9Ym2Uozw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065006_169940_C515FF6F 
X-CRM114-Status: GOOD (  12.77  )
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

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 93364728bca4..ce2b74a28801 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -451,11 +451,6 @@ static int rk_udphy_reset_assert_all(struct rk_udphy *udphy)
 	return reset_control_bulk_assert(udphy->num_rsts, udphy->rsts);
 }
 
-static int rk_udphy_reset_deassert_all(struct rk_udphy *udphy)
-{
-	return reset_control_bulk_deassert(udphy->num_rsts, udphy->rsts);
-}
-
 static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 {
 	struct reset_control_bulk_data *list = udphy->rsts;
@@ -923,28 +918,6 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	return 0;
 }
 
-static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
-{
-	int ret;
-	u32 value;
-
-	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
-	if (ret) {
-		dev_err(udphy->dev, "failed to enable clk\n");
-		return ret;
-	}
-
-	rk_udphy_reset_deassert_all(udphy);
-
-	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
-
-	return 0;
-}
-
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 {
 	struct device *dev = udphy->dev;
@@ -1494,10 +1467,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rk_udphy_get_initial_status(udphy);
-	if (ret)
-		return ret;
-
 	mutex_init(&udphy->mutex);
 	platform_set_drvdata(pdev, udphy);
 

-- 
2.53.0


