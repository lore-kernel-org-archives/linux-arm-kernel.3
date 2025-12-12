Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A1ED49216
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Axr947flNEdQpu6H1/M7dWc30nVGThfZoS1yEO8zbQ=; b=KyQK8b8QGxQW5/qjaFlj8MQA1E
	jQna9anJEItMGGS801JeKUGr1LhpZrg4YHPnuzI3F3w62znFNkeBC/PQtr0VYnFngdq24nG57MJzT
	BkwjfgGDYUfrzHi1t8kBJf/iDx18s1NFp+CllIPJZOTYfU8SdFE9JVm04zBNgKpZ2pzQCiqLpp1fE
	40XU/VZWCIyzRWMWDB1zdeNVFbr8xpe7FHG+VJ9+AFL7oN4P/X7PsiC2ABWaU8AygFaBTu4TsA+0i
	sF4YoUisGtxt5sGfZ8iEpqZBKhXuCRKKbt19uwL5elUCwLC8RTjxIyLrII56yNR+1xVtFEDJ9Wwdf
	R368H1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1y0-00000000VYa-20Mz;
	Fri, 12 Dec 2025 12:09:48 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1xs-00000000VWV-1WMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMj50JR4YctzcCvO1HaGOiJunxs3sLnkf+0WscnVUGS2m4qdriObggEWAHixCdIxvi+7E17MIE/1ZgAq46osfZn22WsRlS6rAek2SDup0ktdST8MAIJFGnhQiHf9WbN+zFN8FdM0Xeuo7PkoudtznUs+j0CsVwhviUr26Cb7+lqPq0lHTxufprovzlZLzpJMVmwDujy2wPl4LmFP2iJpEg8ci86v4PGfmPABjuRohAf/QGtAeuBGWM0EchiqaD+Mfv/rBZyAFqScfglLLJlHka7KD0whTdnjtfa+CIz2d3g9LzKP8qjKNvesB4kepfpoCVJL1sJw0KtWUp9dpmmNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Axr947flNEdQpu6H1/M7dWc30nVGThfZoS1yEO8zbQ=;
 b=OEUJCYfwWileU6YfAgDdkGuS0TdJCVuyn8HsEe3XA5yAGqn6khUHH0RO8X+wCdYtAEoshHSgY5F8aihy7+v2hbGXIAvkpY8PfLTkINSc2wKkogALoL7442bk1zRJIpZsadWYSfr0t7wYs3M56c12gdIQAaC+nczhRdE75eZqQJWP88awuQUxAnKV/xHB+w2O3JWAPkM9T/kEr3NNor9tpU3PcIZjQqIuSz73ds0UHBfJVLsvMPxrtNkmfL5yU/PntnUEUPUWoVWm3oRLMqBO3IwqWuWTDHOXXSCW7vkH527uUGMNIcIeXhh9I9BSJESYe49oldDfBA4a+lLzeMXUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Axr947flNEdQpu6H1/M7dWc30nVGThfZoS1yEO8zbQ=;
 b=r9KTTfknTPxPI+Ha5dfd+xnd44pUSC3kH+HVe54uauxk1p3zEWEjwJ//IurnMNPTg+jj/s1VKcDPdeC+ETnmdy0jwoxxtup02syCp0zP2QIe4/OGNOYCdB4SHwf9mo2ejtCZOHIkNbT3nKc8r0EkRhlVu31N//QAXo/cx9EIeTV0efPCoXRksG1gOKJGdT5m82/M8r4nn0bZyszjms5wpvl5L1nDvfyAd7boiarPDytV2LIKJk50wUI5WQE5v7+LyId8ZkEup5kIlyI+INVSXWghgh5WeBSydpHBaIbkVFCJxX2gZzSv9xNo9k3diuL80VGIZCzV6fqYlKlu8EOjCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by MI3PR06MB10691.eurprd06.prod.outlook.com (2603:10a6:290:71::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 12:09:33 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 12:09:33 +0000
Message-ID: <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
Date: Fri, 12 Dec 2025 14:09:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
From: Tomas Melin <tomas.melin@vaisala.com>
To: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
 <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
