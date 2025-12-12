Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CC7D4415D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vComyN2Wf6JE2PMIU9Thg8I50J49EAU81BE+rUFGm4=; b=Bf1STcaPFbsPJoZijRaVhHFcIZ
	e0a3mc+TlcCNlp0+zIGJJi8oxwUngYcJno2U19W/KW3aGSyGK64fEfdYOaK/BH9LRuE8h06vHg1/4
	JdmJO7xY1H/4CXx7tuIFGiZKbx7sGSN2ndnr5XTsZiMiBZAULr+22gfWmuqdtUXiEPdxKtk29xvsO
	EH168lRU/xaUaKS31EybVSmEt8PCMP7kizKceO4SYsxlyyMPVILQuh2D+PCc2jPvp1Ji31ak/4SsQ
	P+TEBSWr4n38U4tx5WdM+mJn6MSSIST6RU6XglTJcmcYwm36cejaiT6HTWxdGTE6I3nlpcF5J0Dev
	AU4udkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU02D-00000000PGb-3Dxc;
	Fri, 12 Dec 2025 10:06:01 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU027-00000000PEX-23TR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3bqhB3PLF2izu7WwcjB6T77kptRH7umCGa6T40r+Fvnn3gD4Knu0HCYHm8CwfbRLFnh2kspvQTeaUvF5isMdD0NQST8NxrWyLqUKBCFUfLJKeQCywunzv/wMyx4xuj1Ms75cesABh7SywMtG7cr1byXQBRAf6S7X+Bm9MK0T5Is+z54Ry514CXbVrdz3W+LT7sd3L6hxNftdNQ2bBgBYDGyEIuX62VVwbiUUYd3X7HaWwhZKOqKxLy/72ckvas9RBikMyKdinP6XgUEAQTIH/Whi1K1b1zbwRwYdgVZIkqraNaFbkmfSYSfOEfDXpX0snf+gvlr2ngoRgd2OjgGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vComyN2Wf6JE2PMIU9Thg8I50J49EAU81BE+rUFGm4=;
 b=g9Q1OmEcdGlpzpdOvQphxYkJEspMqMKxGircatgtGihzwIJ9OThlgWI2LglRvqguSP/yC/HncvmJX5ZIPLnV/VugTNWs4+bS6e1JpYEy9qDxMVcctXRF5030broeaJToj2+/oBlFk+oI1zZ+E7kRE2EzGgB3H2GJFKIc3ct3iBw3w1Ao2n8rHn1301KdHyTKQiYsusmnPWWyGxA+aGFpdlZxWTWgWsTLZ2zpAQsF7kt+KIK74hhBXBvBp3AQsNFyZEBVt1D9Ne66UfHwP+UouERNjVy2PVKFz+zQruBgQ9WD2jSTkRJmV+8eYumPf5yfQRz2v1WLoSud4xn9BMsGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vComyN2Wf6JE2PMIU9Thg8I50J49EAU81BE+rUFGm4=;
 b=A2972a3x8EYhti9+lExXHLZFds+ffN42MIafqL7gsAJ+qAq8xPauHhcpgmnFWHMG0shltzPVJGZivsHN+ni22N0EIwkI99ZqL7riShwN2nRe1dxEtJyX/FvCgaeLztVtBG209wLMvWme99Zbfq2PVOS2xb4OrV42KK+zUDcvJEY=
