Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A32F433C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XcP1hOR0fcNpQwXBtm5TxfOkz+uHZDImYaq76ICR6Q=; b=oxdvP5m36OjebKILK2jLUdCwa/
	JoWwuQCITXsYXU8iMGNkE9QzmqakMoeH/NKpGicvnBwQoETZWYLLknZ8MoEkMCyav7N5fmdYPVEen
	m0Mx31QsQ8+nxszlEQbuPYsj/rDx3uVM1pjnafjV8RqdSL5pBfJYMH0qTsb5E5jURsxSfVKgxq36S
	BoGgbhyAFMYBZ9B2P6xkNys3ME0h4/4ln55fkQU00pe3PPIzP7Ey/smL3hN27+5qjywFZzP+htEmI
	BsPrZsL+2U0raNiBS3wDLRN/UU20bzYgGXOoqkseqlLJEznttmy+IXwiWYa0S9lbFBtyQ+hivdgCt
	XI8rxHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7dB-00000001cho-2tEn;
	Wed, 15 Apr 2026 21:18:41 +0000
Received: from mail-westcentralusazon11013034.outbound.protection.outlook.com ([40.93.201.34] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7cy-00000001cd8-1fYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 21:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbSmipKtS6VNlhQAlxhS2FU4Liap8xYCdkt/lGMe0tq8lZekhG8cLBr9/s/9ua2HrulypJys+MqMBmnBGQ6t/OQk5/+fUaFU8IgGCLhHouz6Nyl1hC2AwdclmQ25vNT6Ql7LJQpTdXCxhzSUe7eaQHdgYXyZyP2eJ2rY1CUPLlu6IAU6Idyz3mnmfQNQGe8rnNFAUJt5CaVLfi0Rvo7Xefgt0T3QQnlltRGBshuRuymJ4vYdFeUfCJP1osCv2q0MvUdCgVVfkcMZXhPVY3FhQbnQ2iGnuWcjOC/mvY8mtTvzeLkNpY96UdFRJGe0su+AefwgdUo5sX5x2FkSLpQzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XcP1hOR0fcNpQwXBtm5TxfOkz+uHZDImYaq76ICR6Q=;
 b=KcvVO+KVku77EC5Tkka13wWH4KXo+EZ228QnsNs71Zpvnsx8RI0trfYi5eO2w8sQ41nkxazvzbo+IcPEdSm/76XXD1fAUADCIzHQva1xYP+wYlqHMi0OxyZFoWbxWzGZhHenVxIa6yGLalETodV6U+aHbavp1d8gHDUSJg+/lU5DyEbmF+XhYoCkBixI2ug+vVhU6CiG86De+5PYoNzmR7FlASnrUgrjnZ+SOPA4iY17SbIFXGOJQVpQHeJX+OwSlQJQ8Zhhn7ZtvPZxP2+rW1Q38tzULQtAKPvMzu/9cm5rQEbh9ew3rhivBVrW0HeGPDCaF+dBmGtNJyyE037wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XcP1hOR0fcNpQwXBtm5TxfOkz+uHZDImYaq76ICR6Q=;
 b=pxRPNvS7a4iAHkUWdrBB187JEwj7/8lYpRbXnBJLDCX277vn5E8YZSE2CovA1qnCWOkxsjClAYev2QSKQKf5YkXEwFlK711LITByQ3aH2thFYTznuWQrDBLZJwweZWBzO2GZLyhwhtmyVIPwlNSzh4roI1fuvelZ8cVyJ0QMYtkzyIZq0D0ZQmOw9yc5hUWV9j6ADwyRMXlofrR0yuAG0EMP+TEtQss1zNi33YgzK6BUVQaVgeVIqSrU2l+Wz6uT8I2q/Jq84/Po2gJaO5dDX3KelzSjNAIXoQ5xZLU1/u7rpFt7a6rC95+7RTyhEYu6Y3lYKc6ph4are0KbbxnBpA==
Received: from SJ0PR05CA0173.namprd05.prod.outlook.com (2603:10b6:a03:339::28)
 by CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 15 Apr
 2026 21:18:15 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::90) by SJ0PR05CA0173.outlook.office365.com
 (2603:10b6:a03:339::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 21:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 21:18:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:17:57 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:17:57 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 14:17:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v2 5/5] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP in arm_smmu_device_hw_probe()
