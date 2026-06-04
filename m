Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC3ECD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+bE4ePjPb3qWVtVaIwDfwymqAPxdxhgtkWKZ9l08Hk=; b=vb7B3rLEIdTokDu7bctDBAoeph
	JSOYUjijBB386CgEndB4zT6vd2BN2SWVBRD1R5qY8LQX8HCxhON653eM4tBaTUpQqzoFBoZP7D9at
	LQf2QE5+dkiq52lEhf0I3zCR+HyxPfhCwvjfKxVyxVLmIZe9MahK+SuqyBZIZt8K05skMsfYZAQs+
	vKvvPJPPJfZaVgLi7by5fRGupEicWwFRpTq1re+43Wp0B4OU9MESixUR0E7qF80JbYybHmLJ2OyTu
	4OMaDvPIbYhE9zDaVsSvyGbbV7oI8O5294zFWNVJU/1aeLSJocIKtgfYU0BIhF8/+9VQNUgx2HNV9
	19iHViOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDNX-0000000HCUJ-3mCd;
	Thu, 04 Jun 2026 19:05:19 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDNV-0000000HCTx-0MQF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780599918; x=1812135918;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KBH1Br2NVnKKKUYYRhudJQCf94QExIE5CsaB9hSQoU8=;
  b=gKNj/MQ4iVVi9PaTJH/3hCEmdleTAG8gw/iF0EDZWJW9Vs/bYzxkKkqD
   PjuS4XYkUJGvsvejkcKW76dGW3OsLPdNOZCnGjsF8iYin2txc+IacJ78O
   cFyod2zJdoGgkWbuwS1XOWKIWg6k2UX9lxEE+/5QC/vggu2QDGn8ER/5E
   wWL4cyaL1YMujuRUGehFeeEPFt9XA/r8P19s82iYEGLgQ2dTEDtUXVHyH
   4xmQMG9cn5VQ/gA67WIhDFcczuVXrsmNqsRIkQ3AEIfoHrESSoJRnRJKT
   BWGAjQjeOh5gdFR7FdlFc+j6VINErBqMTPayrxrSxdq+vDTwi8jc1FZo2
   w==;
X-CSE-ConnectionGUID: yaAmZJrjQcmpATx7ZspANw==
X-CSE-MsgGUID: aHfSsH6ZTYqMZgYw+XJzzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98852393"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="98852393"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 12:05:16 -0700
X-CSE-ConnectionGUID: j1E7qhLsRP6omV63Eh70Xg==
X-CSE-MsgGUID: BjEBPkouSGWVU8vrf6gKkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="241644834"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 12:05:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 12:05:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 12:05:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 12:05:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjZZ9HXYdFCCyM8Xob4mkmRXGN72rN94TTRcKQk2E83lQmqV+igHh89bU5EjMaACWvhqbiC4waAPUoFcScRhzXGvHOS3JVhjQHr1TwYr5AzV7ZYfmD79t2x0zwRsqnGfvZWxSOSVkivZMUfjtRh7IYVaLTc3F/22pEtn2iU9TXRjBX7kgP+qdqU3k+khHzWH8iXGBLB/kTyhcrpeZPpYtIYPxvAbfQJlp+IzJc7876F1R3W1r2GITJreBfMrWHBaW9VZM9W3dzyu9WBQ3uERnX76/ZKNJ2AY1LmBWqXg8nVp8hFb441JJ6jQtfnvLqwSeJ17ugEGQ7UzPKlDwC6LZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+bE4ePjPb3qWVtVaIwDfwymqAPxdxhgtkWKZ9l08Hk=;
 b=q4F+4aAQcN6jIEYS1Ill9ERFT2I4AhQP+kHGlEzdfUufuI+a/2nTfkeZad9qHSkiubOTyfKk+9Jvoo/BNcIRllU3aO9xnxAGxPVzYfoNVtfM03rAfV36frSsfbiQqoey52MK33NVSuJOGd6z73a8eZUWXOGG4sCP5tno+SLw+HZjKDBHuwjzVeBYxGzjloK9PD3Fr88xuo/wNqpqittLbH/IbP15s5CeqKPtJI2SYVcR71S5sNlKdtto22ru9690qtsDvcRjumyVvVqMNVZBpMKqyNrU4WNu8T1vEokZPCriZ7w8V36TkcqoOm88zyt8gCv64TBlqEXYuL4cTyVACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 19:05:11 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 19:05:11 +0000
