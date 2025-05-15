Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08991C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zITZIhVP3HHsz2zhQzalhOP+fE343sw8OlKE0+4V3E=; b=splehDRntAxAmpIh348dhCQ7wn
	AbhjcD8iLuRSfceLA4cB7vsiY4TFGZExWTolAMxg4uIZXIeQsj97jXcx1sWowyFrhCJfi6WZ0m5Tu
	XQ7eS7doiQixcFrqPYgCkaE3ICm24N+/dVVuBQ4QvIfs6IPJVzB1hfJvFBXlPX18up+MmcrElGRWs
	lQ3BItaqSmdNl/Wwr98yZd2zMhirqX+vrxW8Q3yoXfd8kEEBgNddNoHnFCt6uwu/xiyC0hYI2Vuaz
	t7RVHOPoO62KdW86k6v3v1rtR9VGZNKTQBeeHAHJZT4igbkoMy9sXRBthbTX1h1Q3PRuXaySZi26g
	D8IHTddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFai0-000000015mF-0vbt;
	Thu, 15 May 2025 15:41:20 +0000
Received: from mail-dm6nam12on20629.outbound.protection.outlook.com ([2a01:111:f403:2417::629] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFafx-000000015Ks-2x1E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJNMIm6W3gucFcxqwICUmhmXbxr2Rnr0pFyLqqK59EAXmbCGEzYMvD4wOAy2Nxq5aeVOc+bT0MwqQlUVF3PI+he+LE+0gh0l1+HxIWQAfOBiNp44rUQIwRN9bFA4XLqF0Jk/h6FZqwN7MBuXAu8Qbp+QoJc7tmjylSM4ijHPm8wNHm3AKYh6n1DFv9FzNQdqtbYUk+uyE/7NyQXkCRX8WFP7RcEOBgdHZrnfRsEiT2D7gMJ+rpGqZ8B8uH568B1wSBujASX3XcL5G9zLP6nrwYgfdInY382ZJwquUcxhv9qehVSkA2MyiaPD+HTCBja9YBJYBHhxAcOGBDSISgmlgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zITZIhVP3HHsz2zhQzalhOP+fE343sw8OlKE0+4V3E=;
 b=K6E1cxASb/EO/vuoJrSwT5AUFyK2opzbl7JLGqS/4ldvh7zxz94OEkuV1twV/KJY8hpnFC34qDNvr5CI0gu3tCGqh0K/5f7E+ZNJiDXg5HoCKoJgcWdDm5Wlmuv4QhtUTlJ/nO7vEk3wRJ9yM/20caQxCGTCCuRTEu84N1loOrqByzitCQsWzoat10yt0uo11q3xANlMNogd3WMMzoTqBR4IsvAlbHf1R++uqaEhJzDp5NdCCRz0vTFux+g/PrjaBK+YWArev+Mf5yIuzBFfRdOaX3meEwaK9nsgVan4PNq6YwhVx09yC2Yp+bmBhnyn9qQ50+3rTJE+ZiPS/c50ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zITZIhVP3HHsz2zhQzalhOP+fE343sw8OlKE0+4V3E=;
 b=CZYY/kb6f+AYhIuVlg87xzAHsGJz/7ysAXWkxf0LuSIxRKX0cOtDX5nKX+kuLmQHeBuxn1RRtVd3Eh7xDR3c6PPTju1QKyDYopBOTBIFq7EsEn/xsCVXUY4hde683w3JAgiAKqJDO2SJcGApwz73US2FJAo7pIKhnv1TgZRkrfb9gsdQ+VpDxV0MuMbUj+51dWpunb68rum45F01alz+9ospuQ19NIHvB8w8jsUGfI3TZ2p5HLWAiq2Wj1LGIlA67t7i87f7IDXuLkOm6KnwXeOyd5+nu4n+9gGPogYnq4UXm7k4mjBUBjcJQTka7ovnCeAORuddwr27cZUfB64AyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:39:05 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 15:39:05 +0000
Date: Thu, 15 May 2025 12:39:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v4 10/23] iommufd/viommu: Introduce IOMMUFD_OBJ_HW_QUEUE
 and its related struct
