Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB4FF30923
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEHQNE8Ci2mp+B23hqoWRuQZ3DkRoymSXbsuu70+sTw=; b=HnKxX1tFxqNJ+VKTbdvmSa5++m
	Qs8sQN6e8taPUtFTHsj+RM1hEKDv04Hf2hEKEmMB6iD2dxPIyi0jrDAAYx5/Ppv6lshujjMVrhxWH
	ebWp2YntrqoKfnpXL295YZjfkRrYuzGrWimegv2c18f4UAHu8m/SkBwavhTkq/ouWDAojO8bIRBgk
	fpzEiDGT90sCq5eFdM3RTXTQBjHw6285WYX+Lfs2I2dMvwmvycqD8hL/DXRUqBGUMHsJZT2MsLs7W
	Y3oBW0cWshy3z8IEiWdQUCKTBcLT3xoTtd0cLFXRiGb3/rf+mG0o7jbxKpnPc8vzNoABiSjoYZfZn
	ZYJ+T8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy51C-00000001NwX-1fGw;
	Thu, 05 Mar 2026 09:29:20 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy519-00000001Nv3-220m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh2c16dDRYEOAwWsbF4CP9i1PtY9m0MYB2QzP7L1n/5CLPmMZ1ygzn1DTUdo3MkvXrZ2RLw1MbL0PIappf0UJV7F9J9TMD7GHbHYDvUx389hCs3iBFZPbAq3wfpHs5eBozXQAGcgmOqiyQrTjv+A0GoZF0K2RvvHzKOOs0moMoeGxN360u/qVqRQ8KbmSqd5az4Kh1N6E5jEV7jS+TEI0RtWFqUheM30y0pC6+K+3OEFJ3hVxCrUdnCTes7bss681954iS9eHwoRpmzspxlW9Zq6wx7671J68cf8sxm/eJ8yxfZO7nFcg1kv7uxHU7Sm46cH053OzZiOTrz1VdwikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEHQNE8Ci2mp+B23hqoWRuQZ3DkRoymSXbsuu70+sTw=;
 b=NAdbrZyTUYRwUfPeHg1qHl6EARblpB3wiQAoRI/EqbTgwmT0QHHEZv3+Vu0q2LqvK1hCixt8wjbSbgg5xbpF+J38ANIeG061aURiwEfzAL5RpUgU7tHa0+0//CWDXHh53mCVEsH39OqofvqJ3dKlKOLcnJ8gSL4ZFMWHoAR/fe19o6l6zySiB3aArJaMuy4KjgsBSwr1xRlHHlC560EPbmlApnfWuQmGw2SgSaauGoZlx13hYV/MdQ12Xz59LlxO/DehJeML5q1rrP9WFRlvf+5GZu8PbfF2SLlagGGMF542VnnirVEz03wCLrrWEzVn9XUIOwLALj6JGMHcNlpKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEHQNE8Ci2mp+B23hqoWRuQZ3DkRoymSXbsuu70+sTw=;
 b=TJYK9tHtl+BnjGnkc4cXjK13VYh5TqTXGJV4NgkDrtZ/3UJSueOa3s3pKRlMfscIi551IsPYHNZIK2+xQeokzCp9fDqrKbrtx8xSDGk0OkoMQ3ILiBKa6nQhuX6Dw0avYVeTMmJ4aM9t2Yesub1hIFdMhu8PppUQEXkZmQY8Brf8uc/88ccK9wiguGE0CozuQ676szKc34dEDJJJwBVunMvOCyyeXHie8W/wvsqjf33SUPstDHwM6UJzFlN9FuJdswoozsguDBH+G3wEW1KFPmyCHVrL0yDpt+ju5fjy9U18wt2dddhTulteTdnZwTbgW/CTIEhoH+4d5rqrNkbdCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 09:29:09 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 09:29:09 +0000
