Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792ACCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmOM3B6/fMyJClXESpVsWn1OAdqExUzsuIZkzBYaL48=; b=MU2324XKDZlEphB2x8rqPIvsLB
	I7dLwM1FYAb8nUGgUtMrsSLZ4elZumuX6wosa4I3P9xrX0DqdCT3bv3E7o348S6C0eZ5Tgc4B1lk/
	KIxjmaHggQU8epxoPXXBQMaqu7OQhtQg0Hv8Yy5V1DX4ZrkXLGcSco2UF29cTlxkO/a8sYCVWCil0
	6KofIm1Jlq0mnptwUpNiwS+AR/JID+D54RM07ETMMw+DA3k33bDt4Zvur5IAXf0onJl3D0/ezp/rg
	wo+9wW3f+m3/UkI3gAobiA5CQ5EobbokGHzritANj/2j1lG2U5iv784GBwE3tkj53PgBy2Kh8ktGJ
	uROjXUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLMP-00000004jqZ-2hne;
	Wed, 27 May 2026 21:00:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLMM-00000004jqC-3d84
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779915615; x=1811451615;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1iTVy0KZz4Zc8Nt9pKLX/oDtBnCMF42lhNA254B5zVM=;
  b=M9KX/nq1cCN50HdXEW42Cbfr6dU0Z1tcXkqZu5E5yVFyGMkvfamq8sQc
   n8CiLPapeBWzWg00/5AAtc4764+EjFUNeBVTDi85cVGLhYGph/t9BVCyW
   qHLBA+3cDFNQnfYAu4wMq+RoWHD7OL+rz8a2THEYaTUgi9R+lkxnGhjkp
   L6iqDGB+k3GzO5Os6vr4HCAP9rwiX54oU7JGOHfgdp8qwohTHqTtKSlWj
   t/ukYsADu4GX5laUCavgjORmu5p1HYmXWtwZfjyBB5j0epXICzwa9A2CL
   r5yjmwVyw1bGRsJekN6rHNCHavaoxsBQvHir9BLiE6Oh2ZTYEHxOWC1RO
   Q==;
X-CSE-ConnectionGUID: CG0nSgkzRQSQOMygC+MRVQ==
X-CSE-MsgGUID: GIeWOVWgRw2torxYRnS6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103432373"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="103432373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 14:00:13 -0700
X-CSE-ConnectionGUID: iwlTqQxvTxGpRmy5/+eNug==
X-CSE-MsgGUID: WciRI5TxQxKoZrVW5F6mog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="241318379"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 14:00:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:00:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:00:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhPsnJ1Xqp6PLxooLktnBMpG0CLT6T9nqdNcO5Eqjqfb5UH3wvtBVRkECoKpHMZJXaBDqQo5K40l4Gwplv6hFSQLiz6DlrKaIdH6KN7aieYgLbkBfP6KDe0i8hp/yPCwq7mOkhdixJz0FM3arV42z7PrMhpYxliLwP4yv0JdO4dc2Wlz+5k+PV/9LvuPePNzOFmE1EILo+oEBdRn8ny3CxInLSbWXSj3rwejVqq08JptMDKSNaptoV0NBmMPaHDRa8BHiYS2Z6HXLQmsbFcs1CUxHyYdHdThya4QwsyrC8qmcoKly6I+yPdXqfhxtKaeygxi9wGvvpt8xo+KzThIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmOM3B6/fMyJClXESpVsWn1OAdqExUzsuIZkzBYaL48=;
 b=XJVaeL2N/J2wcfrFwaNMmLn3Cn9/OGrElhkHyR78kCzAbp2R8gv8l97SGbnrPt4g8oUufEN4Zg0hr25m2+kmE4ohiHZ3Mj3SdRq17AXb6hTzWdG7y7F+GdkCO77RO1FR/V1uLJOE4jYs8acQvSjH8YEE093rmWzoZtXB0WxBJ7lQSMzgFuOtEZd+YEahW6DVbLYWiZ1bREavR6WETJWXRxCqEiW0aB0Qv2cGRGQV+gTsElO13/7+sIe8biSSSGgSHnZYxov1e2g1lhIE86d3bIlKS76MaFYuKsDwLnKZUO2yuAIO5+HxsdC4sFqDEkSxIDU/+qbK2XNH9lf46nNBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 21:00:06 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:00:06 +0000
