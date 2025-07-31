Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EF4C88CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znm0k2Jmd3ETrnmusoLkeQOCYyLvomlsl6iv7JkuAlM=; b=3V98ryEvLwTTiDxlsQ3cUM1rcE
	8Mvl7SVlOxp36ZQgoikZCMFQ6zr6OwNO27pUbU4bG4ar5O5uNUqvioxScyFxH7RK5fzSEbHd4bdCm
	c9tBqiuWNWakUHHy6z/duWv/NQ+ZdluVKuNU/40XV+h1V1ZjDF4oZxVCqfvizWHuYsc0kNuQu+qPt
	7Y0T64IJb6CcjHhV1+KkZGKRaldXoWkiMOfxnPb8XjPsuHCRdTnAUfCHJJM4+NbG8i85uuavstd8A
	SWHTgDSXlSoWvwSOvMwMoyOIjjZTQ2duRq66sFjPRjc2ogIa5Vvy3E9rJDlQYTpLmO/MmUiwachH4
	y9fCwXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZa-00000004blR-0Nbk;
	Thu, 31 Jul 2025 23:20:30 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcWv-00000004apU-0iFv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 23:17:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYubF/p8fxeoVEjxLWwl8VXGfE0Wve9iOMdHYa7UsRvSIPNlm3AuDuAty2T+dLwxJohdmtMtk4XCW/GxTNBYUWZGwJPqg7y4nT7XwaZSIkhPPlE9zQvLDm7TlDo54RENMftvTqjYcDqtCjSV3Qs4GGtZ/4wyFVS+UyI3keR8ol2gEPnA+ZirVCJBXJ9QSbDxhcLVomAltMhgY7ZDHqwf/YefNOmODeVtMpe1J7Ub+XLbsusbylr/t95xtWMuulyaBotSGzWk6Wb6UT/h3Lsxv2xXZQaMEFTYFjZ4WHu8tCayqd2B5fz3GT3ujQMfRgWLYIhS3V2FfBeJwJ3VehXRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znm0k2Jmd3ETrnmusoLkeQOCYyLvomlsl6iv7JkuAlM=;
 b=x6IAP7CN6Rp48ILmvniqTlrwEdY2E2Q0//i6OaIi5K6GDkyATC6Xb87IxDqoAaS9fcYGIeq5HBYyN5r3yhEfE6t+EtHCOuN1QlQhHEBL97dsfmCtCAVvUxmHCrLo98vAZbFky3oD5Vm3oH8ZKxlsMrK9NNYAlS+9h56lo80l6c2R5IdeJs3W0s1YMVaCqQk/93dgEtsqT3y3E6V3n9WeqDJ1xd9Z9FsK2/uppjDnolAGye9P44jJBJ1tEDYqlLPqHZqM2ncSTz/HRnChkwwKlg1fx47iz/57FNLYVzAoJzUaw8qj1IMfWqgIT49QFhegkkMfhosFAPYuvemtCtPoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znm0k2Jmd3ETrnmusoLkeQOCYyLvomlsl6iv7JkuAlM=;
 b=M2mJZBfhobEH+fhQyhT6EGQpS8zhELEHKXykVE03fbPFcTdtFt4w/9w/SAxKS3jCTML+pdNYwarKbVuNBDvJFyrtNWjWf1vqksQCDvODWqurAY0gg1MN9y0Bdk2FtTmrmWLyHRmomORurcB1X6ZMN1fhMmLLWo5PI5CUfYI0CIEDOjlFTnxi0QTsx/NxjtLYteCjeUWIgrKF4npHTAS0RKBy/Gp78JL+azplp3KdOVpzoxMG8fnu9lM7Sw9OT3gQWeNh+IgWIchHD7K/JdS47UQBmGuRBETecVh9xksVyJC97mrJ/wLQim3JxRfWRfRc5nweYYux6rCIjqfhDjarSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Thu, 31 Jul
 2025 23:17:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 23:17:38 +0000
