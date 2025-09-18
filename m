Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E790CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bux/rUo4j4e/pZSHrMG0CjcwdouOFPgL5Q5YzhkaTlI=; b=sjFwzIOg2Wu8L3K+GQzQyDabcy
	jj/UGo4ydZ0uPSlogozagOfNshRgRNBv33e7SElGc1qyUtIzf9hX0SKGnfNGx/gGv2B9MoNmuwyOl
	kijVXxWF9I1Z+R5FFAoclPbBsQYUU8hroeDnkslM8J0kAG4qwTZubcn02M6ZxBAKv9VZSkIJYXETC
	0DSBC4b8PjWqoTLrZ+bK4GvKIAyI5pWD1lD3ETS5681UtjPm/lZebDLrLd4ySPFElRRIYj6/ZWaSK
	uzoU+w0oPTBjNGLaNap3lKs0I2xJcFhMiNxbnuW0WR1IOxl5TfyKM+CBSJKe3QdPPWis9NVP+0YCk
	8REDfq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9PO-0000000GbqY-3HhF;
	Thu, 18 Sep 2025 07:50:26 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9PM-0000000Gbpd-1YlK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:50:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5/xQ30oTSIhmHFZOTe9F1ZMkr8DRiyzGOhmgDClcrGqZzl8LpjxN3+KBFQbFgg49GNf3A4DZS4nJhG1YqSY+rsUZlt3ymlFiFnn3F1KsxL0z8C7WSTLp7JO1gdem+h4h8mOV60diU63LOIRLELTW9+smU7nlzcASMPnl4goKhChTa7IBVXKPpD1iPyYqrsiBNBTycwyykQVGuhcP1o82vmKQsG29P0awqRGncAQYyb4KXbv34twZO/CXfCoUByu9/pp13nqGTpuPf/mrofdLCX+D60sM8N6dKt0k4v0uC2bEF71DF0sZgFrCFVlL8X0VlRV4Q4YZmsRPnkzSp5wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bux/rUo4j4e/pZSHrMG0CjcwdouOFPgL5Q5YzhkaTlI=;
 b=agnggOVr6jZEK6s6rsCaqwMZgHxH9KN6J9Mi0b/ZylQW5GcVMIm++21BZFbsSOHr2OADE6mFUvMJVw7hkcFH2iCU5CAdFOij90jIoyT8n3/dHiC9frrkLvMp9cuPvRQdbm1wxFSpuEBT2mak1bafJXLJQLKfjPBDCxu8g320InIcMhn79FrMiTQQlvyomeTY1cou5k9Ib1Ha6w0R691Up1TolspY2702HNe983xaqu6Ob4fimMFdIsy1en1WnK0HHgvIphGsysG2DYC2WkFs1FEMwdxMT09WNimc6s4T5Wr0ev+Sgdf0ScCH/spHsXlAwmpAFyiigRw+VrI/VLvhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bux/rUo4j4e/pZSHrMG0CjcwdouOFPgL5Q5YzhkaTlI=;
 b=atBbyiKD/zw7VGzJ55kWmIu0Ez025qyMrk0vmLfpylwcablb5f1ValXr6odtNLXzgGMa+KGU/FYjC+plGR8Ob8CsHkAC6/dvuO9dCXSoAR4giiwlO3bG6RMYCvr8bxq3WrPuk+l2npngUbc00CMqiZAbE1Az4DyAcExRtC+3mEh9RWemtrETUoWRM/IbYJMkO3T2BWYBs8wZiU1Y/G5Lh23VEBCRq4eysvQYGOVqekH6hRctm+biNvayQC5sRL8iNamyVvFBe2RKiHal0lsbcxUQPEdowTxmLO+XAXqevEpwYng9X/iLlmJ0/VuThp36MuEHrmcG5YWkPvgyzMpfdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8268.eurprd04.prod.outlook.com (2603:10a6:10:240::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 07:50:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 07:50:14 +0000
Date: Thu, 18 Sep 2025 17:01:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Walle <michael@walle.cc>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: imx8mm-evk: limit the max frequency
 of spi nor chip
Message-ID: <20250918090151.GB23028@nxa18884-linux.ap.freescale.net>
References: <20250917-flexspi-dts-v2-0-7e2a95e3cf4d@nxp.com>
 <20250917-flexspi-dts-v2-3-7e2a95e3cf4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-flexspi-dts-v2-3-7e2a95e3cf4d@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d985ad2-ebf8-4949-3e03-08ddf6880086
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?85JhfnIAKghI/Mdp7phRdL5ZTcCFWrusyyZpQIMNiWmG75qg5GmaRABB18Eg?=
 =?us-ascii?Q?iiyJK8zg3QZFB0QbAWrj9Nu1/tJGa1HY0Z80pPAZjUVEikd1wst4D94FQw/i?=
 =?us-ascii?Q?9VgZfSXcUsE4/yals8HYAUdOHmCsAUpuB0D123WbC7mC5pW3fc6IVeE1CQYL?=
 =?us-ascii?Q?ySqPXiqENF5yx28ZcTeV1Sc+P08o4TnYjzPAf8xgUZxOLmBlANK11ta5bJVE?=
 =?us-ascii?Q?QF9vVwf72zano7GAGxMFFT6WpL80FBxnBxXRfjPI4S7GsYZMYdKHJPc9lUrq?=
 =?us-ascii?Q?44BThsNZgyVVLUbfy0m2r/xapGMHSdWFx0E+HBzWLMDjALBHyrsUPtLT2l6D?=
 =?us-ascii?Q?odvhVJFmRl8uxndngl9/7yKNa/NLVT1i+H/Dzt9zEub/qq2xjW65l6cynV3E?=
 =?us-ascii?Q?J5lHeAt8/cH/ULQYatj4M59qrV4omSHdUdTxuAQ8HZVmo67Rq8C+YlJj5rSR?=
 =?us-ascii?Q?/4IcUwqt4W1S8oru24FuiBjRXyjUsa7KnbLvmCsoEbjrz2Mg3NfoQJRcKJ8W?=
 =?us-ascii?Q?Th3Uovr86sRgux4MxYAqcF7/9uU0IghWLC63rFpp4EV+ZAiOM5m1UuB+iiof?=
 =?us-ascii?Q?hZxc+RlLFmK8yhFKR4YZDPrtwIFNAx85Jk+YySkTOLM8xtB15HFywuez1wUH?=
 =?us-ascii?Q?20I1kd8GbGei2KlNPkQTY25Yh6WECqPAWPGBVCxBzoN/3W8ulx2gFLxuijSR?=
 =?us-ascii?Q?uNzgC+2dM+UbN9WUE4lvCJoFMx+tSjUx0zwmSNLzcFtFrKebAaUmcZyMtGOE?=
 =?us-ascii?Q?Zi4AVMe98m3FBtJXS0yPjuVJ4Ba4qhKO+Qv2G7tKIxos1/3zgAt5JubjqSuH?=
 =?us-ascii?Q?VpbJK6SMWJNWnaxn3MhewNWBQpcvM7A6NtxeDI5iCTC+5NDOxdg1tkWjCiyy?=
 =?us-ascii?Q?dtscyiiwlmRQfsheQ0/C+ebBzNwoVVaw9khRFeXlx4U8Pzj1A9ASe53CnHyk?=
 =?us-ascii?Q?XSuyuFRsFgSJfJHxTEFojOhPM1QjrKE3ga/1UbHy9OnKoV9iLp0fskM+jjFz?=
 =?us-ascii?Q?VCnoPkY/GmKy1rOKOqPrV136Ccb+Z0j0v11fSpEY1BoP4SjbeZ/ZIpW1dfGm?=
 =?us-ascii?Q?P3OucyCbPohG4765/0gV7fH8T38hojTiveQViX/epG+7c+kUnMgJ9/+SEWIC?=
 =?us-ascii?Q?3PRTM8UBWxg/CUv0/MEUx4bWUePThxRO1iB4SDSbnvK2K4Nb4U+RcdjZAu0q?=
 =?us-ascii?Q?lAd4MEDd0KTCybmHaK1AIeM0nD6bWQmH6J52rhP5sggLn8McOFJDmJGpI3Y5?=
 =?us-ascii?Q?hsO7Jdl1u5MuE6s6Z319hHidUgFn5L2mZSW35fXVmMq1nlf9vgzA0cB2mDIv?=
 =?us-ascii?Q?II8aeXg//EjHCCCW81n3nBoK0CGNWpJQTb08kEinbWDvjDYilSCm6SRfn7q2?=
 =?us-ascii?Q?j1BL693urSUZ0QOTf4zVGbt5mHzhUQwwaNi2Si9E6Ed140cFUmTJHr1JB26N?=
 =?us-ascii?Q?HH3hwKKCM+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oRNhDeXa2Qy5YPgBtnethhR7t4ZPSChblTrqW5JwpAMF+GlZws4EH9YGyOG?=
 =?us-ascii?Q?6bs/A/bwAn6J1qDhtsLyYCj2gJvUnuzBzDFJdlJSoeT4sqQgIdMouLJxK8LC?=
 =?us-ascii?Q?FzDNgeSMCEI8F3z0idZMzISFD3LgexDxx8M7HG2u3crHg40ssy2AGPYJjRlV?=
 =?us-ascii?Q?j2YSIPAvSj77Y8etMfCoyfbw0ulfXB9qAZcZLrxyWg5A7gOuFsmuDrCY8TWl?=
 =?us-ascii?Q?0fKJ+XAKzpaBa08oRwZJyAe+QrsDYb6QIHODxRxyz6fbHLXbDM//RNanPAS7?=
 =?us-ascii?Q?9+kdz4INiRTmyyk0kL8uv7tstf2/5b7ZPrYforq5TQEvwChKFP0NzG74qj9m?=
 =?us-ascii?Q?MdzOIm6Whj7U4LxQX61D7983y9XXqRnx0s85Wh0kHOw9ocTJJWhADffKLJMi?=
 =?us-ascii?Q?AYDyGLWQ0ciLS5DpMOrS0n78p0gtkc1BF97YRiObuKaB51U2yS5fknrJrTmu?=
 =?us-ascii?Q?viAjP0KyjqqLNqLUitL4nyGUSkqSUbVxMLdlNGCgSbDiCnUGbo09gepRIEKw?=
 =?us-ascii?Q?WZyoPQjGrSAsZBdeueqRWd+hMladXhsOBHO/FJ1mdhOtX4o+bYFyHYhQ9otE?=
 =?us-ascii?Q?7I+TmTdolFFsH3oynKzfI7RVJKpJAs3/3DSlZb1GUldmpQmCduf/OrpmVK2y?=
 =?us-ascii?Q?ve1aPF/L9M/BRdWEXEFxfFuoEN7mIjXKQpWlckRw0T5up/xCKUKTXmSx+29q?=
 =?us-ascii?Q?deS0oMm/o8rkC9PqvsQK2EsmZS6fSztJJvAy0EGWrbtH4xFcHBzx2K2ue+2c?=
 =?us-ascii?Q?GvziGMON5Xpb+L1jK5mQ0XDlupwN0rrCvXNiEzHiLJIO6Dwuw+qHhtfsvzGN?=
 =?us-ascii?Q?+3VystRkLejdFONW5Rf5jS7IBXuqvCyFADyxGBoA7aqCnGIgAvpPR62XEFL5?=
 =?us-ascii?Q?g9HML5pff82kRo67SYO5tWxc2aYn22mPEyCdidVobY5MwHqh8lrstsx5D9YT?=
 =?us-ascii?Q?xUHB+htX3gc90BLazuyaJr9+7/564FoIy5yVzkQz2yw/MH2R5Ba1oV/LTIU2?=
 =?us-ascii?Q?r2vmgy8jDwliOaQTYOp6QRs9zoZPXiHjfd2Ta2hAOvP+0N4eawHiR1MH1NkX?=
 =?us-ascii?Q?q6vfoDPkJNn8LpstxtxJqaJYhJeQQlwPj1VryNzQPTYCLhYdubPM+YY/HBM6?=
 =?us-ascii?Q?tPYC71aMhUyb+zQ33SjOh5JdF3vDd+WtvCHh3mKy5VbhzJzqJ95C57inL8LF?=
 =?us-ascii?Q?d6R6B48nV15GRP1+ZsJ4X2Czl+IafK1dk7bbzD+6+3mBN+pKRWWLuAI380X2?=
 =?us-ascii?Q?62LPtnsGSyGjus0xaDkUVpeGyxcqtdiBTQswOjP8Wvy4gleYznKqE6LIOZns?=
 =?us-ascii?Q?uYnmySAkK5UFKia5PHF7F1XKwku70kg3rAz9QVzXOfZZORPTwauHyLbsjnPO?=
 =?us-ascii?Q?TIrD4VxXFNGEiJTGpKnC9rVpASJO6KQTb4zLz7P29Qbv6KxPb4W2JQKFiicn?=
 =?us-ascii?Q?+5a6597M7hlt4DQ/e4x6dg+TKBibB/bXXnMN9FM0Ej5TudRa/igwZozlLQ5/?=
 =?us-ascii?Q?jL+pzb6JpVrQNzwDVOZbIrFeJPzyx94LxRv8KgT9BZZpQ31sHXMA8l7++XkC?=
 =?us-ascii?Q?+EI8ZPVkSDlJCEazJMt7wSZGKCU7sEtPZr1ky/O8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d985ad2-ebf8-4949-3e03-08ddf6880086
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 07:50:14.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfD5tXaHgV170hfIXZk032w0+LJhux1xsUOqWvHFkp1MbFqP6xt/cO9N0qxUSBOvba4YmdNLqNMr0a8BAaWmtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_005024_422514_6B766624 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, Sep 17, 2025 at 04:42:29PM +0800, Haibo Chen wrote:
>The spi nor on imx8mm evk board works under SDR mode, and
>driver use FlexSPIn_MCR0[RXCLKSRC] = 0x0 for SDR mode.
>According to the datasheet, there is IO limitation on this chip,
>the max frequency of such case is 66MHz, so add the limitation
>here to align with datasheet.
>
>Refer to 3.9.10 FlexSPI timing parameters on page 59.
>https://www.nxp.com/docs/en/data-sheet/IMX8MMIEC.pdf

The SoC SDR mode max supports 66MHz, 133MHz. DDR mode max supports 33MHz and
66MHz. Saying the driver now only use RXCLKSRC 0 to restrict the
device tree to 66MHz is not that correct.

The SoC max frequency could be coded in driver per my understanding.

For the QSPI-NOR chip, the spi-max-frequency should represent the NOR chip
frequency. But that chip supports SDR/DDR, so a new property
spi-ddr-max-frequency, if we take spi-max-frequency as the max NOR
CHIP SDR mode frequency?

So if spi-max-frequency is the maximum NOR chip SDR frequency, the driver
should also be update dthat DDR mode is not supported as of now.

Just my thoughts.

Regards
Peng.

