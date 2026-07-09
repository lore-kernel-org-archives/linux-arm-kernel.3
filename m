Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71386C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXBttwUsGySWZydeMSacZ6jnJaUmLMSPjwaTxlkHcEo=; b=EnE7XYg1zrO1b2Sv59z/bAENSv
	EcnL01pr0+jBieZNyK5coaTMPHz4pQtIekCtOU9w51BvZHjVX4j9yTEg7zMh/W3ouDbRDEdrFKO5h
	GTRaTI5lfC1lRmWxLHqUrmbR41NdOIrlX7X6X9aWR9lqYFcn037QSpaM3rk3HtM6r0cCWHKPPlU4N
	HeuUdo31bkeC6PoZTDKCS4HtkWMlW5QVL6Xn5y2/YKgWS+idHpyJpMZNOwgcNcpKDs/iGh/qe8LBa
	iYzEan1YDBl/OFxLlLNAfKWC+zZhFfUblIfbOTln16XRP1qRD6EOMkFd1HKYDsJHXsOnyyTgeadJ3
	NCQQROvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrr1-000000033bw-1QmN;
	Thu, 09 Jul 2026 16:44:03 +0000
Received: from mail-westus3azon11012059.outbound.protection.outlook.com ([40.107.209.59] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrqy-000000033bX-2sbq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:44:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqiE7hIfep3SvFlqjN8iJoAmws1ytE7k48CYOVBPz6aLS3f2321aNh4Ve1yy4WvM/OfwhnS8aPoKIC4fnl/VL8FN4U6Zm60o/rVbRliXKlwEL8PfBvinWiTAsRuF5D/C6dEu3Ot+bfi/loS1b68bIeMFu+IhNljTD+c8XZFvu0O3EAD+eqTRcWkaLL8gO0BEsqT+HAonIa+O4QZ/d03huQIRUS2hPtXnlCB1OC/ZTcsa0rPU9cTm+ljgpVEVu0c5uuIv6XN2oQjeDRbmE+HYt62VHBxi4GoN55AHUo6BM10u0lHtEUGm22YmeD8r/ZIT82Y3+M1ooo5zuoTSYFG8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXBttwUsGySWZydeMSacZ6jnJaUmLMSPjwaTxlkHcEo=;
 b=ud0STkIm+U0EcReDNp+a3bLq5D/6b3ypyOmucyr5BlxhPt1R2u1sKASn0jrozYLkfm4er7HXvpP4GnrAhGpPhjY2mbyrDpVm0DNOEtlN91DWh9Uq7TaCmL1fBkzYgoo4mGecwY1LebR3P5Ttj6Z+KqTlxQqJQYlvKM2vgKyX1TJKKHjj7xfYTMnCLCuJ/DIQSEvIUJsvTdUZTcCHjp6Y/WMl4G4PwWcTQRDub2MSn9wviM6KkLPZNqjWihl1DydAfnY07raGWcHZn0zqHnQyjdgLmm0K4ZjQmSUSI2ZKDc1+IUpCTN8/MPv5qz3Pv7w7Wsk/zfqXAWKlQUf7tz7ppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXBttwUsGySWZydeMSacZ6jnJaUmLMSPjwaTxlkHcEo=;
 b=fE6oez50Rq2zzhd8GKrkUfHse38MeUp6aUiMAo+hVOZbU0KHQh9AY882NWS92n5JNsHl149RU3z2W8Q5QRwE+fquCZEnKmjmErhNFyhEiTzjoad3ba1IBgFfj8YbgZtTvihftfiJFUTz8eJ5nliljoJg90C01zVAMkP4zsT+dXJ4mYLz32ysiHCQ07yQaTldlOTMLKSgi2KBm2+xUQiCXtNQeFyUlZGBdGsz4ZX+Ea2gUhkyYPRN3971l0lEzNVLbFRy248tGkuCycivbgkX1nfxuheTBoPTqf/V3qJ7Iu1ogF5RQjUyDmGnCHC8m/3bZJ0g8R2/h8nxboIWqsqT3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 16:43:50 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 16:43:50 +0000
Message-ID: <4ea54158-915b-4778-a5f4-80e0e6e71c1d@nvidia.com>
Date: Thu, 9 Jul 2026 09:43:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <20260707162440.12132-6-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260707162440.12132-6-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|CH1PR12MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6618fc-dc01-4d8a-7953-08deddd940c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|6133799003|18002099003|3023799007|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Nmycra8qCy80fUfeQlELBN7Pr26HuAmzx4C5K3aooHXTuoBOFrZE+1J3BZd9cpXg6LZhK13FfKW5gwlGYyDzpUcxqpYyh8cTskkYd+WK70bhsmlnOP9x0fqVv6NAYGNXJ2MeFZ+Ff/5jCnSM1cmQejZ5o8kpCmKNm8tVHYulV+yryA9rYzpZyt2FA6gx9dVE0nv7VH51bs/hiWzROauKQs3iJfznGjqcYqRwx36YzI4xz1euy2gW09ie78V+PkcHGuit/eQvFa820QHX9a3C6xWn4quDCaxRA2MPdwfw4jsdOwP21WhYGCRU5ozIem/HtAQ477ObHI52PzBrY8LykBfvUwAQuTT0OU+JP3IZTlNRg89/KeZVp2EAmdnRxD5TU7MoO4133KYbJAwxVC0VEarrpKUqqC4qjQ1vQIXQYgLw+RAfylr1symExJqVmCvM6OnBVijVPkzSMxC+DuZmCQrO7V4fsOPFP3hDZxM3RPeSG1Z8/GnCZKYlqhh/lf7tvbtBKAUM6dfR+4d5Jj7QzvNuIxizsJLFNlCgsewd4+iY6rNr4vbp2BQyfqs0ULgzKeZaYMeRXnz0Y4XrF6KPWRhxdaybnxjJnefsvJd7hXW86rcMAKhu19FUaG4qS7aaKz24ufATIzjpUSnSdtFos+ySW9vZMhGWd+uYcZE5sKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(3023799007)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBaV0JSR3ZYOTRyOWo4OFBZdGJaS1JobnVDbzR4bXRHQ29xY0wvZm91TVcx?=
 =?utf-8?B?dkVTTm90VWdnUDQzS1g0aW5QYVBrZXNtMmVMT2Vqd28ybXl4K1VTZ1NVT3NP?=
 =?utf-8?B?STN5SGMzOEI5dFpWWGZkdmdBQ2thaDkyWmp1UVo2OVpBSjFOblRLdHNGQ3F4?=
 =?utf-8?B?UStka2xnZFNtaU1ZbU9FaThKaWpZN240KzZkblRrWmQxMzdhVFhEVjkybUhZ?=
 =?utf-8?B?SnRnUENLdHJ2Rm5xbUZFcnA4cnJOMXVUYkxpRTR0dTB2OVl0RHJpZjU4MEJ3?=
 =?utf-8?B?UXJqK0tSall4aXpVSjhQMVdyUExHWnVldDh1TGZGT01tcER6OElrLytzdE1l?=
 =?utf-8?B?TWwvb2tYN0dva0MwSzZ6cm9SbTVEUFRpM0RxTDRZVkVSVVhhTy9pWmtvR0o3?=
 =?utf-8?B?VXBJMHBBMHhRenNmUmRaNHpBcm1YOUdaNzBzTWZ2cS9zSlFRQnpPa3pybHV6?=
 =?utf-8?B?TnlmQUxMbGMxdXJTRGpPUCtDK09SS1J2V3lVYU8xUWJUaFQweGhiTVNBUVFl?=
 =?utf-8?B?ZWpFUERUVEp2QmdreE9SUzZlMFZWeGhZL1RrRCt4b0I1b05KRnd6WGcvM2dN?=
 =?utf-8?B?R2NzSm9Zc1NQTzZxZUpGNFllWTQvWmJoejl5SnIyZjQxcTRJckVsWXRESElN?=
 =?utf-8?B?d1BuL3ZZd0k1R3pOL2I0L1hZdk52L0daa1hpMzVOSEdocndEazA3TkM4Z1JM?=
 =?utf-8?B?RzE4RHFuUlNvYzdDVERNT01yTFNsUzM5ZTk1V1Vxa2d4cEtubENQbVYzdGt5?=
 =?utf-8?B?dVQ2QlZPQ1VXU3U0amJNa0FqQzZETWF3ZnJ1TDRZYjMrT0ZMOExNL3VYWjNO?=
 =?utf-8?B?QkRiOTdvN0NndEU0U29nQ3oyTDErYVV1anBGckw2Y1ZucUdGMmxNdU9CRklr?=
 =?utf-8?B?TkFCN2lOa2pETWo3OFlzaUdqWVBHUlJVVWN6ZHNFNTA4T1ArL0x6eE1pdU5B?=
 =?utf-8?B?bVZ1RlNYMEtRMzVoTkhzNEllMngrZGVKcWlxMTRQc2JFVEEvQXRxL05tVERM?=
 =?utf-8?B?MzZKMGhWdUM2U2p4c0xDcmFCZlk0WXp3Y1ZITVcvS2ZiMFVZQUp4dUZuNm8w?=
 =?utf-8?B?WTQ1eExHeTVueC9USkM0UktGRm1pampKdUQzSStVVTJnWjB0SmlCL21RdzIv?=
 =?utf-8?B?Um9xYklFMmpxRjd5RkZ2RSt5dUJDakFkYmFFTGFRTHZoRllPZldTKzBoUjlw?=
 =?utf-8?B?TnZyS28xWHlLa1JtdXRVOGFmZ0hEZVJscmt5bnFRdXM0K3A5YjkxbldVZXJk?=
 =?utf-8?B?a2VOdWtNNkNNazAwS2xhZnBtemxneUFrQm1ORU1qaThHcVBoTlhLcjNWNE5p?=
 =?utf-8?B?UHowQlU1aUNYaWRmZnJWU0xkckp6RnpFNTM2d2RzUUZYbEZpN3ErUWVPRlZD?=
 =?utf-8?B?WUNBU2tYeUNtK25JSG1CRmwycytoUXZ3WXdDUm5kaWNwTjBEV25WV3pwSlBq?=
 =?utf-8?B?TGVQZklFRVB1UG53cERnR1JQcW9yMTl2eDBESUUxUFFLMlhYZm56QzYxTCtw?=
 =?utf-8?B?TWd6L05aenFENFo2ZnpPMWpubmtCMzh4bTh0ZktZaWh2aVBkeWVRYkM1RW9M?=
 =?utf-8?B?WmJUVmR6NGJtSGFPRGRNN2tiWTVTODI3T3c5TUR6T2pnVmJsR0VQdVV3ZFA5?=
 =?utf-8?B?eno4b0FVWmJxdzZzYlNSR0RDQ2U1eVUreWdLempDUlN3eGFSMnJkb2hMaG1X?=
 =?utf-8?B?TnYveWlYUUN1S0Vna3BJWFI3bmpvd1hvY21ZQXVEWlE0c0hydGE5OW0rRWQ3?=
 =?utf-8?B?Q0dMQ1BiVTdEK0hYaEQ2ZmFqbzRnSnlBc2lpd0JaQy8rVThnUmVLbFNmSVE0?=
 =?utf-8?B?WFhuVVpENldYUTNRMGVUM1BGeElsMEhGcnZSWU9aQjA2Rm5CVTNOVi9iYktj?=
 =?utf-8?B?cjZ1VVpnMnVkRitQd0Q2OWZuNmpKaUlOTGQ2aUU4SUV6NnJ4MmxaMnY3QWY0?=
 =?utf-8?B?Z0VJLzBoZHNWdE1SOW12SENYRDN5UHdkSk84ZlVSaWtoSUZPall2Rmc4c09K?=
 =?utf-8?B?MEd1aks5U0RGK2o0dmZFQUJRYkhkUk9HNWFyNkJFUW5RbVI4dlgvbXBvMmN5?=
 =?utf-8?B?VytqeEFjSEJTdHFaRzRkMENsdEl4cldCa1JoQVA2cVNXdkpiUUdwWnQ1d3k1?=
 =?utf-8?B?eUptcE5nZHpkK3U5S1ZCRDk4ZVV0clB6Z2txaEpXemg1dWZPWTNNY25reisy?=
 =?utf-8?B?TUgxd0IvTDZSeXIvRFlFOFp4bFMrK2FWekdWQmJteGZBV3lLcXZEK0pkRlJV?=
 =?utf-8?B?dUExR3d6REpna3c3bTVQMytFZ1lmNks1dHNpbWxlajEvajh1cFVrT2k2NWll?=
 =?utf-8?B?RTRrUExnZWdxVkNoZFJuRGRtN3B5MGpNc3B0bXROamt5WVhORkwrUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6618fc-dc01-4d8a-7953-08deddd940c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 16:43:49.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErwXpB/JL95n0909hSxgzrLwo9vIAGv9+5o5CfBzyk8HCWtdmvJTFkYolE8zdPj9Q0AEKuiBsXTEK9EzjFvmGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_094400_738824_6BC4D94D 
X-CRM114-Status: GOOD (  21.58  )
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



On 7/7/26 09:24, Ben Horgan wrote:
> Memory bandwidth monitoring make uses of MBWU monitors and is now exposed
> to the user via resctrl. Add some documentation so the user knows what to
> expect.
> 
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua
> ---
> Changes since v4:
> Add paragraph about the future.
> ---
>   Documentation/arch/arm64/mpam.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 570f51a8d4eb..67fe515ed501 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -65,6 +65,28 @@ The supported features are:
>     there is at least one CSU monitor on each MSC that makes up the L3 group.
>     Exposing CSU counters from other caches or devices is not supported.
>   
> +* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
> +  L3 cache-id to identify where the memory bandwidth is measured. For this
> +  reason the platform must have an L3 cache with cache-id's supplied by
> +  firmware. (The platform doesn't need to support MPAM.)
> +
> +  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
> +  makes up the L3 group. If the memory bandwidth monitoring is on the memory
> +  rather than the L3 then there must be a single global L3 as otherwise it
> +  is unknown which L3 the traffic came from.
> +
> +  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
> +  match the topology of the L3 cache so that the cache-id's can be
> +  repainted. For example: Platforms with Memory bandwidth monitors on
> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
> +  cannot distinguish local traffic from global traffic.
> +
> +  All these restrictions based on L3 cache are due to resctrl, currently, only
> +  supporting monitoring at the L3 scope. It is expected that going forward more
> +  MBWU monitors can be exposed to the user after support for more monitoring
> +  scopes is added to resctrl.
> +
>   Reporting Bugs
>   ==============
>   If you are not seeing the counters or controls you expect please share the


