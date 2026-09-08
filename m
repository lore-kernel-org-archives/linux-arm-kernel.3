Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44263C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRFnundmnvw8Tcw3TG88mSa+ecE9Z3jj1rQoFQF8Nmk=; b=qHN+Z81+Q1bTI30LuJoOtKLt8/
	6ZTrVgNx5H3SWf+3sxg5BdLTCKdumGt6Gh2M6GdayT++RqzNTLg1di5oKhpBjGXFII5+UeK9OErzS
	1JPWBO684OLDe8ZqvmuFPKsizTDZW6/+Ar7+CCXL8H5Y5yL/yzxfTTelXiOjC63DSh6bgVR9nJwRI
	dHzQEDCEr8uVsUBjRkePGXG9AvkGs+GCh/rYOTCFdj8yynE7NPKJ7yLJMgElBO5O84g2iUUCdSOTX
	pKQVawj6K7/7Np1FEtAxOQIa+dxi7lDf1QCw+94LctgXA/naZUye5rQSWZIaBRKbfSzVMCBCwg1rs
	tuRX91CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4024-00000009uFV-2hFU;
	Tue, 08 Sep 2026 17:54:56 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x401z-00000009uDQ-2rJN;
	Tue, 08 Sep 2026 17:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788890092; x=1820426092;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zoXUhBnc3DdwNLbjAQBwultoDJtEhLPky7G/ThWqCMQ=;
  b=IKHk1Q1ilHee8kbUBZlUO3lVJkLnYGWuO5hZxqyzL9nKqLQ9NozlZNAx
   BK/95/DFvUBRehMeqoOinaxl4lKaOKCFXpa2eSGY2G3V1qoNyAmqDfKYz
   1GwEx5wKizAzUB1bbiLTEOXnVcrxBcs0rUN2v61rubn9pkZ3+3yAyKHlU
   7rJAoQEyN/UJfHoTU8w5zW+uUmMYJxjRYa9fLbXfxqa6TV1Jcsj6bOchq
   5sxT1xRccUj44LrY1GYW/GHwgCe+MmAW0FTOkVsjiLxMmkf5Su4ENy/+R
   F4nylvU1q0B4ML4vtcgVDtc9HMRhP9XBlfRs05ZXFBIRnOhHC+eIPM4gM
   g==;
X-CSE-ConnectionGUID: 4ez71AG4TwWlhPeIbirElg==
X-CSE-MsgGUID: H9LoMondTmubabr8m+1SXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89426733"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89426733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:54:49 -0700
X-CSE-ConnectionGUID: kr1mFfL+RnWK648hD9JXRg==
X-CSE-MsgGUID: hxlRk965Q1+pUI0dQrQ5yQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:54:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 10:54:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 10:54:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 10:54:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9dKD25KV/f2rHTXewEaBFPKinjOrXhdrgIKGyjihx6HStX2OJUg5O3BNEPOe3p7sKw+XTN7x08YMLksRc6yY8eU57ZfBR+pYiZT8SivstnaqDYVWCVKBbwzer/7wG1cAppDhlG1d35pBa3Q6R/kG5779GZLGA1nUT5nRs17TNZBzDgWdYufDmRY8hCT+htP5g16B2d+YJDvadw2w3N8S+al1g61hARcq4cU0YAFYsYyq1esiK3QKS5jJp4HqGo+3MMjdTMl1JV5/psL+tSLvVjXUtqI5CbXgGNLvdzmVK++IxEsKcQ0Lv469hnom+U6JuweiB7cBrItuDusz2/Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRFnundmnvw8Tcw3TG88mSa+ecE9Z3jj1rQoFQF8Nmk=;
 b=xf+F6CdF46VLMoJEuZEQbSaFil5mVhUSxXfTlLw1qkd6j5YhkMY4rXsp4X9povy70MSeftwmbTucPTsEtNAZhNDnVFaeuOq/ek+BSxrLbi2GJXt4XPAuE7MPiOCFKLdreX5FsL+PDYU1dO8WaWpsyc3HKFqCh7YCepEDBmQ9B4xQk+7IBPma0jZ6Kkt/W8rNzsk7ES3I0P9wkFFhoqYjnTI+yOOkfMqF8Wh134FN+5geGmVnQyNurg6SChi41P8vl3gRay7D0GvHkijx2wOxgH2u3eY83RMrZmN6VVIK4y5W/cXOtUXVoY4g2iaA0M4vGB4/LiONwJXTi8AOmgHCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 8 Sep
 2026 17:54:46 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:54:45 +0000
