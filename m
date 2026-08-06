Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD62DC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSVqQF2GWaRBIO/enpIoViDq1n1ewAvl33Xc2Eafg24=; b=wczrdYscWYcMrg231LZcEl8B+U
	E1qMUwwvOQORJKbgZKk8K9JX+rlQcrvLzoghEKlnKljA6Yx2zfvYb97ahToGqQPDJDZL4DVCmzPIC
	0X8bIIsi+4zlvfvzNyRl/aBOZmgs0GtC+lKRRrYpDpt+10TDzozuMrWRlpKjzU5n4ZfbRoD7uAM6a
	yVB4BL68RMrT2BfrQuu/5Voon80YnyU/U363dvst5fvAbnNJNLjbm/qswrBhEs40o8QFwYhAvKWqM
	m9kGVGjYnMfdJHO3pusBcBEdEsKzopQFOa8yfB8QWdo2aVYPKThvzvbzBZtWxhvOc8yWZ/SNqpKmv
	0mZKwIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFH-00000005mqe-1scf;
	Thu, 06 Aug 2026 12:30:47 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFE-00000005mo0-381Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF5ibd7EJv64wPQCuclNsnrAoRlkjFGfQN+RGdszetnFA8tY66EFeiBOUptK6nUKWNHrHiMPbszecD0wlPvCWNIsEVtaMAEhaHh2MBPWdvuaHpxiJPAFJSPGk6yyDiCblK+O0B6FvYJ+Xfo4du7Hf49XLGTxkcgDGYR99h+zM1YVqHVcYbbMeJsIp2Gc10+iVc8FnvmMg69YAekUpmFPBE2z+TWAMq0kqtXjmTrcV9PtNw3uYpY7giyB9X5z9wdJ+KT95m8djVoKf6t+yXc04y+TWn+bxwOyJPwtTy7gfCwe27T/0ylok6ss4jjyJ92pT1xCKDJZqUj2QEKMEpNcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSVqQF2GWaRBIO/enpIoViDq1n1ewAvl33Xc2Eafg24=;
 b=Fo9RIGpfalJeMwZG/OimQJtguXPSpNkGVWcdip7NAsxeDfu4v/dQUPqmmqbwkAzO3ChY64Xc82Oz0T301X7LZoAhKPnemMiThZZ4+NUj37t9CTTMkW8/FEZGM0Q2iAecwbKqpdz4g3z0Dlz/abi7N/eXRKJJfbaJ5QFF1nCnmNqcjPmbEl465lnytIZRSiokzK1an3swx5BwSgVGLHt1oUAgYXp+0zhsLq9aKt2faMeDU5Xy1GUnLfBdx11TrZvEPvKaBoVBc2HymaFrXizgdglW/w7qREdb6+YvP/vx/8l3EtT1/r/3ObCPSHKv61i0LnQqVsrg+aOkVGzacXmRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSVqQF2GWaRBIO/enpIoViDq1n1ewAvl33Xc2Eafg24=;
 b=HgDqBOZnEwGf+nxC2TC0DexnRpkCnWnP09uHTK7ryBAH5XBiHW1IiC4aodzLBaO1GNlBjT87JtEpJK0AsV/81eIdug14VKQMDQOYepGh4mjgM4OkFgibIOPszNu0bwVimmniz8pmuTtRC2Vb3PAIyHTiGz4NAGnHGWbDNtr3GFc=
Received: from SA1P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::24)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 12:30:37 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::6e) by SA1P222CA0029.outlook.office365.com
 (2603:10b6:806:22c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:35 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:31 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 4/6] dmaengine: zynqmp_dma: Fix minor whitespace
Date: Thu, 6 Aug 2026 18:00:12 +0530
Message-ID: <20260806123014.2120447-5-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806123014.2120447-1-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|IA1PR12MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 951af6ad-8b34-4e4c-fed3-08def3b68504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|82310400026|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cXldNTJMpLo5n+8qvUF1LOdFJidsoTSg5gKT3iimozoQeK/rf6GTrYyrDuIPD0Z4vieofvLJ6Vu8J+ZB6X94zv2QA+u5pYH6kMR16CBcoqqQj6VZOEtPCYu0DZF96XEijN3Cnlk22qlP6CGsU7PxSf3vEwb5d/lq4LDl8flsQXxqTVC6a3xbe02zISnu6Khd0wGsBOmN7LdWcRpEY33VHlbOMbG8VKHlgqOwvvZaqWrGng07UfF0hJ2Sfo1fcyr8bjiSbF2K6nl3bzaqOxwWZz9FD3jVPcLJiuOSEJW28xdyQhf5tVNMTwqN8ZxeMgCAE9qMHv3diTzu6BSGoUCJbHru064/SFGXx+31gJGlgzOub/R9z+ljhYgUEob5QRjoImYWMvDAILb2s0hp0VZJEB1owBRNJEzCjIs4F5gR8rt6TfydGl9/PataFk4DAceS2Rac/BbhHrI8y+8H5Fda/qgmF+pailC4A6wM3coxS2aU7w7L5chIvgssxKEkUV6SaniUq97dhXYo1L4Pd0KbZmciQKwyGwZdTx7FIJVWE8Wl9YjjgfZNEfhTmheCYtJQNVvAwMneM8pIpZE6wNP5rktf6+1lL0Hw434naK9kiHpE51TuNE+B6tiDFpz6uD2xcZXdlNbJ7RK12zPwhxYCXLNJag9mv5qmk3XXm3iOrAMPyVexznk5R7mNUW5a6Nb14F1hUoPkFO//a7onyQ0Nlw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LKIQbKdszX9xHkthWgz3QsnOAHamvdgtMo82i4bc9Mur9CrA10lP3h4zSaEXiy0IBG543spKkPZUnBUgaV0tA+lBfoO+XVXWbAoaePL1iT/VYxRjiR+5yynGzQZus0ZfiOx5mixTls41p/6REVSvstGqW8NVOXmNccYYvImUYbluSz22T96V/wwsNfLECmbVyadHG4KFYiVseplop8OoOPmExH8SBDxswGcV70CeI7esDXw3P1BvvZoOYH8T8y207ctD0PsfdhNur38MBwlkQ7D+m/sOeNY9AMBVMszrImNkeCKyzdNtyLzUo29ghWwr4C1fWOga9Pl8P1MWaF6MS9XrNCuWWi6KSck//9LtapUyYOgn51Tybvc59NSao5OypD74q0HdiJn9pU0DPRJ/2972u46BFNQkV69dyW3bxiCmW/r+cGxwHJoWgzWHI1CP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:37.3670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951af6ad-8b34-4e4c-fed3-08def3b68504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_053044_822722_E58AFF23 
X-CRM114-Status: UNSURE (   9.89  )
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

Fix minor whitespace formatting in zynqmp_dma_chan_probe().

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index c5b05fd52e9d..2d56ea08ce45 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -947,7 +947,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (match_data)
 		chan->irq_offset = match_data->offset;
 
-	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
+	chan->is_dmacoherent = of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
 	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
@@ -959,6 +959,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	dma_cookie_init(&chan->common);
 	chan->common.device = &zdev->common;
+
 	zynqmp_dma_init(chan);
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.43.7


