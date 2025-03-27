Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ECDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5SqYzYnXnmGNunRT590meKqAhpbWHvWlVdjI3FoVGQ=; b=0dvxm8S1Epb9BTRzsszAdCiWVi
	nntdJL5Ymg7ZXeZFmMho7QzpGz7CmBpGhb7ZtEzPF31BhWOXt9gIl3Rog6lnuBHQVTVaDk6iRqwCt
	8p0ORIHYJiLnd8t9YlkC1k+vAncVftGmYGkEoKzUBKZ5fcz8f8izJLeuLy5+f8rearPNUhQSN26Wl
	amxGsBpTbUZvtlBBSvV8p5aZsijNbdlpaOsomXIN3D4cqU5DdFYKWYQLSwAzFg6JwdPK/HupCHRUK
	PrqhRHioZ0mzY8qTYiMGbEWGnui90yS3srQ7olbGd4/9Whn2UmyTeHivSNYcw3V87YqD54gD6BfD1
	6pcViScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnC0-0000000B3fi-0C4Y;
	Thu, 27 Mar 2025 13:22:44 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmw2-0000000B1Jy-37fE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743080775; x=1774616775;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SfQKlhmu6Cu3xDyk1TH1F3qJD7tN4ZBu9jlwRIs41bA=;
  b=g/O63KJ/U/ej57vt4R3rZGHW/Wa+gBRuL2qAyoPeUJTwKgvBQFc+zOd9
   iWpSIz0fgcvxd2zL6z/sCg/0P37jzw7gBx0/ZBHPmG28waPAV/fdjc7BA
   9LeSKdS7l/Q0uiOYRj5mbVlXgWnU2o/9Q6PrQwLlOuFSS59tKu6LsIFM8
   LUGBEEpifjgV6UiaF47qFf09AZZbjPq2tkANUIvI882STvonH4eZZElJz
   6VZjy/PGsiaMhye25rKEpaoVyLGT5e29KTMwtLQxh1G1Sx1c5fwbuAGAV
   dGKns6eirCrp1yNDw2xKxcnEYVs7MB1jur5V8/Co+jbWbtNeqR88sH/6Q
   w==;
X-CSE-ConnectionGUID: ne9ASMQjTtGIquzLr+UCag==
X-CSE-MsgGUID: v9DFi1KvRA+XnRRg4wYUKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44327005"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44327005"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:06:14 -0700
X-CSE-ConnectionGUID: SWzIYPHxQD+0VpgqJ4K3vA==
X-CSE-MsgGUID: HhJLqSXKTfCNN80uGKTZjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130228140"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:06:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 06:06:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 06:06:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 06:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpbic66WJSv8uTARu28AX9atuRfQDeORgcmGviNgDaH6AJ1lxSf3fPyQNV08w8UwgviTwaqSk8OOgqooxjwbZFlvrTrc3uJlSdgTLf2rI8Ao+OFtWpYPgEFvq7DwZVrs6AJkdBTL0tsgwhQqHbt8yZt/HEdBYEnNGdL/qk7X26gJl1AwMNp1JIglefKljyaLCjvGV+vRjjCX9FKPrBwhQep46ApEBfxdB/Qi/cKWusj8sb68vqaP2g/DjUSZfRHPIQHx7ADe27urqeSxzYXdmUgru3K3lERd1fnIZY7yjIi9uci6raLvL5eJDWNDyXR8oVDiORUh8jqKfSBKtCgi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5SqYzYnXnmGNunRT590meKqAhpbWHvWlVdjI3FoVGQ=;
 b=qFXdoBvrIUMLZjFgjKl0W043AgBu76f6PGcG8+8Uk0+VUvEm/Ly42YNkUeFhANUbhoSv45BjXdZElQhgCtsz/BTaXuA1I7FyczXdTzw9wx6vDnzDlnxWn5/51ACvpPlk6RZmHpFbFItI3QSIy6uS6bquYlOdSpPKLIAJupd6zFkJDu5+FSS6scvHCre98+dXHfPzbejeQ2mAebMhaXgASQ6pg9EOcF2H9fdhFRCTvybDdxDo22aXoHb9pYLpuiya6tUqmroTIS0InvN0LRNzwXzBLiUqZhyP21S4R365MPTQgU17RQa4OsK3JNIFVr1kn0muoV4+XQCKtFz+kKRjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) by
 CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 13:06:03 +0000
