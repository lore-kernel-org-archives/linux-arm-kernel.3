Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44571C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brGJ0++22o4t57ItnfNx9mwtlw0zh9uLExgnV00v8+M=; b=Qm2m6NviMW1xbquVpwwVRkHLTb
	z4sEFLgoD+Kb/ssOx9XLIrhs2JqU6XcODIIINw6mLJwBo12MFdqlGIkv9RzipNJJQEl7E/Qg7CdG4
	iBx3pfIQ7MF6lT61aPcXl2eRhgz86VBf5kiPjIR8Jy+pMrnrSC4mBynf2ciJ6k1napJyCcJy9xcm8
	JwDcqDaYH3Of17H/QjJKPjgC4132bfZOyi7xDIL65+XgFxxfAG4w/8JIPqWCuC3BtGgsFTDGJ4THX
	Zr93IWjM2iP4sHQzng2Q96kYjsYymxO6xzneEODRTx1LcX/IWmuxSdQ7wReaCDayqNgRyccmsZHA6
	vhgQmlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUrC-0000000Dqqg-1McN;
	Fri, 07 Mar 2025 10:23:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUmW-0000000DpVL-2mQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:18:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so13810755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342695; x=1741947495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brGJ0++22o4t57ItnfNx9mwtlw0zh9uLExgnV00v8+M=;
        b=RGMRcTt9OfW1XG/GDtAObq22JzlLkIZXh3ohYTZL9E7c2w2PL3d5tL1UjxoaYrqu9M
         peK54LmEuVsIB0fLFrkvoOOoWyz+1bXDDvDvHfpct3KSgwdbtebMzKk2HZUhLK/ynwrw
         6iXdyQYh7RdmbI/wRgQRRE8pv+q34tW2pqS8dwGREy5HyKbus/znRATvWvwPTnr1x6G7
         wB8ouou0LrSe6+j/OASn6j+ITAL0hYLO1rQ9iAV+XLAe6lIgdOS1+rKXRjNjv1/Kc7xz
         vfwUiIL+4ehbj4Tur8ZgFY7Bi2wmbJCRsMgslmMGL3i+2VmtsingIxcX7d3EdZFhxwW1
         vO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342695; x=1741947495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brGJ0++22o4t57ItnfNx9mwtlw0zh9uLExgnV00v8+M=;
        b=RS5fhSV0XmdmsjQhbzqZuDbXghPDLYQOI3MkLDeTtmliNMVonFknsYndWMXqUvfOBk
         ypar2AonN4dYbVScg0gzT6Z8D4d1pLOuuO9if5R7jhExLJsobiuHo9fxMlYyr4wngAhs
         shsYt5OdtQPUBkI5K3GUuKFYSGe0lrJ53CweSVEENJKdPKu/Wlutb9FQQg9X+Ihw+pOp
         73MJA7jTch3VHVOi0EWlFRRqSNlEu0MPj0Jp/L2ijkpWllM5C/95IOaRrsBOutk9byZO
         sjl+jrZy/D6T5/m2/RnFcnD7gEU4NBD5aye7KlvBUkqUpIKijxHsg4uzwA81gfEgubWV
         IzXw==
X-Forwarded-Encrypted: i=1; AJvYcCX2uptA77ZLc55W3DbCpySxHx5I8ykZPH3TgiUiPsWinYBAQuByn5YFOzPRvG+obSaO8QFzn4vVGbOgaOEDRoGa@lists.infradead.org
X-Gm-Message-State: AOJu0YzJw7vQ4FhMdvKnInHZUYohBLHFihavpzD05CPU3A+AlaH7pwEv
	dMVcwL7Ii7zd8OOvtNuUtowTGcFFlb4ffojMIAS2Do5PKA9sxG85
X-Gm-Gg: ASbGnctdzYHbDgbvaZdf+2iuLpJ9zxw2zF1KY2p9JSkILWY4fEH7Y7hPfV2qN/zjA1U
	hrGDgzZvH7ojXb1mIbUHBSbQMm+Mzajj85UMf2UMLGgaw88so5DDMh7XmUMTBBGb4XyR9Kl1EVi
	Y4wQwnxblKhuK6lGs9AXOGq5PZ1o+/6WRrrNrvVNziF8vf6zYJAwCSTb8GbBfD6dL1qtST+TIHi
	wsx6CvBpj9ZNNYDqjP1XCHHihzaPZYE2qEUcbjVSpTyffTV9h5hdkULo0r0Eqz+xgJtD1NU5nfS
	klPCJgfv9QMGq3XvoPqGbb9z1eE5Hf6Jx862Dvv7lNykkvU9lYbYPCW0v3c7lV6LEguDK+kUtWw
	JSf24YXVqScyEV16CIaG1gDw=
