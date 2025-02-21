Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E50EC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWEIoKJ2dPR4FvssoT4qNeWkE4q9+iZvxeZwnrzE71Q=; b=M1YQPfnz7wS6NVcF0WWUNSPRCW
	Q1cWEf+YKmKgjR6sjM4m1oC2USsALHBRvrxQX4wGmdGSrWwMxBUgPlymz8nFHDSwVYDettQBD0Uhq
	rre3K40nqzavM+ZFsqlAHNROf3BQeuh3NZbnCFPnodKGfJ+zwmbwWson3JAwUepji5jOzcPt/brBv
	Ox7t2qRdVyY0+qESuvpC980JrjB+BKXs10l1bEaQqByWF6z0VwijCYZhCvcFv9va/RGj3zr+h966v
	jWE9MHKJGugPSSkVSkBMXjmvdZ8rceskZnfd5o6hfTXAQNoZO0v81kdSiTWnIoeip+d0oedxx4n/M
	Iur475hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUM2-00000005spY-3rzI;
	Fri, 21 Feb 2025 14:50:14 +0000
Received: from mail-mw2nam12on2061c.outbound.protection.outlook.com ([2a01:111:f403:200a::61c] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUKY-00000005seO-3CAn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDT/mk8M/gwaJEkLjX9NAcbq7y/2gM9w5jtNRFiClmXtkFGmckNeA/9oVIk5s7BSX4vxq9JrG2nCr+bwGDehQvqZ0diTJiBlG9ORv4lm0kap5IwvrSe9gmBMOwlkN4/c8SPIYkmBifqpb/Cm9xQrXQwmMHXEbBvgcNN6sJT5IUR6XtIvCKd+P/Zo1ThGWfrNWPyl3CJADemqUMBWeI0NXkc7x7roxEgxeE5AvjMf6goV1qXA47EGQ7RiePR316GyoDEed6/x9EgBRCUHX+N60QMYJktLgUEa98seSH3iE76KUg+ag7ns5aqG5UJ/Nrgsdv/Wi7r0vNyFsU4LJ/g+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWEIoKJ2dPR4FvssoT4qNeWkE4q9+iZvxeZwnrzE71Q=;
 b=mTfD3bq5Yl0vFwLqdi0J+m0lT79O3I2BwRAVxFbbmNVfprxuv7GVUMIJKS+lK2kOxU0edllw9ZWpGpw2WIqASt5dUAgLwqs5LiZprQ9eP7rh6eI3h5UcJomJJTDnWvjcso3+HhGuT65Tff+UE8ca5BM+t2nAR/GCSSTXUnYxVE54a6aOzLcWNXmikmb3RtG56C/7Lzp3tYaQhrZ0uOTcYv2Rhduaj0tIRwe5b5KjWzFlu2H6vCqhYP1MOGlCR5H8yarG3iyucyth1Cxt+bkaIpOZFYrjbkrlElHN6H+mbYcfLJ6/KzXlTxrmfUxf6V7Wq72fKwyK9ma31wURTQqi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWEIoKJ2dPR4FvssoT4qNeWkE4q9+iZvxeZwnrzE71Q=;
 b=suE7yiPcGBHJEXSgTtbNXi1SlzBg/404qE2Zq1iUXGZEsIbbBNfP90kZN4so5CqsZGxpsu5dmqDfKGox67hxp3Mw2Q/oP1TU445jWfWmZtcJn7gpOE+MQn7y+6yvIxRZ8svFBWaliQ+T6rInt9HZQpAyz4dHbXZiMnbNUK7Vt6FqYg94OXF+xOixfVWfU0Fze2wonK9C0pu63lzCR68It704BlFJn/uk2haOnRPrY6uUCbPAr5Yk4/NTIDPunt94z6zkHL7cPu8/CnwP69o89LXhFwV9yJcyoGV9zdBsnXB+fYMvMi93Sgxuk/BLslHWuMQ13BtO4zRO/n/HaOCd6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 14:48:31 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 14:48:31 +0000
Date: Fri, 21 Feb 2025 10:48:30 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 4/7] irqchip: Have CONFIG_IRQ_MSI_IOMMU be selected by
 irqchips that need it