Message-ID: <20250515153903.GI382960@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <bedd9de4e24bb89f18f4b13b52c5fdb6db6bd889.1746757630.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bedd9de4e24bb89f18f4b13b52c5fdb6db6bd889.1746757630.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YQXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::34) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ddf9ac-c473-48f3-86eb-08dd93c69fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dzBBoCERQLG4OQDhpPX3XNjHo9/8yacqpQUHMTwPE/ZjkYyEUhIOfiFRIZ1h?=
 =?us-ascii?Q?51wzlhMYMQLLVMQCZxBJC7X3IcHrHjzNJ4iguRrIRg4uEzdfz1+4yw5iKqLU?=
 =?us-ascii?Q?dCmFP7/CHQ2gI2svgJhYIE9jh+w1Wjfa8hCDmvUFZA/JEsOgy1q8/A1HUdiB?=
 =?us-ascii?Q?MgJf7nU+0FjELgMkBk8NxAiVss08irbs/eQ1Yanl1BNX+6zMgMgBIFH+fLTZ?=
 =?us-ascii?Q?zThTgKRl9ljg3OHl6RhcIlq0kpEqTxw0kqYUtDA28qAFmba5PY3Whfwqd8lm?=
 =?us-ascii?Q?kZol8GQayv4GF7Zl0tTclwy1SAjpAZVz9cYxTehFAdpMN5XVSU8sTRGxFNKK?=
 =?us-ascii?Q?+UkWlLxnvtb/dGM2HSQIPjU3ycW4hIxQcCn2BdJAWMTvSWq613cdh5WUSh/Y?=
 =?us-ascii?Q?ketq0okatnOMVYC+l2OoQTtBhfmRAsQkzlxgL6yo8HiN2PrLVM3z6UfqIosN?=
 =?us-ascii?Q?HlcgbSwPJWKzQ8+F4Awf8BMdJIuD4IGBImyr5EG7Ec95q4vuzmdhV6mJLNPL?=
 =?us-ascii?Q?hZ/U8yzUdkMXwbZyBlQc+XcGe+mm28QwNGQjIVvDS9rQFl6+9qYN346J9tN6?=
 =?us-ascii?Q?MqFYpRDFtlCd5/oFtYYAP2oikDU99aZBVVTkrRPromo4tXJls3JB9DD762Ya?=
 =?us-ascii?Q?LZWDRgKIuVWpnMZyJdCobQ6d/nhrlVCIaj/zddDMPYEaVHN/9WAn+0sGI9PV?=
 =?us-ascii?Q?JkMPOlWWuqJhTY/rXThdrpoylnyylyN3BEYIAy5uDQc7mvIF8DOY/hrpZpYA?=
 =?us-ascii?Q?MbBCSY9tt+icgXJqEA0oe1bssCxC/5Akn4v+ocqZ7/Psfa7miN/k9Jv9pXxR?=
 =?us-ascii?Q?DsHi2Si4rMaWuU3E2zfMBmkEM+5c3TGDIP/iHZ20KHcacDh9EFs5cW81DMRS?=
 =?us-ascii?Q?M0SXuD89j0qS5tKnr1FjF3dFZUbG1igYMnYr4By97mGDepboTSrVYQfUht0j?=
 =?us-ascii?Q?17CvLxJuRCAmu+aciKY6F9NqLUtxidnpdqKXQmu3/eOXpqHhPjEh6edT8ux2?=
 =?us-ascii?Q?FOJZg0r2w0A8aCfaysfgi6w6uRZStwkOILY1jyR3X34mgfwqaUUFfpRJOFTX?=
 =?us-ascii?Q?pKBf/S3AS41nAFEBs1d6e2agFKKy7jxdntpskVXtYNFI/YzBdIysgBgs0xTr?=
 =?us-ascii?Q?LnjNQ2yF7D1oQCRxs6Iy8Trpw9JHqi1jdnizs6rUz2LOHCLDzxocvj76XlD0?=
 =?us-ascii?Q?z2caUZuvanM0Va0/8Fn26Oc761Mm3Ww2iGIUWy+0eutrnBWZve3Q1wbKKooV?=
 =?us-ascii?Q?CCLh4i/Nft9J9rvG/JIpbfvBt6lXVN5qlruJZMW24v0Y8k5svSbl9XFMD/24?=
 =?us-ascii?Q?+vVVbwtV4oBGXxXK4YzcmmWu0Bo/HLgWIj9AW1ksoODpi36Y3qjxEJ8wqgav?=
 =?us-ascii?Q?ZRLZFT4AZxcJ7mE1uhmlPMOl3r9qTyvrlzKSmk+JiL2YrB3OpUu6/qUb7jaY?=
 =?us-ascii?Q?kQVTn3Aw+3U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+tJAulyhJ5hf9CePsfgphuX7wFcIgviDtsLijzHNmwrXJvZ9gFJJdVurTMQ1?=
 =?us-ascii?Q?XtKnCixmsbad8V03+d0qYDq5rV5Dw9gfBMSTaWhh15/RzfqM86lZVvj5xhms?=
 =?us-ascii?Q?dxPux8Ct7K92GaKQ9NYspLx2T16SjStj93Ahe4mwrpusa4If9YAhzQIqp+/j?=
 =?us-ascii?Q?OVgdcL6r/bYRFpFOcoX3o98+xmWn4I1oro8I4SLVUriN4X1JRBEXCx/2Rje+?=
 =?us-ascii?Q?z8F/qpdTtx/1KiWyoVvWJZr9+Z8vzRgFdDVoF9/12KPWSAHsSiAtg8I23KgU?=
 =?us-ascii?Q?Z13wdB6jyHIb0+LN7TsVuD6UPFc9FdG6FfJsGcYTggWgffNmGHdE1x3yi+0H?=
 =?us-ascii?Q?Lt0GfWcJE++V0sPDrVmZHayW+eTzPDt07dBusm2XiollLAE30sJfqJm+aBp6?=
 =?us-ascii?Q?wOiddkmPvBtgWGzeq6qM1Qya7/Gr6ir3mwr2f1JuBFP5AOa5c/9PMBCoM+r4?=
 =?us-ascii?Q?e3mF28DapROEXTj3vsGxVswoRAltDbEKYjMSVbX3sxg4TKY/1vBv9nP76Rj0?=
 =?us-ascii?Q?JhPChEO9b/nVy5DuqyXPPXZf8mgmblpoNEgnExDKI4uCY7dgpPh1jr72eciu?=
 =?us-ascii?Q?DvoRW3GR2GW4rWct6yiwj+N9ZBw24M+59V1wsYvJppHwHYfKRJT/7saj0Txb?=
 =?us-ascii?Q?xslbQHSzyYpKCp46+LI0ofKWxYaHGOtEkF5WmGPfsxH/9ljyWiU+t15aC1N3?=
 =?us-ascii?Q?oZkMfE9CLS+8CpcWmNfoarewovpFU2VOnJhaJaKI3tco398mt/u2i0yDPZzE?=
 =?us-ascii?Q?PbomfNCZJwjGrTVwi/YYn6l9jZ4JO7u/+YJ4zsRCgbdCn3TAXp2uov+hMk+V?=
 =?us-ascii?Q?evf8x1KpxMmV9HMW7kn2f1MxLKymW3+jWUkSsbFHCM9D7/SMS5w6Yiyk5bL4?=
 =?us-ascii?Q?dYQG7FNf5OLCh/qiVRB6mqWBC+ObSdFcearW9RICxpx6JyN49YZ6JHNImAK+?=
 =?us-ascii?Q?IETeIiLhsUOpQax4oP90Xj9GGCkG7v7u5x2zu5KKrzpxFSwqnJC2MZIuqgw7?=
 =?us-ascii?Q?6huEHSWy3YwjBvK9oqIZ+M5KAxezlIHBn3w6+VLjAnqo24STpapPShkKgp/x?=
 =?us-ascii?Q?0H/e7Zfn6KAGhm9XbS2NhhM6q7EYFG252mL0eBnufYPw7viMKT3Sf9/Wqr9c?=
 =?us-ascii?Q?VwCmQIwKXfyFyPLTrHCnUaFZADD4OGYfGRCWbJHThsBASlDF/CdTgEF2omIF?=
 =?us-ascii?Q?lCDC4moka/TJAB0rfcRJDS5wCw7TCkgPLODIB9LdTUog6fps2nxxJ5NJaRig?=
 =?us-ascii?Q?Qamlm+xXusjCc6+q0nhulzIV3d2K6mWFPH2sJn30XOPyIBeg2CfGrmplIwyd?=
 =?us-ascii?Q?C54L4DHxRQHlRU6xEYqSjezcvGe7PT/F8ohgTjU2CNZGRA8NrbRAb5YZyWgg?=
 =?us-ascii?Q?G89lGP39/zD8dQYX4j9AK70aFS2ujQLCxv1ynv5O9cMYwh4K9n9Q0CDe2IT9?=
 =?us-ascii?Q?HE0f25XraJ+WXE87sskDTWtXPj+Oe6FVOSPRm92jm70wPGRjz1+n44CSssa8?=
 =?us-ascii?Q?S3VLJ4KP7hGf0CiDCcVB6H35/Qgdi4ztCK8dKt8EHEV6hODeZ8YXA8K7xzNf?=
 =?us-ascii?Q?dMH1NZp2164d6tTdHK2du1WbUKAV7qEP7fedEzoZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ddf9ac-c473-48f3-86eb-08dd93c69fef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:39:05.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaPMn73LV6N1A5tqC4KFQYQtZHezvFgxNOxQKJgzB8PfMDI9vixs02jGFGv1JlBH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_083913_770431_93C3A2A2 
