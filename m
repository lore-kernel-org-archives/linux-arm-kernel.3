Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AD1CDE012
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLA3W7tE4uBFVce0AstWLc/IRuTXMZyZgTsVn7lKu8M=; b=GZn/qC1zapC5qXFt2qJZb6RcAn
	zievwxyzjrEzYrvvkOeEK11DilhwYa7tM5X43m+4EnORlKqfP2kV76pe0R1JaRJi50m+JgRmQ+mPY
	b09TreUJB4647FDM5GLhoiLnVB359vlN5eTc+NaylFmbn5nzWNKH2GuSSinaEBeAxswrcOzZmY62z
	lycVpJZSuKGena8EyfTvcc2clfESN+f1LQJhD0QqpSld5SWDYwv0LLi2KXo4C5fYigh1Nm44mltvE
	zujI+1g3YV/piQKQQyh9E3TafSPqVHJj1vTvR7MQS1biC3Z9TMflwVf2DSiglqk6rdjb6mRYXAENI
	0JNK6weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2q5-0000000Ayk2-27mN;
	Fri, 26 Jun 2026 09:27:09 +0000
Received: from mail-westcentralusazon11013055.outbound.protection.outlook.com ([40.93.201.55] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2q2-0000000AyjV-0LVm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1DrOHsM9yx+SO8XUeAe6g+tsw8lcGjQss4fizFg11yXtmw9XV83pxuDVKugxEXA34GG/MjOH17Kb0AViVizaXHzPiTLJlQL6/GOmJFN9Px3XYk2+zXfrAv8BhVoQ6HaMB+q542NuBflBoHP1H1MovrYRygMuR9Y6uthuZG35qzcLK6k3BIPIQyKnf4k6KTPATqn3wGAvn0K4wNEYCmGld2GMM+8yr9FyWbnjbvflhPo9awJVNqKYeMqmZTm6b53R0njx5mPkN27tbwMWSvmE2d5wsPLBMhI/eqa4OH1UaGqiWBxn67Y7VebsPH9/dnjHE6/+b2jgCvu2UtUnZ626g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLA3W7tE4uBFVce0AstWLc/IRuTXMZyZgTsVn7lKu8M=;
 b=Fadh4hpDRBOba+GEoW10vaM0Fb5etPHAw2bEbx5rizvY+hHU8ffWeWNtrLgsJ0kzIPutKpFxylHOo7bde6qZWpgX4TIKbzkeEeZ86H/X+piPdEgqvilSpKnIhn0rdhvNakzOxatze541mXPoKJrrixmkUxABBZxjPrtxAJHJcPQuaWeh8/114tCCrsczPRMrDCVXHylIzw04YC6WpmHqxm5nqwwoFiV2XxGTKG3sqVSQqnBQ49kHO7cHGqkoEbHh+SJB1ui5ZVNkd7Xkws2OHN00tWPQjRkiuRY7AQS9qrbkKxg6fQFbwEzGcuPkmBkzKjF1MrZaKAunoeHd2ivLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLA3W7tE4uBFVce0AstWLc/IRuTXMZyZgTsVn7lKu8M=;
 b=NbqX4FtDP2cAV+X+M0CUluWiGKtJ8xlHe/vpBNXlNfjMAcdaSUpJqlrh15pJJlCOepPqQaQK4H85VqfoQfJLpQ93hTuNl3femNaTDFew/07ZEX/dcrwTcWEDdLfTO/eZlggUGp/lAKWRsT9pTolYnJcqbIhDIKLLNf9WmTTbS5c=
Received: from CY8P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::12)
 by CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 09:27:00 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:46:cafe::62) by CY8P220CA0002.outlook.office365.com
 (2603:10b6:930:46::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 09:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:27:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 04:26:59 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 04:26:58 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 26 Jun 2026 04:26:56 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<dev@folker-schwesinger.de>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] dmaengine: xilinx_dma: Fixes and optimizations for AXIDMA and MCDMA channel management
