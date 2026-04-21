Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF5AF327AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+3hwenxWoO1UXiMz01Qcocny8R+VKf5H33kT3ZCz0g=; b=3NvRwsv9UNW2NRAmOwK8/x7axH
	Gxv8Ig0IsG6GCWD3DoTxlVlorvsnFY2Ol8dtMcp9IvlXt7A2wiYFnOLslVr83we9jfUJnPLWGSn/L
	mlTJyjqONA9b+tBuohjjsXt0uqGoFbdDXqKPL+B/NZOoSXGvi0OvQro4M60vte4/W4U+4Crsg9aU7
	X32cxpjqehUWrVtTgeL6s9xQxMg0K7onrI2aMg/l8uX5i4niGa0wzvwk1dq8TaeFgXeLiWXIrSXEL
	N/s6nGkTbFmbG6WcZwSXsS7TpjpZaOWho+xPgDtKmbXVAbCtf9SvpyUa3GFWNrlPrxm7CDY2lLjBI
	kDhxbVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4mu-0000000875u-2t1a;
	Tue, 21 Apr 2026 06:40:48 +0000
Received: from mail-japaneastazon11023106.outbound.protection.outlook.com ([52.101.127.106] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4mr-00000008756-477S;
	Tue, 21 Apr 2026 06:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaG3OiaR+9o+J1hCyAVJphPk/+XCsVwRk/nkTaABtqTbCc1RXVFcLNPFX4oEk6rlfiXLhKAO9w2vOcbixdjZGyeCrtWW/rYWNmULTBwyGW61/bnrimE39Sdt5tVtAuQKcjlM200MNBHMtrluApBJZ2BRNsIhaijE6sxCeO70LQRaadZU3hTjtV+BsfPwIKB/5NlkoNX/+V6f8da1Zt1BlBDofBM5YUFhmzTr0IzF5FIJ3+NaCKPtQ2555dAJmHk91bdYcRpApWTgXHzOIiLXSAuWyzJLnqfRnHTEpWMJgW/2GDhikesJnt181cqTzeScricxL5Q0Nwjxw1v+dhPsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+3hwenxWoO1UXiMz01Qcocny8R+VKf5H33kT3ZCz0g=;
 b=xTcIGu1aAjQ36T5SGf/2yPC+YifxRgugcMJ6zzLQb1r+X8n9KxOC1cVhTqpadLbMpRK9PgU06ZZVoELWZ24Z+iS9desNxa/e4jDPg9bTDXlgdQJxUlxhFKacDs1LsY1wF9IiGgoPbHeVQ5uYjMVad10pAKsmooJQe9tuowS783QtHNpKJ62eaNqP7L7Dh7RDFeKGMsJYC+nxvkEs/287HCMkI5ynEOOLs7wNfCDhgV5+MITLGDDkvqYvljCF+1gHUfx6lf91nSDOB+wlE80xg/XuI8mr6zBqKD/nFkLCiQ8v+IPtUFQrIVmJdI01M9f5zA9z1l5zODQE3VuStxZS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+3hwenxWoO1UXiMz01Qcocny8R+VKf5H33kT3ZCz0g=;
 b=plr7wMi2L7g9QZ2NID7Se7fsGk4GyE/BUwB3cxTy9L3KTXX4nUZ+hajczh3zQVFzXXLEGrpCXqnzPVL/5fZRW71LHOGoxbYGn4KwlpQThVNOosggVlVbiJgV/H2IqLEnHYnj03wYFkmFeAgR9wYxaIu9oRPK4VdI5CumOVioC2hUaIOXY/zbDckwzUAJL4ye1bNxgC4/7z6XJaHSNYvtAbMUOPGBpz0zfYWpVmDIoHC3+OnLsLY9b6jaOXusgbLQ78RSVpX0NBGXsjI2lDRNn7jKGeyoXJcWKo4RbM5cy9TabOLDHuV0yiwdP/C5I2QTQoG/3TFcKESLHKmJQrldVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB7976.apcprd03.prod.outlook.com (2603:1096:990:2f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 06:40:25 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 06:40:24 +0000
Message-ID: <49d2e771-a940-4c75-a632-d2e159111c22@amlogic.com>
Date: Tue, 21 Apr 2026 14:40:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
 <f2074119-7b4b-4481-8e39-c822dd67000e@linaro.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <f2074119-7b4b-4481-8e39-c822dd67000e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b475b02-bce7-431d-2dad-08de9f70de1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IwBjoo97BjZEq7B2FW+T3zRsw2UO9MtQ9378Dvw5rui7DFC5J23ES+zNYSO26YdOpCanBxbEzgKYr7C5czEWkjvNCnjWFIOVQmZF2rFdH3aUULXZd550+V/2ADJgWdPq2E0B70PE264KeNyV1H99m96CywXezwhJ0zFr638By3CElMskY05gKF7LnDl501YD1P7CDtf2kBUAoUL/juEK5S8RQB216MFnA5O1E+sErNVMF9lzvTaXjTXHM6qR6nYre83h/qE1VHOiaIW8rLaSHgK+q171VIosbYVel2OabNBtymJvm8VoiQCdm/2WM6QLRAeNxV6dyY7VF3+tFOi9uvG5ZJBxcSqrUfQAPUzqxrNM+sX43aMPb6NQHtmvXx2WX8PU0moP8yImWz9f9dWkRj6Rhcio6RASU8p05yissSNdwFyh7npnBMNA5Gf93E3JVGU7O5y0FJEi2mxdMTylTJiPCfahEO8ori0POeoaZ8GNBmcdJjlekVW9clh9ttmQUp5ePxe9noE4ZUUxwgqjkQhaNqyiXhHL3ka+Ym/5KWrgrVcDwDwQsG93TdSattRiBGh134eZRyBdYi7HyjYNA2Og18wngVAhAl7nSpIGjdyMVv9SVeHBSTCk1ysLg3KUjl+Moung6xGI+gPshjBA9eWu2u2y6wiIWHUfhuon756QJiNkK60jtvFBVEEMOJEVDDJ75D2i8cIRrN5r39M2dgY+9UOr6jXy75TO0pw+2tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9ha0NQRXc3bkdtMlVET2Q4Wklyd1ZRTWp3NzhhWWFqWWdJUGNkVy9tZTA1?=
 =?utf-8?B?RUkzekRXRVc1NGNNOHE3dzRUbzZxTnFabEVkQlI2cFJXQUdJanZhcGd2ZHNS?=
 =?utf-8?B?bVNSa1F1Qkg0QkRwVkVubm02a0hIQ1hpdTFOejk0UWErcDBGTldjUktxYm5k?=
 =?utf-8?B?YlcwNzZkNkpmOTMwSXplME1KTHU3TUtLT1UrVENLaEo2d3NDNVJqYW0xWVQw?=
 =?utf-8?B?RDk4aUEzdVZlNE9Hb0lqZzNWS2pYVVB2N2svRk5VWUYyMHpSNXZVaW1WWlhh?=
 =?utf-8?B?YndhNUVUZ0V2VDIyaGhVdDJLdFJWVHV0WGJhWmd5Njk1blhlejhTUE5IVnhD?=
 =?utf-8?B?ZHZ3UFpvMzg4VzZmWTVkNHFhT1BoY0lMU1JESERiWlF3ZDF6dURXNVNhNi9o?=
 =?utf-8?B?NVVHMi96Sk94eEI0OUlMK0Y1MUxUd0dsUVl0Ni9iSnBZNkp1TWlKWTlqOWs0?=
 =?utf-8?B?S0IwbEtjUGZoamJMSEFvSkxrcUo1V09jeVNMcjdqd2JoRFhNNy9Kc1dBeUdv?=
 =?utf-8?B?L2V3NzFkWXFtck1NRk9yUm1qZEdweFdsUk93dXZMWm9OUE4xb0RNdzYwUjFF?=
 =?utf-8?B?R1R1OGxybldpRUdJb0lBeW5JOG1Ldi82aGw4WXVxK3dNbGFJVXZOVThtZ0ZE?=
 =?utf-8?B?Y2xibjdSUkhFUHBBWlRyL1lXU0xWRTdFdFNSaENqRDYzeW92a2NSS211SlFw?=
 =?utf-8?B?eHJiVEJCZkFhZ3lETXVZT0xRMGFsOTlWcUxuekNRZzNZWld2S2tuTHFNQlgz?=
 =?utf-8?B?Yy9BK3QzSUVvT2kySnRaZ292bjNXRjBrSHVGTVAzd1lLV1BXTXRLYzFaVGda?=
 =?utf-8?B?U2pEU2xqdnEveXQyWGR4OWxwVEVzeURGeDgrVlRSckF5NTJSR3FrdFRnUUdX?=
 =?utf-8?B?czJYVVQ5RmNRaFhUWjVqaUFLQlJkSzZNV1ZqaUxNcStBUS9hZDVYbXQzZ0dr?=
 =?utf-8?B?TzFQR2Fld2tGSEdsc0pNVS9nOUwzdERNbHJXT1RPYVI1OENIR0tiaWVGQnBr?=
 =?utf-8?B?bkRVc2JhMG9hQmNGYXlMRUJLNUZiVFZscTN3cmt6eTBDc0QrSkpzaGdySlo4?=
 =?utf-8?B?ZndkY3ZEZ2hZQzdObjRvNG5IeW9wNUg0ZDR3UE5zZ255UFJGdXdSUjR0NzBt?=
 =?utf-8?B?RllnTlBPdmlMTDdweHNuVDJyMFlFd3VrakZtS056c09KVDhaR0R1MkFVamlS?=
 =?utf-8?B?TjlZbTczTXVkeTNXcEcxL0dwRWNxa2hwT3A2N3Erc1dTUWNDeE1NT2hqbjBu?=
 =?utf-8?B?TEV3eDFSODl5d05UQXVEdHFCZ0J2RmpKbDVqdDFJQXAzU0ptWlBBNkErdytD?=
 =?utf-8?B?RlRHaVM1Sy9DdlBhUjd6VnJvUW9uNnR6eEg4VFQzS3ZOYlkvKzg1TnZqbE1p?=
 =?utf-8?B?NVJ1RVdMQzBnTlFIVDB2c21CVSs0bEtBUFk1UVpadGh2ZkdxMUE5ajdwMlZZ?=
 =?utf-8?B?U25QUUpIUVV1VmwyVStsb0pENlJlcUFXZEFBRkxGZFlTdXVJR0hOblMwdE9M?=
 =?utf-8?B?Q0I5LzU2Q3N4TjFQK3VvRHVlYmVZemc5UzZZVjM5RkExSkdscFk5QmN5THN0?=
 =?utf-8?B?TjNwcnJkbW5TemdQMnZOcDlGSmRTQ2RoNlREc1FwYUJqblFubHRBTm1YaVhw?=
 =?utf-8?B?QWVNUDV5eEdVK1IyQU1ZR1NTb0ZoS1lxcnRKZmN1MkhwMXpJZE9EcStuclEy?=
 =?utf-8?B?TlA5UVBPL2l2bkdJSUE0dVFOM3EyU2dzWVhCZGdDb1I1RjdTaXRPOHUrcU9h?=
 =?utf-8?B?RmpVVFh4UWlQYzNCTGVNVGVxS2IydlMvb0RkK3dvbVRIZi9DQThaSEx1Vmdm?=
 =?utf-8?B?RTdXWUljRXBIQmtKWWpoRmVGSjhOZEZxcnV4cW40WmpLbnUzZTM3N1Z5UHZu?=
 =?utf-8?B?QTN0M09JNS92R2tTM2Fxc0xZMTRKelFGQzlMZStJVHpLb2pTY0F1aGlSNTdV?=
 =?utf-8?B?azNLeTZoSTRnS0pyY0VBVjl2U0VmRDJKN0pmR1hVcEk5bEdZUzBTSzBjOEZl?=
 =?utf-8?B?SVFDRy9CcEZ4UXhYT3FEdU5EQVBPeXFQaGw3S2tKbGt6cmlsRVBUMDlMK2lt?=
 =?utf-8?B?TzRrWWtaNm8ra0MxWXlHMHFSdG9WVU1iZlp0ZFRrVzMrNkhpeG9Gcnc1c2Jz?=
 =?utf-8?B?c1dPTWIrLzJzT2VWdTJNV0M5ODUxNEVkNFM3SkVvNXhvVDhGZVEyVGVvb1dm?=
 =?utf-8?B?VG90aDIxZzNuYXFMckZJMFVUZVNRYWxiTHIvOTUxWHFDQkZ5YU5aVVd2R3lO?=
 =?utf-8?B?UFBCdFV5SWQwbC84ZGZQeDRqSDZjeXJlNldPVXlaWW1zZm4wU1pFbHR3RDd6?=
 =?utf-8?B?UXY2UFMxOGcwRWFGclFVWEVraUgyYWlSYTNPSHh3cmxnK0lUWFNqdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b475b02-bce7-431d-2dad-08de9f70de1b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 06:40:24.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BXsWGD5FqXpKbtgbnbpAcXWynLye/1pa6YFgepNqvE6d1lfIEqNmXb3NWSxJ0z4eD6U676o6UNF6bpkRgBrYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_234046_052441_A236D31D 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Ronald and Neil,


Thank you for your patient explanation.


On 4/20/2026 4:52 PM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> On 4/20/26 05:25, Jian Hu wrote:
>> Hi Ronald,
>>
>>
>> Thanks for your review.
>>
>> On 4/17/2026 5:48 PM, Ronald Claveau wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Hello Jian,
>>>
>>> On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>
>>>> Add the clock measure device to the T7 SoC family.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi 
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> index 7fe72c94ed62..cec2ea74850d 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>>>>                                status = "disabled";
>>>>                        };
>>>>
>>>> +                     clock-measurer@48000 {
>>>> +                             compatible = "amlogic,t7-clk-measure";
>>>> +                             reg = <0x0 0x48000 0x0 0x1c>;
>>>> +                     };
>>>> +
>>> Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
>>> Thank you.
>>
>>
>> According to the "Order of Nodes" chapter in 
>> Documentation/devicetree/bindings/dts-coding-style.rst,
>>
>> nodes of the same type should be grouped together, and this takes 
>> higher priority.
>>
>> So I have placed the clock-measure node after all PWM nodes to avoid 
>> splitting the PWM group.
>
> This is not something we ever followed in the past, and I don't think 
> it makes sens here.
>
>
> """
> Alternatively for some subarchitectures, nodes of the same type can be
> grouped together, e.g. all I2C controllers one after another even if this
> breaks unit address ordering.
> """
>
> This doesn't apply here, so order strictly by address.
>
> Neil
>

Ok, I will order it by address in the next version.


Best regards,

Jian



