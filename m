Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABDAC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyzk1S0H2k5A/ynNVOxFirZrwZax2MpEB9VZRlRQX6c=; b=sK2oCEs29n8hDfh4tTBbWOBaKM
	DxNBoK1xNqX0Ge3lWyY5TwNcKiv4G+PA1VLeO9u+5o5LR+9cXKXd1blbRsGjWBjbrqp4r3W9EqRsJ
	jVPHtY7+xvSsUmwcLIvGqwwQH5aD8ZTlW52h1pXiIZNsMW79ShRx6uaGtpw/hTumpGrnk16nyqXpV
	WVm5wSSftQxuKTcrdVrjOQblkv/rI2Rk2oByuzwD0ApcMPnptFXYGHItYacHAU1ECdA+/f3GiVJ90
	0tMz0DIUwgw/s1BMyZh9+CO6uKCbxiD3i2eTdNf6NRkIytjkfmiy8g6knTYzSIW82dYim9qdXVrAC
	2apSNgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYrR-00000004wLf-3EZQ;
	Wed, 23 Jul 2025 12:46:17 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYW2-00000004tvs-1Ybt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753273450; bh=xyzk1S0H2k5A/ynNVOxFirZrwZax2MpEB9VZRlRQX6c=;
 b=fJTBNmtGhFL343eL5XviQd7puXyEmKs0lc6pBN2qHActDSZeOapytyVVYtKAVn0TgSMArPJLk
 E5B/pGPLip24pgrU0fXPgkWAPa7EjJF6xPPGS8aCXbkYrOPvg/RLmEU/KY4fztcg5l/YfH1kdth
 tF61KumESQ7QHTFXRdsTAc586GR29vgW2PrKFH17fE1Ghh6D8j9QOhzJSgNZxIfJIWFy+RajS5/
 d8MGxr3DXvkM0zsHHDvn24gGcD1HXDSJlBEjg4niK5aEIA0kd5zFQ3K3A7CFVK8ss8OCqHetMZW
 wAAS1sZFqDrKnEN+Aea0/KE5BitvCU3LbkXXmjhBsuww==
X-Forward-Email-ID: 6880d464cb0ee86f9731a10a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 08/11] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
Date: Wed, 23 Jul 2025 12:23:06 +0000
Message-ID: <20250723122323.2344916-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723122323.2344916-1-jonas@kwiboo.se>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052410_444278_729CE6A9 
X-CRM114-Status: UNSURE (   9.52  )
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

The Radxa E20C has one USB2.0 Type-A HOST port and one USB2.0 Type-C OTG
port.

Add support for using the USB 2.0 ports on Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 12eec2c1db22..363f08c1e24c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -134,6 +134,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 		regulator-max-microvolt = <5000000>;
 	};
 
+	vcc5v0_usb20: regulator-5v0-vcc-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_en>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vccio_sd: regulator-vccio-sd {
 		compatible = "regulator-gpio";
 		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
@@ -261,6 +273,12 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb {
+		usb_host_en: usb-host-en {
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm1 {
@@ -303,8 +321,37 @@ &sdmmc {
 	status = "okay";
 };
 
+&u2phy {
+	status = "okay";
+};
+
+&u2phy_host {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
+
+&u2phy_otg {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	extcon = <&u2phy>;
+	maximum-speed = "high-speed";
+	phys = <&u2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
-- 
2.50.1


