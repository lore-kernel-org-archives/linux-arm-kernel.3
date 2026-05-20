Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA37BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvgUB7u+QoMR3oBi/J+RWO7KhGkHgcoLzVUiQYdyRLA=; b=SJtARk9qdmSr/CLy+QOan9IHkN
	zO1MHP46Ku6VYwyaXTFjD+W36FgQkX97WmV3Vbvnbo4swSzYIrNtQjrHc13d+QJp1VReIjltCN5DF
	JeZ5KRtSf3xSfdGSEJ1pVyQEtfHIPliOxTS5Eutxf1lVzZ/E4mah59wbZEGzxX0TOUZkQsbOF73fb
	wZgmqsSjzVo7smfl+MtZKtNIN/coKSXmOUAXU8blw3YCLiAF7IbOJyXpgDF0/CuMr8rYzS8J+kz7H
	R9EsF5Ll1yIc9pMpCsIveI5d6Tw+YxnYqQajSIjF2Hr5BVIbmiGQSkSc+r1okUO8SeXWQ24F2gbDT
	mYIhmOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPm24-00000005X8v-06K3;
	Wed, 20 May 2026 18:52:40 +0000
Received: from mail-northeuropeazon11010071.outbound.protection.outlook.com ([52.101.84.71] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPm20-00000005X88-2dhu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:52:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQawPG8OhfIEGN6nLRWIm46THzxpfbLT+p6fsMHsQYHxdgt2J9rlDYCRwg3VoX+OUQNIUj8msDTanGjcOU3emyVwTny3ZdE2DBdKnvjSXROVrf1qZjUdaToiRHmWqmKiabkOVDVyu0sGWgAektr+V2SSyodsRPTtrQzzkzoTa6EFg8dDm5aeU/cIJppB3sW+AYyrTl8MvAVyypEZAorFrax6vry7cdG3xDrOkoKsvn0n+VrJIvagRfdsryobmVsCr9ZnywdPgx2dlzAmez4gO5TNQkYVax0imNb+nYTgD6mntM3V6SpoFI9iRvkgycToQOtEGvy2yF3usp58QUgStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvgUB7u+QoMR3oBi/J+RWO7KhGkHgcoLzVUiQYdyRLA=;
 b=KEJ3d5L9tUttRh/Ga1ngLqB2YUIiHlQ1O9gJb3lCuiDQ3x25btUu97e0q49/LVGnRxWo9GstwHiKsmxsNzaNOkYpNc5mW8cauPXy50zS2B5AlNZj7t6VdYpKGzRY2HV9SL19TMY3kr0YvoKti85RTI+t306ouVvMQ/hxHk40fz9gKpNlVwCOyZI6hRF4E8GY5LxwJS849K6gRs81S+fyZKFhx1EFys4bW0EBwJp/iBI2vHOAu1UY+AmcSFatNIHsiQWnhoGMIMu2hH2hrgHoUlZPaDEYnoAaHvg0s2sODXZWLnnNTMVgq/nrQ2X/ZNOKl2nDggnTYRIDuOX1Zjy2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvgUB7u+QoMR3oBi/J+RWO7KhGkHgcoLzVUiQYdyRLA=;
 b=OYnRyqkkvjXmCQHxNk9FoSbFUdGAzDoERACsonK+EIdx2Ae9oaOCnu7nfHR120aOCz2fqlNtGeS0T62aKfiBX9dst985dXV52y3M1dpn7kn5i15Vrb/C+6Kk6b30z1Kue2iHDtpPIHu28c9qamjlYp0zzfmftngBZnhL91v+kyKTA6BfXYvMqPgIGvUz9ppvOnzhFYzrEkR49Be9oFt+YjMjeYImaKuy4a6NR/cFo8T/+235Xz68dC8EwcVk+v1bELB/xD57nvVNkijzKVVopgOgX+vRo0StnjMwYOZx3st4DPgIILIhs12WM54xciNyJFYpS5OueaRsLtH1BiIgeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:52:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:52:30 +0000
Date: Wed, 20 May 2026 14:52:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <ag4C6MjnOJGjEpKN@lizhi-Precision-Tower-5810>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
 <20260520065452.GA2269979@shlinux88>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520065452.GA2269979@shlinux88>
X-ClientProxiedBy: SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5ce3dd-6bbb-4ff0-7a76-08deb6a0f1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|6133799003|18002099003|56012099003|22082099003|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: J8mXbsInFO22yqTId4TBJfl2Nd7NmRsCge91HZA4+ax6yia4nWAxOkDV50yLTHBruFkpnXyaJTH5r086XrfwjgxDyTKz+K7Eb0R0UrZRXj2An8yHvehiZcN2x/+vzSnmuj57k9Y9E3RA+N78sF6BLlbTpZemU1uoPVeeHZQ3SoI2ZAFr5Ya1L7+NDBCR2ljU7H3YwXEtc98Gxu5F5SHyG9W9ak4ogdDvPBQ69ajwGRs+8AgThsTJgdAVZZdQGJJJSDXt5PK+/bg/dGJbbQWpabCz/KYL19UNQBpk0PF8pwt7cbZzVC7yJ1xB+tx4ymOTKe2GDoZI2Gs4Hz3PHJwZL8VUv8Hn6lkxUnIYplHPS8NJhegFJc4Xv0QII2nos6dFhHrZV0crVFK+S5kqr914nbqMvm0ulvBBQGoRKjC4M5gHKtLLagmFjFTo4v8dbE6vrGROyPGLbBwtk/+r9NJL7T3fioOFwiexoNwQ76d+cWugmY0HiraiTTTBs/l/zFj1wZHXgrutVP5OCYs4ncx9VKRNydaLvFXjuh/WXLw9Y1MhqAsv9we+KiZVvXWoDAkke9Lc/W9hRsR15u+iObQJbiVVMtXfwNe5CFTG4duholJ9cLSTUAWCXk3GbRTHWh2Avz/hWJHHLlSXoI0lErl8f/JXJ6mNwtju6v/a8S8e46omHTBaYqwHpEy/3yiOmdRDmYbH9rEBaereqlAbeKILbqm9mJ3vPBYKmj+KPJFKvfCMWoLLuo3GYcP2qxgPTM5e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(6133799003)(18002099003)(56012099003)(22082099003)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/dA6t9BcK3HjMPo0LYQE/7oSCA70Frxs4MoTL+ahkJ4WZjkSg11hduWYrRU?=
 =?us-ascii?Q?hVBR3gnkdhaFeMPGpgwYm0qKG2GWKfwhY1fRwPSDIIWMzuAZpce1h0Z4yzER?=
 =?us-ascii?Q?KCThK6bPDTwsr+nnIIeb0W+Yz8KGDRPCYSm+ru6GDr8K35ho04jztGKkq7Lb?=
 =?us-ascii?Q?g6dSlHmkE3KatKmoKgseQUkPxYFYPoo52eHw4BsWEcbChd7BPgy+HmjXk3jB?=
 =?us-ascii?Q?rcvsoLKx3tM6gWu4wlobgKiug/1UCmEhIXqfS5csUjcwR+FgzPBdutlhWmgG?=
 =?us-ascii?Q?Po57av4plqkL3F5EZ8hyjdc/3Yz3rLeeNUGMO7/969LBn1/AwDpS6Yjr+Ouu?=
 =?us-ascii?Q?NELIqLEwl+ciFDvJpcBQqEUAoKQUn0l6aRsDgufB9xCWVP5sWFOUvrsd9ikS?=
 =?us-ascii?Q?ZB/xDKCttmaeEsPACScUtqq0JvE/kYjXKlU399pSvOWxj2DcOvz5gYDvdN2x?=
 =?us-ascii?Q?9gEbrTIL4k+VTlHeSEbO1KDKUSmyJw8vXyzl2XuylXmuTpQe8NqDE/bSp527?=
 =?us-ascii?Q?2QwdXnhICdkIfE0GZNCnTr6AqEuJOm+yG/+77GVt/CbgooYyxt+jsFhdpM72?=
 =?us-ascii?Q?Dy/1RfnHo4Kb4194AZ7vkjIxRwcP4lngt1bX3tTxJFxBTYHfSgpjeV/K00tm?=
 =?us-ascii?Q?PyNvo8WzmIrbPVZQ8GSt1e3VAxXNEISAHxe3Yzr1uF81OWvhDIR3bfQKFOIi?=
 =?us-ascii?Q?2+mXykN3tLFEcauuBFr+HnxNa+M6cfXE/tpKLKNinSSE/IdS6LL+tdDFW66v?=
 =?us-ascii?Q?WLJbeiQB3/qXwoRZM47lkw7HcpGeASrcre0UZe6/U60tWQBqzbQRlWI/uuAJ?=
 =?us-ascii?Q?gniceDU6O/aKVPQY0GmbiQZCF4SWMRF/QD+2jFVpmtD3/phT3RAbS9cRupPz?=
 =?us-ascii?Q?u0HV/LmPNe0TB6brs/NdI6Fg2veMCL+LCHytV1xNLP3FOW/z71WL+sv9CFw6?=
 =?us-ascii?Q?a/IAL4SwnPYuBhr3q9iPlC3e4QrwZjbw9jkRXgE69bmb2PHlWhJb0LtHQqdS?=
 =?us-ascii?Q?QZ2/PkVzl0Q3qLOOUQ6okjH8kwG32fMsEhmIg9pGnL2unUuOnQVCw/hd2eLA?=
 =?us-ascii?Q?iAHm1RI7/xlwsSo+hL/qNZ5TIfXUFin5EBk3DQaBVevdRROjD5s6LiuOcqMJ?=
 =?us-ascii?Q?yE2rF8HXFoET+oFyZxGaBYD90pgTJU7GVs8ZYqk0n5dpuFSym2uu4GKGLziG?=
 =?us-ascii?Q?D3SoGDjfcpv93xMqtBlBS9Qkw0oUmmRNocAezTsG5EgHCQcDNeCru4Enfk30?=
 =?us-ascii?Q?c0sONo4w9ho/ZgHqDfm1g4KLh+tKONnYJbXOnsExYtfoxbWGgrWiWNEjYr5b?=
 =?us-ascii?Q?VNxczRjvcONiiLjylrxvnJOlHeJqbVYhcIb7AL2D2CAJpnTzJDgJ3I4hUlpd?=
 =?us-ascii?Q?6im259O+fAcpyIgK/n+mSJanLhVtc1jq0KMHGHvL5HP7QA2irdnhNdwMi2e/?=
 =?us-ascii?Q?g1nyhc/sWWPuLqOg7umlz9Pnbdbgyn+Y33IRAT/msZv4L/CewpNKIkQT6+0a?=
 =?us-ascii?Q?/sC1fzM5mvqqvwyf20lqGVizuAPDr9LERFBMvqWLSX2ao/Sshqjq0gsKm94l?=
 =?us-ascii?Q?oC24zCeeDp7CA8ZbO3yJNsR7xi5A0RdFSG5haX6TcsXgVeLihSMThgCI1FTc?=
 =?us-ascii?Q?VuBPsCFZLySjtmCwmelVgb4DMAEgbmx6HTKC0PWdvcQHek+++PDtabIKkeSs?=
 =?us-ascii?Q?ux7+BXV8SoVvK+GSMgAWRVtLeatiOea8EckoboymYgOaZiJG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5ce3dd-6bbb-4ff0-7a76-08deb6a0f1f4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:52:30.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpzxxwtz/oTn9xaI1AH5PxqV7wwX4egtKdd9MSZxUPPQqSuJ/KAWfcoPwZ45G4YTdmDu80b0mCpZTYaDu0RUAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_115236_676295_DD51C274 
X-CRM114-Status: GOOD (  26.92  )
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

On Wed, May 20, 2026 at 02:54:52PM +0800, Robby Cai wrote:
> On Fri, May 15, 2026 at 10:01:47AM -0400, Frank Li wrote:
> > On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> > > Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> > > on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> > >
> > > The sensors are connected via I2C1 and I2C2, each with proper
> > > endpoint descriptions to form complete media pipelines.
> > >
> > > The resulting pipelines are:
> > >
> > >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> > >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> > >
> > > Both pipelines have been validated on the i.MX8MQ EVK using the
> > > upstream OV5640 driver.
> > >
> > > Both OV5640 sensors share a single reset GPIO on this board,
> > > which prevents independent hardware reset when both cameras
> > > are enabled. As a result, the reset line is kept deasserted
> > > via a GPIO hog, and sensor reset is performed via software.
> >
> > Does reset_control_get_shared() resolve this problem?
> >
>
> No, reset_control_get_shared() does not really solve this issue.
>
> The problem here is not about software coordination, but about the
> hardware topology: both sensors are physically tied to the same reset
> line. This means any reset operation will always affect both devices
> simultaneously, regardless of how the reset framework is used.

Reset framework is resolve this problem. It is quite common that many devices
shared one reset pin.

>
> While reset_control_get_shared() introduces reference counting to avoid
> unintended assertions, it does not allow independent reset control.
> In particular:
>
>   - A reset operation (assert) will still impact both sensors.

yes, only when first devices toggle reset signal. Second device do nothing.

>   - It does not solve the requirement for per-device hardware reset.

It is hardware limitation.

>
> Therefore, using a shared reset control does not provide true isolation
> between the two OV5640 instances.

It is not isolation. Just don't allow second device to toggle reset pin.

>
> Keeping the reset line permanently deasserted (e.g. via GPIO hog) and
> handling initialization through software/power sequencing is a valid
> and practical solution for this hardware design.

If use i2c gpio, expandor driver may probe after sensor driver probe. So
reset may happen after sensor driver probe.

Frank
>
> This matches the intention of the upstream changes as well, where GPIO-
> based resets are treated as simple control signals rather than fully
> isolated reset domains.
>
> In practice, using a shared reset here can even introduce subtle
> interference between the two cameras during probe or power cycling,
> so it is safer to avoid using reset for runtime control entirely.
>
> Regards,
> Robby
>

