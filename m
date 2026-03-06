Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6BF01806
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0D4w64w4Lk8QNIW9OTCMiivVO76u+JIdDYoZGnPtOY=; b=jiJmLxd7kwYMdqqX4wj0Hv8EM0
	iIynz/ItbkSlF8T4x62d3vZa+83BEZ/8mQc3fZwBRz81539lsbqjsuaK/ar2Cxmwx8tqy0iCVQb8T
	R9HAeAa+EiEdDd3KfOqEKeeUwT/C1U9QD2IddmogwuFy4JXzJ/Vz5z2yac9QVaI28gQAse+jPu/2r
	Uz2rfBLU7Muup2fR1EyyxVboW+3XkIdHJW0BGnpm/m4JkYbF4uu/0jUzHUGnJ0WWQVKIR0y2jRxAX
	LrcrqkbZ6TUE/Mdntv2gagbAGBVftN136xktxOOhLc/QcJldSAQyOilWAq4V7urc9uXC7FkykB3aA
	m9wt3prQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPpr-00000003AcE-1g6E;
	Fri, 06 Mar 2026 07:42:59 +0000
Received: from mail-japaneastazon11023136.outbound.protection.outlook.com ([52.101.127.136] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPpo-00000003Abh-2CpC;
	Fri, 06 Mar 2026 07:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av4I+QddQ8aPTYzs+VT6Xoo/zq+okUl9vdQXjRc6Mg5Hd6rZZOLlD2VI/R6cSTAyh7e2D9ofMOIdA0otQRQerrKhkDeECKqCtNxtaW4NpeYeLcqBGJE35XMeS6ZRmxmdAs/n322Y1myJBlWqJtXazVyeRkMZ0aSEp+v8+LwxDYr8UHBtCDcyODbG82WIjvhRmUZgchqqhFJVuUGbbIU5ZPAX/emoZ4fPAckdQgW8cjEv4mWNndM+L2SWLvCuWoUkWRP8EqkNgW5EzCq5g1x7Ue0ckisSLP9/35lqtj9H9pAWYl2jIwjOyVe1fN3w/W7kthKBwsYWrPhhfMGh6dfwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0D4w64w4Lk8QNIW9OTCMiivVO76u+JIdDYoZGnPtOY=;
 b=Vh+IQVfWzBp4f2f2E56TUIC6NITo9dSg5bWQFXifmHmM8KGg2wFhbOfCqA6uKXxXpZvCMpjuP4A97sM0h30xioPiyWIT1UlVHZl5RJIMNPgQT+T8dKmJ/OYGgrAwXybGfE7fbyr5dm5ayl8pOjSzcQSC8rIDMCFMf5zViHT6AWuXbfZ4FxCI6lKlR5UvN+gjZ+mwJ1Wfr6uUKM2k7Z86fL69SMSx2ZWxfRusZVeUpGoVhP8o8g9V8Hmm/VkwRan43rsD/b1neV/ujUENPTZXHCNT24vqw9sOpwA3RntnLOm7G0osrhcJT3iBtZSB8lroJNlWmw/QhHPrT5p1WTyGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0D4w64w4Lk8QNIW9OTCMiivVO76u+JIdDYoZGnPtOY=;
 b=mTwYQmUWNAZt8Sf9zY8Bz62lnMCTTHCXDF6xL3nE/rvj8fsiS8+06V6hYAyZpYa4JY66dECZ+3PMSfD+hK9uiQhgtBQmdbcj/jkexp48x0inq1EOtc2LVmc661oPq15fTKVMOFv5pdhWAZmENRbeXymc9VySBJ9+edeBdHHACpFExgc4HDlaB7IwdHWT5KeuCaXeoIaHpjEp94e0EcH/nKRuj+kJFyjUvriaXO2+rmBvSIwGk/pCdXkZRyHdcoZvLxIexQYOHvQobGrkR3EYJPCqTvcWrEZ9yDRi3RG/e82AY5L1JNz7TaMVKb4UKl4eRHTdnIVRj26jOXeKN6eWYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by OSNPR03MB9861.apcprd03.prod.outlook.com (2603:1096:604:485::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 07:42:52 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:42:52 +0000
Message-ID: <64521d9d-c247-4d1a-a867-59743b1e4a2e@amlogic.com>
Date: Fri, 6 Mar 2026 15:42:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-4-jian.hu@amlogic.com>
 <1jy0k6abqi.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jy0k6abqi.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|OSNPR03MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ef77b5-9eb2-438e-5c78-08de7b53f8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: co94hjlCNLs7r6BOuAMxKJvi9a2h6VhyHTwLWfFV1fENgnXz4GmX+rmLaf7gtifmW02DusrgX6wWBOAvzxqZW09el8OYcMX5OpJZetG5kVB3uRmS3zittbAbQWidHEOXfRuU22ap/0k0DxzIF16JmAjSclB9t/0/rmrJkr+HK7IupDzCNL2w/rceKBGBKBbh0KcezujRgTRGPxSitS3tpO9+tyad0Jl89ZxEl9E+CMbA9bdAnHPEgW5lJe51IVOEmFs5RIEB8WZ5cpksV2im4l6FfFsebdSRbsnDUBVa+F6HEYNWfsUdMGwT1/3umNhHUZ1xYoLUiFJ3EwsVceOXgTtYS9DFbNxSczF/V+wbhRe50oMBpgZyViReqLVdYguiye30ULMDcW1NhScBFOoVHgKmT/Ch8R5OsfI/P/woSKPrr3/Gph9nTuPh+AOiZIjoAec6X1Cwx+FviKQK5I4lb53938ptx6i4A6bqp5sG5Hki7eLgPy0VmlDYuOzVPsQWxkdS2cGZeRESmyoNb+UTorJWA/gCw9N7zBWhLolZcHTiR77+KRKGsEBfEqg9nEhiO54UlFB3o7ZOTs2RCAz9JhemNjsFFkB21NRt/LtfgHwe18dwBq5KkeE7AiYJ072cTG+Rc7Ms41lFkYELWTz09IlRHu0CBMn0Qn8kEklyWgYokFd+oGpUuj/F1ucmtOa/Lxi62HtfIlBAGLBzNx2ZC9CW7o/U6avU0ZTjDz3cNxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRWY240aHorUEFDc3VwcUs0Yk10cHptLzJqWGtjaXJDaVJXbFVITEVEa3NT?=
 =?utf-8?B?UFdKVG1KYVNZOWo3NHNNc0lzRWRMUnJTUzVmejlLZnl6VTZPVW92MkJyWVpw?=
 =?utf-8?B?a2J2ZWlNelo4Z2U3QnVlRWJDNUxtcFppQzlzMnRQRlJoaWVobXEraHo4Si9k?=
 =?utf-8?B?d2pIR3d0czhjMkU0Y3hJb1JEejUwNjZRWitjNDRWeEdPYW5LNXRXMGMwTmFz?=
 =?utf-8?B?N0NuZ0NNMUREMkY2S1ZOK0JDSVEwTHZrLzQvMUpKZEsrNDdUT1RYZlphWkFR?=
 =?utf-8?B?bnN5cFI2OWRTd2p2NHdWZjNabi82bUFObDI3Nk1HaFNIQXN2ZzEzNi9IclIy?=
 =?utf-8?B?aElqdUt1MnZXeHF1dWRvNU5uVkI5Z1dlcFBJeU9kOHB5MUhsaElpVDY0RkhM?=
 =?utf-8?B?YXRLaDUvYnY2b3N2WjdmTHlMZmxIUzZzQXlQWEtaNWNwYklteDVpTWwyc05H?=
 =?utf-8?B?dXA3OEFNU1dGNDM4VzF4VFY3ZTNSL1pkbDUxQlZYeHBGU0V1Y0p6engrL0N0?=
 =?utf-8?B?a0NJS1FXRXYraGk5ZEJwSVpQRnMxZGFOeWFEeW82RVdCaWhCdXhvTFQralpQ?=
 =?utf-8?B?WUVhMVVGalRqOWRvQ0ozai9lbHZpcm1qNWp4cHlkeXgxdlVpdHZVNVV0RXVY?=
 =?utf-8?B?Vk5KeUtlVG9VdXJ0ZC9zUEd0OHVSODRSWm53YkJraWkvSDV6ZW1RWlRzL0RH?=
 =?utf-8?B?Y3h5Sys0LzZZTVI0WnFRRU9CZmFqV3pQcjFJUXdwU2N3UEExS0VVb05JN25G?=
 =?utf-8?B?T1Y4RmprWnlXR1E5ZXJtaWRBOHpvckJaVm5nMXRVYlVZL1ZUMDVoNjJGV3lo?=
 =?utf-8?B?NURKK2s2UFRiaDdDNzI0QmN0ZUxlQVM2UVpSaFpGcGRya3o1K2RWejlWTUdm?=
 =?utf-8?B?WVgrWncwN2NWUXdwWG9aZGtEODNNUytCNTZvUzN1Wms2WXN0SC9NNVNJUTBU?=
 =?utf-8?B?N1VuY2dNek9TZFZUL3ArVy9kb0ViY1Q1cE1SNlNEcG9QN3QxeURVakZrSU1s?=
 =?utf-8?B?c1EyZ0t5UFRJNjR4SHNXWUdQK2Z5T3hkU3NJaUxEaXFETDA0YzhobzZadjUx?=
 =?utf-8?B?aFhwZWw4UWUzclc4Uno3VEQyeW9Ia3RXbzFIZFB6eFBEUTFkLzF1a0ttb0g3?=
 =?utf-8?B?V3JMUTU2SkVENVhjeEpMemxRTi9oZFlCN2YrZUFjbUwvWmNRWTk2cTJucS9V?=
 =?utf-8?B?WERXL2dzdW5LcW0xVnhUVUpmdFdyZHo4VGp0UTdQQ0tBZ3ZwK2VZODFQc0hV?=
 =?utf-8?B?OHVycXE1R0JoUmJENElrdDVPak5iNndrZUxrU1BDeUU4NVBwOUMwZjdGdWtk?=
 =?utf-8?B?Z1Y2cEw2S0ttUEVWL1JjQ1FTOGNhbnhtNEJOa0ZVb2hSRGZla2h5WjNKMDBF?=
 =?utf-8?B?RlpGRjUyNGpJdTA5eFJmRWxGL3daMy9tcGNGZU5oTnNzaTNPRzhuSkJiQkNm?=
 =?utf-8?B?ZUdMR1Rab3NUVjFlU2xhaFd0UkZ4UEgyRTZneFNFOUpVYkZFSlhCK1d0NUJR?=
 =?utf-8?B?c0ZydE0zWjVVNTh0YWRzVGJqZWRuano2Y2Z2MUw5ZlZPRUNhbzlLeFpRVmpO?=
 =?utf-8?B?eVY2QklpRjd6REovNThzSk9sMThmQTN0U3V1SWkrQ05QaVNRbUZYQ3ZXdDl2?=
 =?utf-8?B?UU1taXdJNFUzR3BTZTZoeTRaTUtvU1V6R2c4Ly9wY1ZjaUhneVBZK25HdVpP?=
 =?utf-8?B?L256TjJKZHRZbEFoSlRvR1lyTmh1d0RzSGJYWDcwbXBQZjFvcCtiZkZJSWpI?=
 =?utf-8?B?R3pvajlZR3NUdG1kQkZzeWRtV0c4SC9TWHNHdDVpbFlHUnpCaHBpMDVtWldS?=
 =?utf-8?B?ZjZvR01EYXVmdjlnRzFtYzBWOWJTZ2xsWVBQNzRNMHNwNCs4QXR3cDFwN2p3?=
 =?utf-8?B?V1VrQmZDbjJaL20zdFV2bFZTTjhhVVFWMzVwd0JnWFRxSGJ1WG9xejd1bzZa?=
 =?utf-8?B?ZnJzR2dERElSQ3VLZzJSOWVSLzdBa2k1ZnVnS2U0cTFaK0xiWHdQdzl4Q3RZ?=
 =?utf-8?B?TDltamF6aXhhaEIzVXJBNm5zTlVJVnpoSjZ4NlI3dXIzbUxYVHdyd1d0Nkh6?=
 =?utf-8?B?a0lvTnQ0SUMydnFaRTRmRGlsU3ovc1ZHQ1ZobFhhNDMwdDJpQTk1NXl0SG1m?=
 =?utf-8?B?S2hYWW8rTytPMHVRYnkrTk9sSm9pWTVyTzVLNXBkTm1kc21UbHVybnY0V2Nj?=
 =?utf-8?B?c0xvOUV3eWFkZFdKR1FKb2NYVFd4ZGl2YUNVZUVocnJQTm9pVUd0ZFZKdk9h?=
 =?utf-8?B?Q0VReW1JSXM4ekNmODFMYU9mditCVnhEMS90M3Y5L25xdzZEWTBGcEVObGh4?=
 =?utf-8?B?YzQrTjZ3YTVKNVZLTGEyeUJOeWJleGhtN1FQV0NkODBORUdyR05KUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ef77b5-9eb2-438e-5c78-08de7b53f8ad
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:42:51.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXfD11ia97W0XMV6BK+9sOFIl+992SvkRkKCAj6PSzp06OYmVOcC4sj7IDGmMOcsasussYfmfInhpjJ+QVu//A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB9861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_234256_596928_CD294DC7 
X-CRM114-Status: GOOD (  11.10  )
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


On 3/5/2026 5:04 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Add the required clock controller nodes for Amlogic T7 SoC family:
>> - SCMI clock controller
>> - PLL clock controller
>> - Peripheral clock controller
>>
> Again I think you should credit Ronald.


Sure, I will add Ronald's Signed-off-by for this patch in v2. Thanks for 
the reminder.

>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
>>   1 file changed, 125 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 6510068bcff9..6ea1b583b13d 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
[...]
> --
> Jerome

