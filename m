Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F99C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uOMkES822/n/lNA9Vf6A2H8CDkXYu3KePuv7RSOWgg=; b=1RLiaTRrWs3NN1H4WWJikQ8Dyb
	LE1KGjViICR1dbh9hJmqYfPbQZXHt0dkgKstytRyf+OoBuzXV6+V9eQhpIA/n+J/Vz3ei8iNr5Yq+
	pFW5GqJRytpE5VU+Qwf49XalF6pqhV/3lNvOfR8Vr83Z4bUCuYhUABV2/RJizVVOfICJeWbZqy12I
	PGyMxQrWT4O29I/K8N2Qt1ZrAwkDKVqfCuv2a2Go+yaRMEPg45IRT64cR7fMc2jORpMsV22ARB35U
	SIfFMDqXrIMtN+4mGOELYbn8JoskRgy1fMMakAQiuI6ESs3FNbj4sJaWtTv6jfmYizPH3P+2yoYLq
	qPrvHjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WC6-00000007QtQ-2i5f;
	Tue, 15 Sep 2026 16:39:42 +0000
Received: from mail-westcentralusazon11013002.outbound.protection.outlook.com ([40.93.201.2] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WBt-00000007Qkx-2OoY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:39:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTKmAp++m7ZrT/aW83htWV+pkXf1yysWbiRvLcOWCvI011i1tpai2HpzNaiF98mL1B7V72173YVdMvdLOgzHplWwaBzgC7cYYOOmyn0EERsMmQssWu7oUhzxF/C1CQWLlVFiLeqaTamJgkBinVGsGTwrurTs2/aWNZ8H3prBdG8uE918iox72E0h0iKwyULec0C71dBXLvWjAi77z6MRWDVASOPPGnQRoLJXGILMMkNvwA8q0JbxX2drilo2CZUWLPPZkBmgjGtFxRrKZAc3PysYapU16dW+GQe33aERGwdSDCePK21GA9nHeFzlcKSp97MFuD4m/ElCzP0efniuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uOMkES822/n/lNA9Vf6A2H8CDkXYu3KePuv7RSOWgg=;
 b=yFTRJ1gNtd44PgFWQ+TuKpxp0pVM5QhAoYTy6DXyR3YSVTLcWNtESNweGzLSSiFHzc7LSUwmC9f5y8sPpJfVI/Sicm04CoJVtkT8wqXwJ5ag+M9tcj/7+7yvtZWYAsEb9a5DWSrCXrmlyMMxLPbXPIFR8DR+28sgljTx/I6nkDyw7mZGd9cfYGam0CzrAcUXBJmbWmMvoPueWCDaKtA9OxnoLklai8WTy4DKv4Tpk9pw299hsJmGpbsJwM0TUD9wPMID/kqIa9+NvtBUsMk0m89xIHDnCZLfKi3h0otfdbbIZUzbaNYR8Frq4SoK/DaiWJK/wbfPKcj0qfRujFUIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uOMkES822/n/lNA9Vf6A2H8CDkXYu3KePuv7RSOWgg=;
 b=K6sDHzRVwzSJZYAecgI970y4v9q0m4DpVrTqwq9OVlQy8QW6bxBWO8qAv++f04JmRpqwfqaPAiE8OrQin95HtQCt4VDwaLUMT10EPx+C+sTUiHpL382PxmDm9k4f2ip5P4CK0ecZKQzTaW07ACyiPNDgFI/efUu9UK4pY6nNE2XB3Iub4Iw7B1S7I2gYRC3rrATq1M5KLzmtUoFziNV3j7z1wgLZXbyUVSMuU/NqwR4BjVEY1WK6XDAtQlp6vOBvAnmbFkvaUpeHd6+UIOQy1Sdm9WlCfSPct4UiwNl+w99MLJzjdvQb4csMNkX37zR8hUHuLKVuYOEH04E/4ylfEA==
Received: from CH2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:59::22)
 by DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Tue, 15 Sep
 2026 16:39:17 +0000
