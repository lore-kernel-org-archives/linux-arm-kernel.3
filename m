Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD51108B906
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5STDj5I1trX7iKbyVgpA6IMPWQrob2MLXMrmVqhQ1is=; b=vVz6WdY6CBeyp0bLSwHpV2fVa/
	/Cy5AsqDaa3uBeQ+eHiZ9gfJt8AMS9MeMILdNjeolpXNxX8XyV40467hkqTnMCBqRIIOnKrxOjuRd
	EQsdAtHTLFMfErbhJ/yw6qpQUxTCWt+ABqTD0G33Eq0VTRv5WhFY8+jD9Eac+SClWJpnbwuj05oK2
	tBnVKR1pBy6g3R4UMOTL3BTc8BI7aDPiSkAjc+dX+W/ET4IRfVAXU2iGtJE5CZ83Zb8XlK4euUVw1
	+/oDZueZHuuVz9O7ztn1Lswz3LNDZ43r76+dq/DmWbxCn8QRHv4DIl/y4qtvdb1rOowjpVop9CRGd
	x25yZDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YFt-0000000CiNs-3SjX;
	Fri, 20 Mar 2026 11:43:05 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YFo-0000000CiNJ-16IJ;
	Fri, 20 Mar 2026 11:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774006980; x=1805542980;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=i1WgDAYtEpsEdTWtf5PYXLZjG+0S4jKxaSxGj+rDtPw=;
  b=nCxj1dpdMRFad7oxDfR1chVPclifr55x5z9nmDO+P18xPvmywyd7YEL4
   MLnOigkoipWWjP6x+JRbp2V1AlkNmpvNkc0WNVDa3oYZpkvm+osHYmR/D
   Gds9jiJFIKkY1gTHp0Bx7GJGRSRAA/wyRTNfxMP6/TYtBU51tleVDGqed
   Kf1fA71sXQPEJjwqdf0diCSkGMvaUSC3IaNpQOtSz6NwcKHuwbGVwjlfy
   hwKt2HJbPeMUCXwmdWONikhOG2FCAaRSgYsN5xf9Cly0+d/cvWxoJhbd9
   /5nPuMQJepDE9X1JN8b7esPOrLZ7u6xY3ZYv9RtWQAakkG0LSautwI0/E
   w==;
