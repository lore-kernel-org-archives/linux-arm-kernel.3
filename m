Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59A2D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwfCQzb4WSg0TaHN7R0ZbsnaIqUjfcF3relX778Dqnc=; b=2kzZVZEdTFwIA++5Rlf6zKasAO
	3SodvmXAFlnJr4Dy8OVbefXKdCUMdsSBxP5CjrBz5f/z4+8GybZW7puZ0mSdOxYpdqqJ7+rJ0uQMj
	UHAOvwcqMmmvJoEqCq1m8KWvD9NPxZPU20hi8qpxD263YI6ZswJdLUuA3kG8Fk8kg8wV2SZT9oG1/
	Q+YZigr6AJtFpkqnXbApIKRwbyY+2xkbX2EDV5Wr4Jo9+yfOAktWmQEOAZy09AnsM55R0obK+lL4G
	s2QsAUOMLUBJBuq5ZAMlobKkcmXvjrFRJTPFG9BM07x4CzWTPGm3kPAZJrvR4tuePYwj8lsU574ur
	9qNenK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ59p-000000046A8-0JdM;
	Mon, 01 Dec 2025 14:45:41 +0000
Received: from mail-westeuropeazon11013019.outbound.protection.outlook.com ([52.101.72.19] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ59l-0000000468y-22Xv;
	Mon, 01 Dec 2025 14:45:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdmbgTmIQNP8MNzDhu8GLxf6dlPVW/TIn5PIv+Isygv/tvqm3/sYG1M/WoE/ijh6PItTO9h1Fx1g0HtTwmYxrFYpmJX/ysgpa7he2xct5VHFpWpk6Gcz17rsmJHJoOz3drMQbPqQi0qJTVqcpLeIb6bpm1ycRfD3z7yJcMex1PgqzLIXD7dO1LoGvXJi0yfJihrRXdKCRlkQ3PLaUW/5v3CtGekCZ2zPpUi/R3Ie1A0BchpqouxndX0qUHXfsSHHDWpuEHJNkd+9YIUg56rS/3u0slsGLaJQJY8FyQjD/GlI3qvKGqhKk6v/XhV+DebqsfXHfnNIhYpIaHMTJMNmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwfCQzb4WSg0TaHN7R0ZbsnaIqUjfcF3relX778Dqnc=;
 b=mcTQxeMVe4Vx7Clt+4Y3AII2MdFrspdAzzqPUOe+TpZRP+VksNRD+e5JxxXK8B6eJajCliQ0nFMkex09eSBBObCb3tN1kKSeER3D4Ot/8vYfUaEYxR7vWOikNoFTUpYnKXKC+VjVF1Ru5bnwQSrMAIl/S6hYWIJomi7hmPW6GJbaHqtWqvSG8s2DywvBvAIlJux/QrK7sJlmtdDtJz3z3HsxeHw+ktyY4FsUIobtCnlLzt74y6oLtFqqtttxv7a6wiFX04JjOX/sf1Ml7AdQ6OI00n3Vj0kOsyyF0eOInDQkpDk4NE5AXYfxgp5HgT8PuQYpVdDv4nAqeJqjmSNYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwfCQzb4WSg0TaHN7R0ZbsnaIqUjfcF3relX778Dqnc=;
 b=WHeVwDWAz5T4SqxRGsYyjbm5O0wNKRHJuWU2P9Oz5xOKSGO+5yVSVynOt5wBGR7xKVDPJBj7kr5yL7xIyR/wItCV8QOuX6iidXwgXGcoZQKwy/0oWSSsxAkqLobfqewRAWC7hM7d8IoidqcBeRyZoGoy66rM+f284Bw9HJvfOUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB9142.eurprd04.prod.outlook.com (2603:10a6:20b:449::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:45:28 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:45:26 +0000
Message-ID: <5c96a972-68d8-4d68-b0f0-29dc1b18dfd9@cherry.de>
Date: Mon, 1 Dec 2025 15:45:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: add gmac reset property to
 rk3368
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251020100757.3669681-1-heiko@sntech.de>
 <20251020100757.3669681-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251020100757.3669681-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 67806c77-2eb7-47c6-94df-08de30e843d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UERDa1ZMOWZ4NXdZdytoNlg2Z2JyS2JSK3pVRVE5ZzRBbk1CZGRNeEJvRGVq?=
 =?utf-8?B?QXV0WUpJbXJ3NHRFVkNUZWRZK2FTVzV5b3BRb1hVcFRsczZpQ2ZVSzRHcVhJ?=
 =?utf-8?B?MjU4Q3QycUNKL0RHTmM1U0JIVWhLNjZoL3FqVlJ0L2xBNUt1aC9PTmJZQjJ1?=
 =?utf-8?B?V1VVRUZqcjlQRzZzMTFEdVFRZkR3aEdldVpSV3JXbXJKdFQwTFNyS3F1MStD?=
 =?utf-8?B?cTBiQlAwYTZhMjlnRTZPOEM5aVBtbVdIMXZqYjd1YTB4Z2FYQUh3cHlLUGdT?=
 =?utf-8?B?RW9zZ0hHODZxc2pYRWlpdmpDN0pYU1dLRXVsb2xBSmJYZEV5VzRiL0hLR3Jq?=
 =?utf-8?B?OEJUZUdxR2puWHlYWkZEZEdRdFY5a2xtSmxkV2RwaUVIUExRR0FZWGdlQ01S?=
 =?utf-8?B?Q0xLOUJhZG5wRTdSZnplSVFPQ0tORmwrOW02V2wxWC81R0Y2Qm9yYk5mQ2to?=
 =?utf-8?B?YUt5MmtnMk1DeVE1M0hEQnhGVGY5QzhUN2JOR3Y2Qm1EcndOUlhZZVl6TkhH?=
 =?utf-8?B?VWhROGNMbG5YMVI4RWs2STU0Wk80QTFPL0hNYmsrZWVmTTZFKzBKb3VMSiti?=
 =?utf-8?B?cGVLdTNxd0VRT2NESUNreWJOK2p2K1UzdDNVSVhlMW1yckRjalpWK3AzL0h3?=
 =?utf-8?B?UXNhYktoUFdLN2Z2L1p3NXcreG5mWSsxQnJkdnBkNGF3dkd2SVMyUFFBVlRJ?=
 =?utf-8?B?TzdyRVZDNHJWSWhxd1g4Sm9ZYnVBOUUyR0Y1K0FzMWpZR09rdHZwUVFwczRB?=
 =?utf-8?B?Zm9QZk1leFYzdTJRR2t3Tk5nRVdSazVFcTVqNVFkNDcvQ0svam8yTUdUMzdE?=
 =?utf-8?B?dzcwaVJaVGR2RFZjbE9jMi9EbVhiVDh2bTY5NlZzenVFaG1JL0NyNWZKemxr?=
 =?utf-8?B?VkNsY3dWZmxwcW94R3VvS3QyT054dnFHT3ZLL2Rsc2JkZFJDN0U2RllFTWhu?=
 =?utf-8?B?NGk1QTFWYklYRW41a1dkL1gxVnFrOVd6Y0V5M1pjSFQxalRBMFcxaUhCbi9a?=
 =?utf-8?B?ZFU5eUNvK1FFVURhcThzQVE3QzRkL1FGREhkMnRTWUJPUEJiU3hyc2swUDdD?=
 =?utf-8?B?TUNaZ0lUdnE0T2gxZEdKY0V2K3B4eEx1ZWtZUDhlMTdFTTJockErRk1sTjNx?=
 =?utf-8?B?ZEk0S1l0OXZDcmpvbFpyRlB1MjFhMW9BUU1yZVpZMlN5RitIVGNWOTloTGdI?=
 =?utf-8?B?UUdKNnJ0WGRBVERsVlF1WFBQajFwVmsxTFpDNmw5YmlVRVd0WE95eXlCTnRP?=
 =?utf-8?B?VjRENGJCeDZ2WG5odGVPVnY3NXViQW9QUGp5dmxBeTNHQTg4eVV1cm11dENM?=
 =?utf-8?B?MmMzSGJqZUlHQ1AxZm1HaWxSS0ZDVG04ZlcwODk3dWxGU0o0WjVMRmNUZ1A5?=
 =?utf-8?B?bTNaSXdNWDBIWCs3bHJVWG1aOTBFeVk0ajk1NkdMM3JDYU5YeTF2WVJOU0lV?=
 =?utf-8?B?VUcrTHk0aGRBMk9ydGZ6Q2FBMFh0ZGFkcUR4emtKWHgycG1SclFNQkRBRjV4?=
 =?utf-8?B?T0JUQXRxa0Y0YW1vSWgzWFZWeWdNOEVQekhSdmpHWUxKV2xWYithcmFGeGox?=
 =?utf-8?B?TGY4eFhnVElsaE9IR0RBK25YdmJuTVhUSS9oMFZxS2cvd05iNkZNVmlBd1A1?=
 =?utf-8?B?Q2Z3YzdMZEFKeWNxMXpBeHk0VnNkRmJTem8za3JleEpMVmZnRW90eGlxR3R3?=
 =?utf-8?B?M2cyN2Y2b2tHVU12aTB1b1JtZFNaQmlHYlBKdDVBSitVTm9jOWhmMS9adkN3?=
 =?utf-8?B?eVZxZkJ4M2xEL1VKdnZ3R01kc1RoN1daM0pISFp6TW9aRjY2R3lrYXJCYm1l?=
 =?utf-8?B?ajA3Z01vTEZ1T1JsNXNWbEQxSk9oZnFJTkM5a2c3Yks4bWtJL3cwRWY0R2lJ?=
 =?utf-8?B?NEVuNHdpK0JxVGdXNzJPM0dodUVKVkdyc3pMVTJiTzZTS2dDZ0FQTlVEV3ZN?=
 =?utf-8?Q?LJuETOP89iPjwyUGSRwClpgVOKpyW4Fq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BmalEveGgvcDlQYzlGYmFTUFAxR01GY2FKTkE0QThMaGhvY0tTS0hDcDBj?=
 =?utf-8?B?aWRBdjc5ckgrVTBwZTZkUjVDdUhjMHdRVG5PQzFlb3hYaUQ3K1lXbEZTb2VB?=
 =?utf-8?B?ZU5aNGhoYkNKaVJTcmFBRjBuSEE3UUhVb0NTUnBKT291bCtOMmFKYmgzU1c5?=
 =?utf-8?B?ZFgyNGpncUJ2VXBmYnBHcUsySTFaQ0dST2h5OXZCUG9oZWkvNnU4S0NYOG9H?=
 =?utf-8?B?Vys4ejJKRkhkWlYyQ2JxcWhCRkJJRjdua0tpNGh2M2F0VVgrYWNhY3J5L3g0?=
 =?utf-8?B?ZVYrYWRvSmRXUlZkWWNPVll3bnJZQ0RnMXlEb3FmRktTS2VXYitaSW5yU3Jr?=
 =?utf-8?B?MFRaZDBGNURyYnRXWXpGTjVHajZ4Wk81ZE9sVFF6OXJ0dlVuR1NBdGZuY0ZH?=
 =?utf-8?B?WU85NDJXbGV5eG5JL3Q0Wlg2bmJYUDBpTXUzUTJDSjl2b3pURVB6ZXdCODAz?=
 =?utf-8?B?TUVleWMzZEtCdThwNjczMkh3S0N3U1JXcXlvTWtqQjd0QjhPTHNudklvaEx6?=
 =?utf-8?B?YkNnVzEwL0luZFdZTVRwcVhyRUNoM21PYWozVmlXb0l3WkkyN01RaG83ancr?=
 =?utf-8?B?dVc2QmFEM3p0cUhaSTR3OVRSWEpMcXp4bTl6ZUZ6MHAyQnBlRU5DNUNZMkt0?=
 =?utf-8?B?aFJ6NFRXVVpTZE5uSDhBUzFnc1lCUUNIb2ZkdGw3c2xiWjByN0s4cjRrWjRk?=
 =?utf-8?B?bXRraTJ6ZXE5NFc4b2l4U1hCeWVILzlWcUlDRSs3QVlPMG9wWVJvVmZNWkVl?=
 =?utf-8?B?RnF6cmlwaXBrdVY5M1JJOE1oc3AxQXFJY0JvMFN0RUVrbEtad2VUdW5oN0hM?=
 =?utf-8?B?VEJEdlFYbU40MzYxMVBIYjhBUlRkVlU1Wk1HRDRtdytNVE5ENndLdW12RVEv?=
 =?utf-8?B?WE1hN1IyNlRvaE9sODdKL0VlSHNWa1NlaFhReGFaempvYTVlTEFodGlTMS9u?=
 =?utf-8?B?QkF4Y0FtcE9QZUhucXB2dEQ3bFVPSHRHL0J4QTZ1Si94eC9yNjRsRm5rSkQ5?=
 =?utf-8?B?b1ZKdEFMY2QzcFpTNUd0V0ZFNk1DNTc5cTVsRnhoeng4aEQ0QWpzeGdzUyts?=
 =?utf-8?B?eVNpUEpnME9GYTJpNVYrYm9HcUFDWVZaS09yRldESVZDMWJjMUgra1BrSVhr?=
 =?utf-8?B?V21SSnFiSnNTaXRBODNlUWVFT01ua2cwa2NCK0hQUURvSURuNjdTZ0taaFY4?=
 =?utf-8?B?ek1DbmxSSEl6TXVnaUlKMnN2b3ovdXBjR2JxNGFQUzJiWTBvQmJ6eC9oSDJs?=
 =?utf-8?B?aEhvc3BveVI3SFhvSDFhWTZzZmN5MUV5SkRyeExqbU1Fakp3eTR1bVkxeHdl?=
 =?utf-8?B?WTN5OFNKY1dEQXdmNlJiYWZUVkRQSW9qRDdjMVF6cWxISnAwMFE2WG1DZW03?=
 =?utf-8?B?MDIzVDJQclFraGppNS9JV0pvZGNIVFdiZDNYZ0FXOEpYL1lPNmJwYUlNTXhS?=
 =?utf-8?B?K3RtdXFlV2hRK1J2akhrQkF0anlPT3kxbmhDTWVodXFBNjhiOGFwWUUxSUpS?=
 =?utf-8?B?UWxJZjlqVkNwWGRPWHZmaWJNUGZlZjdqT0RHOXEwOWM2ZXowZS83WXlQVEpz?=
 =?utf-8?B?dHYwNWFzdGhmMzlHNEVFOUdkYkwwMlU0TjluQ0FvRkxMak1GdjJ4VTl5bVp6?=
 =?utf-8?B?LzBCSDBBUnVUWkp3OEdlSTRFb2ZWUDljdVJES3hrMnpSYk8rL09nR2UrbGRB?=
 =?utf-8?B?dEpwbnBVcmZqUlhOeDYwbzRpYXdULzZ5MlNEanpCL24zT0FXcVRTa21mdTZq?=
 =?utf-8?B?VDZXdnpFSEpHbkYxaEtsNkJxcHAvMlUxa21lK0ZNU0tQZExpdGE3TWtTeEVH?=
 =?utf-8?B?Vnh0NEs2WGMzQ0Z1MEZLYmR4N0pYMEM2M3pDUWUzazdmNjFXdm5JaFFDRVkw?=
 =?utf-8?B?L28vNnNQOXc5OFRPaFlJU3YzRHJ0dXVmWU9iaWFlOExobWkzNTkwMG9QQ0xx?=
 =?utf-8?B?cnpLY2lSOUpocHBTM2pZMFRsdktHbnE3RWhvUWZ2M1p6QUlwRFNXOEVSR3di?=
 =?utf-8?B?WEM2a1k1djltLzNEeHAvUytGNVpPUEJuRGYvL1dJa3RpN0RXdnA2R0tNYUkx?=
 =?utf-8?B?SERDSUgzdG5mT3BZQVdtYnhVOHhXMFc3L0loRzd5MEhveHhWd1RYdWR6QjdD?=
 =?utf-8?B?ZjdKeDhGMnpuZTgzNUdSaHoxZUxZazZtRkdPbFdJMzdBWkVDSTJYQkNOSmgz?=
 =?utf-8?Q?LjIDZv/8f3yn0TUkQc/mmEA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67806c77-2eb7-47c6-94df-08de30e843d9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:45:26.3961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViUBtbOaLoEowECATai2AOPGGFO9FZObQwruC/HMqdGcCIzTvcE8wCt0EKclNFpTBYAxekuU715BPUc3pPR+hsb9NUeZ5HAB4mEgVoxhhQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_064537_606796_D5E728A4 
X-CRM114-Status: UNSURE (   6.30  )
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

Hi Heiko,

On 10/20/25 12:07 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Add the reset of the gmac controller block.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

