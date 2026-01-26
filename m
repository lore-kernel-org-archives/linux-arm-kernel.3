Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86BCD19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKuGM5mJyHA3uhBSNXDVO0n63lihx3fyQ8BVFl8fXjg=; b=vqcPfA3Rb+eHNQvdlqQj4FrIE8
	fpH1xCiO3qJAYEmbGkt9SCdy948nvFrtuX+3+Xv/+9ia8mOPmZTdhYoVA6Vw/mReZXcZ/iOUl15/f
	7aKrG03ctKmYnhq8wyUL5wMgANnum8qkJqXKFzrz6IJsJhdYS7x0ZDECgVMpREmbYlv7nKZ4IFd3r
	+jFEZhmbEiUIX6RFKhe4cPxqfHrk/PGktlPpXxTObhgiw+diWlnzKvIklFi44Dg8hN0j9+qSOpNo0
	dNDQkXcJJxxK+TmyCk8IV+pgQ5lNLMQdaUK9/oVpjNFSFVOFbC00BkSRvK6YRL0XCtndYvuwnVv3j
	AkD+LNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPf9-0000000CsXF-3Wr8;
	Mon, 26 Jan 2026 16:42:03 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPf7-0000000CsWg-4B6D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N35BU6O65uwS4OtKEWLbx6CHcqRYRXKqHzWCiHM97falv8IJg7m4aIkFRkQP2w2VbZoBiXUbKW0xvqVrlC/g2psWkZb9uMEkwXC7dV8BxP7+s0Ksr3urxgGFetQNIW1rhMlT3A/V2L9zsbzeWa9AdEiPqIjMEerAe5D15hK1n9BzdLRuv93zAzVRLhUdNeBbYJwtgwPM83kREphvOSHW+k1PBTaV8ROsibePlOw4JzuGLw2mRCtENUJR/gB8/YA/oaEzmImxp5/MKY52ARVOcHXLlrJm0Ql6NTPvFS+iU2qEu+tmBdwy1MTdJozHmW4mDkT3fK83h3zQ2cZpWYfo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKuGM5mJyHA3uhBSNXDVO0n63lihx3fyQ8BVFl8fXjg=;
 b=NqiC3tia8Z1huutbXaFvxqMSBlJHJefpVQEH5j3ltFDos7YAYbTpff4NfVEGyB3oZjsjq4k6LdXXm1MnIbL8WVMs3DSy40sORI6N5v6WbJV85xnFGsplZvY21uqYkNHC2l4QN2Qlb2vqx7rZANwCONkt4GZSBgNE8HuiEdVF18nPcRDrQe7yYPAl+rcDTY7iIMqVc2DMAS8JqlJEK6SLgkMiu60jOa9AeUwQEs7uJvk+Fi1sxesj+Ob4w7axLM9RVQvWCSLto/L9h30gGtBpB+pwUFM8rPR8oXwGLwgGV2JjxiiSVzq05OtjzvuBLx6WZj8dyhClX2Bba/KleS5X5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKuGM5mJyHA3uhBSNXDVO0n63lihx3fyQ8BVFl8fXjg=;
 b=Ci1GQ9OdsgVkt10kRu0HiEIUhFnaZuubZANA+zltn93Qz+aj9J3dF2saJ2dzZqzlitYOHjsrXCR+cSY8niPvLi46WhykuioxF8gRdI9j39VMlYxmLZ6uZSqXMaru5Wk8y2A3NghWhb120zBBYHce3r9vnh8qePT0B250thgB97yuDdrfEGkMlDrNO5M5Xdf78+mbXcoSoolRdZyt/6kDl4qSNzhcLwBgRdnF5z9/O4AupMjf1XfkGcZ7wmiffbkbWZXO/d2u/0WQcr3FX+h/00R5SfooNxgGDqdD9ylEUuPtkgB2JYbmoEjbpZycUco/Yy1ZvuA3iH1dBeLpV92IxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 16:41:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 16:41:56 +0000
Date: Mon, 26 Jan 2026 11:41:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, laurentiu.mihalcea@nxp.com,
	daniel.baluta@nxp.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v2] bus: imx-aipstz: set default value for opacr registers
