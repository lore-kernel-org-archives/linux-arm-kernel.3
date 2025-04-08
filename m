Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A70AC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAlQgoZezMTV34w9QtZUp9QnET4EOjgb/S0y50UzDkA=; b=JxadNmJVXQSnBSXapOqseicIqE
	oSp/IHPlnqHjXE0LbDVwZaIahb+x5vK1dtxCuuektxzhtlzUZ4p6lSBFJGqB6pOjNgqPmsSM4XUZ9
	LLX5Hw2fDNfv/OAYMs0Vz66Uk+ijsjeKF0DP2jzrumuZq+EEs7RkU9V1PSQwbzQ9wqSzjXF2qVNwW
	ue/JJXeT45Kap8p6sy3aT3o7o78xEWZXKhUYYMpsOahAxYNErqEXSDykDl4ezIQX5pnro1zfguZ3d
	lyCnqlPkO1ZRGApsBo9G1wdED9ZowGMD1zVydyWb1PmbFlhKKPQ4K3NBU0h6kGFo8KVJxq4IV4pip
	ki76vW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B3Q-00000004fC2-0LUN;
	Tue, 08 Apr 2025 15:40:00 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B0M-00000004eXI-3Nbf;
	Tue, 08 Apr 2025 15:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744126611; x=1775662611;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lIzVm+zRSn1BkodzIEZjfVWBpjc+KgTicxUfaT8hnyI=;
  b=Xv7HdiAQBlPSpo7S42M0qdKhf9Qm+3TpotBHP2KfY65aRk02TsWNH6mE
   BZXbXFofY7Ftnu+Xr8eZB/lZ6vDS6TvwDa0MvaNtKoMyzElgVPN8Ow7+E
   iH42Xm+o1Xrw8j6tlDH+olsNwwEhrRAXJ8MRCAn1RRCwidVswquSqL2/q
   Y+xnhHLe0zCAKztrZ979HG4F0vbhkFoUVldvgNprG9z9Y2tNgR22v18FW
   oahr5sNEGwPWB+1zjt9bi0yiSLhS/enTTVENicC0Od6SXWsWECk+4PmER
   Qs/Dk/Y9amQmpGNQtGAzLmkQGGsTYI5SF1E4ffm00bPUOSFAGb4rD7rYO
   A==;
X-CSE-ConnectionGUID: VddpMH+AS52xOL7JANZpvw==
X-CSE-MsgGUID: nnYimQK3SMCHPYuAF7t2Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45453959"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45453959"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 08:36:50 -0700
X-CSE-ConnectionGUID: Z0OK3aTERXW6XkbvNtbg6A==
X-CSE-MsgGUID: yTyuXFVJTzeCa+Vm6OLgyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128647824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Apr 2025 08:36:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 08:36:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 08:36:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 08:36:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5PJHfrN7nT69bIBiJKeWLll/PO2rLZr4eIEI878V0FBKdDAzjuBIoV9PD7Bj848dzfDQ1F/QsajBDhxRXAqhryQg6TdZU/IxKQRlxM8GGYAYq3vaDb6fL805Dei0AWR9G/AfvBEMMNYFGxpSp70/6bbQy3flmSeF8l1NQE0WcPUg1Sig0ChmX2+D+lFoz0K6K4gMS9ZOkXK70yaojRAFxxwabgrhmL483wDGPEWMicn804+ZClfLcUXwRcuJ5p4Tpjo9ugXWmfS84jctpE/4ovYYxYnEo+oWD/CQBpKDVXjPeDUzFES0db5m+1tCPOa7HE1L/K/iYMgXA7cQB24eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAlQgoZezMTV34w9QtZUp9QnET4EOjgb/S0y50UzDkA=;
 b=WrQLP8XlShkuMH4BkFmy7uHKewyzqagnizxsnGkO2jpsAO53+Zv2xO1oWwD7JLJQjAkAIqnrxVMjvTd6ANJAUg6OgzhfNXr5NXHG6T/Xf2axsmt0zxSGFoThUWA9eL8Xu/M7c+1VfGqQ+o+fX2ufcfVVzzfMInYs22jbMEMTGjO4dSbGDJqZpKKsh+OozqF4EtTFtJWQIU0KO9/PPsZFDFdLN7uIK+QO4YX6mL2+KsztJ0Pp8QNWmF7hSxP+ACoUWmOhRkPYtCfl/BW+V1UA4xRpbtrjYYBFoWKi9Rswr66HKeqrQRYkOtSJwhsexZ3fKu0EgioAczuDQLqwpOGxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) by
 LV1PR11MB8844.namprd11.prod.outlook.com (2603:10b6:408:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 15:36:15 +0000
Received: from DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::8e7e:4f8:f7e4:3955]) by DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::8e7e:4f8:f7e4:3955%5]) with mapi id 15.20.8632.021; Tue, 8 Apr 2025
 15:36:15 +0000
