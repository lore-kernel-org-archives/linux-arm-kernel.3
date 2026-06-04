Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62312CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv2y6zM3XEt92EoJZfiI2PBskhLmbb3yQxDrFnw92Hc=; b=UR/jysc2L4TFiC83dYj8/SDfK4
	uN/NSQDUZdbY0wu1kx6YhEgNCp+i9P3h+tq19k6vws+p5SlnATb8N9/NIn75pqnAmG/T11iyyqKwn
	RmYhGQOoB2F68IxU9Wu0u4nTwUlAIIF2Nj9hqVAlFZoRc+T30Jmh9GpUm4naTDJCgWLcLfoAlNrVi
	QEbdjLx6p20PqsZZdm5LwvEjKADQoQQqEp7LmaEjxEolxDIg6jdYGGe4pl3kLeYtTvU4U7iO/VCAt
	COktHZcjEh1rV+JbW4NwroHAsPNo+1nft378mEfw5EVHzFrryYVvyrkWteE9xFOh9j2j2LgtmDaun
	K6F/O85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVC1p-0000000H8uF-3y2U;
	Thu, 04 Jun 2026 17:38:49 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVC1n-0000000H8tj-0Hc4;
	Thu, 04 Jun 2026 17:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780594727; x=1812130727;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=10kqgNwJP1Viy6M515oW44vnTYc14tf/WxWhMuWphRs=;
  b=UeFc4hEfqJiTp70xnUUuvvxZC8ptdt+zJjhZUoCzyC7f9JiufM706dU/
   UsJX3ts90A6dKrNgfL1WyTR1UmvZgePly460dNJhwWA06kNoiQ8F59iEd
   izUAgq4QQcTOEAZn3w8h4uY2djuc635WWExnoXfkXYniS6wh3I0PMlCOw
   +jt5mHhU7VgPnBAhB2rfOoahI4rINoNrwWD8xH4akm2PJQVfLzyVmq+wV
   inNK2QhfgQ6ajRFBXfCOYfaDlih0fNhXZUQhBeDiYmGwfrDnERnWppTFP
   9waro6EuBKeoffNk7ZWhqIJj1tFERLxlMtwa6LfXaX9sjXUZr/XzarGRw
   g==;
X-CSE-ConnectionGUID: 5tRGO7qnTsyJLHPyVxHrAA==
X-CSE-MsgGUID: StjpAy6xTiO8K/rD5QUrlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="68964486"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="68964486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:38:45 -0700
X-CSE-ConnectionGUID: 4OIMuSD4TCScx1zSQaShVQ==
X-CSE-MsgGUID: dkewWaIKSCaqwVHrapfbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="282703291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:38:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 10:38:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 10:38:44 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 10:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReVKXF5B7k0mJ9vk/79IRLpV/QScivsR2978fORt7XUisVL7tLgQwHWbKubUXl4A5/5RSD886HBBPH5NgeVS+f8Qjk3FjxWgP+PXydzKcSk3+1gcNsT6Qkh3E3gxNH+r2xBpIbbjkR08KF+rkL0b1PuFLqaHxotw5G63TvH8BmOxm4b6V/vEEsuH54ZBQe8FmIdWXIRzuZ0+xj3IDzHYKH+5QniS03nkV0p8De8phH5K5MeXts6bi5SMjYLF9hx2dqCXCbbEyxyVV3wQpY1Kp+ChW8i+ZGTcnTRmQlqajaa0t4y+Xa8uJtoOZM4naFGM1oIYc6lDrWVCBrad0+fnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv2y6zM3XEt92EoJZfiI2PBskhLmbb3yQxDrFnw92Hc=;
 b=S2k/p1Xs/KMbaTaBhfVop0B7bs7ghs+Hk1sY8rRG5muH4xz/DrncaM/r5RkO3Bkved9mS0f6aql0qVvhRyXpHDDHRVgfCILTd6JOmQOMa/3m2nPogHTWMPMuUNJyKqlvCcz/dx4VDz1QN4+Hx05kLjeK/NB41ICTfVuRGZfLR3TqmneDvG7G4xzDG2KOa5LJp7+spkJvsi0j74QxEO1B+05XTF+vdC343h6i4DWznhsaldC+Z8qJRQ0tkdYCD5Y1AMZx9DnSHHOSQGqAxBhjF+KTyW9Wx3X/oRnpcBOSM+cxM1VRn9hKnBQOV7//xDwMIzl0WBz44PEOl2IRqbRZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 17:38:37 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 17:38:37 +0000
