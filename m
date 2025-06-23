Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D011C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJHVDgwiWvmvOxA6h/J4YopEOXPzSmTbgluUEuz0QQs=; b=IWKAxfCaW/xlZuI6zr7gBja3OO
	m7uZOB+WgmLTSbYiShw+RtxYLuHpYKZZkCyptKSck4kWcVuohjCL7PnJOdE8VdhNQafW6iJTPrGMs
	sqZjn30JjSHNc1UgPTTFGoR45qGYcKaidySWwmlMvnLm9YC2OFibQ50AB0n32kci0nXUx1O1u3Lnm
	QC8t3WIs9eG09Y8ltN9JPyw5uDS9KZxxO1YGwoJinN4HKLwz5wViEnLp4+2WatKgzozzqEYKuCy+x
	UEK26l0RTmHBwTxhkW+4SMiPHtBFweIFM0i9zhrNH6LO44hKk+PYIf7kuoTxsAPGxI77Is9RMNp47
	fd3JldLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnpY-00000003vnC-2GLD;
	Mon, 23 Jun 2025 20:31:52 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgUX-00000002jn0-0E64
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:41:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd79OyqZFysNPZmqgaSSyXnhe9AcjL/Ale5Yt9SqjbZOW2iUkHH7CusqmKCF373cdww8qQKKC7oan3Oaj81aCAL2GbfzHdzJDkDI8x6t4a5Vs3ubXk3AcXBCXyeScIpMRpeYXRfEFJ6dqxDS65XA2H6pQCDYB5Myl8u9uTPvbNbVDCGkxQVP7yvuN3wPuO7khjbLA05DQvELOpC0AKy9g12OK50setmxTH6LQ1xCKkbZzkEU2/2QGI6qqkeDF2Xx7QjBMWAyZTmSEKRWXNNSChq1hveNM2ZyB8uKOhcIBryf9qP1TpdCrDmqLxuUJh//Dff5XloenLVlZ75F5xgh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJHVDgwiWvmvOxA6h/J4YopEOXPzSmTbgluUEuz0QQs=;
 b=KFP9kNyXeRBJVNRCebmGqt0fyLrfyYh22iBWpj9NFOPoDUi/8qFBjyZEuhZlG7M0w5gofy/bJ0rZ99sjiJyGb861/C0+0QMdl4IksEjlZ963kdGQg3WOM7iUb5/fnveXWdckstczXXryos0Z3PJc5mjhEbmwnsXJ0hyeceuqjsRcuRhx3VZPbe4numtqVcD/H3vemSethjVOEum5hDq1SYH9KCuGp9uiM5/myRS+KPg7fxNdGMGMro8+OitNU8OsORAkCVDtYdr+xTSn05GZsfmvbkJnH/cWnA0U3TeTy6FssgEDfpvZ3eGIzJyrL8GUWCF/YhxWLp93i290DZa4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJHVDgwiWvmvOxA6h/J4YopEOXPzSmTbgluUEuz0QQs=;
 b=gfPaZBShI9Dq4RKkTWrggg4dTir2Pea4OkmDGmIdd2Je5StC99/zqBOzlRYEwYRcnbEVYa86Lfil3qy0QunRKUErFe/vbo10nIN9277Qxj6PROG6kLouAs22p1+mEVdYm3vzVpq2N7Q2MV0dkygEjh5WGw6PTFBfCyE2IXXqFWfPfCyfMvMelm9cIWXXiWzJfRaYy/HK6rKuERyI/SC0Sp4ibgAFC0C31Qg/J2zRLiTuDeOQSxGprPWJC8eMgJhd1u8yHfyfbaAdD4grZTOKeAuNr34DMj/AnpRnaQYcZpxY/2kTBI39Uq9eeQ5RNDHirEnUfz0m8ETMsRMZN7htNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by SE3PR06MB8096.apcprd06.prod.outlook.com (2603:1096:101:2e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 12:41:37 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:41:37 +0000
From: Pan Chuang <panchuang@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Yangtao Li <frank.li@vivo.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v6 18/24] thermal/drivers/stm: convert to use devm_request*_irq_probe()
Date: Mon, 23 Jun 2025 20:41:17 +0800
Message-Id: <20250623124122.474673-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|SE3PR06MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a28713-e432-4faa-64a4-08ddb2534b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmczRnkwNzBmUHE5ckxDWjdKWTR6Y20ybXNYWkZ0UlBYdi9Ed2sya0Y1MkRw?=
 =?utf-8?B?a1drd3BaZlRlVXJaM3RaeVYzVUpRNlR2Q0xad3RGOU1uVG1aQyt3ZWtjNGRK?=
 =?utf-8?B?NWhzU2s0R0p2QnZsSEtVdm5jb2tpeEVpb3hXWFNoNWxPTzVLK1ZQR1AyMUph?=
 =?utf-8?B?RXpVZU9xek1oS3l4UkFPVnkyOWxlVjg5dkZKNlRjbi9hVFVmOHFnUi8xZTdL?=
 =?utf-8?B?S0JyaENNbVc1TUlDYWorRE5Jb2s5UkttM1VSeXNmSnJ4MmlzTlo2NHlHUHVR?=
 =?utf-8?B?QnFIcngwWk1NVFc2MmQ1OXpZTEdZYksrbFIxMnRGa05LMVFuckxqV0hLRjBv?=
 =?utf-8?B?YkRFcFUwT280UFkvNzRCWVJZTVdRYnpOdm1RTUtzVVRncWx3TXZBa3NpTjd1?=
 =?utf-8?B?R0hpVHE2ZDVTYlY2M0xjVlBRTFhVOTNTVXBLWWpFSloxWGZIUHpDTm1yNW1k?=
 =?utf-8?B?L0VkVnhSMFhrcU1CcmJKOXlqb1BYaDRrY1Izd2RPQ0dURXVoSnZoUXZJdmtY?=
 =?utf-8?B?TS9EdEJJQTdlaGJoWDhsbzhSWUR5ZkVqeUZ4NTFjcWxFbENxSngvWGNPZzhj?=
 =?utf-8?B?S0dvM3MxTXhKYTgrT1lUalpaZUJISDJqc3psaTMyMmlkNUtrVE54ZXRGOUNu?=
 =?utf-8?B?aVpZVnZ6ZWtZdklONmgrNHVBS1VhMDV2eUFPVG5QcWIwS1VETnl5Rm1iUHVl?=
 =?utf-8?B?NnMyWmFQTjBvVEhFa2FKSkhzVFhTSm1kcUE2UnRReUxsZHhYYlJ3UDZXOHBS?=
 =?utf-8?B?YlU4OEJyOFpUZGhwM3hZODdESnhhUlJBWkNtSlRmWEh2MndUTW5ud0VjaDhX?=
 =?utf-8?B?aCt1aUtwWG1lWjhCSHExNE1jYTQvR21Za2pxanRxM1YyRGVGVzQxWXhwV3BU?=
 =?utf-8?B?SzUzY1doZ0RkME9oWmNGbCs1SEhyUjAyaHI5REtvMWxWT1FONjk3TDhyN1R2?=
 =?utf-8?B?VUFObmJvUEFMR1grWmlFWDlHQmw3MzNFaDU1QjlBd0UxeFcxblBtL0tnT2g5?=
 =?utf-8?B?WVZBOWZPb3pCSk9ZamRIVHh6c0dZL0VSam5sVDJhUHlmY3lYMWRKOUlYS3Fw?=
 =?utf-8?B?VWV1Z3VpQ2FReVpleGtpdlcybHRPV3VjMUtHZjg4eUNOdlpremEwNUsrREhj?=
 =?utf-8?B?L2FZaXNmSlJMakhQcXZISm9FREZtS0hkOCtJcmxKYm9TRDk0clplS2JKOGRD?=
 =?utf-8?B?LytVemlMbklUVnB4emppTU9XTEkxSVdsRFViaEFVeHFFVnlQWG9aQndGVVdF?=
 =?utf-8?B?WWd1L1pMTmZ2cmw5YVZMQSs3VlpndGw3RGZKc1ROMmdybHA1VWQyb2gwdVlV?=
 =?utf-8?B?cnU2U1hDL3JDVEdHR2xqTGlDelAzN09CTEYyVmE5VVpQYUhVcUtxSlh0ZGpO?=
 =?utf-8?B?Q290MFdOeFdYK1FPUHpzUDREMHF2UDNwWVJvZTVFTFFPLy95REZGWWdjbWRU?=
 =?utf-8?B?QS9BT0loMEZiNlRnUTVsU1BvdktLSkd4QlprRjY1L2drL3FoMU5scW9oT0hq?=
 =?utf-8?B?anJkejJPOVhWcy9RTDdPNm90T2VjREJZSXJNNnErTzlUTk9zYkFxTnJFbjBS?=
 =?utf-8?B?Qm1VSW94TStZNXFkaEVnZ24vU3MzVTR3Znd4WHorLzVVbkpVdDJZd2NJZjRG?=
 =?utf-8?B?amJXS3JwRU1hVGsxeStqVFJMZEdtbVJvUysweFQvTFBnd2h6WXV3Vlk0bUpL?=
 =?utf-8?B?M3R2cWhjWFlnV2pwbFd2NmZ4cmMrU1BuSW9mZ3JPT1FXQXhhNTlkTEt4VUxv?=
 =?utf-8?B?NGIwMnN0Q1Ixa3ltYlBrVjhnODhGSHFJY1liNlNZckhjYThod3BjUTk2ZEtY?=
 =?utf-8?B?aE1LT3pUMTBxa0ttSk5sVW1jV2IzNjdhTGY3WDVER3BsN2hIOWVLUU5jM2pu?=
 =?utf-8?B?aXI0MDhnVXc5L01VZGdkdzYraWZDRWJnQndmcW5Dd1NRUUovb1RrVkFMaW5m?=
 =?utf-8?B?WGZLcGRlV0ZFeWxzSTB6WElETTBLTHBxa1dZL3ZwOHltbFFEWHZIZnh5MUdS?=
 =?utf-8?Q?gOyOR2k2STSqojtky510NbCdpx6faw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRIYnNYMEFmSTNBY1cwYmpUdmk0VTI3ckloQkswUXVWSVFuSUtGdzR6L3Bh?=
 =?utf-8?B?NnFoWHFDNGVhUHJpOHh6VFF0WEQwRkN5YVhyZDZZZ0lraWU5SDZkaVVJYk43?=
 =?utf-8?B?ekt0WVVsOFdkVDBROVNiR3pmdUNUN2RKU0M1SUJTbmFRWFF6WnZFS1RaT1Nj?=
 =?utf-8?B?WCtlRHg1dVNKYklhNzhRVHVIanlVenEzYWhKcnhRQit0R1NodnIwY2FkaEFm?=
 =?utf-8?B?c0lQVkc3MGxnTHVXeEhYMS9VV3duOGV4Yk8zVmhXT0FPRDVlTGNEWjM1NWRl?=
 =?utf-8?B?Y3RxemEyakU3eW5LVWJTUjdXckxOT0xJU2V5TFJMWjIzV3dsaFMwYmloMWdi?=
 =?utf-8?B?KzNRQVBwVWJTR2pxMVc4NllnMi9VczVXRWVoME5xRlR1RWJlQTFJejlab21j?=
 =?utf-8?B?Nmx6bW9uTlNMdWRIcmR6cVVNWFczb3RxVitTUVBnUEhKSVk2OFMrMmM4cXRa?=
 =?utf-8?B?S010NSsyUDFDNVBjWm5EaFJiRHhWL3FrVk1Ga3R2dm9OeDdkL251dkVOT2tp?=
 =?utf-8?B?NmVwK2NnMjdsRjRSdWIwRzU4NzV6dnZkWFBjNnhwZGcxNVN4QTZSTXExV1Jm?=
 =?utf-8?B?Y2xMRXZiQk9hazRpeGtDeFVMZnNLME5yZlcxZXZnQ2JCL3ZoSkJWQkdjMzJ4?=
 =?utf-8?B?akNaMzg5YXlmZGpzOVRBbmN2a3MzS2pYTWp6cktQMTdENjdIMlVQRDdqblQx?=
 =?utf-8?B?SE52bnU2YmIzNGtoWFFmU2RhNlR5ZU9WS0ZBZEdOZHVOS0V3ZzNjQ1d6bDlI?=
 =?utf-8?B?elhWMTM2SnBHSGU4Q3VHRUJEZ1pXS2MrNG8ySDVkclNnaXhnTFlNQ2xhMWpV?=
 =?utf-8?B?d2dFVGpDNW1WaU1GaEZsWUs4SmV4ZmhDVStPR2M3R0xHMTlMeHUvcThiZmV5?=
 =?utf-8?B?Ny9pcGQ5cHhMcHFwb2phMDkrdjlNWDhVVWRtOHV0ZW1jZmFObDlKc01MTVZX?=
 =?utf-8?B?YmowMnNLTVdlcCtOT3VyVGEwM3Y4Smh2NklDQU5yZG1lY2d0eW14bHhCTXZz?=
 =?utf-8?B?Zm5uWGNwbHZ5VEtwYWhFcE9EbmhQRzF3SEM1eUxVdzY0dGNObGtFWG5KNklI?=
 =?utf-8?B?TjgvLzE3VUsvUXlMWFVZaXhEVGQvL2J6VkhEL1V1ajRsR1h4M0ZrcFJJOHh0?=
 =?utf-8?B?UnpERGJ5TTFJK1FhSjh3bUJDaitBTHo5ck8zNEZ6MVhSNE5LeWgvb0NKa0tO?=
 =?utf-8?B?L3crdzl2VDh4WUhmc0hTVFdDWCtYMDE1NGp5THRxVk5qTmMrbFBWUVN4RlNF?=
 =?utf-8?B?R3UwT1QwV0JmenVpMVFnQWorUXJwcHlWeWJVeGd2bkROS2hXT2N0VHhPbVly?=
 =?utf-8?B?RGVXWDdTOGdaMkowUnRHMHlCSWxwNmRqQ2xTM1Y0V0pxRHl0d2YwV29OR2Jo?=
 =?utf-8?B?UVhyK05MZXhFaGZHTUkzaEt0SCtHVlNlYmhvZEpJUHRDdmxwbHYyME1DWkY1?=
 =?utf-8?B?UnIrN0h6RUtEQTREU0hvT2NvYWEyOU0rV2pHNzhIQUk4VUxVV241Y1FyMzFm?=
 =?utf-8?B?Q0F3Sk10MnFES1RtamFBUkg0Ky94VVlRRGt3SDNXMEtNdXdDbWhlRjJ2QURS?=
 =?utf-8?B?dkJOUXI4UHBjM0dodm9halpvYitGV0VkUHJLcW5HN0xMZXk0QVJ6UlNxU29j?=
 =?utf-8?B?c2VVNzN3MWR6OXppWmpGdHIyd1lWMSs5WEZWVGpLRnhVRXQxRHpvTkNkVjJi?=
 =?utf-8?B?b3dORTVNb0d5MkZla0s2SjFMVmlnZ1VBV0RqQ0lkVGZlWTFMZEU1NkFXTFlE?=
 =?utf-8?B?a0JkL2xpcUFERmdzN0U3TzNodUF5NDhPV0FGTWdLNUtjb0F5TkJ1TFhvbWVt?=
 =?utf-8?B?N2MySjA2V3pOUGwxb0UrQTZTaElQZFJIaXFlY0g4ZTd3TTFIWVhGU1ZNYVU0?=
 =?utf-8?B?dklaOWFxVitSNE5iSmNrVXJIT3k2YjdsblNuSlhicTBGWDZ4Q2ZKbCtOQWVZ?=
 =?utf-8?B?TGIrc2RMU2d2M0ZhVEExOEs1OW9CMm1UNW1IbXBLVzZKNFZkYUpjTVVoUU9N?=
 =?utf-8?B?Vm9iNXM0V1gwalVPQ2gxRU12MXpnaFJmZ3hvdjI2MWQ0SUtQS0E5WnEzVjJX?=
 =?utf-8?B?YnZXM0NLSzhxanVNMkdxcWJ0VmNoZ3RCQllLbzN2ZWpIYkFCTVZwZmF2dE9z?=
 =?utf-8?Q?59Dn0317ZdMc+3e1KXXiHvldl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a28713-e432-4faa-64a4-08ddb2534b36
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 12:41:37.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Siklz3zFisNcSnIKLTgyTw6fFmq10IRet56WrL5SYwzwgFDuinNe6sJJodKR5GKhQJMf1oK87Vp5sjadcSLgPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_054141_096359_509B4303 
X-CRM114-Status: GOOD (  12.98  )
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

