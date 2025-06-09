Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A573FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=mZeSkujXNMMyqS6ZN3Un8QHYWl
	CZaDg8QJc3VKSHhyd//XrOw/vjtdk6rx2IPvOpo5KMPQtl27IFWEASBxGzTVu5VfNWYd6de9Er7O1
	N2yDmJFBg4mkqgYZl7pzw+ZD98FMdXbptBo+t9kW3MgkaPEOBLg/12801owtDkgBM91qCmJDUJ/2U
	ez5PDUHlCNV9fUoaYgB3IyWx/ZdaKWfDgFIuYnIehMb0E4VlfVLiVikS4qKtCl6vU6L+6NUOE0pqj
	YaVFScYSlIVGFAo05bZ/OiNyldz1mqhdm6M1kl8WO7GOoI9Q9cqH0TpAAE3MfKgyPZZml56cO2LV3
	763Htmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTHF-00000003LeR-0fZc;
	Mon, 09 Jun 2025 03:34:25 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT08-00000003KEF-2Sba
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTa0uc+53wgl2o+N5FFiu4vSnSG0V2clTP9D8+pIL/YErOgD/qQKa2as/V3153iKFKi/iDtidTAdFJlkNo8E7FKpNVlMiCmDRSlX+jg81tOxgKBt6gNj/6MhgBFLqdQRDCOzJio6vlgHi6tnpOyk9YCTmlYlZBQ/BP5ffPz5bS1t6o6zxsJf49omj+/JKJHhVAhuDghjbTEb07olYL5DKWz14oqPMrKAXSIli2EiMKxP1ZbOIg+Tn0wJ1NPHKA3RDqREUmKz01paiNUeUxtL64yZOeVefCRucUQuCzwdGvSSlGkMACbcEVz+ocorvNEu9LOrNFmCGMqhtRx2kv5OLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=Mlrve/lHnDSmgHGm/VZhGLYYdd2V4jXv2JFhxVpERrCU1fYUbEqVzjnEoYrk1/cKugajvkRMAVfKuU9BBy4iRoWfuEhi8Y/wf1N4Dr+EN5457mywda4cFSeCg36/FvRluKw5bx4Mlsx2UHnnL0P0+2HFJQSutq5aAmutosVxqEp4N3F8EyQNS6MIZTz5GPniJvZmHg5XC8ehzsyIvd+uyhAaGy/nTADlBZKcZRO3QhKtxh9xlRN093K2a6GfU3PRS/iDipi2D5PhWT1+usutC6C1S6ZptMaMof51rU5vMjELboP+Yh61w28bBEaaTw7r7wVKrd9QNIEMOz5fzePnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0206.jpnprd01.prod.outlook.com (2603:1096:405:7a::17)
 by TYZPR06MB7189.apcprd06.prod.outlook.com (2603:1096:405:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 03:16:29 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:405:7a:cafe::15) by TYCPR01CA0206.outlook.office365.com
 (2603:1096:405:7a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8D36F4160CA2;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
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
Subject: [PATCH v9 2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Mon,  9 Jun 2025 11:16:20 +0800
Message-Id: <20250609031627.1605851-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|TYZPR06MB7189:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60b9488a-a39e-4f09-cd4b-08dda7040677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sckvQ6oBXmdV23YJgDlb7ZzeD3t/uCU/vJDnGI4bQQXx7lj89TEJyz+FBl3H?=
 =?us-ascii?Q?5DKUcLSxFhKxbyr/mDwZ9k41xcRfEZzC8PPXiQCOC9ZWWdt9tNtleQiGeoyD?=
 =?us-ascii?Q?hu1c35SA4rDbODoZ1cSnQUhb4W1oz0G2+G+MhGinYI9s8L8xYLIYYcF6DqTo?=
 =?us-ascii?Q?Ym9a+RJyhL1JMeUHk7ENHVrJjoWwJfEgtG2MbACkHykujkvv2tOh8jUnjuhZ?=
 =?us-ascii?Q?ezLUuqudWLp+0Y92ecp+yukDFC08vpmpTx2jWuoo5ui0Se8PBZZKCou8zYBm?=
 =?us-ascii?Q?aNYB0HRfdJllDPV3j3fs4CCakzWXZQNaATim/Y7T64yzdCp6z+HDf77qW+nD?=
 =?us-ascii?Q?f8uGcAPyQ70htSpNJsIzljZ795qCmiS+FoPMd2aaiFK7qo7x79dhreppHy+e?=
 =?us-ascii?Q?OZzXHsvYLp9lwEm06RobHc/ZS5PnUCN0AxL2gOQbE+yLxDr3BfpC3RyVVeTv?=
 =?us-ascii?Q?ZnlfWKDI7yuACn1mLfn/xcdywT7XZmi4vGdywR2w2jKmz+zfpkOM8LMuNgpS?=
 =?us-ascii?Q?qQZFSylFzSgmrJuMMCN/Nao4EDJfOM/badgZjRC5Ma5b5Krd43e9YvtXK5dB?=
 =?us-ascii?Q?ygafxgnxQrJbRi2dHQwN7YZ/JS+Wv0sm7+xRg3vaCEJ3lbN9zccdyGj8Hqqn?=
 =?us-ascii?Q?qWW6dxXUPLmAep8cV8RfDjgvIe1y/LizJWfOA7B1pWErB5PuTIWe5B70a6Wm?=
 =?us-ascii?Q?qzTKo2krumVqFUH8cC2i8ObijMAJsx7/fbd1G1C9volnob+QS2eqYRkONkek?=
 =?us-ascii?Q?ooxU2GbE4gRkzxuwAYNeYcc3KMDh1l5O8YrT50kOtrU9FBB+0799FHwq553Q?=
 =?us-ascii?Q?1sPELFwoiN4+FeQaCvVO1+GdStbj8tke0ZeknKGQ/+iyGTm7bRamlo0Qkdtl?=
 =?us-ascii?Q?vGaw5DBga2cHDoRF/iFdabayCyMD67rs2R465nRiwIcI0hNeODBqcciIpcjF?=
 =?us-ascii?Q?524QE/UAVZZlYo3xRVtqxynQkDpOVfJZ3pEpPtykKk7kT9X8H+gPv+dDx4iL?=
 =?us-ascii?Q?mCjQUFLYs0d7ErmMXGTHu5ExmhUlG5wAQvDenWE7PS5wG4pYdn3tGTikkgZU?=
 =?us-ascii?Q?V31cNyyAoBk37ef+nK2RxCkcK/M9tRfxC93hlQWa0BLQUspF/7/UJYTyVJ4T?=
 =?us-ascii?Q?9bQECyZcbel6IuZpI+BlrCd6U08o1w2TcEJSzPHxqC0IjliG/jxx/mXXTKVh?=
 =?us-ascii?Q?6yky/eaaI2kVWTABnEC9bO5xMKUVzoiEIZkQaJiL0FTRXr43lDgatfgC2Oc+?=
 =?us-ascii?Q?gLyckJzWWoQFvfkXhQAHNx0isDQw9xy7ozlw1gU/dxOp+o2UIC+yXsgPFAAh?=
 =?us-ascii?Q?wZj8ICbSP/NRWg9ReK7OWOY2cpocvZYQfh6mXdABzgpe7vUWPASdoRfIlmaD?=
 =?us-ascii?Q?K5FW0rQ0ZTe12s7sVoagjy0r2st2eU7o+9/LNGw4IZKzyEC0bB2VAuBKgHcK?=
 =?us-ascii?Q?Zd9xrTbdKNNCCeiLmg7ANdp4X42temvDoA0LQJoz5g/AOjUw5+YOag=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.4421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b9488a-a39e-4f09-cd4b-08dda7040677
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_201644_635663_C7477F07 
X-CRM114-Status: GOOD (  10.38  )
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


