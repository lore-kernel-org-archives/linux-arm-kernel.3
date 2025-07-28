Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5ADC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc7z2T3E9zr4CI2CrQz/0zkIfPlPM+m4Qb5CkwZwd3U=; b=F5gd/c0KZzjdh6/grZWUWHVXwD
	zL+zA33UwckbEeO7cDrfjxJKRman84M5nUti6Yluu26eZ42OnSi1OqiZfqyaVsGtbV6OgC9wjUgRJ
	ZhpuOYxVPtG8Czn5tKcbjnzJX/G7KG2Et5t+76MZOTvc8UgWZ9zntnbbltuoGbvs0VesZnxXT2zjN
	DVyO79NDQwqbS8fu4eH1uylxqnABgVLMVWr0qOmxWfDUsEuV4mjUNy3BiKUKo5zuEH+ozM6KYrGKH
	/Uwkx+0jlEZJVg/0UDis7WZfI4ZVlLYjaec2VlNJO+Skj5LQMc7ByG9KRW5Fdpw0yHKA7J4IGJC1c
	1ACHAZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOrq-0000000EgNR-30oE;
	Mon, 28 Jul 2025 14:30:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOnx-0000000Effv-3Vcx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9WUv+XSQolAhtNpEI8cYv7BVra7iEBEE6GMRBLLZ0Qg7M2ln3Un/+PXHv4GD+KhuJYGN7Th17bbEWFm4Qqyx/nY437EdCGfLJW0UF/sQZU3gzGcxMgirfQsOtUoxokO9qoHgHv+mJJbT9PdOauo5whHTv4BV8SGPrQFgdLKPgSCYVd9MBF9SqaL5QH505Z8WRmSmH4uUooPhws0EbJwtfc22XF1bOZ3n06glIvQrDLHDRfawFbQOjeksbJ1Lx522X4ym6oBYyO8NSL1V1WunkZ5Q1aLabBEm4Zzl83ybPC31b2izYAIBcZL4xnW85c/NCAJxvRbdfMJAC7IDfg37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc7z2T3E9zr4CI2CrQz/0zkIfPlPM+m4Qb5CkwZwd3U=;
 b=zI9hgAA+h+sgoUbPQqSnCyAE1RwiPqyIcUm8Dg5BtWElq1EYgZwjLRnoUkaNITac6QRR7JcUHb2Xs6pvdmpaXNfntwL/+Gw8ifaAxMizsG6xlZgfGhIF2szV1X4cqqZdhzqsfaopp1X5yDER24X4iHf43wrAVCWkvEzj7Hx21SsyyL5gseb1+l7wZ+HEZI5pDbhCWbZB+F8CkordeVNBi6DCZtRK3rituS64vkH/9/sqeYRXHtNGPrr+jMWiZTg+qCc+26mqn7ktTUSR9MSyz+ezuEvpdS45jkv69HnfGtxXkEq5wclMd++37/OsOZBXRC2R3kqJPhisjljvZJG3ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc7z2T3E9zr4CI2CrQz/0zkIfPlPM+m4Qb5CkwZwd3U=;
 b=AWC7pQD6eJqxPPP2wTOMdwazHMzeTAtuomB+Luto2HnpfyJuUs9Vl/AFx6G5jck2qfr7Rp4yjLG1LuuN28mdqT8ZahEjU6Lmw0b3yyola0F9BR/hGQCwqt0ccAwTejZNDzf91aQX5yCHA0wWEymgolYu/WpTMz5fAUjPeARRnVYUInHm3TOJk6LEJJIJfEhkQpOzwQhb+6vvK6fc/32D3LCMlMZtuCpL25OaSJZXzwY3504PO1cepu3O2RYb4ug+K8FQxFnyAhH4iTbdCv8IGe4s+66bBMiiAvkbznPN6dIYU8TX3gFWDZEamg6JazpYBaTVM0snO491BxWMOfGn5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:26:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 14:26:11 +0000
Date: Mon, 28 Jul 2025 10:26:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: nobuhiro1.iwamatsu@toshiba.co.jp
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH RFT 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges
 to reflect hardware behavior
