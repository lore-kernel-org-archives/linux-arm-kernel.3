Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8430EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtgTRTuU60x+Hd+B/qOV7OnLJCMslrkYEzH1AX8bT3U=; b=tQae+zdYtlQGA9wLX6nv7o77lN
	W2YX+tCnQRUC4QKVIcGjf7DxkVPmhkxrFaAGLeS8W2OLcAZpAsmxX2ulStK0j4/3mp7R27BXOdMD1
	hQHGt9jXITZA8zygH5oktaEX5tOi5OddLmjChvDI4i0RXJvEpaYYeRJVpyLdLnaWo/NFwLYDVhRRf
	JRced33+fKYXVSk4YOn3n6D+0tS5hTvKxLTQFSFT0393Pj6eNUllW2TCGBEkIawyNhAugsFTdHuAH
	mt18IPST1rN7DQxLvwQiyfLPXZtF2SZqeJdvGCnxbJBWHRr0VPnJaZld4yT34XtZtHoqXUqlk8WWI
	vVnzzx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWVk-000000064te-36Tq;
	Fri, 03 Jul 2026 05:32:24 +0000
Received: from mail-westus2azon11012009.outbound.protection.outlook.com ([52.101.48.9] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWVd-000000064kU-3vAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:32:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpfsgXbewFbBy81qoUJVmQmEjRJDwDNxcVWduEhiBg37GrdanfZyHRkSMk7E+sTvX4KSvdb1TEGY68fjpGsMp032/6xf2UCTgATYZK0X6g4sc1QPR2vBMCI995PFimnt7YP0CXp4PWTh9zXnYbIEkq9X+sN21wNvR5IIkfWjFvmyo/lPraO/shWRCcyaMqAcIVx2GCcLWE+pMmxM6lGDOu30/nyL+0N2qtFF4s9rUC3Mn9VhmZeZOWzSE4poFwlIhyH16QqC1UHGL32lkslBAYbxa7R3tmQHETYRvigQ9YmJZLSsXXjGd52MZRKhk8PHcjXKwWZc6AqZwi0mNWWqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtgTRTuU60x+Hd+B/qOV7OnLJCMslrkYEzH1AX8bT3U=;
 b=EB6srsM7bwEqK8Zx9wDo8vFtyJC5Bf49mgK1H+OorZCCGx+Qg0FypcmGsriR04ZI7rK4EcmG5xNjeXd7AXds6HUrnQfjzGL3NUh3zwQ2gWLc5LB4FtND9ov0pTdQNiC6QsggJSF17/vKq/K6lhFOlhQWiI0YXr8zv1IBItG1AUYQgNQupv/VJBGqHquZ3D+QNbSt2TIAe+PNZbETiw5qPObigB0HVHjp5b6pf0TMtAsaKAfCElS85+8DX/rULebfQmuXQVsQe1PibtZseY4o46Ve3j7ArNZH80ev54kxGOvj1c9n9VpxGzb/TFbaNxrQA9rgz93kUYXIDgemVNhP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtgTRTuU60x+Hd+B/qOV7OnLJCMslrkYEzH1AX8bT3U=;
 b=I7xlSFB0OatBq56G/7Bv1PuZ2ZwQ2ECzyIeAgfYpSaUSGaGTrAXoQdCIk6byoXsPUKD4fBdZPAKW5VqqbND6Sbf1fvA3RopVWerRUerOav3Urfw98EjPrWnoranSzn9aGRwBATLYeOE8a7ILhRNOzvutseihb6xYe397Aor4V5DVOIQzMzHNQsGbbzYbGHQdQBsQbTdKwDNjhqZYI7p2bhW79H/jtmassKhwkpx3H75gqW+sbU34gvxOIudMI4NYA8EH8XRTk4S5zokkTOGDn6rt8iHyrmZWlfOfg78kw+8CVBuDQpHtL8aMddwmFHnpSUXaliZ2mGDbeKXzhxXkCw==
Received: from BL1PR13CA0231.namprd13.prod.outlook.com (2603:10b6:208:2bf::26)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 05:32:10 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::52) by BL1PR13CA0231.outlook.office365.com
 (2603:10b6:208:2bf::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.3 via Frontend Transport; Fri, 3
 Jul 2026 05:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 05:32:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 22:31:51 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 22:31:51 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Jul 2026 22:31:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 09/11] iommu/tegra241-cmdqv: Fix VINTF0 leak on the init-failure path
