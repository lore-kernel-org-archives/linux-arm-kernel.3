Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB7EDB7C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJBRXN3P5fGYe205STdMAFvshqcm4C934yvfMQ/Cc10=; b=Xf5YVvuJVcolnRXJumOoDRr0XK
	/sT/1Su/gP+4EvKCGLgmKHp9ajlKdBHmC6deH3o7xxEi/uZ+UbJkaNBHUuWdaI5cKa5GPzvUfGbD7
	t98ihIydaiIaP7V4PuuSHMiwWQ+3jn67rPqjpxS06KxHOzRPwTOAuw/vaa20K7kk5MCfuHg4cmWdM
	Mi1J69PH3Z7Pq7oh6d1GhcI6/wMYahRIIE7/PgaErxEpGDAWNbFgRgTqa3c7g0XWNVWUVYumv2Th2
	37RPo5yISlaz6t2YxmV1VnVxpHwC3gelBlQUO3N72uAStDL+ELtsfuRnr2Z+L03bG4EnIk9MJI7ZX
	VsItBhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0zr-000000065EC-0L1s;
	Tue, 07 Apr 2026 07:37:15 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0zo-000000065Dj-1NZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 07:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr2HE5I7TRTok04JUxGAIviU+sx8bBcvPJDc0eD1OLRjMvexb8NqypykosTiz7BSMRQtT+kz9qsEXZl0sLxV52TeXdlH6/CLiTSy+J7NRvF25KbFMsiAaimD37AYkhK7F1MR1jIn1tCI6AnxOVkP0zl9rv2vVRSksjD8aGIlG0fma2Q9bKAU2SC/qwym1ThbEZEbNw/wwjwJqE/2Ncr6I2G95ktapz/y0ldXBpxD3s0TWxzZAL7qSVi9J+FWPduRbJxPKOlArUZBjUFKZiXaWrJsuA33cAQY3wDx68qaJ/pdzOLWTPCRiG/ESxa50MRS4L1MW0Btk59kKknvKR3pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJBRXN3P5fGYe205STdMAFvshqcm4C934yvfMQ/Cc10=;
 b=batr5VloA6X9ngVPFcphLH21s8BR+hPS6cCRk6SQdZJ6Xmp3V0OzXsBZ4oSg0vYWh3iZjW5ebL2VmTy6oaHScwKx2UslS85QaPnYiarWpKRcIpwryf1+b+OR4jVGVnHY5mYj+f7/RgHnyncJh0vSsV6jQLcVGXEPjKZksESzAfMfCIlsR2IJ4W7v4ZC8jphI6/HW7Zww9HKBKJRlGq3/+qaMHSx0tulyoDLkA8YQX7m5rYRL20GWgUfJC4OdZ1S1orJ+BJqALt/leMTz0LuLAzAcswJdj7tzVZy+aSh4UD4RcPNWT/vkEuLKrVB2qw18UABl1gYVp9giCeu/UbY6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJBRXN3P5fGYe205STdMAFvshqcm4C934yvfMQ/Cc10=;
 b=I1ZcWRtRdGih564alvYn/+yCE2FwfFfsb+0dL0Olv4VFsNGf98DR1/3nX5mi53x0aNdVJGBmRe5mlzLL+sQ6vYmsRhxaYaZFShuj/cgkn+7TiiYjjP8n58xY+IVwJtoFoKoxH4WBEflaL6Vb8VRJVE9HvANUkiUdmugmovDd0xX7FM7+gqbMi8UcdMtWs+XtsP80dcXOWwYMNcnMwbq0k6dlwlLD3NuuwQJsiCYikR0JwQQo2h5Xb+lVOrxFbqrS2QS59vbUbpCFx4XZTDCCRE7yISKp0amkMecAxoVpKeexOmcKexCUkSgcT6huVFZEmQdvwwXLQ95UjRTdmLwwyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DU2PR04MB9020.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 07:37:05 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.014; Tue, 7 Apr 2026
 07:37:05 +0000
