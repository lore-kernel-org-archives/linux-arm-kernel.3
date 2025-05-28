Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC2C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNfkN4TNMAKkYIVCneQDjqH/x4IOkv/760MsuMcuuac=; b=gBrlQiYw9Dg8miTWxVygyVTphA
	PaMqWaM//XG5njeUPCZqrD+JWO5C6pOlB0UK+DSQnxtvp7Kp6cQuXS20Iv7R+u2F0sp9yCZtqotkw
	ill/GR+hAPjoo5nrjJs74cE4X7v04Q/ImK1232mP7dmGiOykNwNEfSecXzNIS9R+6WON4AvlEQn4H
	/WtWkMRQ1NI0qSHSSVOX7d3AcEtotB6tRU+RwjGDrBaRMGVDMfH1LkrolRTp8aMbuaPOeMFVlmiFI
	jCw5+kgV4S1jI+DmphRmRDkcuYP95JeTNR+6NKwm5f6pjs0iVzpvMVzYrMbEZwjtZjKbfxtBFo3T2
	N5LIz7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEBk-0000000Crkh-1oYS;
	Wed, 28 May 2025 10:39:12 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKE8Q-0000000CrKk-2fvn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748428546; x=1779964546;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AAE3k2PBfMH5mINKwcDbI9LWQw4t3SGUEG3wrtqwJsU=;
  b=lYQkZDLLpyrSXe8AbHHrQl85mGDxHkbBC7+ZM5BzdBtzpPD7cvQRlfB8
   Nr9IV5vvTxS3hLTdbhtFj5el51v/ebxe40ziu6OTZcs6oVDWhAwcWdaSu
   Z47IEmjXvW+Bpnm+Q9UHOqy1mu87mPVMnvTNgf+AvWXWoKkaKo4s/xseD
   KZynLboUNoALPMU6DgImX8C3hTlVWorCRabHNFz+SocyYU1PAa5E8gylC
   HtkT729TNAyy+2sdBVTi69EpovGQeP2j4ZtYQrQmAxKbeRpKd+WEZMOdM
   mKO1/S7rwyv7aJYQDktnQLEW5xqB3tawN7sgV8ihYgO/sfzJeyRXpdRAX
   w==;
