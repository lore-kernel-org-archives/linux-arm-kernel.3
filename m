Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0699FCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqCY5jTvsISB32aIb6DjyduWoHu1F4uXkTH9VhadKk8=; b=EyuHLV3UoQ0k7O7mR2Du2vDmy0
	N5gY6oZrZiziW7mtp6aQVN6tCjql9EHTESaukcrRFZwyAFru5kh/QCuBngZSBMfe0/s/eB7ImoxPW
	lgWPj4EklPJrFhV9rkZwc9h0vIBxkIjuUtAww0Pzxt5HqmmsGxXCkY2oUYMjlOQ1Lct1ecokBEVMX
	VQM7e8Ck+QEfBTyt9QhFhqmJpfburqc9GNVGCJ5dQZVcBaKOvvHTqBp1s8xrk/M6Q7iVN9dLG79u2
	lAyLU6GeTZqbHTcHpiMA9qrD7SrJMRv1X3TLf/4w1Z8o3RTcTzX4ZirqRMBx3OjkG+RFg6dcyMJqV
	euA6GYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9z6-0000000DYqS-4678;
	Wed, 13 Aug 2025 11:49:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9DW-0000000DS9v-0Klk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-af93150f7c2so979435766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082824; x=1755687624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqCY5jTvsISB32aIb6DjyduWoHu1F4uXkTH9VhadKk8=;
        b=bbKl3+s6myOve3ALxq05tc/URLwwcemmF0Gi5n2iy8+zwchXzNUAtQXN3xcFDsvIki
         sVYLJS6eLdAoys3UsG545OneowUbScpX/dUZBBmjrWZBpynirRyRW/lZRB5rHNl4IMjg
         Ld6GpKp5Q/IICPGovuNRsSZDLVcCoCoKFc+nItlUBgzwce6kw+WS69p2470vN2JDUYx0
         A9I1FF8NdSOrlNqjIcRHclYUHlk75TJFSgigEHXyy92AHEvI660yEbYc8+0z85Cpjj96
         HPFm/MfInW5YSHvT+unzqp2yGWcWgUPelBSVARZPkHCvH4IuuKmdZvY0ZAU5mcdiMssu
         fSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082824; x=1755687624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqCY5jTvsISB32aIb6DjyduWoHu1F4uXkTH9VhadKk8=;
        b=ERWw3kclgx6XyO2x3WJjfVI8gfXEfLgONlofEmXbANIK2zGBVxsnyaJNGJV2T0apTZ
         YqOZYOa3WM5lhOKLSohhkPACU3d9wHANmgJRqCcarH53XyYbcfpCHOtc42hB9LEJ2agv
         1CZpUk00iR2ljdH/la9r13EEKKQ3O8xTvYAi04DzFRZ+Gu5gqyv5AmmqJOXH464ZQLNq
         hZZKIfGvMuI0YYQWMc0IErFbpIUhg2jlaG5odtxKOgBUoxxCvify7V/lNR9uLuyV+7vV
         42XQbNH9Bh7emi73a3WyOjFOt1UShSTN9BHWlfg8zfQD4b6RessDOg1eZ16B4hy8MxJA
         WMEg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9oJ3lsZCqRaPYL4A1seLjKc69ZU7D1pnnKXyN89Rmwiv+FwKntBJdzn0+ZJbTDxH4cTKbYpA2TbrbH3FJ0fH@lists.infradead.org
X-Gm-Message-State: AOJu0YyEDHwUPgLLYc3oC51FQFRIt+8FZ/DFWl4p9bI3Gdl29U/qVley
	HtzMO3SmEfgH1Cf2orLhBbDYxWOr6rcTOSWuTcfhN76zGSzLUF33J/Gb
X-Gm-Gg: ASbGncuoAnwi+c2Z5hTvSADVZk/8k+AHyXMffsSPh9rK6rhIZuvDDHxqidnU6uHWMNZ
	a4xNorZoP63XzIeSQOr+STkx2RgqgkgrTNrQ1dII8JVVLBBNdlgI4vk0y1Cbt6fq0/05Aeckt0d
	KWWZlqaxwVeZscxO9GyVkMo83Vvv/+FX06u9lYlEbwrwKQ1V8VRhg8efl4lqm89R2k66m+I6ppK
	rpYaenOdL/nVukS5DX6ymj8HOhsY/42++tg32zNwRh1SuBoo+xVp1x6nsztoz1SDfhoCv58KRyA
	wOnVtc/Jgjmb8IkaxFPWfTc7qHLhW+KhAJwQoJ5BEpz3+uulMr6QuyTrrfbl+k8CRqRTOU0pamL
	d+QmFCJSLct4p/+GduRZGCrEa0MkQL++sWbcBvReGTU9NFWz2uCLhso3d4ZGgEIzjE5hDtps6Ds
	TewYzR
