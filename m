Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E27F433C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2b6AaYuVBhjnQ2qQ/DDS2ufKAxyzO3ee0R49wzfD8KY=; b=jOONPTZqx3l9ONZ217KW0vUILF
	/ROlyI9iDJ7TnzqcbrDFBfAgqbTBeoOiMdD7cEqKX7ap4u3LDW/uqpVG3VTM/JjVRhvy6kj644eMb
	cJuXZX+/B+Mm1xMwBZ4DqqTYUvLNfaD0O4VH5C5afJtLNrrP7NcgXZYTSi/d/ncHKC36v246p+Ih1
	OTMUqoHjtZmz+ISBuG4gfu4BssepBQecEg5pUrYhfEXZXeMKgASLkyzuu0iGdTDuaiGaYvPFV2k41
	95gn1zZaWFoXsy94iIQTIDVM6SFfbHafNn2/R7bk8a9Wq4AeDZVLkKl/qdhG5buTpwhUf+YV3RNGI
	NB5duF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7cu-00000001ccP-2Rb0;
	Wed, 15 Apr 2026 21:18:24 +0000
Received: from mail-westus3azon11011028.outbound.protection.outlook.com ([40.107.208.28] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7cq-00000001cb3-2bmE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 21:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/p9nygZnyWS5pI+AnrP8DZQJPaGxo24t5WYkgVKTaLljO2MM3bt3eE5QeS9uyHfyGWka/VO5+9dXV976CgvERVyAJRaoSxqeG/z5a6RLXD7hgByzcv3gbPGgp54eUawh4pzokx5YF5/ma0YnLKET/j2VXwXruV6Jk9VUdMePKx1MNO6J3CelEVTZfmFkTeTRHX4LxBpYv4mKaObK9ZraFsMwC8Qslb6kczcOfNcPl1EFbAwWAxPMgyD3MKrrp9uf9luT+u9XGcI2h1InWCs1qDVOyuJJKUKKTf14o+L5Ivs8zJPV5ApMJ/se20JY0j0q8v2t6L9r6BU3YNqPtseiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b6AaYuVBhjnQ2qQ/DDS2ufKAxyzO3ee0R49wzfD8KY=;
 b=sm/m3C/38ikcyJPAX2raruvoJW25lFKq5KI3Z/4cuO1egs8CSo7KiVoyHeCCbc0a4Z2PPO1Oo/Wzp+qynBwMTYqG9kU2NWfmXGHVqyZYAFxFy/+L1jJkPS3OQeQgZTJjzVFbdshd6Nb2H71E6MCQdAYsl5TpXLKp+gNi64ugVPrfCMzyLXHTM80lkM8xprSE6eF8jLnpmpBrs/DBKoYV7m58QrdbRcWpfHzcBrjtiQsdYTrc2ap/MJ3KhxaVkavuGGS+yDYRRdN6GQ+GjBCTxK3ZoGJPzUYbw4kdNFe4tPCy+Z++empArSBbkfe56tbU2Hbwyx17JabsW2uWLRjmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b6AaYuVBhjnQ2qQ/DDS2ufKAxyzO3ee0R49wzfD8KY=;
 b=hm9/xVJBivbKrlwonlN1skxHlXMIKgOX+0qr/YGMLCbXZJCaah+hVRYOyN/nTKDoGTqmCVJjjfnLgyx0VESk5IS4JZAahR9gpDAcmQB6i7BPDeek/96cef0nH+ZHb9hL6FYmYakJYtl3TsSTKHI99Lz5QtTGalVlK1Y3oqy4zRTQ8yCs4VgYpOBEf+4HKM1HBhuFJuk3WOMMCdXAv6ODTXmVYKdRiiRhrcXMDSLOomIBy7KL6f/Nl7qNy+V501sp7fJP28c9oGhfs5lB2BkTIh1RoHWWd+R7ZThnRuHOK2YI+ThzyDrIEfrbn1Yl3likeBSrLwW9Cp+qkYmDdaPRhw==
Received: from SJ0PR05CA0151.namprd05.prod.outlook.com (2603:10b6:a03:339::6)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 21:18:12 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::4f) by SJ0PR05CA0151.outlook.office365.com
 (2603:10b6:a03:339::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.44 via Frontend Transport; Wed,
 15 Apr 2026 21:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 21:18:12 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:17:55 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:17:54 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 14:17:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v2 3/5] iommu/arm-smmu-v3: Retain CR0_SMMUEN during kdump device reset
