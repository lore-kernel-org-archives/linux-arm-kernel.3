Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDC1CCF2EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr92q3YtyZ3lvT3dDx4pM+2kIr4QEW9o4+xmemflEf0=; b=jQplfNV8C1rQYlabBQ8gtyBQdW
	b7UvCAXlqEVFvo4aixKVuGojPRNHe74/kfRwmUcsFO0453FOr43HXbtaCw7EQaVwMIa+RXCijQJim
	3RtxvH3sMzfTgi46w94VrZGOwz6SADlN2Sh+qvdE2SqiNArVcNlxBN18y1gwvnSrpWFrfXe1usRyg
	2GEXhjWoFHdxEMqMITFLYXXZ3G9qbrdFEEtMkvTB8UkSW6BAGSkz90VHRMSYMOlLcSuJ2EoZTrd+L
	B+3HwCy47CqloHzVPuhsSgzsLPSR6nkElTNDfZamhCynlGsirxwxU9IOeXXR5tSxVdomFlc77JTNe
	JGogxvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho44-00000001xV6-22wY;
	Mon, 19 Jan 2026 12:09:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho41-00000001xSb-3KyP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:08:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2324274f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824534; x=1769429334; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rr92q3YtyZ3lvT3dDx4pM+2kIr4QEW9o4+xmemflEf0=;
        b=xAGxZt+324qBD1Hfc6OlVxrYX1vS2y3LQa6hBU0NKqNiRw4gNBJ4mPPYp7oJT4Rre5
         KRg3CvlI6k4FQTV5096JiVXQgw4BpI3yTD3x/MEzuHNFHaSNs7LfRLVrvbxbaLh0ScGT
         Rh8E98lnZb6LKhC2A7wTR6wQDz9v/SCJVoCNosOTdRBpPk8Gs1lrXaX/G6z6cotLG8yS
         xBHn+pczFJQ5Yss06whFpd3SHJinAO5y3nnnUYFXAteZ4ml6dbomhlKNGWVavLb/ZRGe
         Pek871i8yEO9SZwGJCN5EGMIp8lL4UWiuPNnBWCz6Ec9SUsgOSlcMy3tpgzvf9adTQfg
         MEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824534; x=1769429334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rr92q3YtyZ3lvT3dDx4pM+2kIr4QEW9o4+xmemflEf0=;
        b=hjppipXHNGLb7MAZOlsG+aPl3pTMYSSx+Wq10+Tjyo8qmOFNyPRfJTcCFA9ffryNj7
         15Hudh2S9NLFLEBBA76EI6fYQGJfN7AOBKpoWWFCqeDyB33OHWQLIYIIIrsrdOzjMfu2
         CH+zdxffjgymjk6j+6ruggJthYey8lw3An8HPUIt/CGZcijpIpIMfZkMm4AET4PoJBP+
         NMcYIeNlJ3q4ZAXGLEhiRFWyXRWANEqXCuY/Mf4R+IslvRk9jthye9ZAkVzdOJDR+91g
         RnMmVbOYgKLuifUC+voDtyZZ45AAYVlcTGfpzHtySlLDYCes7RCFPyqmsgqUVo90gdLR
         iqwg==
X-Forwarded-Encrypted: i=1; AJvYcCWgmFE/PiAWaXR5blq84ADVj22DnOyBhqvdOyAxVlzdwYUuT9ZIwOOIlBuBC8n2nEN5JzJ+bPdQg548X3X0al0k@lists.infradead.org
X-Gm-Message-State: AOJu0YwbjGNmi7Gz0HMmfaiiJpJBBTSIv2+RYE9ucLvkfjH0Sf4m/0aE
	w9TGQVrYPov0nVaSeHs+0fYJhvTCJ5q6tX7sunsYmgC3VKL4qVJEnP/V/qcyfre6SP0=
X-Gm-Gg: AZuq6aJjP/00BSZCTu23Ul1b+skZCfYp/kQ37Uw8quv9uP0RCM9eNnC2ldSecwBWW6u
	qCdjGFOdvfKklRKqJYkfKAez6U6/JCmxSQ9O66YIUJ7OYbsk7zw0E90JxZAriaLRdyV5wBX+EpE
	W1Z3WVjV7NVUSAMBJOyM4oQWAgcan73dyobIDCnuRCyY9pcR6sFO2crb2OzoLGYHCFaUaRC/CLz
	H+Lryp63WMNDA0Ct4qe06DH7XL0LBnBLqki5Oh+sNC0BIA0hTxGrrlR4RS1nAS/ewpi46+8034q
	cdcCTLAfnklsmQ8+sG1HzEcSD2RX8sSR4ln+RmVMrELJ9jcFCMtVPgecldzCREE8LcUbx++kYKY
	oekPH614RDZMsAinbfcN/cXntaD97otz9AGlPQ4CL+MDipvKQQS9/CLMsv+v0AJ8GTVrCbL/gnZ
	z3Av4mZDUXCHFGBlhXQeR8IuoxKqEKNkwNIQQUPIcxx1GBktqdhptjvbiUgmPKjvSoLoVBQg==
X-Received: by 2002:a05:6000:25c8:b0:430:f41f:bd42 with SMTP id ffacd0b85a97d-4356a0662e3mr13652973f8f.57.1768824533639;
        Mon, 19 Jan 2026 04:08:53 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:47 +0000
Subject: [PATCH v2 1/7] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=3157;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=NSnDjeYXDKXRwPd3DPQdyVTKpEJbKoAyXp1JmfIwRDo=;
 b=dtDJDuEZ8DzLjZa7229oBMQmNZpRgOy1kXud/+4ry809hpk1wR2EYaj7pZfffGZmlWn/aR34X
 iStwRKVu+IWANL5Tdx/kQfLXBZ9N9QrNnyHAcG5rsHW5rDnJDO2waeq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040857_883022_21234F1F 
X-CRM114-Status: GOOD (  14.86  )
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
firmware.

While the TMU is a standard memory-mapped IP block, on this platform
the AP's direct register access is restricted to the interrupt pending
(INTPEND) registers for event identification. High-level functional
tasks, such as sensor initialization, threshold programming, and
temperature reads, are delegated to the ACPM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b09e1ff5d89194b570810a042c75836ca2e53950
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,67 @@
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
+description:
+  The Google GS101 TMU is a thermal sensor block that supports both direct
+  register-level access and firmware-mediated management via the ACPM
+  (Alive Clock and Power Manager) firmware.
+
+  On this platform, the hardware is managed in a hybrid fashion. The
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
2.52.0.457.g6b5491de43-goog


