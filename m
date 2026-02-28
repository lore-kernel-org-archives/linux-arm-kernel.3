Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CE1048926
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 02:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZgeu9D6rdkczdKq0Fkx90MVCgDBehEDpVPPUPTmQ3Y=; b=K01X+p9ackDpUZ/MZjRBM8GFjd
	bbaMcwvbuljGTbgMZZBfPeQDImOZmEfItM20g257q2b1QQG9ooqzan/l7Kpbnj0OuhY19gWAnDHSe
	M2jCtAJ3Uv9aQs10Iu3s+fDKFI+ayABmC3DZ+HupS834N1Ni/aMCH/z2aiCuQA+To7Vj/OdSYfhdv
	CcoD3mokZ2RvMKbpQkzyi//V3h/0HbP5kzWJNLdg1QrYCDQQaxKN0UqGnd5NfcmMSeekNg6Gv5789
	V0KzvhaQVLGLjV6PoBRQkwusoggIEVVFOHhIis9HDZI2zDs6zptgq0wnEVTFGqGOVFT0+NKZ9lbwd
	L+kfS2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwA1E-00000009QW1-4Ale;
	Sat, 28 Feb 2026 02:25:25 +0000
Received: from mail-northeuropeazon11012068.outbound.protection.outlook.com ([52.101.66.68] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwA19-00000009QVK-1KEd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 02:25:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6slZuojyVWCR0ckKlGgfYCYPcHmahxkxdgYYUuowXxzEx9TAA/o4PNnSnEuLqIGs1B4y6UddMA0GPZ96phGrlDzEqhfd7xyLkwKcalCVMRU0rXHqpnID/Q3+WmATPC1YIQoq8kF/CukzKhjZPqj3t9GFUC5NG0hs177lg5BQyuubsnx28Pld0xg6mS38gMRzGfUIgY1W+Vrvhi4T4EYMD3bTgS/+nc+ECdz1IgANLGghb/M4eXkaYceTYZl0e+6sNfTQb9dDE38tK8zWTsVHA75I9TP0cRFQlSbRwLNI09ufXsPlOPkVKCrrX2hakBbPlEpoRwIxt3+iwyXNT+LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZgeu9D6rdkczdKq0Fkx90MVCgDBehEDpVPPUPTmQ3Y=;
 b=sxqxuT4WIu2mCdPKEl61Zbz9CmP6uG4updOg0VpfIN4wWROIWvicMZSb4PBaPYLjlupHPRL5zlyK3ouFVA2UxRfyzjECIJS+3CU67CY8IML8kypjh5eLYt2FapwZOY15qGh1bHSGbMD4DNxoQj7HYU+7Ooh+ts5hS2cOB8fIcLLJ2zzzb2GaIg2LUuVlqPoS41Qc8z2LYD13ueF+UwvlRjgToMPx6utYvIx4qKL+K+QEjLt8tL7i4+RDKx0Pq8uXLd6/YIJNcQ6l/d0kY92PDLQfYf5C8X2BngLgf+Skp4HYKZXZgnHOEyoC6f9+GcWHgURH7x8HSaPwPyI8cx8vZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZgeu9D6rdkczdKq0Fkx90MVCgDBehEDpVPPUPTmQ3Y=;
 b=DGdfWdyfX+KWBdZxPQ6Fd3IcuTQDCJ3MzYA2H5HS6DamHnCsnSg87s3OqObICsbo7M5hcUz7HYPjf1UTMKw8Du2cEihl5cQ/REOZeJcPuKMCWWvHnSt4POw550pHeEJkhFreAePBUigq6ZGV4AYHjrJzSd7ovphWzFq0RCWE25vbi2hbqgGmDhnM7grrE9zbedBzHDrKAC6vKQe8h7jcFxTjYCJU8x2LrCL4Sg8VDpkT0nARrEr1SSwcmrIYPi1eQvioFhPJoUS/CYd/FrwPBwjzpU7t9DclbPGbMibfEvFKACQBgE3HsuBIql5wv6AobRW+lAFHcS/IBNTB0YeW4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Sat, 28 Feb
 2026 02:10:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:10:16 +0000
Date: Sat, 28 Feb 2026 10:12:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 04/11] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <aaJO+f6vkdX2Id/w@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-5-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-5-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5P287CA0078.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: a09523be-633a-40ec-4a1e-08de766e82b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: lZhdwAzn+Y4zu45X4O9cMhsaLNLrV/6we/ZauA7mu/uCCJA2wbj2Kvik3wDeI5Z3aFvZBiPVluogooUO+B+FVfQAqTSYmleuFWNwejU2Ecrc7aLI+vBdIBB/raJflDehEA080FNQEZ4FQ6IcJz8wRhJLv4t7bolECz26BreyOy6fgIHs4fP2+3FRJSNz06f5UlMdhDzuVhBJOmvKCqyfQj+8nTMZ/ul5WkJNzj5Zd/W3zsYsyPCbNFlj5dsJH8xQuwTPgspXJpxkGDLFKKPC2Qw/sAxV/vs/TVZvoEV62eNiN+I2jggXOu1A40kInMaLvHe1bINmBA9Z254YO1Dc1QWKLGL1i7qXukbmTx+bgXh0VyXvSlZ5MBUxADIjufrnxRxQ4TawNToIQUbMmhHARmtqR24M6VUg8mNE37wrQyuz4YLs06DyZGh+/bxklyTBGOoA6sJoMbZC6abq7r1TNrIy2Axw+gB/RsgEP1E40NiroviHZMe8M6M7zckJj9tvRM4E/zEvaOY090dsPgupFkz3xx5tczpFKDUgH2v/dR7SVqlTmhi0DUFBuyTnwqUTY4/m6azifaSvvuMlF1dYzqTs+lef5ViGAIpUoLA/7BOBGuvRzEUORSWiQZTSB5P250rYbIswSK6bj5xyAf7w7F6ABetTfOOc8pcaJG4sQ0JiI9mLQJmE+wJALpwYFQ5YgtNwslp7vbd8nZ50+bOMdnsrHXqDvFbgmPiV9bYm1mdzDNl5drpxMS/k6B6YzEroW7yYjOMu4423fPFWPKmtEdqFOHXKg3QZSaayjwR9Mvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZ979J/Q9mBHKkXY/jpJbXeS5G7t8QNmNeRZaNFq+5AW+4W6h9R6X6Vnvy7H?=
 =?us-ascii?Q?bKVdo9svIR0Zw7PMNeIEW/UylUFho1aiWYokhbmMulFAVR5qA2VTYMWKBxfs?=
 =?us-ascii?Q?mG7QCAmqE/vga42N/jd3tyJclmqY0GMJDCqxRgIFNoVQObXoG0B/XW58vXG0?=
 =?us-ascii?Q?TRUehCmHvhUnPJlZKH8ZcCW4bd7HcT4r0la4zplWRbDi8aGcWqC+5APND7tN?=
 =?us-ascii?Q?00IKVh/0LRYYtGvHXhKT0JO0lziQd6S0Sojep+2+vYC3WgPufBfq7ADvJjEt?=
 =?us-ascii?Q?dcCaXN5qvVXmI7RpJfaBe6U+/b1OQ5l0yyuRlJiQlQAM4REsNAYX2GMGWgoP?=
 =?us-ascii?Q?cpFrMS1Rtnfi8I74PzYUNjRdDF45huKMwWJ1p/wKhQ8hcd7IpD2qNnl69QeE?=
 =?us-ascii?Q?/Gh/QSPCoVOBxdLuSm8Ml5ZS6+MVF1xGbpKtr5KYvrnJz4z6QJRo3BhIjZNz?=
 =?us-ascii?Q?qWRCzfbYbIDkioNJzVpa9G7983/VSQNKvrf+yzdYTaxnqz8kTAa0HDi9th/Y?=
 =?us-ascii?Q?vn0TSr/EYZI0MtVUMNm0VZFpTcg1nB7f9IOeZ6QGoPvvjdpNe9MQ1RFGQ0xy?=
 =?us-ascii?Q?UCeR83bLfMerOlEKwvlmUimnzZu8LLrkvoGAAVWXVtbuTwrqOAvqYI9LZiRX?=
 =?us-ascii?Q?J1hQgYP5SYZt2YI55JOqRbp+CT/HMAOwn/TsnxmPoitKNb3Prxr5az610sHo?=
 =?us-ascii?Q?zncOluGgqLX8HePyj0GN2bKUUDiLOButQzh2TfPzTFfBExBXLjZq332TnF/3?=
 =?us-ascii?Q?NEdAFymgKweOrkq0oVaa5Qy5FD67HsvDo8IOjvQUl0ZGnms3y7XpDirPr/rI?=
 =?us-ascii?Q?O77QYminfro166ltGTu2gaxpxeHlw+Tler02NPhPTTb3D8AeORxxRyatlpii?=
 =?us-ascii?Q?KbVgXDSG8HW7UGzr6T0ocIDb0nNGf6MEkVU+YcH9nQBR3l2Pb+BpHFw2vwVr?=
 =?us-ascii?Q?cvcZxIYnaGgsEktXpk29cQlulb6gsNOP0lHrm9EzHlZhH0me4dmkv3IJqJ11?=
 =?us-ascii?Q?fppwk6T1v6FlbR5bpS6XwuoYW6L0P6k2KCrRdcGC0aQDpzaRBgvMdDCJW2Qb?=
 =?us-ascii?Q?/lRYLJsQNh12QjF3uJbQfexqqI1ueSRebYQMuKoiL79AZ7+uMkP4Qs+NOgDx?=
 =?us-ascii?Q?+4NJBYzKbd7s8plS6WVCY4YVzvRbkL01odYdRDJf2FuY42bMoaKctqsEycsZ?=
 =?us-ascii?Q?yt+vZmIOCGZ78USvaILAk0LOR0yf7RcyliK0Z+3lctaUGhNqEsFN7ToubEbU?=
 =?us-ascii?Q?2hBhXMSlxrmfmITSv5z/hqGTtHmvUOY1znbxFhr7ND5ELtTrcGj49kmzHWFZ?=
 =?us-ascii?Q?pZfzVZ+nTV6i3zktTsv0ffWGDtXY8SrUOspnhyU7Rg1Cg4cDg9hkAh01kgwF?=
 =?us-ascii?Q?MIqK1z3kh5bZ/jhC8dx304V/dEr6M2NubThEGLcH/NvDP9+qILLvhRFzksBm?=
 =?us-ascii?Q?haviZNtWgK9AF44gvIazzbfXbBzrLwMe+dgC521H8k8g8eFDlUiZqxW8L5u1?=
 =?us-ascii?Q?XVS2nECtjzoUMGRrQGFH0ZkUTQH2qBJCHs0NmTM3fn1a0AZe/dQEblw0rb1V?=
 =?us-ascii?Q?Wy9yrRxy3K2b/qROgdlXEZJxAUINiz9RMLqXfoEBiterRADMUDvfto7Vxzu5?=
 =?us-ascii?Q?+TKHsNtuK0nbpWq89cU6e8l6w1OoghiY0xT7bGciOBrj28PPQtL/cKzcDQYz?=
 =?us-ascii?Q?Ub06w6CJONczAgXUPgnSprinzhYlaxL9xvqs/EJqaVJPLLGGGfvrps/PjQac?=
 =?us-ascii?Q?YV8I5NQQVA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09523be-633a-40ec-4a1e-08de766e82b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:10:15.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CE7T7lZIh6VtEX7BMHtJW4BfASiVuB6Nz03Kzwlpk0PXB8A1SOeT1dYL1qedYAdXCsheNBzSun+esNUfvytDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_182520_079812_B27A5A53 
X-CRM114-Status: UNSURE (   5.85  )
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

On Fri, Feb 27, 2026 at 03:32:18PM +0000, Cristian Marussi wrote:
>Use the new min_rate and max_rate unified properties that provide the
>proper values without having to consider the clock type.
>
>Cc: Michael Turquette <mturquette@baylibre.com>
>Cc: Stephen Boyd <sboyd@kernel.org>
>Cc: linux-clk@vger.kernel.org
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

