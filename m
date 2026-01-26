Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2878EC88E6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luORk4huotq61JzaRKO6hGNC2ONWf1i3rpUIpetFV/o=; b=CKpYKNdjHPbCIPOoOOMrj61rK2
	GxqLt8zGdvlNzAFV9uakI8awRW+9XBXVz0ACmGpPJjrzypj1gCJXT3BKL72h2E7Ll6dvcTz+2HVZT
	g8e7UoqcvhI1FcasKocU5W1vUB+i5LWvNo+4LRzCoSYlKGagFDr3LqSv+Y/uXHNq+Ajlhum1xY1Bo
	OnbbqYQbN2474UIcklnsBoXbsorPt2XineZ9xffO8Pn8MRQnsL8mbUyxg9v0lrB+0An/seV49lnMD
	3Ksxn6hKWQNhNdQc6MwfOKyJD5N1va/ojTzk09eiy9CWfeBuQtA9JL36yhHeVVubl2nxGR05d0AoE
	J/SkyQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHfR-0000000C5Kn-1OzT;
	Mon, 26 Jan 2026 08:09:49 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHfO-0000000C5KE-3b2n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdZNyO0olAiNhnmTSRxriyWvQMQUGLhrZNEyoyfP4b/2SVDgsOwQQlY92GEfY/6oNBhROwX+4DYSG+Qu2hEDU6NyCFP+PQhogdzVyWOXRVTUAFgUQbQzfoOsciusq554EntPpLAcIBpS4d81RYeuwxHQi6lzTJ8QM/8pJQTkfj+wdUNWJqS1QX+plGCecO25oAu4ycIt2EYayrpzMaR8sTU1Z648lNwV0oKKS/DBNmEokD5N5juBntbumX/Skk/c2Q3C4e94Xda5K6swXF9pgovvAK4tsuPeFHu8laF95SaeupnOtaLcBrfqvQkbLgTRiBBBUENY0XOBhM69r7Qfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luORk4huotq61JzaRKO6hGNC2ONWf1i3rpUIpetFV/o=;
 b=QfFkWVvPwCAj3MfUYAyu5vW6TZGWj9P8/KFZDfEOQ16MKKNvRPwmK8XhVW6FkRZ7X73RC2kXZ/4DH870qX5Qb2Zf9bhv8lywo/85c+YofQ7SuijwuU8KfFXnDY6Cn8VtvvQo9UafmqT8fQ/rL9dMBTxHllQfHd1kZ6X/3MquCWgrAGbzfHK+wMQ1qyh2MAPeTGIAxe8Ry36rIGtmU+hKP1B7K02qc4kgMklJy1p7AOgEU9FgeG1iczPo/8Dp7nBPR5vKayJhOoKP+mNDMiuoiOVHPFsxjjv6SPI3uJyMOgPoS3+NgWuCHE0+ATJ8dy4oZi+mNZzmqhzpIpzQKQ6pmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luORk4huotq61JzaRKO6hGNC2ONWf1i3rpUIpetFV/o=;
 b=WAHAQ9pWcV/GnA8hB1CvtM4AcW+YVjdOKGM4Gpy7AA6wysVQnczOcy8/SSgozMrjEpmEaHCw6LsMZ3yIhNZiz0PFj+BOKhVCVIve9gMlq5G5i1gt6QIISw3M3QyPWAQzTboHJPysfl6e2nFLo2bsD4o/SJTwTEDk9P/PGYkObencRNIviVV32tGCuPdDJaGoyr7YbFgvXpfU+gmY/ffm7cyFE3T8e6bUPg8OcLwdaiV8uyKkK9aHSOhExnnTGXAG8fDOYWcqj/xLlYSa1ohFfMS9sWE9OuRxmksOVphawsHaTqnr9o67bM/0qXu78FEERvXHEstsb9vpHg6sE7pPyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 08:09:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:09:42 +0000
