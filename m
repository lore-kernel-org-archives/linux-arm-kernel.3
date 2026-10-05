Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E398CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=; b=jTj/Uxnab57UhEx6QjT7IigOmh
	rk6psybcrZio85vB1jA4FX/GmVnSbo1OdtG8jSncrY6s+mL7MttOBIlTKeLdOqrlaSmjlhjKZr7mQ
	YEcMv0607n1c82ywyyl6mi6dMoTiRB0ap49CN5SsbmhYVV2UCQN5mTYuSBDntppX7acgQZCUm5uUQ
	U2TxikdeS7zHVrRmIU7piWnpr56Ih2D9e91VRn3juztXoVdaFmCI2S4VZCqdFoXwP6UgQlbsesDXe
	lK9A9lUU3eYXZlYqBWPr5KxvRszpdb3p6ODOfm31qQkNRPyp7mW1vCZLcSbYHV7extTsW0Jx9NX+u
	TEh7FKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMX-0000000HHhj-3sfg;
	Mon, 05 Oct 2026 22:40:49 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMV-0000000HHfJ-1aNJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:40:49 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a0a87595so1450065a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240047; x=1791844847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=nKUSphK1E/rs2WwcZ7YlCTl+GC0WZuZyJivoEif4ilE7SA6W0XopbrxijUaFLgor15
         flDSOmjsUcAipw59WCYe4q5/WyC7xlgxXHLufoiYehBYGHgi8ORZfiJ1vM1P/vDULYIW
         z5xuXbSd3780/gBH6hgJId3Bq6dcatW09EVtjuYs6bpxqmAv/ztn/Yqud167xy1hY7AG
         gyrbhVJ+WxNvWxdwR0ajlpPrxZ7lTNpphxiNE0vfP1nfVSRktHoj9S2U9yEfgXOa3rHB
         mD9ghukF/st8lLAKcyeSmzmH0ELNnRpJ/QI1IvERfYt29oqLRnb5xTAkNPc/nPCMBGoj
         gY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240047; x=1791844847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=ieHFqZKhp1cV75V3xRdKj8P1SIpXa2ck9qJpwCWpTUld40TmI5RYLBkFcw8Cq7sH8i
         1IyUQPNUV2jI9IPKZq9cwhuKjEmnU0xnPXpJKbQno9pvpO48/2UDTVB6a4AHv+t81P7n
         5pM0lToIqyRIHMn0cVtEaqEGT6mE7w6t1PD2Xnlw9YnlgdS9IY+tSIGR2JU3wD754j1z
         lvksfZeTYVMtMdvn1E3auuCD5hg4WLYRDT4jyOklZXnoLAVnV2QCh9TILrNEoDe/29p2
         1SJAjiyPJgQkgksUGsVD0dRAhsKzQVJZDteqraofVSGIxW75OhGO6MK/9JNKXgLqBTwk
         cwLg==
X-Forwarded-Encrypted: i=1; AKwUvBysLS63zsoxRqhHFVtmltDh7OHyvCrCG+NWztmKkgR8Z3D0rVn/8T2AUJb54XYFRKJs6s+TVl52Ctuc2tjdN2ff@lists.infradead.org
X-Gm-Message-State: AFq9FYI1o9Wu89Otyc/mk9fr/pk8YWMH9FbtddwK0xCkML/FwKrnsRQl
	yzAn7IPVbf9Yy/6UsEk136yPz9Qwj5l6gV12emqdCDhXxj4XrJAR3XJQ
X-Gm-Gg: AYBFou22PF9aNU0Ztu3tluFs2mS1JQLx8HV7dWx0HxY3hT+ISIAIEZqrdp5dUWqk1rc
	JFY/rnSiJpdHh72NkQTPtApvk0KuvG4Zq91xokQHeX4WfZtHgwHbnfC8z+OkFj6rkQU3cnXdJvK
	fKgz+XqLqxejGYc2yaxw4uv07M0+eSFRKC2I0BOWZJOHDBAK9zMhsEPIi3b5ZeOdreaQ/dgRGSt
	D4SaNRLLHRSFaSOpqDJom9BouYybxjjIROlu+ArtvBvWVBHAdxRprq3qOPm/Nu1Dk0YKoockS8B
	Bv1riScyJKlGsSx7pAOMdGy5DrueOONK/JhHRu+J97gVIjNKJr7VOAQSjZUPnaeZy8LVEplwDCv
	nx6debOWaFU9P26IIb3STb0h4B6LIxi80xtDaRqdLYgxj1V8CyHlc1PVS145vGZrgzIOVnJNMkA
	UUR4MJ+8o+ekidsG/rYVF+j5KMaLB2wirxsJVWe3pDDdVkj2QpOjgx7bR4YCHQHfzmQA+YQ/M7y
	CdZjuk=
X-Received: by 2002:a17:90b:2886:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3a82c7e90c0mr2473707a91.17.1791240046758;
        Mon, 05 Oct 2026 15:40:46 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 2/2] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Tue,  6 Oct 2026 06:40:08 +0800
Message-ID: <20261005224008.1140250-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005224008.1140250-1-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_154047_448744_28C8691D 
X-CRM114-Status: GOOD (  13.28  )
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Add rockchip,sgmii-mac-sel = <0> to the already enabled combphy2,
to route the SGMII interface to GMAC0.  RK3568 has three Combo PHYs
that can carry SGMII; which one is wired to the XPCS is a board-level
choice, and Photonicat uses combphy2.

Enable the xpcs node and its port 0 sub-node, referencing combphy2
as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..fdaa4a2a4328b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -241,6 +242,7 @@ &combphy1 {
 };
 
 &combphy2 {
+	rockchip,sgmii-mac-sel = <0>;
 	status = "okay";
 };
 
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs_mii0>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,36 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		max-speed = <1000>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
@@ -586,3 +646,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+	status = "okay";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3


