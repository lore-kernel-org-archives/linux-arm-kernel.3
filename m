Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D621D3B7F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvBsVBpX3voCoAWFLFnnP9rlYFWzirgUE1dentUjJ3g=; b=pE7swoj3DS5be7CCUex/kl02ug
	WkWMGB6mSwCMs/pyyfzcRtxNTfq/Zt9kbsY6Z/Sf/vlGCuPVLS+OzaRmPWz1LTwtRqyMatXUGygoj
	ovlHKVdTkzw0CqW7VyX4+ggNVgB5+vUs3/vq1ngSQdTd9XgL7H8zFBoTG7Avh+dbaAIAzZi+ja5t6
	YBtB0po9MjijjPr4ZaiJBJPtB4rOrYdaj89x87kAkuJkTMmK1fF8zJPiZMTyRZMsIgLgU12vDY3FH
	TMYYvwZtBMnwDtJfuqYLEE9+d/hzLdS8OpON1TLdYg0vNY9UMPW2+oAJuDAAfdquZcYeJqtm3wQPQ
	fKfV3NvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUVm-00000007O8Z-1Yvh;
	Mon, 25 Nov 2024 08:32:02 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIw-00000007M70-2Lf5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UvBsVBpX3voCoAWFLFnnP9rlYFWzirgUE1dentUjJ3g=; b=CY96ymFTSe/mfKfTY5po+b/QMh
	gnJJllv/RIGVVFX5AVkyi2eNHS5ly6XvTyBjGb6wm7C5fNctJpRnH6mwgEFNI6cSdC5OVwKj5WvX4
	2nFd+5K2ozP5UfHRMgXMI6jUQGN9Z/CO1863m1vNf6lETFvbmWphJ/xjn5/YTsav7kdTFL/pqUEaq
	aJ0HcYpxTUdw3wRdnj6mxfWbUIsf2at26bdVozQGc1dap+EUMKWsO4j8Gq/NFsBnSNFg5A6kuS3L2
	SKQObTqxKdbM/vd+821m50aFg0ssn3DLBJ1zdZDdr5K76f2+rb8XVSI649bX5a4xQ9EpK5xQ9Adnb
	lyP6fjAg==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIv-00Eq70-24;
	Mon, 25 Nov 2024 09:18:45 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 13/15] arm64: dts: imx8mm-phycore-som: Add overlay for rproc
Date: Mon, 25 Nov 2024 09:18:12 +0100
Message-Id: <20241125081814.397352-14-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_001846_748918_527B6535 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

From: Dominik Haller <d.haller@phytec.de>

Adds a devicetree overlay containing reserved memory regions used
for intercore communication between A53 and M4 cores.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../dts/freescale/imx8mm-phycore-rpmsg.dtso   | 55 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 99be36a04db9..5bc083a7b778 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -125,9 +125,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
 
 imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
 imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
+imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-rpmsg.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
new file mode 100644
index 000000000000..0c61946f0cf8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+&{/} {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		m4_reserved: m4@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@b8000000 {
+			reg = <0 0xb8000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@b8008000 {
+			reg = <0 0xb8008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc_table@b80ff000 {
+			reg = <0 0xb80ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@b8400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xb8400000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	core-m4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_DIV>;
+		mboxes = <&mu 0 1
+			&mu 1 1
+			&mu 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+		syscon = <&src>;
+	};
+};
-- 
2.34.1


