Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E8DFA1FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3Ew9UtiCCf6vp+xbl+ZwLoFp1hT1+mpt2ja2fEn1xw=; b=4ZF5ysSi3RARcEkPEdtBbPFbAy
	5fSVVhDrpEA4oRWXitTJVaHFfIpJGpmModu//0vnOTFR9dd+rew2viqkCcgdZwccnwwX2lvF8df1K
	TlQJn/IUT7x78gef1EXUc+mYCO/BhF7SW5Jbtze3Qxq+7P2p6e30i51jamdfEbnM6rBN1Ve8ZUWlA
	YbcmLiNFS7DyCgBLCuwz4l3bHoMcawlUleQ6lYi6i+74Un42Rtz9W4dzwAmoXpNH4cUvmhGKi1qZk
	Xx5EMtUcmdd5Qff+B1FA5p+ETDWqMsHBIANz7BUhk4/wK6EKpsNLRZkryOPfBjwxihallnl5M+Wnu
	LjUutFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFa5M-0000000AT5J-2A52;
	Wed, 22 Apr 2026 16:05:58 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFa5B-0000000AT38-3Ab7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776873946; x=1808409946;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S3Ew9UtiCCf6vp+xbl+ZwLoFp1hT1+mpt2ja2fEn1xw=;
  b=emXg3mqp3b/j0Vcw/zcl4fUu2ugoIkFSiSFu1WPffrrjcIA4GACbgPqC
   AtYAvydoKUH9jTDzp8A68juKcqHnKcYAlflD8Qb3v1T60eLLDjYUojJpt
   D9+AyZc7ltCtQlS/n1izqgtcicXLbagzYEGaxInFbRYyK/47vMd7oRObn
   QvuNyimuSIlkM8Yb0nNZJ2nckoTGXElsSxg7y7yhwbCjzj6tair0L67TF
   ZXm3m/X9DFKtXhEsxtW9fzJrjrR9BZKygdBLjf3Vv8EYTWGyU6oFArcp5
   IET0+AxQ1rDAZc8ceTchoegfl091B3h0laAjdb1+rNM3y73DuNZ94qfeW
   g==;
