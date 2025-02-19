Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2163AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWFSwtbzo666jAPhi0+eB+8lheF73dLj3UyyewiiY9c=; b=LOQmlrlEVIXcFOC3uVWi1rMzqL
	q//dDKu+13MzYu5RCqLrE57R+DQneSePMy9s0rwfTOavagiYiVmGdcMUwCWFNhhpO+r1q0rQU5eec
	16Z17Gbzah/1ZZZrWlc2RCtPUT6Vj2HvoFXHSEKXSX7I0OLpx+p9sVkxfNoUL9ZDLsnXyhRNMzVIC
	hjT1l/Nw19Ife6X7GklxH5RdCZlTKt36uaa17GX/u7NmxDpFSsIaXK76gTzzTIgoRYpYgJ5HpnS9f
	3oL2RxcLfQJC3J7TEvFM7WEUDwS+ZuYuRcSZUdYQLF62KsrKtT+XtZlUG2z5Se5HOiVBgkB1ULXNM
	pFrkLgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZb-0000000CCib-2n1H;
	Wed, 19 Feb 2025 10:44:59 +0000
Received: from mail-am6eur05on20703.outbound.protection.outlook.com ([2a01:111:f403:2612::703] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkh8L-0000000C5uU-39DQ;
	Wed, 19 Feb 2025 10:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTzbUMF2O8W6WoHXXhNn/yp1+EpWixZ1lAGmp4vLfNc0qaQiJBT58fxol45lk2XpfAcOiqgtC6TamgX86rvpKl6UJuh8BsH2xpGSiNZsUqXk4zLYc5DZ5m/H3yifRViDf4bLl62DFeeZ8JWscr2GBc+9TSww24NmzNZH0ALsLLWF/WDByqw8xiUKNA/dyceOh8iC5rQNTlYpOzDku1QHkPjS2aS0dfQUuwFZo9HrdPc3WhMiSMPzhrii92/TJHTqwRQ+X59SYoU+A9lIMCXKp3Ym0U2HCwgS3Z6B2oYwLlAdWZdNdfE9OdVI0r6nn8OJyvxu20AgOPzxOMpnzznvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWFSwtbzo666jAPhi0+eB+8lheF73dLj3UyyewiiY9c=;
 b=c4bbTGjZ++5fD1UE5Vpzb5AzV1fTAwx2JgjXLBN3XgJPo2tbbpVdfastIK2OAywOeaYFNiu/o6wittbckMBmC5IHoOrh9NmPIVSYuaTPHX61/HI2vwRyesSxSJHlhsxnslI4jpszP3j3cq+aMD45XGkhMheO6nk4htiwIiZX2zyo6BEUCwL8TLc+vSeiwAneq3CZEYPOAhI4NXLy6RryjQjIKT2u6zDGXFI71t0FtMDk0IXSFxf7+hYiZdhikgU6rtNqVOJgcWH+YgZK+MqrdepDW8DE7UZDugkraCh6p/wu8DSwNEoQEj3w53xIacXxj3UILNA+dzKWQzKHvjyF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWFSwtbzo666jAPhi0+eB+8lheF73dLj3UyyewiiY9c=;
 b=K1lBQmy1SgdpLkmX1Ys+Tr06ViidJwjYi9n7JpPNzHkW+K1h5XfzRXssPhyFSUugjTVGpLOkuWk364PgCUjqZ1RTUdYnsnvQbjr3bRG6Ntp7GOIvVpo2LrWM7veZqUnojijfbzibat8ob9JbFeEIsNktxkZ5ODVYJhTe5I3cB8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:39 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:39 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v4 00/11] media: rockchip: add a driver for the rockchip
 camera interface
