Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56A7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/qDjdhnf1K4jL+eSOR//AyfyY3LunJ50+oBekLeJFw=; b=FpnjqYuh4kOSyVogDptu6p5NQg
	Vubst5PTCP65qTAhEkXnrCBqVvUeDG7pyyzJ+WlcO7k60XXvD4d/iyE6sfXZeFhbXcALwg7jqYUVq
	ElbcRS1c5rYnBKOrxCELOMlgr9SU5VJiF0Kuwmjq0jotcGu8leWIsZp58jS0B8Xyel73bIhpwEif8
	6zg7ue9kbVJxN/8+o/vjbynG7gz2a8iMSS4T/mTXolaaEeWLnd4R7v3Ikv821F+BvwNamA0JlbQyc
	8oWNMlZCKI94CpOBjBIMSftFQ+k0MQRpjNqTqyK5K+TKPFy/vjx3pNv0m+jmyFTdt6OlQ5i4nK7y4
	Io8QiLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDoRO-0000000H4lL-0Iz4;
	Mon, 05 Oct 2026 19:33:38 +0000
Received: from mail-westus2azon11012039.outbound.protection.outlook.com ([52.101.48.39] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDoRL-0000000H4kb-2z9l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 19:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaBH8+bnclXcwR2P04lpsTaURFLlNUcelGMd0dWklP+TgOjfrvukwI5HrZrzfG/iMIFljunKZGiuf7tnJT6wlYeTHUDBrvd+TN7f00K5E4BPARjSWBP2GPZnVPpLZWztfM6ts+r7wqQmQ35NClcO4JGsr322hAjAkfAAjbnLu+sbLTa4jgFZGXEP6ZbYXMZAQvFlZXVqcQgt1AgdKr/jsV6k42/P2sVcMgSRHlv53qWOHk0A1gNiCvF7V1elL+qOF+ybM9gzcZ5kSFAERIZb8Iv7VjYjzyoh0hROfv2xmFbiTg9zTKH2+jNh9PxWNZiEc7EQuF0jbi80S2iL6wQADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/qDjdhnf1K4jL+eSOR//AyfyY3LunJ50+oBekLeJFw=;
 b=Px3qYLH8/KvpQu2p2Qtd0EVgoj4ay6VCDij9etevIdA/j56vvnCCbTdsu9Xvp+pinJ0hc9eyNX0UviUG26mnIiDThmLvkODUyruUyjdJHI5Xv4Jpbf6+K8bVAxce2DMhbYi7y4rHj8VOLjR0+FeKWnGRSmcs5bfzsGG7JrhLZBByw1bumChJhPIkQa0rAiEoPito5A4VKjCTA/XWKi/wM+WFQHcDGN1Y87z3ZBDrr6q38sjua+1KxLI9p/Jx43v7KSRtlek2CuH8I4ASXKW0CgLBR9kqEIbSdjnGmB4lIuMEr8GAdGVXRYlF/TvdKAR1tmXJu0Btfa0aErWBsLsFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/qDjdhnf1K4jL+eSOR//AyfyY3LunJ50+oBekLeJFw=;
 b=jSIBfXL/+EnWXk8UfCQ9bFZ1XwBIf9pGR+IUcqPJnr81FKnC2g8XHU72nDIPxg/WV1b+uWdXKgm6oQsCv/emck/LPhTBZSZ4YrnVhcKH6ZiMlQ7by3dl5RtFKAQHUZIzqITrEYJ7WUlgANdJYvRXAnprwnDpQ/TOa0qDTT9MNQYpGNjLycIikXvaR04P9LssNi0QD9DKWnBKktDwJgJ52ELNEMrCUypk/sJPDHfPKleBTKYWdg469NOqgLMWYRlO5ZbHKXfct79X0H2gb56JJU42J4iVCblH4TmPPX6hkKRISNHWR/J/cbubMmkUDMjQm7A32+Svzz+dcxvqPkOFRg==
Received: from SJ0PR13CA0103.namprd13.prod.outlook.com (2603:10b6:a03:2c5::18)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 19:31:23 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::26) by SJ0PR13CA0103.outlook.office365.com
 (2603:10b6:a03:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 5
 Oct 2026 19:31:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 19:31:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 12:31:01 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 12:31:01 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 12:31:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@nvidia.com>,
	<praan@google.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>
Subject: [PATCH v11 01/11] iommu/arm-smmu-v3: Init the vmid_map ida before the stream table setup
Date: Mon, 5 Oct 2026 12:30:44 -0700
Message-ID: <058aeb235a458c5b48d918d947608c76dde0d845.1791226953.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791226953.git.nicolinc@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e790fff-f335-405b-5ae4-08df23173d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: OOyNVhXZivKytB0NyIYKUeMxSQWgDshG8m0AeuRXKYawi8xcR/rht1QFzOVwr5T+IHZYdeI2RU0oom1hfLeQYmZpgQl2raKuv2cXxQWWuvE6nhmJpBcxU35AlTLUqZ20T+kFk66hkw3q0tl6Mp0ZZu6RmghNTOuOmtiLpxqniq51oPEHN5EFXay8hhmHcvxozrVmriciq6+SSEwbX1KIcmr/V1hqbetzYw+v9josvOIXzSCThownUXaZ4y+SBHPgpXiQ7cfib57jGSLf2tXuI3GMHi5+yGSJD/dYZkIJv1gKQA0r8hneatzfoK5U/kAvAbSe71OV3z5r8/RxpTLrmRV4COkwuXIwQri0QQNSgMRqRxt8uO52BjY3Imm1uCr4yelqOhjYO6VWo75NteEDBC837Kzt1txJnHlWpMZHlFTRAi3zOdJhqINCdT5R9ydlaFUzpNXDhyRjnQzGoFrE0eerKxhNV5m0k1PRn07w/2nApybXSCRpyKOIsIdoAd/VFK15Bj2SMm8fDnArCRJSj4YgpTsVzObEnW8x9Dd/bWv6+tEFWuP5b1zhR4zn69yc+8UROjaMlSSj/2sWjX7bwhDRsCOYlNujpCz6gYOF5iJfEggxPyOuNx7JARQfSlvUkFONxXKuxk8N0ToQW9SQGfTa9c/6+FKPd7LNspHrp1VlVGvEz561j16NuJIF5Zgrd4DEzqN0MyMkJ3PSXdMecw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FeTZDN2QMLvRlwfyjHJrAtfCoJwbMR4sKOBw1dqKFMcU3zUEp3tmyEtvTkA7ps9nq1tMrLutKvNQGkkUSGyldKz4AsQaKzkGRrTztDd2jhevRR6gGhBac1CgU+o9gCheq+WfOJfy/ByaFafIPHp8RYSHH9SJRCJ/f/riRaqCSL0WpMnOlIDUl9JayIMw4y7ORF1z7pXSH10z9PZmVMmcr3tzZ7kazDhib42TlbQeXrmJDdExcXJFxqCbju4DxOxmGyx3cg28HGKn9UdZDTIBGE62nrIx+kjD/HfU93olTQHUB7n6qxv/tc5AS/yUwT7b7+CB38WVTcqq87R9WIp8pDFsjqwS6ogyPXEhPwaFNlfy6dmsAJAkbrsweBllvveT+lu+QUQMzvxnckhX85dCwCVFb4np3tej44xe89+PK3V1aDbU73TueUKMFLfXZFFh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 19:31:22.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e790fff-f335-405b-5ae4-08df23173d4f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_123335_757056_D9325A4C 
X-CRM114-Status: GOOD (  10.40  )
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

The vmid_map ida is initialized after the stream table setup, along with
the devres action that destroys it.

An upcoming change will reserve the crashed kernel's in-use VMIDs in this
ida, from a kdump kernel's stream table adoption that runs in place of the
regular setup and returns early.

Move the ida_init() and its devres registration to the entry of the whole
function, so that the ida is ready by the time the adoption path runs.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Assisted-by: LLM
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 34e916ea339ff..792627e1c790e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4842,17 +4842,17 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 {
 	int ret;
 
+	ida_init(&smmu->vmid_map);
+	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
+				       &smmu->vmid_map);
+	if (ret)
+		return ret;
+
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
 		ret = arm_smmu_init_strtab_linear(smmu);
-	if (ret)
-		return ret;
-
-	ida_init(&smmu->vmid_map);
-
-	return devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
-					&smmu->vmid_map);
+	return ret;
 }
 
 static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
-- 
2.43.0


