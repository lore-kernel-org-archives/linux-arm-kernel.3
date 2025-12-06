Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A0FD3ABD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3EFfVR06bIb5XQcHdUUcpRCGI2WAoB9QxjD7fCK+d8=; b=hfMGYDO8kiQqcSyyaSjg7LaJrc
	IMiHAlZLtdQeKok7U8vvN1b3uul9CyUIx5q5L5gVUdTiCIgWyv0gIWmeiPPF3jSUlT3PDcLqXf/Lk
	zUAWiKNn72dtB8tlPM/x+8eFGfxg5P7+HDZ2lJ7GGsUjY5B7GPU2EVdHx2/0R1u3WjazDyc2NLgxR
	qYwZxkaWLLka2rQBLBs5aXkYZm/t3+5IqJmSNRB35PJJAdsr8ZpcTDOP3aask1DfmR55niqhFSueX
	mi+MNL0z44Qf9ROQUBzdKuezXJ0zdRkAjma7NjY6Ngcc37EpnhMzlUZMpOMqCPtuDr4l/seiodFhp
	eottTpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRgYB-0000000AOD8-0REL;
	Sat, 06 Dec 2025 00:53:27 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRgY8-0000000AOBt-2vJV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:53:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIadJNKpQn36VCMjR9srPSFACNs21jbs7f02M503yTsjdbcA38x1mbknRJJUSAxfkejHRMp/sk6Q5pklOk2t4ZH8b3E472iywJpD0naT6rRHhrl8N765mLmInj+jvknoPrWSWzUFVUN0banH13kC+iVwCZ9E6ujTJdingNNFXLwgbBq4fXSeewfRqyMWHX0FtyDWTrZk9syx9wBde/MtBGW6KPs+pX7jepYIF/l3GW9MopWGH1wYzwqe9we5vmxW8amZ3ckNVryO3/WuZbEnLsr3/NEQDbCV91sxRK34d1i0sXTs6nLXewBjnrwJ2ESPs2EfNSbY3Mv87kM36IxUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3EFfVR06bIb5XQcHdUUcpRCGI2WAoB9QxjD7fCK+d8=;
 b=wRwEgpBY4PR5qguL8mCmHjFeJ5csx1/iysxcG/qukvHfgrISYXURdKYncVb2SeEK3rx1hZeCwynCbDE3I46Sn6N5/6okSzEwCGiTxdiDYllBnHanCFIL7wTlIg6ykPA7ojQX8xIxI9F+fsbOpL2FSNbIsTmvOmWO5nonB4cIeWYL9f/Dj5+XKrGfoytGEAkAC8K3/q33Bpds2oIiNyZQ6ysNSzk8Pokvevkk2ziu9VhxSCU3ghsiQs7ayUu5O4Wg/Lkvr8uArfpZL++GmQKMLgnmsL41fCruBznxD3DUX6rPnFliXJDIY7TM53UP6oat3HNULQWGVr8vNC0eFSsYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3EFfVR06bIb5XQcHdUUcpRCGI2WAoB9QxjD7fCK+d8=;
 b=TBbyXldtwwbmJZhCl9Pa8f3+ekTGfu5Z74moheEK1Ek0BfOQUEyozMmUVN0Mp9UEVl6XjZ8X74JQpgmr5Hsl92lAV53JanUQHTnka/vBbHTMojKGt2zNX21pzJhz4uYyD7gjbarmfvf8AmRgxJ7mZcLAO3o0w2a6jEcY/hG11iPNG0NsEYntjczT/bhJet2tc/p2BlOHWhUkuTsq7Dvs91cnRhN+SSiO8LrY5gCqjASl0k25trbcfkijNbXnt/dipBd7DvLMMvdMf5/FMISrjkwqHLx6Q2i4cLwBeRcTjCwb5OC/zFKrFoSCiKl5OnliCxblJEBqZcovpm31tz3EFA==
