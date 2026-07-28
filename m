Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2760C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpwkolTSIl1qtoJrGkA843PQu9VpG1bJhIeeyTPmtAk=; b=FJNHpPQ2VX/+iEwolDdhGZvakb
	LSJWiRP/70ZEs/ON2T7EslS5K5imeSGTb2HMkIjl0M8BPOAfJKbvSqDytUCcvT9uTG3H93KbI9eSN
	mSdK1m9qd2ReYRAfMuJ9EvaJO8f+bkCdPACG9E0lCC9tx3GBXfWyJFNUzV6fS3lLW4Y2YXd4e0iLG
	aEALFdd/bcsfpdpItEY+n7GrinIJEORzEblqffWMDr9SLm9eXpPP/3mQK0RXFB39yh0jd3Z2UfPo1
	4PK5VTlvcwAQ6YcJrYBFTtH8+M6hQ1KKHqcGWIvfAp/GY7+KV462GO2sXFqcjhhTUPar44eF8GhYS
	FTBbwOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolhF-00000005xws-0m4l;
	Tue, 28 Jul 2026 17:34:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolhB-00000005xvU-1k2i
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 17:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YpwkolTSIl1qtoJrGkA843PQu9VpG1bJhIeeyTPmtAk=; b=X7Tkcn7Mp88jp2YhtOW1I+w6ex
	b8Dpk067g/gUZ6s8D5liBRewuf2rdN+POf31E9psdXCRLwGziAHssLpEv09QaisGjP5sRtOoQRw5D
	9yaZLnGJVC0ZElibPHm1PI3jkKmeOuSt7nyG+e4mcX7t4/DV69bOvsSmBlWhlxxxZwd1olGx7bJVE
	5uFrMHq+bsVV8AlAIZRi7nRV2/pWTqAJ+sqVvp7p+ZGU87MxYxujHlkKnOcWrRTjoutB+Mp+8oEP+
	/E8DkAjFeNkAUpxVsjXFGg1w9i7JScsFqK/SsEZhB5OKE0oF/zvkRWIzUfJhG70bKeEq69dgSRlUF
	BKh/0sEg==;
