Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48867CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lT1+2nnm0DrPF9STIrlTkJeoFNqNeZKifA+aDKOQgz8=; b=pLoQAnpnZRHe5mUVEuFX5Dm/7T
	3KOcTsbo2upXV+fq2jxA0fvTyOjCcHE+d7dZpN8wluE2/8VLyFaCn5pl5eSaUpjKm1CsOldaT2bno
	Ll4xEJQbQ0l7+l98G51+TFwC5EEIGHXVuqaL+F8u5dlLn9hwcHBg/TWW3vm28WJNi3mFnCMVAmVRX
	hhISeBPZyvA6V5zvab5EYq9JWOZPpRysoY5l1DYLn4tBSCipcMSRcIbItp6e6kGyzuVV2dCfXmK9i
	QUXfMmAC37/mdn2zXjL/nu209OaorDt27y1bMhUK6mJuH6PxZ92gUqWuJsYSYI/I3LalEyofTHscg
	y9om61dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJhG-00000007qs0-2Eth;
	Wed, 10 Jun 2026 14:14:22 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJhD-00000007qre-3JwJ;
	Wed, 10 Jun 2026 14:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781100860; x=1812636860;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pVAkP83ou9zlnsXtIsqZ1P0605bo1O3SkKCgnfUacsk=;
  b=M29D85a9qw+Xxpad92CExhQF/jZHJw3hz8xM14cY+iIS26qZ82BWmjSo
   KtL3CoDBeRZf9BbzwA0n+HdVpsCC/v2j1/jHeEBCMunOfGxSiFYkIyDsJ
   NGnysWvmOqiHY6P5ekMNK36hrv78pFysglrcAE+Sn1S6cihkPqqcln0jU
   Rx7XUWwNeyKweL2zJ33wc5yHfKRRaanZ94EMtbt8QnR+MAxc90VmwrhZI
   MVKbJ8hvAkKnCAu+jxf0hKjcuFBWFHoW6ZeMO3h7Y2t2wp4hCMlrC746V
   nPEAGOHiHWiWKYnWl3KcFfN2FA0cOzaYdHCay6XQu4dfxe6DoSolR9hyA
   w==;
X-CSE-ConnectionGUID: 0dwqTlwSQn6WPVBQ4XP6Lg==
X-CSE-MsgGUID: F7Z41//YTPSCIB36Xb82Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93281072"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93281072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:14:19 -0700
X-CSE-ConnectionGUID: nzEq6sWnQjqyjDQrqa6j2Q==
X-CSE-MsgGUID: SRfN9hiFTRWX4+UHkFQMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245058331"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:14:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 07:14:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 07:14:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 07:14:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H//fK7HiGNCKHnpoO3TWvnWfoOcdAmDG/gzo3eye+JHaN5ped6Tla+1favv/jVyQeXxxJQQkiDI2YpPyjNea2IhsD8LgDyND19RQ05nXRR2zXekAh7miz8Ion9xaadKThuGSqTu9uDlSbhcd79trxRkxbh1JrGv9gG4OIkF6torZX/mx4WEjyWQUllj7IPq2fAZexgGEwo9udULKKlo4PMrQRrNiaeORm3kJP67NNh7KSlUl7RvGfzaMNEL40BceriGqN6DJVc9yoqBa1ZvYSIUZaEWzn3Lo7xM7o2sF9Y7jL6ie2+01a9AMNzBy8FWa3lPdHqCSkfa11Ifck6ylOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT1+2nnm0DrPF9STIrlTkJeoFNqNeZKifA+aDKOQgz8=;
 b=EyK088/WogrViWj6IoE8F3Wyyho16gfzf8umrub5yuVdCsPb2ABPK1B3fm/q44jvj+rwiO8VNokP1PEai2KE3hHpgGN05S2ktXrUv7RkJEuvxD6j0am9WFoiTBsO6h71o9QwwW/CIzL6oSq8NkOErP+OCYqWjZIamGj3WM1WJXMGLhO0H5LVFvecCqNgrfRVYl+4p7uA18BeT368rh9fbDgZZHRSUGXKzFZZeoYO+T/3Svv1Oxwc9p0JwoONyBtQYMDWGK12gSvAZyC9CJWHjJBwp9oWroXfT2lsICW87UDfnBAyAjHzziO90mAfKlWn/sStOcT4ijIQ+8aTZqA5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 14:14:15 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 14:14:15 +0000
