Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D2106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58ncy9SC17mJ7g9iYB3J3T1HpkMLHC4s44xbCKV0vn8=; b=rDeP501fuZisJiAAP+jFKGRPRq
	WZ9FApb5/lbpsqCruGg9mcMHbYLAM7Z0ZHv5DHqSeg5c1ji3ADY8DAvO4qpMpkIsRo97Cnrm1dq8V
	x5PP7/I7q9Tf3t6lHhrNH+vUnkbEg81l3wxh4feiwb5ooO8qZ/Hx6lUWgInaxIrtpRhxkrrf/+Cg9
	NJNhkGoJ+9tmx6fO64+72uRqFBBQe09RLsm2Olvq5ddsTlCgAOaZwlMTrYOJwY8Yc9U6NMY/yNrDF
	e0osYdh4620OIQK9VZoZskwEcgWeZZolIx1O2pMmaJWNcUQmpzTRzhWkGTOAPLfswHBKIJXVnc+tg
	1uPOLyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xEO-0000000H6T8-1sZP;
	Fri, 13 Mar 2026 07:46:48 +0000
Received: from mail-centralusazon11011054.outbound.protection.outlook.com ([52.101.62.54] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xEM-0000000H6SD-0Gkq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:46:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqA6wC2sD7eATjbGpxAHvTproRRXQyPepguaBNmlmI0XMEbQ+k1wT6Y+B/ef4svvJcoqPtWDziikoMKkWIVOdEOhAu3jFHggP2s2P3lc0KR/ctj+fqGf6xg4jwU822BO0sKOv4u9ylCbPdn3wrr0m8s/o+uy4MezpLEJ+lylo42KO/lAUgXCniwiffIGiGasfuQ+VgheoiXcTngGCZWIu2WpRhiW9pKS5dftbSUu7lPgrExdpahKT6HrfidGVtVW8mkuOLenixozjjWa4kGPCYjTTHdiCeu4NvCPFDIhe41pa1zLLdT+5rrTTt9fszha4NQfnXmwyz3mCN/kVFML9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58ncy9SC17mJ7g9iYB3J3T1HpkMLHC4s44xbCKV0vn8=;
 b=prO8QP8mfAd7rfQaWAq0yxoI08w87zIn/7oyCEm5vsjkCM1JWb8bp63VBs5662c2EWRp0v4NignOpt0hygIe5n3FZvBqeVylUgpasbpNpMIMgzOkXsfdeL6o+U+hJnDeIPWcmbddfzgMl9PCnk5XtNAN5s4JHCP8E8NX1ODKUXBi/fUNrbUOGs+YJ2cRFJ4+3vy6cOdXiUi/UUMNdKlL0WQBS1bY9Uiy8u+pRlMd99QgMJ6M+hXVqQn7GzA1Ep8p1CVaHFZQxGM8KCF99J4qPI5/GuXuN3i6kdiH/Nn91ljyODHCeIgojiG8Oly0aS6KvSVVc0Z5YhFwGwjDOFC/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58ncy9SC17mJ7g9iYB3J3T1HpkMLHC4s44xbCKV0vn8=;
 b=S2eFK8j4fGcubE3RayDDFrPL5cgvSaY0oiXmdEYmngNvIOl1FvRoammTCmm3GjzbrWcwmpaWmut7pVQ/rTMh1+irCWHCNow+z7dRlvXVttBja9YKVXBMSMwBWyOVGxRnQtabWVDElgyWyIDFChEchO7z6em3m/moGlFjjAFsqgo=
Received: from DM5PR07CA0106.namprd07.prod.outlook.com (2603:10b6:4:ae::35) by
 CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.15; Fri, 13 Mar 2026 07:46:39 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::bd) by DM5PR07CA0106.outlook.office365.com
 (2603:10b6:4:ae::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 07:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 07:46:38 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:46:36 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:46:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:46:36 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7kWvX160910;
	Fri, 13 Mar 2026 02:46:33 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, Wadim Egorov <w.egorov@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-phycore-som: Add 128MiB of global CMA
Date: Fri, 13 Mar 2026 13:16:25 +0530
Message-ID: <177338196936.240421.14150175440432465653.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260213053806.219495-1-w.egorov@phytec.de>
References: <20260213053806.219495-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: b1495a00-22a8-45ae-f476-08de80d4a8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: vTyFZR9EgaRkCKKNIEnzCQMAmWOJPP7kcl4x2ojaZYGw/Yyi/KfI+68RJybKydpF4YI4J8uWRt6Wdovhp+QA3p261IZbqm6P3PxQgWgJAof+AqJiwobULiz3zgXnuWMqdgob3gcYRTsgqXmQQqqcqqr6qszSzp4oSYw4D2H48n7qIbkfeD95joI8OWtonWH4Rj/T3NA5m0TeScgOCo9FEciHz1rAMJaF+D4ScIA2yIcrLW7PIM6uqKuhfw2swQMHLYATkq0GYWuyyNaksqgF7QADvPHGzdZ9WqGaEK2ofeGZIxRXoK9QM2PfMV/VNSGErIGbGwsgw3JB2hIFBUx0iF+zphdTXPKdLiPvw0iyiu9/Yfhv1Yk3Ba3cbVvbN6ERPvWycRrHyW8nQ6WBGB/kPhMDY0iW03hadPgnW2EnArQqaGLmj+rqRxO3et9I+T6WfwrMfDGjEIQCg3oG+vBTzMd8Zk5hwbQ5ewaqqZ5Ie5+CBE/rt8JPI14cdrluwdqu7Hmx9TiyfX51Np5ayEPsbxL9FVkHdxrR+NZ8h6nnCNR65fQVnnxeDZOOzx/RNxIMlZ0/2RHI+kg+axhxB5S67r5YJkP9e+DbdDalYEu8Np01aTSI2UYNmxgZ/hBY7gaBXs7XMLehCfxglDTGzbwoxkf2zmKZlGrRfns47wQ8jUo242PVxYJfsits/UvKtTI9pJ0sURZHXW+J1caSp5RD8rgkSCLn33P62lZJh0pgjZ0=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +9/aIHDNuYowsTreKeCEiaPKbtDu2Ik4EngPVc500VEPZs6gDFbftnDycRn+j2vLKLtyrKmvGVEjlr3GDcrkV9xi89B3edaPkKp2GvhsX36kkG36soZvLEEUGS9m674jGZKh862kDS44jOzKhI6x2HaUADplBZg332kASqh7PXnSUxzRGPypBOhgwFhEBuEFNQP/oApFkc5dAATIz+Jv0K7GVvRdqqbG+TUa0LGocsIMdkWzmq+3cYCnGsUTAoM1LsLO+m1DNSHjOXCT4V7ZLjg/9sAFDfAOPLpF2xSiglsX+wd5WJTsuJr0bCoCiWAfkdwl6G1YHgShwITr3zv5bHbAsRSAlsY0ROFsJOq3cT57jpTMAEj2qwvvjh83ddMQTwqZuVibW+R3THMm+J4zCrznZkOF0wZFygCllh/SBDPEfyl07D/BX+O68uoDU80Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:46:38.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1495a00-22a8-45ae-f476-08de80d4a8d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004646_167294_03FCAB09 
X-CRM114-Status: GOOD (  13.90  )
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

Hi Wadim Egorov,

On Fri, 13 Feb 2026 06:38:06 +0100, Wadim Egorov wrote:
> Reserve 128MiB of global CMA which is also marked as re-usable
> so that OS can also use the same if peripheral drivers are not using
> the same.
> 
> Based on the use case described in commit c43dd2fe5316 ("arm64: dts: ti:
> k3-am62x-sk-common: Reserve 128MiB of global CMA").
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-phycore-som: Add 128MiB of global CMA
      commit: 2af52683ecd85ae33dcd52eaddef6d592da5492a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


