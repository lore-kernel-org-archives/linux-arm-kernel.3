Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF6CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX9fKLsXMr+DQ+5gIyxSUJbHw6m4YYarE92rCAH+ysg=; b=Ee/A79cfCXq3AkxMPI53+GFrtt
	OPOOcXgAfwI36Vd6WhIYJS6Xt6Fk5ueQ8+lJZNhkTwnjAUXYedWcRtVzVTjM/jolir3vHnAe7rVXn
	nkIPll0WmTzduhE7wxgSwaQnzCpT/wPf1EHVxRzfvZOj23ki2A+dqqWglJuEHAoPTfSvfFwh+nVcb
	0MYv8UyDWFN2CjZm46wCNRcFmMAgkaeJANSmdu98kKAoOWCfCooxWk5qMSdfy2ZUvnE6qbjweZh2S
	2nM9ZaN6BUNlQZ7n1XlWXRjcjpOFRLT2LNg2ejaWLyhtz9xG7qqRzemwRnw23y5JOhzUxo6+keWGp
	fMH1WVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtkb-0000000FcQP-19Be;
	Mon, 17 Nov 2025 07:34:13 +0000
Received: from mail-swedencentralazon11023100.outbound.protection.outlook.com ([52.101.83.100] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtkZ-0000000FcPn-1c2b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqibfuQt3RxF4NRH2hDxTLLKQs/Q+9vIb5Tq1aLGGmSjXgNGLk8Sc0HJsxyY1Wolj6qoSHosQIQU7N1/7w6fHSgiwDpmvAMTPGHXEXMKlNv9rBSyA8OEAnvjUddgrrSXnwUGDFeVAK75IAZnwWH+FgqS0xcXd7WpWaXXGPbiU1Q8dxGNrIXLl787VeH+SKY8fabUMvbDpoKBLAMMaALPnCDu2hykquKk0l67RygI74BLZDIo9WxlDlPCWg91Zf1w++zS7uMki/2rkrtvE0EkaWjSGlAs9tK3WkhZRfSATvCgEvVDQYnknODCI0qpjPttu+D9zd0nk2hYzg014guTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX9fKLsXMr+DQ+5gIyxSUJbHw6m4YYarE92rCAH+ysg=;
 b=lsED2WZAC4RLuAvqt4PmIbhSrgohUDlcGwzcW/Khd4gsQ1+B2CtI9BPUAcijoaUtPi/kgBDLP8RpDAf85iAWBgXKzM46xFPJjFF615v6MDk3dxJtc5f1t8SAnwAJ5YHXOQXvzl90eYO19F3nWGCp3IPesoGEw72sBCd9ITiLh0DbZIUhuhhk+MFTgvGBWpNbKQvRa6cicSaweyayEhmF8mZmlMpYwIUlKj2L4qor1vbVGsiu37oQ+ztoTMefcOx9NukLeEt473ogmTJge/DuHHRmz8UvlTvcO1mF6e7A4+r61gx8A521qO8IgdJhpCPiujjWFUNw8PsZQOMYyZm1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX9fKLsXMr+DQ+5gIyxSUJbHw6m4YYarE92rCAH+ysg=;
 b=04HQ+3y+c5BK4GPInIZG6InGFC3GOyUxu8bXiJXzvuWU/qjp9zemybk5QHhDFNsyy5OTnOxzDjdm+pqDmSjkZDY0zXH5ZJc5GCTOo6H5AF6xH/J0vGbnbqlnUaQr1LNRMVWKbwcJWMH9yyUJHJJvBsfc3MeT5/gSKyZiz1cnkGRRql/cGIZCVOCoHWnghk65XxJBGyRvqHDzJCkDrPcfxiU2bqI44WybJFX3HrVFJi0NL+TmmgW3bpMRYh50nx8F2p/G70kcIUVyJSxMMwn4VZG8o27KKT/zUyjzwHWL+D7K7vrgIrhqsgg0M0LaqpDO1lUfMljTQYXZDB4T0tvCyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by VI0PR04MB11069.eurprd04.prod.outlook.com (2603:10a6:800:266::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:34:03 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 07:34:01 +0000
Message-ID: <03a64900-8ef3-40b9-94bf-c953de824902@gocontroll.com>
Date: Mon, 17 Nov 2025 08:33:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
 <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>
 <20251115-liberal-lori-of-youth-a9c3fd@kuoka>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20251115-liberal-lori-of-youth-a9c3fd@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::31) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|VI0PR04MB11069:EE_
X-MS-Office365-Filtering-Correlation-Id: adb02e74-a969-4b5e-692c-08de25abadb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXRrMXBva3VBRnAvTzgyb1pyZnpZS25OL2dRTCtMRU5XbVJUeTAwQzI1UGRF?=
 =?utf-8?B?Y2pqbTdnL0ErYnMzZG1RUERvYnRxaUNFc1o3cjdSVHhTN1I1d29GTHFrd1hP?=
 =?utf-8?B?NE1XaGZ0UzlSeEFHLzJqbTh0OTJ2YXJaZXdYcHE5NFRXd2JQVTlhaHIzVnJO?=
 =?utf-8?B?NXZqQUoxeUdSeVkwNDdnUzcvQnhmL2ZMVmJuMHlzRnFiZkp4bjhNdFJ1d1po?=
 =?utf-8?B?TjlLSkhXRHAvLzZLYVpmT2lYbmFsZVJGUHIyczlHN1BUblE4Qm5RWm1KKytJ?=
 =?utf-8?B?bE85LzExN3FTVnk3cmREZEZQelBwT2FKUVR6SkVXT3B6VHJENklIYXJZQjJZ?=
 =?utf-8?B?cWg0bGc4VDF5OUdoQ0NHUjA2OGd1UnU4bm5oaUR1Um5ScFE2ZHUyNjhFMVk5?=
 =?utf-8?B?RXFpZm54RURqbGRQN29GR3EyVitNbkdqS1dyc3g0Q0dIY3VMM3dYMk9Eb1No?=
 =?utf-8?B?ZXlYazZqQ1REb1JGZlhOQTZwREIwZG9MS0g1R2VPQW5qUEYyY2QzT2x6cmxv?=
 =?utf-8?B?bjZIU0lEdjRBcnAxMnBmOWRnSUtzT3pLMGlQU1FweHUyTk9TL1pDc1hQdEZt?=
 =?utf-8?B?aVdaVnVvMmpaMm4xdldZMFhXMTNYUjcrSjhkMWo2MmFjMS9QM0x3azg5YkMx?=
 =?utf-8?B?aUw2WVp2MDBNb1ZQUTA3cTg4NVdxMG56RnRxNUlCbmFXMjFybTNsVENqQWxz?=
 =?utf-8?B?N21vMXQvZVp6VGJySFYrQzBUVlo3WXFiUFN3bVQwZ2p0dDdndkpPZUdNZVF1?=
 =?utf-8?B?V2hleEowRit0SGxjM3RVbzhkTDlCQi9VNzd1S0ozZVFSM3NNbVRtL0plT2Fp?=
 =?utf-8?B?TGlodnJham1KVDJLYzhlMGFvbzZyeFk0TnVJNWVXcCtYZDIvM3RUQkJtcHpM?=
 =?utf-8?B?UFJxb09raXZHVElIUFVLNGUyQnRqTTRDRHBtUS9XTDBzdkcxZHVoanFtSDF2?=
 =?utf-8?B?N1dZMndXMkptWnJ2Ui9KMU9qTElqeHBBME5HUnRNT0RsUERQZW9KSnRQeTFM?=
 =?utf-8?B?N0o0OThNN2ZQcnNXNUtwZ0hWMEpKSTVlVktYeTdxK1lDaWRETGJEU0FOTS9I?=
 =?utf-8?B?Y0ozNE01MU9KazR3UDFjNUtUSm14bGkrRC8rcFEySjdRYVNpWFJYcWVQYUc1?=
 =?utf-8?B?RXg2bk0yT0Y3MTBJb3RiL1B5emszYXZYRjExK3AybU1PeEUzamhCd2duRXc4?=
 =?utf-8?B?KzZleDN4QUJSTFlkWGNzMi93dk9hb0VBNGFwZW51aDBVUmdXNFpCZkFaeGZP?=
 =?utf-8?B?TktwSVpxaGE3anUyc0VFUlFKWXE2MTRaUTJWQXVtNmgwcGZyNGJ6Vm5TaDhP?=
 =?utf-8?B?bkpqcysxdnFMWkxlK3hwSUR6ZlJjQ09iM1pKNzVSNzV6Si81Yzh3Y25nOWV2?=
 =?utf-8?B?d1NLcm9LZGJ1ZHBIR3dwK0tTc2V2T01oRUcyMWF5a3F3MThDdFJTZWs5Tmxz?=
 =?utf-8?B?ZXdLY24vR0FaZXMzUXhuNWx3NXFhMnc0YW9ZREVYdDRxSXBmNnVSVUJhSmF5?=
 =?utf-8?B?NVFQRjVrNmNkWSt2ekxUV0JOcEJIc2U2MjNxUi9yYVNoL1k4ckx3S0tFWnBD?=
 =?utf-8?B?YWpiMzhrVkFqN0JoMHhXazRLV2NqbGdDeks0Y2dmbk5UWFBudlJSdGpKTTYy?=
 =?utf-8?B?dXdLWnBsKzYvVHhOc0J3RHJOci95Sk5xcWNaTExGSytTMThNd2FBYlczR3Zl?=
 =?utf-8?B?TWJvY2Q3VXdBWkQ4bHFRZXUzQ2gxcDVCS3o1bHhoQitHMTFsKzcwd0twaDZE?=
 =?utf-8?B?T0IzUkVPVysyRFNNT0tVM1NmVVdTT1hMZExLMlU4NWtnQjZLTUFDZFAwQXpD?=
 =?utf-8?B?WFduOXZ6djVqbnJKVnVrNi9TRGdoVTg5VnEwQWtWdnZQVkFQbXdXMkc5YWNq?=
 =?utf-8?B?SmZOR0NjY0d4czlKL04zYVpnYWZzWFB4M0VlL0E1WitBaFNxMEVwelpzNTZh?=
 =?utf-8?Q?mOTPqOW9g0XIu4FtyHUj1P81PDTkTLRu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGYzaGU2b1RiMnM1Nyt1akpJZVc3cHFZTGIvc0d5ZjAyMytMbmdna1lyR2Mr?=
 =?utf-8?B?TWdVRElHcVBtcU1RQnBTUW1iWlRPNEpFZHBUbk5DNzExYks2RHM1RVdKdDZr?=
 =?utf-8?B?bFdpdUU3SmxkMkx5UGpJK0xGa3JJSGRDdTlKR1pVc0twZjQ0eS9wQUpIVnB5?=
 =?utf-8?B?REZoenlScDVFWmZIN1U3b0FtRTVHS0RBanVWMDUrckI4VUdQOXppL3ZmYm9n?=
 =?utf-8?B?VU10ZjhjS2ZLTWpmSXNjVzQ5Z290RkgvaWhDMWtMSnRuTFdsd1ZaeFZCcTBw?=
 =?utf-8?B?TTBXdVdQK1hKVitaVHE5VVFPSC9jWEQ3QXhrMVNWRGxVdzdUS1ZXZ291Rys4?=
 =?utf-8?B?MkJITWVrRm1NR2JONWR1S1pVVHUxV1BFQy9hOGd1cllncWF4NTVEMjlFckZl?=
 =?utf-8?B?cTk1MzhReXNrZDBLUC80WkxzWmxOTEhBZEJEWDVJT1hCNW5QaGN2TUp1cjhn?=
 =?utf-8?B?dFdJcCtGQTJ5b2ExZnRES0JOTVhEUTEyWVZ2eUo2K0F1SUFhcGhPWHM1YmNP?=
 =?utf-8?B?SHhNY2hsQ3NtK0lzN2xWTTFCWnpnZGJFOXYvRnU0bExpVmdrNS9tWVVhM2U4?=
 =?utf-8?B?VFJ2K3A4Ty9wTWVrOXVOVzZhS3hRYitvZzVpRE1ZODV1YVgrbTdLbStJbkpt?=
 =?utf-8?B?bEpqbHdhOC8vKzFtdWFabG1nYkFJQXBCcDgxZ3VaaXlBb3B0bGNObUoxUGFT?=
 =?utf-8?B?ZSswOGNKUXpLVXRja1ZJWkkrKzdLd2pvR2VYOGhxbEtnZHZzNDBRRlpiS2Nv?=
 =?utf-8?B?U3hTSVlaRnVONmVTdWU2bmw4a0RMRmt4OUwrZXEvbmo1RXdwK25vOC9sMk95?=
 =?utf-8?B?a3d3UGRPa1NCTjNoOHN5YmpENUd1SWVzWFh5VWgvUWx3cXBELzFlNTRKUUhR?=
 =?utf-8?B?ZXliSEgxcXQrUjZvWnFIeG81TXA2aFdEWW1MLzdFekk5Ymw1NU1vYkVhREUr?=
 =?utf-8?B?cVlqS3RRSWE5QXRyb2h6SjBDSmVnUHUrQ0RSVWZhWWJJQWhCakZKaldyMlVn?=
 =?utf-8?B?Z0hUaU1YN1B4bndIalh5dnFEWFRTdDdCVEIzVWdITGowL2ZiVHpKMjFveFIw?=
 =?utf-8?B?MHRqWGoyNktuT0QyOUl3S2hpWmpCYWM0YmR4dVI0MlA3ZGNtMWs5YXBlOHNq?=
 =?utf-8?B?T2tCNTdvQjFtcWpxQlZIYUhFUzI3bGxGTVBBTzBDSUtnd2x0RzJQemdHMVUy?=
 =?utf-8?B?RWwyeHFkVGs0M2hQeXZJclFjVkR5Q1FaT0ZUU2UyWVpZY21tTjFLQXR0ZGN6?=
 =?utf-8?B?NlZIUTJ0OXVZNWdCb1prSUlvQ3VwSWUrS1cwVkw4NHZ4WmZPUEdMU2NuRk9j?=
 =?utf-8?B?d0YvZEJvVkJnNHFTOUtHRnYwc2lSVTZrTHYwMUx1bGc1NExEQndDQURqTW5l?=
 =?utf-8?B?c3NQR1FNcmVPTlBUcExnZFR6dVZrcXVHajlXbUEwOFJHTDN6WUlNbjZrUXdz?=
 =?utf-8?B?QVNSNURiWTdjNnluMTFDdndUZEhZUUEzZTFDbXY4OWtBNFZ1M1pYdThvelRr?=
 =?utf-8?B?RVo5MXhkNTY4U2ZucW5xWmZRdXU3dXhwNzlyK25CWVhVWEcxa2N1UEJ2VDFa?=
 =?utf-8?B?b2lsdGZlazBFT3phZ3BFSlZWSzhKY0I3SThoMndTVldVK0c5bXlqSitpYnVv?=
 =?utf-8?B?d3A0SmI0UmFyOFNteDBYYTkyR2FJUGlKYmtvaDRZa2tlcXl0cEYzcG13OC90?=
 =?utf-8?B?SUp3aWtUOFlkQmF5UGF2bEViUmZHM2lEdE9iSi9Pa1MvSUZIOHNLTjhmZVht?=
 =?utf-8?B?T0RvWDBHT1ZrOEZVZi9XeW5JTURFL0w3b2FPc1ZPV3UxY1o3b0s0c0tSb3JJ?=
 =?utf-8?B?VnFoWVVNditrRStRY1ZwNzNCaGtCYS9xcUMzajhtS2p5TVhhU0dMSlpObFJw?=
 =?utf-8?B?RlhpcFhva1BmV1puQTMzUmJFUk9KdkJKVEVJNzF4eTBnaGJtRHE5Y1NsMElt?=
 =?utf-8?B?TkJGZFdmcldHS2tScWVoZlV6MU1PQlpjbGhzV2grdWpZdnQ3aC8veEJwVTNi?=
 =?utf-8?B?YTBrVDNHQnZsekdJWFlhcjFtdWFNUTZRdXR0UXVPNlZiQlV5QXIwblVsckdV?=
 =?utf-8?B?L2NTTkkwODI3djdYVjlFSmE4MHhFSGxLbTZFVUxzOU9IalZ6L2FodHdNVUlT?=
 =?utf-8?B?REZLL1FMU2czT0sva0NWL1FHSmZJUGNzWlp1cVgrU1lubTRPclhLcTA5L0ZV?=
 =?utf-8?B?M0hGVTFjbDFyNC9iM1huYWo5b3NnU08wRGcwS0M4SUJmY25kVmM5STR2Wm40?=
 =?utf-8?B?VkNUUnlLOGNQMVpGYk1oMXhGbUp3PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb02e74-a969-4b5e-692c-08de25abadb3
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:34:01.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHCLoA4UFJEv3+nudVfj00us/KPYEsr6zCAjeb3QjObSWT2MOrvUvtgkEtp7yuZHL8C1haRDDiB1qQiBt6iqbelNi5U32CuomHpbbQGXNYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_233411_446529_3AD8331E 
X-CRM114-Status: GOOD (  18.97  )
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

Hi Krzysztof,

Thanks for the review.

On 11/15/25 12:53, Krzysztof Kozlowski wrote:
> On Fri, Nov 14, 2025 at 03:11:49PM +0100, Maud Spierings wrote:
>> The compatibles should include the SoM compatible, this board is based
>> on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
>> the board compatible.
>>
>> This is a breaking change, but it is early enough that it can be
>> corrected without causing any issues.
>>
>> Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index 21b7168d61f5..8949a98acd87 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1105,7 +1105,6 @@ properties:
>>                 - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
>>                 - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
>>                 - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
>> -              - gocontroll,moduline-display # GOcontroll Moduline Display controller
>>                 - prt,prt8ml             # Protonic PRT8ML
>>                 - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
>>                 - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
>> @@ -1163,6 +1162,12 @@ properties:
>>             - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
>>             - const: fsl,imx8mp
>>   
>> +      - description: Ka-Ro TX8P-ML81 SoM based boards
>> +        items:
>> +          - const: gocontroll,moduline-display-106
> 
> You need old compatible here as well, you cannot drop it.

The old compatible should stay in the above section then right? Because 
the old compatible never matched the pattern with the SoM compatible. 
Should/can I add some deprecated tag to it then?

> I don't understand why you need board revision - commit msg should
> explain that.

It is to resolve certain quirks in userspace/bootloader, I will add it 
to the commit version in the next version.

The SoM compatible will be used in barebox to trigger shared code that 
applies to this SoM, I will add that better to the commit message too. I 
believe that also resolves the comments on patch 2/3

Kind Regards,
Maud
>> +          - const: karo,tx8p-ml81
>> +          - const: fsl,imx8mp
> 
> Best regards,
> Krzysztof
> 


