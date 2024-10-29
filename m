Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6400FD3A66D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC4muGrsU9B2auMmXWAbB8BmpJHcMBfiOjHXgKjLieY=; b=E7KGuJQhkrt5ykBsJuwGAvWdeU
	n06dF/zslZ/DtN1F45XUu86rwVjljasbTxT6tqfX9Ozm5CjNvTg0tqieVkFafmro0p7BD4ksbA1gz
	krv3Mte799kl2ZIB7hx99Bx0ynFdUfZ5yfBq/H4FteSTFmQSlKG6upBY9GQiBcwvxfhpmioN1pptl
	DzTvRrz8dSivcKvS6wpEl3cm5yeafatTaDZhYQeJ5oH4vDY3UGfWCKiwanNcRPfo93E57ZYCvQCbO
	+wXesj/PKtD+gXvZRyAFGp1e59pPZyi5TO0fL2Wk0o26TnaA6bJ/c1EDD6ndZt5gmAJP0m97Uf+tR
	hBDHD71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oW1-0000000F0nc-1boG;
	Tue, 29 Oct 2024 15:52:17 +0000
Received: from mail-co1nam11on20600.outbound.protection.outlook.com ([2a01:111:f403:2416::600] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oGl-0000000Ewrw-2evF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rjl34GNFCtmcotx7XdSFNFgfK9nJzYjP7Nf8BpGKf9evJz8Tw09MYcrGuyZk5GDtk2mrMtSQr+5WMISgfyPfvZDenxPQbzvqsZJxvq6Y4OF+LN+myzzErfQJTk8A3wia9QXMBtTa4rEhxRVWmXT9Mk7HmjmwJy5ydLoNH3n/va+fYjQkbu1+YqXf08SUOCZxdhmR5dSDFF1O1tksdyVGQ8QnZ5ykvP2Wav+NjIsxoqRLj5zcxE01WMq24H97kXf4emzROfS5S6/fC5N61p9jOeUo409SMZ7Ys45LQlMuqCcsBq6N2R7iBIuvcLz9toHJq7WufN8XKPikNYD50Pf89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC4muGrsU9B2auMmXWAbB8BmpJHcMBfiOjHXgKjLieY=;
 b=A2BKFUknw/kECKkl9J/jclEE4Bw3COuOLZnZ5ErDY4HTFC41LWFYJEc8M01xutc1HtvIqb4z1+aI5v/C3Wr0516CTixUfH0g3kgu6ieJMSiW1i4rAgl+IVSspw7Zfw/fknGWiIUinMoSC3Bkmn4hGK8c8kafOY4D5icsH4crevqITqWwMgd9Fj6TBO+kO5MtE6THDKEmqrR0LufMerFqIs85kRqdCilKGqOvdXtlCyFjXgA/jYmhZ47U45qzwUNEybQjLNE1+eGpFTGDiRNX3QT5mOXPx6XPB0SrGHsxXw5YmCmrHb7ww+2QOJ5rBcH4ACuIQ4ru2XyzJaf6aAgrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC4muGrsU9B2auMmXWAbB8BmpJHcMBfiOjHXgKjLieY=;
 b=E36OvSH1o59N1hG2soVLXKRIcmbMIsANOYBr1et/oqnQIefx4eaaTde/PHeobInDpClDcVXa9+Z/GA+zOnkRSCQp85XzGHFGx1I1vRRtERxIJV4lMgLHto8a8r8S/kjO3mF2o3s63LlGUdAonMZAFOgHn7e6M01HYTsb7SY6QwlSaZ/EOd2d0CbaSK8wYT7Zl3ZSjTm+EvueS15MYF2xSaSmt6hZwFCv0gHQvFdKBSoRSATTN1ss6gWbaxOYeNypu0vjmU5ZEHyfTYvjJcyvgK4KeWCy1rdVTi4juCYEeWW8iAhNA4McdhYoq3A+YLEHYTdoa7VYGtkg4pVzfQN3AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV3PR12MB9093.namprd12.prod.outlook.com (2603:10b6:408:19d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 15:36:25 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 15:36:25 +0000
Date: Tue, 29 Oct 2024 12:36:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	yi.l.liu@intel.com, aik@amd.com, zhangfei.gao@linaro.org,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 04/13] iommufd/viommu: Add IOMMU_VIOMMU_ALLOC ioctl
Message-ID: <20241029153624.GA210796@nvidia.com>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <f24628d774181da6df6e62bfa3376fbcacef8906.1729897352.git.nicolinc@nvidia.com>
 <20241029145436.GC209124@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029145436.GC209124@nvidia.com>
X-ClientProxiedBy: BN0PR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:408:142::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV3PR12MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 77206051-6f6c-4d29-0871-08dcf82f72db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A+hJivdOd0vpOcB8pAy59fWqI0dhkRfl8HIAWAscbauKbGeUIKdtY5DXh/wQ?=
 =?us-ascii?Q?QQbTn42OmlCOdtv5H2O9JsDDr5xqC2bYwh7W3Um3z0azDE2QTHPHXw/Y+vbp?=
 =?us-ascii?Q?sVqB1zmtAhHSDVeUr71Mg0ysu48/+sbVuU5gRGuid2eASkprNXQYpI3QuFyf?=
 =?us-ascii?Q?RLoJDKIs9sUg7KlHroOu1iDoBdaQjkMrPVmEQouN6hw+qHxX2UQjBcF4sc2W?=
 =?us-ascii?Q?XVjnu6ozvcWBdGiDva8xyZonaeGoFeWLuceTH7kIOGPgtszSsJUajxE2jZ8f?=
 =?us-ascii?Q?+0OSgPrmyEbh80l0AdZOcrqA5Y3WnsgLfMbTaoJKR0HLd+ZX/Ivm8qK23cO1?=
 =?us-ascii?Q?CO2fu05WAxeUY4mOJHlN1SniVZTKS1islWNNqkNLBpa2aU3QECUWFySGYWTu?=
 =?us-ascii?Q?jkPa/HZrxJ5gjjPIvLWfGUibeBB7vhh/VOL9JRoLhnR3OP1YKDI8RzH9xSB0?=
 =?us-ascii?Q?6ThKviYE0FDFHb+zvjorDnzqsrxMvg/8g/DtNZqNegBLta04S2H19IX2Bgiu?=
 =?us-ascii?Q?+u/vdvYawcSPFYPJndFhz5xJF8BhV9oFnvJ3Q0sb4hhQ/yJvVL9n5Tv8zKE3?=
 =?us-ascii?Q?zqDPQkp5RTBRmzHnvY0/kQa8075J9ILPn5lFXQiWfGB4gziS/D8NR2iYiLE1?=
 =?us-ascii?Q?4urIkcxZ6y9wOz622LdjBBZIMCYglbdPijejQBAU/DWlvjgJpULo667rSht9?=
 =?us-ascii?Q?h12IBLBbCGtFUWLvI1DoAFwwnNMYJ6jjIPcElxIHq9Gle/OrhVvHvoInVLhC?=
 =?us-ascii?Q?BL/UrODrvJc0VxCJ/S3S37ZCoHjr6eKD1i1081nU8TFWcoajl0nPE6CPCpDa?=
 =?us-ascii?Q?+Lq5++dLUhVWDixUpN43sjwNqmfurUtrzU6JAMLIz3H++uatUtX0CF7bOe+3?=
 =?us-ascii?Q?UmfL4jJgEopEgIPxeaewqSx0p+egsirGazPJiELJzK0PusJqS+dthWDqMaoi?=
 =?us-ascii?Q?fcwlUN8MBHkjBr8AjMsq3GFxkO/iO8y8DK04X0x9RSbVi+ucmBncVIosIVzW?=
 =?us-ascii?Q?pBY5fs3cWy4XnBH68L3frwBNqto5ef6Zqy6+D8Eyzce/zSmfYWxfK25NHr+x?=
 =?us-ascii?Q?Qk/O2YKQZv+QkosS0csEY/aXLTLTiwetbIe43UDuwRsp2jEhjJaz7wYL117e?=
 =?us-ascii?Q?RX+jGzfKvO8vMN4ClmivfIZVKmt/cfcoHzeUgriGUzggo4q+NlfD/zQt3FLg?=
 =?us-ascii?Q?lpzyG32+lcTJ+FX3Y4ZykL9gatGN8MgVhGpLYNxTaOKTr29SoUgtuflfPPSn?=
 =?us-ascii?Q?PgcSaluM9uEvbr2qSyNtKJ05JNRU6N15dM+SDJjUHxRmK2Idu1VEijJISbKz?=
 =?us-ascii?Q?xAIfNjw9RXguwOSIw2gv6kB5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w4JBFstQsUWAYjTG9PaRXgB0GPty1ldbIsxBWZgFdQwxbpHMtkhLqWztgVAk?=
 =?us-ascii?Q?S4UY+0ZdGOotFyBlLbU7mNpGV/y+74DCY9RpdrmCTFGYSZzOKTJwsieDgjAi?=
 =?us-ascii?Q?NkgaovqGTMbba45YXn3dsZKF8YlqEke8mUoZZqZsOfUSHj+clnhtvZKHH17w?=
 =?us-ascii?Q?ljmvdoFmgeo9UWL9b7tEew4MoWFtLaPD/6lWvcz4J94NxREblYQ7ujygNFdS?=
 =?us-ascii?Q?d87Ro3Mmcy3Ta8ndpKBZzDA2/2f5s+K3Px+CYb++TgMmGIXx+6lTMX/xYCVL?=
 =?us-ascii?Q?e4m7eMpY/DTmuoLuS3Z3zfvorskzRWt+4nQleTNExoCovyA/FtDSWugqdk8/?=
 =?us-ascii?Q?JbIxyxOiPA8Vk9QiZIyBAkoUREumFkgZ89FlNftXRgeNdHFjdQ38kz0BnKob?=
 =?us-ascii?Q?R8KcZA2p52MmqBEZh8/4weheOdy6bZ6UYIygGEvVVm5fSStLjJuZkkxxAmmU?=
 =?us-ascii?Q?CPb0e2xaCtLelJYngfBw9kLD/urYGsdsMhd/jWvnayAmwIl46KSDCZTn80v5?=
 =?us-ascii?Q?SpaHo9VEGEd/3DOWNMi9dkkJ3ThfRIItHpStCRIVu4HO9nqqYOSEvqiYDWXV?=
 =?us-ascii?Q?HEiUoNZcWpmt88HjG4ETTUMZuziHjyfdTlGqUT/zpzNnn9sebaRp4X1fs797?=
 =?us-ascii?Q?0ObBjJw77e6yexg6EOGuxliqhQgRHDCpTpPipkMz3jr7FxVcebFuDkHc2V/+?=
 =?us-ascii?Q?QyvZ87mbeMbyMRm+a6o8fb8cjLkG7bYpwBJ24UE2/bdPTGh8tOleJY3bYQdc?=
 =?us-ascii?Q?7dG3Kj4TTLVx+/fAxFFyhQjkSc7rawyUZmzX+n2+RbWEEdIq+7XFrmHnl4gy?=
 =?us-ascii?Q?zDNRfLWuljMvd2/fv9VpO2qowbSUpUgFrIHhD7Ud3gzxeD0aCmuWThoRX93L?=
 =?us-ascii?Q?bDcyKAbndFsZd6jk81RZWAiXGVs6nGYk1AqjRy6FjAIpVH413jRgWej7sSJv?=
 =?us-ascii?Q?jbIlxNSuxdXbDw5giTi8EDFnmSgi2oZzfnIivGPD30MeMjOQXhemZA2UjrQR?=
 =?us-ascii?Q?zFMwAP6VGUtkoSzs5U8MPG2ZdkymVHDqcMR1d83T478RwCwTiA+YgHGeEfN7?=
 =?us-ascii?Q?SzghpKiGwg6XFXi+lZBc2sxq3EzQPAAirNX9hnqlhReS2DBk54SpCJfECjJK?=
 =?us-ascii?Q?KblhDCCY0pEfFkOvzUx83+/CVRKN2qGE0BEZxllMs/lGRrNY7RJUCMk7O2Lm?=
 =?us-ascii?Q?FNBjtily2WCBaHPQly1idufMXDf45W9ymWkQU/oKD6QuIq+dH3a0sifNatNX?=
 =?us-ascii?Q?ObAXXBElvZTOqn4JdE4ezmzVrZ04DByOL2ArjuxQ7u/udMB0OZ8yuhMd53Q/?=
 =?us-ascii?Q?6KP/hz/u2hX6AzIlApV1njK2+W9BoaXTZY36PD3IiyxIEPpBxi5oPzs83wTs?=
 =?us-ascii?Q?T66XnQZYNEf4F4bVBd03t+20ESU1RsyCSszn6b9iXRZkjasuxzPkNeKu1xdV?=
 =?us-ascii?Q?owgLBDnOrEBPY1iF/U8OOzJvSWjLC01gcNNmU3hGkZ5h8o7QIMFjNNnsiOwh?=
 =?us-ascii?Q?9a7bNO9Nr00espYnnpdOjBvKxL/t4nQwFROXazMBFFCbxz8tAAxP9BQaXI7u?=
 =?us-ascii?Q?JCudCmsBAZwQ9Pd3ZLU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77206051-6f6c-4d29-0871-08dcf82f72db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:36:25.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBFR/UBwv/7U4q1pjsZAkG8TSANfR5oDNVdNMLzsK0m6VA41rH/Nd19h5TadM+oX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083631_699895_E5E36A5F 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, Oct 29, 2024 at 11:54:36AM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 25, 2024 at 04:49:44PM -0700, Nicolin Chen wrote:
> > +void iommufd_viommu_destroy(struct iommufd_object *obj)
> > +{
> > +	struct iommufd_viommu *viommu =
> > +		container_of(obj, struct iommufd_viommu, obj);
> > +
> > +	if (viommu->ops && viommu->ops->free)
> > +		viommu->ops->free(viommu);
> 
> Ops can't be null and free can't be null, that would mean there is a
> memory leak.

Actually, it is just named wrong, it should be called destroy like
this op, it doesn't free any memory..

Jason

