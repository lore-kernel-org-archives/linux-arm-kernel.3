Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35012106ACEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTKszxPVsDEUIF6m2qyiuDAckA0ETlrohCODITlTt3Y=; b=1Bi0UZXdF5DJluUVLJE+knzODi
	o1Dv+l8qo/kIJW+gTCqYnsXORpL+G1Dpj347XdrhbawG0EhcwX65KolicobNeuMkdOWs+m1anUAs9
	0Bs5Nm6w8l/R5Q6aPXuhA+M4skPRG0Aiw3/6F+BQThpqQVXQZjLeoWHZClMmy4gZlenfU/DQMkh1+
	HSKkS33xNAhesF1u59X5zm2QBJq9mKBOecUnwygwVs++AY9VZ5wZLLHdK5K/uKlt/cHlZ32w7pHgN
	bQhVN9Nwvr4ndSlskrsqLrG/WIkT8hPx0JCHWeNLwaJ1yBTI1gXBYlfF/E3FsufbzEDkoGRjhYvRT
	4Kf6WLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0n7x-0000000FNtZ-2Run;
	Thu, 12 Mar 2026 20:59:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0n7v-0000000FNsW-0woB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 20:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773349167; x=1804885167;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v8YINCKPeTqUp3Bs6EHNhGjmmJ59Kg873CJhTqciMLs=;
  b=iNkSr9i5AxSA6OirB46GmKzFDAGFRQKQQBD+S94Tm2wAVJiycEtxfFij
   HFjoLQ51MKQWK6BpdS55ZMW/JORUKel6rFF8r2QCGETBQ4ytoCd/ZJ3Gc
   vdPSRkf3w51hEGdBCXDUsh8gv4HMZcNXC8OUDZvSdOiEz4ExBVvY4aYMM
   YR0FNbJXWokgaB0qu4qocatNFrKHWuYFgBAinJuT4en5jgCRlUdSnmeSA
   WoT6vDCEcqjNGgHzr4A4Om5uU3FbCP8dulGd9ga2g55HarPrnDWEh+lJN
   1iE8zhk5GCQRMU4f0cthYq/vFIJo730uU9nFGaysWQj3ITf8cXgNE4vZn
   Q==;
X-CSE-ConnectionGUID: Sn3wSlLFTZSjdHaZYCidnQ==
X-CSE-MsgGUID: ndXzdVLoRRSBBN/riGZyIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74371525"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74371525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:59:27 -0700
X-CSE-ConnectionGUID: +BrvomU0TU+UjTEkOjgT1Q==
X-CSE-MsgGUID: WorSRjEOQSqoOMngK4sbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="258861074"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:59:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:59:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 13:59:24 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHHCr5xUjHrVKczT72OozmTkCm/O5d2ebsfOXgXcd4aMuLaGXplN0yv4r23ZUrg9b49mLrWOJGj8MYsWXGNWmAyzydulaqQQ1s3J2x9RF8dS1EkyihfabmIEMSXmsWOY20wqvHX/ocHklbYJuCiOblP++YqbcMpp/DJb4Fvu7YnSX8qdjntmLbxdmecwtc459GJ+XvqG2ukjHNnSKqF/Few92iASHu/jy/0IHLPhgY5bZ9QkDuF4usr/yNMvuykM9OIZJarxJLTsHmTXJxziPq4eyTers7v8QSZYoHkq2Szkp6rlUAdq+wxE0TnSj7ywjtLxCw8DLh7bwRcXMRVsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTKszxPVsDEUIF6m2qyiuDAckA0ETlrohCODITlTt3Y=;
 b=IEf0YHbb1+U19ONpMoi4FqX4rVFrcwUlylJIffCds255SYbvRUrgFAOiWvIl19dRSayxgyGC7q9Gb7QvNnQc86MJ2FpbbZSJtpDhNe2fE/rvnRj/CKiETR9kdZvl359BMfKXtbfYgMj/vRcyrqeKdeoQK7kagfY3DIHMvmUwv5qSevrE6z+1amRHPY9QcZi7q6g5cRL+Zy5BBP5uKGB6wcwdf7dc1rcgZE2rpGwxjiXzq08oFawHmp7zUkklwkr4Ba0GTChbsGU73OKbvde0+GLjZZPyEo2IHCa5rUI4lK+G0NUfmuYoNcC9INTxHQQhGY4mxRjjsWErD7cXOL/nBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 20:59:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 20:59:22 +0000
