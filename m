Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B318C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=llMBVYyX7cwtZpXEuQ7Kx7f/0PrrkYEMPEFSnOzdNic=; b=gVe82vx293ZtxJJi5SyYXZmUmL
	t7tXPRrcY//8aCh2awhZBvDUEUYc6uBQhwYpKqwdjsvCz7SwrMeMCfNmSPzyAf8T82SwmnzC7jCXg
	noHyfA/XP/ACTzLUJjZVylEQGloukmPFFbUgxIIaLfusOCJKxTTgu/pNT/9vEGA7fMLmlTS4U/C7a
	4jYGdGijy2CgAHZvaCfw/nw9Pi09S29VK4r4PoikMJ2DOfTdr2zLjbVCqAVQ23KVA+oSNUE5SFCyv
	rTg9Zu8B+e+Y/vZ9F6e82rqj6uL6H0qrKex0/L6BGQuVlCssVxC+ybSweTkFfvI516LPN76to6yTQ
	s5U/P/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCNv-000000092Uj-1Tvg;
	Wed, 29 Jul 2026 22:04:19 +0000
Received: from mail-centralusazon11010045.outbound.protection.outlook.com ([52.101.61.45] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCNs-000000092Th-2uPc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvAWSViPSaFBVhP/0uEsEOCHLx7cH7K8/oy/Kf43zNrIrX0fvTSQRbSGgazVtQNFQLbLj+Fh+ZXPOf5jcr4eCtqVG38NxQQ8dSdvQvAyVPAEOnsLWVyr5/iqDIMiXHWQ68H3ij+2DC03UkyxEFjrsdaisntqi6t3/JRch8MsB/NcF3b8mAm2n2VNyalMXuczGX/DzlWGAihDDORu7n5z8dKcQbcEMPeTWS4Yj8NZSQHs0Gz7wL22lg4/X6t7slWQIjdzImG6QvaGGL7ADjSqhx/HFyKn6O6HwipvTur/VKW7/nJoKaXsaLMKzUv3Zq2SydFpJakW61nUazbctk78Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llMBVYyX7cwtZpXEuQ7Kx7f/0PrrkYEMPEFSnOzdNic=;
 b=x8z00roLw2WSaubvKpSg0GrowlP8q8yeRcDtz5u0ap2MSh9Mwkk4cQVGv9udiZuryxXfYwOkkPbtklgnEop7Foipr6DiaRf6a0XPI11kKj/a+JthDrUSlczxZZ1WT7j5T2OXB6hK+aPXquUoCJFE6eRhS3h8LttxzOJkQaX/XwdYxenMx26GIW+HhuIfANoc7I6cgz+izT1rIRwSBDfoZCMM8nTN3Xd+7/Cp5FTZreeghZ1Ga5oQ2bnQQoe62QIKun0Sj+c5DEf9svI+OX8EPc5LcdDWb/4x2IOftt22wNG4o0PIpGzx/MhWjOcdfIK9j6lEXL4jWH4xNfkY92XKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llMBVYyX7cwtZpXEuQ7Kx7f/0PrrkYEMPEFSnOzdNic=;
 b=ikXfjuZsAe9ZmfAHD3uQrNOswadHNU5pwY0eWqKmNIOgcn8FTwARGqo/iBtu9D+6BHhaF2tkQVZGLmIUCbIKRooiT4b0p/6wCKbHsVuB6wtrrASQ/P79e8rPlIXtAW07qimPQM3na63YjPz+Gppa6ZQNs1qXjNcJpbBoe8kVHpxpfP1EeMdJVucdIAEzJnKA5SB4veOIoxhl0kksWWk3695169v53ey2f+spH8EvdM2Lsf6M/44UsDS0sqiI36XcQ7r4w3u5YFFBeDX5sgsUj57xVPltxDjDQUPy51JJFx1fgXhYmwW4zhsofn1uoXYgTb5ncTfER+LpQaMq5LOCDw==
Received: from CH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::26)
 by CH0PR12MB8580.namprd12.prod.outlook.com (2603:10b6:610:192::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:04:00 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::68) by CH5P222CA0011.outlook.office365.com
 (2603:10b6:610:1ee::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 22:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:04:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:03:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:03:42 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Jul 2026 15:03:41 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] iommu/tegra241-cmdqv: Reject a VCMDQ base above the 48-bit hardware limit
