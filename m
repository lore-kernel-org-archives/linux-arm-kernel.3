Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0432C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=; b=e+R0i6Y6e0TewBJg8Hl6JLsNOO
	E8+4Yq+xk4mdl6SLqN1sId0P5v1xERKsC/+OABRSg+FnpsUSvDwdj0qjSeviMUqTyeTikBTz5+f1H
	TvcQaI7Yg0xa1YmzwDy6+fSP6dAjNvHdkplt/nSmQc1wzSXt3BxUs1oAwh/aJYGYtk1VBgRNuuzEw
	WQCGY2az3DsSn7G0Iew2Vjz20CXJBFZSBt8XIK9y+LqXbJ2M2m/KmYk0EIkfHC0NiuEmhEKVIUFea
	MEy6ClncjpksEcqRWnY6onH2YQemajOxcWrGLVnntd4+pQpvhbr8FrPf4wQqUfZIZPtx03kqiYf+w
	trpYnA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KaP-00000007x3e-3iBb;
	Wed, 23 Sep 2026 10:52:25 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KaH-00000007x0R-21us
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:52:18 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b899413537so1003386e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160735; x=1790765535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=;
        b=DRW7l6oluDInhb6jaAKQdWCGKS42gFe58XgQAQ84vUyjKoeKmOSsJwzrX3CpdBnN1B
         fjDn9EcnIefw2WFLd9b4bte4314taCCWYgb2gwcsfoi7/UiTrGBopOHuuMS89Lm5Kg7Y
         Xk0R1w5UYJL3Wj3VE3MfmJo8Wd0Qstvw2mb8tWwHR8uzePP1LaGIwBkrhbWP+3NNeLkF
         MDd53dUbXg/rx7qwfEkNx2CFZvk9h4rs5wPJm0OqR+XpSj8Lp/s3abCcXut405vTokT9
         9gptl6Ppm5A0iwEPAPEbe2dgCptzUfP4Tcd5eO84vlyjywJHGMoHZ/mPKs9Uzpy+TE1u
         ERgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160735; x=1790765535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=;
        b=sp51+KbVc+FgWUmfuD8TDd7nHDEbYF9IeBKCbBI1hPqxylfjm+WpcL5Le0J2szTK/q
         r8Wl6yM6x8CDqupnOZPwoWxR0prdqzyXgHPjE0FeCD31GhEHP8H1+cmrnrwvrAYrlZl0
         eGbtAbBT9JZlkC0IkE9zMlovn9HJ9AGyvhacmjRLD4aQDPQ6YMvmDJPC3u6xcUNk4RHw
         WgqTMQ+HB5T0vVsMb7XOV9tZKwZrA4Zl4kQeaOkvlIHVomQV9mkjkyrvcRaKnDblc9Xv
         JVdmvIT9UY2sRh8rs4z/N0tweZ1t6Azlyy+4rEEi2m3uGSMn1pdX90ad7t07og2MHvhp
         kmcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUWTxz9FY4Dqc19OV5iPEhjamW+NgKO3n9FifLL083niblmfL+1IcHYkLogF7bjxj4j4DFW/wngqjp4wEUfTUd@lists.infradead.org
X-Gm-Message-State: AFuF++m8L2IQu+wgPwu0sRnwm2/5VhWEl4FPSQytxYhXqb0NcjznG/m5
	4RWvViXafSC/Y2/HLeD54BofA0ILTmUfVZgtwM8KMMBg5QtP42Tz2R+7
X-Gm-Gg: AYBFou02RJ9GzRMu8P5lzFiD/isQ32iJEm/20e4C0KhsrKNA3SDHcJTxDIMbjYT0emU
	7tQQV+hc8MpRoRtJ+olhk9fJk32qY5wSDJxt/urCx9GokMDdfZq+Uk2GBPfvkN6ALfcCAX2H71/
	BPRcmwgyt3PxSRX4sK5g9J1LkMRlpKyFhCyAWweCAAnFF6zr7H4PxIw1jFfcirGxICw05lbRZHS
	wL2LRgJaBVuE9/7AXxasUlZQF93RjaFjXMQjZtiq3FjKxTHjQ+YlsG3CWAUQqIyYsPHKB7pfz7i
	KuJINEZPblCP87R+2Adin1+h7HcrNM7jaV4raSNu+3B14ntykZ8FE5tyi+ZLLN8cQsPCakxhBuF
	EFiOvsYhGm597q+TT+sDgxM29ErJoV3qkH9Sb+JlFi8SPIlEaAlOqHp9JtR3JUnrsPlhlN3HK5n
	maFGMWgqA8bw4zQoFbGjk1IW31o3u5n1yapEh0Ey3e9HwwbYQ08BbGXUi+uGdfA1T0rURSMJre0
	B3b+dOSKkZ2J/L7QyvMr8WhZp6oHA==
X-Received: by 2002:a05:6512:a344:b0:5b6:183b:d214 with SMTP id 2adb3069b0e04-5b8d89cf47bmr634761e87.59.1790160734896;
        Wed, 23 Sep 2026 03:52:14 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm497428e87.7.2026.09.23.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:14 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 15:52:08 +0500
Message-ID: <20260923105208.198-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923105208.198-1-anykey196@gmail.com>
References: <20260923105208.198-1-anykey196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_035217_540799_8A4CEDD7 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Vladnwx <vladnwx@users.noreply.github.com>

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -218,3 +218,43 @@
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
2.45.0