Message-ID: <65617cc3-5e3d-468e-a444-db7e839320c8@intel.com>
Date: Thu, 4 Jun 2026 12:05:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
To: <muhammad.nazim.amirul.nazle.asmade@altera.com>, <netdev@vger.kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <rmk+kernel@armlinux.org.uk>,
	<maxime.chevallier@bootlin.com>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|SJ0PR11MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: b456b798-f95a-4fc6-1eda-08dec26c33b0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: o4YG7ncJd/oejLnVXExB4jTkTO3ejGd8LOVxgl8nKY+z7STj1ckr3VPIW25sPmAnlyH4OLP85QDO/KHrEtOY1GbDpzKvhzZTU8l2lK9g9W8w6OILTIkN81mBbR54liq9AqKdZR5wQeCalH/V3M+Qb3Di8gXGtltv1oIGQ5bSLOhnvL/Sd5GAJ/wgYZZeP0VVA5ab+9gTNIUthqp99vI58ubu7j4Yba0WwndECctyZz4dGkOyqsGbMC4fNIa7mpSDZo2KW1LAxJmeLnBtiJ1kja26ScGqQWUuxOSnJZvf0eeJxuihYjMv+j9wahwsvpcz4Cq09pK5zTobvdiJmGSXdbxF/iKgTP8fYG6oiyG7EAm7Sl5mcVcT0EX4XnfpnloFOQP2xLhLoCHI8Ewa2nL6ZYJCU3G0ZsCd3H9Trf4dXQhChTPTauFx6Z9HLc56kY+JAXaPzTxsIwLo3PkPo+l/51/5/rCUKbeaFkfiUz3KkO52yM1CWXmTaL45qIChBDwchjweDoDeqpb7NtbcCPTuLo8ze2SHrXEkEOgnCIrlZL73eKAco7erBQHTx1VPInNWPPWd0qA0QUBbH06dZqRqdpVt/D2xhpTyzOta5iWRMKJCHGE/vt5PUbEw8DToiK/aWJr47b9JBBs9KuMNfiOXCa44dIPnQarsexncUGCcE+k6iaOBtmw1eZSXHCqty05D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1JMSkpwOTB3SzRoeEdocjRqNFJKUlVrcklMMmJaMVhCaWFXSUgvQmRSdGR1?=
 =?utf-8?B?VTRJYjl2RC9ySGJCVTlGZnRpL0U3OTlVazdGVnVIUzkwYXI5RW4vMFlCUW01?=
 =?utf-8?B?czdadTNKNnVQVU1jRkc4TndtbkFkTmx2aVVMVHpGMS8yUWJ5dlRHTnM0c2tP?=
 =?utf-8?B?Rmptbm52ZHRMN25vdXJLM1MwQjVNa3JuQWNtcTBDRWRIaXJrRkcrTVhXeEd4?=
 =?utf-8?B?Y3p1OUJWS0VaQklhQTdsZzZTdW1WWlQ2ZDA2NnI0akFzNS9yME1QdXRHL0p5?=
 =?utf-8?B?Q1JsWTlIaWNGOGM3NW1oV0trWm44QURiemh3bktySUdOOHNyT01RdkRBeFJV?=
 =?utf-8?B?MUx1OFZ6SlRhcUpGZGRPOWRzLzc1TytxQjd0UlhIenR2TFlDVUZKOUhPdUt5?=
 =?utf-8?B?ZDczREVDbnRrUkw4cmFhZVhMY1BwazhET3I1b2F2RG5mN0FLOXhxYzM2VlVC?=
 =?utf-8?B?aHUvbUp1Ulp2T0ZnNHhwcEhIUWZiaWtLRndnTlVtdVpkOHpnckJnd1g0RThn?=
 =?utf-8?B?OGpMSTNuNXBpamw5aTlCQVlkS2xXdkRZdzEzYmhKQXJsSC8rNUd6UEdsNGJq?=
 =?utf-8?B?YVBjWFltZ3F2NVZ1QnJHeUx0REE3Wk5JNHh3OGlyL016NnpsTkZKNllwOFZY?=
 =?utf-8?B?NzhNUUlMN1Nybi9VZ0o0MlpzcGZZV1dlQXZGY2hxNmI0RlhUWkhQcDgzT1BR?=
 =?utf-8?B?ZjdWSEN5YXpGY2xkOGw5N2V0Z0Z0NTdPbXlqMDNhRXg4OUVOQ09vUHRiazVB?=
 =?utf-8?B?UDkvTzg4OVZNMm9KQ3ArV2Uyb21CVkZ2WktSbUM4S1kxaUJvWDYwNFlmRUxS?=
 =?utf-8?B?cGtsTlUwUDh6TmVTTjZNN3JhZkU4NER1TjUrTHlpbkdFc3BXZ2NyYVFyb25N?=
 =?utf-8?B?dVJJNmJVVDJGRFNCMEE4MmVEVVJOM2NCTFF1S2dKNGVNNkczZFpTbUw1aXA5?=
 =?utf-8?B?U0VCZzJZbkxsNno0Q29BOU85OXNNUUp2a2Frak5jWUtHWW96c1p6ZWE1YUJI?=
 =?utf-8?B?cm9NbEgwb0llZCthdkhQT3drK0M2L3pYM244RDZ2THZlY0ZCOHJrdFljaUJG?=
 =?utf-8?B?dk1TdzJGVzF0QlNncWE5SVhpeTUrZWZ2MytGdmdGdEY4MmRTWVVheDhzTUta?=
 =?utf-8?B?Q2RWbmMzcVc3dng4NThOSEpQNEM5cGhZUUovRUNJNWxUQ0diMFlVRENlYlMx?=
 =?utf-8?B?a1h3MTRGeW5VclVIbXVIcnFIMnpHUUJzSTduQmpKU0RxbVFjd3hYNGpYOXBm?=
 =?utf-8?B?aTlTc1Y4YmFwZTYyU0lTS0h2TnRucllvY1dGTDNXN0NBMkcrbzZDbEdEeFRm?=
 =?utf-8?B?a3phd29lR284a3V0T3lscXp3aTh0WjlvSEhKcU5sNTVmVVFJWjkwTXJVaDVs?=
 =?utf-8?B?emVrSGI2RjdUL1N1RDYyNEVmRlppVmVSZGdubUl5Umw5aVJpRWw2Rmt6MTlm?=
 =?utf-8?B?R0Z5K1B3YXhHWXgyZFVYLzdBQ1ZWRE02WkZmYXdWK0RhcnplMFhQcGFYN0RH?=
 =?utf-8?B?SXplT0laWDlxaUQ4SXpFRDZNMDBvRHJnK09pUkJjV0Jib0swa1cxZkIvVmxK?=
 =?utf-8?B?bmYxb1d2UTNzNEhhWFdhL2g2eTlGMGNpOHNNMTd1cEJqWDk3WjEvR002bGlh?=
 =?utf-8?B?RFJvWDlPTGtpNlpTbjBuWmxuOHcxcVRIb29pS0NJMTBGZ2ZyWTl0dGRMcmlU?=
 =?utf-8?B?MWt1RFRNOVpZYnNxWkJFNTMwVlRxcmltNkhKNHVFSDB2UlFhMEtmU096RUkw?=
 =?utf-8?B?TkhzcVRiWnFKYjRuUTFDNS92YmNtT1Fhc0pXUXdOdjVoaEJHQzFJUllkbTc2?=
 =?utf-8?B?V2UwcXlJM0pmYTQxcmV6VzBBLzVFWnREZmp5cC84TlRpZGp2bFdIZXQrMG96?=
 =?utf-8?B?S0hxU1NzZ2pRMHIzcktnTFQ1akQ1dWZqc0pSS0F3V1E1cGc2K2t6RW80MzdE?=
 =?utf-8?B?OXNhVmtYaFVqK2tyZ1E3cWZ6N2xvcHBJZU8rVExnVjY1N2J0TFRxck9MKzh6?=
 =?utf-8?B?cHcxbmRhcE9tMTBXdWIvUTIrb1lPM1VKVzNvNGFKeUd4REp2Wk1hSWcwVHJN?=
 =?utf-8?B?YkJBZ2Qybk1JWlF3dWtwZXh0NlY3MFc3MmtUZUMwb1I4bmFlbVFzQXVrSWQ1?=
 =?utf-8?B?Rk01c1lVK1dadnZ0QzZDRzRpS1ZJUk9PNUdMY2hDYlFCeVBWdTdRSkt5VjVv?=
 =?utf-8?B?eHphaEs2czVFbVU4TE0wUnNObEZrOTQ3WUVVMnZzamNVV1VlMlBqQXFMY2t5?=
 =?utf-8?B?YjdaVXVJM0J1YTZYTm4zejdSUU11QlhHbGpWclRyY2ZhdVlIN3Y5KzZPSzBP?=
 =?utf-8?B?MFB3VHd5K090c1FTWVc5UEVQUzFlUVc1TFNTcEkraWwrZjJ6cndkaGxjdE1p?=
 =?utf-8?Q?i5nNm9PQJ7R32lN8=3D?=
