Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028D4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG26RRgCn9vr+1QnxHTRST8imkaUs7uc/UzV+No5WAM=; b=xAYrvSVjs39HLht1BW8VadTG70
	qGuIQIGY/Sc7TAVDp0ObkylbVY49bk0tSA9uda0mteXDhpdUcj/WH1YfF6035ET0eocFhS781o68o
	tVLf0/eedvv34kF2hvTLa/gyStSH4pRyPHenC4Ivgu6YK/S2zTpwVkFk+KRjL49KJsAQ3eWETcyux
	pg2DpN/o4eGx2WkBxA3BIkChGwoL9M55opeYaNSoKvouW34YCJhtS81utxyA/jidcxjBV9LQd9OSi
	28DqvlqDRmJyQ3UWkz7+aS/FM/aJS0vkJgGmnz3ii/aTqIJxrEepJHyU2z3e2/tj5d1xNrNMjJGxW
	09Soc2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcHg-00000001PSh-1opr;
	Thu, 15 May 2025 17:22:16 +0000
Received: from mail-dm6nam11on20625.outbound.protection.outlook.com ([2a01:111:f403:2415::625] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcCl-00000001OSD-1WhV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 17:17:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ci4qgFH7mEbXjhmaVxACSdRZ7o8qzwlMd6ssvXZGXifJ87ehgLSO/RatLgt6ORklx0Sylk3t2EwtJpMeenz7iZOaofCA6nY1HzMqT0E04P4jXQ6XZaO3H23GSNIacd3C5V9IOacLsNz+wkey7+7H+mnzWmt90IRHMf8hhBJB/XjxAP9pm0hUXrcBm8QuAOIzR98crKot0/E32ukDv81YnjF21Rs85X3zb6PjeBJKDz32otTZdKWlfZ2ZULN4JE2X3XyTKDnap3u2d8T4/HLZZy6iCaFMSyF3fnYMA6skFmfTaknZG6/s6DdrV+38NSuS6Ldtfafqy4DWCc/HPAzORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HG26RRgCn9vr+1QnxHTRST8imkaUs7uc/UzV+No5WAM=;
 b=oocaCU95bvBoAvmR7cUaEk0C+brYtmCMI3EIionVoBdiOlKTIRm/4OLTnShOhbVSANtc7mj652NkmAIQW2kMk0hzm1hvnaKULWedgqx0L7I0jU2c9EOoy6RTDAS+GyyATJ3kZ08pAfBN1PK10nFhB8eFCIlKkZOzN4i/gauiOk6f7LDysgPkVUP7fn46XX1rOX9msxluwOd0H6InHioAxm/1iEvA7XcjF/8rpvdY3EGrFk4YRMew1ic0DsUKFubzhIohSsr8ODLC5brlDFNILdYLqj6VkC//KJNITCEY3B6MIzscfehEj/sv1aMhGOk+etLsgHsPIBQukAUEYs+eig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HG26RRgCn9vr+1QnxHTRST8imkaUs7uc/UzV+No5WAM=;
 b=pS/uhO8z4UuxXGO97tboBLeepRliFTIGnwEefKnSDAKZzkIoDKq4nUvrtkbmKsmUUZdsH1h9xENwt9H/VuEnZP6WTtBCDZTWeCRtjFfUuPC89z2VT0mqchs9FvEQx1qVSgrywXLv/qVmDylOw8FFQ90lBdQmem/BmWQTwTk4xB48iFpyTKiMllQ3IhmKkbMZ1adVdY0cFtSWqMkrlsAPFT86+EWOHGnZ7kHJsgXGDkl49QwBN9LizScH0vITEjs3Dalbo5ZkF1Wz5B6RRjZ/QKcJRZTIjMnZqOK2UQ8Pa/gtJ5d0pQmXfAsW0R08LXWFOIDgFjE32TMccEhOtfiIMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Thu, 15 May
 2025 17:17:07 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 17:17:07 +0000
Date: Thu, 15 May 2025 14:17:06 -0300
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
Subject: Re: [PATCH v4 18/23] iommu/arm-smmu-v3-iommufd: Support
 implementation-defined hw_info
Message-ID: <20250515171706.GN382960@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <f70cdcc21df7cf07ae1da02aba8a5aa932718a25.1746757630.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f70cdcc21df7cf07ae1da02aba8a5aa932718a25.1746757630.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YQZPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 51239fd8-d767-4819-90ca-08dd93d451dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PRp7q8aauo18I2TnjquMY5B2gYNp+XJ9nZIZLZ38kH/Rh8hWWGlBjtf050HR?=
 =?us-ascii?Q?ju8moFy1ceVjLTv9upk7OQic8ilqPjYozdVwel4DoHTFgZsRDmrizREaVl31?=
 =?us-ascii?Q?Fhfnzsov9fDHyivqeuf3U2Ny59kUeWkYM6Ld3JVIQmInE9RImofWD+QxkrUt?=
 =?us-ascii?Q?sThnSqygtsO4BbWbHjkFMFXxf8bfmZoXQqoSC7gfFJ5o0n4pDetc4zfaJD8u?=
 =?us-ascii?Q?yGvzxg+JtSRnKzmjlFBRUcZR5Cpi283xLslT3RqrK+gWQtY4QX3qK/y+Ng8q?=
 =?us-ascii?Q?SPjhyia36sfuLWl8jsrjsXzSWGhuHxKDZG3bJeCz22KIFZWGBIzEdoEyPsAz?=
 =?us-ascii?Q?buYGNYdvsq6B83gUTabs7SoPIpvUAyZbGbwacZhceBshbr3hpH3JYOoUag1h?=
 =?us-ascii?Q?U5qvTTQCShbIeWoERBHuU/pvA1BZ44nAjMRlP3RNNJCqgX9UA/hYldFipiq5?=
 =?us-ascii?Q?mS9BVeqv0n6KQG3DLYonacM1dcWjEnygYnV5eOn1q9RyAKyDBfYmCr6zI5s4?=
 =?us-ascii?Q?pWmGg+zxiyuIZ2JOMk3Ax15y8hsUt++pDYuSeaR2bd63EGGHJh8e/wkIqUDk?=
 =?us-ascii?Q?6PDRieGQZocjNvdPv0+5Ap4qmqV4xg0dWaU/VNtFgK9BbLICNAj1X6x29KlT?=
 =?us-ascii?Q?lFjphWpcq248Gx1bgXCrfTBa08lLg53JQhpdoA6agC+eFdvNDNLTCsnWXwRA?=
 =?us-ascii?Q?VgS+b1oKHVY1aORUSmfFiz0x3Y6BZipjOpRPhsR/u585UK4c7bG+Oky94sOy?=
 =?us-ascii?Q?WH6iPHEOJyuSuVgxJJAvc1m1GUkhp4T2bhFwMch0cVzA5a779x3DwB+RomVa?=
 =?us-ascii?Q?zqungCkz2pqGAIEQjCz04PmBrg/tNRS3H3rMo7GcpTyEkypyrv69kcTbvT+g?=
 =?us-ascii?Q?BtUP/UFX0UZ8kjtTFKXZsP9ldo4Miq7FPoHC3h/Bt5PSpc+MjQ6RmKMojetW?=
 =?us-ascii?Q?d58X9VvTaOu2c8fXgXi2jNo5g7KtTXb6bcvJUKZIR6j6NvG0N8hFR2CSw64I?=
 =?us-ascii?Q?yisp2mwt0sKgnz6V6kz8onWmVCitm1byNIRjzAO8k/zoTPIy9T94oLV1DrMO?=
 =?us-ascii?Q?8UpgViwLhIGnE69TGKM0y1DuPMNcb7YUbFTVwTjxwWzklMm7kXecl1gLoaLD?=
 =?us-ascii?Q?SgDXwZ21+kckz/6zFLZQHp5nbKDp2WY5f+5xNXxMFq4aS8crjoqNkVPu3QLI?=
 =?us-ascii?Q?i0PPmHBzYSKFZGrQ7KSMqnAqkj7XLU7S0vTiINxP0Ac1RfaChlLnPDZ5K2Pa?=
 =?us-ascii?Q?blNZFNqWTy2hDvsBcGJ0ekka68G38QaX5kwaHGLNGfXwvb+h7WI5XzuEBIyB?=
 =?us-ascii?Q?RI4KfxMmNmuyou350Am4wZehRXwUeSW5G3yJbxNniTnugQoWtmxcaTbkf1r7?=
 =?us-ascii?Q?HmHk/T07pil9ETJ+GvZUBf4aL5QT8dyHUl8TUYUTrq7o04NDLpzneP4rST+E?=
 =?us-ascii?Q?YOjzlnoSPy0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OfLvF21rYC/3TNbRBkqNmidWtnTmLkiMtj8PbDIwfRh0K80ihvRqZFUR6koA?=
 =?us-ascii?Q?gZivFlY4UBkuZzXkjG9j+GkqzPQhbllNpi0KhGEwLjN2BXG2aisxAlzIsDTw?=
 =?us-ascii?Q?/CkzHzWS92cq8Y4leG6UibSHUnNfjArJ1NdAvokfsp7dYSOd3OxFlcPIJ96f?=
 =?us-ascii?Q?yOdE4vyboWK8BKl7qAKAPXN0LrsSjK5gR8yhcDBf77bvlxWGRRBShGdCTsqk?=
 =?us-ascii?Q?mbbKqasZ6B+8kbQRWi99nIAWoTVHqggxvXw5HSFYLPluZD/Qg/Ij8IMv+9IH?=
 =?us-ascii?Q?aN1+Y0UGuTbSBLmxL2FuCuXBncotNJp0iuyzbAUbTD832cCZ1nsYVe6SdmDY?=
 =?us-ascii?Q?+Vqjf+CuwaHdX1E/L4fivl5tuxYRosusYNVTDn49Rj2lgTNd7N7DQ66QAlPd?=
 =?us-ascii?Q?4x0ugPq/DYFxKM/yyFRl1iP2JQIQO4zK2vjY64uxPqcwJO/L83yAuDINxwGj?=
 =?us-ascii?Q?/cSvEn16uDlvbNN8E0qhPAFS1MwN6h9EeIqAZ4UOlGjivJW+UbQ4I9+s0jcT?=
 =?us-ascii?Q?MfwrGRGpSjXN7H4Vo0ibf71+Qo3QzXx3C8TGNHLbQCI0i9fJmtbqc/dkE7F9?=
 =?us-ascii?Q?ZaoypVCXQTeNZ5lxfpbIF6S1PPNO1Q7WX5SAsAr9TdlPrKn8tzguMCJaUzYi?=
 =?us-ascii?Q?lFWoh4G5yXWSUu1riDhqdC2fWcm0JO7H+tWM6udVhry5uNydHs7mHL1bKYF6?=
 =?us-ascii?Q?xmaYyidT2jddQdZ7RbPiU3jCFuMOb7ycXIvZcWIxrwLP9kYOQN2G10oZmTog?=
 =?us-ascii?Q?4UObeU+btkwkHIhQtdBrS7MTaNuNy0iktoVo701SqGA3C2c1oXL2LbEM/Nyq?=
 =?us-ascii?Q?be6i1Uq/tLXa51NiFgV8/t+4ERGqD5GHu0HnpOe1mM9lix9NI6/3djyyYeTq?=
 =?us-ascii?Q?sUnnWZpVVvqF5RZ/vWGbe/4rABUddpP+vQHTYknN34fCwoHumuijiDobgzqY?=
 =?us-ascii?Q?CRGET1BgrYwQmVwhZMwABrWdHg27LLyycq+IogUD6YFQ/39zTMfHippBnObN?=
 =?us-ascii?Q?W99qr6uWzmkGWlywaHdBQjCbCgzNIwFCfLQ7FiEcrilQQl//BNn3pla1h9Wc?=
 =?us-ascii?Q?Irx3+CVsLuhfmRBw2wr2F/U+CMD3w+G0bcXPFhJuK0nw4pD3r3PZ0X1d8y3N?=
 =?us-ascii?Q?ZSbV8GqpwmxrW+7IKZ+P3gBGziHz+GWt2CyPsfgWbA08MqZ5DGbAlQ39fGHx?=
 =?us-ascii?Q?wOTQTM8SsdTfETe3pIdiGWjLU+Bhjt89wcfMI6NCyrGuC2SntliiOt5Ir4ug?=
 =?us-ascii?Q?xbBpwVjABYcZwxPKQBqPMqol9IGMsK8jZ7bAp/IczrOZmRAoaeotuzuN9F16?=
 =?us-ascii?Q?cnRfr4FIb19lvRlGyyHTVCIhI9xNyyZsgpUaFJo7kJVt6qcpTvbb2PBTPWNA?=
 =?us-ascii?Q?vGMSVdEdK9bdAPH9QVpLgA3uy17y+vXpVCkfHHrP2X8LlaOd7grKW7FibZ7Y?=
 =?us-ascii?Q?HjHOyuinZJziVadpmyt6GO2badA6/6+VE1O8JhYwQ9Xjz6DmuFFQnoSC9TDh?=
 =?us-ascii?Q?VzDjcfJshV1PFsguD12ruEpQZhVcjheia36F7aP7Mt212j+Am/RVu9I7f5lQ?=
 =?us-ascii?Q?3Puqo4ELEtIgxFEh/H7hR1eh7xSf0rOxcaO/IO+O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51239fd8-d767-4819-90ca-08dd93d451dc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 17:17:07.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buC+O5vPIRLq0040Zhg1hsIcls1Jr4cu62j9X2dlQPNYr9kRvgJKLFgEXEYrEDTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_101711_407434_FED5B403 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, May 08, 2025 at 08:02:39PM -0700, Nicolin Chen wrote:
> Repurpose the @__reserved field in the struct iommu_hw_info_arm_smmuv3,
> to an HW implementation-defined field @impl.

It would be nicer to have a tegra/cmdq specific struct and a way for
iommu_hw_info to select it. 'impl' isn't going to scale very well if
something else wants to use this.

We have out_data_type but we could have an input sub_data_type too. 0
means what we have today, then a simple enum to select another info
struct.

> @@ -726,6 +726,7 @@ struct arm_smmu_impl_ops {
>  		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
>  		unsigned int viommu_type,
>  		const struct iommu_user_data *user_data);
> +	u32 (*hw_info)(struct arm_smmu_device *smmu, u32 *impl);
>  };

Then the dispatch here is just having a sub-struct enum # in
arm_smmu_impl_ops for dispatching.

Jason

