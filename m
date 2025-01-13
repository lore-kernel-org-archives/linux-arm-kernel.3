Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1365CE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSAHmbT5TgNlLyQhTAsrWyQLVkCTeDjvhmbr+pqws/0=; b=o3eC3fhoih0Gf79uwo18lFFhNq
	bbTtml2O2XfpwxDASwIt4j321xE8Ytp+F/aMC4ah01Wwriv51xLlHq85ga570YqlEiBDkMdT8NvQX
	E2sxc8CGJNdGiI9Z/tINqUUySHfkYK/5DJz28QUW82fsxNcgQTmApxBaGvN76pwcZ8qvkxtpSceAT
	MP2rano6sDxuKEcYExeMBmtdhF9V8BacUXn0A/MQGhBp4KyWOGtaO1YQ/jxCUKr9io0vup5digFCZ
	xzxa4lFn3Mwd+FXepLhTazK61hPsAqxQdnq5x4ZWxEagya3XMnw+NxARcOsssQeQX6yTqimSlGroD
	Q+idTl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEw4-00000004GBS-46Dp;
	Mon, 13 Jan 2025 07:32:32 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEuo-00000004Ft3-2r1n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 07:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736753474; x=1768289474;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dU4XPyxc4fu48Sg0z6QTLS57BV8G9oslU2Hx6V1Y6sg=;
  b=Ne/9qRsasdqR6iodmObtWNvWl2NzvyXaY5XxApKEMBfFQRALeKI0Fa0s
   74mot4WaokGkVP8ENNpLe9pBTQpqVxc7vucAvCZVcZFF6HDofnuWybG+y
   nNQECcRl5Orwg6pEdRBN/Vxov0xOyBmuLHrCLSHGqmpEjVoFy2x485tUm
   5sGV8fnd36oDS2UKby+79yauAHSVK3ZO+fYVyAv8bAC/VN97DZ2/PCJBU
   NBhGwNVxylNR3mAkdzffHn0KxIr+FUsfuqhIj2XWDL4iCfEtvk0vL9J5z
   f2g5bpluLd0cLE9Q/eQ+YGavueDn59ZHI50nR4MA1WpiKaOYkz7dHkf3d
   Q==;
X-CSE-ConnectionGUID: unmixa8WTY6BBWaetuAeyQ==
X-CSE-MsgGUID: UH5y4ctUS5ynQRdBZiKsuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="24597668"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="24597668"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 23:31:13 -0800
X-CSE-ConnectionGUID: no57AUL7RV+Hd+2mgAapgQ==
X-CSE-MsgGUID: Cp5oqT+yS52QPn9k9dPPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105252923"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jan 2025 23:31:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 23:31:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 23:31:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 23:31:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJUJ1V5OiBWn3jYEetSQLvBhLFdVbQkSt/uS1hogKLv+sejjgiNmmshWsmK6dgX9lTQeQxElW8A+/ETK656QyzAaCZfh416/It1MnnHU5Xefb5invmYgcCR1KRbMW00JyLeuZFTPTS26UTjOLTdzmdZ0n1bkPujGWB/azOfOHSiROYFDwTCeumtDSwx2sqqPPL/4p2gWvCkZQ4EJo3Hzz7cMapgz6q+es6D77KPEbHwYx495JvlIcbtDciyzgQIqoIaLzq9md66ebvzkrCz7A/jwXOyuop2A4D0X1XmODhH8IDgtdTjYyvnwvOKHiU2bM49cgVMEHXE9iF+7gtHciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSAHmbT5TgNlLyQhTAsrWyQLVkCTeDjvhmbr+pqws/0=;
 b=epMVh9DjKU3ETigg77/HvJV7JwJbPeW9KsHgxxdtYlKq57fmn7PrJfRRnJXSYAKWyPsX85e2O/E6jfeqD9wNlFdfkVH9dLhPXn9UvKpOi4xK/kMEBGr2t37r3PYSySH8JC3amOC8LbWNar26mk8v3TopGt/rAzVKoF1fVUrU4+/NJ4jRhVup0XL3thJaaILvdmBrTFmIfVbgH396LR6sKq6fHlTGcSHGwwqKTHWIO2UPdWm+ukk2IRbKqBwLIVQy6J4qGiGiu1PudyEHEqxY+k3M9aaUgf+rYvIEnZECheu0hFlHBI/g5gvflHl4W2+IVturYJEsVpBvRWTf/YbLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 07:31:10 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 07:31:10 +0000
