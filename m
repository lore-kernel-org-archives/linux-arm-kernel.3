Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323A4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGUPbx8djwbEts2hCPE9wL9pJgp/0sxwHbodEv8AsT4=; b=r3yM2V0jsgp3KWjcz3TcQ4nYrZ
	KHcEJCxrJEvTy7YWbqWShCucUJc1rPmGR1xQjcBfvr5r6+8Oqo4daTCsafmdQupY60QQIoHzj39+B
	K6gwrpo3VPeA71jVkZkht9VqIVPkbCedy27LoaQGnwX/x5Xu9sea5x3yOtCrn1Wj7r9Di9PMLfTLQ
	GEcEVmzRoCTRGPa7o+v2+S1wGskDQvfih20Q/Su+VBEaF0EsarX0gxZpWcJwb5Pb+QXHiFo5MyYcs
	J6PSxpq9X49uX2vcC55Virugy//sBcxmedmpPoPQXOTh5E6eLcqtuwKY+JFKYQP7NVxleyj5zKXo+
	GOpcSgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RCZ-0000000DWba-0nb7;
	Thu, 17 Apr 2025 15:30:55 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QPl-0000000DM9Z-1VyK;
	Thu, 17 Apr 2025 14:40:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B601225F8C;
	Thu, 17 Apr 2025 16:40:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktOTxphCqx0Q; Thu, 17 Apr 2025 16:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744900820; bh=ZPvO57N3CWtxySw34yH/mDBNk6iD06GBs31p5atwMFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nmpb0fb72Zc6OMP5Igu4c63x5SOS8hlyqToQsxFeOSkBa1n/Vw+/jHgYI2heVUZBh
	 xNi4zA8OMYbpUPs/SMVFWXSEC4GjRq5Lo90IBsjsxP7Qz5Av59BuogJVSQdcpitUvR
	 5gipKJTpzG+WyiXVJOA1ccQieCe71aBflyUY78gpIQvIKpKUAgBrSs1LREenFUeNHz
	 UgK8wwdYtqqfUKIROOpE4sgIKyF1/NuKbZwRjXKc1221Ug+TvI9oiay6HmgU8fbi11
	 DOD3p0kbI96NkmELA+rG7XXdP77wfMLE4fld0MRXBRO1vmbz30XltpqQeIUqnbtb95
	 NAVR6ovJqLAzg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v4 5/5] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
Date: Thu, 17 Apr 2025 14:40:05 +0000
Message-ID: <20250417144005.43927-1-ziyao@disroot.org>
In-Reply-To: <20250417143647.43860-1-ziyao@disroot.org>
References: <20250417143647.43860-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_074029_531448_DD88FAED 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

SD-card is available on Radxa E20C board.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 57a446b5cbd6..09d917a0acc5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
 	};
 
 	chosen {
@@ -108,6 +109,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	vccio_sd: regulator-vccio-sd {
+		compatible = "regulator-gpio";
+		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		regulator-name = "vccio_sd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		states = <1800000 0x0>, <3300000 0x1>;
+		vin-supply = <&vcc5v0_sys>;
+	};
 };
 
 &pinctrl {
@@ -130,6 +143,12 @@ wan_led_g: wan-led-g {
 			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	sdmmc {
+		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &saradc {
@@ -148,6 +167,17 @@ &sdhci {
 	status = "okay";
 };
 
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
-- 
2.49.0


