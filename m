Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF731CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDToCxua2FGXb+7ZVGR5RdwizXsWPQiwm2ZuxQ2xHTo=; b=nzCEPEwDoIS8OiH6gjIE5scJOW
	wluyb3KllQ+6BTGSIeaDGx0vIQDWWwnuFDcag1bpomREVuigh+AWVd2rGuqdDczudNruDXr42GrPt
	Cg48e8UV0/jiG5X/fuReUcxgsddSwlpWqFj5ufj7AkN4ym7xAI+ey0sz5KAqIT9ctV0WyKBsAF5Br
	qM36CC4s9lgtdfy68EmQto7F+iIsVGkw0LG1TK7qfotnxvkux+Nj7LIvNzfx/grtIzxW/L/e7D4JU
	vdnVONO+IlJ3sRczHfAi+ojVVtIFP6yp2OAys7T0puRfFrf5TwhW0sAzHAponhMn+gTxZOpAbJCbU
	cuIRTQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlQ-0000000HDui-281u;
	Mon, 25 May 2026 12:50:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlM-0000000HDs6-08mm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:50:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49068493267so5693995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713430; x=1780318230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDToCxua2FGXb+7ZVGR5RdwizXsWPQiwm2ZuxQ2xHTo=;
        b=DWk51B9wuR6MHJS5TdI6Njm6IuVBE+UacHpqdG5VAUzTNvkq0F6KuAOH4IxJtyZgeV
         IpUv4ycTKyC623i9JJubCNkwH5/GCs68EEKzimzRKEm+b5QzNSWlAAVLMBswBHoI6OTq
         loMEKv2tRb0xXhj8OnGxHbYPUk1NkJ0ACJTlgGaYpMkMRBS+G/T4AiN777i8b3EGh5ut
         g9p+2w2Pu342JINj+rUYLNbb3g2pWejmQ5oFkFFmYYVfI7JglaHTY+IlVkNTPcUGFnC6
         iNbG95HIXjHZBDk84sDtFiPIn1LUIu1cEhqu0eD4TFMk05al0a5+51Z1fuyfdeoIRPBz
         6zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713430; x=1780318230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDToCxua2FGXb+7ZVGR5RdwizXsWPQiwm2ZuxQ2xHTo=;
        b=cMFlMg2eSjeMjEISO9D0NNCPBT5c2BBKyvILjMDA/KFzr7JtuI3ughdU+Smk4UwwbG
         KysZ9unZEa9Su5HZ/wPBOKmMme6zvOVVpMb4fgzRQUQx1dA0BiTAlPpPxc5FIZDV9bG1
         EfH0ziavt+5rZGB9xviS5p70nT/Lwq9Ay2t2hYCMzpsPhScqW+Krexp6QQHizcmlwja6
         qZtPLrbeP3Ee1kXKfBrKu2sKQcITzS2HWwa43HVSgDnZqNnBDM1Pc7fXMgL38zf4IF+D
         YAatLS1ASCJNc0OKi1PmFD+Zq/FeiComirGecbHhHgrgI+MCV0zJXtrkYSXlSO+uiOJy
         DZMA==
X-Forwarded-Encrypted: i=1; AFNElJ9LPGn8PMEwYShvusJBL9S8EQSSkfiw5WfL1c+1BkAeneKWZsy2Knl2Hs9a8F+s2KdGu2YNhb7cJa2cC/hGPiUe@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/bJ3L5p2zdtlHPDNqa6COF0vZNVdnbF31YLgHkNpjBEiTdaV
	iUDQ4ChEu3tnI36VoCqsc+Q9Pf40eEnrHmaOGLNMpFv3L3k511SwaGmj3BM+IO4MLU8=
X-Gm-Gg: Acq92OFRqq2ZlHecNxNlW9HjEmjU+uSduCo+lPwT9tVB9x77AZABYJzW0Eo3+/LSsul
	C3r0Ss50yll7GungJXcISswca+Ps6frVcJJUKwWvUKg7srOAosqQEewBbykxDF+xV04P4I7wAnv
	/m9U29EKsEjDiF4RjwD5R5Jwy5vFYlwBpVJkZ1+fvzeMDCbRZjkbbw/LbepFxw67alMZPSQF9PS
	/PjBonAVundvrgx0eCxi46HZGPU6Suaja+NPS6r4k+tu3kHGPLW9Of64R/LL+9BykyKginEdYVy
	wusAyuqqSWJGQ4B8+7f0KguCw2I/qfezPiYBIHTqgvwht1nyL9V8mOpqKUklB3HfgTcw9OS0QYW
	erPz0vTNpecgI0APaXCweYGuA0ffDU+mSnZQ05StKfSAfBst+5/VrZsk6wRNW37ooqsSYGaaEUJ
	ZqlvDYtnnGW6ri4Xk0ofCqEOH2SH271IRq87DsLVqRLj3lvpDraPYKnrVlnpT1pmUPSngWoPBP/
	FKqd/o=
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490426cef73mr223966475e9.20.1779713429563;
        Mon, 25 May 2026 05:50:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:21 +0000
Subject: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=3371;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DAUUHdnV6Bz6+/JxuE+k0hPb6SNHwiYOqoiSfSYzQUs=;
 b=ULkkI8n2UPTnqvUWoHoTUCDJ4MK6ZX+UVIFvysuu2RleXY/AfOM/GGmGmIu4wMR82yOPy1RW4
 OLHQ5e8X18nBxHYr/DkmwVIAVM0SLz/ezkJaIIoPA5PdDiemOxCXLee
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_055032_107364_3348F05C 
X-CRM114-Status: GOOD (  14.95  )
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

Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.

The GS101 TMU utilizes a hybrid control model shared between the
Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
firmware. This hybrid ACPM TMU architecture is also present on other
Samsung Exynos SoCs (e.g., AutoV920, Exynos850).

While the TMU is a standard memory-mapped IP block, on this platform
the AP's direct register access is restricted to the interrupt pending
(INTPEND) registers for event identification. High-level functional
tasks, such as sensor initialization, threshold programming, and
temperature reads, are delegated to the ACPM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 000000000000..d0eb2393d581
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM Thermal Management Unit (TMU)
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description:
+  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
+  based platforms (such as Google GS101 and Exynos850). It supports
+  both direct register-level access and firmware-mediated management
+  via the ACPM (Alive Clock and Power Manager) firmware.
+
+  On these platforms, the hardware is managed in a hybrid fashion. The
+  Application Processor (AP) maintains direct memory-mapped access
+  exclusively to the interrupt pending registers to identify thermal
+  events. All other functional aspects - including sensor
+  initialization, threshold configuration, and temperature acquisition
+  - are handled by the ACPM firmware. The AP coordinates these
+  operations through the ACPM IPC protocol.
+
+properties:
+  compatible:
+    const: google,gs101-tmu-top
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB peripheral clock (PCLK) for TMU register access.
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  samsung,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the ACPM IPC node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    thermal-sensor@100a0000 {
+        compatible = "google,gs101-tmu-top";
+        reg = <0x100a0000 0x800>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+        #thermal-sensor-cells = <1>;
+        samsung,acpm-ipc = <&acpm_ipc>;
+    };

-- 
2.54.0.746.g67dd491aae-goog


