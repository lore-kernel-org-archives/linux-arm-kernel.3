Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED52C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=; b=jN0zu+bA7iV2xuoaHGC+21q0jP
	UdVwS9/hGVzYYU5rqHi5aU39rvI3Ukk/vzbpGwVmdjYp9n7ke6jHFsAquKrB0vxSbR0C+MYv+mrSw
	Ul7+h4z66FvVdjr1OxAJjD+qSFR8luJOMLWv+4Y0reXuXHDIvehRr4x+uKYXzub50wRNjTujR8iX5
	2+8ckhSdQQBIl6z6kyVqMy+c5/vVDVJkMbnPy/LA6GIJ9kt2/pq9pu794pmiOPD/2zKO1RUcV52fe
	dsxdaaagHNyihvyQLVNNR9NWkksaaC1oMVMV0pumb4Cuw+bxot/LtVQZSf6oE8YObnJqIa/kEPGCb
	BLrBMCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQYz-0000000A8vZ-1YkB;
	Fri, 07 Feb 2025 15:46:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQIl-0000000A55E-12Jx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:29:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43635796b48so13547895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942193; x=1739546993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=Q4jQxhICTcQZoihqCJmUaJXmbUDnl+EWRq4zSeyvGyp+k6JPs5AhGSReb2j0+kaBWI
         onbvLrgyNJbp7dWDHxU6H3o3CzNCEqr6yGYq5G8i6x75Op1gIDFGrvz9r3zjLms2WJQ/
         Vk3OlHr2g0sykZW5u/F8TSGMLnYx0+nWrBr5eqwPY2wGwyUkfWXitc6h906TXTheT3yV
         npQ2/9kAspKDG3zEc66LqM7ifjNHrD6h5FDN/RPDeK+p6f/8mk81/1g/eMy/VdjLi34S
         UTyLgto0VLtW4YEV4ZSIDHhOV3MP9lA65bU6G/xHOVLNlxUABmQalMCRMmz/XrXhp4/i
         oJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942193; x=1739546993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=tSW1GxqiC3YAnzCAyx/mjm7ywaXq9jW7m7OAIyCUdCQeIsJHVJrq5qo5wb4etm3VgD
         /YUmORx7ELFshaA10L8KRXSzhEfqb+y1ko+ZDa2K1XhkcJRr1TOSEiaRjQY50z8Dtd5M
         zeb1qJphLWvsBC54T94viXeWE15OQorkNVHt+9EMmuI2yPoagxTE++AxbM+RW+8lX5bj
         IrSaFehC8T0ch4VBQBO0poZ4/ZGK33kvCyB3kCRpCkFW1jUIn1YsmGZBrp2BjHB5cs1g
         FAQdrxgDJdQN8nJMzhm3ApepPIICMOUg3fdlMn9aNAGIw9+v5iSlD+LC2RngQ5Q6ujS5
         ZowA==
X-Forwarded-Encrypted: i=1; AJvYcCWNn+T7aVfLndm8WaScBRiNW7tciEYyLIdYnnwDL8GY8v5OeJhC3n3QQzOHmcHfZh4C4YBjQE5p0pLPUUzeQZwT@lists.infradead.org
X-Gm-Message-State: AOJu0YwFDftM9kYe3GhIWpCcS1MJ427OqimvhfJvFk4PYYv/Gvs/rUNX
	XQSV9vTpK+SDDEPSDRfMFm+XJMiwFMxGTx9DWi4emZMs7R25fu9HOYmHZ9pljjI=
X-Gm-Gg: ASbGncubAhhwzDDPsJ3jDEQsBa7GpZiaQRT4Q/HyAhgL4W6hH4rmqdJY0X6Ido+Vk+L
	UFHd04Rb6kw+QSFgV1jE4kqACGQ1X4uJZvoYb+tVa8lhbRHxYcFD37XFmyJzH2wmbIdU1YIs8sO
	zBi+igyLimgZSNfZA2ctm4Vv6/Y9BB/Q9EjhERFGWzC/5WxBpt7j6vNdGRuOGyhtqDVVcoBwDHO
	LefKY3BIG7xyd63DSdUdD0gvcbpTwnNNFtYkDRvx/tPyA2fA0use+bIVy9MtnlfH73ovxl2TWzh
	kyuwWSHdV1+6VqGrzgwzcAPOsHy3gdQTojcfebs03ElinqodSGzsFnoULIiMFdPnYpWCxEw=
X-Google-Smtp-Source: AGHT+IGeQisxWwVjKLpLxc81XidOEmaj/9PkpKcRmfg/FautVUd5O56htUIcsiEZRQHq7y6VAI6+bQ==
X-Received: by 2002:a05:600c:3c96:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-439255b81e1mr25888635e9.11.1738942193266;
        Fri, 07 Feb 2025 07:29:53 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm57141905e9.10.2025.02.07.07.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:29:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:29:47 +0000
Subject: [PATCH v7 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-v7-1-ffd7b2fb15ae@linaro.org>
References: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
In-Reply-To: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738942191; l=2122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
 b=xPUvF+VVaql0+WFwyO78FZrctDRJ3K5bgzTZVoVvCOUptqjae9NCBxYAsf6FZ1nQ/oQMsb/BG
 TUGInsgGHopCIptyOe0/vC2gzHMsGe8LKcPAXQ0IasExUenWkpiR42j
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072955_288152_A0CE3381 
X-CRM114-Status: GOOD (  13.36  )
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