Date: Thu, 31 Jul 2025 19:17:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mbrugger@suse.com, chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: Re: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
Message-ID: <aIv5hYGq+fNStRBw@lizhi-Precision-Tower-5810>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-3-daniel.lezcano@linaro.org>
 <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
 <87d40626-8789-4e71-8ac3-fa8fff0a7435@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87d40626-8789-4e71-8ac3-fa8fff0a7435@linaro.org>
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 794a366d-1fed-4340-3b5c-08ddd08870ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGhzdEVLb1grOWUrTzFUVXA4U2JYV3c4aWYrK0czRGtFTElENm9Zak5pd0hi?=
 =?utf-8?B?WVhFcUxZNEdCTysvR1FSREwwV0M0TFdxendqdVhTa0F2SlJXRnU3eHd1clpT?=
 =?utf-8?B?Vm9yamgrUWc2dS9iYnVSZkdrZHg0QngyZTQ0dnNCVEFGeVpKK1pxRTdpZjE2?=
 =?utf-8?B?NWxLRGxtdUdWSWJLNDR4WjkwSS9mbG93S29YZnoxYm9XeWFMOTFvd2d3RmJ1?=
 =?utf-8?B?ZHh0UHNtZ2VFTzcvaEpjcjVWTDNiZ0dIN08xTWRuM3JNUHFqVzNBK1dWRm00?=
 =?utf-8?B?aGFNb0YwL2FtMWIwSmVzelVsai9CeENGQjF0Ymd3Nk5YUzNlQXQ2M1Vpc00x?=
 =?utf-8?B?N1NORE1ybXVEWjZCYjRoNjIxdlVtc3dreVBTOHd2d1lpODBYOHp2UWhQODJZ?=
 =?utf-8?B?ME5NUVExb1hka3ZRZVlCSVc4RDhDTTNFU2hQb2hVN0lDbUZTV0t1OVlvS2Za?=
 =?utf-8?B?NnBsSzBjMGdaeGRWTDljWEd3cVl5UzlOUFRtcFFLTUg5b05HL0hTS2VXVDdR?=
 =?utf-8?B?V25HM0dodzcxUFR1NjJFSUtGcnRaSEVmVzFCU3RpUlVQUitlWHpxOGNEMDVa?=
 =?utf-8?B?Tmh2akZLSkJ2RlBGWkdSTDhOdU1DYTdOV0t5NDkvZWJtMG1aN1o4dzFnMG52?=
 =?utf-8?B?VkI5V21hdTUvbUt4dDVBWmhzVWNaOFhRYzRwUXBMNkdPS3hVazJ6a1E4eXF5?=
 =?utf-8?B?WjhFczRjTW9GRmlFOWJqMjlGeTVJL2hVYVlIcEdpazhvU3h2Znp1Z29OVURY?=
 =?utf-8?B?MFRlaUZzSnozRTRseWdnZTVOQ25LU1oyNVoxcG1EUkM3NDdYSi9LTStJWEtr?=
 =?utf-8?B?cndOZDNFWlM3R0h2WnFCRjlraUlYOWpNSFBjcTBndVZFN0Z2VytPTWt5NHZL?=
 =?utf-8?B?YWVvTkVKcE83NnZuM3hPSnNKQnEwajFhS0d6WjgxS0kwM3V5azc1QkpESVVY?=
 =?utf-8?B?SmpMTzZDMkdjTlM4c2xsYWlFekZXMVdtbksxMU9ORlRsN2E0U2dhNU85UFhw?=
 =?utf-8?B?T2VhbVM1MnovdEIrWEF4MVlpc2doaUtCSUxmMzBJVTc0NzQyRE93N3kwanVz?=
 =?utf-8?B?RHUrZmxod2R5MUNaZE9DRFhaQ21TUDVCK1R6NU1KSUFhVTFzLzVLSUtzWnl3?=
 =?utf-8?B?VmFPWkxhcjJ5K1VVVnYvOU80Vzl4Ti91UmpvU1hiejYyY2pGZDU0WnZ4bUt0?=
 =?utf-8?B?QVFZZzh2SXhIWGdjcEZFcDY2NThzVkV0NDRqNjIxeUFIY1l6ZU9tbXJiVG95?=
 =?utf-8?B?Szd4WkI4M2NwR251b3VEYlBUOHR6MXpUNk9Pbm0rWElSbm5aTUdaSnVHcy9l?=
 =?utf-8?B?enhKM1V2azRqdFoyczNlN0JWUjcrWC80ZTZVRVdEbTNremtRQzdyMTk4Z1p4?=
 =?utf-8?B?MGpiYmc0bXY2NkpGcVVjd0hVdFBRaHhPdHErSmRXZFNUVkhWTU0yVE1QTmU3?=
 =?utf-8?B?WjlhNWcyMC84M1lIc2JwN3pzRU03ZE55b3ZzSUg1ejJFQitQMTNUOHVNeTdh?=
 =?utf-8?B?ZHNpMHpIeHlQT2lrcjhyVXNpSzdld3VqTU9ZZmMxTk1EdHZ4Z3B4QkdxZG1Z?=
 =?utf-8?B?MTNMbDd4ZGJoeEYxNGc1L24vRk1ubjl2Y0hxN2l0VHh3SUN0Y0FDRlZlV0wx?=
 =?utf-8?B?OVR6ZDUvK3RseDZDMkp4SjVGZWFWZHZRdkY4eC9sNURjbkp2T0dKL1BMbElG?=
 =?utf-8?B?SXRuRERMWTAwMjVtcWgrK1h0cWd2dWtFcUV1ZzloNFZxMkF5ZGFvT01CbkRa?=
 =?utf-8?B?dHFONVdrTGVVUXBOdWZLWDJCMUhwQXZhU21MOXJLZGhhcm0wVmgxWGxDekNs?=
 =?utf-8?B?Um5nYXpwc2ErWWUzUHhWVWh5SU15Q2lvcDF3TUh4ZEVVb2EzeUdrRUV0cVpH?=
 =?utf-8?B?Zll6TkpOcVlubGYwWnU1bkFZRHY1Y0h3Zkd3TG1RS0JpOGhja1NMWk9INldj?=
 =?utf-8?Q?zq6GkHclp88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVliZVlRT2hUSkU5QnA2ZFgyMjVzRTZuR1IwN3lWeG12ZkFYT2laUTRITFE2?=
 =?utf-8?B?TEJzVmxGMHFkbmxBMjJMREVPUzE4ejVocVNyeG9nZ1JCek9WRFBVZU1qdjJ1?=
 =?utf-8?B?N2dIR0tiL0pROTZ1cW9aRm5tWU5ETnZiZlZMeUxRbHpqdVd1cHRWVnlyQ2h0?=
 =?utf-8?B?TlE5b3h0NzdiWkxRdEE1bUJTT21UUDRPbUU5YlVGZWR3QWVSTU9pclVXZXpE?=
 =?utf-8?B?ZE93MWNJV2pGZEZHM0R1L2JTMWtaaE1NenNIQ2d5K2FYcDhYS2F4U2lOcjBm?=
 =?utf-8?B?RTdNdlFGKzg3akJ4V1hQZ1VvNnRTRW5jQW1rOUw2cVdha0tFRjczdTYyWE0w?=
 =?utf-8?B?K1ZzYXRXUjhlenlsYy9RSmhCQWt3RHorcUFnMTYxcDJCVkZOdFV1MnY3cXJ1?=
 =?utf-8?B?UjJESjJlcVBsZ1pJZWR1LzlCdTVzYnVUSUQ0RE0yd2hpRVJ6YUdVYURyQ3pG?=
 =?utf-8?B?MjJUODE3Q3JhaFdJdDJkRnRHYVpDSFhJZ2FrQkVmWjkzSHFtUlhoRm9Temlt?=
 =?utf-8?B?R1JsNzErcGJ5bS9zM1BDd1JkVm1IYnVLMUFnZDNzcEt6SE9QSVlJVUpzMk5J?=
 =?utf-8?B?bVJacXB0aDBjaGgrUU1jOHVZNjU1SmZQYVN2d3BoQTduSWRVdlhGSnR2cEE4?=
 =?utf-8?B?SlM0UWJWVmx1V290SWtVZ0lZckNtUG5LWFVtV1RWc3AzcnJyQkFqY3JxQUEz?=
 =?utf-8?B?REpJTVFuSjFOakhpb3laL0szdGJRZW00QzlIQXBDTVRtRWtQVjJEY2RUSE04?=
 =?utf-8?B?QUdCd0QxUm1oSkU2dzNnV2pVQ213VVhGM21CZG03R2wvVVpsWlZGMXNqdnhO?=
 =?utf-8?B?MnEzeUtSQXdRZVJ4aDZIL0RMalJBbVpPNHZmOXBrT01UTjVEdFNZMm9HVHZ4?=
 =?utf-8?B?b0g5TUxyVjQzeWRSU1lkWXVRU2QvckUrMmszaUVuVkNxdzJJZWFnV1h2bEJq?=
 =?utf-8?B?TkkwR3V3RWRGc0dFUStFSFBrQzJQMEhpMHQ3dUNjUlFnWmc5d1ZlZ1VXU00w?=
 =?utf-8?B?L2V5REtVdUF5U0ZabGVRUHBxbGVocVF5dGVPS2FjS1NaQkFkNytmb0V0NUdD?=
 =?utf-8?B?SXdZK0VoTXlPd2hweWNnUmNmdlN4RzdSOVM3NEJqNEc1UXVQYjlGUmcydG4v?=
 =?utf-8?B?YnNGWDdPUmZqTWJ1MlNLK296S00rVkZyK0JqUDdvWW15WUtNWUF6NllzbEJE?=
 =?utf-8?B?NjRRTHNydkIrRThFYTR3Q01TbUFUSlJZblhNZlREQTJialBEOFNuVERWUUxM?=
 =?utf-8?B?d0J0OVVOZFZQOGxld0MzOHl2Y0puR1JtUGl0T0J5aVh2bjVnV1pOWmpMRVFa?=
 =?utf-8?B?S2xwR1pJczFlUnRjcElRQXJDclBZR3lXcUxYUm5qSTdaVlAwekYwSDJrdGJE?=
 =?utf-8?B?ZDFLQ25mV1g5THN1Tnh5ZXdPU2pFMGZqS1RtSEVOazNjcWRDUnhGTDFZeG5B?=
 =?utf-8?B?NDhBWFhGaWFJbEhveVRXcUxHZUdwZzcrMzMxVUx1a285V3VBbENtYmhOdmhN?=
 =?utf-8?B?UkxBajI0WjI4OEl5akVvbER0YnNuMllWNFErVGpLMVRHMkRuL1J3c0pTdUg5?=
 =?utf-8?B?aUpwVHNMdlk0VE1GbVFXQW0xWnZkUWQ5ek1GRE10anVoZzBZVHJlNEhXNG80?=
 =?utf-8?B?L1huUFJKOHNvdkNpT2FPdW04eTR3NUJuMEo1T0phdnNoK2NJUWlpUFJyRDZm?=
 =?utf-8?B?ZGJNRzFoaXdoeEhmT05wekZVdnRPcHFVYlduaEN4Mjl2Um9pYVlmenFuSWU5?=
 =?utf-8?B?ZHR6Sm1NakNKUnFEVmFTNnVVNEVSWEdST09HV29kVTZETnJkQitIQUI1aGJJ?=
 =?utf-8?B?ZElHdnBsSElIREcvdGNHWkFaaStXbUV6K09ieGdtN3QwTHU4TW5HcGNHNlZl?=
 =?utf-8?B?eEJtSlBSam1XSjRsSWxiTDhpZmxyM2cxR1ZaTTFtY1VyN1FGc2JIOGRHTGgx?=
 =?utf-8?B?UWJZR05YTXZiYzZIeEo1TUNEMy9pVk1RUHlMaEZjQ1lqajVwYjdtTUN3bGlz?=
 =?utf-8?B?QklWcHJJbW1Ycmp6QlNpUzRROU1SZ3NXcW8rNXdjdWhsT3FJSnUyQnlEbkp1?=
 =?utf-8?B?bUc0UVQyWXBjejBLL2cyK1orR1dBNXVOL0prYWp2S3ZvQ1VJT3JTa3JpQjA2?=
 =?utf-8?Q?JUN8JRzXHDJdyb89n+acevj9c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794a366d-1fed-4340-3b5c-08ddd08870ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 23:17:38.2515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xl8jBb5ri+lOw7zfbsMRU8607Lfi0UHq6BSxBhchN1tpw9o1qWo/fHh9RvekI89Vo6ZJgAT6z2H56tky/HnCzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_161745_214344_3A54D4ED 