Message-ID: <4e669a11-38ff-41a5-b54d-8f50841b0411@nxp.com>
Date: Tue, 7 Apr 2026 09:37:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 paul elder <paul.elder@ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com> <ac93m33MhldSpYDj@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <ac93m33MhldSpYDj@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DU2PR04MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: c57f8221-149a-4d8d-0ae6-08de94787758
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MMmlXQ37bnYPzoKXUgZBvS63vpd/iaZ3m0u2/VbQqxlYsQ1yYkmRukhFs3IguLpigXW3MB/sBvD/9yXnFu6qP9GT+i10kKtblw1uq+4o8mnP7vPOVo86kSRf8EU7hHEafgTBpTXQZ847rp1hteAYDP35QTtVimXDafsq9TETXVuPZeRKqG3GEmEO1MU5Ufddf2JbPZmhBbdblpbbdNXYRhbwKZstP1dSoIXpLgUsusLuZwHtAmN2cyfDGVXtaAhvXj+UXTIIS0xDujdMQe5ilrVKTZfg+S8jdVU7ELOGyuX9gQyyx2UJwjwlBixouw4bTXYJ6JlKbKcldXI43X9ttP5K8RmcEy/1FV3+rpWEI/Nn2S4a0hAr8Wxn2X7IpbFcYhBlhcvX6z1HnrX12OobqJ5Ddd37+47pwAf8wmqUgALOwXGT0fw4W8BwgDvA67AGPVpSGVK8xYEyv9P2FA9xf/7fPLwai5DDSPWGsgpGWeJDoliCNgr7D5dEkpFj1eyA2QGlYCtHgEuhq5zzfqJodBFSe25BYnJP7dlwTHxSEHay/zYhXwNJWRbLZE1C9BMVkltIzsyAyCjZPfhi/4rH+W52jdEI7LC8ztWRYALCA3VJMiJnuoD2ww3NcMZczk4CgYbycApdJeWZoi55zC+umgNUYWNQkRDHZkkacMlEI004MB3byHZfAulXKR0GBZnaUmcBhYrwPhB0XKZGKsq7ZJa/sLSzDUhLGyf15b9YUPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akUxZm13NzNKb2ZZanZvU0I2U21TZmJwNlJtN0ViVXAvZ21Yd2tSb3l4a002?=
 =?utf-8?B?aUd5LzdmZ3UyN0NVVmlzZzFqeVBsd2pOMzNhcFVZNkQ5MW1JOUhWWlByOWxs?=
 =?utf-8?B?d04zdCtVeUtoTzh6ZUdnSWFXOGhGdER5a2tXYnkyeUNJYzVwNmxMdlhRQWlT?=
 =?utf-8?B?c2libUpxUy9ZZnpCbXNjcFR6TGVPNC9qM1VQZzRUVWxtS28xcFpjL0hwbHpE?=
 =?utf-8?B?R1VIbUN6SlFrUVM2ME1GcUc3QWo3S004NXkvNlBCeWIvY3VuNTEyOTJ1WlpE?=
 =?utf-8?B?SnRmYzZnbE1WT0ZsTmMrSVRLanNFWU5iamFaWUtzeUJRdTk2TGlwdWFJY2lR?=
 =?utf-8?B?MzA5eVlJVThkMWg1dDExZTltT0oyL3l1NjIzQk05MGhnNi9JUTIzbnJjai8x?=
 =?utf-8?B?aVFqajJmYlhaeGhvRWtCMmhMNE1BRWhmTVg3Q041Vm45SndEcm45cU9YdUd6?=
 =?utf-8?B?aGl4N1NVRVp5OEEvSFlZbytGa1VkNEZCY0hQaEZqVmFDei9qd3MzRmpmeUVO?=
 =?utf-8?B?Z09xRU5oSDhWTEp2ZndlSTN3by9UZGR0NGkxb2hhQnNadG55L1FDeXlFK2I1?=
 =?utf-8?B?WDNxSGgxK2VxQnJXV2MySTZFZ1JNbEpYTXBoSEN5VWUwNDBoanYzUUZ2cTh5?=
 =?utf-8?B?RGMvOE93REE3c0Y1WjkycXVObjk5ZXJsejNBTTlFUnV3R2kra2hhK1FxUEJ3?=
 =?utf-8?B?djBsOVJJbVRtelFEUXNickJhWWlGbEZMS1Z3KzQ3bmJqZ2ZmWENTWUJEV1J4?=
 =?utf-8?B?OGNyWWdkeHlVRmMwM05rRGc5MVJESThHSTF0OU9NeFlMdnc4a3hTdUZ1OW50?=
 =?utf-8?B?Q0xCN2V1Q1luQVZqOWUrdWhxZHdudFRQcnplRWpHb0JnSERSUlNrUHY0Q3lo?=
 =?utf-8?B?WkpjdWVETFJTREMwMitWUzFma2VIdnBPNWhaMUh3M0lYSlhUUVlVbjJsOXBn?=
 =?utf-8?B?alR2MkFzZ3VaSzRCaGsyQ1d0SHlsWFI0R2JINTAyaXY3WXUyQ1dZTGxhYVZW?=
 =?utf-8?B?N3VFZ1Y4TGNQSEZoWmk5dWw2aHdDRk1KM0VZc3R1dzByTWZxUkN6Uk4wSGZt?=
 =?utf-8?B?b0ZUOUZzZVh0dDBUNElzSitHNHFWQ25aS2NEMmdVbnA2dDQ4TzZ1SmIzdkxD?=
 =?utf-8?B?UTVIQk1KOU5vdC9tL1NLa3gxbTc5OGRkU05aSFIrM0xmUVVJZkdsUXdSaVlP?=
 =?utf-8?B?TGtES09EZE9RRnFTWk9hcm5NQzJJdHZCckh0WW0wRG9IVmVkend1dFBMYUZP?=
 =?utf-8?B?d0ZOdDV0cG52WEhLSlk5N1BYTWJ0YUp0a3UrRXNGNEhwWXl0dnFVRzdjbHRl?=
 =?utf-8?B?R1BlbmIwc2ovOGFwV0tqZ3pvNjQ2UldrT0lpZjk3YnRTSHJDWHlHT3dNVmp1?=
 =?utf-8?B?bGF2cWMyL2gxK1ZQaG1GcTNVbDhJaitOM1pPd216WGpxcEtTK1k4UTM1am4w?=
 =?utf-8?B?V2hiQzVWR0MvV0NJdjVNdjBLeHI1cE14VFl4Wm9RV3Z3YXVDSDY0SGZ6bURN?=
 =?utf-8?B?SXdTUDBLMWpwNlNkSHJzRitPQ0hqZTNHZnFUVjMyaCtPVUY3dDNVSWN2NXMy?=
 =?utf-8?B?dDFkbk80a1JxQzJPTTZXTGtHQVYzbWhuT1E4RDBLVmlOVTF1U2lsVG44VzNH?=
 =?utf-8?B?czNzUDN6SVE5NUZQbWs2bExwcWovSGhPRmFvb0tZQVp6OTMxNmFHL1dieTMy?=
 =?utf-8?B?UkRvazFNRXlUU3pVQkIwVkpqUW1FVkxPbTd2aE5UbkdYd2xycXZnYnF6Mzdv?=
 =?utf-8?B?TXVuMnNpRjBqM0RjYzgrRDRRMk11K1A4RTBWVU9VcE1uV3V1dUgwdXlVV2hk?=
 =?utf-8?B?WXpZa1dQa0VocWZzdHJrbEliRG1ma2lvdkFDYnN4dFNmdGo3ZVhkU3NwK3Yw?=
 =?utf-8?B?eUt0VjgvMnkwRjVmclc5eERUTUp3VVh6ZUR5NGlqYmU5cGhQOFJJQ001cHA3?=
 =?utf-8?B?cVEzK0lNNEV1d2czOGVaNy81QzJuSWdRQSt5Nm00WFM5cVQxSU15blYrUnhC?=
 =?utf-8?B?UFE4cGRyQVV5UUhkcXRNUllIVEdiRE10cEdySUJ5bmRkWGxUcnVKamF5SVRW?=
 =?utf-8?B?dGxwbG5OWkUvaEswY1ZLbVpEblFZY2ZNaEE3QUtWdlhDRnM1NmZUOW0yUlFp?=
 =?utf-8?B?Q3BMb3grQXBOeEpjcjNyeGtCRGZVRVNaVXN5SmI2MEd6U0cydnpkUy9KSWRT?=
 =?utf-8?B?dUtORFVHVzNsTVZEaUh6Vnc5dWx5QW1ueksrc09QMEN3UWx5ZnZKeW5xU2tD?=
 =?utf-8?B?bDlld0FMZjNDb09RakpjTmRYQlE0cEI0MEE3QnV4aEdHN1lwcFRKekpQOXlx?=
 =?utf-8?B?WkMwdTFvQzNZd1FBcms5dFR1a3JJeVc1U2pHRGJhYmxkdXhuK1R4dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57f8221-149a-4d8d-0ae6-08de94787758
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:37:05.4753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhSNW/njCtYccx7IUeqzIXaVAUf4fglGqawkJvZ31Qg8cgOlpu+ERg7mklp7Y7bLgMhejixqjCChVK1sgDo9/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_003712_545750_F6E9E75B 
X-CRM114-Status: GOOD (  28.13  )
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


