Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D4BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIm25PmeAZOAYMgQVdnUOumJT9enCa4+yPDMgOnkhGU=; b=yde3N/3fEcdiQdO6Mt4aOtmPsg
	lrkWU4M8Nc2wHpPZiAO9b/1PCqX9mU4iETZWUifG0kctfQsHkmfT6oa68N1LPi1wSKWkhTIq8GQzf
	ByxCphe0dKw9KUg6rbFGD6O5EiX1nbQy/xymzf74A34WReVoY4cGNwqXLlw8WWhngAQMrS/qJPMaN
	tWfMjM7qhZaFValceFveRs7KVe+e5G1P0cmKvIdnXRmLyv+1AJRUgNI1XRGL0cXhWf2Xi82gDU/FQ
	AxOm1DVZP8FEHOyYyvtn7P3ql9qz6IDwgZ3k+WVhDAiV6GqYhR4PiNZWvsKRSyTO6k/M/e5jR+vci
	ydxaxZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQTG-0000000F5Iz-35SA;
	Thu, 16 Jan 2025 14:03:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQQf-0000000F4lh-2aiT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:01:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38a88ba968aso927117f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737036060; x=1737640860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIm25PmeAZOAYMgQVdnUOumJT9enCa4+yPDMgOnkhGU=;
        b=N/0Bx6uC8ykoyva7EImLaUjJBeI91fXmbwDUrkyk5bkKsSIO9zqajTRb7HYY7E+QOS
         91rE+kUJY0SG8zh/Tb26pgun3E2uW6kUwwYSqpgby8Y17TOmuh7j1gIIduoKGknSCFRT
         t2/PoPCnu0Spa0gxS3RK/ukv3+RJQM42RbhgYLzeZLtBzdkEgIsVncKKeSrLKQxqtQuf
         OTYRupYPHfnY1J3WBnVsp1t73Txb1LN/aS5QGPxJDOGQBR36xtq6CUDWx0JYYzW4nP/i
         QrcT2PW9APhGqF14UlktEprHn4Ksx0li2bwlw+vITCuPChuL2CY0/HUgdmyaFzunBLwH
         nYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036060; x=1737640860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIm25PmeAZOAYMgQVdnUOumJT9enCa4+yPDMgOnkhGU=;
        b=D//QpjkFGk9Qz5LT4v3wq68ng2bzMXX4nku7mAWRAACCs49alVGtEkEtgcaiX6sD5R
         theUZik469WAxacHe+LELMrbTqOaG6SaTd/5M6wv/dJq3Kj6j849tKfddNaR+q90IfJM
         +zm+KFwhvoMxkqiU31apVEZDCaaNtKw9898KV3iB24YrPq3Ti7dWc9yUtDD/4ZlwdXYT
         cLPQEVRaZuBtD2KQG9ZvbBNhAkw9Q909F8O1UAhVErCOc7d2zzUgwG6seLDOuQO/rbAn
         qtz6HPU1uXirtJaK5ziT1INBgY8ESDySCCZOKgFr0o4uIbI46ttAhCdizdIsFlejawsi
         fEww==
X-Forwarded-Encrypted: i=1; AJvYcCU23qy3g+3wnicMTU9TplxVZXwjPiPDLrj+woA5cbuytyLGNn2rF+CRFrHseLEh1U6qu9s5w6+cBPmULIgdbIJa@lists.infradead.org
X-Gm-Message-State: AOJu0YzwGPDyWtBS5YifG5I9ZTao6yE7n+xZZbRyO1wNr0qzd2NNI7I5
	AKTsT7Yu94+40wUgB3rGe1Huxp42i7BV0NTywvkgKQ/WGMFxbM8EHqRDUPKNM3s=
X-Gm-Gg: ASbGncscX4dSyAdS0kzhCuWMXMnzOgJzmtpJZPZo1vGoQdCkPPPnq0fZicw5qMCS34v
	UooYYbzmyN5OPRKZl5/nCg47oIj8gGdKPPNivK+577n9Of/YCXFw2QYouP0s6x9Rvfg1Ucf6S0r
	4eqRdss+TFvUbj23+4YrJK765GQyJe8VfL/NY8kFIM/PTc+xQmBDRauQzlCO3pXCYUqTncq5Rvs
	KO/chA1Wx4CY2xL/3xeX1bOygKnW/VOT7ZJzVinSmbkqam4IwiHFCqC2Y4VGvoe4e2Uhx4V5tdH
	j3lwGw8Hjq1WuRyoYluucNRLlBHUG83r+Y0O
X-Google-Smtp-Source: AGHT+IEO3mG+Bm83EMpGNeFN/Ai638KiKI6Wq7PleUU2fAOUa9hDQU/99f71IsakTNgZI5RVY5hkFA==
X-Received: by 2002:a05:6000:2a9:b0:386:43c9:3ac2 with SMTP id ffacd0b85a97d-38a87305311mr18559964f8f.15.1737036058578;
        Thu, 16 Jan 2025 06:00:58 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1f2esm20608846f8f.98.2025.01.16.06.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:00:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 16 Jan 2025 14:00:47 +0000
Subject: [PATCH v6 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-gs101-acpm-v6-1-e3a2e1a3007c@linaro.org>
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
In-Reply-To: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737036057; l=2126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uQ6Bg5/6V5Dq9OSmE8te0C3SbDjnup2vFnjKFigEBUI=;
 b=KG6sUTyaRCehZTlKyZ7MYQQEeX/4uKyAT101iEiiV+mspjeG0iwJV4erWBMVMQCn4N+DybEF7
 1b9hgLyK7UGDr/gH9I/c9e50PHvhzMtbRlCDfuilda7lqymPFRmG+S1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_060101_658836_98E11AC6 
X-CRM114-Status: GOOD (  13.24  )
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

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
new file mode 100644
index 000000000000..982cb8d62011
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM mailbox protocol
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  ACPM (Alive Clock and Power Manager) is a firmware that operates on the
+  APM (Active Power Management) module that handles overall power management
+  activities. ACPM and masters regard each other as independent hardware
+  component and communicate with each other using mailbox messages and
+  shared memory.
+
+  This binding is intended to define the interface the firmware implementing
+  ACPM provides for OSPM in the device tree.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+
+additionalProperties: false
+
+examples:
+  - |
+    power-management {
+        compatible = "google,gs101-acpm-ipc";
+        mboxes = <&ap2apm_mailbox>;
+        shmem = <&apm_sram>;
+    };

-- 
2.48.0.rc2.279.g1de40edade-goog


