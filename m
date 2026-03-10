Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649BFEB1043
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhYmh9K23/uNapJfmCgqO6MCHGdzjFtZShb9vjLd9Pg=; b=2PjsQopp7Npbwa62o1IZREcI5+
	9avhgAGl9uEPYhIU1UPGYQUVshYqsvTiA6JaUrYmkrjIf+dIyOAFrwc4SR0FBW5b/IRpH/W542czG
	l5P9CyamslMuRql3YA6lHNpfQ0F+55jXoRQTKJnkg0gxMmOraH+DxlXHSGttGfvrlttcpq9BTU7e4
	h9G3PEEloUU+xyTFRGtDz757dcBgyHTLFVEjV1t0DZ4mw7lA/cHo4Gkc9u5KWsitRSKBFLTx60dEE
	S8Nvo4CteyC3XHtVKMfJmAQK6niN1aj6IETtr+hiv3Bn5P33aVZG5wE3jYHU8q7428XkhlhmDtgo5
	RRbfypZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuId-00000009C8V-2vAQ;
	Tue, 10 Mar 2026 10:26:51 +0000
Received: from mail-swedencentralazon11013036.outbound.protection.outlook.com ([52.101.83.36] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuIb-00000009C6g-1QSZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKV6Vq0WCp37tDrU4y4A279qWrjPgSmEdrLkmfmsVaGhm6cc4dhdNCEwdq8y9UpheLC1/ly15wKDqNq5eDLOBTECDrlSudwJX21e/Z87RK3q1acXBOYm4bC5luRV57m9IQM8Zi6g6d7oKejURPc4FUTWOgSo5WfrwL3uMhTruUInJWc7MlTbmqN7LHyJUDlKvNDDSG1ESjxfkvfUH9MW2m4vRcFJ8QDii2E556GAKOG2jqLrg+CXK25i7i5nYxE45ypWaDhQ93VHB9eriJ5x4rt9hkx6IJPTSX3LRuvkvAyrJbbpcXe5C7bZSiF9VOfOMXe6M5c0pZFdAUL8AC780w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhYmh9K23/uNapJfmCgqO6MCHGdzjFtZShb9vjLd9Pg=;
 b=AjuLMg/oX0goIzWTc8O6goQymgBf/5HX7WhzfqLH5+sJhwmO6n12LOfI0YPrK9J6Sa1VkhenHYxvXK1xnjrctCx299KH4P0xscMjFJ9LjlCBpy49xICuVf/aJs8YcHf9zoG8NW72OH8Bb9AJ2wUVZcB5PWM1qaFg1Gk/J6Kb/ftoyJd8v5TGg6ed4pJwn4j3hrnSYpClxDhlT2IdvQqTTNfEWY1jQDHs1jjNvTRKYHRg9J4dXgCU1Kz4UUd36J+XykrRDgioml3I1P/G6JzfKemZeU9a4AEmc3J2vgMCzU8eE/fKaODtL8hDBjq8tyEAlS/AMKEWrzlJl/TN93ITzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhYmh9K23/uNapJfmCgqO6MCHGdzjFtZShb9vjLd9Pg=;
 b=V2CZ3nbNSqAG4PHkuzOZHPeeMrgiI1lyzOrZ930N/xZoJTQLaQsLhfYJ9rUZlVMdMngE/dnvc4Fp88LoOG9zc/bjaJ3lX4hnhMwCzodmx/KFYFLt4Gmfk45DoZmNYFwKoqd+J8fWuJGCFdIYBKtS4WYz9EKVQYwshni2s4uYmgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8067.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 10:26:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.023; Tue, 10 Mar 2026
 10:26:40 +0000
Message-ID: <3455884f-b6fa-44a2-bba3-cd6024e3edb7@cherry.de>
Date: Tue, 10 Mar 2026 11:26:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing
 options as other VPs
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, zhangqing@rock-chips.com,
 sebastian.reichel@collabora.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andyshrk@163.com, macromorgan@hotmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
 <20260304121426.1184680-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260304121426.1184680-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 321695b7-0759-45c9-c97a-08de7e8f849a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: yB4CbA0GTl4aw2AnOtWDKwHuPOblxPmxgZFeVQJDrBVgs8slNs4GTMQ7lQpNMV55eIba+vsMiqGs9LulAgns6Do+RhxygN7J2+aHb7wMU9g6V8+FrM8Bf1S+Hv8ge2xI5y25EzTqBGRvNZWATOxenHG8ZEm82cj4LPyQBPwsCExskRD0l9mf2zMwo6YsXAMS+K3chQpC5+HQk8mXBcdGSTh2sFJk6Jy3vYYcCe6T/pAkuLo9VRj/c4Usx9Hwrl/GNuL7YE6ETGwn0XWb2nmG3iKpzv0pG3O3lYGhstyfamZ8MCP+s/L7yjBBuJOHULw4Pw2ALse8LXktmChKXkptTnpWNLU3gwXZy9UAzX9vKtszmg5XNY71pcMAAPYi2cydy64Y3YrfJnm+vKlv5rQgQbXlgP/YrbpEIAG1RNBeM/tiouAn1oUR63BH1tgdbzrDxvgp59ss6wA93haeIsTRobIOiGND/tuhO/qU1lRH9tRxELHWPcln5TnYfjCyg5sMJhVUWvQskMoO1ldhz1j31A5+/+ExTwqB03crlHjXciBN+DaW7LUwYUJWF+2c0uJwAjWlKO5treLEirV/ZCa93wau5FNok5yBCk4HmJoM4c7/s1KMPVUZhvuio6L5NmboHTB4Z19PrdMCzzhbtddio59G0hENeO/lbOLXLS5mUbbXTE5HQ9I/gNfjsuQgarmWn8FCEcfND0ReWqBTrJC1NBcgmRibjguO7CJxH1wjYDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnNEdEQvQVpsSkFlUHUvemRWVDR6ZXBablhmOUt4b0xaUmlHb0UzbEFyZkp1?=
 =?utf-8?B?dTg3VVg2a1E1aW9iKzlReU1hd0oxLzVmSUczajBVdU45MEltSjBrK1Y5M3ho?=
 =?utf-8?B?d2hPbytzcHdndktKVTRnUXF0Q3VYQ1V2YWJjMjZZZjdXRTZHTVBFOWJGcWlm?=
 =?utf-8?B?RXBCUXJTSVlzL043bnU4U1dUVE4yeDZjMDdaK2pjQjdOajdjcHl2b0doTmFS?=
 =?utf-8?B?dlVXZG5iNzNDUGxxdXFSV0wwVFBZZ0l3WUlrVGVmQ2x2K0M5UEcySytGRUpz?=
 =?utf-8?B?TXREMk9Fc0I0eWwvVUkxbjJ4Y2wveHlTUWR0djJuaWVxQXVYQ1VLZVFnbW42?=
 =?utf-8?B?bnZ1N092ZExmOWdjMW4vcU8ySFpJZzEwazVrMlJMOU0yVVZYdnJCTDY2V2Rn?=
 =?utf-8?B?dnRSK1hVL2haekVuTDEwQ3pWZXZyM1hTeHJGa0NiZStTYklNUTNsbFA1Y2Rv?=
 =?utf-8?B?SW96UTQ5cXJzejRtZU9xeHdGTnN0YU5BOVBhWnc4U3FwbzhpN1lTUlFkUDRS?=
 =?utf-8?B?bXMwNHI1U2hJeWwxRHJyM0xLQ1BrMlc5SlllZzlQVXlHclpFT25heWxOZ2h3?=
 =?utf-8?B?cGUzdkhkYTkvQWZ0TWpTNkFOdzN3ckZSMHJiaW83VVdBNWM4d1BIVGlxQlkx?=
 =?utf-8?B?czI2blJnM09HVDd5YXppK25TVjA4TERGV0g2STgvZm1vTHFTNjFtejJWKzFw?=
 =?utf-8?B?bWFaTFYwbHhIcGZOL1V1OExteEI0Z1ZaRllTZWY1M2doREM5OGc3REt2K2sw?=
 =?utf-8?B?UWp3K0ZzNFVsWnBpcjBDeGphQU9walM5MFE1cTJ4RmhXZmsrMmtpOHE1aU9F?=
 =?utf-8?B?K2ppbzFJQ3FwUWIvbjdheGlObW9GdkpuUUhCdUlMLzZZTEhjQTdyWkVMdE1l?=
 =?utf-8?B?YVNkK2NTOXNUQWZsSGZEc2o1bHphL3VBcU9nbmhwZS9HZUFSZ1VlamZjd3Ni?=
 =?utf-8?B?UVR4N1BYYmpteFRyWnJ1YjlQUTdwcmhENWcyZ21hTjkwekt1RzB4V2tqOFQv?=
 =?utf-8?B?VU9nbENvd2JJRDdod0ZUUmRTMjdTeFAvMGNXeW5lZ2UyeTM1dGp6TWhyZnQ0?=
 =?utf-8?B?VkJRb1F1OVpKR2libzFVWElwb2ZVRDhVUmphNDBEcWlEcTdEcjVpQ0l6dmZY?=
 =?utf-8?B?YUJFUjRTbmYwK1lIbHJiamF4LzlHQ29zd2ZYRUpjUWNNREdXcVkzMTJ3a2lu?=
 =?utf-8?B?UTNiSUZGZS9Qdi9DN3FadWJTVk1VMnN3aGEreWtXR0kvTnM3VnhKV1ArRDZH?=
 =?utf-8?B?MEsrcm5NODdUUHpPSTAzUTN3emY0Z1FzTjY2SzBBMGg1UkhWYzFOK244YUo1?=
 =?utf-8?B?SjVRbVg4bEc4TzBrTTA0UFJPekg2OXRrRU9jeThzV1NvN2xpQWtkUkE2Vklu?=
 =?utf-8?B?RGNyY29sQ3QyU2w1RE1FdlpqZmllOXFvNUk2NUtJOVlFY3I0cnhFeExmYmQv?=
 =?utf-8?B?S01DdWFmYVdMN3B5VytCSEd5a3JkalJIV0RsekxOKzljL1FuMUxnb0pDSEJa?=
 =?utf-8?B?UHVzRU5xVFg0ajhTOHgxQ1RKZ0tUM0FrckpPcjZYYmhWSDZ1K2Rjb09JdGJR?=
 =?utf-8?B?WnFQaFVNSUhmRU1ldmRnU2wzRHhwZFNmcXZOaXM1MDNxL2tXSENXVStad05h?=
 =?utf-8?B?R1dmenY3dE1yM2hPNFZXV2RuV0lEQlpkeWdyUGNpQ0E1MWJhWXBoaDlRRTlu?=
 =?utf-8?B?bG5qYkQ3YkNXOXduS3B4eTJBV2o1Um11dkt0OVdNMWVhdHVGVG1tbXRFWmw5?=
 =?utf-8?B?SnkyM012MnNVZmhkTFdEV2d3Nm1iU1NjWnNnV1JQRWlOZUsxc0l6dnREN0RZ?=
 =?utf-8?B?bUZvRjdJQ0EyT1haN1EwdUp6SktqL3pNdldlUDhmU3BXbm1QdUhUb3Y5QXND?=
 =?utf-8?B?MU5wRGFqMzhZc3J0eW85dWZSSUVPY05UQ2hzNHV5ck0zd0tyS0ZpZVpaK3Bi?=
 =?utf-8?B?ZGoxUGRDK1VuY1A4eTNWR3I5UHBNNnRoQU51TXM5dHB2YU5WSVY5bDh5YmtJ?=
 =?utf-8?B?L2FoZWhId1RVdGRZK2Jab0ZjMytyOE82VWVsM3NhUDFjRjNLeVhadWVLc0U4?=
 =?utf-8?B?NmpUUDFmOSsvZXc0ckxkWUh2OTZZeHU5YnJheHdXYitKdTF1bTFTUGlmVVRl?=
 =?utf-8?B?UFIwWndlY2szd3BQMDNQTDVaNmt1aGdCdUZiQjdHd0JlVk0wN0hkbGUyUm8w?=
 =?utf-8?B?RWphVDJtUmNCMWNBQjFuTHhmM3d3SHNhOHBNZ0k1SXhteERkVFNBYndjUmJi?=
 =?utf-8?B?S2wvRzZDNjlZWklpNVZHd2NFU29kN0pkOGkvQmlHU0Z5b2dUQlA2ekRXRW1E?=
 =?utf-8?B?NDB4Q1pGQzJmZ1J6MUkxL05mVlJyVENRdWh2S3RTTDVYLzNQbHlUZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 321695b7-0759-45c9-c97a-08de7e8f849a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:26:40.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9Xk1xN7kx6v+RNI1hhkmQCSuNEBjxffYChz0F0K/lGeUSleoSTUoiViiCHvxMyx60054xip1ihNR5u+Uw1SLPJwivBIR0s4cuGD8N/um4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_032649_399546_E2120E17 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Hi Heiko,

On 3/4/26 1:14 PM, Heiko Stuebner wrote:
 > From: Heiko Stuebner <heiko.stuebner@cherry.de>
 >
 > Right now dclk_vop2_src is not allowed to change its parent, while
 > the other two dclks are allowed to do this.

nitpick: the src dclk of the other 2 VOPs (there are other clocks named 
dclk and the dclk_vopX actually all (except dclk_vop3) have 
set_rate_parent and set_rate_no_reparent).

 >
 > All three VPs can drive non-static outputs (HDMI, DP, eDP) and even the
 > eDP can also support full DP connections (though no DP+).
 >
 > Therefore remove the CLK_SET_RATE_NO_REPARENT flag, to allow VP2 the same
 > flexibility in aquiring its clock rate.
 >

nitpick: s/aquiring/acquiring/

Reviewed-by: Quentin Schulz <quentin.schuz@cherry.de>

Thanks!
Quentin

