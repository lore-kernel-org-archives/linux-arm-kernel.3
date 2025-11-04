Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC36CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a5wcPALM8GOfKs0z25anJPOx5zdh7ANpA+yWaJ72oo=; b=gzL6dvsQJoo/aUttIuGWpOrJmY
	vGOMZm8HGnECmZdEVo4MH2BJAsU8RDjBYTzedkrqLxiiW3+otVb4hPpdJy9xvVO7wy57WiyzCZdw8
	lx1V/nmlZHgXCiJq96yfwgN4zZQ2/SRXwXscOKYw6aaN+qLDDdPp+dAAmjiD4mfrmBCFqhpfOfQmi
	88YuCHFF+jPaegA1/5sL/Vz+CehP9dbKhGocqOJ9N94+ofYVL6NuLauvkSwGzLl4YfP6ShOkC6qTm
	FiyD2A1pcjngazZ2FjAf/b1U876QAblgqkZt0orFkzFTN5TeY3ixYi0+Ms96uXQtf69iL/OzzoVB7
	uT4LPp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUU-0000000C14u-3URO;
	Tue, 04 Nov 2025 14:58:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUS-0000000C11G-01Ml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so4841431a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268310; x=1762873110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a5wcPALM8GOfKs0z25anJPOx5zdh7ANpA+yWaJ72oo=;
        b=Lz/tzsn6/vXMuEg+B2tgtBIWeTPaquEbxwDGxIbxSDuMaLNMLEM3xk1FGFbq2fnNwH
         RgAWR5v3IugXnIs+Mq+YrvnlVgnKNI5+hIS4gvV1cf8cinRjWTX5mjoCG+1xnm8Z3ld4
         kc9MbMnwhRG4fp7t20M1WNW4sTJ9Aq22s1yPuNBFo6H8/oC0nbauh4/BECv/TXgqoOgn
         7HXF1C0FgYCftbSO/xJW8KO8lUkXdg2CN+ROG3xbui3Z7/xBAvtRDvou/4JWXyLTwROU
         Y8BH7rsGrTlW0YVYzbi5N63QoiMI+xHpz7jcdyIjAnLm7pUP0NwX1ZNYqWPKWgWho9Bg
         v8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268310; x=1762873110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4a5wcPALM8GOfKs0z25anJPOx5zdh7ANpA+yWaJ72oo=;
        b=uZqp6N79Bba2nIuYmsE/nxFzf/+5zz6e50bNHD6iNAMnqrusKoBCc0g4J8iS1+fQov
         GRz9gKqF4gNlwQyqbat+naUH3EM/Lg1kd92HTylkpHCm0Ke1RERzML7focQlTlZNYNUZ
         nfx5h7/FXhpIhgxtn4o1U4xex5di4tcWa/L+NOtBlxizwohUFMzFUSriSkj3+QZX/bki
         xYERdS9rZn5vUSSarUPiXy+vyd89qgbsHxd4eNS4BoUXFqhpJFfBUNAMjEfGZ56jBLIo
         gSB+ILuwSv6MlU7iYE+qSK59/G/4tLR/4DnDkbGD1BezPexCaPSzdl3BykJouExrExx1
         3Ofg==
X-Forwarded-Encrypted: i=1; AJvYcCUvlu6ZG8CuZFRXZvJ90M7g4ugXpJW1L6U5MT8S9Zhh8nfw3mr4Xz+n5C1ue6tYPKmETUYzrkP4fgux6IfmNTkb@lists.infradead.org
X-Gm-Message-State: AOJu0YzaBwWhuPNJOpJYKATKm7e5ygVTb6JxSSCHJDrr8kob9/rVGiG6
	bdYMkjtCAt2z0CNP0yVtonEOcME7BQGWJwrcf/NZ+9lcOn+IR74mswWU
