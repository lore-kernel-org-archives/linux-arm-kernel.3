Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5CBCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sldZIpeQK00g+w01RVFor397fxQTt/wMRVgrioKiDjs=; b=Kqf8/J8+itUqbkx7GOJE0TBk6E
	YkqyNJvcRSBceRDN9PoEq80wbHzDuWNtqtDaq6zd/FeeSPWuhvnMSGtA1vAfh1iBwPfW4FLk9fKFB
	D09DS4SxYC0dYX3kkpFMVA9OsJFUeM4Cvk1XZ0LPr1xWw55MDsST4jfdKAhO3sEiKROoH8yDjrdQr
	kStr1ZxaCk5zMU0qkFgKBoTsh2HU6DZ8P9FWiXdCgDNAy6m0f4RIaXiIpEh4G9m9DrXsbK6vZXNkS
	KJDs+RS7JzseXXV1fkVHe47ryNZCH1YJA58gaQu8WEUrDnqZDi/U9QZftQG5QfrLKOc9unXn2iUMA
	JJV4K0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSnUg-00000006fhA-1OQC;
	Fri, 29 May 2026 03:02:42 +0000
Received: from mail-japaneastazon11023104.outbound.protection.outlook.com ([52.101.127.104] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSnUe-00000006fgf-1pSo;
	Fri, 29 May 2026 03:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiFdyt9Ao5zjjJ9lHO/2F+QQAVdff9j1vq52dqfN4JDTIR+UHE4zleKSeUdOdWHP6HJbb9bksblDzp851YG8Gml0t5UjtQuSD51qbMrjN7oJYYLPNZQujFtwRAMKmbrH3HiVTY9GTLB94Nq1SnClKGnxnlWaNfs77lkkaEopMa7d4NLbIFnS9DTJkdoCM9ACTX2KQIxdfv7I1KBL9Mb+A6VGBBQ1sr3ToCerZ+VrFRWoOVWJa96qRCvyqHhVbuEbK7LB4/cy3ZRC/WJy5DryVxQpAgprQ0+yot8rducm97m2WkjacNj8goyHsg4q+JLs3LEF49VeyvwAkuwkKMmTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sldZIpeQK00g+w01RVFor397fxQTt/wMRVgrioKiDjs=;
 b=iTOiQrYmEvlB/zyiY28VYAVralvN/skIlA9TXfLO+iyoDGy59BT3iODkFrGJ7ZMkHE61p+wqWMn+p9Oerw/t+5X7QTEsN4j93F5Cmw4L2ravQZTQagNfJ4o/OZZ6peQ+eqUJVgdVBCCEL3IjZZnWbvXnpuK5Ql4XMar8GFrIAd1TdYeqJcsihul72ZZIXdqqfoTqpBe4iVNiZu05UUS1vjFhm4/wtYKxmPhzVECdmhGUt+y9d78IbGGpv+m0IUeFeXLOU3xMsRT4cQ4/bvtxkXZmkls+Vu5fRJfhiAdPv0XAVK+z3seqVgLWEcybErTgFcJ8UBC+eHT+MseTKP3kWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sldZIpeQK00g+w01RVFor397fxQTt/wMRVgrioKiDjs=;
 b=gGztoYDm9AZfEANsen0djzI+t1M9mtNSDmYziDO6l6/UHMqUHKyX69beXAYPL56HsYOEn+nM47M9Eqo2/VPz/MCZp17GA9EjXdoLCveuHATVxBe2tBirg3cXWxpNDHXZnxzfRa3OEBPzkVV45W9dVYFquxlv+ToktFMWIHWecmnXQwSIIK7ruaaFXJd6uEFdmqIt6TI8wH5rQ1osKVHPfZ1/bWUMEV/Bjnf4wYBnL8oeLbPQavtMHipbu5pf2PF+OfYvUIt8OjbO65UMgLHqLTq1MrOu0gzNTCn9dfKj57HEO4E10kOPLbEAHv7Nth+d7FDLoramjEiWOr7HWihw6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8514.apcprd03.prod.outlook.com (2603:1096:820:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.4; Fri, 29 May 2026
 03:02:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0092.004; Fri, 29 May 2026
 03:02:17 +0000
Message-ID: <36cdfa84-1e83-4a44-a529-653d476778fd@amlogic.com>
Date: Fri, 29 May 2026 11:02:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d27a221-2e55-471e-3821-08debd2eb13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: iX+Ws63s6CKYChKl5iM7SBhimYXfEn+9pq6zAPYCYI+/Miy7hkzrk07IfTXp3kf7c3kDDmpiBUXxmD4N4zi2EuJshSj5cnFZtfknsqVOB9XPGyfi+MuiOtBIGYmHsB3qrR8b1+Uzi7/MjngDbqbmxaYSz/DdMw/b1ZfQg/F0Em3IWRog566m/FoCCBICfgjGOkPi0FFQ3xdyutNYfDofGKxeN2ZeCvqfRyDS9HVhe3HsBV3D44NKOfr+QREf8XhPbM4CA+o3sFhjrrmIxu4NWWsVO10jzkhABeatveM2qMSMGWBA+Q/rSL7JnUtfwF04SqKYG+L2Mfb73z1V7b7R3iVJkifS8EOTwQjC+SkYBqEgEWen5QR3U6aPLFJa3sBgCGYUes54Mt0RZm7NjNQ7ftGesDmsGUJK7vbqDu0oyaCYjzyV4hOn/D58dkROMe1kCB0tGdEFHbb4wl9HiIyQzMELRHjXZsjzDFV1LoQOs0Lc0lPlTYBSWMxsoWQk5fOhXDPBlm5I95GVz2pCFMAPiLkpMeJ0ngDOg36leIgi1Hu2aivEZ24uzHI9f6sD2IGtFcA0G5noTDvVj+U4k6+8irbNBj++8bwPxYYpApzrtFKB3LJ74/tmduNAiw3uysmS5R+13rq3gWjaimr/OdRnUpfl3uUqbeYUYGRx9Qsx1Wd1PEX9FAR7W745K8Tvjopv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURwT2pOVlhZbXJJTmhqRC9DK1JVR0xRakRra0xjd0lEenNnYWRPR2w0aFdH?=
 =?utf-8?B?MlpWUXBrOCtjb0UwOFZxRGxZeFFKaDJ1cmZJelladHZ6S1N3SmpKOGNITUta?=
 =?utf-8?B?OUhuWm9HdUR4NHp1N1NydmNVZnFJTWErUVlTeE5RU2taMHcxMTNoeGlpZDBC?=
 =?utf-8?B?S0srbG9QNHlpWUFEMDZiOHR5WEU3WmF1NklRTDRCN2hHcXlCdlJHenZuOEFN?=
 =?utf-8?B?S2QyTzJ1cUJPQlZHcXRGajEzcmpEZFVGRklsU2IyN1NoakFXMkVaU2NyeUJG?=
 =?utf-8?B?azlWNjN0NnQ5WHRoYUc0Mm1KeUlXOTJzZEdlMzFRYkF3UkxZOG5semwvZTVh?=
 =?utf-8?B?UFNRMnpjcUVHdERaQzNEWENUN3V2dmUwa1kxY2JUKy9ySjZlVHVHMkRWelNa?=
 =?utf-8?B?UDI2NS9lN3k4cDRHK3lwUTBhS292RmRoL2ZKSjYxYk9saXlBOWlaN3ZEa3Fo?=
 =?utf-8?B?Z3ZtYUFISUN0U0YyN0l1MXZoalJZNWpVYnc2cmRUZmNFa29zY1JQUXREV0gv?=
 =?utf-8?B?SFJwVnI2V0R1TCtVSVExeEFQMzZSMG0rRitFaDBEcTZaUWQ1aGpqSTc0eUE1?=
 =?utf-8?B?SkExWWRIRXB4UXpRNDNLdmV6cjJVZG1vZkYzQjJ4Y0lINkNRcmFTSEgrd1lq?=
 =?utf-8?B?VFh5RjVCajRad1dQbnVuVE5pRStPdnBoOXU5NHY3L1YyMTlLTG9rNEk1Sk9m?=
 =?utf-8?B?dDY3bSthbzR2ei84c1VOY3NFekx2eUZNcU1zQmdDd3orQVN6by9JT0Nyd0t6?=
 =?utf-8?B?aCt6T3BCUzRGQXIyWERyNS9xLzc4OXNLYUw5SXJDOGlmK3lCd2VDWVU5VnZQ?=
 =?utf-8?B?RTlqVjBMalFjUlVlMHoxc1krSzcvYms0bkVCZTJqbnRtTjBZZHdUM2c5SEI2?=
 =?utf-8?B?VWtDVzlsdXlML1l5Um5TbTBwVDhXVEI4bCsvWXVXSmpndks0ak16a1A5aWJ5?=
 =?utf-8?B?NmJIbDBZQzR3eFlQZnZ6MkdqeGQ5TFIzdDNILzFkSThkZUQrOTd5cDU2a29i?=
 =?utf-8?B?SUNwcmZrSHpkSk1jS1o0WU9MeEs2a3dPSGxEd2tqeE5wWmpYakRXWCt3RDVz?=
 =?utf-8?B?ckdZTjlJWWZiTzQ1b0M2bS9JK0szZS9YMW02YzlOOTVBbE9rckE5YWZlUVFM?=
 =?utf-8?B?WUg0V1hMNTVCNWx2bityMVBKaWNkN2NMZWN5UW9YdVpUMFFwYjEyMGE4MkpY?=
 =?utf-8?B?T1BVVDZSRjR4N2NITG9RSG5QNHNTbHVtRHpHMEI5MUdib3k4QmNoRm04aTNX?=
 =?utf-8?B?LzFuME5heDF2am5vdTc4SWxLaEtESzliOFdyZGJRUW9DZTh4ckFTOHFwOS9o?=
 =?utf-8?B?WGlkOHJUMXp2VmkzZWVVcys3UUplQlBZNTBSOEhadGRSeTg2UjVIbUZqSWgr?=
 =?utf-8?B?TjJDZmhSeDkzYXpHUjlPSGVxQkE0bVRoMUFSWkxJbjhudW9KRndtYUtOUVNF?=
 =?utf-8?B?aXRpMUljMnN2Y3pkSDRWUHpOUFQrb1d6UjQ1N29oc1Q0Ujd0K25wWEwwbWxL?=
 =?utf-8?B?STNqa2tnVmFncFdwL000Tml6bXdJNUJENWplZCtHeDRLU2s1Z3IyajFUZ0JU?=
 =?utf-8?B?UG9VTStsVmlaeWhMWGM0WmlHb2F3cmh6d1hQNm4rQzNKcytESUhvcHE4c2VB?=
 =?utf-8?B?Q3FHK3ZCZ2ZPREtZc09tOEVhODJtbzNJSnBublVjV3ZnZmo0WG1xM3NPSy90?=
 =?utf-8?B?TTk4K3E3VUd5bG9OTndzVHg2b3hjZW1Iamc5VDkvQ1NBM0c3MUh5YXhqZkta?=
 =?utf-8?B?M0dudnVvd2VtVVpTR2c3Q3pqSDFpckpUNHgzYVhmdUFhZ1hTUGwwQXFqQkt3?=
 =?utf-8?B?ekNYNS9kdmtoMjRMUGJSd042YmQwSjVta1F3WlAzd2lUZEZvNVNkdDlVZGtS?=
 =?utf-8?B?WTdFdFYwUlg3RDRkMXRaa2xYNUNnR3VJYjFlZXRVQXFYWUVhZVlPSkFGMnMr?=
 =?utf-8?B?V2NFOFNlWlBKWHFjaDZIeHFJTm55Ry9CTkZVWXZmenhwNlRHeFlzajhlYkVF?=
 =?utf-8?B?TE9uLys0RXZWZzVLaGE5ZDdzbkpUQlZKcXA0RDlLZjg1TSswbkNHVmZvcloy?=
 =?utf-8?B?M2RPUG8xaDNkaENXMnZRcWFYV3dZWjFYeEdUU210MGhEZWtCT3BqanpMeWhq?=
 =?utf-8?B?V1NIWTRSTGtQa1hPbUN4aGxyaDIvWE4zR1N1T2JhUmE4WjVBK3BxT0NYTGxq?=
 =?utf-8?B?ZEpwNEcvTElDVzZHa2pySTROMGZrMUgybG1RNHNaTDVPakxzOFRGdHlaVzRt?=
 =?utf-8?B?cDA2aWo4a0VPemdZaEZnK09tUFoxdU83bEo2ZCt3SFFzYlNQa0tVMHZqdVVX?=
 =?utf-8?B?amwvcDIySXFlWWpJaEk2LzRCR2QrSE12NzBuOFpSQlZLZGRpWnJDdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d27a221-2e55-471e-3821-08debd2eb13c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 03:02:17.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbkFFaR5+Q2ALcULuGSZ2wIi8muHD/jEjUt781E7nL5NlSTdbDJCiwSDa5oenbZ4sUqUE4j3CcfzkK3xQt6BmXDb/93ITn98Vxq07zYF0a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_200240_507628_841D5CC2 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi Linus,
    I don't see these patches in the for-next branch yet. Were they 
intentionally left out?

On 2026/5/12 04:26, Linus Walleij wrote:
> On Thu, May 7, 2026 at 10:21 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> 
>> Add pinctrl bindings and driver about for amlogic a9.
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
> Patches applied!
> 
> Yours,
> Linus Walleij

