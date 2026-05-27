Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D36CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 00:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9wbF8FQGBunpkAOBtrLF7xNTCBHnQhhSI1PEWVCvH0=; b=Sgfju2H9Q7Bpp60KU6oS7t6qm7
	lK5Dq70weP6UxXXZ6lv8BAhOCtPwFJcmjcZkQIMXziHI8LDA2Lu0ap8ax+idPubo50TywONTXodi+
	uadSOIlH1HfRQliA4Yof1IylHtsPtc2IfTHsZFJErYz0wrWxChD16j2lIna7daVQ53gJbuFI0IuIB
	TiiCjYeuSngHz9PHPoB33v/4N8adptYrz/ceZLeqTH9jjXVgs3F/ixyJqOaBIRbOALTg0Sj8Fes77
	YJK2OVurjUEt0aoln1DOJ3RZ75cWly5hXsoLvTIEQN++n3SysSEqHLrxigGP96r51h50M4hOemOvn
	P6i3Qqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS2L1-000000035na-22kd;
	Wed, 27 May 2026 00:41:35 +0000
Received: from mail-eastusazon11012036.outbound.protection.outlook.com ([52.101.53.36] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS2Ky-000000035nE-2zpN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 00:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNVxjwsxkB9sx9ouOxIzF+bnd5pZGIj/LRIrZyJDBWZe/5MFmJdn4/1ewL2rFQVeKEi4/5o5mhdO2Y3sEkmZ0hEOIvnEZFRUowpywiDSgDGIy8rC0V9CWCcE2FJYVMohrjQs/m1+tgyYvvdsFvBhe48Y7O5pwXWnhqhB5WHflbJOMev6E8gqDGphLwyV/fgpNloN6iI5UGWc2mJrfp0xc+uzU6kg2AkgxEDd380IppubK/f6Rgojrnpw6ro3jKU2dtgpn6cdQGGrqiqS8ujEmnHBAJ5v/GYIWj7g3QqtB8wp86yVqF0fIZLey6K42xZ2IBLTImJu+YA8BUkE2J2c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9wbF8FQGBunpkAOBtrLF7xNTCBHnQhhSI1PEWVCvH0=;
 b=GwtWpHtR4hYo8PudTYadFnrYxQu5Mq8y6M57/vXJkwkolzV779hyVGMMGLlvTdXrXglX/DAOztVSLT0ivp2tDsPsGjxVFqnBBAKsLZH1Q4QdyPk5r90EDlfOOkmfwuIsMgyNgN086gchpqPcjgc8Ri3/24ydutxsfJdQqGSE5aV1t8iwhTtv0Sg31EbLYxjPstBCR4kVQ931Ls+XIvUPGeuLyEQUhQdB13HPHX4QraXE2aEvuBWbrYV8QWW7yASBXg4V2tsqz3IbbOAU4xHnNb7839IEcKDonA3EJvl69ZmC5E2XqmBOtrPf9FslNrjUf0kIQeIxW3k4jZ/4nOQABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9wbF8FQGBunpkAOBtrLF7xNTCBHnQhhSI1PEWVCvH0=;
 b=iN83ftBRHDjmjFV+XbM7ozLK4E3YGu2VjOmdzV+E0LqjnkMQBdQXV5ou98mkdz+uSg4SRxlO5QSw2/RbWiMbNqP2hTtFdt/AggeJSrOGU4NaIux5waS04RrJH1hkTrCAmlr8owtJ/0VuKb7XMlwWCFYMK9zdmA8CIgOyQQ/SGtNdEhuM8et5xstja0+X07YNw67/KXH1rRIMD4cDmKzFpLPi78n8Cy6oBokh6iDqoBmN/tRgWI72lP6ULrbln/ZVgBDDLLM2WPqnE2OYKLfhtsQdjFIw5r2c462QRjNQ7odIG44XbM5vRgubV2u2RsD9DlcXH0X8GZLo+Q+T0y/xuA==
Received: from SA1P222CA0176.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::12)
 by PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 00:41:23 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::4a) by SA1P222CA0176.outlook.office365.com
 (2603:10b6:806:3c4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 00:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 00:41:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 17:41:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 26 May 2026 17:41:11 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 26 May 2026 17:41:11 -0700
Date: Tue, 26 May 2026 17:41:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
Message-ID: <ahY9pRlJj2YMXrhx@Asurada-Nvidia>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
 <20260520063714.2440584-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260520063714.2440584-1-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH7PR12MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 571548e1-4457-4482-1ae8-08debb88acd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iDhJXQ+jXfX3p20+PuoLcUIA7bHtWh0xlRezNbFJucD6b96KWn5ymfM+cqtN71OvTq8YRpGBa624ILpXsNnSCpJ/2RU1q++RcO6yaHAq/ur+cWfZ2g3RFzqAE9s+bO048i4mMQSHEqRoJS4pWRHyrrUOOSRTc4o4t3X4S5VIBK6XDv1LMZuZeLCZhooy93WpbYYOAqA3FvdfmlbeZPPG8LCP6FApVhhzhUW5v7CmUMQhAcq/T2XBy55WtnOJw+/HxTa+NEsW0z1idHO3R39AJXyYgOom/qRLt350LLjeBOV2Ptw9Gr3vwFUpIOoTnL8HAMRkFh4TGcT3LVHOBaqpIKOJXZKAdlZKcJDtfLfearEEAPtbBstFyNxuWg5MY5WWyRaAx3RanZs7g0pvmcuZkIB33meAQ7xcwdFff68jIpdntJdCcKN1AigOw5r9c1STTrEQxdzc6beHTl9+rdC8OlG7R0kY2WMxF/fQMr41F/vZycXhwVnhdeK2tiTM4pqC1GUg7SYEU36CjsS8Sv0HaDwx/0NgJuXGCAzPhsf5M+C/L7aN4kf+ezC5uwVQkgBz5F8CAllUoo3Lm/CdmxLIatSCfWZ0Sq4L+0e6iXgikAAL1FZn9znHuMryMLxLhQZyIiIlf9rODwVm7l61G413jCaICWOj5L7uLy5rVZdZUbjDODkqhmy8DpGiOhn5Emj7jrDW3Y42LRjoYBj+2azFIVAD9fxIax3Uyi2DIisENJs=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QXCZ1VCkK+p1ogyHszqxL8y+fK5tUtn6Pr4SFTcRYR0bi1rN6/4tU2r5/MXqWBJyXPIFIUFOxL2XsIh7YpnbCLPUI9wAXPlTxqcZJzm5+tEiYOr6rnnMfhsNNa5UqLDI93MlKk/1OAqOg35XuT+pZ5DD6URquzZKvOxaH8bN3ls0RvipTuHFRVDKemQxRTuUVQ6O35jnlGLulPFP5cKxTS1aLTHl/MpYt0fAJB6X/Nf59iBUtUhAo/8uMIBQtV2YYyqCZhMhFP2GsaEpkdf8i7o1dRq98bLOeE0KVzQSlk95BQlVgvbkBSrpyB6y62Y+PTJ8tWlNlVf2qzFqMCw8T8U/ceZavtFfIwjqRHtmiRqlpQUzgSpOGQvrC5TdQUM+dD5yIjtwphUYK2CKAwBOlwksDEOobuBlbzmnDxRvr59KrWwSajARISn68a9fZeGj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 00:41:22.1778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571548e1-4457-4482-1ae8-08debb88acd4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_174132_763317_146C17DC 
X-CRM114-Status: GOOD (  16.63  )
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

On Wed, May 20, 2026 at 02:37:07PM +0800, Qinxin Xia wrote:
> +/**
> + * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
> + * @smmu: SMMU device to setup debugfs for
> + * @name: SMMU device name

Nit: "device name" sounds like dev_name(); maybe sysfs node name?

> + * This function creates the basic debugfs directory structure for an SMMU device.
> + *
> + * Return: 0 on success, negative error code on failure

Usually, a debugfs_setup function uses void as a no-fail function.

So, perhaps it should do the same? The caller only spits a warning
print, which could be a part of revert path of this function if it
is really necessary.

> + */
> +int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, const char *name)
> +{
> +	struct arm_smmu_debugfs *debugfs;
> +	struct dentry *smmu_dir;
> +
> +	/* Create root directory if it doesn't exist */
> +	scoped_guard(mutex, &arm_smmu_debugfs_lock) {
> +		if (!smmu_debugfs_root) {
> +			/* Once created, it will not be removed */
> +			smmu_debugfs_root = debugfs_create_dir("arm_smmu_v3",
> +							       iommu_debugfs_dir);
> +			if (IS_ERR(smmu_debugfs_root)) {
> +				smmu_debugfs_root = NULL;
> +				return -ENOMEM;
> +			}
> +		}
> +	}
> +
> +	/* Allocate debugfs structure */
> +	debugfs = kzalloc_obj(*debugfs);
> +	if (!debugfs)
> +		return -ENOMEM;
> +
> +	/* Create SMMU instance directory */
> +	smmu_dir = debugfs_create_dir(name, smmu_debugfs_root);
> +	if (IS_ERR(smmu_dir)) {
> +		kfree(debugfs);
> +		smmu->debugfs = NULL;

smmu->debugfs is NULL already since it's unset yet.

> +void arm_smmu_debugfs_remove(struct arm_smmu_device *smmu)
> +{
> +	struct arm_smmu_debugfs *debugfs;
> +	struct dentry *smmu_dir;
> +
> +	scoped_guard(mutex, &arm_smmu_debugfs_lock) {
> +		debugfs = smmu->debugfs;

Isn't the lock used to fence smmu_debugfs_root?

smmu->debugfs is per-smmu and freed per-smmu. Where is the race?

Nicolin

