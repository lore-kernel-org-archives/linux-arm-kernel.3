Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Drrp/bM071Dp74jG1eEsU28h5Inku9vU1l6IcVuKHXY=; b=A/heA5GITizmqCS8sXYd1W5VF6
	fq94/yju/A4Uk6avQc96fO4A9XTBD9Drt12syNxFlK3UnGbirerRxO8Gu0tnTyafp/1ZCvOSUCbH4
	65Hj+qQXK1gnE5XtvEzUrMjhJOFYRvyq6CJZTRBGVZlCfXToAN3AgjSaljwV9Vawl6Xqww8eqWqnA
	x8H8DCydh4EE9Eeh7hMb4tPgZmhzeYQxUw4mDkZ3cYhjMpT7LOLVtq6Ze8kAnRDm5CINiK1K4pHxT
	BSm0sHcTZ03XdB4nClQyPlQ8NvjXW4lOuRYCafcUsg+pLI9rpLR+Z5DkZd64JkNxaXVbCyOvj4WMB
	0q217Ewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdbs-000000055WT-1fsR;
	Fri, 20 Dec 2024 14:04:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOF-0000000535A-0PnG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:50:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43622267b2eso19611495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702601; x=1735307401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Drrp/bM071Dp74jG1eEsU28h5Inku9vU1l6IcVuKHXY=;
        b=MgbVSgklg8+jgIxRkDmi+XJBQsWg92HE2ziwBSBwxYpbBpibLaEkxOgdSiMJ1cIQVt
         G96tyH7AJ50C9v9mKvEV1pTmbxVYH974/ivX+1jfVilPkSFiVRl2TDauiMeMB5FBr031
         OmyMoZ/P8INFK0ubRITb0bdBEzyU6ioo8PtDoN0DEl7po9JUm8e/PLSBswcJSyQaoyp7
         RDwVCpwVKQasRQhxYk8y+KjvaKVGS0kUAi0jbPch+b7H1nrh3yMGngL+878ItotupaHs
         5/VzttQl+A0bbTwqRtIG06YQ1PSIHCDEUardAylUHJWN/wM3Rli3bh/EpVC27uX94LDL
         uPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702601; x=1735307401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drrp/bM071Dp74jG1eEsU28h5Inku9vU1l6IcVuKHXY=;
        b=Z1K7JvWa5XY17toxV9Zd6jTWYigqqNTvXojtOUTIhiN4MmmSngpbft4XC39iCAc3Nr
         xTVBB9kAjyQuPN/WLv8NX5B5nron6JHnF9cFf7tT8V0TL4AOsTCq3mCUYJaXkSh4ifdB
         AvVy/OXq2GDuyNZB7iPbUWpoHyFL8IuHrzIxNTgka+uFToK+AFBRsU6K9jupkt9j6lvf
         7x26sZWVBCy4S/hqOJ0YHFnJc0rzFN9XNJIBdfPKviZITqnQH3Fy86+Buts18l6wgXLf
         9p71KxNkFPswx4Zn4BsG1VuSfMt8bmk4m2c/l8LxHQGPsu8xfcsxgxCSoi6zjPOOPCsn
         YsQw==
X-Forwarded-Encrypted: i=1; AJvYcCXTWqMtrHqB4dXIURjiUQRWxvOtV60/821AzrP+zyTbgoRLIiui8NyksbnAnZzCD10km4yvkCCnexk7VwnN7ocH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfa1hMC7XywCgAe9N5MbpvODRLN9v1/e8w1Hv8YmAXJXJHCy1I
	n9oQXoUG7A0r5nsiK1W6ZOJayiRdhFx6Gagl1NaLptnXDCqxJDSsodkX2/tYIZg=
X-Gm-Gg: ASbGncvE+AxAfUQIaHTbnDQNCTwB00h9ScxtcUq1f4fh2qnCrVSey28/pqKpy17002T
	JKeqruV0BGBr+v6+pk9dY5C1bRQCiPV5jRMYEwBG/fG2xliPafxJB904ZZAAK8IkkmL1MNm5viI
	Xf7ahJ11JHcj8gUngt/9MV4fKAMIPLAIKYBR/4SXJTBmfUi2PCjjYEHHJ3XsaFVFm3PeqIl/hNv
	EVUoceXA+Rp1qEqVybgwAzDfRwmlaojmGljB9gfvFUONY8Hzt4VFjS1rSYI0/bhYsnTVjQ5dMlr
	Uy0c0ZWYdS/+sbzXkkz5wZuYEdAiHgdIfYYA
X-Google-Smtp-Source: AGHT+IGmLqoezR1dy/0yCfVQQLVCWAofOQ6KwjPi9F1bHXgcS8BNdXaZNl7LSVDsp8VtWoa4v/CqjA==
X-Received: by 2002:a05:600c:1c91:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-43668b5e085mr23276095e9.26.1734702601113;
        Fri, 20 Dec 2024 05:50:01 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:50:00 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:57 +0000
Subject: [PATCH v6 2/5] dt-bindings: mailbox: add google,gs101-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=3101;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gc/x/vd/iTT6DgRuhTHKKXPn1qQVX3+uctKpzIwRy8k=;
 b=1yqD4Mr6+HTppBrswLA85XgGW1DxBWk3OZasij4CNC75DdzHxr/YW9Uc8Rmqtjk0KoCQpB3uz
 qEW29wjIKGVDt2tWSzFxK7GDD7pOdikK2I0UV7O+C4Hcq7ipm9gl7Eb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055003_146667_6EFB2C3B 
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
 .../bindings/mailbox/google,gs101-mbox.yaml        | 70 ++++++++++++++++++++++
 include/dt-bindings/mailbox/google,gs101.h         | 14 +++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
new file mode 100644
index 000000000000..a1fbc3b2b9de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -0,0 +1,70 @@
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
+  The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
+  bits for hardware interrupt generation and a shared register for passing
+  mailbox messages. When the controller is used by the ACPM protocol the shared
+  register is ignored and the mailbox controller acts as a doorbell.
+  The controller just raises the interrupt to the firmware after the
+  ACPM protocol has written the message to SRAM.
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
+    const: 0
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
+            compatible = "google,gs101-mbox";
+            reg = <0x17610000 0x1000>;
+            clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+            clock-names = "pclk";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <0>;
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
2.47.1.613.gc27f4b7a9f-goog


