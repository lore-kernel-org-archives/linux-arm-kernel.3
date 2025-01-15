Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D4EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIGObzdz/VD66IyEas38efD8wsz6yh5kycSXh2tBod0=; b=zeEJXvXw+tFmMNbz9wKz/WJpk8
	BWR3hfUHfiFm8FYKt7t74vPH6+1DMJFEu7UprxCrFV2E/MWE3OaG/eu+qAtv+l+QKNUhRD2KDTZof
	TDUcN3/XaqC8G1ebMVqL1RieghZlZhz5RWVL0PrdVKy09Ml9CuIdz92GeTN9nslb8cPKbIMP4MGIo
	m8XIJ0AtgptRB/FJ0UQWpVGR7sv6FTDuVm3Sj24fZMMNPXFqe0FWzI/8+L2retILJY5rbyzo8T+1O
	uPtRP1+C3QhU+q4WoPXX0faswJ+WYQdMyPYaL3IqMQHAVrGNJ02pNJOyPpAFVqEBApwhjAMtiE8yq
	AokeWXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0qt-0000000BY4O-0pqf;
	Wed, 15 Jan 2025 10:42:23 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0lZ-0000000BX3S-44os;
	Wed, 15 Jan 2025 10:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOJkojCxE3rT4hb5lIA2R12X6WE5MRDl71PWNZ3w19wU/16tD3u5WtJadG7yzRpt4ubF3UfsclVuwWMSGmVoYUQQ93b898kzb0zVaRDOyfuG3NSetDCnjKdvtANKgAwd5wjou7uK9LTMWHI/LpWARXCH2X1ZWXO9diK3N0QTLrcKWQuozm4Sm/HH0WEf3vtBWYnLxU6acRI0EBHYGXKjBanyBmnY+14Ydhm20dzO8gnWLQnRZ+M86/zUXJNZ+ZSTWASnOD2BoLQXpkEAKGvGQHe/HmhoHhs8XAMvNdq1gVHyL6yOslYlNSf5xc8XTAjtRPWnTEps3FVj6192Vl2W/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIGObzdz/VD66IyEas38efD8wsz6yh5kycSXh2tBod0=;
 b=WGvD0uNDzNfz1wXoP8E5kotBG6C3HG2DzubpeBqZci/vQ7p7gIwgmocGVVY0KqPhw+KrEAd70u0txypz3p+FO5A3nssyjlMoQ582ZQEtLiEUtfwIK9B/ntXemkfpZe4i716G1jzt+qOJFGxt3AkfJVNhRzB26JwvwjiGWBtWkyFa7kAtmrGSL5BAvw6FWefhIf1yV33f7Cux2Wt30+GP7P8jxkaNK23VQ3qhx+q1U1KsAOPO8M2gms+Kyy71U0MJjZuIV3MDHE/ltGKcae9c0NZ12cZGQ1foCVN+Vhe09oui+Lo1XddtivrXjEYuXJ0RJSt5uRRQSiiRykTz58IvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIGObzdz/VD66IyEas38efD8wsz6yh5kycSXh2tBod0=;
 b=RJATuHTjsXLJw7g05Af2KWPU5MWPXtpT/ib0oEPfoouCBugyGZKWARu9YqVAnmdqK/L+Qt6fbEyg3De1wxj47tq1M/gCbtFgeVsyHyqUWtFyTkCFh2gmoOAV5NXWBVjBWrEQSblcmdPht0q5Y0OtEWgo6WsyQpo2yUtpLcr8MtR8aVoXluogRhd4U93aKh2q8H5WmNJU8SBhB6cJApen26WPVHw3kStijlIxw0IrqyAI7WtInpZ7mPBNQkPD+ABaOsYNAIAywxdRcQMS0ulzjBoqL894H4006nLytCdLA9xrB7hTFnhTNwp11ZsUc31NeQf77WxpXWdl24iRZOuuiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYSPR03MB7888.apcprd03.prod.outlook.com (2603:1096:400:47b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Wed, 15 Jan
 2025 10:36:37 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 10:36:37 +0000
Message-ID: <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
Date: Wed, 15 Jan 2025 18:36:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
 <1jwmey9451.fsf@starbuckisacylon.baylibre.com>
 <e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
 <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
 <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
 <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
 <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::24) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYSPR03MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5b5f2e-ab67-46da-f292-08dd35507d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjUwaXFlWW1HN0cyOHBOeWh0alBxMkwxN1R4dXlwZkd0VEtiSE4vSzhYcVFw?=
 =?utf-8?B?S1V1bkFoUERoUDl4cUp4aWFpUlBTa09EV29zT2wyaExtNFNoSzMrMmxHcUxY?=
 =?utf-8?B?SVIvUmZkRjRQOWpkVHNUM25kWVJUVkhpYk9IWGlmT29teGxsK05YcVJZTHd5?=
 =?utf-8?B?cEx0NGhJbGZmdk9uSW9DU0RLV0dzOHU4dzNxbTV0QUE2Mkw1Z2w0aTlaMWJM?=
 =?utf-8?B?cmRTck1YYWtGbU4reHNFbE1rdDBodllJTnVocTcrSi9JaG81eCs5V3pEcU1C?=
 =?utf-8?B?SGFhdVV3UnJmWGhqYTdGNWNWTlkzSlIxQUhYQmxwOGExNUdmMDRTc1VKcjNZ?=
 =?utf-8?B?SXV5eE5QV1I3VUJ3aEpsY1VKNE43emxORnBlVlF0Mm0rWGsyS1NTeWF5Q1Av?=
 =?utf-8?B?cmRkNEhvMVFkYnRBU1h3M1cwN3JpMTV2K0pLN1RlcGpTZWtZK3N5Q004bHZy?=
 =?utf-8?B?TnlETHZRQkR0aytEZGE2N0hWZGl4OUo2NjZ3Rnd1bU51ZUVKU3FzVENOQTNJ?=
 =?utf-8?B?dXUwV2I1TCtYbzNxTEp3ZWMwb1h1OVRFUUVORDFMaEJTdW5tbUlGNG54aFlL?=
 =?utf-8?B?NTZOQnc5RlRNWTZLVzVUbW1QUmF6elhDUDNqMXZWZHMrWG1WV2xRaVVDWnRs?=
 =?utf-8?B?SFdsQmpHdFA3REx6Y1A3YmVmUnpyeDU0RzRENyswamk5RGxzODhnOUFndjJi?=
 =?utf-8?B?aHg5a2RMcnlXeXNWN2tvVWdPcGVVOHZUbWw4RmQrd3lTT1B2Q3hHR3dxbnF1?=
 =?utf-8?B?YXRUalFGcTdzNVhoS1JFOUdiZjl1b3Y3K3NpZUFTZWpDdGVqcTROa3VzV0N1?=
 =?utf-8?B?bnJFbHZHT3RabUpWbFMyVTNJazQ4OTZkSVJ0OWtBamhkTE1PSmRXOEpHZnBw?=
 =?utf-8?B?MWpvMmViUnFzRlhIS0J4RDR5bTVZa2doVWlqT3ZXTUR5UjhqdGxWUkx5WnEv?=
 =?utf-8?B?Vm1yQkRwRFN2UjJZZUxLa3hGQzhnRXVoNSs1M2NONzZhdlpTRy9zNW1CaXN6?=
 =?utf-8?B?YnNXaSt2YlQrenJQMHJJZ0cvWWdTZ0RFR0JHSjlyLytLOHU2Y3hya3JpS05w?=
 =?utf-8?B?Wk8zTE51MktSU3NubEd1Tzdpc21TWFBwL05Xa3dDMWJ4YVUrb2lKSHlzc0gw?=
 =?utf-8?B?YnlDbmR1eUl2STV1TVhDaFlQU242aWcxbHY2dms3eG1zY2orTUxZUEc3TUxU?=
 =?utf-8?B?cnhSWDlTemJ6Y1hWNGlYZHRtSjg3bU1RSkVlNVZMaXRDb20xa2RtNHNjRmhN?=
 =?utf-8?B?UzJIU00yazRIempzVTFYTm5EVzQ2TVNxZ0NJek85L1VQM2NySG5xL0k5Rzdp?=
 =?utf-8?B?cm5OdGU1K3pLRTRkNDJnUGNEcW1CUkNuTEU1N21UQk9yTmllS2NidVQzSGdV?=
 =?utf-8?B?MFo3ZTVRT09qbzZCdTljNkpaUFJ4NDBwelZnSVJWSzlqWG5jeG9hS0o4QU9z?=
 =?utf-8?B?SGVka0ZnUXFzUkI0SUhRaThPZFV2VVg0T3dXd1ozQ1N5Qk9WR1ZQWUdnWVNE?=
 =?utf-8?B?R3ltMXNMY21TRGJwZXlNSnhsSXFmcjlVS2RJYlpJTllUVmVUTFhsYmF3djEw?=
 =?utf-8?B?NnFMMmNtTm5OUWxwc0hHVmtyWXBBNG9CenBkTjdva0grV1Z4N01aWHJ5TURS?=
 =?utf-8?B?NHU3MGdjVytJdmVxQzBXTGphYmZHdjVkNjE1MjROM1ZEZEp4RUxKU3E5UlBt?=
 =?utf-8?B?czk0MkZ6MHdkbnlDV0xkMGJOZDFmNnBpQzY4Vnd5ZzIvU2gxakJVRnNlMXlt?=
 =?utf-8?B?M3NiNzB3K2Z3TXFiMHNPakFheGNTOWY3S3lBeS9Lc2w4SGdUZExmVmwzVW01?=
 =?utf-8?B?YWJrRktTSS9ieHpFS2ZETytXV1VCc1NLL2M1dUdUVnJwNit6RTN5cFFSd1dw?=
 =?utf-8?Q?X6T+4l8X45Bc+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1N5RzhQRTYrRTlDNWVoS2lsa2ZmMnFiTi9UTWFNOWpwNjZQQ3RZY3IyWDZ4?=
 =?utf-8?B?KzkzNFA0dmR4Z29iUHhiU0RlTjFHVlA0SGRJWHdENFZkMkZvVFhGZENwTzY0?=
 =?utf-8?B?Q0w4QTBQbkR6MlFiL2FWb2duVjIzSVhBaWlIYjVWai9ybERBdXdJQ1Jqa0Uw?=
 =?utf-8?B?enRPbmU3d3hpOVdyelcwYjhOU25KVDk4c3QrNGlyaVNQdFZwYk15akd0SDlp?=
 =?utf-8?B?TjJHS2czTHZkdXNZUExPYm5xWlh6ZW9qcHdLUDAvOGdtWWdqRTJsN2FYZE1q?=
 =?utf-8?B?ZHFKb09Xb2RPanJPejd3dWNVVGVtb29PanBNdXVwdWd4anNjTTM4RHNBTlNj?=
 =?utf-8?B?SkczNkc3c2VPUDd0WEpGbURUU2NQaWRGRFI0ZVRsaEs4LzN1dnRxV3Fic1dm?=
 =?utf-8?B?a1M5WjFqeE81QzBBREtJVUxQS0tqY2J2QnNLWUJIVzlIbnI0WHV0SkJoQmZD?=
 =?utf-8?B?NWlmNDE3SytJVzBGWkRVUWtFRVNSVzJpaE1PdGcyUXhhOHpZVktNSW8xWXhV?=
 =?utf-8?B?SG91RGFjK0o5Wk4yZHhHbFBLYVdKNkQ2V3FSK29NWFNueW9Uaks2QkRCbjd3?=
 =?utf-8?B?Snl4SWcxcXk2RWF6UVpXOUU0d1ViVTVGdENDNVJWYk1pcVZaaXFGK1pLaG5v?=
 =?utf-8?B?c2ErL1lENC83YXhQYTJSV3RPWUFMd2VETXg2TTZqSzA0WnNjbXNXOGFKdVBY?=
 =?utf-8?B?Y3NPaUtsSURZTlZaZWFYWDhkQUlmbW9PQVJ3OEllNVNpRGh6eUtIajgrVzdj?=
 =?utf-8?B?VnVmNm9zRENqaEwzL2VTMTBTc3duZzFRam5OQVlGL09ZRjhvVVR6Tm9zY0tO?=
 =?utf-8?B?NG5TellkS1EzaTdXNGJDejZJcVpDaWlhRDlaNWlPYUxncXFHZnZqRFA3ejEr?=
 =?utf-8?B?eVMzMkpLeGZBdmpjK2pwQXpiejZIWlArQ0tFMHljOGpsV056c0tWclpseDkw?=
 =?utf-8?B?OTFnYURJVG1NVTFrakl3WVB0MXE0TW9VQVd0dWxObWxPQXZ4VlVXN3hhQ05Q?=
 =?utf-8?B?SXVweXJTblZJc0MwSkFXbE9YOHp2aGw2dzdkcThsdkczYU1DUTIvclVabDZU?=
 =?utf-8?B?bktiSmJ2dEF3UEZ0UlRlSjNLNU9LdlkzQjBEUjl1eTVNM2ZtSmVhaTRWNTVN?=
 =?utf-8?B?UnNKeWpDQnJUSHRpa1ZPcFFXWGhWWHBJZzlpK2NueUg4QUt6bDM3eUhXNTN1?=
 =?utf-8?B?UFoxaGtVdHQrS2FoOHUzSnlnZGRXbnFOdjJ0Mk41VTdzaEZSM1ZDYzJSZmhZ?=
 =?utf-8?B?bG5EdmpzYUlSWW5IUFpUc2d4a3dUcCtvcUFTYmNMTWkrb2Nqb0tmTCtuMlJn?=
 =?utf-8?B?VWwydGdYVit5eWZmL0lFZjB5NU9wdGprT2hBTS96Yk5wZjhtZDVOd1NXU3Yx?=
 =?utf-8?B?YUZIaHA5MEx0cmVuMnhaZkhnSUkvWDc1cjQ1eEhXdVRnOWdYZHFUb2lJM3Z6?=
 =?utf-8?B?OFNUbXBUWFlQSlZhYVZMSkZweFJzTDd0elhVc3VzaTFXNkdTY2UzTk55ODR5?=
 =?utf-8?B?NW8vWVJhQllmRVlZT29XS0NUY1VQMDJLNmU4VkxHRXpBZ0htZHcrUjhaWkl6?=
 =?utf-8?B?Y0VHdmQwU090STFKVWluOUh1SFhmWVM3MjBmalpTcmZsT0lEbktGM0NVSWVq?=
 =?utf-8?B?bk8weXJhTDhQU2FpWTFULzNYNlpyeitZeC81cnpvM1ZzQ204ZC95emp3RzhE?=
 =?utf-8?B?bkYxa3JaVXZpNU9NNGxDUWkwVTQ4dkxYaEtadVVld2VuakUxUUlqNXZudlpG?=
 =?utf-8?B?VzMvemFXU0dWeWxJbWhOWlc1d3BZakRrUzN0b1Z1VEpjMWtOMVF3emd5YUhy?=
 =?utf-8?B?M0VrZWNCY0l4UHVJUW9ZR05xODNNTW5NY2FHNnpIUktEOW5PN1h6YTJ2TXJh?=
 =?utf-8?B?cUlsNFViUmN0ek9KaHVTblJ2ZStRRWJvWVkreUtINklrRHVRZTRoK2tWZnVW?=
 =?utf-8?B?ZjdEZVN1VTVIQUJTNUs4QVh5R3hpa3ZkYVRuUkhPUmlraWpWTUVhTlJIdk9T?=
 =?utf-8?B?VlN6b0srNnBiNFJjVUd6R3ArMWJaRmNWUFBQMjhkYVBDVm45cmhTT1lNazE3?=
 =?utf-8?B?UjNUQ2Mwak9pQnczaVRXRlZ4NHN3dW03eVVIRTBhYm1BYUttZFg5S2xhdHBG?=
 =?utf-8?B?YWwwMDNxcS81TDhxWk12VmFlUGx5KzhXcEZXeGFFUnZwUWRlV0sxRE1oSEZW?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5b5f2e-ab67-46da-f292-08dd35507d24
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 10:36:37.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO54oIQzz8A2+ZgjA2Gv5aVhQRixKTLJbEz4UUlT+e8cn481mS7I16BCbD99Sw1uSSIKwzstWKOFNuXfTyMHAxwk/D6DsNVGhP0xNT0Ylko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023654_166136_D8BEF44B 
X-CRM114-Status: GOOD (  31.27  )
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


