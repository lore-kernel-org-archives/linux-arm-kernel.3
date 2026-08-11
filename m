Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A49C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thhO0r5B7vgvi+rxGJIJM50XkS7MOMhpyE01+qrbUKo=; b=h/pQfdgbaZ8frel6ljyL76WPSw
	9a/UvzWmegSQ0THeUUCFryZLXP8zRM6xRsQYQux5+j4BN7fMy7K2lKpo1gtn5oNsm/qCkc22GSpfv
	a3hvFQRriV8uxGP+Sr/TG22UbU9XgAn0gpnpW86UpiMfLVCY94zsC/m/Wxsv0i3LkdncY1BRSBxmi
	lLZlg0rWN1OYyeqcfiUg4jo5Kvz99JohE23gxhZKzgVF5FOW2d1M8fmIO5WeNy47bJ7vMlexozOoA
	2p1Td9RF+B0W4IoxwVqp9Ojo3QkSK6nwRwIiBWny0I/Jkk3mqTFcGULtVkAPVYm4Hvkg+ue4NPCPF
	vqS145VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtopA-0000000EPWl-2ytw;
	Tue, 11 Aug 2026 15:55:32 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtop8-0000000EPVt-3Dgu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786463730; x=1817999730;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qs8gqgb5GL0NZi/a40sAfUl9BP+23Wg3VSPgpiARj5o=;
  b=Y77nxmJR3qFDcEp5+yzWrSL11SdvYtkpATx69xlqC0XyaAL8Tgb9JxOc
   bh2Qs8Cw5rlFloRXAp68J+qxkxmQ/YuFk9WoRi9JZq2iJBh/WZUJd+xQL
   ghdi0wbRzdSmMGlOWHrSDvMADzHrOgZzTDmx35PrfPZetpgHhwINcWwTX
   ODvN2hrxuQJFpui3VQG0yEE1Myoxf89R0zjk7q0H4C5HT6zT7/Fd5QnPF
   qXJ1yrqlhTXNdha+J/57RHrnsWY3Lk/NuLWUilJIdebnbouM5u19h+GBS
   XxjpoXUyflIpe2TtaeNXgnM7lhdUiPTe0ZWhuo/UJIJqz1TMlURJ19Akg
   Q==;
X-CSE-ConnectionGUID: r7BmUIbaQcehlbI+l8xREw==
X-CSE-MsgGUID: CflrRjhtQYSeTdV/8JCzZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98513830"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="98513830"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:55:28 -0700
X-CSE-ConnectionGUID: MCyAbbUMSlm1Uh2f+dHCXQ==
X-CSE-MsgGUID: xQDgc2DwR+q3wHNd/f4FJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="261619966"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:55:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 08:55:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 08:55:27 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 08:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGkzvRzX951up52/qj+Bap9plmNZYD1h2zw8jUiu1BjsNqwDZ8K2qrXHYCpPrcT43stOvRsZ9bv4n/kCjhDDrEsaKrYxEQPpydEiw757F6rEhLD69u+aUDdNqrpBj1CzeDgRtBnKBKL0NeGG6dk9vf1oYRxkFk1XmyRbnaHHJjz7WRP9YInjMMWPbLbgFMAJIONZMiIAHfGIYDF9+XqdKTc+Lw5sIzlBBvSrFTeZ40yjJF2waNIxUK61uBP/kM0Kg8TRCHq/+f4SyehXPF0i8Sq74nNXI5XsaSrCTxDzUiDjJBs5U4Zp6Ot7BNM0lI/Ce1HilKXuDKn63ww8GNc9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thhO0r5B7vgvi+rxGJIJM50XkS7MOMhpyE01+qrbUKo=;
 b=GHRnCFKGaiSK4qjVZG2ArkLjwjQ4C8XxJwdakIdyjOwIf1lA/gv0Vsti2k4iwIJiW4hSFdOR9KqROnGhsmuWniQOIt2G6fVb4i0gTmQzkatIN/O7ZpqenYAAl0BXbrim9I1tt9Q8pOAnmv/7Q1kg3NSO3I+RbzB5Qnbo322un9rmZWgWwgBh88sYiPfvd2jLIG99GQnklISsa2d2c/sMAsKFOebAlDC4IYXLkNkE84YsXRcJwukobfS+oRxix8HA97U1wrdsJrIgiHvHmIqKuLkq998Ivd6pXDvsNeD9VkmeTNBZ4YNryinsHO9u+IGLrLu7WudQMucZfexp6neCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:55:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 15:55:19 +0000