Date: Fri, 26 Jun 2026 14:56:53 +0530
Message-ID: <20260626092656.1563871-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|CYYPR12MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b23647-3bc8-493d-d1d6-08ded36513ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|13003099007|18002099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: R8Db/CxSnzimdcItXdx98ZpwA2ABvsGe0Vca8zmD1Zz4FGqDjMl/Opv9W767meCt7jyn3yyYo1NO9PjkgJPARedYD85vh9CZSR+tB5rkq4Yr3f3Um/n/lGKFVRZblC2QDCPtRjioaUkLAMflIFfAnBL+/wB/jrDLBLoB4T2luxCP64SngRYeOCJxbv19O618Qv3jp9cY7FfiLg1u6d7944c9QxWUozkSTcd9+48t6NVKNRrZru5uteHaJ4uz07dOCfOa55WMyzUuB3yjnrFc1mJQY4nq70jbjofhKJVxm1u1Rfd4O8+WOSCih8mWUwPUEVKpwtkn8QHFiRxdeNvwBtz6KMpiv2E5CPVmD9cuvc5JyWS0ZYQgc4dlgzxhUyhkEZ4YpHTmsUXW8Ip6pnWyZY5qCktapRvkzGYDh7nc1poP9nZ9sa3NKto/rJK0FtLHAtVG+Q82zpyKj1qt6G+u5h0eY+dBaWc7tx1RtCIa3b4qxA5j3JKUbWEf+gbTH3y8fhktitIzQV7sK9gzkjfi3D+zjX/sQPE/ADQpryqNzt/rS2b/YuoAddFrCz4oXGeneA2de6G9bomuAGFCsqVAWQ3pR77J3tudN0vnJwVWEYJ9/OKC0rwkGsIiHU/saNnB5mjfCYoML++siq72yb7Z2wMOR7gBtHs0DdVOdDoxaNRsOpdE2i3pynZIXH4ms2KV5c7oKaLoTKxgaGiSiBMtEA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yhPCaGuY9Sx8MzUKwEUTOFeoPwtIWOi6pBXTxaHR1SUZIP321zxObrPeb7U1p1Y4VRCBDc3jiGP97jETMYTFrErtyG6sQ0wBkd4xmRHtg4OJUUk/VWixxyN4ZRIa6VCiK3KTUn6OzIQb6MtNkU09dVu4xG0ueykfU5LsB+9yXSGFYM3UpNKtED74TBpskm758YBeg2rNk/FilolASYLt+iy+4/Y2PSVFG9i2/OxrGg3QGAZbecYR0BYEx65YGijsVtDpHrBRxhbEfqlugtPVB2g6RewzWf2pp6cPxDZe5TuWVsdJW70nlz31yNKDr0A5FOEw5GlsDbnJqdBvQSTgI8lnU6JA9g3nNSNE6RWRIBgal4rdfkjbxSpMjaBLlTzjVFwHsYeUYyLrxYn/uCZF8pEOlSkFNdzvcZ8EIGt6iiMf6iGuUzh0fFE6Zid4FVI+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:27:00.8493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b23647-3bc8-493d-d1d6-08ded36513ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022706_154012_DF77C732 
X-CRM114-Status: UNSURE (   8.62  )
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

This patch series addresses issues and optimizations in the Xilinx
AXI DMA and MCDMA drivers:
1. Fix channel idle state management in the interrupt handlers.
2. Enable transfer chaining by removing unnecessary idle restrictions.
3. Optimize control register writes and channel start logic.

Note: The patches in this series were part of following IRQ coalescing
series which is under discussion:
https://lore.kernel.org/all/20250710101229.804183-1-suraj.gupta2@amd.com/

Changes in V3:
- Patch 2: Restrict the idle-check removal to scatter-gather mode. Direct
  (non-SG) mode has no descriptor queue, so writing the BTT register while
  a transfer is in flight would corrupt the active transfer; keep those
  transfers serialized by retaining the idle check on the non-SG path.
  MCDMA always operates in scatter-gather mode and is unaffected. Update
  the commit description accordingly.

Changes in V2:
- Apply similar fixes and optimizations to MCDMA as well.
- Expand the 1/3 commit description with when the described issue occurs.

Suraj Gupta (3):
  dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and
    MCDMA interrupt handlers
  dmaengine: xilinx_dma: Enable transfer chaining for AXIDMA and MCDMA
    by removing idle restriction
  dmaengine: xilinx_dma: Optimize control register write and channel
    start logic for AXIDMA and MCDMA in corresponding start_transfer()

 drivers/dma/xilinx/xilinx_dma.c | 38 +++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 14 deletions(-)

-- 
2.25.1