Message-ID: <9dea56b2-dcf6-4c5a-982f-c04ebd086d90@oss.nxp.com>
Date: Thu, 5 Mar 2026 17:28:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: Fix kernel panic due to __initconst
 misuse
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
 fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260305080354.639-1-ming.qian@oss.nxp.com>
 <476695b1-0627-4b8e-9adf-96595ef74b86@kernel.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <476695b1-0627-4b8e-9adf-96595ef74b86@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU0PR04MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 508b05b9-b49f-4264-7746-08de7a99a73f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: wXFgFe8M3zuena7Jr0bfwbYHK2V8cTWPYZNuTVpulAqpuETHkFui98SlJgj4phFpnAC192eBWNVKH7L/y+IH/5F8zhdAZK3lW68nxZfbBb+/G71VuTyx8hkkPI0TJYnTcBSi79gSMO0fPXiqF1uL/LlgRVW+I8uD9h8JVn1S9Eos1fkovnpEByjvCFrJChLo8l2ZM+/cXxc8AkhwC3Col1mXSXdU8PDqAytqFL+3fC+l0nJ5FjSC5zxAoHZ+CWNrs2dRz/m5p6+wCOHVAxrvEc/+iJwuP2YwHeh1q/YQRhvp2WDaTB+sWHU/wvLbMxLLsI7EyqxrYdGsK8EkQgj8hOMGVc5/mGQlVbMZO7dw5/CitLgCMXAYYi8wTBXQ02QKza9u1p1+0IPxDPySp1LPYAvm7jhdin7AI/6qi771eKXHaIekzpT/3VTvFxFUuNfZy70o9HrDeXD//79Mp7txNMmMBQgwV4C+Hl/wiKrxkJQ1X41Mzs4Uil5w26tisHU6721jG0Lhj/SqxK22mQZ8GRgFqq+LW7TZkqbvCIMErt5nKvC393kUfhMrOlxfTNAGCpKaO5FIWC9Ntg4Bfslwpb8X1TGDz57AJa2w6wR1tBPtKqojwprWMAg5PQp7HD1GQORx5t9R2JgbLjIlUoQkxVJnAwdH6Dq3u+fr4RG7Bc2pK2q2UL+JPsV4znUY76n22i1McRXvdNJph9dm1h14W+dlfN/ua5UI5Efk+0tiiPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEZzeW5FOXVZcHZSZGZKbjBxcGZOd012RE1oOXdiVVNxdEtPZSt4U2JPbEE5?=
 =?utf-8?B?MWUvNXdNYWlHMDNFZXBDemIzb3FvdEFKV0lJN0lmZXhtVVBGTGZNT2FtWXVB?=
 =?utf-8?B?SDR6RTVSSjlkdFY1em5pNUg5VmpDa2pFNUhGRy82Q0s0azNDWU4vQzZta3Qv?=
 =?utf-8?B?WUp5V0s4SDJKcjFVUVlYcWMrUTNJNVNxbkZkWTJzOXlaQzByYkdGMnBuRktr?=
 =?utf-8?B?Yll1Q09LVzVFeGdZWlZ4MXQ5R2V5WDdDZld6YXpHRTEwZmJYb3JkeUJYS1Q1?=
 =?utf-8?B?TWIrOGNqeHpFa0xkUnNJOURTREVHRkU2dWJyT1FmcWlvNDAwRXExVlAxbXQ4?=
 =?utf-8?B?TmU0TWUrT0tkLzVFQTdFWFZBTU5lZ2lEU2ZUc243NkdNeDhBOHQ0dWVUL2ds?=
 =?utf-8?B?bjhRb3NOQ0xiTW0xZXFtNGU0K0xyM1d3TzNpczlMdFFmSVVlREc2NmtZaHlH?=
 =?utf-8?B?dzloV2pjSDBoVUdHQzRNeER1dlpSZEd0ZVpqNmVxNHZiaURQMWkyTXBaMjkw?=
 =?utf-8?B?VURCM3VlTHVPWXNMakJ1OWJLY0lGZVNqSUUvYnJMUVRKTC9CRElXdHUyUXFx?=
 =?utf-8?B?eVVMbmZBbkVJamRxampOdkx2MGZZLzFSNHg2VDJwN25jWWJqaEEyYXNNOUI4?=
 =?utf-8?B?VHNHeGxob3NDNWNNYTE4S1FVVDFaM3pvWjVSNEZldTVHMVkwY1cwcjE0b3pY?=
 =?utf-8?B?QTV1ZjNjdlc4MEkvMmR6S3UwT2g4MkhBaVRUNkt5S25PcVdUUjlRZEcyNmtB?=
 =?utf-8?B?Z2ExTFh3TU93U29adC9UMlFPSTdQdkhHakllUW1sb2kyRS9Sd04yVjVDWHA1?=
 =?utf-8?B?d3dsaHlaVFZGYWFta2IvOTZKd09hcXhBR1ZCeVFhMXprUDVBNDlBekVicm9K?=
 =?utf-8?B?THFQZU9OUHlJdHEwdUJCMWlsZ1Z3ak45b1l4Tnp2c1RZVUtJMEoyVUQ3WWVn?=
 =?utf-8?B?STcvbnNVOXFRK0plMGhYMXZVVFJkVHUvMFdjRlFQQU9pbC9OR2taenpDMGpO?=
 =?utf-8?B?Y1dlUlhNYWxsWUIrU3Y3TmhlRVFzcm1zaFhyL0RVS3dOUFVaMW43SEVtRVdp?=
 =?utf-8?B?SjQ2bU1NZitPbnA0ZnJDcExwbEV6OE1HVmxxY0pBOVF1Zm1sbHdQQWNNU1Jy?=
 =?utf-8?B?TEdNcVZ1MVJRQmY3SUE4SGM1MzJEOG11S1c1SWdFS1R5M0ZwSXhZVi9DTjh6?=
 =?utf-8?B?MGJEUk5oVkJuRE51SXhGdmNlWWxSQlcvaVBJbjJlbVBzRnNVSzMzaG9mckJX?=
 =?utf-8?B?aGdENVJaRzNwQlcrYmtMM0RxVXNsc1BzYzFWbldYdmY4RHpPalVNYldwSWc4?=
 =?utf-8?B?SGFlVkVHY0VoSE1iSTd5dm92bVE3Y0ZhajVJb1pDV3ZXZzF0M1JmZ3FEYVJp?=
 =?utf-8?B?UlNNWW9rNkN5SUFXTzJ4V0VoeXVwTXZjaXFKR202RUdMNzNlWkFESWgrQUE0?=
 =?utf-8?B?UE40SWxOS2xyRzY0M1FLTnR4WTQ4cE8xcmh4cjJCTElyOGtMSGdzT3BnNTlF?=
 =?utf-8?B?VjNtNStZTUg2YUliOEJIWk9sbmhMUVFhekVucU8xSU9xMmIxRXNyc29Ja1NV?=
 =?utf-8?B?L0p3bzB5NkJDeXF2eVY2TVNQdlY4eTFEWkdaY3RjUy9lejFGdlloSHRuQzlI?=
 =?utf-8?B?UXFSQ3R2R3N2NHJLbkhjS0hPRXdZVkdxTUVWRFVyY2N0NCtyQUdxRjVvMmYr?=
 =?utf-8?B?M2RQY0MzYitpcHYwcFF4STBVOHpJME1HcUtiL1dZOElSbG9jaGZxNjBkT0pw?=
 =?utf-8?B?YmdGcWJUVjI0clJQb3M0aHJHTUxOVW41UlZ6dWJicHdNMGpUUHZ4eTN2aEhk?=
 =?utf-8?B?Nkp1eUp1V0QzZmZzV3ZqQlR4NWVHTUU1S3U3cVdLRk1kdkZxVC9SV3poSWpl?=
 =?utf-8?B?WTlLK24yMnJOK0NUMUFmSndVNVhJam5LRHdZOWJCZ3d5MUNoYzdsSTBEb1NT?=
 =?utf-8?B?STBHQ2dRem5wZm02QUd3UFVHczNNeVFLcStvNCtJRjc1UDRtZUZwUU9mTi9B?=
 =?utf-8?B?RXhQaEN6NkJwcXMwZXZWT25kRG5OZ1U3QWM4b0RYcTB2WE82K2wyRkVVQm92?=
 =?utf-8?B?aXphRGp2OUJHNCt1UEVQV1ZQTDk0UFVsNmZhalRsSy8zOWhoRnNxa3FQdE01?=
 =?utf-8?B?M2J4dUVnNFhsdWZhc2NCZDZmQ3hSQXFpZHZ4Z1NJeERLQ3BiRTlib2xUYytG?=
 =?utf-8?B?YkNhSkFSa1lwb0kvcFU3bThnMnVHMjFEWitTTVRDeTc5UGRmNks0MnA3T1Nl?=
 =?utf-8?B?cXQ5RHI1WDFESjJMU3phR3hWMkp3czVsOGN1bGx4dmFNTUhBK0RsZ2pQZ0h3?=
 =?utf-8?B?c09VblJaS3oxUGx4TlRuZ3FFRTI4cml1Ri9pSHNaTXdLOXFNZGJKQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508b05b9-b49f-4264-7746-08de7a99a73f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:29:09.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MC8nL762cXkVsBzFA9p6+zEeSPDVQrGKmPhOG9MZav2wzdSrLsAqivsZpxZLEM5gKo9h/vgzXjdvqnL0RNPJMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_012915_529682_3764E3A5 
