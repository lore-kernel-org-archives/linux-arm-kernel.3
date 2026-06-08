Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7B7CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwprxnUMIrxRNPjCKPnHq5g1FIQKEuK1yafSQSMhNHQ=; b=G4Zv8ZfrrTwh/UWAaDLmzsKI3e
	GDCpbjvSsgUy27aUQAK39vArJTF6P3Rs1fd36vHPx8PwsFZoy4fk4x5e8aU+VA46hHdQFq4+roXqe
	AmRcXAGqPDhZQcu57Sh3u0x9z0uQu4oo/YsfyZcATD+kLBUmcGfyo+NW8YTfLF2ZqsY6nlnd/lvdG
	wskYUtHLwiTb+neodM5AZkX/NRZTYamYMv7LmeIq2qVBVc9w/4tpzv9M41XX93aU3rsOuxbrbNTjg
	mTZI8HRsSAJyWYX3cwxpODle5cMbE/BeP1pIGbINZgpGGn/91EmvYeGx81x0SZT0eBATe+RzcitYb
	mu6tFDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSnI-00000002r54-0okb;
	Mon, 08 Jun 2026 05:45:04 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSnF-00000002r4U-3Zfb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRruQtkC9HQwz5GfLjNIisFPZdNE75xsDVLUEywVzyVNpYbtLUnzB408nN/QZiO0OnzzEYERiPsRXFnL3u+FoH7MoCKNRuXis/xuUm8ZEMr/w6An1HbtMoE9oJ4r2FznwXwixWlUlIhDrqDWdBqOvVhNirM1KFPFxTfV9IjDRRT9NE7oY+7Lc0KwIWAsQiBsd8MAPBpOfhUxAz4ySQNFCRi0MOB405xtV9J0lj0ZX+BCVFF3LX6UZbIIR4I4/PCeOdm3oke2OO7vhYGKnpiXLsjw3AIrG/ObyPaIF/8cPMsRRICGUVbwTw5om0sGwoj8dD+ObDXwCeEjPto4AQ/PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwprxnUMIrxRNPjCKPnHq5g1FIQKEuK1yafSQSMhNHQ=;
 b=McJOt73KI9eaukHTVVk2qfmiM0BizU9lFAERU2dhCQOwq+bM+M4CH6J2SP8caC7MbRoZ8HLTqjezdU/yIPI/LMFsvsC/XX0I8dmTAAI1CdhNgAWi5ExURMXVi8YmruXqsEznfU7EvwmInFqxLBYnrK40bYaHMVnPu8s6AR1DYnMTV0yrPM/mQPOUEARQdWxO11WGpe8QtM2DL+0h2J2VPxqFirDkW278pgLLH4ndysrdnEWTf0KWGlGMLLd3NMB7KNs4sr9ZxBXfPhoPevLeQ3JYt1JGmtGBtZ2ldO5PK5qIqA+k/AidVfsWLQ/w/2pZsOxjdB7MLzBSyBKL2uMTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwprxnUMIrxRNPjCKPnHq5g1FIQKEuK1yafSQSMhNHQ=;
 b=THH7WRmWW3OL5H/OTQXJemHR/ah32naj9XvxWO/LCRubZuodyY9X1IkBNZKCtQQWNvRVPm96MkWv9zno3RJi8xFX/5nqCeEg/wfpILpuO6trgc3Wyq+d2n+I8tW6NaGwOI21RegCX9B+3YCepQOkI0GTXN6zmpAIH9zsR+ItPh3tQVRXCDJF3iw+1pkvZFrLmUpsatkpo9ytP9P73F0TLAWoapCj+o/GvzXs9li6e5cPVTVvEw0Js97PJJWQ7VtJ6WBLvA2broQ/9zigUltceKxnVTN8hAXX4bfLXL7IkifKNbNIHanGu+6TSnFNSUr02EXcuk7mBgof8oScycYRQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 05:44:56 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:44:56 +0000
Date: Mon, 8 Jun 2026 13:48:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox
 into the threaded handler