Message-ID: <819ef36a-9ed2-4ffd-8154-c467e57ac32a@intel.com>
Date: Tue, 8 Sep 2026 19:54:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0157.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::18) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SN7PR11MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: e190debc-b0d8-4da1-036c-08df0dd24484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: iPwu0TdCBgxRoUV2dbu+V4Hy/XwNFPLwiSCGHuVIUG0O0NZNzXygxPeMcaMw9E/MstgRlWwU8QVZJc/DMLHecgC0WPfz+dJA3Wu9gapqWYVcyiR2VeFu2fwk9gPIvl1es0dDeMcvdyupaH+L/q30cSoYLBbDkAhk89VO93Gccv8880YdHGLdKQQXFrqVqzMeb3XqldT4y+kxQsDZjABUyG1QEBP7q7I9S1f25eAHDascwbqTR78GcsIzPkJeAYVXCldfj9Ozd2HpjJRMN02EBKT4Y8gOSLkxBXmiw+LJkGYjD8ISdXYCd/dQJDEExHDDkLBuzp/hQTtc14cch0K1HCmeV5gWJcRF8oUcKr9tdF7oeNOp+GAZWsbon05pHvm74gcKbJHHdF/v1Oncz8BtmIzm3czvUnHuLis6ICp3AqOycCCFuTjrc2Q39LN7XVCCofGzLo42cnhjA+xWYgGsLF3MngO+yZBxD0var3xNAs0WdEIWLd2K8LwR8dc3H2gk3Fge3tIgA/8xJ9bQETcrkBVg8voxfuSeiNhZoAFtKpziH6J2sXsU3gSkgLDKlgXiuYRARNU9aS+G8bJaDrJmdqSK5ENHBNJ+qo9NyZME9E4lWTS3Uh75S9tY7bNh7k6NYCZtRCIlseLhFvXVUbnE9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpuR3ZybjVnODRhQTNEVVYwZUVrMCtwaGNEQ0dqL21FN054ZUEwQmpCdnJ2?=
 =?utf-8?B?bDVSd2ZhM056UmJjZHdrUmlnSkkrWHp5M0gvU05ucTRNajRJcFIvRUJORTRp?=
 =?utf-8?B?bHU1aXExVWwzVDNtbFJUN01RUUZZUG90TTFOL0JOZGpUZmdlMitXZlkxQW9U?=
 =?utf-8?B?QUk0S2diQjdFYThkS1h1cEZWTXZ4NE5GM3dGOTZNUGZzUkJoMm1MQU9WS2lm?=
 =?utf-8?B?N2ZqRkR0K0RFdzB0MW56WmMvVDk1UTZ3M2dwaTlQemVvR3NjM3RaN3EyQ0w3?=
 =?utf-8?B?eWFFeTVzeXpMc1c4aGJqbkRwanBaMkZnWHhZci9PQmZoQitDaEVFMTNYblZu?=
 =?utf-8?B?VmlLb1A5bGo0UjNjc3NrMnVkNXVhRm5QU1ZPT1MwcjFaZktucW9iTXA0MS9E?=
 =?utf-8?B?VkFNRVBzQmJnd0I5dVZ2d3hHaWhiR05LZkcxR0VTY3hLSnFzejlYMFpGRHFV?=
 =?utf-8?B?UmovR1hIOGNoZE5qa1BjRnEvS0pVYjE0ZC9QN1pIQTltSFVPR2pnR0dlNzYz?=
 =?utf-8?B?SGlBZTAyNVRIdWI1NUxCWkFiRmdkOSs3cTk3NERoa2FsdG9BRGx3aklWc0hH?=
 =?utf-8?B?UCswL1NnUlpjWUhQbGdwQ1VEdUF3VFEyaWFLMFk4Q2U2d3o1N1Qya3IzQ3ZZ?=
 =?utf-8?B?Zmt1Q1ZKWDJPeGZMRk45SWk1QzlmQmt6QjgwQzhmNXY4UTFUc3FaNWJTNzBa?=
 =?utf-8?B?UksrVm05REw1NVF3Nk5EYWN3MU1na2NLU0pjci84dGdpNmNZTXVnVnNrcnQ5?=
 =?utf-8?B?ZE1tcGN0NFhaM29tYng5STlZWHZ1TVZyWUVReDIyaFE4K25Tdm11T2xWYmVN?=
 =?utf-8?B?c1pjdU9abEhJNFFQanc3TjBXMEVoSlc5WEJzTUhxVTRKb1ZqZTk2aDNWWmUz?=
 =?utf-8?B?aitRR0RDZkM0RUZWajQ1UXlpS1h4WDIxQmRXYVhoQWdDSXJmT2dLTG92aUsy?=
 =?utf-8?B?TkVnYVBFWUtYQ2JKREtRbmRrWEJlR1RsclhpZ1BpQ0JjYnIxSTI0VUtFSW5n?=
 =?utf-8?B?anBvQk9KdHd2N2plVTA1L1lLeXJpUHVkTlAybkZmMklrQzJuV3hZV3RWdFFu?=
 =?utf-8?B?ZTBQN1F1b0JzanJLSHNPSnI4ZXo0RVNDWktqMlRWYXNsRjJraldOUUtlSWFm?=
 =?utf-8?B?OC83QnJrRnpXM2FZSWoxK0UzWnJxYXJybWZLdDJOQ0lXWFZ5dWRDekhPV0xw?=
 =?utf-8?B?WC80dlJKZ0VFNEtxVUE2clRodi8rTXBOWnNHdUFtWjY4eDY1dFhwWENHMk50?=
 =?utf-8?B?d1lZMXhkaU44Qm40S1JscDVUaERtNUFUOTNJekFpTU9MNFhHd1FiWFhiZTEv?=
 =?utf-8?B?RWQ0QTJZblFRcFV2RDRNTGdSZXhvdjllcHpBczJMekdaYjZ5L0V3TG5NNWZV?=
 =?utf-8?B?azNmeWJSbjVXOE84YmhNUzJ0am9oSkxmTlNCWjRqc1k4UG9uZ3ZOWlh4L2JW?=
 =?utf-8?B?aE50YWl3T2pyUjdqbzEzYy9CbjQ1RURCbytDOWdPNXlaM1lsaVd5L0pQQWZm?=
 =?utf-8?B?d3BlUXFHRURITFVKaUJ4TFE3MU9Vb0ZHMEVEUlQ3dGVoWnU2Y0Q2NFU4enlt?=
 =?utf-8?B?eEZGUXhrR2YwemVRZmhZUmpxNXcvdzloOTBzSm9SYkpXYjQxeTFzMHRaT2da?=
 =?utf-8?B?bzgvNmU5QjFqREdZdTh4TEU5dVNFNG9mK2prQkd0NmVJNWwwQys2Zkc1N0ZX?=
 =?utf-8?B?WHZodnprdFllc3hTanpPV3hZbTUycDU5MmUvMUlvOUdwclJzSUpuM1ZhQjN0?=
 =?utf-8?B?REZkTWcrT0FCd0duNXp1a3pIYkZQUzNXWVZSVDdLQldta0tDWWQ3QzF2MUZ4?=
 =?utf-8?B?ZlBhdDVTTHJKTGFLeXJSbU5yMUV3SGdicnJxOVRrMmtORFZ1TlZtVnVhaTk5?=
 =?utf-8?B?blZqSVJRTGd2Zm9XNVJWQVlaSEk3S09DNEgzZ1VCN0RtQ3ltR2dickxUdSta?=
 =?utf-8?B?bnhlM0tDQnRZSElkTERyeFB3Znhoa3MvdUhaaGhqWmw4aktERHlNOVhyc2U5?=
 =?utf-8?B?aFNadXdjRXZycE9HZm03VXlkYU5mb0h0aGJ4UEgrS1BaYTZlbHlweTJ0aXJK?=
 =?utf-8?B?ck5CMzl0eFZxNjB4eE1TSWN2MHJUZUE1NGNWWUt0clVveWQxM1d4L2VqeGYr?=
 =?utf-8?B?YzZOUHdTM2VKWlprTVQ1cFA5QlVYdUtnQmkwN05YZTZFUk5vQ0VwN1dwbmcx?=
 =?utf-8?B?S09CczlRVkc4SWszVHJ5VmMybkdOUlhncGtIUjlvSjVVM09YRW1tN05jSC9a?=
 =?utf-8?B?bGdoejFkRldLdmZHbEVsOCt4YmRpUHZqaEoyV2VITm4zdVJNcmVaVlNlTnVi?=
 =?utf-8?B?L2ZxLy9odE1ORTN2QzA2TFlKUiszM0lJQ1BQSjIzcVBQZjBSTVhjQT09?=