Message-ID: <e72e0719-615a-470c-821e-dc02c81ef77f@intel.com>
Date: Thu, 12 Mar 2026 13:59:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 5/9] selftests/resctrl: Refactor CPU vendor detection
 to use lookup table
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-6-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260304040334.765860-6-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 00060c11-ccbf-4b0d-1440-08de807a3bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: fR/ymZP1mpjX4H/xfwAjGgdUMajZJ/I9VFvUfZky4V05lahPO4rPZvhBmJMgXRV3exl3ertT9gSQpnadRkQJtYqFDv0JjAMei+b3cul+BbBugnXqpZ/VtvluiSU+S4SQrV67Ei+ico1MxJcs6qxL3Y8yzl9Mr59ClxTw2tJKnzWITH90iU9y9Ky/mcCLmqhip+LJQw8bbJkcrMM+jk7/t6I4mqYpkSoE/YgQ05lbZcUyoEhMTe80Wnfn8frJRqTYmQJyoTO7rUTU4DJbMiPDNNU5TlkDmM2mvtvjPscQ33ndAtWtfUeBR83zC920ZAkm3tPF9IlpBwf6KrXheLDTKwvKVo3HHgNIO62QXRhNFuHyftTHHLC2wlQbDnz+Aht1LoaJb9WI+wkSAFV/opv5t8Ds70TVM/piXRu07JT1bH6f9iuwVa4BIICcWqSF5GGePs/54p30S0Mwom7cTw903moBUwA3I0bKnilfc3BnZLn4YT3YnUzZuwVMsLvonOU7oZiww0uhyZ+7z7k9Q7anyo6BAV3XPL0P5CdPKCwo9229EMC+PSM+SqHIljuvwbySOfFGiqq7csE+fr8RaC3NAu/PY0LXNMd2a6HBnXlbv+us/ZlCxg+SNA5jO8nNLJj2JPogVAqUOa5SKv9onnZRmNli5VVjR6tOeJWiNK7C4VGhUQkVt55O50DBPwEb/Ih8F2oOjcayuY+///9Gbyv4y+YDVnRqVzeHeuKa3vJkSMb7Gn3HTa2jo0Dx6ktpxBWyoCI1vUS5NKpjVhdJ5JDCcxI7lIF96C+YjolK+4Jppbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWhpQXROYW9FdUZwc3FzU2xqdUJvdTZhb3RpOG9QZkl3RXZLVHBCaU5EU0Ey?=
 =?utf-8?B?VUpwdEg1bGlsQ0FjL2hweGtqZkFFU2VZc1BnZjVjRXpCVFR2YkJhVHZlQkdw?=
 =?utf-8?B?Wk0xNlFYZjlWaGt0Rjh1ZXhYcjA3TFh2OEJtVzNnTEU2MkJuVnJPZjBXR294?=
 =?utf-8?B?QytCZHRCWWcyWUhVNDdlSFNIZWFyWmhCMVg1RlZKUzRDUlNIcGxKcTJHTDdE?=
 =?utf-8?B?MGNUOWViTHdldGdPTkp6Z3NLbDA5LzFnaFFzcVlETlJNUG45aWx6dlR5YkdX?=
 =?utf-8?B?NzZEWlFCamRaa0lpbzZIUVdMQlVBVmR3QUl3ZWVYdFJNVTlYcWE0MWtQMUZo?=
 =?utf-8?B?T05jM1ZzVWc1NTVhdG92eEZES0dOajRjR3ZGVG92dTMvaVFyRzBlSXE3TDd3?=
 =?utf-8?B?WFJCWGZsdlB3VjZQWUFISFZ0MC9sbHJWYjlHSnBLZ2crTjg0SEJkL2piVXpw?=
 =?utf-8?B?Q2RLLzZjdWRJNGxYUWducHdUN1V3dWxTWkVIZWdtMDFiZS9DTkJ6Sk1LYTRR?=
 =?utf-8?B?cm5KZGF1dmZUbzZuKzIxNXJhMnM5TkJacThRSlZVUEE0VnVRVEYxNStkY0J6?=
 =?utf-8?B?dmdUVFpndStBVjRoa2xnV1FGcTdrdStsTlFGS2llSXgyVUE4eW5wc21wUHIy?=
 =?utf-8?B?bnIzMi85NHI5dWhub0YrZC9MdndDa2NsVGpoOE5YVHV5V2JLK0RhZExMQStK?=
 =?utf-8?B?Z0k5cUhxQUpBT3ZpVEJlYTRSNlFXWHZITXNpaGlwMkpGNSt1Y2QyYU54VnpX?=
 =?utf-8?B?cUJVaHFtSGNOYXlOeldnZEhXamlkdUVmalA0VkZld0gzUzZzUzg2UHJxTmI5?=
 =?utf-8?B?MFo2TllHWUl3NVViZ1NwcTdtRVUyUW52QldXdG9OdEw5V0NTU051RmN0WllI?=
 =?utf-8?B?TlhqYzB1eFFhM1plVDdQSEp5THN5RHhDYUJCYlhDMG5udlZxdVJBQzdrNVpu?=
 =?utf-8?B?WFJYMjk0em5WbWNWS01BM09yVExPVjNZMEJ6Smo5enc4dSttUEtTTHhtMld4?=
 =?utf-8?B?bXVNdlRLNGRvUmN5Vk45NEswQ0hPLzlOa2Nvc0FUdDhTOUdzazV0Ump1djE2?=
 =?utf-8?B?K1hoMWt6WVYvTFNIOEFIUDJvM2M3ZThpSUM2bklLUTQrc0U5ZXY0dlluZGJh?=
 =?utf-8?B?aFNZd3NaaGQyaCttaFhSVkRvWkZTdEJ5citMQ1M5RWIxdnRjSzByTHA5YnhT?=
 =?utf-8?B?ekJYTEJsZFdVL0JMUnRWWjlSZk03MFVKaVlvaUJ1VnZlNWZRdVoxTy9BSTlq?=
 =?utf-8?B?MXV1Z2h4WXBnTS9GUjcvNkNCVHZyRXZKd2xYaitsNWhhZXI5SHM5dSthMElp?=
 =?utf-8?B?UHRtU3RUZ0pxelIxR1hOWDV2TE92eWlwMWZuTkZsa3VVcFNSTm92c0xCYjNj?=
 =?utf-8?B?ZFVqcSs0NW9GSllJMVk0djE0aDFWN2VIUWRTejl2RU9zUVMzU3F1QnNGS1Ux?=
 =?utf-8?B?dWZOYWF5QUNBcU5iRERDNk1VRkhIakNJb1d2ZHZydmhKMUhDOUdROEhkQ1ZI?=
 =?utf-8?B?dEViWEdQQ1FhTzRtU0xvaFZmWTRtOFhzQU5JdmpMeWVBR2JJT3ZaOHZZMjFr?=
 =?utf-8?B?RFNkZHVNRWc4cUl4VnZ6OERNdC9yZ3JRSk1lT2VUaGIySFJrNFhTKzJUOEdw?=
 =?utf-8?B?VFBKRm0xKzF0SWl2U1lUUXNDU2NZUEVYdlZrSDZ6b3I4NmtFQ0tncGROUEdP?=
 =?utf-8?B?dVRFZjRYbjlRTzlQMFpvUllkQTFhdm55RlVaM3NrWW5HSWR0QVkyL3BWcUFm?=
 =?utf-8?B?V2E4clpQb1RrNUdtTjBTaHpxR3JPVGUvcW9CWHZYSW1oN0lKeGFoQTlGemti?=
 =?utf-8?B?SzdrMllUc1A1NFJjUjB0djZESnBTeWpmbThZdGlnM1haOFhkZUVZTWdhRUU4?=
 =?utf-8?B?OGFxTlAzVE05TWxCdG15M0lHcklWWmZuVnBIYkwrWjNnTWYrcGpMcUozdllV?=
 =?utf-8?B?VWRoZWxlREUySUJTa0lpTU1HcDBTV0l4UkV3SDR6SFRBanpZNEdOdm5vdWVp?=
 =?utf-8?B?bVdQeGYzZm1hLzZIeCtQbzN5V21ybGtXaGViQWlyRlJyNFJabmpUZ2RGT0hW?=
 =?utf-8?B?eDVQS2RvcDVESEF2MlVCVEJvcStpRE41aHZRY3BIalgrblNTbmxiZGRLOXdk?=
 =?utf-8?B?OC9UalZ6WGsvMWZKa3FWQUZKQVNiU2g5QmdrNFRLMlNkeDdoRVY1bXUvU1BG?=
 =?utf-8?B?SVNaSnBENDJYSnBXbnV4UjhnMEQxUkd6U0FRNHltQ1NpSjZrOVJGV1FWNkxL?=
 =?utf-8?B?WGI3dXRLc3BLSXlQV1dBdDlTbjFNMG1hODM2RWdnTHpWdE1WOUxVaTU4cUZq?=
 =?utf-8?B?YTJjQytsdzlVNVhXak5SRStNcy9PWUxZRXBSelhGdEE1dlV3L2UrRVV6OUgw?=
 =?utf-8?Q?hf9zlwQwAtIRpWwQ=3D?=
