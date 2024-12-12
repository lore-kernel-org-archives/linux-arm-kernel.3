Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D962E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sYCGfkHDNTUYrfu1p0MBWMT4rMemdA0rLxD3BGGzRo=; b=xCDn4v2PZj5kaAmCpqrYJBG4W/
	biw6TOkhlQKmwweu3KqiC2WTB98BTyN2F6mnw6aAUWkF+c2q15WWuy5YB0gBi8hiJGg0qRjwKbx/x
	0l4BuFul8Nng6vgIu0N9sBVxE1dR9hg+wihpCPzp2e9wGXvFsGrxEeo35qru1z2oJ/SUysbl14CZX
	qJlIbXIdNTyrSFV1eZKdUzM2K1v3cNEpzqR7Bl6PjTsbxbTagiqKeQlvCkZIZ800RuWd41c3BVrJC
	EmyAz656JjPi4Ks8s2u0rDXaMd1EubVKyZOuu3/Vp4JTzoA9sPjmeNTzDl42RuMk9PhI5M8SezySh
	SvK1U5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlWU-00000000q2F-0fgj;
	Thu, 12 Dec 2024 15:54:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlMA-00000000nde-1Ogg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:44:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so7219445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018240; x=1734623040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sYCGfkHDNTUYrfu1p0MBWMT4rMemdA0rLxD3BGGzRo=;
        b=NgCku2IrFArdVcfFsWm0RiLJ0a/wNtXHqfM0Y9t8wgJA0HJ5ofAeKA8wAXxrqIJydJ
         er/H8sD2a6XsDHOqxnNBCNMd5mA8Hiu7Ay+/rg7nhNv1GESwBgcKBSwQvx2zjMsu4W87
         40q9MoWsYjqqi6+sK5UKJ+oBRMSJucLEMk5acEDFFd1H4AXyb7ZPYYX0/f5iVLWGJQ9U
         Z4yfKKtILIdSXRlBJq4sY5ipqVeI9X6TxV3FHusNoown66VkYTpoo0Sqw86+kCVTz9vX
         /O7wXE4ltFDCGCPCwEBFpZSnz6piL/u0rxx9uWKzooN+RlrvrKQSIRCkNkHRAZVWBcJ4
         1oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018240; x=1734623040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sYCGfkHDNTUYrfu1p0MBWMT4rMemdA0rLxD3BGGzRo=;
        b=n/g0oKf4JhadC3xKvoYbD5gvfMfPPFSaINRnfQcAonOTqQeLZXa8OWeltLi7wU+blI
         +IxAr2w5V6yUki5fV661KDHBtFOtkLrMQMGu82+yittG0MgaV8H+y3xhg+v7t3seBVTp
         Uugnz92h10sNGUmmKBQwjBfpCuQFjXUR/qa3Wx52RSh1VbfokvnLemmp3M19VlwOQ0Nt
         eRpUZnvwFs2eTVluOBL4YLSI4syj3OSElw4VFbt2E4GXUvYu4GJpt0TXn76pSbSYV8S4
         wZ5EI0dS3tvvBPY4nX8qQejPlPyQQmafJnsIONxsJwd0ygOn75fkkna75JKPxdaoz2ow
         6eYA==
X-Forwarded-Encrypted: i=1; AJvYcCXeWswezmJex5H0OxOfiQ7XXnTtQ/IgvP+QjK4f1cHhMYJUJ/BuPx9ga06vkayDXrxYhXtfs0kpqAUs8kVKxM8j@lists.infradead.org
X-Gm-Message-State: AOJu0YxZuRpMdT5itrVmjxwcEukd5p72u2/kbI/dBGorEh3cwNi51JMd
	cZ4XoNE2/0OdVu7Ci5tkKk7F2FLw5RQpsqpiOujO7xhvkUXvjXMSjH6nvQ5rcsI=