X-Exchange-RoutingPolicyChecked: numG/GR+Io29EHtfrcITYqOtcqAfen8GiFL5JtSiz4iw5nKnp34GIF1p0FvP7FMpgGXRASqiyqbB/ZzSC5mwMKCaTMa+bXU8PmrpQERrsBqWElj4FbshAbrIOK8H4VKE56ClTwCyryeCQJeoyZq5P7sFyIDKJOyqu+A2FGd5wkswbsoOZp9Pyk4zb+Y5R4fB/Q8NxZ7cqyGQAe47iznajo4004akjDglbcwz3jj8hfIIVtUzHyK+wIyoVaZJ42hzv3RspUpBAnkZ2eWy5gsr0ZTGrYtJklrVuMaySN3M3b11eDB2+r5nONQy4RoWkPAhRV0yo8bqwciGk7iqy/hzqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e190debc-b0d8-4da1-036c-08df0dd24484
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:54:45.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUc/W5dJiWSfIiigvyEjgNVpQrRY2yi1Y3ti0qFKgq1wdpT9mg18uSE2kF453AwjH75DbL28RW1INQPU3RdsDT+8XgUf8Eq7syrQlTMF7tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_105451_785619_FD3EC941 
X-CRM114-Status: GOOD (  10.84  )
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

On 9/7/2026 2:03 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling in several parts of the MT8188 AFE
> driver.
> Propagate errors from clock, regmap, and runtime resume operations,
> remove redundant probe error messages, and fix clock cleanup on
> registration failure.
> 
> Compile-tested only.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (7):
>   ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization
>     errors
>   ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable
>     errors
>   ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
>   ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
>   ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
>   ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error
>     messages
>   ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
> 
>  sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 115 +++++++++++++-----
>  sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  34 ++++--
>  sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  12 +-
>  3 files changed, 113 insertions(+), 48 deletions(-)
> 

Yet another bunch of welcomed changes though at this point I'd expect
someone from Mediatek to participate and start testing the error paths.
Some permissiveness might have been intentional but we won't know until
someone from their dev team ACKs or NAKs.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

