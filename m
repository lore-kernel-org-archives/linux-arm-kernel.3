Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4422DD3B7DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk1cUWmBl5XhhK+g/p4690RHmYDgOIsh6ZzYZ8NiuW0=; b=vdlbKWg926k/Fyfre3GyzAt3tV
	MMKo4+Oo9iBmqqj2XJt80ciBn3ngf21NK6gqxC4QwDb6/CatYmRgL4upo57SnYOP4veKMfO6BCEbQ
	FwBuuKdWseA5yoIddyuvdTUVWwjIg+0XLOoBtxtPNXhoS7ktnrgnnA1Q57M7xKSujgEQYbYtaAJp7
	wPBeUg1NEtt4pKysOeMSzzipnaNsNLEpjcmy5tns11CvGgGCSFpDk3UO59LeY1KgC/R54OClX/Cnq
	LElSb4uiOSoexBxdjLt0Nn0/YaG/wY1gwjXt62d3VZ4zFwrRFSKF4aHrOVWXCzSUOixxdtioMFFX0
	wEs74yUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkS-0000000ClXa-0Ndy;
	Mon, 08 Dec 2025 07:33:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkP-0000000ClUI-0T4n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 07:33:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so7230479b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 23:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765179208; x=1765784008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk1cUWmBl5XhhK+g/p4690RHmYDgOIsh6ZzYZ8NiuW0=;
        b=GsQHnBa0xM1dRwTgMiqCUsw361YT6PxFHgVV9cEjCOw8rMTevJkQVrHoApc2QJyKvz
         hqwK8Oe4dKreGrbQts/ujd8KEhBd87SAQ5aROyMDKIUH8uEaN6XqBEVMjnyJIHIkCuvK
         qeRT3WAzqCq+2CDMdsfPnMjDGjAyQx1xXRqf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179208; x=1765784008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yk1cUWmBl5XhhK+g/p4690RHmYDgOIsh6ZzYZ8NiuW0=;
        b=Bzv+hvG0BwKIW6cqqbnYNaUQbZQR5MPp348AI9cHQW08T82RjkkoNjXj4v135JDpBv
         iyc90pzQiq5l45RhVR12Dc+LIkgO3Bj3TsvPLHrRzun//S2wf2l1wOAoDbaKvUbE1AHf
         8G5UCEiz74Se1VVb8HFs6QxwaTaPFjvdjsmQvCEaf723ImFr0dpUV21ZIkcvAGar5Q4d
         uvAUXve2TD4Av0av7Dd90svCngbqKGTE8fY43cDGSIdmEa1JQIDQ52D1eLQDJVkEnA4Q
         1eLI+YEDRS3GG6fFBx0c5/RzK7bkCXM8CQx8yOHBYije0aETzgAX2mf577QJoOJv+Vrb
         Nj9w==
X-Forwarded-Encrypted: i=1; AJvYcCWj9JeMXbHstvWLlV2dBRj+TtX3EusN+DiFwj/bd0HukA0Vr3MitAhNqULBerkC1WKByVGq2H7UD1QuEA4uywYO@lists.infradead.org
X-Gm-Message-State: AOJu0YwsygA3dhk7r7lQwE7seOKqSm394YR0uBrZF+Yzy0pA4TSViAfy
	tAy6L0BeupDU/sfwArfY1AdjRxfEkI/sfnnAspTxE2fjgLY0PYb0i5k22GjXfoIN6w==
X-Gm-Gg: ASbGncv3zJheo8PGDyLRE6lQMV6JwXDoOE2QMdbEsniw2DReSj4mrDDqGg7uE52KvUX
	RGavXAFYSx6jbsDn6JeYiM6NyeFYxUSs+EsoVRdd20aJEyOzAwp83X8IJP4slzplSRoVbEVgpWr
	edGBpwggh/SxVn87VBju0tHR/sGGLtJMbxo9IrhLNDkOI4/BSp8mn1EH6w+ywzSunAQ7sYwQYD4
	0P1Eu8digD4iWnnvzZDq9eN18CN7yjAe+bdHSMJmgYChsnDTYVMmhZQ0avoC552BWmhHcwOIj4z
	04l3swfa0t6PeZibkVVeUMtgKCaccBGSIk/o8rClRpwJP9udzLKnuozpebkNlINclH41/Ua/2dr
	aaXmgZzpQtw6UrBxuwzGGiDnY73z7H7gm+HrEUaYOXpbdjL4BWo0ZtIFbep5OBTJxSK1zKV3x0M
	3VhH8yx8c1HG1k3Y2OHkC8q9wipSn94pNc4ydQK9eeWyhGBQQiPhjaLQvBGt4EkDj8rIwm
X-Google-Smtp-Source: AGHT+IH03+VWpfw72JOyBUA2/6zHYSF0GZ6M4iF47ZhbShTJYVZdsObM/Okmg4+ncXpzCQ/1sI3Tkw==
X-Received: by 2002:a05:6a00:a8e:b0:7b7:8aad:99cc with SMTP id d2e1a72fcca58-7e8c0ad15ecmr6144301b3a.3.1765179208186;
        Sun, 07 Dec 2025 23:33:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d31e:c84f:5cc1:d554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12127686b3a.20.2025.12.07.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:33:27 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] [EXAMPLE] arm64: dts: mediatek: ciri: Drop SKU-specific overlays
