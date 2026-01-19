Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC6CCF2EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6+tC4mLYt5Fy5URqMGCFKMl9Bp4GAiKQX9ivDdlzBI=; b=DOkg7OVJarOZFXB/3bnCJUSVrz
	NqZaVTbvauq33bTm6ptp2aF2oCFcAFFqeMabGfuf9C2alzXwb08FRvmkkggKgxgny7jclSd3Gu84k
	qAyzdxoS2VxE1ScBGrfGqDKHns8IS9uHTmUu4EtNMKlYbIf53XbVRGOwfM5LCrRhY5rSoY2ufqlX4
	KNiZfMrHdTcUNTBlqduh7dQ7JWPTvL3locWyrVpKXlFTzEDkEZWnL5ZlbOZYUXsQXYKdgaDLFIAyX
	He/e44J/yX41BV/+B2MpC8TyA2pjZ14A2IMHc54AsAceA8p5N3FiwDGMXqyZt0rNhS8r3NWQMyRZ3
	cY9L8Vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho77-00000001yNg-2BIX;
	Mon, 19 Jan 2026 12:12:10 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho6z-00000001yM8-0VcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768824721; x=1800360721;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I/VC/rgED89NGfjqSXKxNk2iVF+0haLi9ankNaXZ7eY=;
  b=dIDkHMOtZBGiAfI7NMGJZ8xNG0vmLvblwkhm9z40yBB6MgJLwZUBHEjp
   XcGNHyJwxYUxQ0RZtp8FYamV1HhPgviC3M8yXgoVoATsA4SvGyZVHWgGN
   yr9ks3IRm1Yki5RJC5LQD45LaUDPoLZzb1CDN/cyCTzti549MEGFx/vgx
   f99h6u1lTP3I/6mVDrTQdJl0sOld1KU3Btwr559IqfFXDqSMNTE/2EGC0
   YyJe3ZDQFBLxYtJDkmwsncPtWEBa+O11TIi6ZrajGKWV1tQx05RcNGNJb
   b637QZjeLxN2/R5vVukcMmAuzDe783XxWQyu+g1JpGiHuv9aqoRz4kyJy
   Q==;
X-CSE-ConnectionGUID: J9X5J/LMSwOwDubz7ojXFA==
X-CSE-MsgGUID: HpziIaDfTGqd+ASDy9SYeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72625917"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="72625917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:11:59 -0800
X-CSE-ConnectionGUID: YJ48K05UTTOVMNcCZJZrjg==
X-CSE-MsgGUID: hW36H6KvQ/qKdozJNwS+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205469878"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:11:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 04:11:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 04:11:53 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 04:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRFkj3cQQo4kor1k2QIxu/efFj83EREnq/0fbPGZOTNobXve7AMyqho/ivwRL6vDAT6XV4+yz+pPHNZV6tjg9WVxN4pn5BLhDF1oKH46E883qcH+OhJQ5JF4dgZmaLcl+3sGX53lr7ibQ/0MbirZysPewYfDwJIchdBXb74BwQqvjeIF8T311fJjJrT2X3KGzpIfa9ZZoVLD0ANZFPzAZAwls38AgFDcHHX/Mp/nRuv/fSeM5SeodmleGv7eOp5uMnTb9d5nfnVeY/eF2q+SyQaJs4wcWyGTphDtzBMoJIRSmPMhyjS/KMqFVcE+zGPDYCZWK8cvczAtEN2vB8HLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6+tC4mLYt5Fy5URqMGCFKMl9Bp4GAiKQX9ivDdlzBI=;
 b=BrFamjDMv8RRCGlTRhx+KCa+mrfXP1YwMDPpAvbJdkdiyMDch2G1jd86+c9mAoDjYYAWAfBhEs/a7GX2Tjbt/mIUU6uRHG1vtmVl+w/AMAgx/nrphCnCkJE+NsVbazwWg0UE4ArRHozEoiqpc/rNknutwpOP6gfRiEC9aTRHbKIGRq80syncInlE3Qi8wKt6EhbK5Lyg8tleoogAjXKZbkY7p07k3sBKB1VqDvZ7Q3GbSPvUWbg94UR0b0flp4dXGxAdm0JWrbNHeAHlj6XuGZnP9v8vsaf9ctvmVjY2gDmy1MEjMAwoXEPZtleyCQ6EHneCzFy9UlrlHAeNRwkDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 19 Jan
 2026 12:11:51 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:11:50 +0000