X-Exchange-RoutingPolicyChecked: RxyKOONNo22bUqpnq4MXneVAOHeebN3gbBgE/DuNaPCIWsz86S9Oc2kt0KbDAF5PsTtieACBSBD/LsV45ne0c1FfHksrY1nS/5n2LuZ3bU68/n/2PVf+EWIwT1ASo4oU53H+rFBw1HE4i+KefsgEoh+npsRmJE1fptJEfq1WV2zqFDG4vUGEYg+0HxsTJJw49sRMePBUssTM5otXst88TUI6Tl0iTdJH0ONQNexaeq/TfikPL2T9tuqJbA0JAdZRowXEjGVX4kDeRLfirAfW3+E6XYrvtlIrXpu0SzMwNe//HkfWc1ytZaHNn+E4pL0ZntM+ReACMaYQ/jFb0O2vIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b456b798-f95a-4fc6-1eda-08dec26c33b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:05:11.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22MZcx5GsdXTwjrszNHAbBCUT7uabLgZM/j0sNuIs5ZKQQPemlNVNcyfBjEdoT8/oyljzss4k9HrmsnLFLAWcSM8y9ELhe/zO9Gb/P8w134=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_120517_183383_2E4C167D 
X-CRM114-Status: GOOD (  14.12  )
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