Message-ID: <631650e8-a161-46bd-96a1-582adef84021@intel.com>
Date: Wed, 10 Jun 2026 16:14:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: airoha: simplify WAN device check in
 airoha_dev_init()
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<netdev@vger.kernel.org>
References: <20260610-airoha-eth-simplify-dev-init-v2-1-8f244e69b0d4@kernel.org>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20260610-airoha-eth-simplify-dev-init-v2-1-8f244e69b0d4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0347.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::27) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|DS0PR11MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 62233415-3499-4774-6814-08dec6fa8d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wUZG5NjH/jcObShJIW/7SetFBSoys/AyidQgc//pr9Qe0jYs0c1q4f3o9IVW3D6Ie67qg088Xk++ESgu23rFvfXzF9j4ZTBXPmvI/Xt0Di/exiqgFSR8VQnSwozY0xI2+OBCRxsLq1BF4ZCSppsP7T/NIqt8zpW/w8ZsDtT+MFbkcWMZwzf0wbqKELDNDm8XHenT6UPsvjq4afl2wJX7b0Me3hSkIfyn+MPxybRNDU/XuRAqBcwbq/ULWdfOnpv2EsQd4LIbeNALzBsD4Idfb+aYmOOFltfg2915dIuDbR17hQEg1X5JSBdYIgs+G9NHBfdSo4ktz3OimkgycZhIrNaNXGmNHc37HCIWX1srPeeXOvPhQmJJp8NrG0KrvfPlzdQpxJcbVgN89Sr7t9svnV76qQ06OOe4t3y9i7DR5XUrzHWHswJDNkcPWnxicro8LwjBCwXl0EE88QlSqxpt4+uuicwuSLnGNdaTMPGjgb3Sk7tn3385F2QMTguGqKZoQg/kq8A69TTWEM5utQ+b1AryhKt0BR/HFOs2vR0UBRbXMoYff5gwonm5Qqk8MSPz3+X299KKEQF/OeUcTNIjr4GpmQfaCj56em/IxWdKnVY7YAXvZaRZLX4ZQ+qeS+yZ4Q4tkGS6o3zm7rQLSE0ZMnA8J+v5XfW6VIx1XFJEc1FOHMvEyQEAjhZIy1YlGLUG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnNJbUJEY216MTh6ZktrVW5ueGZjWVpXN2l2enhpZGJEeDhLdXRoM1V2Z1ZT?=
 =?utf-8?B?L3ZGelV3cVJLS2ROUjFmSENjTEJiQlJSU1hMUXpqamZpQWdXV2k4L1ZnbEpv?=
 =?utf-8?B?WjdocFRMRUpuc2tPKy9Jd3VJSzc1V05acE1kMU5oQzd4ZzJwU0ZOWkU2SklX?=
 =?utf-8?B?ejFISHkzQ2VxSUFVQ3RSS3NaNUtKS2pyeGJBcmFzeVk5d1hDbFFFOEFDcFdp?=
 =?utf-8?B?MkwvSHdGU08rL0VxQ0tvb3FOZkdpS283ZzlSaEY2WmNWRVFqZ1RWOXlqNmFC?=
 =?utf-8?B?RWtqMG5oYnRpTE9USGdGN25GcmlOeCtxczdOaUpJa2JXclJvcnVKWHBFSjc1?=
 =?utf-8?B?Nlk5YldkMWY4Z1o4Wi9XOWROd3pZdXIrVUorYVVpbDZYdUo1WmQ4M0VrWmFO?=
 =?utf-8?B?TE9ISy9sOFh6dEZPTTZUR28rVkwxUHg4N0NRZTBwcGtHQjhiM1U1OHNlRlky?=
 =?utf-8?B?T1RVL3ZlUkVIUTlaY3BjU1daeGlxTVF5L3BYTmxETnpEZkhMeW5FcS9maFhk?=
 =?utf-8?B?VG54dEd6NDB5bmhxNURqa0xxL25XZXBlRHRGdWljazBWbTNpRGlrTU1oYnA3?=
 =?utf-8?B?Vk9FcVZ0SnFwYlFOcmZsakkwSUJYb251MjREQ2pTbHF1R05QS3lmRWpFcE1Z?=
 =?utf-8?B?TW5USHVBQzA0NW9FMWlwWWRsdWVnL1djYXU0c1dEVlA5WmhTVkx3QXh5VzRk?=
 =?utf-8?B?VTZaZUFLRG5MbVA5S1JCdVNqK3pxV1VaOW91cTFVVEd6VFRGQkdjd1JyQzI3?=
 =?utf-8?B?SVh3b2h4TUg5cTMrcDFkYk1KdzdDUFExWHRGR2IwYU5VNGxqdDdzek11SlZm?=
 =?utf-8?B?TkdpNXJ0NEpRSlVndFo0UHRUQmJ1Z1lpMDVSL1lVK1FFOVVHWG90ZU9rdlNL?=
 =?utf-8?B?OGVGOXpydFNsa1RNSExTUGRtMG84VEJzRDhFc1JXRW1SNitoTGRLTXhUVVBP?=
 =?utf-8?B?NXB0a0lac1ZGV1ZEbGtkSnpWZ3VVRkJyZFNFSmJkaXdCaUNnZklsWjQ0ZlUr?=
 =?utf-8?B?UWsyQm5MYkMza0k2WEtsQzhtWlRRT3VESE9PdHo5bk1PUVVpem1sYmw5Vkd3?=
 =?utf-8?B?NVJ6YkNLUlJ1Um1OZnZnVHczZ0IybEhQWkpqeVdjakJsMWpVSHY0bzg3d0FV?=
 =?utf-8?B?RVhEMVpqMDJjQ014cU5YUlZiKy9YRm5SMld5a1RDWGJsZkhrSXlZenJkbDE4?=
 =?utf-8?B?ekVpNThuQXRjWFJPT0JOS1dIb1ZzMkVDSUdlSzFFQ1VKRkVZa1FicnFlQ2x0?=
 =?utf-8?B?Q3NXODFhK3B5aWFrRXhOazNqbFZUM2pMM21jSGlhS2FLZGNxMXNRS0FTbDls?=
 =?utf-8?B?c3piaEgzYW40bEZzYmcyUzNFNy8yZDRPYkh6TEwzeXJDN1kySmV3QXE1Q05P?=
 =?utf-8?B?MHNISWk3MVNBeXV1RDNMZUxNVEEvMHRsWU9QbnFFK3pCaEhSb0NBTUt4bWdT?=
 =?utf-8?B?bVhGUkJJNTVzeG9hMHQ2VkwrZ1kyV3FzOUsrSFpiUG52VlhaRjUwR2FuRmRY?=
 =?utf-8?B?aTlldXhsTTlkdjl1VWQzSUdkeStLVnpqYlpVak9FMGFNZmpVNllPQkNreVBJ?=
 =?utf-8?B?OW1ZbnRsRmVGWjRpTk1XTmh4eC9CeHg1d2xVTTlJMHZVcFcvZDZLWFIvTG5L?=
 =?utf-8?B?L2o3S1FUL0U2VUlOMmQrZTRsNkhrQnVrS3VIRW80dmU1czJTTDZ2eXBMaytG?=
 =?utf-8?B?WjZ4bHhOR2xZQkJZY2x2Ny8zd08vZG9KWU5mRDZwOHBnNDQrRFdFUmR2aUJI?=
 =?utf-8?B?QkJnSFhwcEFtaEVZTjI1cnRmYVR4VEJxM0xrK3cxa2I3ejZVSmtGb2xINEJL?=
 =?utf-8?B?TGhoT3BSSmV4NHA0SCtjT2RoSXJQRzUwRVVKa3RmcS9EYmgzZmd1bUFGa3hZ?=
 =?utf-8?B?TGdlMFNud05hdWZBRnNTZ2NHWjdKNHFNaFJnUEplZld4ZHVuVnh2Yk9nUjBH?=
 =?utf-8?B?Y2lOcEF6OFNiM0Iycy8zY2pNc2Z0d2lTQVgrbHRSV0NUbFYxaXZUdlNWenJE?=
 =?utf-8?B?UTNlcXV6WkdyTkxOd2E2Z1BZanVnNWkvOHkvYnFHaXF6YkQ0T3JibUtaOXJP?=
 =?utf-8?B?T1JieFUxNys5UGJhenpwYk1mUG8zZ0ZDcFduaSthdjR3UXR4cnVVaGpVOTEv?=
 =?utf-8?B?YUtsV04ySFBHQTlsK3R1K2JXb2lCR0NTL2tML3NjaGxHL3FTYk1NQ1F1eklm?=
 =?utf-8?B?WnQrZmN1Uklxb2VHSnYvamE4TWpjaWI3ZXl4SVVhdmRGSzFLRldzVGkvRFJZ?=
 =?utf-8?B?dnc4eWV2M2FYTlNZd0pTc1RJNUowWEhDVGhTLzdPY1dXM0QrZ2pQZlA1RWhv?=
 =?utf-8?B?U08wYWgxWEp6Wng0SEZvWmx2WU1MYldITUo2MndqNnNVaEZ3cEduTnZBU2ti?=
 =?utf-8?Q?6CFvKiqW1fgN/qWA=3D?=
