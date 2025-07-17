Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27350C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=HnYZxUNoKCY+prHIXPv5rjCoR6
	cZaOLb6AxPxhcnpE9LASMFZ3yUnOhTOLmkuqq7I5+E2wI8WjeObmgvLJrQuUZU0qhLhsohW4n27z+
	z52fFFzmbDkyLb5Z7o9zlyJzhCQKhzhWyoDPMS2Zb6PrDh3B6Lo5CZMTxF3If3+BFUM3bA2W7i/hA
	DXOW2fqBzbBRhcC/Rx9Ap99zzVP47wU7IFCmhuNtUrzRqS9iTdz2J5aoArhTLO6yS9t5g5N0475Xa
	e4qr22cCvOQFJDAAuELBrx8Hck1EHxmOTU/efUeIeaNDAF22YWyCqxkMd5gkrAx1zNgLeUwIINEJ6
	nI8QJchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJbb-00000009Wwx-3so8;
	Thu, 17 Jul 2025 08:04:39 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwj-00000009QH6-2w86
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:22:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EviA0OsVmoVd401wz2z+Tu7dO8GfHC0MRfgvJGqW7RIQxobkJA2qYeD8dwd2oLb9eNf4cjPJb6sOfSgrscBbipussyr04Kkd23IWZ4gBkClF9TbIgs3z05f0ehSve1MyZihrBBjcNi+PcRNu+UGrBj9ZTo7ZhceZg7+/JLeLuB/UAqlW26WPYBaYsjeGBeeu178Bzl8i8WOSXLswal0d1dk4sJArpOg5xFztIqmX4JeRKLEJTI5nfYqA5blYEF3z7RV8Dj2Mtj2h/OviX+2lA2gL5oq0rZr4E+BzXFU5AzsChOFJvNpSpB8L4Ic9oe8IxiaAxTqopdCJbljH55jw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=D53i1mjzaIDilg6KSQDXBxta8vqlEeCkoWh3PQgocBjsUkCn8H83UGB7EQ9EsLOtxqm7xqsTRvrAw+blk/b1ovJpIalfn/eeJ/uYS1yJ0YRkHys43dRy4wxf8t/u8ymTgh8mTA4of9BhzmHPssi4J6erqiCZdzoSBK4xbUIk+RyjOrlonAx3Rcnc5Sum3uRHD5ZtJoh49hlSZ+H0gLJh2L8oM+iU4joqhuDbOBJoh+3tWbAcV0N9JQqpBlagaFoWZq0XxGKk5blzru9jfvLWeCQQmuKFvgt+a5lLk32LJKn/iXcMtzG+I5kkcAEMncJG44E99tAs48axZrnAIsTuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SEWP216CA0096.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2bf::12)
 by TYZPR06MB6261.apcprd06.prod.outlook.com (2603:1096:400:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:22:12 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:101:2bf:cafe::8e) by SEWP216CA0096.outlook.office365.com
 (2603:1096:101:2bf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Thu,
 17 Jul 2025 07:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 07:22:11 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B81A741604ED;
	Thu, 17 Jul 2025 15:22:09 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v10 2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Thu, 17 Jul 2025 15:22:02 +0800
Message-Id: <20250717072209.176807-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250717072209.176807-1-peter.chen@cixtech.com>
References: <20250717072209.176807-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYZPR06MB6261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae51e858-5a4a-473a-fb05-08ddc502a58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8QLHrDqbznQyBNSf9ryQR46H8+eH97D2bUr8kPjPi5JSQ1ELpzdwe1lrFJ6e?=
 =?us-ascii?Q?2zVmqGdFMXnmaT0a103pvSm4H1e9n5hCpxuaU98JT0GszNirWhjM8JW7QrFP?=
 =?us-ascii?Q?ZZnD0ctwZog2HKXeGxtzStdcFLj8VHqUrenNrOkoTEzYRAi3ZORDsLAibbYB?=
 =?us-ascii?Q?r6Mg+z+M8dShJkk4HlNfxo2rzUXFcrz2rqmr0qOiYYbfe9ASuvy+km3uzek4?=
 =?us-ascii?Q?54Emb42mnyHRrVYGaQQ7Nr9ewNYsTVBCgeA8pXaMtF62wGkBdHYfbmyiZf72?=
 =?us-ascii?Q?YniJ0OtrH3uVnVmqvbC2b7rjLBs8C/wlgVgcrRhi3FTiVS2tgKwuMQ1VVlds?=
 =?us-ascii?Q?bm7hI8MXYGdKLPw0pAu3OtN0b9mc143kdOqD+/Fj4L/VVlYQGilZDdeOBYgj?=
 =?us-ascii?Q?k+5Y6vKm3YGMklfJ1aO3zQXTEOgm+VnRpo3MAbDenN8wDoEv5FFCaDNfqfCa?=
 =?us-ascii?Q?+AgmMBUjTwqZGk6EBmzkh1tiTQov65ko5sGrtGOjmYuc1Z+469IVOveO3UnU?=
 =?us-ascii?Q?IGYETmvkQAopDUjlMJV7tq58NehkJQDcShMfisTNTrrEqQuua7mtsud1HiMT?=
 =?us-ascii?Q?FAT+aLLK11nYeQc/15wrXqw81CqlARtTjvoGaZ81RQ39HRk5xd6jctpklS/1?=
 =?us-ascii?Q?/iiYHFasek6+SWE5LnqydDAtFKBpROH5JudcLoH9fHnGW44ieOv+Emg19aLL?=
 =?us-ascii?Q?m6Rw52lZEfMwEEbrI9EzZSnEHdDdVBSKG5QeheUbUjkR7FgZJzJHZg6kp6GL?=
 =?us-ascii?Q?mMLzzn2NFelEMpi4gL6hkjL3r+KkEI9JqcijsMF9NKrTxGFAJVJxDgxgrede?=
 =?us-ascii?Q?rD8P7BFg5fN6Dq/M85tD60X7cZMcm6PblnlNtvEeiZvml/dJLVfO8xZzH+oa?=
 =?us-ascii?Q?y/qUlU75Uef1SM9Jw0u2n2NrH6J/qAn6PY1jZP0isF2/tSY/TMPjvBbq4Z2W?=
 =?us-ascii?Q?Wz/UwZo5y6Bd08ohr+6KFUvRk2AgmS4r4qeThkHmo0gPAcu/ED2C3X69nHOE?=
 =?us-ascii?Q?sLvu8oRle4e+a+ZbwxkiJODiqhEc0KMPewlc8tCBcSeTkFJUT328umElcnkG?=
 =?us-ascii?Q?MaSiK8/+bPeqDLYsD+pLBUeRX3Ecw+O3DH53moMZzI5szw3BsAApml9bU//t?=
 =?us-ascii?Q?VIuRBOfMjxDBsuhAK7pSNVnWThrCrhS1HDgwlIrvn1866z3qJGqmjCjMYnav?=
 =?us-ascii?Q?+j1AbqW9v3J234dguPis78eh8++vC1CsaEP9kDdEA4oi0youQl5yQrCNFIc0?=
 =?us-ascii?Q?GJmvXP/WXl4S9Da+yT5UKX2OGuIypwEAsQghIy5mjrUOq1CkuF1do1Q0VJfX?=
 =?us-ascii?Q?fObsm/QFHkvmzm0+cpwJKolXhutfQKZNpbPsLuWKbnua74xhH2s3Xvxekt+m?=
 =?us-ascii?Q?l/t+t3j7BUmoI2idcxLRMw5PRoYnbhS8ynuZSFCqhM22ZakXdMWfWdplvajC?=
 =?us-ascii?Q?7PlyhRrfhJgYRfmprYU1kCUbVgvXLQ1ZuDgpy8KhqIp1ldLeXPxoqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:22:11.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae51e858-5a4a-473a-fb05-08ddc502a58c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002225_746460_3ECF17BE 
X-CRM114-Status: GOOD (  10.04  )
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

Add device tree bindings for CIX P1 (Internal name sky1) Arm SoC,
it consists several SoC models like CP8180, CD8180, etc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 .../devicetree/bindings/arm/cix.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
new file mode 100644
index 000000000000..114dab4bc4d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX platforms
+
+maintainers:
+  - Peter Chen <peter.chen@cixtech.com>
+  - Fugang Duan <fugang.duan@cixtech.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Radxa Orion O6
+        items:
+          - const: radxa,orion-o6
+          - const: cix,sky1
+
+additionalProperties: true
+
+...
-- 
2.25.1


