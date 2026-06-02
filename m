Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F4CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltpljeHYhk+MWnYO9MzUVzbUzbTpnNaP8brQqYcTO4o=; b=IrVipAcpVa4EaY3GmAeqbc/iJS
	anSxZOsX1I4q+ryG783ayNqNCG9BOY6Xw59Ap3+IpQfp1lr1Vu+TFcuJU7R5Id0+6tr8e//yYhC0Q
	fuvtJyzyZCNL4XIpyUClD3wx1DoIoypSVEz70ASpwmWx9SOffBPHFZXF78vBvpktxFal+lgHqXNCF
	4fS6ImnJAWKziL3V93WHSRHxoYDa/iej1+MRoRM7a+nnmkTmpYxHQVbUsSt9GAs+abA7OkhiLDyyJ
	fXvC428BQPiKGXb40GG4hawjS7WxHgbTOvSZaoi6FIczDaAno7WLfl1/P/i5mMIpAtqHCin4cIzK/
	eYiGvhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOk0-0000000D28j-1b7j;
	Tue, 02 Jun 2026 13:01:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOjy-0000000D27a-19Ml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:01:07 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EA1A1112;
	Tue,  2 Jun 2026 15:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405241;
	bh=v7755meFUFiWE6PwyqlAe5/lehT63GnEEOjlQC2nS84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ucU35nGJRbJQBwUocrpGMuffWKtfjl9XnbqqghCNZ0k7OT1Mr7wUinIMb2CyHaMIb
	 ZznvQPFL/75QHYnbarm3vbWIeaPXBLOiciSk8QrmM14MRZnvnFEcdtvi2g856C0AHC
	 C+reiUWyQlRdDCxQqdPk1IRdf0tHJL3fZ5FCP00I=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Jun 2026 18:29:27 +0530
Subject: [PATCH v3 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for
 CSI/DSI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-beagley-cameras-v3-1-fe6ae35b7eda@ideasonboard.com>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=v7755meFUFiWE6PwyqlAe5/lehT63GnEEOjlQC2nS84=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQCFmZIPyCttYXqvit17B7FIjh834IO8RDMd
 BFX2oQ5+uKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UAgAKCRBD3pH5JJpx
 RQxKEACJHOKe3oA8dNtb3UIMKSacXP0v2u5GJ6em/Q1+3/Et8ZjaGXdXBRA1ExAQ08+mFEVL3uw
 bvieKfUKK24cYzLSn4tVdv/VXkuPKJXjqv4QNTFOc0w/y0gWTqeFoIjvqpNhvDno+39LKnN6AZD
 G3FdFVweswX5dsdaEyrGveq4wmTSvln5PigmC5CgWcv5ztfnd6H/9D1egYgRSLk9B2HvZ/97WQU
 TmlWaNWWH1zc9RfRD6o/AtWbzwpkYrQObuRHnr1wDypTr8wXG4HPElPjiH37NCiHlBiZUHuhMbO
 237okjhjOKX+j9rcGODjSsiFhrx0D2n3HDm7Sz9EYyttEosC9FWfX8bbqcrmpQKtFsMEh2cJBT4
 NkiHizL8KWk5yEkGPhhQR8Ys3pzacPaaMX01fkEoQxN2w/s1NANPcLNdqi9X6cBO7wCIMb3yjWU
 XOd5w3pqGIzThraCeiDT5E7pSvA8dZywvMk7VWiB3bY09Fd/neUisOQKotX8RlTcDLEZW5cJahm
 9yuMYDzw++7s1T7X8JtJMU80kMFSreLdOyYqMg5MPrIQxMoIhiClG04fO217Pg92gBsL7SROjaK
 Dm70eEn/mKfhofsdwMnsobd/crv0lyud2HfDNaGWvE73mVYEHWsq0u1xIVLKZ/SWg/JrhIOUFH1
 bmFUt2ho6z2LpOA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_060106_490677_48CB3981 
X-CRM114-Status: GOOD (  10.50  )
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

I2C0 is used by the 22-pin CSI1/DSI0 connector and I2C2 is used by the
22-pin CSI0 connector.

Add the missing pinmux definition for the I2C2, and setup both nodes but
keep them disabled. They will be enabled by the camera and display
overlays.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Also add disabled nodes for I2C0 and I2C2
- Earlier this commit was only adding pinctrl for I2C2, so update the
  commit message accordingly
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..890d3a745375 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
+			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
@@ -399,4 +406,22 @@ &sdhci1 {
 	status = "okay";
 };
 
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+
+	/* Only used by the CSI1/DSI0 connector; enable it in the overlay */
+	status = "disabled";
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+
+	/* Only used by the CSI0 connector; enable it in the overlay */
+	status = "disabled";
+};
+
 #include "k3-j722s-ti-ipc-firmware.dtsi"

-- 
2.54.0


