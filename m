Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE99F4BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 19:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTIXnQkO0EUyiclKtGseoB31NuTuNVtBBs3q3W1wEf0=; b=0TCHUe7jCWnxgE0kyQCdaywY6r
	q81c0S04NqPLwMSfyAEeU+8/72Cyoqe0dKCdnnDmNWafcQpELtTTF/3snzgILY5NgNBLkU87IjVu1
	tYFXfR5V0LVQ4YR5mDcHbfsxXi6JmtGSUpjYV48MLBIgc8WCMS3fV9xWzcODrY8kt0bXwW3F1xHvL
	Ls/pPDhFg9yFl/NBrj7YmXSvlVJsCmI/f2KtHTRfCD8XQ6bdJrsCCOS96XNoQpLDH/n+AVtqyRyuU
	zENvG7KHxfJc5L2u23LHFVvcpy31epwcq4VGXew48IOieZ7Kv90UEk+GA2sE2rbyEzcQY0apPnzUP
	06u7nM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuyNX-00000002i1Q-2Ves;
	Tue, 24 Feb 2026 19:47:31 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuyNR-00000002hxu-1Hld;
	Tue, 24 Feb 2026 19:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771962445; x=1803498445;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bTIXnQkO0EUyiclKtGseoB31NuTuNVtBBs3q3W1wEf0=;
  b=Z/tQwtJj1Lcb77oNCxulW7Nh9JHe42EbIGj0wPo6kZ4h1W3WE71LgPIp
   rnNC2emTUN1FY/wEyQO4+DzWVxLSM7eFhQP5rA+e72M/CEld2hK+dWrCg
   pq0cVyEhwgyToj6yKUu+ZafrR4uRqK9ba4IiN9YYtz9CtAn7DK8j+2KOY
   MpUqLGaMtMm/tBxXhFY1+bIKKYBl3IqZhJgncoVni9O5b4W2DMI97LXwX
   LdCat7I7led6wZOh4FZnwP1+vgNo0yHuRPCT6ZNt0gUgrkMbLuNBvutyn
   kubPTAVDiB5GKO9BQX7JdIiM2WJCFwsjqC5XWHFLxFxTC/vDBP06EJnCz
   A==;
X-CSE-ConnectionGUID: OCsA83BESU6O0YTUAlGqbA==
X-CSE-MsgGUID: rdOfkBbQSGecxLKQvKA91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98457359"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="98457359"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 11:47:20 -0800
X-CSE-ConnectionGUID: 4go1rJmMTaO6v8hbbEzPQA==
X-CSE-MsgGUID: XNSkXeanSl+RkTdcP5NNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="239008740"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 11:47:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 11:47:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 11:47:20 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 11:47:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixf5lVppHWPCxbRV2LuZ6o95LxRBV6gfpuUoH4gcjYX9L7kAXAQ1t7Lu0NmlIIscr+Ooqjg1TECpmfhwCbOTnAOj2DCJIvpdZxREeg1twfBfKSmDDEyiNYvXTe+d2zpMJ4rZ+gc7VKvhfDqhpsOQATDMvkGonrMgTBh6iwMHrU2PJo3LV9KejEuwDV4Yg7MsXqu9m15ZmR2JjntlVItdndI8+k1+UzsKgIwUyfeeSY5gorm5H6M+KvWmjTzy5uJ5UsO/Pk9sezCiWp2bS6lcHU/SZsYTufHCicbyAcKL5QyOv9jPTJqGoaOlup22aznTJuO9PB9cIE/KuFYvT8hMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTIXnQkO0EUyiclKtGseoB31NuTuNVtBBs3q3W1wEf0=;
 b=Cwfbk6QI+zp+vAqJmL9SUoBRsUa0me/uFSFY+ZKwWaNg1dBQ+OKYdRvAHBqrcNZAZsz8lyy6bqwTRVEH1Ov90n3v5lygqzfDocXvtkohNeWEKZpEIL/6vFGKL+ZQP7MJBSd8jnTSw772QIaOcunS7lMfqgfkiiP46v+mnVI0WIIBZhN+bGHLxGrCw6B11zFD6+hs22YzW0quFnfQQo7QME1JWgTp3JBE8JdyhsCBKV1LBvoVI0+/pIwc1uYl8Sq99INlAknCwxmUy3HjO4cxwKcUG2mRVlTuoe3o205HeQbT9kBZ0eIk5sZaJGsigF4Ko0bj7axm1JI7eqtfPrfllA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB8863.namprd11.prod.outlook.com (2603:10b6:208:598::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 19:47:14 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9632.010; Tue, 24 Feb 2026
 19:47:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "david@kernel.org" <david@kernel.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "debug@rivosinc.com"
	<debug@rivosinc.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"will@kernel.org" <will@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/5] x86: shstk: Use the new common vm_mmap_shadow_stack()
 helper
