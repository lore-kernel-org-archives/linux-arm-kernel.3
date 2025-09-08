Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BD0CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0iC/ZaFYq2tOesybDCk2TnrIJf/nglivOElj4kUu24=; b=q2C/N5pJEwAzLPXd05UeB2Xu9J
	jMu5+XEjEZiRbRnlKNytoZWFcCU3MG29QUKu5eBZZxsfQXxd6Pm6vcRAMK/bg/cFd7J2IDxMtlGlS
	9Rdti2Za6feyZdmtlfyzumgdUG+cw6TcR00qOWgYp1hwBoDn1wL9f3lljjRvHL4+plcuNLNSt9o36
	/Sag/JwPQFv9hZgDJTusydHzIa0qB+Sw+mr5Mx/xixPduvg+WOazqABvc+xeF7beUJyknOiYvFKRQ
	G/VWtFhS/azvHaB7zwsClV6jGbycIzxzL9ks1ea5363junZBiAhLw1pOoHwPHB9e78hjLsC8Yr/2l
	wQsCnRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPY-000000016Lf-3dPj;
	Mon, 08 Sep 2025 17:12:12 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcsj-0000000077q-0hYl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:30:12 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ETxx73883327;
	Mon, 8 Sep 2025 09:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341799;
	bh=Z0iC/ZaFYq2tOesybDCk2TnrIJf/nglivOElj4kUu24=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DkScvNsmAiA+s35A6D/n2i0VIoahA9Acd+FN70ohXnvCFBAVV5c3FZQV24FrX6DsW
	 1L1yoSxNyNR/rOxJrMcC+dz/3Dy4NNE54j7TexN9amJA2FaOd/L26tsBKklCr8pUS8
	 zLm8dOjusKKcuJlp5DntXelCbtMxXtaDkQZ/k5Ms=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ETx0s2464510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:29:59 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:29:59 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Mon, 8 Sep
 2025 09:29:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:29:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESecp1037553;
	Mon, 8 Sep 2025 09:29:49 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Logan Bristol
	<logan.bristol@utexas.edu>,
        Josua Mayer <josua@solid-run.com>, John Ma
	<jma@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Matt McKee <mmckee@phytec.com>, Wadim Egorov
	<w.egorov@phytec.de>,
        Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
        "Max
 Krummenacher" <max.krummenacher@toradex.com>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>,
        Hiago De Franco
	<hiago.franco@toradex.com>,
        Diogo Ivo <diogo.ivo@siemens.com>,
        Li Hua Qian
	<huaqian.li@siemens.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Baocheng Su
	<baocheng.su@siemens.com>,
        Benedikt Niedermayr
	<benedikt.niedermayr@siemens.com>
Subject: [PATCH v4 13/34] arm64: dts: ti: k3: Rename rproc reserved-mem nodes to 'memory@addr'
Date: Mon, 8 Sep 2025 19:58:05 +0530
Message-ID: <20250908142826.1828676-14-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073009_406024_2D44D895 
X-CRM114-Status: GOOD (  13.20  )
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

Currently, the reserved memory carveouts used by remote processors are
named like 'rproc-name-<dma>-memory-region@addr'. While it is
descriptive, the node label already serves that purpose. Rename reserved
memory nodes to generic 'memory@addr' to align with the device tree
specifications. This is done for all TI K3 based boards.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Logan Bristol <logan.bristol@utexas.edu>
Cc: Josua Mayer <josua@solid-run.com>
Cc: John Ma <jma@phytec.com>
Cc: Nathan Morrisson <nmorrisson@phytec.com>
Cc: Garrett Giordano <ggiordano@phytec.com>
Cc: Matt McKee <mmckee@phytec.com>
Cc: Wadim Egorov <w.egorov@phytec.de>
Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Diogo Ivo <diogo.ivo@siemens.com>
Cc: Li Hua Qian <huaqian.li@siemens.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Baocheng Su <baocheng.su@siemens.com>
Cc: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

