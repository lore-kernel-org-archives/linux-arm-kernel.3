Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y73nUcbBkfcVEEE7f2hhwMMuuJMYtvWJsQ+Bwiwlis=; b=3JwoH8aUJM79lqtMXzLgQLQuON
	Se4TBUkrehUIBT3lKpGLPefNdpMFJlVwB9oxugJx9s3E09gWPDeLhkRI5POtJMGEGlTw0Inlj0I5o
	laPRaY8d8QPLs/AJvHpdRiL9ZaslXoqgj7c8az7j4FSlD/gxnZNZhLoNX/+HQfLIcC71hCYph/2rR
	/vDJTJQaydHT72aiygQSQJJNa/Ly98WRlK8PYJVURDE88uuku237DRpTeyb+L+UGN4Dxn9heuIuJT
	84FJP2FDNcSW0y6fXXpTLzjTjkaP3KLaJ2W00vpGM50tHzc6dXf6KQ9/YUZX09E6C6oSW32xNy0H6
	Pi6qnnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSOi-0000000BSt6-0BYU;
	Thu, 02 Jan 2025 21:06:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSHd-0000000BRr3-3X1o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:59:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso617538a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735851548; x=1736456348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y73nUcbBkfcVEEE7f2hhwMMuuJMYtvWJsQ+Bwiwlis=;
        b=MVpX0eTjX6xPkbyuM3IJ5hCfV+QxqFqOwFHRYlaX3q/N5FETVNqXaaiALOE5SqHFn/
         0DTskq0MksTM6zi1Wls6e03aDxNxjZJHA9tDessBKw91+7b5C7lAp2QrXgnDgDFEplyn
         46hLmphlLezzIML4+gf9hprOZcL7s2fUHZv7kkPbMTOjnF45oiiubGPjQNvvn15pcxK/
         MbdLPcZ/Ola1mF+Skx5RDlewHLPMU1MUhROW/Skps5ykLa6u6gapQHqAadiaz2kDMv/f
         pWNrgznJPfQ1W3L18eTws0udcr32o5LdKvEY6YCc67pvtQTC0Xna7NixpGE4YnUwGszZ
         GloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735851548; x=1736456348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+y73nUcbBkfcVEEE7f2hhwMMuuJMYtvWJsQ+Bwiwlis=;
        b=w6qIqhHaRA7tFE3YlNWOcBCUB8Tbt9GHFNC2YnnEvbq8ltC4MzuSGLdnLP0LdMoPn2
         wKDMucKYioBMhpd0eVjheElNXvOT+EwwZkEEFd9+A79UnHETdCVYzYmq5OwouQLOywlP
         gyIcNgH6MvaRrhWlhQxCOxGhIZ08Z/7MflUDX3uPdUMH2jPCfSRDbKuDR4o+yAj3mIK1
         f3zGGqK5Q+ELs64kMhyQUVeZx/YpD3LX1+3Ku1vDZ8S4q7f5Bo9UsljwmvxoV8T4ISx/
         m1pUwB/c1rzoBYcTthhS7WlvjFgR8o5HAHBt9k0cz8TAbOX0imOKIf9Iz+vpsZVenXoI
         e8IA==
X-Forwarded-Encrypted: i=1; AJvYcCW5A+c+AOV/Tq89JRQKZdaTPBsEOyVCrE5CLRnsdVbd/LNe+Rtow7vznkyJmIcUDXTT2AHNNo3jaD78JCgt4jlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyduKmoipkAsWQ+6IggHqc1zhBa/tMrUDh1ysGew1sgE+NZ2DgF
	+F8K+YlinBIFCuW4ZUaMYdbA8+VIq1lgoUZ+Honk7XnQ/Zdw4rYh
X-Gm-Gg: ASbGnctALYsG8zWmIpqPGEAGADVYOaQNikrvv/nEDRfTcy/BPogZgq7XUt6H35ViDmv
	IkujDSyg6ARRyG1SrhuBgZjaNev7ADmLw7jPC5xSoXXTnkLKEdG000EheveWUrh4V8Ob8iBnvhq
	ManxoKay/NlfSY9zsvnAZ2urqk5l7zXH0c/WMHTVUk+OkoJdOpiBm+zxOnZWpKUbWnWA1Ph36yp
	e4vklV7rAENkRVsNhZBlPvA5/uZ3glxrEmPDgonACJsGQMlYjMvuKNhKnMM4MnyDDgwkVJonqqt
	YA3Ki+2dKfA=
X-Google-Smtp-Source: AGHT+IEqlGR7cLKfiAb4iCKtSruswOwU1yNrvzRiMPDUKtmOOlw4jmo4JyXYCEib8UgWqzIe5UpKDQ==
X-Received: by 2002:a05:6402:518f:b0:5d0:b51c:8478 with SMTP id 4fb4d7f45d1cf-5d81dd7f300mr40558577a12.12.1735851547982;
        Thu, 02 Jan 2025 12:59:07 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f397sm19231026a12.22.2025.01.02.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:59:07 -0800 (PST)
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
Subject: [PATCH v1 5/5] arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD storage
Date: Thu,  2 Jan 2025 22:58:46 +0200
Message-ID: <20250102205846.223955-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125909_878869_C864170C 
X-CRM114-Status: GOOD (  12.64  )
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
 .../boot/dts/exynos/exynos8895-dreamlte.dts   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 3a376ab2b..11aed89a3 100644
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
@@ -89,12 +93,47 @@ wink-key {
 			wakeup-source;
 		};
 	};
+
+	reg_sd_vmmc: regulator-1 {
+		compatible = "regulator-fixed";
+		gpio = <&gpb1 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "sdcard-vmmc";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
 
 &oscclk {
 	clock-frequency = <26000000>;
 };
 
+&mmc {
+	assigned-clocks = <&cmu_top CLK_MOUT_CMU_FSYS1_MMC_CARD>;
+	assigned-clock-parents = <&cmu_top CLK_FOUT_SHARED4_PLL>;
+
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	card-detect-delay = <200>;
+	cd-gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+	clock-frequency = <50000000>;
+	disable-wp;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+
+	/* TODO: Update once PMIC is implemented */
+	vmmc-supply = <&reg_sd_vmmc>;
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
-- 
2.43.0


