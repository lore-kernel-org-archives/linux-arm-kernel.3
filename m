Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDCFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYjxNYVwQUH+tnwHGdXumKGXm34E00c2T8jSHKpsEzQ=; b=Y1Qg7R2uyryyiK55XwChmoEBCu
	gxHnp1ZKcR+563h1JsVdUvwfjPaOfc7yxo0nWht5RKC/CRWZaHInnqzK5qG4UHfQvUDXckpsC3r6P
	rJLQR766t1F2sZeM49wQrhgL8O1KAXi8t9iRiF8lfPZ9TScp8MbqJMSYLEgKOEBmMDWSsvtA3SO5m
	I8WkoyWS7wb7cIGOhw301jOf6N3nrOziFJXXlpkTo2leVMzVy1Ru/afAtjXtMRvsVn7DsCh6p1R2Y
	tb0XSR16wUGI99HCONj+GjkdIN7VNzcVQ9zBI4u7rS89rfkVdQxVUOnWwPJYIKR48BsWziaOC7O+t
	HlzQrIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlUx-00000001oQq-0HaG;
	Thu, 09 Jul 2026 09:56:51 +0000
Received: from mail-westus3azon11012039.outbound.protection.outlook.com ([40.107.209.39] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlUt-00000001oPd-2W7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZO7POv29WoJGOOCIGKhYmJbQt39MlIEQ5yTNQJzRnFm7BzBeW4rmK63Tqw0uGxgBpNxezHBXW1WqY9guJUCGazivJ5ipu+ELSEZLFYRRtCmNm+2BSd/w6sVolrRvIMAc3jSHaWuyKAby8eCN6yhlAZ0xDy85F/aJB6Q/tiUfPxnrsb9R91zHYTZmXMooUPhR3zegttmBt5+vciTIR7kPCLDr515LStHzGLMkZ4HBQfuSd9mlfaURuctmBp30oNonlvNVAVOkBRNSLgnLOShWX+wf4PV+SCOpEcgH9hl5kNKUWHRuMwGYcVx4n8ESRDBW5RQA2bABulVcqbIovt7dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYjxNYVwQUH+tnwHGdXumKGXm34E00c2T8jSHKpsEzQ=;
 b=NUzWVLXXKwEYo5RZr6TqdIoYgSGHg5s4XDWThrbMz/EhNoo3LfjpTSOWv4xNfIq7UqBetgw2pwz/piFEOVVQK4CJ+WfbUK03K+r/mMKz4q4cUSfgU/yMMrODU3acdhYN1Ipc26Ad1vANNFlggfe1F0EkSPeRDhfOvtF5C910KX1SgfazEI6bvSfhL3cCYYukBATw1XgxXAsQxm5PdyVXyMA02pZCwnVIhI5KWO7DSxuGx+eX7Nzag+dpqAcYAOqtDHzFjS0fF5sr1OtWnhlBDE/lmR8js/8bprKgDoe6zu3SKQ/Im2CBL7FLdnK91rk8bzPPXw7PFiCZHXd5h9Oyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYjxNYVwQUH+tnwHGdXumKGXm34E00c2T8jSHKpsEzQ=;
 b=hp2RDbO0MrRRASsrNu5aloz7FoRxkCwAoFKO6daXe/6l4ZcZ3Xsz2hkXuLF79Lrh3mpPbEl1g6j7/FS8nuKpC/BHtjIkjC6M2BZSaW6BQ4fpbu765oKBR3dmm9bUY1qWFM6awKiiXBnfYOQKzSI+CV+PiqDaC69t+wdSn+tp6CVrY6oRJqe0K/7hCnD1lNo397/4hrDkiASpqxsSLm/qBZma8cqAuf+n0WXWRWu5kg4hxFZ0K+wlG9oorx7shZ4L9jR6rNGpqnYhBAgNJ7F3Sl+fUdwx6NSw87W3TQTMhGoSsdzrek9DeNrpCzisho12y+OZpLFCQV+g3SikfsNAJQ==
Received: from BY3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:39a::7)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 09:56:40 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:39a::4) by BY3PR03CA0002.outlook.office365.com
 (2603:10b6:a03:39a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 09:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 09:56:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 02:56:19 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 02:56:19 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 9 Jul 2026 02:56:19 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>
CC: <linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
Subject: [PATCH v5 3/3] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat workaround on Tegra264
Date: Thu, 9 Jul 2026 09:56:09 +0000
Message-ID: <20260709095613.831769-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709095613.831769-1-amhetre@nvidia.com>
References: <20260709095613.831769-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0faed1-7e75-4109-874d-08dedda05f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LlUdCzaWDsKVIIisUyKfDLJxzNk+ZEtbFA5KM1o2oe0XprhKFotGXn/5A/1Ohv7OpkeZQGaYyP5l1/3z7oP7fVu4NK2EsQ4NrYo0/AnmSOOHAs1bxARxvWgneY1jZ+9QRzFrhFsROiD61ggh4RYtrNN8GIyc322YDZOXSlML2wN5uhGBBY2H6lJIu9IrUigc/W4luSkGW6I4FnPCiCLrPNCSvfeku5PL0vvw3H3w6k7PJ+HLwPu4Gbq9MZsJ0yDFTs0JvZlINMGqzWhI2U6ST02cu3sU+8+PncEmYz/JwOk8vlm7H6pR0eT4uuZGvI+UTzolAEAJdYDZxR6RoQHsgehGcScwu33xu0vop6coE6nH0FRtpx0+VdGsgD9z/+A6nKRw3FOw9fCmISmJqHB9+UGm8MAPbgMKWoCcNtDijSAOoFl8WLmhQqmPKvz+q5ajlP+81dC0BKNokp14JJOGq/+DE8TtLOqOtGSAJWtKJrv26hJjFklH5V8C8F0ZN75QsK9RgEGAApVVCG5AMc791ZozAqJOLc+yE8BGhHdKSWD+wrWheZk4BFprBsE4ZRbnAFf5LL0ArA9LsaieCcxsEpXLNZqyZfsmAPWTmyFEUY42AMlawxx2VUmNbmXyyJ0P4iLPOyqFH89D3F+vFSwmzPKjNJpkmWBSNPnPkQEZh3wSGasNUhUeJD4LpXMS/9VDWgHPYuteKjFwlilaJyYd7A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZSQqVpa4/bIlZCn362OQMpjyMNG+Kem0sPOyBpaSVS7wWKcRiX1m2r2u6aazl/m8ZdokmwF0LH+ObsaqnJG4XbuqpIESXspFJiUKtoZCp/HM66owJB+IsScY2MuCuR0ze5mv6HRJshr9Ftxk7fK+Jzkvra3GGF7b4zo6x3VLOh/+jIUddFeOHNy7AGFGRCgti7xRjKw2oIVHGCbfZyEwNe794pqlnDAVpK2iTkYoJI4gRZC8U/nSxztVf0K0u1rChG4TX/+TFXK47tULFcjl7ziA0Nyj5pRe/Z18utqfAf+QmC4rryvGzQZFkUWehTXgkaN47kagvQ9Ve9C1h9rz+Uylyh6V/qckaaTkLcgO7LX7Sg0k+c0goN5SBpcqQazjvk3tadJM7VTzLrqx2V1n+YpnuD0Dw8SU4OVwL7XlFx24LNnsYcy+X/cDBuMUdHJ8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:56:39.9374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0faed1-7e75-4109-874d-08dedda05f9c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025647_640490_63A46893 
X-CRM114-Status: GOOD (  12.80  )
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

Nvidia Tegra264 SMMU is affected by an erratum where a TLB entry can
survive an invalidation that races with concurrent traffic targeting
the same entry. The hardware-recommended software workaround is to
issue every CFGI/TLBI command (each followed by CMD_SYNC) twice, and
that infrastructure is already in place behind
arm_smmu_erratum_repeat_tlbi_cfgi_key.

Neither IDR nor IIDR flags this Tegra264-specific bug, so hardware
detection is not possible. Tegra264 is device-tree-only (no ACPI/IORT
support) and already has a dedicated "nvidia,tegra264-smmu" compatible,
so DT-probe is the only viable detection path.

Enable the workaround on instances matching the existing
"nvidia,tegra264-smmu" compatible by calling static_branch_enable() on
arm_smmu_erratum_repeat_tlbi_cfgi_key. Document the erratum in
Documentation/arch/arm64/silicon-errata.rst.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 014aa1c215a1..076b3947d259 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -312,6 +312,8 @@ stable kernels.
 |                |                 | T241-MPAM-4,    |                             |
 |                |                 | T241-MPAM-6     |                             |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | T264 SMMU       | T264-SMMU-3     | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 15b9d0170520..edb7a5d38cf9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5331,8 +5331,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
-	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
+	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
 		tegra_cmdqv_dt_probe(dev->of_node, smmu);
+		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
+	}
 
 	return ret;
 }
-- 
2.50.1


