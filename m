Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA3C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biyJ57TW8vLfmWG7Fxr40eDDr84g1j3VDSYyx358FXU=; b=lLPSb67DvDR1qoJ1w1gkQJFiik
	X2hKW9rNHhWjGQJE7TWnVKWIwSTBgTJN6McELNb5QdugLqp7G0B15pVj3HGGPcevY3aNBudlt1mbc
	TjDgIpSaRGHJWeLV/qymN4Ka1Kl3qfM2fNxbGRL23A59U0MPKChOykzMBsEETbz6dYVflBnkXzTTb
	oCwiO3N0NnFvUcso0VHxaWAa1W/BD8z0XYfS6OXA761UkEdfP1InezmQpFVhDRNTWhIhrozo7mFKr
	7J5821uERY3ULd72rl1EDxKR/yL4Spb5txB4BN0tAGb8WCcp6g3krcVDDKob0HBubfJpQMMpyYa+P
	bp6YmgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTgn-0000000GavA-2p6r;
	Mon, 24 Aug 2026 12:22:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTgl-0000000Gauk-00Er
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787574127; x=1819110127;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fhBuZVnkPIyfvwBdeK9Fhxo4/sc5WQL0V7svBzW3uIc=;
  b=irx8yWrBJhsDoYfqngN5Tgi3VbxOK297/uclKKmwaAoBVXcGR2fVSba1
   OnA1WzVE8WBZBi16wUzjgOWL9EwnYNY9WYViaqMZiGxBsG8uGc9QHlnsB
   LkJppwVjieriUYNUhIiR2V+5Y4KUouxrDBJf3ou9a2qRVzUtMizeiU9ez
   mG0AhTLOWjktBfs3z0wQ8XNgfcrkQAckFg8A8QVHkA/MFM8YUDMIV0A6u
   TqNx73S8aJJRiUdyFQ8qJe2FkvUY324a+A5LKIBNrV2CK941MQ14LaLlY
   nPv6E2iZsxnerO8Da02wifw4oE+c8V4jTdeP78UyRSIYoNg3rSx15Qdmu
   g==;
X-CSE-ConnectionGUID: HSCbRtcsSMOWzuRBkXu3HQ==
X-CSE-MsgGUID: rWCuIUR+SNmm7wJUa/OU4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105558669"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="105558669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:22:06 -0700
X-CSE-ConnectionGUID: s3o8qChoT7au9YoupuenQg==
X-CSE-MsgGUID: o3GyjSVBRlSk7hkjm2qhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="271203058"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:22:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 05:22:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 05:22:05 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 05:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ip3T767XSH/wlkDfQajC3YvmwN1P5EGg1DSES5lkNcDj2XOPJpwYiX0YMz5wK4AEY1NjaOTwGJYOB/0861xRent8E0dTi2nH9VgMRVZ0f77gyo2E8AyPuBSZ+r5OUjzUQMwqeJsunGkMEu5plUVPoA/tTJukMOZojQxitFAIq+BAyZKcWuiSpL4RbOWmxPMZtK+uHm/vlnRHptqepacBpf0+pBRUySiJJAqqoB38QYauRDEfmOIcgwcAN1N2HKlCTa3cS+rZ4KfI2jXDb40NCpbqIpfsWJ7MAodpFwoV4uoNTBPaMY3EX36UZzCxrtE/D3UWAvoTYw+93fwDvFmyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biyJ57TW8vLfmWG7Fxr40eDDr84g1j3VDSYyx358FXU=;
 b=AGuv4V/tIla37w0pHfwDuWqz55/++wLCBSz9XOC9DkIzEvX2WiHtgvd7aJQICx7RlakCOXdmMy20/E7qqJGoYX9u/ZVkIi72gYXGV7ilxaHMeTY2jlKh5UFH3WbfIChn4zas3yrw5nat6JwEt89sG03OpgZCql3oGoiFk5BknJOeLsNqV0ozJuRH3vbrGxHlG0Vq1Ltu6SLvhIvVtrZvNPRIOoVUQDsVNlIj7H3jV3EgpBtCaswPU1utlhlroy5/NN8vLgB8s1QRIQGbzoxkPuiZOFQjZW4EENo5maKZKEFZdXR06etxDLI1FkzW7Qv7aBR+ceC5iPWmXv1VMVsczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ5PPF9FBA0498D.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::848) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 12:22:02 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 12:22:02 +0000
