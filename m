Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1872C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=; b=T3bBLIfJE7r2V1jKso+xGzhc8I
	PaIyeKm1tBPOVUo37qCVfgDNelMMttx52hnbC07g2SeAw4VxMW+X0kgPuo+LEm+tcgDwvYijPu2ni
	BrYqasKUDWfGrKh6lsSSQonc/qSuHwZXNHSoFFgB7W1R6OxAVTsl835jZ3KQuqSIwlTr8ulbipg2l
	usmPJfr22qh5mqSlD43xfE6W1q+f1aIZN46gPYzriXKuMGnGWRrPCQJLKcPKjLfr5Wg8bR4MZC8lt
	WgsXb5nHQWeqH9kJIxc34tYv6vZCyDThgqibjTm77305P/6U7FY0adDGsjrqdDNZkuWWBliE5/kQr
	jDt4IBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kfw-00000007y8n-0mSU;
	Wed, 23 Sep 2026 10:58:08 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kfn-00000007y5d-3KeW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:58:00 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b74dbc7359so677170e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161077; x=1790765877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=;
        b=POPbR1VkJv6UYEjmxOFthFct45qVjwXac6/9RhJXdViYWQpsSQqPrA0vXHuwkHFC8D
         UvVot7n+lBcDZuv7wv/qvRgRXA4lMW56hZzCdhVbNGm68aXmkwErZw8jrdbWTQ0aDCBg
         zSOhFruF2sqKm9wAONqBnoABamN0854LY1bsrMUD+FtOlR2OTbjBUG7ywrpfBFtqcpOA
         hixGSjCznwUK7G5lotgMdHX4dxtjllQtxhOZWFJE6OjI4lrwIwSeskTm1Ep8LtrDWpPi
         Osyfzma93x+hTCZf+QU2o1bb8FM3efn7MsVXeash7VA2I6p0t6bjNXltA0++sCwqxKT0
         W4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161077; x=1790765877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=;
        b=QZD97o6VLMKh4yJn+19gWr4Lwu1sgT3yWLYuWa8gEfJxdOO4Zq7vazA4jVHu59qY9z
         e38lKnAdO4lrI/s5LHznifN+etaBuehluVe+kO7LGyzB8m1XRKv6FIv8MMXuqpdnTc9N
         KR3pHCdC52/O0O/o55ZGcVRuvTqU1ZVGfnCTH83pCDXezycwx3VuWuZWPI/8nZ7JmdFT
         K/7TZtvtss2PbyivMZkabnRo1OM0HALzbZ8LhVETJWyAxEOMGbqjiMt+fYEHAXX7333g
         BRMovmDn+7lOFUrbcveRVTknn2pYfCkadTKORv+03FdSTNyIJENlT/IL1MH0Ce08GvGw
         mEkA==
X-Forwarded-Encrypted: i=1; AKwUvBxDwgWRwMCXMkJ7CTw71ZEtAXSp9aWVJc9M9WpbUzmo3WNsLMiyI9K6iHBrWQe9dvFle3EmWnXVCpX2WmcZTkTT@lists.infradead.org
X-Gm-Message-State: AFuF++lWfGj8eG01oJcgFbPB2IyQt1cElfvyRuc/dHKTO4v/FC8kd2Yy
	/EfsBsJS/uDVWcLtLOGxrF3WN6Qs+1xPRUh78ZmkeJyrjJCIS83fcAJ8lELipCcHRDgd9w==
X-Gm-Gg: AYBFou2GqiZFS4vadiwqjv8g5CAtX/0GyHM6cMFzTMaffmXAjivcqX0Lpth89NnRu6e
	ba64+wTqdQWxfjLs53uO4zAA8MVo43yHcDhjiIbpaQf3WroW7ivxlnhaQGbwrCV9+j01k2ZXB8e
	8yG2AhUQN8E7enYYUU9lu0xJKbuouY9H+UF8lV+r8W3F5+JRNb8atn4E81eTDW+/9PP8by01sH/
	xt5D/kQUmx7X6dELGdW52nXVNpx2qT/i9hleKP0OdvBgT2BIyNfeHVqlB4I8KVqJvGw0vR/0aSs
	hK664ehG8cSMntWKvnuk3r2TA8gUiqeiwcmFoErKhk4ZcrKyP8ppBLD8TiDE4lGBppT0GWgtNAd
	7VZUnck/R0U35nNsINZzLJHlWO5IZA9gSeHh/RdBXmMcpSkvDalrr4EIdEBtAGSF3/Ae1e3kUji
	wIeBbZK9/tH796DHCNEGZwRNSTM5NEhEG0RraTYH2y3WhtPsIEWDlSy5618VTgXQUODH4iEndjo
	9L+qPIqGZD6rTepWDY=
X-Received: by 2002:ac2:5696:0:b0:5b6:1a7c:59db with SMTP id 2adb3069b0e04-5b8d89c2a3dmr808727e87.53.1790161077408;
        Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm506392e87.17.2026.09.23.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 15:57:51 +0500
Message-ID: <20260923105751.435-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923105751.435-1-anykey196@gmail.com>
References: <20260923105751.435-1-anykey196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_035759_872976_60FFDA69 
X-CRM114-Status: GOOD (  10.72  )
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

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index 1b690e3cd..3ec060228 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -218,3 +218,43 @@ button-1600 {
 &ir {
 	status = "okay";
 };
+
+/ {
+	reg_vcc33_wifi: vcc33-wifi {
+		/* Always-on 3.3V regulator for WiFi and BT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc33-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	reg_vcc_wifi_io: vcc-wifi-io {
+		/* Always-on 1.8V regulator for WiFi and BT IO */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc33_wifi>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc 1>;
+		clock-names = "osc32k-out";
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc33_wifi>;
+	vqmmc-supply = <&reg_vcc_wifi_io>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
-- 
2.53.0


