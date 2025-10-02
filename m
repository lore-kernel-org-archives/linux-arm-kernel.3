Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4DDCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjxtNWquKKBxX03g1n1FxFir+OBAakhZwWJBCUhf93I=; b=D0/u5X7wZPzykPvi/oyK5DcYCN
	KCs7rSOUlocOWd+cbTUHvFVbanx6IEL2SzkjJyw9066X8eINep0PCFVqDWt/as9qwHMaL2AbMeY0d
	rztNOGDcKNaU+9P26stshe5CfSGqsu6YtJslwKTV6DQOgRQYrWBaIOk7lIjCwY/0LNFmSNXMY/lxo
	WlpHkLbLKP4/QXWtrxZlg6tU3r2WExt01FUl66kUaUbcOa6KCVE5pB1ihQ/1NrTL3kgAC9WsK3Rjd
	aW5pVs/s276U/CRriYGDpu179GaK6THwkNkHZGIRi3oVGNLdfKwkeJAtLycoIKFqfY8+Fmg6OMsBd
	E9WPNJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4LKG-0000000Ak1L-0Fcz;
	Thu, 02 Oct 2025 15:34:36 +0000
Received: from mail-northeuropeazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d200::2] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4LKC-0000000Ak0w-3leb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 15:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2dG34pKGuslTg1CTjfYOcmmGPH9dtV0sZta6gWL+W7nd7t+hH9JLPAQ9Hv659Tmp179fFBGmEzhCaPLoPDLG049dlEtlhFQ5lQip/aT5XOsRsMJOwoqSkXQ+TjSBa9zG0MAuMZDpMqslpja/q87mZuv40OauTBJhURbwVHDY72PmbIinEVFPbdzlRgzLNFJ/btFL1Bl4fM1pKVoCjrECbsFX+KcJ+3Fr4OTr1ygrhB2LtwHpQBTk69xrCIixhE7QMaeHNP8Rtv8OQhz/8UDesqyGFo6S+0XiJ2HFbYiOL+XF+r/C0LTbjHr7OpSOxoQE+Zx4oujiVqjwn3SYOVbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjxtNWquKKBxX03g1n1FxFir+OBAakhZwWJBCUhf93I=;
 b=gF+3q7brYDXqSvp4MmYyXoiSTSoPJHlYbjQy1wp6L3jxfRIvqzt8Xa2LvFzyK4iNQRoUK2KQ40K2pvsZ67sM9wqEjgYKh9oTURNcjEhJqRwuzJrhn+ugL2CxBCRa6Qn1NAQK4WvPKuQYmtKe5CbCTYGsIiHb1II+JEzsjRcg2ksLvCFvOZMvBjKaTBsQOg4Wl13C93a2UGGxuX7pO89bU1m0AEoPLUSdO67WRT5plCJAJ2URraU/ipHyAIA8QN6TfSjLD/WIrVU81G3moFf/gQzaD2Pu0ns8reXcRTGQZlf7MX9CB3OR9jzXtLBzqhHAnBP7lcjYyAjwWbFMja/uIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjxtNWquKKBxX03g1n1FxFir+OBAakhZwWJBCUhf93I=;
 b=dWbIO7wB8icZbh7cC722vHwAxNsrn5Kg3CYUFEITvUk2xb2ugb+jOd0eIGbwM9I+Ly0yWAt5/MMwOEShu/toklf7C991B9iDC9sCVosPszsXorbE1KBg3PuoEydB+cgOMl1OGtyMW3ZcQsOcuoM1Af7nwmBvmHgkKuVa5gDq6wbmoq1GbBKUcfxBVjuR2pirOJdBHEQ6nK+YZBUXVUIRnt/+UtvHGn+10GBRw3UTa3C5khWWdnwLaO4xwqDriHigEJrwJCTqivwdQGLoJS8d75RXl+2ZKVeKHhwJ1jjopRFdYEHTQNL1rhqmmw0iFkHbIUSj5fYvSgdc3s8bL52+4A==
Received: from VI0P195MB2739.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2c4::5)
 by AM9P195MB0920.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Thu, 2 Oct
 2025 15:34:25 +0000