Message-ID: <568a14ed-161d-4f67-842a-c671e7f4c409@intel.com>
Date: Mon, 24 Aug 2026 15:21:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
To: James Clark <james.clark@linaro.org>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, Leo Yan
	<leo.yan@arm.com>, John Garry <john.g.garry@oracle.com>, Will Deacon
	<will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Suyash Mahar <smahar@meta.com>, Amir Ayupov
	<aaupov@fb.com>
CC: Leo Yan <leo.yan@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<coresight@lists.linaro.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>,
	<linux-doc@vger.kernel.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ5PPF9FBA0498D:EE_
X-MS-Office365-Filtering-Correlation-Id: 7707c62d-d3ab-4974-82d8-08df01da4d22
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JH2+CMqWVgVDtEZrOIRiu+950rKRgk+DK1vKkfog2EbaMqRkOEB6SigJEbnBC/iVo2ws4BjmXZR6S7e7xJStmGDIUKLPozAupzkL+E4HNBAtVaNC80GwDIWtHqqZPSzRBlxrsh8eAmVx8JXXwd/SXzjOYVUn6BgHVEBuQZ+WsI8RxoaRA48Y63kstwacft2qWCz7uJZjjK1w8biKft7pS7xt77+AxF2CK3MdZUroQV6kt/3eHN2c+Yfuuv4N+4NXFyIj6tCpEKhBJzDfgfMmE3VhSgOH9oJhSxt0sJ0OIPcdo1SLuHwn4F/SfdL/VztkEvg2JpfUSMLiRP+nzFCm2JgkK+9/v0lehsnfLZkfbDgmCAOJFcI0tL1l5873Mc/CZeoT6DQ+/+pFambPfDgW2o8os9Zac1MRW20C9mMLEKXT4Ey7xggX8fQ+NN17y1F5WNRCgZoQswAAyVbsOAh+rHQSMzlRKPXX5+IDDvdeeu5atBjE0rF/4LCfk4jzHtGZbqz0oZ35f3ppyRAJ0jeEovOsuUCKN3vsV3ghJqz/Xx8BHvVWkxLgwLSYZreT+tuhnanPm8bca19E2yJebm5nKGZFdFRzQKuGH0jwaPgDIqT8x8q9yhquur7vLHAC3pC4AH/4AVSeDrqZkJbyGstZdF+JbfNcs78czzjre0xqMSikMXT3M4kDG929Z3rBJIyqUomSam8959wmZmFweT+6hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVOK0E4VWs5M2swVDFGS3d5VTY5aThDMWxucGIzQTNjVWY2anJVRGkwbFkw?=
 =?utf-8?B?d0c4QlhEMGtyUWdrbUZydUYxekJaYUZ4UnVmd2QvcGZ0WFZOd2hNb0ZyUjNT?=
 =?utf-8?B?L3BtSkhMbUhNVkJlQk5wMFZNSVVtNHJVMXEyOWIwRjNLQVhyWmE0S0ZVaWk5?=
 =?utf-8?B?WHRCWHpvbUlCS1Q1SkJSeEZzdXl4RUpteityRzNVNmFISUZBWkd5dHhQaWZQ?=
 =?utf-8?B?Vlg3blM0MmVjOVVSb1hFVTAxNHg5S0dtK1BrWFVadmlPdUVxb2UyYnFUcGZa?=
 =?utf-8?B?RWY4clhJdGNEY2ltZmNXQmtyVzMvSzZ1M0taUFVhcGE3aE1EV3MyMjg4c0ZJ?=
 =?utf-8?B?SmMvc3o4VGRuRzZOTnkzaGtvZXFic0ExOXhWSWswaXU1T05uTmp0aHE1R0pO?=
 =?utf-8?B?d2xwRk04VFErcXMzOVJxVmpxdGNSbVZ1R01pYXY5S2N4ZTR0cU9vNUp4N3Ju?=
 =?utf-8?B?S01jWDZpbElLRkRwQ2ZPcFJaMm04K2lNQkdEeXVydzFDY2JLTDVOOXBWajVo?=
 =?utf-8?B?V2VlVUJXbE5wMVFnWDhMazZnMFQwanNzUUNCTVhUSEZON0dJWVd0TGhqMm4w?=
 =?utf-8?B?RWc3aFhnSzNsUUx5Q2Z0OVI1UjVjWVF1Z1o5U29Da2Z4YmhmcnBtYmlrRHF0?=
 =?utf-8?B?L1JYaXh5ZllUa09yRUowVHdqdjZoRHhWMXZKUEdJZThEcit6VEEySDE1VDdo?=
 =?utf-8?B?NzYrNUNYRERKUW92M3ZvK3orZVdUcHRtNG4vN25DSDVjT1ZrK3U1SHdMUUlM?=
 =?utf-8?B?Rkl4WW4zbFloZXpwaTN5UCs2QlZvcUlVRWE1UVBYMEdYTzVFemJNTFR6QXF3?=
 =?utf-8?B?UjE2TUREVDQvcitGYmdnaEg4ejcxc2NRV0lNQmJoOHF5U2dqYlIyYW5WclBB?=
 =?utf-8?B?TnA0WjVkWk4zZlc3WGFRUGxjUmRlK21LK0RmU3htQUVWak52OW8wckFQL0RS?=
 =?utf-8?B?aWZsU2dtcFFOQndKYS9wcC9zdTlhTE9IOUp4aTRndmxUanQ2UHdTRjRhTG55?=
 =?utf-8?B?Q1NZS2ZQallQdDNDd3hwajRIdzZXMzBXcGgrdkFaVUN6dkcrbEJUbmJQZUl4?=
 =?utf-8?B?bndGRzBzTmxwbG12ZGpHeVE1Qm9yZS9ZS1JIRFVPL2xycjR5b0hMVnVEWWVI?=
 =?utf-8?B?Z3NoWThpREhiOSt3ejNmUkFOQU5FRnRPWFJPSHlzaVB4dzA0NzlNREh5WE1Z?=
 =?utf-8?B?QUdHOHZmZENSNlRObGlwTVNrRUlaZ3VZdlRyYkdaWmIrNTNEWTZaQThTSU95?=
 =?utf-8?B?Z3BxOHN1U3hRbkFmWldORmxBSmVPMlVkRFgvT2UwWFpJbjNnWTVCT241TnFR?=
 =?utf-8?B?NUNJRGVTc1BFeDh1RWdQM1cxZmtudXA5Zk45Mm1qYm54YUFOUlNvVjc2TXRp?=
 =?utf-8?B?ZTdEM1VqSEY4dHZZS2RyVFNLeWgwSk1QamlIbmdxem13TG16UjFONS82OEtK?=
 =?utf-8?B?LzFnOUNYbktMUTVyT2U5ZmZoaDZiRmdqdUYyUGVlM2t3dEpmZzhhTlU0c2NC?=
 =?utf-8?B?MkRoS2xTQ1RrTlZjeFZ5R2lQNVlRdjJIMysxUWcxMlBXQVF6RGtxaWlrdFVj?=
 =?utf-8?B?cy94bEtyY21lT3ZkdkdiQjRvVm9vY3pxYnFoOEc3N0ZmSm1lQzNQdHdnL1dz?=
 =?utf-8?B?NlZrRmFoamlGYTlnbGE0RngyK0VzUklkcHFiRDRvaGE5OGdEcEdMdHBPcmQ4?=
 =?utf-8?B?UkxGaFRsWElLNGVnaTErTjJBSkVFVDYzU1lnUGJCeC9SVllSQVN3dGw1Wm0r?=
 =?utf-8?B?M3ZjS3RTbzJmL0o0SUVjdWs3VTJmVG5USWVnenFoL0pnMzk0WldWSVY3M3Zq?=
 =?utf-8?B?bFNnYUdmOWxZYURXbTVqM1ZjaVVFcHpTaCs4VzYrTmh6NEtZTDdBVDNodDda?=
 =?utf-8?B?VXRrTzVtZnN1c2wzdmZWUFhPc0o3c1pxblZZSkU0RnlPSGNhODJpeDU1OWdW?=
 =?utf-8?B?N3loQy83K3lWb1AvT1pDNGJxMTJmL3AvZ1doaGFTWXJ4ZWFHTzRjbHlZY3FI?=
 =?utf-8?B?ZFJhRTAvNU96QjFUQ0Zld3d5cHBRTGdhYitDZFUza3pMU2sxVnZJVkxPMW5W?=
 =?utf-8?B?Q3dSdC9ZcER0U3VGUDBpZ3ppUnRYL0RiT3BQdEhXQ0lmOWwzdEgzS1U5eXJm?=
 =?utf-8?B?RUlKMVFtYmdaaXJtNFg3TUM2czJoOEpia1RtbHYxMGdlZENTMW9nbk1HZWNR?=
 =?utf-8?B?b3E2ejlIQUw5Q2dsdTF4SnQwWEtVOGpLTEZMMEZSYUdvZSt2VllDS1BmQVZ2?=
 =?utf-8?B?WWM1aU5CTlBQWGR3T043WG1VczR5bGtMeHhBZ1dudWJ4Sm5KMzVNVmNNVEk1?=
 =?utf-8?B?aExRb0ppL2tOT3VyOEVHMllKUDZmZk1Oait3RnY1MXNKdlZ2MzFsMG9DV0RK?=
 =?utf-8?Q?rteJiuu3Y8r8gtXc=3D?=
