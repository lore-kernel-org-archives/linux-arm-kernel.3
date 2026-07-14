Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26041C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNoQcNX/8h2HXIdZoQdMkHS3nWMo1hP+4h9R040dKBo=; b=vxKWlda9r06KnBhFvPznftrJPh
	YSzOKGtEOBiv4jPasGGqu2+6kDYKfjGmHHahVHWML5FZvIxhZKDCUYR7zIWATzxmMWLVz1PI7EUYS
	pSADlnJbZBsnhLbR1ufF0wrl+Bhk9zGCrp3CFa3gRcgOiRd7O0kCxwjyYeEJjyl/eIJ/teWhUF8T/
	S+mL7LLBXDbPH/RBpbKCoM8Q48GXDdAHzNRIDAqhov8jPmPg1iirrp8lEVIrYKipVouLF0NocsG1X
	Eod61AZ+7DNvex8jFWSXSSsmSz+Oge0cKCn4HxyprCt7PPexegGHFZOXNKRmzQYgGSZ+Q3SGjf4SU
	hTPrFj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAt-0000000DHQ8-1fBu;
	Tue, 14 Jul 2026 20:56:19 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAS-0000000DH2u-1XGn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:55:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7Z4f4QP+6zkt2oxdue8Oebnu7OMJwhdPpC21BNRNKXYgGYQ3HfV9IpUgoMK3efFGvE1U7q4fvyxDOL+yE+XuwzHI+Nm6jMlbZD5uKJIrRq9IFe2METXIAGZoxjuurpvev//iocMiOcqcST4H59ZibluBGomS3vxTkCDei7d6IFg/rikbq+X+GhX9I7H14bHTIpnTEqbCRUTU5adIgoe0osx+WCBgBj+ntg8kDxTON55LGkTR6A9KB8N0SXNLffxf/Y2uLhUDvPrhBrnMPy1qkwrwl1+N9WnKh8z26ZThpB5EpRvWkgFfv6ShpOJ1WjXxXtadcGqTKkMY/Jhpmte0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNoQcNX/8h2HXIdZoQdMkHS3nWMo1hP+4h9R040dKBo=;
 b=yjL13nGs+SYzM8hhUsz3ImU8i/8B5nqU0mYXPjTJWeP1zZ4SuwJlLPmbI3m7pOQBehJytKLmRFVfllFhlXbF7W15AjTnloQrC4ulZgySGoxwFwlrncOSj/WzVBVX+qdZdygk9N+dlaiSMVCLFbPIgE+W1LD1cEvN44Wq3IMVrbVkGU7qFI3GfupHiiSehedZnAPPJGc82mx2/L4cLz8Nr/nA21e4EuimyhEBILb3Yl2cqcNUqIjHiILc5NWWbLBt6LQqVYyOjt45IJ6sf90po1kMqzOQJry/MsqARG7lKf3WPtCm8OCsilG16PQ+XsGGSQrpa3nHgW+ej20dJnym0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNoQcNX/8h2HXIdZoQdMkHS3nWMo1hP+4h9R040dKBo=;
 b=navIxXMe2Zage1qWtK53l8IfMcxWPE3MYJgXtmf2n9nEbnW7wAKxZnbNrlRuN7HAHwYVtOYXkpRLPWAoFP/MEWbGx8OIpnV/pffpiB2SckCqRhABAWg4WzaCuPJ/gfdaP9DzCpH7v+afw2ub2F+qbax0GVz8wYP23PbQHFIORsO9TxFlzYVUJzFtF+fzNOaesOZNFhhefcIjK+UC46Senr7y1qkDqsicjDN1F9hHG5WQ1vIT+Qpxs98JeyzWeYIkJyTQqIOK5yCVrUgEptsA6GXkC2xkocZb1BZYZZ+q/V9Rc87thjYY21Nv74UzaeIY0u+sFt94qmMCwMIy/nvoNQ==
Received: from BL1PR13CA0123.namprd13.prod.outlook.com (2603:10b6:208:2bb::8)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:55:42 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::ad) by BL1PR13CA0123.outlook.office365.com
 (2603:10b6:208:2bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 20:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:55:42 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Jul
 2026 13:55:18 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 13:55:18 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 13:55:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/11] iommu/tegra241-cmdqv: Warn on a VCMDQ base above the 48-bit hardware limit
