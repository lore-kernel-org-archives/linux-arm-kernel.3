Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA95CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M9/50AxjWW+7CLcPCoMosiwElEOVGNmhXVTf0J2QzU=; b=A/UyF08fIHAgVQjAsWIhtbleOU
	E2DNL/u8UJzcNlSdEXGm417OCGKGQCtiKXF2V5+6E4i8liCKj/OGH5GC0s7gZ/g1ljqjNmKE1M61r
	xW165hg9Pcz13Hh/zyO8c2WpHrUmPIkUpYvpxfFqfmWvD2Q04hWwgRHJEmIhdqS6x4Ngo0Wll9XtO
	Moy+lf7Gf4GKbkY8rip+CJSqVD2a4H3v2VF3pV+OOG9ssFwCxmSR6xDxtR/zlebjWCmC3LbSeh6Vk
	27cNKtyvpDden0P0uQx7AyVPdRtkb20yLLp8SZZzEXZfTR/u/uN0nAJkZ+FI6yYTxN8jrbPuAOyUC
	Lt8blErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKVP-0000000EIBj-05tm;
	Wed, 10 Sep 2025 13:04:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKVN-0000000EIAE-0jHX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIcMCxU5LfJoEPvPrWe4UPJDlqqxhYP36OsaiXaMocAheQdUg+v8PXuGWNqSCaUrkEpaIHx0R20Zrxh5de+vz5hFwr5xiUh0m0WU+833QPaH5grc9sOgFeQKaA06FnlRRWl6rdgtHVBbSlyZR3ZrV9Vfuyc1XkVL/0TlRfokMho0Tmae7sxN1KtAMQj5eujRq/9SoIwDwdcb8MJC0gMiga8XzzXhNTjePtIk0UInMrw+mY7FISQRSpqLw83EIBQbe0VGVRaoLnE6VPRpKhL0phlLcywojIIjbBmgMvkmnRuqr7PxLxdIqBQtXLO0ehJcxfpK3iMw7JDEjXJAuZAsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M9/50AxjWW+7CLcPCoMosiwElEOVGNmhXVTf0J2QzU=;
 b=f9j9g1PvAefSA/ascleDivO0YQRYJT1h5QcLq8e8r4QdJBPwmXFfCCXvVPHSWnQA9k/LBonAKMmCodbesz3G3Wk54itDWbhpI5jEE1ilnyWa0TYYnRdGaudsHQsbsHP4wY/0fc03XdvD3TFZpZ98Qj9qm9vFHFIMyFvhg4XyvFZIlfUJ8zwnNTK+q9d7olr2GkyxVBXX4KUFFFPkzOEXdRKedkTozKq8VuPhGJLAFKhbqW0sY2eCPQ+4JJYjtXUqmY8n6JLCAlxcBF0CU8+s3543CWHE04wo21MbRkNcMHxAa+V7onD25FbrCSHY41q0Qi5oBEuxUy00mGrbSTupHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M9/50AxjWW+7CLcPCoMosiwElEOVGNmhXVTf0J2QzU=;
 b=mGEcBX4yvFgkZvIoY3TI9e2fyQsdtrQ/e3fYvi0BWNpQ8zWSatlY3hnBCHwg1qhajvZ1H49usyeyTMOAHSFa4CsHwmOVPvK7kk9u5fy7uoJ+WgHcArpVMrmHXUwRYt4BusMok99d0AoeeTlt3SZGeuAE1a7diHcL4LlwdAZYWF/7er0q1zcLH+FRqJOnbOcB+LUk+GYIfM/HDqrjsXq1rq/hMTwtjnM0/Uod1sHgMPoSVEV3AmPZOxTJQyjUeRjDGKqcN11xIPrk3Wc2CgucSBQtXA7To0QWFNEL3iQA35acZyefo35VsIEmWsz5aAfP5+n+2agvRFr5RxRRy+wv9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8569.eurprd04.prod.outlook.com (2603:10a6:20b:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 13:04:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 13:04:48 +0000
Date: Wed, 10 Sep 2025 22:16:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] regulator: sy7636a: add gpios and input regulator
Message-ID: <20250910141614.GA29628@nxa18884-linux.ap.freescale.net>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
 <20250909-sy7636-rsrc-v2-2-cfd9f44fd259@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-sy7636-rsrc-v2-2-cfd9f44fd259@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 20629dc5-cacd-4aca-2158-08ddf06a9f0d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VytlR5b+KAAX5cSHR5gwHcSuFPagT1QtkA4v9qtAKS86xP9KMtX9+2vEONnz?=
 =?us-ascii?Q?CKGYgC3u2JDybq/AW1B+T3fjYcpVa78j0RM8kbI7DlrcBkU0XpLmSjGsBUaK?=
 =?us-ascii?Q?lVmdyutyq3W2ObomSJYhQg0NocJi8xCCu4ZkLEpbU4YMYuBuAbnMQreweuf6?=
 =?us-ascii?Q?NAJDcXcLe+4fg5x4Lsb9yV77yjJvm44N8cntTwI6nLeeuS7UO8vouQh2n9Tb?=
 =?us-ascii?Q?NwkEvIocRSV3YO6Gpaix5g7YTmTeaYOhYR5FG+zxTKfKOJG49LuS03PyUgJ3?=
 =?us-ascii?Q?YMZwyNfnmCQS/kJGOzrI6d8xVopD3LzPQqq14PakRgsDWmwrCrOAsiPJAEw8?=
 =?us-ascii?Q?54Qq9lNP0IO7ZSWFVE2GTUDP43h76jJSD+m/R1VGIY0fUzs2WMq8Y/HX0EgD?=
 =?us-ascii?Q?RLWvi0KYQBJX8VN/4aBa4W27hR6W4ztCruUKyqtN9DqH8rr9UK+YfHMYWVWw?=
 =?us-ascii?Q?oPw9wSLBkT6uPtQabvzY0mgZLy7pvSf69FuvjNmcouTbYvV+ZW4TggYmn+wk?=
 =?us-ascii?Q?jS61lxIEvaFa/5dw+XOtgsXNeQpBCzM0upT9aGNX92Ml7nXtwvoyp4KVMNCl?=
 =?us-ascii?Q?bcLihIsrAsjyulR03dwj+afkU+6ij3lHtpMI4fFPSFsnnTlHdmlIKbMtSeaA?=
 =?us-ascii?Q?AlcJvrkKcvJ0W7E7umVRf+wY/Rx1TIMS4Iw1Gq7fvP3KPSwktujNUfVoFAYf?=
 =?us-ascii?Q?0XZfmToy0WPZJsMro1T2noDhnxdHeKh6O4rHrUrZ7G/MjNb9SZ13+9DRY/OO?=
 =?us-ascii?Q?1AtNM/RUB0CYdnRitBC0vbL6MhMqRdE8wVCWKPOJVDkdord54FxLVesSzfFb?=
 =?us-ascii?Q?fA7e3nVAjPO/a6Gd9QDmHCzYENqLprupHK9zIaq0obmdB3ZJFPBkFkhii2W3?=
 =?us-ascii?Q?b8OrrqK9RlZaVFP5UdhYFskjRM1dimj7iZXyCgPHK/H1IMDQAf557MjqsHBR?=
 =?us-ascii?Q?fiFhBGShKf7TR80deVFArPY4QS4scYRnXimhCEU9pTkQ+BWQWWiXIy4+bfjF?=
 =?us-ascii?Q?gKFhCwD49uNRLnUA/CLWRZBsWHc6aitRnYof+4ap5nez9VqMDg8q4Bp9MSG/?=
 =?us-ascii?Q?MQCHJ7scG1rwRyFQjR0+s2smFqZxx7ot9i40TlYQV0cWTLFYtum3y+illCvm?=
 =?us-ascii?Q?xqcfl+nAnUiG+LBAoNitmjC7Y+sk+fK9EUqP2EW+RlRvSbiEKD6vUhpW109X?=
 =?us-ascii?Q?LS+jpMhyCMx5smfcad3ABRDWVohL7togdODWu9/8OFrm244qkqvK6x9kO+6Z?=
 =?us-ascii?Q?Cm7SebGfx+rE/fOOtcNgppRroghroitMpUnSXPi9Z/1uiVRK2ypDjijozUMI?=
 =?us-ascii?Q?h3vVGHvc0tyHB/WSgarWX9wWLlEq1GO+07mXc6eAV5kzk4pr2TFjk3Jx2wPD?=
 =?us-ascii?Q?sixNSNVlRgi/+CTKlvakvZlfPQBU4p0kSCF+jF8y44OSeELjessyo/N1c+kv?=
 =?us-ascii?Q?18rn0XJAqKPM2ct/jvD+n0octuC96iNYZI9uzN5SPMExAIZ+ZM4cZAv9eCan?=
 =?us-ascii?Q?wwl8mQLOiuezIL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEK3X+GyBmEDzhS4YJnNk0XMlpVRQGbkd+YDTl72Po2dwuIZZ6z0l+yyAYh6?=
 =?us-ascii?Q?H7/aSrBlXwi39LnOE+gXsvbvO3kENPPaqff+LmoJqxLrmyqceqql8WwD4jp+?=
 =?us-ascii?Q?6eIqd/DlvNpJoxq+ePp21zukzIyCqJjsi3WPbtk6mq2ffAddD3dOlFadMVCu?=
 =?us-ascii?Q?6OV3aTVpdMKqbDKydEICQbgnuZGgT6+HLIR19mY2TEYQfWSidmeKaN2WFnJq?=
 =?us-ascii?Q?FwA0nIFqT1YkK3cbGJcavW8Bap1IY6UuTt03xk4Ga8Ud70Hg+37tx2aQ36u7?=
 =?us-ascii?Q?b081AJXMCzBjmeyDDxVwh/vNPRD5XT/P1X6Gan2vc3oxevti4i34JsdO7hEq?=
 =?us-ascii?Q?v62WnT96zwMCrPHxmcKN5102uEEmtr/ELLnT4O8iX1uzBfsnxi1Ha+4byTwV?=
 =?us-ascii?Q?PmEqewRTLoACJ7ahUk8pW5pdvJh04uMpXIZBF/7Y4wPEthRkBKxlfHwgEAgb?=
 =?us-ascii?Q?9Upb35SGGiYYoPPAfcyuN7GzhVHFtCwVz9NwK6oerW6QARptolMVty3LSJY8?=
 =?us-ascii?Q?83R1JS0vQTnmA4nACVghBDsioE356r7cAL4SCFvwNXipBdctnBtkj49b7VHi?=
 =?us-ascii?Q?Y/3Dtnp+gr1UACF0t2BAfNpFaGuEcQc073WKUY6PKrhnFVb/is7yCn6aiNDJ?=
 =?us-ascii?Q?2RdJTffU2+7oGEWIswdO/Wkb69XbOWlQagkzVPELzH6kTEKkLko3wVzvRr1N?=
 =?us-ascii?Q?cMcwMuyr7OBwvLIJP8/aAX0yI60Drs+234I5MTQ9LQ0gr2SHgZgNMvrY7rDR?=
 =?us-ascii?Q?49IXkXO0AQvt+Z4OcrjFIur/e+WYqaxrz1UgS2F5SO/dGb0TmKdItKjSNXx3?=
 =?us-ascii?Q?PMdC77e9A4JIwusrAaeR67S5XX14+1nqAnASmkqqiDmKmJ0Tj8VLoOv5rWjb?=
 =?us-ascii?Q?WyEJzcapaA58NWaHD1JH2eg8haS6Mv2jWZ24lr0rA+qeGV9A9yziqHICxuH9?=
 =?us-ascii?Q?1+mgBtFj9am2O4b9ZxuNtuE0jUn/OMlzixOb3u0SzgyQo75PmGMWVhq/40Y0?=
 =?us-ascii?Q?7j6+yxrkLuDVfoRBeA4bSh9U6+VPNv3yHlG0r77We5JW97gyfs58vrLN2pLk?=
 =?us-ascii?Q?U5I8SGgeTHB5dMFL69XDOcokQ0WtZygzIM14w6l3uLVfl5hsy/AlMSZNO22d?=
 =?us-ascii?Q?mjeInX4ebjXKUZ0OnJBWcsLWRBlZY/XFk0qPdbkumRGu+B3m9oY/6EDQup9q?=
 =?us-ascii?Q?5wAMSj3gSIp60zGUnl4DeDSAVkxJj+je6tT6gKNEcBl6L19yUQ1hc+dhUzLk?=
 =?us-ascii?Q?wHv0lLHsd1N/HyhpIXD/bvCdJqo9/Wt10se6U5QZN3A2hAsNMG7r7tlz1Ur5?=
 =?us-ascii?Q?Hr+icdTKEpbKMorQJGQXCpwj+YMwTgbKn5jy3Iavl4BoC3GJ19bSIJoC4vFM?=
 =?us-ascii?Q?wuvy7qdKbN3VMrf+xqZ292oqzrkR7avL0XRjGzct7d45u+EjneKJMr2mNNHt?=
 =?us-ascii?Q?gxcU5gtgFxx50IOuCkLXyRq9NbtiwRZvYI6So7IVRP4tYuoQeFpfxHe2j585?=
 =?us-ascii?Q?tYHQAEmge1aR3ga3Lzhrxx4mbw5OuZLeEkF0TQMX0PL+tJHdBFJlUq9i/yc3?=
 =?us-ascii?Q?gnY4GV/JZOkwZUHPI1Lo/LvRTbP67vXOHF59z3BI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20629dc5-cacd-4aca-2158-08ddf06a9f0d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:04:48.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSn2gTWBd0nxUE/816b9NLCDi/5MaIpECR1Kl5ilqQMzjLyz9uibtp8p6czwWMEhvJwc3tzFLGyuaDqsEARzWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_060457_214735_A5C010A0 
X-CRM114-Status: UNSURE (   8.40  )
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

On Tue, Sep 09, 2025 at 10:33:03PM +0200, Andreas Kemnade wrote:
>Initialize input regulator and gpios to proper values to have things
>basically working as well as in the case when these things are
>hardwired.
>
>Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

