Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9392AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2N1Mt5HNmkdjJFdJ3VTU2413EGzblMPPIPuqpS6f0i0=; b=0pjg6qiMd3K/Z5JQQH783YOhxm
	UYq0vIVwI+OS30eG1VgyTEM9I7g1YvTHZtjx8NB7/sTnZOD+CVrNhrbSYYfH6Xhoq3ZtjIB3CFKym
	MAavUdXZKyNdyWb6n1K/98OIk3UkK3II+WXe1KhDePQyM6t4raE7poc4cE8pGUTaby2mlV0qxWGpM
	ufDJqWpbowKynH9xgJ43Vk4FDW5bM/0izXXaL5DxEQiFq78PA3Avff9V79enlRahnXOJVDifalgPn
	xkeG8vxBHODkWohdFEuTrdgxwItzQAe9eAFpvRQY9nmTTUMPFbBEODk6qsKCK+tYQW6/j6OUsY0wp
	1fUN2rVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3GN-00000001Lx3-2QGZ;
	Fri, 30 May 2025 17:11:23 +0000
Received: from mail-dm6nam10on20627.outbound.protection.outlook.com ([2a01:111:f403:2413::627] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2y2-00000001FoS-02Kk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T58xTHFd2JAlXgMWvc78yp7e/3yHyUzKcSWDd3wtb8s3jwNOM6toxskRLDdrf5oiedLoSL2hrpkU7SJyyNa8QfYOQ9FRxMfh2ZuIJqRtG0EX3izDDJBXD7UQIGY1N9CISVTeDsrAaBG/853GD7adz0ZleQl4XpkJ42NgYgrSpeyBK0La7Gn9qs2gv0FN5Dyf+PROddJTlaoQNd4k1pLa35PxWOgmVpt9a5yo7Os/zfqNpm0IAukj6HR/l6zwP1iFgbGGEnISiCwQuw6byBC/dsq/LbP8kXfooOlCHOWkxJudWWNYhlt8eSYdDupBOd7hN7Dco4RDpUhfvODgRRz1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N1Mt5HNmkdjJFdJ3VTU2413EGzblMPPIPuqpS6f0i0=;
 b=wlioPKYsGelBCwDzSgz/xA+AjCxIiPLN6ONKK3LrMlnJBGwDeSw+wBsQnjO/ehmYcyB4LTE+gu/ReY55rZgtXyKIztJDRRuCdHWQNPMYw8RxYMu9pURHC0xpk79ib20zE2KG3WTxgkt4/AwuzIcafCm3aWVwTOFqxn9rYLMeAxywvab6j5d9seo76fEOX0a7wsDetpyAZTfTTYGUTxDHX5uXKhcFLVYIdePE9tI1l9aLinuNPX/+10pJ3ReIsIo7P967SQhn8PFJK8qnsY4RzhbQVC+ZKPOd/UyoxMiC53krYiT+QJwb98QGgUd01Gs1tYfRVMuFVFwii32nXs02jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N1Mt5HNmkdjJFdJ3VTU2413EGzblMPPIPuqpS6f0i0=;
 b=nvVY89eZU8Ff43uFw7Vq0xRh9Pl1LKuSKYvuX5WhDZYNJnPYEaRZzdovl/SjbmbUaBOq88ZNnrYB0G23sDJvIwAc2oqtR7nXAJN4pbJ56bgvdpKlltvbtfEpYc4G6BqP1Jwc91SvkFRJ4mWONujpzxef4bVvoREPo8aSa6tS4n28rtds/anvWlN7Tz9wukvAdXmCAszXP+wq+3Sp5s7rtay+vBQ/AMbtc2ekV6tPynkxxhv3mYElLTqU6TsFyme761NyeadYsGRDqZdolM/engX8xC0G6RwFWuhygQIH3oYXh767hDfojjzmftilYl9d15gwc8w3i2m/N7y8BAR+Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 16:52:20 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 16:52:20 +0000
Date: Fri, 30 May 2025 13:52:18 -0300
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v5 21/29] iommufd: Allow an input data_type via
 iommu_hw_info
