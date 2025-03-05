Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363FC28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWbFZyQmx+peBp2XMPPS7NYrxQQOXmpBo+37f8UqiYY=; b=hfC1jQAW6aJ+LyAsS5kaU5TZHx
	dTnYpU55xzD7Qo0dmV5pffOoIpvlnh2RJZL7uUnwVbQ531rRohkETwvORghg6gGUleC+KiNzEwpJ2
	CXrYGIVaayPLFbQvJKhluRtG+thkRLB2lUrBuVdZM7LslQePf78mbAhWYsN0E2UAJ3XstCtzJmEGR
	f4RViaSOhRKNKQnK20a44dLyXsarI/mccAGw5QiQzJHTOMG2c9iYQWjGXz2bZ0Q4vF2YbJXf8Bnlp
	0W9C+61vZeVK7T6yF2fXAGuPXGHdxCImTtpFcwJRYl26HTkVlYfGX1rDujFadVdzFydcRQZxlkpYh
	lKCZCGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwNA-00000009MQI-3DwO;
	Wed, 05 Mar 2025 21:33:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuhq-0000000979X-2G8o;
	Wed, 05 Mar 2025 19:47:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4879F20262;
	Wed,  5 Mar 2025 20:47:01 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYavXPYzK2LE; Wed,  5 Mar 2025 20:47:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741204020; bh=Cs0UXnmHDTiLw3nJGpRGirh1JgzPrpDVR6LfngssIoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gwirLofZWDZX5DLT57OCV/TyfjaJ9sAnYrPQXIJRqBPrDePDiBek8n/uhFRyCKWvW
	 wtaP8GA3WE2MI6Db3AGyz/TBWWkT/N3JEl7ZJhQFQuYeoBH1LgFNeEJgrnhqtblLSx
	 DhIW0oZ9AxgV7cu3rzFs47sepHnh+WdK/sa/Vjx8LFp4Hqr2kO57zjCouJtn47zGJ+
	 D2qLQIrGfpNCy8fusBiT9i0g9RtYLHrfZO5cne7vnuJWCJVNBYdWlFP+CT/QM16tqs
	 cfitqt/3IU2hNpBWvJ+PiGLeeCK0/pfcUm3XsTskSQIPmLk7BRcX7GHQdhxCnLFdU0
	 WeuJ1cICDHYDA==
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
Subject: [PATCH v2 8/8] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
Date: Wed,  5 Mar 2025 19:46:38 +0000
Message-ID: <20250305194638.47187-1-ziyao@disroot.org>
In-Reply-To: <20250305194217.47052-1-ziyao@disroot.org>
References: <20250305194217.47052-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_114702_707071_39CDC5AD 
X-CRM114-Status: UNSURE (   9.49  )
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
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 5346ef457c2a..a52a7924bb75 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -15,6 +15,10 @@ / {
 	model = "Radxa E20C";
 	compatible = "radxa,e20c", "rockchip,rk3528";
 
+	aliases {
+		mmc1 = &sdmmc;
+	};
+
 	chosen {
 		stdout-path = "serial0:1500000n8";
 	};
@@ -104,6 +108,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
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
@@ -126,6 +142,12 @@ wan_led_g: wan-led-g {
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
@@ -133,6 +155,18 @@ &saradc {
 	status = "okay";
 };
 
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	no-sdio;
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
2.48.1