X-CSE-ConnectionGUID: EH2q11rfSwOhuj+a7CgXHQ==
X-CSE-MsgGUID: vJL8LHWbQ+25YOTlvMfo1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77895684"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77895684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:45 -0700
X-CSE-ConnectionGUID: 7inwKzndT5CLZsLIjbVKyA==
X-CSE-MsgGUID: i1VFWSCKSiqXLDIrkIVNww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="234179712"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:05:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 09:05:44 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2cSulnF241Qfq9emiizDJ0ScIAl7v5YgGVU/wCZxQGyM2oG+uTBDhYuDa/y6SvizVEQFndHSRt5XY8uaNXHctpFz0Jh7I+cHPpVPlGgrbIo5BhsbR8/NUI8EXhg7phy8Ucg2L/KdsV6hnHfmuESSs/U5mHGLw7L2UQC4LMgVsHaKmABlWD7o02V3RKsJZmgAQa+6hkgLDCy/2zqlW/0vm9eDNbYsn8xLXJ5VryXhPcxM2p6FxUtMgeGYcSA8gpCnyz0+Kwf/fLDcQ/pjT4vY9Ppm0+aIRtXQdJ1qNYUC1eWzSkuyQxbzUjc+vYih0bS0/a5Ou4llD+v7aTwURrOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3Ew9UtiCCf6vp+xbl+ZwLoFp1hT1+mpt2ja2fEn1xw=;
 b=G8YCwfv2x1/84P0+XseBtEUzHl0lgaSsxMTc49v6ff/bC1wRaKhfWQ9SbNFYTWQhSBtYSMupUCCmFF1X8ySiIewiXtgOt0t9dpKM0oztkSBPjs9OM4W4E4oi2DbnJff0SmUcbYVlbk3Ksf+w0FdtnCPKmb1n5sLkuxwX6vXIZBanbEajHiDZGFeaON9wQp+PinLmHu3bIBdb3NiMpaoiK8EWX4uprCe0AnGl7FVuNbsIaLoZN19F9KHLFggibU+Fpcga5SV7ojY+pOCWzYXiGZwKPUVBKYrI8DlFMbpPFzovjCMVGklTabXc/h2uRb9qjbp004egJeBevqe2f4JefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by EAYPR11MB9564.namprd11.prod.outlook.com (2603:10b6:303:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 16:05:41 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9846.014; Wed, 22 Apr 2026
 16:05:41 +0000
Message-ID: <dd37251a-55cf-4747-94ab-8deb4ff93907@intel.com>
Date: Wed, 22 Apr 2026 09:05:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] selftests/resctrl: Remove the definition of the
 IMC counter config array and imcs.
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-7-wuyifan50@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260410093352.3988125-7-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0338.namprd04.prod.outlook.com
 (2603:10b6:303:8a::13) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|EAYPR11MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1eb41b-2619-42c8-33ad-08dea088ffeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 167Oy3PQ7BZ2BUWm8l+CHIzmn3s7PLotl6h94plQ1FIa9R9X3ud8E71HGsNbWemZKSYk9THxOC4YHeiXXyG5Yxz6kcYTKoUKTJS6eBAFZwkZU31qofXFLXuPAQwGOxeSe9YmiNAePvAvqsxGNqCKp+mp3hP6dL1qdpjlKc2JnYWGeWLW4UzYTjgWCYFh/EzKpKiCwVEzpWLTYv5K5BZojcxmHSkPC5U4Ce1T+Tx/0DzZp4FykXLy1Q+NMEmM/tOQ4jjkHL2qDTKYNOmRtg76i4NwAd/Y9JeGR7wmH/NoaiRwG8zsACED/WD6M1Q7l1X23PiTPoBcsuWwI5ldf7mr2MomBBtUxEJ8sRf4Ki/owr7EGb2eISE148jzAnEdGzCVSba6KCjzT0ogTqsQvRvGeqW+UveUrJfHbpwp2OqwObuZtI0UOhMbHAsxyvvAzuUAw8neMmk9cn6PVH9j53/KYyfMBHP1q4GiA//tRn3vCMYSAzbLZlCDor/4bWwstdooYKjuVmKw2pq5kR9xe9dA2A62Wj+lDf/w0685BU+mmZaDgSohjaOXKhigyggRGHtgu8b44/9Qm9Gi8E+YYFxiePCfekGd1RUxPrTGec6xCCrxs2sBumYtC/E3nuSTvVEbi1AkfEy5R9fgfeT9l+Z5C7O9g4SHxVRNTiAxnMbUbRQfqolfyzkHEniOv+DkFM1U4KMEAxC/6D84HvN7s6Cse3E2p3OJu3xpBRwjYWCdoa2Mp0SiniRi1y7FB2utLUO/IAqJSG2n8PjA5dk/gHhuJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldrY3JHK1FFL1l0V1FtZjF6TDJXdnJsamF6S3NFc0R5TUJjOWQrNEs0L1du?=
 =?utf-8?B?U3ZCc0lWQ1BDSFZ6ckRZNzVrNnk4MStickxIbjN3aUowVGFpVGEvS1o2VnN1?=
 =?utf-8?B?SnY0Q1Z1OU9paDI5SURjZDY2ZXBFcG9mcnFEQnpWcFBzcTFkZ05HRXBBQnRk?=
 =?utf-8?B?aFEvQVl2Tm1xbDBXMzJoUXZoaXNuYjlCOFpRWVBrTHpRd0ZNTVdKd0tTY21E?=
 =?utf-8?B?Q1RTVTN5YlJ2aGJPNFE2MTRwd1VIeGY5Znd2dUdERjBnSXFHeEdPZll2b1RQ?=
 =?utf-8?B?dm40TTBZK2pJY0NSaFNobmlFaEhETVE0VFptVDlzT0t6aC9LVFBUenlnR29T?=
 =?utf-8?B?eHlXS2lSV2VveHZWTjBMVWVkcUNIb21qQTRSajhzUjQybjhDNW9jakk3a0Jn?=
 =?utf-8?B?OUVIcXB3YktNZm1UQ0svMHBMRy8xVlNtcnByQThuNFpPYnRwN1BpWEZvakJG?=
 =?utf-8?B?MVJ5ZXBHKytoSDhaeUZtZjZTQzRRUjJxTjdPMG5PQktUMG9iOFkyVGJBMHk2?=
 =?utf-8?B?SzhuREFVcVc5OGkzSDdzRmJwR05qTkRUTk9yaVJ0azIveEFvY01weVFpaGgw?=
 =?utf-8?B?ZEQraTdWeHVEQlA2ditINFpnZEFiVHVMZW0vVjFNSHYrZEZrQ1NZTW40ejJ6?=
 =?utf-8?B?TTZIN2hFSnpDdkczbGlnL1NhWlRGZDBqeDU5dzJxdTdpRHJEZDFlOVM3MzBs?=
 =?utf-8?B?SlVpazljYUM3WDRPa1RpRFJjc2lhTDkxc2lzVUk3Mm1Nc2pXcG43RlNvQi9q?=
 =?utf-8?B?MTFRc2VnVUdzc1BNOUNnYU1FOUNDbFlNVXpZWnB5VzdIR0MxQ3J1bUNNWVk0?=
 =?utf-8?B?T2tNMjFkNUpyM0NBa29jcVZJc3BDWWszUUJ5NUdYRmRpYVVMSDllTExGQ3Rl?=
 =?utf-8?B?aWZDWkI5dFRDM1E5WjVhTDJRbU95RG1acVRkQ2pUSXkrS2pxSGRWRWt6UytF?=
 =?utf-8?B?NDdLbjZabS8rdUlpbk95TmRjTlVncUgybUFQV0dXK0pEdHMxUE9ZRzJvTXpr?=
 =?utf-8?B?TTVlODFPSkZ5cUtHTkk5eDc0Z25NaEg5dHNqaTVpNlZpYXpyNmdiVHhjeDdD?=
 =?utf-8?B?MUZmWXFSNkk1czNWbFRCUEpQS0tWNDNhakMrQlp6cUNrSk11RFhQSWFDRmNy?=
 =?utf-8?B?dVM2OS9kbHdQRXFEL01td2VaZ21NYWpFQjRtMEExWDdzaEdCYS9ibDZIQ0RM?=
 =?utf-8?B?c3EwREpqZGFoR1pFVFh1UlV5WEc3d0xaSmtuZ0VRbUFtWlNickN5K0JCa2NL?=
 =?utf-8?B?NU0wZ2RVWUJRdU4veXlia1FPZHVNdHArejBQRzBxR2lrb3d5alM3MnloZE9V?=
 =?utf-8?B?a2FTMFFNQ1lINVNkM1FoZmVYNGlLZE1qNE1pN1kwdklPOTEvZmwzQ29RS296?=
 =?utf-8?B?aE1TVGFtYTd6bmR1S3hCTHJmUVB4REp0aTJNZWdhZ1J4MGZ5SmsrMnVCL0ty?=
 =?utf-8?B?akJiU1FaZk1IN1psdUt2K3g2WW1sQjkyYXplYlQ4WWxmbzRVdXNJSFFhU1N6?=
 =?utf-8?B?UFFWdTBDN3d1ZDZqR2JXUU1vOTFVU1ZTSzVhNjczemlDZzBqYU4wQktTcTRx?=
 =?utf-8?B?ZjBWTG54b2p5UTFodVpDTjJhdDJ3SUl3YzhLRDZHeWpDUkhsdXRGUlNDemxY?=
 =?utf-8?B?bHV3a1gzMlBMcWFueGNmSXlrUXBNaHpMMG5WTW1EMnlCMTZBd2FSSlUxVWRq?=
 =?utf-8?B?R2laMmhwRHI0S0swRUZwTmlPaUdDTGx5LzVtUVJpZi9BQWhBS0pnRnVkVTBI?=
 =?utf-8?B?WEtqeVZPdmtJZGFjd3JPaFRheVVPK1BhM1FEUngxWGRoRzVZUjNnR3YwMzVj?=
 =?utf-8?B?cCtNN0JYY3VVdXRnUDBsYXdCTWpKU0lsTE9aTGw3Y0l5OXdCSmpxS2J3NVFD?=
 =?utf-8?B?L3NXTWh2c1BYL0JRaGh4VUZTbWFPRXA2R3g0V0hyU0tXK2RNYWExK29Zd0JV?=
 =?utf-8?B?cjZNWFZ6ZW9LUFdwSzJPMkZ1SXdycHZLWXpVRWY3RXNVZDAzeGFseVNieDlB?=
 =?utf-8?B?UTBFSmpHdU9IMmh3ZDQzVG9wZnRoanpBK3pWamQ1MVF3WVlzMG5xTmVzeTQ5?=
 =?utf-8?B?Smcrejl0K2Q5VkxXbzVQYUpwZDd3UlgvM28yc005ZlBuMFdlMEhzWW15dkla?=
 =?utf-8?B?ak1PRVlUVy83cnJxNzk3QzJGQXJKSHZQZHVLK2FZaHhNUk1QUTU3TTR6OHFy?=
 =?utf-8?B?dlZHcHMxREFNeUQ0ZmNrMm4xYmExcjh3cDJidmNDRmRUbThObEo0MXA2K3Nt?=
 =?utf-8?B?TUtvSW5OaHY4OUJzVWdHRk11QkVWbHNiYU9vSmZiMXBuTUN4N2RXUmpUT09P?=
 =?utf-8?B?dW1vRUo1N0FVWmJXZXhjOFp1eGlmalk0M0J5UTJldHJhdDhOVllMT3IvSHF1?=
 =?utf-8?Q?82HcO8DtuSzhT5EM=3D?=
