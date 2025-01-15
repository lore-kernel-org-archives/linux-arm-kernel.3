Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D702C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcRB4ko1ZjrbrTVZ1lrwHQASz7DCnLL447VOg5U/cOI=; b=bYILXDsLwvA1HuJLS3V3DdmVkx
	dJ1Inff2L5YHeXCyRhOjHYXt2JVFMIGo9ZuQIZksZ15cDre53UladPs/wmRoGX/69XaeME6o9Yyhg
	q/Vajy68W+PHX2/wAtBK0kLyP6aevhf1ovAxaF+sVvUUJ2JFd/yE+aLsKiv8jTJohakLkVNUky1aQ
	gyX1x/9SBnf90jciAKKRPNwBPujOXTdiNfjCTk/9F1KMj6630ySpOrzNQOZtLfz5q2w3od4LgxhSK
	ObTVm5V1gDMlVTDdq68Vc8QusGUNRr1ZtYweS3uXjO1YO9+IKGB5EQKeMLgY22Zexj+iHl80msEs+
	VAuGDteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6lY-0000000CWjw-3T5x;
	Wed, 15 Jan 2025 17:01:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6j6-0000000CWO9-3zeQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736960325; x=1768496325;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=e0Gl05fqy901Q1BxeSZO+bj7mPjy0c38JhE7NSFdyNo=;
  b=WvYRAgkOFeL6ap64c4NlCN292uVSvbJgfhSm4yp9kEiHZ36mm+SqCBX/
   chtzLiRiPtjHV2SYxef9D2UqXz/xEpxnIjmJCnE2W+Ztj7bKHjx77a8o8
   17fmA8ed7QarhGJ2bxagF2coM5eSQA+IwcDRtoQtCpUaWZMaXlkQ5FpLi
   hValyLVm0fBkfSKNJzbTA6mneW1Bp1xaBZ4HRti8wfDHR6P1ZsQLcslgr
   S+48uLZbbiCsCHLJdyfGwbmfL1bfWZi5sFIuecv1IeA0tPss7zlgQkVD0
   LUIfUhydBdQu9HPDfcJqySwUH+DoW4GDzK0+aRo12LBALpRyZQ8IBBUeN
   A==;
X-CSE-ConnectionGUID: md7QwRmVTm+cWqXRA6DUFA==
X-CSE-MsgGUID: e44RXRk7RR2CRLWW6OyhMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47893257"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="47893257"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 08:58:41 -0800
X-CSE-ConnectionGUID: obM7hJfvSBKAtfIjuZH2Vw==
X-CSE-MsgGUID: 3/9eDWrHQyO1JjQ+xwp59Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136049121"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2025 08:58:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 08:58:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 08:58:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 08:58:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vms2B6K2IziCGNDrwIwcb3RzfdXmDTLgRtj7sAQwJnvDLiYu9di95bDf5aU1ndg5hFR+Es2UdgojeZ6rRg0lNUBoPcNWLClaAKwPoA9qkm/VlaN29M7P5xFW3kIoOIziHFkDcEE+dMHQdZ+x0ypnyj8i3b6uPv32v6oU7pARvN8In1ZHEg+nVaiEDCZTO2dsTQ1KB68F38S2JpcA2FhoWNmEPhYDCudFNFicd+cNzJm68f50EJoVGB6Whiue1i8Ubhdsid1PSM69/R/X++Lix81jczr6xeNkMKF92mdhSi60RMLeyRJZn3rA6NuUrfBiKd3uR6HqYIiWOkikLxAnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcRB4ko1ZjrbrTVZ1lrwHQASz7DCnLL447VOg5U/cOI=;
 b=kT5FVoz/IaTeG5zQ9kAup+svYtuAbR2BYVqW+UKRG6fU6i1y8/R0UiQ1YTSaLDsSq5IAPFtORSnw58jx24AWxO2MxmH8AfO4k9OmHm00KtvjUEtErrdedD0gsEPsaUJIW64gsYLoDYCxvhRDw96cPP5/u2/RBkKPH5dBnYPEpyjJvVL0d3L/hDlIm6UwSqrrEj6mKDCGPi66ZHpPYOfg+4dZle60sCTdtzJue8O3ix2SJgCTjYCvPgv0QjACq9qaXVFgX/KDJn8eBMgdrOHlzdgDbgjmqWie+jZq9vG9RIcjmKDQ9IVNzOtfBl53p+2eam1bPJcLWhAMKNnGI/n/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 16:58:36 +0000