Message-ID: <20250221144830.GA285356@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <a2620f67002c5cdf974e89ca3bf905f5c0817be6.1740014950.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2620f67002c5cdf974e89ca3bf905f5c0817be6.1740014950.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL0PR0102CA0029.prod.exchangelabs.com
 (2603:10b6:207:18::42) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: bd995de0-784c-45b3-fa2e-08dd5286cf43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9vfzPfUsMh7fnqIjrjyTVMwuLawjamsx0xz+vfRoAx5UryVg4V9l51qesZW2?=
 =?us-ascii?Q?4Z9d8l1HZ8LMjwKmQfx9cnOBCvsJffHKiSd5Ln8GjL3T6ec97vnV9Jcv6PUX?=
 =?us-ascii?Q?PNdbxEGTNBd3E1FRaTcqlVeOA7ZBFllqsMbWdCbUPZvug05RVFWnjfFhxxA1?=
 =?us-ascii?Q?hrN3+S5nkBa8iw+X92kuVJxDMXFwzN+b9tcaxgzYNgS+bLM0xKn3doaU3RhF?=
 =?us-ascii?Q?j7YQG9P6Z4Potr4hhlJs5S+hJSMb09lqkG3QQ8M9+zONQbXhqPnzVHzgkthD?=
 =?us-ascii?Q?/UGbTslLLIXXH53jdX8UK0Q+lt+Oq831b0EQEPpyxFMzlgdcWuFoTLkc/ZWq?=
 =?us-ascii?Q?cIQgRh66HbUuj/d8bMpKm/upprKY/Ba2ZyXDzwg9ypYlqVLD/CHoP4gHKY6r?=
 =?us-ascii?Q?4KD2GeNMlW0IwGiRDZNjOxaOgIODCy6k5//QpiI92f4hnMaXAEvLMPSVCbHa?=
 =?us-ascii?Q?2koVbFc4J1YJttg0Y9hJ/oceugPkZAhwkAm3IH1nGZ5tryShPFH/Uj3eWSFg?=
 =?us-ascii?Q?0srCZ40mUUOQaUzpWUk5g+AhRHYFwg29IfzhzciTvDfE9ytlgOwE1fH2Eh5i?=
 =?us-ascii?Q?u4xkewMtx6/+mTEPKJSWFU+5JberJwlbdR+fG/QlJ52LmHSLC2yZjh/+VEku?=
 =?us-ascii?Q?cXAGf0JQrCdcXAsEr8bIw0ToBAsueoGfU7aRSrqLtKOxZnsayo91Zxnlo7ls?=
 =?us-ascii?Q?CL4gqKRZjytHnJlJLR+Qyw6CSHXeJDz67cPqJhYvaZn7WXyMC5q9K/N92bgd?=
 =?us-ascii?Q?ZJk+uJiOU7Tzg0rpbWyzkTcV/dvhfGO8Msl374xbXRXU4uR7ALBghg0HrQAS?=
 =?us-ascii?Q?vB2GyVlkQy/MfXPgolllrgalDpAVM80sOMY2nPDigbjfUiDsh8VGNn4kod7N?=
 =?us-ascii?Q?53lBYIM/ygsADt2MDsAwjRE9wQLzuvm0bTZi3BXRtopoiVuFnJOpHKGA/IfD?=
 =?us-ascii?Q?yusaCNptFMk/IqDmBb4Tpz3WNVIM8xchGBXPwrmluSZcu1YIHF0zLaQDNusU?=
 =?us-ascii?Q?dI2VuEs5bLTmipHvl4dz/ei8mrgmJjzqHG106x8OlxlG5jxaAsmLBVfGfcWz?=
 =?us-ascii?Q?CAMT3sn+n0bwlSv2Xk3MzJSSxYhr2IDCn8cRPWnUcz08/RTvT09WkTpHaCDO?=
 =?us-ascii?Q?APXg/SUjPut0Af6Vl1aAO8tI8SLGWaS8i09zHGUMZE3+ZNp+mrGKDZxDlTzZ?=
 =?us-ascii?Q?6cXvYtlOjzMgtFqNZYBqqpSaAt1fM/QVbcWsFdU9JkGuN+21FYUOyzgS++bN?=
 =?us-ascii?Q?f09vyTSTMLFfMqsIVEompO7EdZDU8b13IVGocEzQ8vDcH0lq/ePVe7z3N2Np?=
 =?us-ascii?Q?vdZKRJ1iodGsV0AfZQ80hMCLbiWSF9JsUQohpJz+yFxwwE1iBJ7Bfma5hzos?=
 =?us-ascii?Q?WQz9a8svCEqbRL+pXEFq5CvXxsZc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oHGPSzDn3vqVQuuWGCc3QGn6DhLhaJMv7syE4kPztxZhbXiXZkDL4kv7uVWv?=
 =?us-ascii?Q?Dtu4InQVArcasayxGOHe8T9DxhIxRdkTqAUrODgRTxSV7QYJYS2SyJ6L+8te?=
 =?us-ascii?Q?uASh2S/MqWaDPpXVUz3zU87eaR+7iyY7/NYpVyYvJqWDHeJsMTg+50/oB0On?=
 =?us-ascii?Q?gef5vfUcVwXHBBJxBJufuJRD/Tmd9lYBZKPLLfL7BGfdyilxdv+axW6kqTdB?=
 =?us-ascii?Q?a5e+mzDZXjfCy6T7YsGfjAbE7qryQzC7ZGm6VT6E+vWSE0/IfAbh9i0P71OS?=
 =?us-ascii?Q?cc74WRjXjGk4j4YYd79oPPbR7l5pfbqlXNpA77lWoW2uqS4AzwfpnRm/Sdz4?=
 =?us-ascii?Q?f7nOnbtmYeufLMj6WLZ5KrSb80nhZGcD9g0hQDHKO5t05kZlFWU4mOVVIMUN?=
 =?us-ascii?Q?rM1n+KZipZ6zRUpe4AMD2EPD/d6+uICcTLLrf5vCUe2oLncBUx3kbYvStE6X?=
 =?us-ascii?Q?wBbmQ1w/nGXvjiToK8XnbnGVt2OUjtSzY0X7Z5U8DmaHG/zr8velnCquAP8u?=
 =?us-ascii?Q?vR6IibRny4pO9NXlWtsAlRChpes4BQ4qbxV+dSaYW8Ns7batAb1gUCFaOlZM?=
 =?us-ascii?Q?IVioTkNcU0BkdAiAeGr0pLmvNJTkSHrsnVzZgGnXIzaEB9omoSEwtimZtPlx?=
 =?us-ascii?Q?fxXf4X31EB6jZCXNusClHSW32lhR6n/ywk23vYt4epAZFaiWxWaKljH96ME3?=
 =?us-ascii?Q?AYT+zkyenSInL5PVTpqd87WxaEDoCyAWjtCB4jzIb4bKWdS9BOtCYqy6DcN4?=
 =?us-ascii?Q?OVsHtYK5SQSseWtD73orgcQx78zvnrrsezsi3ieZOI3yGj8Ka/stmko076Pk?=
 =?us-ascii?Q?d9NDFu9uskFcr4ffC867+0OcLSaX8KB6MTOqjfLcpink79KZP70zbNJr0R3e?=
 =?us-ascii?Q?JyJN8bzUJY/+QHsrsPSe9xD2u35WnqMkRK3euxVHEwSsGDLePO4LXX7aERRQ?=
 =?us-ascii?Q?xUQooF1vQ22b4eDgRLf/HhIJhPaOF9TvtkohS7BY3kJHj+9eSvxm/bi/UxyB?=
 =?us-ascii?Q?sDwO71gd09usVvnBQSyrB2+/zNjLdUFwWMyhwmUp+MFmCuEk+GhwO8TzKIoQ?=
 =?us-ascii?Q?NXOfrjz/MBZeuzYblPkOM7ZYSSX1YKDc8byhaNXcqKfm1RkR/uQpCaXZ+8uh?=
 =?us-ascii?Q?YYwVyetVktEY0ucwDHHniMHFQXppq3kv0V9i3aoRyxp8nB46MLo4XoRYV55T?=
 =?us-ascii?Q?QhqtSwZC5F/5V+l5XZazXeo45QKQffTaRdDrpYXiqu/rxK/VTCEz9Xw6eI8E?=
 =?us-ascii?Q?UVJgrFeAHFVhfA6ZB1hUnoW6hV6W2YYkZ6e9FCtSSsnJ0oy8CwagwYfQaVB+?=
 =?us-ascii?Q?J9YRpSJs1wNhT63KBUwLTx8s/3TE/HV9CduH6128T97CXpp1xr2OEBhuNM9O?=
 =?us-ascii?Q?uqGsTO7VDn4sH9WGtHAKZ0S77d3T6kYYSKUMD2zwT5++W3xf2xS0iyjDb4DP?=
 =?us-ascii?Q?eZ0r6nAA/39pMiDEkIv2jwdkrJcIxwtFXY8d/ww90tWTFt8Qt635Yifj19qU?=
 =?us-ascii?Q?PcEtD97bOYpr+yNfIapNnrxFirXof+Y+DW1n9lzmbAMBP8iPb2hzOR1qmpC2?=
 =?us-ascii?Q?8qs7k+AhMHEmtXQkdiSnDE8u2vAkvn3KYdmNZTKB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd995de0-784c-45b3-fa2e-08dd5286cf43
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 14:48:31.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rr0zExZ4kno0g+fEwmLbjTgWOmQLTTuTnkT70E+K2kZ4HLyT2xh1GWBjEbUJnpvK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_064842_800495_C5B6B41B 
X-CRM114-Status: UNSURE (   9.19  )
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

> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -154,7 +154,6 @@ config IOMMU_DMA
>  	select DMA_OPS_HELPERS
>  	select IOMMU_API
>  	select IOMMU_IOVA
> -	select IRQ_MSI_IOMMU
>  	select NEED_SG_DMA_LENGTH
>  	select NEED_SG_DMA_FLAGS if SWIOTLB

Because of the above this patch needs to add:

--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -449,8 +449,10 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
        struct iommu_dma_cookie *cookie = domain->iova_cookie;
        struct iommu_dma_msi_page *msi, *tmp;
 
+#if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
        if (domain->sw_msi != iommu_dma_sw_msi)
                return;
+#endif
 
        if (!cookie)
                return;

I fixed it up

I think the above if can be deleted with the sketch I showed in the
last email since the put_dma_cookie will only ever be called on the
default domain or on the vfio domain which guarantees it is not
iommufd or something else using the union.

Jason