Message-ID: <21810a20-abe6-4490-969c-cfd62c4c082a@intel.com>
Date: Thu, 4 Jun 2026 10:38:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: airoha: Fix use-after-free in metadata dst
 teardown
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Florian Westphal <fw@strlen.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
References: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
 <20260602-airoha-mtk-metadata-uaf-fix-v1-1-3aaa99d83351@kernel.org>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260602-airoha-mtk-metadata-uaf-fix-v1-1-3aaa99d83351@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 10157a8e-1f94-4806-74bb-08dec2601b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ID5ETZEIeDXSb3VJyBY4tzF8woF3jfGp3ggRG/5VMdeut+EDkYfYjqfbPQWFIETMJYkKEO1tBLrt4payHax+64dAfKlkP+tBFFIDbNxxpRYwu6S0E+cE7od9CMaHFgmtuC9SQIUZKbw84UYzW0H1gmFJyN17Zj1hohGwbmulITPOBzWjWDvg4nWksSCZmM5EcxNV0zI1I8kQd4T4fyl4gCSJ9fhPhuWzrEB8MjwklxuiZmTfQOOgR7G0RzxkoPEhYpdHD3gzhrgh6q9eLUkK4GS5smZk5JGJG/UyoUdNp/5qcs0JgU9H0krOWrvTTnzB9znfR5bL+xHfqHfKcL6uUjtgnft+S8ouJoRAMyzKVOxHD6BhJtyxEYEXf2f3agFRxga2UaTztHdkeDv+AeQutqR+ZW462r/wOvqix21rfwRKa79NGPPPJrlO2SvsNrNQ9koXsUeE4zAYwD9y6qXIwpfleMVjMI3AbLuP7xO4hQWdv2gInE9TexaDlL9vi/e2gyiogQrxuS+6IHP9Hc9j1c7G7iittil5jLB77gYiz5QIH4ZUoQUR4G7202FotUbGHzVFOglOmgZOV9ARMQdWOEbA+qGsiPF2v50VBC0PM6MPv/eQyhmpnblCHYXwDtFb+SDK0eSOCPVmZMafrr535y5lDrU3sOhd3oSTJC4KzSW+uog/RWDmOyQbg2f1pKxd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2JtMkFVYjFzQzB5MXd1SGhjRXdubUJOcEg2Q0lFQlh2T3JiekcxcVdiQTNN?=
 =?utf-8?B?T1NjZXhYeDBOU2Npc0NMK1QvSmZGRGQ0QS9yOXEvOEswTFZGQVpiTVQ2L0pV?=
 =?utf-8?B?WEZHc3I4LzU2TlVFZmpWR2tiNysvbm9UUFRzcWhVaXV3aDZaYTNRa2orT3gz?=
 =?utf-8?B?WHNNSnptU25hYkZsRFREeVlKQlBRNUl6dlhaN3o5eTErMXBhTkszNEJpeXRX?=
 =?utf-8?B?STlqNUdoeXlUUmlVQkljak5BZ1V6U3FwaGJ1MnZQQk5QeXFtN01xbFhybkMy?=
 =?utf-8?B?Z1ptNS8vRHo4NUhLbEJ3UFVsallvUFM2bm5mWWw0M0pNb3lrMnV3K1pTNzBL?=
 =?utf-8?B?d2RCN1pjRUFVOEhMY1hjbVpZTjJzRFhUOTVDYVphVUtGTmpsM21BUWk2c0tM?=
 =?utf-8?B?MzNZY1N6R3paRHJzdnhHMDhhV0YzMGxCMVVjaWZ2UHIxSTJoRmJoRmlXUENK?=
 =?utf-8?B?Y1gyZ1JXczR6NEZhU05IY1ZzQXNQQmpWVE1nMkdFZWdmSmt0b0dOOHRFdWwx?=
 =?utf-8?B?bFZCdEl6dGEya0p4MHB5ejlaVnBVN3pMRjFkTCtoNXBWSHNWTWorc3NIWk1m?=
 =?utf-8?B?SnNmamZiZSs1SHhnSnROVWdBTmVzNXd2SmtHZTRtbndpK2hUN0pNNHlQMWh4?=
 =?utf-8?B?d09JMEhLajFnU0I0OGNid0t5KzN3dEQ5OHB1eWcwWU9HSUFFemJIc0ZYYjZF?=
 =?utf-8?B?M3pJV1VVNm1kTkI5ZTVUWGszWUxHTjR4ZUYrNXNCYUdGZUNuRWtRVjJXVjRL?=
 =?utf-8?B?SEpsTHpPU20xc01LZnphL2JpZUs4OXUyZ09NVEg4dUR0QlE1WGRVNlg4dVYw?=
 =?utf-8?B?OWZCWWtadDcxUUNnL3NYUlo2b25MNnI4RjgzQnBsdmVTbHcvMG1oRlNTRnZT?=
 =?utf-8?B?R3dVeEhsNTRXbmJQYzZLbjhIY0JMTmQ4TW0zbjl1QS90OFZXdnF6WFBHREdW?=
 =?utf-8?B?VUVHVVdyeHNuNjl6SklyeDVkdmVtVFBVS3ZkejhveGo5ZDZ5dEo3NGpFdWhL?=
 =?utf-8?B?TGszRGpZbkUwdmhSeTZ3aE9FSGRhb2svaFlEK0trdC92UjJ2VllTZGNkZjJM?=
 =?utf-8?B?TW4raGRBNHZNdjZObVVpdG4zRmFEWm42bU5qUlVkOEtRYmRsck5MY0dSNHF0?=
 =?utf-8?B?MVlIa3BrZ1ljK2NzeXYvWkdyRGorckFMWlcxT1ZnVEd1UlM1MnBqb0pmZjVr?=
 =?utf-8?B?OW9Fb2tQSzlheEM2OGZ0WGNNcG8vSlppZDBNZWZkem0rcjFFN1J4Vk5uZUVn?=
 =?utf-8?B?L1phY2w5S2s1c1pHZkx0SnVkSzA2TlNHUEpHVENjbHlZMjJXaDZNaTR3K21a?=
 =?utf-8?B?dzc2QnpLNFdINkEwSWZpN0c1NUx3N2I5OUJwSDJXcjk1czNJTmNyRTlNUUxM?=
 =?utf-8?B?c3lHVlorUEkxWHdZTVdsNFMzNTR5NlkzTmZ2MGh4Z2hZOGllNTBXRlRXNHR2?=
 =?utf-8?B?UitMUmdUWkhNMjltZis1M2RsMHVIZVZ1TXB4cWhIcEdhbTc3N1d2NG5wN2VW?=
 =?utf-8?B?NGtiODNpdWpWNjd5MTFyc2hWOGV5cy9zM1d1UjB6Qmptd2ZuN0l1RThxeGI0?=
 =?utf-8?B?YVFjMk16QlFaME9EWXpSM2N2bDZLNVVqenNZZEZ2RGNUZkV2eWR6SGNtU1RN?=
 =?utf-8?B?bFJ6bU5QcitSRmU2UlR0dlFOUnVIR2o2NVViRVNnMThYOXRhTWo5UGVJckhZ?=
 =?utf-8?B?QjcyS0tFeUpsSDhlNk9PMTNGU0xSS2dVdjhJNkRxYXdxSHN1ZU45ZkEzZERt?=
 =?utf-8?B?clY5L0hEL0dPWEEwTWQvcE42UXE5ejR3SVpRRVpSd2JBUW5qTXdvZjNubmtN?=
 =?utf-8?B?L2p2QnVRYjZqL0JOYVZSb0Z5Sk5Jc0FwMVFGRlhyaU1UM0kxaStQK0U1VWE1?=
 =?utf-8?B?ZW5JM1lPYmlqUmc1K2tNUTQ1VW55QllURzA4ZXJIR1VIaEpzcnEwQU90TEJz?=
 =?utf-8?B?dHFIWHRQR1lzS24yQitlcU5XZUJRbVRSUGlpbUVScWVhanlZVDA4NmFIRXB0?=
 =?utf-8?B?TE5TTnpFK0RsdVgydkdCTXBEY2V2T3orZDdLekxwbWlpc2dUbjVXY2U2ajdZ?=
 =?utf-8?B?bDVMRFZLS01nOC9TU1pXUWhvcDY4MXdhQmRUOVpEaEcrVCtpd3hpVDNsOS9J?=
 =?utf-8?B?MHNVZHR0d0dSVTlydStQVmFRWmFDNlRYR2R3SkxRbGFhRUdtcm9ldW1qaUM3?=
 =?utf-8?B?TzBLekk1OUJBMkMwYmFNRTV2WHpqTzEvcGNnelMyNVJLQ0ZjRlJuZFpDdjdn?=
 =?utf-8?B?SUk4bmNRWVdZbkV5eHgwTGxLRlhHaTladG1YUmpKV1k3K3F0YkhzdzV6RlRT?=
 =?utf-8?B?L2VVdVRvb01oSFBGTmIrRXlJd1hFM3dPNzJPTzhxZzBiNTZnQkNyTU15N20r?=
 =?utf-8?Q?HKtBPmcA0Lvoj+Pw=3D?=
