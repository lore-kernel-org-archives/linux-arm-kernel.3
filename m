Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B126EA71B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 03:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVeLv9U2wGGUeLYa/PHeZJcsaUcakX3uPRCqgc4Tj3Q=; b=ooYtFJl8x9mg4ThsqXkB3CAvK5
	llclmKgp50AdB1k929ldyA/trpRJrQCOqpk05nKkLQH//PTBnoXRCpcxryAKAkR2yipCnBAYAvaaM
	8R1mcU4gEm+2pT7FlTmTCG07Ac/QgigeyObxNq7i2rz2GlgaMjZIPOdoCpMXUU8lJM3zZJ3psAyjN
	WYP+swAVFXFv7iQ+RuaQ0zDqs+4OZ+XGDKuyLxjjCXjo6XJtAcqHhiFly54WyW5vxBMttFc2fi38r
	aUpsLICd5GJXjDg85JEiO5T0l7xcFSbqBi/TNsOkz253HblfESWDkkdvW/dyELGB3YagAgL26k4Fx
	bNA5PiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEfH6-00000006Miu-0SRi;
	Mon, 20 Apr 2026 03:26:16 +0000
Received: from mail-japaneastazon11022095.outbound.protection.outlook.com ([52.101.126.95] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEfH3-00000006Mi7-3r4a;
	Mon, 20 Apr 2026 03:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcGRbbRjpo0C0iPXwNt96/rw57mb+mAHc/HOSP0N300FoCejdreml11SqLw6bhFoe3GXtlj9GfQa2WLlBrrP38IdZteae0KEiAELC4z18yGGMtrwa8qsP0V9ORjG3qrDOTH0+/pGyt0cy+dLMeRhCSO9woPVKSiISWHML/iLH9Jma9tXmwLGL//r69RhMpOiD4yH3DS7diXOJymKC1OOQNNc/fQGmc+ECvlvp1fDKl1QD7J+DRUIXlBZKnaqyUq9gduitNBLYL+TvH7VtUtMCCACiB0+Q7fGLrotNKpaheomg/LjY2J6fgSD+97+KW3J06MNv6EOKqZRvZfRNYHnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVeLv9U2wGGUeLYa/PHeZJcsaUcakX3uPRCqgc4Tj3Q=;
 b=y5i4ZtD88LQq1ss1wgS6m9fSqaNHKaErT7J/u1l5WoNP2NXjHKInPh2CBDCF94irvfpwjRE/woseLFV6gcEJIkojNkzDCHRMHnnupR6mPD93Up9FmFBYMPYMLWO1Ntrn5WSknZW6lH8AbMGrjDLvw12axuYpaFES+t0/kt50M/UgNUxenQEH0jHawCfSnPUkRmJZcWTRFMdpkfzV6Rc8usxOSJKhBijykxey5t2wo0O7PKEavhEHItanmW+i7hnOnLgEkt9GWhEENgSm1TKPF+k6SqonFiOcsJClwXMNba5gLUci95rGyl6zDcwCMgUdbP2Mv1pt74qY3tPOY4obvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVeLv9U2wGGUeLYa/PHeZJcsaUcakX3uPRCqgc4Tj3Q=;
 b=zaV26pNFZh04XGGjlXD+WA7SIqXN2oxiJjh0wFFOQnuuO/O36MvRTIZbdluGYYUae+pBqvghBAXQzGYLSVMbYo0D+hJgz8cuKMD1ZoG6KNO6nXgpJNxL1mOuePElL3N8PZt2qtZMPnGw33d408NsPQK9zXztN1Y9KYTjtbdGJYYHpeobTDwfp07MkXYQVjYgF4pLsWphp9hXOp2hpYxzbPpiJC2tR9JvBbSrSR35HzDdNhijYkIbO6M8ZvWotDIBSql7d8YbziF7mPoPIQxCsGyss3x1aOR1ONFxn7aio1x3tqlNNocSM38a0RJp4XiHO5Do30Ucw7hBkSM8LR+L+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB7361.apcprd03.prod.outlook.com (2603:1096:400:41f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 03:25:53 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 03:25:52 +0000
Message-ID: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Date: Mon, 20 Apr 2026 11:25:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0076.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::10) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0d231a-c7a6-432f-bbba-08de9e8c86b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V386AE+mUxsN++gRa7VOb/ZbYUKN/7+2XXnmr3niNIa5WJs20DSoQMxmQG69x8Kwjkz6RTU9EdjzDBMBeEsrCw+qZ6kZXqubu6F5i5AnAPa0RpCi3QcCNCDu0Saz1Y6X/UlLgiB+bl59BDfTF3RBjVNf+YMzWIX9DDDxDGNmnzNWVbuVWD6B9oBmQo1LObvJhSARaeOLK3b1WpR085v7kTMwiUZRk2GlVpNGpNdn2XQDERFr0nz9OY9MZIh1fjBesiDhI/S5F8JvjBHvuCtmQwSzAvvXP55tNF5ymkMI32XXkW2s8uxy+9IoNwqUjfoOC6uXJcpWY4xlaQ5tLxcYK/ytkJS9jdKLwoGBsuhXCjQtVjRe5Bw46PatrIYcb35e7mbxrJMEF9uI9z2OlLRhJvLGoU1Y7s5r6vqns0l/z87OCIvVRYH7c11MPQgeEjQkz97NLltrUSvgT0Lhd/jjuUE7AuHzbDchZSa5JFl8b0cg1bpWfOYcR1G4+cGf4NBJWoJpbMyMs94yu26BrKIZPK7QJVAOmgpEd4KnqWnY67ZxPyl/VljwhJmaSkJ3Apb2Wz78D4S3E/ENwk2fxhFl9GViJJHvDXj+oR94kZoc4A8bjmpGP6t0jqqAv7b1xc/xUXFeX9n2SsGXCBWksYjgyL7+45yoQ3GjtxNyTuUsuImEyELnuVOyOTZpLm3gCYQq1ZJXSF64eGt+6GUW5MNi+upnJcvuiCTQKD9RePhd8PE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVnQ3NXMzN1YU56WlRIUXdEU0NyN293T3pLSGQrQ0h4RjlpdnpFRGYvNXpC?=
 =?utf-8?B?cTZ5KzJXalF2WnlSRHRnVVpNTDNQN2krRnhiLzExWDVlSlR0Nks0NXlmTnN6?=
 =?utf-8?B?eXFEcVBHTTRWbU9BM3ZUSHBjbUdBQlUxQjZabXNsSFFVSnZTK3pPZlN6b2V0?=
 =?utf-8?B?S1BPbjlBbGFtaXFlbFBJSit6QXVoUDA5VWtyRTRSMWp3REQxMW9aaG03N1or?=
 =?utf-8?B?ZUF5ZkI1MFV4bS9DU0Exa3hENFVQREdncGRtVjNwdzlHTFdyNmwzZlJUUFdz?=
 =?utf-8?B?d0RJa3pPdVFFK3BQZ1BmWjBHTUxxZ1VxNVlFMUFRcFlqMnh4d2JHaGY5OTRF?=
 =?utf-8?B?dXpucjFyZFd5blk0WDNGUXY3SUNBMFNrbE9YeGpDVTFraTIvUHpsNm95NUsz?=
 =?utf-8?B?VG1MYndCMHpTbk5vVG5aeUtYekZBbjkwa3pzanBQeElZYklZbDNXOWJXNVI5?=
 =?utf-8?B?WFE0d2pCVWIzS3JJTnFZQ2xueU43MjZQZUVlRmdYQnp2ZDFnTVBCNGUyVnF4?=
 =?utf-8?B?MTQ1V2tzbkJFUC9obkVzQnNXK29hbHY0VHBhVHJtaXlNejhLUEp3K3FnWlpF?=
 =?utf-8?B?N1VSd1lhS2pEVkJ0R1luM0EzMWN5U1BocUxNbU85ZWtVZUUvaW80ZVErd2ZZ?=
 =?utf-8?B?UVpVbnNrZ0Ezc2NDVllHRmJiRW14R09ZYjFsVS9sdW1kVEYxODdSL1ZMbUkw?=
 =?utf-8?B?QldJT0g5ZCtZWGRhVDN3VlpzUmVMdmlNbE9wS1pONmRmbGU0OTFRSGFiQXNB?=
 =?utf-8?B?Z3dLdVFwanBraTA2TW5BdkhjTzI4R05GdlJwbExtVGZPc0JDTVR2MzR2VjN6?=
 =?utf-8?B?TzRrbEx5OWdmeDdPTjlLdWdFVUJ0bGQ1clErNjFocW5odFA5VVVtcDlRblJV?=
 =?utf-8?B?WHRwK1VOQzg1Y3dzS2N3RHIyeERvV1Uvbk16bjdxdGoxK054bDdqZ0FDWkhN?=
 =?utf-8?B?c1Q3QWNueEZMOFJ2VTRudU1FNWlKRXpza2lpRy9kTUFJVTQwMXcwM1kwNlB1?=
 =?utf-8?B?MXkwSDRqN09xQ3M2b3NBS25VUVBPWkFoUjNOam9mRFk3cUFSL2c5SzBrOGxa?=
 =?utf-8?B?aGh5d3dycmlkZHBQek9TSHNNUTBVL1dJQXpmOXRtai9TbllLSkplVndKTndR?=
 =?utf-8?B?NTdHeTRtNjFleEEwK05PUnVOSnkrWk8vWDF6SWZEa29qTDVFWGYyTDBpT0RQ?=
 =?utf-8?B?VkowNHVuSU9BNDl5aXNSb1VsMXc4Vzg0SVBFNkRlWS9KWkQrc3hsdi9nc0tC?=
 =?utf-8?B?NUR4eGExcVdDVjNxVmpnRG1qdjhZbFEvL2NxRHdiUjBXMkMrSUU1aDdXUWxZ?=
 =?utf-8?B?NDlyeHoyd1hjVW1Wemd2QW1hZys4Q3d2MG41RS94UVJzSVlsMUxzeWt6TDdw?=
 =?utf-8?B?YWZwUzZhWFVYdmJjQVlodVhBMW5yTU9xalJVQzZUTTByZnpQaEx6VjlNRjJY?=
 =?utf-8?B?NGV6MjNTMUExRzdOdnplRStlRWFZYXhHZXpLSlRqRGNrSWg2aDZvd2Q1czVo?=
 =?utf-8?B?UmtrUVhlbThFZ1hiMUI2cUk1dk9TZkdKdG5tYWFuRTlBRTIvTmRYQmR3SXBQ?=
 =?utf-8?B?NHJBLzAyVmZWR09tYk1rQzYxYVBRU2IyN216cWV4TzIvOVZaSE9qWlAzTWNQ?=
 =?utf-8?B?azh5a3NOV2tMR2kxUTM3eDBnWnQyNHVxTldWYTV1dTdIbi8zeWM4VzdyQ0pz?=
 =?utf-8?B?TWQva2Eyb1F0RE5rZjEyS0h4ZkdOcGZSb0RSd2cyNzhhb1N6Ukp6aFZIeXp0?=
 =?utf-8?B?Y3I4aGxRWFB4a2NDVjQxQnNQTTRsRFp4K0RZaHdST1hzVHNJbEhtcUN5eG02?=
 =?utf-8?B?WWUrb0pjSXlwbVYrTXpJbWtIUld4Mkd2MXppS1Ixb0c4NFBHaW8wK2RiV1Vx?=
 =?utf-8?B?NDJ6Y1ZkQnhENi9OZjJPNGJoTUJLbm5RUDBWYjl4V2tWN1lJR0tYVmNNYnhq?=
 =?utf-8?B?Z3YvOWZLc0pqRDEvSm5XdmtvVWYrYjFJRWhSZ2JjRWFMRG5tU3NjUUoxSHc0?=
 =?utf-8?B?TERhZkRYSFNKcXVBS2pBWWlCRjM3RlNqNFhYcXFDS3p6RHpoNFF2SGpGd2NT?=
 =?utf-8?B?bGRiMDJSclhQMWZHWkM1WXhTbzhSb0hOZTdBYVNwcGxzR1VTMldKQWZOVUVv?=
 =?utf-8?B?Q1czc3crOVluNWplOUFWOHpaZ2tiNHNlalp5VHo3OU5laUc4NW4ya1JWUGYw?=
 =?utf-8?B?dGVvVms3MlFyVXlwWG85c1BnWHdOSlVCZ25mdHl4ZC91M1hJalNZWWdFZ0xX?=
 =?utf-8?B?WXBZeFpUL0RuMnVNSXU4YTBLTlVNbXBmWndmSkcrSkdGWkI5SFVSdzU2NGJ4?=
 =?utf-8?B?Zyt3N3RSckwxSFBjazdTRHE4K2dwZGNpdjlRR09UTzErSEtOVmNqZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0d231a-c7a6-432f-bbba-08de9e8c86b4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 03:25:52.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ej5Eh4CyoMJ/p39WbKK3od31vr6C5KzBF7L2QGr9vigNutcCAxyBBaI8aCM4eR6+soYOhN9HvyKgSq4miTwh9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_202613_996418_26B6B317 
X-CRM114-Status: GOOD (  12.51  )
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

Hi Ronald,


Thanks for your review.

On 4/17/2026 5:48 PM, Ronald Claveau wrote:
> [ EXTERNAL EMAIL ]
>
> Hello Jian,
>
> On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the clock measure device to the T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 7fe72c94ed62..cec2ea74850d 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>>                                status = "disabled";
>>                        };
>>
>> +                     clock-measurer@48000 {
>> +                             compatible = "amlogic,t7-clk-measure";
>> +                             reg = <0x0 0x48000 0x0 0x1c>;
>> +                     };
>> +
> Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
> Thank you.


According to the "Order of Nodes" chapter in 
Documentation/devicetree/bindings/dts-coding-style.rst,

nodes of the same type should be grouped together, and this takes higher 
priority.

So I have placed the clock-measure node after all PWM nodes to avoid 
splitting the PWM group.


Best regards,

Jian


