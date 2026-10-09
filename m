Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8538CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 02:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2fDuH5AqlzghdgOw85VEEM3nScrcIHTb70P6L+D1SRk=; b=g1aWaB62xEJTyZWHfWFn/i6hm2
	ZrqZBTPMS6OtdnKwEyk0nWv7VS5V+k9Ezw8e/WE3foMbbdzxDfpvm9LINH//aCiE6uMBI8o8Goyqz
	VxM7verpjelpmEQFl/UGzbAqqeO8WZzwpWZlvMA+D/MSsZBdpUT/YVtWuINZc+SA3s32rF32AejMB
	CIqaG22dzqQ5MKAkaK81rKqgPYqE9znig9OZXauFr0g368kzq3ZSsu2PTZYVzTqZFJCU9b8A959EA
	t+q3xfRFGuFVzk+5DbUGSkk6rHALgNJeIxvHBKmdJmkIWWBkMXM1U4CBfwzFZKSVSNAnTH0qF6zNa
	cwJ5PU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzv9-00000005GNw-2SaN;
	Fri, 09 Oct 2026 02:01:15 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzv6-00000005GMv-1cGP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 02:01:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1647986a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 19:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511271; x=1792116071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2fDuH5AqlzghdgOw85VEEM3nScrcIHTb70P6L+D1SRk=;
        b=nrChnQkbwFZsqDfSvMyIwbZ+IIHLdXFvZ0si3X0OFYadS9u8wtI0UaRx6SRxA4tuUC
         sQrsMDChRqgwfbMcs4zC5dT8lrxsQp/xwRSAPsElmDpS4XZGTX5MUOoUu9R91dfvhCBr
         XOHUVeMWkN8W91K0Syc9yFWxZoy3ZPrF4HJdFmuLrQp0f/XHqa3c7EngxY9xddeKyrxS
         OvadALJQ2WNSZzCXRUzFlH6elh+pX/jNVa5nScmTyrg7i+0QW8oN+h6gAF3m3ib0sZ2D
         i0cVW72Wbv5+oEOSX/H7+bnGlcXUdyUWJ8FSDFnMf7A41rhSg0+IhgM/U6p5TT9yeB31
         YEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511271; x=1792116071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fDuH5AqlzghdgOw85VEEM3nScrcIHTb70P6L+D1SRk=;
        b=xv0OzyWSwt0m09fnMA32ia34Fj0qAk3DQKjMI6Lt3jjaKvurnaghbjDuaqIawzclRJ
         RkIYnhOT6SmPDxsMgLruSALWFe2cPoOnbEomcEqXLeAt++yW+zGs8T6RD0ND3b85Yuid
         3BH9yLEIPTaO8Y/YvRVPxCjAP9k5stXOMjSpwsNYNrqCd7DSl0JZjX4ngSuUaodnXunx
         5wr6/9bPuH/4rHEJNAg6oq75fGBRn5ZLiCiI6PgC/NXRSHYXkY++lBFpElMcwamYzKUY
         qcVCBepmlmQArNDrC+XsiRmrPo+KwpDImL5tpnigseecd12i/YUQh9g0hdEDd5T+EnHI
         sWuw==
X-Forwarded-Encrypted: i=1; AKwUvBwW9KaHZehBTrbBJ/WExZ0WisyF6NB01ex0mtDjLTCLZwdekYTygLRMoQGDR0wkZOiQidCmDBzEJQMO1A0AnPq0@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8r5/aHTqUWLwcG16MNmYWo6An3DNE6NzVnYRXz0B/UQtJArv4
	l/vwcTwlMhugHFKDXlmNJFYBdYhPp5cjspFOMmdEElCxJFoE9QfnsSN9/wNaAeKq
X-Gm-Gg: AYBFou0NfMAPMTPf4tB9qE3D5AZgVKAVCSBeGhvt5DyKp6pnjWF3SMpn00e1B0XiAR1
	vZYkJ3aIve3RJshrfjsKkwGg7pxnIV0n4d9qtog7vSjUZkqRfjiJRdhzBxWco/uUxUEQa8WGeZ3
	aH0Ao5nL5MNKO3ePeqRXXx5FORZebvg1+VK6cRwc55AUwnT2HXcbylsyFeCks/OVM7ERCJkU6g6
	EBRuNg5X7MVoj/iD7zaXa0vfAOPx9eeSO10vxmOh+umlQiJjPI7NXjGxc5aPbGfIzjP/Ox55ISB
	EJAzdTrvfRliq9a+FxjP/ycAUbMXv2tsV3Xci0d/MPdnX4CGgUXC+jTVl82n0o6CYnCqtyL7b8P
	f/vw56V95zM18hpoK5lEVECkzum5RQF3sczdHF5W1pfg5I/O4tkAOJq28hjyRlOjgImWR4B7xcq
	kELPXMP1oHSGoGreE1d/yMl3j+E5eEOi0J/2uz9cdrUwesNQhgrKT9A9bax0efkyTm0hlz0LqBX
	1t2/ik=
X-Received: by 2002:a17:90a:e707:b0:3a8:796e:ca18 with SMTP id 98e67ed59e1d1-3ab3ace27f1mr572130a91.59.1791511271485;
        Thu, 08 Oct 2026 19:01:11 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm1095770a91.13.2026.10.08.19.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:01:11 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liang Chen <cl@rock-chips.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Fri,  9 Oct 2026 10:01:02 +0800
Message-ID: <20261009020103.364498-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_190112_452589_FF9F1017 
X-CRM114-Status: GOOD (  12.12  )
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

The RK356x UART nodes define a dmas property but omit the matching
dma-names property, so the 8250 driver fails to request a DMA channel
and falls back to PIO, logging:

  of_dma_request_slave_channel: dma-names property of node
  '/serial@fe650000' missing or empty

Add the missing dma-names = "tx", "rx" to uart0 through uart9,
matching other Rockchip SoCs such as the RK3588.

Fixes: a3adc0b9071d ("arm64: dts: rockchip: add core dtsi for RK3568 SoC")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
Changes in v2:
  - Add Fixes tag for the commit that introduced the dmas property.

v1: https://lore.kernel.org/all/20261008153620.238580-1-jerrysteve1101@gmail.com/

 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..098493c04ecc 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -443,6 +443,7 @@ uart0: serial@fdd50000 {
 		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 0>, <&dmac0 1>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1449,6 +1450,7 @@ uart1: serial@fe650000 {
 		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 2>, <&dmac0 3>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart1m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1463,6 +1465,7 @@ uart2: serial@fe660000 {
 		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 4>, <&dmac0 5>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart2m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1477,6 +1480,7 @@ uart3: serial@fe670000 {
 		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 6>, <&dmac0 7>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart3m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1491,6 +1495,7 @@ uart4: serial@fe680000 {
 		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 8>, <&dmac0 9>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart4m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1505,6 +1510,7 @@ uart5: serial@fe690000 {
 		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 10>, <&dmac0 11>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart5m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1519,6 +1525,7 @@ uart6: serial@fe6a0000 {
 		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 12>, <&dmac0 13>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart6m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1533,6 +1540,7 @@ uart7: serial@fe6b0000 {
 		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 14>, <&dmac0 15>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart7m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1547,6 +1555,7 @@ uart8: serial@fe6c0000 {
 		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 16>, <&dmac0 17>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart8m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1561,6 +1570,7 @@ uart9: serial@fe6d0000 {
 		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 18>, <&dmac0 19>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart9m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
-- 
2.56.0


