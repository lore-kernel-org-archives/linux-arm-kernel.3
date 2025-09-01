Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273FCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s89DomBRAbu/O4LB/Q5nvSr2vris+qA7JlDWb1MLm1A=; b=JUFD4Hv9TIRKSFeTrVHeB1OM2L
	KaTEKJiZrI2QSCv2Qqwq/nIrkptoD9e1tKiJ4uwjGr7VV+0sN8zINnuqxZnU7k+Dal0OjtDzkG5kX
	P200RguZ/A+T8jryY6biBQx349Xo/trB+x9MYYTqnwZhoGr9rhwwbEi8k87dlOlX640TUvzITtTTv
	pcHEd9BLc5RLhKmerltr2NmR4fXZhjvcNo4yByw8JmHnvXUJ5M452fNi4LZ+aUPuyQFzbVX+Eh+6h
	h+ITB4hC88KfwJuWX3GCK9jU2SlnfAUw09t7sCCp+asMFQnvbFW1B22O0ws9dGkLVrRfRau6fIxpU
	FyAaeMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDi3-0000000EFau-4BYU;
	Mon, 01 Sep 2025 23:13:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80k-0000000DPMf-0cRZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:07 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3422584e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746485; x=1757351285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s89DomBRAbu/O4LB/Q5nvSr2vris+qA7JlDWb1MLm1A=;
        b=mXW/sDy5joO16OfJC1wMx5iONHIGeh9e1S8bxjIRTzdawUgsFhGihFVqRw5y9wCFKV
         cNRJaXlhSo028YJPlND/BXMUIz7ftEGiEq5BXXNnjiNTZRlS2Q5+Iy3VtkraeWXyswPY
         p1o8bybHsD2nyHF248uX8ioI15iOk5TqLmljbF7E/VmugwkCu5RAoJOa0z73iw5u2AuL
         vCqBT1iUZwn9/I/2imjBdaWemwUwtQ0hbBN120DJvjJ1PaWXXa3t7d7zja6boPv1vgIr
         nE9q7IW1X8m3tMKNy3mU2o5VvhXNntqwK4BOM+Mf+bwNyuwG/pooz0m6QUYdAaVr//MJ
         jwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746485; x=1757351285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s89DomBRAbu/O4LB/Q5nvSr2vris+qA7JlDWb1MLm1A=;
        b=fEAObWMH1bcPJ8ej5aqMUlqVINDpF9vhaxI6k4PjpxP2EFPi+P6uAC3AmZ9TQ6oNc5
         0xjjObUhctK3u+pv0qoDl0tjk0Qi+z8BAO46XfM/XVliJwDsMxO6Kw5RAYJ4LpPHVv7/
         5s73hUgFhlOuLmUWk/5TlSMxhKpdvG3rN/M0niDvf9air28ACiK8xyGXc1OzjgL7HTNR
         1AcGygxTEAY2UtEMsAn4NO4kv3gSip1NEZnnSvUKzVHB2dnPlZ1qKDmh1HDWO5yIYQGV
         5eEFs0cImhB3A61rCI3pOmKqTt0VIJtGivdp3Eq517tA8HODIHvP3dy0C419qHL0aVLs
         XVMA==
X-Forwarded-Encrypted: i=1; AJvYcCV8klujVXb3WHMYgN2CkgkWvpZo9DN34gYrMLWl361ogiEOjW9XUY1qNXsbHuFaK16c//ifP5dEk2Ea0Wk33VAo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmje0LTiGyhOPrrKuwmzNRZtpTLdLQs5CHu0+ciOjzIfSRQ6B3
	cBthMSK//4Q9a714eICZWRHx1GwivsyeUY7o3DHzoHjaw6NJIuf3dQY6x4/AOw==
X-Gm-Gg: ASbGncsA/WPqBVjBQPAhKYFn3m2mGzewnnAk8XDMKDh1PffAj/aWwQ2hPWs8aCmzWzI
	L90Bz0AgOuStGJMTsQaT3GPNolSALRl0Lt6LTEoLHaw6ia3lTMmWqeM07xGsu/BkUl3HVLAx0XE
	5cuFVEvck0bf3H1JWH12cs/x8DcrManqYzXEM/MMbG7qbt5tlQKLiuOxTSSwKxU4sBCRwVN1Ua1
	HAO9PQNTWT/OgQMZTk/hsxBkM7wKK4ktERH8XvyWb1plyhKox+sOLzsetVRrNqc0cq591cf3qdc
	BmILBNjeHrd282tkP4IBG9rwfUzZZePyEjBl9zrBFANGVJD8wo7xSVGQ4J30o+OEBBhKOjcUOKh
	HMDussJlDfBJYCEuv/606aJBCetHNL6t65GNNRcyQ8imgjw==
X-Google-Smtp-Source: AGHT+IG/yxuS8O3l/sMrrVuSFy3tnTN8OMpR5iB/E02xfaAUC6B8ViZk8KLBNLaPjCb8dMC2jYdlzA==
X-Received: by 2002:a05:6512:2513:b0:55f:4016:ad2b with SMTP id 2adb3069b0e04-55f708eae52mr2617302e87.30.1756746484295;
        Mon, 01 Sep 2025 10:08:04 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:03 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:09 +0200
Subject: [PATCH RESEND v6 3/9] dt-bindings: clock: brcm,kona-ccu: Add
 BCM21664 and BCM281xx bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-3-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
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
 bh=eiYRv4PiodXuWUXQ+pwLBEVX4v6XW12+FFD1RQtJ8UI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLJNRMOUM0hIcEOyf2oNbtXj/N2vZpO0s10+
 V/X4qGQ0TCJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSyQAKCRCzu/ihE6BR
 aC5oD/44khMgzlfCuwy3oGb4tNwkbvZRMG+Iy4VKhtZu6y5EFYGKCIrN3RfGTLSMzGtGSIYn+wK
 94wztcJVawVe1dhE/2WbJAE3yn0mS+dsf/4AU5BvYZyjLuzb1Xio6aU+5Nhe52vXnHxHRhbdvh1
 SnHIt+Nj9WW4z+TvtcUiwijFc0RWua/3m3t60e0/+Pl2bRJKseg3N8On0AxnXHPY+YDLwtbLCKL
 /C2n/4JO7RAPLvqLNbdiVwhtbzk4XmAwwJIh31c5bQlx1INe6x/wbE+WZsP8aMry0+KwxJQ/CLv
 NL6hzgu+ykToOVZJgdKIOM+6zPZGyvhX9B7LhRnVJzpRror+TRdiwBGfeGAJK1rtxYLfZdXLQVH
 4AE5qFpH4s6TPd0X8rsAhFeVtDT/0Q3L+AovSB1AOvvUibVIrtXhllp8u8I3DYzc/iua+jlXlOv
 8iv0UABvpf8yfZo7bqIWDBYuLPQOmFNsbqnVnJC4tWhZt9vr0C8cohnbWI65thlFQDDyoSdTwVq
 CWgpc0IsVbl5mQwDnVMJJdWMk4tM8HjUbJjuaBDg9urAoMwBKyTZuqXx5CgMbiufjcxiEit7jpK
 3+t4i+dpbxXTe4b1Jfn0hGg8QI6KhaWuAJJfZTSo4bqmwY/VC3oSqQRCShET964nFMDY0hStZ8C
 iOkUMHahlCgjzUw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100806_225735_207AA420 
X-CRM114-Status: GOOD (  13.57  )
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
2.51.0