X-Google-Smtp-Source: AGHT+IE9lUI6KVxoDMo3xKo5g7N1PqJTOlIV+7j66eLIltbvNUJfTvQ7+Yxsj8nXHgBmQ0fwpI6xkA==
X-Received: by 2002:a5d:648b:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-39132d1fc83mr1434684f8f.17.1741342694709;
        Fri, 07 Mar 2025 02:18:14 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm4900262f8f.94.2025.03.07.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:18:14 -0800 (PST)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Fri,  7 Mar 2025 11:17:49 +0100
Message-ID: <20250307101758.27943-3-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
References: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_021816_710128_9C6D6B48 
X-CRM114-Status: GOOD (  17.68  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
which is EOL, with the TLA2024 ADC and AD7879 touch controller.

Accurately describe the new hardware.

v1.1 of these SoMs is still described by the following DTSI files:
imx6qdl-apalis.dtsi
imx6qdl-colibri.dtsi

v1.2 is now supported by a DTSI that modifies v1.1:
imx6qdl-apalis-v1.2.dtsi
imx6qdl-colibri-v1.2.dtsi

For each carrier board using these modules, a new DTS file was added
that includes the v1.1 DTS and modifies it with this v1.2 DTSI.

The original DTS can be used for modules up to and including v1.1.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: Fixed the "From" field
v1: https://lore.kernel.org/all/20250227170556.589668-3-ernest.vanhoecke@toradex.com/
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
 .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
 .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
 12 files changed, 222 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 39a153536d2a..81b6a96e28da 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -69,6 +69,10 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-eval-v3.dtb \
 	imx6dl-colibri-iris.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
@@ -158,6 +162,11 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
new file mode 100644
index 000000000000..44c78c07f431
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-aster.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Aster Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
new file mode 100644
index 000000000000..93fd0af53a3c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-eval-v3.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Evaluation Board V3";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
new file mode 100644
index 000000000000..92d41fc9a13f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-iris-v2.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Iris V2 Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
new file mode 100644
index 000000000000..c8957948c887
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-iris.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Iris Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
new file mode 100644
index 000000000000..908dab57fd87
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-eval-v1.2.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Apalis Evaluation Board v1.2";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
new file mode 100644
index 000000000000..5463d4127382
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-eval.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Apalis Evaluation Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
new file mode 100644
index 000000000000..84eabf81ba84
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-ixora-v1.1.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Ixora Carrier Board V1.1";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
new file mode 100644
index 000000000000..d7cfab4de457
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-ixora-v1.2.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Ixora Carrier Board V1.2";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
new file mode 100644
index 000000000000..189b074e31ce
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-ixora.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Ixora Carrier Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
new file mode 100644
index 000000000000..83fa04fc9f18
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+&i2c2 {
+	/delete-node/ stmpe811@41;
+
+	ad7879_ts: touchscreen@2c {
+		compatible = "adi,ad7879-1";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch_int>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio4>;
+		touchscreen-max-pressure = <4096>;
+		adi,resistance-plate-x = <120>;
+		adi,first-conversion-delay = /bits/ 8 <3>;
+		adi,acquisition-time = /bits/ 8 <1>;
+		adi,median-filter-size = /bits/ 8 <2>;
+		adi,averaging = /bits/ 8 <1>;
+		adi,conversion-interval = /bits/ 8 <255>;
+	};
+
+	tla2024_adc: adc@49 {
+		compatible = "ti,tla2024";
+		reg = <0x49>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Apalis AN1_ADC0 */
+		channel@4 {
+			reg = <4>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Apalis AN1_ADC1 */
+		channel@5 {
+			reg = <5>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Apalis AN1_ADC2 */
+		channel@6 {
+			reg = <6>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Apalis AN1_TSWIP_ADC3 */
+		channel@7 {
+			reg = <7>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
new file mode 100644
index 000000000000..d11bf911b728
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+&i2c2 {
+	/delete-node/ stmpe811@41;
+
+	ad7879_ts: touchscreen@2c {
+		compatible = "adi,ad7879-1";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch_int>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio6>;
+		touchscreen-max-pressure = <4096>;
+		adi,resistance-plate-x = <120>;
+		adi,first-conversion-delay = /bits/ 8 <3>;
+		adi,acquisition-time = /bits/ 8 <1>;
+		adi,median-filter-size = /bits/ 8 <2>;
+		adi,averaging = /bits/ 8 <1>;
+		adi,conversion-interval = /bits/ 8 <255>;
+	};
+
+	tla2024_adc: adc@49 {
+		compatible = "ti,tla2024";
+		reg = <0x49>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Colibri AIN0 */
+		channel@4 {
+			reg = <4>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Colibri AIN1 */
+		channel@5 {
+			reg = <5>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Colibri AIN2 */
+		channel@6 {
+			reg = <6>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Colibri AIN3 */
+		channel@7 {
+			reg = <7>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+	};
+};
-- 
2.43.0


