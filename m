Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0010ED674
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PJCEYSiRHHD4tXST84TYsbz7xshDfDIUvTro0ScgAQ=; b=MFe4N3UmLjbp6GuWAh6JJUS5Si
	KaFtLABA9hlStomZ6ojaEewMwC+cdcaVR9LaLzlf9Uxk8DGOOohlmGW19r2e/VFCDlEy6VJVtYuS4
	9aMxahKWC04zPPo+0XD2ZBylcgIiIAHbCg0CsBujRGPI4YoriTIPa2XvJPM5/GFJ0I9u2jUYUFm0S
	yHesd/8W3NRwGcp4FvU8ULILoDm5ZcytogJxq6AS1vwamVeOob3ZF67Ml1lyP+TV5VN6/vd44pjAE
	61OPxuxE2NjjoC28Kk1YbVmHsxzonsqd38+fXUqRTMXNw/qHUI9vAlsUkxSFci1Y2ogRBT449+KL+
	4rSIultg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68P5-00000007d2A-2k15;
	Fri, 27 Mar 2026 14:43:15 +0000
Received: from mail-northeuropeazon11010052.outbound.protection.outlook.com ([52.101.84.52] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68P2-00000007d1W-2kJF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tU9H+GrUlAGzGYJEHZMe+/f+M1Nl31SZWaJk2qDNhMlVqt91DDLNcnX1/Dv/RWaSrOzJ3Awo9xMPMayU9cR3DqKatEeyCZbI5U+zHQ8cueEqU5dStc/7sprlJtHgRLSf17xh4zsEnrbEieZGfHYcjhTTgCQ77j4Ek+/XG3b1obL69qxkTM/INYgldz+xG6hnKPbh1KhhUJ0tHtVaXoHnCHoQkMHxJ66HNP21gP13PQgPkD7NB4JZ91xIRAcSBIJGoC6chVQZPnhRQFMtpTK5yh3DgnXayFYkgTbO7u8Kux/P3+rIaVvRiU3pUogPS/6h5faPFWt2S9ij/wcyfP4c3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PJCEYSiRHHD4tXST84TYsbz7xshDfDIUvTro0ScgAQ=;
 b=nVgCpJE9LSNc4TKk6D/Vk2VFg6ku1JHOWKqzyPdCdVxCdOrAVNErPN2N+n6sTrnCZYTO4aGRVgTlWnjMwHBXFdJzjTkb+vkczBvZH0JPqa9l/CxWbNWrj/r+adbAANgd+xCkVc9GuJ56dSlWIHxqUFyf9NWatYsgs+iyMPduonAVOwvjw6Pms+D8boqvfqumJtZ1YNy2RgoPhpTXkQc2Zi3h1BffB7LtCIeriDPvuii1JYpoAy8EWlsWz7uuvONMG463HnqZ6g66CbkXP7DUVyK2Q4Y9zB1RGSfs1OBMnQ+AYKhMziLTv8xvGCkJ1ubGrPUPjm9p2lCYvHUvbFhiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PJCEYSiRHHD4tXST84TYsbz7xshDfDIUvTro0ScgAQ=;
 b=PkTPT35OKE1wRrgfXSPKwm3z69pTivQ3Y9h8E3/49w/3L+PkoefudfqPk1FdHaUTTu4j5tj/s6lFc/M+nJbo3R2M8uRryNEbdqrCrGzzS20xSaoLrIgRy9j1ja7VDRhRgPMogv/XSHbGsOm56BKZytrRkZZkyT/X0/+5bm7pgfOcUU9O8e7fryy+loD3LmQ8GQoAgEvkTLFm5hPHfJjDXJEP0sVal415P2u8ogncGuRiAipONbSvyIQkt3/jyO4U+UpwKFE11yVw5fIjg00KFBxfx5k5R5rCYo6lZM1rIIXmwfJ7k7Z0XUdZGzgrjVqwJX9kFBF8PYtWQi2++LTT5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7615.eurprd04.prod.outlook.com (2603:10a6:102:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 14:43:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 14:43:08 +0000
Date: Fri, 27 Mar 2026 10:42:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <acaXcwF16Gzhxz5p@lizhi-Precision-Tower-5810>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
 <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cca9ba1-98fb-43c7-07f9-08de8c0f2959
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|7416014|366016|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ebsue5g9SCtfhl0nMlfeunCTTthtejQRoTNsP/OeBybPXtAeITuvxK+1WRdvzqXnEAJ8KqwFB+5V5prAEoYMZUu1EtvA/S4GGJf7Nh5FU5YIaWJfr4p9v9lgoftpCTMRGIO1MEz27zkhvzlFWgfabNG2cIoF+aBcC7g+Gb1ojfuP9tVDmqra5yqhcbd57PNQ2MzZwqAXUOAlc8zC8ZN28lnZ0XQidsVPLDBfFoiMXQUayM6qArcFNztIXh7YqNUxS9SdAKsNn/4SQuWgl3Ww/wLsC5gZALjUIYjng28Ub9Sx1bmRvv11sBCSFGKHf8bTYGBbL68qoxpN6bhJREPy419bEAVgPhPLTdiMt2mOB3UF6oOL8iIJNXFausSCHpjQWY6WowFkCBW2uMxjsWs4d0bnrnfmOWcXpKvZJVx773pGDog7QiGKGgoKJvIe+6d+SUXrBKsxQv5BhpBJs5OPvqVCYdbfqTee11WVoFE7shRNJ8R9vPkRfamOI+wTVVfM9jCEAseQouwRP8rR0D6f8C7AwZ5BX4W+xW6jL71MALCG9qx04ZGQcNgts4ItDgw52/whlmFh4fF29RKzcP2CoO/fGCQ87MoXZucgULfB0xgpTACUSo3SZJHV6ZwzYftKazFDgqyGh6AMX05yxT9LTYfM03EkZIiMwLcdRZqyvzlbDodeOgKm8oQUA7lKQvLl++GMgkATtvJdx2AnhY7rlbaMSruwNBrhOumMjLaQXtEGxq/EHwwyJ2O7ET8svC3mB+VQYQWiaOvDOpzDdPK6Bk75Px26oDafBAfR1OVp4Th6/pyGyr5Ndu8YiM82IFHT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(7416014)(366016)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4bwjMaj40ZsgVXpTTkuBGcL4S7Jrvga0Rug1ndrtDPLAM+WtJALBh5vdH+t?=
 =?us-ascii?Q?/WDagBDSWzN5r6AnyLey0NVarUM7SWrVFn+knzjkwjU02hStXtz4NmD931qO?=
 =?us-ascii?Q?3i4alCsRwjagI4nXRaADo4unEXsjj0ybJZdZJ0owWOXT/EIz3aHyYF1J9Gym?=
 =?us-ascii?Q?inbEpP/xPDk9qB96W79NFHKcbDgwWs0X99XKcMSrSbma53RuhA8YnL0x8jbI?=
 =?us-ascii?Q?Kjom69gi16oNCmcG+l710wEsRJbAmq0izqKYQMIbVKfFv7ocz/XPdL5pizLc?=
 =?us-ascii?Q?z1CqrTzhlMOG3JlyBV4FHx3DuZZUUzhRMhf02I911Mydnk22+jO6exc0rQyn?=
 =?us-ascii?Q?JfmOq1ytM2ph8cJUB31iAsqkRCn1jnB/P1LtG4Xh5Bfm6EiFVBt5si6K55is?=
 =?us-ascii?Q?3lfLwZhfcbgQJRIR7OUkPjG3+v0NQeUYyUnczJSTOY7ZjQ/PUnmtjU/uKsNB?=
 =?us-ascii?Q?7Rf+1C9/lwUeVsGXV37E/ajPQvJ1coe9Gy5Zs4CC4IaW3zdHcLChUVNL8vPs?=
 =?us-ascii?Q?T2Kx6OEsOfojoPu76ePdA0mINxpk5Jf+l8txdCEeKqxG9/npDGANtK2kjrhg?=
 =?us-ascii?Q?ET6kTVkoPlx3tUksw79wqsItxFKYsaY8w2swqztHQUgI8avxOIqNVd89JAeO?=
 =?us-ascii?Q?rl81BGrPyiv71aEdw7fn1+P5y91Dpnnz/6dTWOI9pOKJL9+wJimk5phpTo7W?=
 =?us-ascii?Q?EZxZ9tdS5tqFcMKop6nIAu/41+z/d0eT9xd/sOZQjekJyxqPcTk1qAWMtMN1?=
 =?us-ascii?Q?HrfNXn7Y51v/TudwMuCevwYUCckRFXE791SsYnbyE5q4nueW48j5fI2ZbDxj?=
 =?us-ascii?Q?Cw8jMZVZsZoCvmVL+h/U7lCJwUJf+ci61gYobqatKXBXPO+oj1fCi0B1uMzw?=
 =?us-ascii?Q?095FuSHfsgOfYU4FxThwx26QCEieSQVqhPBkYtC5QSIiy9zKOiaxkUhkokVy?=
 =?us-ascii?Q?rsOhMShEujAgOmlh+cukppyKJTbc72Kf72z6Y4rDasA20oLGNpIF5Hfxb53f?=
 =?us-ascii?Q?oWSnbqJVBoF4IG/UURyfwTvOxY/uK6dSHhd20xF8Be3byWlS64V+dFj35vGf?=
 =?us-ascii?Q?ooc9zqyCi+gZq0daE/il8yR3filBl+fpCBJL30yuydZ6nw/tU8H19rbZjnQ3?=
 =?us-ascii?Q?lZBWWyhiDRygyGT68LGu+E0idtfdWVlQ2dl342iFKPYp34GMpXr7DiZWYXji?=
 =?us-ascii?Q?DjrtWKRrVvHg9T3uUfpfy/YzkqD3DEKBwFAj8K9bv1cYu+ns4guFX4hgp6EF?=
 =?us-ascii?Q?rQILvsF7u05y+zZ+ep43p2nKngFa7GjAfrYnhoEWXhQBLdZ8usgaLXU6rI3M?=
 =?us-ascii?Q?kZ6UFEtgp/o80RvTIqUYbf2IvxG8hFxbCHj4iQlshzJEZiKcvdn5QMAc7IVr?=
 =?us-ascii?Q?i3GPbNIYBDlt6StsHzZ/WHTH93B0yB0BTqKYQB0WcgBH+V8q/gFhaWgjhzYO?=
 =?us-ascii?Q?kYUYjPtoxCbaec1WcS3N1pRO0L71+JF/jjkjto4fir92kwXMbQxLMDOoEGeA?=
 =?us-ascii?Q?tZCkvxOVkE7bdeNOs2zpU3vdqw1IGcvMwqMEwDZPMl5jhGuIjP7oe503/Z6N?=
 =?us-ascii?Q?4fvFaw0AzQwum6qWW6KDcFPCIBBRrVmeHYD7Evd4Ji0cRNBiBOfS+KcCj2+B?=
 =?us-ascii?Q?5Dn9J8UUdV/6gXiyifvLnp/GsbJ2QRT4HMFotzpwHgmCsc4SN4XBCW1wnbxw?=
 =?us-ascii?Q?l0I7xHxipJJBk3F3VRx/hDVbUpIvkhdsSg8esNsZIf2FOvmbehaGPiwLyv6E?=
 =?us-ascii?Q?N4Fk01iTSA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cca9ba1-98fb-43c7-07f9-08de8c0f2959
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 14:43:08.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3zktQHXfnFyYtTC2LWiIwGfQywxfRmdkdvIyXHyYsNtjURBxFIpGXuVCuc0+cxIBLBBRRiBoUH+hfqalEv0wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_074312_697197_349FE824 
X-CRM114-Status: GOOD (  26.33  )
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

On Fri, Jan 23, 2026 at 02:34:29PM -0500, Frank Li wrote:
> On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> > On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > > If the IMX media pipeline is configured to receive multiple video
> > > > inputs, the second input stream may be broken on start. This happens if
> > > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > > the first stream is already running.
> > > >
> > > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > > The media pipeline is only validated on the first start. Thus, any later
> > > > start of the media pipeline skips the validation and directly starts
> > > > streaming. This may leave the hardware in an inconsistent state compared
> > > > to the driver configuration. Moving the hardware configuration to the
> > > > stream start to make sure that the hardware is configured correctly.
> > > >
> > > > Patch 1 removes the caching of the upstream mbus_config in
> > > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > > to get rid of this implicit dependency.
> > > >
> > > > Patch 2 actually moves the hardware register setting from
> > > > csi_link_validate to csi_start to fix the skipped hardware
> > > > reconfiguration.
> > >
> > > Gentle ping.
> >
> > Is there anything still missing to get these patches applied?
>

Applied, it should be media-committers/next branch, I have not permission
to change patchwork stage.

Frank

> Add Laurent Pinchart.
>
> Frank
>
> >
> > Michael
> >
> > > >
> > > > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > > > ---
> > > > Changes in v2:
> > > > - Document changed locking in commit message
> > > > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > > >
> > > > ---
> > > > Michael Tretter (2):
> > > >       media: staging: imx: request mbus_config in csi_start
> > > >       media: staging: imx: configure src_mux in csi_start
> > > >
> > > >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> > > >  1 file changed, 48 insertions(+), 36 deletions(-)
> > > > ---
> > > > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > > > change-id: 20251105-media-imx-fixes-acef77c7ba12

