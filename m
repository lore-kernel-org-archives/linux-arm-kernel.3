Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MefAjguMbqQ4/viHTQJIbvUgPj897M2EuwzDxdNr95o=; b=mTIYy0fjs7XOcfZVUFyv35BXrw
	o41Kynq//w+tm5UdKKLzYD1TliXJ7U1lNhcxBYexNUYyvw87I8aV2NKe+OY+RYKoDo9CYNya5e5mK
	GnRC5Wc/nB5jIozeVIO5YfLDijV24i0bK7041a0QF+0XUBVYKmqbJ2VJjLQYohKXoNQOgcFUQNRN1
	nOe17GP9BGb1TWeDS2KSNT9o1kKFinyfu/1Ux/z/2wwif3m1IEs0QhovsoltoM5bq8sJOpUSE672J
	U7aO942F9Jh6qbNRj5xKKrTlfr60FaFz7yfCHhwCreeXKS6+ITTHAkbjhoZosz2+Eg/fTwE+bTTX2
	vIdxr4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUP-00000007PqU-07FB;
	Wed, 23 Sep 2026 07:34:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUN-00000007PqH-0U6H
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 07:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MefAjguMbqQ4/viHTQJIbvUgPj897M2EuwzDxdNr95o=; b=bBg/+58BWfpRqELKA11jBr2+6v
	XbgP+nd4zXpq8yqs8LXItK+n6n4n38Q1P3FxfF7xt660ppKkUe+lwrLNfXZ2HtKODtll1E/j6P/M9
	VZJ9aM7d0yKs8zx6ZGYnKFAK7ey0RD/HHXQ4pawM2xbzYRZ++Yjie9F5UYpM+T43dunp2txNXt/GY
	mE6KyhInS9eWKd5hIkjx/htJjCMFKuPUxopUKtOv1BBBKdoMJUVBBgiSSwazv+SMMX9U/oFTr0MQi
	iOJIQVhdOYj079cJUjyU/GCwEEHXpaFdsrk3YjMa/D5DeXsif0LSMXpZDQFCaO08hEIcddxpNhbj8
	/aJNgbmg==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUJ-0000000CCvJ-2Vb5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MefAjguMbqQ4/viHTQJIbvUgPj897M2EuwzDxdNr95o=; b=KMn/hMXtPGfonS1QS5B20jknRO
	5q5v7AaLz+/jIFTFVp+vZi2xp19OVBF7sjE7Khal3U84guLs7ucgbvbDeo2A2Whh2Zsv9u4Dy1+KZ
	IfwtIVwr0yuteFNs9K3jFT/oLmcfY3ugTILr7qFSG5yW+//G66We7sWrrQMueZMtuGaZgzBnWqdeV
	j5zgtN4QKpBYRhGcvkERzUFkWKijt2YolTWDmVPUp4+4L3BMN0zCZaulCMTDU1ZUNS6iueB5Zk4r2
	d7s1u3bF+TEq9Wi2JUT3hygmNDkSf/zDZv8UP0VfvVwWxJFJshRZBB4Yt8Zo/eylaYfvT4m26fR80
	MKit3r4A==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33340 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9H2S-00000009mhH-2s1H;
	Wed, 23 Sep 2026 09:05:07 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	Yunus Bas <y.bas@phytec.de>
Subject: [PATCH 2/2] ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table
Date: Wed, 23 Sep 2026 09:05:05 +0200
Message-Id: <20260923070505.494949-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923070505.494949-1-primoz.fiser@norik.com>
References: <20260923070505.494949-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083355_725061_7EB2393B 
X-CRM114-Status: GOOD (  10.27  )
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

From: Yunus Bas <y.bas@phytec.de>

The PHYTEC phyCORE-i.MX6QDL SOM-modules are operating with a slightly
different voltage and frequency values in contrast to the generic
i.MX6Q/DL tables. The values have been adjusted to achieve the most
stable condition for the PHYTEC-modules. Introduce imx6q- and
imx6dl-phycore dtsi files with the modified power tables.

Signed-off-by: Yunus Bas <y.bas@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../nxp/imx/imx6dl-phytec-mira-rdk-nand.dts   |  2 +-
 .../nxp/imx/imx6dl-phytec-phycore-som.dtsi    | 23 ++++++
 .../nxp/imx/imx6q-phytec-mira-rdk-emmc.dts    |  2 +-
 .../nxp/imx/imx6q-phytec-mira-rdk-nand.dts    |  2 +-
 .../dts/nxp/imx/imx6q-phytec-phycore-som.dtsi | 75 +++++++++++++++++++
 5 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
index d906a7f05aaa..8ec27080ca1e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 #include "imx6dl.dtsi"
-#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6dl-phytec-phycore-som.dtsi"
 #include "imx6qdl-phytec-mira.dtsi"
 #include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
 #include "imx6qdl-phytec-mira-peb-av-02.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
new file mode 100644
index 000000000000..de85c084ac8d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 PHYTEC Messtechnik GmbH
+ * Author: Yunus Bas <y.bas@phytec.de>
+ */
+
+#include "imx6qdl-phytec-phycore-som.dtsi"
+
+&cpu0 {
+	operating-points =
+		/* kHz    uV */
+		<996000 1275000>,
+		<792000 1175000>,
+		<396000 1150000>;
+};
+
+&cpu1 {
+	operating-points =
+		/* kHz    uV */
+		<996000 1275000>,
+		<792000 1175000>,
+		<396000 1150000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts
index 322f071d972f..7d947762f3b9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 #include "imx6q.dtsi"
-#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6q-phytec-phycore-som.dtsi"
 #include "imx6qdl-phytec-mira.dtsi"
 #include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
 #include "imx6qdl-phytec-mira-peb-av-02.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts
index 3f13726c8058..afbb6681a6b5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 #include "imx6q.dtsi"
-#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6q-phytec-phycore-som.dtsi"
 #include "imx6qdl-phytec-mira.dtsi"
 #include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
 #include "imx6qdl-phytec-mira-peb-av-02.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi
new file mode 100644
index 000000000000..ebe05d764357
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 PHYTEC Messtechnik GmbH
+ * Author: Yunus Bas <y.bas@phytec.de>
+ */
+
+#include "imx6qdl-phytec-phycore-som.dtsi"
+
+&cpu0 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
+
+&cpu1 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
+
+&cpu2 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
+
+&cpu3 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
-- 
2.34.1