Content-Language: en-US
In-Reply-To: <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0040.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::8) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|MI3PR06MB10691:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d058641-3ba4-455b-569d-08de39774fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGxoNXh0cW0wM3ZROXhTaG1JRnlCQVk3S2pQaVJZZEtKTEVrekVuNHhMYW9k?=
 =?utf-8?B?UEFtWnlPZ29xSENMbXE5WGRtekhGc1M0cE41WGk2SVJYQ3RFNGFTbzJJUjd1?=
 =?utf-8?B?WXdzVWF6OE5KcCtUYlRkMFVtL3dKM2ZlVEdiOTdyNTBjQVdCMWQwTy90VjZP?=
 =?utf-8?B?L0IyOWlranFqVzdGUWFkMEh1V3U3bmNsZ2FTWXlPbjhpT08rakd0aHU4SjA4?=
 =?utf-8?B?Q1psRlZBNkthem1pRkE4SnBMSVBWYVc0MnFJaVdlZ1p2K1l2WkYvMWRMdFAz?=
 =?utf-8?B?S0Y2MmFabThvYjU0NXVPQ1BWemMzOTMvWGM1ZEZHV0FBWE5YWXBnRXpxd3Jq?=
 =?utf-8?B?YzVlQ0E4bkI3VUxNSExxNmRKSDF2Z0pTaDA4UlNUN09nRGszSGp4dld0WTR4?=
 =?utf-8?B?MWJQYnY1bjVRdGhnaXpYeS9qalByU3dzd2NNVDU5Z1o1ay94cy9FWUJud1VX?=
 =?utf-8?B?UmIxV1ZaZzhtQmwwQnZ3bURXMEd6WlltK2hzL0Y1WmlKKzhPRHdOay9QZzRY?=
 =?utf-8?B?dmZ1NE1NZ05GcXlTUFdoeXRUVm9RVDFpOVk3MU1hSG9GRkJEMUs3OFRmNnNX?=
 =?utf-8?B?dkNZWHQzckViRU02NTJQSnpYL2RnaFRaRGp1K2s1TW9vWC9NelAzSGZWaEVS?=
 =?utf-8?B?bEttZTJPcFBoSGZ6OGxHTkRhdDNOeXNzOXZxTXNLUGtQYTJ2RHphdmZwSFpK?=
 =?utf-8?B?djhPQjlRK1VxSjl3S1dFaVhzMk5qcitQTlBQUXU2aytxZitXMDdMYTYyVFEv?=
 =?utf-8?B?QlZDNGxOR2FJcmRHM1JBY1FjYVF3WDFFbWFoRDJTS2s0MkRYbUVVTCtUMVF5?=
 =?utf-8?B?Y0pWNDZQTTgreUVPTytPRzdYL1dyeUU3M1VWQnJ3UHN1dGc3dlo5NWxiUGFE?=
 =?utf-8?B?WHgzOHQwS3ZseEJscGVubDZ6UjE4c09JQzJyeXJZdmMvbE9JUVBPamdQNURr?=
 =?utf-8?B?enFsV0VvMFA0Z3h3L0VHRzdGblJWZlRwTFFCcG5IUEhEVE10dTJiY0RwaUJm?=
 =?utf-8?B?cHFxTXpRT0plc1RnT2JpUjJYVk1ZUlVNTG9odmlXcEZCZUdJaVFpVEN5czA2?=
 =?utf-8?B?bFBiVmVNZVhuMGQ3Wm9Qa094QzBXMFlqMzI1akFsSXpRN0tiUWxvc2pqanE3?=
 =?utf-8?B?WEN6MGRoY01wVGJDR3ozdFA1MzBjbzRnUnFIcnVwMndXRXRLaFZLWmVLazMy?=
 =?utf-8?B?aUcvb1J4cWRkUHZsTGM1dDd6NFdZaU5UUGR6cmR3VDJ4V1dDL3RCa2hUV2Fu?=
 =?utf-8?B?NFRHakdyTnZxUmFjbitmOVE4ajhlazlxSFJ5Wk1WTmxtV1E3VWRRK3QvR05k?=
 =?utf-8?B?L0l3S2Zhck1ubnl5RUlleC9mRDFOYitRb0hOaSsrUit0ZktKaFFSbHZsT3E1?=
 =?utf-8?B?eUZhTXdsd3pJYm5STWlsSVBqTG9Nd3RrRTAvQmI3TWU0c3VMYmlzSzAwemwx?=
 =?utf-8?B?V25XUjh4Qms3VmZGU05mTmFVUGkwbXZLc1BoeldZMUNlWURlNm9MN1ArUzlR?=
 =?utf-8?B?ekNSai9kMDY4UFppaC9RQXNrWi8rZ284bU54L05FMmRLdEJyOHd2Q0lWNWJq?=
 =?utf-8?B?NFVkOUhnS2RHdzAwZUFUMnpLTWJMTExxaWNTaHVaSDVaUnpuUlEvQVVmNlAr?=
 =?utf-8?B?NEp6eTdpNUhkVWo4TUxZeUl1Sm8zbm5OeWdsa3I3S0x5SExTeUhTYnMzMDZR?=
 =?utf-8?B?R2IyYit3WVFuN0hhTURydnJ0U3BIaVdyZERoWXpNcUdrdnNWQ1Z4NWd5ZmMy?=
 =?utf-8?B?d3VQTVRNQ0tPblFocVZGcWJiTVNEU2gxMFAvalkxc2xYbUo2ZkpmNkhGSnBS?=
 =?utf-8?B?WkVMczh5TXVSK2N2ZTBIRjBNblQ1QkNVS2drb2dsMDU3WnRUSmJJYW1oc25z?=
 =?utf-8?B?Q25Hd0JodlVBdUlNWE9LdGJIMSsxYjgzRm5jUGluSlE0dU5melZicHRreTdB?=
 =?utf-8?Q?LybYwxijxfnHaIH2Xj4Smay2BeTqcOcG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5zQlNKN2drcWRqOGJrQllpYWRNbjdDQkRlVDNGM0s5Z2RSSDFlWE9XOGhn?=
 =?utf-8?B?QncrY2ZvTFkybnFJQXROc2ZmWDZ0UmZrclZDTXJUcHJNR0djcnVsdkJnaG40?=
 =?utf-8?B?OTI5Q0dZNUZaTUJjRnhtdENQZXorVHh3OXRIbkxYTWk2b0d1VVZRV05vakp4?=
 =?utf-8?B?Ym1YOFViL2hqWGRwSVMwWTdVVkFWUHIwT1ZUR3Z4dTljL0I1WXVyaGw0eVlG?=
 =?utf-8?B?MVU4d3RrNEpMZzl6ckF4T3BPYTYxMHdhai9Ed21lSzVwVXhGMlZnTWwzNUow?=
 =?utf-8?B?NzlpQ0xScGZNM2hES2g5OEY3RFcwN0ttY3NXbWowd1prSG5ZY2M4THN2VVgz?=
 =?utf-8?B?bmhSS05pV3pMM2tIV2tZSG1tb3FFVEkyNHVnbmtIZU5EbGFJS1F3eUdpODIz?=
 =?utf-8?B?Z3NnbGZEbmlIVVdPQnNudUFZZG9WUGRVTm9aNDROeENhKzJidTBRRlZrQi9o?=
 =?utf-8?B?ZkRTY05WOTNpRVNndHgxN3hUUFRMS0duOUVLODNXdjBNcGtGL2gyK3l2b1pu?=
 =?utf-8?B?MDBBMDBmM2FDandML2NJWm9keGlVQTNONmp6SjRLK0cvWlRGM0pUZjdydjA4?=
 =?utf-8?B?YWtRZXV6MnhPK1BNZEtkc25ReHBmRkJmQW5SQkQzQkthd1lQZEF4dVN0NWRE?=
 =?utf-8?B?STdDMGR3Q3BVNTYyNkVVOHJJSHBudjZnU0cySFNUdU8rOElqS1Y2NkxWRENY?=
 =?utf-8?B?eEVoVlNJL0pZb2ZtMUs2MTVjc1ovaWcyVWJlbm9OaTRlNHR4VGgzSjdxWGJL?=
 =?utf-8?B?ZnEyUCswOUp5TWR6Uys2RU05Rkx4SkZpZzROUURWeVloRG1nMmlZdHVnem85?=
 =?utf-8?B?WDVvL2hybVBMdXpCblFBb2JETWVjOUdxUXFja3hDNTFnOThEZWtrUmtLaVVJ?=
 =?utf-8?B?c2ZlN1czZHFTWEhpS2phenhIVnRsR2VLS1ljMUk4RmRiNWlOK1FNZXkxa1Vt?=
 =?utf-8?B?Unk0RkZ1dmo0Yk82WHZuaElFUHFUUkxrK2Y0eUlxamttclloU3FzNlFDcXhm?=
 =?utf-8?B?dnRaVlFod3k0dVFYa3BlOVJodTJBQ29xdE1LcEZFUnpKdVNCTklMTW85THJa?=
 =?utf-8?B?NUVwRDBBNmYrd2s0U1JCMzI1ZzQvTXBEYWNRUnRkWnUrYndUTUVzanJWSk5F?=
 =?utf-8?B?R0tqTFMzamhjYkRIeHQrQVFnWVJldnk5dmtpS3poTDZaSGlDZ3RFZ3cyU1lY?=
 =?utf-8?B?STQ3TENLUmlmMUppM21FOTFxRUd0dDBXd1ZBTkk5Qy9FTC9HZkpzdkNGaFN5?=
 =?utf-8?B?ZjliTkkwSzRDQ2liTXJiYzczL3pSOEpTSTh3ekIwcGw2WDdvNXk3NG5IaUpw?=
 =?utf-8?B?RG1MaWVraFoyb2RFOG9YMWU2cTR0R2xVTXk1MUFTNTNLL0duMVU0UVFuL1Nv?=
 =?utf-8?B?WXhNdG9PbWhWd1lqWk53aExJYkNLb2xXMkE0MUZ2eTJQRnJQQ1VZTklNSWI5?=
 =?utf-8?B?N2VQM29hUkcvV0RKbk9kclVmTXBzd2l5YjBvOG83VDZ2K1d2N2JLTVFpL3Ew?=
 =?utf-8?B?MHhwSjNyWmtJOW93NHM5SG5BWUpQWW0wR2h4d0hEcGdxQW9YUWl3S2VTa1RJ?=
 =?utf-8?B?eGxGZGJUenc0L01nSzdiWEhzdE5rdG01Nk1wbE5mOUtFZGc3ZVQwZXFuUzh1?=
 =?utf-8?B?ekloTE5xNWNEYUlydjVCOWdBUnNvWUJML0VxZnR6RHZPNk1kLytGYmhXdVgx?=
 =?utf-8?B?MGtWMEFmaWZZNUxuRzRTZEFGempaZDhES1FEWXVrT2tBQXcwR2taR0QyQ2py?=
 =?utf-8?B?ekZUYmpZY2Vnb0k3THU0K1dYZE96MTZTVGM1SDFsMFVVQ1JXZEdjSUFzc0to?=
 =?utf-8?B?SlphRG1lMVFZWWJJdjdmaDBZQVBZVTlDZitiZU1FYms2Umk4dDJFRTJTN3NH?=
 =?utf-8?B?OUdRMjlXdW1SM01Kb1B3MHBEY0ZNZWVGaUJzdXFzeThhRkFaZEhGU0xzNHov?=
 =?utf-8?B?L1NWZXVkcUFYRUxWS0NlakxkdTdvenFuVDFhdHZpTFZTc1FGZU1TRHVDS2gv?=
 =?utf-8?B?cTBvWWFkQkJULzZCOWNLc2d4TFhnQzVvV3g3RGVXZG54NkM5UXgvc2tlNFMx?=
 =?utf-8?B?eWhLdkhGUXRyZ2RXdHZNMTRaL0VoZTRuN2k4T1Z6eXBUQyt2aS9hNW1sY21G?=
 =?utf-8?B?KzNOK0dQWXdER2dwZXJNc2daQ0h4bkxuM2Fvakpxam9hTjJnb1FuRy9OL1VS?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d058641-3ba4-455b-569d-08de39774fd6
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 12:09:33.7703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmOyfhpyz3PhUNATxgAt9ynX4o5LO7xm0hAm0KMHN53UP20mn39aRNPBmLnOUKubJzJGOffjXX0YbNDwHNrfRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR06MB10691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_040942_341311_FE407E63 
X-CRM114-Status: GOOD (  20.38  )
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