Message-ID: <f6eca916-72a7-44cf-bdaf-4a4a06294023@intel.com>
Date: Wed, 27 May 2026 14:00:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: stmmac: Improve Tx timer arm logic further
To: <muhammad.nazim.amirul.nazle.asmade@altera.com>, <netdev@vger.kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <rmk+kernel@armlinux.org.uk>,
	<maxime.chevallier@bootlin.com>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|PH7PR11MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: dcab46b6-7768-4f51-134c-08debc32ee1a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8eLSJuRKBXnfosyUc8tVM2EOLmSzpyucC5DGBcXDXEsZZ53mP/DGS/LdjZIDAxzQgyOAwW7eBaeV5b1Lp8MuN7tihYy2Bt20sxw4ic7vWUzb4DHGBA+pxL2dg8/Npnv9WurdslEX4zjWXIMTOa0FAendVs5XEk2RhrLG28eC/k6mE7p5ZKsLV2fMu18s9MT0gKIa+vjl7rmKGjphVBD0ZqBzPIjEZhuckPV93bV+hPIKFL2J5PeG2Yc2b+1/+qB33B/zugtVB37RQurHV8qdJWm7FPrIcUGOSBw72AfJlyw22kD5zgQEuivO5R8gIG9jtuopSS3j6MrQJZDhZg7DZD5pD97sbZuG+ZYWdjQy+o+5lpBTOpDTDLTH3cwotEUzYFKOPlHGY0aOjr8Jnt2rD5Uz6YKoi763mcMWuqJrtB0hJ2h2saAdFdEfZcmHj/rRuo/jaFKQoIoBW+dP8EN4wxhLotGfJIenxRkwOyayA9qRIqZcQhcs6t8QXrJkxVQ7rK6VVwtkvC5DerHIEOqFJD58zDfVqF2PqeO5UAftBtLra/qE9JW/WlfMbTJgNcLR3WKakbjpZ7twMWGObfIkqwmmqyvUJKQ6o66UdaoB7bh82X2/b3u0nECDppMy2WKXyzM/MC+HsLwZXP/mh5oRlQCqVZijWBNwdHC1oavUSNmp1zV5scJn/f+tNsVe5OYj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clZGNnRRRHd2eEpzbnFQY0o2aVh3cCs0UGFuWHZFT3dVNmxPRUFQUU05bGxH?=
 =?utf-8?B?anYvL0lkcGpob0FhNzRqSGRCR0RLcG84K0ZkM0Fna1B4WEdXbW5ReVN5dXZH?=
 =?utf-8?B?T0JwWnJuR2s3YlJhc2ZDblVRMGR6R1c0LzFrYVhXeGk3OStlYUllTW15dWZD?=
 =?utf-8?B?UDN0ZVh1NGtSeVpqMTBkSkdIaXB1aEVCRXRzM0tqWlJnSVd5cHhvNXlKRjA1?=
 =?utf-8?B?UkpLTUgxV2RKK2hpM29iMlIxK1daNnhsZTRmNFNaeVZ1eEkvZWFxdFZITnBX?=
 =?utf-8?B?WHg4NFd1NjlCdnE2cWlzMDh0M3V4V2ZMOEtrK2VNRlZ4Yk42dWw0YW5JYVZX?=
 =?utf-8?B?QXl2SGQ1YlYvT0hhRVJlbGZzNWhBSjRkd1J5dTY4QWZST3FLN3ZiTWdrN1ox?=
 =?utf-8?B?aFl5eGliQ0daQ0FvR0FtRVU1amc3NmlOOTBkb3lsSkd0NzRGb0tPQ0JrcjNX?=
 =?utf-8?B?UGdNQnFYd0JsdytCUkNqUjlEemR3bDdhck9nek9HNGd0Qm5TTnV3VDR5U0o4?=
 =?utf-8?B?bmlkWGNIdVB2SExseWhpeit3cVVBOWtaWEVVT1ZGNWdZNGpPaDNDajFYeVBR?=
 =?utf-8?B?VDhicVlHakJwa3B2WDJndS9EVmhSU0QxbWUrRDk5QTBiZENPMFRHTGhMQ3hw?=
 =?utf-8?B?TXdIQU5BSU4wcnUwV1ZpeWxpYm5tZkJ5NkFOcGlxeVMyTkR2YnV0a241cDRS?=
 =?utf-8?B?N29JWURBOGt1K2NDZXU1M2NCaVhCNW1lWXhrZ0NFRnlTRk9Xd2lENHZSMTZP?=
 =?utf-8?B?WTNaK1czVkFBQjRtYUszTHMxbDlnKzlCdzdsVjdyMEg3TW10cVRmaDJrUURR?=
 =?utf-8?B?U1VleDRiM0lOUXArWmZEZDh2ME5IZzdtckZQK3Q2U2F5bUVVWWo5RUc2M1FF?=
 =?utf-8?B?S3l6QW5Ja0tPa3dMdGNOaENpaVl2bEcxcVkrcXRITUNsaVJwU3BjMmpCVGUv?=
 =?utf-8?B?SDZLeklUL2IyZXR1QzNBV081ekt5UFhjOEZ3WVJRZlBTMzZYTHlLU2h1bFJV?=
 =?utf-8?B?OE9iZVd6b0FzR0NUdlYzSWpzaFpSS1R4T3graTNnNzRjcTRxd3dWRXc2U2V1?=
 =?utf-8?B?Uk9MYzlLdkdFdjlaK0pDOWMyVlhaNFBDWVNQWjhzYU9MTWlWTWVNaUZUYzhp?=
 =?utf-8?B?dm9UbTc0S2RLOHIwY1NuZ3NtQWJMNlpvem02cGJJN0lNZFAyak12NVg5a01a?=
 =?utf-8?B?R0RKVWdZYjliVTBlc2IyZDR5VnMzaHY5SGZ2UjZVY0lLdXByUm1zSlVkQkxX?=
 =?utf-8?B?cmR4UkVIdWhnS3NLUHdJQ0RjUjhIY2JoeFhTeHFtZ0lncEFJZXQ4L1ZWdTdE?=
 =?utf-8?B?MnhtbVJEWHlnakcrZGJIR3BYVzJjUll1dS83Qkpwa09UTWNUakQvd0J1ZUxU?=
 =?utf-8?B?b1FtQnRLN0swTTRhMDh1VVBQa1VVRlZIaHhSNVZVblFqT0tqbloyOFhXTW5r?=
 =?utf-8?B?NW5hQ0o0TTJMdmtQQzBiUXNTaG93WU9qdXlzbkl2eDd5M1FZeitlcGtMY3N4?=
 =?utf-8?B?cUJqVmZJQlNCR3RwZFpSVDVhOFdvamRmcWFmUkF1QXpzeWhwWHBTZWhVUjE5?=
 =?utf-8?B?RHNwalUrVGIyZnJsRCtxZmVmdDN5QUlRck5PR2hsdTlVbDl0TTBvNDNtSmkw?=
 =?utf-8?B?QXlIM3o2V0duWHpMNU43MFBzSW9WaE16U0d0Y1JtaTM2REQzTnJmSjV5WEhQ?=
 =?utf-8?B?RnFmWkNDR0c2RzhyeGlLSVR4MTY3TnUvZXhOTnZWbEp4cmc4Ui9XWE5zY3I5?=
 =?utf-8?B?eGxKYURUZTRDbHpaK20xTWVMNWxDTkk2UGZlTFJsU0UrMWF3L2M0QWQvN0dt?=
 =?utf-8?B?YzBXb3RaQmRmYllkVWdFUHc0NVBDdE9ySVlmaXR2WE55cEV0ckpzcDk4WlVO?=
 =?utf-8?B?eE9XQko0MlNQM3p5NUU5V09zVllINHVFUjlZSzQrdUZjNEdzaC9ycGJSdTRD?=
 =?utf-8?B?MWgwQTZRWlF4cEg4b2NXSWl3aFZkZ1lpK2lrTHZkMHg0N3YxNHlxN3QrTFZU?=
 =?utf-8?B?R04zTGQ4UTkvNzY2QXViKzNvcWsvd2c4TlpUeVV1MDduSXR2MmszazhWYTRL?=
 =?utf-8?B?VGlnTjlHeFJ3Mkx1QU1OZnR4NUxlQy8xT0gwQjhzM2swNjBZamVZWGdxejVT?=
 =?utf-8?B?ZW5rcyt6K3AxTzdkWnlHSkZtcVFHUVhjN1NSTmdub2QrY0F0NVI5T0xVd1N5?=
 =?utf-8?B?VmZQYzFFTWFRK2V4NVJmY3RFNnVDZGZRTmxQVnZsaDl6cnVpQmdHaWNJUHA1?=
 =?utf-8?B?UVFDK1o3eHhOYWx6YTFjNDZ2N29ZYjFkdEJFYWJiT2Nwd2htdEpTNnhaU1dj?=
 =?utf-8?B?a1dNNTNrT2lkdjhoL1ZFVUJVQmlZbFNtR3laQWxRMGVvNmljNWR6QT09?=
