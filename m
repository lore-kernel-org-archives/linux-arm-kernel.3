Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B3FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3tSoyW+LYT3gQQDJzJYCtIi3L/NAx18SaVD//CZMb8=; b=hfUgGi9pz0Or2Ee2ddySfTYdHM
	mG8mP+z8JNq0UezwKSgmTpCuM4CFqxUjrOphX4xuT9FZ8/ydPDhGZSh04CkGIfVhJPvA0KC5D29jJ
	sBG4yIKvzFNASVADPxo4XXIasTCJVuJIqnOAsm4yQAEmUXLcrGpgUDFM8sQmffTCc6vEnZNZkU5ty
	t7JGU8fL53zi+pAjrQU2wfKIBpVf72oTNQnfyEqFqaCXWzE31OAQ3MkhemtabGTivDevMmYb+lloC
	+LuAZoPmqqGicePV1sMfRI2uNO/WPb3nDag+qkXLK7E7BOmYqunUBXzih8zXPX3IFgBOCFcczO/FE
	tlIgYMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYWi-00000004fNx-1WBV;
	Sun, 16 Aug 2026 10:55:40 +0000
Received: from mail-germanywestcentralazon11022093.outbound.protection.outlook.com ([40.107.149.93] helo=FR5P281CU006.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYWf-00000004fNZ-0pDk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 10:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0tAC/hRFD1jIaCksk6vfrtdAJakgEPYYKrIKrlwPpVTgzl2EXKLFpX3THLZbMdYCddndd0fGbpoES1QnJm1BRRGZnbEitDYQP6R1SvZwaZ9USRS6AOrG2p90yvjE4SRp4W8PAtlymKo6ScTJRMbwR+3ssm1kv7ZoF8whNLJ3PTJbXyockC224ixElCtJ+EKYs9LIOSDumExn01CKd4hcJ5bJDKzm1yT/TrWkOAxBtMAQc/VpY8A1kDqyVHC8fywwKY1wwrUjySCMkmS6Vq96DJUaco5ngbd0ifAqm+JQi1gxNJJv+wBipkkE1WWNNG/cdaAjTV8bP1xFURmf1BYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3tSoyW+LYT3gQQDJzJYCtIi3L/NAx18SaVD//CZMb8=;
 b=h01cbilMzx/NcRtVC+/9Op5hZhZ7G6jE8N3EuxvulvanBhQdp0oTzRL5+hT7DzXgegzokvOWWPS8K7ddahjiRr8q6bAU6lzOCrgXVhwao0PMGY6BXncZC7MHxDNKFFeF2xg6LmDp0c6gHeA0ed514JZRxqyYUan3IOULyzW8YqTcu+7qx+uSuIDObVeduyNyng3F9FuEQ6Ul8i9DK7NehiYsFZ6HPuoC6OUyA+DhY0g+5Z+TppsklUueFi6ANGTwAInGPnv0thL9if5Ngwygogj5mxU1hDdQusgYjp0PvXSaR5aRkL/62wPBzBf42aHC3SyJ43ldF0MiKpKnhEJjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by BE1P281MB2467.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 10:55:26 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::aa8e:db31:b886:2365]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::aa8e:db31:b886:2365%7]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 10:55:26 +0000
Message-ID: <4e653068-5ef1-47db-8e4e-3b535751e47f@siewert.io>
Date: Sun, 16 Aug 2026 12:55:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
To: Zev Weiss <zev@bewilderbeest.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20260812-ts-x470d4u-v3-0-c8e266f1663b@siewert.io>
 <20260812-ts-x470d4u-v3-2-c8e266f1663b@siewert.io>
 <8b7dcb07-2dfd-425f-8ff3-06114e45c676@hatter.bewilderbeest.net>
