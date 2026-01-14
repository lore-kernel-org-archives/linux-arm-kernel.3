Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEADBD37E3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrZpFfiloC03b+wp8plcjpvQHKhBs/B1qZYvX6HzNjk=; b=iodT2ADA37P7Q5dJn1ddm8JgVv
	nnA9fhWuapmtJUzAhPQyXUPryAh9n/dVP9FZ/pv8/mZMOXwWA3EIn0hpdpJdq4RKEurBiEt4buWB1
	eUW/W1SFDNaIDDVb/nFsv1bm2epaFhnLeJG4FZu7yBHDPkNz5gVMneSdyFyfJoYQ16X1KjseM/NyP
	3wG/79UN8hQvewoVTn+Sw/CXjDpFXGkhUTDuKHALPe3RFRvSokmU8Wiq5HhIOgV/wCjzGrl5l8DMO
	rrnC8c+rxVPQUp7X5vptRq9FE5ku4VCvMIGAEh1L9ZHwjdEdCZ4LWodfdtVf4evGIzGnssN8D6vZS
	dBoK4PGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gP-00000009UMQ-2NW8;
	Wed, 14 Jan 2026 14:17:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gK-00000009UIg-3J7R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee974e230so1004975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400227; x=1769005027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrZpFfiloC03b+wp8plcjpvQHKhBs/B1qZYvX6HzNjk=;
        b=u6ctPh270uxio/3Is+DKGw7XOhTY1m4WIGkyYw6nu34KJ9IeiicVaJM7AQGcDKaxVh
         zIBPLOPQm37TKUb64LKy2DwGYU13OA419N8Sloy6CS7t+LgBr1uiXeUrxPcFuCMAKEoe
         Hb79xRVAt3nt9KKXw0YQjNHGduBjhaIiPkPQqrqA8XXdIPLBeWIO46lIRVEC/5RuK+TC
         AC2i4mGGEY6ut+3E8k/UmKIKFcR95UFq0FKo2mfPy1iMHpE816Nx8+kfFoq95BQ7RY9T
         qYso0QPWKwY8i9JT+VDwx1w5XnZfGRf/sqwNRoOzv6nvg63DGWHRC1OGsD8KXFx9CpGF
         kYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400227; x=1769005027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QrZpFfiloC03b+wp8plcjpvQHKhBs/B1qZYvX6HzNjk=;
        b=dNpBuhTRV3lUDAbH7nOeRsRnfpVuTyt2MKoVhuRQ7R/rTiErf0B3LcmCzshX1V0UrS
         t7o+MxfWqDc6YslKHHP6UKapmLn0dzHWxc6EWak256BFWgPijP+7leMQ5fFu4+i+bADN
         wdsunDcc6+fd8C5FnxcdjivkIqTWXXS4JtK01n/T7pqd0MUz8Qn4+y8PK/T3ZPmpD0rz
         oPNk3H26wLqSUON93KDzpfDy86SRffaIaWUUJEEtq9yIicmMhatWA522HfHKxaM3c1xk
         S7lnqj4oUZbooMY+gsEgULQUvVDfFdO1zPPJ1x4kKF1nj02wbClc8mvEqmSdDaEfoz36
         NfFA==
X-Forwarded-Encrypted: i=1; AJvYcCU2M5nfHHpSzhNTEJCumPfQOZetNix6/u3x+uN/1fyfG7erjS75DEpJhanEnFC+aaH+wKd44QTPZBMLB0zs5pIo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Exa4eSGC6kpVJPrqDxGSEGjtjjVm0EJZL7eRshjLKi06is9l
	VMVQ03+8+zdzz0KO+n9eeW+yvKLydF8QkX1GZen/3cg0SipeZeHtvHSMTULiVno7E80=
X-Gm-Gg: AY/fxX6k5UK5ywFnOdt9szD9yfpYnEBc8oLFYUl70BLkOxASlXgJjdxza6Rb7bhlJMp
	TZEe0torrGJBaOfF/YBce3gZWUNj4NDy5xQJuzE7G9tv952Y31TF2aP57s/w7F3tUIfXQ3KHhcI
	7wHeXm7iPmWRPN0HL5vcdABw5EX2oyjinML64CavQ5U0+doQ4nlkq1Ij6ZESOqAB+UT+fQ8gZJF
	eBwfQp4tO6k+1QQYnVyBmPzKfPu+XwZGWbrqUEGAbzTdt/8nDrGpc0k2wlZrzbZ6H0hbNlErUGD
	nlCyIdNmU9zbXeND2/3Qg3YLIiFdDezsX02CIbmEAkM5HCA6/ay2JseJoqs4UvCzv8o9vm60SYD
	w3TFjwSVEYCjHRyD0Mn19poCnJyNL16itF7Fv5LJaj/GPqB89KPEc2rLeTBJshyqmx24d3W+X4/
	afrFNYTaSM/OS+cUtnCgyz/4FyUEgPHTYVrdKx73M3fRSYfTvFtPd9dnDnKY39cFRMwTyWkw==
X-Received: by 2002:a05:600c:1383:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-47ee3353f47mr32581865e9.22.1768400226755;
        Wed, 14 Jan 2026 06:17:06 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:05 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:29 +0000
Subject: [PATCH 1/8] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-1-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=2960;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WBMqNxSxLS3g+O1kbvkoees1LyjIONc/6PlycT8B4zY=;
 b=qkqinRurGCRKkQsa99SgSmLgMRLHVY4181hXS5vi68gr9cs3nBlqcOVvGvWCkuaEMoDEcqWQ4
 oUyu3DXXIcyDs/tQVSh/3vaUbcXxDGJyaoDJWatqNDcxcQylrw6kBle
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061708_860935_3C612DBC 
X-CRM114-Status: GOOD (  15.21  )
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

Add device tree bindings for the Google GS101 Thermal Management Unit
(TMU).

The GS101 TMU is a hybrid thermal solution:
1. Configuration (thresholds, hysteresis) is handled via the Alive
   Clock and Power Manager (ACPM) firmware protocol.
2. Interrupt handling is handled by the kernel via direct register
   access.

This binding documents the required resources, including the APB clock
for register access and the phandle to the associated syscon node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ecf4a315ecf1ea0649c4e96a207d531c696282f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 Thermal Management Unit (TMU)
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  The Google GS101 TMU is a thermal sensor block managed via the ACPM
+  (Active Core Power Management) firmware. While the firmware handles
+  the thermal algorithm and thresholds, the kernel requires direct
+  access to the interrupt pending registers via a syscon interface to
+  acknowledge and clear thermal interrupts.
+
+properties:
+  compatible:
+    const: google,gs101-tmu-top
+
+  clocks:
+    maxItems: 1
+    description: |
+      Phandle to the APB peripheral clock (PCLK) required to access
+      the TMU registers.
+
+  interrupts:
+    maxItems: 1
+    description: |
+      The combined thermal interrupt signal (Level High).
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the device node representing the TMU System Controller
+      (compatible with "google,gs101-tmu-syscon"). This node provides the
+      regmap for INTPEND and INTCLEAR registers.
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - interrupts
+  - syscon
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    thermal-sensor {
+        compatible = "google,gs101-tmu-top";
+        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+        syscon = <&tmu_top_syscon>;
+        #thermal-sensor-cells = <1>;
+    };

-- 
2.52.0.457.g6b5491de43-goog


