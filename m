Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC43C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QXKS5MwQf6T0/WAFW5LMbVz+HKZ3oe7QplhumziNWM=; b=l1n6w7OU6bfo8Ua4w9LS4bP7OB
	z2e93KP+5H3WZgtKqZWe+57+3zHjGiQjd1a9uUNT8WD3N3xFcecqAx8TDRG+HTAkC1txfV3O4gdA4
	IBFFqWFnJytOuEUY85o4ECjfrexC/iX1gYfj/vE52OijTPoUeN6NKVJJkJy0503InXxdmsfsbT50a
	hyXjIXoV3EV1EbAX1/dBW+WzHqEJIJCabfL5FUaxNYJo68js5Utf8vgd0tvZGKbz41VusLGwHkCUK
	wbebi4ZVfyFmhKQEUQJpcJgp/CUgikGh8D7WA/xi/6ZoFvrahOk0/HzO2mxPRWwfHTx5oeGo1cJoC
	8IWe8crQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOh-00000007eF7-28Pp;
	Fri, 03 Jul 2026 18:13:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOS-00000007dhR-1a35;
	Fri, 03 Jul 2026 18:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JvC8BZKlfLlXmv3ZavE1Erei6xapCT3LOBlLklzI8FH/4JTjrvoKo12p+pYq49i3X
	 1Cauflew0xJQ62vbhZKONsGJnwciTtEW3l5WOZWbOa9amplM3NRF9uG/9NW6qGfv4i
	 t96I3sCYAIXJXS+0daMS2dme/q6fhP1xT7P+ZArhXR5oB0qH//ld2qzFlluw4shDN1
	 pagQMGleebuiZanAxlWD9PHz1uopPqQz09616OTHIJjg4sQ4f6f1BCNzpVgOQsWpyf
	 dWl068boBiG/loRrRoncxGsDBgQoMCvviajhoLOxj4AR5fJWrcBK/QoPc6XO30K88S
	 6jfDJ3D1Hredw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2556517E1131;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 81D3E480035; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:22 +0200
Subject: [PATCH v10 06/36] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-6-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8upJoMuB4CyPZfI6EPG5/M3IBUVhIde0
 Svx7ah1+RJicYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qa1GoP/0SCeIW+rtw4w0bmEdP3FirR3Bcjr1YGPW3QonDEenxvI6Rz4ngxq2cvoGV8EnNOhvb
 f24zdMo/aKA4fUzy7N/Ggtl8VjA00G4x3CgrMlqZAeFv63zTwrtcDSC2iWiQOf+4K8+06x588d2
 aOldG9u92ykbQkx69pTMmQ5kPj6IZwoff9SIjlFZ2gI1sU7kXf6KCsjboiINwjrmdMiwSq22+hQ
 Rwtv+uyH4yS1Q10UcbdBJHxFZQtcjmQ6tSI11G+iqCSu/0vB6xaWZ5F9v+kRR77z+fFFakknrgO
 TrZsMynim1ESpuQhQvNilDhIi7SIiOuTjdftawWAx2sHD2vQBgVr+83rd8HGC+6zeLurq9KNWAE
 zHYfybCl5m/6XecFPEAgI1PTpgQjgsxKRj8zQdcWKMk+qQSJL0l3JKa/JUYFU4M1rLZL+TqKM1+
 9EpuedAAVm1H3RV5uA+M6gU4vEVNW/tnBIWvUdkUMIIkSIcN4pWPOAG3WQFrWCMoue2rmYwH8sU
 hRA5+fEZge8mLlymQ9i5RAdKgPMtqOdcatbaSeivWgYTZSDWalM3PIirbcx5rGwosIVn1OnExko
 iFRjb2FZN35KEt2+COoKeIyhAwTBsHwqK9ml15LZ2/Csf/8i37l4PBe8/+cRM+nr/GGI0MnPlft
 XXYLAItQ9E11CbXo+7Ho1gQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111340_764013_61AD30F3 
X-CRM114-Status: GOOD (  12.64  )
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
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..6cb9f6b4dbf6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -452,11 +452,6 @@ static int rk_udphy_reset_assert_all(struct rk_udphy *udphy)
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
@@ -924,28 +919,6 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
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
@@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
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


