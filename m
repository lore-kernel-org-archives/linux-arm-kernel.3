Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06F4D149C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XMaQ3DP9xk/WemoowKnrvJTGiklduflFsqrQtLCxvg=; b=ChGQuAIqzdTVOowJPClZPT6ntx
	c1pW3EQ/Fpjp9dC3v52BEfJFjpiPPUbBKMml3Cuqy8uvcmpdjgq30R5jL4S54bxsoW6OAZgOHM44D
	SgePdTiJ/V+j/l1O8ROrF6PB0f96A19ecHGRSrOu+xd8TtD9liHyps6JhdgMv1F8XO+WPOlENUjuv
	MISbE7DiqQXeDWFFS/v/IR3mWvKcSh1VG/ooxp8NJ0e8iaVgJVS9C5K4CjPzXAuM9xY2hagEyl9mH
	5DToS33VUH9XVh1aXPsFI0jg+/MuOHMZmihokbmnLeQbeD3Scn5smExuGIR5UZeUueDDexUZzEUzX
	T8nnJQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NNO-00000004T63-32jT;
	Fri, 25 Oct 2024 16:41:26 +0000
Received: from mail-mw2nam10on20619.outbound.protection.outlook.com ([2a01:111:f403:2412::619] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NLn-00000004SsF-3VKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:39:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfrUxMOpiyBt+uINhu6uAzK8crcdlfqZbxsTuafO8yhioIBgQraj/thRBzRPMaY7wWupV/sCBcN26GaD5qTxCzVLuhCwZS2DPwC41fy5yf2cp8nuu6D1uYStbwCahRuSjFhe58Bdki0LQ0cJ0EIgYK1LeMMHRsqz9LQL3vU/xEQWghOFPorw2Ia1LoamdUIl5dBXpMhLDNXFWueyY3rBAlSM3k065VzigUNpAecFuKd1qukNzf3GeTu0g/3QEa5ayFfdfiSUDa07KsWEQKki+SDtpuXtXXW+wGPBALZKuZX06sRF2c4VluRwHHkmXERCp9SYK/rwA2T448wk363HMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XMaQ3DP9xk/WemoowKnrvJTGiklduflFsqrQtLCxvg=;
 b=X37satIOaWutAE9wGQ0BZraz3andVfLH8tuoJazdOlNgTNcwooM+wF42PLPihTAM2pS3FnW2S0otn9HRXjLa3iGZMHrcFfjF4pI2at5K4gHvPbaSkQMutk2I7HEYQGqf66PH9GMFBMJIcbcgemoQP9DtzXsAkW0n4FYJfYJ/pJWCMGdwb8GFTGzjp3R9vwImh+o7mz6kYp+xbLnnw7J+S/1u3fGPHomZD5XVY065JqfnezQX5I/A7HowcZsuskqypjhrGfReVQZfXcRJb4Z+xTlYFrDwFIa2HhPhnN3Qn+tic2R/SyIbAkQeVkNtTbvaYjtK8ugVzHiQHVZxhzKF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XMaQ3DP9xk/WemoowKnrvJTGiklduflFsqrQtLCxvg=;
 b=udXf5c3A/J4NiYqxJwhj15XnPiBQet2IUqySmZ70yicE+jPk1bU43Y3gI5jnj0AytyP9OIbYJCjXsqk4Amt2dmPJVVJ0F4i+hKe4U9fnUe5cXFxfsdIHHgXdOlRK7RB//Jd4BSNVGpk9ZvxTbuyLtrhtAfXWH9gUmHVLDUj0vDyR7wbRAXFmALJjj5dmzKjry16+aqG1UfN1hFkLRRQSJ3OaWyXJg2ghpwZ9xc0krHyZaggbb4eJeTiTL4OPKjclQ7twaY3afGOqc3JNfVbfeBNFVEEsxkCrtHAtHnf3cmbruxzYSRgUx2Dig1fu+oPfV3rWFZnl+FdjH2pem34XQQ==
Received: from MW4P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::31)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 16:39:40 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::74) by MW4P220CA0026.outlook.office365.com
 (2603:10b6:303:115::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 16:39:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 16:39:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Oct
 2024 09:39:23 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Oct
 2024 09:39:22 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 25 Oct 2024 09:39:21 -0700
Date: Fri, 25 Oct 2024 09:39:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Alexey Kardashevskiy <aik@amd.com>, <kevin.tian@intel.com>,
	<will@kernel.org>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>, <zhangfei.gao@linaro.org>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v4 01/14] iommufd/viommu: Introduce IOMMUFD_OBJ_VDEVICE
 and its related struct
