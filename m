Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FBE1088E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u7tDlmmvS1vV9c03W23u5cwiVd/Z957apx6yTFKnJA=; b=cg1jmUtqHOU7o1hOj3REL6721b
	gH0tw2jBs0r4PgFIoF12RC9gl1Rw3TXFgqEcWeIU5QBNYE8bm2CGIx9g0oPz+hAX9JSW+DGGrdL2P
	wl4Zrvc6VBJbNuM8SwTgDz2XkXXpAIgQALGfiFNoO14NxGjho4F5fv1M8uyIZpyYPNhUFn/U45+dq
	xeyJA5lv0QLnjL+vTl/u6Z2l2cFrcdWqs3vV2xnMXTAI/T5D0y5x5dPdvda0svG+pf+b0lOhIKa6w
	w/yiSxI6wvGL9/r/nMW3hJ2Kf4R2/Szld7ODgTXiELIA5WZRIssWja1rogtumO0F+6d9RZ4Xuj3GT
	py/UGGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CbS-0000000Ac8U-0SuQ;
	Thu, 19 Mar 2026 12:35:54 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CbK-0000000Ac86-1VcV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnCFmdsJqLHILz7zpsNa79xF9UG605PApbrGFJNbIbb5gPcPTOaxj6qVOOx7EJApad3OBr0awzuXaH1lCAQcC/HrZsz/DQkhvSIro14L1BtmF0kwV7LW62yoLPNyFwiY+tSaaHy2vod6bwJLmb0bTqD/TBKAMCHdiLm2GdDoFlRE0MXxIqkUnpR3e6NYFCtBDMLMK9qRo4Qj8rDGQsOgJMezYdUc12BZN68W26LPKpukC87GUPkSOUSU+7w8/iCAJ7l4m2eaAvX5gXHvkQ74aftXt8HNNPCBA7KnsZ8dkuAQ2IEIMhJWffc9QR8MHgEvECWGEFif07XaUc24LkA59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u7tDlmmvS1vV9c03W23u5cwiVd/Z957apx6yTFKnJA=;
 b=oPNCzfKwqJqW35ljtKsNP3W8k5uTIuMi56ybq1ZgwY8kGMO9Z8EnjWVHQ5zOKjX2UjaOAsNfim9thUgiOKH2w5yXAFE/c1qD9yBBi1XV2CKZQkhiy8MC9hkbEcujGG/jYphmq7M3A/Ez/UE+QTYW2Whwl+zIGAsE0+8oCzyB0l9Vdl4TVRoxuAgK79C5d8wlKHKhWCkzSa27J3fUnCfsyKpKEDW41SRf8mqTyODhw3FwU4ykcYCu6hPKvPbXgpxjEqUlr4Hs/cAb8nmlsX95WiVBoBa0FdIz0Bouwx6tLLETQr33YK1NXRZAcwtB6I9fFFIV6fmIDWvvYTXjus+wlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6u7tDlmmvS1vV9c03W23u5cwiVd/Z957apx6yTFKnJA=;
 b=NISCGubW+/XzoJx9QRZV5Km1ytuR3oecn0oRAqm5fn5uMCwYRTpIFGtNzQwJV7874XeRVpO9N5dL0porP8nHXHyOUj32yYNiW2zB5m1wg09AR6a4OazWUC4Y4DJBiZRMu/vS4dnbqCHvd4oIlwX8x0v9dq6+BN/hct36R7bMn7qvdOYiUC4V8to8NH0ZVGgnoHqFFH5TAet+AOvpq7nUnyfHmh2JWaUznNR7dlhv/MUwL3ZUieDuLNtA1A79gBSARiNQIH075rPen8KWGkt7Vtt1A68/PBRi4HfPO7WBnbLGqJgiCQGeYQrhKxcMA0CSmQPaLT9+sxrIdSZKdTj00A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by OSKPR04MB11317.eurprd04.prod.outlook.com (2603:10a6:e10:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 12:35:33 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 12:35:36 +0000
Message-ID: <5a5f9163-3687-498a-abfa-9196c9c8bcb7@oss.nxp.com>
Date: Thu, 19 Mar 2026 14:38:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|OSKPR04MB11317:EE_
X-MS-Office365-Filtering-Correlation-Id: 865704d1-7e96-4db2-38b0-08de85b40538
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|19092799006|376014|1800799024|83080400003|56012099003|18002099003|22082099003|921020|13003099007;
X-Microsoft-Antispam-Message-Info: iYOZnF2w+PsAkQoIfE1MpwdjrICsbRUk8KFkFeHQovhSyCwtB4Rpeteq+i8OYd17T6KwuGTLpAP3z/cG3hebJy331bzMDQ/gmZTd2aZuSsw+XfsPyE9hQIPEXkqKHC7/Hgsrnm8wTsJB81kbQvZa7WBeq7uZYcMmmy+kSswZMps5iKAkcEJCdSAYPt0qpj/yV7/26VbbNJ8wZgw4P94vI5CKk2MrttVqHEhxqfanzUifS5nNaiFHZDsnZ3u9J7aEGjCmya4yZD7LH2+b9Lk05aYoJy+rIQBdbSvT7F3JiuFmWYxuBkn+aCykV1T+IHbz76oJC/wKqGxyf63Vy8uzmqRGVnwyY1URGueKVPuxw8uk9I7UKfOF2qqvVPkSJvgF6zjADsdr4Csulu5HQIrOWDdCqZ/VsKxqS63Ulz1cQWBmuQWptYxcH5Fd40XGOSddpk4BZTzic7tHFqfBFvEd/Qu8NNbWWA1erMy4GlmHVTvYvMmDeOHL2wr89X2cQCpboghcrA0VCt2HpBHuIdjCuwSCSB8MD7MTayGBqBdLw4Gotwm51ZvHwNvVgEq46g6cjE/Wju/hUUGJmvt6aZrxHCPmNqgS4CI4KCHx4qAA8xawERgDOybHgd5Ru4gw6dNm51t57oiIBbpXYbFQqGHtR8GkoOVw3CIKy0+Y1+513nRtjqwn+m3YujmBVaA6kKYmAy5PuqFTUBCKm+wDglULgpYiL2QpoPOZxB/d2nH+HxZagcNO1WlRbu1cxGymYzLr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(376014)(1800799024)(83080400003)(56012099003)(18002099003)(22082099003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE43YkNLdEgyeFhZanpaa3NHcmsvYmExOTI4a3RSb1pCemIrRlY5aFFmMWFs?=
 =?utf-8?B?RHZackYvcWdXU2g1aHA0MWR0M2ZmSFdxa0huaTJodmxubUNDZm5obW1UMlly?=
 =?utf-8?B?UGwrZGlNMW5mWG1NaEh0eUwxTmo4R0xLMWRWY2crQWdsbkJqYVlxMCs2UHhR?=
 =?utf-8?B?b0h5ZzlxSkdHTTI1Q0Vob0RBNjg4Q2wzVU0zRlVQSGtDK1R3d25WUHZnd1F2?=
 =?utf-8?B?V2NXSDhIc0czSDVVL3ZmSURWMzA5SEcxMzZxT2xXdE1BNnI0clV5a2VwMDdJ?=
 =?utf-8?B?UkIrSkVCdVVTbFArYkcrNjJmaVN2anNTY3hCL2hqTGhBZ2ljdWNaUklvUDVq?=
 =?utf-8?B?TEZVVzZpNVV1UlRIZjRzTzdQL09FUjZwTjFPSHEremgyODFVZy9wY0RuY2I0?=
 =?utf-8?B?RGV1SGExdXpOZDNwVFoxNG5qaTc2QTd2OUJYQW5NQzJqcDdiMlNUZlMyenVl?=
 =?utf-8?B?Zlo2VGQyRXluTSt4SkFRTjRHZDRQdWVZYmRTRE9tWUd0L3dmK0hFanNmanVX?=
 =?utf-8?B?YjBDTTIwVHJVSVl6Q2dwU2s2SnVLelduL3Z4b0lsNTJmWlFBc3dRRFVMNCts?=
 =?utf-8?B?MG03U2I4NlkyWHptcFlrYVh4Z0Vjb3dmblR3dnpCV3lQS0VuTUtqUFZabFB1?=
 =?utf-8?B?UHFEekxXamxSNkF1eFJYRWx5M0NwZHF1L09vZGJjdFF5UDJOcVpWVVVuZjUr?=
 =?utf-8?B?TWozeTFoYXQ3blN2RWlIQW5EdlUvRjEwZWJtR2p1eUJ5Vk80R0lGV0UvalNN?=
 =?utf-8?B?R0NPbDJJbHoyK0lBL3J6cUtJZlI1VUNUNzFKZlFvNFdPYzZRLzFJeHg3T3hH?=
 =?utf-8?B?TkJtL25VVkpXeUdRZ2ZXTHRmaUlDT1hLdWlKeHRjUS84Sm1tWVlJRWluQVFz?=
 =?utf-8?B?SzhkbGpDVGJJdlJQVkZoOFJ3bVFlOThMdS9SazdvZmZ0aXRtZW82ZTdodTBu?=
 =?utf-8?B?clBFWDBheWdsejFyYk00WU96M1phcVhVa0Y1TDVYOGdpSStidGpZK3E5SUJw?=
 =?utf-8?B?T1JOdUpVOXIvYlJxMUd5aTUwUmtXLzlmQ3RtNDErSGlmNzNNT0t3dlczdEcy?=
 =?utf-8?B?Uk80bEJwK283RGNiVENsLzA3MWdzM0Q0M0Q4U1pYR2s2TEpNUTRDNzA2UnBW?=
 =?utf-8?B?ZExlODlpcE5KWFhwcmpYU2s4R0p6SnNEY1YwamN2N0ErSWhkai9UeE1Xekta?=
 =?utf-8?B?aXJCSzVrUDdKODI5aVhoV1RhRXB6ZjBxQWJxMUhKZmVaMVRCSDI2SFNGeWpn?=
 =?utf-8?B?Q255c2xDbzZvNjRuc3JCSVZOcTgwcHptSjdWUUcvVXg2aUlXSkFyUGR3Y2Nx?=
 =?utf-8?B?eCtIYXI3akw0UFlQNmxaaGRuV3NycmxZWnl3T1IvdmhXa1BuUnVoVnlnUm1I?=
 =?utf-8?B?VThOUGhGcVhTNFNFb1B0alB5ZjRaMEo4dExWWUExZ3lOai9QSDN6MzlNSTFF?=
 =?utf-8?B?d0M5aXo4Y0t0MEVzb3ZjVUw5ZTV3RzE2Tm0yaHErQzZOcE1RMDd0ZjlkNG5y?=
 =?utf-8?B?MXNqUytRT1ZseXo4ZkcyZUpXSjZvQlIyTDloZklKb2d4Zk9aQ2o4ZGk0czNp?=
 =?utf-8?B?cVozYVBiWUQ4dzlSQkdoWi9ONTY2ZzJNbXVZaGhNZVZUOEQxeWZLeEhaU1JE?=
 =?utf-8?B?RW40TVZMZVM4RmRCZ1M5NjZoUWJkU014NzdwdHh0UEUwemxJOGNIeWplOEoz?=
 =?utf-8?B?SmdwbVBZR0FUTUR2a0hSdnpBZzVaWXdhN1ZieEZVTUptNC9kNWc1WXkvdUV0?=
 =?utf-8?B?Z2ZTTFFHQmJ5cGhaVzhnTkdLMlVjRW9la2VVRndDRnZxWGpmSlFJL1AxUk1D?=
 =?utf-8?B?QmdrWVRFek1ZUy9xVnFBVk03RVlpa3VaelhWUTBiRW1hU1dWN25wVTVSY2NY?=
 =?utf-8?B?a3dVS0dHYXRKN1A2ZE5vWmwrNEMwRDZaQjY2eHFuc2VKQmtnT3RTQXlUZWx4?=
 =?utf-8?B?U3A3ZVBJVzNSK3NTeEpiUjYzMlA0Mmc5NEtRWDB1Q3Q1dHUvRC9VZlFEdnBH?=
 =?utf-8?B?ckN1TzRNQWoyZlI5RmNORmM1OEtJZ1Z4SDk4UXY1T0swMWVseGVSNmkrNjZt?=
 =?utf-8?B?dmowRkVFV3FHSlFPRDRkc1pTVUt6dER6YXowNTN5V3BoZ2tPOFBmNWcvSVlj?=
 =?utf-8?B?VkRLZzUrN0p5MGRMYVpBVkpBV0V5Y3l5OEhFY0pkUktKYUx1Tk9jQk0wTkRi?=
 =?utf-8?B?QkxlTjQzOWs4UWQ0TGVxRVFKcURaWVNJTVlscHVJSGNsSnlycktHNHRSdzFG?=
 =?utf-8?B?Mk9oR0ZWUU9FOEEwTEpZc0J4cDBUMWZnQzVKcFk0dWpmN3psVEFUUE5Pb0ZJ?=
 =?utf-8?B?VCttN2ZlcElKamhqVjRjMTFiazZIS2FiNWkxUDhTTUd0VU92Z1Evdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865704d1-7e96-4db2-38b0-08de85b40538
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 12:35:36.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr63IrpUOqIFV9d5p3RSUTM8CE6ko7QWnajiioGXYvbpO0pJhagf+vhbkV5AUaPqXYtir8Z5OSczeS0RgRyvFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_053546_433007_781EB321 
X-CRM114-Status: UNSURE (   8.99  )
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

On 3/19/26 10:18, Joy Zou wrote:
> Add i.MX91 9x9 Quick Start Board support.
> - Enable ADC1.
> - Enable lpuart1.
> - Enable network eqos.
> - Enable I2C bus and children nodes under I2C bus.
> - Enable USB and related nodes.
> - Enable uSDHC1 and uSDHC2.
> - Enable Watchdog3.
>
> The board description can refer to the following link:
> https://www.nxp.com/design/design-center/development-boards-and-designs/IMX91QSB
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>


Hi Joy,

Please have a look at this:

The white space comments are legit and maybe also the rest:

https://sashiko.dev/#/patchset/20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0%40nxp.com <https://sashiko.dev/#/patchset/20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0%40nxp.com>



