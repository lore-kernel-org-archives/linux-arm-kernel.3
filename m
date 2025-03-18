Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA55EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TX84Y6pPK9YOw1FeEOyRUN9cFVqfhBUGf9QAX8ddxMs=; b=PCboWdzy6taTvOLvRAT655MIdw
	uu0rWpj+7f9j0PD6qFeWkYYwSvbx3kifA9BOxl2UIiT2+xRCFPQSupIYQmiy94iQh6C+A3HJ8RByD
	Y7EqoIojObahI1g7NhKcC1u5v/O9WHoW3lCnOckaN9qA9YjLDYmTo5R0YfSprWBGw8yop5KenE/4k
	ILJ+yywbDvg555y0aCKGixho3TcLeVJBYGEuT+UY3xP/go0F7rcKKSBzFOcnycKpKq25VSKggbvlM
	OxxutondEcpbOZ2//D+kqpc+mOek+IMvX9FNDKlkX5Uarq1PwenIP6Ah6CCz55pq2ANl4LInTsghw
	ZircdJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tub56-00000006jR3-00Cn;
	Tue, 18 Mar 2025 17:50:24 +0000
Received: from mail-dm6nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2415::62f] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tub2j-00000006j2l-23K4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:47:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbU3oGqyaKCCIy4hyhSFLVijSH5lu+U0YVfU4Q40iB7soSQNBCJhwfqwDzPRQOjwz4iNBsEZEzhWZ5fNGjRb3ayrOxjWl/od95OsMRtPPi6DZlFM9UhpB9gz+qEuFIRdIC9g4ay7PakBGhkmZViHUSk6NjC5APKFU3xj1jdEQSLSYBlySCJyANNBdnL26oLT/vF557ic3eCDWedGnd7z9JaaIYgBzaWX+vJ9jl7NtJH4zYH/rMCuHfsDr5XKwlFcgPAalsqbEQrxj9VfcSRbfT1vauv4W2EVwBXLp5h8FdT8bofZO89DBqas9DOQNIRweOAJzg1gwfVb5F6iOm13FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX84Y6pPK9YOw1FeEOyRUN9cFVqfhBUGf9QAX8ddxMs=;
 b=CzCfAdX+vqpZvOfv55/iU8I5JHa3cZiqf8ik+7Hi7OIkDiC6ImZInZT1jorG9HjivxokdRflkwh+nQOzDu/Ff5a80HnVSpTWjtx9U/NEq35uNWrNp/q1c/5sL2GRkJ7MMMboAwwSQjkChlFIrA0SyXuy8t2X2lYsoecM+Cvee8Qhnp3hPlM7v38v1lcXoDKAv5Zaqo02M+yaHKTuSFTLZ5EtOLU4GI1I4d7r83L+R36hZnzEJnb1ljG+/CyTXdnmQnX7Uq1dsZE46aevj9H+1aTZj19figESSqRjR1tEHetPW31fWmpTlY5JLIRPOBLnyZNjBXl2PYswnd0jXHvVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX84Y6pPK9YOw1FeEOyRUN9cFVqfhBUGf9QAX8ddxMs=;
 b=W1NzH48crAhb/SpK/THEwrUvF8tPWDO6mr++E1Kb5wuUCSFMDHkScMCCYNbfLwPJdkkqDh1aPZdYWxYTt8XEaZ38S+5+MM5ITWCpttvKJgZe1gXEoV1lIPPc6CK1ieDFFKyahzQ6LLrg5oZ/MkG0KyD+Qsb+GhI4XoT7vgtdkjg=
