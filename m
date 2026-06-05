Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F9ECD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SsnO8deBzzzKBBQnbnVZPA54Px1z1sNOVM8LkK8s74=; b=LHGjmnR6KVTyI84OOVthOlTPnv
	oVkb6aPiCYWEA96JSO37ZETT4PJIFsNj+6bSBj06BlFeYNlJdj5jEVX5SAPdLUe3kdDhbp0eBYqIK
	Y0nY3NXIMoQxVJ00PblKRnPkRXieWPqxyXqWDRWF4rRph/FelkLrntR4dk2w5YylSlRKLwBzb2rTt
	OLyvRtJRtOsjxHJzobDsu13tHFdrY+ay45RzlogKzxAyS5dYbDIWFur0ILtoklqaCRuvRq6C3Pof1
	vK8wTAx0lj5SJwhJNOncWlsXU3qsuc+UWihJEMghLkv75j42vmFQJVat+nwgB3JzehL0c+FjNE489
	m/8uMQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZVA-00000001414-3XiN;
	Fri, 05 Jun 2026 18:42:40 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZV8-0000000140Q-1FPl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780684958; x=1812220958;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QM9Z9RfUkXVg/cVuplZGvitzrM+1KGAIC8Yrym8d6HM=;
  b=B3gPFQjc0CEKY47BtDTkeyAY/jHHycBScPtIK7UcFVCRQnXaTnoD9LGP
   9Z/w9RWck4eVuWoIQBJr1IXDsb2Bj8sFrhJZqI9I8GhOH88QBVKBtUOyY
   CbLPBb86hZnlsQupTLj2L0OxQskTrxP0lrq0OJt/lriQVFjMyaUl/L18u
   HZXau+IMOXnN+oIdrvC+Kkp9l0NTxTbvjdTT/gPmKoxP56aLNEgsLDnSQ
   fJ3RG+L0+prZ4mVECWXmVmU6wfAM8Vp8seelpT/BcPboItWmdO+4+NJcT
   5xxYD1W1ik6ItwAUdwcMtzhQpnO+8/fHnX9G5YYkp1lzj8dtV61s6bgka
   g==;
