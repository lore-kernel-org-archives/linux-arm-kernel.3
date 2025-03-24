Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A87C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=jTcmrjD/yp1/NGs7GmZ3Ba54QM
	9zYox/RS50lYbcMbo0ikOW+8Ji/m5UfJMKwziiZixjM6c6Ia+E1D4TML/w4+pavsYIxVeAh7KYR8i
	TXj40EojVmx4o0UTg7PzxHKdmUyOJ7juAaCixflAu2GsYYO9IyAICg9f3284lMkHYO6SBxXx81wpY
	oOkBvAbrxVjvJGOjaFwdHpBYbLeHbfE5tBj+OSkk8wK6Fzg6CbUAUPrj6tWOhDggOscaro+dRzE3B
	p321e0Yg0xZ78R1ztSS4fsvL4Puj5+l6JNlvPykl0DJzyFjQs+vX2qKL8n2X4dY2v117B3/kzUFta
	UjQSkL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbLX-00000002KTK-3nkx;
	Mon, 24 Mar 2025 06:31:39 +0000
Received: from mail-tyzapc01on20720.outbound.protection.outlook.com ([2a01:111:f403:2011::720] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbEe-00000002JOW-03sI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:24:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXsmmJb6FCQreXwc41nnHCNXMQECK+SiDXIKryMI2n8Ay0yVZYp46+ealbddVue42Wixa4bdnIzSLryKwoV5L/oqq2tAtlncjj3n8lWiPyFFRkKyqc97wUUYFc4Q5sHdhkMDTklfL8C8YblXldm+Wq82XvqsGJtzQ1JPiXt+KBE/GSZpucqdWh8/t1W5YX8hQVW6kGgq9/LADJTIn7vmi4U6bwlnnXJpkPhdlgx1Mfn7/J4gf6ErePjvS8AYpBHSUSAU0GVnEf11ePu1IiEYVssHW/EBuqrMrmgbDkU+nmrDiSeUgKSK5hNyH8bzwVls+yPuHfMutfY66gV6polgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=Y3KV9WueeEE+hzZr6p4bA+jR+U3m9vnW3xDNY2eDt/H17I/SbDXcWldz3OGKIS+wzsLvMqaqdkIERk8blCYcqc1jzb93wutY0QgHJEbIJ48Njyy9cGfH1bq3qgk7Ub8dvLj0sObCLU9cxS/u5Tp0ka8qAvps31BImYDI+lO95HZAJpI9hSiCW7A9O0Dxa/H8rp6W6pDcTYgaRq8eqcq5aaNZMVtbMG1YNPj3kUDLVQfsYCNAQYsJ1EB7PP42EIF9OAdbh2InwXunkZLnDdlyydLpudu45afg4MtWM1yPFkx4PWS+HQ4tlarRsCg8cnyqa4giL8ngHFFNz4vvL+59Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0004.apcprd02.prod.outlook.com (2603:1096:4:1f7::12)
 by TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:24:22 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:1f7:cafe::84) by SI1PR02CA0004.outlook.office365.com
 (2603:1096:4:1f7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Mon,
 24 Mar 2025 06:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 06:24:21 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AC7554160CA2;
	Mon, 24 Mar 2025 14:24:20 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
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
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v5 2/6] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Mon, 24 Mar 2025 14:24:16 +0800
Message-Id: <20250324062420.360289-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324062420.360289-1-peter.chen@cixtech.com>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYZPR06MB6191:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c18eac63-fda1-4712-4ddd-08dd6a9c8403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NgApj/52MgnND81kRAbXlNnGJbMPNDtRhN272dnXDhMpBSZ8wO1Cy+qmnHYN?=
 =?us-ascii?Q?sy5wHhH2YbUKXHjTjPLT6xQeDPt9caBMGwldvJq0+2orQFy2KNJKvZe4/FEo?=
 =?us-ascii?Q?VHNmOa0GLxbYiAbqxdfy5JhnScSbwi5e56lZkf8aalmfTSLCWe8vMmBaOZ6A?=
 =?us-ascii?Q?je2JeTtMReJElfo80MTDnpH89zAWem8iw6EILbPPEsjt9VccqTE/hwxLHrzi?=
 =?us-ascii?Q?E+lch7fumWZ3KPxOgeb29MRb/qe2Ybh4QhkS0lchdNfNHOfNKdPi7rZchV0t?=
 =?us-ascii?Q?AG5w5qrcd2KYlgG5Ek8Sf/pFvmOts5+9FZRqBhZsBM4G92qikO/o6unvJxTx?=
 =?us-ascii?Q?ebopK8X7p1YF5YQ+3iSOU/+KVBwj4kReV73yb3rA2N3fq6F6+e/suShNuGKj?=
 =?us-ascii?Q?+aLXxSBH+8YogAFUhTLNIpmXElIvJiOtFhS59hEO5q2oTB2XSfO4xGyWt9hN?=
 =?us-ascii?Q?wx9M+BmiFxuCYdmPZzSFzgkUTBVKJm+yrXx3G18w0EQgZiYZSSJWbECjZAuv?=
 =?us-ascii?Q?rO/9g3XrvCTd+QxAsOZ59zfMwT+BpET/0Wn8ZvDB1urQtqquxELDYu07cd/4?=
 =?us-ascii?Q?sbMPnlujcH+8JLHJ/YclWE2BK46yNQBBwM3EVHc1dGOogQJ54j5+TeffPwVE?=
 =?us-ascii?Q?YFtjKm5t79rGQ8BtAvPu6xBre4qktAsIBxaZJzXhQchOy1cm1gtJpKuo9WEs?=
 =?us-ascii?Q?JzLpSuWQp2GDeLNrDsKpJM4OcHXG0xamn3wwhpwi5qxmcjkMfpD6qSZfb0Tb?=
 =?us-ascii?Q?bDv7p+A2YlDYnpLqTDaQVJAhCBT8Z5o9uk82DtW/AieMxxPaeh+JSuxFIfHY?=
 =?us-ascii?Q?Bb0NS8619/mMl4XzoJh8UHcGI5cnOnkkMRP5Pyg77spsKPQzMpXUU1Xd6SEa?=
 =?us-ascii?Q?oa+17uYV2bGWDwA4NM1RwsCfihLEJ7d7n++D/4g6AGFgjxc6y8omn8+8ZW02?=
 =?us-ascii?Q?lG8woi/ghaXk7p0Vp1aLFiTUBkZd+pLGo8iQmlJa0y+smNZ3EIMgd/FCHuG5?=
 =?us-ascii?Q?DQPFC+k2WAdNXqJxfbOkye3Outn6gnX6aotsobqsYL4mCf0KHrdssw7LuaF8?=
 =?us-ascii?Q?dw2gDSG/TqiyduxCv9UX5YgPrw3WPH1s+n56q/3OcBr8CPpoZY+OGT51gePt?=
 =?us-ascii?Q?qOTgUMTCcyEDgjXz3ds2O7oHfhO8YIKJu9Ey4MThKof/wbq5IwkP2Mr1YGfa?=
 =?us-ascii?Q?ca7w2Falfu+tZkjAKtz5ppW35kl5CORPk+kA2zjYHg+6tc8yvXU/Fzxp8xvk?=
 =?us-ascii?Q?qWgeUgx2X8jmy5vs6BHD5hrXRcoGCpcHjw94ii2KaWUPTfam+ERL8zrjH2u8?=
 =?us-ascii?Q?2mFscs3X3VA/pxh6KJlnclDw9UDNFlsnDKtCZPNU5Y5qTf5xA/ReeG3dKcF+?=
 =?us-ascii?Q?cl1jDIthEsgrxIt50bAlM6bfNScZHo+OZMRfdDtWYs4wfgvPbj48PK528NhO?=
 =?us-ascii?Q?xeYQw3jzaY4F8fPVItMm6JlGYItHL98C?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:24:21.6229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18eac63-fda1-4712-4ddd-08dd6a9c8403
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232432_052826_EBE45927 
X-CRM114-Status: GOOD (  10.79  )
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


