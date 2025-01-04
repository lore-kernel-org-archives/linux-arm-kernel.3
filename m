Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A301BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpWoGBpI5JjtqZNRK0ytQyJ2WYZd1lAvc/QlVyBoHrY=; b=TAwEA5XUC3qoPYaFwBx8QaOevp
	dInlQ1y6Q5PvQCwxOaebm/5ulBRzksxJCemQ08ZZyFp6VZqxqvWHl6MEyUtW7SyVNQFfvOneqVc8D
	0lVMjCtZi87/Ll/SJtFoWcdXfvlwfU7y4yUU8lC3bXdiXna7f7DZm8/qDM0cQbYjRe0PS6Qiq98lI
	mzQqVdu3qqEoG1NE8sOIqfsP5YIuSYTflwN0s+tFM5OjQuVYVG32WmLt4rIUbEuHnUShmy/2h7toD
	15m/WFVSNmljnXdlkkPuP02hqKsVZeFCU/uztDeBPYyncThS40BqCXllAG523k9T3t0xtxLJHtYy3
	GhZfji8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7M8-0000000FIrk-1op3;
	Sat, 04 Jan 2025 16:50:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FO-0000000FHw9-25DA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361f664af5so148479995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009013; x=1736613813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpWoGBpI5JjtqZNRK0ytQyJ2WYZd1lAvc/QlVyBoHrY=;
        b=Mox76epBWlV/A9i46tFhVtc55wEo5QduuZennlgUzDzfirfnTuLKUEUKyYy6y4DQLc
         ffm+bBYLkpK8gWjkTskYKd53khx5cQWgkoIfWofUcGBE2yayRO//RPUxuAiXBgTFAKrn
         EeFmdCt7TdoaDW5tLuGOHhHJ1KNL+uGaaxBiu8RnGy7XYV6LtB2AFqek7m5eLZv202Yp
         uhOLQqyejXoU4RlfrblD3YCM+cNVL12x8ZG6PFtb+Pn60l/03oY3WbFwDGqOuwMIN+xh
         Nbdu9vqSJL4yy7iNMA6UeINYoyGTinVLjtMQPcCh4PPxaUzY5chDM3+L6doZhD5tFsMS
         1p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009013; x=1736613813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpWoGBpI5JjtqZNRK0ytQyJ2WYZd1lAvc/QlVyBoHrY=;
        b=umMHvmOu4LsMosmNrLpYgnZ7rELmr/YFyJX+V5OjQdVa5Sy27g6YxldgpN+YP5XY2R
         qAXqYxt009yk0Q0b3HhOgNoI2VFbLYdpLRk3CXjPK2ib+QeO/wqHqkQhvZpLa9kSDvUW
         vJJpoXAGW5KeU5oBlpMmwfP/ldH9aqcwePsvXm612Jqd6ZZWcpgZPVo/E3uEquffFqVU
         dZ4bCwnhqZZ4ksT1/tp715WGLDj5EbQ5Cdc2H5L/DTMBVSeE57dMY6atOI+B6VzgX54g
         +Jj6MR+KAcDUPlGVZLHv52ejirqgB4I8jYOBIUyeSV0Apd9YyG9vMwsqi03Xa4Vn4NOw
         9+ww==
X-Forwarded-Encrypted: i=1; AJvYcCV8bsymJQ1DYJplSPafPp4wwo7wmX9gkAugeFkcRgyZXo5WHOn6CU5jsMdvZo2m57G9Za+dsep7neU7Cw1DWMoF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4DFHV6b9bwj2R4R2FTRjoL+Ubei1ngi1UJiv7geA5jpp9F07
	QqLEvUdgV37iqsLYB+V0xgqf0+KiYhpGYU19TW+mkIgwvy65/Mjq
X-Gm-Gg: ASbGncvfSCsePl73pZsKS/1fHQkuuyHIFPbSsvJYS4FX15ui6bPuFKGJqXU7ohfNPOj
	0dAd4FmtBbGZI8zCDUNqFQlivS0b2nUGoSo/jIUrvrakCaq9ibV3j7duoxlg4O9g4mvK0C07s0r
	JwLuvz6GcO7CZInXmuNRsU8uU4/4m7ocuUcn7um8ly/1BwXIHPa5szi4Z8jDNt8sPvIUaw/3V/9
	wtxz/3CKBBy75epLfJpXglUNISuyE128v2qg4BPDHfkRQoAXl9Pvkg737RyyAAqSaWOQ3o=
X-Google-Smtp-Source: AGHT+IHfQZz2+NCGzzwq7O52VwrJnAqioRl5raW0vWJTOwnrKjnX1MOwAae3u2Ckis2FUe4UnLwOvg==
X-Received: by 2002:a7b:ce18:0:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-4366ddf7c00mr401351825e9.23.1736009012670;
        Sat, 04 Jan 2025 08:43:32 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:32 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD storage
Date: Sat,  4 Jan 2025 18:43:20 +0200
Message-ID: <20250104164321.333669-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084334_532044_7B47268F 
X-CRM114-Status: GOOD (  12.42  )
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

Enable MMC for the Samsung Galaxy S8, used as external microSD card
storage. Since the main PMIC is currently not supported, assume the
required regulators are enabled by the previous bootloader.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8895-dreamlte.dts   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 3a376ab2b..6c4f8d4a9 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -16,6 +16,10 @@ / {
 	compatible = "samsung,dreamlte", "samsung,exynos8895";
 	chassis-type = "handset";
 
+	aliases {
+		mmc0 = &mmc;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <1>;
@@ -95,6 +99,27 @@ &oscclk {
 	clock-frequency = <26000000>;
 };
 
+&mmc {
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &sd2_cd>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	card-detect-delay = <200>;
+	cd-gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+	clock-frequency = <800000000>;
+	disable-wp;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+
+	/* TODO: Add regulators once PMIC is implemented */
+
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+
+	status = "okay";
+};
+
 &pinctrl_alive {
 	key_power: key-power-pins {
 		samsung,pins = "gpa2-4";
@@ -123,4 +148,11 @@ key_wink: key-wink-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
+
+	sd2_cd: sd2-cd-pins {
+		samsung,pins = "gpa1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
 };
-- 
2.43.0


