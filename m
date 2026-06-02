Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D58CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 00:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnAVxk5zckAuEBNYTRV8dH5DS18Sz8pWfvh7aWauE9w=; b=WlchKv0LUdIcvfprn6LuvmsPt0
	NOYkuG+GjhUckXx5St7j/fmlYRrNXbcE8GVmM6mR4Ez0EldPqEFARTqZRSdP5FtOAhL3UDbTE3Ejv
	mQFK35XUJzmck1vIN+U2wwwLga1jqTK++4lha7fBZCfi4ygo2Df3N4WriEcjmuUyht8OSuNyXvm8P
	5qyEXTY2kLm8vZgXYFHsqBInxHGxTL6xOi2EJKb70/7eRBbcXvvQyFQjfJ+dQ5w3MDV95NJz/fR5A
	XhZOWf35cYncBD0HzISkhDFD3JAW72VKh/D7/uOOt4IrAEbWTGv/9LfIqp6akBxFXV2eYTbPNM/GL
	qSeaA3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUCvz-0000000C5wZ-1MgO;
	Tue, 02 Jun 2026 00:24:43 +0000
Received: from mail-westus3azon11011023.outbound.protection.outlook.com ([40.107.208.23] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUCvw-0000000C5w9-2NgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 00:24:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beqEa3dr7KMF+3a7+n9/ha418g+YjwW8vlGOt3KLNdppfA7CXuuGT91PsuUy3Oee3JwS2rlp4hTu+yrNCG6jSkq8+azz0ndVUBBHY8p1HgtEJ54Sv15LnqG6ylA50uRU0gyzcblVRz/J3ZVnZ1vHpwwyqsC4d9L1xHvwSPjea6zgjTynmyqxCgop7KXjSG7vEGBOkCxbT1veLcHce7Q8FitP9MdUf/IWTqPa3UGeIJa2dOKbx+X67bodyn5EMdhq/A8wIjwXpMhfro19Hu5wuLFgHPAeLZCOLU5hQ/VXreH6+WrD2ub6HXwHjYjFfK7KbxJcGX0X/mXhW5qL4yEQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnAVxk5zckAuEBNYTRV8dH5DS18Sz8pWfvh7aWauE9w=;
 b=T9Ev9+ncSXuZ7FzweWd66vimuvylzgtZiOlxZ+6Cbe4wsBYpyu28x+MSwMao17xCdA1UX4FKZwY1TbvYg+KCPob5xlDzdBYPdkp6KAhS6xu1bLCy2kwuRgVc+E/rQPu3UjhYmqm8E7qt6n+LeVVyS1GnUOc2XcKS5A+goME5mJM13HtlO7nRnouvwCLw85JHYu3ISyeuSS266G2P/2N/UIrqk8lOlia2v/a6DsA4+Wjm6IETRfkWb0EKWHOWFlSDeUxxTxartK6AWLRwJOs2TfCwOwSP7g2E0ThCfyBgMjujeEzhiRB7AvjtG0okJ1+OxIDygxt5KeF0+gCJ5fwvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnAVxk5zckAuEBNYTRV8dH5DS18Sz8pWfvh7aWauE9w=;
 b=dRUrPyXBnxUv6Cr/j8lSqdrNVo5qTpQlk3iCGRbUFV6LIprijJvdoCa22k7Iixu/S+4XaA04mF0UGj0QkbIFCYHWMGTRWbXRsqLie4nrk0kFDExL8NEnltBZoMEX3T65l24LrgL2Q/2NTiGLRkujwlohzwJ5fyLqiS1wEl6GWHztKyaxbwR6VIYotZkwlfU8RHpltlWQxQbUoCVQ4NXCle0VjXT41ZJkcnyU3pLxGU+45165l3t1ZUdvoWihN7beHdvMsqM5kQYtam69499+ex1wT8O6DYr7lS5UxrbhlhSGMuw72RgDwGEzsC3858Mvb8FrHt0s86HreFQkrPs+tQ==
Received: from MN2PR15CA0044.namprd15.prod.outlook.com (2603:10b6:208:237::13)
 by DS7PR12MB9549.namprd12.prod.outlook.com (2603:10b6:8:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 00:24:32 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::1c) by MN2PR15CA0044.outlook.office365.com
 (2603:10b6:208:237::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 00:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 00:24:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 17:24:21 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 1 Jun 2026 17:24:20 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Jun 2026 17:24:20 -0700
Date: Mon, 1 Jun 2026 17:24:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <ah4isiGhSScKMotO@Asurada-Nvidia>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260601215909.3958732-12-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|DS7PR12MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4952be-ec3a-4fd1-65f6-08dec03d50a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 4lqnxBobuD2CN2bL2n76fB+Zsrt6c4SMBrudp+kl7VXJQ7XpDBijs+zPt6XzvXk/jGgcq2BtBPbXAT/hK1G2w6+6+TDFq6uXMjyeC4HtazWjZOA6cU1iKf3RV+qwkLYLruRGTPleRaCPp/MhGcLfooj4hBiodSifUMp67EYp0LNbk/uf340ltdOnWy90qE+32g+VAaR3IaB0qaidL2HW8ZTKXoPwPmDEZaelghVIw9t2KD1mOd8d6wLVaBaKrPo86DO8VlWbgOoKbn57CTC8kxjwH7MvqpekM8PckiJiG+kplcVx4Q/tmojXDoIWSijL6LpgvDx4utlSuNftTLT+xXCdX/4sQrroIhK4sSMLRvFb1y1b3c+s/g1SK2mo1FJXm/n7M71adXqyas3KPrhNPuM02yfgR1vGJTNTCWnawDZc4b3lm9DF7tQ9U54eSEFb/JPtgfgl1gI1z+xA1ySFewyAmXP0PLl1eEeRosWIzjRKisWo6B/5ZqHh/zJqc6l7qFX3K0GC4jdosIEV5nD60O02lPcnjSa2V0WKfrGUA3Hd2odKCjrZEkTO4FCHL9zQsZL9IHtp1gstSdcTKSZ+kU86caM95zedLcHb+5O5SgJY+kBIJJ1SoblopvHd7Qa3EnReohBAVKt21BJyiCJI1UILrcwztjpBfT5TJ7MpbsgYP+aIlmkYLLdF7+GiQOlpNXq7Rb4rGOa/YRPOxFse4ZfhnGM8baobFLDQva4sQy4=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ozizsyg/J5MLY4PqTGWf6cr30DwwalCTkr159MVkV/Lg2Bnc8ticlJDOW7Peiyd0zlD379pW6+pLWhFJKTYl5eS709GRy/hvG4NKzl8jX/rSm0oZFNFi5OoZGvgs62mhMik/5WICFO4P+xqSsKJHGBwUmTIG3osv0FpMf7D2MWItoUmXQbS3f9yf8cS/Z7lE0zwhREg5KAEAblLZdHigxOHjBQ7bOoOpQBftNe0sb8Pcd7+UMFNovPVfjQdXNSdzPxHwtI7ukdk6G29lNRNTP/02AA2Nq+tTl6074//ygxPPiPxQxZL+nV/45vceJiUoW5eeELOGAu0jiGp/oUmoHPvG/z0mU4wWqEUjor8IudNQ0tpxwLkn5GOo+1FgcpFCoNGdQqAcb0NUZkHIz5CeIG6KpcPci4O76XjBQKmXDR+wz0WS3ZAJFzI3hVHYLWEt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 00:24:30.9932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4952be-ec3a-4fd1-65f6-08dec03d50a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_172440_631968_796C93EE 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 01, 2026 at 09:59:08PM +0000, Pranjal Shrivastava wrote:
> -static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
> +static inline bool arm_smmu_cmdq_can_elide(struct arm_smmu_device *smmu)
>  {
>  	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
>  }

Can it be named perfectly at the beginning?

And again, should it check Q_STOP in vcmdq?

Nicolin

