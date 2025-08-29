Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40234CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwonWdeeRZyYuSNFsfS48KjUFtBMTqBHOmXcsMQ9nmU=; b=L4wpCnwDayS6bNQmjGdl5OgtzP
	+AaUYMnURWdqcm0uFe3iR6Q93u0xgrr/c950BasWbmEOk3Eqapv98IdH5IKz0tgz103eX9oDI98HP
	QebvrXw/jQ+g2vQ7GeP6/W9n/8yRBSYjiU23QE2wL6dCjT4SdINgHktIKQlH77bc3DH24CRahrl8M
	Xj7aKzHUp3zOnwh8lt+1mXg7ozqxpcNw8hUmCl/Mt4rQxdFDDLEyvJD1ySx5pI9Wiznn6nUrx9w+j
	w282gKphk7YRvs3a8mWQxBDT1rF2ZVJpetLg9SpA3g6zL8X33+pLY8ibDvKvLvaItjtsRr2mwLY+4
	ZRT0r6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oP-00000007CPj-3smI;
	Sat, 30 Aug 2025 00:51:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us6cS-00000006tJf-46cA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 21:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756502809; x=1788038809;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=QwonWdeeRZyYuSNFsfS48KjUFtBMTqBHOmXcsMQ9nmU=;
  b=nbX1Wkjh51+gP0dIBgJ8vlqMB2/0EI5+LY5dGit+290ovK803FlFM7qW
   F75eIASFIQ0lgF5bel5HIdG/ccZ9FOZZ85t+HjsNE5NUnRhS8isO0RZI/
   WYmGOSHYJFfe3YrmDSgVPUvAQWIWZFwjjFqy7YDc7oroNTOQVf9r1tfzn
   rW2L47yjbQSWZkkhYqNy8DwrJcxjxXa6GYg+/QV2BwrWj++gkyipDU/g8
   ju7ZpEiF3pfa2eO1KX6tsLvn22dq7/sQqhrPsX9tGj7Trmx7sg/huyzWn
   RfD6wBUrvzxVhR90W9mylKVyqiY9Omv/OGyEG5nTy8425uzLIHI55QZ19
   Q==;
X-CSE-ConnectionGUID: 9aPPkK3GT3+8aG3Mt1rLIA==
X-CSE-MsgGUID: RA7F/vqaR3iMxlXXkBihAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62440494"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="asc'?scan'208";a="62440494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 14:26:48 -0700
X-CSE-ConnectionGUID: vAZaTUCZQjCUxNR5dpPIjQ==
X-CSE-MsgGUID: 06TUpqkzRQu+AM2ssZFcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="asc'?scan'208";a="170043238"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 14:26:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 14:26:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 14:26:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.76) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 14:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMDjjAf4I5lrzp/nRBv8sOTFuUOrk0WeeKrUaDQ1bqg0/AFZd/L4ufVtjrQmrIy7wsaa3xISsLe0R6IlNPvtSCBBvgFuqSn5Tnan14UEPpO0XMxq8/arJBTFNeZ6jWOt555jM3/N1XaDfWkcAjTa1Pp2BvTk1CFd0J3j/u8VThADI8C72vw1ExaZED4sCGcuCJVPTvXhbhGQW/zdyEVBdbMd7/06UHzTX6kC7gaZofDkXfeAHof83qPHi2+i8qfW2GUFnUJUYPncasZj49CAcEMO077+g0dmSY7Z9USZibWMcxvkaJEA99gm+msF2X9eHjP4nT+/s6WKW4U1dQ5TpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwonWdeeRZyYuSNFsfS48KjUFtBMTqBHOmXcsMQ9nmU=;
 b=oc3fQDc0EeCnCI+m7C6sW4Hx5LpzSBrHctPLwbQgxvNpBWVNBdIIMXptYGMYZMCKs6iK1kuVBYCUb6yeL6olV1pi+s7h+F7KgWz+kCcYt324GSWwFYU7fOnOd0vzhvAue6cOXXCfvxQ5LZd1EiiPP6cimt4i6lTpUkA/+PqeXqQMNiljUOuZM9ElpWH3ZvSFxnJmdxh3DEP7l+KUYFCz9lvLXBra0OUFvNDA+KVWfq8eqHsNG5ZpyRLYWXQ+BSL1g7rModsU+ydZTuu344R5th8zn4Ck5hUqR51VPp6mcpXSOxo14LAny8aq/l5ice9n+BDa6nEZ2SdDhIc88K11+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Fri, 29 Aug
 2025 21:26:39 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 21:26:39 +0000