Is there some more specific information I can provide regarding this patch?

Thanks,
Tomas


On 25/11/2025 13:42, Tomas Melin wrote:
> Hi,
> 
> On 25/11/2025 12:30, Michal Simek wrote:
>>
>>
>> On 11/25/25 08:53, Tomas Melin wrote:
>>> This reverts commit 06d22ed6b6635b17551f386b50bb5aaff9b75fbe.
>>>
>>> OP-TEE logic in U-Boot automatically injects a reserved-memory
>>> node along with optee firmware node to kernel device tree.
>>> The injection logic is dependent on that there is no manually
>>> defined optee node. Having the node in zynqmp.dtsi effectively
>>> breaks OP-TEE's insertion of the reserved-memory node, causing
>>> memory access violations during runtime.
>>>
>>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>>> ---
>>> For further information about the U-Boot logic related
>>> to this, see lib/optee/optee.c in U-Boot repository.
>>
>> What's the behavior with EDK2?
> Sorry, I cannot comment on that.
> 
>>
>> U-Boot also have optee driver. How is it probed when you remove this node?
> This is about the injection of the nodes to the kernel device tree. So
> in the U-Boot side, optee driver can be enabled or not. This passing of
> the optee nodes will happen outside of optee driver context (image-fdt).
> The OP-TEE logic will not insert the required reserved memory regions
> into the kernel side devicetree in case the node is already present and
> that is a real problem.
> If this change eventually is mapped from kernel to U-Boot side, OP-TEE
> needs to be enabled by boards that use OP-TEE from U-Boot. But that
> sounds logical and how it was before, why would OP-TEE be automatically
> enabled.
> 
> Thanks,
> Tomas
> 
> 
>>
>> Thanks,
>> Michal
>>
>>
> 