X-Google-Smtp-Source: AGHT+IElWT4jUqN4j0obVzzttcqV5DoHbMR5Zvr5dvyp/5WzfbnIQyveocNCX4Kkaq+kb4xzx0CmVA==
X-Received: by 2002:a17:907:d28:b0:af2:3c43:b104 with SMTP id a640c23a62f3a-afca4ef2446mr269934766b.54.1755082824277;
        Wed, 13 Aug 2025 04:00:24 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:09 +0200
Subject: [PATCH v6 3/9] dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and
 BCM281xx bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-3-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6917;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=w1JqEw83SNBTWv0jasiNDsC1/Drx1lV2Z+u0Vqw+j0E=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA9MGS6etGnq4xmAjxsYkZlZYUzXH7Nmv7nV
 FQdOGJaN3iJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPQAKCRCzu/ihE6BR
 aF7ID/kBUfuPKk9hXnlY1z2lxPbC6H7PTSvsVGzn5iWqQpHOSk++ud1l5oU3Q6mx3HqHLdft607
 CsbKDv6NQ2Sz6uG0g5oNdPh8wG4yGF2tExBGPH5ETTGiskhRwj8zfXM7+qTBS6+UcmKl070Ud3Z
 JT+SOIm42qi43mK73zgQqq2Kb5fG+MpG53fHYWflVAmuhGdd+KpiOlRTd5K9N5MuwXqnt12hmD9
 DBuJF084QUfKNsD/GSIfQqlr/QUNu2lMNmpVaDA4vslvEjAXHBTQ5ro18bhZBO9XZj18rB5nqGg
 Vmv1B+kQVT7p/QrQUffT1bSETlezAkdm2Fkudyg03D55jh7gItfajNk3GUTrWjHShfFuVWWLvFF
 6ae734cYB5ij1z0Lf/AjeI4bKguFcy5GMDWs5OW4VkbCLbaN/KHUhfewdNyv0l/1MZ5F+x53Lsm
 +IfbIlbH7CwTs+uobXsKmjnspJ7ijUJLJvI9fBzrxXl3fnUT3SVaHi5JV+UXHThCp5M6P6rZcNq
 DW54TEkPJbkxPGpBi2DjlzUNBU2a0Qz89ntNT9HSA11kwXtOIgQUDSI3eTScNXV3NGo+nU6KHFi
 QjGGbs60hAaUZZqwFmPWqh+7203ASoqZCwaHUx3VFPOwcc/T1NKWq1sif4aZWeMHs0Ffa6YQlc4
 UxAXJ/2vP1kt3cw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040026_128444_CE4F6D0D 
X-CRM114-Status: GOOD (  13.11  )
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

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM21664 and BCM281xx clock drivers and add the relevant clock
IDs to the dt-bindings headers (bcm21664.h, bcm281xx.h).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Squash BCM21664 and BCM281xx bus clock bindings commits
---
 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   | 49 ++++++++++++++++++++--
 include/dt-bindings/clock/bcm21664.h               | 13 ++++++
 include/dt-bindings/clock/bcm281xx.h               | 19 +++++++++
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
index e5656950b3bd0ad44ba47f0ada84b558e71df590..d00dcf916b45904177614c6f19a5df02abdf42f7 100644
--- a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
@@ -40,7 +40,7 @@ properties:
 
   clock-output-names:
     minItems: 1
-    maxItems: 10
+    maxItems: 20
 
 required:
   - compatible
@@ -61,6 +61,8 @@ allOf:
             - const: hub_timer
             - const: pmu_bsc
             - const: pmu_bsc_var
+            - const: hub_timer_apb
+            - const: pmu_bsc_apb
   - if:
       properties:
         compatible:
@@ -86,6 +88,13 @@ allOf:
             - const: usb_ic
             - const: hsic2_48m
             - const: hsic2_12m
+            - const: sdio1_ahb
+            - const: sdio2_ahb
+            - const: sdio3_ahb
+            - const: sdio4_ahb
+            - const: usb_ic_ahb
+            - const: hsic2_ahb
+            - const: usb_otg_ahb
   - if:
       properties:
         compatible:
@@ -116,6 +125,16 @@ allOf:
             - const: bsc2
             - const: bsc3
             - const: pwm
+            - const: uartb_apb
+            - const: uartb2_apb
+            - const: uartb3_apb
+            - const: uartb4_apb
+            - const: ssp0_apb
+            - const: ssp2_apb
+            - const: bsc1_apb
+            - const: bsc2_apb
+            - const: bsc3_apb
+            - const: pwm_apb
   - if:
       properties:
         compatible:
