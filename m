Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B92C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX5YJ2rlrS7PvjiG067b8hThy7mVm1ocueJm6prPs4E=; b=kTfWgWfLOonEqOkJQErPHrIEW6
	r+y/MPHVwU0PzJGDH6x/SRSWFtEuqEFALx3ML3u5RaQBNgwST3xZOWKMM3bvPdPMT0rQz3+hL2w9T
	5TeESXvnOKek8uUuGxZakgnuCYx5cw82Ln2tQGn/qPRa2TKdEIDLawlWK7OsgZOV/ByJhbwNkR2H4
	Kkt/6LA2zReup1QJhZNyEdvO9GcZsHbMgMg+6Qh63+J5EWRgeN7fXoSuD4b3oDaNbGTnCS7zesChi
	wNrXESvUWcQ8gLjNm4ohiNjChTydYeoglIwJXZHm1kmtuxZkVaKRnPwlpV32HJgJJ0+z3/Eg9JCGO
	inf1EfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV7e-00000005QZe-19JG;
	Tue, 04 Mar 2025 16:27:58 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU61-00000005BqJ-3Sem
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741101734; x=1772637734;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Z4v6I6xCrM+lMpAhwovjcjgrsqsxHITxIZJHzs3vcA0=;
  b=REHpkJAXZQW9VPa9yNUZch05UNpAoW70TBLHAdPckipk294Jdlw/iNjm
   86SBs3pr0JXhrwlwsfrB5X55GX2PuTBuYQZLPStfxSJc8NJHVF2Yir6J4
   bbfsM1xiXjqwUZkU02W8wob2EpMGp3iZwB05l5FoLz8gp+IYnCD+q1Juz
   8laxAmf4kxvkt6sV/Qmx9eg6hy+qA9va0pCCRvff2OcPFVAvK6JvF312K
   nH+KT5DBNFIPZ4XgVZCwdHJ97v+Of+25Mf7iBjL8/E/P+nUPgzC25s2h9
   r9t7iw8vuO6sqTw8aewmjsV636xkHpwEgh15VGdvQOvd2JICoBTgi0FPL
   g==;
X-CSE-ConnectionGUID: C1nZQX5YTgeMMPeVjb9qbw==
X-CSE-MsgGUID: sBHpp6uXRFS0nAPqYou2dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41934691"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="41934691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 07:22:11 -0800
X-CSE-ConnectionGUID: Aj+X1UeRTBS78JgajAnGCg==
X-CSE-MsgGUID: ZKwIjNeRR8eOsj9Ifv0Dvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149345905"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Mar 2025 07:22:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 07:22:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Mar 2025 07:22:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 07:22:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5OLnPEvHCatspR45wLgF6JMb2beeXTNRHIxH+BbFOgAl/FV1aFjZQVoWdO0BKBNwPrp2NGynKTWF1DLGBkuxg6V0crzGf9rKEVoUW4PK6I4H3BunGyfLbogGXG9O1NT/jfgAcZhVHcrQ/V0G4Gnllcw0XLGb9U5uLW/PF9dtwRToJiU/1mz/uNr+DoTKrg/Vd1ErI+h12Alxa9WbbH/+321731zd+0qZvghGh9WrEfJ6187JnJQDM1GRq4nbAYYEKb+bJDtSwaEAp94dHtHeoibLV9be6h+0CkY6VyqVx49dJH2YXjGIJhxMXKwNWutVqnJs7HjPiUIU/6HxllhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX5YJ2rlrS7PvjiG067b8hThy7mVm1ocueJm6prPs4E=;
 b=sORaHHX2CSaihghHZ4HjaT30zQZnWYr8T/PSwYNExHJdZ+GjpkcrBNYtoDu1tYAffGin87C7cBhOkYzEHpMPanEtxLjYqZeCVs6Z+mox+LBG7IIOZ0u73lDW9CTHrLYwEA5/AUnjCQdt4p7VVx289Y78+nQcT4zYDckpSx9H/5dqqmrDVPFwlfWhp4T5Q6jEHV/BhnqMLo/tNQMdewj4zZp9xMX0WnOmj3K1B0Eiv5d4FESE+UzxWfkuZ6hFIDNj/zf/unGhPZuoMR0Dsy4jW27Qwus7rh7E6yVBfJlYTnOPUrkiC3bQh+oesBkD7kN1hf/HDTdKnO73blAOzP2w+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3605.namprd11.prod.outlook.com (2603:10b6:a03:f5::33)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Tue, 4 Mar
 2025 15:21:22 +0000