在 2025/1/15 16:36, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Wed 15 Jan 2025 at 10:56, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>> 在 2025/1/14 22:05, Jerome Brunet 写道:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Tue 14 Jan 2025 at 19:20, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>>>
>>>>>>> +
>>>>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>>>>> +MODULE_LICENSE("GPL");
>>>>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>>>>> index
>>>>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648
>>>>>>> 100644
>>>>>>> --- a/sound/soc/meson/t9015.c
>>>>>>> +++ b/sound/soc/meson/t9015.c
>>>>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>>>>>>>                  .channels_min = 1,
>>>>>>>                  .channels_max = 2,
>>>>>>>                  .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>> -             .formats = (SNDRV_PCM_FMTBIT_S8 |
>>>>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>>>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>>>>>> +             .formats = (SNDRV_PCM_FMTBIT_S16_LE |
>>>>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>>>>> Again, mixed up changes with zero justification.
>>>>>>
>>>>>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>>>>>> which is known to work and add S32 support on an HW documented as 24bits
>>>>>> only. Can you explain ?
>>>> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,
>>> If there are chips difference we did not know about, then you should
>>> introduce those difference, without breaking existing support -
>>> including for GXL, which is what you did IIUC.
>>>
>>>> the new ip not support 24 bit,
>>> Are sure about that ? that code has been there for a while.
>>>
>>> If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix up patch for
>>> that, with the proper "Fixes:" tag, how to reproduce the problem and
>>> explaining the fix.
>> maybe there are some gap , we support SNDRV_PCM_FMTBIT_S24, not support the
>>
>> SNDRV_PCM_FMTBIT_S24_3LE,  for SNDRV_PCM_FMTBIT_S24
>>
>> it is  Signed, 24-bit (32-bit in memory), little endian , the audio dma
>> busrt is 64bit
> It makes absolutely no sense to discuss memory layout for the codec.
>
>> it can get the full data. we send the 32 bit data  mclk = 32bit* 48k *4,
>> use the clk to send
>>
>> the  SNDRV_PCM_FMTBIT_S24,   the hadware always send the 32bit data
> No it does not. It send 24 bits of data over a 32 bits physical word with
> 8 bits ignored.

The original intention, we play 32bit data from tdmout, it play error, 
so we add the s32_le

for tdmouta ,it can bind Multiple codec, one codec is the internal codec,

other is external codec, tdmout can send the data to internal codec and 
external codec from the output pad

for example, tdmout send 4 ch, 2 ch is send the internal codec, 2 ch 
send the data pad

it aplay error, due to the internal codec fomat parameter limiting condition

There is a contradiction here,  Considering our internal can process 
this it, drop 8bit, 24bit valid

therefore software can set s24_le/s32_le, still  work ok for hardware, 
so Multiple ch can support for internal codec and external codec


>
>> so, i think we only add the SNDRV_PCM_FMTBIT_S32 base on it
> That's wrong if the codec does not actually use the full 32bits ... and
> I have clear indication that's what the codec is doing, on GXL at least.
>
>> we think the 24 bit is the SNDRV_PCM_FMTBIT_S24_3LE, it is 24bit in memroy,
>>
>> due to the dma busrt 64 bit limit, it can't align the sample bit, if it is
>> 24 bit
> Again, memory layout makes no sense here.
>
>> so the clock configure can't 24bit clock,
> I disagree and this has been tested. If you have a test case showing
> otherwise please share it.
>
>> by the way, We discuss internally for gxl,
>>
>> it also support the SNDRV_PCM_FMTBIT_S32
>>
> Does it really ? If it is just to ignore the 8bits LSB, that not a support.
>
>>>> usually support 16/32 bit for new audio ip , for SNDRV_PCM_FMTBIT_S24_LE,
>>>> it width =24, phy =32
>>> Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 bits
>>> width would support this S24_LE, unless there is something odd.
>>>
>>>> it was  treated as 32 bit to send for tdm, so we can only add the S32LE
>>>> base on it , right ?
>>> You are asking me ? How am I suppose to know ?
>>>
>>>> but if the gxl not support the 32bit
>>> I don't see a problem with a DAC taking input on 32bits physical
>>> interface and ignoring some bit on processing.
>>>
>>> If that's not the case, please send a proper fix change with some explanation
>>>
>>>> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>>>>
>>> If I understood correctly format depends on the chip and needs to
>>> adjusted including for sm1.
>>>
>>>>>>>          },
>>>>>>>          .ops = &t9015_dai_ops,
>>>>>>>     };
>>>>>> -- Jerome
>>> --
>>> Jerome
> --
> Jerome

