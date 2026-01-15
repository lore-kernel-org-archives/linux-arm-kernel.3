Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F09CD3CCBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/Co03HXzUkTYNv23xeNIBZDdj5XjxQFwM1vCjA1+Qk=; b=mvqMMV0bvjHuVbYLl9D7nxYbhr
	MxZmGV1HHEie4PPa/dJZTQCEDQfylZiLGqSCsGRz1njYO0kOm15LkGKNypkqU4LTECmFW2Keff4SL
	HqoxH/J57VdudvaxegKNAHmQKmW543f2/dO5MPTbGb8mXFl2xr9Pz0pddpm/dcRF2Vy5VZAsF7nj5
	U16oyWCC0U4Cy0svXsKpElAYUocbHMligrtMktdcTmUH26oaDfp6QU/6ilWwAOpdB3f+COVk7CFKN
	sFFiwR1YHRNvoMAOw3RS/yiwq78CLnvP3TYJzFzVxnHGLA7HM3Z84/9qPciV2ju57Q9Cm/UM2Gvzu
	mz0cThjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgI05-0000000Bwi2-0coB;
	Thu, 15 Jan 2026 07:42:37 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHzx-0000000BwhQ-2zyN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWjyaR+soJC/GJOSOkSaIgcmMFm51yQYmrgFkKV8kVCUpPtwTzirLREZSz5R/0+niyxqpJq5QfuquWNA0BEeRXL4XwEppFWbuZiq2tXkHNXmMHz0yvWM76NvQw4iaA/XjWpECNlvMR5ScXCQQM6hSDuOu1frXfkp4ZCchJadYlbINz9nGLZljoe/pdEv+KW8tqNyvqxCNpHAJ1MRWjbwryckgMroy5XWrxUR6nRAY0XtN05YPuiZX8iNdN7VyA5Um5auj/TpS2LLuDLDCmiN+DhXbmgnvjeYwAp1MscFaqGIUzJDPc4tSHuprGv2nUylsVgfApMvXyPp8R1UyCwXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/Co03HXzUkTYNv23xeNIBZDdj5XjxQFwM1vCjA1+Qk=;
 b=GT8ZksmJQik6h0LRKT/xGGvxXoTJSxZlkS5w7sBRX3EQcrLFHJbhd6uu/Av6C5aZTZPQK89afZNdSX4x/zzmmFIVXxDPZxKqihwtImW3S7hG/DtTPm4xqEJIPmtRWb9ZcoiT1nr5Z82lx9Arz2xhvNV9kR3Ya1mO1oSM2sjnmZt3Caxtq7aSgWmWgahQ2kN7G/V2khKny9GUPOpSjUAxTxPihyplMOThpFXuSI4JVA0vUah5n6Yr/pqTSMZlW2NeHh60jbZ4eq3r3UCYSSkB5XWVGVtLGnC9dmW/win3MNbuIr9WyKNW949Vgee63aUdHvKYLtCq4tE4ABE4C2HZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/Co03HXzUkTYNv23xeNIBZDdj5XjxQFwM1vCjA1+Qk=;
 b=JhVy45jKOCnVTcAUtFX/iMuyp+ThEXyOiIzso7XZ77bEoD0ze675VbyLRMcIYx93Z1eaq1fw8pPAGJNAyUqOZHSgcjhj0nRdNAjJIchDAMnPkqPf0vNtr7qlI/DdGj4Lp1Z2Tv2NWRx48RB4ECKl4vvS5NdZyhMgMbFLtOa72sxgfOb0thZqxxe0AFpv8H1XL7hnY+o6cx3sETlPAXxtQNy8jSaILh+8e9pzpFv2gPO0S6/4yPcN4Z9vsMSig4LHXQjIP2C5BmqLIO6PmjWIFOMmiJgbofLWKhJUdpJ1BCVid3/Km0pmKhe5/wHl9IPr29ve2SQYA5KwZj1APLLfeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB10411.eurprd06.prod.outlook.com (2603:10a6:10:61c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:42:24 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:42:24 +0000
Message-ID: <fded3e4f-f292-48bf-aea7-0c8e71f7e056@vaisala.com>
Date: Thu, 15 Jan 2026 09:41:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
To: kernel test robot <lkp@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
 <202601150836.Yk8DcSZW-lkp@intel.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <202601150836.Yk8DcSZW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00014AEF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::31d) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DU4PR06MB10411:EE_
