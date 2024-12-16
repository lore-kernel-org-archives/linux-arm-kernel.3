Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079BDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 04:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vH147ow9DiX86OW2hRDHnSdrG37ZcOVBL1R9RC/E3CE=; b=kf+Pkrtet+cVnw+hk/xP6rp7Ul
	nDT+fsZgKkkPFbctC1/TwQ6wmYO8LQSMcN0K4njTznfVCgB90ntgJMRcJUuvCY715FFD2ZdAiIxTi
	6Pmdc7vGo4H/n8HWHY2W3+5iHSNyuQzBl1OaSeT2ghw96dGn1WF+uQMX/P4+dRxesIwJjF1MQSmpj
	AlwjUj8uEkCSUitcLlw+gKKN/nbHzFdTHtlrAiNU8D8dc+u6AEaFtOg1DpRcFGBMqUq/g2WGZ/pi0
	uq+FhphE8Vs75ll9tTcpuKW8y82JNbv7lYHz6x51oUMoJKrjSzwGKnv5HQrNHdq9vuRqY1rQ/3Cwn
	P4FMz2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2Wg-0000000904R-1SEF;
	Mon, 16 Dec 2024 04:16:10 +0000
Received: from mail-am6eur05on20723.outbound.protection.outlook.com ([2a01:111:f403:2612::723] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2VX-00000008zp5-1eGN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 04:15:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3IBUI8NqTalZz7PeKt0y90mG2LYCPCsz3hGGdfJG+9ju0dEsrJFyTQgqDfV2jCwIKdoTSBOsHJZz/p+yp47zzUqw+i+pigdU5izqm0IY/q9FglDZRLOljsEylh2L//L0jEB3VRljxIFUlta7DHSOh0heBlff7kB/Jv4SVLsfwHrWR0d7miG3C7tUOYat8chZRXtSTL7QRvPB+qpAeucRt9XKKB8T1VOhRhzfWPMAxDfz3VXx37S45MVj3hIBwohogJJLOPmDuu/yBy8YXqfUPhMaGChn/6SzLcDoaragdYrm7L7FxvYMsiyDmVuHJrn4+BFmAUbmP1ezt6EPXCLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH147ow9DiX86OW2hRDHnSdrG37ZcOVBL1R9RC/E3CE=;
 b=SzCN2LMBlhwcVE3RP4JnSAGlYCCDZsEMf5sGT3pk6zX1VDTJvhnkaoWvRDheDLTxh5QUzsekF04EYq7A0KzGkIjOS1IXAUSbLjMItFR01a/5M0xpjaBoUdk6WQPSqqaqOVy1VIq9S8kGJQSa1tzaoBszLpPLDjDcmJ5BTF36SfNKmHZrWfSb5I51FTo3lO1QKKMttXdpKolMNyGycsqCE8KhXIhw9KBKcl6iIMdgiVWNXla6GcVg3X7itsF1shBf2yB/iCTQvIP5zWrrTRXlbnjGM9eCTCa2bM7jlN0FA1826x+bKDjECPvIFSNmbyy67SK048AoPBPMVIGVfRcH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH147ow9DiX86OW2hRDHnSdrG37ZcOVBL1R9RC/E3CE=;
 b=cFis7Gs2q+wzdQv4Ze6ALdesbtm9KNRfMiwgqB7a+p4S2/oFSyfdb/sB44yJGYElO99iH61R0w8qD9DnHGV6eoxQBs+A/ctnXP+oSvQ0lmHB6Izp/3p3Sqy1md8FqguG3anBtq+VpPTv9oNFPqIgzOd/R2BLxUvC5BB7j6vF3e7Dh9TJ6yo99v0pHfrnZIS8P5/ttExJzXWYh/BU7MZNBwQ/+0xG/pHwyxNFUl4rzPpmvIJbV2skDMR33BxQGG2djDT0T9+YJnpSnx4H4tmy0gGIbXzk8H6RQZajIiu5TYv6jlNJdxFbDJyIwkw71COgHyXv52UQAIlFFWJHR6WBKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by PAXP195MB1512.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:274::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 04:14:51 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 04:14:51 +0000
Message-ID: <8b3ed680-bc14-42a3-92d2-2167213954a5@phytec.de>
Date: Mon, 16 Dec 2024 05:14:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
To: Bryan Brattlof <bb@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
 <Z12rnZiCXQxtMWlf@livingston.pivistrello.it>
 <20241214215624.e372oju6eserpf4f@bryanbrattlof.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20241214215624.e372oju6eserpf4f@bryanbrattlof.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|PAXP195MB1512:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f1a071-b5ab-4c68-56da-08dd1d882f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0ZJdEJzMzQ3RUVMRDFLN2c3cXltdCs0QWw5WWd4RnZpSEVXb2RVbTBqNjl2?=
 =?utf-8?B?VFZxYmNYQU84UzROakRHVzErVUdHMzVqSE5aVmpWZEJ3VjNTTG1NNVo1M1RH?=
 =?utf-8?B?bmtyQ3kxcGQvWCtjNjZTSTJsWjVqWVVHY1hiYzkzMHVjZDNYRUo4T0JLTTlM?=
 =?utf-8?B?QmdnWnMwRnJPVHdzZUkyLytjaWRtT3RybjNpdE1WMmh3b0dDdnRvYmVqNm1o?=
 =?utf-8?B?dHJRYnpvYisxRDl0OFBia21YZTY2b2NlbkdFSFFDamNod25nQ3JucS9USEZM?=
 =?utf-8?B?K21abzdPMlV5SXpUM0lPZGxMWWxsNnpUbWRjN3gzeVpsUzZONnhva29ldWI2?=
 =?utf-8?B?ZFdVWStmRnhKSW9naHZiTVhhWGZ1a0k1Z09jY2xaREpubHQyZzdnVVl0SnZO?=
 =?utf-8?B?L0NsSjdtM0FMWWdRcjY4ODUxeDg4anlUTXVyTmsvdkYwU1ZRMlpmZDJsT0hP?=
 =?utf-8?B?ZHN0c1JFcS9EZWdoS0lvMCt1VVErbW80MFdhUW1UakdBeWpMVmJLWm95R210?=
 =?utf-8?B?a0NPcCtyM3c4aHpkcEZwOXYvUjl4MXpOK0sxK1RDR3l5RDdkcVZpbWtqY3lH?=
 =?utf-8?B?cXNna2lKY3hPOEtPaGhSSHliZmZIcVVKNEJSZ1F2TzBnMVMwU2FmOGwzdTNn?=
 =?utf-8?B?OUVHQTFYMVhjWWl6am1WSVlMVWEvNmZtV2tndE1WS0Y2R1A5bWdtaGN3cllr?=
 =?utf-8?B?ZU91VnRDMVN4TUFHT0psNUJRZndHREFWVEkwNzJKWE5UVVA2SkR6L0NFMnBW?=
 =?utf-8?B?OEdHU292L1ArajR0UE13Q0JXSWtOaUZaV05leFdidHl4WDUxRzkzcnkrN25U?=
 =?utf-8?B?QzJaeEE5Uk5VWEF4aXp4Sk5xSkRlcy9CeEdodWRDaTBHVnozZDRDamxwN1Rn?=
 =?utf-8?B?V1RhUEZKSUxaN3hXdW5RSEZPUkNvWExYT05QQk9FRDVqclRqZ0NwdzdTVnJL?=
 =?utf-8?B?TCtDQXlWZ0drSURGcHFBSXpJT0hGa3VES2kvelFFaEszUGtuYUc5bzAxdlp1?=
 =?utf-8?B?S1BaR3hiK2JueXd3a0tBcHlnMjlScHFMdVdXclVEY0d5ZHBKR21IdmVBTXh4?=
 =?utf-8?B?a0dDY3g5MzJLalpTZ0lLVm1EcTdWUkxBNlB3SEFSdTdKS2ZZUE5ONG82c3pJ?=
 =?utf-8?B?aEp0cmtJTWdNTDNnQkVzTzdqaWNFVzN1dk1yL2hBVmV4Z0hCUnRmWGpaWDd5?=
 =?utf-8?B?NGlXTk8yVENhU2RlNTdCZ1FQdlpoeUQ3QzRDRjU0dWxtSmNadlRVcDl5Tjdt?=
 =?utf-8?B?L2pDMmNjNjFNVkk2aGIySnMvcXM0dXpUZlh4MGNpSWlvaG1NQVFjR3NkSXFh?=
 =?utf-8?B?d0huZDQrR3ZNZjZRRUVRQnNuQmZ3aUtvSGpTQWVSMW9KblFYUG9vazk1UWNw?=
 =?utf-8?B?eW9jcHRUa0tBWWlPWDYyTm91ZitQdlIyZXVMa0pWRTN3WnpFc0J6Tk93SVEr?=
 =?utf-8?B?cTNXVm9vTERtUERueG40ZzNkWUlXeGtTR1M3TFBKWGNxTkFpUHMwM0dpNnNO?=
 =?utf-8?B?Wll3K01CRlNpWGhuRzBZUDdnRXBWUWErMWEzcnJVLy9CRmNvNXQ0ang2dm5V?=
 =?utf-8?B?ejU4WmhuRXF3akhiWWVQYUpsdjJiNmtSQ01HSGhxN2xySkRUYTRhWVRFNjdo?=
 =?utf-8?B?Tmt2RHZGNE1KQ213TEdETHE3RE1tWUJTR0VESm1PUCtoYTc1c1ZMUUxvVHcy?=
 =?utf-8?B?ZUZYcUtLU1F3My9NWWVTWnM5RlhFVnB4dXBxcUloKzZoMXBVay9zUklSQkVS?=
 =?utf-8?B?clBKS0JjUlVFNG50Y2JjcTQ3YTFCUG9rR3NtaWJNZDlKV3pNSmxxTERRREZ4?=
 =?utf-8?B?NUNlNGRyNU96M3dTZk43R3d6NHRBekk1MHhLUS9SNlZ6Y3lHRldzckk3OHdr?=
 =?utf-8?Q?N2kqQKGHMpZIN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JxL3AwQ1ZrdG5YcVpFT2dGUGh5aVNGUHFoMnk3aW9KK2NHdEM5Y09pQzlD?=
 =?utf-8?B?bzZTUkZ5WDVhS0UyWTNCSisxQVhuR3VDdW5lNE1oRDlNckdzRXQyV0F3NlFo?=
 =?utf-8?B?dlJ4U1R0OHFlZjBjamhTWXBFcm1zK05hTnJJYkhiOHFKSXdIUXVxWTJEUEdt?=
 =?utf-8?B?WmZvRlV5bUlReHdLSjhSd20rNlhYa0YrK0lqTFpRaWZwaXZjOTBSU0N1RDRs?=
 =?utf-8?B?bkpoaGdhVGJyY2lHcmtzQWZIMlRCSHBZWVJXUSsrMkJ2bjBXR21IaGRFZk05?=
 =?utf-8?B?cko1bEEwR084TVhDSUZXY2tRWnhBWmxGZVo4b2k1ZTJuNUI0emRyeUtNdWxD?=
 =?utf-8?B?SjUzcmRNZ0hXejdDcUJycTBvTW5KTUVoV3dnT3gzbENOK1Z1MmxSTU1RZkR5?=
 =?utf-8?B?OWszWUxKYU1GVmk1cFVzSHVML1BmWEZXdkpHWHpERmMzaXJZMEV1Z1dXaHh0?=
 =?utf-8?B?c3hRaEw5ckR2ZVV6YXN6UGNEMEpHYzlrNFRwZStad0pENytFNUZCS0xyQXBk?=
 =?utf-8?B?czZ0WTRJMG5ZdkNXT0tBZjFrNHRuQzZ3WEJJcDdYTk1hbEFZMk5KRFNFT3hm?=
 =?utf-8?B?TU43UUFQeU42UzFnTkZHNXZHeGVoZjBYTWtNZG9Gb1d4aGJ1OGMyTTFWODcv?=
 =?utf-8?B?S0hRUmRJNUNTMnFWUnp5UnRKS1VKNGpjd1VjckpuN2tqYUxibm1XVFo5MTNm?=
 =?utf-8?B?cE16cXV3Q2VOSjhlcGlTSEsyNEhGVVdVT3ZqbmFpcjJvUUFiY0FqK1Y5WEpI?=
 =?utf-8?B?d1JvVHVyajQ1V3dSdzJRbll2T2ZOdnZjOVl2VytxbFNVRHVMeStkVm9KdU8z?=
 =?utf-8?B?aVVUVmxONE1yektya1F2eDlTWHNqM3B6RElOUytFNWxYVk93T0ZHc0xOY3pL?=
 =?utf-8?B?WjQxaU0xeWlnYmhMdW4zTElaOTNEWTVIWkVsMWRZL2tnZUxZOXRUbVhVSUp0?=
 =?utf-8?B?YkVIUENrV2tzdWhQaDFxRnZhNTRKRmNJQ1A4RmFOY28yNWRPN0FwMm1sSzlU?=
 =?utf-8?B?L2dEYVFaOCt4WVZXZGM1Y2xFVzNhb3pJWG1MaGNMMUZRWG10T3B2M1hObVJP?=
 =?utf-8?B?Sml1dC9hT1JhYk5IQUlIZmJJVDRHd3Flb2RucmZuVG5HK1k1WStZT3RhWFBS?=
 =?utf-8?B?bE8wai9tbkVhZ1Z4Q3k5cFE4QTkrcWJMZlhLbmlnV2tHdjNuMVZGY2Q2N2M0?=
 =?utf-8?B?UVV3N21LTFZpZjV2RWlVV2psUkhlYW5BZlFZcWdNUU9ybGF2VTJ0ZS85Z3Iy?=
 =?utf-8?B?WDE3bkxXaVBFVDRHQjFmdlZMRGNBd3NEVDgyVGx4LzFBZnM2UXVJc0NQUTNh?=
 =?utf-8?B?SmxmbjgrWm50VkovK2t2bXFHOVYzUjFVVktMcFp1S1JsMnFLSUFjeHc0KzBs?=
 =?utf-8?B?NmQ4N2x1bTZTMGhDVW9Yb0Y1alNkRjFJVmd1OEZTSFZPSGp1LzBFYkMxZGxU?=
 =?utf-8?B?dXdSZTBVVDZYcXBZZ0Rlbk9jTWsxR2dIR2lqSm81V0o5cjNZbkpvOTFXY2hZ?=
 =?utf-8?B?WW5FUjUyenZKZXJOOTk5WGV4OFdGZGRDSmZ0c3JQOGE2MnN5V3pra3FvYWlu?=
 =?utf-8?B?ZlRvZ0J3aDI3L3p1bVFJSHhxVWVGNzNHbUhFaDZuenArR2F4SUpVR3NucGg1?=
 =?utf-8?B?Y0grNndWUG5KVjVBKzY2cHpzSHpwcmdvdTJZM2JuWnNyaHF2aGppcXgvc2xC?=
 =?utf-8?B?V1ViRUlmZForUTNLbzA0cWFJaHBaR29RUjFhR3ptWDFaVHZ0VUlNUFZ2bURU?=
 =?utf-8?B?TXFRWWV6Z2w0anZ0MTdHc2Zic0VhcXZFTWdFU3BINUlxWVl2UFU2a2g2M3Rj?=
 =?utf-8?B?VWN3T25RdWw0aGpYTnQyQi9zdFBOSXNyZmZ4Z0pyck8wdUZ1WjFkNTUyalI5?=
 =?utf-8?B?eDZOODduYzZJbmQ3VzBIN083VlRHRWEreFllTWlKTjJKTEFLRXBtZ3E0aUtV?=
 =?utf-8?B?V1ZsK21RY1RMTjl5MDRwakh6Z3dGZ2k2UmFpS0lmL3hkN05GT0dXMjlmUzFC?=
 =?utf-8?B?Zkg2MkhLNUZIWmVvN1cwV0dCR0F6ZmJEaWtUVUtaKzdYZldzeFUwcVRDK0xw?=
 =?utf-8?B?V1JDZ0gyelJ2WTdGektaWGY4RS9wdCtMZ1d4M2lZZzVxZXZFN1VrbzQ3MzlM?=
 =?utf-8?Q?EGzYvurdpCcKWPvtIbXZkDZjI?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f1a071-b5ab-4c68-56da-08dd1d882f9e
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 04:14:50.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tR8SZW5wrBdta5at7HR5TVP9j9+TSpbUbfF9wF68bJU6IXmjmVSvhac6akspaZWBnjNPhyPnjDlCdqfhnyZhcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_201500_235816_56659EE1 
X-CRM114-Status: GOOD (  31.84  )
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

Am 14.12.24 um 22:56 schrieb Bryan Brattlof:
> On December 14, 2024 thus sayeth Francesco Dolcini:
>> On Sun, Nov 17, 2024 at 11:34:07PM -0600, Bryan Brattlof wrote:
>>> From: Vignesh Raghavendra <vigneshr@ti.com>
>>>
>>> Add the initial infrastructure needed for the AM62L. All of which can be
>>> found in the Technical Reference Manual (TRM) located here:
>>>
>>>      https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
>>>
>>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>>> Signed-off-by: Bryan Brattlof <bb@ti.com>
>>> ---
>>>   Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
>>>   arch/arm64/boot/dts/ti/Makefile                  |  3 +
>>>   arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
>>>   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
>>>   arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
>>>   arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
>>>   7 files changed, 252 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
>>> index 18f155cd06c84..b109e854879cb 100644
>>> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
>>> @@ -31,6 +31,12 @@ properties:
>>>             - const: phytec,am62a-phycore-som
>>>             - const: ti,am62a7
>>>   
>>> +      - description: K3 AM62L3 SoC and Boards
>>> +        items:
>>> +          - enum:
>>> +              - ti,am62l3-evm
>>> +          - const: ti,am62l3
>>> +
>>
>> can you clarify the differences between AM62L and AM62L3? you have a mix of names in this series. I assume that
>> AM62L is the SOC family / product name, while AM62L3 is a specific
>> part number.
>>
> 
> Absolutely! I found the naming a bit confusing myself.
> 
> We (the baseport teams) have kinda coalesced into using less digits as a
> way to describe all devices included in the subgroup. So for example AM6
> would be all Sitara class MPUs in the K3 generation. AM62L would be all
> parts in K3 in the 'lite' derivative. AM62L32 would be all AM62L parts
> with display and dual cores.
> 
> But I should probably decode everything as these part numbers are really
> opaque in my eye if you don't see them every day.
> 
> The full orderable part number for this part is the XAM62L32AOGHAANB
> 
>      'X' is the production status. If you see an 'X' here it just means
>      it's a pre-production sample that hasn't gone through validation.
>      Most of the time (outside of TI) this will be blank
> 
>      'AM' is the prefix which indicates a Sitara class of SoC. The AM68
>      and AM69 being originally a Jacinto class part kinda makes this more
>      confusing but back in the day i think it used to stand for ARM
>      Microprocessors so that's what I've been telling people.
> 
>      '62' is the generation and family of the part. So this example the 6
>      indicates the K3 generation of SoCs and the 2 means it's an MPU
>      family with 2k display or 2k camera support among other things.
> 
>      'L' is the derivative of the family. This is mostly a marketing
>      thing to indicate the target market for the SoC:
> 
>        AM62  (or blank) would be the general base class
>        AM62A is for the analytics derivative
>        AM62D is for DSP
>        AM62P is for Plus
>        AM62L is for Lite
> 
>      '3' is the configuration. This really depends on what the business
>      teams find feasible. Some of the family/derivative combinations
>      don't make sense to have. For example an AM62L9 which would just be
>      the base AM62 derivative, so some configurations may not exist.
> 
>        0 = No Display / No ISP
>        1 = No Display with ISP
>        2 = No Display with ISP and Analytics
>        3 = Display / No ISP
>        4 = Display / No ISP with Analytics
>        5 = Display / No ISP with GPU
>        6 = Display with ISP
>        7 = Display with ISP and Analytics
>        8 = Display with ISP and GPU
>        9 = includes everything
> 
>      '2' is the core count. AM62L32 would be the dual core option.
> 
> The rest of the digits get into stuff we try to do automatically via our
> bootloaders so you wont see any mention of them in Linux, but I kinda
> wanted to continue decoding this :)
> 
>      'A' is the silicon revision. A = SR 1.0
> 
>      'O' is the speed grade. (there is a table somewhere with all the
>      speed grades we support. The two I know about are.
> 
>        O = 1.25GHz
>        E = 833MHz
> 
>      'G' is the feature set. Because the derivative is 'L' (or lite) we
>      probably won't have options other than G which is the baseline
> 
>      'H' is the security & functional safety value
> 
>        'G' is non secure no functional safety. (like the beagleplay)
>        '1-9' are dummy key devices with no functional safety
>        'H-R' are production key HS devices with no function safety
>        'S-Z' are production key HS devices with function safety
>          
> 'H-Z' is probably the most common security you will see TI make now.
> There are ways (by talking to sales) you can purchase other variants for
> special use cases (like aviation) but I think these are all special use
> cases with unique regulatory or security issues.
> 
>      'A' is the temperature rating
>       
>        'A' = -40C to 105C
>        'I' = -40C to 125C
> 
>      'ANB' is the package: 11.9mm x 11.9mm with 0.5 BGA
> 
> There can be a total of 18 digits which can vary when decoding the
> family (AM65, AM64) but generally this decoding scheme will hold. I only
> really see those weird parts with our vertically integrated customers
> with their own sales teams.
> 
> Sorry for the essay. I went though our catalog one day and had the very
> same question you did so I wanted to dump as much as I could.

Thank you for this write up! Will save this mail for future reference.



> 
> ~Bryan
> 