X-CRM114-Status: GOOD (  19.56  )
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

On 3/5/2026 5:19 PM, Krzysztof Kozlowski wrote:
> On 05/03/2026 09:03, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Fix a kernel panic when probing the driver as a module:
>>
>>    Unable to handle kernel paging request at virtual address
>>    ffffd9c18eb05000
>>    of_find_matching_node_and_match+0x5c/0x1a0
>>    hantro_probe+0x2f4/0x7d0 [hantro_vpu]
>>
>> The imx8mq_vpu_shared_resources array is referenced by variant
>> structures through their shared_devices field. When built as a
>> module, __initconst causes this data to be freed after module
>> init, but it's later accessed during probe, causing a page fault.
>>
>> Use __initconst_or_module to keep the data available when built
>> as a module while still allowing it to be freed when built-in.
>>
>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
>> index 6f8e43b7f157..fa429e6e8281 100644
>> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
>> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
>> @@ -343,7 +343,7 @@ const struct hantro_variant imx8mq_vpu_variant = {
>>   	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>>   };
>>   
>> -static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
>> +static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst_or_module = {
>>   	{ .compatible = "nxp,imx8mq-vpu-g1", },
> 
> 
> I have some doubts this was tested with section mismatch analysis. It is
> still referenced by non initconst data, but it should not. You have a
> dangling pointer.
> 
> And build test would probably point it out.

Thanks, that makes sense.

I'll remove the annotation and let it live in the normal .rodata
section.

An updated patch will follow.

Regards,
Ming
> 
> Best regards,
> Krzysztof
> 