X-CRM114-Status: GOOD (  11.29  )
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

On Thu, May 08, 2025 at 08:02:31PM -0700, Nicolin Chen wrote:
> +#define iommufd_hw_queue_alloc(viommu, drv_struct, member)                     \
> +	({                                                                     \
> +		drv_struct *ret;                                               \
> +									       \
> +		static_assert(__same_type(struct iommufd_viommu, *viommu));    \
> +		static_assert(__same_type(struct iommufd_hw_queue,             \
> +					  ((drv_struct *)NULL)->member));      \
> +		static_assert(offsetof(drv_struct, member.obj) == 0);          \
> +		ret = (drv_struct *)_iommufd_object_alloc(                     \
> +			viommu->ictx, sizeof(drv_struct),                      \
> +			IOMMUFD_OBJ_HW_QUEUE);                                 \
> +		if (!IS_ERR(ret)) {                                            \
> +			ret->member.viommu = viommu;                           \
> +			ret->member.ictx = viommu->ictx;                       \
> +		}                                                              \
> +		ret;                                                           \
> +	})

This should just call 

__iommufd_object_alloc(viommu->ictx, ret, IOMMUFD_OBJ_HW_QUEUE member.obj)

And all the casting and asserts should be in that macro, move it to
this header

>  /* Helper for IOMMU driver to destroy structures created by allocators above */
>  #define iommufd_struct_destroy(drv_struct, member)                             \
>  	({                                                                     \

This is abort not destroy, the names should be consistent. But looking
more at the series I think it will be better to do the little rework I
suggested and not give this function to the driver in the first place.

Jason