X-Exchange-RoutingPolicyChecked: J6Wo6Gmn6uy02d7CbjMsnQR7WXXXhSaFbGDZIhsFwQcBwHWlL0wUEGdUEZKlHFMHw2+JFLYNTpUP3Gm8jy09ExMpiUYNkFUwvFJKmU/r0B2CGWJT6CyoQK54R10pja/hvjONBjpLfgOxcPLLO0QVUZAaw8UBhsEkwkxWqz1o+g24Oj/NvIvwLtYRgsZToC46uhDjursU+oV16dUbPAlfatNpOBem5Ze0QHpCRcAbfUFcJ5C2cTYd14XXzn8IgNZ7/kvSdXR7Kwra0aUKlrquFHNUPxSZDNWRiXq4O71TaR1YUYFh4pNDuq6y4JJS+BvZ0VVKJlKYRVppFbN2+ZpWXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcab46b6-7768-4f51-134c-08debc32ee1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:00:06.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUZ0cTmTHFSFe9U4QMroAVkGRIQuK6v7lUO0BdhpWkrmFQi8o3lTAQR0WQt+ELlSaRaFkLllVLFtwDGCyh9c4kzTA008nLbx6YbxCih6O7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_140014_955526_860B3613 
X-CRM114-Status: GOOD (  21.62  )
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

