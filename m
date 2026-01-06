Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DFC47BE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YEiQXO7uE6dExPXlM7VWWG4WtIRf3qiGKTvzOWljYA=; b=CsYZXwUmLCUG45KVJFjY7fvdHc
	CLAflMsIlUf7zHa3WN5xCFiA00cqlzWoKzPdi24WPRbJpofDWNen6G020+K0AshNQSYFe+4gYWVnX
	1CLK7VgyQWj1reA82swP6B90Z79kNJWgNKWktbqW1s5UT2gzTYxjlTVeNqf7Q9Ja+YCbjrGFAhQpv
	JIvegyM8xnGADGWAs2dnuv6S6GmN//GYyhNI+eiFsgDCHmMA3rwOaXNMaTgIOXA031I9zUr3qnfBs
	/HhHs08JBl15nImmm9Rj4SBFC24aBxVfpnXHYhWNeIHRLDMp+T2+MmbUiB76CV7jvKhWMCbgjfOOa
	nravVspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4br-0000000Cowp-2YTe;
	Tue, 06 Jan 2026 10:48:19 +0000
Received: from mail-westus2azon11010047.outbound.protection.outlook.com ([52.101.46.47] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4bo-0000000CowM-2Gzw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnQYso8MeC5Aie9PzyQ4nqyWYR0fYi/n7J1FAcau0o4el5FD7kh902II01pjsBpjllRY9DeB7GqX9zMfPWdO6tOEMAA7q3mEGQvdkDaCnkKEq5O/Rvpf3l6+e/nmO1uTpdvJSY+SCAad0mXrHCp/xFfdkUtpbIBP8NInVFL9N1M0cIxf+6D1fVFQe6h8Zmg8AZPdqib/CFfnRJVx6x4mVmWCpyQE1++miGEWwiOR8Z2oeIR0Ld5vOj3/Uwj/IQ5AyswLm/JSBRtCrkWCXpdyGmUBxseMcnYhydcB5H3Rgb2JquEAJr6dFwBWLBdFZ6hC8NMM1mP1TIJQZUyJqKhlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YEiQXO7uE6dExPXlM7VWWG4WtIRf3qiGKTvzOWljYA=;
 b=EX26R+200SsK2/ZBmelf5/S3V0e7Tjj4z3QlTU/4jcqC1HjKwGRyM5nULIss8Ld+gxrnZa/eJGwyLpnvpLJr945oEdl9T/e8UF68JGUcG0fVvVSMPjwNIwpnyr3FZ7aL9XggbWWrFUIxPG6Pq5I9bnPrxP3/07ybFnsE6L3nra0D9embRXgb2vm/yXxCgSHCDz9aQLLurHKQmC24CQhn64j1uwjb2nJnRiuHxrLQA3XkUGGDeyZw2sPuyS/0SWBF7GutDuPe5FLrMcgrDSLwRg2fQVHcwy/UfjX9purJw8bcekQhHH1C1Im7bcLBmYGvnRafcXNZdQyI9uDEojgqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YEiQXO7uE6dExPXlM7VWWG4WtIRf3qiGKTvzOWljYA=;
 b=hMc8c1e28RUpZqBie2KZAuSsKe3lyv2EIFVh21HgTFHprUx2z+EnPj3jK0HbKjcA/FivPnLryyLJu5qOWKhY/QJSJgvVRqn80m9YBUlE9jakj/pTALOTVbynL5wig/7KC5PkLyFMDIjnBEw5ev4Db9GJlU/Mu//+k7qNdkyd+EE=
Received: from BYAPR07CA0104.namprd07.prod.outlook.com (2603:10b6:a03:12b::45)
 by CY5PR10MB6118.namprd10.prod.outlook.com (2603:10b6:930:36::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:48:11 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::d0) by BYAPR07CA0104.outlook.office365.com
 (2603:10b6:a03:12b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 10:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 10:48:11 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:05 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 04:48:05 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606AluwZ2890257;
	Tue, 6 Jan 2026 04:48:01 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: Add HSM M4F core on TI K3 SoCs
Date: Tue, 6 Jan 2026 16:17:53 +0530
Message-ID: <20260106104755.948086-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106104755.948086-1-b-padhi@ti.com>
References: <20260106104755.948086-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|CY5PR10MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 3797bda8-5b87-44ab-5464-08de4d11160b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lj67jmmx9YdKtK1jDDbgnDHPZWFF6V5Ioh7nkItdM529lcNhHcMY3T+mkNIr?=
 =?us-ascii?Q?i3K9UC1CwzhJW97/+lRcdGFhwsah0LXD+QNa4tvHRJhCv8Ev3uA8xhRG93jS?=
 =?us-ascii?Q?4t/xzKuFM85VRIPJQ1hruAueCcz4e0Jq68KfW2aCnHk/EMozG6AzToyd2jX8?=
 =?us-ascii?Q?57jTp9RzdlIsYGtt2FTrdsoqpu7GZsKX1H7+PJl+NRCb9DVxonapAA6k3qwc?=
 =?us-ascii?Q?WsOMTMKYlX4so1zGAyNLAnez9r4GVE3FQzuAYFlPw2OOelc7WoEMmpwarMuQ?=
 =?us-ascii?Q?vAh5F8X8ZocLdbMeQkKzVBCj4l+6amHOXUeB/kVlwV3FpYKaQpNHt/YU9YLH?=
 =?us-ascii?Q?NjclZxqbBG8vqnq6Rea18eHHWVooQPqCtF15c/zYvXtf7VSVd34CpBKXs1HV?=
 =?us-ascii?Q?hJfAvQZd508S/tkEU//ejuJhQbOtAElCRe5qFSCd74GVfi19xkplodtyEeKt?=
 =?us-ascii?Q?SLk9xJxFw3G+ioOQT0+PHH8hgEDEbAgF8sweUURLvQUenbABBwtNnxwxyCuC?=
 =?us-ascii?Q?q+5OhovyEyYxXJNov2efIoJUPhoYdu/bOPznfrIyDFIlHXCC9vHGPYdUC+Wd?=
 =?us-ascii?Q?QmMR4YW0ZoOdz8r7s2hk6j/UJbxivojOLdozwV4F7/GUeBWmQowpyKuS6iZ/?=
 =?us-ascii?Q?DZPy+Y4lgEx38mjjzQknrEZKe6byUGzOCmZNV6xOQbjkShtv1tHAtsgsin4F?=
 =?us-ascii?Q?thvS2YAzkK+K00+S1ZxloJ52J1JHS7vXrLypacXkdR2cN1xlHXejxKBXiIna?=
 =?us-ascii?Q?cKDIL+KUFMtCpSYcDJNkwUq2id2rwAJ55P8Y81Yh6Jrn6S7E/CTE+aNd3AJS?=
 =?us-ascii?Q?hTyJE7SKhiUghSlzqDr/K8vGpZ4Zbm3wWwqPp72KnR31mMFZsE9ARb6OGXsu?=
 =?us-ascii?Q?Ub9xT6LyAaF4mW+2/3ccB15ZmsIBUO1ElZ9HvfYMCRalPH5/jC8ElOmP1Lsm?=
 =?us-ascii?Q?amPVb6n2mgJr9hnKTiitqI1kgrZcROeRl9NWkINqnPOippz0TQxen6qU1woo?=
 =?us-ascii?Q?vlXWZ3QOjb4eUqLnzc5xCyiLRXsBE/a3OCurXKofkI+Nf05bU1BahpTE1ZD9?=
 =?us-ascii?Q?oYGV58ejFf9tlKoTw05zP79cLEC5xuHf4IwPtSE7lBJeHfKwepG9zTQU0KGa?=
 =?us-ascii?Q?juTZxUxnpjTMlxscYI9bgn0lAlSOlHE8Lu73dl0Cwaqv1ifJPqk3cYYSR837?=
 =?us-ascii?Q?e3h+mfSNoSjKCOuipAQjvVUiVN0GdJZdWUmZNlcFY3cLPTAWmmyZmdgoJqnm?=
 =?us-ascii?Q?1L/L92UhoC/Tx94l9oNZhi3ABeN/dpF7SflbvXh1xiNRy7i2oOTke0bprl4J?=
 =?us-ascii?Q?+2oQZSBaD2KVBP8eVP3pd6pjPpd3DaM2LA+ZaHvX5DjfysxXttExrbOTiU6F?=
 =?us-ascii?Q?ayof/14PwNlKt4aOCHIRKziviD+VoPpDZMmAYiKqRzZF8RVIf/Fz8L/66y5e?=
 =?us-ascii?Q?WXJHry+ZvoaNWs4YT8FwgFYF8rGKs+GG3nGeL3AgWnlY8gmbe8s+2H2NEV8F?=
 =?us-ascii?Q?wgNc5Br5sQZtXseJ7yWv/Bwr62N8rDaBcvNm?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:48:11.2095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3797bda8-5b87-44ab-5464-08de4d11160b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_024816_581614_070F5391 
X-CRM114-Status: GOOD (  13.21  )
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
v2: Changelog:
[Krzysztof Kozlowski]:
 1. Update commit msg to remove redundant "bindings".
 2. Update filename to match compatible.
 3. Remove "address-cells" & "size-cells" property. These belong to the
    device's parent node.
 4. Drop description from firmware-name property.
 5. Fix indentation for DT example.

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-2-b-padhi@ti.com/

 .../bindings/remoteproc/ti,hsm-m4fss.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml b/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
new file mode 100644
index 0000000000000..9244e60acee37
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,hsm-m4fss.yaml#
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
+        };
+    };
-- 
2.34.1


