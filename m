Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0FEE674B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIu+SWNPcmikzl5SdaSnLRex8alay4FoI2wVLeEmXTw=; b=CUQ9/Zh1m3KIu4dUA8h7YmTkwG
	4nlXiQ4uAg4RmdRo3ihcZAPE9KJJZFS4kVQULnDZ/uLwCC043vXjZEs4o4S3lH3L6KxmWSAHVYJM0
	T4n7yXay5amFFIJuNMZzVnCjNSiYtvk71W9AWqHt4Ce/5QiY1asJy08+oHmc9QNabg/JDbpp462Bk
	zrdxoLfvMqv0IrG+CqvE5DqcFN7iwJDIoyt+l249NnrWrMcRA7KhPbplvC0Wlm4eerWcG54ApfSC0
	3w+b336LNkXsGO+QQ/p9Al0cWbbg3OphNBFPtG3p5cT8GCK4AN8KNK2y8/fFFZRuhPXXV61rv2Ft7
	9L5KsPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mtO-00000006FTm-2Kxn;
	Fri, 01 Nov 2024 08:20:26 +0000
Received: from mail-am6eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2612::608] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mgR-00000006Cn6-1sb9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq2yzEXD0XoryczAE5v1yIzN2qWGSW7zxD6/rFCvTOC2dWI8DgZSPeBfbYIOsceYnSkj0+MBK/XKDsTAeQqYPEwZtxcTEHTcqzhLo0Skt161iK3WsAG5g0EpuQY7mVRLp3oz8YE/M1jDFgLxQgVNkbu/p0zVdhu/i5TBTo+95R1tWu0/tFoZKUpiTwBHvsm5uo2KUfYoNuF202aDU5eEl7NN6OD/tMphs6nEO07x7T211uRW6lPCvOD2gvx01/WOXWk5N8ycqV2ghi2SeJa5BiOwC6KvXXSALeUx3iJYi/nIQO8BZV3e/36FjJTqwjq0Zu1EDB6/A348ezPxo2GodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIu+SWNPcmikzl5SdaSnLRex8alay4FoI2wVLeEmXTw=;
 b=VQAqS+x8tGhbwys8BmlP6nBsnnPnN251Fx0asCBFZu16Lq3z7o3YHLqWkdgvTqD4LXsGy4hLY+8wfWdG6QcG0Oih/8HupbZXpepVswMWiM9fQ4zZuxQGv5fCbrtmY2wHc17oGXym64sKn0e+zCZFrt/uQ9GXID4beQM0vCyA2D6fKlPOcD6DsSgVaSDFLa3nw31tZWAGoCmd8Lq7fwZ5WLIjpLWzEizAFh91ukZoVCqmHh//UoEi1hlkNY8Yn5YUi8OWMAiObidcme7j2p88+bXPwhPyqXnnSNqSaF/4NW350Bm/toN4WhpuWzMMPcVKf1CvXKl8ermp5uS07pD2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIu+SWNPcmikzl5SdaSnLRex8alay4FoI2wVLeEmXTw=;
 b=oo1GnmoUEHKZped32rSlvl4Cfrio4coHSErJINo5LKZ/SctteCp5bSZOYfqE+uF/zYNwtd7z4FxIgLRe06LEhKi372vXR8UXHWSkf6Jn+AcE0RWPtQLMx7EV1sHpCcJzRNUhQmbnhqe4TbmTWyvnWJ1Y5Sm/eUHTQiHOmhFeIuzn6PCjNEsMjwimiIes2NwPerds8iQ9k/RWK41SDB46rd6yzT7cG2wZm7wZq2rzGZAuU1xau4BXvVXAkTKwHR+hg8IdPj0d7Xq/teS7ROuNd/mrGFw9nU2oz7kKFuApe6mecOG8p5+t67GOJi1GtEVXTwA5l2qlPVUSeBWaJy1wgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 08:07:00 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:07:00 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 7/7] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