Message-ID: <7f143a2a-6cf7-4452-a0a8-1ac3037284fb@nxp.com>
Date: Mon, 26 Jan 2026 16:10:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
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
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-3-a62b4399a6bf@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-3-a62b4399a6bf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f835046-0c45-4420-101b-08de5cb24258
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0E5a0JkSXRiVUV4L0Q2NVNvMGxhRENzNUIrbSt4KzdBUktUTitKa2VhdEYv?=
 =?utf-8?B?M1U3dytPM1JYSlpsdUtUckhFTGYvandvQ3F2dm94dG4zQjZobm9BeWRnR25q?=
 =?utf-8?B?M1ZyMlNiTURETlFVVzJ6M0huWHlYb0F4bVFIaWdTSCtvaVdKOGJGNGJoNHRl?=
 =?utf-8?B?UWwxczBORWZWUlYraTNSb0lBbWZMYkg5ZFZrUlFId2lLb2pzeVAxVk0vSVdG?=
 =?utf-8?B?OXhsRzhoR0N2V1FqTDAzOWVQQWI2TVNGZGdxZTkrWGJoRnlmSVlaQk43aWls?=
 =?utf-8?B?dXk4clBlNDNZblNiNUhPRlFaUWZRREdHdm5zdUNlR0E2bnVFMGJSZmpTY0I2?=
 =?utf-8?B?OWdqL2NhcHAzMVJQeE51VG9HaXZjTGNvcXlKUks1dmEvVkdLSm5JQ0lLMnll?=
 =?utf-8?B?aUlXYkxqNHhXbnl5dDltT1dKTGFBZFJma21pOHZHU2QrMHZVOGFlTnhBV1Nz?=
 =?utf-8?B?RGxjU0QvSGc5S0hOU2NPWkFENnhOOEU1RG5CdldhMzBtUzUzZTFDSExvS0pz?=
 =?utf-8?B?U0haRlVzTEl3bkVXRk9NcGxLSlh1N2cxNVhGV2FuK2h5OXFMaGEzVzE2YUor?=
 =?utf-8?B?OEtCTVlNMlpkOHNIN3puVnB5ZzgyZ2ZPazVWdjhIUmp1YVF4UnI3SUJWaXd3?=
 =?utf-8?B?cVRQaWd2UlhvTWUyOHFWdGJ3WTI4NjhrMmtGTjloNis1a2pYZkVKdm0wTkxk?=
 =?utf-8?B?RFRDdEVydVU5WnBLTXVaNWRNZjR5cjFCRWxvMVZJS2xRYVh0d0hSaVB3a3F0?=
 =?utf-8?B?S0oxS2dWV01nQVJ3Mk5GMFNzcmdGMXUwMyszak16ZnRLR2dneFdHUGZ6OGFu?=
 =?utf-8?B?TTBYcEFhUHB1WW10OHVmOEtFeVJoT1ZFemcrMklWb0llWlRuR1N4eUVuU1RM?=
 =?utf-8?B?OE5sN3VwTU40a2dSQm8veUtubWZ6U1hzSHdJeGN3VldIRzc1MFduYmJLUk5U?=
 =?utf-8?B?alpzK1BDd1pyNXhhOUZrV2RCb05peEZvSktoRnNEZlQzbk56OVhSeHhMUnVJ?=
 =?utf-8?B?VGtmaHNRcTZBRFQzR3YyQi96QTZRQi92OGxoVWgweCtYWTRmUjg0STdnY25w?=
 =?utf-8?B?MUp3c0lJWlBOQ2IrUlpacmROVGhYS2YzY3pqMWVNKytFNUh3OGFvRkNpWE9t?=
 =?utf-8?B?V1BxWmNwRXQrc0V4aXk0eXNXYisycFZ4dnBiRnZ3a3hndzdtRGFwTmhwOER2?=
 =?utf-8?B?M0JpWGhpK0Q1NndSVkptdzd3WmFYRTN1SmR1N1g2VzNiaUtUNDl5b0ppVEI2?=
 =?utf-8?B?RHpESWRUSldvaEJ6NWVpS3N1ejlCSWkxaWhVeTgxM2l2dzVsV3JqRmcra082?=
 =?utf-8?B?SFUxS0RQTDQ2ZjVIQ1BCTEs1TmtOMFFXemNiUXZkNFpxUGNMZDd6ZHU4UHkx?=
 =?utf-8?B?M3ZVN1dXYWpRREdIRkNUam9aVHNwYjBXeDdNeEhWVU5qSnB4TlFMc0U4QVR1?=
 =?utf-8?B?MlBiNUlmYVBOUUt4SVRHMFEwVHB0YXRYbSt0SmY4K2tMa3JoM3VzZlZrb0Ur?=
 =?utf-8?B?Ukh2U1B6ZzFBMC9TeG52S2FaMVVPUk9HS3dQNWRrQUdza0dlRWZWZ0dqVGRt?=
 =?utf-8?B?MlVOczhSU09ySm1nWjRmZmd4QjZ4NEd4TTd1MmNxSWQyRWZkYUVLbmp3YVd5?=
 =?utf-8?B?NFZVYWh5NjFoclEvSVJTNWtzbFBwa3hJc1lEbDNpTkg4TklBSGROOEdFaEhO?=
 =?utf-8?B?SUFkdzVDYk9DL2hSRlV5ZXpzZHZ2TG1OcG1vTnRTN1QzdUVMZGR4bXBNY0tn?=
 =?utf-8?B?RlRJM3V3N2JZYjdtc1ZoRjBKK3oxNTFzMzBTcFY5YjQ1aEg2blV4MUIzOWY3?=
 =?utf-8?B?RGxrYmRNYUZJelJnelhsRHN1aWthTzB4VEl3UFlCTVljK3NEbXRrWU02djBF?=
 =?utf-8?B?dEJKMmt3TDJlcFdtTEozWkE1VjZhTlBZMGhmYUlJKzlGWTh2MzVmSXNoVzRz?=
 =?utf-8?B?Mi9uZ290VCtxcVg1OXVmcUZMNTNZNEVGOXdOQU5OOFJrVENYL2JvMzFjd3ht?=
 =?utf-8?B?YjNOU2pkdXVRZitzUmlndkorVDgxdlhQS1Z3RmRKeENISnIyVFdhL0E2RWgy?=
 =?utf-8?B?L242YS9VUCtMeld1b00zRHp6VWlWODdQb2x1R2w5eFp2bDRnRXNzcHdleG0r?=
 =?utf-8?B?ZDF5S05iQ1FkNXlEZldpTkJyQUovT1BwaXQxaFUyN3ZlSDlETW45SnQzWWhU?=
 =?utf-8?B?Tmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25GMTRXTWUycEZ5Ni9tRnFCZmxha29WYXIrZFVZRVJUbUdIaGlUOE5yZWRF?=
 =?utf-8?B?K000a2NFYzFLZS9UTHNtck9zY2xQNVhhSUZQUFR0Q2FCWjNNYmlEUlNjUEpw?=
 =?utf-8?B?YUpUOTZkTEU4dEZBK3BNcEFwS01ZQ0c4cllRd3hlbWVBbE1wY0ZNZmdEWHhT?=
 =?utf-8?B?UGVsVk9iSzA2MENRTzcrZVd3SGlzenBGVXNjSHUzVDVSK2l5VHdqTVlEK0pW?=
 =?utf-8?B?VjBCbU1OdG1UUmNRdG0rbjhrZWNyVElvZzZMS25zSHRLQ1ZXZ3JoQUorMCtr?=
 =?utf-8?B?U2RESjhCdVJ1aEJPejh2SmFFNU1OemVrakZwQmNwQlExQkw2Y2VTMDFwTjZH?=
 =?utf-8?B?enVWNlkwUVFrQ2ZDMk5iTE96RkxLamwyK2lNRHRrYWltRllreFRHeU10Nm9i?=
 =?utf-8?B?dllTT084ODl1UzZ0c2VyTmlUb1dLMElWL3ZZdytyd1lRSkw2WFd3a3p1dmUw?=
 =?utf-8?B?UlpPa2NtcC9PaG9NeDRQbjVIRVdGR1Q3bGl4NXRLMG9yS1h2eFNETmdpdFZC?=
 =?utf-8?B?N3JqTDZJY3BneE1OOXZFb0pvV0VFbnk3bENPYUFzNFBZV09aMmd0OVpYcVh5?=
 =?utf-8?B?VlFJejdQWDJsUnhwT1lQVzhPcE51YmlyVUFFaWd2N3h1WWZwRkR3VC9vcWp1?=
 =?utf-8?B?VXJpTVVQSzRlNFlLeEN3QkUyRW1wRC9uYVlKaUgvcDB2SWkvUStIWEpDUEtR?=
 =?utf-8?B?ZFNmWm8xSCtjdXFjVjk0YkFDREpMQkxrRFdLRmdhbVExd3p0VGVUMUFKTllB?=
 =?utf-8?B?YmNXWCtLM3cyZU11R1IrdkExRVJVMmhrUkt0UndlTGRwaWhBczhKMnoxOFJ3?=
 =?utf-8?B?ZGNmMTlReWtNa3ZvUkdGcnJiSzJXMys3Smlyd0NpWDNpaC9rWnRRd01yRkVp?=
 =?utf-8?B?YXNRZ24yMFRJVjBPYUFVSEFSTyszQld6dnl4QjhCbVdyT3dPZTQ0ZE1qd2hW?=
 =?utf-8?B?WmRZclBpZkZNQkdMWDVsSHQ3Q25Vdy9LVUdyaHM1cnNIYjVrVmFJZ2IwY0o1?=
 =?utf-8?B?U3I2RUtQKzJYSi9qUXFtQXF1azgvamtoU1V0S0J6U3NEL1YzaXp5UmRxeVZL?=
 =?utf-8?B?b2tCVUp4MWl4dERFSStHVG1SakY5ZzR1YU1RS0MveDl6elRyZVErUm1lWW5W?=
 =?utf-8?B?eUZJckkycHdXWEVzdTRRVEFiek5zbWF5eDJ2NHJvUUJsUjFKV1E3WVhVejVu?=
 =?utf-8?B?NTBBU29nc3lEOWt4ZFRzeTRuSzBoREVlV3BPN1ZEbWRTZ0pjdFhYNEZISjl1?=
 =?utf-8?B?MDhVdWtxN0RvK3ppMExmZTJDWm83M2QwL3JVZGRJZFFxbXVEalYrbXVlaitp?=
 =?utf-8?B?ODc5QUF6aEdvV0xBTCtvTTVkT2czYnhZemNtcy9BNVpkc05YTlg2NjJpODJD?=
 =?utf-8?B?Ukg1bWhaRGFCUjc0a0VzUUFvTzNPeHRMdVFERk84M25ibnJjOW1JRlk1OFQx?=
 =?utf-8?B?K21OV1RYaitXNzlQbXZjS1Z6ZzJxSEZZb1dDM0wwMU9TcEdOd3JRNVZvRjQx?=
 =?utf-8?B?c3Zpc2V5bE5KQ0NDYllrenZVSHR5RGhHVUVwRE5mdlowRW1rMUhrV3U2ODFU?=
 =?utf-8?B?WVo0Sml5S0hXVi93Z3pkOVdzU2tjekZ2ekowNnNGK2xPQTVvT01NeHBxcFh2?=
 =?utf-8?B?VjR5VGZkKzhZL3pIWk1hQm9LVGxLdzNWa3ZSdTRhNkhyM2VRc0RHWHJZM2l4?=
 =?utf-8?B?M3ZlU2tCNCtCY2N2UFF4OWNMMUh0UE1ZZFcvMTRDUm1TbkZPVURGS1oxS3p3?=
 =?utf-8?B?NUZBb0NUdlpKWEtZY0xCZ2d6ZmpNRlFRKzUvaFJjRGorSGhDTWhjZGk1RXRL?=
 =?utf-8?B?TGkvM2ZkZ1FHRWxaREYwbzRIS0hRM3JIMDBVc21mb3hvd0QrajZTcGRhVDdy?=
 =?utf-8?B?ZzE4eHB0STV6ZUxkRGFtbG5JSk1DL0Fxb0tUWVNKcEJHbk9aeVZEMUg0SXZv?=
 =?utf-8?B?YTlRRFdiTExtOXdsMmNiS05NRGhaNUQrMHR2bmJtY3ExOHIyOXNKdFVnZERL?=
 =?utf-8?B?RllPaE9FeEs0NzU3ZWwwY3I3Mm9LeWJIQTd0WC84V0ZWTXVlSHI1djhQTWFm?=
 =?utf-8?B?K2ZDVUtrOWxZTmYvaXBqVzY0azVuZGt4UjZVV2gxb2M2MVhGZlNwMDAyY0RP?=
 =?utf-8?B?Rzc1ckFaTGU3SFh3bVBGQW9WV0VaR3BUL0c1cUN5TDR1bVNWV0pNbDFGRDJw?=
 =?utf-8?B?Qnd2ZzRKU2x0ZEh2N1BNVUhBaWErOUE2d0JVRG05UjRnSThEZy9LcGt0NndX?=
 =?utf-8?B?clVDSzhhTzE5b1l2KzNjMU9XUlIxQ1RWcWxkeVFvRHluRTJJV3lORjVPVnB2?=
 =?utf-8?B?UEdQUk9uMUlxemZWdlFBeWpmc2J5VVptTGM0RXJIVWhaNUZzWXRQZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f835046-0c45-4420-101b-08de5cb24258
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:09:42.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhfhTHN2DqqfKZiVj6VfUsD/2Z4TnzYEHueto/A0P5PVAF3y0QCjj3e0VRt0WmAsGahPiWkjqXsvZSZFeh10aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_000946_904471_C4111A59 
X-CRM114-Status: GOOD (  12.88  )
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



On Wed, Jan 07, 2026 at 10:56:28AM +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set pl->next_bridge and just return an int error
> value.
> 
> No functional changes.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Acked-by: Liu Ying <victor.liu@nxp.com>

