Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF752FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=balMn/jeuZMHswKYCtxOZKEwyrb2iAtRjFm5ZCPg5dk=; b=xoaG61o68Uz2OhE1fLyJFjQggn
	NzAgzPv68rgULxcpkCNzI2mMp4uWPRTxcWZo6DE1v8eDgetH3vYq7NwZDJT7PrwlXa4oM+m7HOOCa
	goQH+m0Pe/JjrMl2UOcb07Epz+jyeWvGVI88Fd7tszqPPYienPn5sP5zOw0Dg0v7ua69wcgOCAwr4
	JN1IJuup+eLN2EwfuUEp6ahKvOVEwc6ecEVbE53dySYbu8I0tyltTsqMNs4BO1fDaW8xTeAWHMz9E
	YVDbvOr4VOo6oQiMxQDWL9N96idTYbz80+JU1DM8DTr/lN27l74ZEiAgFC1cyknxpXIG+z67ty6RV
	xclPfc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy8-0000000H6Ow-3pAR;
	Mon, 27 Apr 2026 14:29:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy6-0000000H6Nh-1NJO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=balMn/jeuZMHswKYCtxOZKEwyrb2iAtRjFm5ZCPg5dk=; b=Kczy6TP5koQjELX1/xKLvBH+Ug
	Sbr8C6gLrLWt1sT5JsLrI9asn6OyYXiKe4rAhOdifPiVW24AstvD/wLEJIPCg/h9KPWZToG7xHuEX
	djHerc5JUAkaWKfs6uoWEREnJ/nGPfbTT2jTaRdqsYU37FzTCg0j82kGrrwlbP9ULqw/Xipz8AX0E
	zRe8apXwA0GjLy84mh13u4PPDs0SUSoOsryuhEAlCXXbjXT8QI/lSEWcOI2m0DsvGCJ5WMYJuJAFh
	amH4HvlFuljGR/L1dt4Hpi+SHSX0gEe936iy18W4Fzv1ohMlt4JPZw2LSWjgUJ8yp157kwLkCRSIx
	VKA3rgqA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy1-00000000oUv-3GVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:29:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F3571A344C;
	Mon, 27 Apr 2026 14:29:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4297B600D1;
	Mon, 27 Apr 2026 14:29:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BABC1072823F;
	Mon, 27 Apr 2026 16:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300178; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=balMn/jeuZMHswKYCtxOZKEwyrb2iAtRjFm5ZCPg5dk=;
	b=gww9V30tXk5X5N+MJIPuGBiDSRXQrjg+DoQ5ekQP4Z7j3o+H8oR2gCJPyZTLJ6HX3Aj2ma
	QOlgIcvoQNwM2CRD1iqZLKdE3ZMNIkehs13FeiXujDZqsPEkgP6riv2WjnDyjmGEEqPJHi
	NeKSEizXykTp6BcZSrq5EjzVKM9I0FQsSqoLz794xbv9OY/IQJ3Ci4GUadBF2Ag0VK+rIB
	OHl/EcPFoelQ7mR7jB8pt625tIYt5Ppwarutd+2ohrwCysnDIVMS/7tGlxj61d9dOy14sl
	16ciqWqMCb/jeE5cMZ3WHNd1O9rrwbRqz1HitOkylcBojWKEDb+u0+6+J9aP6A==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific to J722S
Date: Mon, 27 Apr 2026 16:29:01 +0200
Message-ID: <20260427142901.341861-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427142901.341861-1-richard.genoud@bootlin.com>
References: <20260427142901.341861-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152945_984055_8E9979E8 
X-CRM114-Status: GOOD (  12.91  )
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

Introduce the "k3-j722s-mcu.dtsi" file to contain wakeup domain peripherals
that are specific to J722S SoC and are not shared with AM62P.
Previously, those nodes were squatting the k3-j722s-main.dtsi file which
should contain only main domain peripherals.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi   | 14 --------------
 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi | 18 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi        |  1 +
 3 files changed, 19 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 2a8aba13bd73..d1dbf1e24fbf 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -430,13 +430,6 @@ &main_bcdma_csi {
 	ti,sci-rm-range-tchan = <0x22>;
 };
 
-/* Wakeup domain overrides */
-
-&wkup_r5fss0_core0 {
-	firmware-name = "j722s-wkup-r5f0_0-fw";
-};
-
-/* MAIN domain overrides */
 &hsm {
 	firmware-name = "j722s-hsm-m4f-fw";
 };
@@ -451,13 +444,6 @@ serdes_ln_ctrl: mux-controller@4080 {
 	};
 };
 
-&wkup_conf {
-	pcie0_ctrl: pcie0-ctrl@4070 {
-		compatible = "ti,j784s4-pcie-ctrl", "syscon";
-		reg = <0x4070 0x4>;
-	};
-};
-
 &oc_sram {
 	reg = <0x00 0x70000000 0x00 0x40000>;
 	ranges = <0x00 0x00 0x70000000 0x40000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi
new file mode 100644
index 000000000000..1297813f4829
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the J722S WAKEUP domain peripherals
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2026 Bootlin
+ */
+
+&wkup_conf {
+	pcie0_ctrl: pcie0-ctrl@4070 {
+		compatible = "ti,j784s4-pcie-ctrl", "syscon";
+		reg = <0x4070 0x4>;
+	};
+};
+
+&wkup_r5fss0_core0 {
+	firmware-name = "j722s-wkup-r5f0_0-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index ad477dd66963..ca10c6904b69 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -239,3 +239,4 @@ cbass_wakeup: bus@b00000 {
 /* Include J722S specific peripherals */
 #include "k3-j722s-main.dtsi"
 #include "k3-j722s-mcu.dtsi"
+#include "k3-j722s-wakeup.dtsi"

