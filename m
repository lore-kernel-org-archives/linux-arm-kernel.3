Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12075CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9EIArNmMyS04CIw5SL3x57oTVsqVHlRauIbz+PreHs=; b=fgqhY17HXNz17QoXmMe97b5tAm
	5DuZA5E8JIKgHCEgbM11Bla32s4UGbeSQlMYqkwbM2MrOpnrlOil37i3zz/czYpgsov0GBIzL0dNa
	vc4rR/2kQ8HgL6IzqcfY6J4c37G8yvAMPM0r7NAJMQuN0sUPyAyJ7OKvkEPEoFi5beQrzfdzio3NG
	kGa3Xb35HQthBD4hRdU2jum5ckKyP4XTaJ4QEr2Zg9VgwTELdByngZ3kzLWgPoRlIvpGPqRtBwQ/c
	O4+54W0rhIoPfpJKQFDsqsgrVjKTC6yT3Ay368SLle+l+EQiphm/MN+FxmfIn2pTI3sl0tSMo9a4S
	hbyomhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTJ-00000005D7z-1b2V;
	Thu, 28 May 2026 06:44:01 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTG-00000005D6o-0v3Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dflEqtFXBSzQYO2WRwAmC6i6mq5lmrhEaYUG09jcMe36lu/s5E91QSs22zK3Qdu1cMZBcL6rf7XPgoCElys4o93DyKIsRCvlFQ9o+QF3uw8EhiNH11Pioza/O8uKBNEOkJ+Niv1Lu0I9pIz16HEwYiWVOLyIstlZ+H4e7zLZ846lOSb6576/5Du9BJedzsY3DYsXZJrvpxXNVDv8B9YfkxJTH67qoMnkzoMEGOCLW1mNb/rHL+frQ15xRlJlNiSNLT+9ss9GbxJoNC8Stfrdm8WOdAgcNbcYu1/2udbRDKTiDuuYbc6yfWXh8dqtUZn4B/Ex09vpZGen2mAhP6LYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9EIArNmMyS04CIw5SL3x57oTVsqVHlRauIbz+PreHs=;
 b=Cyz4478ZIf8qqENWoKNW1Ipv8IGYmU7G29wS51EIfOwhZIL37PzDL4O9NA0xgDHPZDvC+SySz30+NO7+e5R5AF5J5hse5RtxwALTl9kOz+WtK3kCg5pG3f/Y9W6H6miqHvK9fUNbA16F5Jj/RATGs3jiTqn8fpsCAU8oTDDnMP8t/LmqzMjSs2gJUSOdG+UlQjg4t19Wa4IoP1tP7J+qHoB26oeoTqU7ENHRSYHAw7/TqzuZP1Zi5i82yyMNjKkuG+s7+A37zGzPZctfPRg7fxgDz12P9fhY/d7pSsmuFPU2Lgszc3fwZxmd2H/09quc/TFi289nGD1UnRvk9StR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9EIArNmMyS04CIw5SL3x57oTVsqVHlRauIbz+PreHs=;
 b=cuqHaYCkyZNO86BVb6oIDuhsONsaSTHHrPvkRtXgoCfm6UvP5CT9cu4PeXKylUOdJWA4oouDHIzoHBP77pTmhkjmlF7l8ZVb1SGmRCEtZt37imNXSRNLrbo8C4NyVUFXCcnkuowg2Ptl3CkJTEURXiCL9gORuBKWwhnnHirraPA=
Received: from CH2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:610:60::15)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 06:43:49 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::8) by CH2PR14CA0005.outlook.office365.com
 (2603:10b6:610:60::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 06:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 06:43:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 01:43:48 -0500
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 01:43:46 -0500
From: Harsh Jain <h.jain@amd.com>
To: <srini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>, <sarat.chand.savitala@amd.com>,
	<harish.ediga@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 0/3]nvmem: zynqmp_nvmem: Cleanup and bug fixes
Date: Thu, 28 May 2026 12:13:20 +0530
Message-ID: <20260528064323.596195-1-h.jain@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e6a57c-38b9-4af4-9fca-08debc847976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Nkw7OogXdVfLKaxfbD24ghiD2k6QKY6LAWiiFmL4yu5f4caEt6jo2IT53bCOmjMYVraPYeodQ0PnDeKh7u+vbiOlEvqhH90cAyRa/R20awYC/nWfFYBLbxJY+3l13YYjO0ehAdhmZP2M1jPi9mhdi161SolrYw+MHRNtjQFd1m0WyBhsUfkmLoEktGataIuIQPPemfbDah/1+0FVZn5uWn/k7q1SQws2FDmX+A0GYwm1XrV4ZOxtS+XGM8pgT5oIlxUbEI0hRYXklQb5kzETVpElcy6gl4pFhF9IMMczN4KX/3/JSY7GT3NXIIRCjknBig6MMwnMaitXzItijEv+uPgMW1frdMt+VV5GxJsvOaM2bvnd6EozKDT1t6QA2v9uk38N0tvicdueXl5W9f8NGm2TaRS50mkJ+lSwi4ILiHrx1hwCH8/Zd3JQNfwsb5d5j4+I+PrbVjtOYLw+PrJI2o0FKpovEr7Ekw586xVBv7gcm8CGnZoq7sOFHfQxjSWTpZyW/EUabsaYw9XIygHiiY6/vtPL5aNgXLpZerMeromLck6e0bTM0UWU7N8JwZH7PT4eJ8U72qh6fkoTi4CecJBx45bXpCc9NwDPpNOLqthzZKFpme033hH4ZhSo9urSz0w8M0EErhe8y+nzGBPm/Oi2xPZqEysWqUomMeyU8LMC2prn7ROQseEzAatxqT+DORsGWa36Th3ws+/qI4mhUGqCQP1Rv71qLISbi3OUmwQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9W0d8ekBy4x6PWtjln7CxwDHcKqC0RF+8ibCZTqVjG30BgS4f9dJdaFlGqsOduCUfk5miMZmC0TvIIaQGzRqV3tvQTEp/8dUmmogUF2VPa5uWKYKcuLwWbwGCmPjMpaAMjU/DMFBY2tTEigSs9ewPrgXOT9LRIy9tldp/HcRdXYKGJoimUp6eRSVe3PD4FTAOaxffZ//p/YM8l+7/koyBSoP4RL0zIG8dZLyUJZSz92FfKqox3CgHBkbppoKXqSbH8wmR9FvnkZcPSB9DZXbSZIHvFRNqn5bDrCcC1pD8PcVeOa4eN8I/HRAkIzlCRDgIMWFB/8R7r0Dk3WYC5jKcRaZoHILNbR00Dxg4LyZn90+Vv8kMIZcy7SPKRfnXwMz6rEVVQj1hOBEKasm6l2S+g8YwUiU8jSTuD/Xf+pFtPFHEXAXalBStyTqWz3pZ6D6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:43:49.1433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e6a57c-38b9-4af4-9fca-08debc847976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234358_417094_777985CA 
X-CRM114-Status: UNSURE (   7.49  )
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

It include bug fixes for zynqmp_nvmem driver.

Harish Ediga (3):
  nvmem: zynqmp_nvmem: Correct error message for PUF user fuse
  nvmem: zynqmp_nvmem: Use streaming DMA with single kmalloc block
  nvmem: zynqmp_nvmem: Drop add_legacy_fixed_of_cells flag

 drivers/nvmem/zynqmp_nvmem.c | 37 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

-- 
2.34.1


