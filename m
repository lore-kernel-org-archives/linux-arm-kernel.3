Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDDFF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zeh3WVRIbHFhm2q/LifLQ87HO3To+jiHlEcwWUJbBiM=; b=HNccRChZRnPXsW4EnaZ+7pI4o4
	VE4YweHAtWLybGzjzepl/ZqtZvmH2QXh96AOvZ1k6GGQtWnG8MXftAJPtcD/HrQ4wjQc7mQjGWxKx
	b6h12ElodQ67SLbyM3RaKLuyH9H0HjoYwh1lN+yy6OIZCb8vfAMy+ZicYZ0F7bJeXJhdzl2okjzcB
	/q+pAXZRiWv3PasAyMAmZ5IPsWdjZeTVYEWI8vXWl7hONfIVEHDgD5mm8RDmLYjVe540Y9m5vqceh
	Deqd1ZfL5ff+LAegaT/RLoAAGLb1iGImRoV9zV804YKbussAbEANCp4vMnK1y8RIV98LbMRDccnj0
	sOqiHivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKHy-00000002qqJ-0cue;
	Fri, 06 Mar 2026 01:47:38 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKHv-00000002qpt-2PQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQKE4DdZYeTvnXkD1UuBtLA5ku4GXVPeQ5BZVwtd1gQ9qEKJcEvCTl5Ieeo1eVq3fjcnMAivqK2kYvVh9TwQiE7oMizIxVbkPYIwNINUlmr3HbQH+Q0LhUR+B6sUwnu+lUI3V2V3C+ho3UtMDjDFzcoC535osTBFIouDlq4GnidvnYx6fkMRBNE0DHCVnSxVjqTIni2ZqQEHK6hyeKaKrRHuG8bGnLdB9U8rpcofOp2wyspeOTzTkr5IHYu96HAmShaBxY1TaJ5fv3piiOECOkAD+vNjgPFUly98grdolTJMeCiH0It4YS+X5oHU1XnrWwWzreUQUxcLT6dzD+Cq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zeh3WVRIbHFhm2q/LifLQ87HO3To+jiHlEcwWUJbBiM=;
 b=OaJbJrc28iM+FgdFVdbWotGCsFI6sGIvZfoqnT+uUTE8QB5iti7MD2+Jsweda2d4fiMa2jWggi8PK1GoGZg/Ms/ihnSRHVfwBFsA6PrYF9abvOzl2VL2u298g9tWdg/CfEyhX08wjMolIG6nG+H7hOaGeJ48XTuYRYn0u5wK3p8ZpLlfyJEwniMO41c8YjHmaG5y9cfPzBoSGd2oaDhE4dalLDNV7BnTZ7S7IDBy9y1HA/LK4WvE368lOhpnsOfwLCUcTxH9up2PlUcd6T4bQmU0Wmjn+li26E8pEVTgnNIU6JUuniFjxDanF2oCtSznJtFhxDS8l1ATipol4gAQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zeh3WVRIbHFhm2q/LifLQ87HO3To+jiHlEcwWUJbBiM=;
 b=FJHg2LJwyFeCEeIECKpDo1lA85luds0TZL/GySAoBEN9Xne6aB/fkt6IBh+xGmQHDyuUfvp8cyOFf4hUR7w6DWyZnOMBTy2uzCuFydVroHumrXy+L6pwIFdgF+zmH2gFkAAJHzk5VkwdXEO34V3cinmZTtp+6nJGxtlqrHxLYmpmXWyAQ9m+SeZP3xQbHVjivGOCBfKxFxQtsi0zsoLnVpxkXKqhdISzYWjMavrMe50dKm0TUDvlUj3nGGPShuEDPeIE8afAVyWXecBOlKs9O4J1Eioujn0MaKMgxmHo98NV+4sijPlHtGSifSsnFFAHbAPkr5UGQ+YcNeGcXpzdpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV2PR04MB11566.eurprd04.prod.outlook.com (2603:10a6:150:2c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 01:47:28 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 01:47:28 +0000
Message-ID: <a0a6dedd-7090-4dae-baee-239dab47bfc8@oss.nxp.com>
Date: Fri, 6 Mar 2026 09:47:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, fra.schnyder@gmail.com,
 linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com,
 peng.fan@nxp.com, eagle.zhou@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260305100149.722-1-ming.qian@oss.nxp.com>
 <azwbgxp4pl3m6klyvd5htmy7h7pc76nqvvgmi6pudvfl7zippl@svv7tiibyrci>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <azwbgxp4pl3m6klyvd5htmy7h7pc76nqvvgmi6pudvfl7zippl@svv7tiibyrci>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV2PR04MB11566:EE_
X-MS-Office365-Filtering-Correlation-Id: af56dfdb-c826-4a4f-746e-08de7b225269
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|7053199007|14052099004;
X-Microsoft-Antispam-Message-Info: w+LEXSK2gy/I+4V1c3qlqTly1uAsIMt6OuTx97lAQ/gjT0zb704vP3l5R6hng+KKb+LWIlIksL7woAO3qKx0OqM4brsctzsjSGWY9jmEx/E9Jf18S9bBDT4whg2b6NT2oudy2wTRGNBw8YsaOvnbDQDtJCi7bxFUbY277n/GUjSHeVXjQjGNIKBN4qnYYGXfyGyXSNxvethkZ98T6yoK7RvTLh5KQSRy5RbV+jYjvtPY5h9RQBB73lAMPSyzmBKUGQyBSeP+ygJRcWLU2QCHM0GF9KbNIC9SM7G6d9nY5Mk7bciD0HO+l0zt6HPUi39Pnwyo9oZ3XNhg8+p42TXcpEbk7TVneV9x8mXr72CwaVOyazngpF0mwtXyoGnbX3xBTWMrwYO7BtCPiO6dmb5mgjmEdowBLcSsaV3L6mKIAEUY/6sPxtUCgDElkZFIE19iqIDcTi1nxz1pmCbylxWdgKMzThbLaL5liDAZImMxKmaaQ7bc9+04M/dTwPpH4aZc3wsHsKEwhowg4jALPGwHM6esl46bq459XCVMw1ssN6XuxzQJYBT8MDmRo9zQ0syx5mKnSKSeG0ZinQDmcEcZK1td9ZnLlHzG3tTRusG9VHn4jxv87E79/iBrhC8abz/UlJHKsMknFMQ7kPo+3eR7N4pIpMxj5D++DFecmjgbzkDSZtCHzTFzNlwwEHnNCkAMU43EZf6VIxUMemGeOnzgQCNEIS/dbOVKnxbnYvp4oCs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(7053199007)(14052099004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1c2K0JrWU5aZGdSaHpkalZ6ZVBxOThiTHJNMjE1YmRSckpkbjlGc1ZsOC9B?=
 =?utf-8?B?RzFtY2J2MUNYSjZCOHBUZU9DMkZHSkFYczVVOHlHTDdyQ2gxdTJYSmc4R2hR?=
 =?utf-8?B?a3ZUUXk5clFiNE1WamtjNXU5aW10QzNORWRzM2ZkN3JkYTEwQitjK2E2TmtE?=
 =?utf-8?B?S0djZ25HaUZYVG1OYnd3TWZIaklSUGx4d3Z2TDhtV3c5NkZNWmxmVlJpNXRl?=
 =?utf-8?B?azdVWkJmZ1NtbThESm1rZlUvd2FRSUFZQUg0VnJYcGkwL0p1TmlnOUhXVjk2?=
 =?utf-8?B?aVRnRE1CTDJmVXpTQUR0cGZEUGRhNmxRODZwcFhWYmYzN2k2cHd0QTBnOW4r?=
 =?utf-8?B?dlJEOUc0TmFoK1ZSYm5DTUZMS09YUzZORkZMRjFtY05WVm01TlIrN2poQWs2?=
 =?utf-8?B?b0pWRzBsZ01uYzUxM0pYaXF0bXU1Rmc3OXYxY0loTTRraDNzMG96ZTdzbFI4?=
 =?utf-8?B?dlUzbjFoUWtFOFpPakVtUW1DSWdXRVd4bzA1VXZ5RGxKa256SitldmVXT3ZE?=
 =?utf-8?B?MHA5LzR6L1FLNWtnWVFKRVJrdExqK3dYTjcrdkw1RDcybHlOa2ZWZnBtbWo2?=
 =?utf-8?B?dG93UEN2WmdUK0YwMFZtOHdGT2l4VTMwSnd4b0lCdWJUcWJGUlVlOXVlVjhX?=
 =?utf-8?B?UTlNTWtJQmhuYU8wVWVzeUtxaDZoMjFhUGM1U3FtRVdPTkdiZE1mZDhPSEkw?=
 =?utf-8?B?SGpXRHpzWkhNMEVRNjFtWCtCZUJIV1d6NzZPY1VoNUlVaHZSM0p0MHZKT1Fx?=
 =?utf-8?B?Z0RsbEh2bWhpZk1EcGNyMkVqdEJkMjNzeDdzVHRGcGRkMHVHNW96cWhVUDZm?=
 =?utf-8?B?VUJYWklsUm81TytBTzlPQzdKZGFCOXhWR0laaVVxejRMVWppSlQ1TFBEWUFR?=
 =?utf-8?B?ZUVTRitMNkY3TDRQU3RpYlNjSkNpR2dYOTNDZWNXZ2VQOVNmaXg4bXlmRXJm?=
 =?utf-8?B?YUZoMXNkbjhlKzNuMC9NTE9xQVpLVVR1YjZGc3Q3c1doT0J0R1pnV3kvY2NP?=
 =?utf-8?B?WDZGM0gwbTdEN2t2OHpENklySVJFcTVBak9seTg4eUxNSE1vbkdNd3V6REQ2?=
 =?utf-8?B?MzhKVEpwN1RhYjI1SlVWMGtDMFlIWmM2UG9nYWpvZnA4V2U1QjFMZXU0Rzha?=
 =?utf-8?B?aFlERzd2WXo3MXhzTVl5Nlo3a1krMG1PYkgvYjlUNlM0c2JOeHNRM0tXU01X?=
 =?utf-8?B?RjZ4ZTJYN0w0d0dIWnYvUDYvS0tDVEVFR0hlSkw0Y2FjVTNhVk16cVpLVlJE?=
 =?utf-8?B?Vy8rZkNvWjVXZmhWdTZMN1JabHlMUXM4Q1BNc3M0WWI0MWZ6RU50b3RhRUEx?=
 =?utf-8?B?QndreCtKNnZtTHVPZlZJMjNCMHNucHh2Uy9DWHZ0dFpTUjBKN29halZ1bHQx?=
 =?utf-8?B?WUpiYU12MitUZEhUVkh5S2VscHFVOVEya0VDZUJqa2E4WFo4WVZtT1B5c0pz?=
 =?utf-8?B?TEd6dXh2cCtVbXl6R2FHMVZJakJDVWZLOTFleEtTM3RtMG9TcFJJZXdKTFVu?=
 =?utf-8?B?clpGV25wTDZEWUlqakpYaUpOKzJwRVBNZFVNY1h2Q2tQK0FWRTFzLzNHcjkr?=
 =?utf-8?B?czd4ODJGd3VkYWM0dWd3endDWVpqVzdtaHltSFBGM0hwQnJKK1FBL01zS2Fq?=
 =?utf-8?B?VFlUdXUySk4vZ3M3dXlOcWxJSGVQbFVHNTkrd1NPVkVZeFE1Z3JlYkt3d0dh?=
 =?utf-8?B?TW94bWgyVi9xaTNtWEZ4NFJvN3AxWjM3ZHJqMjRhZjdPR2RST0F2UFY5TUZU?=
 =?utf-8?B?Y2VON3c5RkZpWk1rS0lIeGJPMUdldUZIek1PS1ROdUQvSzFoUFdFQ2Y0QXkw?=
 =?utf-8?B?MWFxVjFsSVFxMmtWUUNkcU9TOU9jMXczeS9YaWdKejdiVmpZMDF4SDVoVG44?=
 =?utf-8?B?RjJhOGkzZ1E1bGRDV3dGUnVMa0sraC9WSEtmWXpPNExLQXNiUkRRaHBDVWtK?=
 =?utf-8?B?NlVJdUdBcHo5R1VpcUlyMTIwd1BUemludW1UM0dpSVhMNmx2Tis5dmZjZ1NR?=
 =?utf-8?B?NDBueXo1VHIvUmdOaCs1d1dXL2tjQkprNXZIZ0JoV1V6L2NxU0FKWFJBY0NW?=
 =?utf-8?B?TWVIOFFCSU9iaTJQSWUrQWJ4TGFMNndORUNFejIwSmo2anBST0dCMVdGbkZZ?=
 =?utf-8?B?T0EwVmtSMENJZjFnVEhKb0VkbDRmQzdHenVFT2dCSiszSDFCNVdJclR1V2Jy?=
 =?utf-8?B?bis1d2cwb0h3VytxK0U5Rk5hSFY0bVNwSGJXeUMwRkd3RDdKQVV5d2hOZDl5?=
 =?utf-8?B?cWN6MUYxUXRKZ1hGdkRkb0ZTWlQ4bEFsNkQrMlNLZ2l3a2czdkVmV0t2cElD?=
 =?utf-8?B?V1lIR0NEYlFsbVNyVVJIOXpRR0R2eFJBSjVEZXg1SVZ1aUdpbVVzUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af56dfdb-c826-4a4f-746e-08de7b225269
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:47:28.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gXLcLkgkBwBKs35JkyN5HbieYqTqa9hN7fyZ/Wh7yjo+X49VeJLYVpAB/Sr06GKq4j78U33hOB6ynuL7mIwSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_174735_630380_313FC564 
X-CRM114-Status: GOOD (  20.67  )
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

Hi Marco，

On 3/5/2026 6:32 PM, Marco Felsch wrote:
> On 26-03-05, ming.qian@oss.nxp.com wrote:
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
>> The imx8mq_vpu_shared_resources is referenced from non-init code,
>> so keeping __initconst or __initconst_or_module here is wrong.
>>
>> Drop the __initconst annotation and let it live in the normal .rodata
>> section.
>>
>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
>> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
>> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> This fix was suggested by Krzysztof :)
> 

I will add it in next version.

>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v2
>> - Remove __initconst
>> - Add missing Reported-by tag
>> - Add missing Suggested-by tag
>> - Remove comments of sentinel to pass checkpatch.pl
>>
>>   drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
>> index 6f8e43b7f157..6fbe3c581032 100644
>> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
>> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
>> @@ -343,10 +343,10 @@ const struct hantro_variant imx8mq_vpu_variant = {
>>   	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>>   };
>>   
>> -static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
>> +static const struct of_device_id imx8mq_vpu_shared_resources[] = {
>>   	{ .compatible = "nxp,imx8mq-vpu-g1", },
>>   	{ .compatible = "nxp,imx8mq-vpu-g2", },
>> -	{ /* sentinel */ }
>> +	{}
> 
> Unnecessary change.
> 

Yes, I know, but I get the following error reported by checkpatch.pl

	ERROR: missing sentinel in ID array
	#50: FILE: drivers/media/platform/verisilicon/imx8m_vpu_hw.c:346:
	+static const struct of_device_id imx8mq_vpu_shared_resources[] = {
	        { .compatible = "XXXXXXXXXXXXXXXXX", },
	        { .compatible = "XXXXXXXXXXXXXXXXX", },
	        {  }


	total: 1 errors, 0 warnings, 0 checks, 8 lines checked

so I made this change to pass checkpatch.pl

Regards,
Ming

> With both fixed:
> 
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> 
>>   };
>>   
>>   const struct hantro_variant imx8mq_vpu_g1_variant = {
>> -- 
>> 2.52.0
>>
>>
> 

