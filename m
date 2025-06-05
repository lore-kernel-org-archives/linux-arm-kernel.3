Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7192AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 04:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aVOdLN/GlQDhYHJITNNqciVLcqkHjM8lLQdL1EbpJ+0=; b=yGw4mt4ldi6NWYdtRxeC7rUfMZ
	Ecvq6NrCscGwpTm4GGaxJsZHEzE4cLK6C+dT4U/xJC86T7M3MEkI4OeYb4l59Ku3eTuj0AIfH/XE4
	pYIE1N6RdPcR51DT9FO+z5Ccfyh72V/uGSndn/ZBx6Fp/oE3P64wteYgDo0WcAGZnmvy8DC8QbLZ7
	hxuXg5qvbrWICBL55Ucz5cnIT/rE1msO2wfzvxUduksPT8r53Linza/0x61+hkXCpaTEiL0uCs+BO
	/7asVbqQZBFueu9sFFjQrcNRmGJ1335XbO9O1AwkqZNkKjDeSo1MjkLY5t7pp1JqtWXT3lDWYpaEA
	qMlnCHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN23i-0000000EhB8-3iDh;
	Thu, 05 Jun 2025 04:18:30 +0000
Received: from mail-bn8nam11on2060f.outbound.protection.outlook.com ([2a01:111:f403:2414::60f] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN21c-0000000Eh1O-0I9L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 04:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO0FUd6W7EMOT/oZonf/Lm5WaC8xJTjXcCPLsTe15BKb/HZ7SJfQXDGN8PRuwdnRjRH8ej7iwEXZH09oH8cnqykwcx27ATxUsi1cj5ekqWVfFakmUqtq5b+u21BZh6hJgMejzOeM8CCnv0vTJLQEof2Nnj8Rn37ur72duyHhiHpb7kq5VZfL/LKVKaRnUYpkrZHvKiNaonEgkZSm/dq/WruDvTo8/ejBbCxY982coyTwSRoHSAEdXPkpv7mYqC64HsA6qO2sYbdHkZ3r1gcVCbbxm/Bt7ru/zyqw8k3dzxvRUVBN2OFktDL9bPaEaoWauoJpa3CCAZc/+GAR3b6K/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVOdLN/GlQDhYHJITNNqciVLcqkHjM8lLQdL1EbpJ+0=;
 b=Sthu1CNziOzvdn92n/jkSr9lYtoojazPUmFP6bmTfX1teGc6QK0q9ncK8Ur85shtaYiHtcGB0prlq6neY2ivANg0Xu4gBE+WeVdPJhZP9uQhXo7PTuEfIBmcnB3E8Oh5XgjQyVnDPUQjmlLuh98hNhQMcvTgJnj7ZLrDC7wV+iXKWYeTN1oHMSbiea+VpDRDZgh9myDieDJJhgp+Qor9JJoVmiULW7C0YZlCwrMfpNqLctjL3dc1hUpSl305terYOXOborvyDyKVMAEHW0QEwrKo2PQpFhHvWYTJnL+Pwah997Bm2MJ19CRDsGbUJk5SworJSun2S1J/bAqcuY9fxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVOdLN/GlQDhYHJITNNqciVLcqkHjM8lLQdL1EbpJ+0=;
 b=tA3FB8QgzsepADoA0nuCoEoZq5lgbOBunQw/vpyYtp2lX/APgzb6+dQrGHKc2+0jQebRe2sl5A3ctjNU5ogeTTy+hIjNl0rkQOpWsR2yMY/KwmF0/QvtbZOz58zbVr0YfDCgOfJepy4mHYAujPfKhZ8/GHNmlyaZblJ/eSKwQsUGhGmdnjj8pTo6n2VJmyN+o+ET/IJSWRih94YcVa8hEuVbOuwpOMQIJ/Jyfy4C4Dy8VXVKwIcnaXwaL4XYAHJg4UxdKBlqJdgVsbUM9M0eXRVJ3g9vGlR8GZBOrIV9C9n6P3U3/DjYAEmXQnRvoytWFaVhBIjf6KHGuskENdZfZw==
Received: from BYAPR05CA0077.namprd05.prod.outlook.com (2603:10b6:a03:e0::18)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 04:16:08 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::9a) by BYAPR05CA0077.outlook.office365.com
 (2603:10b6:a03:e0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Thu,
 5 Jun 2025 04:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 04:16:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 4 Jun 2025
 21:16:02 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 4 Jun 2025 21:16:01 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 4 Jun 2025 21:16:01 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Donald
 Shannon" <donalds@nvidia.com>
Subject: [PATCH v3 0/1] ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform BMC
Date: Wed, 4 Jun 2025 21:15:50 -0700
Message-ID: <20250605041550.1940089-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c80653-e5cc-4224-3cc9-08dda3e7b246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QcUuX8JjB3SdNRfheSLrF2Led5FwmcbXtZw5VLdWqx0J/qEynL9QhXNSc2fC?=
 =?us-ascii?Q?rk18wKja/e5rc36O12nvDV2v971lfEKqFkg6cyuO+v6+Xa/Lf8DB/SddPGUv?=
 =?us-ascii?Q?75Ar6/0GDPBXchKHA+Bldm7/R6F5B6o+DMWtcspgEPaDfDetu7dZUXvhZMc/?=
 =?us-ascii?Q?LW+OmiFPVYpyweOjx7LZjN4uV+n/ou7ftKMSL4+CFF6Hyd+QMrZl/UQdjTq0?=
 =?us-ascii?Q?8u6FmfxxEaO3HWYA3Etzv2hyKeEF2uzwTtUOAlIcA1/nXFTajODV2gqic/l/?=
 =?us-ascii?Q?zHGVRra6v/3++oRDE1ddGP/xvuXhGa/2d1RtGmBZix/hT6bbjF2yjzRxVr1o?=
 =?us-ascii?Q?vXrWLyqE0SeHgEhzau/104TYCYD9DdAkTeouyGWgwa7jmfcTE5rkBFoQDcYY?=
 =?us-ascii?Q?wPMXrAWbL25Nn+zN6rECpbTIF/r19Y6AVBn++T+9lzXcJzOapq1i2bE6dSeI?=
 =?us-ascii?Q?rYFcmlCdYsiI/nBxR72WI3VIRwUyXRTbil15EEx9IPISDnfFLQjPzfLfYMIU?=
 =?us-ascii?Q?EW5TiPxFkiczgfAanJg1YFHd9CPxQrX8Sq7L30n5BJ28p9CSMxcz+81gukzD?=
 =?us-ascii?Q?C1f4FFK353Uq1CP4yns3Ou3yAoSlif1p6iK4AzhWhAP9xgCkUAQQfqt19wig?=
 =?us-ascii?Q?92lLivFwg2zdziItOP163Sz8QyYGSDy8fe0bHqT5RvzTy2pbA/rb8O6wZyZT?=
 =?us-ascii?Q?JB9FPIE1mydgbC1G9d+hvlYcek69sO27cUwBsw4GOBDDxyWWYCsMQfGjKsId?=
 =?us-ascii?Q?xTOVg9L5DmRpP2gIHhPbheg/d93PSZoIhFtXgNiwVl+r/aPt5js50mJfP+rK?=
 =?us-ascii?Q?ZIA4TvJY4FHxK12chLxw2EQTF8i52S22q6RUEh+x/EbhcVZqAOLCUv++CZ6Z?=
 =?us-ascii?Q?MqmTvIUCJvxAIW3HIrI3CZx/2OQJeRFMxdXZ7FemoivejAqwP7JgSKqzW52c?=
 =?us-ascii?Q?8K+7ODeeXHe3MCP5IMRNsx94Z9etxTd74g7PEysCFBAMEP0MK5w6E4u8v+on?=
 =?us-ascii?Q?O55RIvrr++7xrxWeOfKmgBr/93P+Yzuxi1Q4T9OR8wvNh8UU8PraRJ7hMTtQ?=
 =?us-ascii?Q?HXgP5+jrQimEjxKRnrWluku87nivYel0Cz3jRXdeLtbnGMhto5Xra5U9hbiM?=
 =?us-ascii?Q?ZmZdDtHGbdGmqZu8BwR6DebXdVQFjXIy1FNtfrzndzt2fnoOb3qDTnhMmCuI?=
 =?us-ascii?Q?qFGAUm2fZOAOp+LmxeCc/IoKJeC2W94Q4XVTugcUZuGSCeOEqy/WHdpGadgV?=
 =?us-ascii?Q?e+VY34Lzuc/aM4uPiZV3x5mFFHUstxE6FHbP7XCO0AmvNpwD3NfH9buPF/J3?=
 =?us-ascii?Q?yiQqc5wllY8vDEp33h66v/syxBZEGTfcITumJESka5zr+OufmcSQ2RenpbOq?=
 =?us-ascii?Q?aRNI4SIGhUnYK8pFoSY1QlBEhQBY8LcCzHPQw5Hz4t7H44/krJdpAFehwZHx?=
 =?us-ascii?Q?HKNwR5t8zNk1/pD2lK9TPFXMnpeCEIMhrQBYTbP+yCAR7UZMjWXrrIvC+1ak?=
 =?us-ascii?Q?NvGnHf/l8uwBZXdC+ct6FHZbnImuptUNAqor?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:16:07.9922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c80653-e5cc-4224-3cc9-08dda3e7b246
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_211620_119083_56F57B18 
X-CRM114-Status: UNSURE (   8.26  )
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

Fixed whitespace issues
Fixed schema validation issues from my end, but there are still issues with the aspeed dtsi file that are not related to this new dts
Reordered to follow style guide
Removed redundant status okays

Donald Shannon (1):
  ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform
    BMC

 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1125 +++++++++++++++++
 2 files changed, 1126 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts

-- 
2.43.0


