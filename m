Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4EBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKZOwRgVgk/u0KdrUt1cAkiGVJS+RKkMWzXrX75b1m0=; b=ImiXn90JXCPXQVyx2P4TTHYRoB
	6S0Zr0O9W+TzlTul9L4ywpLkyoootZZOIOkeI60sZ9IuVyaTdwqWI79mZnqd//MjP49GnX7V5Wrap
	Ehsp+M1u6dPsAPGsmOgaZYxrTKdzYUyc+py27ypmQ0hppm1ljI3qF/114iojH36nP5IBXd8wNSj1e
	L+WDNt3Atv4SfjiNi2C7A/YaPdIW8uVniLOnczESLNrPgUdv66ETRQF7HJL8RwxHblWFu+AV+Hs5v
	fLCEnNBEgpFAFw7OA599aOEa4dXb96foOnw7Buxmx3l2CB+KjZh438X9t6uBil81doU9FgkbFMr21
	XZx4gdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpo-0000000BCOL-336o;
	Tue, 19 Aug 2025 18:13:24 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMDC-0000000AZHr-14DR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb79fb221so72410166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609433; x=1756214233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKZOwRgVgk/u0KdrUt1cAkiGVJS+RKkMWzXrX75b1m0=;
        b=ZVht2GUjp8UQufUldxLyd+9oruzx15KdQlx6QtV3GV6qg56vL29NmSa9cX3s7Fc4fj
         ttdQqhs2cxzYtn2ELKTaXJEZfA6/EhVFn9bupmdPmmNOuaIi9hX8TSWJ7SfacDTeyka7
         7rtVXStTNvpV152lZ/KWTDPMU3FEBPDLdWxtIn+L9XYDkiS9/DQmVEsvm9r+aFZball6
         oan5ZbFRj19KMf+L9kRbPAOqGLYgajOZoUvA/j8GW1Uzwni2dv69Cyt1ySCJa3eWUY0U
         n+P6lfhvEoNP+QhZObZRAMStY5nb1FLtxfNcCr/nH3HJb1X08xytvDTVtZgiMQ6E3QMG
         NbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609433; x=1756214233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKZOwRgVgk/u0KdrUt1cAkiGVJS+RKkMWzXrX75b1m0=;
        b=ckRd+Ze+aoPZ0I1xofqy5ktfvEo1VifX9L10LNkL8hC/W7eqFtfmQ7RWojaP50WmT4
         7PnNuz+Fv0umTGO7D89S2UavFn8ePB2UFZzU8M6NCUj5bHtXZ3DU5xyokD0mjdAD7jTG
         AAED6Dzsapbh07rvKwobu4MMQCMW6/xyR4Fn7XIY/TGEz8tdUVI+hSE5qICHvwbloiP5
         wBZSyqI1G7EXu7kPw+N0x/nCvRMIX54GAzwMoovXuWnLwL0hN0ALgT/av6qZjpjYAkJE
         eOlG+84fgpoXqGiaMaqugQAkIfVFud7FIam+uMjnlSYUR3uflfTQ7Kdg6lDWrM0PVCMU
         6cQg==
X-Forwarded-Encrypted: i=1; AJvYcCUepC9ufWNkEpUyaMWcIXnhyYOyDUGqHbSPeIltz3sfHiMy9wyw6m8L7/aaHh77yUYEdCXDrVS/XvQSEEKKx8WF@lists.infradead.org
X-Gm-Message-State: AOJu0YwBkLgdiTAYBFqn+ZraCStUL2m+7wgCQrFdcRGPqNTv0HTxAgBT
	O//hOrtJ/KK/B6V5Ng9yj8ZsldQwk8j1asBz7wHWAz8Bpg4etyqcirZ6d5pekEL2Hyg=