Message-ID: <aiZXknoEqeSsjCx/@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: MA5PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::11) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1407da2e-10bb-4d44-93d6-08dec521125d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|18002099003|22082099003|38350700014|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: tr1DHdHZsiX5bjJP64OvRgTEdNKsIruZOd+IV0uD7yJkH//eqa6Y9/vXxaz6TXtvESFDLyt0KPKIfcIkBSto/LUTeHHPx83IP3tClZdPg2llvq5d5Cp//PKdbaCUpXMMH9zdQsvrkDfq5XMagTzsfxri81XnrODgKZjD4m72L7PvP6gSySgzGxgFHi1JYCU++N9oYRLwsLH312uEFsBDBQKiE/7jwfWDZ6FeMzIg3lAWEHL2+JqqN9xT0UktQtGr4SFLWh/+USxnwltJE+S9Jip2Q/yPZB2VShSD448ZTMXdwSxW2xjD6ffkDiCq4hs63Kq1VMVLIoUUnDgOX9EFWx+ABcA38SS3czeklQHqw/kZc5WwGmJM7g+MOuGnDDd2QTzOeL+M+21SNc9wT1FLR7c7oDlmI5YvvA///XAcZdYNZA2r/RR6FqQg4wtkA/ccRuENJWu9vlX2lwEy6KOIisnQiwUhXoVRFu0QdgFANuYSmPsBDnIkDzzekluBhcp5bLIWB86T0nC7ZqhOaunFR6o22nK6JQvjvVKOvPL2eTEAULtn1Qa6/Fi9/eGkSEmr9KSLaloOD0sawm2OM/tM3LJfKPEebQ5n+cdoRcHL1rwFA0shuPx50hw7trVa+M6Xb3DMW0mSPOz4jmzz8abpn8L5kBOr+haOTSYOFfiRCuWeYs8VfLuMJGTw2bTKHOhrBY4lnBl3+z8AxYEG/xC5coeV+SVrK5PrrZD4dVFyrUb3I9J83FkflDXg3gCqHZOh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(18002099003)(22082099003)(38350700014)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KPGeNwKuT6ATMHXLmDPJ8OBHaHFjYAPBK/syMJGcBwLFHOyJlHFDZuWikfeO?=
 =?us-ascii?Q?MhAqdczenNnq/d/g0y6WVmib6Df+jfIPUHOxolf7PPQI2Dz+eZUBHkeVuCLw?=
 =?us-ascii?Q?dTbAQnplO/ZjSwJrcNQ9jruKHPWhF7+AYbqZImKEWfZ3nhqegMYg3oLyIIQ6?=
 =?us-ascii?Q?EwmwEEDyMfi7XypfGitY/Xfl3g9mhWKCELaSRNHqIuqQlicvUwjnG5eL3r9n?=
 =?us-ascii?Q?aCVgPwPqSXZ5yk2aK5isi2JoAjneTTvo8ZzhLKULtk9PHbeE1rMXnAUJDdJQ?=
 =?us-ascii?Q?/YPC7s1FNpZrec9aOWN0A/DLucOYiTVwOJepPugoy6mFf2+9XRGlHPnmKqpk?=
 =?us-ascii?Q?4eNxMgAGYrv208vVLK1tOMVykelm2scHXyrMEF6fCOPqW5V7oUzhNiC9uPsk?=
 =?us-ascii?Q?IlCXyFDtzKK4cmOxAyzn6I0MK1YnLNXOje9Nr139/FUnpiPuZ0BpaG6kdogw?=
 =?us-ascii?Q?5FQFeEzuANo6ziJKhaI3dKLDqqaf68bF5YvKnGY1rRf8J1eZXaoMkYrTL/9d?=
 =?us-ascii?Q?OKgf8fqEen7t/ieGK4/EnKT7+dUx5ZAOmq6mY7GF5BULrLPrV+U4niTmvu0I?=
 =?us-ascii?Q?6TOCcnX0DpR/90gzM/inA3ptN9mN7yug7Z1riA2S6iFM2WWEtfJYGa/ttxCz?=
 =?us-ascii?Q?s/7HriGX8qqod1nJflPuaN3tckVmDsV/IQafqihJZh6hzuVKmU2HpA665Zdu?=
 =?us-ascii?Q?zFCLnoaOiqOgYiCW6EmtVlJDV212FuACQkhIu9SoLqhnT8dx/Xv3H7XAZDSh?=
 =?us-ascii?Q?qbaDZRBpZmDuu2V2VVBnI2WUToeZqR3efplWkySif9WQmtIATYDvWy8rTsIt?=
 =?us-ascii?Q?S+4jF9JpgeWlAGEY/LtRHPyVg6d3EOxGeWUg5ZXbbXdeWSH1dzwn7bPy7MoR?=
 =?us-ascii?Q?8YY8BxePyWXl8f2mwj1rq9hNaRTLmIgoh2EdGGm/pllC+JvVtko7lb3X+oe1?=
 =?us-ascii?Q?Br7a3l/dN3OK+fg8RM/Yqf6W3R5+fRDbxpo6Jtf01e38aFBQJLp3HBSLwKSm?=
 =?us-ascii?Q?5dSwVL4lcJwdm/JAwzA7GbDUYtCLYNnbp7tnHvDcsq+m+v3uu+b61hRsFZHK?=
 =?us-ascii?Q?hU0v8BaHDjzWMe7GUIdSGhN+wNodteiP6AdP+1C6NPECzQzh/0OeVcQzPbuY?=
 =?us-ascii?Q?7WgrLfzaXmBCIQTAvffFyTgns5mTZ84MvSnlGQtDlfha+q6tya8BXYn79zol?=
 =?us-ascii?Q?xj927q+QI3QaaQEB66s83F0aFWsrKMTMG0RNQReFCQmeyhbSOhyQFAD7Usfs?=
 =?us-ascii?Q?45WJT6h8Xn3oLwdxhUTPrlBYmDGhzI4ahW+g+wQbAI6RmaK4/GTJSRd7NkXj?=
 =?us-ascii?Q?K2V3ntLL0QF0hpcQAtz+70yDTxZ6KO2nYg2DK74YHwbgorZyrIUJAg6zCDCv?=
 =?us-ascii?Q?X8s0A4EqI412metpVis5uVCgmnnxyu/QQGLdMyvKnH5/F5drk/6nhN5fCO/D?=
 =?us-ascii?Q?jkqcjuAkVgrKGrwXEQqo5ANW3DFN6ztLTDPeTplzxewQDf3w3i7KQkw8WsDM?=
 =?us-ascii?Q?20U+pwKGAzxUvTQDrdMVxNDtFVOjuuIwQUBlUpnOl1APhAW0ZRUTiXP4k0WO?=
 =?us-ascii?Q?QQAwvpBB+TC09wtugHyYTRozc0BMp4JFK4pAvscdLbqmL9yulXjLAQQuBeys?=
 =?us-ascii?Q?QryJ2SdiCcj2BMHaa1bKuMhX3r78Qh1kbHbJXYkZD7JRONXaICanAKtyqCGr?=
 =?us-ascii?Q?GrTaGR0PAOlZYTIg+fi1mjx9tojRdaAg6uxuYgCTPTkublQYWc05vdmWeFC+?=
 =?us-ascii?Q?Bej3TbsWZQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1407da2e-10bb-4d44-93d6-08dec521125d
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:44:56.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVLgHAG01xIUGM5Tc/KRNm2VjEOcRmEdMWke4D5ZqjyGh3Po7J89JxS3M1Y9I0JekH823v+y9Bz6CRP/AGwvBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224502_016971_B2A52C03 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed, Jun 03, 2026 at 03:05:09PM +0200, Sebastian Andrzej Siewior wrote:
>Move RX callback handling into the threaded handler. This is similar to
>the TX side except that we explicitly mask the source interrupt in the
>primary handler and unmask it in the threaded handler again after
>success. This was done automatically in the TX part.
>
>The masking/ unmasking can be removed from imx_mu_specific_rx() since it
>already happens in the primary/ threaded handler before invoking the
>channel specific callback.
>
>Move RX channel handling into threaded handler.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

