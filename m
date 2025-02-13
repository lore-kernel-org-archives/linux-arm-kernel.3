Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53157C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDZLTKxxQDiElbpYU/xxls41XiMypbn1c9DwAMmHY20=; b=iqpVk0ZxPUlL5izIgQrdTviIHn
	KL7KgBzeRuGBbQPPloC1vh9jrqUUtuUoITM47A4gJOY6gOtRWZoW+Gpy8LHPxkrGIKmY3+tbPPo98
	2qe9S6TwXmqK8RfOsCdkwOlmb8ylPhK4lYZkFyfqKWCezQfN1DUubPaBQzLVsnDfsL6l6GhLY9bc5
	SMn4azm9w8jHK41mVROnABMSqOjE0jWmCyhbI7NWyMeJp5jWqkHQRoNa2/d6W9LdvOaZ0baz1kxJJ
	nr9dTwUK2iWDIdzRNzVG4cb7ZfsVOghHYVchOb7kpFBp6T81PFuoHoQYIJGFkQHOIkVFvB+ia7V7w
	TkiNNJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZ7V-0000000B7vE-1TvD;
	Thu, 13 Feb 2025 13:19:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYu6-0000000B5ll-1Gq7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:05:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5558715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 05:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739451916; x=1740056716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDZLTKxxQDiElbpYU/xxls41XiMypbn1c9DwAMmHY20=;
        b=XLXCjosgTWWcivL1apGJA9Wilr2RcN73xJvLyTdMmCpI8bZ/rD1VZKEZw8Kl+s2y//
         YSg0lSXvhjVkNV6a5me3NWZ0nMENDOxejra6nokhLpBd85Bgqh062I0+RCcEjJtPdHF5
         senTgEBKGNEU2uOKSjLf1v1Go8Uo6pEq/NR+zkqxONnKlycj/VR/G6iJXKZ9FXBkniy8
         C/tcsac6JIDjLIoodiHVyjy8BD34yn82dURlc8ggq5mFEZK16gplY7cWi5RsyTsAMoyu
         IYRgb0A5Y/HcRu5G2S0O7HURGurhglwDhSXmwnBWLxwCcuLVO/x0IcgqDRPh3j+KhAb0
         mf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451916; x=1740056716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDZLTKxxQDiElbpYU/xxls41XiMypbn1c9DwAMmHY20=;
        b=GnHacwE/htCC8GPp/1ZIimrv84UrinBx0wAa3S9XZnWbKpvHp8idNEtK1Rn1fFZCe3
         X/v1A+S71QxyUsw1mmg37UyM9bBs1ZBH0ir/68PDQsuR8U34hL91eqviMhN62hf8aihl
         weMkszQ3lvdsfU/A/8AgOYijUE3CAUrQW9ITOeaPN4dSOA6Xi16Td7TyQcSHZyQXzbWH
         mDnOejtHSKfcb+eG+zfCw4OBfl0ghzp45zmoVz5vUzOCSyDpK0rZXAnTlbwX8CLcLTkT
         0Z2ETUt8FqN7JhAxNNUS59/mljw7FoXPcCAvA/1mHVTcsgIXes7QzVNYWMylt/RtZnWj
         P3sA==
X-Forwarded-Encrypted: i=1; AJvYcCWkotiWE2T91sERLU/1eqdRa4t9irZysXghExaU9DA38kLSjiOzDnkqKk4D895f38Y1a+Pxb2TMvdOCiE4GsGIY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk24UvCWjT2ehwq3goqMM30p2Crvwvf6QNaePJCjweLWRk+w9j
	La5Z0/9JWy51/9XMk8Y6nrGYl0d+i8r79NNCQoTM2iA1Ar018heYqJdPrr4laYI=
X-Gm-Gg: ASbGncssWFqfmjsBE6621gj+umD4okivmUYlM6gC45pMdmneGyjHpTkv8UhZ87I98ZV
	BeUlS9EFyl9ol5tCgvrTCwT4ZjvItaKEl2IP4Wq1pysNktJeXsOqmUgC1+foUoHxXC3+WEiKNpe
	bkXR4hAZnbAvF6z5ZQLYsYYZfHa3YMrUFqbNhsrXZAo5FVhLsP9186kuXhvLZMMDZDRWQMpi3nA
	07I6IYuykUWgiYbibEdy91P/IRwpYshR9ep6SI/FufVU7y6rvzpRPF0CGn59LvATLRZADPKK8yT
	nccU4E7eVTm1xNdQ1+iaH2XiTxMq69mqMdeeT1MOxppIcd5F6OvAxBMP1xgTiXdYcAb8768=
X-Google-Smtp-Source: AGHT+IE5WnMtblBw9bIRTim3qtt24a1KeYp9jziJc9822H6YJkG6wfJIr/g5tZ1Z/h2vjMhWRm4IyA==
X-Received: by 2002:a05:600c:2309:b0:439:59cf:8e0a with SMTP id 5b1f17b1804b1-439601a11afmr36920925e9.24.1739451916481;
        Thu, 13 Feb 2025 05:05:16 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884251sm17004025e9.31.2025.02.13.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:05:16 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 13 Feb 2025 13:05:14 +0000
Subject: [PATCH v9 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-gs101-acpm-v9-1-8b0281b93c8b@linaro.org>
References: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
In-Reply-To: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739451915; l=2127;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ygfKgwFm02MPjCPY1HixRGigRORpbX7fhEuE+FfQvu4=;
 b=p+BdejU3bp4Gn9o8URtHOIITqvqQBk9qAN4b77rnytls72rwCC5qbe+5PGAN7kGVTb6VHNFUE
 JOS9Y0RwVIRByzxT/6brrSn8HdcGJjC2twSMQD/8ol6iU9XphUUIK2d
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_050518_346725_72A21990 
X-CRM114-Status: GOOD (  13.04  )
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
index 000000000000..2cdad1bbae73
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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


