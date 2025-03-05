Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C1FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=2F1yZJsPs56+iNZdyhLeCbVWA+
	kC/jqpf3wDmRQEOKHffzR3+D7ZybX3P+uvvEqYvkCpNt7x+Wvot3RXOIJWxfUXdzzGbn25sf+3+4N
	msPl9+NG2FqlgK8ZikMZ3ljOn/EwihhR3isWEikDZf4hVyjIpvQQ7AzClfPcV334WExzEoNOmmm7N
	qJLpmaDUh8ZuRdsqCu+Te79k4odAgw9vBOw/jUUgQDyEmqL3+7nxbd0sEttG0SWyaMemjeQQKFH0t
	qkMaVfyB2LE/RCqshPDMJXkqij1CL3D4dxqNbf+/0IDtnFIBqCAsKZitLc4SXGBkj2iSEarIXpa0u
	GeuP+XOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphVw-000000072vJ-0PON;
	Wed, 05 Mar 2025 05:41:52 +0000
Received: from mail-sg2apc01on2070c.outbound.protection.outlook.com ([2a01:111:f403:200f::70c] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphSn-000000072ZT-0oWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 05:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlA1EeUfsUIRQXhcI93xV9ICyOjpuNCGwx+x119tUvbKD+axn9HAgvY2SrEns2ddFAcQzJrUnBQwdYwJPOlr1oqV8rI3Pk+GGtGuxYBb+zbKbNRd+NU+gg3feKFoKb3nAy0oiMwfX4frXq9V2tPWUanns9bUYnjlNIrm9w0hFSyCrUPBH7EyhISUI0glAmAfaGZoNDVa6gRQ7ZExTGbVW48sF9TQDjSsK3uHDxGTa/mLo+VgOLxsdRqH6G74/fIrJBW1i7x5iWGQ3Iq73zE2nMqEdwL+5ZJ9e05yMNUZPB9mire8gxURwlBVJniOL5WFcp2SvWxGS0AlUsROvmx5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=Y2LUZeNwfDykuFplLbMr/9AVkJunOVETg1hSpjnyQpuRgwSgCpenXzGrZY2qDwU3nJXVJhyK9m2BVUBoWpNJwRFII8YbL2HhwHjzS3S8W/xCbiYluq/30C4lz9ZAzuOn1oZAp+Re04bEnA9ET2ZYWW2yF3BZZES2I4InthjVMf5JSgvHWc8mmMJQm5zqI4PyoY36as80GnQNF7Y9NKcsMbJLX1O0W8nfHqsOHfJ0k6Tza4rB7eUKYUfTJSjlXu4wCiJ1wBRRDfSWb9jIyH0GgTGdf4fYmiTLmneBjOkdGOr1T2O+J6h5WNEyb0+/tjCs30t89XGN4Eb2yPTj7SMJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0030.apcprd02.prod.outlook.com (2603:1096:4:195::17)
 by TYZPR06MB5228.apcprd06.prod.outlook.com (2603:1096:400:1fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 05:38:26 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::f2) by SI2PR02CA0030.outlook.office365.com
 (2603:1096:4:195::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Wed,
 5 Mar 2025 05:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 05:38:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A7EC4416050A;
	Wed,  5 Mar 2025 13:38:23 +0800 (CST)
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
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v4 2/6] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Wed,  5 Mar 2025 13:38:19 +0800
Message-Id: <20250305053823.2048217-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305053823.2048217-1-peter.chen@cixtech.com>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYZPR06MB5228:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d475a08d-f98d-4c61-137f-08dd5ba7f32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E2G6gZ30YDt0KLG3qqWUtt5AFZuBRMNDr/ujkCvKf+3zdu29DgVuWN/vxNF4?=
 =?us-ascii?Q?o9/hsxZZVKYaW5zXMSn8t46S8+zY6ZivNfrB/HV91T6zqZtAZE3FITdKPfBf?=
 =?us-ascii?Q?zD8v5JWIg9spD8T8Q8daM4ZWHcouC47fe8hBocEvv5xqZ8OE4M41nlPqG7Nd?=
 =?us-ascii?Q?LBAbUl8Xfx26L/MrIlUGM26800uklXwGMWfNPh+wP2BeUrpwmd4N5kWpfG4S?=
 =?us-ascii?Q?vS5tH6GYcQKgaDOaU+iBuDG56ult6AGPjXyClxLoGCUDKaoDHbacNkMs9rzS?=
 =?us-ascii?Q?AesmalmGow3XNTaV8W9in8m8wMrKnk84hF+xPJVR9Dp+Me9pURua0Dm4hG1q?=
 =?us-ascii?Q?/t+TjHGsNj8O/nkuw5HxbT0BXKiDnLe/PwB9TwKQeQ4IxvY26C+lEj3fd4yi?=
 =?us-ascii?Q?f3/waFfjlXklavL/nnxYAXkObz9jL0gs85N9O0HfyruLzke7UMcTV2PlxjsX?=
 =?us-ascii?Q?WUqwTpDCMnhChuiCR3pxOmbMhpPPagzKCLNGVF2xyaLSoqigYYbknXCELpSh?=
 =?us-ascii?Q?mxNaVtaW6UdwsVns/PrIhcOpKDZW4fc1smUrrCoqFSB0rPvEk8ozmvXmkaIW?=
 =?us-ascii?Q?KQuJ5sk/SIaweYrtefd1pc0LVMNjkZCO64IaSm0QPtVJphXwzL9FtqA3uwT1?=
 =?us-ascii?Q?sclPP3w1L2d78L6SHFxjxZ8x134i9ybh6bi3yEn4uChzj13wI+EPke460dfm?=
 =?us-ascii?Q?31N0zybbXn6gW8XTWfwkhiEXaotq5qg80TSKksL9dOCjbXCYsLK6Mn+9Hgv6?=
 =?us-ascii?Q?IqLGy0OwiPdu2jhBWjTM6l6y8W+k+9BqOmQk35wxQZKGDi57YvtqrGbRa5sB?=
 =?us-ascii?Q?EeCeQPRMGNQdZFG2On5XSjPYK8kQ5BXrcdgNgJFFAzi7j3nNK+FEGNLXNkfR?=
 =?us-ascii?Q?brMge4hZFWZD63ooKUcDe1F+Y2caKQAcRmWxVErLAtJV8iaRGv1lDNashIWU?=
 =?us-ascii?Q?HyJjfcPgDonyzX4sQISlFiEMAcXAQ+sEzofWFB7elkySWWfYDvRAalyJUYXk?=
 =?us-ascii?Q?rTY/VkUmcF+vfD+BwTT0z+yovcwPNjU4hpBpGGyTh9F9meiyB8zdtQ8yRh8c?=
 =?us-ascii?Q?sedBNjb/ykyguYGBgzX8uYzw7l9Xex7ambnHE1X4m3KmLKx+ClqGZyf/zIk2?=
 =?us-ascii?Q?F49RtZVoVEIQCIEkEZZSjvPsffxLHcim6Vb0GKqGrz+1/Mi6chW0ZB6BF0Tg?=
 =?us-ascii?Q?+heY8DHR5YGYNEtvU1BhG/M/EIHgGtWxjdwSJyPKulkMI2Fk5ef+gr/5AAIv?=
 =?us-ascii?Q?+squgDIuugsb3ZQHiqbCGgB+HEsZ/YF3CCcSLynSMrSDuVGTXrruwEks1O4w?=
 =?us-ascii?Q?zqV7ORsuuGrIbDWDYYzW20olK+iBGJDND6gornA8mikoypV0vLIa890bG70l?=
 =?us-ascii?Q?4YoeRVtcrl1b15254ERUAE/mMBvrocZCEP1n1hqB47Dcy5Iwlc6khJd+SnZD?=
 =?us-ascii?Q?e1EGgINnydqEbSZeUszT2dB5q7Ne8uk5?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:38:25.1487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d475a08d-f98d-4c61-137f-08dd5ba7f32b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_213837_231649_34FF303C 
X-CRM114-Status: GOOD (  10.84  )
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


