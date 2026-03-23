Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8D4F4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osVDJRqoyi5jXyjfjaIT7K96h7NU/vkV3CaeIENlx50=; b=KeE6xWLiQtHdvXFm2KCF/XsF5D
	sCJc9GM+ifNyw4vAAgl/flom2HBTa3qTZs3QpNwfjMXZX5SzTGugRhnpb+PX4dzaf2UXO9ki7bGeS
	6wBlG51lKtIz4bCjRqTn6IIwkpK/XKzDoseSbcawrh30c1t6fvg/esl6rUphCDfp9yXq5OZ3EteBW
	9epnuMm0eRSlksMXAmrJBcouK20t/ReWxhHe5wKxOLGKKgo1vB+4XjHHVJmHa6h4yk/Ty5iyWTa+P
	CBsSRBTzwxSFtUm8ZqQi5Y3Th8DTEet4V/3199HUu+PJjWHsHAXJSfWzpc27v183cBFJu+EY2hPgt
	R+Z48xtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h6K-0000000H1Xx-01dR;
	Mon, 23 Mar 2026 15:21:56 +0000
Received: from mail-norwayeastazon11013026.outbound.protection.outlook.com ([40.107.159.26] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h6H-0000000H1XR-2ceu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmO/IaAsHK7U7ltA46FGAzew8xJ0eBr88OHXOo9hvl9PbxoNhRWPqgHueY6AZ1q3fw5AMfZCLCqxWSETWAMiAQV3bVWy4jwLRmpbxX6+EcJNpgbbztbFenTdxjPjxUcJ60AEuBp6wa7pMZQ/Y0m1LeXjgNbV08ziiNGwOpqI7dcARt9Uxaotlpn6VoiCLhSel5PfrOGCX9nY9nDwlceRso81cvA88PApjDXMUN57krBUminTRamFOt3GRPlTcF/naFIe0rJ++tAB9D4kWTg49WrySvl7gb3kRZIP2YBYicosS5PuMFUlr7JT+w107H3RRbfNJ2DwrunEQv8H8msG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osVDJRqoyi5jXyjfjaIT7K96h7NU/vkV3CaeIENlx50=;
 b=aTcqTphzUtcTcKp3S0HtFhBcXHB+r6qgea5krOjQgjugBB24SKMjmtBTH8qFXiMV2FcR6LOgSAbVNMpmtM7c0PUb8rga/w+5+aKFzkrL+ITwf2O2lI7yGYRtird1rcMT45soN5AKZ0ePu18zbSItF7BcGjEf6jS4tok2BXCoCd/2YHwEb3BXxQTKotpCe3ElQqgZg3EP8JKcv+PMZcWFxv4DEkH5w/ubIbX63hBdieXGClXLZoWY28Jf0o2mQiCh0aJCSXCDZdqr7/aKz4ghTXf/n0BjEwmOXGRpmDONTAvdKem7mOt40bkTFrMjTrlSMq4RD5NNoo1s7nexRuJC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osVDJRqoyi5jXyjfjaIT7K96h7NU/vkV3CaeIENlx50=;
 b=EkTqQZj2DCBrqw0WXH7jcfEqQlhkk9jlfomKuaiH7HzF78Iv0QZcJLqMM7ioK0alk3t1QWSmhQQD+B60vXqPkPGK+2QOpt2a4AHrRhyS07ifZLKQ9y+T642Z3YDqdwSYCpzseJa+te/2SDlpxyb7nqD3yb+bKQb59SQwrXXfqjzNDHvlgJEno2s87J3DjOujEyEoIQPPIcZD/gRcSt2nSgT86b4/HG4m3f1i4BJ7IsUHHH0pIE3YkU9EJSgmnL2XEZuNDbGYrICADn3Ryr2M9aR/nhV9WQWV1B8RbV12NA887CH3DWOoxJ2NJ85LoJnri1jXk+K/aN1TZCO4qSr08Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM9PR04MB8554.eurprd04.prod.outlook.com (2603:10a6:20b:435::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 15:21:42 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 15:21:38 +0000
Message-ID: <2e257339-623b-42b9-b173-b9e56980ba36@oss.nxp.com>
Date: Mon, 23 Mar 2026 17:24:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: imx_rproc: Add support for i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-4-3e66596592a8@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-4-3e66596592a8@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM9PR04MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 995a746e-5a8f-4a37-6e71-08de88efe119
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 6YeUPMgJrKk1su70Y0fj7Yuq18upZp/uOL04FlTG3AXqgen27ccrAAnA+2iUl8ElN5OSbMyqDnGKMg7nDfhffD1lwNI7hj/5f/Fd3f3m+MPsefy9jReSXssTsopx9vvm9xpjt/5A540Mb727WN6mIRmTzZo8LMLH70jm/74fMrYRatkiCLu02CRFFOeRb/y2hKVfcVLhWqs4oUorFUgPq/WDFkn0AU3t8suqI2o+y3UHsvUQ23o38umKQlhp8iYCh8i+MQ2LDPB4yod1xVEe5s6+b+Nmol7Vg9Yd9n+wp3Z8pPM+pj/6muM5JeApsXWNSZqgPABwZuSZqjdII5HT8Dk3VXlgiNMCirccz0pOFbFjT2pIfBYBFW/18QC4RK9RUWIbrrwOkMJxCBfYrKfncG5B/JbzxliT/svZZQ7YjjGao0ne6n2dKgbZK1S098UY11njxpRezMqayt6cpybIVGAdo69c0G8G3atR3tFmbInKi3UNvhBVCaXl+Elayarj1xDdoIhDeNh0Dx/fPAJF6xa4ZUGdoZU9HJ5gpgzSfCer/+vvU90m9zdLOEyMomPRd2G0VPLm67WGWMvvo0a+nrxdtbKqbXzGhiRvQA0A6RXX463ZuDd+sPcHBdKQVfovRyOHNhT1zjqX1P2I1LBKjyFc0RbB+tkfY+dMW4UZKWN9UsZBJD5Nuo/JQtIJioFdPlkeG+WfSCgWTqMsWjP1L4KqjgTmGt5GzOqs7bA7cr9feDhtDYVTdI6jM6UCbzJ4Q9HnYX/7JkXYaaG341WZLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThsK2xkZk4zem1mSE4wV2tFNmU5WWM3dG1TMDhpQUNnc0UrZ3MyYzdUdmNo?=
 =?utf-8?B?Rnp6eDRmYVAyOVc3ZFFyRVgwQk1QQjIrRlpwQWE4ZmhWdmhmZTc3OXduTnlY?=
 =?utf-8?B?RnlKa2s5RVhtZTB3Q1dHRFVjd1p5WTM4M0hKMXMraUJNdkxBMU1qSk1TMmRJ?=
 =?utf-8?B?TVlTYTZkR2N6ejQ3T2FQckxyRmhtQVBQLzZ2ZmxsdUUvZXhaSk1OZmhEMXNn?=
 =?utf-8?B?MXZ1bDlRTjB0a1l1bm5WMGZFZnIxNk9DZDVWM2NyR3pzWnd1UUlDYW5Gbk5S?=
 =?utf-8?B?RXhTTjVBOHh5aUtTRHMxUFprTUhDZk1PODR0aXRXaHcyNWtOeGk3aEF4R0VV?=
 =?utf-8?B?czJXbHRSb3Y0UVk3UEFsQ3UyV0piRmtabTNnVUhhVWJ3K01JaE0rbkRnNGtj?=
 =?utf-8?B?cUR1bEIwQll6UDUxSlFQTGMwNlpETFEzWUs4QlJhUVRxTmFEa1NYSUNXaHp4?=
 =?utf-8?B?cVV0U01hMU5DOWxQMFdDQU43bkZFenRsRFNmZHA3RGowWFVtbTc5Y1ZoNjR1?=
 =?utf-8?B?NW1uZFlFVUc5VDV3WFpoMHI2cDZjYVlhbCtSOVJFakI1SWtySEJ5WXFnWjdk?=
 =?utf-8?B?c3daUVgxTmdlQVZadmdIMGVaUE5EQ2JKVU4rNlZyMDBtLy9xdlBlbS9RQ0s4?=
 =?utf-8?B?OVUrVlJrekNuZU51MEVuSE8rcllHS2EzdElVdlJqVjd3R1NnNUlqQjNXQysy?=
 =?utf-8?B?RkRBeG43STNpc2tuTE5peFNNQmFPdzdBYWs2WXhtdGV5RElKSmpwSlRVeGRY?=
 =?utf-8?B?dmxtRDhRNGNVS29HUGIrYjhSVW1oUlZUeU1JTUprWERKdGNMOHZhRUgvZUxm?=
 =?utf-8?B?UHUvMHhFekZzMnhMd2NjU0xOQ3VmeEk0WE8vdmJwQUhjTlNMOU42U0RzR1hV?=
 =?utf-8?B?OXkrZllQWVgrcDJxQjdVbFpvNjhTbGkxUVNWcHRabVZTL2xOdWJkS01rT0VT?=
 =?utf-8?B?cnRNMnNOU1RBMnc5N2ZMemVWeGpFWEd6K3dhcnFOaVNQK2NEbDhMRkU2czB3?=
 =?utf-8?B?cUxLc1MyVmpCVFpUemVyUGppajAxekkvUVNWdFJUTHhLZEo1ckZvN2VaRk9y?=
 =?utf-8?B?MHkvc0d5c1pZcGJhZlgram51Zm1qRDNTWUlESWVWRHk4R3ZZOElHZDk2eW1B?=
 =?utf-8?B?SzdnT1oyblhMSnlOUmNSNWRtNWQ3c2N2YVMxNWV0MFdBV3ltbHlRV1pMbFBm?=
 =?utf-8?B?bk1pWjRJM21pNkpxN0VCelc0M3JCUWE2M3kraFRrVEZFaHo0eFh5VFZFdS9h?=
 =?utf-8?B?dEJGa0VzT2JHMVNmN05JNWp2eTBXS0NYZm50U2hHYUliV3lvanZaaERVSTY5?=
 =?utf-8?B?ODA5c0pUK1BCcHVEOTlWTjMvWW8zeXFBQzNsNGQ5WThpZHNhRVhHTDJTRWEx?=
 =?utf-8?B?NDFJZ3JUdVVCRE1EMXRiNlAxc3VkcjRTWWZqSUo4aExJNENxTTlBZkh0R0xn?=
 =?utf-8?B?eXh5SXdhazFjOGt3elU4UkpiMHRRTkdUK1BldlUrS2VwRDVKYXNhY3VCTW94?=
 =?utf-8?B?RFEvVXJCWHFpRFBWcU40NzFCQ0xubmF6TlVjZWthM24wdTBGY1hCRUlpVnZP?=
 =?utf-8?B?cmhCUW03ZzdXUWh5cEhpWnFZQ0M1TFlGcmZFNXJKR0RZejFEU1ppSTVQWGc4?=
 =?utf-8?B?ZHZPN3owcjc2TkZHckpvVE1TUHZqY2poNHBUMHZNSDYzbG5TcGpXeWF3aWRp?=
 =?utf-8?B?cHlZS0RVeG1CTkFWSTBQeFBDV1FXTFcyb2hNN1IyYUdZZGNxc0xkOFptOTc2?=
 =?utf-8?B?aWxsOGNSTzBKc3RuancwUm9uazE4T0k0OS9VWTZIbUFuWlRFUnNmVDdzcHda?=
 =?utf-8?B?L1NXTzRqZDNTRlBsbmt4Q3hPbWJhSXEzSHdGNG1hUmp6U1RzMzhzZDMrVkJP?=
 =?utf-8?B?Y3ZuTFpicGNLSVVvWEJENEpGV3NWVnprRldBQ3RqdkNqTG1CeEhHYVRjQ2cy?=
 =?utf-8?B?VGtUdFlrQnBHMFhjdXF2UVo0R3l0VXVZSTU3QTBrSEt2WlBvU0ZXSFdLczQ5?=
 =?utf-8?B?dkxtU2Y0aHVEd1RMV1V0aEhCTU9OdTdCL2tQSHFZT1gveWFXTEUzV0VKTlhh?=
 =?utf-8?B?Y0NidVZwN3BZMXlpMEM3TW95Mm5zMW9PWGxMTUdrU2IwSVZUM2l6TWtGSnBw?=
 =?utf-8?B?UkFTSmhtL3ZmKzYzbm02eU9uME1QYzlkMGhRQ2tWK1dTd3BKQk02RXBxSDRJ?=
 =?utf-8?B?aHV6MWUyKytIQ25aSjdsNElzLzFZZDVCeGZTMFVQaWZ0b1VVdkFWNzR2ZVF3?=
 =?utf-8?B?TytJU0MyZkFFYU5qQWkxRDh2aFZYRStmekIyaEZRVWVpV2VxNExYQ1RJR1lH?=
 =?utf-8?B?NmdDajFxNXQ0UFV3NGw0NStJaHFjYUdFNEdOMUs4MDJiTzJUb1B2UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995a746e-5a8f-4a37-6e71-08de88efe119
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:21:38.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41vR9O5oRc4gDmoyMMvYG0L/2CtRVK1g7IQd2Ucldv6Stpnerz/FUb+w7MOahIunllqY2OyTBoymY9HrbleuuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_082153_668295_0151D004 
X-CRM114-Status: GOOD (  17.20  )
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

On 3/12/26 14:36, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add basic remoteproc support for the i.MX94 M-core processors, including
> address translation tables and device configuration data for the CM70,
> CM71, and CM33S cores.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Can you please mention in the commit message what is 'dev addr' and 'sys addr'. This

is a thing that I always spent some time to figure it out. 

Thus adding this information to the commit message will help for future users.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


> ---
>  drivers/remoteproc/imx_rproc.c | 68 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 9b07103857b13018bdf62431cbfeffa3e3c1a15c..8278643eeb390518981e8beae086b73be265f50b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -146,6 +146,47 @@ static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
>  	{ 0x80000000, 0x80000000, 0x50000000, 0 },
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx94_m70[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
> +static const struct imx_rproc_att imx_rproc_att_imx94_m71[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x202C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20300000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
> +static const struct imx_rproc_att imx_rproc_att_imx94_m33s[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x0FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +	/* TCM CODE SECURE */
> +	{ 0x1FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE */
> +	{ 0x20000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +	/* TCM SYS NON-SECURE */
> +	{ 0x30000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* M33S OCRAM */
> +	{ 0x20800000, 0x20800000, 0x180000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> @@ -1466,6 +1507,30 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m70 = {
> +	.att		= imx_rproc_att_imx94_m70,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m70),
> +	.ops		= &imx_rproc_ops_sm_lmm,
> +	.cpuid		= 1,
> +	.lmid		= 2,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m71 = {
> +	.att		= imx_rproc_att_imx94_m71,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m71),
> +	.ops		= &imx_rproc_ops_sm_lmm,
> +	.cpuid		= 7,
> +	.lmid		= 3,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m33s = {
> +	.att		= imx_rproc_att_imx94_m33s,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m33s),
> +	.ops		= &imx_rproc_ops_sm_lmm,
> +	.cpuid		= 8,
> +	.lmid		= 1,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
>  	.att		= imx_rproc_att_imx95_m7,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> @@ -1489,6 +1554,9 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
> +	{ .compatible = "fsl,imx94-cm70", .data = &imx_rproc_cfg_imx94_m70 },
> +	{ .compatible = "fsl,imx94-cm71", .data = &imx_rproc_cfg_imx94_m71 },
> +	{ .compatible = "fsl,imx94-cm33s", .data = &imx_rproc_cfg_imx94_m33s },
>  	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
>  	{},
>  };
>