Date: Mon, 13 Jan 2025 15:30:54 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Barry Song <21cnbao@gmail.com>
CC: <lkp@intel.com>, <akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
	<baolin.wang@linux.alibaba.com>, <bp@alien8.de>, <catalin.marinas@arm.com>,
	<chrisl@kernel.org>, <dave.hansen@linux.intel.com>, <david@redhat.com>,
	<gshan@redhat.com>, <hpa@zytor.com>, <ioworker0@gmail.com>,
	<kasong@tencent.com>, <kirill.shutemov@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mark.rutland@arm.com>, <mingo@redhat.com>,
	<oe-kbuild-all@lists.linux.dev>, <ryan.roberts@arm.com>,
	<shahuang@redhat.com>, <tglx@linutronix.de>, <v-songbaohua@oppo.com>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>, <x86@kernel.org>,
	<ying.huang@intel.com>, <yosryahmed@google.com>, <zhengtangquan@oppo.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Message-ID: <Z4TBLhxvV6llCcWb@xsang-OptiPlex-9020>
References: <202501061736.FoHcInHJ-lkp@intel.com>
 <20250113005626.2290-1-21cnbao@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113005626.2290-1-21cnbao@gmail.com>
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: f15f0ab6-73b8-4beb-7114-08dd33a44052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTJMb21kVzA5NkZqNkRuYUpDNnBIZFpSdG1SRklXV3ZCZjBjbVhqUGUxdzNO?=
 =?utf-8?B?a1oxVlhaLzluVGt2dnExbStzRnJGTUdISDRRNFR5OEZoUTAxVE95V1NteGdw?=
 =?utf-8?B?MFJSNEs5QldiWkU4dVdQU01aeWhiODhGYiswYnc5aStETEV2ajJDM2s1ZGRj?=
 =?utf-8?B?NTRnTlFrbENEMUxxejZmVXEvMW9VZDNYbzVkQUdUWnZCN2pjWkVYVUtkWHZs?=
 =?utf-8?B?dTZQOFhDRWlrclQxOWRBTTZLa0ErblZjR25BR3dJNVBqMzRCMDFyY3VDaHN0?=
 =?utf-8?B?dDVkMGRzUTBBbno2aUpKRzRodjI3MDBTM0RmY2RBZkpxTUErSWpjQ0MzUkpn?=
 =?utf-8?B?ZnhsajEydkxPQzJ6NEI4SW9XbUxKQ3ZHZmV5c21ubXJQRUl2NzJqWFMvR1JC?=
 =?utf-8?B?c1RydWNscGYrNTVUVGhwZkt6aEg3RWI4NWUrT3VtRlVmaFo5UWUzdjlWTDV1?=
 =?utf-8?B?ODFkKzl5STdvVEp4VmQ5amhMNTMzYll6TGlYcS9FVkZsNUtBOG9CQlRiN0ll?=
 =?utf-8?B?TUl0ampyZjNyd3lnSjhEMTlqcXdqZjA0bGpYZExYQ2YvUURselBXanFOL0po?=
 =?utf-8?B?TjNGeU1nSisyQ3NDbHNydStEa254WG9zUGNBdmNTd0NKTTJsV0xucERpc2Q0?=
 =?utf-8?B?NjA2dXBoMWgzL3lSb2hXSHRWalMxM1p0ZTRnRVJSMWFrK2xqZnltRGxWU0Nu?=
 =?utf-8?B?ZndOQVJ2NVU3b01zVGJGc29URlNDRkhMeHN1a0Q3UEFzMUlpcklFY0VBSUJX?=
 =?utf-8?B?NjAyYTVuTXkrSlVOSUZjcVhYRm5uZTltYmRJTS9MR2VzOHJxNTVMUHQxcDR3?=
 =?utf-8?B?SXNSbjdOeXhrWU9hRTlueXZHb2ZnTjhuWGJmUUZDWnhWNndlQ1c2NytvdGtm?=
 =?utf-8?B?dlBNdHRHRlI3QUhFNHZ6THNHd3VSWTBlK2ZhMzlTbm02NzBZajJ4T2lVMUZI?=
 =?utf-8?B?c2JYODhDa3ArNGNOemhOQW1ERHIvV1BPTlJxSis4VjZ4dHJJaU0rVGRnNWcw?=
 =?utf-8?B?VGpiYm5kTGZ2NDVrMHgzdFN4a085UlNQZTQ5NnJ3djhyVE5jZnJSWlREdEpU?=
 =?utf-8?B?Y0UrK0tNNExQWFpUdVFXVGg1U2Vra2FZK0pqSmd6Ymp3RktCVDNra3dzRUE2?=
 =?utf-8?B?dXVaSDRJN2ZPbWJXaUJzNVRXTEllVWZ6cktYK0FUenh1N2NhM1gyb2VGcUI3?=
 =?utf-8?B?N1FIdVR3ZkNoamRwSTJLRVBnMjlJcml0dmp1RGJMUWZnaktUOXZobEZ4eVFw?=
 =?utf-8?B?YXljV3NhRzh4RHp6eWkrR3U1MG5iWlJ3N1luY2JhUm1NMjZxc3BFSWdTajEx?=
 =?utf-8?B?VXdCckhIMktCTkVlbmEvL05oaWJ1WUw4ZTljSEpRbzZtSmxZUEZUZ21zUm92?=
 =?utf-8?B?eG5QQjFrRXBkOXlrcStDaEl3ZHQrbEFCQ01ZWmpHdUhvVmhvOHB2ZlR5T3ky?=
 =?utf-8?B?LzJrcHNITWtGWk8wL0srV0NZaVNDUUNIYXhUcWw1WWVWZ0F0NlM0YUFuSGtz?=
 =?utf-8?B?K3U0TjVSVmZ2cnBHZ21UTjBLNnI5c291amxwVTJXbThscmdnRXhudDduRlBY?=
 =?utf-8?B?L2lsbG1yQWtRckxNM2ZPamd5T3NwWW1VUGhVb0ttcHpJSTdIc1ArUXFLVzl5?=
 =?utf-8?B?TE1lSTlrSDMrRXRBVHJJZld6QVNMYWJjTTZISXhRSisvU2xhQzlnU2FadjRV?=
 =?utf-8?B?TitSeFVYV3daZFFRVXp1UnN4aExzcXE5THlwQWRnOUV3NzJKeEhhVFlYWHQ1?=
 =?utf-8?B?TllxajJTYThWTm5kbTBSWnZQY1VaODk3aER3SVVMRkpFMFc0ejRnU3duWmRQ?=
 =?utf-8?B?aWp3eWxEdWZ4WjRrSUV1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVpXYjlUTmFzMUNoZVJzTGN4SG5Kbzh1ZHRlZWlrQ0h3bWxpaFkrV0d5Sk15?=
 =?utf-8?B?ZnVxbDVLdUl5c1ZMdk5DL1Vid2l6THlKZHhKRHU5azh6K2VCOE5YNU5QRmtr?=
 =?utf-8?B?WmdsLy9YbVlZU3lCcE1SMW5KcXNkcnhpOUQvYkdPbG9vcnJPV1pkUVFSUTBY?=
 =?utf-8?B?SmU3UjkzVkpkSWJPTjNpYWs5TGdBMEVOOEZCUDh4RndlSW4vUXFtcUl5enIz?=
 =?utf-8?B?dk4zOE5FWTUzcGRmak9BZ1poRGplZHNhbU8waVRIelI5RDZhUSt1cWFwZkQy?=
 =?utf-8?B?OEhMdDNXbEtjZ2NpRlNJNlRKdVZaMWk0UFRrTlh1Q3krcDNMZkx6UnFCL1RW?=
 =?utf-8?B?Ujg1WkxBaU95R1NHWWE0UXk2cWc0VDNiS0Z3NzI5VzcwSEpJTTBKRFkveUhk?=
 =?utf-8?B?WmNOQzViUDVlZEpxdVAwQzJ1dzYrRklzTlRYZE0xYmlGdHhFU0crZ2l1UFhP?=
 =?utf-8?B?WkhRT1A5cWNXNERTQ1o3WVRVUUgrZ1dYY25SMWpjRVVNWU5pVmZPVHRLT3h2?=
 =?utf-8?B?aUNWQlVRaGZiYVB4aGl3Y1crRndzTkJjRXA0Q3cvN3hJdEhBK0FKeWhlaGtq?=
 =?utf-8?B?Q1hOVEtmc25YTklKY1NxZGxjQWgwaFFHK2Nyb3U0elJlVk9Dd0xHMkxlR09R?=
 =?utf-8?B?OGVvc1VsdEhWZFA4MmE5MmNvck9xRTZ5R3FqTFI3US9CeEhMeWQ0Z0lHV2Vw?=
 =?utf-8?B?N0FTdmJGUmlLWVNiWkFmc2lFUlIrcTV0Zy92Z3poaDJHTzlaTUQ0WFAzRSt0?=
 =?utf-8?B?QnJXQWRoZ2ZXMmNLWWh4aDJiL3hzbTFvRkFPYmpRZFRJbFNUZS80VDNhVzBI?=
 =?utf-8?B?K3B3TVI0WE13UlZjRk9IRFhrc1VNejU0SXhydXFjVDA0ckNySWZ2c0F2Y2hm?=
 =?utf-8?B?VERwZjZKM0NPWWwxdzdxWk4wQmxJWUowdDRGeGVmK3ZKeWF3WmVKNVJXMlhh?=
 =?utf-8?B?NXRuT081M283VjVkMmhSS0czK2JJRVRiTUROQzRWY1plOXpxRkFxVnc0N2dY?=
 =?utf-8?B?eTVlOWNVZnRCNVAvdGJUZTFjRmowVnQ2eUFVbWdtYkF3MzJvMGE5K2R0ZzVU?=
 =?utf-8?B?ait2emIrazM1T3dwTkFHdmF3Y0tNZUlYY2lQSDVkZTAvd1R0V2luWEJlUmQw?=
 =?utf-8?B?OTZDckxTNmZ0UkQ2bjZuL2F6VkxpbDhxWUx6SDVjaEhyR1Q3SWU5UWNyNHRG?=
 =?utf-8?B?KzRGZjAvKzB3VEdFY0Rid09zYitqbFViM3VPRG9CVWxycWNNVFVhRjBPNlor?=
 =?utf-8?B?K05VYStOSGRoREZkRzdFRXlkNG9BN2FXcCtndFZ1WVcrT0kxZTI3YXl3MVQv?=
 =?utf-8?B?UUdLVTVnb29lUkNsaHBiRVNPUFRiWUNOYjFsU25qTCszOHlQYmFDdkxzOG4v?=
 =?utf-8?B?RHVLelVOWEYvSVhJRnI3MWtobTk0OU1lNHdiNXFRZVZiYzZleXFvVDJaT2NP?=
 =?utf-8?B?Q2gwVHdiSEVvcDNWdm5WN2xKc2dKWUVyTEUzcDBJOXlNKzhUZVdKSlRZMVlQ?=
 =?utf-8?B?V3REY2FJTTNNRnYzYXpzVDB6dGVYU0hHVFB4YWMrdXVXYVNvdXU5dnJOVDRL?=
 =?utf-8?B?MzVNdXduNS9iV2dGajl1Q2ZRWUFSc08xSmlPNXdNaG9Yei9zM0pCT2xjbGJw?=
 =?utf-8?B?VXpYUXNXdlRQVmpWNWNLUmh6aXJwR1hVNTc2aTZ0U0lHRUhvZG1hdDh5T053?=
 =?utf-8?B?b0FNL1I2Q1czVHdtOGIxMzNBSHBnVlR2cFoxdTB4aFkrd3JJMkpyMFVNU3Rp?=
 =?utf-8?B?aVNtN21IWGY4d1JjR1R6alN5SmExMjVqS3N6TXpkS3BOMkxEVDdPc1M5NCta?=
 =?utf-8?B?TUsxNnI5anVGRUwzMWRvaFBGcW40dWpoazU3eG5FY2g4NjJkTjRBMk40RFVZ?=
 =?utf-8?B?M2JFcHQ2SGNTeDhPUnJPa1hlR2RNTTA2U3BoTXJsL3d1cExJK0gxZVIzRXRD?=
 =?utf-8?B?dXUraXVCZXRBdDRZWGdHZEVRYWhnTFQ3aENOeEhtcDdpRkplcGRvaDdidTNT?=
 =?utf-8?B?N24rMnZ6YktPdnozRmx0dUkxY3pKRDhITGtZa2s3MW4rOXM0TVcrLzJ1Y1Uz?=
 =?utf-8?B?RWVoNHRPZTREbCtiUkd5N2kvcXArUUZubnBwakRadkZ0VjdiNlMvN0o0Z3Vs?=
 =?utf-8?B?cDNTSHVCdUNsUUVQWHZiWTdsM01BOUJ0NDZvTWZ1Z1Bzc2xoVUExczg3dmZQ?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f15f0ab6-73b8-4beb-7114-08dd33a44052
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 07:31:10.4365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Azngqi0JDGtd2uorWJgJOBV4t+4eIDY+dU1rFhRYUAdiD2Sw6DyXpLbuaAJNkKi51ndZ6eevrCk5V8xdY6+enw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_233114_779719_D64FD520 
X-CRM114-Status: GOOD (  21.69  )
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