Date: Wed, 15 Apr 2026 14:17:40 -0700
Message-ID: <8738309953fc091464eaeb4b2b3d0bb8a70994e1.1776286352.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776286352.git.nicolinc@nvidia.com>
References: <cover.1776286352.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|CH3PR12MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 66924be1-cf82-448b-e00d-08de9b3481a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3gEtc+qMErOkvLQ/N3tBojfmLwxnRKGukH5pb5KSVWCRy6Q5TvmtwPlL0/DZZMsdaQ9ztwUJ0Z9zj1T5VCUDfNpjJ2RqR85YLzM1e3bJs24/nP2DukEYucuwyk9Qw//SF0EOS6bJo+F9mkSDVtSR8AZBKQfwHlkRL+WycTNlUxlgvEyujUMlyzkUMEqsajPGE3WUrTo8tMyGA+g/ZTegd44Tu1AIUNHcR4+npmtrQBjSOlRQtqE+NizUslfmdLmzNZJKrf5Atic9L0S0tyR0/AmiMJeNWglC8AyWJQVkXpD+QMxHg13oW/Rs8orvaaRx+eGdK1T/tbBI1flMxzsbXwbb/s7ZZVEvxtqo0zSYX8SrV94dahCd73nUkOLcf1KGZknTDZwBtE7VEOYVk35B74eGJIjDqECeqW8tybIj3t75+vQtjgLZ9i6SSmoJaOW8KtSGP+SefbDx6dFCcEvLYaUUz2bgoeigpsTRb/+I2nK0iNZoX/ONXceyFtMTXjdPPMhCHikHwdbdokeEGJCCzbr/aI6l0s5iXwvE6En/bU+BKhdjQhyXMkzajshuwOoI6iDigHX5ENwN9LZz0SYrF2PEqOTXhwIJRSiNWFdrUzJWHJ96mWP8jIpFWZX2h9exM37Id1XUespAwSzqe7YUmyBTtjkk45wZohxrRLAEUpJpJKSMKrkwIoPCAyt5wKL02yKhMtfiUYFoqN4twQX37h833KmbL+FLr3fVnHQMHdbkQ6RVOw6pEmDL8mSYI7Ykdv3SU4v7/e/cUeP15hhd5Q==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mYhVCnxttCfkT2TDdDRPMa/AcqBGCn5D6kNahrMBEf22QcviYj2KkGkU8DWEZyZ6ScwFe3jdPJww9rTuEJp1chNJ/6J1+vagq8rxeQ7UiRxGge2LAGQEJPgRQS4DztC5e+SdWl9FS66ZCkdGsSHjkkluX0bHiu4lef02OOyV/Zg5fB5jTazz6ZO1YvU7qlVVF8s37+NTCvdAkxOFJwDPJcE/UccvPy8bAGmPKSEyUVFC72N8V+2NRS6MKwZUoXxkPW9tsJEehi3wL4TwgyMjkPZ8pv3zNayn+5gEIS2/HUUNgaaZDhHDUQgMboPJ5PLLo+D2beeEYj4isBTFQ11wpw2bYjadg4wF+gWQB0IqKjCuSl7EjjimUItjJ/8iLXm7mjHsH/yZ94FyRzsmJTz6sQ3KhKGg0J1aivx/jS5FY5YbCz97dtMCUVjW7/4XO9nl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 21:18:14.7494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66924be1-cf82-448b-e00d-08de9b3481a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_141835_079530_82604303 
X-CRM114-Status: GOOD (  12.39  )
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

arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
natural to decide whether the kdump kernel must adopt the crashed kernel's
stream table.

Given that memremap is used to adopt the old stream table, set this option
only on a coherent SMMU.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 12cd148a99dc6..5a5e0f80bbfb3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5388,6 +5388,25 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);
+
+	/*
+	 * If SMMU is already active in kdump case, there could be in-flight DMA
+	 * from devices initiated by the crashed kernel. Mark ARM_SMMU_OPT_KDUMP
+	 * to let the init functions adopt the crashed kernel's stream table.
+	 *
+	 * Note that arm_smmu_adopt_strtab() uses memremap that can only work on
+	 * a coherent SMMU. A non-coherent SMMU has no choice but to continue to
+	 * abort any in-flight DMA.
+	 */
+	if (is_kdump_kernel() &&
+	    (readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_SMMUEN)) {
+		if (coherent)
+			smmu->options |= ARM_SMMU_OPT_KDUMP;
+		else
+			dev_warn(smmu->dev,
+				 "kdump: in-flight DMA would be rejected\n");
+	}
+
 	return 0;
 }
 
-- 
2.43.0


