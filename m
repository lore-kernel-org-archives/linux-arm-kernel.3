Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2C5C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 01:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++/x0W7ekADfWJSr6zLBqZf9TmVR/5WzBIGDff14kTY=; b=MfkzKTPCOijU76CevtHmbaEF/g
	v6im4VIhbO7yYoJpUso+Wxw6vEWFoPs6ykjSHVwWNGTlesdTUKr9dBVgUnbhyVtlrSdaSXI54PmO6
	duTqEdAGTqxOjFMyIY1S4/j861Ua6kgbBX2SNvLztwfxRqtOvT2GLGtMVRC2p1V/8bxeC7s6CpSQy
	TduipPmY+HXUuIfXb2Wmxfd0uib5WAH9DJoziHb40WEh/Xmlkf07LhWjU9FDPCzGvDMWbqrpOmtRT
	VN0CvFxff0hdBEHSxp1VvhqNNTl4IG6Lz/ClUsGRJcMmTn4xZJzOdCh296GLReXnGdAf28ZH5zZbm
	jX16SlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAL7-00000008Yn6-2Qp0;
	Wed, 11 Jun 2025 01:33:17 +0000
Received: from mail-co1nam11on2062d.outbound.protection.outlook.com ([2a01:111:f403:2416::62d] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAIw-00000008Ycf-3jlm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 01:31:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0svVGVR88wqW0SoeGc+0h5xHs3A1kzxWPLHKucjZQZftSJKKeol71mIwLUQBAzmkhLB+vCiKRh1uGVGcHx9jf97zEkuAARYOxybG3HoUjWrIHYu2DhjdSx4VTszYVKVovLxBSK4P/VHjj/ZeqrrD4k11XEGoZQQmlO4UcxAc/xgLphZQK7nz+wNNqZsGjBKJAmOGQJjKmUq/atzi5UstW/WIG9LjvA+ZMGd+C3+bCCrOfOF8/ohekpWD3lO0mZnIaIoLP1t1w+iS0btgzufwWtRwCuQxkaaFFtb+aCTxNf5GVKb82vBVYWrOym18Gmp+R230iuJ3Qfj9oPm0ztRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++/x0W7ekADfWJSr6zLBqZf9TmVR/5WzBIGDff14kTY=;
 b=aR91WSIwwduwXnlKP+XZdAxdMx9dviCnka/NmnCn8MLQEESR3rxPdqZFoMTEAGUJvwnGFz8YaOtaopEqhFkrZvCDKr81iamMiObrlNyktpnAFvYunERH0Sw2ObgfrcYNyRCGXr0JxIX2OQKjkwy5SVldyLu2YfjhQztZraYUYjRsDuZnaJZxvKxgsJ3+rkk7XfVJlwIAlUVMfNyXtvJ1VFvoFFu5HDVSZ3JlLhSYlCBIRYTgSQEVnElIECHvZB7jiVKj6Wbp7x2wX2VbSDd6ocA4P9P7eaHnUoEMJ2jDVGxfCAE2up3buwTRylhD/awbYHmviHMA5/nVHliOVuruJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++/x0W7ekADfWJSr6zLBqZf9TmVR/5WzBIGDff14kTY=;
 b=PT64cYXRqXVVZo/+Wm0xw9yCcpBv8bew1mvkQvkPbz0CYS23LkxETO9VY7tOSUHaK8TTC1e0iRQdY2j/ozWDIrxHA+eb1bWZltP6gumujYsV76DKu4MiNSRIP+9S3RPAKwvfX5dMzrmeYcJyCL6al3nBCaqGTB1oLitzViKPlEeV0g4yuV81hxThJxsuDrfyXJYE/b/z0yOzQi09rIQkEIr/YvpCu1+JAe7SoN+mSNi53eGdOW1zPe1ifkbAlHOIZac6PBGtClYCL4ZiSzp3I6JkkHttZkI/7zAeLyJkC7FgFHL0aOE4Y8z/L6pMwmLW9froS4Qm4pgdZ49zf5H6jw==
Received: from MN2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:208:23e::14)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 01:30:50 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::e6) by MN2PR14CA0009.outlook.office365.com
 (2603:10b6:208:23e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 01:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 01:30:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Jun
 2025 18:30:28 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 10 Jun
 2025 18:30:28 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 10 Jun 2025 18:30:28 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<etanous@nvidia.com>, Donald Shannon <donalds@nvidia.com>
Subject: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform BMC
Date: Tue, 10 Jun 2025 18:30:24 -0700
Message-ID: <20250611013025.2898412-1-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: e8610e73-addc-44db-9c02-08dda887991a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dHgLVNGuGub2wI3T8xBldhk0SGudz/lMeIA4dhpYiH3Ku4C/as8XAyyx8FI0?=
 =?us-ascii?Q?1KaFetc7Za6Iss3RHVXb67tSZdOrwR37kRzuc9CeyYwDLOvqOYBPeRiIZavY?=
 =?us-ascii?Q?0mpF1c/AX3mn6knnPe/qZP+Ks4WmlS77p1SEha0llZqBlcnR444HF06SV6IY?=
 =?us-ascii?Q?O+C8kdRUga87QKHgazwDXiO8QdwhJ/LDjrlmp5ODK3ICKgG4hyD3ZcB4rRZJ?=
 =?us-ascii?Q?ZyvgGh4e/uDBaV6A10WIu/Ex0BpV7Bgpp/ewaqmr6U9CpicLy3r6Ie0+hghV?=
 =?us-ascii?Q?818Zi9Wth0uBT+sUBMxfZrMc8kqSwlDq9MPaINTsz5TNDHvuiAX1UGNM9eP1?=
 =?us-ascii?Q?HMsjwz72SYxpqF9YlyXIeKs9qmz3mFZiLx/4cHLaQBHV/EkCdc4OlOBNwo9d?=
 =?us-ascii?Q?9lp513WfZP0evUA/ChFKE6Pv821hTKjwAeqKurS245jv0XS/MghdXzFC6qKu?=
 =?us-ascii?Q?I9IyGWUHvI7GKhyymkYpF+rSsdbFxujWoiwR4ZCTaf6MombvjNz/ZevPJx5x?=
 =?us-ascii?Q?FOyP/BwDn4gNzZlu08O/aEb/oNCXyBPfilpdQVdnfwaxJReeTqfYtevk19Nm?=
 =?us-ascii?Q?0GTfh34j6IWtd+r2D3AJI9m6009CqPMzB6dPstp07/b0AbmJB5ekfElhtkFU?=
 =?us-ascii?Q?1hwuJsM4TSS2FJgDVl1FUenMD+1JR84mVwmQOQeZFF28235SHC6PoDE8v2D0?=
 =?us-ascii?Q?lF/pL7swsp0G/kIfTM3Nx12hRaSe9x7cJLcB0gEqXS3Kuy6bXEqELlALXCpf?=
 =?us-ascii?Q?OWcpA5LZ8ELbRPW/p4EXKWzHq5zsI8nY8gB98PNFLmBKRhJQAQDBDlqIqj8P?=
 =?us-ascii?Q?XZVcGb2OOUu6+8gHi11lJ82R1ZLRjcywaRYw+U7tcuT7KqWCYHvxqe4JhCVj?=
 =?us-ascii?Q?x0MzCufXjYryluAFmlMmUUb4AwnhQdXoSLQVbzK9fanwmqBrRECBqUxlxUXx?=
 =?us-ascii?Q?jKIaNARo+G/f4SRoJEK3vkSRTEXzCEjdrntrVV0+Wle5c/PbWgXWtH2Dtlxi?=
 =?us-ascii?Q?ylsi1gg5DAj8H0zMgS46Edcn3tVa6bp8RA1npuW1cL8gfrNXQz7ZjzuIU/Gn?=
 =?us-ascii?Q?b8kP+pmvHYOrMtoYGl/RRag61qDMBVIvu667I6J2KP+6AziPDjr0j9xHLdxq?=
 =?us-ascii?Q?mzEAv32TvyNQS3NWdVWbCoeEQTJmGOxRJ8pR5ntAI6dt2DLcEMA+i1rq/P9h?=
 =?us-ascii?Q?SEwqaibzBlcaPq079Ugjly1ticXgb6790a5ydxCC0Aqd/5OQcBbqeLpi/n4O?=
 =?us-ascii?Q?4TFrjAqBYilvY2LviAPP0MbAieFBkZrgRwuhYA+uYytCvmkH6cYqRTmU3zbK?=
 =?us-ascii?Q?NAPlqOAdHLa6tSemZjOptHI9NWT2LvhP4GTM4dO9gSYq+iBIirXpC+EzaQak?=
 =?us-ascii?Q?Jscnryz+/Lmi12MBOdmd3dN0Wxms7qYL2NWaIJUBAGTrL+0SW/YqdyGYwxnj?=
 =?us-ascii?Q?zweszvpXExcNsDK+7vtQrG1rv/qnhbRnrlA6y0O2gb9Y+WTl6RhXAlv6WEJv?=
 =?us-ascii?Q?nIKggqZULp4c541XFQQIa/oBiv/jkQ8ret/o?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 01:30:49.7144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8610e73-addc-44db-9c02-08dda887991a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_183102_933924_DAAFB459 
X-CRM114-Status: UNSURE (   9.07  )
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

The GB200NVL UT3.0b BMC is an Aspeed Ast2600 based BMC
for Nvidia Blackwell GB200NVL platform.
Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>
---
Changes v1 -> v2:
  - Changed phy-mode to rgmii-id [Lunn]
  - Removed redundant max-speed for mac0 [Lunn]
  - Fixed typo from gb200nvl to gb200 in Makefile
Changes v2 -> v3:
  - Fixed whitespace issues [Krzysztof]
  - Fixed schema validation issues from my end ( there are still issues with the aspeed dtsi file that are not related to this new dts) [Herring]
  - Reordered to follow style guide [Krzysztof]
  - Removed redundant status okays
  - Changed vcc to vdd for the power gating on the gpio expanders
Changes v3 -> v4:
  - Added changelog [Krzysztof]
  - Added nvidia,gb200-ut30b board binding [Krzysztof]
  - Removed unused imports
  - Reordered a couple other style guide violations
  - Added back in a couple needed "status okay"s
---

Donald Shannon (1):
  ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform
    BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1154 +++++++++++++++++
 3 files changed, 1156 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts


base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
-- 
2.43.0


