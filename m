Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665D9D715EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9m83YjdBagzKbXhhE0ZEutN5a0l2RlG5RTfGwGwib8=; b=tfOyJBONyTcdUEfzGLnWyRmAMn
	nzsqeoPjb54uOgHcF3dEV+iqbN2gfDTN6PA/npXJO/eb7efFFKjbNNGZ1gss/H/DVGJtwU1jM526n
	vmAr47qjzZJ6/6Q/tuKYWghAu5PapdvBnwiWSA1GMLX6SyEcUUbreOwTJWrYf/fZatMFyJrS+CkjE
	vyqZfz5X0dhxiFfjy/7Y6kTfZIqk1alfiJ1yJBrg4JI7PLZSamq3Fu1+pDYaWZpgdlvC1+fxMX2NI
	v4gx7+N9C5hjVc3rp56YWhazm7Xnk4BLLjO9gHsbcU1mvivzqvOE6djNcS8f4uged8FqU18wjEkPY
	cbanalUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9N-0000000AO7x-05sJ;
	Sat, 24 Jan 2026 17:10:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9H-0000000AO4g-3qMV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8876d1a39bso135788066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274610; x=1769879410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9m83YjdBagzKbXhhE0ZEutN5a0l2RlG5RTfGwGwib8=;
        b=nB/9LkbJPg6JHwHhyaj9X7PA8Y+sZ3FSLubC28kIzi7mBxBfHAK3sPIwY3smqL7quk
         CypWvm9gi6wOZsNJyLo7Rx32+NBD0GkkmSylVrbnRhVTPwERZUvNH44ZxAdCeOJC4Z3f
         4rM6RZ8JL4EzGZ7Wa4KhdxUl+klxI+pZbAM8aYVs+esiMTAxSy9e0iIrAEAEiXePHtTc
         1+ZguJqsLcyPURU/qnLg2BreZAR9e7/d8Jya2X0pyfYs/GLj5MfKJymAYsgRPTVF1nQZ
         FlUZXhON5Kb0LzhRq5qvp9Y/g0tYYCJG6WjUSdo3y5SM8SN9DMYN7EvjoLP92zmjyERq
         ubxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274610; x=1769879410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B9m83YjdBagzKbXhhE0ZEutN5a0l2RlG5RTfGwGwib8=;
        b=qEFCTNNbEh390vp3Xu4hIB762UAGx8es8bAbsXuLMO6NwlJXix02rtGu4KhBZBMZbB
         eE64j1ArCti+iBcvqCvgA66buDjDIMDPWnCarps50HIjk4bJmbtC25v1wiT7NJPjOPRZ
         kWj9DHq+ul/c71aesWhKNstiNvhH4sbHeuwGKahQniUhoUGEHBJnJ6eG96CrCDvPXgLD
         fVtDoXcoLWjwQOKKAITi8FsP+ColkjBxqPBmHFw4IRM3wZoCMDhFHoXy/1AQdzsp30kt
         jxHQk2HkuPVPZFxb8+rrrQ2AH2JwQO2iD3oNXzpo+LorvU1WhaoXHpdmZwGE8YBfr7t+
         9BkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvQlsY1QHKAVWpO1bNWiZY3c2iG0e4OP5tC/efoj8tf5MUMUH3OavIzRIqeHx89pZEoILiEg64dpnKa5H4tGZm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+phbW9L9IT3zfct76dGcdeTVJR0XEwnVD6n4bxgy0kbG973Gs
	L7VN1Fb+hKKEWYZKsjzskk4IMFdrQcMqR9gundpCJllPLQS5lnB2yDuT
X-Gm-Gg: AZuq6aJMlXzzp40L/L1HTkv2NDa8/peR2aXWGRzDF89mhA1o07wIvyz+X0Y7R4mo4Xu
	dMVGKmzFsXpp76RmcYWMbUdIZcrx2x4ADgUyc6BTS726p0OS89L8F9FzmN2Qhc1V1b1WS0LO/vo
	9fAdVejwpCvyNmxDblXbWstSWL6wv4pb/gYSvzFogIxE/f+AD/aoKoDAEw7xkZ+fJz703Yz62cJ
	4nc1/mBBIUQiqi1ZjE1OcDVSYcKeEVXgpre0omTtWDHNd73PJXslYiJWHmDP0aHFhr0vG6p7B6A
	wLh0mqS/TMMpjXbSpoJZ0775SEom42okCpbHZtIxSJgb0cMB8sPabg5Bu1SpIgLHkHXs3H1AILD
	yIWnUYYJKE5GHtLcYS1c190kBF6RX1g14ScAjKs+qUorhOljWLX8/g2fzSRq7V8jT2RPHdKf2Rg
	Cb3OBDSAs2s7C3VBa0riExHygkEgJPLR/X50VaUQm6YvAtDLD9Apq1sQvfc50n6lOroUFoGT3cV
	DhGL3vZD99Mt7N+tG+mmTWCDm1i6kJMoqU=
X-Received: by 2002:a17:907:728c:b0:b87:2780:1b35 with SMTP id a640c23a62f3a-b885ad6361dmr449556366b.45.1769274609783;
        Sat, 24 Jan 2026 09:10:09 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:09 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:03 +0100
Subject: [PATCH RESEND v7 3/7] dt-bindings: clock: brcm,kona-ccu: Add
 BCM21664 and BCM281xx bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-3-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
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
 bh=qjSSFniy6gHxiczWZ86GkcSZ4N43s+8TTkwA+IQI/po=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzrwRF2axcnuBNrKTv7003HvkP2RiVF2Vs+Z
 aOx6rNOEYiJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aIzWEACN5V52VeXDhCJFp8o7OG76KajvAkCLxFvzcV12tnDs9VXXJ3UBEdo4YR9s3uVxQ11L96y
 m0ESkEcifx+xFVABGmClH5h4XNVZBGNoo6906gbAEI0m3SbXn8ggFh4j6qBKmq3ZpdppnhmVATg
 lqlYaEYZf6/fbxao2dduq13rDZLStVFp1+Z8RSzA0bTK46b6Lj10Y8LsTW8biKDv0HXJpsv0CEa
 AVB+YVqHhGIBF40f0z4sXT24k/HT9dP7CEqDor8Ue5X6gmIafT8MddKcSxizpaxQGCIbdW73sN1
 mnd+9g7cLbb9EeY96P+JShS8kuV/lKdv95V13xzNyxND8B+069JVcsUxl6EKda01v2zrUMqdjJG
 9uW/XOWJQ2Y66gOtv7MUwYWc8khWj8nVyHgXlFOA+bTiVGZecr+l8JoR+y2nKdPs3Go+cGucEXA
 zKG7T18Y/CcuHHsziiWRyZcUgeqBTHyFGF9LU8OyXpF9+rjkvuJUc3DcedDoX+1PDGrvXq89dCt
 g5+dAjz2J60E9KaLOlVEkQfIPf94l7Y4fBb+SRTxpVT0nBJ52r0+ikU1JxioG3lqB/VzhJdZftd
 OkZlGPKmFDo1CujGAKcK2mH7LGgm+v8gGglqhIlbIoNAv12gQ5cxf4YkFogyMf7XMSj2Wl74gY3
 FgoWruV1tPEDXfA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091012_016437_E2A2AA0B 
X-CRM114-Status: GOOD (  12.28  )
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
2.52.0


