Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE7FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R02gxqAxqSPh4eHU4MZSfI68JyjwnM/7FRMfSq/2Nzs=; b=gNuAc90G9Bx+b//amDUuCH6+3d
	MlqAS3ipVyHww3hKyUzdHGG03iYnpD6xrhM+jVrsF2qSPNfMJCKZ9czSqyp4Y5hv99BQS7d+a7qO5
	+rPluHZft4PSsun5z2Tf9F+5cjbf85PrUF+lA8X78SVy2rkqthMqX55iRK3wpOOd5ln5kA37OvOu1
	+luKcxu2I87dA2ZnFQcE8FuGS/EG/C27c79Fih5sYfS8jfnusXw7L5WEOL48+ZsM1Y9bzA3aY0zse
	F3CtDc8FS06z05gz+Dyb8RMqd3q8OjLc5cRfsW7I2wLW4XtyKwM2hGFnyQFUhArWIaUmedAZU23je
	BGH0GTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOQw-0000000HGUE-102E;
	Mon, 27 Apr 2026 16:03:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOQr-0000000HGSw-1aZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:03:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F2521A3439;
	Mon, 27 Apr 2026 16:03:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 193E1600D1;
	Mon, 27 Apr 2026 16:03:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02FD71072824D;
	Mon, 27 Apr 2026 18:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777305813; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=R02gxqAxqSPh4eHU4MZSfI68JyjwnM/7FRMfSq/2Nzs=;
	b=1P0ozdcMjP0HCXShmqTe2NE6OuwCmj9pMs0vaMJaOnF9L2oMkubeoQwJcSCvwUGBY1GiR4
	cyV5Te2F2nntzKEQQsYv3P0N4UYkFtuXYSNuQJhMSfWm6pSmyr0Gn/riTWSHjAVvMi+Vtu
	PHwRJ61/7Uy2NXx2xoonMBQISUpZBRU8MuDa4/Ns8uHG8X678GnrToTqVMpHpmIHf7SYJP
	o/5TTTe00WGigqe0ZUJ1BaMWNHy7xvPqHoU7i06qT7GHxIVRQeFxDU8h/3tD1gQqP89RaF
	9r41jwm7j54erBPeZIM71gFqge0rsBGx8xu5li9w/khwiyHeUf+LOW2EkJxCBA==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: ti: k3-j7: Reserve memory for LPM meta data
Date: Mon, 27 Apr 2026 18:03:26 +0200
Message-ID: <20260427160326.370415-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427160326.370415-1-richard.genoud@bootlin.com>
References: <20260427160326.370415-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_090337_761656_A5F4F4C0 
X-CRM114-Status: GOOD (  10.60  )
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

From: Prasanth Babu Mantena <p-mantena@ti.com>

For TI SOCs J7200, J784S4, J722S, J721s2 which support low power modes,
a chunk of memory is reserved for LPM meta data, which is needed for
saving ATF context and the certificate information of ATF and OPTEE and
DM image. This LPM metadata area is firewalled to be accessed only by
TIFS.

U-Boot/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

U-Boot has to parse and retrieve this area from the device tree, thus
@lpm-memory node are used instead of the generic @memory.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 5a8c2e707fde..756928a2d411 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -40,6 +40,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a4800000 {
+			reg = <0x00 0xa4800000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	mux0: mux-controller-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 12a38dd1514b..ceab8f057640 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -42,6 +42,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a9c00000 {
+			reg = <0x00 0xa9c00000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	mux0: mux-controller-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..eebc5cc7d4cd 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -63,6 +63,12 @@ wkup_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a6c00000 {
+			reg = <0x00 0xa6c00000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	vmain_pd: regulator-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
index fcb7f05d7faf..d0752c8a6b37 100644
--- a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
@@ -23,4 +23,13 @@ memory@80000000 {
 		device_type = "memory";
 		bootph-all;
 	};
+
+};
+
+&reserved_memory {
+	lpm_memory_region: lpm-memory@ab000000 {
+		reg = <0x00 0xab000000 0x00 0x00300000>;
+		no-map;
+		bootph-all;
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
index 6c7458c76f53..114594f37f0b 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
@@ -23,10 +23,13 @@ memory@80000000 {
 		device_type = "memory";
 		bootph-all;
 	};
+};
 
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
+&reserved_memory {
+	lpm_memory_region: lpm-memory@ac000000 {
+		reg = <0x00 0xac000000 0x00 0x00300000>;
+		no-map;
+		bootph-all;
 	};
 };
 