Content-Language: en-GB
From: Tan Siewert <tan@siewert.io>
Autocrypt: addr=tan@siewert.io; keydata=
 xjMEXY4MwBYJKwYBBAHaRw8BAQdAdDPxHO4UUyhKcZXkztTv4iVAbjk/+F8ayCYnegO4q4zN
 HFRhbiBTaWV3ZXJ0IDx0YW5Ac2lld2VydC5pbz7ClAQTFgoAPBYhBJ1bd8XzFb0F9Kx5LnjQ
 kBYSrhG1BQJnqiY3AhsDBQkSJuqzBAsJCAcEFQoJCAUWAgMBAAIeBQIXgAAKCRB40JAWEq4R
 tbtDAQDyPybWLk2EYMeY+vv/WID8hk18+jp3fZCNp9aJp9GkJwD9GeQNvCO1LPDUjkMQqf8d
 DgMM9pmsvbJUFfViYbflbQ7OOARdjgzAEgorBgEEAZdVAQUBAQdAjtzTYeMaO9yG3M1uBtQy
 JB57UJXf+m+mNDhWkOY69DADAQgHwn4EGBYKACYCGwwWIQSdW3fF8xW9BfSseS540JAWEq4R
 tQUCZk72AwUJEibqwwAKCRB40JAWEq4RtUkGAP0R8RmddZqdGdqdod1MkVXpw/z5OOptToXf
 za1W8nsGmgEA5gvQzkN1LJ8oP9LB8YGAmJt82tPvJCmi4WzesI53kQY=
