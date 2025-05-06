Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A53C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=MRFPkHA9LN5rNHx/adJz8WGbeP
	ZpIG+HtanbXZ9+drUjrgjcZMqCa2Pi5/daEqu0q6VsO+5zZoDQ85r7FD8GxbO15fg1viUxqPPpqmx
	C1N0Z3yL4+t+h6GfPCSM6J8ivovU46W4K+RTGGONhkjnyWFw0hPLB5x0j+8ssoinZ+rqfkfmWysgJ
	Uk2eS7FIslLVex+fsPSEkR9VbbCVThaz7hT6xyqzcLOGHXrRgPbLoS83i7FHgdOAewj9CoD9vZr8o
	cpfdzcaPUnU+nLwrZC2rVQ9pCrmSJBFSRlzezYo2woEPwhxbN7gWpGXXjyXtfsebBeGbyx45x0ORx
	X+nCHTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFMS-0000000BXj8-1UAZ;
	Tue, 06 May 2025 10:17:16 +0000
Received: from mail-eastasiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c400::3] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEHV-0000000BHQO-2CpF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPj0kTFdoVcUnWsPQZpfCjEc73IqXG0AHkxOHnpbEYdi/cCngvWVQ1Hy+bjj0R40lZ3fRYhsJ0Vbs4s5BLXcoC8IqnB27FD08I/OSLMB+2jxLk14e3IUYQvF+kamgpBnRP7rvGAF1cYyamVf2Mt3QK5Wj4MGjuEaH3EWRxNDhQ4d75iAhUCAW/x68wAY1CAyMf+IHPrJFbjGF9RFgKcyAJauhvpC3BfmoPxujPe+O9Y2IsHrjyAERNb4uQX/ZYePNxGUo1dOZ2QznGvNNzWqUgBA7p7UrDSZTMBykLNNg7/Fx0SmyRYRhavnQs8Li7oIlwUZjqDQcafCp4AsQSV8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=QgV3lBh2suIUcv2TdvW8OTpbQSp+vpDAHSZXqCsSehPxhKeYQomOpaMSC7jFgpYM+dJyJeBgp3y6YD1spIYt6yxYJQEwb3OpVyV31+ilOVGNgkIrXYOmLk0miiGXODSLiv7RIB12DT30ObOJPZlSuhvtOzl7NYN5SF2xUiZBv+r2utBHDWXPhQc5L3yz0YMXPJAoIkjzAUJWtz9pyJoNubV42JPAoKTNVwxGSEjdxd87SzWlwdXJYGHdOJG5Y7wKcps4dPR0mOzuGusYs/HUmg2NtJxW29h4I9oGhpCj7APhCw1TKPU847kJcuiuthuzk7O2TlmR1qR4YdqqZMfJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0012.apcprd02.prod.outlook.com (2603:1096:301::22) by
 SEZPR06MB6457.apcprd06.prod.outlook.com (2603:1096:101:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 6 May
 2025 09:07:54 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::d3) by PSBPR02CA0012.outlook.office365.com
 (2603:1096:301::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 09:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:53 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4C26A4160CA2;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v7 2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Tue,  6 May 2025 17:07:45 +0800
Message-Id: <20250506090752.3695666-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506090752.3695666-1-peter.chen@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEZPR06MB6457:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3cd177c-7e6c-4799-10b7-08dd8c7d7bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aZ/Q/qt80+2PbICsCWR+P4fZC4Fk0Cbu11zlwdaQLsSwAWCuoOaAO05+m4El?=
 =?us-ascii?Q?x+XzTmoHSYaV6Sb+uhoicjZYzeYuKOGFFNfcIGRVPuLE2RzTC70HzL5WhoB3?=
 =?us-ascii?Q?/lf5Tyuad4qw+iOubIphXfT9KEGUHUXGgB1Z0GuteDhmiNZZY3jTtpGwhtQC?=
 =?us-ascii?Q?9paBkXMOCchewBxrZub0bqgAFifzcPGQ1itqS05V64wklDYUS7GHA8LmpYUp?=
 =?us-ascii?Q?2iXLge56yvj/q2VEIn1hrJFCfDU/UAZmmH67H/ubizFGwfAA1f1NzVxiQYoS?=
 =?us-ascii?Q?mDkPT4WsHVV+t0+MCBmee35fdBtMN1owgexaH6XE7DxadwWYh3QTIdr80PUT?=
 =?us-ascii?Q?LjcSK9VRhM1v4m7uvahkRQYSnVN3qUymsDS5wSVyah1kC6xCRTmQt0IEnWtV?=
 =?us-ascii?Q?JK2AXnKOVfmPUp7dmFnXzroDidxyJSOcfHmybT+wYfuOlkd6oz3jZ+u3bSAT?=
 =?us-ascii?Q?crfbceveNRU9UQoVrZV10QttReHpxdD6AByHeP+V9SFvf03IfiVgHo2Yigw6?=
 =?us-ascii?Q?Sna9ToN0yKDudQe5eI2KBrfn4C7Qx15RFwJh7XQGQlNDQH6FgeLHA1gYmGes?=
 =?us-ascii?Q?3tZimRl3C01SSROwcf0Om9iWnKYkCpZInYdDV4Djg9IthIy49NDHPBJIBzlA?=
 =?us-ascii?Q?91qJ0/3YM/Etqiq88//3n38iP0l1v9SmpFNU/G7nznt6qD8jQcdXdjqUQVA8?=
 =?us-ascii?Q?w4xKeZuYW3JrC1GaVU88K0fjKkc8penN2HQQpZ57s8Y86JQkC/4IQ9gccg/1?=
 =?us-ascii?Q?kpy+CXL5Q4iZf4yIOLStmFduvWpNPn9U0/i+mwRK4zhlxBChq1O/x0UFWvZ5?=
 =?us-ascii?Q?uWVZHUFb6aqcQVsACoe0gCrdo26XbDb+LbBc6cDlS9u0Rrz8MKlcFpb4pgsn?=
 =?us-ascii?Q?zjoyEryQjdVXDcROnQc4S1btf0Bs/vcjb7f9LJrDxyofHR6yyBVYZI7avLO/?=
 =?us-ascii?Q?93+FWrTeEzDoxRMzd2O5K082rkP9mZDmvfPZIVTonnNDmN63U+KVHDPHjW92?=
 =?us-ascii?Q?Dcx4Bln0bFgmM8q+8w7/iQJIOaNn5JCy9bciLTiN4Zcjmm1SmyXkkjEpts7K?=
 =?us-ascii?Q?/4nbMHDnUs5FyWT5rn78tCX9Tau0hOFKfN7/Ib+mWT57zKwJA7r88zN0zuD2?=
 =?us-ascii?Q?cCEv2TLs2iah0OJHt1zKDxA69l8Ggy1DqH1syL7dmcPqaUSySik6/YJPDerM?=
 =?us-ascii?Q?KSXB6GBVwpvsg8iLrMW4ghavrJAZ1y0OmEq8F0DzodRU7aRVPj+Cg++bubPM?=
 =?us-ascii?Q?5t4zTbgGKaYN13T13FWQUf5yHiEjAL3GEye1mscYCF1cuM+rqc/MPY+6ANsm?=
 =?us-ascii?Q?rPq8Ga30vxDimCbxSTs3mzPBAYoEl/K3yMRzFei35dXBRX/zqnMLbsxG1hLr?=
 =?us-ascii?Q?bcrL8AlOq5pzWDsP5DhNczh7v7i+Z0a34muH5GGiDd1PBH6yt7Z4uuEdxca4?=
 =?us-ascii?Q?IM3atWZsqILYdcaJZqKeoQ2wia9uOJOl/aSPEK8X7trmreI41mH72Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:53.2771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cd177c-7e6c-4799-10b7-08dd8c7d7bf9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020805_566985_566CD8DE 
X-CRM114-Status: GOOD (  10.41  )
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


