Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43572C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm1CbCcffzTt+zV3VZmiW/pBuGEHaStk9jwweHUwyxI=; b=ZT7bhY9eBDkEQdPEI3rGF56H+S
	4Zcrcp6AXZWaL3NWypESR/1w+8H0lhKdObnySQg+4A3biIVIMki6SbG1Qz7j4960T8yM41Epjx7PV
	lpJrm2R/biTjoI7UjSZFMLOytPOjh55hCVoh85jo+taISfJI+cPmfUlQb4A5HcGinv/XnSkMG2on4
	Sef2h7wHr1WIT8tmp6xvIWQ1y4Al+LsaT+7btx4SkaNQJjtKY4JoXOzmLHaJjrWMediPT+BDKtzWH
	7QkhDuH2zeQTK00+JsozD4KWmfQ8UnTzUySAVfYXcplTin+rUI9cev74RZp8HujRpUmW//tLpSf+I
	UahypUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bby-00000001kYe-01nG;
	Mon, 21 Sep 2026 10:51:02 +0000
Received: from mail-northeuropeazon11022126.outbound.protection.outlook.com ([52.101.66.126] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bbv-00000001kX6-3jnQ;
	Mon, 21 Sep 2026 10:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAApaB17+Eme5QVQhh4BanFgvIH7YoZ63MvGZng2KhJ2a3mJpLVPazCW6FJJS/UCa95MCQnSS8kgguEItus7gnNSKzdlb93Zg0fWqoTM9jN1KwBdVM4vSWGBhGuLNmdS8AcLEmdLeAv03sw2g8A2l/1kh7rssMs/x4Xf2svPTkaTx+qUM42uqdS9RDws23NVwydeSJ7x5MPiKmAPOn9a1p3On2jeHZGRm1+/h++mqTRy+dnubxXI+LyXY9kMT8egkMAQdlh6mLKN9zvvV/HBOxRpsNpjNnWkPIvhf/ZgjjcTMS1zH9BBLEz0XboD5lim0Y0IKFw3Hlj0f16Tsv6reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm1CbCcffzTt+zV3VZmiW/pBuGEHaStk9jwweHUwyxI=;
 b=F/QYsSL2tB0jLY0I4xDa0e2OJ2wldowmV4FfDIsw+9IOrCcuStSqlKOeOFSxBHqSST+S5PHavf1MhP8pgMZuiyBd4wIBLTAX5BHvpn4+LPv5EZFQCjoYJfgR4qGtQzzKb6fY3smsgJwTG8x/cUMVMeRoJIenc0GR0PLgEkUsIOc2Bi+CrFaKRUmZw5SBG35KACPg01ovemXfbf+S23FsbieTcXO7U3Hhi5roDpzGYIETKKRa7p8m3n86zIbp6JPUIjVXcek3rPEhZ2P93WUfP1LIoI7k1yzyb/o/89feWt0p9Naxl97m6w+aFSTj+1mNS8F7QG6BIH/4vfgHlh5bSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm1CbCcffzTt+zV3VZmiW/pBuGEHaStk9jwweHUwyxI=;
 b=xVFKQ1hBFq1ZtgxdmFM3dmhTIg3wmA+Oq74xwJd19556Kshjadu4cHhM9ZEuvckfN+9RXpZFZnJseaz285an1kRx1Mh3AnQafC9yE3dJ34y3F5xZgIHWrbq11ok9S4XcGnasWP5TRfI7AbK1f7oRry1VOQfpEtTBFV23LEsD6og7uSb5ElofIPTZsFb/Skl1E3LmXF/Z4a3jJqSaOZmMbfV56DrKZ4DPGf8Huyr6cqCcbl01TBAL/dL4qIxKpMj8I5LVUxj/bvltTM1JTLj1oG3ZwoIETQ3WDeD5/Mm5Qz0HQ8bU6TO4zd+apSPnXVhFZ4UuhqN5jJzVc1watoaiKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AM0PR10MB306277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:7fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:50:53 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:50:53 +0000
Message-ID: <3b23d050-07f4-40de-ae2c-608da69e0ebb@kontron.de>
Date: Mon, 21 Sep 2026 12:50:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: Clarify what rx-sample-delay-ns
 describes
To: Mark Brown <broonie@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
 <20260917-spi-sample-delay-cleanup-v1-1-0e4eddbfb1ce@kontron.de>
 <c0c4645b-a51c-409f-82a3-a6e6bbd7962b@sirena.org.uk>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <c0c4645b-a51c-409f-82a3-a6e6bbd7962b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::11) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AM0PR10MB306277:EE_