Thread-Topic: [PATCH 4/5] x86: shstk: Use the new common
 vm_mmap_shadow_stack() helper
Thread-Index: AQHcpbc07Qk3kE/tlk6u6MWGRKebYLWSQU+A
Date: Tue, 24 Feb 2026 19:47:14 +0000
Message-ID: <eac72941ab8d9520cadc1b98bdcfd7e5d2ef14ca.camel@intel.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
	 <20260224175800.2500729-5-catalin.marinas@arm.com>
In-Reply-To: <20260224175800.2500729-5-catalin.marinas@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|IA1PR11MB8863:EE_
x-ms-office365-filtering-correlation-id: 23946de2-18a6-47e6-ed58-08de73dd8240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?S1lEZkJZT1pScnJITU9ubndkL1phb3I1ZCtKTDdUWUIwMkxtRHF2M1E4Vm1N?=
 =?utf-8?B?K3J4VmovcFJCYTZRSFFHWkg2aWdQbVZmdC9ocmsvcTJPblljUkRkakZlQkU2?=
 =?utf-8?B?anI5Z0xGYWV3YXl6b1h6djFseXlEdU1SOG5wUDJzdUJwVm5TUDREenQ5ekNY?=
 =?utf-8?B?VG42aFc4OUVsKytxOS93QmNkMEdRZnZUR1VJZ3RQS1didHpnc2daSjd2WWdK?=
 =?utf-8?B?OFlFNDFWZHBPMnFDVExBZGdLUTN4V3oydDdaTUlzakZ2Y0RJSXdDL2I2eTVK?=
 =?utf-8?B?SjJHOHJuYzNLR3lsblp5ZDRlYytOTk9XQzdiTjM3RGtNUFhVY1FIN2ZyZzFH?=
 =?utf-8?B?RFVXVTVYODhpWExRZXlwTm9tKzEva3hiNWs5NFpOdUZxOWNGd21wQ0dlTVZ6?=
 =?utf-8?B?bDk2d2ZCQys3N3RJRWlrMlMrZW1rMWt3eFdoaHQ3b2J2OWFIWEVTRDMwQmtD?=
 =?utf-8?B?bUVoZktNeUNFQVdMNFN3bGt0QkcwVUoyVi82dUFQL054eTRtZTZRWHhROWFp?=
 =?utf-8?B?WjRoby96RkhrUG5ma2lNdjZ0SFdHU2laNFl2bkRmVzd2TlpVbjU4aWRhMnJu?=
 =?utf-8?B?ZUowOW0vOEFWbEY3U2xURHNhRXB4RHo3TTViV2xDNWYyTmhlanBNQ0NsQy9E?=
 =?utf-8?B?b1RnUThmYTBiTmhKdFlpdDNUdDNlTGhEOExTVkxIQ3Z2RFBvd29sRS9scWpK?=
 =?utf-8?B?Nlg4aEdMOUFPUHlEV3JNRTlNQm0wWW1JZ0EwSlZaSHc0T1d6NnV0bnVpRHls?=
 =?utf-8?B?MlZTdGJkdmsvMjh2bUhGQkVNQlNQdGM5TkNVcXpYa2tNckZaTlQyZU1YeUNF?=
 =?utf-8?B?RVFkakw4cWFYYlBLMy9GT0MxTjhWemI3WVBpb2hWTjVqMmpLVDFuNGtFc3VS?=
 =?utf-8?B?TVlUaitnK1VyZENaQWxnVVc5eGxKcjJ4NEFZcEljZG1PNWd3Ym1ybSsvMHl3?=
 =?utf-8?B?QWNEb0JlVitTMzZKYXRpekkrZ0NybFJNdGQ1cUwzY2l2N1BLdEkxcTJ6NWNq?=
 =?utf-8?B?eTJDdmM2STJNWnRqYTRnT2crRDBiNVdvYWIzRTdxYUgvYzRsYjRaeW1GQlh3?=
 =?utf-8?B?d2RyOWRpcjIwM1hjTm51SSs5bThmTnU0blQyazhLYXFiR295NFF2cFhjY1lN?=
 =?utf-8?B?djlKd0hnUW9zUXJyOGd1QWtsZkVOSy9teXlkMDNsNTRlcS84Y3ZKWGwvbnBm?=
 =?utf-8?B?VGROZkMzYXNlSVJpc0dsMlNOcTJJOHNlZUpPWUtlNmovUVZBV2RURVBTVThF?=
 =?utf-8?B?NDJXeWtyZGIrMUlBZjVaRnFBS0ZJWXVUU2UzSEtQSFNRZFpyQUdJd2M3Q1pn?=
 =?utf-8?B?NmJ1UWpsRmFMTXJySFRmNHFhREtMbVljbE1QQVFHOWV6VmJzWGw0akE1TDFP?=
 =?utf-8?B?MHlUbDY1aXBxT29McTJWdGRsNlpuQWtOMGVjRlVnV2FTNWdWL3BWNk9XbGJK?=
 =?utf-8?B?dCtxSXJtYld6dVdTYXJsRm13SHlYdHhhZ09GaGFMamRiMzdpQVd6VmNTd05n?=
 =?utf-8?B?QlVzcUNmQ3hHSjBpSmxZekhyQlJQM1hkL3hEZnBJdDdmUjFFcmdmUVFiNjZw?=
 =?utf-8?B?QXZrZ1Zydy9qZTE0M0krUGhPWjQ1UGZaTjcyZGNUSk1Va09DKzA2Y0NLemNU?=
 =?utf-8?B?WGlSdkJpZm93SHRlRkM2NE1ES29yUGFaOHQva0hMNlFOeEs2WmdpSC9BRllu?=
 =?utf-8?B?eDQ5N0FkNS9OMC95bVcwZWg4bUFodmJ3OWhIMlhSbmhBVzhtUmYyMDhsNGcz?=
 =?utf-8?B?KytOeFpwMTlGSk5NMERvNW9CbDJKY3p0M0t3K3dEcXJLVGJxV0JRVC95dmZB?=
 =?utf-8?B?UnFlQ0p4bVVJVkpTL0xXZnpkYXVoOTFQeTdKZ1VYMkZsQWp5K1V5NW0wVXBz?=
 =?utf-8?B?MmxPMWFIaWc1V1VzdzRXZ1ozZHJQT3FkVWxlZUZVY3dUL3haMk12OGtiaDhU?=
 =?utf-8?B?TXdoNlltTEd3TWhXWHlVbHZkSVpENnEyZkFsV1p5MXJhMGhKZjFBQ1ZjTFBN?=
 =?utf-8?B?dTBWQjltblQxNGtVREdiU1FabkFOai94a0ZsOU1ncG54Z0RNRjZpRng4V2lW?=
 =?utf-8?B?WmhlY2UwajdwR20wT3Bsb3M3RS9uTitPTWFTM1ZQWlE3YkRaYWdRVVI0ZlhM?=
 =?utf-8?B?MkhEbU5yaEtGK0tvdUVxVWlIRUNrcmNXa0NyYTEzUHlRbUhRYUd2ZzEzTlIy?=
 =?utf-8?Q?LCWgwuwsARAZCYCHzCWSk1o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm1SbXo2TnF1UDk1bk5DYkZ5VzlNcUlVT3JMR0p6eEwrYTlJMER1VGs4R05r?=
 =?utf-8?B?MmZLQmZsbGFuRnpJK3pITHgxWDhtTXIzWlhUMzFvTWMyazA2UDRMWW5HR0lu?=
 =?utf-8?B?RlBaZVRoQVM2dE82bmd0dlc1WnRTekRaTndqd2w4bnlRWUJ5MEUzRnFyM0Vi?=
 =?utf-8?B?ZHJZajdhNWVuRTBCcjRCMlRhT1pNei9PN3RHL0lITDVYR3gyVFhtUTd5ajJh?=
 =?utf-8?B?bDB0UlpJcWc1eS90WlZBbE4yOWh2OUhVSmJiaHJEbWdGdEZTN3NxU2dLSjZC?=
 =?utf-8?B?cEdFYkhQcGYza0hKd3V4M3ZLcDlyV0x4S1lYa2V1c2VobmtmbittVVBGQ2w0?=
 =?utf-8?B?MWhtTXVuc2NXUnFSK2VPaXhZU1l3amxHL2FGNWI2WmczVVh3QTZ1czBPR2w3?=
 =?utf-8?B?UEFxSkQ2NzdQc0F1N3h5U3REVlJ0SFdDd1M5b1pHNnpBR0ZsdGJ1bEZXaFcx?=
 =?utf-8?B?ZzBiY2lCRE0wbXBIK2YwZHJVdTJnVHQ5RVFMWVRCZ21QQWU1TjROak9xaHky?=
 =?utf-8?B?eUkrZGdydDdzbk5kZ245STlybFRVMkkwQ29TSVdhQm83T3hKUFd2bHlqSEpP?=
 =?utf-8?B?WlBSYk1pM2xrUWJqN2kzSFRHVTlQd0UvWGFCZUd2RHdDNnREaUVCZ2xrYzhL?=
 =?utf-8?B?TE9ISUhLUC9HTVNFdmxYYzVFYUhYc2QrR2hTTWpZdXdleTRSbURVMy9pQ0hw?=
 =?utf-8?B?MHhqaWFOZ3IxaTNYbktKRmVvclFMbWs3eVNsUWRvTDM1RUduL3dZVysvNHpS?=
 =?utf-8?B?T0lwS2hUamZrT294dU5Cem5BVVIrU041WWtVY1kza1NKTGQ2NUpZaUVuRmZz?=
 =?utf-8?B?WlVJRU10aWZoN0dUOXhLdFVqUEVOanhOMTNuT3RaZytrZFNxQVFQMGhKc2xm?=
 =?utf-8?B?K2FodENjWThmUUtxaGxucXY3SEdvWXpwSHNxdDJHL0lpbHJMQStwWFcyQ3dv?=
 =?utf-8?B?WnpjVXl0U0hKR3N4NEV2d1N3NjM1WWV5ZkljUDFsakI1SjE2VUZXN1F2VVFM?=
 =?utf-8?B?ZXJwcUowSG5xVkNvaTZFWXlUbGQ4alYrcXFuUDZPUExpNW0xT0pQMFlzbGxD?=
 =?utf-8?B?UjR1ay9EMFN1c2Fza2pmSENId0loRCtNMW10OE5XK2RETHF3Y3FwNy9zaGtw?=
 =?utf-8?B?MXk1ZlB2bVBKT1dTaVRMQjd0NFpVaW9XWm5obHIrc2dTMUcxWVNRc3lFMUp5?=
 =?utf-8?B?SXh3V2lNektkY1F2L2o0WktDNU1iejB6UmhWU2tHR1BSUThhWWZoajZqNHox?=
 =?utf-8?B?NHpsWFV6Sng3RDJmN0wycktHYjJPWDV0UndRYi9yQ096UURlRkRVTVE2aEp1?=
 =?utf-8?B?OHRaOENtQ3RhT085UURUUW5OMU1aVU44cUF4c1JKMWFFTldDRGVsNlE4REFW?=
 =?utf-8?B?a2tNeUQzTEh6UkNHSTlXVlNaSXNpd295S1I5U1hKVUhVaFF5cDRJcm10YVBk?=
 =?utf-8?B?WXJlYlprWS9kRDM0Zkhyb3ROZDZaQ0kwZEh0QXBLQmZwNlJ4WjJoSG9mV09s?=
 =?utf-8?B?TVdnZ1J5SmxkMmRMQW5LbzhwbnRJVUZjUWpoWlhLZEtXM1BHVGVaVUtMZGJX?=
 =?utf-8?B?eTg4d1FrdTF3Yzd5akp3cTB5M3dTdXJXWUEvelpjTTM1Vzk5d1FxZnBWbkNZ?=
 =?utf-8?B?UkdVdjlCT3g0UjQrdmoyK3Y4NFBkNlVia0hHWFZsMEMrUGFaMSs1NG5ERWto?=
 =?utf-8?B?Z2NpVXA4NWttaENGNFMxeStOcWtJV2IvZ3RTWGxXTnQzNEZEakE4RU8zb1Zy?=
 =?utf-8?B?K0pGN2NwbjhqV2Z3YWQxUExMMHQxV3R3ZGw2U0FXY2crUFBCZFkvajd1V3BM?=
 =?utf-8?B?NTd2S3YrUkZ2T0lTNW1YS3JyUUdIMnJsbGpuRnRwT25qaDNtcklOUW1PTUtG?=
 =?utf-8?B?VFJkYncrYmVNYkVXUWpwZUs3NWV2M2JHMWVEK0d2NzFoRmRVcWhGSk1YL2R3?=
 =?utf-8?B?NWhYM0NUcVY4YVZmUEZFN2F1Q3p5QWdBcTlnTElDTWlUTFhveEhtcFNQdldi?=
 =?utf-8?B?WndLWklEd2RkN1VheG1PeXE2MzAvMjAwT01DcFhBYnd2R3p1T1N6aEI4dm5X?=
 =?utf-8?B?QzdEUGIxQm84eFFsV1UwN0ZLNUZWYSsxWFZvV1FLM1pjc0RMR2w1QXVqNmh6?=
 =?utf-8?B?cnFmWmVRRURXV0ZFQmc4MHFSNERtbEpiSWE3cG5BSjgzMHNNTlZicHlGVkRH?=
 =?utf-8?B?dFJNNkk2WXo3enI3TDM1cFhQV0N1UENua01HRWlIOHJCVzZRdkNqdzEyM2Yz?=
 =?utf-8?B?K1c4UmFSWVVoa2lHUXQzYStITjl5ek5GazJEeVA5UFpHSGdFZDhqdUx0OWsw?=
 =?utf-8?B?cDFMcllsVmhkeXgxNW5LenJqSFdDL1FGR05NcDlsaUtUU1ZhQk5aamxiWHZu?=
 =?utf-8?Q?XomN+kHv1pTwH5SA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27066F06C9FC7D4C89C4B83F862317C3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23946de2-18a6-47e6-ed58-08de73dd8240
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 19:47:14.2986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4aeMnMAV+JWcsl/8jDvG/3y0wU/+jpNT6cRujg5eldMKsvsB314Z/UfdXIr2P6mSc6XQml+hzadx9aDsIai+GebtjsjIhpOrcRQjfcS1hSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8863
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_114725_360515_ACEB1A8A 
X-CRM114-Status: GOOD (  20.06  )
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

