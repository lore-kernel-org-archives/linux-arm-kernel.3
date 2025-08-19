Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EF2CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=; b=GxXhlhdAEeW9kFdUJlzyjv7GQJ
	E0DlDRi3Qf5mNV6CMD+GWjDAoSD3apl6I0b2/q9hhaJ01769r0O8m+tmpowDzlmkvs5gmnSYDy/Qr
	ddGsCgOypOkI5Lkp0njobWR2YLUY4h91WACwIEP7zWe0kbbRZd+c8fjOr5t1lv9ZJeWJXwFViXQse
	rq7FtgylXEePgnjwbsc0GbnSceYvIFx5OPM2GHpS5k31J7fy63yJO4EV5SwBtFP2MjKDnHBxQ/Ya/
	1hZ2WqQtrmi7tGieGDYvGyuuVO11P3eysVhu/HulmzgFJGHsvGeavNHAO6W90Wt0Cvr75qwqKZjI7
	j9MtY6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN13-0000000Ahxq-035L;
	Tue, 19 Aug 2025 14:08:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKmp-0000000AKLN-3IsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:45:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so41705065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603954; x=1756208754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=;
        b=KoI1gtp165vAOWT2ycNAR30XS6b16f/BRU1TJgf+SJofidwI+U5n0UC3WjQR2X9CtA
         CMoNmfIboKYAlx/eAIaa39wck/mS97+EHzk0LpmMB/btayvdASXZM5vZUPY755uZexEX
         9NEOQRulspXpjmcDZJkHVY3XDEcshek3drMtFQ2nlYQ5gaBO9VMZhVkqXuQg071ajyCp
         C4TKEeRVPX9kNFxxJsp7u2V5NsRrmDXmObPWT6HqhTxL1DWNyBq5qb/gHmkznJO00TcZ
         ZSr+qe+uP2I2VG1JGz85nlUgPcqnzREgg3JB2yWIMyRimymiEZwbPh2lhOOO2nveNBgv
         X78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603954; x=1756208754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=;
        b=e3QVVxPV3NYcIvo67svYoyxrNmPCrIF1246ipTlJMVtMmXmdP8Q2s2Mk/rVAPq2wwd
         pbDIfZzP8/sc44LBvuv4wHcwgzbRVCsqc5Zc3vKYrqSLAP+Y9eT5IrImiCcNPCHzwahs
         Ptufs/TphYwWyPZ2YiqcatzLfspmQPeIMaZMc6x+L18fLT1u/2qazwnUZmA9qlZixlck
         ZS6ZsOsMmuUhuItP+LQiZWx8TrprUQhFEIr8zw6LAEjV9TXSxE7NZpo1LF4tP4nppsz5
         RGMoH+tkqMwSmflmUOhQWno58XzP3hgmTj6Mx72oQuuNzd5HZimD7cpU9HBwkRAszLUK
         R82w==
X-Forwarded-Encrypted: i=1; AJvYcCUU3CZDtVE+yf/vNWCX/iocbGix1EvUx072+60HAeFFNm+J6Z1IQRhb3Jj7SFglhAPjN+DPgrunRZh6/F97Jpn5@lists.infradead.org
X-Gm-Message-State: AOJu0YySkborb/spNi9zRRV1oRr818WqDCNLR7a8QeHRNz1F+c52IRIS
	A+URDFHeTp/8zdLm0tz7CB/WAHPGH7gY7BEmkRyjvL71f6iJZONu+SRJQyfdVI9PLx8=
X-Gm-Gg: ASbGnct+R1Eqpbvo51XXy0iRz814Des4KzpFTnkBLbWBgPY/XecW5IAnBjqVeM3YwIp
	6xHO+j+Ro4IHKxIPo7+/R+RgWcQS690bLEaTmCaF1Ev5fLJ8LNG29l+7LA62p4HBT3bxKKJA2cO
	NFv/7VnGwCGeN8uhc7+0cTG9fokLtsqlJaAnmdu4D4BglMUhc7rGfzmiCEydgg3oIp7i4NUDzX1
	a2aELHbU+wZ9supOor4TYfdUmnjqavirUhom7CFG5n8tL1lup0neVTisSsq7NTEqvL6cessIefl
	2X96066/AG0KEaDTT2J/xj8n8BojJP2w5Zbiv2aqnw0iXP+GNrE3XRhHmuRJzRyAH7C6FWNmqmO
	hELX3/9CE0CwZUS239gOdndF7Yf54w5NWI0QdT/TfM3uGCfwvTbo/sB2N5T+/TtnHFxDxe3APsl
	H0hw==
X-Google-Smtp-Source: AGHT+IF3fExSedP+rhMqtDX0FAinw193ciSJFQj94UbY/WOxq/Wu+sbuY/lPivyxNBf7lI4vygbdfg==
X-Received: by 2002:a05:600c:1d2a:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45b43dc68a8mr15298175e9.8.1755603954043;
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:36 +0000
Subject: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=2971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RHgzxERFqXBJayCLtp1I/QWWv579hP721Hv537Vxp6E=;
 b=0VhemtYEBOAIemXpjyQfMxDu+WLHs0AJDariMAZ3V8vjYybaLCcOrMVRTwR064RJ8oH8Qlkro
 INmqzkQoG67CliO24U9NMFfvexZ3ErbbkxnpAIzvSJXbHEqDgAb42pu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044555_833139_6FB9F2B3 
X-CRM114-Status: GOOD (  13.10  )
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

The firmware exposes clocks that can be controlled via the ACPM
interface. Describe the clocks exposed by the APM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 28 ++++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 15 ++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..27cdf9c881ca680e78e77a0e14ffcffeba970871 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,29 @@ properties:
   mboxes:
     maxItems: 1
 
+  clocks:
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling.
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: google,gs101-acpm-dvfs-clocks
+
+      "#clock-cells":
+        const: 1
+        description:
+          The argument is the ID of the clock contained by the firmware
+          messages.
+
+    required:
+      - compatible
+      - "#clock-cells"
+
   pmic:
     description: Child node describing the main PMIC.
     type: object
@@ -59,6 +82,11 @@ examples:
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
+        clocks {
+            compatible = "google,gs101-acpm-dvfs-clocks";
+            #clock-cells = <1>;
+        };
+
         pmic {
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,19 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
+#define CLK_ACPM_DVFS_MIF				0
+#define CLK_ACPM_DVFS_INT				1
+#define CLK_ACPM_DVFS_CPUCL0				2
+#define CLK_ACPM_DVFS_CPUCL1				3
+#define CLK_ACPM_DVFS_CPUCL2				4
+#define CLK_ACPM_DVFS_G3D				5
+#define CLK_ACPM_DVFS_G3DL2				6
+#define CLK_ACPM_DVFS_TPU				7
+#define CLK_ACPM_DVFS_INTCAM				8
+#define CLK_ACPM_DVFS_TNR				9
+#define CLK_ACPM_DVFS_CAM				10
+#define CLK_ACPM_DVFS_MFC				11
+#define CLK_ACPM_DVFS_DISP				12
+#define CLK_ACPM_DVFS_BO				13
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.51.0.rc1.167.g924127e9c0-goog


