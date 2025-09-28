Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDEFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcagOyACq5LF4aF8OvPWATzr7dEMckGDebWKjhV8bXY=; b=27VygvkTSfQfxwL8haMEfbTaF7
	5kgXDohdgnKkGDN+7qvCOKXsZk0kMuOMEnYQYzmzMQZcC94yL3IdhFbLAM607GrKLT2yAdKfv8bzR
	RC2JsWx8Rtj+2nwPlrFo8YQ5CZlw/zMA3vKv75hlQgIFUXyjIQ27SoyQ3jjz0KWFlU8iAQNVBBLuK
	SUi82z0a/qabD/ySn4vxp29AcqPvf5uhKumOT0zRVPccd78j6uyLv+hXiGwp/cCu9FQ3SKyHBqwBk
	GTdLx9qldj0JHVQ5mqbBDXKGcgKu9rM9C5idbbvE7p9gUytNOpNfrYOq0esvL60t73CG6dvTFv8H/
	BfzBpKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veX-0000000GzXs-0DtH;
	Sun, 28 Sep 2025 17:57:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veV-0000000GzWR-2Egl
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 28 Sep 2025 17:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wcagOyACq5LF4aF8OvPWATzr7dEMckGDebWKjhV8bXY=; b=hoIhjaf0uxiLVMMkFNk7Au8pb8
	cUkrIEX5tgG4Ikhb9vWkfQE4XXpaDPtR1IiIOGAOoLwEbSPRm+iUfe5bhwLOHsqxn6Y4edLQhWvhE
	NF6rdWrdIedZv9TPhXRj2PHW2+vbP03UCVJNAhAhNCnd/TRpimu3Xk8zFXznGNKDVUAMM/ZtSyM/V
	+VRe70F+eMpI8AxsV2bDvhdS9xulJ2UyZTUFdZio6n7z6MmeJCziUKSLnRHT4so7iCuNfYSX/FoZc
	utMeeSp924b6uG135I/ANdF9mNDBepaeEas3v/+HZQNgbhqZo24hJl0kArGsNXEpWrl8mG31ebpdF
	tskGjyAw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veS-0000000BULn-1CFw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:38 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0E8152609E;
	Sun, 28 Sep 2025 19:57:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0w0NM-CvF_W; Sun, 28 Sep 2025 19:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082253; bh=dhrg79bBl6ieRfQSPcVxwYo7HoSzJSn6NNEps6jJUiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jjZf5GINZo5YqNeKA2iSyZyCDhJjJP3Blvfjvyxa/Wks0ZiIE0Lra9ACt7xQ+BBPz
	 beX0HkJHn6MslbdSxsOdK+dmx6lgnsTaMtNTeV3BE9/EzKLlYx3oIOUrMz0sNCjs+i
	 S6aXCvzLVOm2L1cKy4qmsWrqxf8AoH9vknHu5qiWIN5jxDj01fp56qHvTQRf9UvRKU
	 7yG7gTzQvXTg8aKno+Kb79L5RFB1mVJBySwMJjQIrwwOs5faaHnsWGaKWiNR6etOge
	 v79HWJhtlfiSoJLpzgim6p9vpSWDbVdoe5KFNfdDgvourdpxnwKG0ylzR7DMFOvxo1
	 8Auq5DWazJJ5w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:38 +0530
Subject: [PATCH v3 4/6] arm64: dts: exynos7870-on7xelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-4-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=2290;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dhrg79bBl6ieRfQSPcVxwYo7HoSzJSn6NNEps6jJUiQ=;
 b=Yq+9eLHxenA8cmacsmj/yEGxt03LtVmx7QLg6qkDH7kxN4YpC3Vxv4Ifx/hn23UbdUB5m3LcF
 ENHARYYL54SAfuQ94uy3VtQDL14op8pHej115XvEzOgm2ypzgcrE5SL
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_185736_615820_C876ADA7 
X-CRM114-Status: UNSURE (   9.00  )
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

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 1080x1920 Synaptics TD4300 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 ++++++++++++++++------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index b1d9eff5a82702cd7c9797b2124486207e03ad89..18d9dd55161b6ed4f28848d920ef229c83509442 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -27,20 +27,7 @@ aliases {
 	};
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
 		stdout-path = &serial2;
-
-		framebuffer@67000000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x67000000 (1080 * 1920 * 4)>;
-			width = <1080>;
-			height = <1920>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -108,8 +95,9 @@ ramoops@46e00000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (1080 * 1920 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (1080 * 1920 * 4)>;
 			no-map;
 		};
 	};
@@ -122,6 +110,47 @@ vibrator {
 	};
 };
 
+&decon {
+	memory-region = <&cont_splash_mem>;
+
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "syna,td4300-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+
+		width-mm = <68>;
+		height-mm = <121>;
+
+		panel-timing {
+			clock-frequency = <144389520>;
+
+			hactive = <1080>;
+			hsync-len = <4>;
+			hfront-porch = <120>;
+			hback-porch = <32>;
+
+			vactive = <1920>;
+			vsync-len = <2>;
+			vfront-porch = <21>;
+			vback-porch = <4>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.51.0