Received: from BN1PEPF00018072.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::3a) by CH2PR03CA0012.outlook.office365.com
 (2603:10b6:610:59::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 16:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00018072.mail.protection.outlook.com (10.167.245.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 16:39:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 09:38:47 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:38:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 09:38:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>, "Jonathan
 Cameron" <jonathan.cameron@oss.qualcomm.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>, "Eric
 Auger" <eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v5 12/15] iommu/arm-smmu-v3: Allocate IOPF queue for ARM_SMMU_FEAT_PRI
Date: Tue, 15 Sep 2026 09:38:24 -0700
Message-ID: <28b828e4e1368d95b57aa231abab2194f397aae5.1789446520.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018072:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc893b5-5460-4eb0-9fcc-08df1347e227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: R8jJq4ZMfDY1QYXf7tiZ7F9UIMw9EurfmoBp85r8AOHvZ6JynnsuOOlZWNDPub3E5IIEOiuNFvyTcXACr2XKxf/5we3Xo3kckpYz5Z42a8rhecr9XMWCud/xYBnFtBTAgcTcIZ8K6rl0vNxza0+PwgaAK5905uF4B/vgwnQj3+gvn8/6rIyepq8L0ZAfwHgGjd9pG23oAYSVdEep8VZzbhfJZ4KNfIoyvpBuD9djnwHwq3J4mWofUhxZYMjhgMOE7HUymYEQMfwFxUw18sxPpkEjNGOlBgcXIgRb/NaZE099XgA47YBb3HM93fmJPNucrUdZSTLZG7pWMORa5QvsQvk7P8QnCMsmPMC2XpyRTvZ185zt6qhAssYL4ViFC3Ln+flDCsIr2oBqn0KVGa8+/VlQlThXT5HkmTGBpRSThdzVHa7g9whbqinw/kI7Ss56wI5e1jxI2DmY9mWHKVRN8osze2HiTOWOuksnRCCXIeBtozawb6FHnffQ98palJVj5+MbxzmTyLmZ3hfVWUE10BeNakyBZdnn+MWMbddEMotO+r/Tc/DukrXfKsUkmg+X/eTdMWP1486t0hTq/9B/OriryybmF5vcfKY79jHaGbJNaVapYZhpeiXFNRoHn6jpsO454XUo+TpWmegxHUm1Ah+e/qfBmG7MzpIGH81k2UqzJbnVyqYHUdY6sMCOEY8/1iGTWhcE4QRJCiaSHZsIXQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Isk8P7s+Dx78xM69qrnYOf32b3H+/5zfqr4a2NyCiu+NqqIVrDnLeizV0nR39WQYTdDkoBiNZ7OfHwAK+EAI+feVgNcZTy8B+XTSGKs4rU+6IZWF9jniaoCWGWW4wghA5r8bwMGihirW/PZQOirw+oBk8hhycPRUe04yOTDW7fNk6yKnQTkqI4Ye4+B6UPkc30tBREQKQb2imLuMFY61BrbyhXnFalUY4blqmixb5JKJKWQji/PGtieeGEBjTQkHPZepfa/n1yiARA+WyTArFMCWfkqvdyXSDkCNBA71rqUJRW7ao+he7U6o72w24iV/K1uw9my4eW/GjlFHG6HFba98gf37nXbXLHFRTPX+bAjKCzKkZQfHmWlNZTO0Z9PvnHL906iuAhwnslCjzN4MlqLV+TkKlxiQRyK+vjteHDikd2xAK6Ikp2yu4osDN14e
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:39:16.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc893b5-5460-4eb0-9fcc-08df1347e227
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_093929_618502_F2F084AB 
X-CRM114-Status: GOOD (  11.79  )
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

After the previous change drops the FEAT_SVA gate, arm_smmu_init_queues()
allocates smmu->evtq.iopf when the SMMU advertises FEAT_STALLS. PRI support
is being added on top of the IOPF infrastructure, so extend the allocation
condition to cover SMMUs that advertise FEAT_PRI without FEAT_STALLS.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7c9b3bcdbf17e..a4dbceae6fe1f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4753,7 +4753,7 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 	if (ret)
 		return ret;
 
-	if (smmu->features & ARM_SMMU_FEAT_STALLS) {
+	if (smmu->features & (ARM_SMMU_FEAT_STALLS | ARM_SMMU_FEAT_PRI)) {
 		smmu->evtq.iopf = iopf_queue_alloc(dev_name(smmu->dev));
 		if (!smmu->evtq.iopf)
 			return -ENOMEM;
-- 
2.43.0