Date: Fri,  1 Nov 2024 10:06:13 +0200
Message-ID: <20241101080614.1070819-8-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: bd73c5c2-1966-4299-88fd-08dcfa4c294f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHl1WWtNYkNyWE1GV1lHYVVXbERrNUZlNEIvcW5IK1djVVBiWWFHQSswbEZZ?=
 =?utf-8?B?ekFHcXhEbTVFZk50VUJpMU0xczB5Sk1rWGpIaDc5NXVnM3N5anlndTBrZnZn?=
 =?utf-8?B?RndGVmVTMjlaWS9ISDFZckVLcW95d0VaaW9Ia3FlY09Kd013S1pOTG00ck1u?=
 =?utf-8?B?aytTMlVTSGdDZlBUdUR4dWlpOW12cnpDbk5jYm5iU04xMXpzVnY0YlJ3Y05K?=
 =?utf-8?B?bTM0WHdRdDFuRzZrRVNhdDM4dmo1SVd6T0xrakRsZ25XWGQ5VVhicG5PNWM1?=
 =?utf-8?B?bTYvMXdEd0NYT1ZHdjdVVjg3dlJTS1hWbEJlN0M1d1JMNG8vMEtDdjdsZlk2?=
 =?utf-8?B?blgzMmJmRkJHRzZ4VzZZU09OTVRHNjRPc3JCamY3bHM4YzJVZ1o3SEp1VGVs?=
 =?utf-8?B?ajNqU3JidnovNFlUTnVOb1E3WjhCL2xHOGJDVVMzYjNjR3RFbEpsTENEaHlz?=
 =?utf-8?B?NTR0ZElJLytjaWcvellLSWNkTTdQcDhOQkk5NUM3N1NZM3Z3TGdvRFlUeU1x?=
 =?utf-8?B?WVBvR2dWQVhXazQyOGNDYmpLemRxV2w5VG56Y2hwaXFFMzZ3YXMwZWo4bFVk?=
 =?utf-8?B?RnJzZzZNckgwRUZxQ3pneXI4dEpCNEwzbFFOeE1kYklFaW8vMDE1VkJrMm1N?=
 =?utf-8?B?TGJSUEdTR01BRmQzN01CZndlTkJMZkpFZTU2TUZKbWFHckJwQVFkR0lxNUhF?=
 =?utf-8?B?N294YXZvSEVLVDU3SjB5NERoL21XbkhVaUxOM3hlNWs4RWhJNmhtWnhBZi8z?=
 =?utf-8?B?RCtmVW9pamxpQ1dTTXZkSWo5bmpsMUtSSFl5aStwdFExbmxIcC9RZ2VrOWpL?=
 =?utf-8?B?Q3h0R2VHUTdjWktHWm02TWkrTEJVOXNFN0ZPOGE2SmhZdnduRXg0RDZvL3FC?=
 =?utf-8?B?NXdMdnpXS0tYTnhNcW5iMllsUGhNblluaTI2dU1HTndVTXovb1FaSUh5ajEy?=
 =?utf-8?B?RmRtQ21Kb3d5S1ZvQitQMmhyVmE3MDNseEZaOGFqQS9wSzlTZU41VVJsRUtm?=
 =?utf-8?B?QVJ3Y1dYMVY4Mmw4TTlYMjZKQTFoUXlGUlhXeVdyTjRYdU5DL1l1dnpEc2Jq?=
 =?utf-8?B?T0Jia1NEc3IwSmRtQW1QT2lST3ZyN1RObjAxb0tubHdwandmNFVJU0FJa3g1?=
 =?utf-8?B?TlluMjJiclVxOHB3N0JMZHhGdEVpcTh2ZFBJdk1lYXpQQXh1UU5kMmg3L3NV?=
 =?utf-8?B?UmdFS012OHZRUUY3THpRNjJ5czM3ekxNaXhIbUJlQSs1Ym1lODNMbjVtVlpm?=
 =?utf-8?B?S0dheFd3MEUzeFpNdFJ5RkNTS1UrYkx6WWt3RjZKYklxYmZuS01LMnJ0L3hh?=
 =?utf-8?B?bGdCWHRUd2FuM0piaElZd3JOY1NkcG5GV0JsNXRpSTQ2ZmdobWovL0M2OEpp?=
 =?utf-8?B?UENNTFJMYU1hSVdwakFzSGRhajNsTTltYUwremkxN0FOVUpHZExYanFjMGxQ?=
 =?utf-8?B?N3pvc0hzSGRibDlpd21CNG5WcW1wT0c3d0VPTmlCdjNYeW5XN1hjcmEycnhY?=
 =?utf-8?B?OVh0Vjc2dW9FK1lsTU9lVzJwNjJXbDZZQTg0OE9KbW43SGE2anpPaFpGekMx?=
 =?utf-8?B?MmZ5cXV6NVlGUWZONTdkd3pPSUN1Y2tiVkxJZW1ON1dGbk95TnRNcXJaakZi?=
 =?utf-8?B?TXR0b1MzMHZrNUpzMW5tRzJBMEFSWHZ0d1RacG9jakVrZXkzNnpFMmg0N05V?=
 =?utf-8?B?cVVuRm1lbW1ZeVpKbkwvQ3h6UWFxcGtuMHk5Unpzbm90c0ptQmkxTEUvcWlB?=
 =?utf-8?B?amIzbG5jQVc3aFFYOUlxUkdVZHlwai84Y0I0L0xDclJHcnFjRkJzZWx3aU9R?=
 =?utf-8?B?S3dQc2wvdXRIeFNxWE5SeGFNZE5VTkxWUVB6eGhqT1RRV21RSFpVVzN6ZEZ0?=
 =?utf-8?Q?sNnql3VJiz2lm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFdDTXF3UlhsSmw4ZlMxaFZZK3hRSTFqNmpuYTJhQmVUME94TEVzcVNSeWNQ?=
 =?utf-8?B?MTNFdVI1Q2hzdTFWSnFjaUNOcGVZOXI3RElPb1Y3NkZLQk90QW5ad1JXY21L?=
 =?utf-8?B?bW5BeDNCVjFTNUU5ZlZNcmxrWXNocU9rRTh6SWhHaUU0R2hDMUhUZ1MrcTlD?=
 =?utf-8?B?MXB2cXJTTGdzNTdsMFdkQ2tXM20yQ0JwclUwYm1BNlJqSi9oeW96bWl3dko2?=
 =?utf-8?B?ejZ3NDdjL1FBUXBqNFNVNmFOVTkzdjdpM3ZnK1B5Q0Z4TUt6aTBYd3A3bWdp?=
 =?utf-8?B?OG5wdndlcUY5aVRoa1ZxbmFieWRlM0Nrc0szZTRaNkpGZDVKSzE5SXNXUFkw?=
 =?utf-8?B?WDZuYzFueHlGdk55OVJNOC8vdWRwM2VLc2NvVUhveXpWQ1NSaGNjdEZ6Z0Fi?=
 =?utf-8?B?V2NVeXFEUWxJY0orUVZkRVVTaytJUDlhL0ppdU81THdXZTBtWURtS3JhbWZJ?=
 =?utf-8?B?V3pBeG1nSDZYQWRZakFIL21DalNzRStkaE5wVjBxSWlPejJ1czBGTjZQZFZS?=
 =?utf-8?B?SjlVYzFZcG1UUytNQkpKaE90WWVlaWNzZGxWTHlVcGx2ZS9pN3BEeTdpb2Nw?=
 =?utf-8?B?OUt6N1lQK2szaHhiMXZudVFmeDZNdnVLQW1RUldqcFpVaThtNnpyM2VvQmVt?=
 =?utf-8?B?alNHUWNHS0pqcWxqRnBmeDhFTUpjR2hFT0dGNXNTTWZkS1dLUjY1ZWplajNZ?=
 =?utf-8?B?eDlveWZ1REhLTHc0aW1rVU5mZndzMWtmdGMzdEV6a2dEWWJJUE0ySkczWmZE?=
 =?utf-8?B?Skt5V1A1M0VXdzhoUEVUNExUVmVKL3J0U1BnSVpuUVJtUkhvRDZWYTdRVEFu?=
 =?utf-8?B?VHMrdHY1MTJtejQ3MUoyRG9GQjBwd3JKMzBRc3ZUbE5rNmVIRkY5VXJrd2No?=
 =?utf-8?B?VER6U1NZOFA2OVRLSHRHVC9oQkYxTmtkZllZL00zbzNCUFpnQVVJN0xiSDBa?=
 =?utf-8?B?MWw3YTZ1N1BFcmcxcitxNTNWRFdjOXhiZWx4N010U3JXa056dDdaczZPeENX?=
 =?utf-8?B?UGRBai8ya2h6dkszR1JhQUdrUS9TWUp3dlErblVjU3ZuWXovWldQdVNxQXh2?=
 =?utf-8?B?Q1NLZGRaRkFobXdsZjU1Z3dZdmlDVXdGcEkvSlBkaDd1bmlBU05YS3I1Ujll?=
 =?utf-8?B?MkVRQklHNjRnYXR2LzRnbHNSUDlQUDd5NVB6d2xndFluYmMycTVML2VwMEhD?=
 =?utf-8?B?RWpMeThTSjNqc2FzSTY3aG5manlCb3NoUmRWdys5YW14SUpUM0JITXlTcVBR?=
 =?utf-8?B?NUNxMk1UeUJ3R3NZYW9BTS9YclE2WklIU3lPRDhyYmFiSytqalV2K3BUTElF?=
 =?utf-8?B?dXg5bk55a3J5OXduNndUdnlwMHBHeW5FcGxGZ1BETUpmczJXa0lUaVl4bHV1?=
 =?utf-8?B?dnlIMU9INWd4UDd2Rnpka0xROHJzY3VVVlRhVURIaXE5SytTSVMwKzgvZFZ4?=
 =?utf-8?B?SmpqTTAxMHhHSHFzWVVBaG56YU83ZnNKemhTVzJBOFg5b0s1SW5hOVllVmdl?=
 =?utf-8?B?bFdyNlRudGozRXIrQU90RUcxek85SFc5N3lRaFdQajJMNk1odnpVREdmaXA2?=
 =?utf-8?B?TVJTcEcxRG1qa3F4Ly9uWUpYZHNVUlFBdW5iSmxzV1pnRCs5MHdqTXZIRnUx?=
 =?utf-8?B?bVdtekVORnZVUXRYMDdFcnQ4eXBJRS9nZU1XZ0N0WGZiS3M3MXNMVTRrSUdu?=
 =?utf-8?B?Tk1WUFI5YWVLM1pBVUdxYWZ2WU1MZGZJN1N3YXlCbjArMVB2RTFMQ2lCTHVl?=
 =?utf-8?B?UGcyK3Zhc25UY0FuZVdCOENPaDJBUUFNcDNSTTIxdGlPYlVMWUltdGFkTjhu?=
 =?utf-8?B?cjdlQ0hBajJTQzBzdjdzdTFZd1ZQenFZblhCdktuZTVaeU1WSEFXOGVyd0tP?=
 =?utf-8?B?Y2p4MmdySm1kRUdFMGhoc2l4WkhZT243R1BqYXI0U3hmMVVEU05XRjRNUmQw?=
 =?utf-8?B?ZmpJb3JXakRjK3hrZlJzZXhVSDF5VlhiaHRjd0JNR3dnNlRsYjhkU0VYRHdG?=
 =?utf-8?B?ZE5ibWVxTkFoZlpIUll4SmI5OCtuR0NRZ0ROdDhXbUZCNSswVVFTUmNZQitZ?=
 =?utf-8?B?a1lQTUIzNFJnNWprdzFHaWFlQnlYUWVHUXAvRU9JamNiVTNlU3R6K0FIYlM2?=
 =?utf-8?B?b3NoY1ppWjNaZHdGNi9zakhLNlhzMkN3YXBhME40Ym9Oc0dtcGdwS0VYTkVu?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd73c5c2-1966-4299-88fd-08dcfa4c294f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:59.9401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAxYn0yxoHBUWU6QuUc8g5ABMrYQwgN98aEsd4pJU+5BytDqx2rJFhkeZW7i1I91NZRZva6ir0AkEe5JTKXr7ipY5bC06zZE/N534i363vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_010703_517962_72EF6C6D 
X-CRM114-Status: GOOD (  12.75  )
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

Add the new MFD driver for the SIUL2 module under the NXP S32G existing
entry. This MFD driver currently has one cell for a combined pinctrl&GPIO
driver and will, in the future, contain another cell for an NVMEM driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..707cc15e4406 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2787,7 +2787,9 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/mfd/nxp-siul2.c
 F:	drivers/pinctrl/nxp/
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
-- 
2.45.2