Received: from mail-northcentralusazon11012016.outbound.protection.outlook.com ([40.107.200.16] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolh8-000000059t7-0cJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3hZCPd0bVldFFJtmIdq7eO6tYKfJMmqQnkD+qTFNsUkxye3CcNkD58zkTlRru5TKEPDazJu8x8/05LTa/zte2hcyNkuMnLETJyBNrfeaY9skLDj/rXvXLWe3w9eAGEPTu6jJH9d0kcttRgjmNG8+DG8uVrc3/Ul29gHs7FDcRxBk8gisWRF+NJQZlRkVPmMjdq9Lsh2/Ea3Et9UnAu5k+jELU/3ywnCr5GFTVapwD9ac742enJRk4wPOe99PebMWT2GhbFlJ2tlbA8xhl7nhooQY1rHuzsHNcFJYRxK2O5Zj0EwQiMLUYxoZZG0IfxKbTWfwKWXfjL5HfIbjHFCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpwkolTSIl1qtoJrGkA843PQu9VpG1bJhIeeyTPmtAk=;
 b=kNi7GJ4nwJ+vRP1lOGmfn3p7dkrtK2wFHv9MzgouS1yjaGVbu29FLTUgJgmGbiCTpsaVX7gXtOLaCPZwUIMOoPgmN1Gt0k3bpbVB0lSfDndKKPbOw329a9pW1nOrVKA3kjqEzC+C5lk9JLHNVau8L9fifLZ7JE5jdqiM15MftTmFqYIusCJLzPGtfl6vzm0mPpkxo44Be3S4BHXI1NWzAc/D8Dp4f4Y4cP/QUKMQq4oxBfOff19KX2SWagVZ8Vv/2ZKxUI/nXu3i0vHunSkvB8vWIdcDrCZXc4HBvpGlBpF11+7T06/ZD7NJin4i4c9eTxUlymMcPPXSJohaLXhhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpwkolTSIl1qtoJrGkA843PQu9VpG1bJhIeeyTPmtAk=;
 b=YD4UpFEMQQyuOYuEphHOpMCu+w1Wi+QsgvaFSWfw8hnB+SbBz+wGdPVMHSFpHgvcqeIbhpwe+T9Bs8YSKg3l3KUOXCqJHiozD2RPS57AuU2BZdWxO164g5H7eM7QKWe0sDkABdBveettU//nzm/H4MMreU3Rf97T1pdMGW4hk+hpeJ5B+7Pzcgc8xwnk/QDKI4nCBTFa+ZtE5CDHl1sWRsV/PIO9V7isNc4d72XargUOKV7TvGv3uGSNAqaEULIXY4CtNGmOUcwZBav+yF5lHI53pHFL48om1dVFhPBs2Bd/BTCCy1M6Y6Lo1EeOccKEAfs8wIiu86wEDXpurEHUdg==
Received: from DS7PR03CA0076.namprd03.prod.outlook.com (2603:10b6:5:3bb::21)
 by SA1PR12MB9489.namprd12.prod.outlook.com (2603:10b6:806:45c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 17:34:09 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::20) by DS7PR03CA0076.outlook.office365.com
 (2603:10b6:5:3bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 17:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 17:34:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 10:33:46 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 10:33:46 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Jul 2026 10:33:45 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Pranjal Shrivastava
	<praan@google.com>
Subject: [PATCH v5 1/6] iommu/arm-smmu-v3: Support IDR5.DS and widen the TLBI SCALE field
Date: Tue, 28 Jul 2026 10:33:33 -0700
Message-ID: <1b35fa8c417a21ac80a4a3f19db34d81ef6ca490.1785258826.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785258826.git.nicolinc@nvidia.com>
References: <cover.1785258826.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SA1PR12MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f84eb4-43af-4f66-fc2a-08deecce6e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|10067099003|11063799006|5023799004|6133799003|56012099006|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: VdYMNY3o/fOAsw0bCJMn/DczQdVjX7zC+g5TqXcLNo+dok9Ap6zL8txDebOeIkPVOhMVKXytlwu/KPJtc8yXCfNkmROBXmMHekTKm3VyU+9WigSMmwd1I49E6YB9UCS4bmMn4tgC4KlaTJnHVVaHhcEsDEq8BHKA+2taph+plbaznB+hjvxzKpMSBbQX2eW8ERLGnw5Q9w3Vw1p1K21G77kvrwPTd3dE/Ssn2GEF18VISqpsL1vkWdzaGkoV/FKpVTSFbbctfdzIbIjFNaXuewR5+xxXs8Icnn/okXLcx1eqvQpH3Z6Jznyeoluh9Yz9pdraiLmpoCqV3yJ3a8vhiVmbFtAG/hjxg/24JjitCW10dWZQN2kOGEbQCTOCfQOeplp5BrXFcNm/4oFMV1tQmD1UOG36+d4apENn04p5WB3k4gDqGAGTWS7ZL97puMEVN2CwJp7yxK4u78gdWi7ku4IJ7mI7cVFHt64aim6bFAdo70OJPLhxlnOPffvYa8w/Gxd93VC2GOzREhXENkdZxIoaSHaXIkl9vedlQJba3x4rBHPUIdble2nLmYM+Mp41GgtwhHBWbk4NyFFstR/38+q9a72rTXyMIWEciQ+L5tK7N5zmGYkG3Xnc+ubk+MNsfQ8LnxIzfl5CX4i+U+X/cpAdXy3lvpRKW88plYq30hFODPlIxG/kM/SPP6RdO+9NQuhJalZHQgmBRbFqzM6tKw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(10067099003)(11063799006)(5023799004)(6133799003)(56012099006)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dUy7nAf5/bAcq+B81vW0GX7ZDwRg4kcxz9rv+wgeLX73LfIAjMKBG1LmfeX0LR2vF0FX80gQxFY5XBvXi4MYVzxVn/cjZfA8aDSg5fRr3FPy5pcIOZFMZi8CEbaJoC5Z0XvxGKbBrW006KqWUyyNsxqtrDjf4d7MFWIodpXUsaUVYDc72/mhVEDtZY1ZztY2fiCrOSDh7nykNkLsXVy4BtLLnP5+gqFmewu4mXX46f+Mnc//Qgtvt9MXcm87OAnj13HKPUrst1hMOMkH2zoYOXiubVgtf2o968IA5teJehL2z84LwH/eMv9PJLqabQPb0hWiLdb/++yNwV3mXfqjmi+IXD3ckaVpIDc0QF8EKGNUxMqihLdDKyJXVtYIhFsqYDQ4RYh5n83a3sen1U8HqgnxzPmYw3RJ4MMLYXs5AfAG6pHxUGFNNOsdSr8KP9h8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 17:34:08.8235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f84eb4-43af-4f66-fc2a-08deecce6e3d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_183422_324849_622CE936 
X-CRM114-Status: GOOD (  18.76  )
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

An SMMU implementing SMMU_IDR5.DS extends the range invalidation commands:
the SCALE field grows a 6th bit, raising its maximum value from 31 to 39,
and TTL == 0b01 becomes a valid level hint for a 16KB translation granule.

Add a new ARM_SMMU_FEAT_DS feature detecting the DS bit, and widen the
CMDQ_TLBI_0_SCALE field to its architectural 6 bits. Mask the scale value
explicitly in arm_smmu_cmdq_batch_add_range(), so the range invalidation
path emits the same commands as before, keeping the pre-existing 5-bit
truncation of a scale above 31.

Also list DS as a valid IDR5 field in the iommu_hw_info_arm_smmuv3 kdoc:
iommufd has always reported the raw IDR5 register, so a VMM may conclude
from that bit alone that it can expose DS to its guest.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 4 +++-
 include/uapi/linux/iommufd.h                | 4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 +++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 43f4d24e78472..79216f2c0a98c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -64,6 +64,7 @@ struct arm_vsmmu;
 
 #define ARM_SMMU_IDR5			0x14
 #define IDR5_STALL_MAX			GENMASK(31, 16)
+#define IDR5_DS				(1 << 7)
 #define IDR5_GRAN64K			(1 << 6)
 #define IDR5_GRAN16K			(1 << 5)
 #define IDR5_GRAN4K			(1 << 4)
@@ -415,7 +416,7 @@ struct arm_smmu_cmd {
 
 #define CMDQ_TLBI_0_NUM			GENMASK_ULL(16, 12)
 #define CMDQ_TLBI_RANGE_NUM_MAX		31
-#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(24, 20)
+#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(25, 20)
 #define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
 #define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
 #define CMDQ_TLBI_1_LEAF		(1UL << 0)
@@ -922,6 +923,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_HD		(1 << 22)
 #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
 #define ARM_SMMU_FEAT_BBML2		(1 << 24)
+#define ARM_SMMU_FEAT_DS		(1 << 25)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index f73a392b3d3f7..c6851c7655c66 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -605,7 +605,7 @@ enum iommu_hw_info_arm_smmuv3_flags {
  * idr[0]: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN , CD2L, ASID16, TTF
  * idr[1]: SIDSIZE, SSIDSIZE
  * idr[3]: BBML, RIL
- * idr[5]: VAX, GRAN64K, GRAN16K, GRAN4K
+ * idr[5]: VAX, GRAN64K, GRAN16K, GRAN4K, DS
  *
  * - S1P should be assumed to be true if a NESTED HWPT can be created
  * - VFIO/iommufd only support platforms with COHACC, it should be assumed to be
@@ -613,7 +613,7 @@ enum iommu_hw_info_arm_smmuv3_flags {
  * - ATS is a per-device property. If the VMM describes any devices as ATS
  *   capable in ACPI/DT it should set the corresponding idr.
  *
- * This list may expand in future (eg E0PD, AIE, PBHA, D128, DS etc). It is
+ * This list may expand in future (eg E0PD, AIE, PBHA, D128 etc). It is
  * important that VMMs do not read bits outside the list to allow for
  * compatibility with future kernels. Several features in the SMMUv3
  * architecture are not currently supported by the kernel for nesting: HTTU,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 3a9cbd7d8a00e..4b600cd0f907c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2511,9 +2511,10 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 			/* Determine how many chunks of 2^scale size we have */
 			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
 
+			/* Keep the pre-DS 5-bit truncation when scale > 31 */
 			cmd->data[0] = orig_data0 |
 				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
-				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
+				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
 
 			/* range is num * 2^scale * pgsize */
 			inv_range = num << (scale + tg);
@@ -5192,6 +5193,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	/* Maximum number of outstanding stalls */
 	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
 
+	if (reg & IDR5_DS)
+		smmu->features |= ARM_SMMU_FEAT_DS;
+
 	/* Page sizes */
 	if (reg & IDR5_GRAN64K)
 		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
-- 
2.43.0


