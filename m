Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E729C53216
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nq2QU1ER4nUnbTk8GOA+jU2+LNPPsY8qY32Pn25ybok=; b=X9RRL/YjPCCx5sXntBFQzA+MIJ
	HWGSuLWB26duo3HrgycWpeJByHVvjegppfYMVt5giDqlbnz6nlyp5cyeAeUClSXXI3gIjwFeERK3C
	yEbRl5FVnKGau9TQ9R5Od/LpZw6GJQ2G+lKUgGoW9/u9zl7hEm1lvfi1e9ZNyPRf6sv+pcjJRA2PP
	8PVPOPt0tw/dNJb/W1P6OpnXn8Ihj3PcY8j+lWAlFPXhhtownlD075UaO7Z47+tazab2Jmz+hxVbl
	512oPTj+DKjNjEyBTUBdWALwFmFpvdUE0/RHMMK4f1nFv/JG7BkJCoyrkVJMtzo2+9aOZbJ58/on9
	UdIPVcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtKW0-0000000DKk3-1Qc7;
	Fri, 20 Feb 2026 07:01:28 +0000
Received: from mail-southcentralusazon11012055.outbound.protection.outlook.com ([40.93.195.55] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtKVx-0000000DKjK-0gLP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 07:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBlPrB3CXPUYNb4v7JGj+M7/sVXEyRGbwtxi0tG4/kGySjr15X9lQdZI2KRM/hsi/BuRJQFQVMUrM5TLd81NMiNHyeXLi/XvaLcQwx8h9cvj0Y/grfhXTqtGeIun/EyRQSj1u9MwggdAmJ+Z0t2nOn23c3AfscZTV3Y57ZOM/2VfC6oJHEVCuwegEoPN0na1GXF0PFzpwIWDJbBjNh/37ZoQk9VNuP6ud6K+pQXEABTAOBvWPMvoJKejN4sXqSDw1kN9WigOhJm5IPspY+1ANBdxSeuUudelNuHvQ+Z+rb44UTNXpMfS1W30tf698GNzpMNOSOiDbVnfWC3sz0f89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq2QU1ER4nUnbTk8GOA+jU2+LNPPsY8qY32Pn25ybok=;
 b=FEXk0/3bBH+sVd43F8utxFyNgj3C1crDXDK5TnF0Idkb2rdc445uT17AKz6ZzkB/YV47iS4ixuCcmhXlWb47fjQKRatuKqdb79DESnfS1rKtzElPF39uwoI232RzsRO3+MqKRxa/bl3lgoDiK6SfCpLTolmoEQ38uiw27fjmFEqZhXo7HChErs2jXEuuR1o9+SEbjTBfqoYMyhebB431omQA1tlGdfFeUo05yLPv57Cg6B+pUcW3k4Kdlni5ssCsYH3AvnZfFJTsM0Qj+c1CSKye8yBWlEZ9upviX3GfTJ4jn23GBpqvP/AJUZ9nbkvHUaI48Ul583pfRZDphwdSiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq2QU1ER4nUnbTk8GOA+jU2+LNPPsY8qY32Pn25ybok=;
 b=Xn9oFFsUmLb0Y/s4A9YCJ3f9LlviK9S1Jbz3b1OhElw83ScRCNmCkmPzbZvxlGvWsEFPdWecetW9vwM47R8wU70zdXigVmPzdlOCoVjiAq6aOjMthttU3d5zaFmN19T2xQF+4mfqmnYSEq7r4N936V+nlEqCsxBbcZaGfTLC9O8=
Received: from CH2PR15CA0025.namprd15.prod.outlook.com (2603:10b6:610:51::35)
 by CY8PR10MB6876.namprd10.prod.outlook.com (2603:10b6:930:87::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 07:01:18 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::73) by CH2PR15CA0025.outlook.office365.com
 (2603:10b6:610:51::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend
 Transport; Fri, 20 Feb 2026 07:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 07:01:17 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 01:01:17 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 01:01:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 01:01:16 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K71D8C3448537;
	Fri, 20 Feb 2026 01:01:14 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2] soc: ti: k3-ringacc: include platform_device header
Date: Fri, 20 Feb 2026 12:32:40 +0530
Message-ID: <20260220070242.470060-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CY8PR10MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 6232ecef-7386-4535-14fb-08de704dd87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7SD0UJsRPLwds2jQYSQfQjy0Vk2f2tn4sv/azIuUg7VkG5QJWjtzUebFGJ3?=
 =?us-ascii?Q?OKTqzd1lW5fr3DO0OJ2sNXyjt4eS+5kHLkHmE6rdkpkLk2k3TjsWN0iMHvM6?=
 =?us-ascii?Q?aRU6rVOd9IuSWbB7WphdBiiSOHDMND/FMHiVnApfi1IKBbHIPIwFrYBCcim+?=
 =?us-ascii?Q?OdXdOiIze/6NA1Jc3klXsyjZvAm5mrPEgE6UYD/gVxQHX6nr44jcSj4sdwu3?=
 =?us-ascii?Q?hBld9CGigPYm7BOYvxvnGSdzn6KTEvW24pwD7mEZjm0mOi5ebLaJY3w4ARR1?=
 =?us-ascii?Q?idbsS0CMFzr1V7ZroYT325HlOYSQNuU2pedBrmsEjjmjAPj3M56FWiA7FL/W?=
 =?us-ascii?Q?Qn7BXfQNIn5aNlAMZmIJqKCRARPtUXpCY1kuuKvWjmQ+usx2Ooco3I+PZhO9?=
 =?us-ascii?Q?axEIXfDpJGC9tsYDd5peu3TMw/JF8swEaHAUF82VtduaIT1QB9t6fW427PxH?=
 =?us-ascii?Q?OaUJpM9RYAEfrBJZYrPFzj9pV713noiL6AmINTMxOe/fg3hZKOGGxLnDt1vp?=
 =?us-ascii?Q?4KsDyJa74Xi2GtmJGBujxHQGh5LZ1U7iLH1KSr5+aK7RQK0ZaJmfY3vTQzgn?=
 =?us-ascii?Q?eKR+wgoKtfD2a4dmEfb1TOlSGZ6C8pFOnTkvnC/UtEKAGT/N6TYpkoowIBMk?=
 =?us-ascii?Q?FEhQlpJ9Ft+Gz1RvCYjZPepMUFdVv9BKsoiiK1+SIAYCvENdNQ2Hd+WrEwqY?=
 =?us-ascii?Q?eRb8VURAttz1njfQdha3lA7/TC2RW/5yNdJ13GhSxGsO8wJC6FLgshbLZT7i?=
 =?us-ascii?Q?h2avudjCcxI5u966UfOWasF74ZcJQen4L29X2O9CL/bvZOY+RpATsBh+IdbA?=
 =?us-ascii?Q?2xAddv+51jAEBoz8LA8uXlFwsbdipM74jdxuwMq1k53bk40rkK3NHfGF1Y/K?=
 =?us-ascii?Q?9+Eibe18HCnDQDDF04Fdkw601U4TLyG1+DokxHU2Cun/L0gBR2pt1WDYlhu1?=
 =?us-ascii?Q?gW0J2CuAH5wIYA0paWeNQgYQTiCuA12ewDhsc4tgaPB1ZXeCKi7mOCzYnnai?=
 =?us-ascii?Q?EQIJpn/holCzGsVF3iOBKcv0p1F73d5RbCGsofAkODYP94ajd+wi4+wFFWiE?=
 =?us-ascii?Q?c3czARCkwILq8ozbFROq68wU9WykTzVPgtkVsL4lPmpH0WKhCLSt6iOypTGr?=
 =?us-ascii?Q?sMgrqmqcc6dLm1uK3qTXl/fpFqticIi9zMZ4G2Xf69/TWCDYS2PGOmkE1jI5?=
 =?us-ascii?Q?uTtjdexHdgSRU7txK6BDtoEf10LoH7CLYwCddIf9JyjJ6IX0zeRd3VUTyXJT?=
 =?us-ascii?Q?O4odRoRXc2VQoPKwqBIP9IwZYmi+QgrYvhEAeM6baa2b25ff3CtNqLgaOx+R?=
 =?us-ascii?Q?8ehsFPRZTUK8EuOC3d/gZxcyIcy46maO/K3mMCix5KYMsV4tJ2uy7JA+GvpF?=
 =?us-ascii?Q?jUBeTcIYd1yxqGeAvr/Ww+kIddeiLNCLx7OoYun/ObQH6yTTLBFi6TEosCP+?=
 =?us-ascii?Q?5NaVwrzZssvAsuU1rkRuxoCEs29dcSKdlqSLWf+9n+qA0DxFq6QK/dWthgk4?=
 =?us-ascii?Q?ZD9DcAiBf7DtKwPQonjRL4y+z4CSEuRdt1+CAuON9DZrjFZ6l5G/95zJ1a19?=
 =?us-ascii?Q?EBjvgTSMdBI5AOfTuMUCdl2iHCFhXhRMYg8M6/X4UvaLOl4/jbFToiDICbQD?=
 =?us-ascii?Q?97udzGfKU8eRPTdKc47IeL1TRSRtSsDmoUysit8p+DU7S/E3P4ClLtH7PME5?=
 =?us-ascii?Q?6ZI5rg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0VwQWPItseXcRVh0FRdKbd6uEerSCpK/0VM6AfrGr61SIBtGP3EqvKen2PFQmDyZQ+tFa1WAS/v/qK5nLJiXMOcd5jk+qgV/xyqgW3K4St/CFd+iAtnxbptoKrRxlNOJAWmkGEEaamR+HxIfrIEgDYjGe/dpOimnOpS6Fdk7rdya0tDk1x2dkIKbt8PFaehvWxWMVJM6CGqd8OfXFXtteJW+2TJyj2UKpRt+RTsZfJwEHsU1mXRfW+QeiHI+zWBjXjDJNF7LgJuMmKs8hmP2cQ35A2ZOoPdlEvpU6y4/Lb4HCRuUKg15Eapvrxi6bCEq2g7QLdIbsr+IU3kSpkT+81hU9XGFkRTkrFKEPmSxhkX4UJTTXCuqWr+7vcBbzy4Fba2TSWcGCXIXxqOC4+tDC0GaTsfejJBJihH3FKVRurzcuT+124N9QWKAMficwhjE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 07:01:17.9055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6232ecef-7386-4535-14fb-08de704dd87d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_230125_310815_F3F96C63 
X-CRM114-Status: UNSURE (   7.38  )
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

Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
users therefore will not include "platform_device.h", resulting in
compilation warnings for the APIs declared in "k3-ringacc.h" which assume
inclusion of "platform_device.h" by its users.

Fix the compilation warnings by including the "platform_device" header
file, which should ideally have been included since commit under Fixes.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---

Hello,

This patch is based on commit
8bf22c33e7a1 Merge tag 'net-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
of Mainline Linux.

v1 of this patch is at:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250207065123.879863-1-s-vadapalli@ti.com/
Changes since v1:
- Collected R-b tag.
- Rebased patch.

Regards,
Siddharth.

 include/linux/soc/ti/k3-ringacc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..6bbb58068048 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -8,6 +8,7 @@
 #ifndef __SOC_TI_K3_RINGACC_API_H_
 #define __SOC_TI_K3_RINGACC_API_H_
 
+#include <linux/platform_device.h>
 #include <linux/types.h>
 
 struct device_node;
-- 
2.51.1


