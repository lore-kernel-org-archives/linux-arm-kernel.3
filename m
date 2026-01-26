Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7D9C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN2Smq8mHt7moUr1SAmrbmCroPBwKZVLKcWj9znbgxk=; b=IZBXS9of4JCbSY9746AJ6/uuP2
	YiOQT68QrzxX0muLbObGEBQ5VLrE5i67HVdndCaEvSQjt8SB6g+WLOQy2NP72oUeTc6/HuB2CmKlH
	BDeT2dLFl5+zKX7U2dcb3m0TOJeCPbGOD9/4zvIpzl4teX0vZKSUHAPzC5frqmxDldVaouiV8Gb1G
	2QuPFomANVIFGpBdSqxikeMMRk4IQqG2+o64u/dgKjIeZWFDsKX6eDXX2ZyY1lLyflX0ET4Am6/YU
	XjlDFoUrm7y8jmfMebW3SPCOqc4HR/qJPK9xxst1/13u6RRH/xW9ROelvpZtjuqAsaH/LonATbSB8
	uv+IXWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHct-0000000C53S-2iPB;
	Mon, 26 Jan 2026 08:07:11 +0000
Received: from mail-westeuropeazon11010063.outbound.protection.outlook.com ([52.101.69.63] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHcr-0000000C52i-1vi7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9rjMaTG/0hJ7o74gMq43+dMyrGVwAWIFrWQtw8Vlfd4Fi1MK7107Ss1vw6BnothCtmClDkFlDEyhH6P3moWGxopgHFgwhEaRNPTIyHPbOI0XVhIRFM7Yq9VcPNTsrUUW3TF0wMkNzkEuNAQtEDyIXqtf+WHYu8TmrYHosjnyEtAIV4jzMShMNQ0Rvim0NyITpzxbR9RxBIEH2hEBDNsziN3p2D2s9W158gdBBXrquURxk55O5Fm02+AULalfDmZb586htAkQbboVKEwX6+bG/Qn/gOCK3DpkK9eT+/wlV2sfpBaZZ2fyVUzPs61m3pP1YE5CEFP4CEZIZo1zAZ/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN2Smq8mHt7moUr1SAmrbmCroPBwKZVLKcWj9znbgxk=;
 b=SQcW0a3qNZ6aswa+b09+GtzbhbHqrgXqNzn2FG9Kp4J+oqr7xGe1IDS1cg1M0lVDJ8PcgNOyJm7phE68/Fqyy7ac73W/FwxgzUGTRMh/JrzIiocqzxQZcjIXbdou0bRmKZ6eAg6w/ihZ3oijs9YYDWVfQfBN5lTYBg/Wcjqny65By2Nh5kTiFn5WHNS4sbak0ScgD+DRwR/iGI7iJBXmzdMXaQHLRqXU+HC+mzNksHFg6/Hwtrq+R5ls7pN8ZYgfS3lfISDTKGnDq2FDcGsuVBVY1sK/krGikmPCH+wRsiXfWf+PizpVRHmZ2YAlJa3WybeX/898amPcbIzjnbYPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN2Smq8mHt7moUr1SAmrbmCroPBwKZVLKcWj9znbgxk=;
 b=Ivco7xS3cWtIKPGRvdaKHzhSEGBY5GyFaD8oWkSoVoISQOZiz1VK473DcdxqNtVXXPjO01P18YgCC4B25cyuFlkwa1PXKBbwYbi1pIrcpMa4BGHqmJMfcVxZEyBzOAr5nTCPAy41EhwPTcC8DyIv5+QY5xc5D5HbEmkLsEG/KJs1ek1mhuWr18F/nVh6jPnp93B1jEGgb+u/Rt6qgDE5cBETL2ekFb7ufrDKXD6wQW5+W5bD5v4Savvs79zWGmy6e3qk2monnPjgHg7sW7d/yRZByLn4Og5TQK9y83HBECapWKyaiBLg8/KHCwfGUncDMjMeqxw5fOOgopDX/OFUMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 08:07:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:07:04 +0000
Message-ID: <0c617344-2407-4564-9f87-73d71bae7047@nxp.com>
Date: Mon, 26 Jan 2026 16:07:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/bridge: imx8qxp-pixel-link: simplify logic to
 find next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-1-a62b4399a6bf@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-1-a62b4399a6bf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ff2537-d66f-495d-0d36-08de5cb1e41e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjlPVGJKUGhaWWxDY1h2TkRkMjhBYVV5Rkc3K0MzZnlYT1puMytDVmk5OXE5?=
 =?utf-8?B?VGx1Rzg5eEZxSUZvWkdBVkM2ZmhBeDFEa0g0VUpKZTFUUmNwOHFMb0duKzRt?=
 =?utf-8?B?VEhsQzBwTHhWVVpKYUpXaDJNSDJ2TlBaVHZHSWhaZmpMcXFEdG9VeEw4M1pr?=
 =?utf-8?B?K1BUbzlhZWh3WDFXZENiNEprMzN2OWRwdXIzamcxdGF1U0R0b2cyczRUaXpL?=
 =?utf-8?B?VVh5K2RkQW5SL2kwWXZPVk9GaWdYREtUd2xwK09ZT25BdG9RcmZFeXZKdzdC?=
 =?utf-8?B?N0pCMzZoWnh2dEhhSVFFb3FZWXltOU5qQmZoVDFvMHQxS1NSVGc4akZPNnNt?=
 =?utf-8?B?VFowVXRjejYxN0c4SllSRTYxSzJKaEZydXI0RDJKQkluOUUwSVh3ZGlOQWJK?=
 =?utf-8?B?TndGNzlWSzlCTkVPaDBkL1ZldDE2Rjh1T2hVcmU3aGdkcXdHdFhXdUFqNlZ1?=
 =?utf-8?B?SjdVbDhVWCtPc2xzMVFOVFhaOHZTR2crUk1jbmdlVjZRVEJpR2VrZ3B6dXo5?=
 =?utf-8?B?VVVxbnNwb3F5Nm5QaWdOeEYrV2U1aVRYSkFwT0FKaDJtYjNWc0xLYktLc1ZV?=
 =?utf-8?B?VWVYcnpCaG5IWng5bHhEVFZrd0ZIMmpxWVJpNTB6U3pPTW1RRWNJR0VqYW10?=
 =?utf-8?B?K3dJV1Q5ZlhPL0lhWFFIV2pROFlhTkFxL1ljRGNRL2Y0dERHYWpJQmpFazFt?=
 =?utf-8?B?UjhZVWVpR2QxZWNXZnZNK2E2WDNLY2ZUKzBaL3hTSHd6QzdROTBqRURzQm53?=
 =?utf-8?B?dGxvTTUvZWI0cWhmVWJUSnRSNTMrTDdNZEFZSkszMkFsSHl0RkUvdmNyTzJw?=
 =?utf-8?B?WG9raGxUZCtEaVBFdU9jUWg1RFppSkUzS2FMNnQ2NUVjaWF0clFJR21UZVgx?=
 =?utf-8?B?NE1YRjY3a2dqY0k2eDM5SEM0RTBVWk5OTE42eTBENkhjSmFNSlZaSW5VVGpJ?=
 =?utf-8?B?S3dGcmNBTVArbDVSOStJRUpmM3RWbFFsbDBIUmtkNTh5a281UzZkUXpvMFZ3?=
 =?utf-8?B?RDN5UThoVmM0bzZGNVhwYWhnUmpsNmRDd3RGbzZaUjZPYWVRWjk0bndJNktN?=
 =?utf-8?B?ZVU1OVVCNmpHbTlweFFYUjNET3VHM25vb1JzVFpuNU1FUFN6SXFQbTRtdTlk?=
 =?utf-8?B?N05Da3RaNVdaMVFsbDJLd2pucjM1VnNQZC9qVW5WdzU0Q0hsTGxCVkVQT0dU?=
 =?utf-8?B?d1Jsc3lId2Y5VDhMdC8ycnRDQnd2RXJuMkVtRm5ybzVYK24rNWtYbmsvcW9S?=
 =?utf-8?B?OUFmVW1KZTBzQk85OFBSLzJNM200V3hGVXVvenhmQWJvVVJPb2VablYvWkdh?=
 =?utf-8?B?WXNuQUQ4YWd0aW1JbGl3M1MwdG5Pb3N0S2U1VUM3ak45dzhsZWw2Ym91Qmx5?=
 =?utf-8?B?SGkya1JNTVpaakxuZXNRQUhDT3hoY2dxMEZJME5VK1NmRTRQUXRwdEJhWVhG?=
 =?utf-8?B?R25BVVY5RFIrOVU3ZnFvc0p2SHB5OVY0TGdhUkM1bHE1N1NzMGZYWDlDenRt?=
 =?utf-8?B?TjByQTVyaGtUemZjd0NCWWIvU2xPUGJjZWI5dlEvUlB3Z01JUnJmd2syN2Ja?=
 =?utf-8?B?dWRMU2dIM2FpKytSUjZGVHJTOTJWcnF2akxFeXFqWlgvcSt1K0g5a3JIZmR1?=
 =?utf-8?B?NU93ZlpuZklOYVFHdkVhbC9LMHMrTEM5OEhyVEMwdFRBUzFwR29rQWJDK0hG?=
 =?utf-8?B?TnE1R1h6RCsvVUZYdk1MNExuUWF4enREUHJ2V0F1TWdqM3dORHI0NCtkZlNC?=
 =?utf-8?B?YU53b2gwdHJzdU0vbll1VWRXRURkYWVxRzQ5aDZGbFRlQnVLYUtDcUZVOWlh?=
 =?utf-8?B?RXJtRlAwZ3M3eTg5S2o1ZkhzK3YrSDFVZkVvelZVRng5VktoOU1KSmc5d0ZH?=
 =?utf-8?B?SFBEcjdxSVVUNFlLOUdpOXgyYXgwSEpHalhMTnFrbzIya3RBbEZTaUhFd2Iz?=
 =?utf-8?B?Qkk2Y3l2TmpSMTJ4S1R4ZjNLWTdrbGlnZWRHUytySWJwcFBtY25BSSs0VmpX?=
 =?utf-8?B?UGFnMjV0dUFwemJsNHRQY2NkWGhVWHczVTNheG52WTRaYWdjTkpFcVVlRGVN?=
 =?utf-8?B?dC9DcFMwc3FsemVpSHQ2T1ExeFVqOUt0Q25jdWZsWnN3R0dwaURCbUtvMUtT?=
 =?utf-8?B?VDhWczZndWRmRU1OaXZPSGR4akZUbWI5V29NektFMDRMdC96M20xVEdKL25N?=
 =?utf-8?B?K1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi84bDg1c0svMlRzQ1pMY3hLUzBjQ2k3U05pb1E0c1ZqQzVNZm9BL2l5TTlq?=
 =?utf-8?B?cmtiVERiNEIzSkRFUkhhMjNwZENQdkpRSmFPdGNSbTBNNGlxQzY3NXFyMzBN?=
 =?utf-8?B?MXR4bzk5T2Y4eEVwL3pZMU90MzJ2bnhvR0FvSVVvNnhDZHoxQU9SOGFxRXg0?=
 =?utf-8?B?Mk9SS3o3alFRRENpTVlQcHYrdnNlQnlDcVNVRDlKQkhPR1YycnErRDkrYUdK?=
 =?utf-8?B?OVdIUDlhTFowREpYdDdVRFgxY1VGWjJ6YnFXRTd1VnFJVTd3Q2s4Sm5TOGVT?=
 =?utf-8?B?NHBkMTd3aGFCdWNlVGlOUHVJUGgwQks5M0o2Skg5WmFOdW12MXZJM2kxZDlL?=
 =?utf-8?B?UWZBY1VpUlJaZVRBbnB6aFNSa1c2R0MrOTJsZkZraXlCRWxYK2h5N212Q2Zp?=
 =?utf-8?B?d2VuajJwWElNalM0SHhDOFQyeEFqMVdaTkUzMTBFQlJLRmw2M3I0aWkrRFlP?=
 =?utf-8?B?cFJsZFBQWjAwZnBURjZzaHZacVYwQVh4NXZnZTZMQUtaVEp0ZXNrK092SzNv?=
 =?utf-8?B?VFdpNjJEbnNRSVg0ejJGU1dSQVJIMDFweThNenV1Z1dkVEsvOXV3NVU4bFl2?=
 =?utf-8?B?R29SV2orZU9kM0g4RnFrZlFNUHhZZllLOG95T3RGU1NtSWdiSi9VZjZGWmdt?=
 =?utf-8?B?a2NzZm52elE5c0IweWVrZ0llTEFPMkhGeGxmaHRRbks2UzY1b0NSQURLTnRl?=
 =?utf-8?B?SmVPdXY1eGNUbGMwZDBvbDJmYU94Ymk1QlJnTG1vbDdxaWFjVCtnWVVEYjlL?=
 =?utf-8?B?Y1dhZStwRWhHR0dHa2dzeExuQUV6ckw3MVdWbGtvU1R1UjNVUWtiYU5xK0Ji?=
 =?utf-8?B?KytIelZmREQ1amRodGF0WVdtL2V1bFozWVEzWk13K0l5UFU3TEdLMjg4MlRS?=
 =?utf-8?B?QVRwZ1JMNDdYRFF3M25PTmJRNkRTalZTREJjc0lmR3R1dzBvK1hHbFJLUEpr?=
 =?utf-8?B?cnBwZk1WTXhVS3d1ZmFqOHE5VENEN2QwWmNBaDFKclhmUW1sTXhMWVVWQjMv?=
 =?utf-8?B?QkE3TFpmYUE0UXRlVlRCV2xxSVdxZXZ5R0V2WTBBajZIdFl6TzloK1RkLzlH?=
 =?utf-8?B?akZpbnhqVHREcnE0bGNMcmdtbGp3Nk5nMGpPY3FUUVlhczB4ejdzTDNQRHRF?=
 =?utf-8?B?c3lnZitOWlJTNktLRkpnOW5sbkltak03bHZObi9sbmUwWVZFOTI2Y1F5QnRq?=
 =?utf-8?B?L2NvZ0lhK0RmcU9ueTZaUXBuTm8vdnkxYjRHSWVoTTlRSklwRXJiekxwN0d2?=
 =?utf-8?B?bS9OUHA0QzhJZG4yRDlWOEtHaWNMckVKaExkZWdFdnUrMnpRd0Rrdm5vYnp5?=
 =?utf-8?B?aGtiU1EzcUNlckE3UUhCMzZOek1QQks1QmF6eEI2anZIeFh2eVdlQjJVMk84?=
 =?utf-8?B?dkFZUzlsd3dMY1B5NHlnS0E5bGRNQkF3TWExUVM1WDduRENPeG5adTVDaEZ4?=
 =?utf-8?B?WmRNQVRNWC9QSVF1cXdWNFc0U2M1Zm5ZSkxYR3gzNGpXQVdJZzJBNUdlMTFF?=
 =?utf-8?B?REhGOXVrWXR3V3lPK0NITnZoM3R5Wm4wNU1NeTh3RlJHbnE0T0hVOWhpbFRr?=
 =?utf-8?B?T3RyU3I0T1RCaDlXS0xmZXFuK0JGS051NElzMkl4ekpEOFNHR0o2akhrdDgx?=
 =?utf-8?B?YWY4L1E3czRqVXFuZzlqWXpHaGoySmFOQUEvbTBYMnRrc3NtYmE2Q2o1WnZM?=
 =?utf-8?B?cVQ2c0h2V1dwRkU0cnVGdWZ6SDh1eElJWWIyajNqNURQUHdLZEZOSDJFUE1Q?=
 =?utf-8?B?TkhXcDRwOENGQ2w2WVZPaldNOEM5WERacnJKRmgyNW91dnAyVzEwb3VDaloz?=
 =?utf-8?B?c0NKMG5NY0V4ZHNIRmw4cjB6V1gzeFdvRExKZE43aXhQWFFrTThHRllhYXVW?=
 =?utf-8?B?U2dtaEdxTWNTeGhvd0ljSi9URjhVTENOU3J4eGxKYUxxS0gySGw1bEZkQzl5?=
 =?utf-8?B?a3BLYWQvUjd6V2ZnRmtuZ3Uxb1EzN2hzenBWYlNzSVFlbEs5REY0Ykc4Titt?=
 =?utf-8?B?eVZobWxiOGVOM1RuYmloQnRYR0FieWdPOVZobGJQZlg0S3Rsc09ScEpqbmsv?=
 =?utf-8?B?dkM1ZFk0UzFQbmsvcUZWaTVheDVuZ3lzYTFtTC9Nd21jcFlPbFJvc1ZONHlT?=
 =?utf-8?B?U3FIYU1DdW1jSjNhdEZYMGhkclRrQ2tRZ0RmUEFDUDBJNkFpY0xDcGVTbTRN?=
 =?utf-8?B?NWdlcEphU1VJMUFET202RU11VFlOZC9jZlIxOFZVelpwMmxxY3lyeXNNWFZC?=
 =?utf-8?B?T3hldis4T3ZBd2NzUnVaclBOaGllYzVGeFZZWW1HZEhkdkxRS0o0NGZuSmF3?=
 =?utf-8?B?d3ZqS0VYbHVwY2YrdnRuKyt1T1QvM2wxNzVKdVJhZGdIallZaTBSQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ff2537-d66f-495d-0d36-08de5cb1e41e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:07:04.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z031+fjlPrrQ7XhL3yyXnepXPpq/tqbrEiENPyaxOREQDNX0HQWHrE0roYvl2l/0+vr4lbEv94JTYhV7CkUlWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_000709_504949_1B9926D4 
X-CRM114-Status: GOOD (  14.55  )
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



On Wed, Jan 07, 2026 at 10:56:26AM +0100, Luca Ceresoli wrote:
> imx8qxp_pixel_link_find_next_bridge() uses a sophisticated logic to find
> the preferred next bridge, using an array with two supporting index
> variables. This is more sophisticated than required because we only ever
> need a pointer to the "current" bridge and to the "best so far" bridge.
> 
> Additionally this logic is going to make the addition of proper refcounting
> quite complex.
> 
> Rewrite the logic using two drm_bridge pointers, which is by itself
> slightly simpler and is a preparation step for introducing bridge
> refcounting in a later commit.
> 
> Also reword a comment to make it clearer.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