Date: Thu, 2 Jul 2026 22:31:35 -0700
Message-ID: <3f793b195cfee7e59c15d62615c31ec99e485cba.1783054570.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783054570.git.nicolinc@nvidia.com>
References: <cover.1783054570.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: e82eac80-25dc-4d39-9146-08ded8c46dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: SeSKOzb8Vsklabomak5xLzZ6ij19S3nFv1+JXYC/2ySS0Fy28wZQSn8Vw/ipj9H642F2tKVK0bbdSlViOft8nC4aD7OJo3yVbjyHDFvouF30dfOM450jQFYzq+cMIj8sbAM0hFay2xXS4qNLEmAZgGJTNXKG4Hwve1B9X/Q6H6yJuNK3esIuJw1GlHpPPxR0phR3VU+Knof0klSgiP69YyACsi1A5/dJQ3opQByTuhSefu2vIuZ9eD5hLn0nstIt9+0hLS1gsYfnZDB2X4sDpQFJUVrpLGQ2iw6MI/qYDTsSLNMx8z4+vTpgz9I5TdyOAiTFe976kHzn8MxGJY75NZ4k6lZ8C4YNZ8whnGWmBedmJfwycjjVrnrwtgGNZ2eOK1c/9buIxQ+MCeoGbCVar1KSQK6yhBb1npkv3pT6Hhxxak139/K7/vrgDPk+jBWnSCQKgJmQRVGUXsyPPwTZv9m7vd8QgvADfxV0IOVfPLZF/FKw0vk2aMKBDNPFeAoqdrJhgwmSQW1YUpv3xv40HAIQw0ZLil7eR9E5B4eM4vKMv8FOOXCdPMM6Mlk/6iQjJjbFwcthAktG71TX4mZYfl681RlL2aCcrj572xCSLLoagmKjrrp12G9AxcHOXZxRTbCFAFBlIZNXzu7ZbQRAEH09Q7XCKL2JpbUkylsUsc7cnw1Oqq3vLNH8Xpqw6bPvOrWPTVVPSvHLcBSlKoNVyQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BMkvBGxlboAZg4RBVUmGT/eV7gC6wDlVk/NlwJipY8zGcvFqsEzzZLMcxYYFeRTqmqhb+ioP9lovpOeQ3mtzrmJ3tHR0ynpnjJ37A1yWx+P94r+fQx212YieNg6iXbyA3foWz+yTzPgjLxh72cl/0ji1xy47vQLzMMIo+b2pjc5e5YtYmd6lAsL1cfxwaxU3yfAhBcpKVvZ+pdLcK16SjyokwyV3Ouy9NXL6rLxwg4uZy3YRKq+DHYD4wQcu3RQWnmBJHNwCerrCd62T6DBSvcrA7NHUUIfAl4Cz/x7yeF5bEA2rQtjC21OpQZUdUUsGeaizGCjy6dIawmMo/DRDAiTW5L9PPmCD5AOPLdl2Ep8Fi5BuUXuWNRLVb5t15bXVNdI6BYIaIxCjqmhWyk7V8D3MgELNNmv1R7X0MZOSfRO4vtaMOCuGsWz2nxWQXsgk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:32:09.8793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e82eac80-25dc-4d39-9146-08ded8c46dd1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223219_029100_BF2CA560 
X-CRM114-Status: GOOD (  15.09  )
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

tegra241_cmdqv_init_structures() allocates VINTF0 with kzalloc_obj(), inits
it, and preallocates its logical VCMDQs. Two of its error paths leak.

When tegra241_cmdqv_init_vintf() fails it returns before VINTF0 reaches the
cmdqv->vintfs[] array, so the devres unwind on probe failure cannot reach
it; free it directly there.

A later VCMDQ preallocation failure instead leaves VINTF0 published, and so
this time the unwind does reach tegra241_cmdqv_remove_vintf(), which then
frees it from vintf->hyp_own. But tegra241_vintf_hw_init() sets that flag
only afterward, from a HW read-back, so the still-uninited VINTF0 reads as
guest-owned and leaks, with mutex_destroy() and ida_destroy() run on fields
it never set up.

Decide ownership from vintf->idx instead, the index assigned when its id is
allocated: idx 0 is the kernel-owned VINTF0, while idx >= 1 marks a guest
VINTF. So the in-kernel free decision in tegra241_cmdqv_remove_vintf() and
tegra241_vintf_free_lvcmdq() now keys on idx too, and hyp_own stays a pure
HW-readback state.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index aa0568e328356..2d832d633d030 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -716,7 +716,7 @@ static void tegra241_vintf_free_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
 	dev_dbg(vintf->cmdqv->dev,
 		"%sdeallocated\n", lvcmdq_error_header(vcmdq, header, 64));
 	/* Guest-owned VCMDQ is free-ed with hw_queue by iommufd core */
-	if (vcmdq->vintf->hyp_own)
+	if (!vcmdq->vintf->idx)
 		kfree(vcmdq);
 }
 
@@ -816,7 +816,7 @@ static void tegra241_cmdqv_remove_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
 
 	dev_dbg(cmdqv->dev, "VINTF%u: deallocated\n", vintf->idx);
 	tegra241_cmdqv_deinit_vintf(cmdqv, idx);
-	if (!vintf->hyp_own) {
+	if (vintf->idx) {
 		mutex_destroy(&vintf->lvcmdq_mutex);
 		ida_destroy(&vintf->sids);
 		/* Guest-owned VINTF is free-ed with viommu by iommufd core */
@@ -921,6 +921,12 @@ static int tegra241_cmdqv_init_structures(struct arm_smmu_device *smmu)
 	ret = tegra241_cmdqv_init_vintf(cmdqv, 0, vintf);
 	if (ret) {
 		dev_err(cmdqv->dev, "failed to init vintf0: %d\n", ret);
+		/*
+		 * tegra241_cmdqv_init_vintf() failed to publish the vintf0 to
+		 * cmdqv->vintfs[], so the probe unwind path that goes through
+		 * cmdqv->vintfs[] would miss it. Free it here.
+		 */
+		kfree(vintf);
 		return ret;
 	}
 
-- 
2.43.0


