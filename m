Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbOq2K1ldkVj48OEf18YO+kDVJoyDBvhyBuEHKl3UN8=; b=Cv2O7+hP6cBKGVPFUbzJG4xA2R
	PXZh2pdwirC0wB+oFlly/RQDJSQhozp+Ri5aOYH9dPDvzNEVLWOjCiBdO7DYWbYIiZhaxgtQBCWvp
	BsI4Va7ERX/DRuN1I+/fRYwHnolpmCxoJJA/WlsRGa1uAYB2Hl3oAjf1oHHrLoeWm4IgO+TDEB9Pl
	cF9l/137ae6dy9cjFJH3wnqMiX8HIa9ZfiPVYZGpkjqLOGZ5XK3TGiS5UBQ+qaOGRIdhIrf9mX4J+
	4zy0CzErgmi80PBCfF5pOsHjSpalzuGz9Ne465HZoIYLiunlFXC+GBx0BIKYIkcyHd+NgL1574E6+
	rSZXVCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gJ3-00000005u4Y-1eNl;
	Tue, 15 Apr 2025 13:26:29 +0000
Received: from mail-vi1eur05on20724.outbound.protection.outlook.com ([2a01:111:f403:2613::724] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fyf-00000005qxX-2PoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:05:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJoHBae1UwZtudbWyNdtjriXMS+0OiUF/f4t3nvymghI6uh7Ph1GvIJaZZED9G2CnrEdTZdCaj0Dm22NBRChNSTxOxXogBA99aBrgWDoGjfIlJnMKp+sZ9yPqj7zJr81iqyXOtwHfkSNDK7kmRwNzPBSw+hyC1rxqAIGJbfJHLKVwfqd0xbMR+jOXjYPmXoOqCmxwAbgiEvUpbVpckPE4jnV0xs0Fys0wqJKZ039x5kRb767cRj4lvC/gLLAJWuBG/7cKctagLB2FRlwFBJRJF/IWepb/SmqOYH92CGt44NlDEVW4Ske+V9qEJ+ji7mr/7qGzBYP3kBAc731cTNdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbOq2K1ldkVj48OEf18YO+kDVJoyDBvhyBuEHKl3UN8=;
 b=MnQCUZCZ8YF4T1/LV9hNtTuW9oIoV7JCtuGcXex/mH2eoFKbEs86H81Qu5mD1VtP0W3edgbbp/zWGXhp7/pHLRC1yTHnFxsM+VaYRR0OxGnyqLR+8YgDO0czACAKlcGDgMGkFctrGQXI1gat164Ym4FCeq9uw/7MsQhS4kqCJSkKXn92P0sY1rUV80EAnq3TKw2fUYCcpljq41oTIGCMnmCJD1aSvrY1Dr2TyL9FoJGGrbHoSroajl5hUOdMywoL8feQVynPivSUKAfHrvQav2+k1pUPE77Us6AAi2ikFksQTZPcSaE4hKByCPtWoN8vofvjCd89jnSvqms8deyYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbOq2K1ldkVj48OEf18YO+kDVJoyDBvhyBuEHKl3UN8=;
 b=JgFzImIIv7dKom+Jgz3o0lzrVRNKT3Cl5Lp6XFOOWzRUi+TTnvf/w5cxXz5O37bRWb/sHLjvy5csGKaYa7osdoD6vNr3nnyC7V2FI9uttgU7x22kb+Ly8hAl7+tQz/oJcDkq2XHCG3wj+8SgKOT+Rt/4HQeA+1p/G6YsE8Au+m44voGel1H3yaKJZo7yKA19Hp3fy48woJ1VFpQNAzKLg/N69vqSgKgTUS4QusWTnb7p6+OcAiDQ5/XH4WceVTBPGJPV1Xne98w05OwMFWZTk8DZ8068EweH7yGlMN2Wrh2Zp1x9m43sUSPUwuDwqKZwODwdxlX1YEKVgc5ChfDb7Q==
Received: from DU7P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::8) by
 GV2P195MB1967.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:ad::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.29; Tue, 15 Apr 2025 13:05:12 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::2f) by DU7P194CA0009.outlook.office365.com
 (2603:10a6:10:553::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 13:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 13:05:12 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:05:10 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:05:09 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 2/3] arm64: dts: ti: Add basic support for phyBOARD-Izar-AM68x