X-Gm-Gg: ASbGnctALzMEkVD1+Aor4kMmU546R9RxOVXpBFwuLLkH1VV+aGt8EX5BYXZSZtN7NO6
	6LTweIIgqIojGdPnCenTn9+yddXLLdspcwe6d7rYPDfBDwkBo3A/YqwtCo1odJvw7hcFTnsZOfQ
	RUAPh5CsW0ixAhxOUv+Q3a41GboiMmY0D25J5LrwR3L8u2XDdKKUpOdPGSVu6Q8hT0+yWRULFCK
	kiC/SimT5qKfFp6T9iygovHF0jTlf67xX2o47I6kJzJqbOJGG518P58BZegExxi5PkSAtreh90h
	Yhz/KUHQcNvUlH+VB+dgje2Q9h6ofoI+Lw==
X-Google-Smtp-Source: AGHT+IFWnLDcBs1YFh+lFtIQyXRCp4fpmS1qTnnxvwviVbcPJl2inWgtyLS88igyMkaBIy8IzkTXtQ==
X-Received: by 2002:a05:600c:3b0e:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-4362282e38dmr38316825e9.14.1734018240277;
        Thu, 12 Dec 2024 07:44:00 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553208sm19992375e9.9.2024.12.12.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:43:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:43:45 +0000
Subject: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
In-Reply-To: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018238; l=3410;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=2U3cIpMR781g/GfpmXVJzVTA2XVkQ1k3SY+wzu3Tc7o=;
 b=dj2pBC8lHn3zTW4F13RoMR+aFB5b4vyOkBgO8VAohZvTmW8QzdjekCEaA6kmDl97zt9qxO0Xh
 Ojms8YxxxiXAskMypQsCMWWvbcesVPqLxkYfimBf7PziCcQdg+RzkQ/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074402_377177_1BC37937 
X-CRM114-Status: GOOD (  16.10  )
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

Add bindings for the Samsung Exynos Mailbox Controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mailbox/google,gs101-mbox.yaml        | 79 ++++++++++++++++++++++
 include/dt-bindings/mailbox/google,gs101.h         | 14 ++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
new file mode 100644
index 000000000000..efc2f605acea
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,gs101-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Mailbox Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
+  generation and a shared register for passing mailbox messages. When the
+  controller is used by the ACPM protocol the shared register is ignored and
+  the mailbox controller acts as a doorbell. The controller just raises the
+  interrupt to the firmware after the ACPM protocol has written the message to
+  SRAM.
+
+properties:
+  compatible:
+    const: google,gs101-mbox
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  interrupts:
+    description: IRQ line for the RX mailbox.
+    maxItems: 1
+
+  '#mbox-cells':
+    description: |
+      <&phandle type channel>
+      phandle : label name of controller.
+      type    : channel type, doorbell or data-transfer.
+      channel : channel number.
+
+      Here is how a client can reference them:
+      mboxes = <&ap2apm_mailbox DOORBELL 2>;
+      mboxes = <&ap2apm_mailbox DATA 3>;
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  # Doorbell mode.
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ap2apm_mailbox: mailbox@17610000 {
+            compatible = "google,gs101-acpm-mbox";
+            reg = <0x17610000 0x1000>;
+            clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+            clock-names = "pclk";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <2>;
+        };
+    };
diff --git a/include/dt-bindings/mailbox/google,gs101.h b/include/dt-bindings/mailbox/google,gs101.h
new file mode 100644
index 000000000000..7ff4fe669f9e
--- /dev/null
+++ b/include/dt-bindings/mailbox/google,gs101.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2024 Linaro Ltd.
+ *
+ * This header provides constants for the defined mailbox channel types.
+ */
+
+#ifndef _DT_BINDINGS_MAILBOX_GOOGLE_GS101_H
+#define _DT_BINDINGS_MAILBOX_GOOGLE_GS101_H
+
+#define DOORBELL	0
+#define DATA		1
+
+#endif /* _DT_BINDINGS_MAILBOX_GOOGLE_GS101_H */

-- 
2.47.0.338.g60cca15819-goog


