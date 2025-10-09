Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2A8CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 03:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmvRLlTUnfvGhOyB+z+wb2wR1vDLELekbCKyGRm29v0=; b=tqypaWSIzFZRWD1+qavFpxcGQ7
	1mXvZDXtu2Bl2pb0ws9Xtwba/xdJkzZ1wdeBco37KB05dsj/QddskKmEyB3ls8RDQQVBOMzgaw8fc
	adXjm+AseO3ig4VL7/bZ8bQFty7Fr32OYz/P3UhdciRMQkxGlQ0sVh2d4BJR1vcNNAZtkLwMgrv+s
	fMAVia674IIJKfFC85Ql7R0X0JA79qxHzp6bMamhu9yN+LsXKbK94K62hcovDOO7bbiubfLeWPI5b
	tB71OC2qfsFP5j8deCDaI6h29ghiswaFVqCUscdWWlaApN5Vf0LDxvakkbAqrY5lU81mDHeOFOfmN
	4FfUsNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6he0-000000057Sv-0qpU;
	Thu, 09 Oct 2025 03:48:44 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hdw-000000057Rv-2jqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 03:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHdTcYIxhW58RvTPBE562bWfhIFRaFuMhvYqe6XmIDJlj4ZdFg7bfZqaS9HfW00TWKMIbaKuATsFP/l8iYaptSlfV26aNya/mYx0pns/GhL+vCAZF+jSriwJKWriAYS0q5gVe//kVypAk4esi3pf0zRLzaoRl4hn15qUrsBQHt06ryNVOHCtxRPcLvGVu9wOJSdk8oDA1KdiyIlLiigiU1XTR0g7AKXNE1Ev9k0BwlNLTWKb2rMZbW/PcCZsKOpVmkXHol9HEEz81W90+sQx7l9sUkkDj4h4N+rImL3HBixog/aE6ymNXnSKCcL4aJUPZYO5JTur9eVJ6G2pEw+eNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmvRLlTUnfvGhOyB+z+wb2wR1vDLELekbCKyGRm29v0=;
 b=hXNY46eg4yCjP8hGdOfeGPGzpTv5h7tmX6GdR3FJ9fRAxStr40s0NJ1Rmtug3uFRDrXaAr6EreS/ugDzCuC3dlAEcPKyRhKaBQDWMRHm3NTYcXn0dEN54DEBfvK15EMS/RbLH1GHCEft1edtU8I2MPyAh21nDNKjY0/BjvK475s7bKFNnqAw8OxJwD3P1hXlfkCY/8LMQ/IFrOuFC3g6KRBTLwVncEtA4B1+NI63wAws3GXCeMwHENIlGUSO+Ch693bVkms7VUYhsH1tbr5fSWCf2xQaTjno7SKydhlHpBBQp/YoYZ5EjEN3jzIAX+enCgu3vS50SH2ihY3LD6bMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmvRLlTUnfvGhOyB+z+wb2wR1vDLELekbCKyGRm29v0=;
 b=dTJxXqAMAjScuqwDx2NaSbhuRWfKtVAGe9VGfVr10euX5IME5jfGjj7RwQW981BVeJogmBNt1q5tsWDYjhmAdyKwXmPZiMvBH0Lilw1uJNRax4RBTyCD3Faxx4n2q8Z3JU66Tj4T+G/ISf/eQHaTIUhjr0s3/U0OZ5asDkFESSI2Xpu4mOPQprkf1pEmvrnC9xEcQQQ/gnJhg7V1Vo0JPuqM0MIj10moUEdFJwOVjtcU//1bxHLx0NfYycqa+7PZCqdSTNzwWungNVjgrF4yKeXODtQfajVQsLrbzPEZIvYYSat1Qh/0R4U72dBWOFFGWc/+wurWyhxHYlfFzzvm2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10217.eurprd04.prod.outlook.com (2603:10a6:800:228::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 03:48:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 03:48:36 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 09 Oct 2025 11:48:14 +0800