Received: from MN0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::27)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 10:05:48 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::6) by MN0P220CA0023.outlook.office365.com
 (2603:10b6:208:52e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 10:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 10:05:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 12 Dec
 2025 04:05:47 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Dec
 2025 04:05:47 -0600
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 02:05:46 -0800
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH v2 2/2] dt-bindings: firmware: xilinx: Add conditional pinctrl schema
Date: Fri, 12 Dec 2025 02:05:42 -0800
Message-ID: <20251212100542.2756757-3-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212100542.2756757-1-ronak.jain@amd.com>
References: <20251212100542.2756757-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ronak.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6182b5-2103-46df-54de-08de396605e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?up4XGjrfinmJ4F2ALZLcj1O/D3he1ZdR6q/JGNcoDLUN1a9neudDsqy5u4f6?=
 =?us-ascii?Q?WABvdy+SYBk6QN0AQv6oZLqaTuyNil6Iz1Mf/CC6yEFMkX8T5GYq6wt92eEq?=
 =?us-ascii?Q?A8233unvhOQP5T392zJQouBuaK3hD8lUHSvQab7CBUDvjwFS6w3XO2AbaVM1?=
 =?us-ascii?Q?BqZsH1JAnvQQGj2sW5eokH8lNFXk0LW9XFW37H6xYZvli4AjIo+k0yD0e87v?=
 =?us-ascii?Q?+A+eMMYHGpeJz0i7hhGUvMKX6Dq+LcGkgTKwCn2zXQ3h26MMq6Td9fJCkm67?=
 =?us-ascii?Q?dIwAT6b/KKfPi41pwGCtOvAgEPpklHPuafEWLkoroqFzQMM0deBZwv6f+/RV?=
 =?us-ascii?Q?8ESlRjiT+QzfhisTGZeTRiyw6elq17WToPecwzTxEijLZcq0dS5ZRfR0pY0F?=
 =?us-ascii?Q?CpFfbi7T7R2eri56vqk/7R57KFKAVARBa+fhmnGdlpl9p+cCdhcpb5+2CfzT?=
 =?us-ascii?Q?A6kNJIbUDYCpZ1bxM94tGGuT7f2Gp1c2XyIMX5t6Bqo5vijEKaCrQd0vKMw7?=
 =?us-ascii?Q?mGaJv5hGXX/2H9okK6ah/IIGvGCdqWw7xbhHyNa2c82lmUJAO8BTscrsHPpl?=
 =?us-ascii?Q?pUaU5TI+It+erbtHML5m3NEgF7fUMKh8uQv7PewTOLN6iMqybvzjToR5UfzI?=
 =?us-ascii?Q?4W7h0pUieacm3lc26sXxrVLybK6FboejD863PlQEvVUsl0LZVCW3nugB2jf/?=
 =?us-ascii?Q?16r9Vyo9u2blCRousdPPYg9pSPJZN9gVNoQoH3x4unQ6pScwSIztbLCgCnla?=
 =?us-ascii?Q?/afAEB0+OBQxnFF0540VDmas4oths7MQvZwJV/nD6BMp8tY+sM9CPQ0koECD?=
 =?us-ascii?Q?fWLthWERRBvrh6NeETAsA+/1qpeRHgyuRNJfzse8ogv1AsYykS4pe8MTMW98?=
 =?us-ascii?Q?kEQiMDMcSH6vvxXoT6OYMxdGd5b2QVCH0+qslu6UuW5P8YNGWs5BDmJnmFxu?=
 =?us-ascii?Q?7zCUte/U9wcHf8PzgfPLXWct6o+ed8uXGKLim2vQBydRwTQT+KXnZvfxCgT8?=
 =?us-ascii?Q?ka1ItbH6fQHkTtqp+OjsHFcr+CJw0igSvmgi1tjAXMT5yPqD+5xO9GgKys6F?=
 =?us-ascii?Q?69/zHxHIfJACyk2mWDADht8uj0H+Yj2q2K5Vx9GXSo+P9fwRARZ+12SxOEis?=
 =?us-ascii?Q?ybvkTtQeC6gAkh+Km9vw3KtpB+28zzlK8Ih+DDhvWpDHuVd0dzX3/EDDOx8b?=
 =?us-ascii?Q?MjNrgvFVU5JFOuAqxm9AalX7Abv1zW0FuYQ4gsVFu3Sehtpg53Fiw1cNUdo9?=
 =?us-ascii?Q?q6zrnhaaGV9OeYMsj6G1aOCStGJ3ntdPAce3XL9DgqXbAOOI01LdZZWGaQOp?=
 =?us-ascii?Q?JOxAlAdua5HrSg1gVLl3kFBYA1Rip6xJu6HvXjKBuCd3w3Yem1eKvEZWD45j?=
 =?us-ascii?Q?oAImkDROB0t3XYyPBiQYod21uE15SQC29aWTJLfn2BMyMuONujdJEaHXmg4p?=
 =?us-ascii?Q?G6FFfIty0K924l6giq/lIIZHYrPt4sssW0wuSn9m5EHurm+ZacJ0h6pyjCQr?=
 =?us-ascii?Q?mbYKhc+ujRDZKP7JCSrvgK2Omz7tm6EO4BkI/wOm/pWTGT9ENgs9lkqAz9w+?=
 =?us-ascii?Q?drDrtcMOtpFFQYduCTc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:05:48.1121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6182b5-2103-46df-54de-08de396605e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_020555_532669_36195F14 
X-CRM114-Status: GOOD (  14.19  )
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
Suggestion from Rob:

The somewhat preferred way to do this would be to do this in the top
level:

pinctrl:
  type: object
  additionalProperties: true
  properties:
    compatible:
      contains:
        enum:
          - xlnx,zynqmp-pinctrl
          - xlnx,versal-pinctrl
  required:
    - compatible

Otherwise, the pinctrl schema ends up being applied twice.


My response:

In your suggested code, the schema allows either xlnx,zynqmp-pinctrl
or xlnx,versal-pinctrl on any platform, which is incorrect. This
means that if a user mistakenly assigns xlnx,versal-pinctrl to a
ZynqMP platform or xlnx,zynqmp-pinctrl to a Versal platform, the
wrong reference will be used, but no error is reported. The
dt-binding check still passes instead of flagging this as an issue.

By using a conditional schema, we can enforce platform-specific
compatibility, ensuring that the correct compatible string is used
for the corresponding platform. This would also generate an error if
an incorrect compatible string is provided, preventing
misconfigurations.


Please review and let me know your thoughts.

---
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 7020eeeb4ec0..c4a137f8e06e 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -79,7 +79,6 @@ properties:
     type: object
 
   pinctrl:
-    $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
     description: The pinctrl node provides access to pinconfig and pincontrol
       functionality available in firmware.
     type: object
@@ -114,6 +113,21 @@ properties:
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
 
@@ -172,6 +186,10 @@ examples:
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