T24gVHVlLCAyMDI2LTAyLTI0IGF0IDE3OjU3ICswMDAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6
DQo+IFJlcGxhY2UgcGFydCBvZiB0aGUgeDg2IGFsbG9jX3Noc3RrKCkgY29udGVudCB3aXRoIGEg
Y2FsbCB0bw0KPiB2bV9tbWFwX3NoYWRvd19zdGFjaygpLg0KPiANCg0KSSByYW4gaXQgdGhyb3Vn
aCB0aGUgc2VsZnRlc3QuIEl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIGJpdCBtb3JlIGluZm9y
bWF0aW9uDQppbiB0aGUgbG9nLCBsaWtlIHRoYXQgdGhlcmUgaXMgbm8gZnVuY3Rpb25hbCBjaGFu
Z2UuIE90aGVyd2lzZSwNCg0KUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRn
ZWNvbWJlQGludGVsLmNvbT4NClRlc3RlZC1ieTogUmljayBFZGdlY29tYmUgPHJpY2sucC5lZGdl
Y29tYmVAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+DQo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVs
Lm9yZz4NCj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPg0KPiBDYzogQm9yaXNs
YXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+IENjOiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5A
bGludXguaW50ZWwuY29tPg0KPiBDYzogSC4gUGV0ZXIgQW52aW4gPGhwYUB6eXRvci5jb20+DQo+
IENjOiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgYXJjaC94ODYva2VybmVsL3Noc3RrLmMgfCAxMiArKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2tlcm5lbC9zaHN0ay5jIGIvYXJjaC94ODYva2VybmVsL3Noc3RrLmMNCj4g
aW5kZXggOTc4MjMyYjZkNDhkLi45NzI1ZTdkODliMWUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2
L2tlcm5lbC9zaHN0ay5jDQo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9zaHN0ay5jDQo+IEBAIC0x
MDAsMTcgKzEwMCw5IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3JzdG9yX3Rva2VuKHVuc2lnbmVkIGxv
bmcgc3NwLCB1bnNpZ25lZCBsb25nICp0b2tlbl9hZGRyKQ0KPiAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgYWxsb2Nfc2hzdGsodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUsDQo+
ICAJCQkJIHVuc2lnbmVkIGxvbmcgdG9rZW5fb2Zmc2V0LCBib29sIHNldF9yZXNfdG9rKQ0KPiAg
ew0KPiAtCWludCBmbGFncyA9IE1BUF9BTk9OWU1PVVMgfCBNQVBfUFJJVkFURSB8IE1BUF9BQk9W
RTRHOw0KPiAtCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07DQo+IC0JdW5zaWdu
ZWQgbG9uZyBtYXBwZWRfYWRkciwgdW51c2VkOw0KPiArCXVuc2lnbmVkIGxvbmcgbWFwcGVkX2Fk
ZHI7DQo+ICANCj4gLQlpZiAoYWRkcikNCj4gLQkJZmxhZ3MgfD0gTUFQX0ZJWEVEX05PUkVQTEFD
RTsNCj4gLQ0KPiAtCW1tYXBfd3JpdGVfbG9jayhtbSk7DQo+IC0JbWFwcGVkX2FkZHIgPSBkb19t
bWFwKE5VTEwsIGFkZHIsIHNpemUsIFBST1RfUkVBRCwgZmxhZ3MsDQo+IC0JCQkgICAgICBWTV9T
SEFET1dfU1RBQ0sgfCBWTV9XUklURSwgMCwgJnVudXNlZCwgTlVMTCk7DQo+IC0JbW1hcF93cml0
ZV91bmxvY2sobW0pOw0KPiArCW1hcHBlZF9hZGRyID0gdm1fbW1hcF9zaGFkb3dfc3RhY2soYWRk
ciwgc2l6ZSwgTUFQX0FCT1ZFNEcpOw0KPiAgDQo+ICAJaWYgKCFzZXRfcmVzX3RvayB8fCBJU19F
UlJfVkFMVUUobWFwcGVkX2FkZHIpKQ0KPiAgCQlnb3RvIG91dDsNCg0K