Subject: [PATCH v5 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-clk-ssc-v5-1-v5-1-d6447d76171e@nxp.com>
References: <20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com>
In-Reply-To: <20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759981702; l=1034;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=mIhh1SfmGIhVhlQDSG/qcFdMpAQY1Bw0eKnar9KqTT8=;
 b=alrWgu+j/dMSjYqGlnT5DfeiOQLaBxJMZWL2/nTBRU6Q8KW2qHx0Qf2YJjCpUY08RpmaA2tGn
 V+QT4rabrLOCKi9gK1QKhOe/QXRbFVaak3Q4fosRMb+ePqln13CHerz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: babda4e5-d5be-41bf-3248-08de06e6b98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mi9WeEhWNUZZMGpJT1BJRkxkNDNjSU9ZQmZBcnptMm4rOFZTZjVlbk5TS1FG?=
 =?utf-8?B?d09NMVIxNGFOdHdWYWg3U2dhdHZ1Ymxtam9xN2hndzFYenZvOEx0NDJOenBR?=
 =?utf-8?B?ZTFzYXJRY0ZON0dDV29iMyt6WFkvcDFFV21reWppMUluZlhPSTZ0ckVFTCtR?=
 =?utf-8?B?WGFWNUJxZnBadjUwd0JCUXlIK1dyUkJZeDRLMmFrZUppWm5Od2g2TnVJM0Zz?=
 =?utf-8?B?eE1WL3M4RlN5bmFWWmNTMW1aNGZucDI3N0pYQ2RzOFlKbVlKNXdma2xhV1Qz?=
 =?utf-8?B?d1ZoMC8zcEZyVmtyUUVBNTV0M2JTQ2VYMHRSOWN1MGpqVVVkQ28yd0htUzRi?=
 =?utf-8?B?VVErREZlWms5VWRkWGxEbnIzem04bXFXS2prOEw5M01YcXBaTCsvM25FbFB3?=
 =?utf-8?B?M0RZVk1hRGJMOVdTUlVMbmRDU2huKzM0Wkw3ZXA0NHJTK2phQnp3L042a0RI?=
 =?utf-8?B?cVUreVlETm9MQ2NVQWppQU0zaTJQeHR3US9xa2JWcnR0Zm1TZGZKVHNHUE44?=
 =?utf-8?B?T0l2SzZOUTdDQzMzZnBSNFdGOXllaEY5Y09UblRXVC9HSWMyTTI3aC9BKzZ0?=
 =?utf-8?B?OE56OHJRSlBtREZXSFVqQ2JTMmcwb2ZYdVAxR21nSkVtdkdMWDkvbmxHWlk1?=
 =?utf-8?B?MmRjV3pXaC9KWWI3S1hqRFkyZEY0dm4vOE8yczBHYzJHN1ZZanMxYnRTY3Fn?=
 =?utf-8?B?b2E2ZGNCaytOYlUvTURLMmNxS1UwSlYxR0ZkN29SYUNMOU9GSjZNVmdQVU9o?=
 =?utf-8?B?Y1Z0MFAyMkV6bkZVQUdKODFCSmNteTRMNDNlRXdBTG90TzdZWnJ4VG1jRjFh?=
 =?utf-8?B?WWVDcDhORXRkb09lV2N5ZTRYcG1sN3ZlRmp0djRnWDlFdisyVlpwdm5Lc0g5?=
 =?utf-8?B?RHRxbU85QVFtNXcxQ3ptQjg1dnVicTI3Mm1sSVpOL29uQ1cxTTU4SzZhVmRu?=
 =?utf-8?B?M1lwWi9YTDluRU51aU12OUpaMkwvcmZ1UHFlcmk2bTZ5aDR1bHhrZU00eTlE?=
 =?utf-8?B?UnZ1Q1Y2eU0rZGhCdE01akFyemlNTmlFRXhsbnpidW0rcS9IQTdnb0tBZDMv?=
 =?utf-8?B?VnJtVlZEWGpVcW1odFd3eUxCb3ZxMGdrbi9nU3FLY1ArcEhyUHJlcHFkMWRU?=
 =?utf-8?B?S1FEQ2xYRnZJUmFHWkxOOGlySXI1SHB5ZEtMNjBXU2ZTaVIwc2pRenZSczRW?=
 =?utf-8?B?Tk5LK0RhdkV4c0NzTDljeXZUR0NYTTlyWmhRKzNSVXJUblFxYVZHd1h2eHJZ?=
 =?utf-8?B?NjRneURqbHNoa04rMkxHWml6NWMrRC9RTFpjTnNZV2VYcnd6WENzMnhNWjFW?=
 =?utf-8?B?Uzh0UlQ5WmN1Ym1MZ1dUdWpKbzV1M2FmU0lLam9ldXAxT3FTbmZnOWx5OC9F?=
 =?utf-8?B?d1RSZmtBa1hCVHdjNXdMYTRlU3ZicWZrWFJ0UFZYZU04cUxnblF4ZGtzZGV2?=
 =?utf-8?B?aUY0R3ZSMDhJK3B0MXdZcS9QK2w4dVphaW1IMjR3Z3c3WUtNVDErTjc2K2R6?=
 =?utf-8?B?bk4yckFQeHI1aks0dFRZdGJRV2pOcSt6bVJ5R1VwbzVpQmo5NVdWV2c2amhP?=
 =?utf-8?B?OXJUcC9GN3h6TDNXOFd3V2oxRjZRdHdlN3lNaHg0NzJFZTJNazNHVVp4NGd5?=
 =?utf-8?B?YnZuRk1qQmEwTitYYTV3Z0xvalRtZlF6aTErWjduNVRaMXNMN01JMXBWTEVR?=
 =?utf-8?B?OXFFaTRYNUlNU2tocVlQM0dQRHlKUDhwUXB3ZUErVFRrVXVLVEpTLy9hdHRB?=
 =?utf-8?B?NDlFMzlXUnREUkk5UVhyRHNVMjNFSDJKV2hicHZoaFJQWlN1bzlMY0xHL2Z4?=
 =?utf-8?B?YjhSRDFOcDhNL0xPM1hiR21WYnRZMG04a3M3aUROcGxlUFloL0I4eG82Zm1J?=
 =?utf-8?B?ZVNnTFF6R1JZZ0xlUUI2YU9wUEhNSlZBcmVxelU0YStFOFAwMWlVcjFDVzFx?=
 =?utf-8?B?cUZPSE9YUTBHanVmSjVaYjNYcjRGQTZmajN4SGR1ZEdvU0IxZ2djUWJmTnpG?=
 =?utf-8?B?NEZ6UkVqVk1RdHZTVkJVS2o3c2JNS1IzYWo5M3ZZU0lUUW1rSDc5ZUF0U3hy?=
 =?utf-8?Q?t5e322?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU9qMmo2eEhUY1p5ekdWajlleUVuN1RIQVQrQk5zZDR1QWlNWmhMeEpxTGVX?=
 =?utf-8?B?RzdZa3N6SjBFdDJPRzVETkYwVDJLd2lTUHVxREMwOUJnUHRsUHVrR1pkWDBR?=
 =?utf-8?B?cGFQUHI3d0ppS3ZUUlNvWG84Z1g1M0RGV3FwQkREZm4yOVdkcnhQaGZ1M1FY?=
 =?utf-8?B?NnJqeittN21TU0VPQ1VqNmlZaUwyNE9jQ3VCbzZLQk1Ncm5paU1LQXE2aG5Y?=
 =?utf-8?B?QjUwblc5V3MrOFR2djRNQS9ZNm1qWDB4TWx5WDBxUFJ4N3d4bE4xa1FYQVNt?=
 =?utf-8?B?VHdaNlJiTFFESzFkblFzK200VWdEZGVIK09nVkVpSllMam5USzk2bkYrMWRG?=
 =?utf-8?B?UU1nTDEvWTdwcko3WTZ4MjYyM0VTTnpaaS8vNFY3Q1RRMktkbEsrWFg2NmtP?=
 =?utf-8?B?YWNXWHJiakYybktMUnI1NFNWak4xeDZNN2cva09iR1NpMnNSbnJSQ2l6QVho?=
 =?utf-8?B?K0RaUHk3S1BQVUNMaDlsR0N5SFpxR0hhRDVna0JNOVlDTGJoMjJ5aGNFMnB5?=
 =?utf-8?B?bnBVcU9QWEZKRWx0V21jMmJpclFvMlk2c2phR1pSdTZWMmozcEtWTWVWNzFu?=
 =?utf-8?B?cHpYNkJBcW4rT1VuVWhFdktZT0tFN2dGZ2tleERsQ01wWml0cTZ2bEh2M2Zn?=
 =?utf-8?B?a3pEaXIxYi93cTdpMGM1eksrVlJBYmNBYU9UazRzdDBtOGdZbkt4Q0ovSXhz?=
 =?utf-8?B?Y1NaRE1XZ0Z5WjIwQ2lhZlE0UzZ1eTV6Wk5VMCt1ckVvcUdJZzNVaHJpMlBv?=
 =?utf-8?B?ZW42RXpldGZONzZMRjRJUGtOT1Bra0lVQjc4QTVaN1UyYTl0alA1VGxsYTRG?=
 =?utf-8?B?dEcxKy9OYU15akNIbXoySzNEbW5yN1lMOE9VdWVnRzc0YnpTUW9ieEsvK01j?=
 =?utf-8?B?YzN6c3hHYk9QOFNLTitQS1doVmw5c2h4anE0eHBvVnZEN2hQNjNvSWlRYlRL?=
 =?utf-8?B?TGpidzJUeXNBcklpWEowUHJOald4cXFjT1Z0UHpyL29KSXViTDI1VWVIZWhv?=
 =?utf-8?B?MHlNcllDOEtFMFN5aDB1RWw0SlBMOE9SUkpad0dxYzYzL1RyNFF5dDRzUzl4?=
 =?utf-8?B?dFN3bEZMZi9vYmdTVkhpYW1IRUQrOGt2MDBlZVRHdVJqM0RmV1pJckdBWUl1?=
 =?utf-8?B?OVlteGgxelFaYjZpNzR1TWxuU2Q1M3VaR2RQYWVmcmJEZmZ1aXM4VWVIdm81?=
 =?utf-8?B?cEN2RVAwM1pTaXI5d0lqZG4wWk1ESXpadzNwL29FaVl5WVVhSU13MXFRWkln?=
 =?utf-8?B?citPcjdITUF4Uy9QTGZYT2NKRVMySy9DYzNIUmJoc253b0FPQ2hTS0JPSWdh?=
 =?utf-8?B?Y2ZqTXZnbGFuRXB1TWw3OHJnZ0pOUUkvVDRUNFZTMXZEWFBBUHl2WFpsUm02?=
 =?utf-8?B?WE1NeUwxVWZYeVpmZ25WRzVXKzdsN1I4WUhvZ2hEb1JyRGl6Nm9qNTRzSGlt?=
 =?utf-8?B?dVJ1ck1WbXp4c09Cbm1Xa3p4OVFBRUlUVVd4MjVuZ1BWL0g3SWt1MEc3bEJH?=
 =?utf-8?B?UkNNTmdFaS9nTGpxa1RjcUh0ZE5ZSStBWTkvSjFYcmFLZDNxWXVsNWxzZGxz?=
 =?utf-8?B?UlFHNTZqcVlhZjVHNnVoV1FxQTMxN2NUOVNOQmhhUko4cURycFdhckxQSm9Z?=
 =?utf-8?B?ZmNaLzRkaytJYlovK0prK2pnbnBFQVYrTmRBOGI4NDdyaVJLQk9TdzRFZ2l5?=
 =?utf-8?B?Z0l4eWNwdWZlWnB5RjUrejVyY2I4NENxNytWclZyS2lMclA4OVppcVdFckx1?=
 =?utf-8?B?Zmd1Y0d3aUJVM243VGVkQzJFRkE5eElLSHFiQnU3QmpXQnVtdy94eXAxdi8w?=
 =?utf-8?B?YnhUWHo5T0tUVXFhbzNKaGgzQnJOamRxazJDR0pUS1BzdUxCT25BMTZiaDVQ?=
 =?utf-8?B?UlRqTEdNWFJrTTEvZVZOWjFJYmRiK2I3Y2FKbUcrckRKd0NzcElrcWJYUE1q?=
 =?utf-8?B?S3RrTk43U3FUNlVZUWtGeXZuYkVmaVVPR0hQNGY2REsxRU1qaURGdk9jd2NH?=
 =?utf-8?B?SUlrT3NQdzJJMkFvTkY2c05JY2RnTG9sK0tlaWRYWHExNTk3Ym9jZ2hNcGIv?=
 =?utf-8?B?QlJGMkl1WUN4aWpON3RHWTh3MUhSSDhtWGVzMjA1SWFHdGVBOVBrb1RoV2xa?=
 =?utf-8?Q?IbWc+ejVs7sMcaHrPK91dR2J+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babda4e5-d5be-41bf-3248-08de06e6b98a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 03:48:35.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0CSECP/Q6ibmm/+GoTtAPpmL912dupvKk9mwYru3mWdz5VilBlIBmQHVfQgHbIYro0alviP717C93GbKNV4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_204840_696458_8CF3ECB2 
X-CRM114-Status: GOOD (  11.34  )
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

Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
center-spread(1), no-spread(0). So define them in dt-bindings to avoid
write the magic number in device tree.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/clock.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/dt-bindings/clock/clock.h b/include/dt-bindings/clock/clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..155e2653a120bf10747bd7f4d47f25e0493e0464
--- /dev/null
+++ b/include/dt-bindings/clock/clock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_H
+#define __DT_BINDINGS_CLOCK_H
+
+#define CLK_SSC_NO_SPREAD	0
+#define CLK_SSC_CENTER_SPREAD	1
+#define CLK_SSC_UP_SPREAD	2
+#define CLK_SSC_DOWN_SPREAD	3
+
+#endif	/* __DT_BINDINGS_CLOCK_H */

-- 
2.37.1


