Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95854FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 21:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsmBk7AVMZKoolSAXqNFoqZ6S03NDdHxUBEru/dAKqI=; b=kSGEgOZLLZ1WCISqD/NrBRBwo2
	iD/2JFjyIgG1gvB5QLFuzJhiEOZrnSI4UGu/RjWUJ4vaeHZNccm58teCyF0DdRrz/rzEyWVtoeCcf
	sh0oVYLLhDpgCBidJ9Nlsszl73JjrOaXgvkmlUn7Afnj3EA1UcghdE/fm5y25+R2WgwTmp0kmi67B
	0WmOpC1+mchzpSxZBE8CVMpvU+g0GBhYXvnockn20ky+EnQNqsZYVVO7SOxAFV0/4YnO5hPIxgRiz
	vTTUrQAKxQsbvIsGRPpYQGovh8cPUvw/mBFpGtfHqP7BOwTwS53BHUcHsdyx0Ry4bkTq2/uBSINpU
	XlQjR7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkbr-0000000EpJB-00CH;
	Sat, 25 Apr 2026 21:32:19 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkbj-0000000EpFL-0oB6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 21:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTiH3To38SzrKpOnLqY797aiHbjUFKSqn074d7SvOp6qtbtMfeamkA/GdyAKA8aPr8rpRiKbRg+zzfaexvEn+5bseO41VYs4v3nQPeVKs1WogHjVf/vcadLME1rpL+uj4ZUAnrS/cb7Lw6CT8cv4P+HkuQmI6gJ+LICcPLUctYYaJ5gHU8BGOHx9vl+d2enHy4hUODXHPSSt/q284ICtxKpeIV6LyCNSxdUbwE3NOE2FYQUVfTv3I1A6/WUVqmt/AtPokEhJ3xG2a/n5RRyjBpsgW2Lc3vNpVUISAMdXRmDi8rDjnzQnn7m3HrsWMHs9LXNQ5lZZk5kakhD20bMDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsmBk7AVMZKoolSAXqNFoqZ6S03NDdHxUBEru/dAKqI=;
 b=s2S+Y6AvKYMwB3NhwSmKiQ+qX/+6/ZhxQQHaiIf8TUnsFgCExhNhgB1qBj+gdC2/6CB2Ep5xBSZYs785pdlVSYOEfV/ZDWKixnTC0f4Q0jrD5DLf8vIRmOHn+zQCopbHdb50no4RnLYmded0oMne52i+Rkd7AtyWffIlCLUb4YrXBtYrL6ebZkcmtr8fVeO2zkcg8xxeojVrQd3WLZQKPk0s1/mlYrR2TFOVby7WBLMbJrnwLR6yDQV+LIR4IK7+U+OF1kOpktsb5MtoSxIlPJ7vL9Gm+9hpWFAELu68Kyj8M5w/kgwg0MkAI5tiAylFHKoni5voxxD6CBrYVUkqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsmBk7AVMZKoolSAXqNFoqZ6S03NDdHxUBEru/dAKqI=;
 b=NT9KMxzrnAS5zjamxKy1Y+NaQwa4fSQ5DR2KAqSm3nYBu7fv+ADh2b6KxaIdvOOlz5lDqbsRvhsjo9CXV15T0BtqN7N7jqD+hJ3qs5SZx0D10+fosFFuD/aA4/izy93AJo1OE9k1Nb4tKOGXEmDEKlzccSZQt1NCsK+0yOwGbl/0uObZJ9xyh1G63WiRjyDD2sy/Ya6SqT66ypwAIQNvyr//C73zwaIq04hwyaNjNXBYQXDrwLlkgZIaj0woQfJUTuGcM+lbFxRhmspc6p9h/CpenxRfa19X6yhG9/vVTZMGmrOPip6NMPXsLyfytlAjEKkmaxGdmAySKDbzntRSkQ==
Received: from MW4PR03CA0177.namprd03.prod.outlook.com (2603:10b6:303:8d::32)
 by CH1PPF9C964DBFE.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Sat, 25 Apr
 2026 21:32:03 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::82) by MW4PR03CA0177.outlook.office365.com
 (2603:10b6:303:8d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.23 via Frontend Transport; Sat,
 25 Apr 2026 21:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Sat, 25 Apr 2026 21:32:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 25 Apr
 2026 14:31:53 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 25 Apr
 2026 14:31:53 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sat, 25 Apr 2026 14:31:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v3 5/5] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP_ADOPT in probe()