Date: Tue, 14 Jul 2026 13:55:07 -0700
Message-ID: <4e638ec1bbff46a358b4129e264fef66b4f37703.1784059577.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 271238e3-27c0-4866-98ad-08dee1ea4490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tJjNabNjscSLpvYQCa3nrMi6CVWxgbR6T0FMvHfx5MuD/y4J3zSqfVEaFcb02/tHGstBZ693qaahg2bU7mlalC/ITiCsd6DEP9OIBi+uO49XA/VEv55VxjZnqKKOYbuBqp0AVwVRfb9jCSEkDU+8duu+QCJTM0zPFub6j/HTcWuuSX/6FlYHovQyvh69jyG/OqIFjRc2nQGgqjeJIQUrVgd5NcUXU0HNWQm4kjgyZkQ+enGfi4h8hgz4sCMlt0I0KOkDUEPmYbWTEoh/GmBnY0m/n1d4QWl2/kQ2CdwOfEKZUelb5KD/+sJ7u2gCA2E/KUBIO+OKNY3xcVb1RxP+TGXzNExbYpV7wCgdvcDu51HGQhne6CUke7ifB6t7sZ9G7ek4w+WbS1uIeL1/9uDXVXR69dytl98LyiFBaqlCErKt0neJrHhTKxpG3LhYG8b1jOngWqlaykYTZWletvosSCiIq7pHyiC4n5gV09hAaBNfK+mrdr7atOuMUzIEkF7EWSrIKd3Nqv3Xmyl7BLN3Zk+VJjM0LVHv/xFgr1E6DCt19T3pqS3GC3PiCe30W9XgOlEmmDYMxTsORhhQ6+ZxxViNaUvictUtslkgGpbWctX+hTbo9q53kezJ6nBPucUMCJq6bX2Or7HOgogekpAeXZkXxZ1NK4rE1C9u/CD+tqy5zFzl+SL3xl2GR7LQecu+
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6GnS7NNPsOsaw/IRajWDpTyk7z7Xiw0ya/WHS0MrECARnEmjJl+hSKrAZRF/gIVm/BbSc5TLx92R51mixuqJb+j26Cx/8so8G/XbPIjJ88Q9Q35RdOxsOkml30/HgHKpKhIbLXc4vaPAbYPwZl2n8knz27LcwbLyYveXty17b8c5VOu2wqsopPmAXpXEvUX7t7kIkrqIbJA8bXOxEJJ4rWvzcs+INbI0q6/Sg6wZ6zOsg3MVr6o0lzqraURiRKimsYIPbOoH0ubPizORcbYDq34aqMypjBsDaCTorXHOMkdP2nWOYXx37yVtehY1tXmx8YAIIgee0O7cQ5reQVgaeINFgEBWfLZtReNlHf2HW0bR+sRr1iTFiWydsFnL2OK6ItnWSPHTGQbhp2SNQwQ8tDcxat82LlsXFyA9nO4OFp1oKFmUQ6IP2wnMulOdSVnE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:55:42.0203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 271238e3-27c0-4866-98ad-08dee1ea4490
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135552_469699_C011C2FF 
X-CRM114-Status: GOOD (  13.05  )
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

tegra241_vcmdq_alloc_smmu_cmdq() allocates the VCMDQ buffer via the common
arm_smmu_init_one_queue(), which uses smmu->dev and its coherent DMA mask
of DMA_BIT_MASK(smmu->oas). The architectural Q_BASE_ADDR_MASK is 52 bits,
but the Tegra241 VCMDQ_BASE holds only 48 (VCMDQ_ADDR), so the masked write
"q_base = base_dma & VCMDQ_ADDR" silently drops bits 48 and up.

A real Tegra241 never reports a 52-bit OAS alongside the 48-bit VCMDQ, so
this cannot happen on correct hardware, but a buggy or hostile hypervisor
could still advertise such an OAS to a guest. The user-VCMDQ path already
rejects a base_addr_pa with bits set outside VCMDQ_ADDR; add the same guard
to the kernel-allocated path, failing the queue init rather than silently
truncating the base. Use dev_warn_once() rather than WARN_ON(): the OAS is
hypervisor-controlled, and a WARN_ON() would let it panic a guest that is
booted with panic_on_warn.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index f93e59b7bd2db..d27ee215032f7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -674,6 +674,19 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
 	if (ret)
 		return ret;
 
+	/*
+	 * The q->base_dma is bounded by DMA_BIT_MASK of SMMU's IDR5.OAS. On a
+	 * real hardware, VCMDQ_ADDR mask and IDR5.OAS are always aligned. But
+	 * a buggy VM might set a mismatched IDR5.OAS for SMMU. Spit a warning
+	 * instead of a silent truncation.
+	 */
+	if (q->base_dma & ~VCMDQ_ADDR) {
+		dev_warn_once(
+			vcmdq->cmdqv->dev,
+			"VCMDQ base %pad exceeds the 48-bit VCMDQ_ADDR limit\n",
+			&q->base_dma);
+		return -EINVAL;
+	}
 	/* ...override q_base to write VCMDQ_BASE registers */
 	q->q_base = q->base_dma & VCMDQ_ADDR;
 	q->q_base |= FIELD_PREP(VCMDQ_LOG2SIZE, q->llq.max_n_shift);
-- 
2.43.0


