Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A95E8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Row8luLbxfl9XgeTXkwRjHxkhT5D8LoBOsVu6kl7xAY=; b=REW1Q/kN58sC676qNnmRGwQruD
	u7XJAeS+6i3/9bBt4H+bamKiiTNDl67eaVp2OarmWMATsoH/D+fDDMhkOeeRzB+Pa2jEoen/WqOZO
	1rNtaGwGz6mdORFwgOcB1+F5iEeNN1ebuGn0EDyZ5uQZ34u9Cfr5ehw0vlb9bV0v2ZoW/kRbYH3W3
	L67v++qeQ5toHpc7UVSihqbsdtX5I4V3GghLF/J0j1lL85WXW+ktD7QkJtmMTYcXxHyfS8NtXbuV5
	s1jpymMH9+81nG5WXYy5yEV/g+KX1quTF5zYMO3E6dIb3xr4MiWnjpMto5EG0EXu1fbzxIeQCJUwM
	sUTGriHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKgI-000000075xE-2jMT;
	Tue, 03 Feb 2026 17:59:18 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKgF-000000075wt-1wIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:59:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhxzQ7d4r7IgBypTY4K8+SEqf/9t+DpJlVIae+HrN+wwfkK/LYO8RyPbjapUZguK6oIw3nLBYH6Z+INuA0ttRvlNoB3NvdwQOwJ2i2tAcuxgLGPQbQf8zyhkglul0yzcC4ee7kcoElv0PPyfWJ7VCw5Dx3VlZuXo8zjk+xBkRc0yDk2iMXuf5eNrVdBV+ds2+2+tFT5xv+vcDO6RkyjqDl55+rLgvTotol5lqCGc0611wl67HB6utlGlbk7b2RW4I/qozpU19UWbH/NiQ8+aGXeGM4+kEaXmOoJNLlVYc8R8l4f61a08w3xou2Cs5E5j704GOuqIfXyQ1/51BwcuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Row8luLbxfl9XgeTXkwRjHxkhT5D8LoBOsVu6kl7xAY=;
 b=nz+ia7j/Azcxg8StwMTQvYWBR5qXSu0Ri+D4HceHGtZbEVTVdfyZsZy0woSLiVrhsnnaSMTRDZZB637WoEleUfaDqmqVBUP81ZoKlwmckBCf3M5kyQB9E8OZq121YkUU6b3pyrSKPmAKxHx/AG3SvzdPoSLtivnv/noA2iDUhcH6BVow3ESbYMawyv1MrSLKDv6SzA1IUzB7RBlJyCekaCZdTiiBUUCaP47e80sZ8QHkL3SLJCFloG0rLDxhrIgb2StQjhCEIQXpEPYmOnZQL69K/tcd1hdKNUec9rx01+RL5xaf8YIIsvUO54Wk6BHkFKEXrv8apbjXyq3i3wNUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Row8luLbxfl9XgeTXkwRjHxkhT5D8LoBOsVu6kl7xAY=;
 b=XPzd5P6y4Fe2lfOHMdQKTs3v8cB1OVMUvcnYnusVuiuuis3r7el7V4uKui9J3/Y0PtZbFZUfxh7Mm3ILbnRRXHKjAj/r/ew2VHjRD5QtMcgd9Cqk10spe2TOI8U4Zzw80r4p9M3zz2jDRzc2tZnasjC2fcuixMJGhONXfBmpxYfBE9xFPHcXe3fYPr4ok0ggujsEzYVE41kT+icNjaipaWsqckhcoYjGquiSiC4r4ABuCQaT3wWuxRPWOltYNhaV/pnOIQdCaGqDrwPXzUwepe/4A3arwvS+L6m0p5z49NHDmahZ1TW2r16HO0touLYlsHmZZhSs5YiZ+3t8/TfAFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10869.eurprd04.prod.outlook.com (2603:10a6:150:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:59:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:59:08 +0000
Date: Tue, 3 Feb 2026 12:59:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
Message-ID: <aYI3ZYYSfI1Gt1RT@lizhi-Precision-Tower-5810>
References: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
X-ClientProxiedBy: SA1P222CA0090.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10869:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fcbfb1-8be3-4ad2-fe20-08de634ded67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sv/4mRLiU7jrc5i+eRrppc+DZ3LeGRFb9FUdf3jXVrxLzYROXzRNtL7ajHDg?=
 =?us-ascii?Q?P7Ap/YekRY4Jrh5i2jScfHiuo0ujFrcljE2XK2VCUSiuAFVomaUNySrX+Yai?=
 =?us-ascii?Q?CtfLVXrZdqLxpgYglHoLBmRc48SHSOs7YqzW1mLAy0+irnnhPPArdul61gR7?=
 =?us-ascii?Q?y/NKYDQ4cL7ZjLz+2p4rncEWTnSMlxpbDPTOmk46Dbs9ob/kzmy570FtZzYd?=
 =?us-ascii?Q?/DEsalCub6yfBsYvINBUbREyFD9acpBUQEar6SCn5+ekvfKJpKpsZimnDAiE?=
 =?us-ascii?Q?7vSiy5KGmwhXPmp8lK0k40B42rK13HMAgpV+RGvxOaIcMQX1bj1O6TltXWCD?=
 =?us-ascii?Q?EYzqLHPMnal41jthHqW6qQi1qrSfuYYdA9NfzSOZL9N2Tdbud3yRwekYIzK4?=
 =?us-ascii?Q?ol6gWp2dxjsW6EodjsZUFAFVuL+ijjYovg07+/zlNSAwC6M7YF7WZ0BzyUB0?=
 =?us-ascii?Q?EAsXOynQ5b0DTbRjYaSnPnGsnLhnOlxSCIsUEptGmR/gHDZ6w/++IrcMiQ3W?=
 =?us-ascii?Q?APqeu993XBudMCgqEtfSEOmZYTJuT0C636f5YWq5LiAW6XFu6qi4cI6XyQjb?=
 =?us-ascii?Q?9FVG8g3DTDXrFBU2G+qfOcrPwRiSAUO1y+Sjg7JSJwGSdf5p3OQlIIHYkwPL?=
 =?us-ascii?Q?RcPkbx9cj994IP+qykAx/nH/X6z5OM57j3VieuADYleJ89xFtnZZ6ukFFfqC?=
 =?us-ascii?Q?+gY8vI/iyLxO+K3HmezAcRMIWtRBUI2By6IZtub0wesHPzGWqJ2jQRQZo6d2?=
 =?us-ascii?Q?LSf3dIPokxFXhMbenqPwk/igKvtCFEil2+ALOLrdYAPSduFAWcGMuQg3PZzs?=
 =?us-ascii?Q?bOdKVn3OkT8+q1xp3pCs8NZZKY7YpBDy4t8Jp46GjDFpMEvHPUtHoGwoMayZ?=
 =?us-ascii?Q?vGxe2jBWT+JZ+LGuiCjeqr/M/jbP7441y5g2kgR6JfP+uFYv/RSIZ6vglaEX?=
 =?us-ascii?Q?zq4uNUhi5v6absMUrMoRRT/QK62I7CiEnlLPvwD0RAahxjnEpSKCixEtJbMn?=
 =?us-ascii?Q?Zc/0NfTgwAj94zxpzB0eDGFPY2Hpl3Lv//wu1BO073WSqy90DKVeKWHXiJ7F?=
 =?us-ascii?Q?2wdMDP9mJJ+3lE3Bo9Kj0V73+bv2lTT3Vzrje6DjFic1+IBt450I0Hjro3XL?=
 =?us-ascii?Q?djtNAYpZ/RTcKO1ifDyCRT0TT8WCKeMfCtkhw5g55wWuLQ91FTiJ3H7JYTeC?=
 =?us-ascii?Q?kUKQuKJTlDyrIyhXz3yMwSSGc+ELxD+e9kqkC7oFIZC4ZOvLT3zf1FQUd/8F?=
 =?us-ascii?Q?+KEK2ziq4AXrKnZsfDi8JxGPPVVSw2GmfR88Gymtda/3F/DaL2zMumWVRj+K?=
 =?us-ascii?Q?d4f+fPpdP/9Qbzo48k0PJRqOPov86iZJkXNIsIvpdXAQ7eOsDwQPMw0wFoiS?=
 =?us-ascii?Q?kGF9couKPcA41YbpUEqoQtVjSg7ggkeJbe9z7PKpIE2fl2EB8W8RK1rQiiv/?=
 =?us-ascii?Q?KRWXLNa5/ZwIDEh87ve1RZHg6FzwwPJSgXB0BdU3n6Gt6p4hjN7REgjlWt9N?=
 =?us-ascii?Q?ph4rzLZWVkA0MbzqMMu1vpqJxwNeKOidE+b5jL9SWKvQREM2nEftaR3l36+c?=
 =?us-ascii?Q?qEODTuW+9m82jggqEaGpwv1efqV1uPy9rK91UVkJ+qDugZFohwbemORKTZto?=
 =?us-ascii?Q?2BEWbpgumm0+rypwX3gkoyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJ+d66uDOaOlTq/H6zvWhxSaE4L/htKso8r+WvFAoakgwIYwNmD5f8SbXLmm?=
 =?us-ascii?Q?dCxx+eX7i//ifPlzgoWX0eOfr0o/E4uHC48GHQ1AW4NduKtiqT5A/Phu1l6v?=
 =?us-ascii?Q?F/ljHPbDmPNhGO5+uAYCRzl/+b1hpXPceHCxz0XpY2wnthmvVgIV+8nPutWL?=
 =?us-ascii?Q?1a4sUewbw7aGDSOywHqXE617+3dN8Gc0SspvDbm8jg7J9kE30oShLGZtvSAP?=
 =?us-ascii?Q?edGU8VL1trYKJUe1jKJ8W3Dujmh9Xj6jT/iAzqn5ajjKNB9IJYrmZn8fpPsp?=
 =?us-ascii?Q?nX0XBdZUJEcZmunzyyN3DYRbu9DzI5B2jr6vus6EP3G7anmMN5hDFoQW2JZi?=
 =?us-ascii?Q?ctNmWszXbwbDgTMEzYOOBEJ1Q2dVuC3MtCw6I6epkT+MWEu/bBfLJ8TrcNZs?=
 =?us-ascii?Q?DaU0NYnvxqbFGwNiXzVb2jwSC3LQMIt/fHArrt/QyxjUGk6qu4l/QVNUuONP?=
 =?us-ascii?Q?+D7qQZp51bQgTD0O0WH4EPwaNFR9324b6cXvc5fLNaXUFcZxx7GYMXrP36jf?=
 =?us-ascii?Q?/od6rEj0Tei2UCZ+tglNzsPU/9G28YIsBh8H9pkt7Ae/1lVFbqQTB80R5Lg/?=
 =?us-ascii?Q?xcFpAPq4cfFmAiyBAoQqdn7OLSbk3eeCRTBZg3xCdf7fSNN2T3cVnsOwnwkp?=
 =?us-ascii?Q?0PhoB1rN/+ym1hkHXFer2lb+jxyZBo+KHzZGg3bIYZfVZRf6cU8qX9SzlGq7?=
 =?us-ascii?Q?GsGjz20/XgZZ4UamVsfwsV5/V3R9xE89P6ARE3D9tTHQJCHl3OTeFOM4DxgN?=
 =?us-ascii?Q?GjKlEIcO93kweNojMQ0GF4P+Xbiagy/pwcsbI0lSvutzWozFdVbnG7QbKxMP?=
 =?us-ascii?Q?YGAE42IPMstbQgKTNzfHsBm27v6fCgA4u/RUUrN8tLo+O72xsMgxh9tr0ZqV?=
 =?us-ascii?Q?RBjpkDHmcrb0+6IeGHlwqH7XSSmvYPz9RrD0eN6+Py3B5EKiGR43TX35ls66?=
 =?us-ascii?Q?oOeX7iOLLi38jJ2iNFQmDAgAYYr4uXddNEJq4DV9cn3gWytj+rPWVOvW2IhQ?=
 =?us-ascii?Q?AF9WeaXS0tQbSz29lOLgAJaorijLR828x9mekHr0BbGNMOqoKy3uQ9ZfmcGM?=
 =?us-ascii?Q?rtc5/1WT8jr8Vy0X6KYGNSUhJ74H9RxgDHI9qPwp3UnIzgOgySLAYm4zXVuI?=
 =?us-ascii?Q?ZcFKMMr52K7gjGeKj/Ph6bgDXQ8cp602cl69szIV6bl1+ci8jGyaztBYq8oN?=
 =?us-ascii?Q?8DLs6x622ie9A52iqTtSK+slKtGTYIR9Z/7q5XZW8vzb50fucyd39zzcQins?=
 =?us-ascii?Q?ajyCq+kws8q2ORcIKeabSKBi5mbhWsKonIBnL41rDKWNu68IDqlXgkouVZxO?=
 =?us-ascii?Q?osMqTzs04AggFBzCX8SWpzPJqrEWfXkQgpjBlMy73WelGdkCfBcQTNLkPMXA?=
 =?us-ascii?Q?4C4ijxoUZL//b//1PWp8c46y6IpT6jkafaLxGEKItNVG2MiV5Aaae+viN6IV?=
 =?us-ascii?Q?WDNRHt731KhRtw7qytRpnoT4VSddicDnydak/RS0s7DYcMyAKDzzoRklQKKy?=
 =?us-ascii?Q?Bga34zEYSybdA7ZNpvSzKhqKtspvifHbFaYgAnWQh2CtPZobsZMYNce81hgR?=
 =?us-ascii?Q?w9BEOoBiEaX+Oqh/lGjnRK43R4FA3BC7H1eTYRBQb9EDlFtZv8DzGQebnqPb?=
 =?us-ascii?Q?9CiFcknd65Bd7TdAC70yqajVNhty3NtvqK5L0961cOJprGJv6bMrIxEpeC7m?=
 =?us-ascii?Q?RvezOrzLYmqpTza/qITg07cujuqWHiWwBW5qCpgnQHpxbuZTpnJlwj+qyqOR?=
 =?us-ascii?Q?17wh7nbFyg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fcbfb1-8be3-4ad2-fe20-08de634ded67
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:59:08.1705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3dDuJJ9Tm8tuIwQiYU2bqEsq8MbFlxoAWpZG9QrvYIon5lzmU69oZQjd6mxmoV75WpIDinkuDUutEzW9MZmMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_095915_524013_6BF8E8F6 
X-CRM114-Status: GOOD (  25.82  )
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

On Tue, Feb 03, 2026 at 04:05:47PM +0800, Peng Fan (OSS) wrote:
> From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
>
> On i.MX94, watchdog sources clock from bus clock that will be always on
> during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
> between the bus clock and watchdog, but the LPCG is not exported for
> software to control, it is hardware automatically controlled. When
> Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
> gate off the clock stop watchdog.
>
> So watchdog could always be alive to protect Linux, until WFI is executed.

suppose only after suspend's WFI? suppose CPUIDLE's WFI doesn't affect it?

Frank
>
> Introduce a new hardware feature flag to indicate CPU low-power-mode
> auto clock gating support, and use it to avoid stopping the watchdog
> during suspend when LPCG can safely keep it running.
>
> Add i.MX94-specific watchdog hardware data and DT compatible entry to
> enable this behavior.
>
> Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> [peng.fan@nxp.com: rewrite commit log for clarity]
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e89854f14edca0fd5fa84591c2d2 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  struct imx_wdt_hw_feature {
>  	bool prescaler_enable;
>  	bool post_rcs_wait;
> +	bool cpu_lpm_auto_cg;
>  	u32 wdog_clock_rate;
>  };
>
> @@ -360,7 +361,8 @@ static int __maybe_unused imx7ulp_wdt_suspend_noirq(struct device *dev)
>  {
>  	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
>
> -	if (watchdog_active(&imx7ulp_wdt->wdd))
> +
> +	if (watchdog_active(&imx7ulp_wdt->wdd) && !imx7ulp_wdt->hw->cpu_lpm_auto_cg)
>  		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
>
>  	clk_disable_unprepare(imx7ulp_wdt->clk);
> @@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>  	.wdog_clock_rate = 125,
>  };
>
> +static const struct imx_wdt_hw_feature imx94_wdt_hw = {
> +	.prescaler_enable = true,
> +	.wdog_clock_rate = 125,
> +	.cpu_lpm_auto_cg = true,
> +};
> +
>  static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
>  	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>  	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>  	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> +	{ .compatible = "fsl,imx94-wdt", .data = &imx94_wdt_hw, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
>
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20260203-imx94-wdog-1e0aa14d661b
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