Date: Tue, 15 Apr 2025 15:04:57 +0200
Message-ID: <20250415130458.33714-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415130458.33714-1-d.haller@phytec.de>
References: <20250415130458.33714-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|GV2P195MB1967:EE_
X-MS-Office365-Filtering-Correlation-Id: d6aad512-33db-4741-8cd2-08dd7c1e2894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t80LqRpiw6hnVt0KR4FvcQrjqz9FbxLi5mrWKAK5pEXuzKWAs2vr8+ehlk4y?=
 =?us-ascii?Q?nbQUHIU/cQdlxPzOTW1lP1gMpDfALxydj+fksNRWbEwdJ0uahCPHkDVkQ2sT?=
 =?us-ascii?Q?3GLjOESQkG/ZheUyEnfe638e0zIIkwBNfY+BsBVw3HzoLehR4HwGuwUCGR4X?=
 =?us-ascii?Q?8SzvyHbeB/E2dAWPbNlPnkem0SKO6r3EoCKAq7oXQ++83km26n0fSU50Mm8a?=
 =?us-ascii?Q?wPouskqEe66CrGUp/cpXmi6ywVRJGqAAX9tgSzZqE86xyiyS5u+FSCfZHZy2?=
 =?us-ascii?Q?GDDAUD6n44EpEw5GT6B5C628ky76RHd/aqBWTm/sGtcKQqB/tJFVoDklWn1T?=
 =?us-ascii?Q?FWZ2786qDBzmBMtXTpEkdv4KjHi5DnE/zYHsv8zCE/ACDMFPVzkRx1KmvA+m?=
 =?us-ascii?Q?nH9ooh8Sdxi/rRm6RhGjDUJo/j2INEspLSEmr6+XsWDntOrAnzVO9zCYnByG?=
 =?us-ascii?Q?PH3SbEEN3L/oiIhL2BDvmt9a5tcXLwh9AlHlxKhe2bOp5C1Xg/Jyy4pUocW/?=
 =?us-ascii?Q?tAdzKl84Ba1BVYBNz3xNQ7F1TrjA21NkDY0v4wfJlWP9wXiTRfMOA5TKxu6H?=
 =?us-ascii?Q?n52Zps+HzK+5X30aoafjMKFR+NqY4Oye2DC/+93k4sW1ljSa/tbU4pxFGw2e?=
 =?us-ascii?Q?JN5FWTBYv+BE/Ra4qplxQd5DWXYpQxYrR49BIJTj9P1jmDydIFajsf6fmX2t?=
 =?us-ascii?Q?NN7SSFpGzn2CP2NvKN+XaLqHcrkbFNecWIO7M+gj9gbOKWz4VZrIRKBesPRb?=
 =?us-ascii?Q?x4E+YR4BEp7ZPkSXAteCZorugn8FbWZgMB5gUwiz01MN1syDVy1BDxa5Mx5v?=
 =?us-ascii?Q?pgrU9k1ygsbnt07DIkprx+qKcbekn0rMShUEcrGPNXA7mix4glULWznPvISL?=
 =?us-ascii?Q?8KXIOI8xLHLWi79JBwInr8tNW0YbEP9TbPVGVwdEYqmzGDzBrUVUnJCBNPCN?=
 =?us-ascii?Q?u3LO6LlPoh2z2r8YNCyOAJlm5cdA59rNjTlFb1JY4+7w8Dck0QBELWdKUqAD?=
 =?us-ascii?Q?Oc0Svhb7p3IqFKVx1p+gt4pTv3QIeuJsr9qlE4xlb9EEAqhHbNDFv2KwyNLr?=
 =?us-ascii?Q?IWZTz9qQOlgtnOxXeMK8s5J237aWS3zJQq1xULCC5FxDZ8p8zJB+kQh9rKrT?=
 =?us-ascii?Q?ZaXyG6wiGwVQ1Sqm0/DLzvUbR3aJ7L5vHP44e0MjxqPzYVd2s5m8eIAiu/Ax?=
 =?us-ascii?Q?15g4kRzU+ef2T2GO4TtnMFkSGMYmPYczqdewL1rVSVZ8FZuWiPC8PMQ3uw/K?=
 =?us-ascii?Q?MBeKMg0g+0g7Li8FQapOgjhpOTpmfiBqMjDviXohw4kxQpUNAj1tzE68EMDg?=
 =?us-ascii?Q?UdSPL/aKN8OgxD2lfOtUpclbC2oji/+H4jjfwiZ41KHL3Y8GalcfknknDz/w?=
 =?us-ascii?Q?sS1veScLysjgg2jCtskG8xxJXUkCAs2vycWb/NNAvOX8R5aErs2D5XrWN91E?=
 =?us-ascii?Q?gbeK6w3S1C09LmbV/HVkrMLvWZqISxX7N/4ooU7r9r+Yd8h03jzWEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:05:12.7540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6aad512-33db-4741-8cd2-08dd7c1e2894
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB1967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_060525_815740_538B73E8 
X-CRM114-Status: GOOD (  16.44  )
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

The phyCORE-AM68x/TDA4x [1] is a SoM (System on Module) featuring TI's
AM68x/TDA4x SoC. It can be used in combination with different carrier
boards. This module can come with different sizes and models for DDR,
eMMC, SPI NOR Flash and various SoCs from the AM68x/TDA4x (J721S2) family.

A reference carrier board design, called phyBOARD-Izar is used for the
phyCORE-AM68x/TDA4x development kit [2].