v4: Changelog:
1. New patch

 .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 10 ++--
 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     |  6 +--
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi    |  2 +-
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  2 +-
 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 12 ++---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 12 ++---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 14 +++---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   |  2 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  8 ++--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  8 ++--
 .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 22 ++++-----
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 22 ++++-----
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 22 ++++-----
 arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi   | 16 +++----
 .../arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 18 +++----
 .../boot/dts/ti/k3-am65-iot2050-common.dtsi   | 10 ++--
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 10 ++--
 .../arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 22 ++++-----
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 34 ++++++-------
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi    | 34 ++++++-------
 arch/arm64/boot/dts/ti/k3-am69-sk.dts         | 48 +++++++++----------
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi   | 18 +++----
 .../boot/dts/ti/k3-j721e-beagleboneai64.dts   | 38 +++++++--------
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 38 +++++++--------
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi   | 38 +++++++--------
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  | 34 ++++++-------
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       | 22 ++++-----
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts      |  4 +-
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 44 ++++++++---------
 29 files changed, 285 insertions(+), 285 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index dcd22ff487ec..75b7e64f6659 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -46,31 +46,31 @@ ramoops@9c700000 {
 			pmsg-size = <0x8000>;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@9c800000 {
+		rtos_ipc_memory_region: memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x00300000>;
 			no-map;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+		mcu_m4fss_dma_memory_region: memory@9cb00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cb00000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+		mcu_m4fss_memory_region: memory@9cc00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cc00000 0x00 0xe00000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9da00000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: memory@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 2eee5f638e0f..2d46be298b0b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -54,13 +54,13 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+		mcu_m4fss_dma_memory_region: memory@9cb00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cb00000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+		mcu_m4fss_memory_region: memory@9cc00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cc00000 0x00 0xe00000>;
 			no-map;
@@ -78,7 +78,7 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index cbbcb96e2e24..9384c9a0232a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -206,7 +206,7 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 72b09f9c69d8..7028d9835c4a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -83,7 +83,7 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 3108e9b0c804..0406a43ff704 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,37 +59,37 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
+		c7x_0_dma_memory_region: memory@99800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x99800000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_0_memory_region: c7x-memory@99900000 {
+		c7x_0_memory_region: memory@99900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x99900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@9b800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b800000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
+		mcu_r5fss0_core0_memory_region: memory@9b900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 7ebcfe8edfe1..312bdab28784 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -53,37 +53,37 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
+		c7x_0_dma_memory_region: memory@99800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x99800000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_0_memory_region: c7x-memory@99900000 {
+		c7x_0_memory_region: memory@99900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x99900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@9b800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b800000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
+		mcu_r5fss0_core0_memory_region: memory@9b900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 41860ac42f3c..289f52b3481f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -58,37 +58,37 @@ secure_tfa_ddr: tfa@80000000 {
 			no-map;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
+		c7x_0_dma_memory_region: memory@99800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x99800000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_0_memory_region: c7x-memory@99900000 {
+		c7x_0_memory_region: memory@99900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x99900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@9b800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b800000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
+		mcu_r5fss0_core0_memory_region: memory@9b900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
@@ -100,7 +100,7 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a0000000 {
+		rtos_ipc_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x01000000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 6a04b370d149..522d6f029c36 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -162,7 +162,7 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0x01e00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index c5b5b00c42b9..aa363aaf6d59 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -49,25 +49,25 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@9b800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b800000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
+		mcu_r5fss0_core0_memory_region: memory@9b900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9b900000 0x00 0xf00000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 03b8e246d8c2..05cba3cfc79e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -58,25 +58,25 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+		mcu_m4fss_dma_memory_region: memory@9cb00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cb00000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+		mcu_m4fss_memory_region: memory@9cc00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cc00000 0x00 0xe00000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9da00000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: memory@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
index 03c46d74ebb5..ba425b125d63 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
@@ -41,67 +41,67 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		main_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		main_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss1_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss1_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@a4000000 {
+		mcu_m4fss_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_m4fss_memory_region: m4f-memory@a4100000 {
+		mcu_m4fss_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a5000000 {
+		rtos_ipc_memory_region: memory@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x00800000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index 7640c5efe9b8..ebc9fedc4d72 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -53,67 +53,67 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		main_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		main_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss1_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss1_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@a4000000 {
+		mcu_m4fss_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_m4fss_memory_region: m4f-memory@a4100000 {
+		mcu_m4fss_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a5000000 {
+		rtos_ipc_memory_region: memory@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x00800000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index fb8bd66f2f94..d2b06e508c7f 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -51,67 +51,67 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		main_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		main_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss1_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss1_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@a4000000 {
+		mcu_m4fss_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_m4fss_memory_region: m4f-memory@a4100000 {
+		mcu_m4fss_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a5000000 {
+		rtos_ipc_memory_region: memory@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x00800000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
index 81adae0a8e55..35294a5c46d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
@@ -115,49 +115,49 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		main_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		main_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss1_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss1_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index 40b619c9a6c9..4068d2c2b10c 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -31,55 +31,55 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		main_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		main_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss1_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss1_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a5000000 {
+		rtos_ipc_memory_region: memory@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x00800000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index 6cd499ea53e7..df2eed0b4048 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -47,31 +47,31 @@ secure_ddr: secure-ddr@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa0100000 0 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa1000000 0 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa1100000 0 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a2000000 {
+		rtos_ipc_memory_region: memory@a2000000 {
 			reg = <0x00 0xa2000000 0x00 0x00200000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index e532ea0a22b2..3ca771a4f9c7 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -50,31 +50,31 @@ secure_ddr: secure-ddr@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa0100000 0 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa1000000 0 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa1100000 0 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a2000000 {
+		rtos_ipc_memory_region: memory@a2000000 {
 			reg = <0x00 0xa2000000 0x00 0x00100000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index b329e4cb0c37..85436ea5b4e7 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -50,67 +50,67 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		wkup_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@a1000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@a1100000 {
+		mcu_r5fss0_core0_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: main-r5fss-dma-memory-region@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: main-r5fss-memory-region@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@a3000000 {
+		c7x_0_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_0_memory_region: c7x-memory@a3100000 {
+		c7x_0_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c7x_1_dma_memory_region: c7x-dma-memory@a4000000 {
+		c7x_1_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_1_memory_region: c7x-memory@a4100000 {
+		c7x_1_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a5000000 {
+		rtos_ipc_memory_region: memory@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x1c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index 383594732e81..b9c60e078d21 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -49,103 +49,103 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
+		c71_0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a6100000 {
+		c71_0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
+		c71_1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_1_memory_region: c71-memory@a7100000 {
+		c71_1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a8000000 {
+		rtos_ipc_memory_region: memory@a8000000 {
 			reg = <0x00 0xa8000000 0x00 0x01c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 2d2edeeb7347..c423b1443e0c 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -27,103 +27,103 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
+		c71_0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a6100000 {
+		c71_0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
+		c71_1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_1_memory_region: c71-memory@a7100000 {
+		c71_1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a8000000 {
+		rtos_ipc_memory_region: memory@a8000000 {
 			reg = <0x00 0xa8000000 0x00 0x01c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index af8eafc3f54a..60817c1f3104 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -49,145 +49,145 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss2_core0_dma_memory_region: r5f-dma-memory@a6000000 {
+		main_r5fss2_core0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss2_core0_memory_region: r5f-memory@a6100000 {
+		main_r5fss2_core0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss2_core1_dma_memory_region: r5f-dma-memory@a7000000 {
+		main_r5fss2_core1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss2_core1_memory_region: r5f-memory@a7100000 {
+		main_r5fss2_core1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+		c71_0_dma_memory_region: memory@a8000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a8100000 {
+		c71_0_memory_region: memory@a8100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_1_dma_memory_region: c71-dma-memory@a9000000 {
+		c71_1_dma_memory_region: memory@a9000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa9000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_1_memory_region: c71-memory@a9100000 {
+		c71_1_memory_region: memory@a9100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa9100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_2_dma_memory_region: c71-dma-memory@aa000000 {
+		c71_2_dma_memory_region: memory@aa000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xaa000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_2_memory_region: c71-memory@aa100000 {
+		c71_2_memory_region: memory@aa100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xaa100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_3_dma_memory_region: c71-dma-memory@ab000000 {
+		c71_3_dma_memory_region: memory@ab000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xab000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_3_memory_region: c71-memory@ab100000 {
+		c71_3_memory_region: memory@ab100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xab100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 90befcdc8d08..c689e417cf45 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -29,55 +29,55 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a4000000 {
+		rtos_ipc_memory_region: memory@a4000000 {
 			reg = <0x00 0xa4000000 0x00 0x00800000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 0d1a313a7d10..ac4d90e82aab 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -51,115 +51,115 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c66_0_dma_memory_region: c66-dma-memory@a6000000 {
+		c66_0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c66_0_memory_region: c66-memory@a6100000 {
+		c66_0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c66_1_dma_memory_region: c66-dma-memory@a7000000 {
+		c66_1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c66_1_memory_region: c66-memory@a7100000 {
+		c66_1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+		c71_0_dma_memory_region: memory@a8000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a8100000 {
+		c71_0_memory_region: memory@a8100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@aa000000 {
+		rtos_ipc_memory_region: memory@aa000000 {
 			reg = <0x00 0xaa000000 0x00 0x01c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 62b9c13a91e7..0f05e65f7bf7 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -48,115 +48,115 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c66_0_dma_memory_region: c66-dma-memory@a6000000 {
+		c66_0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c66_0_memory_region: c66-memory@a6100000 {
+		c66_0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c66_1_dma_memory_region: c66-dma-memory@a7000000 {
+		c66_1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c66_1_memory_region: c66-memory@a7100000 {
+		c66_1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+		c71_0_dma_memory_region: memory@a8000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a8100000 {
+		c71_0_memory_region: memory@a8100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@aa000000 {
+		rtos_ipc_memory_region: memory@aa000000 {
 			reg = <0x00 0xaa000000 0x00 0x01c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 795b041ee733..06388f28d122 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -29,115 +29,115 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c66_1_dma_memory_region: c66-dma-memory@a6000000 {
+		c66_1_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c66_0_memory_region: c66-memory@a6100000 {
+		c66_0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c66_0_dma_memory_region: c66-dma-memory@a7000000 {
+		c66_0_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c66_1_memory_region: c66-memory@a7100000 {
+		c66_1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+		c71_0_dma_memory_region: memory@a8000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a8100000 {
+		c71_0_memory_region: memory@a8100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@aa000000 {
+		rtos_ipc_memory_region: memory@aa000000 {
 			reg = <0x00 0xaa000000 0x00 0x01c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index f252007262d3..ff5264d4c2da 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -31,103 +31,103 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
+		c71_0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a6100000 {
+		c71_0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
+		c71_1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_1_memory_region: c71-memory@a7100000 {
+		c71_1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a8000000 {
+		rtos_ipc_memory_region: memory@a8000000 {
 			reg = <0x00 0xa8000000 0x00 0x01c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 2b9e007432a9..d323284a30ab 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -52,67 +52,67 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		wkup_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@a1000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@a1100000 {
+		mcu_r5fss0_core0_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: main-r5fss-dma-memory-region@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: main-r5fss-memory-region@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@a3000000 {
+		c7x_0_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_0_memory_region: c7x-memory@a3100000 {
+		c7x_0_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c7x_1_dma_memory_region: c7x-dma-memory@a4000000 {
+		c7x_1_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c7x_1_memory_region: c7x-memory@a4100000 {
+		c7x_1_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		rtos_ipc_memory_region: ipc-memories@a5000000 {
+		rtos_ipc_memory_region: memory@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x1c00000>;
 			alignment = <0x1000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
index a84bde08f85e..2ed1ec6d53c8 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
@@ -28,13 +28,13 @@ reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		c71_3_dma_memory_region: c71-dma-memory@ab000000 {
+		c71_3_dma_memory_region: memory@ab000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xab000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_3_memory_region: c71-memory@ab100000 {
+		c71_3_memory_region: memory@ab100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xab100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index c269e5b29b96..fdde1bd0e831 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -35,133 +35,133 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+		mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1000000 0x00 0x100000>;
 			no-map;
 		};
 
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		mcu_r5fss0_core1_memory_region: memory@a1100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa1100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		main_r5fss0_core0_dma_memory_region: memory@a2000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		main_r5fss0_core0_memory_region: memory@a2100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa2100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		main_r5fss0_core1_dma_memory_region: memory@a3000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		main_r5fss0_core1_memory_region: memory@a3100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa3100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		main_r5fss1_core0_dma_memory_region: memory@a4000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		main_r5fss1_core0_memory_region: memory@a4100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa4100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		main_r5fss1_core1_dma_memory_region: memory@a5000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		main_r5fss1_core1_memory_region: memory@a5100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa5100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss2_core0_dma_memory_region: r5f-dma-memory@a6000000 {
+		main_r5fss2_core0_dma_memory_region: memory@a6000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss2_core0_memory_region: r5f-memory@a6100000 {
+		main_r5fss2_core0_memory_region: memory@a6100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa6100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		main_r5fss2_core1_dma_memory_region: r5f-dma-memory@a7000000 {
+		main_r5fss2_core1_dma_memory_region: memory@a7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7000000 0x00 0x100000>;
 			no-map;
 		};
 
-		main_r5fss2_core1_memory_region: r5f-memory@a7100000 {
+		main_r5fss2_core1_memory_region: memory@a7100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+		c71_0_dma_memory_region: memory@a8000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_0_memory_region: c71-memory@a8100000 {
+		c71_0_memory_region: memory@a8100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa8100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_1_dma_memory_region: c71-dma-memory@a9000000 {
+		c71_1_dma_memory_region: memory@a9000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa9000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_1_memory_region: c71-memory@a9100000 {
+		c71_1_memory_region: memory@a9100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa9100000 0x00 0xf00000>;
 			no-map;
 		};
 
-		c71_2_dma_memory_region: c71-dma-memory@aa000000 {
+		c71_2_dma_memory_region: memory@aa000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xaa000000 0x00 0x100000>;
 			no-map;
 		};
 
-		c71_2_memory_region: c71-memory@aa100000 {
+		c71_2_memory_region: memory@aa100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xaa100000 0x00 0xf00000>;
 			no-map;
-- 
2.34.1


