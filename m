Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E0ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dwxhOWr2tfFUazQ0vTmv0AWEueIJvOP+MVDAxepHzKE=; b=blt9AFbWA2m++b05xEKRY2u90t
	6bfzrwVb/7J090Usk5RH5jzhqyE0LD8GHD+TQE+0qZ23QUjT4SB2PYl0zSZGphxw70+51DRx99Rwy
	s3GHAAEd9BogN+4ojQlRgbZbrzvR3OwHVkRk1IS0z6xA0aPGeTFYyjmaApzLPhdfW3axOLw2RqZ80
	3cxUArnp9OOaj+yIQS4ps3xzOX2gf0YtINfFcFP9vOyk6lMfgu+jRfYFmvytxYooldUE+6Y2hR39L
	GWV1LUX8igPJVezEIaU3TKCcnvVLqx9WkklKwSQfD4qYm6xutmbQqqCaVKF2pb42z65x6crqj0Yb/
	JjeawZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpy-0000000BCd7-39ro;
	Tue, 19 Aug 2025 18:13:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMDu-0000000AZNv-04YK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61a20bd7a72so214886a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609476; x=1756214276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwxhOWr2tfFUazQ0vTmv0AWEueIJvOP+MVDAxepHzKE=;
        b=k/3vKO2KbmlME65KdAE8GqEnxYMnUu/f8XezwveXing3sWWPAzSH3LddOk82bw/FRY
         DwrJqsIqIfvluVYqq+zuDR7rzwcvRI3Nuh7BOWbqEH2EytUBWknxlQcWrz/0bSQbVRQC
         IYHWAiZ0YsJq1GeZD/qEL+87hi/vUX/BdsvvbYDxFCW55KvIwepvXZW3wwCVGkFd5TW0
         hnA/fjW6wEsMjwgLgXcw07P0rzRHzViiJsnI0Q/qZBG22rrulejhJFJqhp/LckcnWz/V
         0nOYS9wUjmh1SH0GShhP22S9YJXDcnroQ6IuYrqvQFQwSbVWGSgw3kpJNwtDlRDnW7h+
         tNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609476; x=1756214276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwxhOWr2tfFUazQ0vTmv0AWEueIJvOP+MVDAxepHzKE=;
        b=TpBAeG7uZyVMPzxwXpT74TyMUY5OM8tainSDFEZ0D6aK+UtkyFtY84rUb+VqCcXk6z
         TwQ8cUcwPADOxamBgCvUBynQaBcI6ufmqohfUAwTMlhlrFYZnVKD+T+AD98LtlVSWG0L
         kjMYGBrvWNQZlVPmAx5kagu5aSWmRTt0NBLoj2/xeW4rOV+hVqcUqrOe6iQWxyqUX7qT
         A8IFSCNddxUkB5avYi99nu9aDq21XJeDMGgxxVr/LZIMUcsWdcsoUo0zmMo71Tq3T3YS
         xCC9JPXL5neOIbV2a5xc8kNz9myr4ltLcyqHjLghpqvv1mnuZBhR/ZRPbntWOFoKUkLK
         J4GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTFJJU7TsxPk59eQSu622VykHk8+ZbN4AQiREvllzFAqsw4tJwEG7fG1QBZPocOC5psv+6AMVIN+V8dYpLBFHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2A+Z1u4gKcz2BMEA7NnGCVpyrRlysDau9lo5PISnLXgl64Z2w
	CqL4VBAqQQQve8Q9ZQskamI3vHASbo5u2nq+iZ1+1T6CqRpZW4eNP28s/YPPA9aEqEXJbWp077s
	vWCuf
X-Gm-Gg: ASbGncuyYt4zTbCsDnbQBW8i7r15zd7/HXE8BP49rMuyt/1Etfjh01Uf7CTHt5AGEhD
	0j+RzNjSAEyd8U88QG8b707NtCBlORFEstPJ3Ia1GRQt9jjCAiBKb7OS7OPgd7sKUhKJc/XzfJP
	mNou0jNWJU1g/KPb+UD9NAHmWI8lYeyk/feUcELpGXVXaMiheFwcOnFHEwT5suu7WEhJhVr8mbr
	YlL1aMaw+a18ooYf067waSAUtOl7hwTRRXR4KCp7UyW4zpVh42Aof5ZsEMUZX4avsBJn4+UCbIC
	3fvXvb3gzZVJ9PCH3GVEoMqPXmgfxjS/TRGkL8wnOAuKKmZN+OvSsROHOgfYtsFZV/JO4Biehct
	P9fmr/d5zuAGzoz6cUMwv2lLWsd9u3IsXsg==