Message-ID: <20250530165218.GG233377@nvidia.com>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <a5781101aea86e223ab23e88062a82c95ee3c411.1747537752.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5781101aea86e223ab23e88062a82c95ee3c411.1747537752.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:408:f6::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH0PR12MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2ca9f2-5624-471c-fdb1-08dd9f9a5795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0K0nSeKDdK94PmC06odVcmB3oIYypb6/dKQ4v200mIp/dVlrBYXIwxB3Ytbh?=
 =?us-ascii?Q?xXRZzlv3YqmzOK8bSCiho5Fo9+6A28j99u3THvx7QrfSQXaCYB2qEVyygQWf?=
 =?us-ascii?Q?u6UpZU/vK0ZfogfCSkYtTxpsAwUrJHhRv38fECkw7ZnqJQOQK1hrioQ17UAx?=
 =?us-ascii?Q?woymOAsNYmSXISI7RR7lnrEtNmreuLhJ/5Mc1Zew17wHyTiNg4QdKKdB5KTu?=
 =?us-ascii?Q?j6n8Q/0Nuq7Lf/G0cDKz34vxWIjJYoynCqvx+RaRFt7YD+I93WmfVR6kSQq0?=
 =?us-ascii?Q?dL3SKmUrqA4iab7fafwza2hIxe+LjqCdbQrI12Vdj/jhrql2Ha5xwInrnMqe?=
 =?us-ascii?Q?uArN3TO++7Ls6+SrqQcD8URTgYnOoz6dnl0gG89ObOwBjeiOqPkhopnIxMVF?=
 =?us-ascii?Q?MoRT5Wfv/EqhQzpBDocaUoGgUgvdOp91vs79wvT4DwMLmMc9Xh+0YPjeEEnj?=
 =?us-ascii?Q?i+pkn1pQR/XvQCCh/RLfyFwXFbQv4dz2VzUMEVVppm5Zt4hbLL4m49Te/Jz7?=
 =?us-ascii?Q?xPzqgbe/G5JcRzXwa4BH7Bq6zRTvGV88iipN520gbrtFHslKizXhBUec/9Pi?=
 =?us-ascii?Q?PSBl8u9jHTgbhL6ML6XcmK78Vrgav/eiLnbY+jmvM6Nnx1jXDFlKfvOMDhAG?=
 =?us-ascii?Q?K+HqN4q7NWK6RQs5/c1fHRaVzuyK+yYbqeEqVgQ5Cn3EJeEr/odajN0P7Ts/?=
 =?us-ascii?Q?kDhvvTKvuXmYAuV9MJNrL2WxkIKPChppMdEvhKiFttJDy0rvU3MRlv8Mn7aS?=
 =?us-ascii?Q?bwSxlV4mjBdyPhnV0V1VOxccOPMN3k+63JgijUopYpEwYM+K125CuFotdUul?=
 =?us-ascii?Q?iSzG/rGLyu7d7Hg8GoOx6m28ZcBSB+qHpe7Keu6Jft5e5OKOZv251rihSKoy?=
 =?us-ascii?Q?GRqIx4MGJ6lSp2o7fx2dcUxLInU89abmMuvu1kFAyPz23hirQmwQSx+2UhNf?=
 =?us-ascii?Q?5MhO0hAc05cpKQ7zFpuMTyp4vHdN9GsFW//w2obLOpAJVloAJPthRWbDYEcW?=
 =?us-ascii?Q?uJ4u/MAGk0rkuZYqt7kqaVtDK80Skkp8JuCbohqHBENY7gE/g98JAXuO8Rel?=
 =?us-ascii?Q?LKdtWwFMJyn+xSh69N4caLeS5WTazm0WaqYbBk06uZU2a5EfmPGZszRu1Qy4?=
 =?us-ascii?Q?W1/llrB2Gv1Uv9G4dgE23/xQpjErjZA6xp2X14uL73xs8qtQnc1VoEUz8zRU?=
 =?us-ascii?Q?5BntoDSmHfsO/kYtH4xBlGvpPp5AoUtVuFnNXWhc/cu1nl3hsEfJj6e9XfJ5?=
 =?us-ascii?Q?WMV4UlmGcYHvwDP1SX9eKJMMLelJbhBW0lEUtFOfrIkip/FvIFPxrUNjkYBl?=
 =?us-ascii?Q?7nnu3IY4mjqjnGuCGQXwXOVugwDk/ekTARFC4DZL33cQ04RWVPEKc8sxpIPT?=
 =?us-ascii?Q?7iecwCnpZB84g83CarhIjJdqVp96I5rDjmVcEl3BfArok9C+2VOL43tFWyKH?=
 =?us-ascii?Q?65LHD7z1XI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wN5FtvzoehNA6Yf4ErqwOxUerSWJ6QIqDiLOxMDPfoYKlaaVXhu3vAOCLZE0?=
 =?us-ascii?Q?BUZptWWLbqgWI/Fgz+ypfplmW0PMB0QJaV4Tua/oJxWlgCzGAabPQ6h5AR5m?=
 =?us-ascii?Q?L/G65EwR1e4OlKG91dddyGoF5yBvMm5OK1+uHTNziv0irRoMPSnWPHvsGUvi?=
 =?us-ascii?Q?p9bENqQ8tJlCz2O93uWrvs3knqzs3IRcgiNArDLsZtW3RRurk2cFg+BUGlWS?=
 =?us-ascii?Q?WFwayZBvS0insUQJZgpPhPBvX++1/nWZgIcgKfYRLt9Qst97o5H6CYpZ5zXE?=
 =?us-ascii?Q?/QDwwnJGG+UVPIp1Vjnr6urieX6Pn00y09CNvmykk7Z6nlf5Tvqd67k+ccZf?=
 =?us-ascii?Q?RcRirRFzcMwQq9pdWhBO1fkU7zxjx/apI0GbUr4h85aZAVqHw6hlQWPVqTSV?=
 =?us-ascii?Q?eC2u2Gl+5XEMgz0a2XcKAJvc2T60aNFZSv1f9U6cIH+oJzZEVj4Z++sMZsZK?=
 =?us-ascii?Q?ExbFDLYybEP+a+Wg3WU70C/cdIni+yBe8woGqnPmf0gKmQ/id5GH7txdS3pz?=
 =?us-ascii?Q?uGjVdi/SiwjPdoWRR5ejJF/YKKgqY/hjhdtAiNQEgbkwQ614OQJHr5E8S+QC?=
 =?us-ascii?Q?XtakQBFclPrWGd4xnQQNiU2KEukeo/LsUhJ8PAos08H7Hc9f7xoTcM38yjKA?=
 =?us-ascii?Q?LXXKZR033wBE7v6tbS/eQeIgYiYn9NNnospuIve7WWbjoVOZUHGt7KUBwdmp?=
 =?us-ascii?Q?+YKvUeqv677Ua8oh8EZF+YhK8uQeWUthEhrVPdqyTb1ivv/zRaXUQUdtFeGD?=
 =?us-ascii?Q?E+tNl/BwrpeGDoeDK9BsgkswzqX3fopuhJsC9HWMFhsV40oyxIoFWDJsJjNK?=
 =?us-ascii?Q?hO3u6o6C/Hv1bK/vlBkTA01tKvQHYORhIFmBqFGoq3Hi/6U+glFJSmBZMm6Q?=
 =?us-ascii?Q?e8UK8bms4mfQpq3389HBfipGprnaYaEfTuNkpphaPfiETHKZn8D5Gp54xHbi?=
 =?us-ascii?Q?VGg2xV9lgN2WnjqFlURv4iIoMXpN9IIKwe9Dn4SYU19x6MPcxOJY1ID6AgRP?=
 =?us-ascii?Q?JNctA1XauWfuy3dDoiITP8GC7r7pCUqmR9jN6BscSu8/FM7wDMMJL46MjKu7?=
 =?us-ascii?Q?GBayaMhVs2EPZqW1SEOmJiR7QqKInKNeBKneldNCMPlS/f2y0P3MveWtb+JC?=
 =?us-ascii?Q?wq7FT1s4cYfnADldnUPcCZbRR/aTXXyZHONGP3gbi2NVG/zKMvOqaPATbncD?=
 =?us-ascii?Q?pTIgglZ+sYZeXiqvYQ5D0bPcBrbqkoDEtWDq3qA73i5HrD2diTxYTKSQS0/2?=
 =?us-ascii?Q?XgFbjl9Y+rY5rEq+cgktH9r87+n+iT2UpYYlGostJcKQqwUM/nY92F50bg+s?=
 =?us-ascii?Q?X3y569jrsP8v+oynZY1bLeeZEmhEGgJAYrEYlcLylxwlOA1uFyqdFgtGlCsO?=
 =?us-ascii?Q?8+6OwEPs63TjOmCYvJAcXCp3aLxDMr+tsaiEwexFgAAp6zyLUWywLTVLdbas?=
 =?us-ascii?Q?WpL+50yOcl+COwvMFUofufihskSGPz8fxivtJaEybPJylCgIFw+GVxaSKdxY?=
 =?us-ascii?Q?px3uhjE3UWCH/ZFPL3DOhSE4Uc0PtfBYhpcjBsUDt3w16uZGY2I6gSFx9Ubg?=
 =?us-ascii?Q?FSUGc6+psW5ezCRo6IN8Ci1r1TOpFfNE/jdhWrkj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2ca9f2-5624-471c-fdb1-08dd9f9a5795
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:52:20.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5ZQRdVuRHLm657XL18vCK959f7zYjb/nbMEQ92riLnYLkOv79zFRRXrbMcmX0BC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_095226_042334_C494ED5A 
X-CRM114-Status: UNSURE (   7.78  )
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

On Sat, May 17, 2025 at 08:21:38PM -0700, Nicolin Chen wrote:
> @@ -666,7 +678,7 @@ struct iommu_hw_info {
>  	__u32 dev_id;
>  	__u32 data_len;
>  	__aligned_u64 data_uptr;
> -	__u32 out_data_type;
> +	__u32 data_type;

It would be better to avoid changing this name, maybe stick a union
around it?

Jason

