Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43374CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xiExsB1sMUTJwWHkl/sF6tsTMIMcgve+sz9ksgo5UE=; b=A+WDwfAHzKp7xTvlLibMeNMUEG
	RiPztibE1Rt0PCMqDvlsQdJZkO0XQvSsVLPouqkQSfx3yEQuM485lQ06g4DTsCDlVc2sBUDlL2vCR
	2hq76x5Wab7jJu3Cm3BsXjc9hWpxftzZFS+BIvxW5REA3eL4dw1u6rn+7qDiitX7ppBKm8p17mUvo
	1pBy0AS2c30wfUCNHbcy9ZfgCtFPtyTue5jzvrN+7XzJZgS7QhSP7iik7jwcSTtGfmcVeK4zcP2up
	yMYm+D8rYVaRomIOdiOAf3m0q4oQCTSCSghHnCtbqs8dsxlcbwuWM3JSuLsLLfR5biQ6xV27oPNL8
	dFvBeaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTO-00000005D9Z-2x09;
	Thu, 28 May 2026 06:44:06 +0000
Received: from mail-southcentralusazon11012059.outbound.protection.outlook.com ([40.93.195.59] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTI-00000005D78-1llv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgP+KvborqKdJT+2bXO9QYnV0dYxcuovKvboJG6dU0s9hLKwzkb+tABcNd5U8hvIE27rWVo4od/NLulpia9a70oV5JCCDvRU0Fe2/C+HQ8jhUtzDUbUzwHl38wahc9EOyZ13lCQzF+IR1xtikTtSauOMig6f9LACt1uHsL3KiST2glwetqG8hIt8hMDmpkJ3hK6K0cRNmKUikvDWOXZ7M8AbzKQ1e1q7cIc5UbvOIHuN1V03DH+fsyxaTD1PWZbdRAgrFgZ5p+iwSUPyHzxTNYMvyJ1kD8iN9sgarBtwJhWEACG72iPtsIz/KFS+HBwLJpWI7NyFuDLn7igS2pX2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xiExsB1sMUTJwWHkl/sF6tsTMIMcgve+sz9ksgo5UE=;
 b=eDFGjksjrzIIvPgVkyhFWLFq1OJS9L3hyermQbSAcKvrnWVNel5aH/aKxMR2A4gv9wobN0uL2ZEsdXO3lHbW7WvOUSo4XKrnxFphXQg6H/1O6h3Y8OZWZZaJhcAzM/xcNgIl7KzfgYgnD6M2MwdAYxbe7KXB8PrBOPD07B4OFnFhcv3WIT6lfrZZnA/mLIBA8EBM2dWAP5ULG0ZAZrG1STjupoqz1tI0YAzzFW5rfOXxFsowWvybN7fe7bTmc1Tl+7w8BIxdMSwWSxmebY+jFiB9gmLOz7vkTscVNIxlFnvNO4TBxgRf2Rdg7XBtUi8zZUi/8lIMDFNOsgQywdnEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xiExsB1sMUTJwWHkl/sF6tsTMIMcgve+sz9ksgo5UE=;
 b=Sj2Da4pLZFTKsRXpqVyyGseIkLdeuHYhlLzB4nKFhY0SQUU9R5ezVoehIJ/zrsI/ahNp+x9XlYVCDrPUEz9t3YAaflMQctn8Jd+iG+ABPwJhp1/FlPBevp1SVZBbjxBSffqBqE4f2UEg1yTkyEeMS2c6WX/WCfa5AMYLysnfAK4=
Received: from CH2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:610:60::14)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 06:43:51 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::82) by CH2PR14CA0004.outlook.office365.com
 (2603:10b6:610:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 06:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 06:43:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 01:43:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 01:43:50 -0500
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 01:43:49 -0500
From: Harsh Jain <h.jain@amd.com>
To: <srini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>, <sarat.chand.savitala@amd.com>,
	<harish.ediga@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 1/3] nvmem: zynqmp_nvmem: Correct error message for PUF user fuse
