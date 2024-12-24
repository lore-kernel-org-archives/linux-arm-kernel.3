Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B7BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ8mnhjwqRTqlKVyqCQnKcacJ7btVm/eOgVJfoE3qZ4=; b=pPNFHslRtbQIQRsDrtRXUxNUlo
	uO3PRu3m5hko6TRsPmbXqz39ffenOCIKgSfRfzli7vLL3JC9w8GPlUiMNQzOrbzLUb/e07U/rFzUj
	5H0MG27nyZwqFqoeQgbvXMIv8ANRAgF8FsV/k0nTXJMDHoRvV6b7rKNG8svQPd+qh0E0v99qnjyG5
	J6OTvINm+F/YnoFQ4aagea0LbeOS4MeBywajSfrmOlB5rZf4YwLD/j1ugk+Gx5JNsSTH11THANN20
	x1R+R3xk5Xqk89FfUmxNguinovqjis5UPimBZO/GqNbb0ISDcBccxgIz/aW3/JJjty7X/DEL/ng/s
	Tt6TBrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPuUw-0000000B5E0-45Jn;
	Tue, 24 Dec 2024 02:18:14 +0000
Received: from mail-am0eur02on20623.outbound.protection.outlook.com ([2a01:111:f403:2606::623] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPuTk-0000000B59s-413w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 02:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoRQsWR9nDxGBh8uXByCQFGVUOpIdVtMG5zzrwb/Bhuni7BqY1vWMLlbEUu3jSRxfWv23xmL6BaWSoGzUmaV9VoIiXPY2VoUvWncgXD0ITsYzGgOSEUvJqy24U+4gjcAdNrSEC9hZbhHFUw1Xtt67qNiFCbVEN1c/RTINjgN7AtTEgX1NOeDaAos6U3A6fUknPtYrVKIxYJuQYZD8hz3QF2cEfWPE+oZI/0bCZFhv77srQMgjSxCm5xRyTick1ML6Podt6dc+FOIqXCqegkKAT5fI5MScT4VunHaYdRxXOddLmKZpoBcqABh3EsVZvo0hPfL8xeoSOHrgzKUbFmt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ8mnhjwqRTqlKVyqCQnKcacJ7btVm/eOgVJfoE3qZ4=;
 b=GrxWtEbT689J45X+OyP4OTXYSnKPVC1/DaZXLJ1bo7F4MYHR7lxNqrkfURscOcdVzW06nuXoWF613A6F+Q+JtRkV9tpADZfv3qnjraYp2Pvf+TotqzM6mkUpdfkDwgmMVqsf+sVPNBx0mvUbF4KI0RIpPNuhLFtWDToDJxEBzqvyZPlcnUnIih3hRnwQDy4FoUnqmI/b4gDiH0XNVl/nf5TZISud9u7XioMkQ3/wBKCQPKdJNhuQZQmN2xKUsb6WStXS6UBLBLi6tVS+hlhDPvMFZEPKfG2G7wAGwbZy7f0iJACbgZ+Ck3LPgpez+Su5AiozyxqJZZA6RCZwD0IuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ8mnhjwqRTqlKVyqCQnKcacJ7btVm/eOgVJfoE3qZ4=;
 b=BZS+34LdxJh2mpgaQajTAX+5SXNrv1ywi4t3MTCN7IDdj830MEvWV5EjIi1gby2Q/20TO9q6WFirwpnS5h/PKACu7PqAYzTzfkhIwB6U/k+dtRMbic78TjPseoto8MNcJZ/TGDyLoXTZF/3YYnM9Zu6QlVSqvXay0zOPgIis0ulrwgkWcxN5J/KJmjm+e8su5Xjz8tidYZrJt0eKPzcQbEjH1ZCENXPwFjcjvhmWQh4TLPAUFNMZBZoNGjo2s5qQ8DcFjm3kD65rDEpLpEnJSdTsZ50e1WIICZfOzv7oMGwHtBSTZAeuSxstY94RFiZxbnQmvXB2fCsXqC26k9PelA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.22; Tue, 24 Dec
 2024 02:16:53 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:16:53 +0000
Date: Tue, 24 Dec 2024 11:22:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Message-ID: <20241224032223.GC20573@localhost.localdomain>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To AS8PR04MB8450.eurprd04.prod.outlook.com
 (2603:10a6:20b:346::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4004b56e-0917-4e44-d3d2-08dd23c1080c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lGnHKxLR++QP1syizCLLnVVZeCFr/961NrJVEXEK7CUIfMobDSiZKVfWKZjl?=
 =?us-ascii?Q?sPE7FjZdN2d0oIjUzBoBFyUo7lbmG/B6YnjY2H7rerrpg2UtiWehTP48ppHj?=
 =?us-ascii?Q?F9WUcrS/k3TPq4sx/X8YxWt4wg20NxBmWEpyYOPfmGESNAvv7cQbgRZPVCH1?=
 =?us-ascii?Q?2a1GmNYKrOIl2H6WVIouDMwJ5Nn6MnUkyyLw6x41fy2LZHFbD9XYzNIhqwLQ?=
 =?us-ascii?Q?esGjw3+2Fg0GJkvaGLaNWtBQPZ1Guv2Kkvw91Ae3me4tYYdhYIgAfUPXrdsJ?=
 =?us-ascii?Q?RYVAIjCI/xMo054A1J805C6lAVUDfrouF9Q7lfIqDFKVCGa+Bz3mtMTln7L3?=
 =?us-ascii?Q?Rm5L0PBnt9N0MqAU0d/8DVEX6xOkNPYugX3/9N3CLt+NjxNavnYtF96uriQc?=
 =?us-ascii?Q?wQki35GspYXDzB62VafSQCKuvVskbWSk5br9DsGTFb/++UxD72jjzOqWS5Zx?=
 =?us-ascii?Q?VNl5dLXV6lk+mpBuWBh3ZZeXsCoKJQlVJZOkEBTlo4kPuW9lu5MM/ixr/vzM?=
 =?us-ascii?Q?hv0gLtCYi2Ep3Ghy4zP9KVPRwRatOvhw3WaIfMcGa0ZBgLaGL+usGJm1Ejrh?=
 =?us-ascii?Q?+d9oc/Vu4fzuugTNfDOv8/1hYsGHuCen/HtrQovB4XmbYXMn4fM6PG4I0CL1?=
 =?us-ascii?Q?z9sysidoT5wtrb1MrwTmkQaUPgK0fWQaOGID8BGSHEKPqjnortfb5EJlN+gN?=
 =?us-ascii?Q?pBmTcYXO8q8dWrAkaxIIgVQxqwevi4dlATLpLBwb5rkr/skNOLCIWC0m8FZs?=
 =?us-ascii?Q?/SNi/wnweerlOI4N4nfwaiDk2yFV7OYv/EcoSmKTenArqDIn3FXorlGGtI72?=
 =?us-ascii?Q?hy4JnO6hePp85L+6U7+uaa0RQlT2Qi6yxO/OwWXl+MomtYxglay0fEXWyUsw?=
 =?us-ascii?Q?d24zkV6KEFhZJgH4IX0VMAj/R/gHwnywIa6YvbrWLEJcnBTlXqyA2Tgm5LQ/?=
 =?us-ascii?Q?PUo/w6vSjZE2O+giUPgop00CLEJCY6tKD+iJct+V3rzJLgWrYy6q4nTp1BgP?=
 =?us-ascii?Q?GShTKWsSYFgRDVeSL6gQU1D77EUAqkUG84HvDrTug3DW75gnoQZpu/7zkVtk?=
 =?us-ascii?Q?WI/wDlv9GZh55BHtSToU6pMnI5EhITMSia6uQdlw7e4S8GddEA4TNI7bOAxp?=
 =?us-ascii?Q?aiXA2oGG/Ene3z/HyCZWbNftC6LYe5PyDkLOt9r1bXdTgw4W/JKTIXNVTmvw?=
 =?us-ascii?Q?a+Kgu+m0BemuD5+xw+N8/HbqplHc6CiyFxWKIzjKhSfuELnssxxMTdYx6clJ?=
 =?us-ascii?Q?yrKVH3uS2Hxeo6zNITIBST+unATgDnDZ2480eAoxCKAErkFs2zBCS5u7E+uQ?=
 =?us-ascii?Q?IypHweE1cGf8mYPGc0uIa1jMxAxN9Lw4ASJ8DCN394n+ILL2e9v0M3i1d9X8?=
 =?us-ascii?Q?c/X441xonFg6Dh9L9dSKYSfeQ9gGjOzhA6EMBhOIhhcfSsqwgYu9pI/CIp8t?=
 =?us-ascii?Q?+Bhx88axGDOnECy0FLS7ihoP5cZIPFkV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xLsYB+DvlAZ6gCoaFe+tsc9LMKCln6AX+QFgls6tsAIDz/TSTYaGJk24nKHH?=
 =?us-ascii?Q?AjddtHpkSwg/uJK2Or9am40+aCl076xWgHYNQILBrhGLHhitoXNc/ujLMcDF?=
 =?us-ascii?Q?DbbZRYTjokUFnDHg3gmwHusbQTqk57Ck29anvipFIEbaj3ju11qLCEqWZeoE?=
 =?us-ascii?Q?foojI4R82c1OhQ2TVeJtW/QCCTomyQ2RgUlqrhl4ZeTJixjB0Wvdd7l4LKFK?=
 =?us-ascii?Q?ZbxBJJ0+dDuGlvWERN4U1e8idShcXzQCeB55jbTtTHP/YAJu8sV5+ylqKQa6?=
 =?us-ascii?Q?78rI+Bh1ItM3jT9/lusno6wAMd6q75iM78PADAXeXrqDVos75wslI6/hDRkX?=
 =?us-ascii?Q?dJ12r9NzfWMSRCnDrjeLWursJcP87L5989zrG+6P2cPqODaT3j8TB3c90iT+?=
 =?us-ascii?Q?+/ifHrCJMTxF3HHZZz6pIKQL37E8j1K8ylEK/e3u2M6QMNO37XOlF4Dx1gvw?=
 =?us-ascii?Q?fKm5cqVBs5rslkRt0zytYyDSDoANnPcsXJ1+am0e2ovnjRs8HyA1csPW8gyF?=
 =?us-ascii?Q?f77+y9U5+dHDB2NM/MpGSHuWKBDu1L9XJaR8d1gjfe76Q21T/ekcDdz9Yk87?=
 =?us-ascii?Q?qECppqNyxV+0HRNjsM4FPYiQtXFwUYvADyFjvL3EmhEaMrvFtYOaQW+Zq4wy?=
 =?us-ascii?Q?zbgdKZKgt2KmMFVcyh0HIUrS3HCOfzQlfqDo3ZnkDDyteZNgPhf8n9G3Ik1B?=
 =?us-ascii?Q?fFnY7sEeSvm345vM150ER3tQO4Q3b8VK3Ck2lTxVNLucCG8nq7PpYizJ2kC3?=
 =?us-ascii?Q?sb4H29AUNVxB0iMOCKqeTXCjbUGKRmv6ACKtfC9Z6Eok+588Z4hk5W10+3zd?=
 =?us-ascii?Q?MSv7vbDMEw5SFZB5PicC6uG/fIHZuwXH8rK/yvnhw1vjdzSzVZR0lUYwSgua?=
 =?us-ascii?Q?25deZlxbrJ9T8wvUFhlY8/fR8wu/FWK3aMFOBy2Fs41fwY5lYl+g19tucbwA?=
 =?us-ascii?Q?/f80sQUa465GYyu6rbEXzRivjzKHyTCbGRAi3qpbYgzcCequdWfKvbJcuZKb?=
 =?us-ascii?Q?ip50ZJaYVm4xcT9kPk3tz5Ewmb3CaWtNqYGZG1YN+fh4DGdL/fz3TYMaEf/w?=
 =?us-ascii?Q?4uhWgj2rPZG5LB1xki6czY0imn+Q5OmCk/fi6Ua/AgCLOwx33Hw055FMuGoI?=
 =?us-ascii?Q?LX/ZSbB8Zxupzj8Z9D2qG2pNHW6odmMI7D+x5dX7EQ4o7Bu15cIEBen9Epv9?=
 =?us-ascii?Q?gvMrQVdMxUpBYy/AdAdIMkegdMnTyLR+1HGIh1ul6aK0VZ5um05TApjkdoH3?=
 =?us-ascii?Q?xJok749nmdSQ7z3QxuvbnBdlvS9rojx0XRcgrDq/3p6VTLK12uI6U5Y+4NV8?=
 =?us-ascii?Q?Wq1yaC7IBxDk5IoFUTnKOsoH8dlQX8DgRcWu40tJqEpU8YQk61g1ebbycpPy?=
 =?us-ascii?Q?P4fy3kQxaIl6BCfJIN+Hm7Gic8yDhxlY79w+hxEABLfg2PEbg1RS2+ic614B?=
 =?us-ascii?Q?rWQSA7Bjm6/PK/2sma3e0he1aGl+j8+LfwovC5VclMpegVRimULEzKjuUCL6?=
 =?us-ascii?Q?7rvlgTL49c9TIQqgU2Ww45rcPVVaWbK91GjX6u2JZhfnSG1qxxDhvtQpiq1y?=
 =?us-ascii?Q?m7TC5t1bn9/p5ezKfhjHEPG5LIeM8dMMkDjsmM/v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4004b56e-0917-4e44-d3d2-08dd23c1080c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 02:16:53.1278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53VEzfQ2XE+0n0MTPU4y48WjI2+kQs4IXSpksZoBDH0qkp6keReDsWzk2lo575St07HMOBi4Xs/QBxOJSVHMcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_181701_007540_4DCF6DE0 
X-CRM114-Status: UNSURE (   9.58  )
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

On Sun, Dec 22, 2024 at 06:04:25PM +0100, Dario Binacchi wrote:
>Get the hw of a clock registered by the anatop module. This function is
>preparatory for future developments.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
>---
>
>(no changes since v5)
>
>Changes in v5:
>- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors
>
>Changes in v4:
>- New
>
> drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
> drivers/clk/imx/clk.h |  7 +++++++
> 2 files changed, 35 insertions(+)
>
>diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
>index df83bd939492..9a21f233e105 100644
>--- a/drivers/clk/imx/clk.c
>+++ b/drivers/clk/imx/clk.c
>@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
> }
> EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
> 
>+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
>+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
>+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
>+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)

drop the guarding macros, then this could be reused by i.MX9.

>+struct clk_hw *imx8m_anatop_get_clk_hw(int id)

how about change to
struct clk_hw *imx_anatop_get_clk_hw(int id, struct device_node *np)?

>+{
>+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
>+	const char *compatible = "fsl,imx8mq-anatop";
>+#else
>+	const char *compatible = "fsl,imx8mm-anatop";
>+#endif
>+	struct device_node *np;
>+	struct of_phandle_args args;
>+	struct clk_hw *hw;
>+
>+	np = of_find_compatible_node(NULL, NULL, compatible);

Then no need to find the compatible for every function call.

>+	args.np = np;
>+	args.args_count = 1;
>+	args.args[0] = id;
>+	of_node_put(np);
>+

Thanks,
Peng

