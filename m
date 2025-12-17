Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD9BD5C0C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1/2gbWY14USf/ZRRGMLw5BTrQhGRXHBzIduyjESg2s=; b=LdYpQo/j45+h7peb03ZadosiAR
	8xmNSbm3Wzw5rgNyPahqA6f/mVFWC8oZiwIviazY1SCSQiUO1uK1NA1nWPQw8Sg1mkOy06p66Vdxz
	1U0oe0yYk0GzJba4jzYCTZeK1SPcFhftcoca/EheS8vmCNb4iL4PdyZjilLoYI2Dy2W7/Tv34G11V
	XoenizETvkzQJ2H+2LDGl5uGV9BsL3SJxwrGNg7X9FVz2dHuIkw3QDPdFVkfhzG+sggfytdIVFSNX
	/gz8agRnQfJTfOtwx3zNMGtGGb1zp2+BnhkejtKwDmpEED0liBAwDDNCFcha6pgxsMG1cViM3AVYL
	ihLl6xjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj7T-000000069LW-2Dm9;
	Wed, 17 Dec 2025 04:26:35 +0000
Received: from mail-centralusazon11011002.outbound.protection.outlook.com ([52.101.62.2] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj7Q-000000069KD-3bh2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:26:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3cCzq8dOYLyuTB5FY9N1Be/TEsdBvF8uDmUW101VK+EpW6L/aCTJc750yl3naJfbAfDl76DVveo3MvXxv0Lr1IAmFgS4d2rDBSfJLoOqIwZaMLNDF2BDVVVrIYrBBscSWMOhE/xF+5yoBu3ZkUeLmfyPB60WpiNVNpIEiaSNG7RcXP1hTVaTJWzJxUdpILG5UkfBDdb8VX+MKyE1ZngN14aifLBI+RtcTs8svWcWXIfv+tvXanqU4dTt1RdM4ksaY93C+Ek8ZgLoupNEESaD74gN3YqCNS21ovXe4JeO2ypr7c4EbCbeYHTirHnSkscga1SQP1vhvVKSFB3id4Iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1/2gbWY14USf/ZRRGMLw5BTrQhGRXHBzIduyjESg2s=;
 b=icc67iEUJsrYuupKLdUM14pv4IwUEv78mYCplqrjL38r5YDPCsoWTOfTzAKw6eb86NUIDjcvoeMlumqNTO4OKTQWXCEF/nyqkXBxDZoH4PcA9HYx/fJgDX85OFndMNn5BlW9uzEHnz1NgO16ql5xP6L0zi8RRF3/aZJ/qB/32Sjc7o3OorCAUB0e3feAvj1qvIqqj+JMpv2CUSyEQcwXA7wFG3eJLJfcgX3Em1Hi1CkIT32GLyCoqB3C35jkrDoc157mRnF7eensMBor/JUaZiQH2XLVQyGuLjyFVkUEjkbAOs6DXM4PTeq4UHN2lzuh1zIH+Smpi/5qIdiaQea/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1/2gbWY14USf/ZRRGMLw5BTrQhGRXHBzIduyjESg2s=;
 b=FTaHfAUkHQSIgI8QsKxpppaVHe926bNN14YA03o5yvFAlMgMGsfiX8U6mIYtGfRhRAxlobaQuvy/TX8ZsPwNJKoRNWLsNUa28kOCh99HLNIVOpYG73dNplIBjUdce3RcpNk6J+cHypJgyy0McwAtu1rPtlaNUtP5Q/zxws/SeZh3XDQ9oq0cjUy7DnUcpOZoacqZJcIWwsyLKEJpmSoU6NG5gPtfK8IFHA7yhQRT0HVr0erUbIMtRndjaDL/xGT82ILdpZy9kvVQpqlB5NI1sdRN1HTeqbgwOnrwHoFSkiyr7NUxSAJ7+e4qkVOrE8OKAlIZxBM6Hpikig5gaqI+cQ==
Received: from CH0PR03CA0430.namprd03.prod.outlook.com (2603:10b6:610:10e::15)
 by DS7PR12MB6358.namprd12.prod.outlook.com (2603:10b6:8:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 04:26:26 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::6a) by CH0PR03CA0430.outlook.office365.com
 (2603:10b6:610:10e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 04:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 04:26:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 20:26:16 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 20:26:16 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 20:26:15 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <smostafa@google.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>
Subject: [PATCH rc v4 2/4] iommu/arm-smmu-v3: Mark STE MEV safe when computing the update sequence
Date: Tue, 16 Dec 2025 20:26:00 -0800
Message-ID: <83f991cbbb1331213aabe7c1fc5f725e79f60ecd.1765945258.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765945258.git.nicolinc@nvidia.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: f88b7b2f-a548-413f-41bc-08de3d24717b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8pZLNspOgx/QXBGZX+EkAQ14Pe+v3wV2oOqV5T+pyw/l0M7jJTBoVbrZnW6M?=
 =?us-ascii?Q?ZmWvx5ysCdxm6tXHtGB6M2qXyUjxIJWXq5C0PmQpmFbJBFcwrvoV3syF0siP?=
 =?us-ascii?Q?maXbOpI73L5G0JI++YW8j7wTjoc2DcStsnkrtvP5phOYRFayggWXgHY1isoa?=
 =?us-ascii?Q?rJ3QsZCXfbTH8iGUm4jhO5fWRsVuhSdPBrxqgoVskkY1C7zr3Pg9EUPVTYPq?=
 =?us-ascii?Q?R4B3Pe3gsV4PcXV++BQ71GKCl7ZWldr0GVjmEbsKEqLo+hrAxTGeuwWXM35p?=
 =?us-ascii?Q?DYdDkJky67cMdTonTlO0C1ocqttduvfGhE41HK+cQnvm92f77p1sORdYIB8v?=
 =?us-ascii?Q?oX7bU4Y+3B73cAQZkcI0CisB1jNIJ0B0Any4e4zVVzu79fYjfN987f5iTGQR?=
 =?us-ascii?Q?wPFgEQ+QhKJJKmt87LYTh4d5KsRvIBUjlHB1GBhhWIk5t8slVGPaeGyWLG30?=
 =?us-ascii?Q?dTmq1lVNSZgSlN/Y7pYDHXljZqQvjTbD4qhYmzUb/BuJAphDiGshOrzf15Bo?=
 =?us-ascii?Q?/IR5iZnf9rkPug6FuQrUvmD8gFH3JZfX+tRbIFWhUmE+dWFASVYIznTttndI?=
 =?us-ascii?Q?2eBAPEJnKMQ6Q1mxjzcLLdOz+/DfpIxtT88MxLaMt/DgI1hvX3s5gS1jcPmC?=
 =?us-ascii?Q?E30OWp3Hi72Ka68DK3keLcKu8iKBNWgdbG2tl50SaRjP6KMh0TsXHNlcxZc2?=
 =?us-ascii?Q?qkyg4vLRA04IlvDzzKi5I91K/TVN8z/BC4azTu+ra8jB5nIndL21748jyylq?=
 =?us-ascii?Q?QQTI9ZgBvG5noejJ1MnmTvfmNG3KGvqBtVjDFjpxEPkqfp1m95XOYK/DqlcH?=
 =?us-ascii?Q?AWgA27eJPuEal4yRZ5Tuyha4VHlPZclyoKZeDP309MYsoY/wpY+LUV6/NJf0?=
 =?us-ascii?Q?B6/1yyKgcaJ8Ibrnta59rUEtrDY7+5Mt+cFS/ImkbNZWtKOIHp6uXHERSagn?=
 =?us-ascii?Q?PWydhq54as4iP3mL9lm431WeEYmwtKWEOfR9LVLN37i4SCOAR+ywgZuW8Ifp?=
 =?us-ascii?Q?3VirRG9C+jarqJSsYSvVU8qrKnk1oNNc6riPRZUnkiDvSvNKyGQeWVbeSths?=
 =?us-ascii?Q?EIJk0JiAYRLxFcDGGGEknsV/21y5IZOKYE0FWxqLUTQhUbeYaWXYm83H+32M?=
 =?us-ascii?Q?3YrBBaPYWNVQQJ4Hbw0XqqkmTKrttFdW5aqkbOPEl0XQjBc1t/7C07D2Qb3w?=
 =?us-ascii?Q?I00bcTddQGRpq9ynYcWdCDmRgwGrILPim6E5KDioSweKklZtfR3jDqz9k+i0?=
 =?us-ascii?Q?tz8pkIpJJfJaSBkz71zRANnr6LPW91x65mREdMnYpWxF/AN9ysRvtYHJmbTh?=
 =?us-ascii?Q?l+TXUkYpl1w42Rf/AmiZZOrbtNYNOPXOYFwGrSUX/iMLjNHYcuX0goH2Vt9U?=
 =?us-ascii?Q?qIYrjQQl9GF0q5Vda8nPnxYD469oX79TooG0jMlpdGqLwDKrcbZl8M1+RfE2?=
 =?us-ascii?Q?DMFnP7njCazHregcWP5uEfyt9nRcnaxFoZPlAPIhB5xedG6rn6quPGilpwVT?=
 =?us-ascii?Q?J1NmOqzMmmKO7QLiD7UA8kG+Fu8UBUrdzW1FxTKpLlcj0XI7G1JSJ5Hhqj3L?=
 =?us-ascii?Q?EVZpJ94cH5O1u6rWIo4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 04:26:26.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f88b7b2f-a548-413f-41bc-08de3d24717b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6358
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_202632_914963_CA7CC4FD 
X-CRM114-Status: GOOD (  11.70  )
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

Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
the hypervisor. Since MEV is in STE word 1 this causes a breaking update
sequence that is not required and impacts real workloads.

For the purposes of STE updates the value of MEV doesn't matter, if it is
set/cleared early or late it just results in a change to the fault reports
that must be supported by the kernel anyhow. The spec says:

 Note: Software must expect, and be able to deal with, coalesced fault
 records even when MEV == 0.

So mark STE MEV safe when computing the update sequence, to avoid creating
a breaking update.

Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8dbf4ad5b51e..12a9669bcc83 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1085,6 +1085,16 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
 VISIBLE_IF_KUNIT
 void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
 {
+	/*
+	 * MEV does not meaningfully impact the operation of the HW, it only
+	 * changes how many fault events are generated, thus we can relax it
+	 * when computing the ordering. The spec notes the device can act like
+	 * MEV=1 anyhow:
+	 *
+	 *  Note: Software must expect, and be able to deal with, coalesced
+	 *  fault records even when MEV == 0.
+	 */
+	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
 
-- 
2.43.0


