Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1327EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yLPdjZGdoWUbTfAy2GwqZq8+x71kvvXbnWtl1wzXyRk=; b=JwvBnMykc9rt2gPOx8z/hWRMoT
	NvBH/BlUHTBDwb3hIbY1K68D8llC0AUUBLHoGDI7E1G/u6u+VJm5a1h/yDm+rDpi0JqMUmNqOO9Sy
	cri3dAEF2yVDBSEldq57gyGj+M2gXtZABOBHYOdJwF4ZXrvHTUDPfj99v1ZXRf3RRwmdC9X7p5vEN
	hoIFsbI7dHPGEfRi3n9ziYGaPaC9WwTWLf7DflgF1ykM2SrAR/m/gS1EBt/AlBkzLPl/t7r7DBXXs
	+IBY0KyHItgMha+J0PcotBuDd/+ldCsfuHe3Do1xcGmo4uI6TLUTjz3Zig7+E9Zozy4kf9er6+8fo
	6i3vwsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiy-0000000A9X9-3u5m;
	Wed, 09 Jul 2025 22:57:13 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZc1y-00000009scY-2QL2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1752095321;
 bh=yLPdjZGdoWUbTfAy2GwqZq8+x71kvvXbnWtl1wzXyRk=;
 b=F1nQVyAE0MXjmaRM9CJomt9wiM5mgfw+uVBEc9jJuhZ1/vGctTd1Kd25tgDk6qYds8PF0IM8o
 U5jaTPMi9pQ9LYsFoUM+4jfsW/a5tq5pN+j28pK7cN5Q0YuetKVQH8Tp5jOnUhA96bFl1UYcu9E
 /Agoiv2VoYyg8Uhqp2dq3zRdqoAblBvCNYY8u5NXesBAiam74lYpuXSfibtCE7E5IE99Ev3V66D
 QW29496d7KUC6DKTPrjuyNV9gDgNVaoUtrwU99JEFD8oN31EPWXPbBUr15HNKU4qQO+k3nAzGxj
 0/SrfwEKJAVJQNWa1yTrqHzlR2+J4mmpqWVAanrUKvGA==
X-Forward-Email-ID: 686eda55c4bb2e061789d0d3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix UART DMA support for RK3528
Date: Wed,  9 Jul 2025 21:08:28 +0000
Message-ID: <20250709210831.3170458-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_140842_973023_02D8B2EC 
X-CRM114-Status: GOOD (  10.16  )
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

Trying to use UART2 DMA for Bluetooth on ArmSoM Sige1 result in tx
timeout when using dma-names = "tx", "rx" as required by the dt-binding:

  Bluetooth: hci0: command 0x0c03 tx timeout
  Bluetooth: hci0: BCM: Reset failed (-110)

Change the dmas order to fix UART DMA support on RK3528.

With this fixed Bluetooth can be loaded using DMA on ArmSoM Sige1:

  Bluetooth: hci0: BCM: chip id 159
  Bluetooth: hci0: BCM: features 0x0f
  Bluetooth: hci0: BCM4362A2
  Bluetooth: hci0: BCM4362A2 (000.017.017) build 0000
  Bluetooth: hci0: BCM4362A2 'brcm/BCM4362A2.hcd' Patch
  Bluetooth: hci0: BCM: features 0x0f
  Bluetooth: hci0: BCM43752A2 UART 37.4MHz Ampak AP6398 sLNA iLNA CL1 [Version: 1091.1173]
  Bluetooth: hci0: BCM4362A2 (000.017.017) build 1173

Fixes: ab6fcb58aedf ("arm64: dts: rockchip: Add UART DMA support for RK3528")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
This can be verified with an upcoming v2 of "arm64: dts: rockchip: Add
ArmSoM Sige1" [1].

[1] https://lore.kernel.org/r/20250708224921.2254116-5-jonas@kwiboo.se
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b215126efcc2..001a555c83b7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -595,7 +595,7 @@ uart0: serial@ff9f0000 {
 			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 8>, <&dmac 9>;
+			dmas = <&dmac 9>, <&dmac 8>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -607,7 +607,7 @@ uart1: serial@ff9f8000 {
 			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 10>, <&dmac 11>;
+			dmas = <&dmac 11>, <&dmac 10>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -619,7 +619,7 @@ uart2: serial@ffa00000 {
 			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 12>, <&dmac 13>;
+			dmas = <&dmac 13>, <&dmac 12>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -631,7 +631,7 @@ uart3: serial@ffa08000 {
 			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 14>, <&dmac 15>;
+			dmas = <&dmac 15>, <&dmac 14>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -643,7 +643,7 @@ uart4: serial@ffa10000 {
 			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 16>, <&dmac 17>;
+			dmas = <&dmac 17>, <&dmac 16>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -655,7 +655,7 @@ uart5: serial@ffa18000 {
 			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 18>, <&dmac 19>;
+			dmas = <&dmac 19>, <&dmac 18>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -667,7 +667,7 @@ uart6: serial@ffa20000 {
 			clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 20>, <&dmac 21>;
+			dmas = <&dmac 21>, <&dmac 20>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -679,7 +679,7 @@ uart7: serial@ffa28000 {
 			clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmac 22>, <&dmac 23>;
+			dmas = <&dmac 23>, <&dmac 22>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
-- 
2.49.0