X-CSE-ConnectionGUID: DCegU3BRQ9WScyy2U0BcBA==
X-CSE-MsgGUID: zg8ZhMRoT0Wg4ctAzQjPFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61107518"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61107518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:35:43 -0700
X-CSE-ConnectionGUID: dlPculyGSQ2lDeMHC3zGQg==
X-CSE-MsgGUID: U9lYgVeaR8aBmj/eCk4eqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="148243608"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:35:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 03:35:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 03:35:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 03:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB3Z7VXCXp+UBeLo2CfJMfzzxb21npdr3Vti9xQKwsbuB0KvWfrZi3PD8tS68LnFwLQVfsAtSkcPwad4M+EBAQwMlTpMMpYr7c7sN5qhzspCnoFLloeDQ0CzpgHiM4SJqa4/dzJGqU8lhp8fNidy1n7BKyj0ijb2uJCn7XFnR0Jr0MuV7L5mdsWsDfj6mhAOCxCwufkPbNh39KsZYALSKrYus2qDTZV91WUtFGRjQGFTnPj2TTRnddo54jeoDZ/SoaKFVrRIIFK9DBFjj4SnG8qMBws3i1nPPKrFrlq7BSUp1L0IJclBrm5lvQTcZkGtJoaVjsCWClzMTYvRUqORnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNfkN4TNMAKkYIVCneQDjqH/x4IOkv/760MsuMcuuac=;
 b=gbJvoQ2QvukKDF2Z1eRIJvy9SO5QyTfXpuFTwDjBnDq4ZDGMrQwGXPycijM83sG7P4aEA/TQmMVt5j9rRFHu4aBflacUuMvSBvwZQ7D8jCpTjsO7pJykHHIPaoPREVdL0YAMWz/RPKFcVFnZcghuvh6RdQ+wfc4nx3lFshhEQLainhHTsXzIXU6LUF9rw7vfIUTLx+FI+yx/hXLVN6HodgQfZs+K35vCVUqNdMIZNujZs3R2xnGy6zblOVRViR45P4Bm/YUbO07yinWUgTGSscz/4hYuy2dQMBlfHCcRcqHET1HZW8YXVMmcqX07XBEofE6BsBVahDZIkQPB6VI7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 by DM4PR11MB6191.namprd11.prod.outlook.com (2603:10b6:8:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 28 May
 2025 10:34:59 +0000
Received: from PH7PR11MB6054.namprd11.prod.outlook.com
 ([fe80::a255:8692:8575:1301]) by PH7PR11MB6054.namprd11.prod.outlook.com
 ([fe80::a255:8692:8575:1301%6]) with mapi id 15.20.8769.029; Wed, 28 May 2025
 10:34:59 +0000
Message-ID: <405271f5-3ae9-4f64-a433-043fb3194834@intel.com>
Date: Wed, 28 May 2025 13:34:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mmc: sdhci-esdhc-imx: optimize clock loopback
 selection with dummy pad support
To: <ziniu.wang_1@nxp.com>, <haibo.chen@nxp.com>, <ulf.hansson@linaro.org>,
	<linux-mmc@vger.kernel.org>
CC: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <imx@lists.linux.dev>, <s32@nxp.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
 <20250521025502.112030-2-ziniu.wang_1@nxp.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20250521025502.112030-2-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0242.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::7) To PH7PR11MB6054.namprd11.prod.outlook.com
 (2603:10b6:510:1d2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6054:EE_|DM4PR11MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: a60fc8af-fd72-4f19-98ee-08dd9dd34c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjJvRmd1TVZDQlI5a3BsSXJrcnNFSkxBWSt6WGllQUxmQ1JuZTF4VGF5OUdj?=
 =?utf-8?B?WVRJaWJQUlpnM2FYd1FuWnBCNGFWZ0c5dElsV0kyb0EwT25lYXRadWFSc1gz?=
 =?utf-8?B?RGRCUVNldHVldVpzMWMzSVY1cG5zR1dVN25UQnZhVzRNbFlDaDdNUzlNZEd5?=
 =?utf-8?B?QjhybGhBYjhVSkNRNi9NR1lIYU40aG1XTmg1TCtWNXBZMlZlUGpxRzlGRzVB?=
 =?utf-8?B?R1JqaGpKYVJyUUpMb0NGQVk5Z0FMWjZld1NZY2tHOWlzR2pPV3B6dWJ6cGU0?=
 =?utf-8?B?cUpjYWdUS2JidGM5bWxNWVdhQmZGNXRnaFlhMkZPUWFrVzB5R0tZdGRCb2JH?=
 =?utf-8?B?Qk9xMDdsRDMwMmo3NDNPK09tWWk1SklJZElzVWkxSGNXdDhJNnYxWktFSnJF?=
 =?utf-8?B?WjlkVW4zRGV2N1pxbWRBNEdQbnNuSTlIbTNOZThPcTNic29IMUwyVHRWT3JL?=
 =?utf-8?B?WFdqL3d3UW9ydGNlNlVWNXBaeGQvMjlZMTNCdlRwanFFL2hCYlI4V1JJM3lt?=
 =?utf-8?B?RGNWcThHcFo5ZEEweTRnUkVGWENCR3JwT2puRDBwdW9jK3hzdTlvS1ZNT3I4?=
 =?utf-8?B?WUtJUFZxVmZYMDJ6K3d3S0l3ck9jT2JwSnY5cEpQUXF5YXR6MTFwMG5kSXN5?=
 =?utf-8?B?ZXp1RlowNVVKVVBkSDR0Vy9tQndyQzkvT3hkSnpnaE5Ca1ZXT3BwNXk4M1Rp?=
 =?utf-8?B?WFYxVXBJTDRPdDFTQThEblVtdXdkT0tXRi9wbFJBcnoxcitRbFhOc2ZxSmlX?=
 =?utf-8?B?cVFvdHhHK01NOVovUmJwUVNwaStGajJ6aHdJNTkreGdEcUpwRE4xckR6czBp?=
 =?utf-8?B?bW9QTFc0aHB3WGJ3RDZOR09rRldoVmthQytyQTRmVW9BdTZ3SXVYblFJYVpR?=
 =?utf-8?B?bGxRSGtYdmNXRGZtQXIrVllKd3l4TE42Q3NOMFVzQ0w3ZjlIYUFsdmZqaDFp?=
 =?utf-8?B?N0o5cFR4R3J5VE9VY0ltVkV3ZjFUcThoUlFkaXphMkRFbTVLczNDc01zMG5X?=
 =?utf-8?B?dklvQSt3cmNpTDNqMVUrZkRQMHZTalNNQWxkdUVaMzlJSjFUcnRoWFJRWWVk?=
 =?utf-8?B?SkFxREZVUnRQY0JrUEE1SGZaQ0N4QTQ4Y2lTL1IrNDltMmNHcVluMjRZM3pt?=
 =?utf-8?B?SWNsNVZ5SlBtSkVQMXNTcWlITzA5akxIc000elZveU10WE1uSy92L3ZvQTdD?=
 =?utf-8?B?dDRNZ2pwY1FXSlFYV1FBb2xIR256TmpHZi85YmppSWFqR2hPVUxoRmRMZkZS?=
 =?utf-8?B?N3djZk9zUnZKSzRqTmpHWUoyaTdScG9GdWtpZkFzRXpZUC9jMHlJYjlUWXh2?=
 =?utf-8?B?ZmJOQ3BaUkdWem1BNXZLQi96bXVubDRKTXNxOTBFdzhrdThVL0xsUFBOeWxn?=
 =?utf-8?B?NzVxS0R5SFcrOG5lUm8vbWNaQVZKS1dMeFRON2dVRmNSNWZ4SVdBY3NxbFp4?=
 =?utf-8?B?ZGc4MmFkaXErSXE1aUpPeEFlNFhSMU9tajNJa2N6RXdvdUVFak5ML2o2SC9h?=
 =?utf-8?B?WHMvSGpTUi91UG9BUXZoY2JhM1ZFODRvQzFYTGhocE1EUTNkZHBIQ2pIRkVQ?=
 =?utf-8?B?dTdXU051M1lNL2s4UlEwa3ZhMUgvdTA3djdidDR2b05Zc0NpMHN5UlhFbGNT?=
 =?utf-8?B?cGMzcVdMZS9SMnJFcmQ2YmlTWXRuaU5hYVFLbVF3UC9QcUJtZTJxd2pFTW5B?=
 =?utf-8?B?Mlc1bU04RXhiOEZwMTBySlNaUG8zK21YKzRaMHdDUWY3ZUJ6TVdhVHhmTkg5?=
 =?utf-8?B?T04zUUNPSDlWU0R4bXNLVHFlaHJPNTdja3E4N09KdGp5S2MzbUEvZ295TlhU?=
 =?utf-8?B?Z2kzbStCR0VTcGIrZFJIZldKNDlZbVhxT2RQSXVQQzc1bWdZMFVpVUVxU2VE?=
 =?utf-8?B?dERTYzF1bjRXVkdSMzd6dnBJZUVGNTg2RFVLa3hCTnlZYWZBczRXRytOcTk0?=
 =?utf-8?Q?GNH3/vMUAXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6054.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGtJYjVJNjZPVThhVFBZMDFucW9NRnl3K05SVnh6UXkxZGR6Um53bFZ1YWhO?=
 =?utf-8?B?VlVVS05zWkJwTXpMclVsbnVkQ21tYWxkTkpVMTRBdzV0UVhHdWZuY0IwQ1dl?=
 =?utf-8?B?bENZanpsTG5QZm42c1BEeExKQnVoUWRlZHgrNCtnMllwdEJSazl4RzhTamhR?=
 =?utf-8?B?Tkh2L1pQVGM1UmQvbHpjSVhsYTBLL0dpL1JtYXRuY3lLcVhYNVc3Q3pGMGdn?=
 =?utf-8?B?ZllDOXJRbXZ2SExRT2Ezc1BEQUlKQ3p6elZVTEFYN1dTK0tuOEJheXBpZUJQ?=
 =?utf-8?B?L3p1ZEp6Z2kwd2NpZkgzSHF0NlU5dHUyV09jNi82M0svZEJiZWd3YUxscHR1?=
 =?utf-8?B?NlJ3ZmRrZnRjUERHZi9NakdDL3BCbWd5Q2I2Yk1nVHNNaWkvRVVLUVQzSUt4?=
 =?utf-8?B?dzgvQlk0NlBxZ1JQZEZvYlkxZXZTcjk0VkQ2SXAxaDN3Rzd4a2FyOXphUSti?=
 =?utf-8?B?eTlUcUJ5dkQ5QVNqVDh2dllER0hpeG53SmtXcWZySHhHY1RLamtIK2pnVk1u?=
 =?utf-8?B?MXlFUVJ0UnIrc0s1bnlBMXdKMDhFYVNIRnp0dGZDRzh6OFlVRkVvZzlYcmM1?=
 =?utf-8?B?eHhDMW50ckFuQjBWNDJiNnFhaG9zVG1Eb3d5MkZyQzJ2SHVoSjN3aVlmcXpz?=
 =?utf-8?B?cE5ySHh6Qy9HNm1qajc3RUZ6ZDNJOXpaU1ZQZFYzMzFrM2JQbDdSVkdwdk9P?=
 =?utf-8?B?UkVLV1JidVF2U1hOdVJ2ZzNiMDlVUS9VK2UrMnYzTXFUbGp2L2ptV2NtdHFk?=
 =?utf-8?B?OE1ONUwzdzVkcUV3YzREVEl6WW5sclVaMGJVdEFsaDc2ZXZFbkJaV0tibW5j?=
 =?utf-8?B?MUE2ZnUrcmJwYWlMUU5GSTBzcEpvVWdvUVE5bUJqSy91cHl1MGdxVmZvU2Fa?=
 =?utf-8?B?MFVXc1hxY3RZVWdnL0Y2K1gycFZUc04zSmI4UFZRd3MxT2NRYVBhREtibWh4?=
 =?utf-8?B?M3B0SFMvVjk3aU1IVUJTSE9DWkxtRXljUldWSTNYTUprY0xZR21OVFpGYWgw?=
 =?utf-8?B?SE9uOXFpaXhjMUs5Z0ZsQ2p6V0txb1dQNHpHR05TRU5Va0VzUEZ2MmlFbEho?=
 =?utf-8?B?cXpnSDVjbVZnWWV3Y0ViSVM2TWltVmJhSDYzSXFKOU80RkZTN3FjaXp2SXBE?=
 =?utf-8?B?aGVmSDlmclVPZ3A3c3lKc080bEQ3ck51OU1tOS9DWmxtZk84QTllMGExWElG?=
 =?utf-8?B?SGtHN3QvTTNhMlh0QW5HTnlqbTViU3N5emtnQ3Z6VkFVTWJiUmZZSERSNHYy?=
 =?utf-8?B?Sm0yZ0JWZU10NXVFMlo0bWltRVU1ZitZS0svZWFmeEF0T3VOUy9kalhEaGZP?=
 =?utf-8?B?TSs1YlRneU5WNWs0Z0l6U3VZYkowc3hJWDlsYTBJcGZJSXFmNGhsRDQ1MGYr?=
 =?utf-8?B?elo3MnRKdlV5RTk2SDc4MjdZS1NuYkEvN0pEZFV1WldCY0p5S1M1REFoTmsw?=
 =?utf-8?B?cmRsS0V5NHhlWU9VWVFocWo1M2pYMWpXUWtLZ1ErZlR2RFNnYmdkUjErSzg5?=
 =?utf-8?B?NXE5cEZORXQ5TDczU1JOc1p5SHg0ZXBCVG9jZk1UNDF1c09ZcGJVcDhMTDJl?=
 =?utf-8?B?eG40cU5acGxFUFU3OXFqazdOOFlLSkRJLzUzR3FCTTEyWWphaWlLUjFOa0d2?=
 =?utf-8?B?TGtCaGVteHRBVkovbTQyQzAvZCtvczlKNWR4L3V3bnZWNVZjY0Y3eC9uQUdI?=
 =?utf-8?B?MUtIbmJhTjRKdmRjMjc4NkFBYkpLVmtKM1VWNlVSSThWWVN5TFZtbjdpWURn?=
 =?utf-8?B?QkRwcnRNNVdFVWVZYkk2ajlrNi9wN1l1ZTNsRlpSdXN6RWU4QTFIZldaWkJT?=
 =?utf-8?B?QnR1OWxJQUxmN2FEd2RoNFgvWEtqR0VSbEV1QVZ3ZzFBWnFIRUMxSEUvTVZM?=
 =?utf-8?B?cnI1UVJxeklzalY0MjhjMVRiODcwV043M3loUlJmWHVyWldrWFptSE5aZ0Z2?=
 =?utf-8?B?WGpadDRSQW9EbFlTZzJLOWtFRFBZQS9QaU9UR2dSYWFnWTUzTzdwV1RNTXFl?=
 =?utf-8?B?c3RuUTdrV1BTNFIxV2xscTFKYjQ4Nno3TzJZakNtT3VNTnRDMktBMjRuSHpw?=
 =?utf-8?B?RTBtbkFVZE0yZ01Bd3UvZEhBaVdQTVdESnZCamxWVFJFbzZFZHpLRVl4NU80?=
 =?utf-8?B?QlZvdkl2endKd3R1bGV0YVlaQkFJWUNWSnM5NktZNlVpSHpSU0Z3SXBNVUlD?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a60fc8af-fd72-4f19-98ee-08dd9dd34c08
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 10:34:59.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgIAAwaxd6rOmvomwPGj3gV8PUVsc2F5DBHhGhXKYzdxFie3DwGOMuMG385i+fhymen8td+KjdHyc1Y9jF1aXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6191
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_033546_702863_A923856B 
X-CRM114-Status: GOOD (  20.65  )
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

On 21/05/2025 05:55, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> For legacy platforms without dummy pad:
> When clock <= 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 0 (external clock
> pad loopback) for better bus clock proximity.
> When clock > 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 1 (internal clock
> loopback) to avoid signal reflection noise at high frequency.
> 
> For i.MX94/95 with dummy pad support:
> Keep ESDHC_MIX_CTRL_FBCLK_SEL at 0 for all speed mode. Hardware
> automatically substitutes clock pad loopback with dummy pad loopback
> when available, eliminating signal reflections while preserving better
> bus clock proximity.
> 
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index c448a53530a5..5f1c45b2bd5d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -212,6 +212,9 @@
>  /* The IP does not have GPIO CD wake capabilities */
>  #define ESDHC_FLAG_SKIP_CD_WAKE		BIT(18)
>  
> +/* the controller has dummy pad for clock loopback */
> +#define ESDHC_FLAG_DUMMY_PAD		BIT(19)
> +
>  #define ESDHC_AUTO_TUNING_WINDOW	3
>  
>  enum wp_types {
> @@ -348,6 +351,15 @@ static struct esdhc_soc_data usdhc_imx8mm_data = {
>  	.quirks = SDHCI_QUIRK_NO_LED,
>  };
>  
> +static struct esdhc_soc_data usdhc_imx95_data = {
> +	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> +			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
> +			| ESDHC_FLAG_STATE_LOST_IN_LPMODE
> +			| ESDHC_FLAG_DUMMY_PAD,
> +	.quirks = SDHCI_QUIRK_NO_LED,
> +};
> +
>  struct pltfm_imx_data {
>  	u32 scratchpad;
>  	struct pinctrl *pinctrl;
> @@ -392,6 +404,8 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>  	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>  	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>  	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +	{ .compatible = "fsl,imx94-usdhc", .data = &usdhc_imx95_data, },
> +	{ .compatible = "fsl,imx95-usdhc", .data = &usdhc_imx95_data, },
>  	{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>  	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>  	{ /* sentinel */ }
> @@ -1424,9 +1438,10 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>  		break;
>  	}
>  
> -	if (timing == MMC_TIMING_UHS_SDR104 ||
> -	    timing == MMC_TIMING_MMC_HS200 ||
> -	    timing == MMC_TIMING_MMC_HS400)
> +	if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD) &&
> +	    (timing == MMC_TIMING_UHS_SDR104 ||
> +	     timing == MMC_TIMING_MMC_HS200 ||
> +	     timing == MMC_TIMING_MMC_HS400))
>  		m |= ESDHC_MIX_CTRL_FBCLK_SEL;
>  	else
>  		m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> @@ -1678,7 +1693,9 @@ static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>  		writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
>  
>  		reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -		reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
> +		reg |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> +		if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD))
> +			reg |= ESDHC_MIX_CTRL_FBCLK_SEL;
>  		writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>  
>  		writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK,