Received: from BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89]) by BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:21:22 +0000
Message-ID: <21ad7f1c-eb08-45fc-9a2c-3d55787f15d7@intel.com>
Date: Tue, 4 Mar 2025 17:21:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] perf script: Make printing flags reliable
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, "James
 Clark" <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, "Liang, Kan"
	<kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Will Deacon
	<will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Graham Woodward
	<graham.woodward@arm.com>, <Paschalis.Mpeis@arm.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250304111240.3378214-1-leo.yan@arm.com>
 <20250304111240.3378214-2-leo.yan@arm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20250304111240.3378214-2-leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0130.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::28) To BYAPR11MB3605.namprd11.prod.outlook.com
 (2603:10b6:a03:f5::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3605:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 915e59bb-4015-482f-55de-08dd5b303843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRVS3Y4dXA0SFJ2R3ZVOHlteGRBWXE2ZFZJb0I4dEM1VERwQ0RJNTVma1U0?=
 =?utf-8?B?aENmb0NObGNtUCs0TjIvWmNyZG9ySkpwTUlkU3RWb3hHT2FtT2p1VGpqT0xX?=
 =?utf-8?B?bWN2NUJVSXBRMC9nK2ZBU1RudkthaTFoaUZpd0dmK1dQZWtZUDV1YnVGQWZS?=
 =?utf-8?B?Y0FWWWVoVHdwK2w3UWZmdWtvSWx5djNmWWlWeVVwR3QxN053WWxkM3F4dm9i?=
 =?utf-8?B?bjB5a0xUOURlSkhYUU5JOVBsZUE4b0Z4UlN4LzYrN0R3VHBrOG1GWUM1STJQ?=
 =?utf-8?B?UHV5VTBHbWllcExaNTd1Z1JnNjVGdUJpMit1d3E3MFdwRFkvN2FtYlFSalBT?=
 =?utf-8?B?SHQ1V1BKam9aNkpNdHJrUXNQYm1SUGc3WjZlcko0YnBwN29PQUhCZjBhcHZl?=
 =?utf-8?B?bzZMQmtxYkZ1OEFtOVN2anlSeC9Mcjd4dUY3RlJURGNRL0FFVDFsV3JOdjli?=
 =?utf-8?B?YXdweVlWeGFGRHlKOHRUYXFaZ29aNi9tdkc5dGl1QXpQaC9rSXpOL3NBdXdR?=
 =?utf-8?B?T21pZ1VIRzhNUERHUUtZcnhZLzZZMWVpQWpYa0VmazFJdjdlbXpUZVhkSDRE?=
 =?utf-8?B?c1ZUaStNUHVEMFM2TTR3KzdTMndNd2lRWGJCUmFpM2g2NTZYQlp5ckprajRz?=
 =?utf-8?B?NjdZTGVXaEpSRGRLOHdWVXJoVEVFcjU1Qm1CbEFFNDNCWFRsc1lzaS9sQ0pX?=
 =?utf-8?B?bWttZS9xSDRqUEgvRWN3R2x6VDZqVU16ZURobzFOOFFLZkNON2hrMUR5d01D?=
 =?utf-8?B?RC8wVmkyRERBQkNMcFY2ejVGMldBODBTSHg1NFA4UW90U1czL1dCWk03WUZI?=
 =?utf-8?B?QXRTRnRrNGljVGhRQ0NVKy9QL2Vwd0N0NkQ1YWNrR3VIdllWMXVxRUx4ZjVs?=
 =?utf-8?B?ay9QK1BCVGJMaC9XR1RGQjRTVzB1eExTY1R4UllKSVVMc2pzakhxQWswd2Fl?=
 =?utf-8?B?eCtpYlc4UGF3aFJzeEpVWHN4cExZVlZVSDZMZGE0Ukxsb3p2bzA3SHBMQVNJ?=
 =?utf-8?B?cE1BN0llL0w0b1JRT25XQStIdWtFaXYrR2x5RUVDTGFoTzRtOHc3aTN4eUxs?=
 =?utf-8?B?UFMzTDVtalBraWo2Z1UrR2toN0FCbTlxSFRlajZtMG9rVk1JN0t6ZGx6ZlZB?=
 =?utf-8?B?M0xnMWxJZ0tQU1paMHFubUtKWWtKOW1hbXNKTWtpcnJIYXV2VHpIWm9Ub2tx?=
 =?utf-8?B?ZzhIR211L1RzTkJ3MkUxUFJZL1k2MUVxUEZNRWI5K09GaXo4bUJpMGJ5K3Fj?=
 =?utf-8?B?THBCQkpWN2ZVbThVZi8xd3FEZklsTVdGOEFMYWJQdWxoMmNnWWpDeFc1UHdZ?=
 =?utf-8?B?OUJUbGNnZ0Mxdm90YSt4NS9BZHJqMDdpcHJpVnBqbExWclhEaWlLbWdIVGdz?=
 =?utf-8?B?UTIwKzFuZGNWSk5lSzQyeCs1c1VlU0NJSDNuYU5NdGE1Yk1JWUNUUW52VXB5?=
 =?utf-8?B?Ry9uckROalRmcExTeWN4ZGFtcDRkQWxDQmhsVUtSeElvMUROdndPbFZHTVhI?=
 =?utf-8?B?Y0trNlFURlFuZUxmQXM2NUxnUGFjTXQ1a3BpUkZJZS9uNjFIZ0kyNi8xUUx4?=
 =?utf-8?B?NTZVeStRMW5NUWJ4Y0VDOEZBRmhUQlpUdlE1MldUSnIzMVdtZHcyQW9aYjBT?=
 =?utf-8?B?MTA1T3dIRDM2Ry9aa2lDWjZwZnJLcjFqbklvWUpTZHNNNWVoVzVvKzJZaTdm?=
 =?utf-8?B?cVFQWk5BaUQrcVVDV29jeW5hQjYzZlZYQm44ZmhqNlJQRzBNWERFVTFkY0VI?=
 =?utf-8?B?bnRoc1hKbDN0MDlTZXBvT25MYmMwN204SnExZHJKa1dpV3ZkMXoyYzZwNXQ4?=
 =?utf-8?B?MFhzRm1SVzc1R1VBVXlKVkx0UWhMMCtOVWhrVlNIN3RDK2pMU1krVDdMeHFo?=
 =?utf-8?B?WEZtSFpEUzNhWDRQYXVEZUljMzVGcjl4VmFTYjk3NHVpSk9tUDREazYyeXdk?=
 =?utf-8?Q?QTzB7emK0+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXZaWkJYTEFSVmJwZC9vaDBRY2ZJSnd0YVF6S3N3aXBRNFpBcGlpZVdsMlN0?=
 =?utf-8?B?Z29KTDk5bExxc3ZDUStKSGRLdlpaS2V2YXM0RllJb24ybkRsc0l5VmNwSzF6?=
 =?utf-8?B?YnIvWkNSSzJQNDZPb1N6d0dZV1R3ZWw5eGYvb2xOMWlKQ3hmRnNSSjVOR3Vi?=
 =?utf-8?B?MlYxRTdMTGptVEU5TlUrakR1WDBuWlc3ZWQ3RjQ0VlEzNlBPOVZ3RFJsTElD?=
 =?utf-8?B?NmhUNHo4OHQ4NElOVEg1ZE82SkV4NFdjMFJEL1Zud09oZG5hKytEYVNnaFFB?=
 =?utf-8?B?UTFzbVA0SnNQKzA4bHIwcVR4SUpWZkJZeUlQbU9jTllHVlJzRStITFR4cUIr?=
 =?utf-8?B?UkxUcFFMaldiZjc3azdmb3l3S1lIanNyVnZZTUVmMmFiN3Q1cmJkaGw5TUdr?=
 =?utf-8?B?U1VtQVN4c25rN2czUy9tSTljQ3IvVUlKNTdFRUw2RkNFelVtK0w2QnlYbHhU?=
 =?utf-8?B?eEV6SmJoWW0rQzVISFUxc2NtcXdOaUpVaitBRFkyLzNZZk9EWkRpQUQxQk9M?=
 =?utf-8?B?NStXdnBCS1NXUlRQbUZNKzZ4ZG9xVWZBcTdneGVFNmJEN25lR29ia01mKzUz?=
 =?utf-8?B?QmVRcUx6aFhuS2prd013TXJYZmJCSlZVOUh1TVZMZ0hTUmtEbHQyVUR0akg1?=
 =?utf-8?B?TFVxcnhnK0hWMlBsQ01MTjE3Z1YzU2Z1RDduT0NHdWczY0hWR1VWQ09JUTVu?=
 =?utf-8?B?eUZSWDk5aWZGVDhYNHQ5QUtIT2daN2Y3eGllVWl6Z2dBZUpmb0tUeHVhTE5a?=
 =?utf-8?B?enpjYUREbmZaT0FsNkxJYzVVZm5ZbmhZa05yUVZjU3U5cXg5bG5oQjM2a0gy?=
 =?utf-8?B?R0pja0sxOFlYRmUzVjk4cnc5S25QcWppV0diaVBpK21OTHgwWFNtOVM1TVlz?=
 =?utf-8?B?cURjYlNlNWlnUWt4TXN6RHJZaWhqMTVESThRb01xTUg2RnkvWEIyeSs2MjJ2?=
 =?utf-8?B?TzUzT1V0aktUNTEyWVdBTis5eE8vKzJaUis4d1RiOUppNE13bUNVZUpMaE8r?=
 =?utf-8?B?dTQ0NHYvcEpiU05xeSt2K0ZHcVJobE84ZTY0aWxESFBhaEEwdi9FalU5NG1S?=
 =?utf-8?B?ZFlwdDkwZDl6Nnl2a3lhK2xocVptYWY3dGNGWUR6VjRSaGNTMUxZQlNGeTZt?=
 =?utf-8?B?QzNSeEZzSVlhNEYzdWFqNXNZOGtKdDRjSWhVZ05VMy9vZm1XckhmMHFoTEJs?=
 =?utf-8?B?Qm11Qy91d3pOS1gySk45YTNsWUczYnVYRCtjaU9XbjdRS1g2QStES1Q2RkhP?=
 =?utf-8?B?TUZ3cnBqMlNRelVTNlFqM2NlWmlLd0h6RUwyNXpPUitFL2E0b25wU0pvaGVt?=
 =?utf-8?B?WVN2elZHNzA0RkVtYXl5RytpcUpNVFpqQ25EK3Y1OFVXTjN1Y3ZMRjIrL1N1?=
 =?utf-8?B?eUFvRXZhc0lBSU9vNHdEQmFIcXpKWWpFcUFQcmswRThBZzNpeWd1UmtpUzEw?=
 =?utf-8?B?cWI4VjRYOU1NSXZ3S3FRL2RNblVtNlBpRGlSQ2tNbGVwQ3VaZmZnSzJQR0h6?=
 =?utf-8?B?eTRCVzZFZ0RMaVM1WlNKYjFGZ0RreTRVS3V4aWYzYmZzTUQ1elVVem5henEr?=
 =?utf-8?B?SEpPTTBzMk83Um9mYmlaSU5aVVUxcG5mNXd2c3Q1bzc0SkMvTWFYRG13WTJ0?=
 =?utf-8?B?RXdiTzlWSzVMa2d2NDVQSjRMNGtrUlI1T29nS3lmL0l4elVoOS9XNTE2amJW?=
 =?utf-8?B?M0ltQnFVdm9mb3NFWjBFY2ZyejhtUUdUd2ZTZHU5ME85K21TSVVoRWF2YUoy?=
 =?utf-8?B?ZHpSY2VhdXl4QmlhSm5FaWJUVWFoSGF6VkxBcXRQaHVnc21DdFl1NmYrTzQ0?=
 =?utf-8?B?TzgydEhUR3hmb2lHL05UaWxYSE41Z2Q5QjBBWGJIcmoyUmYvamh0WTlFTjJI?=
 =?utf-8?B?NlVUYlhkbjFwdGZ0TG9wSHpxcklJUHpCU3hpQzdObWVXUjlSeWNjRUNLMWJw?=
 =?utf-8?B?LzZnc2Z0NDBYZ1I3ZFQxL2gxaFFhblUySFA4VHhOemZ3aHdQZExpUFVDYWpF?=
 =?utf-8?B?ZGNtbE51dUZnNkxEelI1L2RqQU03R1lzMmpYZjNCbE4zK3V1UDBzZ3hBbC9i?=
 =?utf-8?B?dGFSZEhiLzJHS0tidzRDcDRLMERUYlFGMmZQelNaTFF1clM3SGdXR2YzdXJO?=
 =?utf-8?B?Wjl1TDlOclVWbG85bVpFdHQrTURHTXFmc2hQbzB1ei95SExqTzkwM1F0YU5L?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e59bb-4015-482f-55de-08dd5b303843
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:21:22.4685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23KEuyJmoxspTIj4IdTW+hXtDLb3zC2SrFeGm2NDPiFeoBAkYziwPjFMydivg5PjSj0NUD1U7sliU1FMl9+Jow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_072213_934145_2818B931 
X-CRM114-Status: GOOD (  17.54  )
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

On 4/03/25 13:12, Leo Yan wrote:
> Add a check for the generated string of flags.  Print out the raw number
> if the string generation fails.
> 
> Use the SAMPLE_FLAGS_STR_ALIGNED_SIZE macro to replace the value '21'.
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/builtin-script.c   | 9 +++++++--
>  tools/perf/util/trace-event.h | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index d797cec4f054..8ca04293d335 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -1709,9 +1709,14 @@ static int perf_sample__fprintf_bts(struct perf_sample *sample,
>  static int perf_sample__fprintf_flags(u32 flags, FILE *fp)
>  {
>  	char str[SAMPLE_FLAGS_BUF_SIZE];
> +	int ret;
> +
> +	ret = perf_sample__sprintf_flags(flags, str, sizeof(str));
> +	if (ret < 0)
> +		return fprintf(fp, "  raw flags:0x%-*x ",
> +			       SAMPLE_FLAGS_STR_ALIGNED_SIZE - 12, flags);
>  
> -	perf_sample__sprintf_flags(flags, str, sizeof(str));
> -	return fprintf(fp, "  %-21s ", str);
> +	return fprintf(fp, "  %-*s ", SAMPLE_FLAGS_STR_ALIGNED_SIZE, str);
>  }
>  
>  struct printer_data {
> diff --git a/tools/perf/util/trace-event.h b/tools/perf/util/trace-event.h
> index ac9fde2f980c..71e680bc3d4b 100644
> --- a/tools/perf/util/trace-event.h
> +++ b/tools/perf/util/trace-event.h
> @@ -145,6 +145,8 @@ int common_flags(struct scripting_context *context);
>  int common_lock_depth(struct scripting_context *context);
>  
>  #define SAMPLE_FLAGS_BUF_SIZE 64
> +#define SAMPLE_FLAGS_STR_ALIGNED_SIZE	21
> +
>  int perf_sample__sprintf_flags(u32 flags, char *str, size_t sz);
>  
>  #if defined(LIBTRACEEVENT_VERSION) &&  LIBTRACEEVENT_VERSION >= MAKE_LIBTRACEEVENT_VERSION(1, 5, 0)