Received: from SN7PR11MB7540.namprd11.prod.outlook.com
 ([fe80::399f:ff7c:adb2:8d29]) by SN7PR11MB7540.namprd11.prod.outlook.com
 ([fe80::399f:ff7c:adb2:8d29%6]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 16:58:36 +0000
Date: Wed, 15 Jan 2025 17:58:25 +0100
From: Larysa Zaremba <larysa.zaremba@intel.com>
To: Furong Xu <0x1207@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
	<jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <xfr@outlook.com>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <Z4fpMRF1hfytUnla@lzaremba-mobl.ger.corp.intel.com>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
X-ClientProxiedBy: VI1PR06CA0187.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::44) To SN7PR11MB7540.namprd11.prod.outlook.com
 (2603:10b6:806:340::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7540:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: e63b9a08-7bac-4491-5036-08dd3585d9c2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pd/xpDei00PI1vN57lJjoIopf4kyVzygCjKsSv+1pHREwQTnCqcQG6BGDu2t?=
 =?us-ascii?Q?boJb+GFJjxAtUXpc7QrtvZrWdUvbCMiuOht0VzxZdc03UBGQVQ0GhXs/H3Jm?=
 =?us-ascii?Q?7GKjlse1cJE2PRB5BA+ytFAkHaooS24f7jJ74x9oFBmNkcstKCjdeMJq89QD?=
 =?us-ascii?Q?wtFWWznZ9eC95ShU0vfdSd6nQYPyq0zNtRGeuJeZYr+A6If17xGUgYtuIEqO?=
 =?us-ascii?Q?+UH/30VzL3rcoRAQhrV9fiz5Dd+fIshB4N8pWr9HRA4Vc/f7WAH9GzYsGWUY?=
 =?us-ascii?Q?Y++86nWJmB9qXVI23GfPdruBKKIqdeqc5979YFRdJt14PwKF7fQlnGP/jZuN?=
 =?us-ascii?Q?DmlTlln1xgw5Kt2iWn9fchkiZKlR4RqnL43kMgQ1bUSh8Tjk6jh6teUpSfEu?=
 =?us-ascii?Q?HwjXyfVrkwN9qZXY1GUI0f0tLch61AjwU9eryv0gaUz1igg2Vnjgh2+WoZ2l?=
 =?us-ascii?Q?enG6DZukFbIBfriRYJczc05Q2nTqn0Qo3Fjz0hkrqVHtEIP2L+ZhEETlU0rz?=
 =?us-ascii?Q?K1wXRCaJ3jf8/4KUBNRDOY9Vk9tCCwWgIZK4ONliH5IbDu9bdT2efrvhyAav?=
 =?us-ascii?Q?8HgySne3x5mCVCADlCE/BCtyFVXGnVu6xSeLGPee2NWufaljpYnsbLYarfRl?=
 =?us-ascii?Q?cJXdJzhge+4r+ISvhbL2LNlZlbT43NFTsCJxoboxOHEGseqW0qQVwnlsouNs?=
 =?us-ascii?Q?nAQ3m6dWiiojATLm4B84fd/N9aEb1hqGfeZbaraYoiinXwb47nwuFBSvWpaG?=
 =?us-ascii?Q?sEZehIzSNt+pgWA0/j7rHEFnqJA7qUAO/dg6xwFVvIE6KzjxCiAPZ1JjWm3Y?=
 =?us-ascii?Q?ly99BOxUQ9DRFL86PdctQQ99GUbQYA55bPOcfveOgN+zKyAZ6QUjtlb7Q4oi?=
 =?us-ascii?Q?Ebi4BQ115DriEZI6cTqoyXbjK8JyKQLoDG9t7oPuPni3iotaeDwZwhLgtaoU?=
 =?us-ascii?Q?emrD82Hfv+F4hymV2COcDqoxUoDN8fqpJG8Ts/brBfF88pYxm74XA3/21YSs?=
 =?us-ascii?Q?iyOnfzn9pOUF6aXIcXfcC8SHkSdOKQTNrG10mc1oZlkeFv7hkyW5YWwEKTIO?=
 =?us-ascii?Q?WJ/Dk2gZ7TDLISPEvYzbXuxVXuJbNG0clrrSB519AXsxIA9Jtbb+ZLpnXBNS?=
 =?us-ascii?Q?dKppCJkJJwu+EuXX9ZngMJOLMjIK0ad6lddCxZTU1JATNAX2e3U70POdbTu/?=
 =?us-ascii?Q?1Tmpx55gWuKFpzYT32TwgboVbMAWos7wtoxsA5cCfU+m8dtPo3KIegHIsStf?=
 =?us-ascii?Q?uPKa+5YrvDAXJmUETyb395CAwXH4paHMQHG95ETh1eCQVBpWP9ABKukAgE51?=
 =?us-ascii?Q?s9ne8q0fuCA2FnDn0ncxFx7JFxi2CMnkeFgpOZS8MoxoCfd3HgU1oVX8gqlF?=
 =?us-ascii?Q?hiIVBjmadehLjYKHKoO81ohRjDhN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJCBsCMmx6ZmerZLxjT7oxacfIXI1fA3ya601cz7yLbNLaqpnoiTIzzfGqgJ?=
 =?us-ascii?Q?+iYcL8oxMSxJQWh9gzf2z7AGOe2iff7RppbGvyE7QkHZk3tosUrEeyh2MBaC?=
 =?us-ascii?Q?uG46+Xuty+t78BP3zzwmwZzQ1aKvSV6P9fxFDA51P1+sym5Kd0DQ3WSPzEzJ?=
 =?us-ascii?Q?/UwQdR1Ua7kXszuCuHaXvBPjGU0TO3mNyvajNBPlXnKMuVjHvPnLrsZXwlrf?=
 =?us-ascii?Q?w1V8jXAlmz8Fwnep16zee3uSADKw5JaCYCfjZCNeTepN13Nit17DhfntKak9?=
 =?us-ascii?Q?e6FJoMH5eNk7UWIFdHZJMD3Gx3CZsTFsPhwyEsXK14oetJxpXjyPH9vXp6rn?=
 =?us-ascii?Q?SCOxKtP1IbdHAMbyUbJxvAoRSus/GpFGS0lp2Jgyr+Q1yvWCg1w6Ox7FP1We?=
 =?us-ascii?Q?9u9RNCN6H4xNMaAqMnzJngxtzZgDkEzf41IrRauAjRg58NU2H3ivIvrItzQK?=
 =?us-ascii?Q?xo7vwX3k//nNenKQbzds6dC8Qv9n++3jXD40nitC08jacPH9oCox1/sHZK6z?=
 =?us-ascii?Q?HRmKRJC6PpWdQo2w5LBdUfmFx5wtKVXVSHFLwDGz8RjuQ+irZynQYgKwV2yd?=
 =?us-ascii?Q?m/7ZLnIouV0UiV3LG/yocZIW3BTTuQbJp5wpMQuTwb3Zw8p7Wc4Qn3wnCyg2?=
 =?us-ascii?Q?b3lY7/MnsrVcS9ZaRJFyeY8vHxDkHBdiZfCeJaGO+v7N71+pJ6uGQ3up1f6l?=
 =?us-ascii?Q?ODlBd0HIl6xD5dwFn8YDHZaFt3mKhCXpZbcrlef6jvRkRlB7wt731JQPTry5?=
 =?us-ascii?Q?BmYXIO/3ArPm92HA15ShAp5tFMqe+UHSdi1kp9t4bTq42oeOt0XAsJEeoVL5?=
 =?us-ascii?Q?qyZGSp7Dl2ijVhqAqsIE3DRlVGnBfr1TfzttObf22nkLpw+l3ZULRrV761a8?=
 =?us-ascii?Q?bOAR0elKfzuJcWqVNiQpUvnJe5GLHev29CKnXmTBOgDIkEUEZA7fjP8+bBi0?=
 =?us-ascii?Q?5yT4HqjRDJKROAaL1bkANEt++aO2Uo4vhgzcU3j8cvK6jkt3ZQM34oIPkxB1?=
 =?us-ascii?Q?tu7turmsLbJ06rfrdXU4f3OXPOyGlb84P1yovvGFCCuiS8rRhGlxsXwMZ5Je?=
 =?us-ascii?Q?ECj3KeB3+d3u+qV+xUXWmjVAF3mRbfMDch1g8Kn0rMw2BKtJGeMFLuF7m18I?=
 =?us-ascii?Q?GWtZ3fKlf32fVnoelfbVBnAgktX6DeQu40RTgXzhiOhCX1Oo/RlUJEZr+XT6?=
 =?us-ascii?Q?mCR7MsjgtN3vfZQvIgrAq8deleWbN5XUggmzozp4esPUEwXbVrWBAcLDhhNu?=
 =?us-ascii?Q?hlTycZHVryYnQyCjizCDpCrymO61ZGC2sJajYA5rrHaBaPYW8PzH2uiN3zU0?=
 =?us-ascii?Q?uTxD2LgQ8oYDY0PRhKAlsbfAsbw9ryexvFgEElWPnKAp8rpR98+t6PQmsd6X?=
 =?us-ascii?Q?eFzuVU1PlZjs8BoosHEXxwN/tUE/lviMOseEJHxfkT6cgQGojAVcDOv/huho?=
 =?us-ascii?Q?PSq5tqNGvdiqDc/sptVWMulkWb6Tz49H46UkOSeOuIhuTFEOolTAVDdz2+ZW?=
 =?us-ascii?Q?N0t8E3EqVlWE27/tJlDr6JHJbWEJ+0kcGWL5MDCItZrvIE/1cD4EXtmh5cZy?=
 =?us-ascii?Q?vWa2ji3lg3jgEs769nScNV3cI15xdegr/nbkPS7fow+n2QTXZSIAx0ewnTuP?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e63b9a08-7bac-4491-5036-08dd3585d9c2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:58:35.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSiLdJnZLUgMyC/UtcZwsjUYUDzw223EFcGQwRC5nrzNpzJFKO+DCzD2nBaB3GEYqiGW2td60Z5h8q8RkHsBH1O97MNTBTQRJc2rCIZSk1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_085845_015429_F82CB296 
X-CRM114-Status: GOOD (  22.06  )
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

On Wed, Jan 15, 2025 at 11:27:02AM +0800, Furong Xu wrote:
> Avoid memcpy in non-XDP RX path by marking all allocated SKBs to
> be recycled in the upper network stack.
> 
> This patch brings ~11.5% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, from 2.18 Gbits/sec increased to 2.43 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Reviewed-by: Larysa Zaremba <larysa.zaremba@intel.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++-------
>  2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index e8dbce20129c..f05cae103d83 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -126,6 +126,7 @@ struct stmmac_rx_queue {
>  	unsigned int cur_rx;
>  	unsigned int dirty_rx;
>  	unsigned int buf_alloc_num;
> +	unsigned int napi_skb_frag_size;
>  	dma_addr_t dma_rx_phy;
>  	u32 rx_tail_addr;
>  	unsigned int state_saved;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index acd6994c1764..1d98a5e8c98c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1341,7 +1341,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
>  	if (stmmac_xdp_is_enabled(priv))
>  		return XDP_PACKET_HEADROOM;
>  
> -	return 0;
> +	return NET_SKB_PAD;
>  }
>  
>  static int stmmac_set_bfsize(int mtu, int bufsize)
> @@ -2040,17 +2040,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>  	struct stmmac_channel *ch = &priv->channel[queue];
>  	bool xdp_prog = stmmac_xdp_is_enabled(priv);
>  	struct page_pool_params pp_params = { 0 };
> -	unsigned int num_pages;
> +	unsigned int dma_buf_sz_pad, num_pages;
>  	unsigned int napi_id;
>  	int ret;
>  
> +	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
> +			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> +	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
> +
>  	rx_q->queue_index = queue;
>  	rx_q->priv_data = priv;
> +	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
>  
>  	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
>  	pp_params.pool_size = dma_conf->dma_rx_size;
> -	num_pages = DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
> -	pp_params.order = ilog2(num_pages);
> +	pp_params.order = order_base_2(num_pages);
>  	pp_params.nid = dev_to_node(priv->device);
>  	pp_params.dev = priv->device;
>  	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
> @@ -5582,22 +5586,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		}
>  
>  		if (!skb) {
> +			unsigned int head_pad_len;
> +
>  			/* XDP program may expand or reduce tail */
>  			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
>  
> -			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
> +			skb = napi_build_skb(page_address(buf->page),
> +					     rx_q->napi_skb_frag_size);
>  			if (!skb) {
> +				page_pool_recycle_direct(rx_q->page_pool,
> +							 buf->page);
>  				rx_dropped++;
>  				count++;
>  				goto drain_data;
>  			}
>  
>  			/* XDP program may adjust header */
> -			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
> +			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
> +			skb_reserve(skb, head_pad_len);
>  			skb_put(skb, buf1_len);
> -
> -			/* Data payload copied into SKB, page ready for recycle */
> -			page_pool_recycle_direct(rx_q->page_pool, buf->page);
> +			skb_mark_for_recycle(skb);
>  			buf->page = NULL;
>  		} else if (buf1_len) {
>  			dma_sync_single_for_cpu(priv->device, buf->addr,
> -- 
> 2.34.1
> 
> 

