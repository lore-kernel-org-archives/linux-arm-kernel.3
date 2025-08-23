Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9698ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcoXsYIjaBtcL7QL8FUHWo9FxoVRQus5TrRk0YzmKTk=; b=lrBOtvDMys1AWWmWBi9s78Vq6w
	lx5nOleH36bo335oQql6qbuJ7sFtFW7vlArP4EoJHWf2+t6x19oSzkOa6wQJOKCSydKWRyP0Pk6Zt
	jJtyDwmzzvEQfRJIrDaMZmlogrNt0FpAykzir31mMagLhzaa6Xi34NmBA8YV71YHgbNFwmoYKrnDM
	4zTZ9/Emlerw5lv3ngR7ztXSQiewgRx6XtzTyRu6EXJiS0iJcJeNRsqI49voKF5Fq+VYT3limp/B7
	4M+UaVbwrsA0rvR01rVgq5U7gjS7+K2ObgBl/7ncsZSwcuq3zAXw044rz6cRO/Ki5NX3/o0uSP4e8
	2z1P+0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptM6-00000005C7M-0fWW;
	Sat, 23 Aug 2025 18:52:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upr9E-00000005268-2bru
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:31:21 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGVHU8467550;
	Sat, 23 Aug 2025 11:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755966677;
	bh=DcoXsYIjaBtcL7QL8FUHWo9FxoVRQus5TrRk0YzmKTk=;
	h=From:To:CC:Subject:Date;
	b=oiv07CJ7vGqx2aenMP28t8spnWA5guxVqEQ8tYFDsuCGWc9eyOGP0RJYm7cVGUNxd
	 PNqLl1c01gb6jeOq0pCEU5fViD1zjjeIvTgg9g+uNNl5G/h4X/sbEPVRdpiCOQQUB7
	 8VOVn7w6qlJq9qJ3jL7mnLvANZGN5gbSPqcYro9w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGVG4k249151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:31:16 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:31:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:31:16 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NGVBxV1006218;
	Sat, 23 Aug 2025 11:31:12 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU R5F cores
Date: Sat, 23 Aug 2025 22:01:11 +0530
Message-ID: <20250823163111.2237199-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_093120_787991_5ED8153C 
X-CRM114-Status: GOOD (  14.80  )
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

The J742S2 SoC reuses the common k3-j784s4-j742s2-mcu-wakeup-common.dtsi
for its MCU domain, but it does not override the firmware-name property
for its R5F cores. This causes the wrong firmware binaries to be
referenced.

Introduce a new k3-j742s2-mcu-wakeup.dtsi file to override the
firmware-name property with correct names for J742s2.

Fixes: 38fd90a3e1ac ("arm64: dts: ti: Introduce J742S2 SoC family")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Posted this patch as a fix as decided in v1, so added Fixes tag.

Link to v1:
https://lore.kernel.org/all/20250522073426.329344-2-b-padhi@ti.com/

 .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j742s2.dtsi           |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
new file mode 100644
index 000000000000..61db2348d6a4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Source for J742S2 SoC Family
+ *
+ * TRM: https://www.ti.com/lit/pdf/spruje3
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+&mcu_r5fss0_core0 {
+	firmware-name = "j742s2-mcu-r5f0_0-fw";
+};
+
+&mcu_r5fss0_core1 {
+	firmware-name = "j742s2-mcu-r5f0_1-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j742s2.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
index 7a72f82f56d6..d265df1abade 100644
--- a/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
@@ -96,3 +96,4 @@ cpu3: cpu@3 {
 };
 
 #include "k3-j742s2-main.dtsi"
+#include "k3-j742s2-mcu-wakeup.dtsi"
-- 
2.34.1