Message-ID: <5a4d7be5-fb99-4a26-8908-cbfc9452468d@intel.com>
Date: Tue, 11 Aug 2026 08:55:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jic23@kernel.org>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <xhao@linux.alibaba.com>, <zengheng4@huawei.com>,
	<x86@kernel.org>, <leitao@kernel.org>, <kas@kernel.org>,
	<puranjay@kernel.org>, <usama.arif@linux.dev>, <kernel-team@meta.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <20260707162440.12132-6-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260707162440.12132-6-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b35996-6b95-4925-50c6-08def7c0f19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 78XLEKvvQv+zyJ8NlUG7iBhzOAFHLTkr0yVLqj8NCylB3WCk5UrK+3mqotd01iYaUtax3Rv1m8rUy9UzbGIqSWavqWVxkU/NDmq+FbalOK69em8FpDwcLMN8G77KLjYxbPIPTKGgZl7cbnN2jmAo3bK1cjlodHG4GnQrV2HvOV+er5zFk5XedcEwZ1JUvfyiTWKT8MjndOLfuuF6UbzK3WSWP93u7viVvSWBAhVklFx2fX1A0l3U6X1l8AHDOjpkLo0Y73522M2n/M+rtoR8+1JQLCAlnmwi/eW2aReM+FyWqN8yDQccowYkPzSUe8icZ+kYCicb/+yxmeFe70Ujx8RMtGwyUH3e38G6xFK19vIUqmrc5b6Ak6BpKI4pCyAB2sqy1IDrc4/tC22SFqK5u88DLi+ZHVbKkAMwsz/1gjqlN7qmwwhkutlbWoXnEsQ7bvFiqX/+9rjVdkw9QU3jd53Hjsn6V5/3qcjFd3xyPC2kzsN87tu17ayVEhYBTVhJzui9VIXXU8q1re+AaClOqL797mEqFX2cK9zuXC+9fzABDXm0jeWVHeyDi9oC9OLx/1tSSdPnxyGSkzUlKW3KSP6VW34YxtarEIMZn4NQs8MxUdtiuxy2Xd+L6MzhpVsqsBQT8E44xUTJ/eUF4593VcS8DDhrEi+f7JBI83K7wlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHFwdUlYd2JySFhlSjJhTzZrL0xIV0lnY2FmSHBHNk50RUM3QTNzVC9GbGl0?=
 =?utf-8?B?TGJpQWVNd2VyTWJxcHFUL1V2eUkxMGlNN0R1Q2d3UTZtdjRLU01lc3hyZTM1?=
 =?utf-8?B?Rm9jRnFzVmVZclIrUjRpVTdsZk5vMHhrZ3o3UlNlenhiUUgxa1dIOHZoZHFV?=
 =?utf-8?B?bVJjK29HSHpINjU2NlFUV2EvN2F4aFIzVzluTjd3UENXVURLa1FmOE1TNWFP?=
 =?utf-8?B?d1hkWUxRbVZtMzNOOXE5S05Rd0RMQnBNaHVWMHEyczN2U0ZPT01oNUxveEMy?=
 =?utf-8?B?cmEyTDhuNFhNbVdTS1V1L3NoNHA1TmZreTZzZG4rWWo0SDRlSnNOTzdtcnFL?=
 =?utf-8?B?UEZ3KzdrU0dHWWUwa2VybDcrK2hxMVRZQnpNU2JxSVp6YmVpckhNSGp5dmdi?=
 =?utf-8?B?RFVLSXVTK1RrNXpJQUJyd2s2VHhlbE0wZktqdng3Y0piZmsrWFhQa3czSnds?=
 =?utf-8?B?RG5nRFI4SEVqOXhtdTdibHNEaFFYSlJxclFRQXFMZklQWFV2TDNCTWVaMFRy?=
 =?utf-8?B?U2d4b29relhCbk5GQytjVFdFeDVBazV0R0l2UVUwc0tSVjlYOHlQT1dBNDVy?=
 =?utf-8?B?OVpieWl4S0VsckxlYmVEYUcrRCtUYXNTZldUVStvSlBvMXFRdlBGMmdPQllk?=
 =?utf-8?B?SFVRYU82MFRhTzV0MzhINGdsT1VZSTY2WHFSbXRBa1dzM1hhQ0UyVTVNb05L?=
 =?utf-8?B?SS9CNXdpZmczYUl4U2labHF3blFjMW8rQXRxdjJoa1p0ckdvK0FsR2ljOVcr?=
 =?utf-8?B?YXdoNlFibU8xbW01OXE5bGVTZFhQVCs1bjZINVA5SHlDVlJCZXN2TVc3UDU3?=
 =?utf-8?B?ZDI0bVFxMUttbmlJVmpJLzNOQTZhclhWTXkzSWVFNjZxZFI3R0VUTDY0ZENo?=
 =?utf-8?B?WlVqRjVSSkRMR25rSGx1eHYweXp0c09LUlV2VzNXUjZtSG1IdVppYnFNcENK?=
 =?utf-8?B?Y0RFaVNLa3F0dXdrd0VmMXJUb0svaGJ0REREQ2o4TGs0dVFxdVR4Ky9FSUow?=
 =?utf-8?B?OUhNTmZ5V3NDOGlDNUdQbTZLaWMyQlM2Z0M5M2pMeWxBdFpoMkRoSUxOZ016?=
 =?utf-8?B?dW5TYmVqdjc2VGk0QVJsL3RqelZsMWQwcVUxK05TTnh6K2xVVjUwYzlUb3k3?=
 =?utf-8?B?MG12QmdtWkw2ci94SHl5bFNTSlNOUmJVMkczaDBpcTgwTGowUURCNFRZRlFM?=
 =?utf-8?B?UXl4SllwdHZvWTVUQ0dXbkpvNDM2ekpaZWdBQlZja3lETXhoSlJ5VmQzeGZR?=
 =?utf-8?B?L1lHMko4SU0vL3c2Y3lURkdyRkx3UU91d1Zrak1vZ2ZuaU1BZkJQc1ozUENE?=
 =?utf-8?B?Mlg3bEp0NHlGNEovSmNRMXh5dUJxSmQwYXhZVjlwdjlFRk8wOFJ1NUpMQzBO?=
 =?utf-8?B?WkJBVWtVSlNBeEIwMEl5bjlYQkJYVFdyaEs5MTlPY24rZEJ1K3RqdlhwRnF1?=
 =?utf-8?B?Qi84bXMyQU1tWStjZFlZTmtkZXF6bURUNWFMVE1zWjlza3pGcWZ2WlFVU1Bs?=
 =?utf-8?B?cXBhckhBcWpuZUJXT0R5L3NheHZubE13eWFQM2hwRXJoc2NGeWRsWUZNTElS?=
 =?utf-8?B?YUJSQ0tqcHBwajVER0Qwci9TNFYvdTBCZy9qb05sNkdwbU5CWjN0d2psN0kz?=
 =?utf-8?B?aHhaRkhCemI2KzZyTElvdnhxU3lsMjQ2aTRsQ2tuOXpLTkhjemlTWG5UV2t3?=
 =?utf-8?B?VG9xNE1hMytlVDNvRTR2VWF2LzJxNWd4QWpFTTl6SjhFYzNYUi8xdGo2dHBv?=
 =?utf-8?B?dDV2QmlHODFvVmdDNWxyYVE3Sks4WFcyTjRsc2dON0ZoT3A5V1JhTHdwV3pa?=
 =?utf-8?B?ODcwakFRNTJTaU1ISjdsQm5DakJPT2hVR3JHUm0rRUJoMFk2RFo5dk1FVk1C?=
 =?utf-8?B?VEVCTWtzMEpZNUxOSHd2OVE3MFdoS08xVFN4bXVFdCtSd3J5TWJPRjJhQ0RX?=
 =?utf-8?B?YnhvMmdxMGp3VDFwdmdEMktiRFRVdWFWSEZDd2JCU2JqdmZOcFdINStSU2pG?=
 =?utf-8?B?aUY3YmpER2JoMFE1UzlJbHJQUEY2VWRoVVVWZDFDT2daVVZQZVJjMzdweUkx?=
 =?utf-8?B?cmUrWVE2ZzJnWG9MMnJOeXJyVW13ZWNDRHFzakY4b244bWlka2Y5UHJ0Uyt1?=
 =?utf-8?B?VXJCdFFKYjRlSzdCMzJmRU9nNlpxazNhRXpHWElFOU9vcHNCU0lqZGdlck1S?=
 =?utf-8?B?OCtTWDFsS29QSUhoNjRGT3h5TzlrakllMzF4OG9wQmhWamRQNXovRTNLOGFH?=
 =?utf-8?B?T2IweUsvVGZNbEJlUHdJcXJ1ekNXaGdnVlpHa2F6Q3RTMStmOTFxb1dETzBR?=
 =?utf-8?B?cDBVUTV3OU5RcFVLNEZRZzQza09BRTU5bXRvOEFwTytKQmtVU0ZMdDduSm5G?=
 =?utf-8?Q?dQRppwjy9oHPwJuQ=3D?=