Date: Wed, 19 Feb 2025 11:16:31 +0100
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH+vtWcC/4XPzU7DMAwH8FeZcsbIcdKQ7MR7oB3ySSOgrZIqA
 019d9IhuMDE8W/LP9sXVmPJsbLj4cJKbLnmeepB3h2YH+30HCGHnhkhSSRCaAo0rPOSPZQXMSg
 NLXu7gDNOJGNoSFKyPu1sjeCKnfy4z7/FMWRoXOy9pcSU369bn049j7muc/m4HtH4Xv1/X+OAQ
 Eqj5ckqie7xPL+mrwfup7iyHW70g3HiD7cx6pjjQWqdvMcg/sTENzYgobqNiY4pE3jiJg5e4i9
 s27ZPqknCRHkBAAA=
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=7440;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=IRW2ZAvJnLN0EpjH0PdTRwejaC8id3f7vCmPNSuDxw0=;
 b=QaSNhUnzF5acR7/m42hO8IfhT6VO95C/BnPYcYPakpBQVLoiyceaF9pww9GxYyFz9T0GlBWCH
 +2llCFYGzrrBqCAEiKcgJwURuev6BeGbbLh/xisDsg6pvHgxE/co272
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: a2895620-53db-4de8-1b10-08dd50ce7fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHc5SExQcG5QWFR1RFAyVGJhdTNyZlo3L0txK1o0c0paV2JEYy9VOUNYR3A4?=
 =?utf-8?B?QzJYMTM0RVJCRnVLU2pDeHdBWFVzd3VhaEl0MHJjeHFlaEFmWnpZalluU1Vi?=
 =?utf-8?B?WlJ4Q2lpYXlZczNxQ1hNQTNzN1h0VUh1OE8wZ0NqeE04WHVib0ZCQU9LYzgr?=
 =?utf-8?B?OGRTdnF3TXVKTkU0c2lZS1JZQ1d2Y3hVdTNOS3BKejI1N0ZYa1FIMy9iNGRO?=
 =?utf-8?B?SmtJMmljUzY4U3lVUUVNcFl1RUVWUmpoNDlHZjh6MU5TZy9DdlE0YnpMMWxw?=
 =?utf-8?B?eTBEaVJ2SzZnQTRXRHoyRm0rUUxwdktHekFnV2dONDltV3Uxc3M1ZUpzZU0z?=
 =?utf-8?B?NzB2T2V1VjNSOWFpSzBJR0ZscjdJeE5JOHpZTXBHSUwxL2U4NVBKN3N5Z1lS?=
 =?utf-8?B?dXJrdDREcDFGRFJqUVJVaTJ6cTh2c29yMEFPazBxSG9lWWVvaW0yMnJNSzJK?=
 =?utf-8?B?MXNXUTNNZUJTeGkySGxmd0hkZEhjc21sc2svOUtrWVZTUGRFTUtyQVBGVnpi?=
 =?utf-8?B?OXA2TzZpbkR6M3lIVFBzckJZWWh1QTZJenZMN2g5WVNJRDRLRXpudXdHbHAz?=
 =?utf-8?B?UXZ6QTBZYWxGc01iNnpzZVJNN053S05LajRhVmMxMFBlMCt6MVZwN2E3Qk1I?=
 =?utf-8?B?SmRMWUlWYnJrTUZRb1UxSGZmT20wT1g0dzdWZ25SeWc4M2QvRHFlUVU3VmZW?=
 =?utf-8?B?VUZDZWwvZmNzdHE1RDVUajFQYW9vaS9waXc5emVUdkEyaUJZV1hBSUs1NmRI?=
 =?utf-8?B?K2hmS2JGMUtvamhUOXlNR3VJb2FmMkR6eGJsR01Xb3FjVk1zblRoZ1lhQ3lC?=
 =?utf-8?B?UHdrTG1HZXlwY2swclBPeStMUXBLbzRJTkxiOG1KSHY5a0E4UWdaT2U1ZzE0?=
 =?utf-8?B?RzFRamg5ajZsSnQ1dHZGYk5kaitGeTVSMnNPRUFZcnZpZmwySUtKZGZpTGxa?=
 =?utf-8?B?aEQ1WEE2QVRiQk02ZkhZT2FoVkNPZFNlZzFqSDZibkVtS2lSSkNZV2RmakYv?=
 =?utf-8?B?MEU0aDRldW1nWWE1aXhjRk1manBja1VpVys4eHVxNi8vcEJZWTFOREtEUmpl?=
 =?utf-8?B?eE5MQ1pjVzZHMVVMaHFrMDZpN0t6TjdUaUpJVlJMME85SHRiSHZ5ZGJQRjh3?=
 =?utf-8?B?dzlUUmg3aGg2RWM1dWNRZ3RhR2pOY0laVmxaWEZ5UWZXMXNpN3JGMVFiMm5K?=
 =?utf-8?B?RTBWakhkN3MrUXQ5TzVGa1BSOFEwYWFialVFUjRScDJiM1RCSG9aSHJkKy8y?=
 =?utf-8?B?eGhZdWVwMldqNk1XcHRzbzgvNHQxeWR4QnpuRG0vU2d3cDZTSlYzUjFzR25U?=
 =?utf-8?B?RlpjVGI1U2d5TUU5d3hCWHNMS0plV2JlM3YyMXVnM3QwZ3Fyc3IzVGppSXZv?=
 =?utf-8?B?L21KVWIrbEdQWGVZck5wRUtzSXZySkwzZUpoU1J0S0JDU2MwUno5anBPcTJz?=
 =?utf-8?B?NVlrNGIyQ3RzWkVFNEVsbHVweWxieFFXL0dUeTd2RWFoY3hXRndLcHhMKy9t?=
 =?utf-8?B?eFRJWEkzaW01aENjSHBLQTB0RXg1S1JLVzVIb3dQVU0xTGo3SWRMZVozUXN3?=
 =?utf-8?B?WGVuNmhCRWVCaFBHNWd5aSs1d0kzM01oaGptN0FBTitQN1R4cU91OGQ1ak9J?=
 =?utf-8?B?dlpjczRJTzIrVFNyY1o5NzRaNzduQXZCZTV0ZVAzM29RZmdoZEF4YUNVM3BC?=
 =?utf-8?B?T2lRWTJRM25KbzNkbGh0emg3UVlnUXZnMDFibC9wRGZiVndxYU5tbS8xbit6?=
 =?utf-8?B?MTBBOU02Yy9oTFhrWWxaZnBHVW5xV09wZzZMdGM1Mm9KWWUzajRBcldTeExN?=
 =?utf-8?B?VmovbUhUdnJiaWtoL095eC9NMTVYb2YxTmd2ck8yNXFxcUFPUTJYYXYzZFlR?=
 =?utf-8?B?UkNiNGhHR3h4MUYvNmhFN1BWR3RGY0gyQndpT0ltTzc4bFJJQm9WMWgyeVJ1?=
 =?utf-8?B?VHZFbXJxdHIyalc1K0lFTEk2bUNYSEdWWi9pbG9RTmFDcjFsVFJIN0w4V3Ux?=
 =?utf-8?B?UGVsM2FIREFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtPQXhwTVlUNUR2dlZjbmZrek1hRXorajhwRzdkSmhKWmg5L1VZQnozbjFq?=
 =?utf-8?B?UWltUnZmcXJWSDZXZ3IwL3FJN0NzSUF2Q2VZb2xPdHJWekhaVktrejVwSWdt?=
 =?utf-8?B?d0xvSmFMVVpaVFhaWGd0SjNmYzNXSktOYUIvYjJ1NDQxaUw5T1FBNUJQVmpX?=
 =?utf-8?B?QzlhQ1VHc0lic1FxTTNHUjFxSEtLdGdYRUJrdnI0UEtkUWZqZGxqK0UrSlFR?=
 =?utf-8?B?UFNTb0QrRkJESGhGSXZnQnVJcWQ5NjF2Mmx1RldQT0l3aXc4KzRGU3hEUWlv?=
 =?utf-8?B?MHV3aTdwcC9rMUVFY05KckR6RHVZS2Fyd0IxVW91MFEvWlo5Rm1HVzBMWUVa?=
 =?utf-8?B?VHZFZjYzaEhKVG5TZ24vVVQxSkU5LzgxS2p1UVNBU3RkbGtrT0lMclhtT2RB?=
 =?utf-8?B?WXRQSDRrN3ZGc3gyZEFpcktpUU9HOFl1Um5jVmdqSjQ3aE0yUzFJR2l0bnhH?=
 =?utf-8?B?UFhHcHZ0NURXWUNTdTNBem54TVRHQU9YMUdIRzk3VlJFZzlaVnNNNlVXaXZH?=
 =?utf-8?B?ZEpuNDNiY0lQMmZZTUZXNDkxeGY2QXo3ZUtXNlBxK0c0S2dOVCtoOC9MTXZZ?=
 =?utf-8?B?NlBBaVB6MUJyVkFHdHowd0ptS0NuZXA5eEM1RE1rcjRmVDJ4U0J2NzRYM3dD?=
 =?utf-8?B?ZXkzVVNuSy9KR1NoWmNjMGFlaFc1Zm9aL1ovOE9Yd1BSZ2h4NWl0ZFlDVGNw?=
 =?utf-8?B?bkNTdjdSTEU3QWZPNzFSUENZWTdEUHhDRWpSa2E4VHJhdU5wTHh0ZzVTd01r?=
 =?utf-8?B?citIWktzWnhQdWNyNTFBSk9tRC9rdjZ1YzFZOVlhbk84QTIweTVadzFjVUhC?=
 =?utf-8?B?TjdLeERoYUVIZ1JGVExjc1RaeVpuLzhybDRwdVJhTGZkN1Z4TVZPeUtIbGJK?=
 =?utf-8?B?QjNkWFh3eEtLeGRKK0g1RHVaZGZaMkppUmFsbjhaNU12V0Z0dVZ0d1JHcWxY?=
 =?utf-8?B?ZXJURVpTZFBucTRUZkxCdUhUMXIxVVljUTdTd2haaERHczM1eXdVTWRuWDU4?=
 =?utf-8?B?dENkM3ZzYmkvdi9qMWtVVzBEM2UzdHllSE8vamtNRE1acHpsVnRqa1hLUzQw?=
 =?utf-8?B?ekNDY05KVjRrb3hKdGxxQTdVa0RmeGRFWnJhb2pITWY4ZVRxYlJUVFllamYr?=
 =?utf-8?B?UUpRRW9XMDk2TVZjMjZtclR3d2hBd3ZDOUx3ZVIwY2oxT1lqNXpzWlNnN1hS?=
 =?utf-8?B?WWYvaTVZSWZSNll0MXJoNzJwYmNUZG1JYUxGRW5vY21WVWJtaWk4QVp5MDVG?=
 =?utf-8?B?amc0NndjZUIrRHhyRC9lVGJYK0t6Q3BmRXBZTGdRSllsRGo5K29HKzlFWnlF?=
 =?utf-8?B?Z3FuRUQycHhXVTZ4OUdOMi9pUFFITHBJS0Q0UldyVUN3NTRTZ0NxbUZkM2Zr?=
 =?utf-8?B?ekpFM2NEbU8rbkQ2VTRLVVNkZUxRVTZkb0VXdTZjQUJGQ1ZkdkVrL1dXYUJS?=
 =?utf-8?B?MmNKeEdqK3Naa00vWlJnSTkxWm9BQm5iYnZyYXZYMXRUVWtlcEZwVG5KMTZV?=
 =?utf-8?B?SFBzTGhhNzQwK0FyYTVlY1Q4Vk9BZzJBVTEwanlyMGM0ZDBKcjJLUDFPMGln?=
 =?utf-8?B?bHZQWHp2Y3p1L2pDbEJzS0o1NkRmL0tWbERwTTJJVForU3F4TERKRU9WZE5n?=
 =?utf-8?B?SDhZWWcxQ1hUaTBBeFNjQXJyajlGNDRadGcrbVVkVnZ1VGwyVGNyUTFFOVNV?=
 =?utf-8?B?SzJQQUEveG1lUTgrdHppQ1JUQXp5bWprVzRUR0d6VUk1OXY2OCthMkY1UDBk?=
 =?utf-8?B?ajFXZ01XOUNUZm1vZnhUUklVQUdJMlgyakRhVmdCbTg3Um5qQlJpSVUvdElS?=
 =?utf-8?B?bnBueWVxZ0g2SWV2UTY2SnJCYVhIcWVJdUc3WE5tbUNyUTVtWTRySlRyRVVV?=
 =?utf-8?B?OWVjbXhFbXlvTXhyYmtidCtENUtqMTc4Sk4rQWxabHVxbGpXcTBYWWhnRTFW?=
 =?utf-8?B?Qy8yU3VnSm1YaTRGN3JaQU9SRHhQcEFtVTViNklkNS9neWp1WUxGU0cxZTRP?=
 =?utf-8?B?emFXVmdHYVFOREVQUUU1eHowemtJRDFMMy9FamNEZ2JDbERWeXVOUEErNkZu?=
 =?utf-8?B?RGlrS1VJWkNLKzNzckJkUWM3ZHhGN0Zrc3NkdEhFNkt4T2s3cStIbXRaM3RV?=
 =?utf-8?B?UHNkUkw5MGpMRXorbUZOa2Vvb1hQd0Q1akd1Mi9qOUV1ekJFamtKcVJHUnNo?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a2895620-53db-4de8-1b10-08dd50ce7fb4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:39.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4Oj3+k5sRBEK3PlBxSktJvLbxn0HqougzKiwsrmVwcBUjssVxGu61F3K3bDLbQW7Gz3WltDkaeAd8kOmqn9D5Kd4uq2sikSThXNPI21GG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_021649_970535_B6764F10 