Message-ID: <aXeZS/bKBb9QE+Uq@lizhi-Precision-Tower-5810>
References: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126091156.951052-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: PH8P221CA0059.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c6e678-2ab1-4cbf-9d07-08de5cf9d16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1i9l5iD8FgaKURyUTLh8tpo6NaQwvhojHlemj762Vuv2eLZ7Gq4zkliO8gSv?=
 =?us-ascii?Q?3gNpTGQKkfQl8zTCI8V1sfil5VMlfngZ/CRDevqx/L1WnrmGnCHJWMnYhKKN?=
 =?us-ascii?Q?GQH9e88sSXTx502831UtXcc6ADDPBKFdzaKuRXjNrWBGWvyGG+0UJjqEg9q/?=
 =?us-ascii?Q?y3ZKkGLQkZ7Ov0ciQd597OLUZ/SC8nBhS7/so8M58Op8mPEvKuUQlh2vqLkc?=
 =?us-ascii?Q?Qp9gQ9GXIBY9eRvU48BFKkmwNMTqysG+80mc7GifQlHDAAccbKg8gJws8EBu?=
 =?us-ascii?Q?99WUGZV0eQPViqwhI9+L4Kku/xH7TRtzavuwcZc+Udq4d90i0FPaCLSi3uBl?=
 =?us-ascii?Q?fETIcTxFMG9GhApLr7UIkr5hwTGLhG4VTdUukFK+9XkQpqJItINdGcW4VDme?=
 =?us-ascii?Q?uyBYXplcNFu7qXW3azeHfOhps1dT+r8Tmrd7H6/Yt47u5fWQDeYuoONb9W0j?=
 =?us-ascii?Q?HWMhzXoA/0Hh8Bet/0djUHpEUA1T/iIIysuOmwc9gV/igzovm375t7U7zLod?=
 =?us-ascii?Q?Onyt6tM+h0AZZZ0iCrp75P1QU7Ml219BydKDuVNkpcW1k2wgoS5ehOzHo0N/?=
 =?us-ascii?Q?qTb6SLF4olTK8eLbg+wGrGkBf9CDSlpcq/d2JW3uT6cZEe1hhQisq1eU/Elg?=
 =?us-ascii?Q?VmqmrI5TOb2E8M/BseZXPA0k0OJrcoecY8Wurpu/tv/F90wf4dSXIQQqLqZH?=
 =?us-ascii?Q?d/OP9sq8/tKIhye0MCsgYo6zek7YQbmRxeJuVpE1Z/q3eXgeWJaaWOGzvQ6q?=
 =?us-ascii?Q?iJuHK1iRhtYbqyK9d+ilUmDFmhTKsJj9EbrbuAFBFkObp5SUmVZMOCBnI8gm?=
 =?us-ascii?Q?Z0WTEU2kCUxJh2idWDNUi/biRfmBaF7f89Lf6vbqTHCr9uSEdsf9nmBoKXCk?=
 =?us-ascii?Q?mLAJ+LTcO7BOWaeVdcQHAVqukIz1sfQHQ+7YZWM+QDXNOe6HPmfi5i1FNwdS?=
 =?us-ascii?Q?wd0YRqCLdtKXNVIP72Q7Bn84odYjDxQ47ENX2NxuR1VFXJVXMtILxd53VvYw?=
 =?us-ascii?Q?mRvnQEofZMM36V6C2VvfkeZJS2L1pmuwqv0iWDTyGGiynaehR9wO9pwFtmIQ?=
 =?us-ascii?Q?VtcxUUgE5s7DpBcnAP1h8ROVMv3vrnADUeu90LFJX3vRkIOjhVWyLeqjVFc4?=
 =?us-ascii?Q?bCJZPlGs2S3i0nl+yc2Fv+6/UW3i9MS7Eo6m07qufbaY8+h0O3MIqzNOzis4?=
 =?us-ascii?Q?LGc2LdkR7ziKOtztJDBE0qcn9CU/atH+LjcCNrDCCL0YIxNQuvjbTGxc7yKM?=
 =?us-ascii?Q?5lGr0nvdal6JMQcJS6na858jBps5LonV4mH1c60MXo3PQhnKF6ZorxHWDChS?=
 =?us-ascii?Q?HpDDIbDCnItYtO1TVEWdlNfa+JVY+bCcxGG8cW2BaSWBf9hle3kkU++T4aTS?=
 =?us-ascii?Q?gMGjwb3NZdNpTDTPG03Tn1vHvOcjdpdTUvaELW9boOiuI52YJZvH/WN8yLT2?=
 =?us-ascii?Q?o7ILB3Q46Sv70sbt2EvarKDNO5axCqMN6aK4SM2cX0cg0eoJ3H7C7E1XRB2K?=
 =?us-ascii?Q?QiKDTjuQJFVnrcRc2UD6/5qx6F+sqmlZYXi1zTZQiAPJhaMCVsXemdIIFaRG?=
 =?us-ascii?Q?v+cUNID1cMd+0ObzozwpWrrqKPXfs/NxIF738m38N/FipVEObVlkJcTCpNkL?=
 =?us-ascii?Q?OSFOoZrgbm8r5rqHhY72U5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b5OCbKNyDtFhrqu61S9Y4emPDcnwngSJQfddYeE7YyxqE6oGF4IrZI6qegut?=
 =?us-ascii?Q?DuerWnLQcdKNSaqwatDJ5z7dpt77xhNDCemaaTnSSAfce2qfPEfYexaXzeuK?=
 =?us-ascii?Q?Dg+PrEsmp7ikHLcqG1ERY0fPZyEQD66jcQMaWDXKkju5ldZDtVVMhHEEi4qS?=
 =?us-ascii?Q?hi2dQ+z2DFbqjqTZdLGXWVwp2QtYExKDBHs9t55NohJOFc6n9eiNE+QNtX72?=
 =?us-ascii?Q?lYqIYbr/piwMSQUBcVNBngnNnCNXHtX2tpH/gVIrcwfPZp2MF0ovYaiS26Wh?=
 =?us-ascii?Q?P1pKy63hTUZyxu+CeItaI8md6Qmd1JinvlPvI0Q82EExDChwbBPeNbakoGoS?=
 =?us-ascii?Q?2WKXucHLox1jN8cTJF/1yFBaFgvv9C9zfqN+TN5OCJa1V77GJr18s8vmKHjp?=
 =?us-ascii?Q?JO+vnBVPyFlGxy+Bj+Oxmz81QmMy/XEEbwmb/eExrfBca7QK9xgyrHQqo6LT?=
 =?us-ascii?Q?zm9bt3SzRAOi94XAJub487FKnvQpVZxrFMzUY6Xc2Rz5mRMxKBrc5cMxoOSp?=
 =?us-ascii?Q?2GPwkBFTCoUcXXBAsssdAw9iPzvZ3rJYsUykSvM2y9tdFb872HPZYRTjB4+W?=
 =?us-ascii?Q?NTMnJ0SKeUMG/qoAXcguj08PFYey3Sy0Ltf/DAAFkGxWKF6xKFF6+eI2KmwD?=
 =?us-ascii?Q?vgV4C1tR77q5j1PTPKku8IbIa8+shWWbNGbwqX2phV0GZGpFlnmt7+Lieq68?=
 =?us-ascii?Q?frwAI5Tv3oif0PLn2MmIqRoUGJNHoJAnx1ka/SM3DsN0yNzHKO7nbOL1mm+a?=
 =?us-ascii?Q?5EEMAZ633m+RMQDcS0nuaBENzqgec9U+pqWjAIxlQH1SgTw8xmQVtbgRbMcT?=
 =?us-ascii?Q?XmKHYUTiuedAiGxcNboHiRSr4C3nNa96SXBqC6c9vv5JDYjZDp1Ny9CgI8EE?=
 =?us-ascii?Q?YZJ3/bpmwnHhMViB9Qlc9zLS8CPL7psJv2UNUFn6YNWY4ICQTrZsKN+qGimP?=
 =?us-ascii?Q?OzGYDh0WyaweGSJNzVmbtabANKZ1W6Vfl/SRqLjUhHaTl+OofpUIOwwoQRN/?=
 =?us-ascii?Q?TfonV5CvKPdO6M1UEQWwdCFgRxf1yIxu0m6rOhZnmCsqgd8pX4q63LQI8OOO?=
 =?us-ascii?Q?kcC6XLRUpUgW79RFxn1KNdi0hA6smwpRfqa1+U8xPl540lvde+tZaKmfEzpY?=
 =?us-ascii?Q?uXxRoxC/KzBfA3kZZ9rsISz7jwKE9t7TG+rGK+MEtgdjwPs0VWUCkRx1l3OX?=
 =?us-ascii?Q?yX1gbIs7WVpIffYDBHN+bvLlnJZgigi2K4HosMNDTW8F01SXeV+/0993XTvN?=
 =?us-ascii?Q?Uhp30iE5R487RuTf9col3xsn+dlsAcLpANI0IustPIdHRw7Rgfx9TtQyoFEB?=
 =?us-ascii?Q?zS2ikNWv5Otk8br2R655KymGCxrgP8LE16MYTGskYBYTriSWmDyMtZlRJT+F?=
 =?us-ascii?Q?4ulXO8xYHhIvqexzcs+BJZtrws4M65k8cUgPsGZbX4Gj+XOePjfxNaF3NY9x?=
 =?us-ascii?Q?gs34gO8ml21y62ntCfG9LI7eMrZxfUBcltNpBwgjkQHKaLyFQOObA9/cbGrJ?=
 =?us-ascii?Q?9NGwfDtF87WbtebuQn7gHgzYB2rP17N6WK/GfBFL8sSKDhYERzDEJ4DOmfhi?=
 =?us-ascii?Q?k4Qy+YviyMWjqI5WuH8gsIFts2BTr1d5+uROSSG3Z8KXd6avf6urzw3Cc7et?=
 =?us-ascii?Q?KerD7h991PZ7x/G138HmII+aSdVj0z0N/GqSZqlfRMNJtF28c3+FLCWkN6oz?=
 =?us-ascii?Q?42LsSFeWIi0/mZEdZK99fZrUY9pQb5EJC4CuRUBLPb8+LOJ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c6e678-2ab1-4cbf-9d07-08de5cf9d16a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 16:41:56.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfGiETJv1GOb0Gt6zUoZdpL+ZtqZk5E5uOIQcSL8pvIfReuEeR65n8jQ/fj3ifREFMguIm4G+MPVSDCspK/gVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_084202_038238_374EBC06 
