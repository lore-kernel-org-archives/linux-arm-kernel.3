Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4E3EE645A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXp1O2UWndVDGT19Pyd24bWUXnYpo/sow2vl7JA5S2Y=; b=GGxNk7Y6ektTkqJBXKGgoPkv+E
	c6H9ikLAB6PnfZkD7LMWgHMoGhNfFYhLAMNdOD4TFGw3pkPvrSgaUSbUraMOXiYpAMrszpgx1mslv
	azdCAVk26HLTxRMrjM/s/w9J2H1WqOUT9YidiPGLIijxPjm5mMJcUmhMqBB7KsS0pkHPyXXfOxjlX
	QoXL+RpZ7cPWiOMMT2U+IJKydLPCRumgbhHGQZ7RYZ60I4nBwiUsXlnU1uBnxCFG3PbCd+CCmHXYt
	71TlQhh5AuOJVM0LiD8xzEU4hd1OwK3m1kTsOBCmeZrLE2lGfWfJikF/2IPXv3KligxwCVWfT6pEj
	o/QxFAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazQ2-000000069yV-1KNP;
	Wed, 31 Dec 2025 16:51:30 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazPz-000000069xM-1imW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 16:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTyLDBPyiuaX8eVW/P/jvbeJ9mucT3I0mBTUmxg5wz33uGyp01dZYUDkPIYMIg2qpZZ72T3W7GFzMtlZ8eAfGOMO/BF97ar1GlE1ohbiDNxetLD8KWNE5VzXNpHnTgoXnhiFFSVIb9xEIwuABpt1zPbWnYpg19xS8+CEEGXXa4H5BMs/BejFoxTRGj/LZtQa7B63j3QuXThptFCuwsbbH2T0gzF2hAKU/FBE2xyfdAeaSYyzasMgkonZ5tQxO8Ync8MFPrm7AyqzHqJ2cE7ITMPn/xfBYMH9EsdJzvD6sTyd46EfKHbaBpl7Gls3ZAC2UPM3JXJx7u2VhdR6CvMK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXp1O2UWndVDGT19Pyd24bWUXnYpo/sow2vl7JA5S2Y=;
 b=kYhy41b5RB97dP62nEXyBWBM/UNePbURmPR9mTyu2gmN3gOj5itSQqgPNh5cBYIt3xxJ7/tGlCHLo1lSMDFbJcFCcQ2oWsYhXVQaxgETlCydb7iTY8tiyC46Xt8tA7JeJBWEiAlLo38BL+OOeDt9JRCxk6dH9eTXPsThPPVT3+dFkyVyKlu+M2lFLPYA0gWshGXOV8Vhy7KB7Mts3H5glfMg5rYcE2xROD9EBSHZedyY2Sl5Cy4bl1FXZhBWjFTl6xlJ6uQ+pAFucidG1GEqt6Wj75DU1fe6p8lHqIqYk2buqu4dWwuWsk8uGE1zgHzVdsLveUmD6D0xlnsSaGzisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXp1O2UWndVDGT19Pyd24bWUXnYpo/sow2vl7JA5S2Y=;
 b=sFMvy2UWYm37ZAOzrpZJMX/5d6vvI2emoyGIVAV61T1gowqfRDCrjWpTw5MP94WrAZxZqX3EB9Hh648COuqqYbxya4AD/lZNvPklAfLc+bE89suTDE1sQDNv3iMG+Q/4xkg6HauemeI5vVUyUihJwojpw7ClHffobeb49nNKfjo=