X-MS-Office365-Filtering-Correlation-Id: c495fd46-6e67-46c2-493e-08de54099fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFgwWnpxc3V3bVV5K0NndnM3NkRxa2NPRGdkSEZCR3NpTGl2VVpvTFgrTEIy?=
 =?utf-8?B?VUkvQnArVU1lNVEwbDdibVhaeXMrRzVRZnBwZ09ScXJXZm93NkdGaU5tYUtW?=
 =?utf-8?B?cjVFQUlmMDZOUCtXTG9WZFhRaUJyK3N2VTljZTY4bkdnd1AyekVBQ2xCTFdJ?=
 =?utf-8?B?bmo2RzJlZkVUUFovZGpPbzN3LzJBZVZUY25sWGVRdjZUOGF4K1pkWHlaeTJz?=
 =?utf-8?B?dzRhSEl6Y2ZqejlObU9VaWJwT2NqTlNRUHA1YjBXcmNkYUdwVXFXdnM4Zy82?=
 =?utf-8?B?bi82WFV0RFFSOWpWU1RqbHdKcENlbks2amNsZHgrUUJTeER4Q2E2MEUzNW5y?=
 =?utf-8?B?N2dHejYwZVRQaklDL0ZMYitnMTlVNU1pZ21CcjBiQThyblprMUFKeGRkclRF?=
 =?utf-8?B?YytVREsycVVUaE8wTGQvZlh3V1A2b0dDMEk1WlFPRm11akp0Qlp2alhmdkhs?=
 =?utf-8?B?WkNCZzE1Tjlob0N3c0tzbkljU0xzbUR3STBEZVBVcTBQYTZRZ1g3KzU0Z3lF?=
 =?utf-8?B?TFJDSWRZV0Z3Sk9qZU9pQ3Jwamt3d1E4cFBoS3I1RVR0RWFzNmpGbkZUcVQ1?=
 =?utf-8?B?YnFGa05RRGk2WE9ub1BkUlBDZlJ6RGNaS1JNZE8rR2swd1NrZ0ZoQWpzS0N3?=
 =?utf-8?B?LzF1YmJ6eVpBci91alpIM1puam5EZXpaNjZsRURMZUVEeFkvS0dDVGh3UjZ0?=
 =?utf-8?B?Wm43dHZ2akdjOThpbmhDNUg5Zkk4VW1wL1FkL3lnaTdFdmk0YVhUM2pSazR1?=
 =?utf-8?B?UWtzcXlvTGd2Y2FJOEhpVDFlOGR3WjNOY1ptajdTM2xmVG43SnZxc2pEZkZ6?=
 =?utf-8?B?OEN1ZzltV1hMMnZUajc2dlQ3RElnVDZCYzc4cHN6M09EeklLQ0RjVGJWS1k4?=
 =?utf-8?B?ek92Smx1ckkyaTlMNU1lN1htQStQSFdsc0tjeXAzRFh4MlFpQXh4WTBuU3pV?=
 =?utf-8?B?Sy9Kb1dpNGVBODE0dnFRUEdJdGFUNExmNU5ENmdKUHc2djd0NmNRZlp3NWdo?=
 =?utf-8?B?SDlUUjFZV3N1dng0cyt5dHZQZWZ5MmRkZFRzQnZ4N1VLT1lWM2tIREZUTERZ?=
 =?utf-8?B?emV6UXBVR0lXczBMVFBRajNEMDFSSkJhdk1VQU1TTFAybE55Lzc0Nk1adDlX?=
 =?utf-8?B?d2JpN1BnVW5taEtiWm1qMm5XRm5QNTNKT25POVVkMCttdjdJL3ZMN3daMm9Q?=
 =?utf-8?B?S1JUcSswTUhmd2ppdkl6Vk4yL1Zzb09NSVhKWGtSeVJWSXFNNkcwRFpOdEVl?=
 =?utf-8?B?N3ZRbFpUMU55UjcwaXJBOUZIWEtlbVJ5Z2tpaExZRDhoVkpPTmJwN3d5TE1j?=
 =?utf-8?B?aXVnZEJVOExBbitMbU8wVW9EM242aFdBL2JVcm1wclA2VTQyUXdQcHBHTzlB?=
 =?utf-8?B?c3ZnTFluS1pnd3lIT2pqY3ZWZnhGZE9LaWJIZEFkSWtZRnRuak9lL2RIdHBO?=
 =?utf-8?B?UFB4NGdxM2hxVUlmaVhRcUovSmRCNFZ4WS8xMWt0THVZTm1mT1l3UHBnUDkx?=
 =?utf-8?B?WjZQdWNCbVQ0b1dBT1pMKzh6cjBUZndJSVRvR21iR2piZDlYY29XcGtpeUsw?=
 =?utf-8?B?bkFVTlY0ZkhsTStxR2Y1NXVVbExzRGdOU00vZ1VVbDFsY1ROMjYvSkp4OFRZ?=
 =?utf-8?B?bEtOZENVVE1PVVdiWE1PdTZ1Q1d1bGpVTU1VVVYxbHBlQW1TQmd4blBubUNY?=
 =?utf-8?B?S2RSdlpiRm1TRjAvYzllS0pDL1BpZjkzbFJCdkNGL0lvTmJ6WWtMMXI0NkZJ?=
 =?utf-8?B?VmpBWGdaQTMrb0VDM0krSk9waThaTHF5Si9xSGREM29Md2tmL0hCTnA2YVFL?=
 =?utf-8?B?eHBtYkVFNDRWMkg2d25CelBxTGdSN0p3YkZZY04vcUxCZFF3bUFiMDNGSVpJ?=
 =?utf-8?B?UXJrbHVFY01yZUFla2x3SWNpbVZMYkJXMnNEa3VlVk1jR3M4WU1MVGRQZnR5?=
 =?utf-8?B?dmJjdTk1Snp6K1B4cGpkb1VkdTZIUnJoMnNkYUE3OU5jVkJ5ZWpXOEsxZ1dD?=
 =?utf-8?B?eXpkK05kOHJyaXViM1dwclk1WC9vbFlQNlRZMXVNeGcrOVN6elBGVVg2YUVV?=
 =?utf-8?B?ajUzTlFoZlptVDE2WWt0YWV5UnRoODkxUEFLY1Z2Qjc1RXVqa3VnMDNNcHRW?=
 =?utf-8?Q?h6kY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lXZGptUXNzYlZQRm5xdnEyNVpINHhLREdiQVVSTk93SzFidEM0d3l2bDgy?=
 =?utf-8?B?N2VWR2JoZXc1aDZMWkpibjRaOG1IcW92aTVNSjNWM2lZdlROMHNmMzlQU05q?=
 =?utf-8?B?N215RnNPLzk0UHlDWlhKZGU5TmpSSEZnZmhHRlVrWkZnZjFGSk1PTUQ5MXlk?=
 =?utf-8?B?NnBWOEFzUGtGMXpBN2tYZHgyaWd3QkE1ZEM2bk8yUlVYajhraHZ3OHNKVnRn?=
 =?utf-8?B?YlE4a2ZtVTYwbVdnblNIaENtMmllR3E0WjlYSDBkWGlvL29CQ0NhMnRzY2xF?=
 =?utf-8?B?TnFhaDVPYWVaT1JLMkNSd0phQUlvUlZ0MGRmUlVwZGxweHhDTkM2RTF3WTZX?=
 =?utf-8?B?dkZrc2hqZmYwYUZNUTVuWk5zNTJ5V0tGS09TMDBQRWcwR0ZOazJWOGFvVUho?=
 =?utf-8?B?VFJvMXJoZFVQZElRQURQQm5zdHhWc2pySGVZSlViUENaMjdjQk9rakJ3RHRU?=
 =?utf-8?B?cnlFQ0tZVTc0TksycU1hNGlHcmtrL2NvczhxTDJUMHVTTE1ZdWt4Ulp1MlQx?=
 =?utf-8?B?cjhBZ3AwNnVrdzZVejVmdUlNRTQxanlIL1ZDN1owbjdRRUlYWVVVMWplV25K?=
 =?utf-8?B?MmExMzJtd3ZUR216K3NPYXFxMG9HR1IxVTdxS2hyNW43UHhKTFc2WlBodG9R?=
 =?utf-8?B?dlUxSHZMTHo5cUNBdnBBTktKMzVhQVk1dXhmYXROdkJHR0pQbXFRQ1lZcHdj?=
 =?utf-8?B?NzBwYkswdUZlQmpULzZ1WG5ESmgzRVg2aDVXSVEvajZaT1JnSjFNT0k4VFMz?=
 =?utf-8?B?V0tpa0FJVysxOXRrKzMrTzVLS1dqTm5QSTlJSEtkQ2k5azhuWGVMU2F3eklP?=
 =?utf-8?B?TWwzTWpyWmFjTVdnakdTZk42K2FhRkFCL1hjNGNERkpUR1FGRWd3UHNSaDAw?=
 =?utf-8?B?UEFIZ3ZvQW1vb0ZRWkRUZEJCNHBUck53UjJEWnU1WTkzZzRmeTJZOGRiNlBV?=
 =?utf-8?B?ZHh5dEU4L3YyY3dnZ0haSTRCVDU4d2lCL0QydmhxK0IvN2d1czdVVmR2T1hE?=
 =?utf-8?B?d0g4U0M3bWtNZkxQMnlVUmt6TWJUZnFiM1pFZEpFVGd5N1FBa09yL0RYREVt?=
 =?utf-8?B?NWErRHVKUi93eGo4REZZNG9CZkVXMVlHR1Z3YjZPNUMrcVhNaFN5YmhJRzl0?=
 =?utf-8?B?SndRZzUzSGtSaFczREFSTy9WU3VTVncvaCtlcmdBaTViaml6KzNHYnZMSUVh?=
 =?utf-8?B?ZnNzZXQxTEFBUmZQcEI2bGdTRW5RaEN1WHlod0NDUlJPaTRkRkpyMzFmK3Nj?=
 =?utf-8?B?b1ZwaWtHdHZ6N2lzV1dYeE9kajNJWVc2TWtRazEwbFhibmk5TG0zTmpBdmJ4?=
 =?utf-8?B?YTZPbFRidERCSGlqdUdhQVpDSFlyb2lQRWJHSnVaY0VDZzZnWjFUVzVNTHVG?=
 =?utf-8?B?UEMweURXUEUvbk9JZlZXM3N5T05LR1lPcC9naTgxRWRUS3FucGYyQUI1ZUlC?=
 =?utf-8?B?WkRUWnhET0h1eThWT0hqZldWYmtHSFk1UXBpL2gxcTZVY3JRTjdBUFZBM0JJ?=
 =?utf-8?B?TmlkcDlucnplN2V0SkFVTHJiZW5oYWZmQ3dFUHRTMUNETW9ybWNobytQZi9p?=
 =?utf-8?B?QSsvOXBNeWhGc3BoRHBtYUM2VlptTzRlOEVxNU9LV0JWTjZHcU9adnI2Ukdt?=
 =?utf-8?B?YUUzRlg0RUtVaEo5RG9DbTZWZU9yTUhVUmRpKzJYNm02VkZPT1YyWUNEZjVL?=
 =?utf-8?B?WkF1WXlFZE02Z0NCOFZYY0cvcXo0UzBJd0JSWEVIUnVabWhYUFVZaUJ0SmU0?=
 =?utf-8?B?dkxHQjVKekFTQnhkbUZuS0x4QlhIeTRBbXNXSzNMOXpnci8wUXhCWUVzWXVX?=
 =?utf-8?B?eUt1YWlDZkZJa0FXMkpmaTI2am1VMkRXaUZ0OTBya0hZTnlMUStBWEtZVVg5?=
 =?utf-8?B?ZkdvUE90czhSdGQrdG5uMTZ1WU1yOGgxcjJjUDdNaU1uY0JnQllIaUl1bVp2?=
 =?utf-8?B?RGhHbnNNemJyQVBCVXlkcXVOdnhZeGhNL25taFA5VndFZGJzV3N2L1JTR1Ja?=
 =?utf-8?B?Tmc1KzhVVGwzb3lWMWV0RmI2OHIrNjZDaWY1d05EazVvb0FDcXRFSGFQVXho?=
 =?utf-8?B?UlJPVE4wMFRIbTMwUjBwS1lzeVBwbDYvcXh0Z1hMMHdvS05RMGhuTjRuK3Z1?=
 =?utf-8?B?N1l2S1hsNG9NSFU1LzVGb2xFRUI1ODNuckpPZGlQZThHZVFUOTc5cFBGV1Jt?=
 =?utf-8?B?YW44eEVLclRpU2I2UmU0K1B6VW1RT2ZsUU94Qi9jbTIvUUZITnFhMHFpRG8v?=
 =?utf-8?B?NjNZMFNrWGdUTkhVSUltbXZhLzU2M0FQWWpadTYwWUM5Z2tjL2xMUFk4bEtl?=
 =?utf-8?B?SlFyT215TG9VNGkySUZTTFNqWEJOaE8wY3VxajFQRnNBMDFMNy96R1lMaE1U?=
 =?utf-8?Q?qLusVvJDQ2XiLY5M=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c495fd46-6e67-46c2-493e-08de54099fe1
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:42:24.8053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuuO5ZkdcurdhuqDQOr+FrgOHrLPbbfi941uYiQgPwWgQQxrexFzxNiljNJ8Im8nLDOEQlGwGwQWRJf4oBJV/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_234229_765070_1051F127 
X-CRM114-Status: UNSURE (   7.67  )
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

Hi,

On 15/01/2026 02:42, kernel test robot wrote:

> 
>    arm-linux-gnueabi-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
>    spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0x8c): undefined reference to `__ffsdi2'
>    arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xac): undefined reference to `__ffsdi2'
>    arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xcc): undefined reference to `__ffsdi2'
>    arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function `xlnx_rtc_read_offset':
>>> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to `__aeabi_ldivmod'
>>> arm-linux-gnueabi-ld: rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0x15c): undefined reference to `__aeabi_ldivmod'
AFAIU this is related to compiling for arm 32 bit target. Is this error
relevant since this driver is for aarch64 zynqmp specifically? If so,
what would be correct way of fixing?

Thanks,
Tomas



> 