X-Google-Smtp-Source: AGHT+IHADlenz3AdOd7FQc1EL+ISVUt3VbFHxgCFL2F4EgiCqro4WqqKqiPXtAlrEaDVo3hCIju+Ug==
X-Received: by 2002:a05:6402:40c4:b0:618:1835:faa7 with SMTP id 4fb4d7f45d1cf-61a7e6b6437mr995125a12.2.1755609476324;
        Tue, 19 Aug 2025 06:17:56 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755d9b37sm1734573a12.7.2025.08.19.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: allwinner: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:53 +0200
Message-ID: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=a/1Am43qkovn1U45ePWY9QossHBqqTSsbI0vixo31/s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHmBLoUxXgl+pLIifvNbA+bzGXESv/qvlnAnv
 KJqtnvJQFKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5gQAKCRDBN2bmhouD
 1408D/4+3v8iYk/kQH1Z+B8Kr9TVDiNW9AGM6dhlicodidDswX6yq4R7L3uHYrTgy6D9DYOMEdu
 fFOh3dMyd4r+ifvr0b7k6sCPRUD+Kcgx43HD0zpp0/SJCRxXx9qT5shxaF3D15gMO/NB2RreH8D
 MFPf2qMJRBhEiHqWjay7Q1UPC6iP3f2YhAA7i8TuunoQDknp1UrqhB1ZHjzVqo6qJQe9NEnTYjc
 E7PXWUP3ywhYvv1NqwdtWz8TS9YOHB+AhBXSv0+ss1C2rOH0dpUWJEamidIoHUrRJFxpIP1+S9e
 fLWuqLHf9njYf3FVpy6IdqLSwOq00wcEoupYtSO7FVPyX7+2CxJSh5GEIYd2DZitCEVV/PNGP+3
 VlkjHdcEl7cYowWa+kPhfuJfuZfFTK+pjtVKWsDyIrm4cAUNA+l9lMIeQ+CgMsNV2yoeinUgo/6
 v4Dgn6rCndS8yLKXhFrbSqYuFQrDI2RW/haQ21PbbCRLhWq4t22xuMMv4CfeQsBU3GzOBWMdfsI
 nVzMZXfXDWj3aI5cNj0YC6I0EqwsbDFPKC2mrgEII6wGpa5fUY1sC8PUx4FaMHf+aef60jx6tq2
 0KYUU11eJ+K4hwElrfDLLI9wWWeI9IEm/9lkARv/liujs+x6PMt/iI0P3mYXiBFPwAe+k332Rt7 Cjv/D/Z9mQ6ZYeg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061758_053667_51B650F2 
X-CRM114-Status: GOOD (  12.69  )
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

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts  | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi          | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi                | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
index 83d283cf6633..d425d9ee83db 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
@@ -218,7 +218,7 @@ &usb_otg {
 &usbphy {
 	usb0_id_det-gpios = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_det-gpios = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH5 */
-	usb0_vbus-supply   = <&reg_usb0_vbus>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi b/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
index 272584881bb2..a0f787581dd9 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
@@ -82,7 +82,7 @@ &de {
 };
 
 &ehci0 {
-	status  = "okay";
+	status = "okay";
 };
 
 &mmc1 {
diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index fa162f7fa9f0..f0ed802a9d08 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -705,7 +705,7 @@ uart2_pi_pins: uart2-pi-pins {
 			};
 
 			/omit-if-no-ref/
-			uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins{
+			uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins {
 				pins = "PI16", "PI17";
 				function = "uart2";
 			};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
index 5143cb4e7b78..cb6292319f39 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
@@ -29,7 +29,7 @@ chosen {
 	clk_can0: clock-can0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency  = <40000000>;
+		clock-frequency = <40000000>;
 	};
 
 	gpio-keys {
-- 
2.48.1