Message-ID: <ZxvJt740XDjRmEl5@Asurada-Nvidia>
References: <cover.1729555967.git.nicolinc@nvidia.com>
 <ec230c740b649bba1ca4d2ef054d90c79be4be28.1729555967.git.nicolinc@nvidia.com>
 <11dfc0b3-9e45-4f9b-a029-714105fda9c1@amd.com>
 <20241025132054.GE6956@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241025132054.GE6956@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e5574b-d44e-45ba-d387-08dcf5139ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O72FkXoyD/h/hVuRHxRx6eaBrCz9rb6gEp77yp/jw/exgu2sjT+TYolvcRf2?=
 =?us-ascii?Q?ZmSSva4bkBkhQHJjZ+Jh03jcErIX4D4yrIIYrODUNX9TXmQ0IH26VOXfDqC8?=
 =?us-ascii?Q?fb8DGgzy+eI/kQOQw8YKDLmhKIvDqAOZfpj/+eAuDGzaEW9pKcl/o27iFD57?=
 =?us-ascii?Q?JgYttcNdML+w+KIZ3Onlp3A6jV2ZDEclzl5CeQV8/LrPUzbTtla/s4Uboz+k?=
 =?us-ascii?Q?0MSySkvHUELMWD4M5mrRhYLYXDo2jTfvegHOip7PdkU4+4VwlMZB7RJ3b8P5?=
 =?us-ascii?Q?NzVuk7dXl9t6oTPLG7I4dmY6ZJDBy8KOlTqdCAfnghGgAzpFwnnG2s13VwlK?=
 =?us-ascii?Q?jlYfB/84ZDLdGlGskjjbVjjEwv7r5lKur+jbs6xOZdt2CDg1YZTcTJj8QwnH?=
 =?us-ascii?Q?lqAcpjxN0PKei7md9F2ry2mYolXg8QMdV8UStJriO+Cv0UzSE2YuQ+NqoCwU?=
 =?us-ascii?Q?xYj1PDNH1NLz/JWHuKrqPUM/6kRIYBJcn0BG4rUB3otR6V4kUwHE7ol0P9pF?=
 =?us-ascii?Q?FSKx6JqbeyrdLpX3slh7qd9JnqcCqFAuieteJwd0m2zlkZ3eD2Slj+jrXVIt?=
 =?us-ascii?Q?Ec1CDhFilOcw9Uz9t2Piv5zzef1hM/hMBLpzBukoI/WRSE1cuiQpbJiVunAc?=
 =?us-ascii?Q?IzMDqqFEIijloikF9nYJ8PJPMzqiCapnQ0nTIzM68TpmN58o8sffc2gmQqc6?=
 =?us-ascii?Q?WpvOR28olqVggEJfvKRiMCF6kR+JivLR4lux8CmXb4Jov//3Fw0NxEnYhUAI?=
 =?us-ascii?Q?vHUBk/56Zl7xvS5FtAoqFLX1bsUKIMZkCujv5SeCajy/6EFCsIvZ+/YBEOsO?=
 =?us-ascii?Q?7RM3SlvWeDCX4iLQtlkdXsck8l49LLCXMIZ7tF9vIpJfWiTY5g8tzgbNP8U7?=
 =?us-ascii?Q?UqYq4ry0RYA8GonGQr8RCp3XBw1L6PwDfDvDnW4x7mWFSHxunKShZyaV/9Ly?=
 =?us-ascii?Q?se5ixQHux304g4TTFa6O0EZkJWJPjiLmNAJUnt152Gl2HnmSZBMVo2nkTTZk?=
 =?us-ascii?Q?tJYTGu21DCnioZL/kQuwVc7YRehfdG07W25dquHX/NxyCdRDRYLVSLiIjW7T?=
 =?us-ascii?Q?ufx00Voo1KVlDE5thmh7/XE6GKi9s0HZGMPgGaNLU513SQRAK3gSEU6J3axB?=
 =?us-ascii?Q?QvQJ741p3P3pXXbzht+yfOoxlx6tS2zNdyMfWW18sX3wAkUaVKk4AWGUzGqI?=
 =?us-ascii?Q?2GnfX++hLBA+A5AGBCqJGYSI3SAw11MUZhlQCc8n31a1pl/C4EPURs6/xkM0?=
 =?us-ascii?Q?fZNfP50dLKvWWg7qHAnGzHqW6b6PHn1H4i1gfmDKiMywJgFfW8018xlALF8S?=
 =?us-ascii?Q?yKyTSpS/kpm/0gCgZlRzkRweXE7I1si7+E0ZBeUUhxUXGJEMwT0XdLiJQs0V?=
 =?us-ascii?Q?FkyaqeE0GXStDJrO43pPD+8q9Scv4sUw2yGH8kFydNV4EN2/jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 16:39:39.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e5574b-d44e-45ba-d387-08dcf5139ed6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_093947_887148_8A4836F9 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, Oct 25, 2024 at 10:20:54AM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 25, 2024 at 06:53:01PM +1100, Alexey Kardashevskiy wrote:
> > > +#define iommufd_vdevice_alloc(ictx, drv_struct, member)                        \
> > > +	({                                                                     \
> > > +		static_assert(                                                 \
> > > +			__same_type(struct iommufd_vdevice,                    \
> > > +				    ((struct drv_struct *)NULL)->member));     \
> > > +		static_assert(offsetof(struct drv_struct, member.obj) == 0);   \
> > > +		container_of(_iommufd_object_alloc(ictx,                       \
> > > +						   sizeof(struct drv_struct),  \
> > > +						   IOMMUFD_OBJ_VDEVICE),       \
> > > +			     struct drv_struct, member.obj);                   \
> > > +	})
> > >   #endif
> > 
> > A nit: it hurts eyes to read:
> > 
> > mock_vdev = iommufd_vdevice_alloc(viommu->ictx, mock_vdevice, core);
> > 
> > vs.
> > 
> > mock_vdev = iommufd_vdevice_alloc(viommu->ictx, struct mock_vdevice, core);
> > 
> > as for the former I go searching for a "mock_vdevice" variable and for the
> > latter it is clear it is 1) a macro 2) which does some type checking.
> > 
> > also, it makes it impossible to pass things like typeof(..) or a type from
> > typedef. Thanks,
> 
> Makes sense to me

Ack. Will change accordingly.

> And the container_of() should not be used in these macros, the point
> was to avoid it to make the PTR_ERR behavior cleraer. Just put a force
> type cast

I recall that I changed it for a compiler complaint. But it seems
to be gone now. Will change it back.

Thanks
Nicolin