X-Exchange-RoutingPolicyChecked: CY+PCxMWMGTbXaus/HB2noN1bQsGp8QzTSCQd99p73ESnG1bDtwE6ZfS+u2uosXzUgHksnQj/Qd8SRO4rO+gpoXZOOOxgL9twQRpS3GqIfbj3Drbimy/h2vc/8CcEZFogCwDlniTU9lMbbkEr3iSKsqeeSlz6ZPUWXE1cE6x3z0OjKOD9vKfEVAtblho4uHo43ISvWWNqIBPUsvNQkpaKBanMyzZ9KkK/SDGOXxLiOviWUtjnPyM6ZZm8g+xXTPpoCLOxuq2L8WulErVHxiF1EjfgK+DfP9DVqlAK3Vvom5nFEGyh800Rb5Hz6mzi3TBzv6c4IvlaOuUOBnrTMnG9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10157a8e-1f94-4806-74bb-08dec2601b8f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 17:38:36.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9mlcfJVxkDyZ3OwbWlfu8bvbcGw/1UtPLvS8g1S9IL/in+4Qp1Vsvkxt2pW9bDu5achyBmokKgt7RA3gfttegN5gGqnnW7k3w9UEF8U/tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_103847_152931_5E97DDD3 
X-CRM114-Status: GOOD (  22.69  )
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

