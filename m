Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB9D58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAL44IC9GkAjW/05yleT8IcJw/x2lj/wDLzkSovDySE=; b=Aia52/ZsMsqTwrQ2PuBunJtDxj
	/8kE4c3a0JMAq4g3Nad4Mc8gqJ5m0BGEeyPw3oT86W7/xaOZhiXKaVijtO1nbuwbxkDg10PEQRmtz
	ZjKibGUQwDLUxlsUYqL2fKh7utdLXzRcS40eZpa1QEBLOVOGfRud/8NezgQWRgGBYYVZ2nr5s4DBG
	NxBimS3mUB16qNnyvOtc6g5XpFD0/UqAV7Q/pR9vy2t9o/NBjSG3NF0CJQOIuHPAQJeutmMmmTT1L
	Y+o8P7NISfWxwwqxET9HWMCeVIdMaICpoCWwNuXTIFQf3g1vjn3QDo7/HOcslSF/3+2bGlIhGuNb2
	ZFwh7wHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6XF-0000000DXCq-41ya;
	Mon, 02 Mar 2026 16:54:21 +0000
Received: from mail-northeuropeazon11010028.outbound.protection.outlook.com ([52.101.84.28] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6XD-0000000DXC8-2Z87
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi2wgnK09w6b8zmS3EFfwQ+t6jZ2WNyWmWpoKMDaBm+UX4s6s23qbCuzeklJdk5qACCIQ1mpB0ceHO6hl/fVDIAel2DOzTyOUGfM8qiXiRMEE4YS5M8txWNRtsdqPzECQw2nx4gpd3aTXjaeBSLzlmjKQ7Yii8JULd24uzY9yN3V4bG3bLvgke+qF3HuvYyoUAMVH9g0k8cAcpKI1kIx95N9GRZbcrnpGf3fsn9CS++6oeLyjxZNqJEWOeASvHiexBhD/jhAYHpsJdYQVEjDAXvSxRZbAWJeLqXtA7PJkTDBYgq9KiHFT/L4bEuW3XzYXkv6NPCqkzjI0UUd71ljYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAL44IC9GkAjW/05yleT8IcJw/x2lj/wDLzkSovDySE=;
 b=pSJL7TkH1quo07gwljra5fsMAiyn0QfMXmM8tHOMfq8lyf+sGvUn6D0Y5bn6+IAtKWyIoKs6WqWye4/dtzYDZqurw1s9GimTcsCsXJuZfXHVWBARz3iov2VUWTPGmYeyOEbtsjYSmWP2Qur5zkrwQgg6vm9sLOAC/VIrvndNdW/y+S+9/gTqJ95SRRgiphXADGf+IRzu5ooLpVDwuybhbhAFHmB3r1oDt6LN2Kv3hzsAsbgb9BbE+z9P+JB9zDc6phGs8CMiZmEQsKFRtxu0rh5GrxVzIjGg2/Vwva9LzlCZpbvu1qujTvwxhkg6GdgprH3dUJMIFUXocTr7/wFY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAL44IC9GkAjW/05yleT8IcJw/x2lj/wDLzkSovDySE=;
 b=DV5i3ItmCOnd4L2LPX1kkjgk5FAG+hKQ9VPzX7OJd2K5B9im0zHip51dqb1bOy6x8tN9R2pJ+R6Nwrdbj0slU8MYBzGtzbgJhzVWOwbhx+Ntn8x1tLfkOFE2lORW3c+AkDkxArWbt7ERB2hFkP4pq4FqFHHO831xx+6VMcNezL838/bK42u23yhrO03A1sh7NDZs58+9DuCFt4LVhuB0RmZ+wWk877iBkoTiQXukLc7N+oYdyllQFzpXGoc/N7ezjE2khUfEk/rIvlkyei3oCHb8QBPzgLCLMEvJvsAzZ5h5zcJpFmQ4C0H8brvqjfmbVdPVGGWEwbURzWdxobVOEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7334.eurprd04.prod.outlook.com (2603:10a6:10:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 16:54:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:54:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
References: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
Subject: Re: (subset) [PATCH v8 0/5] arm64: dts: freescale: add support for
 the GOcontroll Moduline IV/Mini
Message-Id: <177247045170.2117969.14385993648984511959.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:54:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: d94d5e5f-c961-4327-87c6-08de787c55c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: oOAse4dfN+Gwa2d7X0kYI6EpHs3Azal7Zpd2ZEAVOuiUKLxcr2JqAxGeXrqNqHuIRgHkMqC/US9IUjLdXBZMu6bG4UD+MT80YCR0CQ3jqrwsLY5vDqGp0HjqpZkvcGjb+wIxnl1DsQJUPJedMOYJGRUjKmWwKxIeq7KZJKZWyl8kKelSet/Gt0J4s0rXpy8nmA5dpaPefPKPTOoM7O2N/+A5SxCQYRtlINXM22BcPXDadwXo4r+oY40raFDd3YlccIdY4S/Pll7LTKzoyMzpuZGA8get084Gj+hlMohPUoc2/KyMtfSwgP2YWzASiVDkR6wZWLWv/IfB/qgYtsSPk/5PVv7op1AtP+5lYP64S1FaITSOR2S9xSyzNfuI4yZGFIXrE+tgbMQfC7QhqNE7hqDJO4QbB3PyP0081ZR8NSYtgB2uP5gyNFX4/FYJB0P3o41Dh3eyJRoi1zKXxd5jjne+wIlom6yZNdLWJjgh0j0e4lSW3XuFZtK/TFXKv2g2+P1H20lrFayNJZWGXD/D9eZ2iWDMIFnRTZYAy+bh4dAX8B0mCWLW5Lc/FB729uN5EHbJl4lKip9bIiwRMeJym8zJ9x3LT6qS0xr95rdHXkS3PHlKDN1KrjcOgnctRzY+ucfCphLiOiAaV2UMW73Bv8UsqnOWqpkM6WEH/UO4iZ8ckQSi+MuYKAC8V1eHR/csyk5hSADyGaMSIdZSvC2gtOn4HRLZeuW/Yvj0YvoSM+FTTeYk5QIsx3KuWxRXiMYLnGggYZxWzu9ux1uJ5PvJViWVK/8ucnenL010wGjIhPzLEfQd4A1il0RmYIF7FS88
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pjdDBoekFWV0dCcW0ydm9CeWRsaGdkM3ljZHl1VWs3V1pOaGEzV1paY21X?=
 =?utf-8?B?dHJ1UXRQaWpzb1dsWS9VdHZrakdNS05xN3g4YitPYktEU0ttVS9OTnRLV21W?=
 =?utf-8?B?eUZwUzFpR2Z0Z1FBU1crcmQ0dFdXc0NsMWpuYkJRNWpUVC83L2hUak9lNGJQ?=
 =?utf-8?B?Y3FGREN6cmVmdU8rWjhVU1laYi9OOGprcWw0UEIzaEJuK2NHb25jYmZiZ2wr?=
 =?utf-8?B?T291c0Z4eHBJZlUweTI2ZWVWclh0UjAzRjZTV0JzSXRaZ28zY2pLdzZmUEFP?=
 =?utf-8?B?ZUxMWmU0OFRqcTNLK3VpcjhYdEhWU0Z2ZlpPYnowSjhndmk1SFlaNkRianJG?=
 =?utf-8?B?elFWbER1bnNhakpPOXoreHhCM3NObFRwc2Z2NTJvRE4vK1N3WnEzUkNQaWE1?=
 =?utf-8?B?L3dNQ2lwTi9ncWRqam5HRm9LVUZEdGRmV2hzVzdOZFYydXhFMmw2eG9nM1Qv?=
 =?utf-8?B?cE5MTHcvYldIMjhiTDBzRVlYeEZWV0g5UFQ0UTZmekFpMEJTZllwdVowQjJC?=
 =?utf-8?B?Si84WHRzRHpaUHVHT1BSekN4N2J4TmVaZUFla0xPVzgwVFc3R05CQVJPakFN?=
 =?utf-8?B?QmdERWplWWMrQ0dkc3BXVnVZMDRlZnY0R2J3dERZSHd2ODhmem53NXROelpt?=
 =?utf-8?B?QzVqWS9UN2hRdy9NRXp0K1ZvNlBwK0Y0d2gvSmE2OENXWGpTU1JTejRiUGE3?=
 =?utf-8?B?S01hcFRVVmZpYjdWSTd6QjN3RnNUcnViR3BXeCtuTWpoVXdxODd3cHI3a3Vo?=
 =?utf-8?B?NndES1dJNFNhd3NCTlRyTjRYdXBwaWt4VzRFdmw2Q3FCSXE1cVlMVEFtYVdL?=
 =?utf-8?B?cVBzUWFuNmJwNVF6aWc3N1lpVlFZd3pWRzJnVDhad0JIcVVhRTAyOVVNRWU4?=
 =?utf-8?B?NnJiSzNCZ1FyaDdmWEJwaFl5SEVsUUl4WXhoN1ZDTzR5THlQQUNhOTBUYUti?=
 =?utf-8?B?dUVucmJ3WlRQOC9yaGVuQ29wV01FSFFML3crVC9WVW1KV3hNQS9PcXNxblF0?=
 =?utf-8?B?UUtna0d1eDJqQk13T24xeG1lUWZpZHUvenpQTXpaSDhWQ1hobTBuNUNrVERm?=
 =?utf-8?B?SFVNSHpDMm1Zb0x4NW81Qi8yL3hCWktrMXVGbzlGZEtXUlZYaDJjZ2p1VjAr?=
 =?utf-8?B?b3JpdnFrd2NGY0RPSXlBSnFPT1hLNHBuL3o1cGVvMnd4TE5GRG42ZU1WQmdY?=
 =?utf-8?B?U2gyMGhlQ2thSitndDZnajA5bndUNVNnWmU5Z1JBVHlhQWY0SU16NkhuYTdI?=
 =?utf-8?B?Rlh5WURzY1dCYkJacGpjclVOdHBPTW1EcFVIR2psb3h6QWl1WHBpKzhjc2ZJ?=
 =?utf-8?B?cDhBNG54Qy9nbVpBWjJpT3dJRnArWi9jTmNEemQ3cFI5MlMyV3NVNnp4SUJr?=
 =?utf-8?B?QTd4NFQybXJ6NkhIUmNmUHpWZW5JS1NlSUlqRnNxVWZrYjJHMGlWV1FNdkRi?=
 =?utf-8?B?aHZwWUdsVmN2ZEM1cmtNTVFGbXNNYmsvRmxPOVJZbERNVWNzdkc1REIxeG9X?=
 =?utf-8?B?dHVZaTdxVFV0QzEvcE90MUVyUGo5TUZNUklVMmFoazVmM05MbFZiRlkrMUxJ?=
 =?utf-8?B?b2lBU2RnalZiVS9ObTRXejVRWWhiYUwyV3pWQ1pWTFRwbjA1OGdxeXkzeDZz?=
 =?utf-8?B?TS90NjJMVzROWWJWREM5WU5ienQ5bWpIRUtZRFAwR2xMbCtNK0lXK3VLSHI2?=
 =?utf-8?B?NnJGUm9BbytIT1NXTUpOdEVkR2ZndW1hcVJHbG96bTNySER4QjFsNjBqMnhx?=
 =?utf-8?B?ZVFYOENBNkg4UGRoRktnTnZUeDJpcml4VW91ellSU3lLeGRaSUJwZ2xnMW80?=
 =?utf-8?B?bWhJeEFRYlBFR1BIb2ZUeVNtVThWVkl4Ly82cVluS0Y5T1BRUVMxY0w1ZmdT?=
 =?utf-8?B?Skx3N0wxNUJONmZJR08wWlIrMFNQRFZ0M2NTZzljdUxHMFl2WnlrSm9PZDdu?=
 =?utf-8?B?cWpRYU05bTVRUHh2L2NaUUdVajllaGhvWWR6LzR0Y2RxenhEM1RuMGJYSHdu?=
 =?utf-8?B?d3RSU0JHU1VMWk9qU053OTVQYzlPR3IwMTFHdWR3VFBKVHljdlBhYWVTTklu?=
 =?utf-8?B?SVNoZlpiNXFxV3hpaW1pZGZpZzVsMEdvZVBObStVYjU2R0Rmb0wrSGF1R1Rh?=
 =?utf-8?B?Z044dG0yQUxkaHVGeW04bXFWNC9ZOWhZYU1CK0lVN2RHYmdEeG11dEJmQ0lN?=
 =?utf-8?B?Uy9zbEFVK25QWmRGQmQ4Y0hwOFZSUnRQNkY1TVRMVXlSSDMyaU5USEVnTEVr?=
 =?utf-8?B?c29TUjFSOTFQTlV5ajVTOHdKOEo0d0E3TjQ3c2tRR1dmQUtISlZ3MVRhZ25h?=
 =?utf-8?Q?GOd8gXwBWHe8YmFLxW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94d5e5f-c961-4327-87c6-08de787c55c0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:54:14.5849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Xi1VUrI9fq09havKVpzvXvqlHkeM8/l1j+uNyz5jh7R3xFuFkX1hXu8jlLvICdSD4fLGgnGWoJ4PHkg7Vj6/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_085419_685202_8FA3EE0A 
X-CRM114-Status: UNSURE (   8.72  )
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


On Mon, 16 Feb 2026 14:07:07 +0100, Maud Spierings wrote:
> Add initial support for the Moduline IV and Moduline Mini embedded
> controllers.
> 
> These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
> features an imx8mm SoC.
> 
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>


