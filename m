Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543F3C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=; b=cS1bH+iuvHlykA1ty17RWKwl9F
	m/4BDzRzmIIrv4DWXFkiECfnDvYiJbAs5HFOPTAscyk91z6Ra2SSyD1UYL9/+d71W3U0Put7HR21B
	3qWVtvsmTORlY1NMr4ShR8jBVg4dWpTbh4spmeh8QI9HqI+0Knj4Pkj2oKyt5IJ/goSISrUylD0GS
	8iB90/V0VSFAe5hiUTiHvh2UR6cD2MTN0zffmcLJRKOCfsq1LgY8x7jCShSI8thMXe/9NrsQc41h/
	q5EscOkmcmCJYhQE4/yUS9sSBKDdvHHF3vpIbXt19yIYlZiMB4f1i31GGqicvlfslejDhDUJ0WKM1
	E0ZXheLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thm3t-000000035G1-3YNf;
	Tue, 11 Feb 2025 08:56:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thm0j-000000034Vq-2WqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:52:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso2443204f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263972; x=1739868772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=MrrQc0IC1uPRD1NSKIkUutKEvLJ6vUqhhHDguctYJmXVdkcL11j394zvKQrShrNnl1
         n2Swthuy3PZb73V9s2wtIZiYUqr86lUSE7NSrUiI2e+htAu6lF1V6iS8zkvNvv+N6160
         pYasoKgujhlYJErG/1VnHubrfIcWlJMYuAocKjD+rzDKGQ8yB1dI4ejjFcqWqK1ATpgy
         6adypJZCB53ANCoQl2w2yno41yrKV9PMl+4WCFlIBMaZMQBL4goKN+Bhhzv/WCnmyvGC
         zHrQnrqiLHQ+vXJeWtQqMtB6RTlUqwdU4v62oCor/1FtyiwCneM0a5rEfjAFp83OCqlG
         MRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263972; x=1739868772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=i+Q8ZoxViZEWF/GLX+MiremcRqZC2QZ0NxnXzAGqUp2iGSe0mLE/1EFqHu7hShzLHP
         L+1Zi8JCQTD6c1tOU4Dig1CkJSr95FCx3poeNIFb/uIEai+WbDxAMLKvFIb30yxGT2dQ
         CnSVZAO5mZm0w0Zjjp9yMAHmuXSCppYd4ITqSVevoMUBXkxJs+ZNo1YcXtk1gZ1MF4A5
         l6WcWf2ysuDsJcNBrtOW3KOKuv+AkyxzTvuzZHbivhWiYIWXLT+LsAsT1OWdhVLMYHy+
         4NqSobejI5MMtduWjLIvzqu4GdVHCE8+Rj/sRgsXNTx0MXt87/apS0ROR24PdltPxxgz
         RUhA==
X-Forwarded-Encrypted: i=1; AJvYcCXifnb3v1NCqBXAy7FM4P4b/7yow5f3mDCiR/In8jjNAD602J7qppcXtwGuUogMjBGBJKNSyptDEkLwcvr+dUJ1@lists.infradead.org
X-Gm-Message-State: AOJu0YypZ3HYubG6k9ou8hx9mAtDZ+fcwT4ibRUYXv+HAPcLRSB1kFW6
	Bpw0xNYdg/HGnznQ5cheGBqtAeqiJyUdq0uRerTI+WdYb+JBGnHsMa1BnwnoMVQ=
X-Gm-Gg: ASbGncsYYSnY0OY7AGxl8mAQz+Tn2hvdfx9E20rJdSWC0Inzg29ynjfrzpSiNzqffOT
	FnNHBQVWlVSgey7AvZtGksYq81DBKBROTuXup8Ji4BLiSl9zS06QraIqptXdmndfYL8U4MYSl6f
	A9aAuivxbGgD/k3UBSrkwjOJzwlSTNgb2YxOQ3kpxo5Iu6Wa5WnnQ4nY099xqulgPmGCY6olZ87
	LKyi9UDORW4eAjOUcKEUF3CLmaqXwRxOm8RSHj/cLM/knv3Dq98eFInGVZ2Bvtz0bBvb0EcVAhq
	8M9oAPPCO/73bGob9KPKYdw5qksDQKeffyeQ/AhjyZHWoZGGDuf4CNTBpqyv2Pom5LEmr88=
X-Google-Smtp-Source: AGHT+IF875qkg/sDKrXAWcxZ4sn212gtMPj+TTXBNYYLBq3b1R8Z+ofg0sDdL9n5YnOrakhwVaiQ9g==
X-Received: by 2002:a05:6000:178d:b0:38d:e363:494b with SMTP id ffacd0b85a97d-38de439d6d6mr2000697f8f.8.1739263971823;
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm207698225e9.10.2025.02.11.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 08:52:49 +0000
Subject: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
In-Reply-To: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739263970; l=2122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
 b=i8pShKS7nfAdoKT8vU6vjvJX+KtCpHt/WWMuPa02dDc92NnM8Q72v6dI7wIq9gAN/5/hL4Ivy
 lIma3r/spLVCeCPauQE097Vq3DCayDV67kgFs4pVsNWSWe05l3eUb8H
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005253_658888_E5E036B1 
X-CRM114-Status: GOOD (  13.65  )
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
2.48.1.502.g6dc24dfdaf-goog


