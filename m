Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B23CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw9X+/BT5rBWodt7LOlxqB6eHLcBfu7vwEtWtNrp3EQ=; b=rs+S2KxWQWlByNsDUEY+cFu/n/
	CtObMIEFAzl/fBXqC+3693OJymsKN1nOLHh6VCO44tds+vhnCDci4qQBsi4ZT1t3T6pqqeHQypWJy
	Sf3diIhOETqjrkA1uqsIctB4kJTzwxcOqbTfohjO8X/2ZK0vZaaqNh+c6xBqS7tPP8s19MH2LkHC7
	qs2LuvbY3Ek97KnHgEEvAkfitKkmTeCGqxethDY2fPee/7BDT1imriBQ5awWolie2JxtKUbBBHH9N
	rfui/SK098a4WOSsCej0nS5SIoRsLJGoGLTW+TtmfZfGMabr2/jaVz67JoJoIFYtkVaSA8JudAr1L
	/omJHV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLG-00000005FJ5-2rpQ;
	Wed, 20 May 2026 17:04:22 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLD-00000005FFv-0NuS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxWQr5zyG+g3QeIqNpIeruNRzkWBkcqEUMDAS6pgEMYQpp6IF11MDUVw2c5pmnotWr6LmoPoRsgv1meuNyIBuMjf/nJ+bNzv1J6gOPZmt+oo4TScGGSaETX82We+gKe5EIUcfEeJ7NKPA2BADbx2pVSBVvRRvgnxh+CVntrekoprL101WixLvtUtCj2GJpgQStFw4g4ofqro7Ne9shSqz/3O12Zam4IyJws5QSXoApxjOmYAkmtxKKSBKzZ4K3KBAGiyLkxJXH43rCnFgRM+K0sjy+D6rE6U5PZwa/wQfGLbS0mPPZuaossRUdGMSYiXibP0L7Gdn1lVPXXaPSBIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw9X+/BT5rBWodt7LOlxqB6eHLcBfu7vwEtWtNrp3EQ=;
 b=JAQ4iN8qlXvNZDmGbygfGdpB2uBMVQ9yJlmYEktDDmctL5ZpPFZm/HyN8lWP7bOv/YYJTTUKG4XhWH2gB6tCAPxNATjf+J95dEObXhgxReQ1f+M2Sxv5M5W2e+bj3EfQf2+gVydPbBcY5sgHFPK7VglvA+lXnzkdXPS+ECJLaQut0gDCcARqWpfH7RMr7ejhMf+Rfhn1b6yCEnMxuL8i3wZeaCV/42Xgyly1X7CeATWEWnkeT0LZYClWQtSPFPOHYpZAlrt+wSNA0ykIhzSpwg1xdvxix3SePQomr1gXb5pxSmiu4hKHY0bQioXQn9As66JVyANLxue9SwP4Tywr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw9X+/BT5rBWodt7LOlxqB6eHLcBfu7vwEtWtNrp3EQ=;
 b=YPLBIl/ESmfsUo9V8Lr+hHpyDbW02/CVVYEmp/taMOKJh5Y3LmZH2FIRQNFQV0JzVV4rxMKKpEJGFS8J6YEwPjs4qu9BWR0VeghHes4leBfpxUEBypcfMNOUc/IEszj4UPVlYCmDBaoErOzfTnP/lKuobOLbcDoqipXi4YxgAbtLL6M5Rx0KSi2BJOX/jSs/uTUOQuxANq3e0ipVcbEAsN/CXL7WdtZR32+njSOzV+V3tMMTYHesvnyiM6XJrLYgPzzBrAlhsSzI9aipdFp/l6C2PsE+2i9ZCFOOEBnw3AP6F9Du59mOs5Ir/ZchEw+fhZO3icUisRaVrSi75TId+w==
Received: from SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 17:04:07 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::eb) by SJ0PR13CA0088.outlook.office365.com
 (2603:10b6:a03:2c4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 17:04:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 17:04:06 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 20 May
 2026 10:03:45 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 20 May 2026 10:03:45 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 20 May 2026 10:03:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v6 2/7] iommu/arm-smmu-v3: Implement is_attach_deferred() for kdump
