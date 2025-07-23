Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9931C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viR/mEXk6GxUfdlAhxwLKIH+ZDOJWpykFfl6FgtwSoA=; b=A/8//Rc4HbrXEkMHZq0I6tBpO7
	kOCQvMEiI2cBuHIxML177w0UajT6vvVwtp6wKzQjwybSW7N5s8v7Q/Tn35FoHv75+y3Kggwsm+9Y8
	JV25O9gwFIy2M9JnaL9kM6+Hfg5SIQY5VZALrgi1uKhs3+b+y5rmnTgwNft0T9AAqSvdbTAqM8mz4
	QfV7OTF0FUy5A48UUdwYEH+LGrIAvu51fuOugdvJ9kZt+XOWyuLw1ztAA4I8h08tSFszqQty4W2re
	Tnc1QPYNjQSOXWfmyJapeWGF86JshEm/XgBmSQR6QOilMAyWYZeuM8Sx2TKfNIIPem+Qhb6qkb+lO
	hnzVaUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZKu-000000051W2-0mIu;
	Wed, 23 Jul 2025 13:16:44 +0000
Received: from mail-mw2nam10on2061b.outbound.protection.outlook.com ([2a01:111:f403:2412::61b] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZ8m-00000004yhw-1eU8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2mOwoNuTqpTqwH/uw4nEr+tUOywJ2tTCuJhG4HqpfElaWdavgcfXcpwCwNKDWS8hH4TuJFW6VxQluSQrGthkTW5BpdLfBu0OU0Ldn3B0pKR2tJVq4JAoAOo32FlecpQfN8MJ/IoNR56qnYWJZEx54rBwgYqFONd+MCz0D6gKq24swa0TmcqDrpn5vt3VwIhsXvBPg9Sk0hMHrlpO6lgrfKX18K1izedtA43RyEuoDAFEfpRXuqzL12ly+aVphwYfxbkkctkWRfJVezpee0nB2eAwFqpkWnEp/oqI3xuLiQD+7d+AtbQ5t5JzezKAXsikEXUNH65Xp+vLO+vSWX74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viR/mEXk6GxUfdlAhxwLKIH+ZDOJWpykFfl6FgtwSoA=;
 b=aD1cXU+d6dceuzi1AkkCqeRKOLVAaZIW9ujsvIdd+4ZPr8NB1WatEjYeJbbIZ7ughQeg4ljgcow1isJj9qReCkp1NRDEBEResW/HDu8lFxwx5M/4L5xTdT/WM5yojnHy5rKPojbWgOQHf/B7pJX5Cm2f6g8enFhlkaEj6ZFlCz9E6sS7XxBok1pw6c+4P02nhMKQytl18ZCMHI4YJPdsKFXw6E2moXqC4FxljUqQyXinYY3uGUepPcY4ohGYo900LeEuKYkhvZgdowVP6cR2Ycvswis23AN/oUvukVmiwn6lanaK7nDzWLw3zE+oIMhTa+Akdcy6LShHU4I+7cr3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viR/mEXk6GxUfdlAhxwLKIH+ZDOJWpykFfl6FgtwSoA=;
 b=H8TVGvH19539LDwv0yfu2SX3iebRKi9KQEuKrDs+8OC/mJLhGA23eh9TchVRX2+mFT0C0pyVcarURFjxShS0aB1ql6a602FqwtElOqsy3QmqNfNgtade0R27yQHerGDnpp5v9JzuFq+imK/KhIzofN+TmCaIpQlYEAommFc4T7ZEGQRiccBlDGRTtnk1ctQJBnA71vS/VtAat/vQIl/GKhYcDVH+sPm+btQfBLYv/uZOodg7ADqUtlgfKSE3KBRGFLO49WvVzNb92AsuSJxzineloWTsaojryLClGb82wcNru1KwBgrzond9eL+dXCy9UgWR+21T87hz97BjStjIPA==
Received: from SN6PR08CA0012.namprd08.prod.outlook.com (2603:10b6:805:66::25)
 by CH1PPF989868826.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 13:04:06 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:805:66:cafe::95) by SN6PR08CA0012.outlook.office365.com
 (2603:10b6:805:66::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Wed,
 23 Jul 2025 13:04:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 13:04:06 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 06:03:47 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Jul 2025 06:03:47 -0700
Received: from build-shgarg-noble-20250715.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Wed, 23 Jul 2025 06:03:47 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Date: Wed, 23 Jul 2025 13:03:40 +0000
Message-ID: <20250723130343.2861866-2-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723130343.2861866-1-shgarg@nvidia.com>
References: <20250723130343.2861866-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CH1PPF989868826:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c18718d-eec0-4eba-063e-08ddc9e967fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VD2A0t+CX+ecAhi+ZJrIp4sStZU1ZpEnim9niR/9bGf5K/izrtgfWj5R8jDH?=
 =?us-ascii?Q?Skbo5gAcEhaxKsYV3/fQpeDIDNzDeMrnr4VaJoVbiV2lp8ybCj546er1J9RN?=
 =?us-ascii?Q?bo+Lef3D86CGhvnsLKVkxMQe33lz0DGviWycgZwaHBECxOHB+0+yOpDAOiZL?=
 =?us-ascii?Q?m9pozehceY6JphJZs3/1xvHvKBeBSWQ/SUvjJnQsGtdUluIlUGpb0EVABEk6?=
 =?us-ascii?Q?/tw+nkaLq0rymrLA3cUMQOPP/Qob20cUhPMK2kcf56Io1N6JmUXSei16h8Kp?=
 =?us-ascii?Q?BJX3h/+hEW0i/wUHLOyvxbu5z7MvBimW+JH8n9oOspC4ieZTUyOrL+ZvE1gU?=
 =?us-ascii?Q?tylPorptTiLJvl67UM9Rh09Zv7DwiVafMql027ukIqnjg4aRA6xrPGsfrhin?=
 =?us-ascii?Q?B5tE15QZDTGUv2etPh5h2jfByJb7+9LZ1KnGDVHTImEDIAXgUVmUCGDFsJv4?=
 =?us-ascii?Q?97Cda8YXFYVcTN+Se51LfUT34/Wp5MgmkV+S5Nw8D861KiEpx1wp2eTJZYQO?=
 =?us-ascii?Q?iW/mdesLkB0V7y5qsnWtxcaUBJ410L8GzlOqho4/DEex1irutJQlN/ZUXoaH?=
 =?us-ascii?Q?K/5aoJ34Mijzvyn5SIjdud+GBfap0eHYHcE3eRmShf8y6gU3XuZm1bfH4uQn?=
 =?us-ascii?Q?jUksyddys0SjQn3W8RqFw83qPZ2ieP7+M8CxOEiLdvsYRQKxRzt4mmjQ2gun?=
 =?us-ascii?Q?EyDGOqwKRRksf3EUmWWYcaBWdzjdxeOQMdF7rRiF5uVEDH7W3OS0YUd2xh4W?=
 =?us-ascii?Q?NL52a76Mh4bu5bUKcU8nT0JXi8B1UGbyOhzRMK1biO6O/gfIkZbsj3k4FyP9?=
 =?us-ascii?Q?ZfGcvTr82LZYhlcMLPg9iSOPAcF6Lq2TMM4KFmWh8OC/ETrJkFzWILs2ICg7?=
 =?us-ascii?Q?No7fNSA5OxKhR6VOOdM6rJlDM8hJGTJyyDsrxYqiorfgHr5zJtO3PQYN18NY?=
 =?us-ascii?Q?iHE2BENfTik7emVG5VBFeYDVDTfwDZtHUJwoNJazPWYZqlzQEaAEDYL/+mPc?=
 =?us-ascii?Q?9qZ3VxeGY6pmRffK9pwSz1qrWRGPI6dP05VtSTWvnZ/yEKA17minE+p6jZtH?=
 =?us-ascii?Q?Vl2D7gPgzj+zfs3bOI6LAI00hqdPv5bkMtE5XxmMWrSysPbiuxS1bnrC+9eG?=
 =?us-ascii?Q?wMDqkS7l5JZCDFW4C7mXtVg9uhmTEr0fGBzYXHBW1tu2r6FC4qbBi0fBSHPh?=
 =?us-ascii?Q?+Sxo2H9QLhEHzN5FvKJBmOrnt/O+jw40B24+BKD6Voqj8jPvtGwL8V/CF9/f?=
 =?us-ascii?Q?Q/swkaJa/SjL7cGGaS4f+vCGj9jXPrZ711I6FrqFskexMLaEmmGyChqD7jaq?=
 =?us-ascii?Q?1hxqbykvOsjfXM+X2MgUfVavOsyC8KvioMYH4GokBwgfvNr4KJdBwcmukGJN?=
 =?us-ascii?Q?VoTZG2OV5gx33WA++FqTo4SeyqD9AqKa4BfGGW3hWndSLxawrQuK3GN2wJT/?=
 =?us-ascii?Q?0tg1OUur5DvkONSz1nJ1lS34Lb8UEnWuqy01FWNGCA5Zkewp5gq/1fKnIVcp?=
 =?us-ascii?Q?D9E2N+EBLXcYUCg4CUs+7ZZnmhpVAAnkMpg9rNoGW8NSq2TCWA333izeNA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:04:06.4278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c18718d-eec0-4eba-063e-08ddc9e967fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF989868826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_060412_441637_7EC46BCE 
X-CRM114-Status: GOOD (  13.72  )
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

Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
RTC device. NVIDIA VRS RTC provides functionality to get/set system time,
retain system time across boot, wake system from suspend and shutdown
state.

Supported platforms:
- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v5:
- moved device tree bindings from mfd to rtc
- changed dtb node name to rtc@3c
- changed compatible string to "nvidia,vrs10-rtc" 

v4:
- no changes

v3:
- fixed device tree node name to generic "pmic@3c"
- fixed indentation

v2:
- fixed copyrights
- updated description with RTC information
- added status node in dtb node example

 .../bindings/rtc/nvidia,vrs10-rtc.yaml        | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
new file mode 100644
index 000000000000..b7eea5f03e5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nvidia,vrs10-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Voltage Regulator Specification Real Time Clock
+
+maintainers:
+  - Shubhi Garg <shgarg@nvidia.com>
+
+description:
+  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz RTC clock
+  support with backup battery for system timing. It provides alarm functionality
+  to wake system from suspend and shutdown state. The device also acts as an
+  interrupt controller for managing interrupts from the VRS.
+
+properties:
+  compatible:
+    const: nvidia,vrs10-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@3c {
+            compatible = "nvidia,vrs10-rtc";
+            reg = <0x3c>;
+            interrupt-parent = <&pmc>;
+            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
-- 
2.43.0