Date: Wed, 29 Jul 2026 15:03:29 -0700
Message-ID: <20260729220329.805417-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CH0PR12MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: d42c50cd-c114-4a98-c5b5-08deedbd4bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|10067099003|11063799006|56012099006|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: QhqchuZaeZCGVvjjCUcD1rrVvkqMFq0n/cLW21KoRrVUA5J3WVFM/L5e4XoXtzqtqQZiwq7QivgK6BWszT3Helucs+GyP+5uztWTRI5mrkxZieyQHRIJDldsRogVqPhy2fAsWn6GuU/R1q0uTELwcYaukpXywmKuB33nGk4pQfbVRAAHf8j7tlqsoHAge6VmHPhWIptPOYyY4rQ7qRz63bpBmAl/oYUXMPiKGW7vgs6eYLaeR5qZvQvmX3F23QoYLsRakMkHTmQfvZ56HrM0jStYvOURgTtqRCEahHCVCtdWyODSTIL4h/YcRQcnGbWyJ/p2Ota0x9iZU1UrO1e61v2S+lEsotdAsYwTSxp6micr0ThAEryBN20NrKqxtbgNuiCggQQDcnEaSDKOZocBl0yO1OgdEOBcQBNi6bsiD2t08nv1iWP0ItPgyXwhWyfUuHswNsmxgGKe5yzTGN/7NXQynEoUEoz2AY2kKirEF6YzBe6fHBq1lEmtbsgYF0b/YfejuJvJSD1T6OPYcvn6+Aq1/Ww4snFa+bxRcDqQKygd/womLnUbCL7eb9TxnidLvArTrx+liFSPj+jmY69OKPpl+e2VZWonOkPvONKTX9LVuNj2LZTSo2cFQ2FjauBWTlkjL1tAYLQ162nrbeRQ3nE09S3j16eR1IoamXuTw0hnrb53XMHNcbzwM0q71vZL3OqGSJtQM1ZzKempQ5Efrg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cut14ckjEIHEU3y1wqUyOzjkjlu8wzgTL5UtJl6pDCoLZV6TbvBrfvP+zD8VcyE8FUOoL1e8v9zL6Ao1i2JUqXdNgawwV/TIpgH0QTqb9rdTDcjj2XkrPJpl+N3y/FN/Pah/HCUf4Zbmbz06rxPWcWPvn/1qmeG7KkDW3+4wbAiEt/79xRoODYJx7pPGxWio6ur3cR2mtsZR5xxfe7ibNEvTGe3hgbpKCYqyy4+jEvHoAAag4bTfSYJx4BQBXOfHP0IqF+DPFOj/3qa7DZpPTepNOlOOzxeLqVxtCIDyLISedObsIuPsujVEALnKR1KF2pFOt86gl8Zmzg8iRFebKMNPzynwypbjIxDYiOAD5xt2AfweIJq1V9KBweEmXu+pnq0n5umiJ7YA9bWdxaAov0gY/mYLg5gE4YSasNVxfp4KLzcKqfo1sEIrttoyACWS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:04:00.6452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d42c50cd-c114-4a98-c5b5-08deedbd4bb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_150416_780622_5ABFD1F6 
X-CRM114-Status: GOOD (  13.92  )
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
of DMA_BIT_MASK(smmu->oas). An SMMUv3 queue base holds a 52-bit address in
Q_BASE_ADDR_MASK, but the VCMDQ_BASE register holds only 48 (VCMDQ_ADDR),
so the masked write "q_base = base_dma & VCMDQ_ADDR" silently drops bits 48
and up. The HW would then fetch its commands from a wrong memory location,
which likely raises VCMDQ errors.

Real hardware always pairs an SMMU OAS with a matching VCMDQ address field,
so this cannot happen; it takes a VMM that gives a guest a mismatched OAS.
Nor can the guest rely on the VMM to catch it: an SMMU CMDQ base keeps bits
48 and up in Q_BASE_ADDR_MASK, so a trapped CMDQ_BASE write still carries
them, while a VCMDQ base goes straight to the hardware and loses them.

Reject a base_dma with bits set outside VCMDQ_ADDR, the way the user-VCMDQ
path already does for its base_addr_pa, failing the queue init rather than
silently truncating the base. Use dev_warn_once() rather than WARN_ON(), as
the OAS is VMM-controlled and a WARN_ON() would let it panic a guest booted
with panic_on_warn.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---

Changelog
v3
 * Rebase on arm/smmu/updates branch
 * Update subject, commit message, and inline notes
v2
 https://lore.kernel.org/all/4e638ec1bbff46a358b4129e264fef66b4f37703.1784059577.git.nicolinc@nvidia.com/
 * No change
v1
 https://lore.kernel.org/all/0dc3a146a3d274d7c47e525385830343cea0f675.1783054570.git.nicolinc@nvidia.com/

 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 6644075c1431e..664aff9593de8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -672,6 +672,20 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
 	if (ret)
 		return ret;
 
+	/*
+	 * The q->base_dma is bounded by DMA_BIT_MASK of SMMU's IDR5.OAS. On a
+	 * real hardware, VCMDQ_ADDR mask and IDR5.OAS are always aligned. But
+	 * a buggy VMM might give a guest a mismatched IDR5.OAS. Spit a warning
+	 * instead of a silent truncation that would make the HW fetch commands
+	 * from a wrong memory location.
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

base-commit: a86c36163c9722545d27e92bdad8418fdcaa8b1d
-- 
2.43.0


