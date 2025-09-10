Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FxeK8MIgw1+MjNYsgBUKJbgn9oL+02JX3KPVdELzjo4=; b=DkkVEj/I3HlSt2Tv4G8+e68cvM
	tORkHG0AajpTuYKUk4NSz4F+pyIv54oioZc04NvzsOtozkx95hI0kntb/1gs81vhNNWFpMrAHdDlL
	iJ5ocyWWL50RBnVMgdqEkS7p1l0lvvTeYO7qi5tdndyyUdFfmjfkh+M0FbnmXstfPkMZIAJS7Gfog
	HAYV/URa0AJhLZChkCVaAIYesqDvV87O+F9VWwISn/mWYlslS0ttylmzLQcGPXNTg074Jvsmxl+94
	EivltrYf61Xbd/os3qCegIXmo1fkObH7TqnGEPAb9G14jqUxnPEC7ZKSjG06maB98k5nNFM2UDbEN
	n4n99SFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF02-0000000CQPQ-3H8V;
	Wed, 10 Sep 2025 07:12:14 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEzz-0000000CQNM-2yvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alt68JGXkTiOO0ut6ZUtEynySbe8X3fPhdsN03GH9WV6xNZfTpohCWeZCzPtaGJ1vNNQsPnximsTuHaY6G17yedyQcF7nQpKg8gFQ3/9OIySid3xW25+YPrDWuGB+0QLfNfkjWicGt63U5J3rMPCwTj6ITnCl6lqifSFYwPthL2OEkaHZF0pb3C0PAfaeTcx+E2bU1GwlFxTIBnveakOZsVcJdhhoFxIpDlG9nffK1MclzOAbVQeZPNO9ix2C9wxvH5E7RJJKZBOYWHZCltJGt05LMnI4XlnU5AT9gwj+BK1RGmCHDljq7B46WhHJrof7L8OxJAF6473tQoXXjnbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxeK8MIgw1+MjNYsgBUKJbgn9oL+02JX3KPVdELzjo4=;
 b=m9cKrubjtSRiOSAO9zHZCWatW/nN0zj2U7lHpXY8EHFKkCSIIU9KIr/t87ts3Llr86uO0SZNOH2pTZbjUeWwZlIGbVHmzY9wzVET7jmJdXLDuWNzPRCrNK6DRi77PRGEJAGF17BkYCZUObz6S/W93q1zojRag6NuuF+bYSZt38kD+icheKJljuIg9qAyUmvgbW7dAuP3RFf32GppmLt2QWMuQcYKtfKZ8+hkF4f90wVrzTy+fH9pSyC3NaOohv4QIycFpCZzUtbdXN4X2Q9LC3QuUi4OByuL+bdGw9fUPr8C91XtugwBKeQLb3clsrN6F3EvbjrPEa4YGgVBxrAEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxeK8MIgw1+MjNYsgBUKJbgn9oL+02JX3KPVdELzjo4=;
 b=c6qYCdZw21rVjUsRuE611bVRqjSAnaJyYvQqXx97dzkbrS5xRT1Ve/d+RrQLtLU4A1562fKb6eGuJGRqOyp0S2J1PU+yqRxH4H68np4NGDhDvTPZJqey/WPZLOes0FodIfR2kVWVnIy4yQ7+16eyYEesENZa+YG3coAhZx+DdK4Hz69Vxx/GlLgm/BT3/FilmUjimx+cBWwvdrHF5f/Bdnc2V8cu5Pmm3fIUOZ1TvGbnJYvG4VQm9b4pdHLzRq0fAir6qAhC13vDMzKMh+4qT1BS6xxo3IKolLaVdx9NKsNdzTyXWhBp7M4Bpu54R1+Nr5RdC7HoeJmJFaOSfPOXeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:04 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/6] remoteproc: imx_proc: Simplify driver by removing
 the switch-case
Date: Wed, 10 Sep 2025 15:11:44 +0800
Message-Id: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAkwWgC/32NQQ6CMBBFr0Jm7ZhSCgFX3MOwgDKVSaRtWiU1h
 LtbOYDL95L//g6RAlOEW7FDoI0jO5tBXgrQy2gfhDxnBilkLTrRIq8Jgw9Oo37SaN8eG1NNtWq
 mzswG8s4HMpzO5n3IvHB8ufA5L7byZ//VthIFUlu1eiqVqhrd2+Sv2q0wHMfxBQ0VFQ+wAAAA