Date: Mon,  8 Dec 2025 15:33:04 +0800
Message-ID: <20251208073306.75279-4-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208073306.75279-1-wenst@chromium.org>
References: <20251208073306.75279-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_233329_182270_2CED7609 
X-CRM114-Status: GOOD (  19.82  )
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

The final SKU-specific overlays only set the top level board compatible
and model, but add nothing else. The specifics are not super important
to the kernel, and could be removed so we don't have to have so many
source files.

However, the ChromeOS bootloader (coreboot / depthcharge) selects the
device tree blob to load basd on the compatible string, so the mapping
from a SKU-specific compatible to a DTB (or a series of DTB/DTBOs) needs
to be maintained somewhere to build the FIT image.

Move the SKU-specific top level compatible strings to a separate file
stored with the device tree sources, and drop the SKU specific files.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
This is meant to serve as an example for dropping SKU-specific files
that just have specific identifiers that the kernel doesn't care about,
i.e. doesn't need to be present in the DTB itself, but need to be
preserved for other purposes.
---
 arch/arm64/boot/dts/mediatek/Makefile         | 24 +++------
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku6.dtso | 11 ----
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dtso | 11 ----
 arch/arm64/boot/dts/mediatek/mt8188.yaml      | 51 +++++++++++++++++++
 10 files changed, 59 insertions(+), 104 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.yaml

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 39a844386366..5123d15c62c1 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -89,36 +89,28 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 
 mt8188-geralt-ciri-sku0-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku0.dtbo
+				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo
 mt8188-geralt-ciri-sku1-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-max98390-es8326.dtbo \
-				mt8188-geralt-ciri-sku1.dtbo
+				mt8188-geralt-ciri-audio-max98390-es8326.dtbo
 mt8188-geralt-ciri-sku2-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-max98390-es8326.dtbo \
-				mt8188-geralt-ciri-sku2.dtbo
+				mt8188-geralt-ciri-audio-max98390-es8326.dtbo
 mt8188-geralt-ciri-sku3-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku3.dtbo
+				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo
 mt8188-geralt-ciri-sku4-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku4.dtbo
+				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo
 mt8188-geralt-ciri-sku5-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo \
-				mt8188-geralt-ciri-sku5.dtbo
+				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo
 mt8188-geralt-ciri-sku6-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-boe.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo \
-				mt8188-geralt-ciri-sku6.dtbo
+				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo
 mt8188-geralt-ciri-sku7-dtbs := mt8188-geralt-ciri.dtb \
 				mt8188-geralt-ciri-panel-ivo.dtbo \
-				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo \
-				mt8188-geralt-ciri-sku7.dtbo
+				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo
 
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
deleted file mode 100644
index 884a7b2d943c..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2023 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku0 board";
-	compatible = "google,ciri-sku0", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
deleted file mode 100644
index d3ed6ea535d7..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2023 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku1 board";
-	compatible = "google,ciri-sku1", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
deleted file mode 100644
index 3f9d38bc2ad2..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku2 board";
-	compatible = "google,ciri-sku2", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
deleted file mode 100644
index e6a6f8f06141..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku3 board";
-	compatible = "google,ciri-sku3", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
deleted file mode 100644
index ee5b28c4ef00..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku4 board (rev4)";
-	compatible = "google,ciri-sku4", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
deleted file mode 100644
index ccf8d2f0eb70..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku5 board (rev4)";
-	compatible = "google,ciri-sku5", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
deleted file mode 100644
index 773c702b59d8..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku6 board (rev4)";
-	compatible = "google,ciri-sku6", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
deleted file mode 100644
index c22860eab9f8..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-/plugin/;
-
-&{/} {
-	model = "Google Ciri sku7 board (rev4)";
-	compatible = "google,ciri-sku7", "google,ciri", "mediatek,mt8188";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.yaml b/arch/arm64/boot/dts/mediatek/mt8188.yaml
new file mode 100644
index 000000000000..7808ae20060f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+%YAML 1.2
+---
+- dtb: mt8188-geralt-ciri-sku0.dtb
+  description: Google Ciri board SKU0
+  compatibles:
+    - google,ciri-sku0
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku1.dtb
+  description: Google Ciri board SKU1
+  compatibles:
+    - google,ciri-sku1
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku2.dtb
+  description: Google Ciri board SKU2
+  compatibles:
+    - google,ciri-sku2
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku3.dtb
+  description: Google Ciri board SKU3
+  compatibles:
+    - google,ciri-sku3
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku4.dtb
+  description: Google Ciri board SKU4
+  compatibles:
+    - google,ciri-sku4
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku5.dtb
+  description: Google Ciri board SKU5
+  compatibles:
+    - google,ciri-sku5
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku6.dtb
+  description: Google Ciri board SKU6
+  compatibles:
+    - google,ciri-sku6
+    - google,ciri
+    - mediatek,mt8188
+- dtb: mt8188-geralt-ciri-sku7.dtb
+  description: Google Ciri board SKU7
+  compatibles:
+    - google,ciri-sku7
+    - google,ciri
+    - mediatek,mt8188
-- 
2.52.0.223.gf5cc29aaa4-goog