From: Yangtao Li <frank.li@vivo.com>

The new devm_request_*irq_probe API prints an error message by default
when the request fails, and consumers can provide custom error messages.

Converting drivers to use this API has the following benefits:

  1.More than 2,000 lines of code can be saved by removing redundant error
  messages in drivers.

  2.Upper-layer functions can directly return error codes without missing
  debugging information.

  3.Having proper and consistent information about why the device cannot
  be used is useful.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thermal/st/st_thermal_memmap.c | 12 +++++-------
 drivers/thermal/st/stm_thermal.c       | 14 +++++---------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
index 8f76e50ea567..f0dac7a17883 100644
--- a/drivers/thermal/st/st_thermal_memmap.c
+++ b/drivers/thermal/st/st_thermal_memmap.c
@@ -97,14 +97,12 @@ static int st_mmap_register_enable_irq(struct st_thermal_sensor *sensor)
 	if (sensor->irq < 0)
 		return sensor->irq;
 
-	ret = devm_request_threaded_irq(dev, sensor->irq,
-					NULL, st_mmap_thermal_trip_handler,
-					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					dev->driver->name, sensor);
-	if (ret) {
-		dev_err(dev, "failed to register IRQ %d\n", sensor->irq);
+	ret = devm_request_threaded_irq_probe(dev, sensor->irq,
+					      NULL, st_mmap_thermal_trip_handler,
+					      IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					      dev->driver->name, sensor, NULL);
+	if (ret)
 		return ret;
-	}
 
 	return st_mmap_enable_irq(sensor);
 }
diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 6e90eb9f414d..267b86e2e8c3 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -385,16 +385,12 @@ static int stm_register_irq(struct stm_thermal_sensor *sensor)
 	if (sensor->irq < 0)
 		return sensor->irq;
 
-	ret = devm_request_threaded_irq(dev, sensor->irq,
-					NULL,
-					stm_thermal_irq_handler,
-					IRQF_ONESHOT,
-					dev->driver->name, sensor);
-	if (ret) {
-		dev_err(dev, "%s: Failed to register IRQ %d\n", __func__,
-			sensor->irq);
+	ret = devm_request_threaded_irq_probe(dev, sensor->irq, NULL,
+					      stm_thermal_irq_handler,
+					      IRQF_ONESHOT,
+					      dev->driver->name, sensor, NULL);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(dev, "%s: thermal IRQ registered", __func__);
 
-- 
2.39.0


