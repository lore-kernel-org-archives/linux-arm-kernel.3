Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3ABCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qwk7zr2MuNQZ+FfJ0ztDTnZdkyhPxI51F5tDM18IOBo=; b=U1ZppuMTIw88tX3vSSjwNc16lN
	QH+sffj+69FwH6+GMU4IHSLB5hHdYcb4eUkmOGO6vdkyqYnWzAR00N0/E+XgdjZPONh4ZO0BrJVIv
	D1tt2xcmXjrVVpOfx64J2ktas6iFuwsUJpuNO1NWdz4yhc9arkMq0sqkMFjtPUlptpdki0FSSaxqK
	bGFRG7b2crn8niI9Q00IgtIE209uds7fAqZC2Tx+z31EESiaj3e2RTIuqoRrLdDrJS9d4dairOLLM
	w5XNAPjEztJSt5tDkf6EKn2aOfoNsm8YR07lh1E5SrH7qq5BRSTvDM9etaj4RT9LWwgSlBIGd89Ta
	orS2ZGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEg9K-00000005Lwe-3uJd;
	Fri, 31 Oct 2025 03:50:02 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEg9I-00000005Lum-1y0E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 03:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O12EJeqUMDTbpn882vZaBzChip0i422/j23V2ARrymAOrC9xBnBYVil8xkzYI2V6LVih6kFjslFOtEH1b+hw+OMEUu/OQAjxK0L5ih0bFd8QULRH+zCWlFjwPkVtjS3GuqlswuQ8bbTqqYAhkPjvDpCgbyGn/q/ATXKdbDYBYV3oeluRI8JyVRlEKzH0Gorjxy0MWBg7c/4XfzHfI4joZ0beliPFKL8KDlAqSUrMcF9rzbSnS3JddKNCvs4JX32iLH1qMBl2Tls7HarZd+6cvLFhu+i/7zOm8f7aOoLvj9j6KoBGjLq+3TYtCT+CaRHPEx3reVZ6cvyGSOwu4w5nuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwk7zr2MuNQZ+FfJ0ztDTnZdkyhPxI51F5tDM18IOBo=;
 b=fhYhXalEz7C9h25NTOLSEpOxcXy+MetkbMRR8qxHVIUbhS0mnfEBB+QYrd6ZeVGCQIHupbuyEHoB/z5kzhokKhlRWroBpPqzkEgPsxYsHxtZ6cgNXHjutwL5EhHMWMKWX5WQ99X6L29PLh25X/6bh9arJq27U08pdcU8hwRt5osiZ4oqHAyDRWhDnS3Gr/w+GotGUOlHUpCuFWz4QRvk0TVg9RP1Ihf9wv84mhQ+DAn2kFKWjkQH2ZiLfac0685gy3xnwsFQ0FrRIeF2kZY8IWaeKXuOpS9btPqdtq+8asJ1fCWX5yR0JKARiQ4Ssg3r2GPa/k3uIYPqc9FdLyE90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qwk7zr2MuNQZ+FfJ0ztDTnZdkyhPxI51F5tDM18IOBo=;
 b=gnOqSYu9dYdhQ65G7rkqnaWvNgLEkociNc2qg+EFQi2T/wTEskhJ/m2D437C7iFOBr7WVbNlvZq25amF0G12E66ZD5AjT8fgQ8Ir7P29R64gtWHYYWaeMk3ChHhq+dddM3sR6QAn+pEW79ZmuJKDNQIXUnCWWtiekV/GQjdfgx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 LV9PR01MB994129.prod.exchangelabs.com (2603:10b6:408:366::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Fri, 31 Oct 2025 03:49:55 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 03:49:55 +0000
From: Carl Worth <carl@os.amperecomputing.com>
Subject: [PATCH 0/2] arm64: mte: Improve performance by tightening handling
 of PSTATE.TCO
Date: Thu, 30 Oct 2025 20:49:30 -0700
Message-Id: <20251030-mte-tighten-tco-v1-0-88c92e7529d9@os.amperecomputing.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoxBGkC/x2NQQqDMBAAvyJ7diFRDLRfEQ9JXM2CXSWJpSD+3
 aXHGRjmgkKZqcC7uSDTlwvvomDbBmLyshLyrAyd6QZreoOfSlh5TZUEa9zRLS83BxcG4y1oFXw
 hDNlLTNrJuW0qj0wL//6bcbrvB8Xki852AAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Taehyun Noh <taehyun@utexas.edu>, Carl Worth <carl@os.amperecomputing.com>
X-Mailer: b4 0.12.0
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|LV9PR01MB994129:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c41be8-bd77-47bf-d739-08de18308dca
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3MvS0RTOVJQVnVGa3Fucm9jSk1qVHB3VjRaVXF3RWZJRkpBKzBtRk9zbXJQ?=
 =?utf-8?B?UXJ1eGxoaTRrQ3ZPZzBZODRRQnFKRThFeWpvLzhQRkNSb3R4NEUxZDY1TDFI?=
 =?utf-8?B?WUVVUCtOWEpHMHduUE93cWRtaS9JU0pIbkxnbHd4Z0hRRUF0SFRqSUV1RHo2?=
 =?utf-8?B?ZU5uQ0pYK3AwaVhWZzI5dklaUS9zR1Y1aWtlQ2kwNGRwbWltS0JoVzVRZkRo?=
 =?utf-8?B?UW82dHB6Zmw0SUp0WXR1UG5tdFo2YzJnT2xjNVNTYmFLZ3lrejVXR2U3ZWc2?=
 =?utf-8?B?SDd3ZmFCbVR2UmpNKzg1OTVHaHQwcEZ2bTNESGJ1VFlRYkF4RmpEaE1rNU5u?=
 =?utf-8?B?cUo3RDNjRXFWWWs0bDJBYlF5YU1jK0dlS3EvUm84ZmlOTmloa1VnVmZjdkx0?=
 =?utf-8?B?T1JpZm04VGFmbXVyK0ZrSkE3THVGMTI4WXVqdWFmVjc2V0FkK2xaWG15bys5?=
 =?utf-8?B?N2pSMHJwdTJFQU9iL2psTTRjVkVIUGdBdXUvbUxmNXNvdjVuY3BQaFAxZERM?=
 =?utf-8?B?aUUxcUc3dUVoalRBdnYxUlRsd1JLL1NvYnNrWlBhUVFxZ3BjdFdyb0srRjZv?=
 =?utf-8?B?Ykp2UGRxRnBGM3owYy9NMXBnMEN3SEhsREZDM1hCZ2lxdTc1c1JGSVJVZ1BP?=
 =?utf-8?B?MU5tK290RnhqK1JLUDROelZtaVF4NHRTamVCcnF0ZEZUWXRuZmZUSEpwNklF?=
 =?utf-8?B?dzU4THhyZlNlOWRJTlBaeXE5L3M5MTMzVlhUaFo1eDl6T0VxTVZwWlBUbk5I?=
 =?utf-8?B?djdPMDlhekliWUVWQk5ycjM4a2dKMTBEY1NxSFN3YnJaa25sMmE0VnlyUHJI?=
 =?utf-8?B?a0JIL2gyZCtWSDV3SlBPNVhRekNlMnhuV0J4bW94THZaRTJNczZCMmpuZ1RJ?=
 =?utf-8?B?b0hVN3Z2Ykk0REJ6VUlrU0RsOXBwcldFejJLMGFHSE5HVWtVZlNqbmt4eWdS?=
 =?utf-8?B?dmVYVllEYjhhUStjR0thYlplMXdxK1AxUnRmNGpkNFYyYzQ1dGpzbzJaZUxi?=
 =?utf-8?B?WnEwRklkemhJWDZlaTZnVnNERjg5M01aMFJkd1NObzZLQmZ2YWpLa1BHOUl6?=
 =?utf-8?B?RTJDNWFMLzVqNGNTRDFNeDVVUUc3U0NHeTVuVklTZzh0elBDUEhDbWlhZkRL?=
 =?utf-8?B?U0dDS0FudFZNOHEvQUN2dUtlSERaQWVOazBjWk5GbXk0cFdsOVhZQVdWRGc4?=
 =?utf-8?B?RHl6cGVwVGU1QzVZUUtuTXhaWjZLUU52UWFobmsxQ1AzV2JzY0JFalZTeE5n?=
 =?utf-8?B?ZDJROWg4OHhydy9zM2hsamFCS1dtTjhodHFvZWpUdjU1bHA0Nm15cDFWcHlP?=
 =?utf-8?B?Y1UwT2tGbnJpNG5rUDg5cTFDZ1Z5THRyMUMxWVUvaUJ5NkdWSnNQQlNHUmRF?=
 =?utf-8?B?TUF2alM1cGw2MWZ3QkRsamsvYnFqZFo0eGpyWnY4T0RFRFI3a2NYZStsaW44?=
 =?utf-8?B?SXgyS2EzVCsxeGh4Skh5QmZOdmZZQlVnOVZWTFAwS201enVkNWpGcDFXQ1ln?=
 =?utf-8?B?TStiL3QxTlZ1dVIvVzlPTU9mV2h5aXNrSkhJOXl4REd0ZUxzYkJEVWpCc3Bu?=
 =?utf-8?B?YWNiR2RnMDlnaTRBYlpSUGNrU2dWYlRYOHZ6djhnWlczNDd3ZktiSE9QYWZ5?=
 =?utf-8?B?eGdQTUMrVnFFWC9rMGlJMFNvOHo1ajl0cGMybWY0dllKZHlqZ2VESnhSTmJ6?=
 =?utf-8?B?UHVLQ1ZycjlqUllidjlWT1FpbWs4VzNjcGFjcnYxY2pFVFFhbCtvdGwyV3Ay?=
 =?utf-8?B?N1dnUFF4cThHWmRXUGI1N2NzWHhCUWVScWtySU1HTHBRWURvWU1pWGZQOElB?=
 =?utf-8?B?NEsxdmlrc0twMm1JcG5tZ2xPZTRsNmJHek43MCs2WWN5UTgyb3BVK3NsaCtM?=
 =?utf-8?B?ZlVCeWpQSXdtKzVyelpNeDcwU0xPZmVEcmpKd0dJdDN1a0JleUpMY25TN2dP?=
 =?utf-8?B?UmllL3RNL1VTMUxYU25zS3A3YlNwS2N5U3Q0ZVBqcE9Ic0c4ck9CSnYrY0d2?=
 =?utf-8?B?d0JRTFhFdWFJUDdSTXBieEp0Z1duZGlKZGl2VTRjUmg2RVVLb1l3aHloTUcr?=
 =?utf-8?Q?M2x22I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGx2ZWpqTHFCRTA3Z3d2bk5xOWJRMU5CU2VZeHFRRGZZcHdUSzZwS2xUbW5F?=
 =?utf-8?B?azFxcGgwNW9xSDNqQStFWVkrVm9qcHFhRm1xdElXeXZ6c2RCaHh5YTdYeTUr?=
 =?utf-8?B?dHZYUzN0NXY0OVlabGdrK0pRZGxuT0ZGUWJFOEo1U3JTdHRVaC91OXE5dkZq?=
 =?utf-8?B?QUl2bFhpc216L0NkRTJ4ZVg3anBaZE5vdEhlRkhZbHdIVitvc1g3MkFjMHdU?=
 =?utf-8?B?RXQ0a1lycnpFaDJTcFNsMGJHRDVBaXJCN2QzN0FvN0J1K2R6S3lUcmhzK2VT?=
 =?utf-8?B?VHlPNmF0T0NvbkNSZGxvUFBLZ1N2dWhUYmRHdmVOOVJuNnBmbzB6UXFBL2pE?=
 =?utf-8?B?Q1NqMmJweEE1VWNRRitQOXVCcXJUQmJmMjh5ZWVxV1lPbVN6MkZHTVdReG1Q?=
 =?utf-8?B?RUpqZUNLN0dVa3BjL0FZVWZYUzEwdmhaUFZCN3dwMHA2VnBZbkpaQ1BGUTM0?=
 =?utf-8?B?QmdoT2xaVWZQVFlia1RQckJNUm94MDF0RkFabkFPMHlNODlEaGZxOUhqWU02?=
 =?utf-8?B?MlJXUUVCQVkwc2xuc2RhclVLNmFZbmMra0QvckpPOWROd0gxeWxiZ0lCbkhJ?=
 =?utf-8?B?NEt4emtKNjdmNTRzUDM0WThGcVVCekFzaFYwajN6M05GYjIvQk95N2FuTlFk?=
 =?utf-8?B?RStxeGNjdENmM28wTnNWemVxL2o2Q2V0SW1mSU5DY2l1RURoY051V0Yxakcz?=
 =?utf-8?B?dVdyS2ZucU9DWHVKUXNKVVBMZnp5eE14dUYrUDJEY2lVSHJuRWl6cUVFc0dx?=
 =?utf-8?B?Q3VYdFh3SHNwbnlkcWVVeUxQZ29wMUtBcVpjUnhXSFZFT002Nlo5UzFxMlFM?=
 =?utf-8?B?OXJRZ1ZDRTRsd3BCbkI0NzZCaHN3VFltM2xsZFh3MFMrYXlvUTFoK2pGMDJs?=
 =?utf-8?B?Z1ZlZGlQR09QU1U3TTBDS0NqZUZFSkw5MjZweXRpcXNVYm5wcVZYV3ZtZ0JF?=
 =?utf-8?B?aUFUTFdEVVVuWTRJaWxBdkp5QUpQN0VDYkpIZXlZV2NBU1lKSndsOHgrcmVp?=
 =?utf-8?B?ZTVMM21vWW9NWkwrdkNjamsvaTdGVFFmYWJENFM3Mm5sMFpGMWJyVXBZUThD?=
 =?utf-8?B?ZUxUVXJHU3ZkcGtzcTFlUk04OTI5MjI3amVLcEZiNSt0aWVtZWVxWmlqVk94?=
 =?utf-8?B?bVN5V0NvR0c3cXNvcWZRcTFCNzZ0eUpYU203SXZDQTdzQmxwL0RCRk00YnNC?=
 =?utf-8?B?bitQUTB6S0RmbWJZbVNHZEV4Z2xray9VRzd4bGNSYXVqVHhqUWlKelFkcnh4?=
 =?utf-8?B?OW04NHNsRFQySjM1TytUeHJKdE5zQzdRdlN2MzlzcnBaamdXM2c0TVlFckJF?=
 =?utf-8?B?YmJDM3pUcVF1NmJEa0Z3YjJTTm5keUthU0FHZHdYd2F0c0dlNFgwenNmN1B0?=
 =?utf-8?B?NW1kSkhFNXh1WG1IUmNORkVMZ3o4RkNkMnFnY3hSa0Rsa2M1MzZxTjRjMEp2?=
 =?utf-8?B?dzg3NFNQaXBURlRlNjNsekRub0dCVE5ob3FZbFVZTytzRnpmTzU3azg1d1NT?=
 =?utf-8?B?T3hYVzdhVUJia0szUTB6UzFVQmpyekdFaHJrMUtaNHpnN2R6elB6TWUrMWN5?=
 =?utf-8?B?bHd3RVRQTGxycTZRZ2hRby83WHcvSzNnWkg2K2x6aGlDb2dnamJPanc1Ukxk?=
 =?utf-8?B?UmRLQW81bURNR0wwMVVlcktJLzJRUjZVbG5halFsTnJYT1p1cTRpMXRYNU51?=
 =?utf-8?B?bFJtakxnYjF3OW9EUDJaNzV0WStQYU5jZTdhaTJLaFRnbWxFd3V0WEF0Ym5z?=
 =?utf-8?B?R2dLSk9OTjl2UkEwU0V3c2lscHdKRWJ0V21GZ291QTJ6RjNqcktHVGFrblM2?=
 =?utf-8?B?QjltRkRzMlZqd0ZlcWhJMW00aWNDTzlDRjN1ODRBNUlRQUNJK28vUzNvVHlG?=
 =?utf-8?B?ZzdtRW0zcDlaOWhsZVB0c2I0NHB0QWNra2tDVUNBYWdnT3YrWjY2MGY1UUNl?=
 =?utf-8?B?ZGdVMjZNbVBISUFGTmltR3h3WEFrdW4yZElOQjIrMGh6NGtSemJUclJQNkhO?=
 =?utf-8?B?MWgxYWt2NnFNeFNTcFVMajYwOU51cEp1QlhBQnE0clQvMlFONnljZzNkNGZX?=
 =?utf-8?B?OXpBeDZYQWs1VVJzRzBkQXp2eWpVTmxrSEYvR2xUcUVDZXV0YU05VkxGRFdQ?=
 =?utf-8?B?eXhLM01VQndaUDh6TUhteE5DU3pKSEJXU2J4cDM5bXNMams5K294dEVybnBD?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c41be8-bd77-47bf-d739-08de18308dca
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 03:49:55.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsxBf5PVuio3QK33MkDfbjAnVbkiy2NqEE83HqEVoYkBe6YOPKIxYdFHHPfM6T9CXJRCcL0X2n1Y1udRzBZ91TGwtiw8BSPV6lHTHS8ZFvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR01MB994129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_205000_566607_75B2EF02 
X-CRM114-Status: GOOD (  12.40  )
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

[Thanks to Taehyun Noh from UT Austin for originally reporting this
bug. In this cover letter, "we" refers to a collaborative effort
between indiviuals at both Ampere Computing and UT Austin.]

We measured severe performance overhead (30-50%) when enabling
userspace MTE and running memcached on an AmpereOne machine, (detailed
benchmark results are provided below).

We identified excessive tag checking taking place in the kernel,
(though only userspace tag checking was requested), as the culprit for
the performance slowdown. The existing code enables tag checking (by
_disabling_ PSTATE.TCO: ("tag check override")) at kernel entry
regardless of whether it's kernel-side MTE (via KASAN_HW_TAGS) or
userspace MTE that is being requested.

This patch series addresses the slowdown (in the case that only
userspace MTE is requested) by deferring the enabling of tag checking
until the kernel is about to access userspace memory, that is enabling
tag checking in user_access_begin and then disabling it again in
user_access_end.

The effect of this patch series is most-readily seen by using perf to
count tag-checked accesses in both kernel and userspace, for example
while runnning "perf bench futex hash" with MTE enabled.

Prior to the patch series, we see:

 # GLIBC_TUNABLES=glibc.mem.tagging=3 perf stat -e mem_access_checked_rd:u,mem_access_checked_wr:u,mem_access_checked_rd:k,mem_access_checked_wr:k perf bench futex hash
...
 Performance counter stats for 'perf bench futex hash':
     4,046,872,020      mem_access_checked_rd:u
            23,580      mem_access_checked_wr:u
   251,248,813,102      mem_access_checked_rd:k
    87,256,021,241      mem_access_checked_wr:k

And after the patch series we see (for the same command):

 Performance counter stats for 'perf bench futex hash':
     3,866,346,822      mem_access_checked_rd:u
            23,499      mem_access_checked_wr:u
     7,725,072,314      mem_access_checked_rd:k
               424      mem_access_checked_wr:k

As can be seen above, with roughly equivalent counts of userspace
tag-checked accesses, over 97% of the kernel-space tag-checked
accesses are eliminated.

As to performance, the patch series has been observed as having no
impact for workloads with MTE disabled.

For workloads with MTE enabled, we measured the series causing a 5-8%
slowdown for "perf bench futex hash". Presumably, this results from
code paths that now include 2 writes to PSTATE.TCO where previously
there was only 1. Given that this is a synthetic micro-benchmark, we
argue that this performance slowdown is acceptable given the results
with more realistic workloads as described below.

We used the Phoronix Test Suite pts/memcached benchmark with a
get-heavy workload (1:10 Set:Get ratio) which is where the slowdown
appears most clearly. The slowdown worsens with increased core count,
levelling out above 32 cores. The numbers below are based on averages
from 50 runs each, with 96 cores on each run. For "MTE on",
GLIBC_TUNABLES was set to "glibc.mem.tagging=3". For "MTE off",
GLIBC_TUNABLES was unset.

The numbers below are normalized ops./sec. (higher is better),
normalized to the baseline case (unpatched kernel, MTE off).

Before the patch series (unpatched v6.18-rc1):

	MTE off: 1.000
	MTE  on: 0.455

	MTE overhead: 54.5% +/ 2.3%

After applying this patch series:

	MTE off: 0.997
	MTE  on: 1.002

	MTE overhead: No difference proven at 95.0% confidence

Changes since v1:

  * Reorded patches to put cleanup patch before performance fix.

Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
---
Carl Worth (1):
      arm64: mte: Defer disabling of TCO until user_access_begin/end

Taehyun Noh (1):
      arm64: mte: Unify kernel MTE policy and manipulation of TCO

 arch/arm64/include/asm/mte.h     | 53 +++++++++++++++++++++++++++++++---------
 arch/arm64/include/asm/uaccess.h | 32 +++++++++++++++++++++++-
 arch/arm64/kernel/entry-common.c |  4 +--
 arch/arm64/kernel/mte.c          |  2 +-
 4 files changed, 76 insertions(+), 15 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787