Date: Wed, 20 May 2026 10:03:19 -0700
Message-ID: <89cbd3760a13f11cf63f6ead12f44974511f308a.1779265413.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779265413.git.nicolinc@nvidia.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: b04ac986-e3d9-4e87-2c45-08deb691cd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|56012099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: EltdoGG8sXyQEwuG+NYOx3ivBCTNgi/pL1nT7wPTWtIdg89Mbp9c3wVixYHnIx4B4KJDCWHcs6C9WgkBJ6WAXS9gIv5qpB5VsvHj8OYE9jwNcL629gZ66H9DUeke0QCyidNuVr9AzCOhBYppaVBvqj9Q5ewk3obJmiVJP6/VyvCCX4ukWZJSFeMjpJ4eVvcBRrwTXd4UJY6rIN/wCyBGRSdmg3G8sPplFBVZllzYMPolQ0cQ0LP6briwvV2h3D6d69xbCVvUJLYDGklaHeHR4vK+NXLnPO3qbb6tni+eMdVHNBySG0TZFq6zzq+F8k8YvhgUercNRSt5YazTu9lGjHIQgFJjXS4iwgZzRtu1e8HfeWbi61GBSsyx1iMz64DIVzXxPtZfXL37PypFeXdn9ZpfCaJRaXTEnpfakNqiBpkVwCTIC9v4Y4h8KzcPpzmaSSqTMIBsZOgB/03nftFUGiag9D50/Oh/6AP0ELEjUwuXfN6Fi0Dku9PwnEit1jJsjhUJ8ZTFBXr/7Zeye+Y3y3qLjC0MIlGiM6eDFZssgFCXixz2Ld9K+QivtuKwdk5Ses+rqOyTXvdg01RytPOaBx4WimZbcEDfV0RvCkRdiXXmu8xZhjlGSsZ+Nhb/hrZ1MAYBUL0vYLjV9uL9K19VhyU3sSzPDtlV946Ktt4Kv1ewAXG9xCeCicb7srdQaTNbmzjrav7ELAMbh4lxgDMv8d43avqtDpcKI/XKFDpreb8=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(56012099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 19ZFkBompdYlpdjB+aorZ8gKkkP6Y248zZPuCWoqgcOxuks4W7nXTEC/OH59A8ILL6fb/ed5gX4tDPr1DF0EElesszFkPmtyyebpYn+qs9QH2PByjVshlOo/v9bRwtUP4bQIdT11dZrQdjj/2qytv6cst2n/zsUFQbXhuQCVDUSxMQ9St6zBgaveSLsmzikBBRoK7AC2+c7iRG5SGOsdIDYaIztCuRHv+4FBd4j1QOE+eCnJMl2JPqLkEOSqdJsBRiWswtlGwXBhaUX4yBezpSst1jo89Gbya480cmt+JqV+jnpyxLGqUBwLU39fgIqrmt0iQNkBrTFjIQv4imJc1RadMUuP3PXAm4uuUXU9JcJdIaP9VEr7lJQ96fivaHWtxNNMBz8qkLCNuncGhkzGAh6liApoJ3Vdby4V7GIO2gWVNAcmBFvD0FphF6fO4bk8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:04:06.3741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b04ac986-e3d9-4e87-2c45-08deb691cd4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_100419_907684_F3808553 
X-CRM114-Status: GOOD (  15.27  )
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

Though the kdump kernel adopts the crashed kernel's stream table, the iommu
core will still try to attach each probed device to a default domain, which
overwrites the adopted STE and breaks in-flight DMA from that device.

Implement an is_attach_deferred() callback to prevent this. For each device
that has STE.V=1 and STE.Cfg!=Abort in the adopted table, defer the default
domain attachment, until the device driver explicitly requests it.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index aa6837a5daa88..2d7eb42449eaf 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4268,6 +4268,29 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 	kfree(master->build_invs);
 }
 
+static bool arm_smmu_is_attach_deferred(struct device *dev)
+{
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
+	int i;
+
+	if (!(smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT))
+		return false;
+
+	for (i = 0; i < master->num_streams; i++) {
+		struct arm_smmu_ste *ste =
+			arm_smmu_get_step_for_sid(smmu, master->streams[i].id);
+		u64 ent0 = le64_to_cpu(ste->data[0]);
+
+		/* Defer only when there might be in-flight DMAs */
+		if ((ent0 & STRTAB_STE_0_V) &&
+		    FIELD_GET(STRTAB_STE_0_CFG, ent0) != STRTAB_STE_0_CFG_ABORT)
+			return true;
+	}
+
+	return false;
+}
+
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int ret;
@@ -4430,6 +4453,7 @@ static const struct iommu_ops arm_smmu_ops = {
 	.hw_info		= arm_smmu_hw_info,
 	.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
 	.domain_alloc_paging_flags = arm_smmu_domain_alloc_paging_flags,
+	.is_attach_deferred	= arm_smmu_is_attach_deferred,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
-- 
2.43.0


