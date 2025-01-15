Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE20C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5pQlUERu30P4Ba0NRUoDkbhX6SQEcjoIl1O/J3MOl8=; b=f2w4JcgpjTnj4QgPvtPgSsHUG8
	fnsfdFBic/vgptJiQMLuQMG7vnJMtlo5HUKIHEBWsTZNzg1yMJ1+VoFXZ922ofnnD94MxwXL00ECf
	xpTb9eRmpMyNuSFdu+AbuDwFiCtBVRGDhM7IRni9PNkzIxVPWf62xPeJa7Z1xRKrwIG1pvGfFiVcs
	c+HYw0vm1uZB46T0N6cgtdkKcoPUT3Dnb0MM52Z1M79asfo8rokmTIzVQVrWkF3sQMxrkkVtDQiop
	tFfAECHHp5DMxR6w8TV0WsoObRZmvRrHWILbmS5aI64xQiOQMs7i882zNEwaT6rlpJVPqec1o2L14
	OQDd23Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY65O-0000000CPZ1-30GR;
	Wed, 15 Jan 2025 16:17:42 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5z9-0000000COA1-0chf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:11:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so986886066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957473; x=1737562273; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5pQlUERu30P4Ba0NRUoDkbhX6SQEcjoIl1O/J3MOl8=;
        b=rqi0JgD3r0QHPSvpAxyF6Wpn4ptt+q5wNkKHA4kuPskshE3Xr/SVXXPprjUOICKFEC
         waocGuR2oFG6C4rcgm/T2ByBy4SPdES+dZzEpvero7+xv1WZ851g2A0bozCiQM3GGSaj
         iOBhryEV3FWA6nFUAZX5sooLDRQGI0gXNKKsBbP6Wf+zi4Xn3UZvAjbev4i7z70iyr0k
         rx02XWmTd6wpvXq8wtoD4SBCWq6P9XaIO4Bx2/J8y599P0ac95IyfpzjxByFRI9Z5mWm
         ku8XdrhISyP4GBsa5zlc6BtFGkNlzhk3IDtMDIyLh1D80Xo1AFhZpQq9k71zapdM/+aE
         HJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957473; x=1737562273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5pQlUERu30P4Ba0NRUoDkbhX6SQEcjoIl1O/J3MOl8=;
        b=kl92lYBKb8ZKpD44Yo40BMInLsPkzHUx+pt+sExc/Swp+4/6B5mJtLuTpjV7VCryIK
         TIBcYpjNvgy4b1uwvv8SGRa2YYicmioNWOeDPhEDUD/a9iAB6LOIFajGQ8z7lkKiQfiC
         s8q5N5cPO9h2xBp6mhZQcXjwfcvCcZ2xBJ0e5woo4XOohJkzBAQm+WBjAuz+NnIowOEQ
         b87x7Ir64U8+0NYIYyR4ikvVwwOvQa2hfRvME1a9A98AfuTOEMBOQNAfEBfLAv52bgji
         P+TJZKVNbRaFP9oA4S8PypEFH+qc15GA+w8gzmIOFO6AqkVJZ3bIeO945/NweIGFDUnc
         iE4w==
X-Forwarded-Encrypted: i=1; AJvYcCWFWeua+qpTvdn+brEoL/LZix46piNc442vNm5nWMj4xAPYQrLcv2Bz8V/QhDEp3rTDFuu4l0BnxxNkPfxslxz7@lists.infradead.org
X-Gm-Message-State: AOJu0YygBQYvkWai7DkrOsF2X18DcRoBht2U1oE0h9ItzOL6S8kj2gEy
	Kv8DcMk787L4C9SbP8iu8VkysbR5bOdFf/E0TGw8nSJ2dR1LYw6AE8z9yraGMZQ=
X-Gm-Gg: ASbGncuZYoiD6DWfWrxr14Jf6z2b4YVUpwmpUhTliyF+nebV4i4NifTY16yikXssp7B
	j7ZW/zyx34gb14P/uf0i/2G+5woJ9RdZQOQYRYTlfCS3ScBY82z89GRVGz9sZQRKtyCsYUadLa8
	ZUuC6NP2FsuSAQ1yI1KEaWqFFC6SXR0ATBYpSr3K6hCC7alvRWWoRRXdzY97Q+3c4cDjwCZwxzb
	dw6OhPI1wDK6UwRcY4fQJbVkly5UTAwBHEX46as/I1dReKuZQkSptSqV7kcUwEeEgw2remQ+Ox5
	1duaZ5n1/GcmQY3zAsey0H/PLrso2ZzgEAjE72iI
X-Google-Smtp-Source: AGHT+IEk9W6AJ1Bfki9sNMYgrASoIkC8McdJI2hZtNgAUOMLE5wTU/s3opZMrauV4el0rFXtouBevg==
X-Received: by 2002:a05:6402:3489:b0:5da:1263:306c with SMTP id 4fb4d7f45d1cf-5da12633426mr4994787a12.10.1736957473227;
        Wed, 15 Jan 2025 08:11:13 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:12 +0000
Subject: [PATCH v3 4/4] arm64: dts: exynos: gs101-raven: add new board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-4-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_081115_183779_99070A50 
X-CRM114-Status: GOOD (  13.25  )
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

Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
(Oriole), this is also based around its Tensor gs101 SoC.

For now, the relevant difference here is the display resolution:
1440 x 3120 instead of 1080 x 2400.

Create a new board file to reflect this difference.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 29 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 0a6d5e1fe4ee..7385f82b03c9 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -2,3 +2,4 @@
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	gs101-oriole.dtb \
+	gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
new file mode 100644
index 000000000000..e982c87402a8
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2025 Linaro Ltd
+ */
+
+/dts-v1/;
+
+#include "gs101-pixel-common.dtsi"
+
+/ {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101";
+};
+
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+ 	status = "okay";
+};
+
+&framebuffer0 {
+	width = <1440>;
+	height = <3120>;
+	stride = <(1440 * 4)>;
+	format = "a8r8g8b8";
+	status = "okay";
+};

-- 
2.48.0.rc2.279.g1de40edade-goog


