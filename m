Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E7CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG+wOIE7X43dYOPsJaukE/9Q7WmXB7H/nwSz7RblF1I=; b=cTj/F1O2jgxEtv3Hv4ICI0TgSn
	gIPNLht7lmo9f6pUPlVBRfKC5fj2HFancpPB0pkF1PRxVp4ozm+2grDwysFuhsTjLN8f1W9ruAC3U
	XSX7EyEXXn0a4GWJgccGzOg2y/FhOflMjoZap3zgqqSHDif0+y2ampLqXAuip/IlVVoUfQlcxoNFx
	3wnQVuIHVCEm4CQU/Nv0NPnwF6jSPDNaIQMsyHnsZ9qnpmJZ/AasDF+TSeoMtpkyu7msALSAoGxJB
	SE1E+aeDYHvqbg8UOZ64Bm7nIu0Oa41GhQWitcQ1f1mjL2Qw2IDWXwxVwE3shIl2AIMZQdv7JAQeh
	rYG26ZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYhJ-0000000BwFB-3u3x;
	Mon, 24 Nov 2025 15:41:49 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYhF-0000000BwE9-28L7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcXBQ8b1L4ti360ZG/tCnWSRV7Vfw0ocwpeDfnuwn/VQpTbeXgxcBVC8x9RoNSnOPu6Sf77YqCYg+x3XUY4peXWZrqiMjoDx1lHt9TdiI6UmUaHpidga4bzraaCLOg4yPDNRTrW6GBkzamGVYOyuOtOSr1Pfa0ahhec/KFMS+NpU0viJHcokdU8V9NPYmIYtcndRskI/ELKf+OspnpUVABoKyKyKkGWax2SXLKITK1d7N5M5J2X8CZEfy6R0F0stvni6P36Drq+u0DWUY0SlQwCPTYMLEsC4BMN5etTB2p1yHdffw0DMJ8XLnig3xrBoZVaKll4cyHpCyfxWhFxMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG+wOIE7X43dYOPsJaukE/9Q7WmXB7H/nwSz7RblF1I=;
 b=O1W0s+YnL0sfD+C6GJqHibU7tLKZgY7z+c4poZTyP+XfTdtaPMcsmkt/1QNBNe7qzQQd9mH+Tn+zQ1HPJ71FrrXBFRSWDw38wPXrNuhAf9kblgFzZyEWmYr9FYuBcYDcCQ6ku/e5iIGKdEXIOxDn87kZF6nV8whMXy9FH/+s/vLEs9KwUdITxx9LyCbRfsoBACCMQ/iaU07a4smkbt8zCBIzQ/2QEn7pyC2szH0wKsph4LvozgPqxY8wc96u3HBgDIj5j8X+0b0LOgpyGkdZzock1luytUpJBQjwrn5dM75Cj5WTiXy6YhH4yGcChjsY3fDQQFhz+dsYgz4xO7Js1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG+wOIE7X43dYOPsJaukE/9Q7WmXB7H/nwSz7RblF1I=;
 b=CI4rD6oCNxeoTfTQnnFrShnofEjICb39XtutIZ5n2h9t99EpD9N2W3Wq2uibzIVhQPJnJXg99v5lV7rBxk1bjhWPp/rJVjYloFGXZfu9h+ya17sj6d3OE3aIfKEcCMULkAOT+WYGVMZY+E7prTxHt6F+Z2hrezRqCLAVw1aMdGyPbZsG/RtbkduB1DCzfV+eF2buSzsyFvu2seCkaJbjklDKXHIp4CcUURTxvMTBJewY3dNzBNnJjGR2KfBBN3ATodio9QOJcry367n4sawqnCaMED+5n0s+ukoom2pc1EqZQvhkUxxIQj+ZkKvxb6972VsVeev/driaQlaUVfCGGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 15:41:40 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 15:41:39 +0000