Received: from BN0PR10CA0001.namprd10.prod.outlook.com (2603:10b6:408:143::31)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 17:47:52 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::a8) by BN0PR10CA0001.outlook.office365.com
 (2603:10b6:408:143::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Tue,
 18 Mar 2025 17:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 18 Mar 2025 17:47:51 +0000
Received: from BMCDEV-TH5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Mar
 2025 12:47:49 -0500
From: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
To: <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>
CC: <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <jothayot@amd.com>, "Rajaganesh
 Rathinasabapathi" <Rajaganesh.Rathinasabapathi@amd.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC compatible
Date: Tue, 18 Mar 2025 12:47:29 -0500
Message-ID: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: e9067c53-8719-410e-4de0-08dd66450156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fol6UWQYmiRAACopbzDVWFb20ElCV05C0TkT+dw9KMZhfXYQAmhSJY8Jdmww?=
 =?us-ascii?Q?w2hcBKoMkvfpCjS2CYSrXirE7HuqwgfQK14vFXAXQlqGRD0c0dv5z1g+3iTS?=
 =?us-ascii?Q?3P+VOW9pj3xEF0OeHxKbto3z30BPz7y1JjDwst8Dv9JhRhCHJ+s5zBnUTxA+?=
 =?us-ascii?Q?5drA6i2DZU/4xl4zXU3b/7VDlDtBbxBH72dgpoeREQGOx0dxP52lGPThRYK0?=
 =?us-ascii?Q?0D+MLS0RXj2DdqQaCsDyLL3Iqb4F/pgdz9YSzAQ4LeavfAUYlpNDbngjutCH?=
 =?us-ascii?Q?R/k03GbQinY2ZlOPxknDEbgswC3E44cF3CnGQhPegfOtqnPgOZdJHA3ZzK4i?=
 =?us-ascii?Q?EO/qKykCyEphq0hUmn0VazZj4vuonVBKAopgDFR26HAHv68LOXkvJVJHT/6t?=
 =?us-ascii?Q?BTybFJEiQUoUuRIelnmdJ+be1p8Vv6zvIx1BqgRLg46xhg8RDEg8PXvWRiHH?=
 =?us-ascii?Q?15YNyakvaxEJuBYIAqj0/YkiZ9jqwL/Q9cElA5sFV5R/AlNpJy/fY3v8Z2z2?=
 =?us-ascii?Q?VQdOhl1TDK7H6d4GjmUHjc0JkTWtuU/Zp1J1y/IJuMOFNgSMrw2W3pc6EiWJ?=
 =?us-ascii?Q?gXhxHFaYihUwhN/87zgO0/6Pvje1LjnEmI9ihjGCKbj4/IU4xXu4LZ2UfCjV?=
 =?us-ascii?Q?23l1sIjvGjNs7BIQVTkLqe+3R5f+l3vjfghux0ZW5NI6+anhrQiUmwVI1IYi?=
 =?us-ascii?Q?0tJhg12pj39oAAmW3xn3+OocVcz43cVoohVBDVZlvzDaUq+Cijf40R+vQnhX?=
 =?us-ascii?Q?m03nxigf2cXjs10M1aonJakHos+oQvY8gvMKoogrICNtsudGsDNuekWu8p3J?=
 =?us-ascii?Q?bkyN7tsCm2Z49WMkgG908QIc1sdWRg0AZlMtO0z2VFWAa/e9+NNBYDz/8zUN?=
 =?us-ascii?Q?DSaUG9SZESRJrjkYFoQ1BkGDaR8ut5rO9gCU/fPP4lJLt1L/3kk6o+yBf2vB?=
 =?us-ascii?Q?2F7RJD6gXg9G50CnXorr6hNQfdQqY9oI2hl5XkG3XBmGB8AvDwoslFN5+ljv?=
 =?us-ascii?Q?VgIp7Ij2J89isBaAsaoi3nTJ57aGOSLp9yCfizvaBlapjCXKJecsn0Vds0x0?=
 =?us-ascii?Q?V3g67Zj1s1Ytn+Uq8cjNu/7BlP9eu8VGqQPHWsLp2O2HsKX49GTh47oExc9b?=
 =?us-ascii?Q?9DOwRSy3c7TubVnlW7jRmLsarElKjoFcbzMAkbTUjc8TIksW0i5hSk7Ibe8N?=
 =?us-ascii?Q?KWVcN6dyOXDaXTSdraTKQOGEfbmh0952D7jSiiEtq7qLcDEApi1G6wFGcISp?=
 =?us-ascii?Q?6KdEZfjf1D/fPf2ZbfTESKW/QjrwJmBVH8JZNwwm22anpqOJiHoCRMIaZnGa?=
 =?us-ascii?Q?DYWEQnrltC1dG/i15f75EHu9qf1MMjuFf21/iVIV04gg+DQRha1PVOt5o9fW?=
 =?us-ascii?Q?rizrAtcoaDRgfqwOKr22xGgtrp+BG8iGnDlVA+J8j7XpavZFGorHUU9VqX65?=
 =?us-ascii?Q?RcFtpDVslHI7BJdG+OcULwTOc1pSuRa5ZCfJ1i1xT1rSvrXZ3gBzvUorySkq?=
 =?us-ascii?Q?qZQH6yU6UrTpeUE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 17:47:51.7219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9067c53-8719-410e-4de0-08dd66450156
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_104757_572894_2C5BD40C 
X-CRM114-Status: UNSURE (   8.67  )
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

Document new AMD Onyx BMC board compatibles

Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..98f92c16e342 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
       - description: AST2600 based boards
         items:
           - enum:
+              - amd,onyx-bmc
               - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
-- 
2.34.1


