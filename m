Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D4EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZE35oNxFm+cLFtskkk1IPsKgn9aJpsHDgF40rmaSN4=; b=chlJkfdpNW50EZHYmY/VdFtAy6
	mGZA7POQ/he+hv0ZdbijMPxAPVbfKFqXp4mogeZX6BmFUHBKWOVcj80z/TBAIbIk+zzn0D63Kc3WA
	sCVBPfB3IbJaShrkUgKm91v07QRCvTpfZsfKuvEN2j3qbN7xfwaUc8Cy7nMvYSei1hGv0W6S1TRxS
	LZG+dsDNNCuVu7SmLP4TwKazgxem197MCaZhBptjc+w8v4THjH65Xt6btRXpQ/pE44W2ghrSkXm1/
	cqpDvJoCXveYEnsWeVPspHkIxwR39ldwmHGxXPnTH8149TEL3wxrEEqX9nJFNMvXY2KtDNgwDsMU2
	YBHUMUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyydT-0000000GbmK-3j4B;
	Sun, 30 Mar 2025 19:47:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyV0-0000000GbBX-3pWX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0ZE35oNxFm+cLFtskkk1IPsKgn9aJpsHDgF40rmaSN4=; b=EwMBV0
	mKkExS95rgBuS9b+06LY6/mgrHb40RxDjdB6ANo/IYxOZ9UvFHFyjowg1lUbbU3E
	a5B1mqZOs7uocKD1FI5CeSX8s/Uv49eFLCOKX6pcX9L6q1EATbLP66sElGlvMccb
	VNbDZFVJfpNj5VW6g01L1QXtR+rlBZhYrUbA0JQ3I/bCgTzAf3O3cZlCFT5FodI3
	wOByNZ6qa5p1xuHGlyRyfZpZ31BG2RkPmKhkYdNaXzbVxIJKoMBCuKMjVocSicuE
	5/bLk0snCP4/U6Cz7C5COp39ck2q7ovJ7hOdrIe4UYPMzo5eAsiXfFfu+EN6Doyi
	C5WBQAkcZlNKoSAw==
Received: (qmail 964929 invoked from network); 30 Mar 2025 21:39:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 21:39:08 +0200
X-UD-Smtp-Session: l3s3148p1@HvX8dJQxAKxQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] ARM: dts: ti: omap: use correct ohci/ehci node names
Date: Sun, 30 Mar 2025 21:38:35 +0200
Message-ID: <20250330193833.21970-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_123915_264219_0945B685 
X-CRM114-Status: UNSURE (   9.56  )
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

They should be named "usb@".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/ti/omap/omap3.dtsi    | 4 ++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 4 ++--
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 92cd4c99dae7..817474ee2d13 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -862,14 +862,14 @@ usbhshost: usbhshost@48064000 {
 			#size-cells = <1>;
 			ranges;
 
-			usbhsohci: ohci@48064400 {
+			usbhsohci: usb@48064400 {
 				compatible = "ti,ohci-omap3";
 				reg = <0x48064400 0x400>;
 				interrupts = <76>;
 				remote-wakeup-connected;
 			};
 
-			usbhsehci: ehci@48064800 {
+			usbhsehci: usb@48064800 {
 				compatible = "ti,ehci-omap";
 				reg = <0x48064800 0x400>;
 				interrupts = <77>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 150dd84c9e0f..4ee53dfb71b4 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -302,14 +302,14 @@ usbhshost: usbhshost@0 {
 					      "refclk_60m_ext_p1",
 					      "refclk_60m_ext_p2";
 
-				usbhsohci: ohci@800 {
+				usbhsohci: usb@800 {
 					compatible = "ti,ohci-omap3";
 					reg = <0x800 0x400>;
 					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 					remote-wakeup-connected;
 				};
 
-				usbhsehci: ehci@c00 {
+				usbhsehci: usb@c00 {
 					compatible = "ti,ehci-omap";
 					reg = <0xc00 0x400>;
 					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 3b505fe415ed..9f6100c7c34d 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -331,14 +331,14 @@ usbhshost: usbhshost@0 {
 					      "refclk_60m_ext_p1",
 					      "refclk_60m_ext_p2";
 
-				usbhsohci: ohci@800 {
+				usbhsohci: usb@800 {
 					compatible = "ti,ohci-omap3";
 					reg = <0x800 0x400>;
 					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 					remote-wakeup-connected;
 				};
 
-				usbhsehci: ehci@c00 {
+				usbhsehci: usb@c00 {
 					compatible = "ti,ehci-omap";
 					reg = <0xc00 0x400>;
 					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.47.2


