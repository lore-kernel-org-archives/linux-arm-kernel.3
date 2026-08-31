Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17CAC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54UdIJE+Sg5ieJ87p6AzFA6ZHammhS3SqsQJJruqOd0=; b=qUAKdLeafo/+YKU3yFg7yBiUf7
	1oQU20TPyz3oq2aXluEKVg7q4ptNC8faS9GVgUG5s7DxEHsO0vmImgEHVRM11oc6P67HwyFuoNiAd
	YsPiXzSJV3OSDOC8cjrd7oM4a5dWnyAPUl17JnVF8tIMNuyIyZE+WfJH97l4dFMBOSbU4GErnkldk
	WCzeC0N3nxqmsPLK6EQeY7Nt8AmmJlmwr/FL8OKexI8IMyLJfMAzaxRxIfe9Pm3xXA2zTsRNxH2Qo
	tYaIHlcFbyzIofqUOdCvYGiwpgyHlGKhROqX2PoAI3r/m15b8/1Qt0YyQP0PLLjXlgQWt6zsTCpcV
	7aQ2P8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Tj-00000009L4c-0oCs;
	Mon, 31 Aug 2026 12:51:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Tf-00000009L2k-42zL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:51:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso35767125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180666; x=1788785466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54UdIJE+Sg5ieJ87p6AzFA6ZHammhS3SqsQJJruqOd0=;
        b=QIxrNtbY9DJC6AyOq/l1RrJy8Ffo7Dyx3q0kZr7nu+OLoxPhs6x3R6XHAK5wyy+T7Q
         Z/fVLh64iQW1jXmi2OQJYiTIwhfMwtWpriukXrXacr7NeZsrDBnq/Ra/CqeT/Ul0GkjC
         UbWC4h2kOdsYRJ1otr3GtgjYMirfxb2A5YXOBJVTmvJ1iXzpLOgHkR1ugotBUM00NWmE
         yq/6nIfZUnA5v5ApWOWYpSZzv8f285+ruddkMq80GRBMkTuY6QqnVk3NQUyiS8VcVso8
         Jd5yOMZURLJQYTWKdUHoS7j4/DsyjCZGMf15wslsCEnIuLXGVUmAdMWuKqwGv1RgkFuL
         Yvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180666; x=1788785466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54UdIJE+Sg5ieJ87p6AzFA6ZHammhS3SqsQJJruqOd0=;
        b=RGDJzWsCCsB0xzuiwiui96EdP6Ipbl3DOHQHfNHbC+Y4OvD8k9kEMQlLnGan4IpPDM
         KUDzzSv9hK4DaR6fmHYvR8zEdYl7XMWnYm6J4wWE+Q1DEAOL4YRcYzT2qkpFxlh5G7bD
         D8XFjgZn9D2NQnDWgn4FhQ3soS1ThlqCT6V097FdvY5W/Q2cAHzA/GMCQG7gf/OvwCsA
         YgsfCMxILXbBS3LBQCrw3PTkIuT7ZHP44fq0lnNENHjylSDV2KvqXGoxdLFNzwUZKb31
         eVJ5srqhNwUkfgt7OCt/RQZbWdd8URl03VqJVhHsAc3yHep4BDtlpPhHga6zZaqDVMNF
         UUgg==
X-Forwarded-Encrypted: i=1; AHgh+RpeEc4lhJfDAEeTtAbHZiA15OYOMOFd5nc4BycsXDbf8at6iBUmeWoIXTndTV2AXCmcMkXaA0tiFs/3Wg0j+1ck@lists.infradead.org
X-Gm-Message-State: AFuF++nhkIvTwdmeFXpfYeclK+jz+zgXRTJxOczZUWBVhlb2qVMoL2dX
	25pPwglApaaQvBx1ECgx3CV6ZYtm/x+UsPFeEpmObwajINmFmHk5WNZP
X-Gm-Gg: AR+sD10KBA9+OsCGbYNQnrLXq+L/K1s3itzxOwUg9CgzBo62y3Rdk1hJ1+VNxercFO5
	Qo2vaNRBTMXo9UP+jkwjN33nwIGNezRBQU2WUjiLQx+iQ07Ya9Rr/UT3gP7a/QwoDnYKkr2nPl/
	AFbr+HARGGtdFWY0HEWV9lvRQvl/whUdQF61NXWjk2fznyvkamRkdDEKtre4nfcym7qULw7GjkB
	KjMvWOGPreC8G+2RBdJvSNHeY1BzuBTx3Q7VcAV9E5b4JJRSDshIUepxYBDfyzKq0a4AYpMfcJY
	JfgPtTTerbqLkjACRD6OfVDoAcRo9fbb+tqWtBslEh1Wx1IzEGSzvaF7msPy2++Nj5etvp/K7wQ
	Wyzgk8UiXT9qE+a3M5/umFNYw6fboSMXtEq50vGmv1AiHLVN0Ynci3PHxmHexHVUDcTvhXBkKYj
	hzbZ4zpiq9w+l7dUxZ0EV+4VsnwRrFNDsAXQ8qNork8imX/oHitO9PkQtmtDmv8C2ifa7S2VnVi
	owones4LczFKsZEJtM69jL1rHJ79vXIYywS
X-Received: by 2002:a05:600d:8497:10b0:49c:dc11:2b62 with SMTP id 5b1f17b1804b1-49cdc112ba2mr13037255e9.7.1788180666180;
        Mon, 31 Aug 2026 05:51:06 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:51:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v7 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard support
Date: Mon, 31 Aug 2026 14:50:25 +0200
Message-ID: <d1730ce19aa71d26e59a8ca9e383b0582906b43e.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788180142.git.stefano.r@variscite.com>
References: <cover.1788180142.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_055108_075644_C804AFA2 
X-CRM114-Status: GOOD (  17.91  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite MX7CustomBoard carrier board
with the VAR-SOM-MX7 system on module.

This includes supported board configurations for both VAR-SOM-MX7
hardware revisions, with eMMC and NAND variants, and WM8731 variants
for the first hardware revision.

Also add the resulting DTBs to the i.MX7D device tree Makefile.

Link: https://www.variscite.com/carrier-boards/var-mx7customboard/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi

v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed model names

 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++++
 .../imx/imx7d-var-som-emmc-mx7customboard.dts | 23 ++++++++++++++++++
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts | 23 ++++++++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts | 23 ++++++++++++++++++
 ...x7d-var-som-nand-wm8731-mx7customboard.dts | 23 ++++++++++++++++++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  | 24 +++++++++++++++++++
 .../imx7d-var-som-v2-nand-mx7customboard.dts  | 24 +++++++++++++++++++
 7 files changed, 146 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..37da667f9ffb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -444,6 +444,12 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-sdb-reva.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7d-smegw01.dtb \
+	imx7d-var-som-emmc-mx7customboard.dtb \
+	imx7d-var-som-emmc-wm8731-mx7customboard.dtb \
+	imx7d-var-som-nand-mx7customboard.dtb \
+	imx7d-var-som-nand-wm8731-mx7customboard.dtb \
+	imx7d-var-som-v2-emmc-mx7customboard.dtb \
+	imx7d-var-som-v2-nand-mx7customboard.dtb \
 	imx7d-zii-rmu2.dtb \
 	imx7d-zii-rpu2.dtb \
 	imx7s-colibri-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..594ee2d2d23a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..94c4b1fa5d6c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
new file mode 100644
index 000000000000..d3fbf3b4b5a3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..603b2dbf4c8e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..1c419251bedd
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-emmc-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
new file mode 100644
index 000000000000..68569111f3a3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-nand-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
-- 
2.47.3


