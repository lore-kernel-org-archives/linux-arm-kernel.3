Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D4F30952
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zwcul41SyrQRKSVpCOadJja9F3ABYCsN7Er9jPihT/0=; b=Z5assuZJE9/jhJ072AJ2oEGcGL
	9jveTpsaHBt2TmiTIV5yRY3/zYRJ/OW+D1r0I8Ca6aYOzmiYmmktO9WOPKIgzBWyEDvq3fF744pyb
	aVg3W/+lhqt05QgLFi9ERnR8s8tgriAlaziCypdZRQCSPlpJE//IRdQ40SHHHWOPa/jxbeQJk1z8G
	+n+0wFX4CoeSBwY4hW+dqPivGllTQXtyt/yBcgTXWa3keC9Av/aJCx/bV6RoWhJG+rRo7y62R0Ata
	xHgq1z7nwpa/Yi3T+MvJTT/7uPNqmgjdd4zopIMnYr0KUk0p3yjH+8YAeQa7oU6U5REX8UdzJTMKM
	OEUl9DrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7X0-00000001jcJ-1ZCi;
	Thu, 05 Mar 2026 12:10:18 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7Wx-00000001jbw-4BAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:10:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv1z+vHbnHUshDnYOcyOOYjt++WcFqNKcLmptmBATCuYxG8taFt6nVO78frgWC1AQryW1be+H+c9uOPpZhjZFFtIaTHz1W4hk8b0HLGoNNDOyFdajKH4MFyPRnhyit099p8b6G/P45rA8Po9FY9TEDtPU/d3fS49TRUWloF75lnXaM8IKTXsHlzg5mV8PCQrQ6zyCkhfFLYvuC4AmqiGubt6WCjsVJ2eIKWznQnskLJ82hbmZj0rGOdw7dmwl1GmNzZtOkZLUlOkosQfsbt8fJTX1W6ZkYaax9njDc3n8N+csckHLVFhN98RY1mcdUMMjchuuoImmynG1Fy/HgdK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zwcul41SyrQRKSVpCOadJja9F3ABYCsN7Er9jPihT/0=;
 b=LTkr0qCiM5Bq9MQW2uykf4hVVTCbTCHJsA27GUnNZ1s8nR8Mw2beWvwbLKAXr/ca8QflM8q25QN1umjrZ2xaYIclK/jkmJFl9I+wy3Y7OKzbhVhyHQ54e8C51Z1nfjyHcDQ0kAL7MYyfl6xlyxSmkxS8+gdeoYlEvWIi+w2wghA2MmHWWuU0uuRY1qqFrRmdVc//7p3b/CCRyPzD9OA6Ag/qEix/A485SQ2JOwnTfqYc58JLNq3J9pl+pA7C/WrCtlYXBREUIn0CUYdSArDjsEZqtcIEg8GjLvykeKL9XEeRFh4BZMwcSdaIezVW+aTYtvFA3wf2mns8YGO02tRqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zwcul41SyrQRKSVpCOadJja9F3ABYCsN7Er9jPihT/0=;
 b=UapCqPm3UVDYzHrPkHNzpAQmfMsViUGTtD83BgbvNPdkltIEruBXuDpkvRTXykLnR34YnUkqCx7CdapIs65cFnxB6aM273kxOu5PCJ/szQaCI+23COciLBLHst5+WMT4l30QLs492MtHnQpr+NSkPGs7GK7j8nCx8I8zxgcgw17YbMlznyCiDVqettVOjFJKM18CO7cYlM+yM1OXXRTDg3SaCxLzxSmUzI9ri2zDKiJLOKvagzRLTJ1SH0A3pNWxXeb9to/5r6YCQwU/h+GMk+LHEpl5vNt93EHiAbvacYON7CgUW7PHURMJ5SsljI8X4SXt5D2DzBeKanm0s2HaHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8141.eurprd04.prod.outlook.com (2603:10a6:102:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 12:10:10 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 12:10:09 +0000
Message-ID: <21f7d265-97d6-4017-ba5a-58186ddf268c@oss.nxp.com>
Date: Thu, 5 Mar 2026 14:10:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB
 board
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, s32@nxp.com,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
References: <20260225133858.8026-1-ciprianmarian.costea@oss.nxp.com>
 <20260225133858.8026-4-ciprianmarian.costea@oss.nxp.com>
 <aZ8TXTzYOVaezpCz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <aZ8TXTzYOVaezpCz@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 12708e64-2a58-4e5e-7586-08de7ab02530
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: emolalWIfnUSaO3ZCkWzyWL2Hir71NADAttmDSR+a4ooyt2lNyCRbmEhPT8IKWONrWNwxbHOHI8EPB7VjMd4eIaTDWA4YAt5TKOIPuNLtoLk2tlZpI+82D/ELOABNvKL2tgT5LA2AmXKONOiJQvcNeUzCoZ527M72Yv2eGzcezS6TXVCc8DOAB/pl2INWsEFejn7jdrQQr46QfY8x/k4UgzOd0j9MVdL/Dp1PpmxmtSDuD5vOvdPFwi9xJqNr15yQdDd1sTU2uibYiwE9HPYZ7A/F3ecw5SzfyZNu4FTmI6oX9/siTvf4V/XdZtutI/2Ti38u2KAGz26+R1vrZxIgAPtHINkx9qc11WqDor/HIP044GWi4vPIKAIFUCU6bW9YHWuAg15dtUmXQQKAueoW199ngSwnv14gw3otwsvwZKyiT49rQF7ATWuv7bZa32z6aMHSMLWhE+Vx+2E3ZTi3ba1JdWY9kklvtD2+M609P6HArFDpwQumydQPkCLO3SUCIJ4JQgjsck/4rjxnaUcixjiqNHHSkH+K3cfWRjn2Wqzjq6Iqz1CAC6cWwpiPpXwuIxKdZtTRSTPMFn5hH8UWUfYJGHrn4kHsiOTKICnq3xMSY75k+qxTPuA4sfyFm3RlK1AvWO9rJZ/ofTyqBoIqulwsim6v/YwHSAbdtXLTVhR2x1bwfshy7kpOT1/u509uP0wZejWnsOkEgddMvKNzQszE0ExDw7DFHqR1psINKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBnVmw1cDBIZkdIU2Vrc2Y1QjRQSXdTa3Nsb2ZxLzVjVmMrR0V5ZFRuVGto?=
 =?utf-8?B?c2Y0dGxIczZrWEYyRytEZDcvLzFnem52WWp4OHBUbzZtRTVwRkVJZzI5Z1g5?=
 =?utf-8?B?cXNEUWZHL2J6QTR3SkpIWno1T2ZEZGZPVitBK1plem14NldRV0UyTEJXbWU3?=
 =?utf-8?B?MnBlc2xvaVc3VjBHLzVFazBqMWc5Q3ZvWlBMaGNTbm5FWUI4cUVUV2RXemgz?=
 =?utf-8?B?dDZnWHBhbzZIekRlYWRyTWEzNUJSaTdOV1dLSnZZZVNnbXBTVVNCQXlBUjh2?=
 =?utf-8?B?R3dJbWE0WXBtajNzNWRSeUZjQlpYcy9TcjczV3pGTjFGSnJyVVdSVEVnT3Mw?=
 =?utf-8?B?MUk3T2hkMmIreGhlTGNKYzU5V2Z0TzFSRXpXSXR4L3hhT2hiZUN5SzZaMFpY?=
 =?utf-8?B?bk5qdjRFQkt1YzZQR3Z1NTBaTU9XNFlKempNR2ozZENEUFp6eWdSL3JCYlRV?=
 =?utf-8?B?SXN6cFBUUkdqeG1UL0dwUzVnM2FGZEdvRTJvSjNLRjlzTG9KWGFwY2F3OUpq?=
 =?utf-8?B?TjZWVzdWc3AySlZzclIrSFljZ3lQNU9jdDRMTXZJeTFVUjhCMTZpR3BXTVFD?=
 =?utf-8?B?OHA5eXA2R2ZBQ3ZNYm1oWWxHQXhxVGpmUkd2TXZ2MEo2MUtTK2QxcE5aUE9Q?=
 =?utf-8?B?WXpuN09ESzZPQU1kUFUraEJVTFNFRVZCRlJPZmk3RGtEcFVqeUJqaWZpQW5O?=
 =?utf-8?B?UFk5QzV2aXM2cGU0bFdleHpqNUtFdWttSmd6eENsNU0wVWd6Z09Ycjc3QVIv?=
 =?utf-8?B?RG05YlkrWXF5RVlEVS9KbGltRnZTSDVFMzFIZkwybHdyZ2ltRjJNOFNlWXY2?=
 =?utf-8?B?eWxSUDJRNytCR0h6WlBiaGlvSXdPTjU5akdtMHR6Rm4rZkxqL1psMFlKenFL?=
 =?utf-8?B?VHMxVFlEOFhEU1l2RnRZbUVjM25obGt6bTZaQnlGNXBOYmUzcXZ6STRxaVZi?=
 =?utf-8?B?ME5sSlI3N0Y2MnZPQmJXVXVpdjJSSEZoVnRob2FpNGhkeFRnNWlKZ3FRSFRE?=
 =?utf-8?B?ZFRuZWwyZE9yUmZ0WGVKbEtOdE1lK0kzN2xNa21nTXVrYWRlS2tKczZTWGdL?=
 =?utf-8?B?NHFOZFhOa2ZQSVB5NXdDekdOeXFraTZTMkgyU1RZRXpsYnRTRnpiMWJGTldX?=
 =?utf-8?B?TlhJTU5rV3FNOTN1d2xYYit4SjBzNlhBdlp2ckJEeVRsNDhxSktET2QyVUl1?=
 =?utf-8?B?VzhMY1plR1o4K2x4UXozVGs5anF3clppcHhCME9hdGVqSlpaTDFVcG9CT09i?=
 =?utf-8?B?L0l5TlpkM2xTRVYwVW9FL281NHdrS0JkeS9PRFcwM3BLTGFqWnpXbE9jN3VE?=
 =?utf-8?B?eWQzZk5YMExnTGVxaVpQVzZQQjdoV1dGWGVsUWEveU5zL1doVG0xL1NEb1N5?=
 =?utf-8?B?ZGV0SHVDQVdDMDFrQVZHMTlmY3dVQ3ZtK25KMWxQdldDZzI2MzdyTUEwSUtn?=
 =?utf-8?B?MWYxenRoNzRkV0NRNTB3amJhK0xiZkpYcnROTVZYMW9xV0hmOTlTaHlPNnBk?=
 =?utf-8?B?MnFRRnAvTUZHK2diMVdxNGZJOGh1WmQ0eFMrZ3R0eHRnSlhOUUNKZFpuV0hT?=
 =?utf-8?B?M256bzZjbG56bEdWRE5FRVVsTVdudHYwQXZoQ29iNVd6MkZDd2tNWHFpL3Fp?=
 =?utf-8?B?Y3ZZb3kvWWZhVmdLdWxaZHEwaGo5RWJGRERjdkN3VjlTc1dmanVZQUl2cG40?=
 =?utf-8?B?OHVnTldtV3VrcGxncHhhTHI5Slhxb2hlYUsxZ01MT1hTMXowbVhWZ2F5VGRh?=
 =?utf-8?B?MVlYL0ViRmc2NzVOTmVROGQwUE55dllRRTdSdFZhajU2cy9FcVAyc3RwZzFl?=
 =?utf-8?B?OU5PWXJiTzhMSU9FczRNcEhxdVh3VG5iRGxGQjRXNzJuRlVmV1BnUlhxTmhK?=
 =?utf-8?B?NEtZWS9TN3JtVkZqeXRSNzlzQ0QrNTNKdWpNYU9SN05hQnU4TDhjckNXYjJj?=
 =?utf-8?B?WXlYT0VrRFdaYUxyQUhkSVhXS3BqOVNLZlZnK2hhMXlIbTBKeXgvdFkrU2lw?=
 =?utf-8?B?TlJHd2tCTGJQRUowK3VjaVZvRXBTcTR4bEVGYmkyS2FqMGFyQjJFbERxMklj?=
 =?utf-8?B?bnlhcjRvSTVjTWI2VXVmMjd5ZFBWMzl0WW9LL1lGVFlaMjZKUVRHOGtIQVVC?=
 =?utf-8?B?cWthcEtaZ1JLQzM5dTNjRnp1b0lNc1B5UUlDUENsV2ZGMDc5dDl2L0RBVkJ0?=
 =?utf-8?B?Q3JrdzE5VnB2Vlgzd1pvSm1PeG1nTGJXZWhMa0YzN2hZSFVOY3JTb1U4VXNy?=
 =?utf-8?B?WlY1ekxmN0lQSy90U1VPbDZCZGVON3R2aStpZ2dTc3RzdkVWUUFkRTZZMFhO?=
 =?utf-8?B?OHZsMnBjb245R2lSMy9mdTM3cWxpbTkxOUxvNWxFVlBFeFRWM1lLck16ZGJB?=
 =?utf-8?Q?cHMJF0//hOepz0II=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12708e64-2a58-4e5e-7586-08de7ab02530
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:10:09.1507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+qVmXGYFLJZcL/6iCXaaJCC71vKGg26On69Wu/XDj8Rj1dkv36Zo/ceIMPI994BXSKt8MDvSzE3l7n800TzLpOwxOsvrRCR/lYPr02kv6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_041016_046022_7FA18851 
X-CRM114-Status: GOOD (  13.25  )
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

On 2/25/2026 5:21 PM, Frank Li wrote:
> On Wed, Feb 25, 2026 at 02:38:54PM +0100, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add device tree binding documentation for the NXP S32N79 automotive SoC
>> and the S32N79 Reference Design Board (S32N79-RDB).
>>
>> The S32N79 is an automotive-grade SoC featuring eight ARM Cortex-A78AE
>> cores organized for high-performance networking and gateway applications
>> in vehicles.
>>
>> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index 5716d701292c..415081423a30 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1827,6 +1827,12 @@ properties:
>>                 - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
>>             - const: fsl,s32v234
>>
>> +      - description: S32N79 based Boards
>> +        items:
>> +          - enum:
>> +              - nxp,s32n79-rdb
>> +          - const: nxp,s32n79
>> +
> 
> can you put after S32G3 based Boards
> 
> Frank

Makes sense. I will move S32N79 entry before S32V234 in V3 patchset.

Best regards,
Ciprian

> 
>>         - description: Traverse LS1088A based Boards
>>           items:
>>             - enum:
>> --
>> 2.43.0
>>