Supported features:
* Debug UART
* 2x SPI NOR Flash
* eMMC
* 2x Ethernet
* Micro SD card
* I2C EEPROM
* I2C RTC
* 2x I2C GPIO Expander
* LEDs
* USB 5 Gbit/s
* PCIe

For more details see the product pages for the SoM and the
development kit:

[1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
[2] https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    Bootlog:
    https://gist.github.com/dominiknh90/644e753c752b232117e12092e3691124
    
    Link to v1:
    https://lore.kernel.org/linux-arm-kernel/20250411101004.13276-1-d.haller@phytec.de/
    
    Changes in v2:
    - aliases reordered
    - stdout-path set to &main_uart8
    - fixed coding style in serdes0 node
    - dropped whitespaces in commit message

 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am68-phyboard-izar.dts     | 578 +++++++++++++++++
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 594 ++++++++++++++++++
 3 files changed, 1173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 03d4cecfc001..3f18ca4029c3 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -109,6 +109,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 
 # Boards with J721s2 SoC
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
new file mode 100644
index 000000000000..b88aa8fe9a0f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -0,0 +1,578 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ *
+ * https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/leds-pca9532.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/phy/phy-cadence.h>
+#include <dt-bindings/phy/phy.h>
+#include "k3-am68-phycore-som.dtsi"
+
+#include "k3-serdes.h"
+
+/ {
+	compatible = "phytec,am68-phyboard-izar", "ti,j721s2";
+	model = "PHYTEC phyBOARD-Izar-AM68x";
+
+	aliases {
+		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
+		serial2 = &main_uart8;
+		serial3 = &main_uart1;
+		serial4 = &main_uart2;
+		mmc1 = &main_sdhci1;
+		ethernet0 = &cpsw_port1;
+	};
+
+	chosen {
+		stdout-path = &main_uart8;
+	};
+
+	transceiver1: can-phy1 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+	};
+
+	transceiver2: can-phy2 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+	};
+
+	transceiver3: can-phy3 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+	};
+
+	transceiver4: can-phy4 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+	};
+
+	vcc_12v0: regulator-12v0 {
+		/* main supply */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_IN";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		/* Output of TLV7158P */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		/* Output of SiC431 */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc_5v0>;
+	};
+
+	vcc_5v0: regulator-vcc-5v0 {
+		/* Output of LM5116 */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc_12v0>;
+	};
+};
+
+&main_pmx0 {
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x04c, PIN_INPUT_PULLUP, 13) /* (V27) MCASP1_AXR1.I2C2_SCL */
+			J721S2_IOPAD(0x050, PIN_INPUT_PULLUP, 13) /* (W27) MCASP1_AXR2.I2C2_SDA */
+		>;
+	};
+
+	main_i2c4_pins_default: main-i2c4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) MCAN14_TX.I2C4_SCL */
+			J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) MCAN13_RX.I2C4_SDA */
+		>;
+	};
+
+	main_i2c5_pins_default: main-i2c5-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x01c, PIN_INPUT_PULLUP, 8) /* (Y24) MCAN15_TX.I2C5_SCL */
+			J721S2_IOPAD(0x018, PIN_INPUT_PULLUP, 8) /* (W23) MCAN14_RX.I2C5_SDA */
+		>;
+	};
+
+	main_gpio0_ioexp_intr_pins_default: main-gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x020, PIN_INPUT, 7) /* (AA23) MCAN15_RX.GPIO0_8 */
+		>;
+	};
+
+	main_mcan1_pins_default: main-mcan1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_INPUT, 4) /* (AD28) EXT_REFCLK1.MCAN1_RX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT, 0) /* (V26) MCAN1_TX */
+		>;
+	};
+
+	main_mcan13_pins_default: main-mcan13-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0ec, PIN_INPUT, 9) /* (AG25) TIMER_IO1.MCAN13_RX */
+			J721S2_IOPAD(0x00c, PIN_OUTPUT, 0) /* (AE28) MCAN13_TX */
+		>;
+	};
+
+	main_mcan16_pins_default: main-mcan16-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x028, PIN_INPUT, 0) /* (AB24) MCAN16_RX */
+			J721S2_IOPAD(0x024, PIN_OUTPUT, 0) /* (Y28) MCAN16_TX */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x104, PIN_INPUT, 0) /* (P23) MMC1_CLK */
+			J721S2_IOPAD(0x108, PIN_INPUT, 0) /* (N24) MMC1_CMD */
+			J721S2_IOPAD(0x100, PIN_INPUT, 0) /* (###) MMC1_CLKLB */
+			J721S2_IOPAD(0x0fc, PIN_INPUT, 0) /* (M23) MMC1_DAT0 */
+			J721S2_IOPAD(0x0f8, PIN_INPUT, 0) /* (P24) MMC1_DAT1 */
+			J721S2_IOPAD(0x0f4, PIN_INPUT, 0) /* (R24) MMC1_DAT2 */
+			J721S2_IOPAD(0x0f0, PIN_INPUT, 0) /* (R22) MMC1_DAT3 */
+			J721S2_IOPAD(0x0e8, PIN_INPUT, 8) /* (AE25) TIMER_IO0.MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	main_spi6_pins_default: main-spi6-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x030, PIN_INPUT, 8) /* (T26) GPIO0_12.SPI6_CLK */
+			J721S2_IOPAD(0x080, PIN_INPUT, 8) /* (U26) MCASP0_AXR4.SPI6_CS2 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT, 8) /* (AB26) ECAP0_IN_APWM_OUT.SPI6_D0 */
+			J721S2_IOPAD(0x074, PIN_INPUT, 8) /* (R28) MCAN2_TX.SPI6_D1 */
+			J721S2_IOPAD(0x0dc, PIN_OUTPUT, 7) /* (AH26) SPI0_D1.GPIO0_55 */
+		>;
+	};
+
+	main_uart1_pins_default: main-uart1-default-pins {
+			pinctrl-single,pins = <
+			J721S2_IOPAD(0x05c, PIN_INPUT, 11) /* (AA26) MCASP2_AXR0.UART1_CTSn */
+			J721S2_IOPAD(0x060, PIN_OUTPUT, 11) /* (AC27) MCASP2_AXR1.UART1_RTSn */
+			J721S2_IOPAD(0x054, PIN_INPUT, 11) /* (Y27) MCASP2_ACLKX.UART1_RXD */
+			J721S2_IOPAD(0x058, PIN_OUTPUT, 11) /* (AA27) MCASP2_AFSX.UART1_TXD */
+		>;
+	};
+
+	main_uart2_pins_default: main-uart2-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0d8, PIN_INPUT, 11) /* (AG26) SPI0_D0.UART2_RXD */
+			J721S2_IOPAD(0x068, PIN_OUTPUT, 11) /* (U28) MCAN0_RX.UART2_TXD */
+		>;
+	};
+
+	main_uart8_pins_default: main-uart8-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0d0, PIN_INPUT, 11) /* (AF26) SPI0_CS1.UART8_RXD */
+			J721S2_IOPAD(0x0d4, PIN_OUTPUT, 11) /* (AH27) SPI0_CLK.UART8_TXD */
+		>;
+		bootph-all;
+	};
+};
+
+&wkup_pmx1 {
+	mcu_fss0_ospi1_pins_default: mcu-fss0-ospi1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (A19) MCU_OSPI1_CLK */
+			J721S2_WKUP_IOPAD(0x024, PIN_OUTPUT, 0) /* (D20) MCU_OSPI1_CSn0 */
+			J721S2_WKUP_IOPAD(0x014, PIN_INPUT, 0) /* (D21) MCU_OSPI1_D0 */
+			J721S2_WKUP_IOPAD(0x018, PIN_INPUT, 0) /* (G20) MCU_OSPI1_D1 */
+			J721S2_WKUP_IOPAD(0x01c, PIN_INPUT, 0) /* (C20) MCU_OSPI1_D2 */
+			J721S2_WKUP_IOPAD(0x020, PIN_INPUT, 0) /* (A20) MCU_OSPI1_D3 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x02c, PIN_INPUT, 0) /* (B22) MCU_RGMII1_RD0 */
+			J721S2_WKUP_IOPAD(0x028, PIN_INPUT, 0) /* (B21) MCU_RGMII1_RD1 */
+			J721S2_WKUP_IOPAD(0x024, PIN_INPUT, 0) /* (C22) MCU_RGMII1_RD2 */
+			J721S2_WKUP_IOPAD(0x020, PIN_INPUT, 0) /* (D23) MCU_RGMII1_RD3 */
+			J721S2_WKUP_IOPAD(0x01c, PIN_INPUT, 0) /* (D22) MCU_RGMII1_RXC */
+			J721S2_WKUP_IOPAD(0x004, PIN_INPUT, 0) /* (E23) MCU_RGMII1_RX_CTL */
+			J721S2_WKUP_IOPAD(0x014, PIN_OUTPUT, 0) /* (F23) MCU_RGMII1_TD0 */
+			J721S2_WKUP_IOPAD(0x010, PIN_OUTPUT, 0) /* (G22) MCU_RGMII1_TD1 */
+			J721S2_WKUP_IOPAD(0x00c, PIN_OUTPUT, 0) /* (E21) MCU_RGMII1_TD2 */
+			J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
+			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
+			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
+		>;
+	};
+
+	mcu_i2c1_pins_default: mcu-i2c1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x078, PIN_INPUT_PULLUP, 0) /* (F24) WKUP_GPIO0_8.MCU_I2C1_SCL */
+			J721S2_WKUP_IOPAD(0x07c, PIN_INPUT_PULLUP, 0) /* (H26) WKUP_GPIO0_9.MCU_I2C1_SDA */
+		>;
+	};
+
+	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x054, PIN_INPUT, 0) /* (E28) MCU_MCAN0_RX */
+			J721S2_WKUP_IOPAD(0x050, PIN_OUTPUT, 0) /* (E27) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mdio_pins_default: mcu-mdio-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
+			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
+		>;
+	};
+
+	mcu_spi0_pins_default: mcu-spi0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_INPUT, 0) /* (B27) MCU_SPI0_CLK */
+			J721S2_WKUP_IOPAD(0x044, PIN_INPUT, 0) /* (B26) MCU_SPI0_CS0 */
+			J721S2_WKUP_IOPAD(0x068, PIN_INPUT, 2) /* (C23) WKUP_GPIO0_4.MCU_SPI0_CS3 */
+			J721S2_WKUP_IOPAD(0x03c, PIN_INPUT, 0) /* (D24) MCU_SPI0_D0 */
+			J721S2_WKUP_IOPAD(0x040, PIN_INPUT, 0) /* (B25) MCU_SPI0_D1 */
+		>;
+	};
+
+	mcu_uart0_pins_default: mcu-uart0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x090, PIN_INPUT, 0) /* (B24) WKUP_GPIO0_14.MCU_UART0_CTSn */
+			J721S2_WKUP_IOPAD(0x094, PIN_OUTPUT, 0) /* (D25) WKUP_GPIO0_15.MCU_UART0_RTSn */
+			J721S2_WKUP_IOPAD(0x08c, PIN_INPUT, 0) /* (C24) WKUP_GPIO0_13.MCU_UART0_RXD */
+			J721S2_WKUP_IOPAD(0x088, PIN_OUTPUT, 0) /* (C25) WKUP_GPIO0_12.MCU_UART0_TXD */
+		>;
+	};
+
+	wkup_uart0_pins_default: wkup-uart0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x070, PIN_INPUT, 0) /* (E25) WKUP_GPIO0_6.WKUP_UART0_CTSn */
+			J721S2_WKUP_IOPAD(0x074, PIN_OUTPUT, 0) /* (F28) WKUP_GPIO0_7.WKUP_UART0_RTSn */
+			J721S2_WKUP_IOPAD(0x048, PIN_INPUT, 0) /* (D28) WKUP_UART0_RXD */
+			J721S2_WKUP_IOPAD(0x04c, PIN_OUTPUT, 0) /* (D27) WKUP_UART0_TXD */
+		>;
+		bootph-all;
+	};
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&phy0>;
+};
+
+&davinci_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_mdio_pins_default>;
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+&i2c_som_rtc {
+	trickle-resistor-ohms = <3000>;
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	status = "okay";
+
+	exp1: gpio@20 {
+		compatible = "nxp,pca9672";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "HALF/nFULL_EN", "RS485/nRS232_EN", "MCU_ETH_nRESET", "",
+				"PCIe_nRESET", "USB2.0-Hub_nRESET", "USB3.0-Hub_nRESET", "PEB_AV_BL_EN";
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	exp2: gpio@22 {
+		compatible = "ti,tca6424";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "RPI_GPIO4", "RPI_GPIO5", "RPI_GPIO6", "RPI_GPIO19",
+				"RPI_GPIO20", "RPI_GPIO21", "RPI_GPIO22", "RPI_GPIO23",
+				"RPI_GPIO24", "RPI_GPIO25", "RPI_GPIO26", "RPI_GPIO20",
+				"LVDS_BL_nEN", "LVDS_REG_nEN", "CSI_CAM0_nRESET", "CSI_CAM1_nRESET",
+				"CSI0_CTRL1", "CSI0_CTRL2", "CSI0_CTRL3", "CSI0_CTRL4",
+				"CSI1_CTRL1", "CSI1_CTRL2", "CSI1_CTRL3", "CSI1_CTRL4";
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio0_ioexp_intr_pins_default>;
+	};
+};
+
+/* CSI0 + RPI */
+&main_i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c4_pins_default>;
+};
+
+/* CSI1 + PCIe */
+&main_i2c5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c5_pins_default>;
+};
+
+&main_mcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcan1_pins_default>;
+	phys = <&transceiver1>;
+	status = "okay";
+};
+
+&main_mcan13 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcan13_pins_default>;
+	phys = <&transceiver2>;
+	status = "okay";
+};
+
+&main_mcan16 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcan16_pins_default>;
+	phys = <&transceiver3>;
+	status = "okay";
+};
+
+/* SD-Card */
+&main_sdhci1 {
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	pinctrl-names = "default";
+	disable-wp;
+	vmmc-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&main_spi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_spi6_pins_default>;
+	cs-gpios = <&main_gpio0 55 GPIO_ACTIVE_LOW>;
+	ti,spi-num-cs = <1>;
+	ti,pindir-d0-out-d1-in;
+	status = "okay";
+
+	tpm@0 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&main_uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart1_pins_default>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&main_uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart2_pins_default>;
+	status = "okay";
+};
+
+&main_uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart8_pins_default>;
+	/* Shared with TFA on this platform */
+	power-domains = <&k3_pds 357 TI_SCI_PD_SHARED>;
+	bootph-all;
+	status = "okay";
+};
+
+&mcu_cpsw {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_cpsw_pins_default>;
+};
+
+&mcu_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_i2c1_pins_default>;
+	status = "okay";
+};
+
+&mcu_mcan0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_mcan0_pins_default>;
+	phys = <&transceiver4>;
+	status = "okay";
+};
+
+/* RPI-Header */
+&mcu_spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_spi0_pins_default>;
+};
+
+/* RPI-Header */
+&mcu_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_uart0_pins_default>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&ospi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <40000000>;
+		cdns,tshsl-ns = <60>;
+		cdns,tsd2d-ns = <60>;
+		cdns,tchsh-ns = <60>;
+		cdns,tslch-ns = <60>;
+		cdns,read-delay = <2>;
+	};
+};
+
+&pcie1_rc {
+	num-lanes = <1>;
+	phys = <&serdes0_pcie_link>;
+	phy-names = "pcie-phy";
+	reset-gpios = <&exp1 4 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&serdes_ln_ctrl {
+	idle-states = <J721S2_SERDES0_LANE0_PCIE1_LANE0>, <J721S2_SERDES0_LANE1_USB>,
+		      <J721S2_SERDES0_LANE2_EDP_LANE2>, <J721S2_SERDES0_LANE3_EDP_LANE3>;
+};
+
+&serdes_refclk {
+	clock-frequency = <100000000>;
+};
+
+&serdes0 {
+	status = "okay";
+
+	serdes0_pcie_link: phy@0 {
+		reg = <0>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		resets = <&serdes_wiz0 1>;
+		cdns,phy-type = <PHY_TYPE_PCIE>;
+	};
+
+	serdes0_usb_link: phy@1 {
+		reg = <1>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		resets = <&serdes_wiz0 2>;
+		cdns,phy-type = <PHY_TYPE_USB3>;
+	};
+};
+
+&tscadc0 {
+	status = "okay";
+
+	adc {
+		ti,adc-channels = <0 1 2 3 4 5 6 7>;
+	};
+};
+
+&tscadc1 {
+	status = "okay";
+
+	adc {
+		ti,adc-channels = <3 4 5 6 7>;
+	};
+};
+
+&usbss0 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	phys = <&serdes0_usb_link>;
+	phy-names = "cdns3,usb3-phy";
+};
+
+&usb_serdes_mux {
+	idle-states = <1>; /* USB0 to SERDES lane 1 */
+};
+
+&wkup_i2c0 {
+	eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+	};
+
+	led-controller@62 {
+		compatible = "nxp,pca9533";
+		reg = <0x62>;
+
+		led-1 {
+			label = "user-led1";
+			type = <PCA9532_TYPE_LED>;
+		};
+
+		led-2 {
+			label = "user-led2";
+			type = <PCA9532_TYPE_LED>;
+		};
+
+		led-3 {
+			label = "user-led3";
+			type = <PCA9532_TYPE_LED>;
+		};
+	};
+};
+
+/* Shared with TIFS */
+&wkup_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_uart0_pins_default>;
+	uart-has-rtscts;
+	bootph-all;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
new file mode 100644
index 000000000000..f9fb0c78ccde
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -0,0 +1,594 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ *
+ * https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "k3-j721s2.dtsi"
+
+/ {
+	compatible = "phytec,am68-phycore-som", "ti,j721s2";
+	model = "PHYTEC phyCORE-AM68x";
+
+	aliases {
+		ethernet1 = &main_cpsw_port1;
+		mmc0 = &main_sdhci0;
+		rtc0 = &i2c_som_rtc;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 4GB RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
+		      <0x00000008 0x80000000 0x00000000 0x80000000>;
+		bootph-all;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x20000000>;
+			linux,cma-default;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0000000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa1000000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa1100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa2000000 0x00 0x100000>;
+			no-map;
+		};
+
+		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa2100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa3000000 0x00 0x100000>;
+			no-map;
+		};
+
+		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa3100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa4000000 0x00 0x100000>;
+			no-map;
+		};
+
+		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa4100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa5000000 0x00 0x100000>;
+			no-map;
+		};
+
+		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa5100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa6000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c71_0_memory_region: c71-memory@a6100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa6100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa7000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c71_1_memory_region: c71-memory@a7100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa7100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		rtos_ipc_memory_region: ipc-memories@a8000000 {
+			reg = <0x00 0xa8000000 0x00 0x01c00000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	vdd_sd_dv: regulator-sd {
+		/* Output of TLV71033 */
+		compatible = "regulator-gpio";
+		regulator-name = "VDD_SD_DV";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_sd_dv_pins_default>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpios = <&main_gpio0 1 GPIO_ACTIVE_HIGH>;
+		states = <3300000 0x0>,
+			 <1800000 0x1>;
+	};
+};
+
+&main_pmx0 {
+	main_cpsw_mdio_pins_default: main-cpsw-mdio-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c0, PIN_OUTPUT, 6) /* (T28) MCASP1_AXR0.MDIO0_MDC */
+			J721S2_IOPAD(0x0bc, PIN_INPUT, 6) /* (V28) MCASP1_AFSX.MDIO0_MDIO */
+		>;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0e0, PIN_INPUT_PULLUP, 0) /* (AH25) I2C0_SCL */
+			J721S2_IOPAD(0x0e4, PIN_INPUT_PULLUP, 0) /* (AE24) I2C0_SDA */
+		>;
+	};
+
+	rgmii1_pins_default: rgmii1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0b8, PIN_INPUT, 6) /* (AA24) MCASP1_ACLKX.RGMII1_RD0 */
+			J721S2_IOPAD(0x0a0, PIN_INPUT, 6) /* (AB25) MCASP0_AXR12.RGMII1_RD1 */
+			J721S2_IOPAD(0x0a4, PIN_INPUT, 6) /* (T23) MCASP0_AXR13.RGMII1_RD2 */
+			J721S2_IOPAD(0x0a8, PIN_INPUT, 6) /* (U24) MCASP0_AXR14.RGMII1_RD3 */
+			J721S2_IOPAD(0x0b0, PIN_INPUT, 6) /* (AD26) MCASP1_AXR3.RGMII1_RXC */
+			J721S2_IOPAD(0x0ac, PIN_INPUT, 6) /* (AC25) MCASP0_AXR15.RGMII1_RX_CTL */
+			J721S2_IOPAD(0x08c, PIN_OUTPUT, 6) /* (T25) MCASP0_AXR7.RGMII1_TD0 */
+			J721S2_IOPAD(0x090, PIN_OUTPUT, 6) /* (W24) MCASP0_AXR8.RGMII1_TD1 */
+			J721S2_IOPAD(0x094, PIN_OUTPUT, 6) /* (AA25) MCASP0_AXR9.RGMII1_TD2 */
+			J721S2_IOPAD(0x098, PIN_OUTPUT, 6) /* (V25) MCASP0_AXR10.RGMII1_TD3 */
+			J721S2_IOPAD(0x0b4, PIN_OUTPUT, 6) /* (U25) MCASP1_AXR4.RGMII1_TXC */
+			J721S2_IOPAD(0x09c, PIN_OUTPUT, 6) /* (T24) MCASP0_AXR11.RGMII1_TX_CTL */
+		>;
+	};
+
+	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x004, PIN_OUTPUT, 7) /* (W25) MCAN12_TX.GPIO0_1 */
+		>;
+	};
+};
+
+&wkup_pmx0 {
+	mcu_fss0_ospi0_pins_default: mcu-fss0-ospi0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (D19) MCU_OSPI0_CLK */
+			J721S2_WKUP_IOPAD(0x02c, PIN_OUTPUT, 0) /* (F15) MCU_OSPI0_CSn0 */
+			J721S2_WKUP_IOPAD(0x00c, PIN_INPUT, 0) /* (C19) MCU_OSPI0_D0 */
+			J721S2_WKUP_IOPAD(0x010, PIN_INPUT, 0) /* (F16) MCU_OSPI0_D1 */
+			J721S2_WKUP_IOPAD(0x014, PIN_INPUT, 0) /* (G15) MCU_OSPI0_D2 */
+			J721S2_WKUP_IOPAD(0x018, PIN_INPUT, 0) /* (F18) MCU_OSPI0_D3 */
+			J721S2_WKUP_IOPAD(0x01c, PIN_INPUT, 0) /* (E19) MCU_OSPI0_D4 */
+			J721S2_WKUP_IOPAD(0x020, PIN_INPUT, 0) /* (G19) MCU_OSPI0_D5 */
+			J721S2_WKUP_IOPAD(0x024, PIN_INPUT, 0) /* (F19) MCU_OSPI0_D6 */
+			J721S2_WKUP_IOPAD(0x028, PIN_INPUT, 0) /* (F20) MCU_OSPI0_D7 */
+			J721S2_WKUP_IOPAD(0x008, PIN_INPUT, 0) /* (E18) MCU_OSPI0_DQS */
+		>;
+		bootph-all;
+	};
+};
+
+&wkup_pmx1 {
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x028, PIN_INPUT, 7) /* (C21) MCU_OSPI1_CSn1.WKUP_GPIO0_39 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x098, PIN_INPUT_PULLUP, 0) /* (H24) WKUP_I2C0_SCL */
+			J721S2_WKUP_IOPAD(0x09c, PIN_INPUT_PULLUP, 0) /* (H27) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+};
+
+&c71_0 {
+	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
+	memory-region = <&c71_0_dma_memory_region>,
+			<&c71_0_memory_region>;
+	status = "okay";
+};
+
+&c71_1 {
+	mboxes = <&mailbox0_cluster4 &mbox_c71_1>;
+	memory-region = <&c71_1_dma_memory_region>,
+			<&c71_1_memory_region>;
+	status = "okay";
+};
+
+&mailbox0_cluster0 {
+	interrupts = <436>;
+	status = "okay";
+
+	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	interrupts = <432>;
+	status = "okay";
+
+	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	interrupts = <428>;
+	status = "okay";
+
+	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mailbox0_cluster4 {
+	interrupts = <420>;
+	status = "okay";
+
+	mbox_c71_0: mbox-c71-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_c71_1: mbox-c71-1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&main_cpsw {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii1_pins_default>;
+	status = "okay";
+};
+
+&main_cpsw_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_cpsw_mdio_pins_default>;
+	status = "okay";
+
+	phy1: ethernet-phy@0 {
+		reg = <0>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+&main_cpsw_port1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-rxid";
+	status = "okay";
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp102";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp102";
+		reg = <0x49>;
+	};
+
+	i2c_som_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&main_gpio0 {
+	status = "okay";
+};
+
+&main_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
+	memory-region = <&main_r5fss0_core0_dma_memory_region>,
+			<&main_r5fss0_core0_memory_region>;
+};
+
+&main_r5fss0_core1 {
+	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
+	memory-region = <&main_r5fss0_core1_dma_memory_region>,
+			<&main_r5fss0_core1_memory_region>;
+};
+
+&main_r5fss1_core0 {
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
+	memory-region = <&main_r5fss1_core0_dma_memory_region>,
+			<&main_r5fss1_core0_memory_region>;
+};
+
+&main_r5fss1_core1 {
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
+	memory-region = <&main_r5fss1_core1_dma_memory_region>,
+			<&main_r5fss1_core1_memory_region>;
+};
+
+/* eMMC */
+&main_sdhci0 {
+	disable-wp;
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	bootph-all;
+	status = "okay";
+};
+
+/* SD card */
+&main_sdhci1 {
+	vqmmc-supply = <&vdd_sd_dv>;
+	bootph-all;
+};
+
+&main_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
+&main_r5fss1 {
+	ti,cluster-mode = <0>;
+};
+
+/* Timers are used by Remoteproc firmware */
+&main_timer0 {
+	status = "reserved";
+};
+
+&main_timer1 {
+	status = "reserved";
+};
+
+&main_timer2 {
+	status = "reserved";
+};
+
+&main_timer3 {
+	status = "reserved";
+};
+
+&main_timer4 {
+	status = "reserved";
+};
+
+&main_timer5 {
+	status = "reserved";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+};
+
+&mcu_r5fss0_core1 {
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
+	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
+			<&mcu_r5fss0_core1_memory_region>;
+};
+
+&ospi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
+	status = "okay";
+
+	serial_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-tx-bus-width = <8>;
+		spi-rx-bus-width = <8>;
+		spi-max-frequency = <25000000>;
+		cdns,tshsl-ns = <60>;
+		cdns,tsd2d-ns = <60>;
+		cdns,tchsh-ns = <60>;
+		cdns,tslch-ns = <60>;
+		cdns,read-delay = <2>;
+		bootph-all;
+	};
+};
+
+&wkup_gpio0 {
+	status = "okay";
+};
+
+&wkup_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	vdd_cpu_avs: regulator@40 {
+		compatible = "ti,tps62873";
+		reg = <0x40>;
+		regulator-name = "VDD_CPU_AVS";
+		regulator-min-microvolt = <600000>;
+		regulator-max-microvolt = <900000>;
+		regulator-boot-on;
+		regulator-always-on;
+		bootph-pre-ram;
+	};
+
+	pmic@48 {
+		compatible = "ti,tps6594-q1";
+		reg = <0x48>;
+		system-power-controller;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&wkup_gpio0>;
+		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		buck12-supply = <&vcc_3v3>;
+		buck3-supply = <&vcc_3v3>;
+		buck4-supply = <&vcc_3v3>;
+		buck5-supply = <&vcc_3v3>;
+		ldo1-supply = <&vcc_3v3>;
+		ldo2-supply = <&vcc_3v3>;
+		ldo3-supply = <&vcc_3v3>;
+		ldo4-supply = <&vcc_3v3>;
+		ti,primary-pmic;
+
+		regulators {
+			bucka12: buck12 {
+				regulator-name = "VDD_DDR_1V1";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			bucka3: buck3 {
+				regulator-name = "VDD_RAM_0V85";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			bucka4: buck4 {
+				regulator-name = "VDD_IO_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			bucka5: buck5 {
+				regulator-name = "VDD_MCU_0V85";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldoa1: ldo1 {
+				regulator-name = "VDD_MCUIO_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldoa2: ldo2 {
+				regulator-name = "VDD_MCUIO_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldoa3: ldo3 {
+				regulator-name = "VDDA_DLL_0V8";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldoa4: ldo4 {
+				regulator-name = "VDDA_MCU_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		bootph-all;
+	};
+
+	som_eeprom_opt: eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
-- 
2.43.0