On 6/2/2026 2:21 AM, Lorenzo Bianconi wrote:
> airoha_metadata_dst_free() runs metadata_dst_free() which frees the
> metadata_dst with kfree() immediately, bypassing the RCU grace period.
> In the RX path, skb_dst_set_noref() sets a non-refcounted pointer from
> the skb to the metadata_dst. This function requires RCU read-side
> protection and the dst must remain valid until all RCU readers complete.
> Since metadata_dst_free() calls kfree() directly, an use-after-free can
> occur if any skb still holds a noref pointer to the dst when the driver
> tears it down.
> Replace metadata_dst_free() with dst_release() which properly goes
> through the refcount path: when the refcount drops to zero, it schedules
> the actual free via call_rcu_hurry(), ensuring all RCU readers have
> completed before the memory is freed.
> 
> Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index cecd66251dba..eab6a98d62b9 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2936,7 +2936,7 @@ static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
>  		if (!port->dsa_meta[i])
>  			continue;
>  
> -		metadata_dst_free(port->dsa_meta[i]);
> +		dst_release(&port->dsa_meta[i]->dst);
>  	}
>  }
>  
> 

the port->dsa_meta is allocated using metadata_dst_alloc().. how is it
safe to use dst_release here? Seems like we should be calling dst_alloc
instead of metadata_dst_alloc in order to use dst_release??

metadata_dst_alloc does call __metadata_dst_init which calls dst_init..

I guess the start of the metadata_dst structure is also the same address
as the internal dst_entry struct...

But dst_destroy does a whole lot more than metadata_dst_release so I
don't feel confident in this actually being a drop-in replacement... It
calls netdev_put, it calls the dst->ops->destroy, it releases child
refs.. Or for metadata dst entries is that all basically a no-op??

I feel like I'm missing something here.. The driver also calls
metadata_dst_free in the remove path and that wasn't changed by this
patch either.

Generally it seems like we should be using the same API to allocate as
to release the object... This is confusing. What am I missing?