X-MS-Office365-Filtering-Correlation-Id: e95a5cf8-87ea-4dd9-5635-08df17ce3517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: uwSNntvyuiCTUtHyaFYuxFu2v3lJ2fyPOzjTi4nTzCrNEAq0hxBalt/Z3YBVrY9vINlNyHvykkJejdx/BzoqoelzbySXvUltK9ty34JAV6TIxdaLDMtBq4/IfObnzPbNL4TZteKVoxDpskirSfgbuXLswZ6aeONaX7RMYBlenDZpQNROIwO8Ot6ugXgRXoEmWQImhPLlw3X94SHUlp2llzGvxG6MbVDODFNCen2nIYmWkCBQREB6f7eDHt10d/rYp3Of4xku7J5r6MJzgyw5ClHSwRHsWHZuIxsvJZsfztOw2j82LlCC4aUivjNziZEyNnQMscxxiwkqjsl3fyxWDGTtqpuTy7Hr/htRgYONr7H9nwSI70J5FY+jpXUi9MWiWP2NwDjSi/9OjUJUECYiBaIGJAUkmOk6K+CECZu+4DzjM0NyYk2/N87PZ2EGpM2Qj88EFI7zkfDFWHjSlVjrPTeP2MnuEmGAedMKoPrxWdzQq6fUDOvvfxHTjO4wBw+6U0m+6WpSvVOz1HaTaJiczVu3JjRKccYffwdS/ewYoZKFLyYnQouBZuk81q3h3qAsys8J3yemJCcsxlYlGVWCS80yioWQQ4OUhpbIMAC0CObitFVab5gQWEFh9cB/l2QEcKEYxwzVVdIE7LgTrXUQxlH9iTY5WS/gSnfr7Arv+10=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEVkWnFSZXVEdzRqTkpYajB0NFR2eU1MVzk1WThkQXhNMHdUcXZ0SWlkT0VF?=
 =?utf-8?B?NUNtTE54NWVURVdSUUdNRVZjdXI5Uk5GYUt3Lzh2OWl4MlRzMjBYTml5YU15?=
 =?utf-8?B?czZGZDhveVQ5NDFYelQzV0pYRzNRUTNpZnVGL0xydFliWDRGWWlBcEdySHBt?=
 =?utf-8?B?UkxPRmJlRnM5L3g4UDFlTkxrNmZSQUovQzRDT1NDWXRteHlCbmlRMzg5R25D?=
 =?utf-8?B?WnNCTjhDQVJiMEJuUm1mTVFiM0JGc1B2MllxUTFMbm1lVEo4Q0RMc2pQQWhN?=
 =?utf-8?B?cThtLzN2WTNGTjlBTWJPeDBxK0lLQTFFT1lhYVZNVDZJOFN0c1BwQ1RLRW0x?=
 =?utf-8?B?NEVJUDhEV1Zzb3N4WGk3N3pxUFZTV2pQMXFLN1pJWnBpU2crdHZRMVhyWGpU?=
 =?utf-8?B?bkt5ZVBENFdBZXlDcm9OajBCMUcxYy9ZVFBDakRNd09BS2lJdTFTRngrU3lP?=
 =?utf-8?B?RkhoMTNBNmRPM1JOQTJ4bVhlUkZVa3BrRC9lZ1o1M0NNQUl1anRYQ3MvVWd6?=
 =?utf-8?B?dE5GSlUvbVhRa3o0RzRKNklESmp1TFQ5YXNIOHhyRWUyaWVQNUM1cVhjdk1z?=
 =?utf-8?B?TkJTNjN5cU82Ui9OVzVVOVNTSmpzdi9JMUwyZXRTN1BhY2tJQU4xNjgwYmtn?=
 =?utf-8?B?Q1U2N0xMd0FXemVxZktRZUhod2s4eHFITGlWcE42Wks3eHRWVG02NDJqcjVx?=
 =?utf-8?B?UGlybGwyODBQeW9mNmFyNC9PbWVGMUNNaG8vNFRtdlZkRjU4cm9Xd2U3ZVJk?=
 =?utf-8?B?MjZFREUvODJpRTEzanNDdWVOSFZWR1ovNVdhRTR1VzF4ZmxkbHBYR21FeVVQ?=
 =?utf-8?B?VDdseCtwbDdjVDlHTTd0QjNvZ1ZKQUNsWW5jcjVXb3lsYnRGaW1QK2tpRWVh?=
 =?utf-8?B?NGhCUUI0ZnlZQWluRTl4Z2J3M3k5dHhuTVV1UHZFYzBMY2hCR0kvZUdmMEFp?=
 =?utf-8?B?bmJmdHhKZTA3c1BGSENYYkJVMWl5TStvaTFWQ1A2alNQc3htYkJrVVJUd0Iv?=
 =?utf-8?B?RXl1eU5IcmFZUHUwRGZ5WVByeDZVZVVPcmtpVitrWXJFNEZnVEtPVjZRWTJB?=
 =?utf-8?B?S2p3STFKa2FMc3VlZDRIQjdScEhKQ1NPOUgwcUpQeGFvR1QxUTRpdS90UW1D?=
 =?utf-8?B?bVNSN1M0aFdHVUdWSytJdDBkcnNrMVBkbCtyVGhOU2MySzE3Zld0d2pPcjNo?=
 =?utf-8?B?V1RsTWJHL1UvYkg5L2pxWXFRTVl5d2RvYmxDOHI5QW5mSFN2MklkSjQxRTFO?=
 =?utf-8?B?NUYycDJKUDdlSzFNSXRPR0pCUmFhUjFtVHl6QnliTFgybDdVK1NteVZFV1lD?=
 =?utf-8?B?WmZFYU5KRTlPdnJ3Rk9nU2RGdG5lc3c3WWhWQlQ1SG5tVWJIWjRjMkRGZ25X?=
 =?utf-8?B?N25GTGovSCtDU2N1b200TjE1VGJVc2VkaFlpS1Q0V0h6STgzU1B4aTJLZnpu?=
 =?utf-8?B?TW96QldiMXpCK1BFMUNJYzNnRkhDUkFYWjA4d21FUFVwUE9kL29QQi9SQUpZ?=
 =?utf-8?B?UTVSWTNiRU1sV2lVVTMwSzNRYzJFOCt3WEEzQWoyZkR3d2N3RTFnMXN0cWdn?=
 =?utf-8?B?WTRPeENObG93Yitjbi85TTEvVXRVbEVyL3lRK251TDNEWHZUWm5zdHM5UDE2?=
 =?utf-8?B?K3U0V3Z3U01nSWxDZ3NzeVplWVhkZFVYYWlCYjl4R2xHWVRyM3RScFhMOXFW?=
 =?utf-8?B?a0loUEdtZmNzazlId2Y2K2V6TEszNnhwS0ZWaFJyN0h4U2JvSGdnVis4U3NY?=
 =?utf-8?B?cHFFQjZBbk9yY0t0ek9BNGpNYklLeGhaRFg3V2tpYVVOakNIZlhOQVl6aFUy?=
 =?utf-8?B?cnZicnh5NDJKK1JlRnpKY2dic3lkcE5ic3VsbVhzMXhCVU9GcHJoOVIrRkxy?=
 =?utf-8?B?UEplQjk0eExXUzJDbUdOMzc5dFVoL3A2K3BsMk5wTGxFTklBcDhOZDlvT3V1?=
 =?utf-8?B?b2NYTkNMaEluUUxYM0x3ZWFoT0dDN3RMdmZHU3hEWGk4dEtJRk9hNUxsRDJH?=
 =?utf-8?B?ekgvb0xjM2NXMTYvTUlTRmxEN3NKdjZ2R3c3ZW9tMitjZ3NrazhWRWI1aVFF?=
 =?utf-8?B?QlN4VitSV2ZQV0szRm1xSGJmTXVTV3NwcmpSTXNkMlpkdGFPdU1jVk4rQmNV?=
 =?utf-8?B?QXdCVnJEOFF6Tk1QOUN6THhqbDVubi92d3BrMFRnMWxZeHIyTUwzeVVBdGxV?=
 =?utf-8?B?SlI1K0I5dFJ0VzVpWEFIcE44Nk5oeWNnKzRJMm9YKzA3R3l2YWIxaDB3Ynhs?=
 =?utf-8?B?aEFkbGduNG1BMDZkR25SVGZ6SnhxTE1JK3NBY0F1TXdzYzgzWnhERjZNeHhx?=
 =?utf-8?B?U2RlL1FKeW1SWVc4aWJSbnllVElRKzlUcFRsVmFUNGRvUzVyWkxZa0ZZZGZH?=
 =?utf-8?Q?Vp2fncoOzB6NkTQY=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e95a5cf8-87ea-4dd9-5635-08df17ce3517
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:50:53.3247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AriXi8qAwgqwKSTFp8Bd77Ptk8kcjwy8ezUtAwjfy47YVwPHyPrTXo999SoEFjUInM1xDOWh627pCR0UKPDl6YzPWzUlTGW/k/+xR/4uUEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB306277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_035100_241248_0768D447 
X-CRM114-Status: GOOD (  12.43  )
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

On 18.09.26 00:23, Mark Brown wrote:
> On Thu, Sep 17, 2026 at 05:37:35PM +0200, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> The property is documented as an offset from the controller's default
>> sampling time. That says what the value does, but not what it is meant to
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Sorry, fixed in v2. But I have to mention that this mix of "dt-bindings:
subsystem:" vs. "subsystem: dt-bindings:" across subsystems is somewhat
annoying for contributors. Has anyone ever thought about aligning this
across subsystems?