Message-ID: <80710850-5b3a-400c-9ab5-749f785edb24@intel.com>
Date: Fri, 29 Aug 2025 14:26:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: mdio: update runtime PM
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
References: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
Autocrypt: addr=jacob.e.keller@intel.com; keydata=
 xjMEaFx9ShYJKwYBBAHaRw8BAQdAE+TQsi9s60VNWijGeBIKU6hsXLwMt/JY9ni1wnsVd7nN
 J0phY29iIEtlbGxlciA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPsKTBBMWCgA7FiEEIEBU
 qdczkFYq7EMeapZdPm8PKOgFAmhcfUoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQapZdPm8PKOiZAAEA4UV0uM2PhFAw+tlK81gP+fgRqBVYlhmMyroXadv0lH4BAIf4jLxI
 UPEL4+zzp4ekaw8IyFz+mRMUBaS2l+cpoBUBzjgEaFx9ShIKKwYBBAGXVQEFAQEHQF386lYe
 MPZBiQHGXwjbBWS5OMBems5rgajcBMKc4W4aAwEIB8J4BBgWCgAgFiEEIEBUqdczkFYq7EMe
 apZdPm8PKOgFAmhcfUoCGwwACgkQapZdPm8PKOjbUQD+MsPBANqBUiNt+7w0dC73R6UcQzbg
 cFx4Yvms6cJjeD4BAKf193xbq7W3T7r9BdfTw6HRFYDiHXgkyoc/2Q4/T+8H