hi, Barry,

On Mon, Jan 13, 2025 at 01:56:26PM +1300, Barry Song wrote:
> On Mon, Jan 6, 2025 at 11:08 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Barry,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on akpm-mm/mm-everything]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
> > patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
> > config: riscv-randconfig-001-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501061736.FoHcInHJ-lkp@intel.com/
> >
> 
> Sorry. My bad, does the below diff fix the build?

yes, below diff fixes the build. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 72e559934952..7f3ea687ce33 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -61,7 +61,8 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  bool arch_tlbbatch_should_defer(struct mm_struct *mm);
>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>  			       struct mm_struct *mm,
> -			       unsigned long uaddr);
> +			       unsigned long uaddr,
> +			       unsigned long size);
>  void arch_flush_tlb_batched_pending(struct mm_struct *mm);
>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>  
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 9b6e86ce3867..aeda64a36d50 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -187,7 +187,8 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  
>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>  			       struct mm_struct *mm,
> -			       unsigned long uaddr)
> +			       unsigned long uaddr,
> +			       unsigned long size)
>  {
>  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
>  }
> 
> > All errors (new ones prefixed by >>):
> >
> >    mm/rmap.c: In function 'set_tlb_ubc_flush_pending':
> > >> mm/rmap.c:685:9: error: too many arguments to function 'arch_tlbbatch_add_pending'
> >      685 |         arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    In file included from arch/riscv/include/asm/pgtable.h:113,
> >                     from include/linux/pgtable.h:6,
> >                     from include/linux/mm.h:30,
> >                     from mm/rmap.c:55:
> >    arch/riscv/include/asm/tlbflush.h:62:6: note: declared here
> >       62 | void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > vim +/arch_tlbbatch_add_pending +685 mm/rmap.c
> >
> >    663 
> >    664  /*
> >    665   * Bits 0-14 of mm->tlb_flush_batched record pending generations.
> >    666   * Bits 16-30 of mm->tlb_flush_batched bit record flushed generations.
> >    667   */
> >    668  #define TLB_FLUSH_BATCH_FLUSHED_SHIFT   16
> >    669  #define TLB_FLUSH_BATCH_PENDING_MASK                    \
> >    670          ((1 << (TLB_FLUSH_BATCH_FLUSHED_SHIFT - 1)) - 1)
> >    671  #define TLB_FLUSH_BATCH_PENDING_LARGE                   \
> >    672          (TLB_FLUSH_BATCH_PENDING_MASK / 2)
> >    673 
> >    674  static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
> >    675                                        unsigned long uaddr,
> >    676                                        unsigned long size)
> >    677  {
> >    678          struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
> >    679          int batch;
> >    680          bool writable = pte_dirty(pteval);
> >    681 
> >    682          if (!pte_accessible(mm, pteval))
> >    683                  return;
> >    684 
> >  > 685          arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
> >    686          tlb_ubc->flush_required = true;
> >    687 
> >    688          /*
> >    689           * Ensure compiler does not re-order the setting of tlb_flush_batched
> >    690           * before the PTE is cleared.
> >    691           */
> >    692          barrier();
> >    693          batch = atomic_read(&mm->tlb_flush_batched);
> >    694  retry:
> >    695          if ((batch & TLB_FLUSH_BATCH_PENDING_MASK) > TLB_FLUSH_BATCH_PENDING_LARGE) {
> >    696                  /*
> >    697                   * Prevent `pending' from catching up with `flushed' because of
> >    698                   * overflow.  Reset `pending' and `flushed' to be 1 and 0 if
> >    699                   * `pending' becomes large.
> >    700                   */
> >    701                  if (!atomic_try_cmpxchg(&mm->tlb_flush_batched, &batch, 1))
> >    702                          goto retry;
> >    703          } else {
> >    704                  atomic_inc(&mm->tlb_flush_batched);
> >    705          }
> >    706 
> >    707          /*
> >    708           * If the PTE was dirty then it's best to assume it's writable. The
> >    709           * caller must use try_to_unmap_flush_dirty() or try_to_unmap_flush()
> >    710           * before the page is queued for IO.
> >    711           */
> >    712          if (writable)
> >    713                  tlb_ubc->writable = true;
> >    714  }
> >    715 
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 

