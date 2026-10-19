Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF3CCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVr1yQ0PO5W29Dx2sfENrEJooi9zxIkZsucVBMg06RE=; b=AQIzFpoB4Aw92Q0vvMnl8FpnAv
	ZX5H1hr2o3bZiuIlDnPKINP2pP1RPrxC39JNJ2DYr8f9ZC1xB9ysg9pz2IobA9w3tbZy28LPsDIX7
	WB8k/ZA1lVQHNihqidgbPOWBd/ceEqhZ/76uh4Igf/dkO3P9CiGC/XGiFrqd5/W4ahty8/WSb56X9
	XGWIQTsoBHQHGHxJ/6jMZz7RFzy66CqGltZuPX2r5Mnyig7sp7h0zJBUtF1ytMbigT0NZLedtik+B
	aN8kJ8mAuH26hvjTBoTx17kgs47fSvrbLOgI9yZBCVX7SSlv2ZNzV3/8TGrUxbb6HwGQhOfvx/pxY
	lwqrTX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIe2r-00000006WwS-0z19;
	Mon, 19 Oct 2026 03:28:17 +0000
Received: from mail-japaneastazon11022087.outbound.protection.outlook.com ([52.101.126.87] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIe2o-00000006Wvn-2Apd;
	Mon, 19 Oct 2026 03:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK0Ddl6+vT3+VCNKWjtIYrsOzdTivDiBdAorzPNXY5pzIh9KahaTwparjd1sjn/BKEFn8tnxJkbl+k/A1/63fMbtN3aqOP1AhGYM4RiuRuFhwnTQt0oHkbz0/hq2vfXG9jxMjLrK+T83lA9KZa9i4twrlaAyJVzw89BNL1Wg8KFIPCvcglFN90opbNJTmEeYrNGtwVDvUCeUPC5UIRpPrIjSu1RXMrrXcVB9HYMWT1A0JZRb1utq1zZYqE51zhifOS0HXeZ1nbulq01j5AtqaNzZbT2hgRY7b4vRpovu2R9xbSQwEGrwC4Ma2GibdroJXdjL7yl84/GU2+h9eQNLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVr1yQ0PO5W29Dx2sfENrEJooi9zxIkZsucVBMg06RE=;
 b=QJJDLqzRXJXUPihZCxZQVCqxRvxPIVLJB2yYIYjxuoY7vjm9qEXOnEnFld3hTo/qemwyedKVPUrgAgmhXwfkSKxrY+GFFB2WqjvVtf0sTy38MEZVoetAzvLOZoQ+wxuRhd3H+Zq2g/6tC5xm0QrZ7XrNrd/O5Xbm6dYbOAKESK4FUrFN2hXXTf3fhO09vJM9OpRxWFOUaTQr930WbV+1SJ5TxGnmrNyY9fuTvQsixedqHvGyhgZp/kSuvt+gzDBnk6DOmKqT6m1wj142OORyYGkQz6+2Xn0a8q4NhZIktuuAjeJ/5VGC7butfMHSLjpq9kykLr8GKHTZpU+iwjahGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVr1yQ0PO5W29Dx2sfENrEJooi9zxIkZsucVBMg06RE=;
 b=EDbNjNSGExIsCqHhM3oHKB1fhtSktQjP2MdNTQKgf07tk4pFoR94QJuG+MxIS8L/JCxF0wiHxZbIcWM5EGsc7FO+y9VN2e2I0l3yNRxHX2WsL3WTjlWup/7kbZYRi9utfG1abcUC9kpBorpcJpyKR44W3uH0CB+4rKFx8pgrkUKGAURCPQA+ciw/cXclO/6AD16v9h4q5Dusv6pxnay7qxc1+XNDw5CPLaNH4T2LHnMPZJpxmKixGjlEqbTcoMnSBtPt890Or5GGU+kc49C5Rs1sPa8wzz85Q8Rwaj44COd2x3htIBruLILesJrjG0nu5vmav/opxcNrSPFQbItFdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8449.apcprd03.prod.outlook.com (2603:1096:820:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 03:27:56 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 03:27:56 +0000
Message-ID: <56e90646-f48d-4c85-afa0-80e09a21239a@amlogic.com>
Date: Mon, 19 Oct 2026 11:27:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
 <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::13) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f348cec-69a7-4097-a2a8-08df2d90f772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|56012099006|4143699003|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: wGo+dTr4n6ipfksjdg8MQ1MXTG+UwPaOrgEIjTCja3mmcvT/W69qV2rZbU+12e4hb6m3aBsDd+D8l928ypYHMzmNWCo8tPr7sfUJmPu1T1TyvV84nzrni0EFubASHjgsQ/Tdcl3/Xh+w4drXyZk6uMlPvd57gv/6IU0QIKn3WxuuktCP/fb6EdP1mfuYPGsnUzLZxsupOY0QetNKZGUJtj3K7ok3sCfesga41sw1YmL9x1/w/uQhU/MTJsUUNgA6DGzwdJFyOzu0wT6IWiz4+hEsE7GDQOY0OzsIe0MBr8iW7sswgE7coWCmj+j/qoM+S9xNgHQ62S/TAdB8NaQ+c9LtILodpOfBbpPm8Ll1X+vwrlPOLxki66zV5Uus5clZWsz6NENWIs4/2GHxbC4SHdpcbmFbZBS+5BQiC4Kw/2Gdv4uHq+EQoBNguMphHglUpRQzBf33ThZG93Z/1jOYVvBPTTJZnU4ZPf2l4/chDYu43fZAcaDEgL7HcF/Z9v+cB3/wWm4MpdHKsdZy2GjYXVUyPTkL6kk95I69KmEjmYcUG16R2iDG3vycul8s7NaG5iT2Qs1dEXkcKmZb5ll1dfCxGL/TKtuauMB1KaOXVJKCH6Y+Ks663m2isGQH1KuTAiUPJGlJNsHV9s+OKL002oeWuMD1VYlw1uF2TI+PiIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(4143699003)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5rbGdqRzNLekFERXUrVFpRM2xhRERXZStmQ2djK0t0d3lqNXQ1d1pLcjhv?=
 =?utf-8?B?dVZZaW1ZZ2MrRSszcUFSRHRrdXlyZ3FGQ1Z1QWlURy9OcHVES3JseW91U0RB?=
 =?utf-8?B?dGJyZVdNUnZkWFV1MmhnWmhIOFAzbUNTR0xmM3MvTlJCUStHMGR2ejZIbFhT?=
 =?utf-8?B?bnBoYlBrd1FsUk5NL0NERm1QdEg0aTEwQitRZE9tVFpiMklIUVBXSnJoNzhL?=
 =?utf-8?B?MzRyczd0U085dGg0TFpKaHRRYXJzazlzWkUrMzZhbkpkdTVNN2JsWVprZ0NN?=
 =?utf-8?B?R3lTUElieFJPZHRqVFlpNUlGREQ4bnRFaTVqR3ZLd0oxTzRCb2NLV3RzZ1BC?=
 =?utf-8?B?RVI1aE9vUzRWZEZmUDBESExWdDdPeHQraXdGMXYrUW9OTXVLVlVLT2ZSNUxv?=
 =?utf-8?B?bmI0T1Rhb0lveUg5T1B3WEo4ZVY1NzJZUnl0WHNzdm1xRnlrazdIZ3hHTGcx?=
 =?utf-8?B?dnFuTmZzWWN5ckZacTlnL0RmVVBiM1U1K2ZtaTNFTC93ejloYlBaeFY1Mzll?=
 =?utf-8?B?bXYvbnMwZTJiaHVXNWZna2F4dTd4RHliUlg1UXpEd1U3TVVFL3k4Sy9oTGRn?=
 =?utf-8?B?MUVabGxrWmo0elJvMTNLREUxdjNpWUt3a3Z1c0ptZ1RlNDU2d2V1anl6ZExM?=
 =?utf-8?B?Vk0vNHUweGdkek9JVDBoSjFSUS84aTdZQzZWMzNzTkZJOXdtdmNzMXZUTWY1?=
 =?utf-8?B?eVpOTnZVL0hqQXZKWFFwb3ovN2Q4L0orNXRIRkNlVUtndExxdFBqdkE1aVAy?=
 =?utf-8?B?a0NkLzYvR2Zxa2J0cWtOQjVEajJBdUorZEpLQ25JOHpPSjN3b081L2JwT0Fw?=
 =?utf-8?B?OXNGUEFFbmVmaVRVVGdUYlFzbElySlUxeFB2eDJFWDcxTWRNb3pIZmw0WmNp?=
 =?utf-8?B?ZlB5cis3MEZHZXF4bEJWTDNFVGxFak90V29tWVU5RVF6NE1ScktUTWRUZDdU?=
 =?utf-8?B?a3hvNnVKUnhGeG14VnVoT3huZTJuQ1E1b1hvUjRpTWJtcFhYMXhBUTBCQ0Rl?=
 =?utf-8?B?RnYzelNLb0huM1NHTE1ZdzRRRDhObFRkQm5NK0V3dG9zdktzSlBrcWd0dUs3?=
 =?utf-8?B?cnM5ZW5sczJvdUdmanp3RWowMXNYYkhiRkF4dHQrWjcvTktjTkw4THJSOWxm?=
 =?utf-8?B?UzJYczV5V0ZyZkxJRzVrLzIyVkVsSXRrQVFDdUNCMytQMVN3emkrbFVnbDB3?=
 =?utf-8?B?MnhUckoyNStiRmc3dHR0ZS9zZnFXMVM4T0xITFhGTG5SME1wNFBoV3BUb0FD?=
 =?utf-8?B?Wjc2MVNqMzJrU0dqVXpJcmtXOFMySmpVcDl5NDRwa3NyN1RvbVZqVWpGMzZr?=
 =?utf-8?B?cmNoSW9sY29MWDRKKzluMGdlc0xCcWJtVmFRL0xtWklWOFFvMnpjVEdIMjdM?=
 =?utf-8?B?dE1mai90UHJVTm5GOFQ2bjZPeEVZcnRGaVpQZGhMZHVLVDg3M1dqV1pOQ2tJ?=
 =?utf-8?B?UEdBOUEvUDUzTEg2Ylgwd1VjSk5JcjNGWHNsN2xlRmxnWjF4cDhXeHF2V2Mx?=
 =?utf-8?B?cC9Md1RKZk5LeTFoaTVrK0kyeGcyaEpGRWdORHp2ZFNzMUUxWDJEY2Z6RHhx?=
 =?utf-8?B?Q3ZBcnc1S0p4RHFRVWoyd3E0WXNxT0c0YUt2cUcxNDh0UzVNNWhtMCs4VXBI?=
 =?utf-8?B?ZWNBQnJwTElqbGpyNUt6QzBEYW9TcXRLUUozdGkxT0pscURlY0NUcHk1T0Z5?=
 =?utf-8?B?eUU3azFUUHNUYXJLZ0xzV3phSUhBVXVJaTNtVVBKb0h5ekJmWjNqbVdYQmRu?=
 =?utf-8?B?SUJSdGp2cDVtMklTZEF5WWxFbWdhalF1YklRZVBHZ05XMUM2YnRVVm4zWE5h?=
 =?utf-8?B?czZvYll2WDd4K3lkeUhtZTJOcHVxQklsUUlCZytUUWhpQjJJQ1lBSHBEWnJO?=
 =?utf-8?B?NE4wUVI2NHRSVXJsWGJnQ0xtdXRDZi9lRGkvQWFQV044aXRqWUYrTWJWeDhK?=
 =?utf-8?B?S2VheFppZTlYTDM4YUhBR3FJNkl5R1dxc3RJb1BmeU9GM1k4WURBenZXZk02?=
 =?utf-8?B?YzhtZDFOby8rUkZtOXErUkhsbzROYVdLWW5kOGVPWDJzS0UzaU5ERWdManJs?=
 =?utf-8?B?T292SlE3T2FWWkJIS3ppdWM4WUxoUU9RTFJzTW81WkpmZCtVZlRlN1VIalJZ?=
 =?utf-8?B?UG53NHVVdUpTOFNJNk8rdVdvaEhjaTEzdlJ0TjZFekg3d2ovRVB3QnBZTkJv?=
 =?utf-8?B?aFl5SzRoenNhZEVBMVlwWlV1QkFJWDAxL1kyYmNRUW5PRnkxa2R0eE1heGlm?=
 =?utf-8?B?UW1zLzMyN0VUVDJsS05GWkpxYlNBYnZRUCs5UGhIVS81S1pKYkt2UW10aTJF?=
 =?utf-8?B?TmRsaHViV0lJUmNGcEhrNldDcG9hN0FFdmdhVVo1OFEza0pBM0N0UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f348cec-69a7-4097-a2a8-08df2d90f772
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 03:27:56.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHwP8pKjd4t/IUQN6D7xNFeGoAmVECryb0S9nlcVDlJ37+oV0jOPwu+vqQXAbrnXu9yHj898lf17R4mQzaiQERYdMTHmCRUELoj8hZIKDvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_202814_569313_2F5184A4 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Lucas,
    Sorry for the late reply.

On 2026/10/4 22:06, Lucas Tanure wrote:
> [ EXTERNAL EMAIL ]
> 
> On 24/09/2026 18:21, Conor Dooley wrote:
>> On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay 
>> wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add the T7 compatible to the Meson DWMAC binding.
>>>
>>> The T7 DWMAC controller requires the following compatible combination:
>>>
>>> amlogic,t7-dwmac
>>> amlogic,meson-axg-dwmac
>>> snps,dwmac-4.00
>>>
>>> Add a conditional schema check to enforce this compatible combination
>>> when amlogic,t7-dwmac is used.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 
>>> +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml 
>>> b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> index 5c91716d1f21..b529ca5577a9 100644
>>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> @@ -23,11 +23,24 @@ select:
>>>             - amlogic,meson-gxbb-dwmac
>>>             - amlogic,meson-axg-dwmac
>>>             - amlogic,meson-g12a-dwmac
>>> +          - amlogic,t7-dwmac
>>>     required:
>>>       - compatible
>>>
>>>   allOf:
>>>     - $ref: snps,dwmac.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: amlogic,t7-dwmac
>>> +    then:
>>> +      properties:
>>> +        compatible:
>>> +          items:
>>> +            - const: amlogic,t7-dwmac
>>> +            - const: amlogic,meson-axg-dwmac
>>> +            - const: snps,dwmac-4.00
>>
>> This is not how fallback compatibles are described.
>>
>> Instead of doing this, which affects all other compatibles in the file
>> by allowing dwmac-4.00 for all devices, please do this the normal way.
>> dwmac isn't special, it's just this binding that's weird!
>> Can whats currently in the binding (before this patch) be largely
>> replaced by just doing:
>>    compatible:
>>      oneOf:
>>        - items:
>>            - enum:
>>                - amlogic,meson8b-dwmac
>>                - amlogic,meson-gxbb-dwmac
>>                - amlogic,meson-axg-dwmac
>>                - amlogic,meson-g12a-dwmac
>>            - const: snps,dwmac-3.70a
>>            - const: snps,dwmac
>>        - items:
>>            - enum:
>>                - amlogic,meson6-dwmac
>>                - amlogic,meson8m2-dwmac
>>            - const: snps,dwmac
>>
>> You'll have to check this yourself against the amlogic devicetrees and
>> see if this is correct, but with this you should be able to add your new
>> device without doing anything special.
> 
> I have the same patch in my T7 work and checked it against the amlogic
> device trees: meson6 and meson8m2 use the two entry form, the rest add
> snps,dwmac-3.70a. dt_binding_check and dtbs_check are clean. The example
> needs fixing.
> 
> Xianwei, from my VIM4: the MAC reports Synopsys ID 0x51, DWMAC_CORE_5_10
> in common.h, so the core is 5.10a, not 4.00. And the controller reaches
> DRAM through a pipeline stage. Nothing claims its gate, sys_ampipe_eth,
> so clk_disable_unused switches it off. My node lists it as a fourth
> clock. Does the AN400 differ?
> 

 From the document, the core is 5.10a. I'll ask the ethernet owner about 
the clock.

> I will send my series today so the code is on the list. Not a race: I
> will drop or rebase whatever overlaps once you tell me.
>

I'll make changes based on your submission, I will drop ethnet later.

> Thanks,
> Lucas
> 
>>
>> pw-bot: changes-requested
>>
>> Thanks,
>> Conor.
>>
>>>     - if:
>>>         properties:
>>>           compatible:
>>> @@ -38,6 +51,7 @@ allOf:
>>>                 - amlogic,meson-gxbb-dwmac
>>>                 - amlogic,meson-axg-dwmac
>>>                 - amlogic,meson-g12a-dwmac
>>> +              - amlogic,t7-dwmac
>>>
>>>       then:
>>>         properties:
>>> @@ -93,6 +107,7 @@ allOf:
>>>                 - amlogic,meson8m2-dwmac
>>>                 - amlogic,meson-gxbb-dwmac
>>>                 - amlogic,meson-axg-dwmac
>>> +              - amlogic,t7-dwmac
>>>       then:
>>>         properties:
>>>           rx-internal-delay-ps:
>>> @@ -139,8 +154,10 @@ properties:
>>>             - amlogic,meson-gxbb-dwmac
>>>             - amlogic,meson-axg-dwmac
>>>             - amlogic,meson-g12a-dwmac
>>> +          - amlogic,t7-dwmac
>>>       contains:
>>>         enum:
>>> +        - snps,dwmac-4.00
>>>           - snps,dwmac-3.70a
>>>           - snps,dwmac
>>>
>>>
>>> -- 
>>> 2.52.0
>>>
>>>