Message-ID: <c50da3af-e6f5-4b40-bd25-1e37fd6bf0d5@intel.com>
Date: Mon, 19 Jan 2026 14:11:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
To: Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, Will Deacon
	<will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Arnaldo Carvalho de
 Melo" <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Ian
 Rogers" <irogers@google.com>, Thomas Falcon <thomas.falcon@intel.com>,
	<coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260119111509.GD1286628@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:10:234::29) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: 8278c714-b0bf-4ce5-6be7-08de5753ecd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2w3K3lxcytPQUgvc0RMdDUxdXVsVy9Jd0FROFJnZEt3UHFrYmlWRjBLbTBH?=
 =?utf-8?B?OXM1b3MxOG9qVjh0ckdiVGl3a2J3ekpJTjhGUDBBUjgxTHdnaTVZalp1VHNq?=
 =?utf-8?B?NERMRExsTG54QXRjc05jdkZVcWdMa2Y2ekt6QUFodXh3OEFuMHg4UC85RGJm?=
 =?utf-8?B?aVRmOFdHNTZVdUpRSE5DZG9NbTA5QVRaSXhkdGxiMjlMNnNMOHpMdzVvbllB?=
 =?utf-8?B?OGFJc1FPZmFpQndFNzNXdE56eUs2K2U4NUdzdTlFQ1VzekduVHk0MUdwKzl4?=
 =?utf-8?B?OWxQMVd6cVlML2lJWllMWkNCV0s4bUdMNzJWazRmMWx3K0F4S2xhd055MnEw?=
 =?utf-8?B?Wm52YkxLTHZVbUthL1piak53ZXVYN0Y0d0NkTE1IdWZjZzFYMWRtQXMzelJi?=
 =?utf-8?B?M2xSbVU4UHg4NFBUa0VvVUdac1B5ZHJpWmJVaFZ4YUJLVFhRaFErWENhVjl4?=
 =?utf-8?B?V3p5VU9pa0l2T2lYcHNtZ2xTeFZSeDNVQll6bDcyUFdsQ29SVzZTbmVaOW50?=
 =?utf-8?B?VVhzdENNMXVtRlhWbnB1UDZlTmJucFB0NUw5QzhlOTREQ0dDdTk1QjdHWTNQ?=
 =?utf-8?B?OHVibGsvdmtLUjdTTXVWbE1UcHVZYzVhMFNRMzZ6TjBBcDkrMmI5K1pCMVA3?=
 =?utf-8?B?UGtEZFgzU1dGWDArM05pdzE0QnFMOXZQZlVGaGhLcHJBTzA1elQrdU05cEFC?=
 =?utf-8?B?Z2JFeWZDdjJWa3BOMzJLU1JwYkRVVWk5Q1hRMHh3RVBXeDZhcGRQdkNJUElK?=
 =?utf-8?B?bTNiUDY5SGR6ZzJJUjEzUllrZzJtaHhYRWlVeGh0TTAwVXlHRmZuSUl1Zld6?=
 =?utf-8?B?UDlaT0hyNDI0MjFsdzc5S2k0N1RjMzRvcXhDMnJERWt3ZTl2aDBoOXJUV0Rz?=
 =?utf-8?B?QTlXeWJEWmdkdDI5YWgyTkFkMVlxMVhoYkFFUHg1SzlVVFZzeEEzTUpZYnpt?=
 =?utf-8?B?Q0R6Witvc0c4bE5peHRzUHZ3WnVFaTdqNjFGT1p4RVkveVphZDlZdWNJVGVO?=
 =?utf-8?B?QUhqanlGMTVSaGlneCtNL0laWnNndW1iT1JER2tQK0RmKzFVWHFZRU54Qlhm?=
 =?utf-8?B?REkrbDkrdnZVYkNJMjB1WllPb09WT0xIWGY0VnhTN1BLbEluZERUZXVNcnEx?=
 =?utf-8?B?VDVjcWNxNW5iL0dhRXNKbThLSFpKZ2QyQXJla3kydmU3M3dnbk95eHVTVkZu?=
 =?utf-8?B?VGNkaWJzQ0xnSEZLdXpHR1hLVTdBNzF6b0RLTU5QLzFZSkFQSHFBSUxHWCtz?=
 =?utf-8?B?dEQyaWFDY2tkRHVuRTdsVEk2bG5NL29QTkttQkZwNmxZYlJMOEEycm5sM0xV?=
 =?utf-8?B?WnM4eFJHeGdSTWVLSldYem9jTE95RU9mZU43MExWUHBFdUVwL2V1Q2JYcXlO?=
 =?utf-8?B?ekY3b2dERDBtOGxCMlhEMlpPS2l0dzNNUEZIUEdVUGFPb0d2dUtNNFN3clE2?=
 =?utf-8?B?ak9MVG91YmkveGxZY0puS2g4bVdQUllaSSs5OVhIVTk0bGpuZVZ6aitZdkw2?=
 =?utf-8?B?aVAvU2dJMkc1Wi9yaUhzU1o4a00zZFJsN0tlZzlPaFpwcHpmVXc2a2w2dzR6?=
 =?utf-8?B?NWFlZWtzT2poMHZsaGRNdm93V3h1L1BkZGN1SVg1TDZJTDVZU0lRbXppSGQr?=
 =?utf-8?B?czFXTy9BeHNyRExoVzBCUlpVRlA3NUhadXJ1dk56VjZrK1NIZnBMd3JiRUkz?=
 =?utf-8?B?YzFlZGRVMWt1V21FczhIZDhvUDR1dHRVajBtK0hGRmZMMEpVZTFhUCtQeHFL?=
 =?utf-8?B?UDB4bFZENlZnU1l6OXJ5SFRlY2dBSkRDWmVNNXV1ZVh4U3pVbmV2bWU5TDBM?=
 =?utf-8?B?SEVZSlduWTg1SEltQ0ZqbkliZmJyby90YTJ3WFRNcTA4VFhSajgzQzZDbzAy?=
 =?utf-8?B?Tnl3OStYclNOUGtsNWJUbjd0WjlFaUpjZy94ZzdpYjExUm9za2tWaExtYzNs?=
 =?utf-8?B?c0dLTVBkM2ZIQnhvUURtcXBCZHQ3U2lrYTloVk9QWXVjZlNnZXY3ek4rTUtT?=
 =?utf-8?B?S3NxRUthOER5WmVRMjA2bHZXc3BjaFZPZ0tMZGgzRnVOSU5OWmszd2dLTnlU?=
 =?utf-8?B?SzhNWk11YmpIS2VlN0owem5uWTFCK0lxbXlFOU9XdW1EMVV5YWQ3UXp1Mzgw?=
 =?utf-8?Q?GK84=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUdzY0NtcTlvb2xzV21WMm9mRnRDNysvMUdmWFh0RUo2SldSU2pxdkNoLzhB?=
 =?utf-8?B?QWhmRmpOcnRPSDR4eTh0L1o5dWdVZ0VXTzdTOURQWUhLWUZVOVBtUEdqaTFE?=
 =?utf-8?B?Z1JjU2ZDOHJOZklvb3FQNlNzOVNqTDBmdGthS1pWOGR1UVZlUWJlZ0xTTGxN?=
 =?utf-8?B?cEhlbCtiS051U3ZET1RtWTNXTTZhRlk1VmlVREs1RjdwNGdlaS8vanQ3NlZP?=
 =?utf-8?B?ekVjZytQenVDSGJ4U09SWlhxbWdXWmNWdnpRWHQ1bUJxZ05ReFEremQ4alow?=
 =?utf-8?B?bGdWcC83THc3UFVIc2txUGJ6MUJpU0o3TUdJT1B6Wmh1SjZqck03bEFhR2V5?=
 =?utf-8?B?NVZtSUZqTDZiLzNmY0J0VGpXTGdDNnh0WDdjcUl0QkRjZFdKd1Z0VS93NUJa?=
 =?utf-8?B?U1pWOEw0RWN6YVV5Ync2TzhxdDU1bEQ3dDhRR21Uc29aMFR5anJESmhYV081?=
 =?utf-8?B?VUtJZVNPTlc3SkE0aDRWMWRBV1poYkhjUWxLK1IzUE5HMFJRZjVtQll1b0Jz?=
 =?utf-8?B?NHdFckExKzFiak82LzFwZ0MxVlovbU45QnU4dWt5NVBWUTBpWXBMUVZwVVZx?=
 =?utf-8?B?bjBCQVlseEdBUUlEZTB4SVNRQlZYRitVWVM3T08vaG5Ya1RpUm54eWpKWkVM?=
 =?utf-8?B?bWR5eFZGd09CeXZaek9CNGp3SzFqbThCNzJKbmNFOUJod1NtaThuRFFvUTVD?=
 =?utf-8?B?WnlFUUljNHNEUU9nWDh2Z2psY0g3MjRwbm05b2hPS0hqblVGeVdQV09WU3Zy?=
 =?utf-8?B?RzdvTUdyaG91dGZwaFBZRnlVRmtNNGxmQ3N6MzMrOUphcXBiUXBNei9oa0F4?=
 =?utf-8?B?b1FJcTBxVmhsU0xYVTlkSGRYc1ZsbHNLLzM0cmdFY3dDMnhtRmRHSEJmcHNH?=
 =?utf-8?B?azBubEtFa0czRWMzc3RwbG9GRkVlc3MzZ050S0c1Vmg4akFjRnZ0TlcyTFc2?=
 =?utf-8?B?OXp2VWxMZHdMbEIvVnBha2d1Nk1SK2N4TG1YVHhQdU5ORkJobzR0c1NhUDlU?=
 =?utf-8?B?cWJjeWs4NlZTVVFoZGo1bXd0UWMveWJ0RnFuOU1jTzQ2a0NQMm4vSE0zY1hu?=
 =?utf-8?B?cWZZT2d5MnFwZ1RONlZTT3pMZktHcVZoNlZPVm9yaUFNazFiVEZlMmpUblRl?=
 =?utf-8?B?Z1NJUjhtZ0FNaUJiVDB3OEg0TExBM0g0TG9nNkZzbC82N1YyNGJNKzhyQ3or?=
 =?utf-8?B?RjJUbTlwZDgzOG5lLzRHZWo4T0tzeHR0YlhLalBDbkl5RkErenV6TGQxM3JT?=
 =?utf-8?B?WlZuZ2J3RWJWZzQ0YVh1V01lV3BwK3BtWW1VV2k0ZnI5Vjk2VExuMnpYNTV4?=
 =?utf-8?B?dkpMQXh4bjR6a3p2a2dHRndBSE42dGtMTnlYZ3M0eTE2NmJtekpVMFNOeVo0?=
 =?utf-8?B?Z0Y0cTNHdUJaclg4WDhLUkIzQjhTaWhaVHc0UE5WUlBsL1NaSDBJOUJNejl4?=
 =?utf-8?B?MnJoRyt5ZVJUSTNxVXo3ZDRwdUdweFdJWXZwYktWL1pzME9QNjNaVmkxQlVn?=
 =?utf-8?B?TW4yYk5PcFpVTXllcUxlVENDQ3RqUnJNclh2WmJROUFjbXdmS09NMFVtc2dZ?=
 =?utf-8?B?V1NaVTI1NmQrWXFtUVpxTEVzWVJXMkZlTjJLaGpIR1lEQXlBN0VmSHAvbXQ2?=
 =?utf-8?B?ZXlUVnRQRzdkekRvbW1aV0oveGFGUGowOTdlR0dOZmNOZFFON3ZUMzZ4aU5U?=
 =?utf-8?B?dVBpaENsYWhOM3VGajJGMUtjNUcwUVhYR0MwRmIrUHNLaUFvcEpoTUNQQito?=
 =?utf-8?B?L2tGRnMreFBnK2pFV1lUUHk2THNnaU5YNlJWNUZNUzR1NUtFaUNBMWFoMm5r?=
 =?utf-8?B?NzRBeVdiMUN0U0pyZG92Tk5ORndmSmUrdXcyV1V0Nm5iSXd0bFNCS2NZaitx?=
 =?utf-8?B?TUhsZUUrTXdjSHpqVUViTmN0d1NTUjlPbjMvWFZ3WkxqRys5bXFuQzdoUTJO?=
 =?utf-8?B?eTk3QmFHeHJjdEx5ek5lRTBDc0tGTFZTNjlKa1NHVVI4R0t6WU9KK2VZZGd4?=
 =?utf-8?B?dGtNMlpxdkpsRE9zaFdjY1dwc29Zd3Nselo0T1U5citpRkpNQUZWSTJoajlN?=
 =?utf-8?B?UUcxMDhPNHg4Mys3Z0k5NE4xRjZ6V2xBZGV1RmhmM3NlVzk2V0tkd1cwZWpy?=
 =?utf-8?B?RjhZSXE3M24rayt3QklUYno3TDJ2elp2S2tvVEIvOVZ1SjlGaUpKdmo2K0JZ?=
 =?utf-8?B?b2loSGtkRzJBcENwRnhjbVNWeWJzb005RzVMZDNrcjJmR0ovdTQ1aUVxS3Jq?=
 =?utf-8?B?cHNERjNlV3BXSnJUUVBkM2t4NU9NaDNDZXVDWUl0c01LTkQxdWxoOCtTNG1O?=
 =?utf-8?B?djNhVXdYd3R4SUhvdnlpOFBSOWJmRWR3L0FsVTRueE8rT2lSWXlYUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8278c714-b0bf-4ce5-6be7-08de5753ecd9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:11:50.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crC4ErUClV5nKoTbZsloOSjstIcc7Yro8Ukgi4t5bsaBeMV6HdlO3riZmfPwwJU/Aqx23DPiPncqS8ks4PDbDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_041201_215046_A9438741 