Message-ID: <aIeIeQsDLz53aAHR@lizhi-Precision-Tower-5810>
References: <20250613-tmpv-v1-0-4023aa386d17@nxp.com>
 <20250613-tmpv-v1-1-4023aa386d17@nxp.com>
 <TY7PR01MB1481875AD0293961D0DB8738E925AA@TY7PR01MB14818.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY7PR01MB1481875AD0293961D0DB8738E925AA@TY7PR01MB14818.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 72da29e3-e8fc-4a38-5915-08ddcde2b39e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V05JSUwydWF6ckNDSWFXeEVjWU9zemxXVWVSU0k0STlHK3hGUnl0dWIraWdq?=
 =?utf-8?B?S3k4c3lHYWxmTVRvdzU4dnZCZDBOcDJ4TkYzTjFmQkpZZ01DWXJCRjNhWXYr?=
 =?utf-8?B?b0tBdXdUaTRGRjhYcDlodFNVOVVoR1h1cExsNGNHcDdKemRFUjdLRVZjS3lG?=
 =?utf-8?B?UkR6dHFiVC9CN0d2UG4rQmwwY2kyUURvNEFrQWUzZXdZT1E3cCsxNWJBR2Vu?=
 =?utf-8?B?RE13MzlqTUVtZlpaeWsvdHRkakNhaTVUWEUvZlBDUHkzbG54SFBScUpyNVly?=
 =?utf-8?B?OFF0dmwzWWdab2tJc09xSGJpbWt4SUIzM0JVZHNodm1FbW02VjNLY0NkZi9J?=
 =?utf-8?B?dDhGYVpENDhaaGwxd05yaFNNVFRnQjNpS1l1d3NPN1lZSTJxL0pzclB4b1RP?=
 =?utf-8?B?WmhZZWNRM2tsSFVmb0k1TnNDaTFhSVdaM1J6MWovYm5YQzh0UWdpT01NZHFF?=
 =?utf-8?B?ajNZUGVEUW10ZG5qdnM5K1A3UmZJcEF1Q0pXQ2xwaFZkQzVKVmlNL2NOK051?=
 =?utf-8?B?RlpaRUEzUTBMelpCQVdKVk9PVFJDSFVFTWYrZ1dCb3IzN3pyTEEreDczd2hs?=
 =?utf-8?B?Q0RmL0xQbjlIN0FtejN1Y3A3bmdqLzg3RUxVTzNSVFdPaHkxZzZIQzNFWEJO?=
 =?utf-8?B?ZklWNUVVTmJZd3AxVFMvNGF6WUNUMDEvWUVzVlJUc2FTQVVoQndnWWMwSGQ4?=
 =?utf-8?B?ZWg2bGNTSnkrRTN3NG94VVpUZlphUHFVc3NnUkhiTzdmVWtLd0xaU3liblFa?=
 =?utf-8?B?dDB5TGNaS0dlRU9rUVUvb3FoaVpkY0JrU1pDdVh2Tk9MclBySTNJR1hZUGRa?=
 =?utf-8?B?elA5TmZVK3RRSlhtalNDb3NHTmlScXI1dnR2bU9pS2QzQ2FoV2Q4dU9pQkFq?=
 =?utf-8?B?VHRKYUZkSlV4MFY0NXE1ZkNKb0hLVmpybjROYzFyNzdrZXFHSnZIeGpweDM1?=
 =?utf-8?B?TkxsZDNtakVYTU9xR0JSVXhxbVNuRVQ1aDBOY0UxOGlHdGxDcm1PUXB3TmtY?=
 =?utf-8?B?UlRTcTFTbEJ0ZXJ3SXA4Wmd2VXB3bE5mSlB2Z3I4SHIvZCtscktqaTNDZGJQ?=
 =?utf-8?B?RUkvaWxBYWdjWm13dXBiOUZJQlQzZ21OQ2RwanZBQlRUVXF3Tk9JYmhNNWJn?=
 =?utf-8?B?dTNPVzdxcjArS1ozcEhjcHRLNTJnL2pEMXRZZFJTZ1k1cnZRVGlOTkNabkkv?=
 =?utf-8?B?aTV5OHUzd1FNMGVsNS9JN295cFpEZm5Xb0JSZGp4d0RoRjJWakxYMEw1dlY0?=
 =?utf-8?B?K3RDVEFuN3JrRlF0N1o1YXJOSnM4MTV0RHU1amZaaXl5WXVCZzRQREVWTnow?=
 =?utf-8?B?UkZERnF2L0NySG4yRG1HVC9RY25UOWdWd3ovQVFxa3hidHVPQmtKNjF1K1Va?=
 =?utf-8?B?alVDWTlIeWdkTzRoQ3lrVklqWUx5UWprNHVURU9SWUlwMHhZQlNZR3FZY0JO?=
 =?utf-8?B?Y0lBblVsSTNwZkR4U2xoaUI3b0VkeXFtUGV1N3FTenhKM1lYODJJVFlIbFRu?=
 =?utf-8?B?dHRHUi82WU4zTHkzc0Q5VHB5bHBiSXgvWTZUK1lvcDh2WXpqNURTcmdabFg2?=
 =?utf-8?B?aitnSTRqSnVNN2ZkdUhpY3VHQU0xczJYSW1Hbkc1L3ErUmN1S3U2UExtQVdH?=
 =?utf-8?B?QWtQMmdSZ0RUejJHdmx5V1VlWjNTeE5mWlg4NnhaNkFiLzdTaEtSaG9RaVl2?=
 =?utf-8?B?NzFZbXp5bGhsQmxJZEtsd2NpNCtMT3lpa0h2bGE5MFh4S3l2M0JoNTNYQkta?=
 =?utf-8?B?eHAyWWRhSGRLOTg1S2RBZXRRT0VqOFpkWTZRb2tIcVVrZGtHMGdKeVl4bDRM?=
 =?utf-8?B?NmU3VGJFb29oOHBwdjc5YUwwazdrdzZKcnBPY3IzcEV4QUFRSlMxalVraW92?=
 =?utf-8?B?RW1rM1BZVi84aVM0QkNWQmZISE1LVGdLQnBRQlhUUWhVbzRlOFhZakttc1pB?=
 =?utf-8?B?S0t4UGpZdEY0UWJxL3psWVc5eWZCaUpKR21OL3JSVWliVnVSbkl0TWlsazlR?=
 =?utf-8?B?RlJhTlJ4QmRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVCNXBTOERvQyszWnVKUGRxaFBqeno0NHdpczVqcVcrTCtMbzQ0b3BqYjdn?=
 =?utf-8?B?dTJkYzdIeTRPdzNOSHN3OVlwSFRtYmtyYVd5UHFaSVNhZnUvUUwwNllmVjg2?=
 =?utf-8?B?S1BFVXlFd1VyZnVFa1A0RFlTck9CbjRhb0c2alAxd1drSUJnZUN3SnVuVUVv?=
 =?utf-8?B?ZFZuSXdBeml2K1o2ZmZTczB1Q2FPSGM0ekJPc0t1ZkRrZFg5cFFHWGVxQTR0?=
 =?utf-8?B?MFY4NDNjVlhaeEtXbjNXQ2orclR0QmFLcWV2WjVXdkVoYjBhZVY1R2tMaGFp?=
 =?utf-8?B?dXJLODhkVGNKbFRsbFU2a2QvaC83UnY3SHRmUkdIVi8yV2tvSVR1dmxmWWdG?=
 =?utf-8?B?NFNNQ0taeVZtQ0ZLR1hrWWNuS2E2RWQ3Yk5YdXhJc3dxano0RDBhWEdJSVZS?=
 =?utf-8?B?OTRETUJ0U2FQQU55cHdVbVpNUEpyTUNwd1RpUUNFS3Nha2V0bDFsemFpOVFn?=
 =?utf-8?B?UUlWOUNLd21uVGN0TExKakVKcXdEOW11NlZaOG9hbS90RTRGUGZhWm5qNDZC?=
 =?utf-8?B?dmtCQUI0SnZyZitQMlBSLzhKSFovbkl1QXpRVGJKVDNieGRraWhwaXNsS3E5?=
 =?utf-8?B?eFFaQWk3ZCtOaFpwQ1dOeFlBbnlCbTR1V1NnSXNsYUtFbG0zWXFoc3p1aXlx?=
 =?utf-8?B?Um9idFRJQzhKNFc5NytGVnNGVTYyRlRsV2dYTm94Uld2K3E4N2xic2d3b3hy?=
 =?utf-8?B?NHNxN0QxTTZqbXh6cEpuWGdxL2hUYmNXNUY2RTRsRjBFNGRWVkE0OVV6RzZJ?=
 =?utf-8?B?S2tpMnIxWUp6SFgxQ2xXZlhrOTZHYW9ESXN1SytSWU1uKzFNVCttY0NCLzBs?=
 =?utf-8?B?dDk4TFFQYXpHYzRkeXdENDRpTFVyS3F0MTlvS25IMkR1b0tHbURYRlVpRDJm?=
 =?utf-8?B?Q1ZBVFNvZzFHMm84cWJ2TjFHMjNxQkgwdTJXS0g0TmFjdDZ3TTNpcTZqQllR?=
 =?utf-8?B?S1V0aFNvcmwyT2dpQ0xvUGgvVXVJcFprR1dGUmVNWm9LWmVXK3lKZUtGNEt3?=
 =?utf-8?B?Mm5zUzVjdStBLzVnSEVnVngrandwcDU1Uy81WWFHa1J4dS9QeklrNnhyWWtM?=
 =?utf-8?B?THZwT1lPUnl4aDQvcFp0RzgyVGR0aVhYWlBzWmxUemRtM256N1VTYWZtNmpo?=
 =?utf-8?B?NEFyR1JMLzYrYlQydEdwUld6ZklCb0JTQ3N6bkZoV0xocnJlN3hJNzNZQ1JV?=
 =?utf-8?B?QXhVeTkyUjdTdm9hdTF2MUZGVzZOdWc0VGdkNU9sZzI2RGcwSkdxT2Y4Z3Zh?=
 =?utf-8?B?VDdvTG1RdFozVUV4RGQ0eTN5dkhSNG5tbFd5ZlRVaXVMRklwSXJzQ3JUS2lN?=
 =?utf-8?B?V1dJWnNEaHN0SjlKcDExeWpBWUxyV0w3UjdXNjV3UFhDUkxmakZyS1MrQVRh?=
 =?utf-8?B?eXdUalVXcng5MysxM3ZWNjFlOW1TNVdSS0JOTDQwT0dOR3hvVSt3Ujd4VXZy?=
 =?utf-8?B?Mi9nVENiZ3BxNWZacEFyaEQzTk5nUUFTZlRQWUZKMEVrNi9XRVVVYm5xMmht?=
 =?utf-8?B?cXN3dERNUTYyb2lWcWxRSlNFd3NRcE5PU1J2SmRaeE05ZkpWRU5ONDk0K2do?=
 =?utf-8?B?Qk5wd2tVSko5SDJhdWdGWFlvK3ZJV241c2FvVC9seW82ZHQwMXZTaDA2Y1Nw?=
 =?utf-8?B?OWdqOXdrQ2k0VC80SlFpelBsOEVDSVNDd1h5b1dleTh4clR1RGdaQTlFUDhl?=
 =?utf-8?B?YXp0SkNhemwyK2pkYjhjSFVDYzNDOTBqdDFTYVpQbXMzWEE5d2R6UlBBMWdD?=
 =?utf-8?B?QVd5Wkp0aEwwWUIxTm5VcTkvTzJZMzRrL0tNVzA2dmhHMi92VzdFLzk3TlNx?=
 =?utf-8?B?eU9LZElkU215TU9hUkdTMjV0VTJ3Y2JDUVFudEtvZXg3MGwwc1ppcWZnZ0Nx?=
 =?utf-8?B?Sm8rU3JDaTdNb1h5RlFMQ0ZOeGZtQXdEd2dOMEh0aXRPc3FOTnZVZEFCS2tY?=
 =?utf-8?B?cTdocTRNc0hBUHdhMWhwajB4aCtPSU9oZy9kOHhLekRXaEYrVElHRnA2RGhj?=
 =?utf-8?B?WjZPcU81MDFoS3NwbnVIeGZQUHkxeU1EbUg3bGl3V1NiWFVMWjIyRjkrVC91?=
 =?utf-8?B?TnNHTEhSQjB2dlFkd1hwVjVCZ1I2UTJibzVoemZ2MFErbU0yMWVZNUcxc0Fi?=
 =?utf-8?Q?E30w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72da29e3-e8fc-4a38-5915-08ddcde2b39e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 14:26:11.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8waFZee8m0mqhDDU/uB1Ryb8ywEny9NSa1dVoLvJMM4OCwtyGo+npJ4dz5AOHBJYmc24LZkOLOAKnasrxTvr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_072617_883476_9B4F190C 