On 6/4/2026 1:30 AM, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Read the L3FM and L4FM bits from the RX descriptor status word (RDES2)
> and increment the corresponding ethtool statistics counters. This allows
> users to observe L3/L4 filter hit rates via ethtool -S.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 51943705a2b0..95fdf3133208 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -429,6 +429,8 @@
>  #define XGMAC_TDES3_VLTV		BIT(16)
>  #define XGMAC_TDES3_VT			GENMASK(15, 0)
>  #define XGMAC_TDES3_FL			GENMASK(14, 0)
> +#define XGMAC_RDES2_L4FM		BIT(28)
> +#define XGMAC_RDES2_L3FM		BIT(27)
>  #define XGMAC_RDES2_HL			GENMASK(9, 0)
>  #define XGMAC_RDES3_OWN			BIT(31)
>  #define XGMAC_RDES3_CTXT		BIT(30)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index b5f200a87484..6719ac6e395b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -27,6 +27,7 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
>  				  struct dma_desc *p)
>  {
>  	u32 rdes3 = le32_to_cpu(p->des3);
> +	u32 rdes2 = le32_to_cpu(p->des2);
>  
>  	if (unlikely(rdes3 & XGMAC_RDES3_OWN))
>  		return dma_own;
> @@ -37,6 +38,11 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
>  	if (unlikely((rdes3 & XGMAC_RDES3_ES) && (rdes3 & XGMAC_RDES3_LD)))
>  		return discard_frame;
>  
> +	if (rdes2 & XGMAC_RDES2_L3FM)
> +		x->l3_filter_match++;
> +	if (rdes2 & XGMAC_RDES2_L4FM)
> +		x->l4_filter_match++;
> +
>  	return good_frame;
>  }
>  

Right. The l3_filter_match and l4_filter_match already get reported in
stmmac_ethtool.c

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>