Received: from SJ0PR13CA0188.namprd13.prod.outlook.com (2603:10b6:a03:2c3::13)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 00:52:29 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::91) by SJ0PR13CA0188.outlook.office365.com
 (2603:10b6:a03:2c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Sat, 6
 Dec 2025 00:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Sat, 6 Dec 2025 00:52:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 16:52:21 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 5 Dec 2025 16:52:21 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 16:52:20 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<skolothumtho@nvidia.com>, <praan@google.com>
Subject: [PATCH rc v1 3/4] iommu/arm-smmu-v3: Ignore STE EATS when computing the update sequence
Date: Fri, 5 Dec 2025 16:52:02 -0800
Message-ID: <db1450e7a5989e51756a7ec3285d70ee90bae24f.1764982046.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764982046.git.nicolinc@nvidia.com>
References: <cover.1764982046.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0bee6c-f3a7-4a31-ac12-08de3461bb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?om7aFF4TRLval4rABmXgU8M1g+yLiWt8qmspd0sE4Yt3kdZ4JFUWlbSwk8yI?=
 =?us-ascii?Q?kFqd7wX+4ZkM/D6nyXUYn0NVhmnNTzReXm6+gOezcAfOmNqnYCVOs0ojaWb2?=
 =?us-ascii?Q?IhiARzc2RTntvOwbRyZBjpVcAYhxYBffcaXDW8Yyj8D42XJeFCYMzwE6MEMU?=
 =?us-ascii?Q?tURrOCPJdyewyQboh8KGadWaWik4FpSO1aqqBwHY3aSXpd0tzSxbQ50ucrdZ?=
 =?us-ascii?Q?CKCZTkLz6VNPka8PFswhTxgsWxa9kdui9dx6ad3OmnrLMupFd97QP/WJa3Ti?=
 =?us-ascii?Q?alJvSgDRimxZ+tkAhVmT6LSMylB/YmrtOJ7waXfzQC8CATFDCroQLhWHouAO?=
 =?us-ascii?Q?S5/m6wGHU5tFthhxXvXYAABATyFjfmpkqNk52P2nO8NxBE5ZkHDDmyKUL1BW?=
 =?us-ascii?Q?uyqwTLP2/Wc7NPnNcTM6/PRaYrqhRXn6wzTedmNC31Tl1K4QebzgcgyAiLLX?=
 =?us-ascii?Q?Wsh+M9SerH444v7RWij2IRWtfC8FXtycB2oxsNhjhVNCBFTr0CxXke8EtFfF?=
 =?us-ascii?Q?jMB+BOGdoL38EoFRKqpHsG4J4pjAcfc2lXUiTxoU4dHT3VGMovLAttj5b1TR?=
 =?us-ascii?Q?AwAAdkJUztSxTezUAWDsu+8h8v7POYA/EkvyL8WbYoRCsfWCbIuqlKb/exEn?=
 =?us-ascii?Q?18G9jeRuUXS/QAFptkyULVeqz8HRk0rAajMNHsWHG8cHLIOvI0DB1prEjhhY?=
 =?us-ascii?Q?PlhNz3XC4YAU4crW0fntuwvSeIoahhWOAD3d5CBaHPYV1abanLSjNxi79x6U?=
 =?us-ascii?Q?BWsWacqx/WeqlljXVubpwVcaKMYLQbMyHAn5jLMUfoTDyaxw3mTavx8YFq5+?=
 =?us-ascii?Q?nvDu3yEY1s1VlLwevyA/TthFz3KAcDFEEDivaxUR4YUzARb/GpI/qaaroSZ+?=
 =?us-ascii?Q?TEjlVmqXrNRldm6HJ0nyDTy2Q8hit83Lz+6vZzmB319tlj0XfrOIZvi8OVoJ?=
 =?us-ascii?Q?qr3byG0kQqUHq0CbqL1Tm+Ic2ZNa9GaBo3JCK/H/nIPkpkYbTHeXwn13LV3C?=
 =?us-ascii?Q?G33rTHWwrQP7TR6U6wSdSDfQM9ltFYnbG2G0KvXeOy3g6q8HQ7AjZX8EXbkG?=
 =?us-ascii?Q?dnzvMRD2XV6jtNy4Wji6e1AdDDoLaBXRSCZNacoXBrsP3PyL8B8FY6cnIb2X?=
 =?us-ascii?Q?AeWmHDE0VfSVJt5DKvN7pso/k6nvZW0GCKzWz3yrduJLXcOoSPjRoQUJSMEI?=
 =?us-ascii?Q?vLZOMhysFFHXl4qNsTVBIj0Z8mbDf4gKb08FVEMqccnZC2u5+MQ4npS6/eXP?=
 =?us-ascii?Q?g8RxIlnG1BfmVlRha+y+XfD5agHrd0fept4x/zt7Q1ugmR/eeOfT4lbqciWE?=
 =?us-ascii?Q?qW7MsSeldnmIMxcbelqIGqLUCG5gf8D3IPmOO/LD38uHSE3UO+h4PXkMf4ww?=
 =?us-ascii?Q?/Bq7ShHFm9TECd5rLFPqR/aZY64IvonJYRDZBUkBsdqOlmq2g07bhAPEbND5?=
 =?us-ascii?Q?j48U5ITReumRbzhWENXBoWBLeCPesFv9I1S53b9jHR6iUXys3Ilm04KOeQ27?=
 =?us-ascii?Q?fGlodDonHb6S/wb1qMVi5r/pefzrwHW+YcSqrx1B0f3emk+miaWe5mVng0Qi?=
 =?us-ascii?Q?hakWZjhaWKzgpeFpdZM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 00:52:29.2514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0bee6c-f3a7-4a31-ac12-08de3461bb56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_165324_742737_F3D10278 
X-CRM114-Status: GOOD (  12.49  )
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

From: Jason Gunthorpe <jgg@nvidia.com>

If a VM want to toggle EATS off the hypervisor will see EATS change to 0
and insert a V=0 breaking update into the STE even though the VM did not
ask for that.

Relax the rules for EATS sequencing, we don't need it to be exact because
the enclosing code will always disable ATS at the PCI device if we are
changing EATS. This ensures there are no ATS transactions that can race
with an EATS change so we don't need to carefully sequence these bits.

Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2df657c87abd..6a982051c3c2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1051,8 +1051,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
-				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS);
+				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1067,8 +1066,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	/* S2 translates */
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
-			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG);
+			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_SHCFG);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
@@ -1095,6 +1093,15 @@ void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
 	 *  fault records even when MEV == 0.
 	 */
 	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
+
+	/*
+	 * EATS is used to reject and control the ATS behavior of the device. If
+	 * we are changing it away from 0 then we already trust the device to
+	 * use ATS properly and we have sequenced the device's ATS enable in PCI
+	 * config space to prevent it from issuing ATS while we are changing
+	 * EATS.
+	 */
+	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
 
-- 
2.43.0