Date: Mon, 24 Nov 2025 10:41:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
Message-ID: <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b93461b-d9fb-4d4e-69b6-08de2b6ff575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?csbA7eWF+NYPwrHyhAXb2XrxgtApXd1xLyBrOPHO5c7gi0UDZ/oasulWpDln?=
 =?us-ascii?Q?M4S4FxD0CcFydhEAPseRQfRoCQpvOQ/UPuEnG3K/YNWI82hDiVJ+Gaodj0CF?=
 =?us-ascii?Q?T6jezm2zYE1nkFjFgxQMFd8hUC6/6DFSPp7YHYF4767YAF3yPP1Vu+FVYQG7?=
 =?us-ascii?Q?dKq/rLGRo/LHESBKpSYZE+k6yGAgBQ+2Zt95r8zIuOVZJ4HJJaGmH6P+d1v4?=
 =?us-ascii?Q?iU2KNGfVA5UfF47IBoX/Vs1c3Z6NoxDlK0rzLTwJeEtoFDwacZ7Q8uhIj8HZ?=
 =?us-ascii?Q?hQfLy428E5zxjZUgwkdkMnJXAdOjfaQN1Ok3QeguzqnbpC9bJwDK9H2M9RXb?=
 =?us-ascii?Q?IcSEVt3pVdf6NFnShk02ivTts7vwbXJNR/sfHBolpt1riAMOZfrmzIswCFfy?=
 =?us-ascii?Q?n3jPAL84+FQLWXFwZ2PqV+IsoNGsdiRUmGWptfWJDHaH5+t+BqkqOQk0iSpo?=
 =?us-ascii?Q?tMtpzn8dqCkcQA25K/r+J+meIkastx/qyzzGrOT5k2HsFE+h13R1etYsY0in?=
 =?us-ascii?Q?DCwLU3emPgwKj1rotzFWpjOq1F+VmiXVR5xO7D1qjInrInnG7u8Xix57St7y?=
 =?us-ascii?Q?D6SGRzJjUi1+UsML2EDooGqeowD2Y0zfSNnK0U/WKM34SIph0e0/l0UVXpQD?=
 =?us-ascii?Q?37LyxtP00Gu/Zs9P78R7C8nLwuAVQqSyIHxQBSnALdsZyOgLLiG6BUKt/5E5?=
 =?us-ascii?Q?3lDSW5a3+Y0FkB84kWdfaC3TyGpJw1NHYfPZJhihVntkZDEj3IRFzcydmU2T?=
 =?us-ascii?Q?U953qSLxfEGlToMIvuO2ug5HDSRN7gjGj0Olh+Ww0Knj6T6VufRSY3IjVfMP?=
 =?us-ascii?Q?TGKSnHeVCe+FSwAaFG+KUP1XoFWd3hP1Xt2BDax5amGnnbCUu1v7KV1Pu+XF?=
 =?us-ascii?Q?vFAH38E6mDwQKHODUoW07v8POnV4bKR9Jmu7eeHTYzqt1fm4t3DadAXB1its?=
 =?us-ascii?Q?83hqPb2c7dhpxpqR8pSGgqCuWUijM5cjqPfGETLTw1PlFRlJ3KVX0A5Qmse5?=
 =?us-ascii?Q?neBYXE3Y4isAuqIN5yD5kGROsjLe+OklSRJew4Ab5IkY689XL6+4h9lU3va5?=
 =?us-ascii?Q?PR2s+Elbnp7qbOPl4syzirCZfId7gL0ibY1yVzf/FesYsO2Foo96ZLHtmDnr?=
 =?us-ascii?Q?OL8CuLwcmWviUDmW6Y4xgLvJQvk0idsEu0wixITrtrSMio+ZsBaieNWJQ+mW?=
 =?us-ascii?Q?hbyAGZ/Aobo58E2UlJPgMVEr4UnRJgvy3QpUPSrrnhnwdc1wZd1ifytLHRc2?=
 =?us-ascii?Q?pVkssbN5q4/xM7NIXXVkIUvK5sWWgiAPgNn/Sw4EyAkO7aFrySvA/ocXPfdT?=
 =?us-ascii?Q?FxTf0PNKY1DrTGjOcU5pc2NaMctmexoWG6XxAGq6OkM2imycZxu+fq6OCIFQ?=
 =?us-ascii?Q?ZgP7WiO6YnvHQLPkDJcgtNzl+F6qId3004HWRIqGUFbc1vyuPXAd6d9VhDSm?=
 =?us-ascii?Q?ZE5dk6YPb49wVhodJ9EqKW6APKtjHeHCKDSye3KTXPtWnDRWU4MavR66CiAW?=
 =?us-ascii?Q?jlNwcZYLJrzpHNT4CILM8OhksJdT0AjQrzbx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dxK2t60QRXng5U5oyAyrpOw3coW3GfGRT6ctR9jeU6vrhLQSmJGjLocT7Zt0?=
 =?us-ascii?Q?cnavtXknGvfi6ZLAJ7TBQCo4auh2uhTcTLjByl1HYZReUZk377s5WpU0N7k2?=
 =?us-ascii?Q?TPQULJwYQECJsv/LKqliR70iUihjFRdgWmc7oCXmLv67EX4raNVIKpHENeVr?=
 =?us-ascii?Q?e0/B2Qpwx2Q+M+8GZsNpiyuurFgQPTZxAPO4N8tUiSke15LzMJ0JjAc1AFl8?=
 =?us-ascii?Q?om/4nRL0fRCjwJ5KrK+/eE8bse0NDa3eB96t9EAfbRYWaUnyHlFWEOvwLJuP?=
 =?us-ascii?Q?a5PZ7Bnzbi6+WRI//4OFWjp0lKw07ARC/ApQbW/R45rQSeE9RHW8WEN5b429?=
 =?us-ascii?Q?9n/KtWTwbvrBwCwrAKqzxwdbS6e15rqHIWmTdF7N8SxvKgCJUx3qVP+LKZNB?=
 =?us-ascii?Q?nJgDYHu55VyEec+eUiynb2iDYlV05iFxOyaM/RVtWm4yFcHA3FRm5+3gvPew?=
 =?us-ascii?Q?dEiHi7N/Rt9+Cgx7JzP67uuhgzCoN66OhL1psa1sF00obhoNxNIkDyhM2sDv?=
 =?us-ascii?Q?twJFh6ITQoj/Zkupt2Fd1CYac1ZyyiC1xjDfRrPWmoTqeH2h6ezvLNbOhL1Y?=
 =?us-ascii?Q?UD3m7NGqq6567cKHXROMKRRyBOiKhxJxVaKKPcqD0mlNVOUXfVtdovjzcxWf?=
 =?us-ascii?Q?ctnrrLJanqkEX8143Pdnh1qMs99c4Fsa5U4CW8AKGwPJA+Uo20BDOjZPe9wP?=
 =?us-ascii?Q?N6SsXoL1+JQP8vbuy6iqSe1EeP/y34JQxqfu/wSqrpVgYMBhj7xFf9oPQZFe?=
 =?us-ascii?Q?LX3XyoIcByuKVBa2qAokfAWDoYyrJ4/04eOcgiv1Y2R3PM4JEe9f0TT+MND9?=
 =?us-ascii?Q?wFtApn9PP2S6nqhIiajh6X+yZl9tEaFlCubJi1Uu/z8ilza2TkncPIk2CiLT?=
 =?us-ascii?Q?33ZBJSq9vuiRRdQ28mPvy4+2PINVzprFTnl7AfVbK02qlSV4AQEriuE/ptmP?=
 =?us-ascii?Q?7PqTkTlA/ir7DXaIwk1ItgMuY+NHVc0YnUX5H+NA1WEmZozNetx74p2w8j3a?=
 =?us-ascii?Q?JRmJplOXUcEXDzI5BfrzbnhvgljTGGZNNSY7iWZm0Z/Ws49Hrf4g/CYZ22Y8?=
 =?us-ascii?Q?MPC2PWCTPOr7tZhn6n7Eoio010J+3ZGp8WL7bE4GnOBGEoQZRFW0x7nprkW8?=
 =?us-ascii?Q?/TmVu0CuJ1eHUt4lc6746PF88oO6oL/k4UZcU8RHuZZviAw9Ys5y4Hhv32jG?=
 =?us-ascii?Q?as+rRXbwUypa63aJSN9jT5eFy8o/dvK5iUMbiYmgFnyONhUQVrMXOHCpL3ld?=
 =?us-ascii?Q?lwUtu20/EUAKsM5FBk5Sd20DiMXBZ91wRgdyXkfzrjLtj7xWqiAJSfgXWUyT?=
 =?us-ascii?Q?DpV1YPoFYacwpd6N30L81DPKqJlaS5TQrjoLSF131O44aiMElih6yQfX9ea4?=
 =?us-ascii?Q?f2D+ESAtl92E52bM15i9fHM34QrS8yD8hP30G/VJiiq1EsWhsFJ09njIz8HS?=
 =?us-ascii?Q?khULWUAjTBhBy7N6g28Pz0Fh5rc3OMlh6obSak2fmY6SopoTdR5Id4+oG3s1?=
 =?us-ascii?Q?u/2ts1so7UnlITi/FFW16uA1j+kmhUArVe3NB4UkT1XUu6r/7oYw/FMRDVO5?=
 =?us-ascii?Q?zMMMujaoqv7o0y/OoW8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b93461b-d9fb-4d4e-69b6-08de2b6ff575
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 15:41:39.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 351JlVt3pNJe/4lKHiqsZs4gvCpsAK9zI95rCwlFnIEVTXGTo/qot9ECGKkEN3I4Zv6sUUBW1becbpmHrUR11g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_074145_553636_48D0DDF5 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
>
> On 11/21/2025 7:38 AM, Frank Li wrote:
> > On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> Replace the reset map mask with the bit index to make it clear that all
> >> reset lines are managed by exactly 1 bit.
> > I don't think there are benefit because I met some periphal need a magic
> > number to reset.
>
>
> Please provide more information. What SoC? Which peripherals? What block control?
>

I can't reminder exact one. I grep some code

[IMX8MP_MEDIABLK_PD_LCDIF_1] = {
                .name = "mediablk-lcdif-1",
                .clk_names = (const char *[]){ "disp1", "apb", "axi", },
                .num_clks = 3,
                .gpc_name = "lcdif1",
                .rst_mask = BIT(4) | BIT(5) | BIT(23),
                .clk_mask = BIT(4) | BIT(5) | BIT(23),
                .path_names = (const char *[]){"lcdif-rd", "lcdif-wr"},
                .num_paths = 2,
        },

mask is more extenable and easily support more hardware in future. Change
to bit number have not big benefit.

Frank


