Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC4FF5A8A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGpK86HdMgvrqoy2bj1skBfpkVmo7qxsIa2pqonJJOg=; b=Bw/TpZvbH6E6+AQDc4IQEGVrvT
	VXsFll1PzFsU+T5xKldkJpnnxtBi38863aSBMhWreCGutMKawr5yVUaUPI5QNmjskDkdRPQ12+VrC
	yWQWJHn11a2RRGdqLebhMC3j9degCgYFLMnsl83aNZ0K7AyerBa90I6qaWo5oXvravlkZ33fADwRH
	OvVtKrlMPwSvEi8IdZIZ3uPewWgeL6nZu7wxk3O6eeo0HCm0LF70ohqdtqIMTPC6qoL8fBG2fIZkQ
	T19S20GKS1pNxDYY5uJjBSLLuXeTNCrTvcBtQuyoFlEMoKNpEWJdCoWqvYje9zqjfHbgWESnEdjmz
	WKRrAgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbS-00000007V0x-3IkW;
	Mon, 20 Apr 2026 17:40:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbQ-00000007Uz6-1aEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso8047035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706806; x=1777311606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGpK86HdMgvrqoy2bj1skBfpkVmo7qxsIa2pqonJJOg=;
        b=ZV3ar5Nc+Bea4ryGbNMWz9dJ3QmzKc5ZDsziH612akGv2aLgBImukEy+4pZbJTDoXg
         dyUpelgJysT/2swXyqApC+1kKI4OjJ4v72IJ3AMkVKjF01VkgQzsA+/GayzAt0e8HDgb
         DmtGbSGiN+9sqd9im+AWffFTaE8wvqZb1nGsVk85+6KL2NmT7isfpkt509jT88ye+33g
         S9QRDu/OLib7nMr0VNHgHhNAzzaPFGLnElffO38C52HWQYOZPsCmECMiKBBkBKiM5rDP
         PiCfEXggaEAdJj7MkiV+qY6IyGWEZpshu9YbAk8E4pquTnQeciyTZhsvmzH1htA5mMIO
         SaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706806; x=1777311606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGpK86HdMgvrqoy2bj1skBfpkVmo7qxsIa2pqonJJOg=;
        b=Jp+KNYuvlRptxdNWNuzGutEt1NleFC3howuXKbKWSXsJ+mdk6STi6Wz1aaxZ1TA3P1
         VuA+PPA/zZU0HD5jsSog5i/xMqGE3THjecF5KOdQG88KF16UjP5zitfrah/LYDyGsp6Q
         oJZhOgxb9LOr828IO4VRHaw8VCrUxWonzDO+zAM4qpnOcHE7PPdiJDlXDC+q/M+hR8yg
         a802mhwImz8+nkuiYwQ5lr/voU0jw32QIvQ5EHITcXYKdfqR9aePhASB1O5NPGowrrFg
         XMMwdnDkggYIAN8yusZFKW0TDU709L3lMFtG9+h4bA/FqN3mlWafkg9XN/10MLZWWR3Q
         F77Q==
X-Forwarded-Encrypted: i=1; AFNElJ9JDn9Dmoprpq9AjqQ1G9OUKyWzN/MhWdhm5rq87Pc60Rw0vFxPFfN3CAfRfKQx0buCr1vsYnrLmMQgm6mAmc5C@lists.infradead.org
X-Gm-Message-State: AOJu0YywvHXE2J4t37MT3TihVOeX4emanSXCxUXY3pgLeQtcBwrxCEwG
	YAFz6VuL1oX/bdQrcLHG9DfSJNnyxemLdD1O4ytPmyta6KxSL++e85ShsQ2hNIFoyq4=
X-Gm-Gg: AeBDievaSCoTuAwBAVXKregWsGekUJC6GnFfl7ZzJp6r1ufd+Ou3byIYTPnVJ/cY9Z+
	2iM3trTw6i1DmuSlX5vf1CQckahPgNyiP2CixKoykT41HbhxerGj8YaN46ohhBtTIid3XsbHgQk
	xb+4nmkbS0gJyV4wFMVny9kfIRqn6P+En3zSopBRLduEZCToK7alyZP/gA0W0rHC32nVoqQQEOg
	tOoJe+mjmq4RMTCkgepq2bNyWuJVMo/scqWWhEeb+0WQrMkmxT8swvL/Ds7WKFqw8mX95ylxHd4
	IpVWB/ng3WUawgiyn5jk+qicss5t416BeOnsdtvrwniufDlpuVzdkJhDynW/kPDLw2z/RjHLLDB
	F6T8p1lCQZTK5ycrCu4UTb7v2+VwrFfd+1vNpyYKYhoE7DouKBtQhVGaBfCGXGJDNuNe8V2Dsdn
	Li13yh7IH1U4kJR4t8QYa0ddt/ek3EGSTOcFG9tZdgsvDKf5hxQwbSFEuNcMHwzP2HK/XF2fwfa
	/V/uOdu5oe5KQOoUQ==
X-Received: by 2002:a05:600c:8909:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-4891b10dd45mr72554725e9.0.1776706806302;
        Mon, 20 Apr 2026 10:40:06 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:47 +0000
Subject: [PATCH v3 01/10] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-1-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=3375;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=OdFNZphZZrwzkL602uRB/9fZndrRswg6kWPWUQ83lLA=;
 b=uZ84z6z+wMUZD2LCmSNxpX7ypI6Ejebtkx9zuWyST/FHfavxQRwvKlK/M3o6Jibkuo6d1IFzP
 x5ezYFuf3VqDvSctkQKRqUQGVi6aa9K5voFayeO/0pDlk6S9qRr9GXu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104008_472918_81DC2DBA 
X-CRM114-Status: GOOD (  15.37  )
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
2.54.0.rc1.555.g9c883467ad-goog