Received: from VI0P195MB2739.EURP195.PROD.OUTLOOK.COM
 ([fe80::350:3f3c:7e09:a9cc]) by VI0P195MB2739.EURP195.PROD.OUTLOOK.COM
 ([fe80::350:3f3c:7e09:a9cc%3]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 15:34:24 +0000
Message-ID: <VI0P195MB273999EC8797270AE732D8BAEDE7A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
Date: Thu, 2 Oct 2025 18:34:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Make sure CPU_ARM940T kernel can be built.
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Eric Biggers
 <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
 Dave Vasilevsky <dave@vasilevsky.ca>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
References: <VI0P195MB2739D000BD1BF18B3B718F93ED1FA@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
 <CACRpkdZbwuf2Fgtq+jyqzqspb37-P6X4O9xqkG-mSb+afSjh3g@mail.gmail.com>
 <VI0P195MB273993B2928F985EAC763375EDE6A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
 <6d9bb65c-d693-4d99-8183-b605cabf9380@app.fastmail.com>
Content-Language: en-US
From: Franz-Josef Haider <fj.haider@outlook.com>
In-Reply-To: <6d9bb65c-d693-4d99-8183-b605cabf9380@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::40) To VI0P195MB2739.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2c4::5)
X-Microsoft-Original-Message-ID: <c1afd1c8-2247-4db6-bc73-22b51d1558b0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2739:EE_|AM9P195MB0920:EE_
X-MS-Office365-Filtering-Correlation-Id: 3029ae89-9a45-4465-23b3-08de01c92a88
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|6090799003|5072599009|461199028|19110799012|15080799012|8060799015|1602099012|440099028|40105399003|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnZTVnBFSUN1Y2cyNEc5QzQvQ3Z6NUlzYnEza2w1UFAvM09UTzJnNW5NaXg3?=
 =?utf-8?B?dmZhTDI1MzAwQWFpVmtXT2JxUFI0QS9obnJIZ0NFSTFOT3RJQ1FDdmFjcVli?=
 =?utf-8?B?c3NDU0toNVI2NDRvTlcvYVR5TjVnSG5acGlmRndxTUhHT05qZTh4SEF6TjNW?=
 =?utf-8?B?ZkNJZmRHOGNDKzhnbi9oMzRlT1Q2SXRSR1BIU1FNKzZSMDNPM0VhUkd5NGZt?=
 =?utf-8?B?R3NZVTdmSHdLWmxleEptcHVWRitINi9lelZGcmtxczFIbjNTYkIybEs2eFNJ?=
 =?utf-8?B?TGtDQm5DaEdhVHBSbFFWK0VsSTNLdmxub3IxUysxYXl4NDFMaTBEUWdDMmY2?=
 =?utf-8?B?VURRMDRQdGtjYXVsM2M1a3hsUDNidzdMVGx6aTJ0N2Vic1B6aHA4c3dyQVBY?=
 =?utf-8?B?ZHJmMGVsMmVnODFrSXU4ZEw5Rmk4YnBTRTZwbHlzcFpsTlZ5Z2pLM0grZndQ?=
 =?utf-8?B?SXZKYkhSd1NEakZWOWN5SjdTdVUvSlNrYmdBV3ZEZjdEeE5UcjhoZFBQZ3hy?=
 =?utf-8?B?YmpYd1U1ZHV0ckJxY2pWQXNYNk85aGZ1VEpYNzVOTWlZWlNyNG0wWGVsWmx0?=
 =?utf-8?B?dzBYY280NCtscHY4OTdVTkVlS21JRW9weWxVV0pOcnRxeWdNc1pOcG9sUk9D?=
 =?utf-8?B?eStMUzZvOW9hblN4ZUUxZmU3dFg2YWJ3QmhFZFFmOUNRbmVWQldYT2UwaUky?=
 =?utf-8?B?NVI1WkdycXFNUVVBaUsrbHl3Rnp2am4vc0JGbGo3WE9mKy9iVGZxdjQwRWxE?=
 =?utf-8?B?eHlvTHFOanF6Z3d2dTlVaW1sRStFNUhQNUN5YjhuSEJSSFdyUEhVYXBMOEE0?=
 =?utf-8?B?bUlrVGF3RTduektjOTFUNHFaUEp0WlU0b1p5ZmlHU3JUVFAxY0JkbmJvVTNv?=
 =?utf-8?B?VnI2YjUreFJuMmo1ZDE3MFZhZlUyRDJYMlRLWkxWMVhwZ1NOWStnR1A5dFQx?=
 =?utf-8?B?QW4rckdiNXJvbmNmYkVDSGRkUVNwYWJnSllFS01jSVlIV3RMejZiS3ZHNzJs?=
 =?utf-8?B?SmhGZkxDOFFFMXJobVg0YzJtMFlKaWxuR2NFUXRhSlI4SnRjd1FLZUIzTUdN?=
 =?utf-8?B?TEFUaEJBOVhCWWxZSTRWT091bWJpcWNHdjJ5dVZMaGowWkdGWjN1WmxaRVJ4?=
 =?utf-8?B?aXA3L0JFaFh2V3dRQ1FlTVVVQ0NiSHNNU2V1MXpZVDVEMEpmcjlxQTFDZlZk?=
 =?utf-8?B?MVJEMmdIT2Rsc1ZIck5kS0JtQ3N2Mi9UdVJFdytPMWtrOGIwUU5JeDRvSFVl?=
 =?utf-8?B?SmNKekc4MGdXa2dObTBDL0dyd1BQYWVkUnN4QzBZRElSMXQ3Z3JsTk9RenI0?=
 =?utf-8?B?RlQ5VWJMYUZnT1hDanJhTEhuOElsT3VYYU5NdUowaWdKZ2Q5WlA3QVRyYnpC?=
 =?utf-8?B?U0RoNVNRQnI4aTRpeUxqYkV4Y0w1c3IzVG40NzNVVGtPaHlHcUZKMVZZd0Zj?=
 =?utf-8?B?aTBDNVVBWHFNOVJzZnF2eHVRbENPTDBNY3dCWnZla293aUxSa2ZhTGtGeDA2?=
 =?utf-8?B?dThzc1BMWGZPUnJ2WHM5SlZwYnNTUFUzWXdvYTB0WHpVWm5GQ0dFcWYzTURa?=
 =?utf-8?B?VHhBSWY3N1I2MzZlZTRDSEU3Z3p2WmwwMUlZaElUTjRENjkzdVFzY2lBci9V?=
 =?utf-8?B?ZkRVTVRxdjQ2Q3FDZEZvekxrZXdtQWdjUlFVZHJKMGR4MzNGbm52NHFVdlh3?=
 =?utf-8?B?cnAxZldFVHlYVlN0Wkx4WE16NG43TzlRZkxzQVJVd0tSaHFJSDN2UGlla2kw?=
 =?utf-8?Q?+U6EdhzOvIukoDvZ4Jk5QTOqtuc5vPuS52U3nvV?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNXKzhXOVJmN0RhU2dGUzNLaCtEc1VWZjZFL2t1cFpFT2tkTkU3VHdhRmJ1?=
 =?utf-8?B?UjJDWTNyU3ZsYkZrNitTZzFadTRxV3h1Qi9DYVp0M0EydGVQT2RaTjJ2djVw?=
 =?utf-8?B?T0ZISE55UG9ycVVxSHRnNWdRbjR0YUNiT1UvajFuUUc2Wnc2cjJQQm9NZnYw?=
 =?utf-8?B?THllNTJzZVliUVFibHFLYXE1eStsSm03K1ZwWTcra1ZJL2VIZSs2SHNGZ29B?=
 =?utf-8?B?NVA4cG14cm9GcmczZEFNN0JocnNvaTQ5YzZyOVhzVG40Vk5wUkZZVk1oRGFG?=
 =?utf-8?B?QlczMjA3OFFsTVI4bTRzeEVUeTYvSVBjVDZiRmdCaGNubDNLMkJ0b2QweTll?=
 =?utf-8?B?QjZxL0J0dGc3VlpYWUxHUHVCN1ZINDdxdXNsVVp0ZllBdWVFSkxoU0xVTGNq?=
 =?utf-8?B?MEFkaG5qQm9uVHNWY2JQbVIxU1puZmNaazlsNitnd1RXNVVUV2laUmY0ak1s?=
 =?utf-8?B?TWhxRW9BN1prdmRlcnNCaFBJUUQwRnFtRTNqQkl6ajNDb0V1aE1Ebk43MmVJ?=
 =?utf-8?B?N3QwMEM1NmdsV2pwbFBwY0VRUlpBdkVzNU5SVzhTaUNQQzNoRlFNaUNVVTFD?=
 =?utf-8?B?SzB4b0RITkF2KzdEWVVoakxobGFSTXNnK3lyMFpaS2RDOWh5YkxhR3EwMkRy?=
 =?utf-8?B?WGF2MXk2Z0gyTStPemhvZkJNOHdQRXE5OUI1ZmQ0QzZLc2NOS3FmRU1RTzdm?=
 =?utf-8?B?K1lUdGhZVm1BckJJbHdNZkdpY05jZVRRbi8xT2lLU2NVN3UxSXloZk51amhx?=
 =?utf-8?B?WWR4Ylo4Wmd0RzVTMDdmWDV1UW1oVHNmeklkSVl2TFptSDMySFpoQm0xNkcx?=
 =?utf-8?B?L05oSE5DNkx1d04rc2NrSVJNVjlENzNYSkl3V2VyYlRIRmVyV1hyaEV1NXlK?=
 =?utf-8?B?Z2k1b1pkSExVU2plVVh6eTRpUERHU3crZ3pjQWxuMHJhd0d2MnFuajFWSlJq?=
 =?utf-8?B?c0tmUklPRDFxOE9LSEhxVkxKZEU0dFl3QzM5TDFnei9sV3V2NFpyWElQa2JE?=
 =?utf-8?B?cEhmUmlFSC90ekN1cis1eVhuK1pNcmh6S0tzSmd5cVBRQzNhNlpHRWlVYUgw?=
 =?utf-8?B?OWpVODlmeDZNMS96cXlDdDcybndkSkJhU1pVdVZLZ05ud2tURWYxWHNQdnpk?=
 =?utf-8?B?UHZ5emFuNEtYbTZWMnJwS1huZmlQV0FZSFhYZC9RR0tzQ2libXJSM3RpSUNx?=
 =?utf-8?B?aXZmOVJXN25zVzFIbFp5ZnZ0eStMVmdaanMxTjE1b2VhQkJJNmtZUVZ1Tzd4?=
 =?utf-8?B?b1hkbTZ5T1JvdUpkQmdhVEhOajNEbTdtRVRBV1RCZDBWMC9TSU9oYk02MVBy?=
 =?utf-8?B?YXl6d2JpZmhYbmtVRWUvUEllM3Zua3dYeFdIUmhWVDJxaHgzOFRPcGlKR3pH?=
 =?utf-8?B?RGtmaXlCd3pldmY3MlBiUWt0cEJicDROeVVHbTVPZk1uLzBueEg5QytRb1NQ?=
 =?utf-8?B?bTZIUTVkd09MakZtNzdLN2d2OURJemVjVm52ZzZaeXpnbEtiZ1V1MzkrSnRB?=
 =?utf-8?B?YUs4amQzdThQSzBNTzBtblUyTVpabmNvSTRWTFFKWGdxMEI2TzNwTXFSVk9C?=
 =?utf-8?B?djZuRVU2UUNYVlA1c0tSNHBtWjFjYVFKckczL0pkYnBsUFVNZjJWRnlYR2xQ?=
 =?utf-8?Q?LHjs9BVChgKUw5flnywal3ZSJAY3eplybx+UfxRvCCaA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3029ae89-9a45-4465-23b3-08de01c92a88
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2739.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 15:34:24.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_083432_943348_21287E36 
X-CRM114-Status: GOOD (  23.89  )
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

