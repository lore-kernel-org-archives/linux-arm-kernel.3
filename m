Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19661C3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehstcimJR9z+3Rt/ETv7WL7WqYg2RyHiNK4ycKLwqgc=; b=SZwJpo27Q8Ds3v38pBq+GwpmfA
	YpV+Vb4jRKI0rEVBU5/nvZeVV6sRHRw4Q0ip1Na4zs1x2O5ph9ALMhtSN2JDdY1oB8YyLsNV5kxvr
	MNK2r5p/HCJcDjQR82kquhPQH+7zNsfH1inPmZzDPOo3posrzO0Iv0LDhApI7HeK8Wbc2CtjiUVPI
	v7bYG57qMsjNshrSHQUOcpuEeRRzr7Ap0CYlwjIfIRZtXaDuEAvt8iEcynrjPd9uGh7uxgtyxUeFT
	U4HiTsh+apjfRSDxYGgWr7DZSXhFD2AABQ07IbJ1m8VwbzPrCkF4k3BjGgs7SMnEnMbCLQwYnAvGC
	BZ9Rrryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxt-00000004uqH-2bMO;
	Fri, 09 May 2025 21:09:05 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUGb-00000004mFv-1u62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 20:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1746822260; bh=ehstcimJR9z+3Rt/ETv7WL7WqYg2RyHiNK4ycKLwqgc=;
 b=EcZgoLEnz7ewv6ZRBdjX+KGGQuc/XP86n3R48eMgXo3sk8HIJTPUUBeBDW1VVMXzcfpFAZpNd
 GwuSLWAbt2QnpEjkgDlUdjNJ5DFQsXlR0I9PUVN+pAbJoDN7jVCmbgSU8rOOLINCnSqwb0uhs9E
 gdsuhMCICRiQ/UohvqrkdGuImbhsPWqXt0W2wu00KtWEjugIpCAuelod7sbQlMENUwi7y3R9pmB
 XfKZMT2nu4s+0lFmJ32lhehrEKJvMmb6fBjNlaCcGhKZuGdSetDUaX9ahgFozmWDMSJ7SV+Ji+s
 qUAR3Pk8fGquT6CHNX4vx9/Rd5Vw7G1PFFqIvfYIvoRQ==
X-Forward-Email-ID: 681e6470b323f1ffafd05da1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
Date: Fri,  9 May 2025 20:23:58 +0000
Message-ID: <20250509202402.260038-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
References: <20250509202402.260038-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_132421_600942_24BD15C7 
X-CRM114-Status: GOOD (  10.74  )
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

The Radxa E20C has two GbE ports, LAN and WAN. The LAN port is provided
using a GMAC controller and a YT8531C PHY and the WAN port is provided
by an RTL8111H PCIe Ethernet controller.

Enable support for the LAN port on Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Rebase on top of latest mmind/for-next

Changes in v2:
- Rebase on top of the "Support I2C controllers in RK3528" series [1]

[1] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index d45b6594b2de..506d54337ece 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "radxa,e20c", "rockchip,rk3528";
 
 	aliases {
+		ethernet0 = &gmac1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -184,6 +185,17 @@ &cpu3 {
 	cpu-supply = <&vdd_arm>;
 };
 
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>;
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
@@ -198,7 +210,25 @@ eeprom@50 {
 	};
 };
 
+&mdio1 {
+	rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac1_rstn_l>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &pinctrl {
+	ethernet {
+		gmac1_rstn_l: gmac1-rstn-l {
+			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gpio-keys {
 		user_key: user-key {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.49.0