X-CSE-ConnectionGUID: pEmUqNeQSt6Rf9tF4w7LiQ==
X-CSE-MsgGUID: P/rcnXMeSr+OdSFCkP24Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85145663"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="85145663"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:42:38 -0700
X-CSE-ConnectionGUID: TCkQtn6vRFuS/mg4l/h8Ow==
X-CSE-MsgGUID: qfxVTpxqTs6mv6pHZn+zzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="243814956"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:42:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:42:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 11:42:36 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B30mmLJ1gguKC19Mx5kAji7OAEmZM4mrTHYWnpKXA5Kp3Izah4dOQVBGjDO/XzS3i12yYEj+9YARSJMjd5Tto0VdPLHsXCz8ZK2YoZ5VZbi+v0tIy4BIxCfETIofsBHqzr8mu+/NqryAtoSeQnZ9f9cG2ONN5GOSY7vBcKeoxq83HenHX3ymuych07wHWpMesHysv1SfKcR+sTw4wDsTaUO7L6DFr8ciYiW+ZNeLFrwrbtfWrCCPQc28/pDw9iNGDthrogIznOSWMHJcI6enrsKyQqYgupq5DoVsv4cBFvyeX207mQWVh0WkUZtMYcTm/cuDwrwTyeBPkpA02w67Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SsnO8deBzzzKBBQnbnVZPA54Px1z1sNOVM8LkK8s74=;
 b=XUAuY4ULf8avnMcqyCUWkMLDP2c8WcOtq9d6bc+dcze0C8/t6RuJ6jRaeJFQz2HbilloLlAkgXmQHnSQMGe4JxEVy/aam3dEXXWWU/w/0hP000jPHabZV1e53add3lPGMDa+2cVor90Dx7x6oZ4N3C1DwxSRM8DPPc3KGEMgwdxUDtHTit5UVoFNHjgpOryZ9sOL/o3I5KKVn0Or9oXTrfyVbSjPv/y3KzOWLs+4raX4CjmDwx8zaV5qvB3OjFeNiKaIBG96OrUbPZnak0KLPMzbPfURy+nbojPrWH9Q+gbJTmfduJL4ZvCyQ+r+zvQSL1uv+HOLRKRFlhQQOQgbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB9300.namprd11.prod.outlook.com (2603:10b6:208:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 18:42:32 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 18:42:31 +0000
Message-ID: <d40c6732-de2a-40b7-af28-6853fe4d3045@intel.com>
Date: Fri, 5 Jun 2026 11:42:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86/resctrl: Add resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260515140612.1205251-1-ben.horgan@arm.com>
 <20260515140612.1205251-2-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260515140612.1205251-2-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb4fb1b-3837-4c9d-6607-08dec33233bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|18002099003|4143699003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: IjqaLy1/4I7LZ2HRJ6Y2AjjJIMUxLEsZ//PWQ4EhjFXlzf/Y6vCcEal+jsmt2lWLFuimP5PAbhtyr5FkTYsNVtqpBlQpVHb6XMS+Ic6bSUa70H6eM81iLSmD+K1BoofETZ1NDM/Qc4GQOZnJZQOYrbMBmlQLxVfTQmdypGUi/lthDmphmx5xdKzvc/hQt+k9wiOaRoRx6AV2i4EKCnHkMQprPvO5KyZL3zkh2grJ4aLnKWnt/FQu2qxYbgo267fMQ6urEEizByHspCVVYZxcPkBQGYN6BYwqtvSBI8mr1JGkmejD7LMKzE63kJy+Es2fVcQ2Bp9wmtuvCnIMVPpU+yZfTc04bel4u6pWNPJ4KCm2KRt2YnR3T38UOjqZTNGN3f010sG8wqtzvP66A9PCzgr97PkaYDv6RmtCBq4bCoxkE8zRHVDQVXPBDAbwvgB1j9/VNHjoLMiF/Ifd8ma4DpGKfPfJISBrvePyoB6P9YBcHDDtgv9YOz72WYnH56XYWOty5eBwaCFrcCp58dy6jkQSAjAjtMLzw28/h2Ammmges6kxXodLSMvr2095AyOV9OCz3g3uYEgN0DHWzB2Nd1IgxeASSjRG0+LSbk+4tO9MCmUh1w+8GGcqOYCeKRiM9JeFZLqCSk3k7aupQZvv7/R3TbRD2g4F+vRxR4RSr9X70/N0GXY+AoIsy1P13Cwn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0FTYzFRRmtmaExpNUNiek51TTBxSk40RG53dFlVMVhNN3pzeTJueUdoQ0pL?=
 =?utf-8?B?QjZZdnZpWlphZytrVVYzS0lMUzNSQ1Y4VmZRa1ZMS3JNTUYrVXByOFFwbmlC?=
 =?utf-8?B?VmlVNW1Kc3diSUhPTmtLSzdsK3dDSGFkNGhDZnZiTTAwR2QwUHNWZlUrck5i?=
 =?utf-8?B?Z1hLdkU4elFZVmtwRyt2NFlKTnhjUjRUR0E0UTRTNk4rdlNPbmpQNDNEOU1S?=
 =?utf-8?B?M1lXWGxtbVZZM0U3WmFJU0Zsd2lHVXVFbEp6R09BTjk0RmpVcndxeGNGYVd5?=
 =?utf-8?B?N2F0NEYwVmtNdUJOTklvYmFBL2NZMUwxbjhETFBadC9PaWRVTHd3WlkrVy9s?=
 =?utf-8?B?K3U0RThheHRBbjE2b1BkbFRBeWdqM3poOVlTQmdEOTNHcFYvekFkNDJaYzhO?=
 =?utf-8?B?TDQ1NHFEN0RIRHU5UklvRlZUT3dpYUVUSXZnRlNpalFaZFRMNmdqakVKYnRv?=
 =?utf-8?B?eUIvdzhseTdQUTJRYjBldnFXeWEyeWZncFFMZzZ0ZVgyRzlCRUhYRUdKZmZ2?=
 =?utf-8?B?UjI4QUh2aFFzWDluNWxoaUJmbE1jWnhtRUhnUHdCUmZJU2VsMW5EL1VUMU9G?=
 =?utf-8?B?alNYRWpRbVlEcFB3eFBGTVFQTWJNVUwyYmxYUXA2N0NCVEVxVlFPWTdhcjFn?=
 =?utf-8?B?YmJrQjZ4Z0lJUjc3WDNxYlBMNXp2a0RTbE5jd0FDQXFCcDU3MW12SDc4dHhU?=
 =?utf-8?B?V2pSME5nWkQzVDRNWTRSdDNVUzZuaWtKSTVkSEhFa1RNaWpreHFrckFoK2Zx?=
 =?utf-8?B?Nk13cVRadEYvYXNmWUgwNzFTMGVBRUk1ZDZCRjFGbGZ0aWd1WEhqeGRTWjZq?=
 =?utf-8?B?elk0M0VEMzdPNGlZZXFMNnk0RzdzczRUeXhsb1lIVlVZQTB3aGtXd3hzMFZK?=
 =?utf-8?B?UHY0R0FtMHVQOW1saEtHMG1IVncyMGxZUlJLWWJKOGU3NlhnT3RvYXFFankv?=
 =?utf-8?B?aTRrcW9LekpscEZZdC9ta3dJZ0xJQ21VNXlFUUgwcWpQNXkzRlJuLzI4THN0?=
 =?utf-8?B?aDlldjRBejE4YVhhMnFPdzBza3Rubmt2ODJ5TnNVQjFvYVZhdk1BbDZueFhy?=
 =?utf-8?B?ZmxmSGFjcVJIbVQxayszcVFCVlR2NitQQ3hUNnVjQUw3NHZKMldhdUlMUHJJ?=
 =?utf-8?B?aUw2UEQ0RmRCU3BUSEx0Y2ppSmpYOEhkSTVwaURadmk4ZjIrOGJIbDcxcnkr?=
 =?utf-8?B?VEdTK3lUQlN2MXNxK2o4dmZuRVVVWWRaendHcmFrL2JCZGxZak9QRkpMam41?=
 =?utf-8?B?YkNqb2MzcFVrdkt3bFRUZEtSV1RqUnh6NXJpUTZteVowYkdsMjdiRXUraDJx?=
 =?utf-8?B?WXFhN2g1c1d1c1NYdG9rVTJOc252UmNvN3kyUk9JRkdqOCs1THFUOVZUclJC?=
 =?utf-8?B?UGwxOEFWdTBkL3RFanExbC85RUJIR1NlaWZpRzRRSWRVdExyNUk2L0xVcWlK?=
 =?utf-8?B?bnRuamlnbjRSZGJ2c2FkWk9USmxNWjJlaEt5K1BxTGRPdTJpTHRyNnlzU0Na?=
 =?utf-8?B?b01SL0tYYlZyUWRHWlYwclNOR1pJU2pmYXFndkYyK29tR3ROVzdEL0VDRmlO?=
 =?utf-8?B?WUIrSzVWczlNWEtVMmE4bXEyTlVBcWtybzhCTmUvclZRTkVEVE9rNDZNYURh?=
 =?utf-8?B?c1NLSTlUN1Z0L0pnemg5UDZEaUw4cTNqa2VCYWR2cGZPQnY5ZWxDQmd1dDA2?=
 =?utf-8?B?dkNoMldmU0tXWjZaT1BZRHZFUnpSbFcrUVNuSmd5T0dpRnUvV2h5bVdVWEpq?=
 =?utf-8?B?Zk5wSVZadWpCaSswTVNBaUkzR0doeGc2TEpGMnlBY3MwSjNVUkh2c3ZJWC93?=
 =?utf-8?B?aWw5ZDB6azg0SFQ1WmptR3F4SU5taVFZekFUY1NrVzViQXlTeGNRTEtlSjlx?=
 =?utf-8?B?aG1pVFk3cUJsNVJNSXptOWhkRzJNRnM1WUhpcU0xVTBmRDYrb0tSbWptN2gy?=
 =?utf-8?B?eG1VZXdSUXhNU2EzYy9tblBBb2JvUTBCQm4xUVhrTmRiSXY5UnFYQkIrNTAz?=
 =?utf-8?B?NERvV1N2eEY4N21OQkh2ZEJsREQ4UW5Wdk9wRTltSkdkQXpZN2ZBWThjVWc2?=
 =?utf-8?B?T20vUXlvQUR6YWxjbTVvRUZ5dUNpbHNPWlVSMU9kSVJVUU5hTVkwK3Q0WTRm?=
 =?utf-8?B?MjJ3OC9QSWE5TXZUUjd4UEl5Q08waWxqNTJ3V05rQURkdzU4Rzdob0dINkRy?=
 =?utf-8?B?Z0QvT2x5RTFJRHdFblNJVkZ0MDAvblp5a1IxbXkrTFdhZCtTNFZSTFJjR0ZH?=
 =?utf-8?B?L2FLWnVYUXlVVE1kTDhiTmdoZkI2NURyRklVOGR5NEhBS2ZRZXNMZk5uMXc5?=
 =?utf-8?B?VTJKU1diMzk2cHRDejVRblBLUXczbVdPMi9VUVBjWmRPNmhEaVpQSzdpaHM5?=
 =?utf-8?Q?0aFSIQNoOOf/kmEw=3D?=
X-Exchange-RoutingPolicyChecked: S1di9Kj8Mc4qKsHN2odmd7TQLToyHu1A5qDIsVMixPah+Nct37PdQv6lnpIMgU4QZKCGQH6XjYFXvoojo2NSy3GSlQwnJfQHc4kX8ggN7OPAe4r+72xDR/HaFIPI+ZF1BrDKFzfz/PHFD6JLl2scimL7Qg4Pqkb/oazu3E5F3wtS+9f3KXbGVD94ZUj579mtkplJUuYK9dcsEfqKWdsaFpmCx6m4iDYYxwwE3MTZI/rPRhHF9vzCrWQZBapPMhFFFK+bhXnEbdUg+YZJ3Pie5pApG8CFFwVMNl4OvB+mTqmv5jb9wDpAWpsnurBtlG/Z4D9lSbHYydthU/pOoU7f7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb4fb1b-3837-4c9d-6607-08dec33233bf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:42:31.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JYa/n+HQROC/iPB1DNILwwXBk8n54lPipQZjU9HAS3tEb4S+Fxk7AlXYgOvRZhx4hys9W7IqoKJZqk468As0mpuGJyVMD+TK1iAgNxPGSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9300
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_114238_449772_13C7B049 
X-CRM114-Status: GOOD (  14.34  )
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

Since this patch also impacts resctrl fs API in include/linux/resctrl.h the
subject prefix would more accurate as "x86,fs/resctrl: Add ..."

On 5/15/26 7:06 AM, Ben Horgan wrote:

...

> @@ -500,6 +500,25 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>   */
>  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>  
> +/**
> + * resctrl_arch_preconvert_bw() - Prepare bandwidth control value for arch use.
> + * @val:	Bandwidth control value written to the schemata file by userspace.
> + * @r:		Resource whose schema was written.
> + *
> + * Convert the user provided bandwidth control value to an appropriate form for
> + * consumption by the hardware driver for resource @r. Converted value is stored
> + * in rdt_ctrl_domain::staged_config[] for later consumption by
> + * resctrl_arch_update_domains(). Is not called when MBA software controller is
> + * enabled.
> + *
> + * Architectures for which this pre-conversion hook is not useful should supply
> + * an implementation of this function that just returns val unmodified.

nit: "val" -> "@val"

> + *
> + * Return:
> + * The converted value.
> + */
> +u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r);

Could you please switch the resource to be the first parameter? When comparing 
this to other similar arch helpers in include/linux/resctrl.h it is custom for the resource
to be the first parameter.

> +
>  /*
>   * Update the ctrl_val and apply this config right now.
>   * Must be called on one of the domain's CPUs.

| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