On 5/26/2026 7:33 PM, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Calling hrtimer_start() on an already-active txtimer is unnecessary
> and expensive. Skip the restart if the timer is already active by
> adding an hrtimer_active() check before hrtimer_start().
> 
> This avoids redundant timer restarts under burst traffic and ensures
> NAPI is scheduled within tx_coal_timer microseconds of the first
> packet rather than having the window reset on every packet.
> 
> There is no race concern: hrtimer_start() is internally serialized and
> safe to call on an active timer. In the event of a race between
> hrtimer_active() and hrtimer_start(), the worst case is calling
> hrtimer_start() on an already-active timer, which is identical to the
> pre-patch behaviour. The meaning of tx_coal_timer is unchanged.
> 
> Performance on Cyclone V with dwmac-socfpga (iperf3 -u -b 0 -l 64):
>   Before: ~45200 pps
>   After:  ~52300 pps (~15% improvement)
> 
> Additionally, ~10% improvement in UDP throughput observed on Agilex5,
> with hrtimer CPU usage reduced from ~8% to ~0.6%.
> 

Nice improvements! Appreciate seeing the data here.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> Changes in v2:
>  - Expanded commit message to address race condition concern and clarify
>    tx_coal_timer semantics (Andrew Lunn)
>  - Added performance numbers to commit message (Andrew Lunn)
>  - Added Agilex5 performance data with hrtimer CPU usage improvement
>  - Added Tested-by and Reviewed-by from Maxime Chevallier
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions()
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..35da51c26248 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>  	 * Try to cancel any timer if napi is scheduled, timer will be armed
>  	 * again in the next scheduled napi.
>  	 */
> -	if (unlikely(!napi_is_scheduled(napi)))
> -		hrtimer_start(&tx_q->txtimer,
> -			      STMMAC_COAL_TIMER(tx_coal_timer),
> -			      HRTIMER_MODE_REL);
> -	else
> +	if (unlikely(!napi_is_scheduled(napi))) {
> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
> +			hrtimer_start(&tx_q->txtimer,
> +				      STMMAC_COAL_TIMER(tx_coal_timer),
> +				      HRTIMER_MODE_REL);
> +	} else {
>  		hrtimer_try_to_cancel(&tx_q->txtimer);
> +	}
>  }
>  
>  /**