X-Exchange-RoutingPolicyChecked: K6jxvQhYy8QPueTVPUf22doH2QhmjHebigpjWegPKxuB2Hv5AJ3GvTjJPQrEfqMw3KFPxR9jeAd+7/gIcd/xlczDSvphJYn7NQ4j2FMeF6jEIQ3Zcd4J020GOXouvK8hdGTaLx6vjRmgMqSPKqveRYmdV4UOAsTIYmn36P1gIaw+ZcL8ukeLYrJzOgmb2oEB8JRWKvUW+cH7z2q8oy6UhpVjKlKHjShcZvmnj/fXcYCnIsm42n6EovXmq0IzwY1BtVRzZht2BRPGbvBbAVVEwmH6EdWk44VgFQr9H9VEV35Qa+oa9KAMOr7t9LvO7TFEMBWZTY5h49EUOIo49ku9mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1eb41b-2619-42c8-33ad-08dea088ffeb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:05:40.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ynfk1Xgz9bPB5oeAyC3wYPgiRHkkfJapmHq/UY8CkOCGIPBEHyFOj7PoO0gI7lNFr4xGnl9LjtK9gntK4w3V3ODv2ls+Wh6e8QaEYiBz/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9564
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_090545_845793_9A273C07 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi Yifan,

On 4/10/26 2:33 AM, Yifan Wu wrote:
> The definitions of the imc counter configuration array, imcs, and MAX_IMCS
> are removed.

Please squash these removals with the patch that removes the last
usage.

Reinette