X-CSE-ConnectionGUID: YV40I9WiSmul3UFs0nfY+Q==
X-CSE-MsgGUID: fFXQux4rSCqFocPEV8d0fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75276613"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75276613"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:42:58 -0700
X-CSE-ConnectionGUID: 0lj2JyicRoW3H9JXrt/8fw==
X-CSE-MsgGUID: w4q0oyKpRbWy7HH/u2OFUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="247390857"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:42:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 04:42:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 04:42:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 04:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jl/qoVs41j+15ATqFbmEB1hJpE3fWBBLU1kV4ggsIioDIWp3t7acsIfenT381bzKo8eceHq9dtkQSWpGlZAsW2GbsUT3TBhgbdZgAmdTrDMX4l2UtZ885V3rVjIVFuwaBJw5V3hLlQtwtxCLxqBMix3krSfCOUUG9b7/mfhO7pyDRZg5dLfMmOBAx4NLcVIy4bNZqb5XS0a/3W9mODzNnqlMZ/YV90hXfILjDJ/JubEXHswXPBX8F9x9I1Kgyk3qBCfMlYEoqf0eYYO1lhssvM5/qU1PwuiCvxMEwL2NH4+SoNxXsodu8z3601e7a2HQViTeLIc9RY40I3GTAqWjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5STDj5I1trX7iKbyVgpA6IMPWQrob2MLXMrmVqhQ1is=;
 b=Wp+13zexiGladkv/1K8WIPr6Sq9N3mFf+FYr9Y0iCs+iOEEKccLjsa1p6sKfGHcOhG1A5D/fxUiMDVW3IxvToKRmxIezDvVnMPE/GBrUPV7rJGdAmYHk6g29YXFhnxy1flrKQ5+GijCc/lxJ0hAJK64JXbPAzdTgFseH2xXngW191zb0r+OWK9HTJjJvmqJYZNFg+NTjuIc2fnQxS0a3AI57z487DrPDppcY0JJnjXpvG2sfX2iPKhFnPmFnSiRaZAbGUPW0t1bmpBc2HqvgDx8Q8Ia+J9/TbRmhGpwiC5Lvi3IGIRoUtRH0X8D0AEAgu8gMEOPBLmvMRJ81VoBMIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS7PR11MB7836.namprd11.prod.outlook.com (2603:10b6:8:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 20 Mar
 2026 11:42:48 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 11:42:48 +0000
Message-ID: <9baa4b0f-4cd6-4090-b69a-a1f11d8e81ff@intel.com>
Date: Fri, 20 Mar 2026 13:42:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	<alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <ebiggers@google.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
 <20260318055230.307030-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260318055230.307030-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::19) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS7PR11MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: b40560fc-2844-4d88-7a60-08de8675cf4f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: ybjnS4XhK7kW6VrA0t8e1mp3nav5YAb6gATSI3sIRG9GVWeUpFyqD/QE0dag81j2+VG4yCEoa0X3rj5I2FdPBvI4p+4BvXVUVngiZtgCFe44rLdSL4/7ZoDqhoDEEY4D3Y2h6in7jkrXUxeKEUQhqKLTr5Q53Ch5Z8kmNvX94Dqa5k8gmXenwJJhcSwCaFEH215uJfURA2mQThuctU5blyCVn91Uyj9C8JrDMLoB/uzOLSl1c4fMOU2+YceJfYkcrFBDVqjqsiWN3uo/UaslK4DN4Q8lu1Um4b1y0GX7bvoQkg0k1ie69KkMcgDOY+UwNhjzYGtsmhfvJHSuZFMLc5ONaWt+prinZ857N+/l95N63Aj1fFoWdByufAV8PyGHEYCmvjjsLXKJIOahTxsNEkiI7r12GuBr7D2UIvWWO2POVJNT7/Sa3Qn02BsF1z6m+oyj3o/h43TKC5Q5yU/8meWH+chQWGkOkh6LduuyKOoylonDInFaRl0JqsqIfbJfp9u131to8WOhgw8MyK0uoP+4aap1JjhzSVCiDcvoR02u4I49Gy9sulW8MtXiEXDT4xWf+UcEsmNJuM/0mxrQZeHe03+FRrJvgEpZwzKQTnxidjP+ufU+ViKe3iodljdRLxo3x/cNW5Sc4Ittw9syIUCKLKTyuKOayIBfDdTIT10RclWbU/4j/nuaUYY5PLdNpecNavDx9PKaHAgL6V9+f0XE+k7rk3KISw6mbwSr4zaGqeyqiOuKyP+G9imwnrv8p1hCJ+sr/V7hob44qg+6Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHRGMG1LaC84cnRZNGdzT0Z4SUxQQ0ZGSkF2T1VCaXpnQVBnRGtEOHNNcGhJ?=
 =?utf-8?B?YjA2YUJibDlrdHd3SUNMandrM2pRWlhaQjRWNk1PSm9PRld1LzY1aFpnMGYw?=
 =?utf-8?B?S1pTTWlyKzJCdlh5Q0lJWXE5cFphTmJUWXgrNzI1S3owaHFCWUhHN29lazZv?=
 =?utf-8?B?RzdtczBHWjhFSHlCOFRLOHgvaTJ5S1ptRnVvRFdtTnRMZGlrTlc1em40cE1S?=
 =?utf-8?B?dDVaRk9OcVlGaE1DcmFsbWJ3ODA0VWcvbXZFWEl0VmY4all1NVl6NFNjWVhn?=
 =?utf-8?B?RVdQcjgvd2xhSHVKakVSU2lSamVWdGNPaEJIdHh5MDFwVkxYVlZKV2RBWnFK?=
 =?utf-8?B?Y2VWd2NtcFRHc1NXL3Q4ZHNiNWhTR25Sa21XVFdlT2dhbVZIVlZmTW9SNWc3?=
 =?utf-8?B?T25sMkZjYWZpb0NMQWplVFRvM2twZzhYeXp4aUQ3UzhXelIrUExaNG5rWDBJ?=
 =?utf-8?B?b0l5eitnZ2FHL1phOHQweFdENjJRZWI2Y1hTcmRuM055Sk1VS1NnYTgzbnh0?=
 =?utf-8?B?NjBsaVh2ZkcxMGJyUk5rSnh2VHRQUGpvMEpZZ1V1YjhEZTE0RWF6azNxV1lC?=
 =?utf-8?B?RVhlVGVTYjhodDBxVnV1R1ZkUUhPamUvQzJjRXlTdW1ZT2w2QVBqVG0yMTNK?=
 =?utf-8?B?Rit1ajZnTFBpTU1wVUtsbEk3WXhpSUVtY1VwaHUvVnozUUxyV09UNGxEcGRF?=
 =?utf-8?B?WkpYSHM5dXBYenNSK3pGTHZiVi9BcGxzaXdvKzcvV21qWUtQVmREZGorQkI0?=
 =?utf-8?B?QW41RlRGa0hKMFlPb3FQMVdEMVRieUhCVHVrdDlGT3FRTWhqR1VwbDNOV0Ev?=
 =?utf-8?B?dHNueDBDZmZNMGowNTFFWmpvdFNtYU1jSzVnTWtBRzkrYTMwdDBaSmx1L1lS?=
 =?utf-8?B?MkRxdnZMTFc0am1JVmlUV0tzYXM0VVI3UU9wbDdaUjY1Z1FnbjR2Ui9nWVRQ?=
 =?utf-8?B?SlpEZ3pId1lkVThrcUhCUzZqVTZ3ZUtmYWU3MHRrV0ZxNFdPai8weis5VlQr?=
 =?utf-8?B?TFZXK1g2SENZalQya3hVTER2QnNnUzJiaFlDMGV6N2xBeGlmYWpITVcxb2x2?=
 =?utf-8?B?VjREWlhKa0ZGQndPQ0l5enMzS1VSZUwzaWtycXhNOU1lVnQ5ZTZoTTFjL0RU?=
 =?utf-8?B?a29JT1ptLzNDT29FY2dNZm5JaDl4ZEpFR0M3SW1WNzhOQXJRZk9POWRoWlhv?=
 =?utf-8?B?ellhMVhXOGJYakJXRWxINHY5MElJc0RCeitKQ0JvSFphZVB5SmtIYml1cVM5?=
 =?utf-8?B?dmttckFzUXFJVmE1NjIxV1lxc2FCREh0bXVCc0p6QmEzZ1J0Q2k3a01EVk43?=
 =?utf-8?B?WjIzd1pDK3NIcVBqNDdFTXNFQjFnampQdEFDVHNMamtRak5TVzBHUkNteTV5?=
 =?utf-8?B?dVpLVFdaZnhFTXVPUFV2SEYxMXFKbFBDOXZxVGdqZFBoQ3J5TUdhTFU4U05j?=
 =?utf-8?B?NFA3YkRzbjU5WW9icW9XVVk1N1paY3BWL3NkZDJxQzJOUnZtK1lSdVYzSUFL?=
 =?utf-8?B?bnNWZXJURmZDM2FrWEVwR2ZWcjdweC9xYWI0MlJPTVVMeE9NMzhyODAzZzFz?=
 =?utf-8?B?QUNFeDQ5UzNVRDZLL0pGekVPT1RvYXdOUkxzVmd2eGUyczR3dGhObTQvRVRt?=
 =?utf-8?B?NW9MZkpmSVBWUjJuMFNqQk5acStIM3ByYlRKUzBHV1FWazRXTmRmWDJMMThD?=
 =?utf-8?B?U0NaazBhVmYybjd1Ly9tVEFEUTVzcEVwVkNJU1FrSU4zOGg3SU1LSGJsZlVu?=
 =?utf-8?B?VG0yb3dacTBRQlpvZzZFRzZrVWJkcTRKVG1BODl1Q3ZOYXdqVndXczVRR2dD?=
 =?utf-8?B?eDFSSHdldGFoeWxNclFNSzRKZTZCRGFaR2VoWmtQb0tFV0N5MTlrWnp4bDhh?=
 =?utf-8?B?cktPd3lkNjJPZEw2WFBsZnpsMmxDaUhUbGxYYk9vU0hvZ3FsdjZLWGhvckFW?=
 =?utf-8?B?bzZoOWFVOHN1WHpQdXEzcXRvUUdRYTlCT0QzZGFQcERqQ2tqcFF6dEFlYTdT?=
 =?utf-8?B?ZHVsL2JLRWxrdFNhTWM3SVl5L2NhaDlTajBGTDh0OG8xaWtzYW5aYURTZCs3?=
 =?utf-8?B?MnFmUlNtQXRHa0tuME1iakFnTk5RemtBTE5JcnQyNUc1bjgwZ0hSVnpUc2FT?=
 =?utf-8?B?bFI3dFZrL1ZGZWNtU0NIUDlIMXJTbHFSeWVxVmRyeDdFUWc4cHBjTGdEakR6?=
 =?utf-8?B?ZG5nS243dnZIVlZxR2JHZk5SVWdtQXJpZnNLWGNldWhHTzNudGM4WFh4UVdW?=
 =?utf-8?B?VXBoT2lYcnRWWXFQNWs2NVZCU0pjaGZaWDdDelc3OUx5MDhXQWFxZ2docE1E?=
 =?utf-8?B?czVKdUdXZHdEL1Fsd3ZMM2JiWXdDekNUbnpwS3hmWC91UDhqeG44VW54TWpD?=
 =?utf-8?Q?E8G3rDiEd3bet8i0=3D?=