X-Exchange-RoutingPolicyChecked: cJD+irUSVnvafR65gIGyNUYrEEhXN61D2A1hFRIIqO35m84QT2Uy+PDboDJ9vH1pDTi31mEoTrl/RfEmiHN8W99s0MIwp8VKU/P43PlHrT8kkN7I94tcbavE6WWor0fWGZGcmrZ2g3wBk+6YJPMeNHGXAnpQWmwh13TdfuXvPMN4YAsVFKNN7KsKXRpD6upVaC8UjADX9jdMAshzJDgmFVIAAyeinm2ly8ijjWGn48XHZXX5iMKAPaOB0sdk0F2J4dkYcUUWKE3Elvb8O8C/RLMKF1NMtkt5FNf9Go+OXwM3ctseztEwOd9qsEfGpndiCAi6rFvmnL3KV5m+/QYaEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62233415-3499-4774-6814-08dec6fa8d6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 14:14:15.2951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPH6p9I8hn0V3u3tBQBh3GJjhfHyp5hNpz/4L/OHx8TZynJ7JKJHGyFaoIV3xckbiXCOm6Haqdh5T17EC6iUpSJ6F9h++5TU2CEVFlb3R58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_071419_847152_B04107DF 
X-CRM114-Status: UNSURE (   8.97  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 10 Jun 2026 15:25:13 +0200

> airoha_register_gdm_devices() iterates eth->ports[] in order, so GDM2's
> netdev is always registered before GDM3/GDM4. This means the explicit
> check for eth->ports[1] && eth->ports[1]->devs[0] is a redundant
> special-case of what airoha_get_wan_gdm_dev() already covers, since
> GDM2 is always marked as WAN during its own ndo_init.
> Remove the redundant check and rely solely on airoha_get_wan_gdm_dev()
> which handles both the GDM2-present and GDM2-absent cases.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Thanks,
Olek