@@ -124,7 +143,9 @@ allOf:
     then:
       properties:
         clock-output-names:
-          const: hub_timer
+          items:
+            - const: hub_timer
+            - const: hub_timer_apb
   - if:
       properties:
         compatible:
@@ -142,6 +163,11 @@ allOf:
             - const: sdio2_sleep
             - const: sdio3_sleep
             - const: sdio4_sleep
+            - const: sdio1_ahb
+            - const: sdio2_ahb
+            - const: sdio3_ahb
+            - const: sdio4_ahb
+            - const: usb_otg_ahb
   - if:
       properties:
         compatible:
@@ -158,6 +184,13 @@ allOf:
             - const: bsc2
             - const: bsc3
             - const: bsc4
+            - const: uartb_apb
+            - const: uartb2_apb
+            - const: uartb3_apb
+            - const: bsc1_apb
+            - const: bsc2_apb
+            - const: bsc3_apb
+            - const: bsc4_apb
 
 additionalProperties: false
 
@@ -176,6 +209,16 @@ examples:
                            "bsc1",
                            "bsc2",
                            "bsc3",
-                           "pwm";
+                           "pwm",
+                           "uartb_apb",
+                           "uartb2_apb",
+                           "uartb3_apb",
+                           "uartb4_apb",
+                           "ssp0_apb",
+                           "ssp2_apb",
+                           "bsc1_apb",
+                           "bsc2_apb",
+                           "bsc3_apb",
+                           "pwm_apb";
     };
 ...
diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7a380a51848ce100cbf94f9da2b997dbe3a65230..9f3614eb9036b5ce36b610fd7437338655a9cf97 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -25,6 +25,7 @@
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
+#define BCM21664_AON_CCU_HUB_TIMER_APB		1
 
 /* master CCU clock ids */
 
@@ -36,6 +37,11 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
+#define BCM21664_MASTER_CCU_SDIO1_AHB		8
+#define BCM21664_MASTER_CCU_SDIO2_AHB		9
+#define BCM21664_MASTER_CCU_SDIO3_AHB		10
+#define BCM21664_MASTER_CCU_SDIO4_AHB		11
+#define BCM21664_MASTER_CCU_USB_OTG_AHB		12
 
 /* slave CCU clock ids */
 
@@ -46,5 +52,12 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
+#define BCM21664_SLAVE_CCU_UARTB_APB		7
+#define BCM21664_SLAVE_CCU_UARTB2_APB		8
+#define BCM21664_SLAVE_CCU_UARTB3_APB		9
+#define BCM21664_SLAVE_CCU_BSC1_APB		10
+#define BCM21664_SLAVE_CCU_BSC2_APB		11
+#define BCM21664_SLAVE_CCU_BSC3_APB		12
+#define BCM21664_SLAVE_CCU_BSC4_APB		13
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index 0c7a7e10cb425ddb597392939cb218545a48bf22..8e3ac4ab3e16fb33a82259ccb82287fdfbb749bc 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -33,6 +33,8 @@
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
+#define BCM281XX_AON_CCU_HUB_TIMER_APB		3
+#define BCM281XX_AON_CCU_PMU_BSC_APB		4
 
 /* hub CCU clock ids */
 
@@ -47,6 +49,13 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
+#define BCM281XX_MASTER_CCU_SDIO1_AHB		7
+#define BCM281XX_MASTER_CCU_SDIO2_AHB		8
+#define BCM281XX_MASTER_CCU_SDIO3_AHB		9
+#define BCM281XX_MASTER_CCU_SDIO4_AHB		10
+#define BCM281XX_MASTER_CCU_USB_IC_AHB		11
+#define BCM281XX_MASTER_CCU_HSIC2_AHB		12
+#define BCM281XX_MASTER_CCU_USB_OTG_AHB		13
 
 /* slave CCU clock ids */
 
@@ -60,5 +69,15 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
+#define BCM281XX_SLAVE_CCU_UARTB_APB		10
+#define BCM281XX_SLAVE_CCU_UARTB2_APB		11
+#define BCM281XX_SLAVE_CCU_UARTB3_APB		12
+#define BCM281XX_SLAVE_CCU_UARTB4_APB		13
+#define BCM281XX_SLAVE_CCU_SSP0_APB		14
+#define BCM281XX_SLAVE_CCU_SSP2_APB		15
+#define BCM281XX_SLAVE_CCU_BSC1_APB		16
+#define BCM281XX_SLAVE_CCU_BSC2_APB		17
+#define BCM281XX_SLAVE_CCU_BSC3_APB		18
+#define BCM281XX_SLAVE_CCU_PWM_APB		19
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.50.1