X-Exchange-RoutingPolicyChecked: YbUjiQD6PU7vr3AwY0ivpR+qAqteTBNDr0OCzT1pqSWiRPYx9XxJhie++92Jh2pxAYzfQ+Ub0eL8OEWjNcZtnd2ITHAQ5aH1a2q18I9O65ZRSk0T/wK1pXVughjh44m1xxQm3DNr2tZr1AQBq66il8QsEj3CIgodbbW/N+Hl+XB8cwDUACU9cmZRH+3XFRMYhhny5jmZE/R+IiZFMkF+NdtrUYdunZ3ThatX6OxWjg7GatujLRbzapY/ArXxwkMJwmt+OwGyzVpvzQ3v4bDsJIT8ny9EsKNSd4P/2WmM5X3l2OfYs5Eux1fi01UhuQlnnvmFkq9jIFO3U2RwV6noMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b40560fc-2844-4d88-7a60-08de8675cf4f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 11:42:48.2809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ou/WEFllcB/ZkcbFUpDhVWTazQolHDOzRcjqbzTXQZ6iFibgjbokk5tsIxIu4X1QJikC6cD/vs6rcb49lUaJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_044302_249081_6F20AA82 
X-CRM114-Status: GOOD (  24.19  )
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

On 18/03/2026 07:52, Manikandan Muralidharan wrote:
> Add support for microchip sama7d65 SoC I3C HCI master only IP
> with additional clock support to enable bulk clock acquisition
> for Microchip platforms using HCI_QUIRK_CLK_SUPPORT quirk.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> Changes in v4:
> - Remove the clock index variable MCHP_I3C_CLK_IDX
> 
> Changes in v3:
> - Make use of existing HCI_QUIRK_* code base
> - Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Peripheral
> and system generic clk in bulk
> 
> Changes in v2:
> - Platform specific changes are integrated in the existing mipi-i3c-hci
> driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
> specific quirk files
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 284f3ed7af8c..41b7737d22ac 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
> @@ -950,6 +951,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  {
>  	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
>  	struct i3c_hci *hci;
> +	struct clk_bulk_data *clks;
>  	int irq, ret;
>  
>  	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
> @@ -981,6 +983,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (!hci->quirks && platform_get_device_id(pdev))
>  		hci->quirks = platform_get_device_id(pdev)->driver_data;
>  
> +	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
> +		ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);

AFAICT, devm_clk_bulk_get_all_enabled() could be called
unconditionally since it returns 0 if there are no clocks.
That would save introducing the quirk at all.

> +		if (ret < 0)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Failed to get clocks\n");
> +	}
> +
>  	ret = i3c_hci_init(hci);
>  	if (ret)
>  		return ret;
> @@ -1008,6 +1017,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
>  
>  static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>  	{ .compatible = "mipi-i3c-hci", },
> +	{ .compatible = "microchip,sama7d65-i3c-hci",
> +	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
> +			   HCI_QUIRK_RESP_BUF_THLD | HCI_QUIRK_CLK_SUPPORT) },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 9ac9d0e342f4..f01b959a28d9 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -150,6 +150,7 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
>  #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
>  #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
> +#define HCI_QUIRK_CLK_SUPPORT		BIT(6)  /* Enable Clocks for Microchip platforms*/
>  
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);