X-Gm-Gg: ASbGnctPkXyNJ4jCz3Lc95HvCCaO530ZvBHJXVyceOAgFthEs+evu6xuDJ7aG3kXDT3
	dwpxpaaQe8tMTL0QVVdq7X2x0mt4ArVgHOPT/dtTjXQms8TcZVRcqSMcNkv7WV7WsIHU3jnDJLi
	gX2iYzE9F6GrwUgecagWRyIEja6b5uy1ghnXACGloGmDc/aPVQQrcWuEItOJmhl/39qrsr8rIZS
	1ZXKvYEvXe+r0EpIJtN8ZWnqUaAWVHJzB1SEwd1bcv39TxtfQ71QkrGQ9B6ZAPOIQKuEBNwnM6m
	okJk3Zu8cbLgT0aT+Qa39SChQRqOpezF01PNf6V5bzl+G5dZ6Dm+olOJnY+uufGDQApcYiOnPA0
	Mcw6+MaJk1Y/F2HNh7202HBXrbxkoCZdwtg==
X-Google-Smtp-Source: AGHT+IE/vAUGvaFZ7UmmcB7vUKiiYyvdlgsGn3EINffXwUbDoJ0n2eu7BMJecMYq+4729BjHVfjv/w==
X-Received: by 2002:a05:6402:13c7:b0:612:e258:33e2 with SMTP id 4fb4d7f45d1cf-61a7e768851mr1075178a12.4.1755609432667;
        Tue, 19 Aug 2025 06:17:12 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a92678f45sm129674a12.18.2025.08.19.06.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	=?UTF-8?q?B=C3=B6rge=20Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: stm32: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:08 +0200
Message-ID: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=B3zj8kIxlI6NNxjczKCH38wkItfXZHU2cc6N45nCziM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlTkXi33JJKHIMfKBoPhPxIx908F+l6S81a7
 m1fzcytzaeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5UwAKCRDBN2bmhouD
 1346EACYQWFZHMhc9Q28PrXrM2zH4iKyydMy43eCV8WTv37Msn65uyxgguJ7kyC7hc5MaL4HKOa
 d0JKgl4tyaTwoIkCHUvT5ZewBrP+RHxyq7mTQqTfVHCIwKXtFf8liWHQ1noXqVcWnsy0I1sbcw5
 MMU25nXzXQvz4Aqiv/BIDN0C5N2e4znVVzQcaoHiSjB2Fzdrgi4d3UKDrMCK5gZKfDE8cbFVIbf
 GksfXa95bREav2g46bo/xcVRDYQhRp5Hfk1zyG2Dr3ck7eqQ3AVOxp4tVT9/Hwxgz0bykWSIxCV
 qA0chuos9BWz/JF2cwNxHR27T+R9ezSXbSjMoVf6tjFnZkJXuXKlrRWa3WZ57CRAPFZnnSNH/d5
 lPVdiZiTTBEEw1oySG4+ukrMqs6VEJdNa6ZnSeFclm1PGWhmRyfrRGCJWOf+SZ0YF6tkbbSJUmU
 0sHwyexaVYtKSrY3polDkTaDIU8gPZkHYBIfW7dwPd8bojdX5ghigh+k14+ZGDnSINFI4dJZVKy
 kITbrPn1Udz5I2aRC2GSFK4c75IxREqD4ZxqgKjgakZoc2eY8zLdzJNgY+ps4sHu6GWPhxaam1f
 VRpB5DfQ4FaAdxO7awxj+qtl9dsqEsRQBSoMxHLrpuW7ZYfe+kBEy4aEquCc7+hIY3redt+aRdS E6E7i24wVw2SGxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061714_289649_13EC6BA5 
X-CRM114-Status: GOOD (  12.07  )
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
 arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts        | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
index 39a3211c6133..b886aa91bb86 100644
--- a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
+++ b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
@@ -255,7 +255,7 @@ &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
 		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
-	reset-names =  "mcu_rst", "hold_boot";
+	reset-names = "mcu_rst", "hold_boot";
 };
 
 &mdma1 {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts b/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
index ac42d462d449..2531f4bc8ca4 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
@@ -92,7 +92,7 @@ gpu_reserved: gpu@f8000000 {
 	leds: leds {
 		compatible = "gpio-leds";
 
-		led0{
+		led0 {
 			label = "buzzer";
 			gpios = <&gpiof 2 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index be0c355d3105..154698f87b0e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -262,7 +262,7 @@ &i2c5 {
 	status = "okay";
 
 	usbhub: usbhub@2c {
-		compatible ="microchip,usb2514b";
+		compatible = "microchip,usb2514b";
 		reg = <0x2c>;
 		vdd-supply = <&v3v3>;
 		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
-- 
2.48.1