X-CRM114-Status: GOOD (  13.91  )
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

Habidere,

This series introduces support for the Rockchip Camera Interface (CIF),
which is featured in many Rockchip SoCs in different variations.
For example, the PX30 Video Input Processor (VIP) is able to receive
video data via the Digital Video Port (DVP, a parallel data interface)
and transfer it into system memory using a double-buffering mechanism
called ping-pong mode.
The RK3568 Video Capture (VICAP) unit, on the other hand, features a
DVP and a MIPI CSI-2 receiver that can receive video data independently
(both using the ping-pong scheme).
The different variants may have additional features, such as scaling
and/or cropping.
Finally, the RK3588 VICAP unit constitutes an essential piece of the
camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
units, and a data path multiplexer (to scaler units, to ISP, ...).

The v4 of the series adds a media controller centric V4L2 driver for
the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP DVP
 - support for the RK3568 VICAP MIPI CSI-2 receiver
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)

The patches are functional and have been tested successfully on a
custom RK3568 board including the ITE Tech. IT6801 HDMI receiver and
the Sony IMX415 image sensor as subdevices attached to the DVP and the
MIPI CSI-2 receiver, respectively.
The IT6801 driver still needs some loving care but shall be submitted
as well at some point.

Please note that the MIPI CSI-2 receiver requires a patch w.r.t. critical
clocks [0].