Date: Wed, 15 Apr 2026 14:17:38 -0700
Message-ID: <b4e489a4155f80718f84548de2afe383847b8b7f.1776286352.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776286352.git.nicolinc@nvidia.com>
References: <cover.1776286352.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 1057bdb9-7f28-445f-d77d-08de9b348048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Yk/jRD9fPWzo0QLHwaQuOCHZlCjU0ffC+8fACjy7jvFK3Ch5NZBcxDlEl3hqIQ2hGPlVceY8sFWLzWvMOF6WyqUhfu2j7au42q2jwnCF0u6871V9n4JBTcJ17ODYHG4l/E6qF65qWx4HNw+sNsUQulaVALvD3/bmVzq3jL6q7pH5gEZjSMxmJ8kqI1LvILhXUL0nk4I8E1kQISbVjP4X2F5BcRH8Bh+AQr3mPT1ujHeyFE1Nd2RToGY7y8u705fiONHfh7FBPfK5kSUlVslbXqLjUprCTpCoCEsyhv8RYMYocJKJrtx53d8UQqflnhzayID6f81vXo/d0hpe/qqD5dGvDaLhPK8aZteZCjYzA/LcThZvtIQZkYoUzT+YHiH8QcBLmEgWHhYQnvUajLkw1D+ilP5YULCD/KChHrw/jEYTMJbCWYAWqPcqePAq7rHz9no+yBIydQ2BBFTsKrZNieZ9TiPbmZIHwWfnnhCIGMXPIKWRHe5FqZr0mxAZPKwDStndS2x+nf/9WUIzUfqPET2E+TVDoeWQjxA8zamKmMKYJhn8OOD440jAadRpfvbGaZTy3tVLHnP15qX2X3FH6rE3CKuNDDheVoDFz9NYnDTmIb09XwISarNsB4o4qzAtdLM8nasG5IjGgnRVay5/50gCO8QE+4EggqJ/lPATvfEWP1J+wLRxHHbjJca2CQJlgDQt8E02yU/OxuPyfZOTNAUl0MK7AILr61UHb8kTgOYgj4qf0SuSZyAsXl3bL8FABsOyzUQXsIF1D2PlSJByLQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jb56BqMsD60YxZ9R7OV8rqMD+liiPr4yJxWeI+YNXFeS0zYdD81gR0ho+avnizCNM3FXsAzFqLdeXQGHFhVZ3ZiUHPvG209dVQpKGaOoEtD8KWjkwhZwUVKhwqDExaq+LD6CKIN7rdLtCp2d21fIS4S1ViQQNKlrmmrUBI+DjWn2rcp7InIjHodCgfjxpDIR+Gs46eGurk7lOWjVnit02iM+s3HQgbfFbTVjATTYYPOZ55mJkfSvvqN6/gjad9iSwtIt/2kXbjntNmfOGMH+wIotSxiDpbl8EgZQzaUfCceiXIkv1oHnJfZGJDylaq+gEC0DwGrzJVwZFFIaMizNxFpyPALRv7pBc31dN05o6mcYk1smojsZjA6uFHOIHyNaPIPtfJbeLmSqBwXHsTqONbrcB8r60usoZYE6sXUTWCApp9HFTkMN80oQzPlr1vMK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 21:18:12.5035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1057bdb9-7f28-445f-d77d-08de9b348048
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_141820_667684_0DC5518B 
X-CRM114-Status: GOOD (  15.45  )
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

When ARM_SMMU_OPT_KDUMP is set, skip the GBPA/disable/CR1/CR2/STRTAB_BASE
update sequence in arm_smmu_device_reset(). Those register writes are all
CONSTRAINED UNPREDICTABLE while CR0_SMMUEN==1, so leaving them untouched
lets in-flight DMA continue to be translated by the adopted stream table.

Initialize 'enables' to 0 so it can carry CR0_SMMUEN in kdump case. Then,
preserve that when enabling the command queue.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 29 +++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d9d543eb8cecf..b2c34713bf9f2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4938,9 +4938,23 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables = 0;
 	struct arm_smmu_cmdq_ent cmd;
 
+	/*
+	 * In a kdump case, retain CR0_SMMUEN to avoid transiently aborting in-
+	 * flight DMA. According to spec, updating STRTAB_BASE, CR1, or CR2 when
+	 * CR0_SMMUEN=1 is CONSTRAINED UNPREDICTABLE. Thus, skip those register
+	 * updates and rely on the adopted stream table from the crashed kernel.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_KDUMP) {
+		dev_info(smmu->dev,
+			 "kdump: retaining SMMUEN for in-flight DMA\n");
+		/* ARM_SMMU_OPT_KDUMP is only set when CR0_SMMUEN=1 */
+		enables = CR0_SMMUEN;
+		goto reset_queues;
+	}
+
 	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
 	if (reg & CR0_SMMUEN) {
@@ -4972,12 +4986,23 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Stream table */
 	arm_smmu_write_strtab(smmu);
 
+reset_queues:
+	if (smmu->options & ARM_SMMU_OPT_KDUMP) {
+		/* Disable queues since arm_smmu_device_disable() was skipped */
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to disable queues\n");
+			return ret;
+		}
+	}
+
 	/* Command queue */
 	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
 	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
 	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
 
-	enables = CR0_CMDQEN;
+	enables |= CR0_CMDQEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
-- 
2.43.0


