Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vhnMvIq2ObCy9hYEzmIANhln4VKtCIO/wzhfP7ECA8=; b=PVmiQ9sIm226AX8FgdcePNm01E
	Ee+NXEJeV3NYpDskWLLBLKPESGF330ZUMgwyD6BIXU05EDoDLRqxGedVqalHFJfBpY9gWFqCf9flh
	bOpLGdPxv9H0RRzC7xO8oUCrP1yn2WKJZaRtLrgRuV9tPSJRne3Wi81jTtF+2bRNF28cjUmH9t3YN
	1FKv6M0tlo/Z21vq7HNuX/pAlCPfWxFrOolNJe/a/+ul3LZTh7j3p50n0Dca20AuXSt8ZwGHYeEAR
	aw4t+T3aHkGi7QEv8KTuYwW0WdZVcth5NG0+ztJhRph5RtamhjZrhdGUB3kN/fzeIcvkj/pHBD9vw
	m1ZF6e5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUNU-0000000D251-2A4I;
	Tue, 17 Dec 2024 10:00:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU4O-0000000CxaL-1D0T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:40:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24604205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428447; x=1735033247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vhnMvIq2ObCy9hYEzmIANhln4VKtCIO/wzhfP7ECA8=;
        b=aOWFIw08suAvZCo70vEOt1aW3TGw/3WxBEwE7jph/iKXYddeZEiXSSU3t+QsijKY4x
         UwDzGqYKekB56pUB2RWqPd3s6qF0Ysn6FTuu7M1xh4vgSn359Q8HV7Kc8PRb2A3DFkDk
         H/5WWigMhJ2p9SQw/HAcFxm+1PXqTO3nmfMwn1KJas5W+A6G8AvLCULy6ofoQbMfcNp7
         IWo5zaKPoRfArrAM8/NICo1N2nJRKgkiGVHYToLVna3LC01RXTnKWqo4vKdOqsQyY12M
         aC2iZ2ROAnyPMJcqrdExNUWmfZhI7Ai8ywjWx97GpIVeHdOeP0hzHwaQK5r/uTkOeFb+
         wAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428447; x=1735033247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vhnMvIq2ObCy9hYEzmIANhln4VKtCIO/wzhfP7ECA8=;
        b=YGIwHrqa3GEIi96A39GgvRz5+QzqctxQZhTD65sQIYjdVN37DNkExUXDR34xiddhcS
         0qYrNxlHwyx9YWXqglleYqH1Svmw3Hc3CBQ7fF8rHom1ar4jT8zj6AQhpkctTmA0o55i
         z1mqA1cgOCLZTRmq8gNle1NInI2rXgUT7Un9GmLHBVT+fnG6HXnyOKJ/QlKergiGo+mq
         d3TIFxJknHcVHFZZPN6tSE2ThNvebzNCYKRBIDQC9w5F3Ay7sDhRmHeuLWDe5VjGXfcC
         soNazgaVKBdZNFZ1xpEXrlbPODgIyTZCzCbfUA901ivXEoU16rTetudsqjFxmEFRwK4V
         uaUA==
X-Forwarded-Encrypted: i=1; AJvYcCWHK4CDvGLlbir/ojfEh0J7yuXVsvpP+jCXzDWjzVBaTkNzQ54HUSaRRB3sPjsZK4xy//Wcyy6c8ROuTnvt4qBD@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ45SCpob7D8Mtb1Wr5g21LrdQ1N/37dBZd2eTJY3HFUz6iOwT
	GuchhIsY9UB7+NYg85nylNj2HKYJWWGsszvEs81QkG/NxlrvA8c05zJ3IEHCDKs=
X-Gm-Gg: ASbGncvDDIdGt02bjVYsD3Dns3eUM9jrPCRuPY+zoNnmRrjRfXN6nKQW31QTRqLf1v5
	f5O62sKQB00ap4vRzb0ZD+22AKeaWa0wSMwcltOeMgEvcOHgsF+0oedL3Cj9fsrYQgwZH5RpcCg
	v9CDi0yRTCBfOWPfVyrnYIh616yuy7p80olnUOlIBsfVRrAwGkHYASlFEAnJAqzcl8kn1xI4K3O
	6+qmS8S3xrb/WfTVbbWLVd68GZLP4IqtnnvC7jzs9Zgp6P8opp+v/hgbCH09R3BwEmwJdIsO7Ng
	dL+LTJjYGn9hqqNwhpgS30iOeUKQF52rZg==
X-Google-Smtp-Source: AGHT+IEypn72K2XDLMunXNz64L674R1qAE0jbL8OdemRX1WFc/rB6qj/zLgF+xCW8NIwgy+CMsESIg==
X-Received: by 2002:a05:600c:378f:b0:434:f335:83b with SMTP id 5b1f17b1804b1-4362aa155c1mr111751935e9.5.1734428446754;
        Tue, 17 Dec 2024 01:40:46 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec46sm167475755e9.20.2024.12.17.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:40:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 17 Dec 2024 09:40:20 +0000
Subject: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734428445; l=3405;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oGbadS/EXFOmnPlUbzd78fQ8Sa6oboYVtVmK/tk9ZNU=;
 b=o39r/a65k4kXSV5QfRaDOokAx5BK2B4HFYrhAv0oPz7TlgqFXptplibdlk3n/NcgfUf68gxSi
 1BS6mafZikSDarVm9MLWDNTdW21MMS5QWgqUCvz37F8c5DiFzt9IgE/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_014048_334214_4D1D4BE3 
X-CRM114-Status: GOOD (  15.63  )
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
index 000000000000..bc7288923795
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
+            compatible = "google,gs101-mbox";
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
2.47.1.613.gc27f4b7a9f-goog


