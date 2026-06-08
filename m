Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6BECD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 04:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNAwKG7xlvnTpBIKfkcmGtlvt5yoYIgOZsKUTAUu+h8=; b=yyR2X+O7THUMqEIyUDUAEzy5Te
	TyYsopM3mXvVEsM2LPjrmvdQ9qu20aDQ16NZBGdGxEvfRPYfOkdEEWvTNDwp1ikRcOoRQbDQbAT/p
	Ay1lG2N1yuIWc5Rf4ukH5oQjYY3zwWu0qMy5lAxtB4VG7LfqDLXjqkeEhsq+TIPg1fU8D9vm35gid
	5C49QUrlqQo+qjBZMqD3j4eiegZkaIzdnHmJkobogXnn+yFuKyRgMbc99JXTs+E6O6inLJiTBhtTP
	EyDV/Qqokrnnvcy1ROkN0GQ2Tn0RnqkeBevz5lCJjWqbfG2cC0qQ9ySvFupxMPnenSAczAlP7vbJM
	ybW6/jag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWS4D-00000002oUh-1Vnl;
	Mon, 08 Jun 2026 04:58:29 +0000
Received: from mail-swedencentralazon11013052.outbound.protection.outlook.com ([52.101.83.52] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWS4B-00000002oUF-0hHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 04:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzZpsnph6q34NUFllHEb5u1uVv7M+xKscICuA4rDUf9LV8oWsqZWZB2w4WDZya9ztWoyBQVZymHeUztwThOfy0RMs1kywehlJxJO1/Qh4fMN5p2Ce/w3bw87Z0udOUkKCYvqhXNbW/8YdGEWO8wWxA+J/s3iDS7EuOm/R+Yo5LGjwgtVn91TQJcKAnIAqhjInj6jAoKEvlF12/cXtq7SNztymawCLneylZtFrS/JYc2CRVI+uHj8tW3D1gPlYWFERCmJgLfO+jAhLjlSJYM+V/1hEfymbIlm1KHPwiTkYmB8QOJwtBD085Z578cYTd/FSgD70PSmWFjtU/7iHQbc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNAwKG7xlvnTpBIKfkcmGtlvt5yoYIgOZsKUTAUu+h8=;
 b=KSk/OJ/VVpTg58WNulsWlE9/EEJZGjlhlQM6m8B5a3YrT3qzOfZZHSscL3Jcw6QT68Kw4IVj4kbYSlqieBWEeUhGzF9jRD+O8xifbh5aQuNc7sJHoWBQ4Oi+zydeehZ6Ur4PYDF55iMc3hCtH7Cy2aSG0fENsVKfWdqsB26bMEvFpM3uGPzcmJRjxv7mycN1AeOlom9rtv+OrKNTjtjBebj8jWXmi72iNmZmYWIZwFbEvzTMeC5JlKR1N/gVd5TozzKHgXsp1uLDQEwGV3QGLvk8MNQxB/eeV4M/K3QzEguDeQc5K0PZ178i7Lv9os6gqRnCBO7dFN9JqEVANzDE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNAwKG7xlvnTpBIKfkcmGtlvt5yoYIgOZsKUTAUu+h8=;
 b=W5MB5p+AZLTCk8CKlMWtidNURtZOTzy4KZbB5Ww15aCK+q094pY7SkWflhhjKe8JQdVt/238siGoreBTbG9uN/CQQ6SQvnnAWgHSefUJJCaP/BrUSzgbRrciG0DW203BIpQDtbW0oN3Iisbd9SVjNardmWDB+u0jXzItS/adCHo47xUu4mSKyrt5FWFYTwZgE4L1hEfZ5VBsJESEZoV3FmMMw+vHhHh+wq0aqtyaBifuKQ/rn8ZlEmP/QzA4PavFawluLW7p5ajPCFtnkeNHwPKlXkU0n+/43aUNVCUlbDbgiJudTDzc4tWS8hbgHRFOhm7XL3w6Pzapk3YiPXjy4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by MI3PR04MB12439.eurprd04.prod.outlook.com (2603:10a6:290:74::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Mon, 8 Jun 2026
 04:58:19 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 04:58:19 +0000
Date: Mon, 8 Jun 2026 13:01:19 +0800
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
Subject: Re: [PATCH v2 1/9] mailbox: imx: Add a channel shutdown field
Message-ID: <aiZMnxH4qn/1fONa@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|MI3PR04MB12439:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d9d8bb-e7b5-4f3d-471f-08dec51a8e9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|22082099003|18002099003|6133799003|38350700014|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Cgp+bAYnQNEGhdjugFVPDoE961uSnJdIrEpMOkGjoLBcjbUaOrygPiMWqj/xbNYa3Ilm3CeSgyTanmizBxfEjLwI13VXqoeuLvP+ZTT4DQ8wHyzHAng8EpM3qES1TS07zfjIRGnO14vq9/stho+TNAECxi5j2Sa/wRgMY3dqmKKw7X2drB64ZnEcvYQwHeVEWe+/r5bN4QAUUY74x0X1f+B0K3WOHTU0FpXA/Ev42gh3Q0Gsg5Qh7r2m8LFw8XxyBn42fczxH2nXLM/hseQFlHqZCUFbWOczd5TiGV5YyniuQP0fTm3iKiw2d4Px8s1lrQhXeVLB4MjjiI/GiblCv34RA7KDi5p/J0A+vFSFIyNXDmZURZvMo0bWCZd07ZdMlAI/0wowdHungdIJSraW/XUsKuf/Qx/VUEIlf/bCZ2Mm/c3yEVxOni3Su2anjh2tvy8OeTxDceCTUKC/kw3iBs18FGEoD1wJlJzP8WHrZBMz/DQyxzMOr6jPs1OVzTQ2afrQCAqdmViTJDbjH5ex0AdufhD7o4T6Kt6s1Tepyp7nXgcNcA9y/kIBrNoMp70wesIEgv7SWosdD2efoV7G2Pfr38VxTURXORAfS0LaYpTOgGnAiHCNpxB++phcPFYcWzOj6UW8b/nz3m9OZkw3++my4MDeKO+dRv/0yBwALmF0RcjQiS9Z8/dqSZtVj0lsOSqCHiVbx+3bGWqhjBhyt4+2nklqGozM+qhTRhtt6hyBkcog2L7Sy546bYpGp8ni
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(22082099003)(18002099003)(6133799003)(38350700014)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjJQUNLa11sNV9uzu6WumDpUQNaCPkR6mcSleB/53BHQh06lUOGk01X92xx2?=
 =?us-ascii?Q?zjf8/ipoisJRZXhHk0VeUIoleecHBCN2sq53WmCv9Kryy8WIteKBSC7xrZlb?=
 =?us-ascii?Q?7XlCXczt9muo6lMFQRnr0Ae5VhuV5PGL1xUnzcixIX9HHmjvegivYB72MOmZ?=
 =?us-ascii?Q?9B78H3J32h4oqSBvQypbo9KJYW+VMjnPh200P4UJQEdvGL47kX+GZPJfdNER?=
 =?us-ascii?Q?uZKaDaB3PzGEyoGem6LtCJWHVt3qLpx+66aubCKhk72bmP4Vh8uXUVdKWT4E?=
 =?us-ascii?Q?kl9cXpWOha55UwPFIQiv9jF2MQtogtJlo7ZXFe4mgQ3scAtwinHfjY5g1ZKA?=
 =?us-ascii?Q?ceiCnCUa3ud+gbpU5TN37sl2RTbMAYcGfbMuWF5ZbqNG1uhi9Z/J3KnDEpKq?=
 =?us-ascii?Q?PFJlwyEmGn+Ofq5X7CTEaNjW7wG1YFzBNJIwjtOWxaqohIfh0MSuYilrBxb7?=
 =?us-ascii?Q?Yud/RcnsWgF3jYnWy1FCiaq+taeYeVkzWywuhY8E6vUeqGCHiPJslATU/NX2?=
 =?us-ascii?Q?ihc+PIVWtsJUHDA3HSygm4Krns0lZPF/rN5R6cWe30bnWXF+7oECHTOIv7qf?=
 =?us-ascii?Q?ZwhGvSx6bcK7JmX/KZiZUX7U4WYc45oI9cTEPM5qkJzEhnSXfhX5I4DqbtT7?=
 =?us-ascii?Q?gNWN0NAmWtTBdFVSurPHv2FkagcNL8t0/vGH1kins1uN5rIoc9Jz5VaQ2wAG?=
 =?us-ascii?Q?cvNDEilJ6uBfiEzstDB9Jp5xdd8xZroyeC4cuhJFPdDmnscJWViholApLWxF?=
 =?us-ascii?Q?ZtgMh29Yi3mvnstxtw+JsYVTxR+4mKmXi3qR3D4AcS2zJBGxrexxqTr7d3UK?=
 =?us-ascii?Q?AjtynkMWbqRzPOB6IQ2HeA40AFDsZpy/qdCn10pplI3Ihk5yJ5QNAg3ZCrMg?=
 =?us-ascii?Q?v9sbHRNvczVcfKO/aVmvPDaXDgCCygP7z9Mr0+5j+q0E58jo7EPg2isVi925?=
 =?us-ascii?Q?ln6r1chno+Jj01FhOsGFCU6ze0CdCiM/ZYUp1M+Igh9N/qtunl1gfMPebqZ3?=
 =?us-ascii?Q?Lw7F2Je9+cnUC7ABdrM3i7ghOGpsTSKetWtVxnpAVGv866VYZlDWTW4562k0?=
 =?us-ascii?Q?szMls1XNprT/BwtnYMbRjmbFF+rpENbVnBhWlWhc/s1dS6dsF1wrBxfdfOpj?=
 =?us-ascii?Q?LxLF0lp17o1vZ+SsHYeq1YGZJJrm3VNb80/x4/DwJ+Py2torCmHyKu1DhUux?=
 =?us-ascii?Q?UUPVexnA82BSdL7Vp6JxUDkelf2nCdnpT/gvq4/GgMKoA61NZmoknT1PP0Rm?=
 =?us-ascii?Q?SpyVG/nvITbAJrhbMjHO0ZebP64phPz+2EBuCEdUXCRPvjRcGo4r5+tjZFWP?=
 =?us-ascii?Q?KbxNsrk3ienr11ZmnKgKHHGiEMdWK56ROJci8HkOhWB9vfY/Sny+x0hCo4qe?=
 =?us-ascii?Q?kK60C9SSbCu/8bdCNrpQS958U1oUsOFu7HwHZ2rPUkPPpkk1dRDdVFeYsuH4?=
 =?us-ascii?Q?3wHRnMhdBJ5hMVdSbLzrQQYrrpDVWFIrW7Mybcvz0pn6jIpafkIyXySfW2RD?=
 =?us-ascii?Q?Z/aD8aS9yHaW//5TtDYJbESkt6VYpxaONV+QSSsTYgk1xrQZCMLbIdBzEA0N?=
 =?us-ascii?Q?JUzvyRWu8Uzm1QWLaoNhYNdbOC4y+Dqw4afe77p1sAggSQphkK5LuKv3TvzD?=
 =?us-ascii?Q?u267ipLOrlcC/hiyNPKImWUFgRBf3LjxhIdCALx89/1LkHW6EIXZRiU7sknT?=
 =?us-ascii?Q?HP/3/rYA+VkTGW7i6g+QA4c83ze+G358y3u7ZLILOl30YAKe+ejPpr90IKTI?=
 =?us-ascii?Q?8X6K9av6bg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d9d8bb-e7b5-4f3d-471f-08dec51a8e9e
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 04:58:18.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItmEgrScmezjkuXwVpb5QwgAG59re+uriUBINUi3ltn22ijo40D3zKH8LbbWhqrrXGdRM3Q44hGPRmV/+aoFjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12439
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_215827_213241_73D8EC6C 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, Jun 03, 2026 at 03:05:04PM +0200, Sebastian Andrzej Siewior wrote:
>sashiko complained about possible teardown problem. The scenario
>
> CPU 0                              CPU 1
>  imx_mu_isr()                   imx_mu_shutdown()
>                                   imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
>    imx_mu_specific_rx()
>      imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
>                                   free_irq()
>
>The RX event remains enabled because in this short window the RX event
>was disabled in ->shutdown() while the interrupt was active and then
>enabled again by the ISR while ->shutdown waited in free_irq().
>
>This race requires timing and if happens can be problematic on shared
>handlers if the "removed" channel triggers an interrupt. In this case
>the irq-core will shutdown the interrupt with the "nobody cared"
>message.
>
>Introduce imx_mu_con_priv::shutdown to signal that the channel is
>shutting down. This flag is set with the lock held (by
>imx_mu_xcr_clr_shut()). The unmask side uses imx_mu_xcr_set_act() which
>only enables the event if the channel has not been shutdown and
>serialises on the same lock.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

