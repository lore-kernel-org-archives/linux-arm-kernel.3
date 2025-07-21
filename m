Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93375C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xFO6SIchqCsiBZdpX9CLplf8tgp4KWzTEWUWlN78n4=; b=dnlzyKR2vf3ZTNerUmSKVqmq3a
	7lkiE/a+6rpl5AH+GrpeZ8S8eYYWmlfzkCYEhr+H6Ok/wlmtcvazz4b+8FYzzErxuVtJ8fhJCZOBG
	8eIvpUSzyAoIfFD70WtV9GtRJpOcMcKooOv97Zjzdpkh9niFvLI8JSrIDfHpmD77FmDwVij20O3ST
	qhhmlzav24j5NHXfe8g5ba3M/JptG6UjC6I63H4IBfw/pqWyM14lFV8nU0Kef4YmDDKPRdKhTEQmW
	ehRbI0NwTZEeEubTV5rgkbZwKoHyHJivf7ErDftee6b3Y4eXOZsvIGSsm4Yc7SfsbPG8qJDwfXYNm
	FO3FPouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbR-00000000CQy-1fGF;
	Mon, 21 Jul 2025 16:43:01 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlW-0000000HZwG-2cN8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCZl5omrGVwkLQ2PpYnK1eJpSWcv//tWYXn7e27bvYRHBxNj8aS/wty7JDi5vf1rB0U8EOwFx/LAidxOXXVwBb7pfyK9BFDKRKJt+Nc+dLsxJ4uXH6XNJhGgZ25D4ewLneKczIAOSxOAWAj54mCKVNTjELu5OPZpxyjPLgFyL8062rJNneiPZKyumBu8IskY1ZQf2FQ1XfYW/IXET8D0jJ/pqIK0kpq8Lpd4NqYheBgvIRvXfb+1DrwfAfV3sqAdf7UjlSyl6oYhLeoOFoINycsRQhWgk/jvWUoIHOv89ZfWkyECfIV9xSfhhhZEc8ZdZ/2nlCeHNFf8sRPcX2/Qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xFO6SIchqCsiBZdpX9CLplf8tgp4KWzTEWUWlN78n4=;
 b=wtGxpY6Fk8MAOPWSXlasL7BhQCd4F6sxW3Jb4dwbKa1wlpbXu/3vHZeZbREvwza59Cn5nXIvbRR91nXuPqGJ4umvQ6G7SqibsEJzhE0unB5Vab+6DALrKCrFGaZYJQfEuuO30O3ynBbXvJu6cEXZYCT35YivNgBe5j+IV2M2g8iykHf92kAdUai/vwXIA2YKVnS4WDqamwjyz+7hW+aFcb59sRELoWe7LDPR9YQ+QLtW2XenlYC4e40JVUkoFYgIqOcoz+/JO6hHmtF/qlLizYOpfjvMin5m22IxCc6tKemyDcdZ3vAwLN14tiPQ+ydU6w9VxtkxiE1hUr46c86NiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) by SG2PR06MB5156.apcprd06.prod.outlook.com
 (2603:1096:4:1cf::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:45:07 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:40:cafe::73) by SG2PR01CA0109.outlook.office365.com
 (2603:1096:4:40::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 14:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 14:45:06 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6F9FA4160509;
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
Subject: [PATCH v11 1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Mon, 21 Jul 2025 22:44:52 +0800
Message-Id: <20250721144500.302202-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
References: <20250721144500.302202-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SG2PR06MB5156:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2c4e1d52-74b4-4555-9d17-08ddc8652f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/MDGdxhxGss3whpKxUDccKB4acCjnp3L5OuY1K+9adMZ4EKFQaeU8lTcMa2c?=
 =?us-ascii?Q?4FL8iuLbtfoJihtq8yqg4oD12vuWHm06jiG8O9FW56Tozh+GmR+Khsk3YW1T?=
 =?us-ascii?Q?zScz2/zZnSSmYcniv3cLCICrMVTursbE3I9WEkOp2KdXLkXTlx2T1saOpC4V?=
 =?us-ascii?Q?TJDsfj3QnH6kS9fheqwEGV6INVIBIQrGzZV7Vu5QJczWxtrFhuFVMKyzcTPF?=
 =?us-ascii?Q?72B4aZxD/Pv5v6N5QGcNg0M06UVdjqzZFXhbCybydG6IxA5fppTvlLKetola?=
 =?us-ascii?Q?npAOkB+JIBcdY6bEkmdyOxVuEgFJDZ9evH+rmHtVB+3OuUC3Sch306dKsQgG?=
 =?us-ascii?Q?xhom74lZklug6jTbn7ZdHQWgZ2J9+hOSk1N9l4qceBob15yUJvX7amyY5N+V?=
 =?us-ascii?Q?SvWHVSvANo/MYz9r7HMxQm4+VayZaNTeUCrnYwOaGo0bL/PViTQ725zSUV1n?=
 =?us-ascii?Q?wvxbyWVLj6mB7i/2qBG64Cv+VQ5R/EK8ZJXrG8kQA6hndBgqAXMiah3GIflV?=
 =?us-ascii?Q?zuue2vDYvk8HdCZLBY0HcxNQ1FhJ1JYNdbNCzZ6E2O12+j2WmgDLvVB/NklN?=
 =?us-ascii?Q?dkExAQksQtuLUDB7loz+6AL4Qtze/TwjK4ps5g4Y8rbXtiF4CJg4MzndYXyE?=
 =?us-ascii?Q?QeHkSjZtNGEOtnoIcUzM7wYJQUk3yDZi8vCzm/TCinKXIgAbJL7g8tkpp+W+?=
 =?us-ascii?Q?SyrPSOoMPBxPpdDtCftCKXUta5PAwvJTLEQGmmQdkYphBdU30x2Y/KN3A4CS?=
 =?us-ascii?Q?98+eG2rVm5gl2yYccZgoOUEt2xj1FsWZTQ5+DDFFzv5Oo/6FTONhO8iZQOcO?=
 =?us-ascii?Q?q6gryO5bFNn7tuL9XNVCOEkIo8RGodabngmj08y4nzg5Q/gbuY8Q23St2hez?=
 =?us-ascii?Q?38TL6NA+r3Tg4rbE/xKQTEaYV+19Zm7T3rYDgQmChpJbUEWF21p8OjPHexes?=
 =?us-ascii?Q?yZHDTkMYxfQAHABjuZJNNgHCHCt0BKo+xFgc0sqjDS/XJDXoN56IubcsKD11?=
 =?us-ascii?Q?zO98Wxm504xdTTiLwfs1xfCEeBdco2JaD4wGEOvJmttuDThNKeUKp48akz5A?=
 =?us-ascii?Q?cKfqJsrn84scT4iFexkOkFu9J012KujsI1Ck3QAzO4nnPpqhPrlA3GTAdky2?=
 =?us-ascii?Q?9RUzUmGBsy39xYW5P1tlskhZr4+/N0rbXVAIdqutgvHMiPN6GchCLRFhMXW5?=
 =?us-ascii?Q?zEVolViWqFPorZsjYwrTqKUKZEQo3Och4SKzfsq7Ebda6A6xPRmED7Cohk12?=
 =?us-ascii?Q?9SKH3z5aMtuAMeI5FyNkxR7lKONfMjXL8N/eN5U6x8vMRhiew2pmbFH8SPkJ?=
 =?us-ascii?Q?5Z2Y1pki3ZqAeih1F5dNH35wpKiPd48OGtxik67Is3M5uBXvzquHRVYNj2Gp?=
 =?us-ascii?Q?rOJzOU22meo32aERouWublq3JIUZ4/YO7tA3EvbHFrEQk3hVMEhLuUdMBus2?=
 =?us-ascii?Q?JzDHtk722i8meNCus/cF8w5LmLzoRJ7Ts8jNmsLkeG6sF9fsXMv+/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:45:06.3278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4e1d52-74b4-4555-9d17-08ddc8652f28
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_074518_662048_C2B2434C 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

CIX Technology Group Co., Ltd. is a high performance Arm SoC design
company. Link: https://www.cixtech.com/.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..f258c1f53b3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -306,6 +306,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^cix,.*":
+    description: CIX Technology Group Co., Ltd.
   "^clockwork,.*":
     description: Clockwork Tech LLC
   "^cloos,.*":
-- 
2.25.1