In-Reply-To: <8b7dcb07-2dfd-425f-8ff3-06114e45c676@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::15) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|BE1P281MB2467:EE_
X-MS-Office365-Filtering-Correlation-Id: d091bf97-7505-4c0a-a0a8-08defb84e0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 8yzS4LDNJoPn3i4GeYGtnqV4XkB5cJuHRy9h1XddKVDpsDprlmaoqh3VNGuvAJnrbjERGoLlkDSHWQgL/rTDSKr6obCG52uhYLQU0NqW+BLIfLhBibRBF/BRnABFC122LXCM6Iim4whpdERtwefYjfOXog7hlxuI7hz6NXqa5tgTpKsDl03ZnSKat8xq/lBvzGuBQWzVlqtzN1/yNEpPW0PDE7IS1peQuWoZB8Lw9bQmUUsCZKGHgOj/e5wi3bwLE92O/2AmWn+Sa69f92n8BB7okY1W2y8T+10mzGrhKuHWLvSK4oqH1LAR6J+KwPAx7nYXPQhFw8qaDHk4DTh9aI0XrpXjgcrmv3jmD+uBsCSCf7739I+ptZGG3QDZZYmKzP9GhtySGi16KKhdfncARj/4azqBQWnktsmKvsYaKpMYP5yhEtWP0Ro/POUkCqQvWKEX8iMaVqFJWJfquTw/uyLsdiuV64nrKqnOX3qlpRqqB2sDf1jViIDDk0E9kEzWptQc9zjTycFDsQJHX/uLgUr7kQGAyAXX8UlPiJ6gl5H7doGcPqVguE9nLkJNHsMcCiFEsWEG670coQANER8zi0kWOY3t7aBIAfoxMMkHeYvZS2TV2kLOIZ4YDf0xhODGrbw2fuyjjhG1x6lnOcalYz+armTUKP7CThWIq0+EBg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VGMmoxWEx0bDhYQll1eUNTdERMZWpUUEoxSCtySTdlRUxkYW0ycnlTUFJZ?=
 =?utf-8?B?Tit5dy9uR2VzdFM3UE5taloxd0NUWjJIVnZWMlJkbjM1dzc0eTc3cDF5cE1Y?=
 =?utf-8?B?NGhDVWxhQ1NiQnRsdmo0c1FtT3BENHgrVlg5WmZRTWQ3OHZCaWJId0FYNHNC?=
 =?utf-8?B?U2JKTENabUo4UVVhTWY4RnV5ZWt6MFdMRThPNUZzK0JLWWNxRWZBNWVuczBS?=
 =?utf-8?B?anZadGVkbTRvTHRBL3VjdDhaUkx0SkJkR0Z3bXVKcXVsRGI0M1VOQ1pVUlI0?=
 =?utf-8?B?Um5vTDRKdXMrdE0ySmk5czRIeDRvUmdrcTU3NVBlRFplM2RMRkUrOUJrMDRW?=
 =?utf-8?B?Y0NSbXJ3aXdKOUNaM1FkaWhOakp2aVlCU24rV0VVVlAwckR6T1pTaGVncUJk?=
 =?utf-8?B?SGxQOUtoNUk1Mlc0TC9wMHJlS3prTnE4ejlLdVFqU3RQMjlROTZCZTBPN0h3?=
 =?utf-8?B?Q2pja3VJRnhlYVplTm40U2Z0V1JnR0ZYZlRvK0FlTnF6M2FZZ1RXdUZ2Tk1V?=
 =?utf-8?B?OFQwQStnbjFlN2krR3hoVlhqVUsybnBlZlhjbzU0alFQL1pTVC9IY3NrOHFQ?=
 =?utf-8?B?OHk3MytLNHlvMFVQeUgwQzJYN3QyZW5VaTBJZldNRCsreTFyR3UzZUQ3TC96?=
 =?utf-8?B?aHFoQ3VDTWVDa1AxcjVzSWdjY3dBMkNCVGtGbTFZd2orc3kxK1lhSEV1eS84?=
 =?utf-8?B?TVdhRjA1bmVSRnNkTkNMaG9hSHhzQjh4d1lnV2cvVmhtdklxL1BiU0tvU2Ir?=
 =?utf-8?B?UGRxMGNJdnhxS2FFc2xlLzgwN0VHbjQwZTVOUVllRy9qYklnNVpDKzZ6bzJS?=
 =?utf-8?B?MDRuc3NlcmdObTlJOS9SNTZZLzhEcDdScmV5ZzRUN3pWME0wNWJiN0UrNGQx?=
 =?utf-8?B?bkpaUU1GSkNzRDlSbEd4NWlNWG9mTU9vSUp1VU5XT1dwNFJFMEV1enEyRkVU?=
 =?utf-8?B?N01WRzJLOC9tcWVISEMyQ2lyTVVmMUh6TDRhT1d3c004NHdHWGRrWXd2dWZ3?=
 =?utf-8?B?UitodVdXRTRkNFZEby80cWpTR2ptZVp2M2JHdlU5RVY3R203a29UcnNza29o?=
 =?utf-8?B?VEdlTWZrc0JDdWdFb3daVXpKdElnVTgzbVo1aWRSUUx2SzlRVXZJaXdzbzVa?=
 =?utf-8?B?eDVqL05JT1lQMFBjeFVWci9vRnpVbm5JbDVKVjk5NVBxd3Q5ZkU5REN2UHZ4?=
 =?utf-8?B?cGhnaEVlMzFrV0ZubzdOZkppWjhFQkc5Q3RtQ2VNR3ZRQmlBaFlzdWQ2QVd5?=
 =?utf-8?B?ZXJNampPSDRtMXQyeG5qZnFDWDRXN251V1k5ZnJOTzhsQnR0c3U2alU0dEtT?=
 =?utf-8?B?bTlUdnJ6dG5wcmxCbUQrd2hYSStPajZmcDVkdFNTVUdXS09GeE84TnI5d1k2?=
 =?utf-8?B?SEFlZE9aL0NydUg4SE1jMlNNclhBTytTYWFyWDJ3ZGxxZnEzRTVRc1BFMzMw?=
 =?utf-8?B?TVliakg3UmRJSEFacFhJdklyc0FxcTFIZ0ZvTVJMdWxMTURnRmFMQ2hvcjd0?=
 =?utf-8?B?eXowMUFjYmRqRlBhRHgxQXdIaE1nVTE3UlRaT2VJWG4rSjVoZGVqRDRBOWVF?=
 =?utf-8?B?OVJ2MVlET04wajRIaG9adWQrSFhWVHJ3c3N5aGQvSTlvbHVJRGRRU1UzRmov?=
 =?utf-8?B?cld2MmFNRUkralluOW5tcFlsbWJwZlR0TkV1eFdSYUJhMzkwWXAySkN0MUIx?=
 =?utf-8?B?QVhCZFd2OXdYVE5jVlJiQ3YyYVZlSGhxcENydVFSclNsRkZ4bXVwajhWbjRJ?=
 =?utf-8?B?ak9lRWYrZjRqY3hpam5ocHM2d1R4WC9iL0hpRDJaemtiY3djSCsyay93a1Bo?=
 =?utf-8?B?N1lZN1NYc2RudDNtLzZ6SjRIZWRac09nMmg4UXYyQWVibFVEejloWkx4V3Fj?=
 =?utf-8?B?YXE3WlNjekx1UXpGMGRSZk5SOVZMbWthME1aY2lNWDR6bXdPS0pIbHV6Ynl4?=
 =?utf-8?B?VGJFdjR6dnNTR1B1aVQwTlZick52Q01DNWpFdjlPQndqK0VPeGcwZkVvZXRl?=
 =?utf-8?B?Zk1HczRrNmVpcDNNMURSaGFhTEtxV05sbW1SWnQwUWp2U1lUUzRQRHdjKzVX?=
 =?utf-8?B?NFhianV4c3o5WHhkaWlSZ3hCbUQvbFRBRTFsYnRZMmZuTW1mSXJZbzR5ei9B?=
 =?utf-8?B?aXFmNWhud0pqMENxeEpENGErSlJLOENEUzk5SHJYSEgxWE5xdWR0SWxBd1JV?=
 =?utf-8?B?MTQ3NWZ1Z0hXZmRSeEhuRkU4cm9jTzZWQjVQYm5uV3V1eEllS0tRbFZHRWlC?=
 =?utf-8?B?WHhUVmlFRGZxc0Z3RzA2TlFLWDlsY0M0SVRqNTA1STZKdHhxc2RhcmhiUmpU?=
 =?utf-8?Q?p/cIpq0oeu26BXm+2E?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d091bf97-7505-4c0a-a0a8-08defb84e0d1
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 10:55:26.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZygdE7uUyLOM2sIJEYRCvm/rUix9KkKQG8E115rYl+K4Q0PDuSIF/asORPLJ0GY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_035537_244254_1E52AD92 
X-CRM114-Status: GOOD (  17.98  )
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