X-Gm-Gg: ASbGnctQTSej/iPh5Ywp443IjedeIrAmMo73FvlhDn+qs4IZcv8OSkGWIx2UEw5Hh9C
	0Aer2VzMTvRt+o/iWotDk23jUG8MkMbesupv2eqfqwGwDrwprpilUjBqbG6VaOyy+EdocdjgiWl
	PRC2388/G1QWDhyjiHpcsHT/NMXWb3YbSS9zLGFIv+0DbI4igGnjkHrWSddxTvIRX+VQqqF3Zin
	o+SX88FUc1WRhVTAwDMlnVg0RCHXScZRiJJyTYYpoFDnI9pQ+8wg8uEzxxRxWIU8BKrwTyGC8qX
	mSq+nd5mVdUJI7ytcr3r9v4KnPQtuURNGoapuo43l6h5eGUaDdkDJFdv6DbgjZ2OwVtJpJCazGy
	dM/wcldJf3XscdN4lrsvOkog0sty2Sxbqvmndw5M/3N5VVgbnhgug3TrQlejIvP6iJsAjXhPMLb
	Np3dBFXkfCsDojfQSVEypGF8S6JQCIdsFxLPDr9IHtIK9GGV0H+hrnjrrXvw==
X-Google-Smtp-Source: AGHT+IE3SPYwKN2D9uouVnpgHkPM4iWY0NPIvFkNtkB9fhZTnfyYXljSUYSwO1JZKzF4K/C/EDmk6w==
X-Received: by 2002:a05:6402:1472:b0:63b:feb1:3288 with SMTP id 4fb4d7f45d1cf-6407704cd63mr15674893a12.25.1762268310007;
        Tue, 04 Nov 2025 06:58:30 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:29 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:21 +0100
Subject: [PATCH RESEND v7 3/7] dt-bindings: clock: brcm,kona-ccu: Add
 BCM21664 and BCM281xx bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-3-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
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
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6812;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=hE1zsEoAYQeihS0jeK+MtnVz9GFFqyenFrwA14PktZ8=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSOpSnAIZ3Z6c0gR1tTT6mBe/3BrU8mRyH5M
 c63ilow95uJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjgAKCRCzu/ihE6BR
 aKYFEACXrIwrhw9pO3A/WWrRSvnhuf6JBILKSX3SzeK1xRhm7N0+qH1Gs6vS9kVhStn9inbkZft
 Nt4yK2mSw8F11y7XrT/tmNj+GNxh28q9WftqaOD9GY9jlBLiQug4iPIzi0+No5XCmgzQ55iBIvm
 RzSOPuIswtHfqdvV4M8gCuoMPbPr5Whd1eTL8wwd2ggh3WZWiJGEBJv82KLrIl2Otqe0shADgrx
 dvHmgqfGErgcfkC7ALlgyt+45pAAua5UMHBOojQQRJ34ldVKwhSZFrYR2w6V1e3giXo565BPqsS
 abZf0Sw0swA+eg5yiucRslPkurm+O1gDuYq5masacVlotWIbRAZu2YRksu+WqmIa2r/uKhltjd2
 u1rcClF9ZSmlyC2H/rX2z1+WzC4IbQEiPYHlzQuXBoj3JyA+t/npRFp18qXZ8JxJPAEapt6W1EQ
 QQ8DOS+6HatN9hb2visevAqqwQn+WgMI9HqamAivk8dd5Dp5XHyIRI1vcST+PGlfd/K8FfgVCb7
 KK+dFkLlTtCgnyamUCxXISxTfNsOP1GQIwJ6IWvzT6c6ryKPT6Lamc0ZdW3/5r3bjNj3Za+L1mh
 aVywvj8t8Bvw1e/caOSDzpWxeMaC6fFcDnd/Yi7ZyQc7N276zHG4yQGoM5VeUliSeIJSybs/PQ7
 MKdhblxIaN40rJg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065832_119518_C8F7B2BC 
X-CRM114-Status: GOOD (  13.07  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
index e5656950b3bd..d00dcf916b45 100644
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
index 7a380a51848c..9f3614eb9036 100644
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
index 0c7a7e10cb42..8e3ac4ab3e16 100644
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
2.51.1