X-CRM114-Status: GOOD (  30.43  )
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

On Mon, Jul 28, 2025 at 05:38:25AM +0000, nobuhiro1.iwamatsu@toshiba.co.jp wrote:
> Hi Frank,
>
> Thanks for your patch, and sorry reply was too late.
>
> > -----Original Message-----
> > From: Frank Li <Frank.Li@nxp.com>
> > Sent: Saturday, June 14, 2025 6:33 AM
> > To: iwamatsu nobuhiro(岩松 信洋 □ＤＩＴＣ○ＣＰＴ)
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof
> > Wilczyński <kwilczynski@kernel.org>; Manivannan Sadhasivam
> > <mani@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>
> > Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; linux-pci@vger.kernel.org; Frank Li
> > <Frank.Li@nxp.com>
> > Subject: [PATCH RFT 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges to
> > reflect hardware behavior
> >
> > tmpv7708 trim address bit[31:30] in tmpv7708 before passing to the PCIe
> > controller. So add a 'ranges' entry under the parent bus 'soc' to map address 0x0
> > to 0x40000000.
> >
> > Update the PCIe node's 'config' and 'ranges' properties to use the real upstream
> > bus address.
> >
> > Ensure there is no functional impact on the final address translation result.
> >
> > Prepare for the removal of the driver’s cpu_addr_fixup().
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> > b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> > index 39806f0ae5133..2a18aa93d4723 100644
> > --- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> > +++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> > @@ -147,7 +147,15 @@ soc {
> >  		#size-cells = <2>;
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&gic>;
> > -		ranges;
> > +		ranges = /* register 1:1 map */
> > +			 <0x0 0x24000000 0x0 0x24000000 0x0 0x10000000>,
> > +			 /*
> > +			  * bus fabric mask address bit 30 and 31 to 0
> > +			  * before send to PCIe controller.
> > +			  *
> > +			  * PCIe map address 0 to cpu's 0x40000000
> > +			  */
> > +			 <0x0 0x00000000 0x0 0x40000000 0x0 0x40000000>;
> >
> >  		gic: interrupt-controller@24001000 {
> >  			compatible = "arm,gic-400";
> > @@ -481,7 +489,7 @@ pwm: pwm@241c0000 {
> >  		pcie: pcie@28400000 {
> >  			compatible = "toshiba,visconti-pcie";
> >  			reg = <0x0 0x28400000 0x0 0x00400000>,
> > -			      <0x0 0x70000000 0x0 0x10000000>,
> > +			      <0x0 0x30000000 0x0 0x10000000>,
>
> If my understanding is correct, this setting conflicts with the address space this patch changed
> ranges above. Therefore, it does not work.
>
> 0x24000000 + 0x10000000 > 0x30000000

You are right.  Address map should only happen at pci fabic.

So we should not touch soc's ranges.

soc {
	...

	pci-bus {
		 ranges = /* register 1:1 map */
                 <0x0 0x24000000 0x0 0x24000000 0x0 0x10000000>,
                 /*
                  * bus fabric mask address bit 30 and 31 to 0
                  * before send to PCIe controller.
                  *
                  * PCIe map address 0 to cpu's 0x40000000
                  */
                 <0x0 0x00000000 0x0 0x40000000 0x0 0x40000000>;


		pci@0x24000000 {
			...
		}
	}
}

Do you need me send v2 for your test?

Frank
>
> By reducing 0x10000000 to 0xc000000, it will fit within the 0x30000000 range.
> And by adding the following to the driver:
> ```
> pci->use_parent_dt_ranges = true;
> ```
>
> the PCIe will work, but this setting prevents access to devices located after 0x30000000.
> Is there any other DT method to avoid this?
>
> Best regards,
>   Nobuhiro

