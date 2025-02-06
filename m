Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5C2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQLekWKCfC8iUgnCdBkNohqR9d90w2vuznCXXlYowbE=; b=FJD/9Re5aQ9PyHxOl6GwBOSpkc
	N4qFDiU6SICmrMHo2nsuoQXPgGTDqWYx239Bzmrv6ycsTcbRqbxhQsgmokJX2QzHIhCyetMzPVobG
	wi2LoXMtRNafTKDJ2CZkBYhQGlHbvJxavMkiR12lyqIiTKpoDIunhzqU9jmFVT3lkDjgZMpo3AFsF
	vleWuNDZvZ+aENOaEuOMxTtHkS3l6nZ1e8EjnVNXzEnBoMwuGLW+rVeloQCwhIQwOY2fNjRSQ+czv
	pXRRtuHk+l0ADNRZlEuo8Pbd95O1dRDShtXaDPHEmoZOsaeOQ2r7mugTXabOuid3XoZBX7gjvYWrJ
	Wgbg6q8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2ye-00000006bhD-0oC3;
	Thu, 06 Feb 2025 14:35:36 +0000
Received: from mail-co1nam11on20605.outbound.protection.outlook.com ([2a01:111:f403:2416::605] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2mb-00000006Yil-3aGt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:23:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfmoSwXTBmBaaNXRfH8L/HSGQ8DL60MNKtN0J55X3vk2WSistNmMz/fstbZ91aDPRLcDon2scHCTpnCMhiWF9nfcm6wV2M5XIAfk2qHcVG2d262IwxvT+wI4/K8OYEKpE9sKd1gqacmlNNBn0ppv7q1N7gX+c3t1CI/2ET3hUbgFhSmDc/EwCfmwbE1qz56i84eihYjNv4//eagQQGI6ixwmePQl4MlCg39Z6SQN6L5hYY2B5CpdRr6AL13vB/t5amSb2t3iHbLmnuCB2GrLZP01T05kkZrDb00lKkC/s0L8tSsYvxS2Bb5OUBFAdg5wla76HIVu0CztgdWu9QZ5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQLekWKCfC8iUgnCdBkNohqR9d90w2vuznCXXlYowbE=;
 b=F7usRoyZYBV6sMN6j5dC6bYDUhwDTANpDboEwB+CdhdwODKUzqoGZVP8aTBH9sIehybmPFsiXwjpfxJiEXwcE94mHVKP5EzoTHwaQrz0Fte8Y+dniez93awW8t7mwc9wxFsdPepJHvQr+Huutx95VlEbfHpLHwoL+S8zd84qyv/DysB+849m40NW70NlJj/xnpsnSZcAZOHL3tusPKz4heY3f1nWOYby6SC8kRDMnj3Q5z3C+VXFiVXoYD8QQvD1cEoEPnuiXt+JzwiWvX/rJ8GdAQ0xg5HhuiHm6xTTvF7VzBAlTBQw0vZV1uxdsqplCvMfG1VbOOjyS4RA/9CG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQLekWKCfC8iUgnCdBkNohqR9d90w2vuznCXXlYowbE=;
 b=I4wzMd7XS/LsMpBpA1tX4KsMXdhm8isWhS7ccPdZkJ4PPMlUHeqUEdHf6qiWAFwv1TZUb2/RfqaJnrvWsjlf/Z2RFmZm30o7GCymDl5OU9FFgwzEP64gFSibN9ruwCiOMuN4hsvfVYcd7pEw/ksHkLzAIe+X8TNCCfIz4D4lYkE=
Received: from BN0PR07CA0003.namprd07.prod.outlook.com (2603:10b6:408:141::15)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 14:23:02 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::96) by BN0PR07CA0003.outlook.office365.com
 (2603:10b6:408:141::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Thu,
 6 Feb 2025 14:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 14:23:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 08:22:57 -0600
Received: from xsjwillw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 08:22:56 -0600
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH 2/3] dt-bindings: firmware: xilinx: Add conditional pinctrl schema
Date: Thu, 6 Feb 2025 06:22:43 -0800
Message-ID: <20250206142244.2553237-3-ronak.jain@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206142244.2553237-1-ronak.jain@amd.com>
References: <20250206142244.2553237-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ronak.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: ea61c532-6eaa-4bda-2e59-08dd46b9c364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZBGJEoEtKb5zi3saJpv7gcDKIZZAY2vR7yPL8U9DrDGvBf06HanjkbVnfcWd?=
 =?us-ascii?Q?vgQ8Gnkt2Kg8mFnz9wRZYX6Xrx17GoI7VLK1SFvw2hwQgSLNsKknCBsXm0rP?=
 =?us-ascii?Q?LUXQmzzP55/vFAwu7zqaDUL+K/YOwlZuSS6lYzwq+FDsYZdMAiQybLKY0AwW?=
 =?us-ascii?Q?7h839K/DeKzstdVa0RtgPydbqI2n8VE0J2ju9EmH7AHve56pUyBoQZGAx5Nx?=
 =?us-ascii?Q?sVLasqUQwlLhhFG2jEqbAQ1rY+NL+A7iJNRqOrfEzUW/Rvdbiq2dJFghW/5a?=
 =?us-ascii?Q?8PJRjcBDW2RCTE8Nd7730G1XFwWV6sxFaZCkjU4PaRmNQUKwkcZ6fBrbsHyu?=
 =?us-ascii?Q?Zd0DR6c93+JW6GU2tX7LiBUyRqFAga8DaOKUAPntF6EIRPHiKg8Ip8xk5Zze?=
 =?us-ascii?Q?wJBpxsHnO4M1QgWswB1m/Ju5UyIalrxZB0jHL43UfoFMbU5ootTYhj7qiJL5?=
 =?us-ascii?Q?dv4cJCkq5z40hhYd5LHTjC3rzOUOTqjbeOynsBWCSXCsBs+Vb6lEvzDVacuJ?=
 =?us-ascii?Q?sPxnT5+OmEQKE6+LEhyKJ4/XSwUjKRKTYXQtXVfUHDtrY+TZeZnq1O8LoThD?=
 =?us-ascii?Q?nq/kJNAqD2Gd2zyBfz+ZzEwSmCQEBNBFx4uysTqxR5nz9jhUymawVWunmhG0?=
 =?us-ascii?Q?EIWVbkr/b0WWhFtnuryEbbVMZgNFa9oHgdlvGvQRXoRwvo1q+uh5pOiFf4HW?=
 =?us-ascii?Q?faJ2wLANv6z7n7yGjBdnh5ub4RgZ/gbH3QOKX5zUWL9Z7FCXZhK+DD5NxSxW?=
 =?us-ascii?Q?jmGkzSEkpILP2eP8oIzDI1+6u8Hof9H+hfrIsBKyTgKNHFB000PAOeciPTKj?=
 =?us-ascii?Q?amQF2x1uQ30HFSnJTcQX/hMYM6O0c8Ev6ojFsX6XBrw6ItKqqrQj3dJQbjJN?=
 =?us-ascii?Q?jURDgnH89jZEJCWgszAi8cx8dglPq2LdP/D9pWD0lAuejutir6NDvc6FLFdm?=
 =?us-ascii?Q?UukTFMXRI3O9Mu4rLFw4Z1S/v0Seac5q6RjUoCFHvajzZpOhIKA6CjcBI43T?=
 =?us-ascii?Q?K6VYj0+9Z+FZk4TwCvNv382sA+sDEPdspfz1/i8EGa/iT6yfZMVHQ2Twu/ni?=
 =?us-ascii?Q?NGZj/oETMJS6Dz8V+TmgYAkgvGyyR4XFyZ6J1wSDboLxxcOstbgdmF03ETDg?=
 =?us-ascii?Q?MA4qOkJsYyEWRtTxQSR5cC1HZuQAoRwOvDNwHDCpIFstuKyYD5RlR5zJP/Rz?=
 =?us-ascii?Q?YOsK+zEa3a6BnpSZqrit+MZEMdwlWW8Ol95qoLXIQWQb8XHWkoq4AJ4lLwhi?=
 =?us-ascii?Q?KsBOZi++A5ErfCn2DSoCyVD+Mv5Mtaz9cATOp39VGOQbV9lVKUvulraNLSBK?=
 =?us-ascii?Q?uwJkgmVZgFMcxNK81BasNjeKUjj9bAEKHpJdqyU7R3lUmgNgSilVmxW/sMDi?=
 =?us-ascii?Q?SI0udI03F+B7I0eSkQmMEm9UXM8yAcylQGbm866z7JEUW7J2lmjzKw84jVne?=
 =?us-ascii?Q?VkOg+/csLuGuetkN7vfps7tEIUuzz4xtVKYBQB8DjA2VtBkyl7sky8mKE47G?=
 =?us-ascii?Q?4534nl5pCLaY/pE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:23:01.6713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea61c532-6eaa-4bda-2e59-08dd46b9c364
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062309_892193_15546F74 
X-CRM114-Status: GOOD (  10.52  )
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