On 10/1/25 23:52, Arnd Bergmann wrote:
> On Wed, Oct 1, 2025, at 18:04, Franz-Josef Haider wrote:
>> On 9/30/25 15:09, Linus Walleij wrote:
>>> On Thu, Sep 25, 2025 at 11:33 PM Franz-Josef Haider <fj.haider@outlook.com> wrote:
>>>
>>>> From 33ce5a26ef08199625bc5bb01a176047bfacff91 Mon Sep 17 00:00:00 2001
>>>> From: Franz-Josef Haider <fj.haider@outlook.com>
>> Hello, I have done this change because when trying to "select 
>> CPU_ARM940T" from a Kconfig for a device with arm940t cpu, the build 
>> ends up failing with errors like
>>             arch/arm/lib/ashldi3.S: Assembler messages:
>>             arch/arm/lib/ashldi3.S:44: Error: cannot honor width suffix 
>> -- `rsb ip,r2,#32'
>>
>> With the change I am able to build a kernel which runs on a device with 
>> arm940t cpu (with the patch "ARM: Add missing mmu flags entry to arm940 
>> proc info." which I've submitted as well. And with the necessary mach 
>> files etc).
>>
>> I can elaborate on this in the commit message and also adjust the 
>> condition to include the other CPU types you mentioned.
> Hi Franz-Josef,
>
> We removed support for ARMv4T NOMMU a couple of years ago in
> commit 2f618d5ef5dd ("ARM: remove support for NOMMU ARMv4/v5"),
> in order to simplify the Kconfig CPU selection.
>
> Adding a new platform in turn means you'll have to add that
> infrastructure we skipped back then, and the dependency here
> is only a very small part of that.
>
> Do you have a public git tree with the rest of your patches?
>
>      Arnd
Hi,

Ok if the support for ARMv4T NOMMU has been removed, then maybe we can leave this as resolved.

It's actually just for a hobby project, nothing important. I just thought these two patches might be helpful to other people who encounter a similar issue on similar cpus, but if the support for ARMv4T NOMMU has been dropped then there is no point maybe.
Here are the patches for 6.2 in any case but it's very much a hacky WIP, and there is some stuff in there that's not needed anymore on top of later commits. https://github.com/krnlyng/linux-ipod/commits/n2g-wip
I also have a version on top of a recent (~29 SEPT 2025) commit locally if that is interesting too.

Best regards and thanks,
Franz-Josef