Date: Tue, 8 Apr 2025 17:36:03 +0200
From: Michal Kubiak <michal.kubiak@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/3] net: airoha: Add l2_flows rhashtable
Message-ID: <Z/VCYwQS5hWqe/y0@localhost.localdomain>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
 <20250407-airoha-flowtable-l2b-v1-1-18777778e568@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-airoha-flowtable-l2b-v1-1-18777778e568@kernel.org>
X-ClientProxiedBy: ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::9) To DS0PR11MB8665.namprd11.prod.outlook.com
 (2603:10b6:8:1b8::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8665:EE_|LV1PR11MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: ce74a491-bee1-42d9-a759-08dd76b3190f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+HdpnIBgiru5ejLotZjSFyZnKMMhj5XNKnUdX6S90oFUm8XSVcAMKHwbX3Mr?=
 =?us-ascii?Q?Y/CTVPRKo0Vbi8Lz2f7ov4GCniEPiacppzhVUQC1/kF6OVOfqX9vfgZ6C+Lv?=
 =?us-ascii?Q?YQoLkU5PAbWYW+gGsMEWRfcF+SXa9JfE3tIYsQ9wUyTUhBKjQbActmsOR2EH?=
 =?us-ascii?Q?A18AwrBh+Gg8sxhbJIfCQMm6cfsOl2YuzwKgLE9wg6CiO6YuayNPdQBUTF9c?=
 =?us-ascii?Q?skaYLQpqx2CDG6llSq54TuzkuKrT/U73VGaLBl2hxlC+LMZihVt+cGDjLQc9?=
 =?us-ascii?Q?gIcs6f3ddcDPfhJA/dW0IvUBW0tKJhxClg0c5KG8KuTgtryCrAhDDRMcMnDe?=
 =?us-ascii?Q?0vQeWQLs0e9dVjPjxxG5BTv66mL6CLNj+XXRvjias6FCM998ntDJRaJHVtus?=
 =?us-ascii?Q?0W4ipqG5EqiG1ntj2BHKw1Q95AzZMBOu77Q4Rxe6IfLp4wEBEXMIJH0M8t0U?=
 =?us-ascii?Q?5wKdGFuby3J/JEEP/2PaXCDzIg8UB2FL+A2wO8oYzAEWVyBrPLS4mHAn4S5X?=
 =?us-ascii?Q?f9qz+XIZl0C8RyAElau4hVAt+ADSlRUeddnNiOXaAYb5h3rtZmgOWN5Obi2h?=
 =?us-ascii?Q?48VA1NZJmeDEc0oh0b0ohtSmCcQoOtLv2BMMaG3e4PaoBx92t/rlZNvO1Xlk?=
 =?us-ascii?Q?L4qNeBxSDOMcnlUgBilgEZvjZiZHi5vUNRS2f5R/hLcmYHX7i8c/jtgVdf0i?=
 =?us-ascii?Q?cdK9TKK4vRtRZM1ICvSjd4vbfvx4kxpikkF1SFyccT1Oq+GWK61ForlaMir9?=
 =?us-ascii?Q?HEYU1nhcMTFgugn0O1mefbQ1LebrMdN75jLUCYi0la2hk3TCMfzIBVpdBrFR?=
 =?us-ascii?Q?H69eh5HuiV8PHiRvPlKclZcFF55poc7feNzLQ7QTuc0sfPEvXLtHvApkcT2E?=
 =?us-ascii?Q?Zuwv65yVzdQvy+Pog3U4SNuVZVpH2F2mSxWRTE9aD+SYsuToyJPzMJWKeJ9F?=
 =?us-ascii?Q?ZFm6bVtnHbomu7L48792KSWQEbfbceK5UVDOVKoXc8tj16gg0NQnM02LthCJ?=
 =?us-ascii?Q?oce/jeQPvHg4fqoB44/jo6dOZxN5i1jhQ4uVbajqyg/T1de1fVFcVzKB5ddV?=
 =?us-ascii?Q?eecvkG4Cq1CEZE5Tc0zFHZENtfFKAjb+4pf0z8LCtLT5eGJjsKEqqhveyasN?=
 =?us-ascii?Q?ToVk03wSHyshlPY9dHLkjKV1LZat4KxLYxVVhaF2tAyO1uWAvFLsc1hBA1TP?=
 =?us-ascii?Q?7KzPPcUo/BqOukbNsWBAQM7tc6VN/5wI3mC3Ao0n09DCBW6m4upXheoItUme?=
 =?us-ascii?Q?pEqFS/tF63EkrqHlkf+gL9lBMYJJSBwZIlBGcNo/XMh0bOhhMydM82NA1Ke5?=
 =?us-ascii?Q?BnDUXPdnHhJRf0/DO4Bbl4ucnood92q180UV8uw1lmgi1L9jtDVSUATXp4eC?=
 =?us-ascii?Q?LQYW3w8BgMGQ5cS7tKtQXbx08Utxnd0aoxaIXcFAe7FPfaDBgiGb1WIBaE2Q?=
 =?us-ascii?Q?kQ701a7YpK0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8665.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vj53Ds2+F9gnBetqBGol2BVwkr1gafJ7VbLZIBLpksJ8Jca2Rf4JVXQdCNzu?=
 =?us-ascii?Q?0iqftTZ6cqZ3n7OShefL54R59nxON7Jx27I2oZ/LRhj2SMwt9fOZAZIhQGdn?=
 =?us-ascii?Q?7/gxnZj29Sqi82aNCd0DNk9uJWMO6kNiGnBUKxPJB8xVPbLFtD7CgFpjHNp5?=
 =?us-ascii?Q?hy1dnGZO/QyutBsSKIJrhQe4AUPKlgpImktumWnMkE3F/KGEzZHodVPEumjZ?=
 =?us-ascii?Q?RMRk9NavyeGdQgMJkIFFwo6Jaj/B/iaRj/QUouGVAzGUWxhjGIs3jkQem/k5?=
 =?us-ascii?Q?Z/JRvGXVPl2V8Fet+XMv29740OgjBcBKkoC8zU5FJ9qxLXqITEiNlG29jrkW?=
 =?us-ascii?Q?iFhnXkTNF4Qw1WPdnuEZFI108OU3B+xQRzWZy8auhV2W1COC+dhTKO2yWslq?=
 =?us-ascii?Q?3xu0Rn2Rb/X/avMWCWXjeMWAOIxfC4Zdcx1pM5I6JspDkxMZOhyJecHGns3T?=
 =?us-ascii?Q?TK3feqLgogm/spuH37K/uxhUqU++7r+tIBLzfPumkFXUF9WKu8cbm2HLPewt?=
 =?us-ascii?Q?x91TxmlzQocDAY28AjsxCoNl+e2wHvPNgLmPjMAyGTreElu/NWoBrljhjsvD?=
 =?us-ascii?Q?MbYdrE91j+RkdakpbdDLXVyHTxUo9p1RgmIDS6fR9BTUzkPPtLS7BteEm+Nm?=
 =?us-ascii?Q?MYSsmxXdaVzvD4YrSkI8Hb2P+ZG2ukU1I1ktc8vISbyOsmEZ6cw2ndbJb75J?=
 =?us-ascii?Q?+5QlshZeeYWoIBbk1cPSTg/cPMjm2Youy7YzziHthtohuYh8iMSqxbgYZ4iQ?=
 =?us-ascii?Q?mAKHcGawZLLM7jKx55Zkdz7TWIAqJ64vLbzwJo6muOMZyErNsh3g2NWu6+4i?=
 =?us-ascii?Q?bidejxlNxkK4aqBpuwqLzmsot0D1cBUOtyatE3ClVVrQX8jMT34sSJGLWOpJ?=
 =?us-ascii?Q?en36k4OhXO1oNl3VHmiPR5mDoU+dnqK/dQkL8p6UT+30BkGGS5mU5JztCJaY?=
 =?us-ascii?Q?1ZH0nNxR5WVPD2kagUPfEU/HnoFKFsijXzkfcd5ceEJsjIQiXzXSMPEJo7MC?=
 =?us-ascii?Q?nXo02aceqlkOn99Vasqw78Z0njmPr+wIXrY5326jn3s2o2jQ2mwY6u1ueyiw?=
 =?us-ascii?Q?G2v92dE4T0czpZgEwgtg1NxXSJq1APxeXCMyJNPMnf/NakYYz44EDk2NwbkH?=
 =?us-ascii?Q?49Mf4kuEAxX2WrGnXvHp3Cu9EzfvTYCA8blmm7VKu7faHew6pilzMirdaI5e?=
 =?us-ascii?Q?hYYPtFAlhrCAjS0iU7r563NJaMO4M4xU0/AqWE7AtJ8TPvN2tvKAXeYGPfL6?=
 =?us-ascii?Q?epE4vgMHl0/I2hgonnWKxB7oKyIDDAdccjetJJfL60qgdKABNFl+kEt0HfHJ?=
 =?us-ascii?Q?YewxUqSneDAFI3jjzvGK4wRqti/+n8VLFdhVewwZXBsbDvLyPvcU/xuIO7hb?=
 =?us-ascii?Q?ahnh2zRvVZjj6HrKhRXRBZWm12M5tXqTMirz6w/9rOgth5vmXVTQDYs5A64f?=
 =?us-ascii?Q?0WupPBsJijlIsKveXhf6miCH8IQZocRn//C+l+QaD4zjLem7LfQWvTk9vXQW?=
 =?us-ascii?Q?/LNlK+cntPENaCHyzAqHllaHaUXwQ6kkgEsoLslaBZitWcRILbP+ZUHXeo/w?=
 =?us-ascii?Q?rF1xS/3y6SEUlyRk1JsAmPPhJ2fcG+qehUqbCTNMNFK7n0ZSjnnxBUlfakTg?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce74a491-bee1-42d9-a759-08dd76b3190f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:36:14.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGdiwqMp6ZTTgAEsJAs3u7x/xrlSlmxJuy0bx5IQhTzorIWt+QbfhBWCmOUwiexp6nKNWgNWdywNt0LPKG+wyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8844
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_083650_880939_0A7DF63C 
X-CRM114-Status: GOOD (  15.27  )
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

On Mon, Apr 07, 2025 at 04:18:30PM +0200, Lorenzo Bianconi wrote:
> Introduce l2_flows rhashtable in airoha_ppe struct in order to
> store L2 flows committed by upper layers of the kernel. This is a
> preliminary patch in order to offload L2 traffic rules.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

The patch logic and coding style looks OK to me.
Just one question inline.

Thanks,
Michal

> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 15 ++++++-
>  drivers/net/ethernet/airoha/airoha_ppe.c | 67 +++++++++++++++++++++++++++-----
>  2 files changed, 72 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> index ec8908f904c61988c3dc973e187596c49af139fb..57925648155b104021c10821096ba267c9c7cef6 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -422,12 +422,23 @@ struct airoha_flow_data {
>  	} pppoe;
>  };
>  
> +enum airoha_flow_entry_type {
> +	FLOW_TYPE_L4,

I didn't find any usage of L4 flow type in the series.
Is that reserved for future series? Shouldn't it be added together with
its usage then?

> +	FLOW_TYPE_L2,
> +	FLOW_TYPE_L2_SUBFLOW,
> +};
> +