X-Exchange-RoutingPolicyChecked: cQtjQJGtyFl8G9IgK4YaKipXZOMliTqNOezXtkRlu7KsSVSD7/Aq39Xjq/1CsbwYu7ITuad5p2vYpzruNdJC7a+siE/+NK6UjzW0/SRN0ykyeHLXEwPWpyOYpJuRLlLA1vIHBtzUijd0/3XnCjoKwWuvZIM3q8drC6Tz3LWbykTIDjJTpUQebymkq+nBC6zZwVgpBvSQUgSbvcDK1OTsjP4mCVRBURGgiKde0/XxCPwIcblzfq8n8fwxVeQWOi3iw7zzBhKm52654R/NvQoWiGZvAG9CRQOzfKZ2nP8oPsXNTnHhyScyts7mzsLe/dmEBM/msSYK+NDJit9MGaBxtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7707c62d-d3ab-4974-82d8-08df01da4d22
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 12:22:02.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFoWn6cjf05bvFSdojOrikrIfOApKuoqTwiKaCWnaLro/m/DRvw/Q/v6yUsU2WZFSLd/Vv7sVbxYj74c8xKWUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF9FBA0498D
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_052207_063222_7A34B153 
X-CRM114-Status: GOOD (  28.52  )
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

On 21/08/2026 12:49, James Clark wrote:
> snapshot_has_wrapped() isn't implemented for Coresight, so when a wrap
> occurs we only save from offset 0 to current head, modulo buffer size,
> rather than capturing the whole buffer. Coresight drivers currently use
> a monotonic head pointer even in snapshot mode, which gives a lot more
> information for taking snapshots than a wrapped pointer. It means we
> don't need to search for data at the end of the buffer to guess if a
> wrap has occurred, and we can go back to saving partial buffers after a
> wrap by checking if the next size to take is less than the buffer
> size.
> 
> The drivers will always be able to generate a monotonic head because
> TRBE has a bytes written counter, so even if we stop generating an AUX
> record on every overflow, we can check if the counter indicated an
> overwrite and offset head by a whole buffer size if it wrapped. This
> forces userspace to read the whole buffer rather than between last and
> current head. ETR and other sinks use software double buffering, so can
> continue as they are.
> 
> Add a much simpler 'monotonic_snapshot_head' path for tracers to use,
> and use it for Coresight.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/arch/arm/util/cs-etm.c                  |  1 +
>  .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
>  tools/perf/util/auxtrace.c                         | 22 ++++++++++++++++------
>  tools/perf/util/auxtrace.h                         |  2 ++
>  4 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> index d36b7e41399b..dbf76dd3349e 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -918,6 +918,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
>  	ptr->itr.info_fill		= cs_etm_info_fill;
>  	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
>  	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
> +	ptr->itr.monotonic_snapshot_head = true;
>  	ptr->itr.reference		= cs_etm_reference;
>  	ptr->itr.free			= cs_etm_recording_free;
>  	ptr->itr.read_finish		= auxtrace_record__read_finish;
> diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
> index bea70d825596..c9459ded4cbe 100755
> --- a/tools/perf/tests/shell/coresight/raw_dump_stress.sh
> +++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
> @@ -48,11 +48,6 @@ read -r size offset last_idx <<< "$(awk '
>  # everything was dumped. Allow 48 bytes difference to cover 3 frames: current
>  # frame length, a partial frame and a final empty one, all of which aren't
>  # dumped.
> -#
> -# TODO: for a single snapshot, offset should always be zero. However, we
> -# currently output AUX records in snapshot mode when we shouldn't, which
> -# increments the offset. Allow for that until it's fixed so we can test raw
> -# dumping.
>  decode_size=$((1 + last_idx - offset))
>  if [ "$decode_size" -gt "$((size - 48))" ] && [ "$decode_size" -le "$((size))" ]; then
>  	echo "PASS: AUXTRACE buffer length matches dumped packet index"
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index 8ca872e6d465..e3c770b46e94 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -2051,9 +2051,9 @@ static int __auxtrace_mmap__read(struct mmap *map,
>  				 bool snapshot, size_t snapshot_size)
>  {
>  	struct auxtrace_mmap *mm = &map->auxtrace_mmap;
> -	u64 head, old = mm->prev, offset, ref;
> +	u64 head, old = mm->prev, offset, ref, size;
>  	unsigned char *data = mm->base;
> -	size_t size, head_off, old_off, len1, len2, padding;
> +	size_t head_off, old_off, len1, len2, padding;
>  	union perf_event ev;
>  	void *data1, *data2;
>  	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
> @@ -2061,10 +2061,20 @@ static int __auxtrace_mmap__read(struct mmap *map,
>  
>  	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
>  
> -	if (snapshot && itr->snapshot_has_wrapped) {
> -		err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
> -		if (err)
> -			return err;
> +	if (snapshot) {
> +		if (itr->snapshot_has_wrapped) {
> +			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
> +			if (err)
> +				return err;
> +		} else if (itr->monotonic_snapshot_head) {
> +			size = head - old;
> +			/* Force a full buffer read if a wrap has occurred */
> +			if (size > mm->len) {
> +				pr_debug3("%s: wrap detected, adjusting old from 0x%"PRIx64" to 0x%"PRIx64"\n",
> +					  __func__, old, head - mm->len);
> +				old = head - mm->len;
> +			}
> +		}

I feel like this is asking to keep the ->find_snapshot() callback.
i.e. basically the same thing, but add a helper that BTS and SPE
can call directly, like auxtrace_record__default_find_snapshot().
For PT, add/use auxtrace_record__snapshot_fixup() that does the
common old/head adjustment.

Then ->monotonic_snapshot_head is not needed.

>  	}
>  
>  	if (old == head)
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index a9d0c84184c5..971b817d3396 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -385,6 +385,7 @@ struct auxtrace_mmap_params {
>   * @evlist: selected events list
>   * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
>   * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
> + * @monotonic_snapshot_head: driver doesn't wrap head pointer on overflow
>   */
>  struct auxtrace_record {
>  	int (*recording_options)(struct auxtrace_record *itr,
> @@ -412,6 +413,7 @@ struct auxtrace_record {
>  	int snapshot_wrapped_len;
>  	unsigned long *snapshot_wrapped;
>  	int snapshot_search_bytes;
> +	bool monotonic_snapshot_head;
>  };
>  
>  /**
> 