X-Change-ID: 20250908-imx-rproc-cleanup-6f3b546b9fdf
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=1654;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=l4wOK6dSSu2vwO/Kx27CfHPsqC3uv/01tsCSf4k/CMg=;
 b=eG+konEZfivYmnTt1NhfmEhMsRkBWjIVqkExkARcFB9DKm8R3tep2jUBOQ4fNrpNX6wb4MLHa
 i5aDgibdD5yAgdEBkxj0RFKgekFJCHpeDWOTfXR8HYB1O72/wGPybAe
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 050b6215-42de-4d07-0c30-08ddf03957e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?byt5cWpIVEc4dVJHZXFybTZ5MXdOQzh2QkRtNDZXOForWm1SK1JrM2NReVF3?=
 =?utf-8?B?cnF6RjhuV0FaYXUyMjRyT1NLQ2MyWGtIY3hyVHdIaXFYYVlpQzY1ZDVPWlNM?=
 =?utf-8?B?eUNXanVpNGZhT2lpcUYxb3p2bm9BUitVdGFYeEZtRDY0Z3FackR3cnhHa0pY?=
 =?utf-8?B?RmJSWFVNcGVFMHlBSDRIK0l0OXBaTjBRVlRnQmhsbW9qbm1kN29Nczk0OFNJ?=
 =?utf-8?B?aU43ZkovbERzOEJ3VUVrZlhyTVh4QXpvU3Z4K0QyTnlBQjhvM2kvV2hXSkxZ?=
 =?utf-8?B?UDBKdmZSQjJSYjlvZUcxcG5kQVEwK3dMaXpyVnZPZ1NHVkFveStDcTlVWklt?=
 =?utf-8?B?dldaWDRkUDhER3NFeVhGZGdXQk41TWdkZkdhSXZyQitPdExicC9Ya3FkcW5N?=
 =?utf-8?B?MDFmVEZHT3BFNkZlUUNEUUdCa1JNalFORjBETW9sN2EyWk1FalBKUTRkTDdu?=
 =?utf-8?B?QmJ5TStROWN3QkJZMHZGY0toRmhZR1ZHMCs1K25va0FjQ1UvV2NkRUZoNzhE?=
 =?utf-8?B?SXpkbG5YYXZuT25rclBGTTArV0ZhUExwWkVNNUtkTGIrd21ZUjRPaERxb0JH?=
 =?utf-8?B?NFR5SW5yZlFEVTdyWEl4a1UvcWtNNGYvbnNPMTlGTDRreXY0VkJUUWFVYkZ5?=
 =?utf-8?B?ejZlZEQyUlNsbFczZUNScmZGSWd4SXhCL1lKTm44aXFub3lBZFBGLzc0TnNk?=
 =?utf-8?B?dWZKQlRrdGhpODczNmZpbDBKV3BrbVNMcklCRVJpb1prV3RWcEE5WVY4VXU4?=
 =?utf-8?B?SUwraVJ6ZnlKaEloR3BEdlhjMHROT2l1RVVpdFVsVlBwNmhpejBTdGljOEcx?=
 =?utf-8?B?M2tWODkzODBISUdkVVQ3T3IwZVdmMWV0QzRVcXlhL2szRWhMUXZ6dS9qZUly?=
 =?utf-8?B?UjdQUllKL2xiWGNuSmRNcXRKdkNUWll1MzFOMWp1bnBEU3NOMzJxTHFTQVJ2?=
 =?utf-8?B?bEhrRllBb0dMc3kweDVsdC91OXpoMFpmWWkvM3ZHdXdsQk9kZEJRdm1kVWt6?=
 =?utf-8?B?WWFEbDNzaXNxRlhpTEkxNHhUZ2RFekpSNVkzSDJJd0I4RmJMdEZBVFdxQzdD?=
 =?utf-8?B?TGlYWXdLUDc5U0tNclRydG1qN3JaOXRibTJzb2p4bVdiMStiVW9BUnduMUtn?=
 =?utf-8?B?RjNSUVg1VTFTWlNGby9aRGdMTEtaRjQyb05rbi9GcGs1cTVtRXpkc05qQXB2?=
 =?utf-8?B?N0dGUitNQkpUUlJpTUpRbGh3N3ErYmxqZlgyTUlOMXhpT1hhT1g1VHBZYklY?=
 =?utf-8?B?VUMwRXZHdnEra0p3RlVBLzJ1N0VDWnZzcE9NajR2Uk14TG9KODMzRjlFSU1G?=
 =?utf-8?B?UVQ5WkU3RFRoRE9CeTVSekM0RHF5dWJpV1luMlZSUTVQR0JWTFM4a0JJTE8w?=
 =?utf-8?B?Q3VsWVc3OERyVFI5TmVGK2YyeHNBbm1QUkpsYzBTbzkwR1hBNzV6SmpCeTJC?=
 =?utf-8?B?SzdhVnl6aERhMWxnQjZnUnpTenUxZVV2VnkzRWhXVU9jNW5UaksxYmcrbHFB?=
 =?utf-8?B?MHBzTGNBS25wQmdqSnFUODhzbzZReG5mNjA1VldVeGltakJnKytvcU9xS0o1?=
 =?utf-8?B?SzJjUjU2N01nVCtSbThzbldDVCs2S29BTGI5V2FPSUVNaStsNmZyYTVMZHo5?=
 =?utf-8?B?Vi9FWDNKbFlWR0VuL1JLSlFTM2dMNEVFcTRCRkx5cGREYnIrMjl1SjRFYytH?=
 =?utf-8?B?L0EvRExQWVd4Z2xFeE1sNktyVFg0U2tRbXprSWtmSXB1bVJjVnh4ZS9hK0Ns?=
 =?utf-8?B?elVxazFxWS9uWVBrWklRSjZIcGFXajhxNmJFN0ZNWi80SW5ycEZMLzRsRys0?=
 =?utf-8?B?Tm9ISmFsTFRTRjMyV2FKbGNuZDlQYTE5R1VkMkxBM0prTU5rTVA1MjhJVVgr?=
 =?utf-8?B?TFQxZXRncUZsa0pNMEJFUVQyVWJXZmpoUTZyb1FCMGhBREhpMlZ5RG1tc0wv?=
 =?utf-8?B?bjVjQ24rUElyL29aY2tuSk56RVBjanFXNmpZcVk3OU1aTkxtQVBEeGE0OWVS?=
 =?utf-8?Q?bcJ0oveG0y5K7D67tSVp8PuVAdX4xE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01UV1l2dHNJZXdKaWZxSE5oMUFuRkFiUWt3N3lOL281cTBBZldoN0h4bUND?=
 =?utf-8?B?c1laUHNkTkRqaVVBZGNuclQ3bWw5clR2L21BSTY4dUl6ZExFT3pVU1FVRDFB?=
 =?utf-8?B?aUN5ZnBDMDJoYmVObkNHSHJpemZjZ3BRc2dxbmdyOCtsU2cvaytWNGg0aElL?=
 =?utf-8?B?dVQ1dmw2NkhTd2szSzlnVGRUdkZyUmpnVThpL2tQY1hsMFl3R3Q5bmQ1Ty82?=
 =?utf-8?B?aGRNL1RZTFVWaFlEUUxZM2h1aVpOOUkrRTZEakNjTXlRang2RXFPbk8rWXE1?=
 =?utf-8?B?a3gzSi9tQ2ZieW9ScFJFT1RvNFpEQ0pyUllSQmNTVjE4WEt1TEI2WlZHeXFW?=
 =?utf-8?B?VENKekRVSHpFczZTYVpBd1FMZzFWTEEzNEJ2L0lMTE8yRWF2TnBodlNSWHJa?=
 =?utf-8?B?VGR0aDZCeVZ5a0JjSVJJSnJuYi9FakNxcmNkSFQybTd1QVd0V21hMTA3aXN1?=
 =?utf-8?B?WVV5a2tHWlJIZ2M5cU5QdGRJcEdUemxaRHZYaXNoUEp5d1dmOTc0R0cxaU5j?=
 =?utf-8?B?UzdmaTlHdW9PSVNEQmhkbDJRck1uT2RmT092dXlNZEtVb05QcGZoZktJeXNa?=
 =?utf-8?B?ZmREVUppM1A1ZUpWVHZFU3RDcSs0WGxHam1FeStSd2JjamZ4NzEwbjVUR1dL?=
 =?utf-8?B?cWt5TXFjenQybFNWQ0tmbklXWUhHMDFzc0hPQUFRRTBsN0ZQSzZTQkdVZ0s3?=
 =?utf-8?B?VjlrNjgwdjZqSk5ON0cxeUlCeFZ3eVM1eTFpaWJTZGlsZ3BxMUZaYzhGY0sy?=
 =?utf-8?B?bHllMXFWVWtnRlM0T0lhNGhrbXl6aXE4c0hIcmFWSHp1Q1BoWkFvSHpCS1JQ?=
 =?utf-8?B?bEp6eGVvNWVDeDFDTUNIclpDNmJxd3I3eVcyb0dzemRLZ1R0SXNWU3lJczIw?=
 =?utf-8?B?NTUyTFhlZUZDYmtRaDJZamt2cnlwcTZtUE5SSUVhSVFGRmN4c1RnWlRxL0Rr?=
 =?utf-8?B?Z0JENTJLRzk2bkQrTFNNTjVZSnJBZzYyK1R6L3BIa3k3eDBvWFZqRHY2K3JL?=
 =?utf-8?B?M0tHODFXbTR0azM2RjAydjBYWXRxWXJBNTFTV3RIcVJZNjFJTzU4ZXgydUxw?=
 =?utf-8?B?TDJaRUJtZUtRa3luKzBiY0Q2T2R0TnFrMnNqdHZhSmhaSklMTGJVMU5yV3NI?=
 =?utf-8?B?K2gxRzg1a2hVc0R2YUhSTzBFaE5aNU03Q3NwWnU0MndCdUxiRWhRWmloSXhC?=
 =?utf-8?B?SGcxOE1yVkg3SUdCQXJ5U0Q2R05pdTNad1BtUjRoRlBNUHh3a1dSQjA1LzFR?=
 =?utf-8?B?NVB4Y0c3UGVqSjlyeGw1Zm9UZmlkd0t2QXVNU2UrVkhYRktvR3g2MnU0MmxG?=
 =?utf-8?B?ejNrbnoyTXg3TDZ6cDRXQnBvZ0RLWDJHVVBwcHZsbWVYWW1rblRLZDBZd0Zq?=
 =?utf-8?B?RitqeC9mWTZlSlgzQUpGQzhtLzBBOVgrTk16SldOdG5qcGlCejAyRkhNMEVz?=
 =?utf-8?B?RTBURFJ4OWEvL2c0QTBvSEg1WGpmZUFsZERtRnhzRkNBUUhKYVJFS2JQczJn?=
 =?utf-8?B?U2ZzTkZhdCs5YmtwQTEwZGg2Y3F4Q2V6amtSekluV1g3RGdvUGtVS2s4Ykpw?=
 =?utf-8?B?TUkzY1QxaWZPdU9CNXBBMDJOL3BJNktUdE9hRi96bHZwSVplMS9TbE1DS1RC?=
 =?utf-8?B?L0JpRk1nNVA0dWdEbEFmdjM0YjlHN2EzRXVtNmFHSXQ2VWc1MUZoZGZCdXYw?=
 =?utf-8?B?MElQWEFOWTJHcUJtQ2lmditKR3BkejhWRmxzcWQyRGM0ZU9XekV5R2Ftazlo?=
 =?utf-8?B?NWxXYXYyekhVR0JtblVTaU12bG0xTjhQWm91dTA0UGZxbzJPai9JbVpGVjlL?=
 =?utf-8?B?NHV2YkUzWWkyWTR2Z2dVVDZFODU3d05EdjlTa2tGVk1VN2pOeXBPWG1pMTNq?=
 =?utf-8?B?bkYxdlhReThEL3VoTHNRUUYzSFVwZHpMaVlsL2FWbHBDSFZVTFlLRzlwcGpF?=
 =?utf-8?B?NWIxa0NPMzcwNGhGem9Pa1JaMVlqOE44ajhlOGxMcmdPcWVIYjdSTHF5dW5i?=
 =?utf-8?B?ckRiSmFUNkVXcVlXbzhjM05VTy9tTUdXeHk2ZEtEeVZXR2w5bzVpSWY4VDB4?=
 =?utf-8?B?TTdzbnFZcTB4bWhVVUlxOGZUK25nWk9ocGVUU1RSQWp2MFBOSnhlM1FqdVps?=
 =?utf-8?Q?sxsyPn8sFtEtSuwji7dmS1nZl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b6215-42de-4d07-0c30-08ddf03957e9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:04.4102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMo84V9aBVpbgpye4lX3Z37p8XjtpAYZUHHqx387UWX/euXrp1Ed+8y9fm0xZITOsTECiuaOg2NVOjPzXEBWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001211_762010_BE146063 
