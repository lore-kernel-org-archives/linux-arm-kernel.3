Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCFCCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCK6PM50QWujymmPTS5vOZevTPh0u9qW2gkMPf3MzkA=; b=TyRd4K6+2Z8iaKc1QPKTdIHHEI
	AxJPaTT/wLL4YwVauyHKIdtySuoAovBcqv9lbfcUXefbXqO9ZEWEk/eB8nk8YKzeLTzUYERN9mySU
	4ionCDfyb+mmXis+YHDabustxlQCrG0Hzhvdbsaj919KO9Q0696vTRg8kmHsC5Ss38kYiLxjiKrIZ
	iDFB2pJRSB8Ln0I9IbzoI5O6N5aA/AnR9YzuwFGkEGDvDvWinQt994MB9gmFXv9kp1W1kUcZN9fNX
	pLM2xQFJ53nCf2+G/8jyVa+SDO0hqRA2jOwgtGCRcAfOdX8qaCdWu5/fCzLRqdfenzkwLu5oFHp/K
	1niyWtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OCv-00000003gbA-0a0g;
	Tue, 30 Sep 2025 00:27:05 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OCe-00000003gRS-1qDD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgzAY+0MCgXPEUveI8xxRI1r02YMYG6F1bWRfqSfoRqNxrpMe/klZ5x5R6cD3ZJvKfm9/fwiGoL/tjO+8M/6HzByOWXguNYryafHp4G6kFlxbgVO/Jd0+wPVyPnmjGB+zLZP+Dxu0qR911U0MgUl2JzQbmprpHPhLt4aoJ6bgtan5pD14wqeaeEybbOE0XMhV/PfO/DUeZ9jR9hCqxzc+dGmX5pDhwj/ehYzKMxM5+R/f/Rxkx+A/v09vsOcWvz0sJzem6cdz79NK3s0UlXDwb9FegeOSU4e+2mbNsz1m8aWyMCeP9sGvZpl8pLhYVXQ0fpjAblsaPJ5VfCF7TMoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCK6PM50QWujymmPTS5vOZevTPh0u9qW2gkMPf3MzkA=;
 b=ILg61L9eIW8XhYuvxtdeP1PA+i+0jkGNbsZlJ6Y6nbasXx+JqeO3kGSEJ2cwl6YnicXzG6D7HTzL/WBVR07/2OfREW8ZQtXYGp4LdrVYrj7O//n4Txq4fk7OZSa1foPioLneE0NjjRWjF5EC9XYqnTbbzvKsnCuemxm5mF3/MKVs+WNiDLslkyXvCzgYyfXe8MWMY1w+QBrDfLyjfFouTUSZw1cvvlFmBm7FlYOXE19Bc8FuE4cAi3y2EOvVGJeaZpr3PLI87m0m3tDh+KrJWWbUzrhEU0i+MnWf0wzbH8E0k8ZIrP8HcjC/bMZUm3n3zHv5umgIMXtdD+EG/B4b7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCK6PM50QWujymmPTS5vOZevTPh0u9qW2gkMPf3MzkA=;
 b=JIT79skWDQvCVuPDRHh/H1wzzmCVQMsIp7dhuaGQCTwPhzIj7IZjZNUJR9IF1oTWqgye2obIyFMjho7rzzJyOixQkIxac33+KTY+CU3x5/EMWkJg1Lr/xBuZumgKASW0Od2hfA894hzoyyrvSuZ/miDOMRWtRO3reBG/w0LFU5leO1Bs0KMAbM5edHcFfu6Z1a/Ui5NGYMG45Km+hkF3SNzhEOyTXUlDvvR/ZYNAVqwfrS8AsNEOWZJpPL6GpMBvMkLCSTzxmzr+gL/CD24Kh5NVYV/coyoMa1zO1zsb9mzeNnPoj5pKo6A1TLLsz4c5t2x3JXAHZdUO9iUc/DgDDQ==