X-Exchange-RoutingPolicyChecked: j4xtU6YqBvXDsZNdW5vR5+lUqrAscD+WnCrPVjzBOoTXPcNVGGspG1rdmVSNN2AQzBvGMMYktAI8K0eA0DYzWoadSKwaDvj7AQyyhZ6dgwKvqhbIinyvnqhuRGFb65Vt4CI2fH2GDKpZ/aKV+XsUic9pSFR1XIOA3rrmhAKyOuJ5TbqJfh6zu3kgDJL0+aT0IG8bCd8DbeUcUOPnEIlggB/qKk+KLFKCtcpPiuxE7pcOEbjhSWLBw93FOfk4+WEbCapebyPCcVH7mjpp83ZcA0EtTckGy75BukPvHdbnGrB0M2BGsCCY1mMiCbZtFdv7DJEi4Kga/F+WbLrxTHYuIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b35996-6b95-4925-50c6-08def7c0f19c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:55:19.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPcsXSiEdR8x0REk/B/D+0XOQyAwDlkah6vNw5+HeApzBBzzKO+qMoJ2x2OI6xblaQBNxmISXZ+aPs6lMawHKise6PDThV0UxtMb/qrEEU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_085530_875382_2ADD6289 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi Ben,

On 7/7/26 9:24 AM, Ben Horgan wrote:
> Memory bandwidth monitoring make uses of MBWU monitors and is now exposed
> to the user via resctrl. Add some documentation so the user knows what to
> expect.
> 
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---

Parts about resctrl look good to me.

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

