Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97EACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=; b=g0eYKfjJ6gPAv9lZAgrxv0FnrN
	LkwKFy43Oq6rBPplLwpDQHcaLqwVLA9rX7+PyRVEaOjVkfqN5lqcCU928g0rKrDM0f2Xyk91mceYq
	6ZbB/OPxTbQ7+oxsinSsP3fod+pb97A5kgDCiG0Kk5VZHeUav9PZcmYI7P0Fd0etbtsqTsWB0pzb4
	MlyzKwAEcaNp5NwquZ4WHCpTWrBxAHMj/hfLc9XUzEZ/+ODNE2A5+PihKyYj8ebfE7EyWjubCV+DN
	UeLPBPLDjwAyCAHBLsK2RJefrgU7u5Sp2sPjv3qMUUeCzTlnc7Ll+zECm4EWNyajUk4gEK4EnHfGS
	DnlQR3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNJd-000000026e3-3aXn;
	Tue, 29 Sep 2026 02:11:33 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNJU-000000026bp-2aIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:11:25 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso18252725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647883; x=1791252683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=;
        b=KjPGM5TvT0xsEFrKd77F0E056s3QIBQOo0Bly0wKFgcJdBHtrgyZbRKbcYnVQhFA6Y
         iwsKkkwaO6CKtmMWTXj6zYJxeQjz6cew0KuCZNrB1GrPRiWi8kfH6y1kJ0mtyvJvZzzv
         pgBqBfUeFyC62vIz8Hi7VJJMlAX3jLzUc7+fZHhD+2Z5+7Rb3icaWyntFwKl+Tsfw97k
         NzLzlhQXBOofa25JsxX+8lchiVyMvclSJcgzBCujFI2BMiKsSVYRegVanAzoOkPzWo/q
         ULsF3Lxebj6BKLJJqCoM07Bafs1JNY/gwPCoGCCb4ScxU2pC8411R/M5AMP5aagZiacQ
         vUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647883; x=1791252683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=;
        b=PgP0734QPhBewxET5UmTbPWQu6gDw0yQOIlTffAhoh18erbEcVE379btoI8PMXgXe/
         /KPUzr5iN7lECEy7JlY89iwJYjJ8o2H4cH06E6YcxO+j4DFoUEN7Lf/lGMMoTEXR65uO
         mqAX6o5zYds8F6Xh/IJkZtHfACtYzlSYexKgL5NU8Dv83pHUMw65r+k4+qIbei3xDn6x
         1Eh7TYfSYSCeVwn7Mu6l43faPVF6POoO0KQDMkX19Gp7zsDPtQK4fvW+OgBs0yrWJnds
         ly8lJwBrN3cci7Ef17v4qTJpLoHJa1gibRq4mMV6YGUUw/0rwxaT46vq2UcBMW7gLp8B
         q3rA==
X-Forwarded-Encrypted: i=1; AKwUvBziAW2E7AcmfzqGbermfEbO5a1d3oWMD2ZAyJd+uWgWqvvZRZyqNJBomzi8/A1NFdSwLBTl5DQpPpSmH8+BU8YN@lists.infradead.org
X-Gm-Message-State: AFuF++mdHgblj33TCcVdv06o5l47A1mylAJCQ7/OC5uilpw10YjlVIEZ
	NTmO+maO1XqQK9n3Av213TVJwv9LQk76co/5KIR3XTMJztojtPJx0BDf9uZcWJvzVbpiMLoP2fS
	4hBjGADc=
X-Gm-Gg: AYBFou2vtwFtGRNPO3bwBP6HKSlwCIw7raVuruMilQp+ANwK3cOr5IGHnmTrbKJuESL
	R+jjrZKHUtmTzGeNRc9i+B3N3lPd+Ivw007O20bR/bcINufQad2l6aI5HNXcVmGogBUjzpH8eez
	NCIaN2t4/Plxk40ZhcI+c+CwiAbn7XpcDHYXDwhv3oDUwFJxuct1hMFSZuLCqIDycQzQ+cqbWgL
	od6JIxXijbMEefTE/vINyrLYNZXT5JKsKIOyXxEvH7gTor+Nc3M3TkukHUubqI8IPP9CF1cymiF
	GffDUT1aG1phxZTBQpekCH8pjwpPYxjW/mdY90FQuGaVLuQTFus2tNJrx+b9VhO/cLPKTNiV6lf
	XrbTLVzxSgaJFIvzLQPvA7GlSUPNar9qy7jfdKAn/V6eSHbB4wtKurXBrmTZKUj7sOyMy+uf9M7
	Z+qk63C4aSpnOpPQRIek579KMYeFK4ConckGDKrw5MDy14dSOrJF7U7LI5VLlSdykhimHwIbaiK
	Ge2lZsXiXcvZFo7VXG2MDnP3gz0xkofQrsm94F7lPetYQBNV13z51OllTEk3w==
X-Received: by 2002:a05:600c:540e:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fe66ca828mr272930495e9.10.1790647882919;
        Mon, 28 Sep 2026 19:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 03:11:16 +0100
Subject: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_191124_692351_A8DA2076 
X-CRM114-Status: GOOD (  17.52  )
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

The Exynos850 SoC incorporates an APM co-processor. Communication with this
hardware block is done using the ACPM protocol, which handles IPC messages
for clocks, power, thermal management and PMIC control. In this
architecture, the ACPM firmware running on the APM acts as the central
supervisor or arbiter for shared system resources, handling requests from
clients or agents such as an OSPM. In this design, the OSPM is one of
several clients or agents communicating with APM.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Additionally, the ACPM firmware implementation on Exynos850 does not cover
all clock management operations (such as clock rate reads over ACPM IPC).
To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
called domains, add 'clocks' and 'clock-names' properties to reference the
underlying physical clocks.

Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines for
Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
specific PMIC child nodes for Exynos850.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 +++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..0eaa9c881f6f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1
@@ -33,6 +35,20 @@ properties:
       appropriately with the clock scaling. The argument is the ID of the
       clock contained by the firmware messages.
 
+  clocks:
+    minItems: 1
+    maxItems: 9
+    description:
+      List of the underlying clocks associated with each ACPM clock domain.
+      This property relates to ACPM firmware variants where not all clock
+      operations are implemented.
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+    description:
+      Names of the ACPM clock domains corresponding to entries in 'clocks'.
+
   mboxes:
     maxItems: 1
 
@@ -77,6 +93,44 @@ required:
   - mboxes
   - shmem
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-acpm-ipc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-acpm-ipc
+    then:
+      properties:
+        clock-names:
+          items:
+            enum:
+              - mif
+              - int
+              - cpucl0
+              - cpucl1
+              - g3d
+              - aud
+              - cam
+              - disp
+              - cp
+          uniqueItems: true
+        pmic: false
+        pmic-1: false
+        pmic-2: false
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include/dt-bindings/clock/samsung,exynos850-acpm.h
new file mode 100644
index 000000000000..87fc6ccc1d99
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+
+#define EXYNOS850_CLK_ACPM_DVFS_MIF			0
+#define EXYNOS850_CLK_ACPM_DVFS_INT			1
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0			2
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1			3
+#define EXYNOS850_CLK_ACPM_DVFS_G3D			4
+#define EXYNOS850_CLK_ACPM_DVFS_AUD			5
+#define EXYNOS850_CLK_ACPM_DVFS_CAM			6
+#define EXYNOS850_CLK_ACPM_DVFS_DISP			7
+#define EXYNOS850_CLK_ACPM_DVFS_CP			8
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */

-- 
2.51.0


