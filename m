Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD93EC282C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDITHZykvJgRGx/AG29j6F4v8cMHufXuXntyHw4dwLA=; b=Vrg+U9tqsygvQBQLguH9dlCg3v
	TlWUzutUPPwVtMv3sGyBSiFdhu1htCPltbRKrn0lpVUvcKlIez/f8xEHoh+PoUa10oonZZE8ZUPSc
	rw2PVQR4AJ8jG/c+eJYCx+p5ajk7j3vb1sLjlbzmUcmnzh2mpM0GZ/ydbAuWvxdRw3tJ2fKZredME
	x1Kmfy6Kpvs46GEdpzNP5jV6ndQmrQwPhwTJfobJ8Hl25mvsLEn9BQyu+LCH8V72AeDTtzBbvbWGZ
	rPHGfkibfWaUTPA8IkRu8b9MmxkLpL5n6R0dUMQ34c6vy0noSzWdlJQ3b1pn2+ubJMPIieTjzsUEv
	TLMrl5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkX-00000008aCK-08wu;
	Thu, 27 Feb 2025 19:40:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhKw-00000008AhW-1qAV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:06:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so854120f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 09:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675973; x=1741280773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDITHZykvJgRGx/AG29j6F4v8cMHufXuXntyHw4dwLA=;
        b=BFDwrujkDQu1xwZmV4Wk2Zxe7QNk8cOmb4QjKBsrlcbES9vGDbxGsJicUIbAUFT50K
         +nqcfiglbdvVoe/Qml9V3vypD/6GJbMm7EbIID9csNs2cYZ7aj6oZpIJR/Wbc62RUocO
         PvC5DZ6MUBQy3sSUKdTt+oQRZ8vgygvd1wIqJAeerzdV/FQnWm8rnA+JwDgL7WNo1/68
         9ky8ZnYOFfjRAivjdUnfPq7BbpX8EVem7xpExeckWgLAqeMAk5l6PQ4oKlUyk371mzTP
         xZ7M9mxz9xDsI88zWLVGKxwveoNc/7RUa7wRKBzVipMhK+uQKBfH6b1lSpZ7OG10xTwP
         ggiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675973; x=1741280773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDITHZykvJgRGx/AG29j6F4v8cMHufXuXntyHw4dwLA=;
        b=FEi7BGVbN+hpT2d8yZoowWgM2kaocfUhpxW6ik10w+vD6WAURd+viL0igeNpKheIk7
         /VwmozZgXLUgPgVfm0k7CoChhMkeye0Pplo9F4E5GLM5x8crjdMdc2fkaMCd13kgszrg
         6/2etFE9hxjPbjO8ohHRhJvVsZY9CvGy/6Aa2j5/Zs2ADLfQo/9rZ+xTatkhmZgfIibo
         H9hTWhLCZGp3NdToujvCD7AUVvv4sy+u9ZmbpUrranBVk7wouAaECUCQb+00W94AvI/a
         uBTBkwhoPIcdtUVn9TeAjB4lU0aItrIQJFoOXRQIulmNG1lMC2QSSTXXdEzLU6ZtCuQA
         M3pA==
X-Forwarded-Encrypted: i=1; AJvYcCXUgonXZBDCMh8TF//zBsXMpZLjnj1G5RlGWu1XH84rBchwWmZtyT7WrXzjafoAPFwqrBgGRzguR79eqQPN+bDN@lists.infradead.org
X-Gm-Message-State: AOJu0YyGzV2fNz1NRd5pPA7WLvfU/Z1gs52/sm2AhyYJpX/8mdEUoy1L
	UnxFJwbS+JzRGQRArCVDLy5MWhWTZzna5PaD8PNsgtnKhVJ+SZolWWDGYjny
X-Gm-Gg: ASbGncvniInUzN6jFmAydW/cvIyKKBJmxMuL1GJtutRLiFnUu9XvGnOJokjanyaO5Um
	iKUhw+IZeedB0jC9XSR/QQerRl/hWfKXb5SyeIS8pWJzNNn2fpm2sRhMWzcYim1RLzZ3zGAtjvG
	2Ur2ENtnuq4nAfBkWsCJBfnbDyz0yG4L680yEgluQjPVryYT5zvqfm9rxbZj1Oj7aHH9NjMCcBS
	jZyUdqyWgc72J7OdWMx6Tta+y512b6O0CrTr1jLgn+sNgvZin1q0gNz6QV34ZC9myMTNLTZGNff
	QSTKaA9/mkqm18aEsPq0MH6gu4i2Aw87p5WG/6pkZ5e8CfJ3/TC1BAUPzN33fZlPDUQfe7q9HP2
	bdo0k
X-Google-Smtp-Source: AGHT+IHP18MKChfeAp7UDygXb3/Zzoe0rSxaWJhwSK8PncRr8rL+G2mA/AWIG8esd4/iEPPoh//NZQ==
X-Received: by 2002:a5d:64e8:0:b0:390:ea4b:ea9 with SMTP id ffacd0b85a97d-390ea4b18afmr1317093f8f.39.1740675972395;
        Thu, 27 Feb 2025 09:06:12 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2613138f8f.93.2025.02.27.09.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:06:12 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Thu, 27 Feb 2025 18:04:53 +0100
Message-ID: <20250227170556.589668-3-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090614_486059_AF0F2E79 
X-CRM114-Status: GOOD (  17.89  )
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


