Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXrXivtvEQLh4adLUP4GGOdvzjuOxYfBxi9mEWJalRs=; b=3O48cYHgDNCM+Bm+EWx/luexNj
	ptCu4qlf+Bfz4Vxq1Qeg4CsK12nIac9twDvWqDh74UR4dc2oGM0C5zWsvcXIX0YSkS7HtpF6ulJ4S
	9FIrTiPgKXhea8ksYItbmM2OUkwTNbW4xXXQ50G1Wzbnge2gow7gJhXZp+t3xSr/xBkz7JynUavaz
	fC2GuvrOXYcwLUt44Alr5reQ0JwHUFif0vmWb0I2bxraG0VMG/jW/pfwuSB69gjIditcCIZhf379D
	Nl/RWX8MzuYAMDNjA/pGJXiLN3I4GyJmz4p93Bx8dtZQu0A9uZqjPfo0LnKT3g7xkOBP+xdCqzqtM
	yfE/mqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVl6-0000000AWCN-0hiX;
	Thu, 13 Feb 2025 09:43:48 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiViM-0000000AVTD-25WG;
	Thu, 13 Feb 2025 09:40:59 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-543cc81ddebso675126e87.1;
        Thu, 13 Feb 2025 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439656; x=1740044456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXrXivtvEQLh4adLUP4GGOdvzjuOxYfBxi9mEWJalRs=;
        b=COcxQaEcaMf3YYaevdYPMZIv9FDE92wsiFjQ4v5+Ojp4HzxB5Hnz/r7aGp6ijLa/F9
         zQYw9TmaswIrFVCrE4v7rkqzIZLHekKSWGv22ya4IjB7n2gGoKjw7J5YSRT89YnYlYiU
         udNWAd9g+KdSnX9eU1BsxLXbTpG4QdDIs/GFjMCz/QY/stoxnrYPrxH4CuVs8ZMXbprK
         +82GN0hoGHKTxvnj7k8X9QES6m68pxe95PvlIBd0L8qyBazbTCzaZF3liwjNMrF+kXYu
         0mAnLVaBcy6t6dSvap2qomJeZUgvdlJpFLrPmZX7VlKZdxoJjKAEMNovGk38vYCPIUOH
         Ej8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439656; x=1740044456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXrXivtvEQLh4adLUP4GGOdvzjuOxYfBxi9mEWJalRs=;
        b=Qc1hmJ1rMAy3MnJH+C8LoHek8PqWRFvI51PEFDOc7P58R5Qq9AnPT1TqtI+XuFlgVc
         t/FSPofQ+RJ5POuVzxnBCO1Et+jh8g3Q56WAZvIIxapcrKifZA2X7I9XhBFeHNDeeYhH
         ckH2iNRuAeXzWEMbdbghB/yoJZruy18RwKiuie3BpI5TGKUU6nqu0S/SqI5RdEVdGWzj
         y4+MC87/zeLbT5Y3AeqoVIwgiRovWX98QWmgpmFD2pdaBCO8sqmZHvy+Wm0Ke+Byp7vd
         IvDu0h8Plpz0IHocxLf4rNx7Y5786wcWuR+SgyZGuXbvPgx1b1+hMPMljS1Ncsx97+7S
         F/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVIZx/8rtR4MKd91hCZ41Oh2vpT6XBFaV7BqzPMK9xs4E5UKWmxjcEJdahv7txeM4k4zo5jBalu8AdQQY=@lists.infradead.org, AJvYcCWvSSPcCwGQoKeX4zfgdowPbSpmyxT2beYEudHwVTJfq0idiCeaLLwUZUwmBSSsNXkgAMNLya56LdCbeShJCsne@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+3YgOWDbOzSM3Y7S8yRWMM9Y7Dz47cciGirdOWYEPRfhMDNDZ
	b2k5znKcJhP0fs0mfwiJrnAhRJ9iRl1/55OfQa7B0DEu6kXnXow=
X-Gm-Gg: ASbGncsR0HtdZFPLBuBzoYNZ+6ouPWK4S0YQfYNqyHx+Wsbwm/wT6nOdVRmGIAQvOYJ
	kqdHeMPgtzykrORZTKjq2JaGpEkEA4+v23Wm5VaCSDvoHZJ+AslJJvWhSG43HaRjxA46ZSgZ82s
	JSTaoyjeoh9uq64SikrfoUW2ojqsApE/ILi/Rb2SppCOqe/EjxfCQEiyX3WAyAsiSN+cHP1QuoJ
	nLpCtncOeN+qGM71TxYJ0IJxoTYR3EwGoKRy2lA4JG8qVO984CfqFpvDCwBpfmFyW6enFFuYlAU
	p5OO2DncnrusL0GkibTl+AzigU//Whw=
X-Google-Smtp-Source: AGHT+IFCCGYbVQL84jr1QCXcHIWbGfBA/gZiSDbm59JZik6/Tl6V0NyLBbgRGNNv01sE2JUH4IgWTw==
X-Received: by 2002:a05:6512:1111:b0:545:6cf:6f3e with SMTP id 2adb3069b0e04-5451dde81aemr834931e87.49.1739439656372;
        Thu, 13 Feb 2025 01:40:56 -0800 (PST)
Received: from localhost.localdomain ([178.176.176.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cae7sm119518e87.183.2025.02.13.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:40:55 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 13 Feb 2025 12:40:12 +0300
Message-Id: <20250213094018.134081-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213094018.134081-1-privatesub2@gmail.com>
References: <20250213094018.134081-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_014058_542428_BA09FFDB 
X-CRM114-Status: GOOD (  14.46  )
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

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..8955e203f638
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  allwinner,npwms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    enum: [6, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-r329-pwm
+
+    then:
+      required:
+        - allwinner,npwms
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1