X-Exchange-RoutingPolicyChecked: gQHGor4G3gGntCv5bfE9o6NeDRFm820Kx5jUSQM3gMVKOBblgeStO7+q6lY2gJUhPhLLNAWPsaI5j+WjqJvAm0mXA1mBjL7zoKBMD6arN+aCRGKsCP+NG03qQHL9OweAPBr87gAGvHwxkaRYyEDTTWs5Tl3IO1aujBh56Jhzv0ue8tlOWPEeGKjwTzTbnDZqGaCso1yhDJbvsR2RXd0vcJr0eCLOMoId8ufgvvlWDkH0x7bVuhObCMy/SY+T3d0aRoWWEkZiYw9QeDVCrOb0Ods8u6Ye9wWzam4WIrFyE4X6vkbe0EhIfTaLzBZKB85Q4hpDmYQLMkUeD0BXVFptZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00060c11-ccbf-4b0d-1440-08de807a3bf7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:59:21.4644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umC24mPRd5GvsiXOyvW3n8YyFEtkqrGvDcyVyyUosb+5GQWnbr4sW0h/ZbJG5H9No1rY8CGNf1lGQXBgcBOddSRcRSOfQ9d0Q9EFkNDPQ8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_135927_288727_5CFCCDC0 
X-CRM114-Status: GOOD (  13.43  )
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