X-CRM114-Status: GOOD (  22.12  )
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

On Wed, Jul 30, 2025 at 11:15:54PM +0200, Daniel Lezcano wrote:
> On 30/07/2025 22:21, Frank Li wrote:
> > On Wed, Jul 30, 2025 at 09:50:15PM +0200, Daniel Lezcano wrote:
> > > Enable the timers STM0 -> STM3 on the s32g274-rd2
> > >
> > > The platform has 4 CPUs and the Linux STM timer driver is per
> > > CPU. Enable 4 timers which will be used, other timers are useless for
> > > the Linux kernel and there is no benefit to enable them.
> >
> > S32 have not ARM local timer? It is quite strange!
>
> I'm not saying there is no architected timers but there are the STM. May be
> I can reword the sentence to prevent this ambiguity.

if there are local timer, why need STM for each core here?

Frank
>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Cc: Thomas Fossati <thomas.fossati@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> > > index b5ba51696f43..505776d19151 100644
> > > --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> > > +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> > > @@ -40,6 +40,22 @@ &uart1 {
> > >   	status = "okay";
> > >   };
> > >
> > > +&stm0 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&stm1 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&stm2 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&stm3 {
> > > +	status = "okay";
> > > +};
> > > +
> > >   &usdhc0 {
> > >   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > >   	pinctrl-0 = <&pinctrl_usdhc0>;
> > > --
> > > 2.43.0
> > >
>
>
> --
> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

