Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7E5C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=So5qZTiOkPXz0CsKQcMDHqyA3sLin9R/DYu1sYILDjg=; b=fdCdZ2EbOcAzFEAL7+j29m3noW
	U1Db/N50doT6tHZ/yc7yiAuOlv7FynhQyfg9qYypxZvEIgkIYbjebFtQNBGTyd4iwieEGlpuYjSez
	wP17doNjq3t1RBo+R3OgPjKaG2RRxalPf4o9kAr+5Mb5IpjSh367fzzY2AhvZJTATFiOwrnWU3cd4
	izJ5Ib1lk4mYaSKaE7V1CfpOfnGYJDXggMOkmyt78/REGyvI6m8XSlB4eGAzjGTFkAEI60N7s7x0r
	jjkbBDDP1htTGwWhfq+xPquv65BHKqovN7zuVAikCBLQ5sG3eFwIxOaRZVBiZgBjZHFT3YU0Ua+ho
	sMM/NExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TKZ-00000009PV2-2gFM;
	Wed, 23 Sep 2026 20:12:39 +0000
Received: from mail-eastusazon11011062.outbound.protection.outlook.com ([52.101.52.62] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TKW-00000009PRK-1QeF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:12:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnO6jeRzMHrVjJVcp7rFh6uvfHV3fdK97jDGu1CCKzErZpmfY42s6axROL4Ga522FiDK6AZVKGQldSUWENufSeng3raEaYb5l6yhqaq++4V5UwJXrNpdnLc2vcoM3hzzG/M3brUQkhM7wJt50qYAlzDw3Z7Tln3E6o+z5mN7ZIKRt/TVR39EOTtCY0noz8zfa3XEhNfKtrgyhwfiRWcY1nN0fPd0ytNF9UuykKfJD2UqedtCLxHbjJU2is9gMGX8P+Fj6eA4duPYRQp6wyfprYHDOhbExcyS7QUNIHATXH7Se77oQ3gVMqnO0lsnVC7y660pUSeL0+UgA38jbWioOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So5qZTiOkPXz0CsKQcMDHqyA3sLin9R/DYu1sYILDjg=;
 b=QFJMdiRh8Vgg6HJFNRyUX5KtB9lqaBr0+bI+LueP6HZWCJAfhpjEyO+rBlQaU2tRsIwpg/kSHGNFTDac1VmA6D2sQkG5dfdzcEHE/HhdrLv9SU+S+tUMW1LHclllPEJrgcHEUquoe4FSRHwGpuiMB4IBSFxDgev57bo/RXBQFM0RJeFO1BowfRO5BFtK+BeuU8TzRuLmznjX/WYmigBP/tMuV0Q849peVJbjftuOgRDF5Jw7pKhyoPKlpDre8vcfy9PS+IdFzo5+CPCivk8EKybWchkOhjz7fyiWtNmi33Wy8lhFlh8FSP6NNrg5gVTUp5tuusw8GZG2D+Xf6Yfchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So5qZTiOkPXz0CsKQcMDHqyA3sLin9R/DYu1sYILDjg=;
 b=GCgHa7P3fdsWhVP+DnRi7iBgHdeEWJ+aSVq7h09lyBDC0CqQh1LMhiyPhxhxKKk5DSqmZ+LcbLw79DCkJuJzcX4SxJRNP9THLHWBKgd8wiCOBO9kSn46ITEAYw388BOXWob9s/uvp66jgHKXUa9S511Quavasa8NsNwDIzKfLKIQn7e+Qdm8JMTcF8YdyC6b0jS71/p7KgCVbjUwlCP6r8oRN8I/cZT2BSI+4nRG045BD8YZWKaaczGQpQNxYnl5IvgXHlBVH8yk30pBF7dYOSwjQCRqv8M14c5bD+NCWgoDxvQMAsNpbAhbC/iTwV6WCHTr6L30xfOv//tOTCyLgQ==
Received: from MW4PR03CA0057.namprd03.prod.outlook.com (2603:10b6:303:8e::32)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 20:12:24 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::44) by MW4PR03CA0057.outlook.office365.com
 (2603:10b6:303:8e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 20:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:12:23 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 13:11:56 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 13:11:55 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 23 Sep 2026 13:11:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<vsethi@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Subject: [PATCH v6 04/17] iommu: Pass in gdev's blocked state to iommu_deinit_device()
Date: Wed, 23 Sep 2026 13:11:23 -0700
Message-ID: <4d027aa11387a224e4e7fa2535108104384e2e22.1790188510.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790188510.git.nicolinc@nvidia.com>
References: <cover.1790188510.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c276197-70e5-4551-4fe2-08df19aefb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xozV+vycsJjx1rbhHR9DMGQqhaEYlQ3a6yyDq3BPX14MoS3TG2foHEjvl0iY6ELMJdrVgc3/YdhnVM/cK1z1Hqlrn/uLeL8+cpSRQLIwmFVlUMK51t60vacU+EQhThHStVNuJnAL5BvWk2nEr+X9x0AcMu+Cnk21AZ6AIA6jVdT3rEg7HabjoMEVB0sdwLE/YiaGr9pwIsqXPT5jLAA7+7AstoOG6TV//ETYP2ttz688NG0idm00ygNdWrxpDlYB3UUkLncu5vuc4rMoJZizh3GV7jE9qEpCRuFu9wqwYzYPE1a12CPOMcPKxOI9GggWP4nRWxCkKr4I/sOAnpmGuq3Gx4RTV8kbByWQbzPLHbFH/kLr4iyg+X7VI2LQK7vOAmn07QhIksKlKI8U7o2BYmA6v9Al35Q4tJ/Ecc517zSdUrvfdnIJzk5E9HURIJ88Pb4jY6CCxNk+hAt4jO+X43RDltOMnDCyONPgIrQRpxUavqMOPDcMzGDF9CAT5/X2fyBxB5uxJbS7lfK/kFReQClEJYP7P+lamnp1dUJMRAO632M8FMJbE2zoVpFYaabjf8IcJS/u0XgTx33rfT4KBoksj09Fmw1LcxbN5DOCoPa7pe0CG8hd4G36L3soH5MnT6AP4WFy1KLzO4gMSz8R8vB2dXBZes9g9Nq/xEQvDn3kAsmVLuP4uWA0/vg+ANX8lLdIG8hISUKQfsJMDaReeQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: acaWuYHg9QL5wjn+YJebgDBzLg4FXb9BQVf/uBT+ELEx1XSusuqbOK718roA4xyCwcPNaBvdjNgkDlFeDVd5X7PN68QWtYKWq49YO8hRXo6maFlgp1MR0uS9myKgEqVSEPUm9Mp7yRW5JuCBNkpo/tvGCUAnd8pze0p15hJWNi9E/DDPsX9GUURRr8e8antuX73iyUyZg+PeWzcoN86JGxCrdSxWen3WjzsRLXyPBufOAtSgAK3Lw5fAs6JB/xC8CgB+/UzS8idUf4hnQ9fyb15W28W4w7H/oDraQqrnZu/Y+IM/V/rds7EyeO/jMUWipLaHxYZOmvX83oovqLChxE1XGH2A95Wo0bkLoyBp+UH5SAKeufN2ea1dwgRDZMiWSGm9IG4Qj3OwZTT9GxtscX9qB3jaEM20GdxpxWrzvL4TfNQMQp3YAV/oICGN/a8h
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:12:23.7746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c276197-70e5-4551-4fe2-08df19aefb2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131236_412048_0A4DDAC1 
X-CRM114-Status: GOOD (  14.25  )
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

iommu_deinit_device() parks the device on the driver's release_domain and
passes group->domain to its attach_dev() callback as the old domain. That
is only correct while the device is still attached to group->domain.

A subsequent change keeps a device blocked on group->blocking_domain after
a failed reset, so the old domain has to follow the device's blocked state.
The group_device holding that state is freed by __iommu_group_free_device()
before iommu_deinit_device() runs, so read it at the call site and pass it
in.

No functional change.

Assisted-by: LLM
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 379132e2d6cf6..344288e930c40 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -550,7 +550,7 @@ static int iommu_init_device(struct device *dev)
 	return ret;
 }
 
-static void iommu_deinit_device(struct device *dev)
+static void iommu_deinit_device(struct device *dev, bool blocked)
 {
 	struct iommu_group *group = dev->iommu_group;
 	const struct iommu_ops *ops = dev_iommu_ops(dev);
@@ -703,7 +703,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	list_del(&gdev->list);
 	__iommu_group_free_device(group, gdev);
 err_put_group:
-	iommu_deinit_device(dev);
+	iommu_deinit_device(dev, false);
 	mutex_unlock(&group->mutex);
 	iommu_group_put(group);
 
@@ -759,13 +759,15 @@ static void __iommu_group_remove_device(struct device *dev)
 
 	mutex_lock(&group->mutex);
 	for_each_group_device(group, device) {
+		bool blocked = device->blocked;
+
 		if (device->dev != dev)
 			continue;
 
 		list_del(&device->list);
 		__iommu_group_free_device(group, device);
 		if (dev_has_iommu(dev))
-			iommu_deinit_device(dev);
+			iommu_deinit_device(dev, blocked);
 		else
 			dev->iommu_group = NULL;
 		break;
-- 
2.43.0


