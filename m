Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA84F428F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+bfc2+8Hc2NimyZMAaU/n9eO1y9TQTxtnr/WOjHM8E=; b=uuNEreMVuuMI7B62eJHozZo9T/
	TrN892ehjqbY3C/AuZBvDxRLaWJKHnuvfOCc/ioYg0hp+GXt2GHm1o5lbsunTPB/KyTGXIX/rFB47
	VlArOXtS03Upnq0M//iW9f7hkohWZbSsdmUs+7jbODFL61tsLvIDdDzVyWvYNl2LJ2yng8kESiwel
	q/UHivS8ibvfI/h6g3fHn/Hnjhz1tX4Sd5+Nl1di07K2Oid2BARFO/FK0vYw3Afxa425AVswBXGAG
	gSR0rKr9wliEjcEkHEcPjxtmsIVTUAKGgW7TB6t4m8HPbdCCIGu7vTzqtsyXbY+yc28/lypmRbrV7
	jGQ7mfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7KD-00000001bpI-1FR2;
	Wed, 15 Apr 2026 20:59:11 +0000
Received: from mail-eastus2azon11011068.outbound.protection.outlook.com ([52.101.57.68] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7Jn-00000001bo5-1l4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 20:58:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfk4ELNQFyt2a9AHDcK5ahVcOUhga0hJXeFOJiJBztQ2J49fO99VRDBNyHH4rxKo6UIJat6E58uJokF+5OHIF5EsBbl2lXoWIVKrSW55GFcvVVEq11QSXTx8IjjoI7LvNnQNmzACqOvMDVPzAFMJMlaLncrF+8RH+1fjzDwcef8J+OvXC48KCoSCUAUE5b+cDQTv2wcfKwJ48Eduimi532cfZWYmLnHoTvGk3Y3WwlD54FYQ0Oe4p3U8uMyj7rHPqLg6SEZfHEHoEymUIxW34juDj5JGqp0lqj9ijINDmC2f3WRJ9eDeYL8T6BKzRAhu978lh9/3UdHZXaeNKQZhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+bfc2+8Hc2NimyZMAaU/n9eO1y9TQTxtnr/WOjHM8E=;
 b=Lj4C0KzgPpcqTK6EkqDoifj80GhP8xer6kcQXWagdbU9U/fPBCVRgICl3i2nOi8GXyeb6wg6xlOmKXuCXjNtM96E/zz6+rJG0KiVjOFCkCoF/HKaar403ySd0t5kJZjVACyAgTlSAA8O9aaiinOY3awxOc2rbZldiTogT+M9SYgX1NI//Cr5O1RjUmP1xhk3GpiUba5XmagRDM3kUzfWRvp+lsJJ202qux3XWejtol4OAFZRv+ETqYdc7N11ptXKeJ1yTiYkoNsJNSTVA8uq9IjuOoZ4Gje86i5cPVzCyTpZPttySlBd9NIzpiAhL7xo/9D8ZnQlUbekMxTWaNOuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+bfc2+8Hc2NimyZMAaU/n9eO1y9TQTxtnr/WOjHM8E=;
 b=bWYvVT7vU3UvqBqRdfyqPFYa8YO5M6G94xXcwc2QhgpH4HKDckPPkrgQQi3ovnEIoQAE0crkMYPbnjmm1IY+Ek448e0VKEqIicTKh9ikQXOxRjeCdhDCx7s3JGVnXf2CW2ZhaiDKoBA2du4x7uMgqKRdIGHDfOgxQkwES49KwXW3yecmrSJIC4bx4qT8KMCV/yrmrgXP4+6P0DtR6JDwapOC2piij37t6gcqSGG+Hb2UO0M339dTfdauY0dW7x/EpG3LVUQ+XwhxkdJuTSOrGYDY38zTHaC7vamVW8l5GyEningQsX5wAzzGbSLKHwim/pOn/Dgt8AttQ8I6i6I2vQ==
Received: from CH0PR04CA0081.namprd04.prod.outlook.com (2603:10b6:610:74::26)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 20:58:16 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::49) by CH0PR04CA0081.outlook.office365.com
 (2603:10b6:610:74::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 20:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 20:58:16 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 13:58:00 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 15 Apr 2026 13:57:59 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 13:57:59 -0700
Date: Wed, 15 Apr 2026 13:57:57 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <jamien@nvidia.com>, <joro@8bytes.org>, <praan@google.com>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH rc v1 1/4] iommu/arm-smmu-v3: Add arm_smmu_adopt_strtab()
 for kdump