Received: from MW4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:303:8f::20)
 by PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 00:26:34 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::e1) by MW4PR03CA0015.outlook.office365.com
 (2603:10b6:303:8f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 00:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 00:26:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 17:26:28 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 17:26:27 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Sep 2025 17:26:27 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <bwicaksono@nvidia.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>
Subject: [PATCH v3 4/5] perf/arm_cspmu: nvidia: Add revision id matching
Date: Tue, 30 Sep 2025 00:26:03 +0000
Message-ID: <20250930002604.346306-5-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930002604.346306-1-bwicaksono@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|PH8PR12MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 12eb92b5-b163-4ce7-188f-08ddffb8027e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7YRl6Vr9HjOIFMuX8qjttZjEQR4eur9TdP2644lYJurRatOUs4gaRkkRRkHE?=
 =?us-ascii?Q?W7KVcQs1JmWAIAN/SgLgoqTO9xJ0u639lOiAWQb2vs/c5l29LOuGmtgzTZ01?=
 =?us-ascii?Q?97A2JippLfymgYPChwVaP3E3EXisN3luIvidIPDz2y1uEBaCGSc3FQU1L/Y/?=
 =?us-ascii?Q?8sG1dqs2wGT4ZsyfvXRNpfpFFlYPvGb81US4W4KzTKCuRwJ/ZgCSa3q3mDCm?=
 =?us-ascii?Q?RqSjnqZdapsLH+iuFyJLA1LRjd96syIrU9wk45tZjdzOK18JlCMdIKuByut6?=
 =?us-ascii?Q?4HmfgVXRVpoJOBnBXZWasEM0iATe+KOyKyozUS6qh/L+Swf+hTICv0u6uFPY?=
 =?us-ascii?Q?2lFgn7vmRToyvSxabCbTmqXWx+pr4upXruT+PiTPJGn9UhD+rOASfqaKXjCN?=
 =?us-ascii?Q?o+gqvkrOV2OkAn2K0/KwaZiGCqLmumgS+IzBlBqB4J/Tzf8hNtFr2Wbj4IKT?=
 =?us-ascii?Q?7MRW2rsUdh2S9L+gSZjRQDpzSDsZMt9Rx27AllgJbBMGIgOreUx3AAJtvg5G?=
 =?us-ascii?Q?4CVcIzHozHeUdffN502UXBn92a5evl6cFLIqWJm4X1S/gRfIkpesO3z7Me7P?=
 =?us-ascii?Q?NLiGKnHet/jJ7Z0BZHJhA9DG4TDEmx0kSJLG/pI0CYvGCFvf01/RfbXLsZm0?=
 =?us-ascii?Q?cksHtU3TmOB1dK3amyWcqAwaPyWd6tWdIKVO+mgb3DYe0gNVAboy51FxS3eG?=
 =?us-ascii?Q?D85Y8yKje3CiqI4piWyxuOT9w0NWZBk8O2y/H0PMHicYxBz46I0remrK62ut?=
 =?us-ascii?Q?0GxQHVMTiNbKTk3mjUlDrKH+9k6PESSOwcOR5A/Hdbnxt7Q4axuQurb0RtnE?=
 =?us-ascii?Q?tW71bHmKpDYtemuILHvVaFJCKtbqikDg/iiGwEc0Xj57T+K6XwqrRH4aOA1/?=
 =?us-ascii?Q?YC8TsGFY74cfX2rsO3Ymc9AUD/4UgM8Xv64wQoguxjara87uL2gAP+2g95Ap?=
 =?us-ascii?Q?UksjeHdHCw3q18u1E5kDNDmgFT+RDGLhSzO7m8nDWrHr6ClefTXHFOEfC9Sr?=
 =?us-ascii?Q?xr5Zgph69MvGNguL3HXWmzThlu7GwhISV32GEExJx+zob7o0awXr87mG2fWL?=
 =?us-ascii?Q?NfbgdHt0067kBVfq/kIoF65Cb7hBc36hZv4eXqugYv6bbBFsMp1fa33XlaPL?=
 =?us-ascii?Q?R6QWIFucqCfC3hrVMpngIIA1vVfa/L6kOwPMC1n9chmRvrRUW0fMS6LFXOqk?=
 =?us-ascii?Q?6wlnaz52AwYG5Rt6X57GTQKgrDiKQbXKS+frVoZhXdXk71mEudcOn0JHhO76?=
 =?us-ascii?Q?OdfBbFPzbhVwMUs8zApYy+qURwOfZE4RHZiS3in4A3AexbXS24WLP+KPQV+B?=
 =?us-ascii?Q?TDUPpFo6hm0IPGxbuf/JEQhueuCnBrd4emjPh4s5By6QD5zgHo3d/bmmi9hF?=
 =?us-ascii?Q?AdAI6xJlRYTL9cE4FZE27NX+w4FkBs7m/wiJEoskHs6L6Wc6C8RQuoA1WAuJ?=
 =?us-ascii?Q?5kx6wmYrGyu/vu1j9h5OzH2HFgwKFRUYPDeSt0Co8Kspp55tUBwmidQXvVO+?=
 =?us-ascii?Q?+QMXJ5OTTJvgDOnCO0a5QDLtzSbGANjQ/nrFPkb/HQ9YNNMTkh0tAbqcXhIZ?=
 =?us-ascii?Q?IrJKcKkMeUJXYx0WHoc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:26:33.6449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eb92b5-b163-4ce7-188f-08ddffb8027e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_172648_484446_548445D1 
X-CRM114-Status: GOOD (  13.16  )
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

Distinguish NVIDIA devices by revision and variant bits
in PMIIDR register in addition to product id.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index b6cec351a142..ac91dc46501d 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -23,7 +23,7 @@
 
 #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
 
-#define NV_PRODID_MASK               GENMASK(31, 0)
+#define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
 
 #define NV_FORMAT_NAME_GENERIC	0
 
@@ -220,7 +220,7 @@ struct nv_cspmu_match {
 
 static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
-	  .prodid = 0x103,
+	  .prodid = 0x10300000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
 	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
@@ -230,7 +230,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = pcie_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x104,
+	  .prodid = 0x10400000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
@@ -240,7 +240,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = nvlink_c2c_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x105,
+	  .prodid = 0x10500000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
@@ -250,7 +250,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = nvlink_c2c_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x106,
+	  .prodid = 0x10600000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
 	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
@@ -260,7 +260,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = cnvlink_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x2CF,
+	  .prodid = 0x2CF00000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = 0x0,
 	  .filter_default_val = 0x0,
@@ -312,7 +312,6 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 
 static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 {
-	u32 prodid;
 	struct nv_cspmu_ctx *ctx;
 	struct device *dev = cspmu->dev;
 	struct arm_cspmu_impl_ops *impl_ops = &cspmu->impl.ops;
@@ -322,13 +321,12 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	if (!ctx)
 		return -ENOMEM;
 
-	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
-
 	/* Find matching PMU. */
 	for (; match->prodid; match++) {
 		const u32 prodid_mask = match->prodid_mask;
 
-		if ((match->prodid & prodid_mask) == (prodid & prodid_mask))
+		if ((match->prodid & prodid_mask) ==
+		    (cspmu->impl.pmiidr & prodid_mask))
 			break;
 	}
 
-- 
2.50.1