Date: Thu, 28 May 2026 12:13:21 +0530
Message-ID: <20260528064323.596195-2-h.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528064323.596195-1-h.jain@amd.com>
References: <20260528064323.596195-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ba20a5-314e-434b-b485-08debc847acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: xEL7D0c5WI2hL+wc+hmHfSE1M4del8WFVqPoOnl8C8e7U9Jl6PUdDfxOzmdor9k1qllK4cVxpbkZYLdZptwYbOHmDkciF3SqKP/jloDqyYBAwEWqXL72rdY185Zjn44Enexxfp7kN4mNT6TnpXfb5ZC6TvMINn2123ZFu+uzRTH9rnsepdy/Ds4lafFuLlBAq+Jp5afBEq86YiJ33oJ65MRz2K3C2gjl8TQjbIEf5qeQKJdAvMC1K8fVZMThD7sr/L+/jsy6sksELcJNZbT5UtXRsM1IY+0T2EBe8KaO7wnbdy9X35q3kmpjYh+JcqhXLcWr05SzRTIq8hWnKvo8w1PoTPqJd57A/NxPRMLuUiMvdhF1hzoargTTlNT4qRiTS4oF7BGkUjfF3y2jPFcjrHQs5C2tXDhXQGxBM0bnd48J3rH9iFdjcUS3IUBEPg3Ur1Z7JbfCUBPHqfLJ/4UuKUNQhRp6KKMWf7Viz3fmCsEvbcdA7YFZMQgFSA2beOH+wt5CAcRiieQtMwhal/5C+CR0cp47sxoj7ejRCTUmcQEwkfnNJjogp35vOC0t4390ZAcHppSrGtRGH0Aaa8WtYtO4/UanGe7iqxs7u4+dS9uH4uB290GfK/BFsHpcFqCCqW/1OdmxveGhv+jf1wEadTr/jxwhcxI8/HHvDu2gIyzd0DZN8DF151BD5YwhlGGngYAfPxqVvdguyiqUkO28PGcqVo2+ttnEDpu4ZvLDO5s=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M86J2hcEfZDbRGRVzSlVeMcJGcraq6yb0NZRZtruVvmB4duStzg2FTIXYzF5G2G02+yFr2D489gaBqeOQsUEkZl20mBUgl4a+V9zFzvT9ajIyupuV9xP++f6Ea14mDUoc2zJZjG0E3fE7kkTRpE8s2IKmJNvFVX/n/sU2BtHM/hTJCDWIRdKMU9pEmPLQM4jx/AOPIp9nWse1/wYDzM2JKeGp/+OUeCnJYVlRu87nOt468rorU1OHQQtel/3d+p3T1JmYbZpvYFd91DjHeOxGUN2cTbUuLQT+ra+MLbRtnWvXVW26DO+jP7R2V0GIdJQ2hWSQcNJtgAU3elo9h1WJAkLJG7PWJstAAoMqOJsD9yXh1uipVQj1Hm0yYty1h9x5ma0vMfjmlMs8zU8P1z29cJkCEhkZ7RRb6AGlnalFI1RWjxxDMGN2H5NQyMjSUlE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:43:51.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ba20a5-314e-434b-b485-08debc847acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234400_464348_E0EA2198 
X-CRM114-Status: GOOD (  13.50  )
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

From: Harish Ediga <harish.ediga@amd.com>

P_USER_0_64_UPPER_MASK is defined as GENMASK(31, 16), which masks the
upper 16 bits (2 bytes), so the old "lower 4 bytes" wording was
incorrect -- only the lower 2 bytes (bits 15:0) are programmable.

Fixes: 737c0c8d07b5 ("nvmem: zynqmp_nvmem: Add support to access efuse")
Signed-off-by: Harish Ediga <harish.ediga@amd.com>
Co-developed-by: Harsh Jain <h.jain@amd.com>
Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/nvmem/zynqmp_nvmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index d297ff150dc0..6be00a2be9e4 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -84,7 +84,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 		if ((offset == EFUSE_PUF_START_OFFSET ||
 		     offset == EFUSE_PUF_MID_OFFSET) &&
 		    value & P_USER_0_64_UPPER_MASK) {
-			dev_err(dev, "Only lower 4 bytes are allowed to be programmed in P_USER_0 & P_USER_64\n");
+			dev_err(dev, "Only lower 2 bytes are allowed to be programmed in P_USER_0 & P_USER_64\n");
 			return -EOPNOTSUPP;
 		}
 
-- 
2.34.1