Updates the Device Tree bindings for Xilinx firmware by introducing
conditional schema references for the pinctrl node.

Previously, the pinctrl node directly referenced
xlnx,zynqmp-pinctrl.yaml. However, this patch modifies the schema to
conditionally apply the correct pinctrl schema based on the compatible
property. Specifically:
- If compatible contains "xlnx,zynqmp-pinctrl", reference
  xlnx,zynqmp-pinctrl.yaml.
- If compatible contains "xlnx,versal-pinctrl", reference
  xlnx,versal-pinctrl.yaml.

Additionally, an example entry for "xlnx,versal-pinctrl" has been
added under the examples section.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 2b72fb9d3c22..d50438b0fca8 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -76,7 +76,6 @@ properties:
     type: object
 
   pinctrl:
-    $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
     description: The pinctrl node provides access to pinconfig and pincontrol
       functionality available in firmware.
     type: object
@@ -106,6 +105,21 @@ properties:
     type: object
     deprecated: true
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: xlnx,zynqmp-firmware
+    then:
+      properties:
+        pinctrl:
+          $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
+    else:
+      properties:
+        pinctrl:
+          $ref: /schemas/pinctrl/xlnx,versal-pinctrl.yaml#
+
 required:
   - compatible
 
@@ -164,6 +178,10 @@ examples:
         compatible = "xlnx,versal-fpga";
       };
 
+      pinctrl {
+        compatible = "xlnx,versal-pinctrl";
+      };
+
       xlnx_aes: zynqmp-aes {
         compatible = "xlnx,zynqmp-aes";
       };
-- 
2.34.1