Date: Sat, 25 Apr 2026 14:30:50 -0700
Message-ID: <aed9a303844d1635fff48100baf210d9251c2004.1777150307.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777150307.git.nicolinc@nvidia.com>
References: <cover.1777150307.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|CH1PPF9C964DBFE:EE_
X-MS-Office365-Filtering-Correlation-Id: 0beffdb9-9d7b-47fe-60dc-08dea312178f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Srw+Rd8+S+0HMIP21HROsXHsgP+Is31Izk6fDsRPfDAqo6f6MCRzeCBWv2WAbgo0QBOXGsTkU5smo3JPpMJ7pX0IMVK1Ryw/2eeHBD+h36lTGSG//EuZ+r6iYDBDOZnOuFm8QTw60yvoEMRatvOIkZkjHrfH23k6vAqlRuswPHWjGu8sIgt+yW61ln6ZE0CUvLNpnavkzImEckEignqvzQn7CAkTMGGG4L6IZaBXM8bQ0LR6mxIN2BkqMK0sYFNY3Uk9/M6L7JJp9UZupH2iJlUvT88Y96lwQP77owu2L37oflPOJlj1zvphJGHRHip9Ufzoi+t1DMO6yVm7FobHiu6ZhL3ZYKcXZPl3xxQ5dFXkBCFYmDenXqSeL3E5hBlYHlFoM2oQqaPGxbRf1+fTgyVE/DTFv56fxJcBMcsPyw56lLrM839AN7QTgTjfJK0SBsJX+342BhyNWXOF8XNjMmE2eUySW8Y26LlTHlxYESodL6wdO8z8ekTGSxr3XlqlseB00WehiJCS9Jr4qH9v54lR+42A7QLYQ0xhTDN/CiajYbpogt/fdjBRUN54V9okLWYMY/WaxFM8v9Go+c8BS5o5O7oQ3sHn9QaEdYtdwXnJKXGttV1vCq5C1Y67klCBDp2/raejl4Q3/eXG0r1bH2tFxunk4sCiY9H+2f9mWdwEUqjnj0hdaDDoyX7zJCsPf5Gf3Mu9o4fBaT3brF0gJw4huauYMBMDdwFX7NYiYzhcwMG94uvdPNgYr2QB7U3KgNZjkizwAmZjoUtKLM9pDg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QNr2Nd2BOmItgkCl/XEownLG+Iw7uXaZpj5KBUTJ9DbmYltzks+GgR2BoEePqYriXy/E6qLtapIcFHo3Myr7RYB4BqbNVY0tEjlH+9q7tbda6RV1ahKTQnF5sY4zbb6OoRYyFtyc4eUplD7Y0Bnsujq1NkHfeaobDV48ueGsh4oW3g0f+xtz7ckFFBtrUMmGxlhATstBpmi3zrH6c+2M+a7Pt876LYyhSHu6WiDtS08yd04LkNxs11/MzeIBI3HLw4iSN+YJwQOoXuXwKdND3GxQP3WSHBKjWicwkWHEI587j6eE7iAhPeqyminZ3eO/qV0x4UzrXPQjre1qRx3kCdIARi2BT1XIAAneL2XyCajSWQ/+R4ST77/aSenOB5MzhC0MMZj8LNQf1t5m2pu4vfYiBUMdTcyGPzffj/oRracPldpA32BQg+hfMIezdm8/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 21:32:03.2382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beffdb9-9d7b-47fe-60dc-08dea312178f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF9C964DBFE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_143211_242578_21C95AAD 
X-CRM114-Status: GOOD (  12.62  )
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

arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
natural to decide whether the kdump kernel must adopt the crashed kernel's
stream table.

Given that memremap is used to adopt the old stream table, set this option
only on a coherent SMMU.

And make sure SMMU isn't in Service Failure Mode.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index f0ab0b640a3bb..35aceb22d5c89 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5288,6 +5288,36 @@ static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
 			  hw_features, fw_features);
 }
 
+static void arm_smmu_device_hw_probe_kdump(struct arm_smmu_device *smmu)
+{
+	u32 gerror, gerrorn, active;
+
+	/*
+	 * If SMMU is already active in kdump case, there could be in-flight DMA
+	 * from devices initiated by the crashed kernel.
+	 */
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_SMMUEN))
+		return;
+
+	/* For now, only support a coherent SMMU that works with MEMREMAP_WB */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY)) {
+		dev_warn(smmu->dev,
+			 "kdump: non-coherent SMMU can't adopt stream table\n");
+		return;
+	}
+
+	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+	active = gerror ^ gerrorn;
+	if (active & GERROR_SFM_ERR) {
+		dev_warn(smmu->dev,
+			 "kdump: SMMU in Service Failure Mode, must reset\n");
+		return;
+	}
+
+	smmu->options |= ARM_SMMU_OPT_KDUMP_ADOPT;
+}
+
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 {
 	u32 reg;
@@ -5502,6 +5532,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);
+
+	if (is_kdump_kernel())
+		arm_smmu_device_hw_probe_kdump(smmu);
+
 	return 0;
 }
 
-- 
2.43.0