X-CRM114-Status: GOOD (  17.99  )
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

On 19/01/2026 13:15, Leo Yan wrote:
> On Mon, Jan 19, 2026 at 10:18:35AM +0000, Coresight ML wrote:
>> The ETM decoder incorrectly assumed that auxtrace queue indices were
>> equivalent to CPU number. This assumption is used for inserting records
>> into the queue, and for fetching queues when given a CPU number. This
>> assumption held when Perf always opened a dummy event on every CPU, even
>> if the user provided a subset of CPUs on the commandline, resulting in
>> the indices aligning.
>>
>> For example:
>>
>>   # event : name = cs_etm//u, , id = { 2451, 2452 }, type = 11 (cs_etm), size = 136, config = 0x4010, { sample_period, samp>
>>   # event : name = dummy:u, , id = { 2453, 2454, 2455, 2456 }, type = 1 (PERF_TYPE_SOFTWARE), size = 136, config = 0x9 (PER>
>>
>>   0 0 0x200 [0xd0]: PERF_RECORD_ID_INDEX nr: 6
>>   ... id: 2451  idx: 2  cpu: 2  tid: -1
>>   ... id: 2452  idx: 3  cpu: 3  tid: -1
>>   ... id: 2453  idx: 0  cpu: 0  tid: -1
>>   ... id: 2454  idx: 1  cpu: 1  tid: -1
>>   ... id: 2455  idx: 2  cpu: 2  tid: -1
>>   ... id: 2456  idx: 3  cpu: 3  tid: -1
>>
>> Since commit 811082e4b668 ("perf parse-events: Support user CPUs mixed
>> with threads/processes") the dummy event no longer behaves in this way,
>> making the ETM event indices start from 0 on the first CPU recorded
>> regardless of its ID:
>>
>>   # event : name = cs_etm//u, , id = { 771, 772 }, type = 11 (cs_etm), size = 144, config = 0x4010, { sample_period, sample>
>>   # event : name = dummy:u, , id = { 773, 774 }, type = 1 (PERF_TYPE_SOFTWARE), size = 144, config = 0x9 (PERF_COUNT_SW_DUM>
>>
>>   0 0 0x200 [0x90]: PERF_RECORD_ID_INDEX nr: 4
>>   ... id: 771  idx: 0  cpu: 2  tid: -1
>>   ... id: 772  idx: 1  cpu: 3  tid: -1
>>   ... id: 773  idx: 0  cpu: 2  tid: -1
>>   ... id: 774  idx: 1  cpu: 3  tid: -1
> 
> Seems to me that this patch works around the issue by using the CPU ID
> instead, but event->auxtrace.idx is broken.
> 
> Should we store the correct index in event->auxtrace.idx (e.g., in the
> __perf_event__synthesize_id_index()) ?
The idx value represents a perf events ring buffer.  Events on the same
CPU can share the same ring buffer.  But in the case of per-thread
recording, different threads have different ring buffers and therefore
different idx values.

So I don't think the idx value is wrong.  It is just not the same thing
as CPU number.