In-Reply-To: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------H2NrOKLHilrcRE0mwhtgw0g7"
X-ClientProxiedBy: MW2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:907:1::15) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc4a28a-fd09-4da7-268a-08dde742bdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXFQRXpORU9NS1U4S250azlGeExVT3NUVXlvdE44TnRxNFNXQmRiWUNYTVRx?=
 =?utf-8?B?cnE4RjRDWFlTZUQwc29pRUVSRElzNW9NVFFZbE5ZUlFLRW1tR3hmT1pEd1Rn?=
 =?utf-8?B?N29DdnlCTDV5VDh2akIwTnhkNzROYjg3ck04T3JqSlRDQW1Kak5tbmhaanhl?=
 =?utf-8?B?WERmZUhuaTlCRFZXbjk0QUhwMWlFR2dnaS94Q2xpakdjcUR2OGFHK2VFRTRw?=
 =?utf-8?B?SEFsMGg2NDlQOFpaUllNSGtJMEZqYmNiUUp5YlVwQVpiY1RLQ0VlODlpWmU1?=
 =?utf-8?B?K0lXRnNGamhFRElTNlZWYm1HZjByRVI1Sld1R3NYckkwM3RrZnd2czZsa3F4?=
 =?utf-8?B?eVpzck5PNURGYnRrbmllczBCMm85ZmtJNVdsUmZzcWRTc0xQMFBscldDL2dK?=
 =?utf-8?B?OUJLVUtQUW9UNXE4WjVzbWI3OXY1cW5kSUtRNEJBaEEwZFArQysyS1lJQ1ps?=
 =?utf-8?B?eTUyK1RLRmk1cnQ2M1dTRVVuaGpHd1J6R0MveGpKM0hEWHpYNFBlU05XYUE2?=
 =?utf-8?B?b3l3YW1OTDkzTUZNTkZNTEpMSDJaK0FoRUY3T2wycEFqQmJNY3BqczUrcFV4?=
 =?utf-8?B?dWgrbU8xbGFjQVJLQWhQa1RFa1U4N09ralRnck8yMlpINW1vODIxdlFvUzZM?=
 =?utf-8?B?bnlFYjhUdXZ4cFZMUm51YnFMekNFMnh3V251K21zZEYzZ2FNeFowTmE5dHFS?=
 =?utf-8?B?dHZaWjNkc1dnU2FFUlRaNXdJRXBwcXR5YjdvNkl2MXV4eEhSSmRTeTd0TmhH?=
 =?utf-8?B?dXcraUdSUEtFZGNzWjh3Lzk2ZUp5R2YzWlhZUUdWRUhQQWh4enBlTm9OSzd0?=
 =?utf-8?B?Q3l6NDBjZTBHZjVzdWRuWWFTRTE2Vk1mQk9aeEJkNENhblRZNGdUMmVJSmls?=
 =?utf-8?B?RDFhdkpyOWpKQk9pczNlb0MreDZHcVVhOTd3dUdwcGQyL3dZcS90U05kbTh5?=
 =?utf-8?B?blJWU21yKzRqeEFENy9WeGgrZmtYZ2M3dERXbGJwUGRDRGl5SElzS3hRRjJN?=
 =?utf-8?B?TER1ZlRIT2FaZWFDQ3pLODUyVVJ5QUQxZ3J6SVNoZWkyUEcwdjI3Tjk4aDBX?=
 =?utf-8?B?TmIrZ2hoY2xkTDhjWlhDb3Y0ckZQTTBLVHlpTVBpbzBZZC9uQzdPN0p1bjBi?=
 =?utf-8?B?elBNa29VVWx6K3hFZHhaY29Eb2Q5NmZUbDZmOENEbUg0QzdNUWtwNUdNTGR1?=
 =?utf-8?B?bDFiaHR3ZlRPaURTWm51SEJ2ZXRoUzIyajkwN2hTcjR4ZnNtRytzM0VPZTMw?=
 =?utf-8?B?c2kraUlyY2I2TGx5REplRElDejZqQ2o0VnlUeEZyMVJsNlJibmNDUFk1R1Y1?=
 =?utf-8?B?TVQ0UFpJVHBPeVdSdXlHWUNyMUkxL1BLWnRYWXI4UjhYdlhqallncnRNSGNa?=
 =?utf-8?B?RmI1ZzJtaGhwdzB1eGRzeWRPeENNangvWkh2OFFxa0xVQWgzbzk1T0pSYlI1?=
 =?utf-8?B?NVkyUTl6QTRFVHJsVi9CUHNCTW5jbXc3cXZCOTFtazJ0aVlSSnhvNE5TSEY4?=
 =?utf-8?B?NGdtcW9tTTNIWnlEamREUjhOYkJnYzJIWEQ2T2llZjRJYkkyekdhT1RYYVUx?=
 =?utf-8?B?emFiNXk3WW93eFdQbTFtRk5ZR2lwUnFXZm1zTDRZZmhtWjlWSjFUWVFQODNI?=
 =?utf-8?B?SmVYN1lELzZBVDhpMDBVVzcxSVUxN0JDN2FEenRwdStaSmNMMU1zNk12V1lq?=
 =?utf-8?B?aUpOQ1BqdDlCR0x0MTF1NTVzMCsxaUVoZFhIRlF1WmFENFdkYk9zNkUvczdJ?=
 =?utf-8?B?NHBnbE9QN3lCMG5PU0swUmQ4bnNDRWh1VUQwTUQ2a1NMN2dGMlAyeFRqMG5v?=
 =?utf-8?B?WmhVOUpoN2Ixakp3TjBjRFlNY1ljZ0IvOExBY200aHZac0RWaW9CSXpqK1Jy?=
 =?utf-8?B?alRVVHFsMGhrRW5CWnY5TTJLRXRHaVBOdCtaK1UwZkEvdGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJtSmtlOG5tVVhyTkpKNk5SKzJLN05sN2hmbFFpOFEwMXp4UGdERjFZUWdF?=
 =?utf-8?B?ejcwVk5PNkoxUVdZNnJXcGF0LzRGYTBYSXdMY0twdFd0Y0xlenJqNDRsTkJw?=
 =?utf-8?B?NmhqbDZqbmhGRCtxR0VuVC9LNGRDaTY2aFNSS05keGtWZVM3Ui9BSUYxa3Qx?=
 =?utf-8?B?eTVoVXBlZzFHblBrbVc0Q2E5TFgrMURuSEE2VE5LZitub3VrRXl3aGVJMTdy?=
 =?utf-8?B?a3VibHg0bmY2NHBkZTh4NUgrcDdud0ZlKzRjY0VWQlB2cDhKSitrUHhtL0pG?=
 =?utf-8?B?dHVEajM5UkRtMExYUVJiVFpiQXcrdGJVQzBPMUhtalpnOC9laWl3SXB2VzVt?=
 =?utf-8?B?Sk9iNm9CQitTQkd0VTZQZ2ZqOENzYzVsYUNaWXRNN3lCZGR5emtLdXRqTnp3?=
 =?utf-8?B?SWliL2k5UXFFNmZidHJpS0pnWWRJa2xNUUhwYVAxQUFyTkt5Umd2MXUreWNG?=
 =?utf-8?B?U1RWd1p3blJXcWVwN0RXaHV5WDBOMjl0SzBza1pNZXNpek5BT3hrdWdZbURn?=
 =?utf-8?B?Nkprc0ZDOEhrS2dqeWh0cnA3NmlwYkZsWEwrK1VCdkV4YWk3WG5GV2tFTm9V?=
 =?utf-8?B?cDlwZnF4RXNaT3VtcDZsRTRrcFBhaUVyVzN0VG9KMUJwSHlyQ3U2V1dTOHNP?=
 =?utf-8?B?cjkvWGdtRkdiZVRPeWlsN0Y2WUtXQm54MjkzWTFMVHVXR3hNZWVVZXNWcjBj?=
 =?utf-8?B?QTBZc0lOcUx3ZzJyUHJISldYSFVuK0VWYjJRbmQ3YVNWRnhHaUxvTFdxVFZw?=
 =?utf-8?B?UlNVSkovZUJUeGRqYTZHU0laMXU5RjdpUkpwVEw2VzE5OUN1bDhWSG4rMEVV?=
 =?utf-8?B?MkUzcWZoS29PcVJpV1RiUHc2QWF3a0NlVHJUUTZJTXZTdWxaVWdWem5WTll4?=
 =?utf-8?B?cHc5RTJ5bEJhOTZHQlNDYUZHV3IvWmw2akZMcnlXZU1BdllZYmprWDlqc0Nm?=
 =?utf-8?B?MFRXSE5VMzh5YzVHa1I1Yy9PRlMvRDRPcnMxaVRzd3FZbnFXWDdlK1F5ZHNm?=
 =?utf-8?B?b3V3SVU5UWlRRnZRNXFRdnp6UHZsUURwWEhhcHV2RGtaRGJEZU9QWWcrSnhX?=
 =?utf-8?B?akFEU1Iyc09kUWkxdEQxSmZ4MXVET0dHdTloQzNSWktVelpKOXpqK3psdThD?=
 =?utf-8?B?elpkZlJPK2JaMEgxSURUNFZrUy9NbTBWelJwNlNqcjZDQ0FZeW82TjJkZkpX?=
 =?utf-8?B?WHhESUIwcHFrbkREMjJmbUZIb1hvS1hMVFg1RWZqQ0o4NmJlRFVreWhNcVFW?=
 =?utf-8?B?YU9kdHJoSDJYSEVFbmlFWFZ1N1VoNDNYbEc1U1RVQ1JEbFNFVjYwSnNVc0VR?=
 =?utf-8?B?cDZGTFpaYXZiVHJ2NUxvUGlPVG1iZFZEMm0rWnFpOWhsdWpsQWJVNjRKTjBv?=
 =?utf-8?B?K1ptZWpOck1zOVVGRnZlZzREbGNnOTBMZTY5LzJjNEtsR3lhcklpSFFNcVll?=
 =?utf-8?B?ZHlMUWErSHRobXRNamhTTXE1UCtZTDRtdU1XRVNpcUFLSDlCZHJPaUJDZkJT?=
 =?utf-8?B?T05QMnJWcWt6VzdlOE9seFFtdm5TNFZCajZINkZSVkFPNTlKZmxtUWhzOFV2?=
 =?utf-8?B?d0l6UFV1UWxVV0FsZmluWmYzclNKdG5kblo2V2JOSTJ0Y0o1NnBLTDdnc3V3?=
 =?utf-8?B?T2pRVzUwcFZpMjczaDlIUCtLeGJFMVdTelVTMmh4SE1PelVURGNPVzNDTzZN?=
 =?utf-8?B?b2luZWpHcDNMRU9kcXl5dWpTR0ZNQW53d3FseHdFSGl0b25DUHBBWVd4Ty9o?=
 =?utf-8?B?bFBkNjNuWG1LejJHaWVtbkQ3bElWbGxBU0FFb2pDN1lnMW1uQStrMnVaRnVq?=
 =?utf-8?B?Ymg4VXVCV3JqRmg5LytCdFRoRVp5T3J0aVhYOW9sNnhhbFYzMVNFL3VHSmhr?=
 =?utf-8?B?dXlCbXo2aEFqOUl6aDNCVkZGNUZJbDl1QnJ3NytWU29HK3ZTcUREUTdPTitO?=
 =?utf-8?B?WmFLUWtJdlo1Umdjd0MrdjJYMnVHKytSZTlUWk9UZUYwK1lBdksra0tNZzVq?=
 =?utf-8?B?dWh2ekZyVFdBdUhkTlR4S2p1cFMzMWZvUUtEcXJEaFAvekVIRGtOYWQxcTBK?=
 =?utf-8?B?MlEza2VQc0x3cnRnbEZOS3duTUFyRGJRc1laTmorM0xkZTNLQk5PZkVlYzA0?=
 =?utf-8?B?bUZhcXd2R0FHeStoUVpzYTlwa2g4OVZMT3o4MTQyRDcwb1FYQ1FVZm1jaFk2?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc4a28a-fd09-4da7-268a-08dde742bdbb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 21:26:39.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I8lARy8SQRrpBAjCYmIgtU0srjjsc65YcR2b5728oNtVmvF6wo0CEw95ULWjJj7Tw2SLTdYfRw2jCQ/lmI1NKkn9jC/PBVQZIcKHoQjbCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_142649_114498_E8934109 