Hi Jacopo

On 4/3/26 10:19 AM, Jacopo Mondi wrote:
> 
> 
> Hello Antoine
> 
>     in cc Jai and Paul
> 
> Jai and Paul are working on upstreaming new ISP formats which would
> benefit from usage of extensible stats.
> 
> No pressure of course, just wanted to check how things are progressing
> on your side. Do you have an updated version of this patch which can
> be taken in ? Should we sync and work on an updated version ?

I'm still on it. Things are progressing well, but little bit delayed 
because of neoisp rework. I hope to submit patchset (v4l2-isp + neo) by 
end of this week.

BR
Antoine

> 
> Thanks!
>     j
> 
> On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
>> Extend the v4l2-isp extensible format introduced for isp parameters buffer
>> to the statistics buffer as well.
>>
>> Like for ISP configuration purpose, that will help supporting various ISP
>> hardware versions reporting different statistics data with less impact on
>> userspace.
>>
>> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
>> definitions, with similar header, versions and flags. V0 and V1 versions
>> are provided to match with params versions. On the other side, ENABLE and
>> DISABLE flags are not really meaningfull for statistics purpose. So VALID
>> and INVALID flags are introduced. Purpose is to force ISP driver to
>> validate a statistics buffer, before it is consumed by userspace.
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
>> index 779168f9058e..ed1279b86694 100644
>> --- a/include/uapi/linux/media/v4l2-isp.h
>> +++ b/include/uapi/linux/media/v4l2-isp.h
>> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>>        __u8 data[] __counted_by(data_size);
>>   };
>>
>> +/**
>> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
>> + *
>> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
>> + *                          (for compatibility)
>> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
>> + *
>> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
>> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
>> + * format.
>> + *
>> + * Future revisions of the V4L2 ISP statistics format should start from the
>> + * value of 2.
>> + */
>> +enum v4l2_isp_stats_version {
>> +     V4L2_ISP_STATS_VERSION_V0 = 0,
>> +     V4L2_ISP_STATS_VERSION_V1,
>> +};
>> +
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
>> +
>> +/*
>> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
>> + *
>> + * Driver-specific flags should be defined as:
>> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
>> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
>> + */
>> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
>> +
>> +/**
>> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
>> + * @type: The statistics block type (driver-specific)
>> + * @flags: A bitmask of block flags (driver-specific)
>> + * @size: Size (in bytes) of the statistics block, including this header
>> + *
>> + * This structure represents the common part of all the ISP statistics blocks.
>> + * Each statistics block shall embed an instance of this structure type as its
>> + * first member, followed by the block-specific statistics data.
>> + *
>> + * The @type field is an ISP driver-specific value that identifies the block
>> + * type. The @size field specifies the size of the parameters block.
>> + *
>> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
>> + * driver-specific flags specified by the driver header.
>> + */
>> +struct v4l2_isp_stats_block_header {
>> +     __u16 type;
>> +     __u16 flags;
>> +     __u32 size;
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
>> + * @version: The statistics buffer version (driver-specific)
>> + * @data_size: The statistics data effective size, excluding this header
>> + * @data: The statistics data
>> + *
>> + * This structure contains the statistics information of the ISP hardware,
>> + * serialized for userspace into a data buffer. Each statistics block is
>> + * represented by a block-specific structure which contains a
>> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
>> + * populates the @data buffer with statistics information of the ISP blocks it
>> + * intends to share to userspace. As a consequence, the data buffer effective
>> + * size changes according to the number of ISP blocks that driver intends to
>> + * provide and is set by the driver in the @data_size field.
>> + *
>> + * The statistics buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Driver shall populate the @version field to
>> + * inform the userpsace about the version it intends to use. The userspace will
>> + * parse and handle the @data buffer according to the data layout specific to
>> + * the indicated version.
>> + *
>> + * For each ISP block that driver wants to report, a block-specific structure
>> + * is appended to the @data buffer, one after the other without gaps in
>> + * between. Driver shall populate the @data_size field with the effective
>> + * size, in bytes, of the @data buffer.
>> + */
>> +struct v4l2_isp_stats_buffer {
>> +     __u32 version;
>> +     __u32 data_size;
>> +     __u8 data[] __counted_by(data_size);
>> +};
>> +
>>   #endif /* _UAPI_V4L2_ISP_H_ */
>> --
>> 2.52.0
>>