X-CRM114-Status: GOOD (  23.00  )
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

On Mon, Jan 26, 2026 at 05:11:56PM +0800, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices:
>
> 1) SDMA2 transactions are set to user-mode in this particular case.
> 2) This type of script doesn't use the peripheral interface (connected
> directly to SPBA), but it uses the peripheral DMA interface, then the
> SDMA2-issued transactions are subjected to AIPSTZ5's security-related
> checks.
>
> So need to clear the Supervisor Protect bit of SPBA2, otherwise the sdma
> script can't work. As the imx-aipstz is a common driver for all aips bus,
> so set default value (zero) for all opacr registers.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v2:
> - refine the commit message
> - remove the unneeded initialize value
>
>  drivers/bus/imx-aipstz.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
> index 5fdf377f5d06..83371e5b35a2 100644
> --- a/drivers/bus/imx-aipstz.c
> +++ b/drivers/bus/imx-aipstz.c
> @@ -11,9 +11,19 @@
>  #include <linux/regmap.h>
>
>  #define IMX_AIPSTZ_MPR0 0x0
> +#define IMX_AIPSTZ_OPACR0 0x40
> +#define IMX_AIPSTZ_OPACR1 0x44
> +#define IMX_AIPSTZ_OPACR2 0x48
> +#define IMX_AIPSTZ_OPACR3 0x4c
> +#define IMX_AIPSTZ_OPACR4 0x50
>
>  struct imx_aipstz_config {
>  	u32 mpr0;
> +	u32 opacr0;
> +	u32 opacr1;
> +	u32 opacr2;
> +	u32 opacr3;
> +	u32 opacr4;
>  };
>
>  struct imx_aipstz_data {
> @@ -24,6 +34,11 @@ struct imx_aipstz_data {
>  static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
>  {
>  	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
> +	writel(data->default_cfg->opacr0, data->base + IMX_AIPSTZ_OPACR0);
> +	writel(data->default_cfg->opacr1, data->base + IMX_AIPSTZ_OPACR1);
> +	writel(data->default_cfg->opacr2, data->base + IMX_AIPSTZ_OPACR2);
> +	writel(data->default_cfg->opacr3, data->base + IMX_AIPSTZ_OPACR3);
> +	writel(data->default_cfg->opacr4, data->base + IMX_AIPSTZ_OPACR4);
>  }
>
>  static const struct of_device_id imx_aipstz_match_table[] = {
> --
> 2.34.1
>