Received: from DM4PR11MB6310.namprd11.prod.outlook.com
 ([fe80::c07c:bc6f:3a1c:b018]) by DM4PR11MB6310.namprd11.prod.outlook.com
 ([fe80::c07c:bc6f:3a1c:b018%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 13:06:03 +0000
Message-ID: <fee7bc17-5972-41e2-8656-08edd45c040c@intel.com>
Date: Thu, 27 Mar 2025 15:05:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v10 14/14] igc: add support to
 get frame preemption statistics via ethtool
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
	<hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Furong Xu
	<0x1207@gmail.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, Hariprasad Kelam
	<hkelam@marvell.com>, Xiaolei Wang <xiaolei.wang@windriver.com>, "Suraj
 Jaiswal" <quic_jsuraj@quicinc.com>, Kory Maincent
	<kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>, Jesper Nilsson
	<jesper.nilsson@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Chwee-Lin Choong
	<chwee.lin.choong@intel.com>, Vinicius Costa Gomes
	<vinicius.gomes@intel.com>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Serge Semin <fancer.lancer@gmail.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
 <20250318030742.2567080-15-faizal.abdul.rahim@linux.intel.com>
Content-Language: en-US
From: Mor Bar-Gabay <morx.bar.gabay@intel.com>
In-Reply-To: <20250318030742.2567080-15-faizal.abdul.rahim@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To CY5PR11MB6307.namprd11.prod.outlook.com
 (2603:10b6:930:21::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6310:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afe3cbb-3359-4d86-9917-08dd6d30207d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NURRTlJUYU1vRkE2WHA3WG1ld21VeEtUMnFoOThZWk1lUjNjeTN4RlBBdnpo?=
 =?utf-8?B?SXlWb1NHYjNsSlR0bEVVNzUvUXBSOGVma3R4dVdjV1oyNWI1TmIwUzNhNENk?=
 =?utf-8?B?b3Rub2tLK25rQWdURzlRNkFOK0EwUCtmdWtHZWpVdS9PYlB3dnNHOG5nenlG?=
 =?utf-8?B?QkdxV1J2dkJHbkx6YWh0UFZ3QkpGZlNhWmFMazMra2k0aERnblRmcllwVjls?=
 =?utf-8?B?SWVualhyWWVGRjFLcXRTS0xFVSthcnBqbnJweHJiYTI3Q1Y4QXBtcW01ZXJi?=
 =?utf-8?B?THZEbjJ1c1hmNm9zWHlSMWc0N0RlNjRKUHhDUFJmWitQNVJzRUExaUxCMzhz?=
 =?utf-8?B?cDg4VXgwanZpNXZubmdlaWppWTBJUW4zWTlNd3FRQk9vVHNHK24yYm8raGd0?=
 =?utf-8?B?MDVjNWpSMzRsaEd3dW1BNk83K0FLcDZOVVMxdnEyVDkrY1ZtQ29pZVNlU1NN?=
 =?utf-8?B?aGVQZnhyWmVmYVRvZ0FFSjE0dUZhU3hlR3EwS3Q4eGE0cHd1OEl4Z2FFVWFN?=
 =?utf-8?B?ZmprLzBMdkRZcE9id0tHc09qQXI0TVdGaldINnREZzR6bURqWDgxSVltM0J6?=
 =?utf-8?B?Wndwbm5mTlpTMTUvK1d4c3phdEtNb0ZQUnIyRU5NRVF6SDJQVkprbmEyZlFN?=
 =?utf-8?B?MnNnYVhpMVAya0gzTzU1MHRHamFPODdYWldlVjZIVzBSVklPenoyUGdXVXNr?=
 =?utf-8?B?QVZaOWc4US9ERkd5OE95a21SelNYMHhCNWhhRzk2ellxN2V1L2VyZ2RKbmpy?=
 =?utf-8?B?RG9Rd0hoVEhvUGJmYTJWbzVlRnF6VU5UYWIvejhhVFo4K3VNYWNEcy92dFlL?=
 =?utf-8?B?N1FnQnJ0ZjEzQUFxWCtvTzI0SlliRlhtRHhOUmZUVU9UUk1NejhEbHNkV3N0?=
 =?utf-8?B?eVRpTUZ0Ty9pWG5CQkNOUThJYjBKQzk2MVRaMGJKS21UeE5lQURIdWhDV09Z?=
 =?utf-8?B?bjYyTzFIMkNFTnZYNDhEM3RZem5XRHdiSURpT2lXaDhGZFRTQzZoVGpkdC9X?=
 =?utf-8?B?SE15Rk1NUlB5ZmhEU1BsL05RdXh5bld3S3RIWWwyZC9tN1ZrMHJlWnN1aHpM?=
 =?utf-8?B?ZjdwMDRib0JCUjQraUpNdDdHZ0FtcFpvN1NmMEJFbS9IbHREZEVLMjZyVFVp?=
 =?utf-8?B?Qlh0MXdrVndYMlkwZGpkN0Fqckw3SGlYNE4vUHBZcHdza0o0VHJHT3pTQ3Yv?=
 =?utf-8?B?d0x6ZU9Ybkowa21sSllMWktiV0M1cVdtYlhGcGhHS2hRY1lHTGJiZ0IvQXJB?=
 =?utf-8?B?ZHlUbi9abzhxWEd4cmRaUjdMSTRHUE8za0Q2NGRBaWg4blMrZ1hEd05FS3Js?=
 =?utf-8?B?NzVTU2szOGZRa1ZQRmR1eVNvSkJsQi9waUE0RVRzeHdNNEQxQzFJVzg1VGlK?=
 =?utf-8?B?TG5vY2NPdWZZTlVLalNsZGQwc2dSQjcxSEZUbjRhemR1bTNTL1lkbCtLUkFM?=
 =?utf-8?B?d1ArbWNGY21hN3R0VkF2MzJyNUVuTENpcmlDbFN1MHdLdzZVYU5MazJVSUZ5?=
 =?utf-8?B?cFB1Z0tPdzhWNFUza3RPZ1dHZUdBbUtVWVJjb2dvUWlkeDV0VXFkcW9ZNTBZ?=
 =?utf-8?B?UlR1bDNlZElib0VHOFZGVDNUcG43azBmWjEva3l1aStzVE9tRWxQeElOS0t0?=
 =?utf-8?B?RVQ0TEJ2MHBvNTlzOFdHWmdrMk4vSi83U0ZOTFV6anU5aEpMOC9SUWliUmUz?=
 =?utf-8?B?cXN2eitOM3lSdnAwMW5sR245YlpjejJTTGY0Z0tSakpWYzJuSDcyVElwdGlN?=
 =?utf-8?B?OEQ4d3FMSXM2bEZKTGluK0pCUy9QU1laVEV3SkFGNzhWM1o0R3g5VlVROGtz?=
 =?utf-8?B?VE5FQ0xXQW5DV2JRS1h0YlFWUHVzNTl3OVRHMjVGOTk1Y1lLU0pYdkVPTXVa?=
 =?utf-8?B?YzVSWVpCT0x3RHRnZHhQS0tlSkVHYmhFaElpelhIL3h6TXpGSkVOcFo1NFZs?=
 =?utf-8?Q?Y14oWnGWOAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6310.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklzUGFXUVFRNVBZVm4wdGJqd0sxQzMvTHRHa1FMQW5BelNLU29uTVBVdGNi?=
 =?utf-8?B?ODJVOVBqSmtiVUdWSktiOEVSUENlOFczTjQ3NTZ1Vm0zbEdmNFd4aHhiV3JY?=
 =?utf-8?B?N3doUko3RU9CNG1xMExaTzc2MDFsYVdua1hNSzI5WnNVcGY2Q0I4QXNBVWRa?=
 =?utf-8?B?NVc4WUs1TzBDQUpPcmUrKzZWbVVOQllOVXg1TE1ZVEs5TDlLeExsTWxZdi82?=
 =?utf-8?B?Zi9YZlJ4bUhaQzA3ajYvMjU2QTgrTGJ4Y2ZPVWd5RU1jaE1NRkx0QWVMYUdR?=
 =?utf-8?B?bDhUNEU1NWwya2JzR0NpeWhFVDVZdXhUemcrVHNLSTNoOGRSZFZNdU9uR2JK?=
 =?utf-8?B?QWFxV0JKeXJVV1ZnWjhKZXIraTdZbEQwSXh3WmtYMG5waTlhbExoazNpWkh4?=
 =?utf-8?B?V1MyRnVZM2NlQnhFVTdWdVk3d2FkTkFKQzdHaU51eW10cm9PZ2JVa25FZWJN?=
 =?utf-8?B?T01vNVNOdEpsK2dMNnBjWk12MDJlbzdaQmN6dktUV1MzV1NFOUFSUUlWVTgv?=
 =?utf-8?B?OU1XK3V3U2NZcG0wVmZXL2NxU3I1dm5wTTBKS0pEQzU5QXhQUEhuRjIrNU5u?=
 =?utf-8?B?THZoL1A5QWI4K1hNMDhGMjJ2STdickFsbnZIcWtUZk9jaGZOQ1Q4cWIxU1U0?=
 =?utf-8?B?QmtDby9HL01OS0IzcUJoZkpSNnJQeVhrb3JpakdQcHRBenp5Ym1yTnVsajZE?=
 =?utf-8?B?RUtaSngwaWg3QjBJN0owSEV1QTJhWmhYRVE0MzNzRTYzQ0NnaTdubjdla3hS?=
 =?utf-8?B?SDE5bWVaQW1nM1VmeHA2MGFteGxzdmZ0aEZDejRCOWFUZWI3S0hzY0oySklv?=
 =?utf-8?B?TXdHQXU1Z0dMdmZnM1c0UzFBMmpuSzE2Vng4TXZoN0tvWmozOXlKTHBwM1pR?=
 =?utf-8?B?OVlMWDAvUjk1NzVhUHNKaGdhVFFwL0NxTDFsZjFLUElZckxCZHZ6WUQ1Z2cw?=
 =?utf-8?B?Y01YNXYyMEhHYTArNHltY1VXUStQNVM3UGI5VEZGVFhVTCtSY3VwcHFEVFRi?=
 =?utf-8?B?WjdpdnNIZG5qSW5CQ0xuRW1HNEEyYU9BY0cxY3YxbE03OG1DQkNNZ0FzM2tV?=
 =?utf-8?B?K25vNWYzV0ordFg1L09XRzdiY0Zrcnk4b2Q1Q2J2ZE1sU09vcFhPQmYrWkdR?=
 =?utf-8?B?SzVPZmkvTW5sNE50eFMrQ3o1eWhiQWIxSVhEUVQvNGprOUFqL1VQbU9Gdkgw?=
 =?utf-8?B?UTRQZExZVGpiYWJnTHhjVEV2N0NyQmp1SjRpMm1xb0hsOGoyb21VVXJzSG8x?=
 =?utf-8?B?U1I1OWlSaGx5V3QxaTJsUnZ3OEtQRGtvbHBhQWhna3ROc0tQNVNBZTJiK1d4?=
 =?utf-8?B?dFhyN3BrTmNjbzdvTXZOeDhDVkVOVFNsUzBtbklFUDNuOUJFZHh3T3ljTXcz?=
 =?utf-8?B?OXFZbTZsT1JqVis4dE5KUkVJWkE4MVdqd29pdk93WjdVRTFTVStyVi8wV0k4?=
 =?utf-8?B?SmNZdzZLUjBZY2diQSthcFBSTk9lQ2UwUy8xQ0E5VEhUalJOdEJ0aldRZEFq?=
 =?utf-8?B?K2lBYkxxdm15aWVhRy81WXcrbkQ2MDdKRkJGR0dXa1lTWTJlLzZjQUJ4Q2J6?=
 =?utf-8?B?SGtUWFZ3bVFwTjJXZTlBQ0VKQmpXemRTaHpiaFAxOWVKR0laWk1tSVFMbTI2?=
 =?utf-8?B?NTJHQW42SFZuUll5Z1ZVN0RtRmpFK3EvN2FWUlgvWk53U2N6ODQzYmdqSzJh?=
 =?utf-8?B?VEJOMnlrU3VnV2lSNU02SHNvbU1Ydlh1QWFqdTVTMEw2ZzR1QTlTK0FBTFJn?=
 =?utf-8?B?RmtwSE9XS2d4Z1drb1FuSEZrOVdEUVcrM0tCbnF3bURUVlJEZnYvTzVOcXZN?=
 =?utf-8?B?S1RFTkRObDc1Q21qbFZyYmJQTEwvUTl0NWNwRmxDL3F5NzVFMjEvekZzckU4?=
 =?utf-8?B?ZUlTenM4OXhpbkNCMXRIcmFwTlE2ei9odXV5SVNJRHFPaEpCaUtMM0xhQm1G?=
 =?utf-8?B?MTQ4TDRneFpLRXQvOGIzVGFwSTU4RTRnZEhBT0NVbzZLdW52cjdubVgwRjdE?=
 =?utf-8?B?WWVIWXJCdWt2MGxTdkQzeXFCZTJvZ2ZFa0dwalNGcW5maXZhYkhTb1NZMS9h?=
 =?utf-8?B?ZDVVWUt5R1VkN2xaakF3eTRBNklMMC9IaUlQZnVIWnNUc0lqcU1aL1dLVzJP?=
 =?utf-8?B?L2lucXNtY0JubDNiZGRxRnV3QU1PZ1pJZ0NycFlFczB1QXNVOGcvT2NkeS9o?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afe3cbb-3359-4d86-9917-08dd6d30207d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:06:03.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kd3I5UqAA9FZmBf6v1RqxQgn50susbTin85/UsSK63UfQbUrXjkhzQAgax8cRuvuinORjuxF+JjVJPZK1nhGtkcZ0O0yJ53ePWdquoN57Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_060614_843909_338A414B 
X-CRM114-Status: UNSURE (   8.96  )
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

On 18/03/2025 5:07, Faizal Rahim wrote:
> Implemented "ethtool --include-statistics --show-mm" callback for IGC.
> 
> Tested preemption scenario to check preemption statistics:
> 1) Trigger verification handshake on both boards:
>      $ sudo ethtool --set-mm enp1s0 pmac-enabled on
>      $ sudo ethtool --set-mm enp1s0 tx-enabled on
>      $ sudo ethtool --set-mm enp1s0 verify-enabled on
> 2) Set preemptible or express queue in taprio for tx board:
>      $ sudo tc qdisc replace dev enp1s0 parent root handle 100 taprio \
>        num_tc 4 map 3 2 1 0 3 3 3 3 3 3 3 3 3 3 3 3 \
>        queues 1@0 1@1 1@2 1@3 base-time 0 sched-entry S F 100000 \
>        fp E E P P
> 3) Send large size packets on preemptible queue
> 4) Send small size packets on express queue to preempt packets in
>     preemptible queue
> 5) Show preemption statistics on the receiving board:
>     $ ethtool --include-statistics --show-mm enp1s0
>       MAC Merge layer state for enp1s0:
>       pMAC enabled: on
>       TX enabled: on
>       TX active: on
>       TX minimum fragment size: 64
>       RX minimum fragment size: 60
>       Verify enabled: on
>       Verify time: 128
>       Max verify time: 128
>       Verification status: SUCCEEDED
>       Statistics:
>        MACMergeFrameAssErrorCount: 0
>        MACMergeFrameSmdErrorCount: 0
>        MACMergeFrameAssOkCount: 511
>        MACMergeFragCountRx: 764
>        MACMergeFragCountTx: 0
>        MACMergeHoldCount: 0
> 
> Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> Co-developed-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
> Signed-off-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---
>   drivers/net/ethernet/intel/igc/igc_ethtool.c | 40 ++++++++++++++++++++
>   drivers/net/ethernet/intel/igc/igc_regs.h    | 16 ++++++++
>   2 files changed, 56 insertions(+)
> 
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>