X-CRM114-Status: UNSURE (   9.41  )
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

This patchset serves as a preparing patchset for i.MX95 support.

The current code logic is complicated, with mix the usage of switch-case
and if-else.

To simplify the code logic:
 Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_mode.
 Each imx_rproc_dcfg data structure is assigned a ops pointer.
 The common imx_rproc_{start,stop}() directly invokes the plat ops, no
 need the switch-case.
 mmio/smc/scu_api ops are included.
 No functional changes.

Thanks to Daniel and Frank for the help.

Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops, i.MX8QM for SCU-API ops.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Simplify the if/else in patch 6 per Frank and Mathieu
- Add R-b from Daniel and Frank.
- Link to v1: https://lore.kernel.org/r/20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com

---
Peng Fan (6):
      remoteproc: imx_rproc: Introduce start/stop/detect_mode ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Move imx_rproc_dcfg closer to imx_rproc_of_match
      remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch case
      remoteproc: imx_rproc: Clean up after ops introduction

 drivers/remoteproc/imx_rproc.c | 449 +++++++++++++++++++++++------------------
 drivers/remoteproc/imx_rproc.h |   7 +
 2 files changed, 265 insertions(+), 191 deletions(-)
---
base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
change-id: 20250908-imx-rproc-cleanup-6f3b546b9fdf

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