On 3/3/26 8:03 PM, Yifan Wu wrote:
...
> ---
>  .../testing/selftests/resctrl/resctrl_tests.c | 82 ++++++++++++++-----
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..419d876a97c2 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -23,39 +23,77 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&l2_noncont_cat_test,
>  };
>  
> +#define VENDOR_ENTRY struct {\
> +	unsigned int vendor_id; \
> +	void *arg; \
> +	}
> +
> +#define SEQ_ENTRY struct {\
> +	char *format; \
> +	VENDOR_ENTRY *vendor; \
> +	}
> +
> +#define DETECTION_ENTRY struct {\
> +	char *pathname; \
> +	SEQ_ENTRY *seq; \
> +	}
> +
> +static DETECTION_ENTRY vendor_detection[] = {
> +	{
> +		.pathname = "/proc/cpuinfo",
> +		.seq = (SEQ_ENTRY[]) {
> +			{
> +				.format = "vendor_id\t: %s\n",
> +				.vendor = (VENDOR_ENTRY[]) {
> +					{ .vendor_id = ARCH_INTEL,	.arg = "GenuineIntel" },
> +					{ .vendor_id = ARCH_AMD,	.arg = "AuthenticAMD" },
> +					{ .vendor_id = ARCH_HYGON,	.arg = "HygonGenuine" },
> +					{ .vendor_id = 0,	.arg = NULL }
> +				}
> +			}
> +		}
> +	},
> +	{ .pathname = NULL, .seq = NULL}
> +};

This is very complex why not just https://lore.kernel.org/lkml/20260123044034.141247-2-tan.shaopeng@fujitsu.com/ ?

Reinette


