Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E09DCA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=; b=B3li/9McPFzq6+P6lQhD0/7+6q
	AF8NnpBX5KOE3f+pTcVxLum0EOJmIh3hAOK/kfIWKvS8pndDV/rRtUrhdL9KMjFCFsujDKjQOuIHJ
	Jy/llx8K1l+HlNc/pW21d3PBKkX0Qgegyr4hFsDWSjPzBrYSnCjlM3lRhtzRMWb0+wKfd6qT2hG/m
	1Bgz+OA8rt7JO7HfoUbZBk2ZgOEw5dbhjvrYETrcjhndj3i64OuOqouruGyY6S7U40u3ndZEtKV23
	9zCYvKfNZ7983CECVE7gyxgDR5m0KFv2ICzUNN0k/bZsHc7RxFf58RCAEOM3xxgIWPGiXGUYZ4J02
	Q7mvcfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqB4-00000004cVr-3xNT;
	Thu, 08 Oct 2026 15:37:02 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqB1-00000004cVW-2qDe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 15:37:00 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ccca948203aso1865656a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473818; x=1792078618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=;
        b=RFyLzfoJx7R7lzeHuAyTqXajbn2PuPiofxjcVMSwtLOWXyG8QUM/INwrZH5V1NeeWK
         vWgZpK3iiDa8IY6a1/kplxDtoTM+SV6GgNk2AaRoSIx0WI304b1yQJNdTrn+UM5Lk4eg
         Qo5kz/do5gykt8SfHADU9TTNT2o+8WnBI70VAFrHvSSU+blzYFWj2ilY9UGNTYytKG3y
         EQeqeU7XNOQbToR6sYS1ovaQx48ELD/zDlRwTZGNTSzbiJFaA9M+50W4WHlFYFxc0nFp
         dYt6a4R5+lUqxajYHQhpZa3RqxBTRpPphSN24qsmKknvdTHm0xgkRPXhrEMFFGb9SQu5
         uVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473818; x=1792078618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=;
        b=vmnSuFknG+Zb5fe6iNG6YUJxJs1hT7hGGNcWwnq/vVyOsiG0mMAHW9y8u7G7VzWDYy
         S1yXpskVHnp8B2Wypdw6XQDzdNPn840++WkfkJy1ORsmz56uIA8Kj/0XdTInhKLd5dyH
         c1jZlMSeVNOHaESXot7kSOMBo2ZKnZpXECXmxeeaN56z+qY7GwksYxPZWZHS0IlwgrJD
         EnHPAeAehrxpOW0FtmY2ZrK/TCrikJKi2YY2ZCLlxvn/8hITRbVY1C7Wjnom69gYt0Ot
         fcwWUCJvWy9dLraoS3GR3I3LqdkoUrKLvrnN4cIbEpzLU0ugi6HsdJEyPB0WhSAYOTLR
         mLAg==
X-Forwarded-Encrypted: i=1; AKwUvBxwK5TbeUaFIEnj4FliqI2wfAZ7nBW+nGhwdxqLtOmhgw5aYVtxoj9+NOeAVAWqy5ck9XtBrvFP3Gpy/ierHspB@lists.infradead.org
X-Gm-Message-State: AFuF++mGzwo8v3ZtmkhNRL5TN6pU3DzuzgG0A5w4wX0XuW+4KAVC9wa5
	k6jFxE9NXPrpV8VQ5uqcVBhWNLSOPwGFoAfHH7aE7U/GtIH80X/CgK95
X-Gm-Gg: AYBFou1TSYi9zUIkVGwWB8cg+IG8AAVP7ZoXvuMk/5J82aNc7dsIBgMyCWjt+U4CSe3
	iAPWMkpeOvkAteffa8bzPL+XeLIxH3WyZOOycgdM+VY0y1mK+y4uRXVlBJwWRKnlwf5I4slws7q
	JfULf7TMLCy5yXwhVo0RW/dO8qSNHLY52w/HkT/9RS6DXKVcE/1KJVi9PnMpc1RYl7oD3TZP33l
	tEkKwnXBWEVokvQ+NaPEABevSei5XPQZpSV0NHsq25tKuwmqzsITdjRe9UouCSJQawTRLYltiEj
	dcMHiwSOsVEIgFq/VnewcRwmlE1SyXbPAcdVlbPdA0WbceWBRBhekCh7yP/BBo5+GZtrZ9pwLKF
	C2J14WvLrjdSUEMg3CcdEI1SzXRVIDaJfIQhtUQ6zvA5q9AZg1DqKEuKm7A8yvhBYfAYNpOrQDY
	OGMAsrfgoQR42icljZvOE09SGiX/ZOVqZ61E8aF7bN0+f4CF01HeKLz7AHrZwIlCBLo5UPeYq8C
	CatIaq23nOdI8bchA==
X-Received: by 2002:a05:6a21:608a:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e1340542b4mr4754282637.30.1791473818297;
        Thu, 08 Oct 2026 08:36:58 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd35736f232sm263479a12.26.2026.10.08.08.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:36:57 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Thu,  8 Oct 2026 23:36:16 +0800
Message-ID: <20261008153620.238580-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_083659_743319_17F61D30 
X-CRM114-Status: GOOD (  10.54  )
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
matching other Rockchip SoCs such as the RK3308.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
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


