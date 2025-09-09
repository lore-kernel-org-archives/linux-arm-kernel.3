Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F898CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyWWlN9HQT/rlFG9d8lLZTmbkndGBnMBpDK3hwQcUxU=; b=30J2NnzGaPIAllJ9+bNYLJ7WiT
	tNBSrdd4EFbLkkIbdqniPO7VhjeC4T4or79BLlLmrAX3LyAFYcIfI48F/f1x/1ngzBsp7zy5C7vX7
	kE1tBifkrBl6P+tyL3gLMT1+fnikCjdWFyanxsJWalYWF+FNS5tjVCyzuvkZkGm1SM3gRZIO8gaX9
	ACFaMY1T6f8Hw/25rsSlUyx4ZZ3lvknHxwqfZjqJf5Vc1iGefAg0X6nrT38D3GZaQPjn0JXCHRyYK
	0o/uD+qCTT8T+i5Czn1QoQ4tnQPRfHpVodTEt00dCTWjix0FOXAXhhsyYK7QTnN+/qcpUthi2/6sp
	c37fN2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvdG-00000006PpG-2kXV;
	Tue, 09 Sep 2025 10:31:26 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuKL-00000005oaR-3H8E;
	Tue, 09 Sep 2025 09:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVXgT9vtiT5MZDlYyTse5KMdJmZZPmds1Gud9kTDSMmqv9bgQW2GNICpHtfH8jJNa54OIhsaYlWM61+npHV0N+ybxGqE3KqMOzg3qcoy+a3wT7m4JUolX5yitXMAKOmYRa9WEkDkWiLQ5rOI93r7X3nqxwqZ7gv8T/YAdzE3Uk0Gojrg+PTG6TYIvZ6AbK7vbs1Ul3yxynuBMBljLbPn0OgWyRlDBwNQiik+4+r0Jr0+rmzmmGWGuomtjpruzDCbtOktKKz775OHzdPSHOfqL/EuU1JS/V658UY5EkEhzOdLNUt06AhP983pMUYe8AwnN5Y+apvwiayujM1MXLQU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyWWlN9HQT/rlFG9d8lLZTmbkndGBnMBpDK3hwQcUxU=;
 b=VC62Rf64KFlYL63D01IZfY0kiqk6tFwshpoFZy9ggg35CNKjf8bLkCXyPnf5ZeAFd3eHvt+PTTBJ/VK9Br8lyfrlFVQ63anbj4v2Tccj6J4wa6wBK+ndJO+dhiqSKHiIukikkzaIazqZZe0Nw39bhKUiy0qQdHBTvRX4WXnoW51F9KZ6/OttKDGZtrt9p0tVQLLH/LNaswEJud8fwWGXJDA2BuGReKbKE7w3Zx38MziftAAn3GoLOlBft2KOij4DKK5rn+Py6obihwubsbjoi7WtiwcdNP921Zz03qvDXOpvt7PtfaUEL0M0WsuaLOcJxCmmBZSR7/WIdugc5EmrKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyWWlN9HQT/rlFG9d8lLZTmbkndGBnMBpDK3hwQcUxU=;
 b=aCklxBdihzV8kgJqzkP2N42L2CfY3IxG4ZuLYhfXLBDN/+Ou7hsFjSVseWF0FOV/vCkSBxd9Ld8l+TdcDBP4+5fSWqZEjP5qj3s+zR91+TGS/OEB9KXB+EcFfxNHaFNUyBsDev2SMvbGvnnI3Vsb7UE39WkUneSAn7OdP9fPTARmXYYFJl39irtaNGR4GSZsLkZcU5o9FaY7SqrF9nO30GBhk/JkIeFNEmeaTMsSdcXv7MO+isX60hM67LRfRRNMqCK8NR74YAbsdL/UJu12UOgiBlULDXUQQZ1R0nNrhU4+XBC8s9fFh3EkSWSHVXVoBRIUfHS+vUwlzX85FUnx8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7348.apcprd03.prod.outlook.com (2603:1096:400:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:07:42 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9094.018; Tue, 9 Sep 2025
 09:07:42 +0000
Message-ID: <d196b903-2c68-4461-9129-2d8b33f3a86e@amlogic.com>
Date: Tue, 9 Sep 2025 17:07:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
 <20250909-add_video_clk-v4-1-5e0c01d47aa8@amlogic.com>
 <24ff2663-a635-4848-a2a3-7e4d404e31a5@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <24ff2663-a635-4848-a2a3-7e4d404e31a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 374e5c8b-2f4e-4358-6c75-08ddef805508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0pZdUQwZVowRzFpbVJRRzZnc0FyQ3kyZm1HUlc4MGx1UFRNQko4Q1VRaUpk?=
 =?utf-8?B?QlpWMXpuYzhPdWJmZlc2MmdweFkxYWZWTnc4dnZjcjJHUGFFME9sbUFrNFNz?=
 =?utf-8?B?ZnFsTjFUZ2o0dTRxUzBZKzJoeDVJQ3VNNVhwdVZpcTh3VUlWRkxIdEp6a0o4?=
 =?utf-8?B?RjgycFZMM1NwempXUEtmcnV6U2VJN2Y1K0NoRDJmZFRrbnBvMUYxampaSFJx?=
 =?utf-8?B?RHhyZzBtM0JraFdwUTlMNDd6MWRxdkwxZjY0R1M1amV0cDVkeFJRWko2VzRz?=
 =?utf-8?B?NXhFZE1vSzdEcGJvRWU4OTlZd1o1Rng4eFIrWFBGQkdDSEhJV0d4aWVMUXVp?=
 =?utf-8?B?QkhqWTdoL21IdXJEc1FhUlVadWtZYzYzMStNRkV1ejhwZGxsM1RyNXQwNWc1?=
 =?utf-8?B?dlVrcUk5anAvNVBnL3JPaWxoY014cFZSbU41dXB4dnd1K0ZTNmJuRDFoNC9X?=
 =?utf-8?B?Ny91dTV0cCtVRTQ1Z09jTzFKM0RQMGNDWmxsSzFYQVJTdDdMRHBzSFZ3VWlS?=
 =?utf-8?B?YWp5c2hUbFQwZlN0ZGFxS09qanNLVFdCa0hjMkg5VzFkRmY0cU05ai9HbFlH?=
 =?utf-8?B?OG9VMXByQkpUNDI3a1RreEtMbDFIZjh2aStjNCtxeTJ1Z0JuNytBYS9tcFBw?=
 =?utf-8?B?aFNYRldlWHovMGF1UWJML09BMWpJSDJmRXpWbnVOaG0yNmlXM3VqZWhuUDIw?=
 =?utf-8?B?NUcya0lvRktLNThBZSs0S1VGazk4bmIvbkdUMUxMNWU5cUg1N3E0ZmNlSWp0?=
 =?utf-8?B?YkwyUUZXdkdJNk4zT3p3cS9jeURhQ3ZpaC9yc0hqYnI3U3hOU0tFc2lhWXJK?=
 =?utf-8?B?M2xPeGVBODhGRDRVM3gvT2l6K1cxREh0VUtnT0p6dVVqV0RPNjdONnllQWhK?=
 =?utf-8?B?ak9Nbm1zZHdJSWQ5UEpTdFJiQmxuWWlVdy9uVEVGQ2VkRWw2akF2cmE2ckl0?=
 =?utf-8?B?dUtLUGVoaDlGOVl2QUR0cDE4aUhqVDRyNWFJcm1WVnI3K2NzTk1vU3U3cnBa?=
 =?utf-8?B?bnF4TmZRVlV5MTFEaFZoUFhuUU9vaWM1ZEd1cGpRVGFlOUFXSHhTTGFZbDlP?=
 =?utf-8?B?YWdTK09WdlQxeUN0N21XS2V6WXRPZ3F2Mmd3blJtQ0tTb2N4aEhZc1dnelk0?=
 =?utf-8?B?a1ZlR1NNSHV4M1N4SG9UeThpNE9tS0YxbEgrZ25KZEdibWlGckk5VWdZalpw?=
 =?utf-8?B?ek9TSE5mb0NMUXNnbFhocXplSFNRRWFLMGgyaXBOcG5BRERGc0plYWVpU1JC?=
 =?utf-8?B?WGdVaDlodTNLMlYyOVNzMXFKbFFVZXlnWGs5Z2pKalEzQS9SdENwT09rUGdO?=
 =?utf-8?B?ZEFkamhNRUlsLzQ1UUtJTGV3bHRYMDRKRkV2bE4zNGIvUHloWTBwdEhaTXNI?=
 =?utf-8?B?VE9OVjJ1RlU1Z053WWw5STZPeGZKY3RKUS9tNFdXUHI4b3d3QkJvY0hZbnR2?=
 =?utf-8?B?NGJrWnIvYXphazZSUk9jUnJxRU9qdEZ3dHE3amxicmVtaXlUZlYzRWZGdThU?=
 =?utf-8?B?cm1TWlZINmhjTkhZQ3hZczkrdGxFcGZUZ0g1WmpmTzFQSlF2emh3Q3g0SEJO?=
 =?utf-8?B?SDNuRWhwSFVEelZYaFJya2hVS3ZpMzhlbWcvWnFDMXVDY1BHbmIyZmFGWXRs?=
 =?utf-8?B?dG1FNFMvR0FiSnFjYmxCb2p4TE5vYUxnczczTS9ER1dRcG1nZzF0a3R2Vk5C?=
 =?utf-8?B?N2RTRXB4V3pzWVhzZWRhOTYrb0d0ajJSUHFWL3ZJd0xYTU5jSEdIZ2JXakZT?=
 =?utf-8?B?anA5RDJHQ3FqR2dkeTcvbWJXQmpBcWYyRENRSFhvbDluU1FEcGVjTFpvcTdv?=
 =?utf-8?B?YUtxQlpqZGVUdW1JeXFLV21hMS9Gc0F2ZGo5dStDTjZMdXpOTjdRVzNrRkFS?=
 =?utf-8?B?OUxMemZLb1lybk1DUGJvN1JBdklOWWpnUUlESXVCczJZSENJVWt0dWE0UzdZ?=
 =?utf-8?B?Y1grTmRnYjJObUFMTzNyaTVVbWpEbXVOWGNHcW00bGowcnNObHQ2NU9LQyt0?=
 =?utf-8?B?RDhZNklTRGNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THhsdmVMdXQ2ZENabEh1Q0xGT3dMZnFwbkNpeTAxbGFpMHgvalAxL2FJOGgy?=
 =?utf-8?B?SWpPdkdEaFpQWStnVkIwWitNamhHRlo0Ums1dG1IZmZDMXkwKy9Ja3IyWEFn?=
 =?utf-8?B?b0hOVktpKy9MbUNXTHlKcG1DYnZNRFFUSmppNFZQczczYkZBSDBoYjdPbHNX?=
 =?utf-8?B?VEd3NlBDd2FlNHdVMWFXbzFnZ0FMOUlHU1ZPYU42c3pKVnk5MHdJejY2dlhJ?=
 =?utf-8?B?UXlCRXFxNXpHbWZ1NFdyVm9wZFk1NnpTRDArSVlHMWM4SXRvOHBjZXNzamlz?=
 =?utf-8?B?dWxkZ2hGN0R4MHpibndNSjNKVmJEM096SFJEOGczQXNaY3lxNUVpaE9pMUUw?=
 =?utf-8?B?NTlGcWhXWlRFSmJYRng3VmtuQ3dFVTk4WnRsUTRaOThCTHZDditEQXBaTVF4?=
 =?utf-8?B?M1BKQVg5QVlKdEVaSzhqemZlUVgrK0dZN1ZmcTVpMTdYQUh5cjJBdk13ZG5v?=
 =?utf-8?B?NjRreEcrREN5UDZoTEN5L2JyNCsrcHdlOHp3NEVHdXBSc0NhVFdRd2hKV3lv?=
 =?utf-8?B?SEM1dXhjbDJpaDd0YnY4cFFnaFU5UmwrTTBRVzRacEVkSHhmaXRJa29LZWRk?=
 =?utf-8?B?NGI5czA2dFRLZ0xZMTdWMmxySmZ4R3BTZjZvZUx3bGpYdVoxdldlWXVaTTRN?=
 =?utf-8?B?ZTlIOGh4UlBoYUQwbmdMbEtnbnRwMUlHVktwNVJFUVZJd0xvdFBsZ0lwZm04?=
 =?utf-8?B?V3RNVkEyODBoMU5QU3loclBKSjdHb2ZYSGErQW83bTVoQkJ6bk1EZzhER3Nh?=
 =?utf-8?B?Q1d4YWhwVllUVmpHWTBPZ2Jhck4wdjhlbUZ2ZmhjYjY1VkFqbXV5aTFaVXpR?=
 =?utf-8?B?WVoyUVRXa05SdENxQ1E1elpWaDF2Z0V3UDFFU3Y2SlJXQmpKL3JleElmWllk?=
 =?utf-8?B?eW91N0Q5ZUE0N2lLSjhuTEJhYmFGaWJEa1pBelJiZHNzUHdORTErZ2ZoR3pN?=
 =?utf-8?B?anU1Z1ppM0RBV1huZlc5OXZkdmcvaHZjTFEzeFRlOUc3QmN4Y2FQTnNDb0NS?=
 =?utf-8?B?b0F4dHJNdmsyUmJiQ3RhNVRtR1R5R0VtcHNsNm56S0tRMGlaV01GQ1kvSWlQ?=
 =?utf-8?B?eUdMRDlFWEh0L2p5eFJ3aWZnTFczZ2tyOXBqYXFGelAxM2FjRTF0Vk5kMStl?=
 =?utf-8?B?TjRuZnZ3SEIwN1MxZzZPbCtsVHEwMmdLRmlxSlJBdVF2MkNpMkdPSytXaGha?=
 =?utf-8?B?R05VcjdOME44Yk83LzJhekJKc2hNaVZnek5zekNva0RnRWQvU3hob29PTGQ5?=
 =?utf-8?B?dFRMT3MxQ09lemZSNGYyeDFZNlNkeUdHdFNVanU2aENqaThRdUFaUjNuQUll?=
 =?utf-8?B?SFY1SmcwRGVOVWdMaWUrZVVmckRuUjc2cVJGU2dCamhlekNYYk5oVFc0OVhk?=
 =?utf-8?B?aXI3MzFMNmlHVExxNWJaUjdSUTNWVnBGbkNHMlJQck9rTU5XV0NyQ1VhcWtq?=
 =?utf-8?B?U1EzSHNMdXYwU0hNalNDdXhFVFZ5U1N2NmwzUURxQ1Y0OTdxUVF1RTl4VEg0?=
 =?utf-8?B?eDgvN0x5c0VMamczWGlIUDlDYlVDWWV0SEtyWUhIN1Y3UWg4VnJVS3R1S0Ry?=
 =?utf-8?B?UWYzS1pqb3JDc1ZOUVFSN09WUDRwdE5zQlBIckF5K3FGK1RwVEFuWE1wWSsr?=
 =?utf-8?B?TXVPcEMwaktwckFSell1UkRwUXVlU2hscDBFNzF3TzdtNUt4VVhXWGptdmlJ?=
 =?utf-8?B?T2s3dUFHQjVZSTJ4QXZXdjdNZ0JFYVZYbGVmemlvc3hmNktLakZ6N0svNjRY?=
 =?utf-8?B?RXNoV2h6NUlMYWlQcXBvOUY2d200dWtaMGkyMkkwdHJKQmVjNko1M3NzaWNp?=
 =?utf-8?B?V0Q4a29lTDc0NjdvUW9RdWNkWWNsTW9yNFgxQmgrM0lLTU5hd0Q2U2xBTXh5?=
 =?utf-8?B?ZXhzOUN5bmR2WTcrdjVTcGZBS3dJSDU0bm1RK0hucUQrVVpYcC9NbHUzTkVz?=
 =?utf-8?B?Qm9KWStlV0RpRDJQalVNZGlSQnl4RmZKWnZlNGJQdDBPT09BYk11bXFrSnNt?=
 =?utf-8?B?cFB2L2VQT3RZaFhYYlVrMmpFNVFmYk1pa2l2WGVsd0p0WSs4RXROTFIxUUhH?=
 =?utf-8?B?MFRTcTVmeFJvZ3Nxdm1QdVhFak56NjJLMmNrMkJxMEY2MXEyQmdXZWVXdnhG?=
 =?utf-8?Q?NpGQYIaQHeH4hZvrtAv/K3XRR?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374e5c8b-2f4e-4358-6c75-08ddef805508
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:07:41.9640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JxgDEqbWSp69WL4V3nbxRwAc6jRTfrAFjB0HspqrLTWV1MzfuSzX6clrDXeACTYJ0pfqAGSGOew1DmEaY9SLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_020749_840653_E0939B71 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Krzysztof & Conor:


On 9/9/2025 3:40 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 09/09/2025 09:29, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Add indices for video encoder, demodulator and CVBS clocks.
>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> What?
>
> You received one tag at v1, you ignored it.
> Then you received another at v2, you ignored it.
>
> You added these now... but:
> Then third maintainer acked it THIRD DAMN TIME and you ignored it.
>
> Three maintainers had to look at this little patch and yet you still
> cannot collect the tags. You waste our time.


My apologies for the unnecessary trouble this has caused. This was
indeed a rather basic oversight...

A few days ago, I used the command 'b4 trailers -u' which automatically
added your and Rob's tags. I then failed to notice that Conor had also
provided an 'Acked-by'.


Hi Conor:
         My apologies for missing your 'Acked-by' tag again. Do you think
it's necessary for me to send another revision to add it?  I'm concerned
about taking up more of yours time for what seems like a minor issue,
especially since the previous versions have already taken up yours time.


I'm truly sorry for this mistake.


>
> Best regards,
> Krzysztof

