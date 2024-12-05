Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97894E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR2xJ5Z9SsCGNBcYWItEbZKibtJD439Z5G3+KUVhGYw=; b=LEXpMmtJZp5aBg6dKoLGJtYjx7
	5h2vHjSVNjrR3awRXa1HMgI5yJ50a6tqvauLBI+MVUjQzZhKYtp0AKhUsNE1YmiFA+mGa3ANItrV7
	PJM8MGSKMuAUMhtz3aEiPNjOYUhtoXf8A600UNEoeyDh1Mxq/kA5AN0LqGaSmkFQQ3r6OpDzOkHdK
	Z+BK+O9HuDp1Q78KlJ/BxxuJcpnWkGo96lLV/VrdmGYqRj48/HPvQ6a799XvOgp/29Imlv/TM+2dG
	Rm0Hj2dXco80U8o1NGUDmCv0bXzWle9vORVf3hsoeyojSenmGLJrvr0PYZZr8L+U2omLFrblzkhGO
	6wzGG+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG4x-0000000H233-3N3s;
	Thu, 05 Dec 2024 17:55:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG2x-0000000H1a8-0Fmo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:53:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4349fb56260so8610525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421229; x=1734026029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR2xJ5Z9SsCGNBcYWItEbZKibtJD439Z5G3+KUVhGYw=;
        b=v2VUsXj+qmlBDdIaetsWUed+62bPMKHKIv7g36Tu7y2yavAOHYWCuLSW2ZtnTCN4pl
         aZDX3xXFFNmyx4asZPMlGtS6Ek7x+584qQ9fFNXcuFVZ0WUxth5LuwZVd0YsUXicEX0c
         gc2jDuFMS7Zi5SoUqajBA4NOma403V4Ckffembg/cjHD7zE059KgM69rGYHRxi/1jRiA
         YJHirvgkv39D50W7DxijLJfOo8P8j1wOAKjF2FOfDO7C0jEmkez5k8sK937gJd8meVmo
         6Jk9TxVyK0ZDwuCOL5pLCY0K+oiywQv8LPu3WtyAOTrRvuk/b0GXtB93bti3/+2EGLSN
         ySaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421229; x=1734026029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR2xJ5Z9SsCGNBcYWItEbZKibtJD439Z5G3+KUVhGYw=;
        b=HcKundMOb5YJFXimSbUY8t3c55omH8cifM0S8ubL52ruWVAX3x/MsNFr/N0aFiUuoZ
         AF6UtK7Jj2tDyY7laM6qOKC7JJNqJw4R6+fzzu3FwbxYwa+QtavamB1jQR4yoI1KZ2Wh
         qK5/3envrhpaYNL7x5mKqseeBR/MpJRdGJiqiLesS0qI25hZglPIBferF7rY8fZx3vOa
         NxMWnPJ5o52UV2dQ/C4kBYGwuh2KrPoE2v0rs1cEJ6XLR4qySDvMx3NnMf9iyZeaQ/F2
         DZ6sb7jLCUcAeoaqN+q9Rd9sqkDKj/W5SzeBkxyzFittFOqxRfgYis20zlRi+lZm5RbH
         1zFg==
X-Forwarded-Encrypted: i=1; AJvYcCWUpLzsrUe6OvfQDM+8ejj+uPbqkuDt8zazchoYwnFUolbdcG8N/FK/XQwl2xxOgdDI4fOd6SJnsRY4awU4UHdX@lists.infradead.org
X-Gm-Message-State: AOJu0YwF9bxey9yT+4lHO/XkgosWFXACffb6z5lBFO6duEOoqcb7HrKq
	bQIdxHv8WUUxHR5ltFCqXRSisqIrs1ZW6wiisiak4zLI0hhgWQsXpwz7bbhN6vs=
X-Gm-Gg: ASbGncsu1nAbQngmdBH+C5p43MVwz12UtrvwsEBHieMsLQV+jzKXCmQ3rGAypkTeNdC
	VSkFeNbRAH1KL7Baf8Tu20VBzD3Y8LUlZJPTwrshyen6XMOdtJzLu9cerkvsOcCE6Urh/f7daKz
	Mbqw/YHgQ8fQI52VtD5INnul40OBFoFQemFYC8W0460H2FHNCu/l/yw1Yl8r9gls9oGG+6MoyPg
	FAwZdlyGbESDdU3HJqT9KmwDs8ksh/g/NrnErF5s4hBKMTP0zxkBV94WG/jt+ft84NCRuz3Rg9y
	PnQhr5EmPGWUg3V9qi9Y2rZ6IdG5q+GQ
X-Google-Smtp-Source: AGHT+IGglrekvKKTqqsY8LE2N+RmZaoeHCt9yP48Sso0w5nnfmLh8mPNzUHKoOLK/L5/37jluV81wQ==
X-Received: by 2002:a05:600c:1d21:b0:434:9cc4:5139 with SMTP id 5b1f17b1804b1-434ddeb0492mr2236875e9.17.1733421229341;
        Thu, 05 Dec 2024 09:53:49 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: firmware: add samsung,exynos-acpm-ipc bindings
Date: Thu,  5 Dec 2024 17:53:43 +0000
Message-ID: <20241205175345.201595-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205175345.201595-1-tudor.ambarus@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_095351_096322_3FD22A3A 
X-CRM114-Status: GOOD (  14.41  )
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

Add bindings for the samsung exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../firmware/samsung,exynos-acpm-ipc.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml

diff --git a/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
new file mode 100644
index 000000000000..bfc9b4af9ea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/samsung,exynos-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung exynos ACPM mailbox protocol
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
+  $nodename:
+    const: acpm_ipc
+
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    description:
+      List of phandle and mailbox channel specifiers.
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+  initdata-base:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Base address of the configuration data in the shared memory.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+  - initdata-base
+
+examples:
+  - |
+    firmware {
+        acpm_ipc: acpm_ipc {
+            compatible = "google,gs101-acpm-ipc";
+            mboxes = <&ap2apm_mailbox 0>;
+            shmem = <&apm_sram>;
+            initdata-base = <0xa000>;
+        };
+    };
-- 
2.47.0.338.g60cca15819-goog