However, several features are not yet addressed, such as
 - support for the RK3588 variant (-> next item on my TODO)
 - support for the scaling unit in the PX30 (-> cannot do due to the
   lack of HW)
 - support for the interface to the Rockchip ISP in the RK3568
   (apparently, data receive via VICAP DVP and the VICAP MIPI CSI-2
   receiver can be processed by the RK3568 ISP)
 - support for the MUX/SCALE/TOISP block in the RK3588 VICAP (which
   provides the base for image processing on the RK3588)

Looking forward to your comments!

[0] https://lore.kernel.org/linux-rockchip/20250210-rk3568-hclk-vi-v1-1-9ade2626f638@wolfvision.net/

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
To: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Changes in v4:
- added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
- fixed asserts on stream stop
- fixed register address lookup
- fixed link validiation callback
- fixed issues by Rob's bot, kernel test robot, and media-ci
- Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net

Changes in v3:
- renamed the driver "cif" -> "rkcif"
- rebased onto v6.14-rc1
- abstracted the generic INTERFACE+CROP part
- addressed comments by Rob and Sakari
- added V4L2 MPLANE formats to DVP
- added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
- fixed formatting issues raised by media-ci bot
- Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net

Changes in v2:
- merged with Mehdi's v13
- refactored the complete driver towards a media controller centric driver
- abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
- switched to MPLANE API
- added support for notifications
- Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net

---
Mehdi Djait (2):
      media: dt-bindings: media: add bindings for rockchip px30 vip
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (9):
      media: dt-bindings: media: video-interfaces: add defines for sampling modes
      media: dt-bindings: media: add bindings for rockchip rk3568 vicap
      media: dt-bindings: media: add bindings for rockchip mipi csi host
      media: rockchip: add a driver for the rockchip camera interface
      media: rockchip: rkcif: add driver for mipi csi-2 host
      media: rockchip: rkcif: add support for mipi csi-2 receiver
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: add mipi csi host node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 123 +++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 ++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  76 ++
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  15 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   8 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 858 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 715 +++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 236 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 307 ++++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 421 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
 .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 ++++++++++++++++++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 154 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 622 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 24 files changed, 4712 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20240220-v6-8-topic-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>


