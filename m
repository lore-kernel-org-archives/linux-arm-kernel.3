Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE52C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T0a/MSApwUv1iJbtUmZwcZoK9D2QtBbDFC7SeyowqBg=; b=VoBpXMScwRlAcRdsVumk5g0ZRl
	1NDFv2q5pAsEaiN08lpKJJkdMZ3soBVAAc927s7RU1c/DKyFYwFbk5BB/rVl7ji+z6LUSq1OVz1Qr
	pYXRBt8etV9jsTLuqx846Ra4wmApJO7KkQCMrX0wO7Eu9n3dglOo7GVfl8HAZ96DcgwHQPNMjxOcu
	7IbEbNBJwWnWYL8nz719VL7GgRooytoQIlsjWEyutDhd3xwcXTiA3lQF1dYIVAPXVqmfotveDIpVE
	iSJAsow23i5PLVqPrjeQlKs0CmuOIWtTzVPlBddupHF+Fwvv4am3lfTFVbFPDZr8pbyL3zLmmM5hl
	FHFHc0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7g9W-0000000FZNN-2Xm7;
	Fri, 18 Sep 2026 21:29:50 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7g9T-0000000FZMT-0Qhb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 21:29:48 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3] ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes
Date: Fri, 18 Sep 2026 23:29:23 +0200
Message-ID: <20260918212923.148505-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_142947_303800_45F36D70 
X-CRM114-Status: GOOD (  15.26  )
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

The BCM4330 Bluetooth chip is capable of doing 4 Mbps over UART. The
Exynos 4210 however, can only do a maximum of 3 Mbps. Add this
information to the Bluetooth nodes using the 'max-speed' property.

This fixes extremely choppy audio when connected to external Bluetooth
speakers.

The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
property. The driver does not seem to check for it but that still should
be there.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

    Apologies if you receive this email for the second time. I messed up
    on the previous one and forgot to Cc the lists. Since nothing
    changed, this is still v3.

    Cheers,
    -Paul

    Changes:
    
    V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node"
    
    -v2: Drop max-speed property. It's only supposed to be used in some
         cases, which don't apply here. As this was the "fix" for getting
         Bluetooth to work on my device, which will be applied to the
         driver instead, the Fixes: tag was removed.

    -v3: Re-introduce max-speed property :)
         Turns out the use case does indeed apply here.
	 Also update the other Exynos4210 based boards.

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 4 ++++
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 5 +++++
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 7da64500246c..ff369eac344f 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -868,9 +868,13 @@ &serial_0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
 
+	uart-has-rtscts;
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 
+		max-speed = <3000000>;
+
 		shutdown-gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&gpl1 0 GPIO_ACTIVE_LOW>;
 		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index eb286e25835e..c517f6d1d7c2 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -537,8 +537,13 @@ &serial_0 {
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
+
+		max-speed = <3000000>;
+
 		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
 		pinctrl-names = "default";
 		shutdown-gpios = <&gpl1 0 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index 71df3843d8ba..9b345e16c44f 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -630,8 +630,13 @@ &serial_0 {
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
+
+		max-speed = <3000000>;
+
 		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
 		pinctrl-names = "default";
 		shutdown-gpios = <&gpe1 4 GPIO_ACTIVE_HIGH>;
-- 
2.53.0