Hi Zev,

Many thanks for your review!

On 16.08.26 06:49, Zev Weiss wrote:
> On Wed, Aug 12, 2026 at 01:28:27PM PDT, Tan Siewert wrote:
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u- 
>> data64.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u- 
>> data64.dts
>> new file mode 100644
>> index 000000000000..6f11aeab087c
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u-data64.dts
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include "aspeed-bmc-asrock-x470d4u.dts"
>> +
>> +/ {
>> +    compatible = "asrock,x470d4u-data64-bmc", "aspeed,ast2500";
>> +    model = "Asrock Rack X470D4U-series BMC (64MB store)";
> 
> Nit: for consistency with how they spell it, and (at least *most* of) 
> the other aspeed-bmc-asrock-*.dts files, I'd suggest "ASRock" instead of 
> "Asrock".  (And IMO s/store/flash/ would be a touch clearer.)
> 

Agreed on both, will fix it in v4.

> Also, looks like the other nearby DTS files pretty consistently have 
> compatible & model in the opposite order, so matching that might be nice 
> too.

This is something that was reported by `scripts/dtc/dt-style-check 
--mode strict`. Depending on how much time I have next week I'll look 
into fixing the dtc offsenses for arm/dts/aspeed (tho that'd come from 
my employer email).

> 
>> +};
>> +
>> +&fmc {
>> +    flash@0 {
>> +        /delete-node/partitions;
>> +#include "openbmc-flash-layout-64.dtsi"
>> +    };
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts b/ 
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>> new file mode 100644
>> index 000000000000..80fb2b7c1e0c
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
> 
> <snip>
> 
>> +
>> +    fan@3 {
>> +        /* FAN4 (6-pin) */
>> +        reg = <0x03>;
>> +        aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0b>;
>> +    };
>> +
>> +    fan@4 {
>> +        /* FAN5 (6-pin) */
>> +        reg = <0x04>;
>> +        aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0d>;
>> +    };
>> +
>> +    fan@5 {
>> +        /* FAN6 (6-pin) */
>> +        reg = <0x05>;
>> +        aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0e>;
>> +    };
>> +};
> 
> Just to confirm, skipping channel 0xc here is intentional I assume? 
> (Most other related platforms have them contiguously numbered, but not 
> all, so another slight oddity wouldn't be too shocking.)

The skip is intentional. That is what I found out during reverse 
engineering the SDR file in the vendor firmware.

Cheers,
Tan

