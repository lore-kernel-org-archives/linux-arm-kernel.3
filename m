Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20055C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 04:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJWXmvXquMGFQE2Q6fUTgSs/lH/RQDu/uep1DvLrt2I=; b=hwg+s0RdF97EaS1U8Cjoxc941W
	YKbpUSLTbGS2A5g6iUjFVAE1ITvGFSSBXnu8RouMK5VPB6ocrPvLIEDFVW+P5g1Ht5O4/X5IQV76m
	SrYLQ5Lnd6rVW2QkXO6KHbM5zV4cBiZZSEYWVyITAwUQ0X11B0HruRwmfxEa0b1idKIvngbEBmdAl
	Y47g8jIVR1Z99t48iSWY617n4dPEXr2zPUDMPL+zLf6LkQhGGspiNS/kXwUky1dkq9qlrnsqRpm84
	r4OS4BbikN5Uk8jluMISkX+mUELGedDJ2ZTz1zhqt5j57dY4ND6NqAJEBVYpYjFPamfwm1VvKaK29
	FclFthKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXB8m-0000000AB3a-1htc;
	Thu, 03 Jul 2025 04:01:40 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXAxx-0000000A9bh-26Ge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 03:50:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7BzgCyI2CLfsE/U9erLkjg3r+FdzHHiFxUJe4xqK8f7fspuW4UavoenVFq1LrSsErj+dyD/B9cN8d+0C4Ax/lnET8VahVzsX/E3Nn6SkgMcqT2W3YTqBEn+4ZG3CZTKtV4w7Z2SEUkOisNco6xzseGiiPAusjutnTPuc2pfmrljAQqR0/fZUcDH5OG5vDNoi4VK9G9m5h2UA5Owenm6KlNPKp39IOU7uD0KccrU3PBoEurr6uJ1Wsyy/16Ufon2HEwZrNZ8ehtTp5/LPYy2wsHGsGkFT4u/LLRSYYbBc4Iso8nNG4hffmHxcMqjF0+qx5ZsJ/hn1LbuUzN2V1vjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJWXmvXquMGFQE2Q6fUTgSs/lH/RQDu/uep1DvLrt2I=;
 b=ffkRfL8cYs+vMbDAI843EHRlfv3Fj3/OKqA0i/imfqebTgb2t4Bg413BUlm08yXpcAm2q6vVPvyRJmg9+CDPsB5ixNMV6rBORUDTi7UMrpBGfI6U0ZsPaEWldlFjvpVQHjgKXf2aWvF5fScSE4jMVP6DwfY5vVRTfWSCDpi/Pt634jSXU2eg/KHJ8e/TyBV7+RjobNIg14kBUezaN0iEuKIKpNlPFGpS1bL5vXBd+MOpHSIWD7/btUO8V4nUvqYA0UR9/eowR7yJhiJBynkNjcme7qXNwIYx8o/bFrADZT6X9xSHpZp8Reo7iZgD8w22TfeyCOEmluBc7iAElEiE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJWXmvXquMGFQE2Q6fUTgSs/lH/RQDu/uep1DvLrt2I=;
 b=u18wIpQzq2ALKw4lXRW3rLhoGR4jgUo5SVA8bE/w+2rwW9L7Uh8pc9WNtqwTut8lQiciP6hJ0uK0aamgx4jgQo7CBXu5Jm19eembcWeUjju2UJZjbLR0qJE6LQeydY7cUymx8BNuGo6XgXwULrfMiT4H7vw4Ar+87hQc/wjLL23Z4Flw44DnWboCNutSNV8JqHElbXuLWh0yI8fbESJuNNwgsh30eqall8qcnqjRDELdLIZHiHqE99f3IYHC8b8MkWCJU+3bv0GMNJFMqxexKeDa4xcJyO2oSb4GCpXINafFPC8rDJ3LIxh8W6bZvjd5ik4nRhRPlMSB86qGFryAHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11188.eurprd04.prod.outlook.com (2603:10a6:10:5b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 03:50:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:50:23 +0000
Date: Thu, 3 Jul 2025 13:01:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <20250703050103.GC18168@nxa18884-linux>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU7PR04MB11188:EE_
X-MS-Office365-Filtering-Correlation-Id: 92150d6b-b969-4845-5f42-08ddb9e4bd16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tyhk4hEDfTcMv6hFeWKWX6r/0/nvvDIJTPicNyh46GwzFoMPAy0DT/aIMmZ4?=
 =?us-ascii?Q?f0K/sxd17DQzzzx5gqiq23A9Q377IP0EYe9dWyuKwf12gNcWN1Ac9kNdoZsb?=
 =?us-ascii?Q?zLxp0Dzrz7i4/A5A/lqYMgJI3wjWr9HXn5lqcVcBgVNSmmIMTy1WwL9EOTVu?=
 =?us-ascii?Q?dFhuxDnFoDHkQDt3Hj0gB+lg7IVT/2y8P7lJ1YlyFUZp2jPDhs4CUOljs5FO?=
 =?us-ascii?Q?POK71sXKrN51RbPJXnGVqe5NcsmYyVAlcpWfQT/eRbo0i7qjj6UjPEiGzbTj?=
 =?us-ascii?Q?DLUwj4cHKTAW2GDZY2OeBh9OBlsbq9wOMfF/C4PjwekXoFcgPmSJCGtlm22g?=
 =?us-ascii?Q?IErIOQV+m6DQebcKKm9j9NBfBVLBtMH1kYUpMPMGABPa1w0jfnCY6O6mKXtO?=
 =?us-ascii?Q?aJhws8VmZ1cAbn8CwyjGMVhHuxDi0898Ey5FtirHjloDJ5+1GgtLxnIpJIFh?=
 =?us-ascii?Q?GKrAVx0k+TY3tXNz6fioKdGZoVH2lH7UG0ZQqH0cZ4j7Q7O+OcJpzLb8D61t?=
 =?us-ascii?Q?Rs1oyATdJxYdfX+id0dFIcZkAU9IOELYpZtci89Azij/AoZYD5Oqr93qPtaY?=
 =?us-ascii?Q?yi53toxIFXgwkL5fojdK6n0A8b2OGewTeN0XpeuEaH6YOCk5mMrksuPpQo6N?=
 =?us-ascii?Q?gNFzMn4E6DMX9c90Pdba/f9GWIxKihsrDewhBrVzZR0RVsufa7vbWvr0y+I3?=
 =?us-ascii?Q?UVEOx/gFa/gRef+OYsKrpeDMTpu+xnK6cv1AiN5J0SNeUJJVayGFnPNIYDzR?=
 =?us-ascii?Q?mqu8uBxuShv6IlqZcSdjzdbdRfh30kfQtp7aEpEH7gA92eOGtEsTinBplhqS?=
 =?us-ascii?Q?AVe3cKGOyLqVuobyc8JB2btRY4SNWgm8yFqeMsKDJ/lfgnkYAO7Ei4dY2Wac?=
 =?us-ascii?Q?TKqzV+Veg3NMMadgNvDQX+XEQviIlPhtcjUMNiHnI8azQckoKTSvn7dUCN/q?=
 =?us-ascii?Q?mCjbpmxCeSzDX8UdOvhrkgONGCGH/xgLuGdonrcD33pKk92YL3qaeAOvt3JI?=
 =?us-ascii?Q?DQf5WwVSaXDutzRvj6E50cr3CU5hULdHmvDXcZOJgrLZLKay1pJO5kuLjGQo?=
 =?us-ascii?Q?OCADGtQe6QGe7/y4jpv+UrrkSO8wqw8Fo2PRblGlFDvkAT6xWa9PiWMEPUNh?=
 =?us-ascii?Q?KtBsLjU7a4e+U+JTqm00GWwVpD4DCs/gIuu5QPA8+JjMgTpMhKo2bcn9DUoC?=
 =?us-ascii?Q?5MlPh/RnZQxYYkzeKC+t7cDQHtKPCEPKhWFjnNr1IffWiYEv6UkNP9fytJrv?=
 =?us-ascii?Q?O47KP/qqaWe7Y18LcG3f/yVTaSQlJaeTTBsf2cE75VhrfDjCzJa+mpQvVDtV?=
 =?us-ascii?Q?djYhjuM1TLsW++3fgNNvcf8WnqpCO4ceUvnuB8bObVbQsCbsQXSbBPTEUqo4?=
 =?us-ascii?Q?CW6TMMbqdEnvdEFN/CUXnyexJDclrpK7MyaWiiOF64nGy+MJaPfqPXQgjvwY?=
 =?us-ascii?Q?esKYjwqvi1LRCf4ZR1hpdvPLoDhHLubgBnqjHJFfWsm6ZJAET8TBVs4KQWxt?=
 =?us-ascii?Q?5VY+YetcbBohdqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?InQpkGi8ls3NV80FFzkhMomEOkn4jXJErbwka7j3do7zokEO272WVqmIf+Ee?=
 =?us-ascii?Q?vqIm54o6J6bq/AaHQ8J32Sv6uQX5FgtsgO/TKb72uq0D9iEtooqWBYa2OR8c?=
 =?us-ascii?Q?uF+BCRpQLfbxFcQTHBTyW2u4oIgZI6swa+M9Vly490S7NiHsR3TN8tC5vIXh?=
 =?us-ascii?Q?Jffl03Q1TIkRvJmcFUX6DJKyiU6A96HR6QvuiillztoxWX27cCNTSBvIZXdn?=
 =?us-ascii?Q?DEnmbeY59dd4OkTrTAQ0bg5hUMFI2k1ekGC9cn3rpY0COOlz5R4hpehFEaZ4?=
 =?us-ascii?Q?pCbWUrNdrH/SY/6/8fCrl3OWSADF0bHv8/doTtI4xLLLnkIzSKPvhS2b3Gua?=
 =?us-ascii?Q?tvRG8Appki6Dps4Ild98QEj8fkhvUDtI8xJJRqm16JgcluouTZSbYfxeH36X?=
 =?us-ascii?Q?X+qNZ4iZ/XE6AgyDLzMrreTvWsYbuvw0wf9G/MUA5WOFXH+L2RNJ0cajKo3Z?=
 =?us-ascii?Q?eo6O3201H5Hj06Igmi5XrRfNjHJ/NdQB2xst16LgTumvS5UKoxjKIerqQ5Bb?=
 =?us-ascii?Q?XhHCeKGXHWrjCgDg7eY2YYkpx8VJ74TQATImdMhrl3W94mpNMCB0Chu36Flk?=
 =?us-ascii?Q?vrLOeZ9eBijMNv1OhdAjl9nvNQ2+X1OjxnzwRcLRqqRmo4eB+huJ12GoqSgK?=
 =?us-ascii?Q?xu3jTfw5c+cK90DYWz+lbaErgIkEJkOON1fol9MmP4tihom4Bs/Mt82+kU0n?=
 =?us-ascii?Q?WgCGBVZ7ZDS8rKslx81fDFaRQzXzRsrnhBXulsCt5grQgyYdwsXui5ZYVjda?=
 =?us-ascii?Q?JbnuRBtz1Z8qnd/S3TMkXrYavdlu6Q603kg4kZXu1iW0tOG6Y+qi5/ZUMQE7?=
 =?us-ascii?Q?iWGVH2TKspU9bgwGMfsX1BqKw5bItzJtK9VDzlTnR8/S/wyda8Bq3lYq2bOt?=
 =?us-ascii?Q?ggfGleej4X/PVcf96I2mYtU7cktgs2IQBnVg3q7A+iGEoBSENdWIp9I0H9Zn?=
 =?us-ascii?Q?l+qgvaVNX1zv748kKOy7Jp/aC3X7PqDR2HPGRGTVcqOWyfOkW1m1aR0efS2E?=
 =?us-ascii?Q?rXoebP9hMFR7lCLWs6owP/o2pX47JylPD0oTZwFhlErW92g9Q18heboUa6Sf?=
 =?us-ascii?Q?xwcupD/mPPKmWllUACJtrDVu/dzKJ9EyWmmjqqOxNbv/5xvkuO8aaahK8Wq+?=
 =?us-ascii?Q?Go89fA7hnKCx4kvlU58T3ZPLzMHetolnB+pvXyF0TilIgG2vM0HEw7x1V8Vh?=
 =?us-ascii?Q?FVkXHETzKD6+6qwiawMrktOHYcToU2CHEbeU/BdWYtR/HPUQI6aZSSFi3jHI?=
 =?us-ascii?Q?Jd8MmUp+CR42bSC7Xw0H8wOeSd/PILmYHUCwVmlg1n1oIZP1VoOk0n6njMuo?=
 =?us-ascii?Q?dqI0nmtulX1wsVyncyuv8IssI3e/Yk0B3moB9XTsjZcWoHHcYOoc5I3fOzlG?=
 =?us-ascii?Q?9TM9VXKENRgnzDBCu2VRydjVaFx5v/KM1rJir5qZORvfvTgExMFgRMZwai8d?=
 =?us-ascii?Q?dIgjTUQg2wGJbALeSiW2bz0lsrb4r4UigJ3f9521v7QL7V83lfPEXMk82xKC?=
 =?us-ascii?Q?+lAHMsdNUDzEeukaWg0YMXlC6D+J8mgcISdTgwbfi0M4+NFlJ/82JAZp2YLW?=
 =?us-ascii?Q?e7pBi/29kxmkwC2WEPVnWuzl9+nKvT75o4PwYJp7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92150d6b-b969-4845-5f42-08ddb9e4bd16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:50:23.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4ywpV1o1ZcFSwb7XEo6k33mqgv/u9vhTM7t+WEZbphjZrQKd75ICd4fF8zyshs81FDVj8dck4CjhYNFcaTzMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_205029_553740_DCE41FB7 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Mathieu,

On Wed, Jun 25, 2025 at 10:23:26AM +0800, Peng Fan (OSS) wrote:
>i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>---
>Peng Fan (5):
>      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>      remoteproc: imx_rproc: Add support for System Manager API
>      remoteproc: imx_rproc: Add support for i.MX95
>      arm64: dts: imx95: Add SCMI LMM/CPU nodes
>      arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev related memory regions

Except patch 5 with a small comment, other patches have got R-b.
Would you give a look on the patch 1-3?

Thanks,
Peng

>
> .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  45 +++++++
> arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
> drivers/remoteproc/imx_rproc.c                     | 138 ++++++++++++++++++++-
> drivers/remoteproc/imx_rproc.h                     |   5 +
> 5 files changed, 195 insertions(+), 2 deletions(-)
>---
>base-commit: fda740558acb4303fcf377e5cf9139f795b1d85b
>change-id: 20250525-imx95-rproc-1-20bb74ddc8af
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>

