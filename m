Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D8CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWgEbr/VBooNYfdqmVxEjKuCQHBMTXKKYXtYF+yj5mE=; b=AjNw982i9Wi5hiBd1gVn6m/9j8
	Fw3oXMaqFWr+S58ZPD5e2E4YtIbrtXEgqcIgmVbXK3OMwLr7nDM2bZT0CvbW+ngexuGS0ulh14oDE
	SOuIuzzIJ/XbvIb9eNkyIuZM28qFD1kBo6PYv4BUcNSwbw2uFvwC1vDNclB1RJsTzsI7B0eJSEEeX
	tYQAWtjqAu29zfAkN5yxBGIc7NB9kmGb+YzSHSiMK2hKiUsenXCNknhHGrNX7S4aeyEOXhh8+FHTy
	oPLeHP4pJFaRsFI8CbIcxl3kTQKcwb9jWJ3u/teDv578v+H/HUlMgwVigUIavPylA3vCb4SGFpQkI
	CgV3TaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2BA-0000000HQy8-3MkA;
	Thu, 20 Feb 2025 08:45:08 +0000
Received: from mail-psaapc01on20706.outbound.protection.outlook.com ([2a01:111:f403:200e::706] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl26l-0000000HPY3-3uVJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:40:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0iGCZE4/qVMrYSFvR1YUSv8b8TEK3LyzWYcG9g8se2b8QUTpdURVOwQ7HLutIV1ZuYlZda/k31R3mr47OlTw/ai9BZlIg5syWWB+S8CnUnbifSbIgCVwOO4Qj4nd6iWKkJZcbbizJPGiGAXm8iG7tIQgCrVBSaiJtpSAS9Khbwiq/8o/fyywRjJRRRllNJyCKGxbrqcF3sntDoT80pekViz9JJuCGJSPr50kitGyR0HTeizF+VrmCUH+5Wd5O2jk7cZ5NtW2eEFo6wwxbVRe30jZ1C90iCxpVlyD6MdDMyNhs2szxYkmB7yvoanAAFGiK5uHAdEFBGpplwUIMVSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWgEbr/VBooNYfdqmVxEjKuCQHBMTXKKYXtYF+yj5mE=;
 b=SlMaHglj0pdV+CsrvveGz+EU6obJV0kuwWHcDinmMeYGflGa8UnP1N8Q44b/sNVZJ3hsvq3CjhK2cFDcCS9xtBRS5w5I7xSEpYK3RmKpjwE2Ir1m6PZSoPxwktCoApYGEs3IRHM5J9Hq8ygeXXWRiQWAuhM1wNCE41NHAaYZpXKK8px66AM7UMvgih25MVFePdFdkn7tU/dO03y0dJ2r7B/LPkGIsG6/+boOqzxNoXF63XXtaGp7yzxJB0CbvpeGHWp9LIaK/qLWsB3B3V5h9NOqDm3ZJ8x69qRNunNPYOLQoFvZNF5gLuW/YMfAVQLJur8U7mULYvuiBFCQlq9jXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWgEbr/VBooNYfdqmVxEjKuCQHBMTXKKYXtYF+yj5mE=;
 b=SLfvUGBKwv49i/Rr2wfwfQhcJg6z+u/4K2eivnIVp8+DXv2IRvhbgaISb26A8bX3rhzP8UrAvkkp2IR3jp/ZZhTK/V974ivuYw1N8s68YmdIGfIfZEjctA95460plZCoYYv2+GUKhzno0tDOpIafnukjRYtTIznCnqMsYNyK3T3ak75HKA+zkDhd3DlQ/i0E1/eqON2A6hRn7Al+cJQKbV3srvisSjkb5DjfPwhGZYRJNR//XkC69ob9VghekFvi1U92wL2D35bfRT7BzwoShaT7vOgagYtq6SnjVtD651EyS//6le+swJrj5bzm660KtErPWNtOpI5Xm8k2AV3Cdw==
Received: from SG2PR02CA0041.apcprd02.prod.outlook.com (2603:1096:3:18::29) by
 OSQPR06MB7230.apcprd06.prod.outlook.com (2603:1096:604:290::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 08:40:23 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::79) by SG2PR02CA0041.outlook.office365.com
 (2603:1096:3:18::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 08:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:40:21 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7462F41C0A02;
	Thu, 20 Feb 2025 16:40:20 +0800 (CST)
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
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH 1/6] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Thu, 20 Feb 2025 16:40:15 +0800
Message-Id: <20250220084020.628704-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220084020.628704-1-peter.chen@cixtech.com>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|OSQPR06MB7230:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7861cb90-92eb-4517-6323-08dd518a3636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XBD0wPcDayOpwygVh5RraGGTFPdtmunmz7+AGeIY+nc1ITX0WvmTE8uiSXcv?=
 =?us-ascii?Q?PGCCSdzGXMwHZyox/pK8ayx6XJ9upo6wv4VumRCqJw8gcJ71kDKEprb/y4AR?=
 =?us-ascii?Q?jZx4jN8gHHx1EB7xnmRy0jgBlHKbVCk/DDf+qwRpdJwCVg4SbHMW+4A4w1ZU?=
 =?us-ascii?Q?UKMiJCmKQa91biejR40+vMUaiEk2rGuAypI6P7ARr3Nqf2lfqYNmGtrCsA2U?=
 =?us-ascii?Q?4AIBD8GtkfV3qsjmDOESA6Pvl6b7ItlABkJQ6Quw/YBKMl8t+nB3reRNy6Ab?=
 =?us-ascii?Q?D+2bP4Zg1tmKmZn+NJZa9ZoCAcsjSC0rOam3PGkH4u3RJhiY75zP1wDA3tVs?=
 =?us-ascii?Q?2Ttw6nHi3H9fxX8rnJ6rLY962j2+rt31H+k8KiAxobVCCD4/pzWUQkuFZhfw?=
 =?us-ascii?Q?N0AUKkY2MJAI/LyhI859EwIdshx9aHtmo2gHTKuObGICzyynZEhuo/xmPZ3q?=
 =?us-ascii?Q?IVE66lWZwwinqo89YVPAVeVInb/ALXxphZc74VCPI4CzXS672E2EDp2VXbFA?=
 =?us-ascii?Q?H48a4hYBP6QLBTEAFNoaecS6kzGxpFWWmKDGa30IT6hBNuVx8ypm6K+JeBaA?=
 =?us-ascii?Q?q7nN/hisY9lkc+EuV3JdtLnap6WGA6/aNkFYcRo+yjpW6yZpcIsxrwji9kp0?=
 =?us-ascii?Q?fLnsqdahLnzYz0SV1QoonE2IXD8rQr1zd9Jy4uqfuxjDr8DNdILXmxy49fTM?=
 =?us-ascii?Q?1R1pWW/uNQGCWnlNKuvQs48V2efaWn4KqYsYS2kH+bryvHxm4DCbcxJ23FVY?=
 =?us-ascii?Q?WwfVllByEFKuDxZSYTffOFjap+VRSOHPMvVchYO9ECVw90pDvECI0TwT5TuD?=
 =?us-ascii?Q?qFkwhWJL/rLOhpJwMg9LgNdeZuYB2emnqRHofsNMI/IGZDZe4m3IreA54wpS?=
 =?us-ascii?Q?nQF6rKOw86EwuO29/8x9X2oVBxDMfz4p5e0gruJ605K9XCDIITgX6lpDv89M?=
 =?us-ascii?Q?S99/yEEREieugvB9m7Oq4mEyR75U/Grn9gbnRRTviDGsZeJU9JkoLLJnktQR?=
 =?us-ascii?Q?ogwyBoXSjrhXCyoGdB2lh2pi2Zn9e3C+Mjr4C+HNsDdnR/Wa7mtIFSVCQLP1?=
 =?us-ascii?Q?KLwxlUpRMB/xozojKdNOkZkqHGpOSFh4cpMmJECdg2b8znkvHwLyGuLRhO85?=
 =?us-ascii?Q?nf8G4uXMVuP+MMsIdUDeJ6KtxWOJXQ+2iVWFMpCiQFk6LZ+UDMBFjdaiWw1L?=
 =?us-ascii?Q?ZVeVp1LuYYuxFv0dJWRTA0gpwAOllhDBpNWucXNBZmynV8U0TBXk4+tdeTXU?=
 =?us-ascii?Q?GNBGHjR+CUEuULEErMQVVhlymg6YqUahrwoOPYOxolHGuS9hp1u20+hyLzhw?=
 =?us-ascii?Q?RFxx4wxrNkxmDJxpFPouBo1t7kdZdFkoRNKZMQFv4EWkk0UaXBtlOw0KLZU3?=
 =?us-ascii?Q?zP6mVyjs9C/rNOmvuQ0GjcasN2sXYHoiD6cIK5rhu6tepfYFUUBld1pWhhZr?=
 =?us-ascii?Q?L9GfvBp8/4k=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:40:21.1630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7861cb90-92eb-4517-6323-08dd518a3636
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_004035_985200_080AAD7A 
X-CRM114-Status: GOOD (  10.33  )
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


