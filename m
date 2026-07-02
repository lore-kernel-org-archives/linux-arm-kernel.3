Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF02C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kcc7JmCArazoWT+M7xiMOM9LpDbgZOGSbaEZExtzbU=; b=xT3UiCBsizVN5yElOOo023IRx1
	rC3K9+tm5rZ0rK92h9c2mkKIXPLAEJjFC/Kvb+HHQi4IfLI9G1qJ/h7aRY3cKItC8TqeXB8LE3uex
	ICjW5FvVwgMfJZ+pV0dphaiN1Qvj84DwohAnYGatlVXj5ou+x1Ns+xohor8Tq3l3R9kFd4IUEdhsn
	oqLGNFIKIgHubq1xy5AFjL9MhQ8dHUZ6AQasz9Dqw7NQ1hkV1EruI2noIO7fAE/ivaU2HtWTjss8V
	d7OlJjDJwYQARiHGp06Apvr2XEjofvPV4Vn69IRzmj4vlYZZFuyOyAvfoPRit6zDKiUgfU6hFJgy9
	LVb3HC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLsg-00000005DmZ-0JMp;
	Thu, 02 Jul 2026 18:11:22 +0000
Received: from mail-francecentralazon11013059.outbound.protection.outlook.com ([40.107.162.59] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLsc-00000005Dlk-3BYq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 18:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcFO/8x/Oj8NHYiuHNkVYv4eP9etbrOjxv4La1/tLCHonpkM2vyXfvYq7nT0pqbeOjAgLjpyNdSyA9M/TQhoF6zQEYJ8Wkzc5TeGzbs70XbGDdR3X0SXYRYdpETD3GCUYgWHCLCmHe6NcBQswxY2JPRu9KGlrU+s4VjOKuEtWx/7+4cTaSroAiWrZFpkWjDZRJIzcihE27aFggn/2l9zwGlDW9Wr0DPbbsgOQWWjVwfJWWavsAkqxbiJNJFOBGUmtHxNq0NQDCK1RXyXSR9fWaxFiFSZ8EPF7DONB3cDmGe3jaNHwf9wHSrccLBBH4cv4SDJo1xfY32c8y2NWSXhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kcc7JmCArazoWT+M7xiMOM9LpDbgZOGSbaEZExtzbU=;
 b=VI3GwquH7JzCbyn5kc2uKJ2SQgtdbNWp9TXIWYMVpGSCt1TeFCM9O6PmcdlhTEedQ9HOktLZHVNazwtioUPVCXVGu4xzGp2XaCz4F/TLy+ttTNEoHNqYCnWztR/LdYTO6Ve9ygbp6mFNf3/GtGS6WodZlhCF+0hJqIUC3ktwP0idkUQukmgMR9pkRwN6t60OCQPEx4Kyfg7/xX4wLPRuAtXN6ME8vyalSYziqPJrOXiEjnulV3oeoLiIcVTARUq4RB41ayD1sNtaBjwXzmJty5EXE6JvAlUJYyisvncKVno854Rgfif44hpJjhKa2P1df97XOlqKAGR+joCebKA1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kcc7JmCArazoWT+M7xiMOM9LpDbgZOGSbaEZExtzbU=;
 b=dcLJNoUq1C3tDDQMtBuvZZCJps+y/wvzBK5JJu2Tiue4WZ3YVKtgFQ6Zh6ZOOPLtD5LwIYOjqmmoAFHQi/2Ko3qZsvWbLp/+xwGFOedgd2n+grPnnKi6wGQbl4wcEouGEK7ZU1/a+s2RtwpB2hRwo/LnxKr0xN1Fan+XwteBqOVgx5NDbZ+95ECxopmfyjvyrjOmrdkprR3bWoqWDZjtwhKByYkA2RLaZhXVIJ4f9WQuC7W//rwxtLxk7dvayg7mme2FgeblPOU0bjEllXJkmgJoxzooz02csDgVyky+0DiAxHNJuyVcxQCizyUBo8PLQL9xl/Ty7COCN3kley6D1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 18:11:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 18:11:13 +0000
Date: Thu, 2 Jul 2026 13:11:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Message-ID: <akapt6v_DBJSAnj0@SMW015318>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
 <20260702161519.GI3534761@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702161519.GI3534761@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: dfeb13fb-0f1b-4446-b86c-08ded8654d2e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|19092799006|376014|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vvAmrEg+799HzW8zXxFXjqnKFp+T/acahTlGDXa48r8lXV8a2cgspSZHtQhblpXIH+2P8b963uIy4Fom4mJNzbG6Oc/kO4nyjus/Fq7EprI/ZOh0JImdjehyzolOS90r9J1ZxRBEeobqSxHqvdSTrxix8NE/wxvoFldNM4NL5Ahc+OkNcIGKOz+L1cMClZdpFMY0R66JMOiG5WlzuNuB0l1ewSuzECNHiw4GrSYV/Fy8Xo1nk4BS6zg42luuyai3CUjyd+RNVlAqKNNSXwwl7qSvACYSkAGKq3Ll6c0fqZwN2XvlhFVGvyrxZu4Q1PZ7fNvaKrCVRNagz/O5vG4DdOr/93WTjRklardQkRVVXaKqCnZQhJwBmke0aFBu4YGaKEOOC0UfCQ2TMufLZ0le8FPJqDG8lhyUNp4StTBfPcJJc5YDQT9vzv+pPOQj0tvYoQtSWL4j+qtdMfQhXt93sgL6eKvDCXIZ6tLvrt6jxmCnuvqAzGTR3nGPvhhA1Pesxx5r7QPBTt3eng9ecboKVPf508+flZGWC8H9djFMl3E/LMiI5iKMz/SOkFeAdmKMCR5znhnMFt98J1Taz6srjAPcjOWz9xHYPSQB2mFQz9wWRLpBc2V8jOIthCFMNFo2OE708m2GtBk9ysF8f+ZEHDrQ6BflgkL2Y+cDVVYZme4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(19092799006)(376014)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4MCu/T6Wdvng5+hfgKLBq1TzQQh67vXK/jw2VQgo2NG+m2iYWXiJJ+h6Y3Wg?=
 =?us-ascii?Q?vqJLVqfRh8A2sotFau3CKRz4WCcE96VYlFC8xZ80E/FF74VowJ3wZ0fLWEmE?=
 =?us-ascii?Q?W++oeVrx+Y9tZCrma1lVgu4mPQlKFpQW1noC8/DtpYt7nsI6KUvgJuQL3koF?=
 =?us-ascii?Q?nAu/XBT4dZt9mazhFxpznuTUIQwkPGHZoASUqg8jGwvWrcZdPhgopRuXcu64?=
 =?us-ascii?Q?ZpGAaCtASvgRKHQuYZ3reoo5TcDuONHxKsMa7kGOIZPTCeziUjQZAmSgAsnk?=
 =?us-ascii?Q?mLwMW+KWfoDqeVcnN0w3ZGsC5a86MAY9SY7H6mBQeChxQuIZxfHz+6Q7eUgO?=
 =?us-ascii?Q?DYaGcc35WT4Q0TCFjueUsxqj5C0FhkZGBo5f3e2rb79fW6bSSAqw08Mt2PsM?=
 =?us-ascii?Q?9Lcf8gKupVWzQOWyOoSiByGCRgCSdASUBCMRcPP6rTxyun4AkjrMrE53RqE9?=
 =?us-ascii?Q?lxXjRrAXMYJVh3zz35woVaXnCAs07SwD/MXKuqTqkXaAnBDb1ancnEVoihoY?=
 =?us-ascii?Q?RN2n4whoozvAMNJ70LFZsk8bbgZBq0aG6nbFxhXdeS3Rgnw3f1b1yxt/qHDR?=
 =?us-ascii?Q?SEsTcg2V/8L+J4Q98g5GdwN2H+Kr9fMVepMIIcwr3o+BRShBASgW5pHGmMdc?=
 =?us-ascii?Q?DFbRdwCQEXtGRRCStT6qm9hW+fJjXykvo3zkabF8FQECUgejm08JzyfMOAWX?=
 =?us-ascii?Q?s1wmtvGHwzjZv3+eBNbOTQP+mFcJ6Pf7+kQmJQFW1N9NQyurCjIceg17uqpd?=
 =?us-ascii?Q?mr4lmI3RWSbiPVMfuKQ5sytekqN+a8tWhk9YbU+HL6YbaEe4LN+jZpjK+e/W?=
 =?us-ascii?Q?AYpMUg7eD3vDL8UF66eROhE5v3k4dkY5eZPRHrz0DnbAqEJ4FqKZMTUPoiT4?=
 =?us-ascii?Q?cr5Eq/9eyla9yMKMfX7hxPJs3fVdzU3LnWOTvtue+XuxF0x+A67tMx0QLZII?=
 =?us-ascii?Q?38fw4uCHf7HYzwfWqbtnS8BpBudWYT5aHPafKOiGyzqJ6wAN3lyd71XOQr2N?=
 =?us-ascii?Q?rEpsbKNXsgp+GnJNbhaTd7qvkaKt5ezkdE83zr8JGFmbtalCfU/PNfer8W5i?=
 =?us-ascii?Q?R2Y10FC2p7Ybgz2S4M/fOWQ57njMMK4If/gIu5f6dzbVNe7LCPUh2J1wFlfn?=
 =?us-ascii?Q?ntk8uNL/PxKbch352P4mAdM91AJwCVBZC+AinRghGoPOQJCxrqRkHdEbriaY?=
 =?us-ascii?Q?QwiIaGD58Peapep1L+/tiOf4BflTRWPBdwj+i4lsj87rgygjGamQ+TymYBv+?=
 =?us-ascii?Q?7OTR2RLWkBfYgo022EdyQ7GadBt2MBmstQSoC8N8vLcVF85ZdtLUyjjigRSG?=
 =?us-ascii?Q?u+QxABGt18YBuhMSeYAZi2fQ2lEwGFEd1YZqQ9oPYDiWpwaXD6sMAOwNws+v?=
 =?us-ascii?Q?iS25EraQBP2SGGyBpGON5ZHWM9s/P/v4V728jrkITXCgMtmSjNxAfaa0PCT4?=
 =?us-ascii?Q?DzzL00PqvtiLdEJGI5qrvfDKrixWA6CPg4XjGzf2oOhyQVlwrydBPucWSBOR?=
 =?us-ascii?Q?0UC7K2fbccw8gKyMNw7C4K5imqNyPL7SEKuFYkkD+rt1OY52jKBN//iLSMCR?=
 =?us-ascii?Q?5+2317h9L2zTGVA5A7hFwOTFa1KEb6jqHWd40OZirwOGMi3Skc1zyd5OO+4C?=
 =?us-ascii?Q?8vFjkXmUNtab5HFZ1g96EvbwSMgWRdLfLNVAi5YSLnRMH6dsgpMdMmzYnw9X?=
 =?us-ascii?Q?8EzTT/aL4x8N9GsCJ1JEAdgU3f/0hH7dCaIDVjg+k971gKjdn7ce6FKltbZc?=
 =?us-ascii?Q?L6TPEoA9cA+VF7weu8ww1XMBuMANgDK8O36ADkVRsOvcWKXfZilg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfeb13fb-0f1b-4446-b86c-08ded8654d2e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 18:11:13.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNm85SBzc8w7TgpxYkuW8vtn1tARL5/irmTg6C3Tx9eLIxzOecqm/1mb5a178al5aZs5596QJMgCX8mvlwxyPhdYVs651s0IfxXM4YDFKXT4T7U2xZ+oj5lKGWP/MGLV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111118_806887_6B7B3E27 
X-CRM114-Status: GOOD (  10.36  )
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

On Thu, Jul 02, 2026 at 07:15:19PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Have you missed the comment in v6 ?
>
> https://lore.kernel.org/all/20260629084654.GB3054459@killaraus.ideasonboard.com/

Sorry, I forget emphased it in change log.

"For the reason stated by Sakari in patch 1/9 (dependency from MC to
V4L2), I don't think a "media_async_register_subdev()" function is a
good idea."

The reason already NOT existed in v7, I removed v4l2_fwnode_endpoint from
media_pad. So MC will not depdent to V4L2.

So this comments is not suit for this version.

Frank

