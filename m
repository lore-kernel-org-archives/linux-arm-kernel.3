Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AC9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=NiLqn9z+xJ0lmnbtEFSYiREM5Z
	zmtYqFNS8VUr20yUDXT1EbCbV0A/E21Q+DpkkFy13DcABMZ8J1V9qUcSyjG/ORyB7OjOrOKhw7Vud
	hVJ5c6N91b7D/IivFvSbY5ThOqVHPlQJy/XDzQmVdL46G4/o1KizgrsEpkR1wEh2CephjHeg+4e5f
	wvxg5oZf1tU+aZCNu4Wj+sttC0Kt2SoTK3MfE1TcMaAZvkXk4mxjO3PNKGd2+5g+IMu5nPxOdn/nj
	RvjId5xkpAW22pATrk7qFnNE6x9Dch/T4M/RGrEkAbBMTBmqvMK7nehDZwtjwZWW+qF9ZMqj/O6UL
	El6GxQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbW-00000000Can-37bu;
	Mon, 21 Jul 2025 16:43:06 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlb-0000000HZyQ-0vzj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm3Xv1xrWqmpxxLzE2b1RKnxptXgI8lFvw11jYR/UWaOJYH9I3ni6c8W0IiGnx9FuxJt6sFl/AwW1iu04NUSoajAOxNkVVneTUq+CNdhmDGuOwO4o3rOgf263QpV5LBNylmm2EGwI6xUFkTX5LiJ8vPDqaLqvQqTG2oksPbQo9LTbFEnb1NEDdG0nlsoiP2AzfZC7CE0Nyed3si5pvTBZzGLvHIvbasfDKWAOjPo2TBmpZJlXQcq/GO2mU+SihRXDrYHMEm9jT7cOug6CWm/x3Jcn4CNGs7x2vIoOYyAz4B9Tqk6Le804rrLe0MmBcHoc0x55cx0F+8nCbfWKKniiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=sryJV8R5vaT+pNpqyh3zhaVSeE5/v/BevJ6Irdq50+aj41oeuDyV4NDYuUzNr4zvU75GEUHVtR2RX8FDYT754/b1dqOqYBdl9+OUW9JQ7a4U9IZWVLu0+W28xgB+pFufF/srTN3uiyljJ8PK9jyQCeukEiyreS35+ZGtwbFWu+RwxajU0mAx4TFdA1UTa3zj8nhC4DnDAkgdhYxmlQVpphCc5hFGIwmdEq8vxSgW5nR0N6Y7tpCoOUBnh35oOClsiRgkqGY3LJnnH0UYJUinbQUaprflN7KuHJOHcY9G6iJ+08kPWcW+Z62KYcqxEq/LESQN/1T78JqE2v5PgNiuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0043.jpnprd01.prod.outlook.com (2603:1096:405:2bd::16)
 by SEZPR06MB6286.apcprd06.prod.outlook.com (2603:1096:101:12a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:45:08 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2bd:cafe::7) by TY4PR01CA0043.outlook.office365.com
 (2603:1096:405:2bd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 14:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 14:45:06 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 80533416050C;
	Mon, 21 Jul 2025 22:45:00 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@lists.linux.dev,
	robh@kernel.org,
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
Subject: [PATCH v11 2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Mon, 21 Jul 2025 22:44:53 +0800
Message-Id: <20250721144500.302202-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
References: <20250721144500.302202-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SEZPR06MB6286:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c46305b3-7b8c-48a0-774c-08ddc8652f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QvEYRlsTAkKTNCm0zEJT8S+FITcNJMPR64mhGAD7P89iB08lozwygxgIqAp/?=
 =?us-ascii?Q?pkKKMitJAC4ldxKALjrWi9LPM4ZiuNwEVBhm7g1bxYQPjuwrc8grmVTezgJM?=
 =?us-ascii?Q?BWPp1bIcMv61yjFbn6qpsrULDe0/uHchLT0EhFcnGS+ecUBkOlnLzn6V4pTd?=
 =?us-ascii?Q?UqXd4JbmZ7MjO+W0Yk0xofDF9P4Tg/YkCi82dbXPAgAtw0uAC+7j61fxKveA?=
 =?us-ascii?Q?qYrXitE1SNDpfTuLP9ZiixSP7cZgmiiNE1THJS6JvXwC/onzFPJp67b66xAu?=
 =?us-ascii?Q?MclAS6f9NFbbCPtdMrUKTPItrN7QlLYMntCG4cbouthOnQPrIM32rt9hn+pC?=
 =?us-ascii?Q?tyLzX56tNZLfkW5zJJRAQLgnJKWcykvTR/YhVuBguFVdpBW1quKtezPEQfVm?=
 =?us-ascii?Q?xik4VM2mXGHXDMmZRR1dttXbxGh55ujf4e4tKl13WL6f6sJzpQFCEgiT2tfe?=
 =?us-ascii?Q?ZETmQ3Lt4d3IHaKvpR8WPAKun0/cVHAI0AgRiyu9Ds8KG2vb1WRiuYoqEzPb?=
 =?us-ascii?Q?2Hp/HbC2nH/IA7dLpkjqUz/9UXAx93Uv4LAv4MIOx3bRnKngd330QiDpEraE?=
 =?us-ascii?Q?zIFQM7pTH8SlVqRDkLxggnMYXCVizTEjE4lKIxNeMWfv4Psj0ASrSgcMETxk?=
 =?us-ascii?Q?ZdyFNYn2sXBQibWCPS6oVcMamecEKKG3cMAEPuyBrwgzWGBMFcVpCJCwDC/W?=
 =?us-ascii?Q?14Qhzfd2+89FJlwtNE2ezq1UZTTezQyCuhg8FPfHTOQJcL9CEGAAAW8gHSkw?=
 =?us-ascii?Q?9EboLYMdCyLc8bjqesR6vSKAO3e1iNrzpspCbPmgE2Dto0rFuSXsMTwcFU/+?=
 =?us-ascii?Q?egU0SJmL7XkZ9nRqfMphstMMQHG+MjBiFmtYJTu2zVV9ZgPvSYDGJka423KD?=
 =?us-ascii?Q?HtTUYt7gCucek+Jn4xwxgTU36li9pKruNJOxRibZS0Po5H7yOfe7Ve2NJ/bC?=
 =?us-ascii?Q?jyHpsiwFPUHaoX3bx+8scx0eoZ0K/IH6SnYAVBELl/eEyptMpkcPGHihAimR?=
 =?us-ascii?Q?CMVCrSqz3tPE0q03D1JQISp27CvZe4ApoTUI+DSOZlmtREOxVhkMd/3kdlHX?=
 =?us-ascii?Q?VUzr/bq4hrAiVQrbtdKINpbL29XCCE5AqPRL+jxBD1ENoXf3K6oSvymjiPHT?=
 =?us-ascii?Q?FLbxZ2cnttZMl7HtlrG2KQ76Z2nkes+VERC+rukGJDBfTD8eCCXxU/tzf6wT?=
 =?us-ascii?Q?Hk6vpEfwDXwJPTVKFCD6WS78TYZbUENk14xZ/ormsDqHDkhEsrXy9ha1vgdl?=
 =?us-ascii?Q?EaxpP6SmjbjzBeB3jXfYTpB/ZGlP06fQo16dvo60E32CdqnAVdNvTYxZg0JU?=
 =?us-ascii?Q?ffkvhxgkSQO0yQk1vD5dSm2eq1MUIADG+uLeRu3C8h3MSzfImi3FF2nSJGmH?=
 =?us-ascii?Q?7F7jeUkcdqmHECRfZE8cMg/SiIY/8/RVP5/5yON+LPV3hpL8nDRdCMGYb0nC?=
 =?us-ascii?Q?bpHL1rQFPnfPFBiqtezCh8ahAe3eVoEjTHyuwXplC47Pbt/MIJqexA=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:45:06.5963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46305b3-7b8c-48a0-774c-08ddc8652f60
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_074523_264592_BF43CB79 
X-CRM114-Status: GOOD (  10.91  )
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


