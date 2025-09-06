Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A88CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqkrpXG9diURfPDi1BvjvakduQw+Y4OO/rUlvKOipro=; b=lwmrBPOIaZknE8fvxvddWuXtOF
	sYV0UA4YZ3G0f/aOh54z2hRGenQC6pE8etSqVU940vL2zs2nINjuGvbLIfdnLaIA+hO1+xTO7WS40
	ha+jKGqsTANAYkO4EX4NmyoGGYa2DbsaJ1PrRSQROn09Y4zAtUuSmWG0Q7A/qglmbo7PopoqK4nbj
	2WZinKbiadL3xs9F4e9nhmP2n8j0sb1tepKX8QNfp8vhDQo7WzqhlqG869uYuUARpMZADIRVJArxm
	FPnljXnvsRQ/l/AV8r0cKZc8Jo3sJXIy5DnSxB+GaFRhcCwm4Ra1yHIvUNeVv7MRma+Lk0dUeH7Cz
	xeqWDcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutX4-00000007ssJ-0LS6;
	Sat, 06 Sep 2025 14:04:46 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutMk-00000007qzi-2FkO;
	Sat, 06 Sep 2025 13:54:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1D6D920285;
	Sat,  6 Sep 2025 15:54:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15xGSrIbygqB; Sat,  6 Sep 2025 15:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757166844; bh=Dw5uo181Dm3Fr9E03p865uWj8jVKOwAN1D+SIhGoS3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QnenhXeTVnAZ4hc1cPKPDtuClk2YEMAQ1CvdjE8PRoj4rTwwfuAekElrTBr7hQSgB
	 N7IvFyxXZ34NEK28AsfeUGPCS0Oqsudvn3qk7kPn8TGAgNI+IJgPITbWXXnKXe3qso
	 Zc35meOMW+qDjq4diZXyxFRBSk9bgCZyZ9It6mwk5G6qgvILI2F+58bJ70+sKAuUon
	 dnIfrXCdRUVWoa3Kc7raD2OP716eQrQLe8uSes1OZIP9KDhq9b1QszVP4VmnEY9/nL
	 yGstc9ZF08io+5dtjwoQr/FUt2mRNqNjW6CLLXu71fEkiltKNK7Umc7qK19o6bEvce
	 PuVkMK5WfjdwQ==
From: Yao Zi <ziyao@disroot.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable PCIe controller on Radxa E20C
Date: Sat,  6 Sep 2025 13:52:46 +0000
Message-ID: <20250906135246.19398-4-ziyao@disroot.org>
In-Reply-To: <20250906135246.19398-1-ziyao@disroot.org>
References: <20250906135246.19398-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_065406_707866_835ED0C4 
X-CRM114-Status: UNSURE (   8.54  )
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

Radxa E20C provides one of its GbE ports through RTL8111H connected to
SoC's PCIe controller. Let's enable the controller and the PHY used by
it to allow usage of the port.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 12eec2c1db22..e880c7a7e674 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -171,6 +171,10 @@ vdd_logic: regulator-vdd-logic {
 	};
 };
 
+&combphy {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vdd_arm>;
 };
@@ -229,6 +233,13 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pciem1_pins>, <&pcie_reset_g>;
+	reset-gpios = <&gpio1 RK_PA2 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
 &pinctrl {
 	ethernet {
 		gmac1_rstn_l: gmac1-rstn-l {
@@ -256,6 +267,12 @@ wan_led_g: wan-led-g {
 		};
 	};
 
+	pcie {
+		pcie_reset_g: pcie-reset-g {
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.50.1