Received: from BLAPR05CA0038.namprd05.prod.outlook.com (2603:10b6:208:335::19)
 by DS4PPF92DC283F3.namprd10.prod.outlook.com (2603:10b6:f:fc00::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 16:51:18 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::4a) by BLAPR05CA0038.outlook.office365.com
 (2603:10b6:208:335::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 16:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 16:51:16 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:12 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 10:51:12 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVGp3Zk2583331;
	Wed, 31 Dec 2025 10:51:08 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: remoteproc: Add bindings for HSM core on TI K3 SoCs
Date: Wed, 31 Dec 2025 22:21:00 +0530
Message-ID: <20251231165102.950644-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231165102.950644-1-b-padhi@ti.com>
References: <20251231165102.950644-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS4PPF92DC283F3:EE_
X-MS-Office365-Filtering-Correlation-Id: 577b45d6-7092-468f-a68b-08de488cd079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LHBg5vyiI5YRhSjBjcbFQQJ7qXXVUns7fTE7/W+9RiJ9cOMFubUvZZAd45b5?=
 =?us-ascii?Q?Om9/iRwPN26OV2SDJ3pybPvZu4OL1b9+V12h9GE1KC6eYMDz46FyBVOhrIPo?=
 =?us-ascii?Q?7n+SoUAWrA6h4vAkfG1vengG4JRS7vUCbLaEh9CQnhdImtcg+rMpXFv+dOfs?=
 =?us-ascii?Q?Y2wUGSalFlWFX1YiuQ/bHtEkuOg+9BsSqItPVvDsL7N8ETHxujfajQTsCqPO?=
 =?us-ascii?Q?SsclOQFWG5xZsrN50N+2t7jyqWm+XiaYN/UySJP9i2J5vweIP6eE4Hw06W86?=
 =?us-ascii?Q?by9k6MT/vadwTIbBjfqmCU3Ww2IzhmajKuXn/VaSZdLnlKOqu/AKGTM5xEA4?=
 =?us-ascii?Q?UmTnqy/lye3a58XFlQkLgfZiyzWXVi4yrxLBEqYwrACyly44ozdoWKGyDS5U?=
 =?us-ascii?Q?CxIwqBgEsNk7S8TkG4YnerkfCpU3aH0nBQPMgNGQIqNn8lfQ1FxPlq0l7BIJ?=
 =?us-ascii?Q?Gs3qNjtjbbVp/8i70tQKliVEvUcuEvJNSUq6j8iC37b14ZR9UqkiImuXIAO5?=
 =?us-ascii?Q?AEodOl7c5X4jNaquTJaqpD0AmCWD9Xz/+GYV9+F5jmbmEdLp+3H3oa0IPCnR?=
 =?us-ascii?Q?ILWhJEOV9sBvbuDNGaI/pd1Leh+ctUSmQGFI3aWENCqC9PWwvKrMMzM/11YK?=
 =?us-ascii?Q?28EcDLSwUcd38zm8O/3eCnJzbwGO+3NhuitJLhK84be1g3tI35sVwnxx+hu1?=
 =?us-ascii?Q?PbhJaRWR54V3QpgPS/lWyCrJ25b77+Yy0QdMdU9hRgV71FKUszxawy7nwxq9?=
 =?us-ascii?Q?szFkdrb8p3SKbAOeWzW34GV/uH+l8/Q5vDToeO9IbREsPfSI5JppcFpxcnqE?=
 =?us-ascii?Q?mYtfv3+H6N2CdpCDAePiIEnQum8FxzK+NqYmPBx3ipJYsBc925tbPhnP6oB1?=
 =?us-ascii?Q?cJrrobSjml2NgCL1iC/YH3nHbQv381IQwWNYh2Nii2AmuoY7OuorxAUUcNtP?=
 =?us-ascii?Q?6wNdQDly8Cz3gnlh6YfgxSariqqIAkGzTzBOQno3I9x0qvWhwMenxctolNXZ?=
 =?us-ascii?Q?+y3FmnDfjC/HS2Oj37KE0ieiMYCmnfwFeXhT0pUDhA77cK/mixXuKz+WatY0?=
 =?us-ascii?Q?kg2T8bi8Z5NnNKYVQIvo+MEGeGMV1j0osPyzK+Y2FtoNydnmm1frawsE7q6z?=
 =?us-ascii?Q?HC5I443ZC+VM7k6vYxRsCDNHYzFGSp7Osn+a5648nD0xNYJB5IsMNfHn6uCJ?=
 =?us-ascii?Q?gbWet8dYV4l87qp5Xdeojz5iuVyEwKST5/KxI9lFm2MBXoZAS4oCtsfmJf3u?=
 =?us-ascii?Q?VmyIgutTSJttk8jJiUQIleHiDTPT+Fqbs6hfGQvpi/aEutkm2CXX8XnHa394?=
 =?us-ascii?Q?GdKCK40aLZU4QkBcPAuFSpMcLVsq2fxNB0/rNQJea6UEIHahNIOzd0eJhQYK?=
 =?us-ascii?Q?OTs+1lS8xZ07vZiymaUILku3fTlifUbzljCBWIkPh3iLdJ/jOWrRLro47rGM?=
 =?us-ascii?Q?BK4dtq9Rv8h8DvodO5DieC2aqKtVrGn+NybYrx4cm9eeq5hm/rn+c6VRfveV?=
 =?us-ascii?Q?G9jNFK++2OluMHDVyfbm1/V2q11QGNlQ1ov77iQspeCzUv0qSbpeJ0y9P0/N?=
 =?us-ascii?Q?FVtsneurTaGuyCbzmxo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 16:51:16.2276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 577b45d6-7092-468f-a68b-08de488cd079
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF92DC283F3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_085127_454953_2E4468BD 
X-CRM114-Status: GOOD (  13.49  )
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

Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
core in the Wakeup Voltage Domain which could be used to run secure
services like Authentication. Add the device tree bindings document for
this HSM M4F core.

The added example illustrates the DT node for the HSM core present on K3
J722S SoC.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
new file mode 100644
index 0000000000000..f61e4046843af
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,k3-hsm-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI K3 HSM M4F processor subsystems
+
+maintainers:
+  - Beleswar Padhi <b-padhi@ti.com>
+
+description: |
+  Some K3 family SoCs have a HSM (High Security Module) M4F core in the
+  Wakeup Voltage Domain which could be used to run secure services like
+  Authentication. Some of those are J721S2, J784S4, J722S, AM62X.
+
+$ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,hsm-m4fss
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      - description: SRAM0_0 internal memory region
+      - description: SRAM0_1 internal memory region
+      - description: SRAM1 internal memory region
+
+  reg-names:
+    items:
+      - const: sram0_0
+      - const: sram0_1
+      - const: sram1
+
+  resets:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Name of firmware to load for the HSM core
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - firmware-name
+  - ti,sci
+  - ti,sci-dev-id
+  - ti,sci-proc-ids
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc@43c00000 {
+            compatible = "ti,hsm-m4fss";
+            reg = <0x00 0x43c00000 0x00 0x20000>,
+                  <0x00 0x43c20000 0x00 0x10000>,
+                  <0x00 0x43c30000 0x00 0x10000>;
+            reg-names = "sram0_0", "sram0_1", "sram1";
+            resets = <&k3_reset 225 1>;
+            firmware-name = "hsm.bin";
+            ti,sci = <&sms>;
+            ti,sci-dev-id = <225>;
+            ti,sci-proc-ids = <0x80 0xff>;
+         };
+    };
-- 
2.34.1


