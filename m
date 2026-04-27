Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F63FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKABeUwlf/uAaidZSS4m3XCnFnS6ujsftdUmNohI/TQ=; b=Iv8SZ5gNeqsGGil13AMDiWtnul
	7HRzB1JFCQmbL4rbsVYDwNU6IFGkwYht8IgUUxQJz34w3Eb+Uga6HEJMr430bWIFaIr793E+L+kaI
	DImV2omGhRnEP0XJUBVgv3fhH/SZnBoyxzDSkp9IUq0y9oB4iW46EZpYxB5VM/JXsrVmwAJQ6oLS8
	eLxpAcOQGOlB7Utv04HuHq91/PZLYDaT3voHfJ8T71zsPqpxkn+QADT/e3jDPd5Rs0xKorPjoV5L/
	IbiFBtDtiICMHlKNfe6H7Vgvn6VIpwWW7+lv7Hdw/K0oLqT93PKsWpldNxqB/z2xfxVBh+rIv/NFk
	wVm5ExRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy8-0000000H6OY-2RKO;
	Mon, 27 Apr 2026 14:29:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy4-0000000H6N2-3wvW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NKABeUwlf/uAaidZSS4m3XCnFnS6ujsftdUmNohI/TQ=; b=mq/st8zU8MkUskrx/reWdVIp6A
	HD/haC00O6VnVHpGPVqPqm9AlRXiZ2nXf2bcbU+LFmX6/VBf4jrR9/RQisIwo+ethFjQhAuS2umIn
	NEppiOGlcNkosw3J8PC0u35MtOUNstxr1rDhdaOjgIAH6keAwYzF2jgedCCzpzoD+mXbuoUiCnYPx
	GoQr4VfkpYynHb43jDY1tgc7M/wQaAaADDsxk3M1ZDI55x4qZcd3lw7acmRw3jZfKYSKBPfxbGO/b
	dTRSCMV28m81rvOniqOHfZHQm8mW3fctE0dTqIz9S3OFz+AuQp1xDMdAAu/LbBS09zeshLGfuS68Y
	zRR8cLJg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy1-00000000oUe-3Ba7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:29:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07BC5C5CD4D;
	Mon, 27 Apr 2026 14:30:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA69D600D1;
	Mon, 27 Apr 2026 14:29:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF47210728234;
	Mon, 27 Apr 2026 16:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300176; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NKABeUwlf/uAaidZSS4m3XCnFnS6ujsftdUmNohI/TQ=;
	b=CK7EszMOccVo5nr3hn5/qWJcmikLNo+rbkSPm3rrAtWNbXM4Bbn4lGq39bDphI1EItSxrd
	ZaJiKNzkX3ldyYpre9LgWh1iT0m2DO4d+RaD0xlpFg7Zo6nKmBJRRRycR0fwcuodcPG0uX
	jpxGVnWiYYNVZVd1lorImPHtUo11IEfQNMwf6LhMWXAyACF4hngOngfFRjoB0bz+qVHcQr
	Jvgb6Qw6fLurWG3kMzWkbeAYQ2E+XOrkcJ+9jUN3gN38FcHIARZd2XPOKkLvzY/Qo5iOYA
	zazUjtK6X9Od03EyxPMHl2rlA7thmfoWmxjCA3t3Dvs5Ag4AAKnpOEEZ/Sjcbg==
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
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J722S
Date: Mon, 27 Apr 2026 16:29:00 +0200
Message-ID: <20260427142901.341861-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427142901.341861-1-richard.genoud@bootlin.com>
References: <20260427142901.341861-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152945_940157_214B352C 
X-CRM114-Status: GOOD (  12.81  )
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

Introduce the "k3-j722s-mcu.dtsi" file to contain mcu domain peripherals
that are specific to J722S SoC and are not shared with AM62P.
Previously, those nodes were squatting the k3-j722s-main.dtsi file which
should contain only main domain peripherals.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ----------
 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi  | 15 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi      |  1 +
 3 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index d14caa9d8619..2a8aba13bd73 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -430,16 +430,6 @@ &main_bcdma_csi {
 	ti,sci-rm-range-tchan = <0x22>;
 };
 
-/* MCU domain overrides */
-
-&mcu_pmx0 {
-	compatible = "ti,j7200-padconf", "pinctrl-single";
-};
-
-&mcu_r5fss0_core0 {
-	firmware-name = "j722s-mcu-r5f0_0-fw";
-};
-
 /* Wakeup domain overrides */
 
 &wkup_r5fss0_core0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
new file mode 100644
index 000000000000..ab43a7e49f37
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the J722S MCU domain peripherals
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2026 Bootlin
+ */
+
+&mcu_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
+};
+
+&mcu_r5fss0_core0 {
+	firmware-name = "j722s-mcu-r5f0_0-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 1b36dcf37925..ad477dd66963 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -238,3 +238,4 @@ cbass_wakeup: bus@b00000 {
 
 /* Include J722S specific peripherals */
 #include "k3-j722s-main.dtsi"
+#include "k3-j722s-mcu.dtsi"