X-CRM114-Status: GOOD (  10.89  )
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

--------------H2NrOKLHilrcRE0mwhtgw0g7
Content-Type: multipart/mixed; boundary="------------VG0WNDbz1Bss2d3iDnJXZq0X";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <80710850-5b3a-400c-9ab5-749f785edb24@intel.com>
Subject: Re: [PATCH net-next] net: stmmac: mdio: update runtime PM
References: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>

--------------VG0WNDbz1Bss2d3iDnJXZq0X
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 8/29/2025 2:02 AM, Russell King (Oracle) wrote:
> Commit 3c7826d0b106 ("net: stmmac: Separate C22 and C45 transactions
> for xgmac") missed a change that happened in commit e2d0acd40c87
> ("net: stmmac: using pm_runtime_resume_and_get instead of
> pm_runtime_get_sync").
>=20
> Update the two clause 45 functions that didn't get switched to
> pm_runtime_resume_and_get().
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

--------------VG0WNDbz1Bss2d3iDnJXZq0X--

--------------H2NrOKLHilrcRE0mwhtgw0g7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaLIbDQUDAAAAAAAKCRBqll0+bw8o6IzX
AQC+WAKq2OYizyICZOO7/7zRdweNW3WTXydeyaphVzLN7AEA0HSpwkGf9iJujOytlXXIKUMrCOsv
Jfan/1dcHY5S2gk=
=m0RI
-----END PGP SIGNATURE-----

--------------H2NrOKLHilrcRE0mwhtgw0g7--