Message-ID: <ad/71ZSRFgm+x3p5@Asurada-Nvidia>
References: <cover.1775763475.git.nicolinc@nvidia.com>
 <30c7c51c8771722813a9cf54dae7a1b5d0aeb65d.1775763475.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <30c7c51c8771722813a9cf54dae7a1b5d0aeb65d.1775763475.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1773d3-6bcd-48e0-7eb4-08de9b31b73a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ju5VZTcHOUzUd8oaDloOzaEqaZJ2iHnVhO0w65wLD7/PpptK+FS6gFSebX7QTfDaZVyzKe8FgOxVRz8ToyzqkZYYDgbC8vj7xy0yaJpkWIyd8w88G959A9ynDeAZZcuoyYPKSNpEGIJZQszSA2Bs62idSyd2cEQujT/SZ0Ic53auldzA0Ha7trRVhQj7deZ3NQfOxI4iiaNTASrMoKjQt81xOt4uWi2MkR8Ho58R7ZIkoM625sdXHWhN0HE4A6rbgZfBOco01Gmb7653BUnnmzLsWT4emta/i8lVJa95ECajOHOwehd3e98s23VQMBBXZKGDbyE9D2Kyk20cOXUJzFYBsJg116Sk21apXLaFpdYl8SBWmyEEfO26zRLmsAFFeZuXFSJUdtt7nkK+UR5Zw6geuwhYh6H0ku3Sc4L43hB2WpofaaRxdaPoSMWmCOCFdPH3fqRxNMhl0lbFrmuD/tZCaO6CmKrzpvFkhSidMUtdWMwWyCIiCfrLHlVYKhFvdDSD8sKkxLPEM2ryuZSX9K+iMjEh2MV080elxxgSHzwkJkfdzFbI/nXY2Pr4sONH4KNO6ith5gDQdCyCA5fw3Py9k/M77e8KIrVZgpdGbwI6m5AEjCYFzWV1SNvruPTGOGlyxKt+b2cm8slUjHxVvv/moGZ5udMz4CU4vObh9smEqHCryJ9Rk/eq33gnRGXSE2GRIi0LO+urnAiSveDZP4dSEoG+5D+ZYEfdISikCTEGHla2BHXsWt+7vMJlPHOVCIKsTcVQWhzzeckQsT1Dew==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LpexONwVAsVVOD33vxeOXL0BZ9GhXU2IeJUTA4PInDYBXOjDX6ZnGUgWXL+vEbj6S8SYj5v8fDDyPHKfoVfLjtKV/b/Zv/A1zOk/xpgofwmbiRoZkQasiG82eObfcGXr4FC7oz1ELpLmiTDvOKJzHL/fYqtlys5VvIZmbpAo3CNep0DQbaWqOBtuAHjwAhX+eQfzzjfm7zBwNfXVhIMobd+eSfGtv4PRAnx+clYDL68hLcO4XlaPWnqpLImwQuoqktn9Ts4BBkltTQFu0CJdYvhQZKyLr22YrgiFE3BewyR2TcTBHu6OVApQGcyz54RIcSzckpQBRhwb9ncylQR2k60C+UCEyrkWtO7yyvsVS8tAbCTvMO/J6h5NyjvJUsRpy08a9j5wcPzpzAKsziikFK0G3Bcp+mmQiLNHKpYfxMbScFhGoP32YaCBsUH7okvz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 20:58:16.1421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1773d3-6bcd-48e0-7eb4-08de9b31b73a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_135851_072709_19C55C16 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, Apr 09, 2026 at 12:46:50PM -0700, Nicolin Chen wrote:
> +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> +		/* Enforce 2-level feature flag to match the adopted table */
> +		smmu->features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
> +		ret = arm_smmu_adopt_strtab_2lvl(smmu, cfg_reg, dma);
> +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> +		/* Force linear feature flag to match the adopted table */
> +		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> +		ret = arm_smmu_adopt_strtab_linear(smmu, cfg_reg, dma);

Made a small fix here. Including it in v2.

@@ -4662,11 +4662,18 @@ static int arm_smmu_adopt_strtab(struct arm_smmu_device *smmu)
        dev_info(smmu->dev, "kdump: adopting crashed kernel's stream table\n");

        if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
-               /* Enforce 2-level feature flag to match the adopted table */
-               smmu->features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
+               /*
+                * Both kernels run on the same hardware, so it's impossible for
+                * kdump kernel to see the support for linear stream table only.
+                */
+               if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
+                       return -EINVAL;
                ret = arm_smmu_adopt_strtab_2lvl(smmu, cfg_reg, dma);
        } else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
-               /* Force linear feature flag to match the adopted table */
+               /*
+                * In case that the old kernel for some reason used the linear
+                * format, enforce the same format to match the adopted table.
+                */
                smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
                ret = arm_smmu_adopt_strtab_linear(smmu, cfg_reg, dma);
        } else {

Nicolin

