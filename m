Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43834C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv1znX9cjG1QUbvJhyb6T9RBQOUjS4fYBHzM/IQgXbY=; b=X5P5ERY9kJBGMm695uo8W3e1cK
	drPCThxzbpRFGLdayQYmfQho3cjcefUlV/ljuqiW403/OPUBiOuLMOS735GrT+REQx534Bi76Rlwa
	NhUHZUKv9S2ag+ph8nS1gvxUzd5SkP5KmqkwjNxbsCt0qF+dd5Tb23t0ZdI8lbcQRSS2wwx/1QR/g
	191Im+MBX0tOCgftOK2w8S8aEPoMjV02wfmMVO2gwH/4tO1S3njH4CRJTXe7HaIs6xvtFlkj8gQkK
	z8DAoTzNwQpUtmTXlv+xpBraR0yOWZY0EbAAGc7fioJcXT+Hdbr94GC0ApvVkP2WydBcvVN/JGW0g
	/VAZr8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLA-000000054gy-2XCT;
	Mon, 16 Jun 2025 17:09:48 +0000
Received: from mail-dm6nam10on20628.outbound.protection.outlook.com ([2a01:111:f403:2413::628] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAhM-00000004gby-3xan
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8l70NK3H2QpJylrJf/lSK5ZnERrzV0Y+nQ7CjWGRl1djpYpk63HN6GuZv6kI2Mo62ujcz4w1bJrFlSNLDLiIlr0L6XbNz1Bc/rsqlLIWyKO9WkBLYTxvZS74bQ3bgkEpymX4dp/G0+uHFNnzFqa9rwvdh06FJYc31Vs8waPosmlBGL8eeH8/Y1c5/rbqEJ72+BNP77fmzaKuhxlvzNCzWvlNwRQRxbpw6DRzOM+ozGJCGD5oYNJQDRVg8NrZsZyQv44tZg3Qj+NiQV+To212UEOeuem/5zPTrI96brI3jM4iTEk2UHt13/SV8/8YkG34Xz4KclCuPSksfmOztJ75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wv1znX9cjG1QUbvJhyb6T9RBQOUjS4fYBHzM/IQgXbY=;
 b=FsFakPG01Tg2zmrg5HRCo/uA7oyxCvlB/jAmBLT5Jq/Y6lInhsYZYGEKxYWIONQfftTG/fc2qYTi/8h7MH9NBBlqlQVWc1kFAneDJHJOnGWyNTtekeKaNhErDlyDn2Tk0IEHQRZ5VIxjCxX//OfSz0+SLz3Vm0XR0EEJhijGXocSUFvt9qpkjsrKkdQP4nu8sjSlgKp9aRyEMpg50Wj5foNlnYUb4aTXEKz/s5Z1vBMqj9ehH6EpJnMFbWfOHMQ65fgE378l7RV7agLegYu07aIUHBY1IJwQffEQ7DOJfQq67e7RFrq3G3s1iX+cPJmJdyuI9WgVs/+saj6/CEBtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wv1znX9cjG1QUbvJhyb6T9RBQOUjS4fYBHzM/IQgXbY=;
 b=t+9EwHiBYePzBT0DTgV/Ge8ABtDIQUAdIPfEwu4mOOuL9vAtDhjDBAr1nDXcTaH/lJHIDhF+TLTjMDg71gjLgpfsY6+NtZx/d25hxNbkDK2ge3eDoPrLwTf/+Mor+d6qLXyhFH0n3mioyYewJ4rfi2qmB8udpEeeBxGItO3crK5zS23A/bonlNo55T2KOqU0miR3BZcqD1D0YxJkyb0xKLEymkg2RPfCfGx1DPrRKyotOo91Nuz6KmfKqtBkVIwlYdUuM222bQo4ma3Ym9fyhL3jAiXx+KarZdNZk0d5J+H3vEL3O59vYFSGuQF0KAqeIUMK167+jrXQze4doHlCww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB7716.namprd12.prod.outlook.com (2603:10b6:610:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Mon, 16 Jun
 2025 14:20:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 14:20:27 +0000
Date: Mon, 16 Jun 2025 11:20:25 -0300
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
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <20250616142025.GJ1174925@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 816353dd-6ce9-4eff-394a-08ddace0f0cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WkX6oO5mWC1WsEN4I0awOFsDEVPhMFq7sjImTQjPDILxpemwI1hij+JESTHf?=
 =?us-ascii?Q?cAj7S/WJK8iHH3rH5Hrln2VgbM97DNuaaCGrvybge0ZMupWRa91MFoMVF1jP?=
 =?us-ascii?Q?EQWaXNMKNyIaqupBr+RvSf+8yr3tSXH5+0yytdThLWgT1I4JXgJj+4zQJJsg?=
 =?us-ascii?Q?aUai8Tz4aUbjR8CL4nixHW8KZ1ulF7E6mnO3ZCpM3s4q0L/PNwQPIaQhem1w?=
 =?us-ascii?Q?8rVNXdsUhJETTh+uwODMZRMKw3mEiUuXRi9MZsDMV4026OOzK2D02GpFF5pM?=
 =?us-ascii?Q?lgv2p3HK/t21R8jSy0MBWFnKOO6Ko41l614Zje9fGJvDnvLRVTaQ40yiu+OB?=
 =?us-ascii?Q?7ArdKXQ/77dTzwzoYq4dolf+8eTCLZMcd+py3AmAAGiBhfWG4p2oOEG43qxm?=
 =?us-ascii?Q?Ms6BDwlCR3cZEwArcIQwiGGQ+0AaPMHmnS6SOD2D+2NFTpwkmrS17afIuf2F?=
 =?us-ascii?Q?2rLX0iZWXa6GdtrWVBTd5gM4i73h3MQENLUlDQZF4hNyuVdXYyP1Jl2ORpR4?=
 =?us-ascii?Q?gm81qWxidtx6iWMlvWQJx3jI8TO+SxNuuJURAr3U/A8k1E96T8sdFpgwzyrM?=
 =?us-ascii?Q?B/rpOwsaggzHEq9jnf2xvCGJa++77CYcBIM+g0Ki5NHIn9wfAvYHvFeUdpv+?=
 =?us-ascii?Q?PNk22uZrqtc0ihvbbL3jxoP+7EC3lJOi0qLmjzPepPtept1Tw2cM7MZ3UZtT?=
 =?us-ascii?Q?puoNEwgyY7yb0WN18jgLlJGtvHr0E+tdKgCJeKjeu8XzoCrsLUQoOvHKD0ZL?=
 =?us-ascii?Q?ACYRJLEVOLHy23zRHTPGCz3B2Yr75u5IViJSmchX7sLE0Djr2iQDzvCIbWAc?=
 =?us-ascii?Q?MVrWVrh2x4OJNOAm+gE1I4YtGsPrF2K7uadDJ0/kpiEAaTkcv7A8p9MBaf6s?=
 =?us-ascii?Q?e8Z2T4DpKK9GjOLn0ucUNFK8FD2YMA58XGV83GVTR13DjH6SlU9ugbLnznm3?=
 =?us-ascii?Q?pCIENsYfv4MJy/L7vpBibVKM4C8/Ox4UNDnq+cohyU3wTNWnnie/qO48CW3e?=
 =?us-ascii?Q?okF7v2dOJur8AMQkUoJKOfGTlEyywsyoQ86QjXoRJnk/jZT+dEW/J7U+hM6P?=
 =?us-ascii?Q?Bo7xLrnxZ7eZN34TQkIizRcXFimsbilWNqi7RVE7F824u++Sj48E+Am0WjrU?=
 =?us-ascii?Q?s3brHZ7DdkmBHf3fWml20Po9HAgdAFmX45wtCoD78x6DwDXsD/giaXzS6mOX?=
 =?us-ascii?Q?mXYoe1A2x/A8E5o73IZnUvn6yfZkX802vMe/innx9VUP7g6OnVXrEUi/wJ9z?=
 =?us-ascii?Q?eTZ8C/uQJATtSvV2OfANQ6Z+6QsvUBsIYmX1/UDdHZF6SiiwGiKazM9OpmfT?=
 =?us-ascii?Q?rRhFM1nmpYd2vGW4U8B7TqZoRCB0RZwf7uPAz47RomtipYkmnATGvC5hEJY0?=
 =?us-ascii?Q?5qOaubmqmmu6U8c2IqwpzSrbblxUEfFO+kZxGWIXcd/d0EgP+uQmy+QLIC/D?=
 =?us-ascii?Q?4jxLdiwCGAk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C2En5gUf/zr8of5rA6dxP3yUn1oVRCd/wKra76jgEh0sOjOlB3g/9IaDLFVy?=
 =?us-ascii?Q?YQDkQ0wbkA8UpKBnPwR8oEdBehbos7ql1mw+P0RnMrOJ3uUwdSVnDsZ13D0p?=
 =?us-ascii?Q?SnBTONEUQZ/I7t/pTGj/piCfO9mxhtZx1a85YZug+aUen3zSWzpHz1w1qJ8j?=
 =?us-ascii?Q?BDKZM0twPloj6lcuXzu/HV8tiNy1O3oR1IxR+WeIJG1WyKZ2qYhOuVl18tQu?=
 =?us-ascii?Q?hajl2SuqbzhEC9oNQCt64zLyb8OYWvv5c6MwDKYZfPu/M5E5/JN2ps5qmjDb?=
 =?us-ascii?Q?XQbOjhLtqedzov0sG41xSmy738pzxIszEgfy/AH0uW0IylbO8GJ2QiYJfXu5?=
 =?us-ascii?Q?hk3r1mL2obZ2oqUpLdZjGf7wWtW/wUuSphRljO7gFsoPVkwC379TftGCVl8m?=
 =?us-ascii?Q?u7rsCSpRTSvSPDts1U2gfwp/90i9aXibtXw1sryId+qxSg5WTNvwBokNQA4N?=
 =?us-ascii?Q?yFJx45FTeL3xNNkgK8zUmxVSu+YVr/o3XOWE86dskNgypZub3lnYwzgDCMms?=
 =?us-ascii?Q?XLXLCdCkLsGZ6opSMBKehrJ2jXnLqtK/6XMvrgMlNvc5nXwWQg/bXKovlwOF?=
 =?us-ascii?Q?Y9maE12tfhAWo+dsNLGMnX4u5XMA+lUnb1G5y+d4qhCS8H1y/SPmpUFEwqcg?=
 =?us-ascii?Q?+nZ1gkFNumK5xmGt7uff+YV1Bb7fEWzur+RcdixyVhLazqsN9G0IGZwTuMlj?=
 =?us-ascii?Q?Dg4vFBrbIl4eKW0KjM9+s06yNkHWpmyfh+rN69KWbd9JpijG6BDtervhEOIL?=
 =?us-ascii?Q?S0rfga3MDF65ZGFccD+gb499wToyi4OzQSfjtxSNJvGVvOjhMy03uRGE5VkK?=
 =?us-ascii?Q?siVSFozGNttE/DPiBZ4Nv685PpaupC+udpgCeVphBORJSe0G/Z8TmmaiNxV8?=
 =?us-ascii?Q?xWpe4+FW8sbLaHr/PIOHjR4kCaGrwXpNhxN9mf4FE1OmEYaWeB9N7AUViu7K?=
 =?us-ascii?Q?W0gs/b1bqZE5dU+rwUGbY4RiAiVwX9ZaQmNpNvI6cCWhZJeeI7fZDAogel0H?=
 =?us-ascii?Q?dMHgusmPoPJmzCv3K2V1awWw7GvRXdFqwORif0zerQI9+wOWTGqmoKgE42iL?=
 =?us-ascii?Q?fAjQkU4kayZCYRERx+vESV4UtI7KOfFbv/91rTOSG6kHSQV3YxoIkY3p/e2v?=
 =?us-ascii?Q?vT1T5KnZVpLThcdr+Zvd1uVYWpVz5laZ04vtclrqgxqzX6wcsGwvu9JNfjs2?=
 =?us-ascii?Q?QujhwoDqh1kCVgYxIRdr7cahvBeGgIk4F1MIwkZqSfBViSVevrGTP4B19nCj?=
 =?us-ascii?Q?PjnSsujpt2uYX5WSo6z5grJSdjd7Z/HiyXw7dMgcY9qjrAxs0TZVle36W2Ee?=
 =?us-ascii?Q?DUcIqm6EfEsyD8K9T8Hp1/DsomsJOszYEEyN85Fu/+vccY87KqGKNhfFkZ5v?=
 =?us-ascii?Q?excc0hFYC7JiE3M9gfg22NzVN2Hxn8z6loHmIxgGexmR+yhC1e6RwrthB26X?=
 =?us-ascii?Q?ZNVLDHCojhz6hSPSSZP6F25tGHUy7G/lDzF8tMQD1DDnMu+E+c+cIdCXRJLc?=
 =?us-ascii?Q?Rvtcka1IhXKinZOHV+EDX9jCe1a/KoWh1BKciaqDaY4y0ZeT8aSazCYW3FXf?=
 =?us-ascii?Q?zNDObeTTq/hmWhX3sqRxo33DN0lz3M69QeEOxfHM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816353dd-6ce9-4eff-394a-08ddace0f0cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:20:27.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoH2cNoRD3hT+SuP/Ne6po8J4doaBs+tI1MZrjQIBLMNUHOF7UNIzZz3diENx39z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_072032_980584_8552C6B7 
X-CRM114-Status: UNSURE (   9.96  )
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

On Sat, Jun 14, 2025 at 12:14:45AM -0700, Nicolin Chen wrote:
> This will be used by Tegra241 CMDQV implementation to report a non-default
> HW info data.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

