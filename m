Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A68ECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQcEgu+J3hBOIAoxI2CEU4Duvjq/BJL2HgFxPHdDMGE=; b=UXEG27JVhF9aa2OtpgqTgavuGC
	3MeVFj+lDC1OgtVAUCbZUymaxKOaRCqwaUhZFRRDp8RQFcBjigtuIVC/9KtWlVN9WxIEUGCE57MYm
	W+rVcb7RWE9qWyV4zRxIefnx9aC2Ncj9rsCtfwRmqrMgXSIyhktN1hyQw8wkvKAFxlb+62LLS6wN3
	hO16TzBiPiwpCbsgFGD6ocSF1DAtV2/LqmfZ3goQMGs93e9SJQ97aqzEErjM+0M6r+zwEJMLpJ+Tg
	QVkkPcHDYzG5jmppQFYgbJKdvCrBZRN+Lc0EeTIBpq8Jl/r82adVsfcMFO4bqLW2wPnxNie6hcBHM
	ZyadPhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8663-0000000BvBd-1INC;
	Mon, 13 Oct 2025 00:07:27 +0000
Received: from mail-southcentralusazon11011039.outbound.protection.outlook.com ([40.93.194.39] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8657-0000000Btiy-306m;
	Mon, 13 Oct 2025 00:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv48/yzJK/5AeXNIV3PZ2sAQXu61Ftm/rqK/SeTzoSC5NpqJUzk4njosRCU8PYHf21+o8kD7/2Il464w+AYX+WCfvxEX3RjuYhCNEWWwdH8eePE5VAkpJkWlcf1YUsgGIxha7+V3PCOV0+FDVCReOIvUpNfxPhK2Oycgr5DdISp2xujgtLWVf0bqB1emDxwI6XjMr2LaobE3RBK+6dt1XdjjN3yehCHUDxbd6gkKVnap2v//i+crsnq6H3O5C15VAYCsmnzGeXSo9jpQNPaEzYQDAK3M1ns4yZ3xS6SUiCr7+S1Y0ke6uG+4YHM/2EbbxRmq6+N1P6pRebNgsVD2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQcEgu+J3hBOIAoxI2CEU4Duvjq/BJL2HgFxPHdDMGE=;
 b=ZHFeRZDjMbKHWOguXCgQ97H3IyIAJOta/kKoUv1MbPpYvj8M0J9ZDX0Dzt02GzVFMo778doUhlGeL4eeGSK61ZCGWIlNQzPx4+1E1DpvfZ0Cv6qGjQ1gdCDiUvXEPSuSKKvek5kB1D12WHKC4iNoaps9N4l/UUcrPVNHO+7Cx3Vn5EOG/LTiTgSn/oJlbQST3Em1tZzJNb9MnhD4ndmV1tPjRbao6NNBoy3FW1As1wPYpsqwE7xgSKMM6vgEjVDZXVJ5YRc6ngUV7eWRp7mjxsiviKkfCNtU0eBubTgzdK6PVUkKNEjmKprp/AucZ2qIzcCCpRFAcn+iLEP+ftx5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQcEgu+J3hBOIAoxI2CEU4Duvjq/BJL2HgFxPHdDMGE=;
 b=s2RsHXKY4pzTjEZuS/xs+Ab8MxcZMRVr7y7ofqFiVyd/oxPZMnfjzLio7qHge+V8/WQcmvB777snlQuFd9ZtZLCMalyEhI5J4Lct+K7v1ima4kmOxOc2vc8jxF1gBGc2St0dql58C6hLwVUq9SLfqyt/mxyCZMCcOH8ER5AgFlD7NW/oiIMUEy0htl9Z3dGWTAJJS6TUTddC21OeI4DQrx+PsCXfWwBUIot+sqwCEf+VndanffetpJA7XB65x+eBtLW6dKQTFBRTVad61VBugZO8kFLKzkZ54dMf1+t8SsCUwfczmAAbTHqbwycmcg+/MXyAmQc3lztRK17JhFkDbA==
Received: from PH7PR17CA0025.namprd17.prod.outlook.com (2603:10b6:510:323::27)
 by BL1PR12MB5754.namprd12.prod.outlook.com (2603:10b6:208:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:20 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::67) by PH7PR17CA0025.outlook.office365.com
 (2603:10b6:510:323::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:07 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:02 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 13/20] iommu/rockchip-iommu: Implement rk_iommu_identity_test_dev
Date: Sun, 12 Oct 2025 17:05:10 -0700
Message-ID: <a3e5b29f778a8d728879a8d7972f00e0abe1b6ff.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|BL1PR12MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1f14b6-419a-495b-da9a-08de09ec564f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bq8wr4kHW8rxBy7GWByREVIae9eefvG6v/znWIiWbPu1n823qw1n0WrUC4hS?=
 =?us-ascii?Q?O2FHqjPnZl1MjvrX6sc68sTzKVEVEei+C+NBpBXNRz1PddtFDortz75y4YDl?=
 =?us-ascii?Q?z+G1EhHRPx0m8gMOjo/rf1j8+655jQUHNzEVtvHKJkuVMkGU2lxvaRdGn3tr?=
 =?us-ascii?Q?5gKmbisZMpmXdWyGM7kJW/Fn1gadZuu8D5GP2Yda6G+rpEB4wDCycXEMr38w?=
 =?us-ascii?Q?J2ZlKx0sIQ0DjYBv1fm1Im1DnfoP78j8lmGsF79IfrCGMVLkS5I+h7Roigzh?=
 =?us-ascii?Q?Lm4Yel4R/ScIN3crWk79vaYvcRYybnepnNIF4/+KxH2l7KMjc1u3vsyrnTQl?=
 =?us-ascii?Q?d6hs6uKCJTFw0uDZY+ScxsuXiojxJTsODM3JuoFZOjPY0ml+qLrx5ommZl1M?=
 =?us-ascii?Q?dU3JkPkx9M6qZk+jXdt779o7DUcoKoRsRCa2y3rBzp30FgQTjuFsLJ3SHKkm?=
 =?us-ascii?Q?f9R2CdVLEKzcRP1UO4KpZw0iX32YMrR8xYMSt6MkH5ErhixTQcHvkV8wsRSo?=
 =?us-ascii?Q?EVEo+DAqURYanEOepy+9jd88ILekMokhkYyneAUsZ/QYoBfFfU31BYH9VpdO?=
 =?us-ascii?Q?pDldU9Teb4bmAF6fsYzKm58qGDQwbHwmdF3fKtFBO9P9KyDwpuHd2Zeyykp+?=
 =?us-ascii?Q?rGnXdAwL4hpOid3imv3nbF2e7dWMPH8aHeurFG/NXboxtPrFHNQs9Tktcl26?=
 =?us-ascii?Q?AJDbV560xBmFLSXNwn0Af8NYkiPlo63/9QFwL/VWfuspddqlrNzHn8FJEm4g?=
 =?us-ascii?Q?hgHIzYqSLHioLf2/AEA0g30faEBCD5TV5ALefhd/UID3C1gOKWxLKBBajku0?=
 =?us-ascii?Q?h0qAsn8f8VFtl5KrmpCBuyzku+em2MjjK8XReMn3HL/F4lJEF4pvSjlPE06e?=
 =?us-ascii?Q?0P2tYSivYUd6HRcsL3YI/FbroNqlAmGW+A8wzi2tU2+bbYOpy9kBj8oD7E+m?=
 =?us-ascii?Q?Xw+E8NE/CaSzifVM/uQTEVKkTYdv9PHA24T/o0L+RFg1C6THkGgvdEIA804d?=
 =?us-ascii?Q?Zx/ZH8t4FQQpIm97OpycGXvwi4TCc9CBt6NCEaHa6gmZ4Lb9MmI4aRcQ4HM1?=
 =?us-ascii?Q?Eh+9E5PM3b+8rjWbOBoHIa5FPSpcUq3d94CSeE3iU3FKCJsHKFmr0zjfcTFf?=
 =?us-ascii?Q?Bj3LyVCwi/As0stghs4+Gj+LoejOwd6wKRf4o70nmDOtH3GxpMhSv3maxSWs?=
 =?us-ascii?Q?e3LiB3Woh+Hvm5FU49dDprT3zTg+1smyiNFLfIEMZPv/tuHhWn8hCrRYESsd?=
 =?us-ascii?Q?5Rz1C7x06+tM/2wYxI1CnM2anXaj8eorT46H9YmoI2V517BkRTm5NNmVE92p?=
 =?us-ascii?Q?Myg99qpy3UEuZHZ8oZg7pQeEQJaSH3AhIpko1hsJU1OH7ct2SNr64FdPgqsW?=
 =?us-ascii?Q?bHAWzQps6ha9dUSjK7HVS3djjR7xWmoGyycaIEPi0EogMji3qaufPcWIF0zK?=
 =?us-ascii?Q?fH2Eaj+wBuRB/HZKagCarTGotJCdDVPCIrryTYwdty7QfChZbdnNYobrh2Mm?=
 =?us-ascii?Q?yFwrkPNe2ArBdiiWU4wrEKKUmMz29UgYXups0M06XigsDOQKbY4tDWJlSUoZ?=
 =?us-ascii?Q?g3wLQKGz91K+Kyj5QE8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:19.7447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1f14b6-419a-495b-da9a-08de09ec564f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_170630_059289_8DDF1E40 
X-CRM114-Status: GOOD (  11.13  )
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

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/rockchip-iommu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 85f3667e797c3..89cb65f76fe52 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -959,20 +959,25 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 	return ret;
 }
 
+static int rk_iommu_identity_test_dev(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
+{
+	/* Allow 'virtual devices' (eg drm) to detach from domain */
+	if (!rk_iommu_from_dev(dev))
+		return -ENODEV;
+	return 0;
+}
+
 static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 				    struct device *dev,
 				    struct iommu_domain *old)
 {
-	struct rk_iommu *iommu;
+	struct rk_iommu *iommu = rk_iommu_from_dev(dev);
 	struct rk_iommu_domain *rk_domain;
 	unsigned long flags;
 	int ret;
 
-	/* Allow 'virtual devices' (eg drm) to detach from domain */
-	iommu = rk_iommu_from_dev(dev);
-	if (!iommu)
-		return -ENODEV;
-
 	rk_domain = to_rk_domain(iommu->domain);
 
 	dev_dbg(dev, "Detaching from iommu domain\n");
@@ -997,6 +1002,7 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 }
 
 static struct iommu_domain_ops rk_identity_ops = {
+	.test_dev = rk_iommu_identity_test_dev,
 	.attach_dev = rk_iommu_identity_attach,
 };
 
-- 
2.43.0


