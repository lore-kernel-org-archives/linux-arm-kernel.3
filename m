Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4149BD10F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 05:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vEwTvyWGvX271jza1v21caqYIlFSAYV0ATkPMxEnHVE=; b=v6iSp309IxfbHUsd8fIY4qPtLy
	Y+CSQdAw/WJzEpScNQu2RKX5pdfI4qNUZ7VE9nS+SJ1uEykaVpG6arec6rTeEQ3MZkSx5WRBx+AKH
	u02XnxXrLvkYPobP6aRanI4Uta8anz1i8KHxyB8MX1f4hQwIrFjKR5hWCvXkILChlVRhwkHcY8j27
	v5IRXmSFa719ChDUZtX6DQ8jKFa3I9GmtrQrwtSejTcOcTrk4y5wynbKtZwncU1iCGT6bDaq6EfZS
	xgSMpbOcMdgE7YpIlnRcO/j55X1bG2VyZ6QsL2LGC/5z+wXbjrFqi9/Xk/eXT/BkKsHlEkSg25hkH
	N2hM4c5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuBY-00000008NCI-0Vf5;
	Mon, 18 Nov 2024 05:20:28 +0000
Received: from mail-vi1eur03on20614.outbound.protection.outlook.com ([2a01:111:f403:260c::614] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuAa-00000008Myr-3yvy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 05:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggbusprMn3HTiRq4T9n1079OGvy7u7O5Cw+yoA5vAyCbElU2D/RmQICD+z+PHUsxwO3EiB9etMJBSoSmQp33AKJ0Jy6revF357BEsP/wBoBuU5Jju1/Eq1RVyT9zSa1U6ZoWhwlcWsdJqr0TfWIN/lStQe402/4+NgDQ2+EaygU7xLveDtXwukdh6Ur2zqEgz23Aj5wC0QZl/oHAVjz7ZvmF6+JQNUcWWiWdiCRmv22786+GsNS8VYHyZozDCt8Stn4lthq1E0odn2onXx1MxCYPF66vzAyf5X8YNNSGF9+YuAgz4AmoJWRQvlDSCC7dP9b+eoxfUbU5hOXfnwGwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEwTvyWGvX271jza1v21caqYIlFSAYV0ATkPMxEnHVE=;
 b=hsRnxW+9uFdM+lFFRo5i04AIUTPNFrv402pq9hBUBQqz+LUDyqcXz1GFo5mmiRt6LN1AEqDV889nWJS2ukLnUJF/VYX/bPJ2WqLnWM34VrM9dZrd9Qkhl9gUeL7ttbr60h7xbQpaD7QvGuMoGQ6eMJzRtP/sxItsms01Ddvj11EJcWpr6eIEV5IOBZVKCY050M2r2Pml4hNdxMWCa3KTdb+nQ2TmuSa0nqCkzhiijhNfkU7efMlE0QYdsiG77QCtQLvA3J6fOECkDwINqc9MelyzRAOePiJSqAnF6vgWA1BokW5gAMu+F3H/GtyJOW33r421pfgXCz92ucydP3ht9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEwTvyWGvX271jza1v21caqYIlFSAYV0ATkPMxEnHVE=;
 b=DG9O8skxIpBerUm7DJIPuv9GpDadn/Tv+OQugdYFUlnOja6UYMczgRaSS5gjhNxMVUJWtZE9p2jre5ZaHaZikFrflG1jKVpnWTNKLHfAwUiPwZjdJNiNRK+chWleUkPogA0eZA5ViQcI+Zh7sNiHeXk84CL3KHWof9D0M59GG4Ab39lfMVrY+JoydhJf8zN0BDJb3hHGdOWYNZaYoQ1B7jb2SbYeCcb1IqLJmlCPqA/cycvDu7zMvlDqHrIK2Gq5oNkm9SAgILFrDBRtsQ/nsilSoEvkBDNEcKzvej9QIwVfs4MfVTxxYQncSOgy9/lFTxvyiIZIcdvo1vgS0IL4QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7058.eurprd04.prod.outlook.com (2603:10a6:208:195::24)
 by AM9PR04MB7508.eurprd04.prod.outlook.com (2603:10a6:20b:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 05:19:19 +0000
Received: from AM0PR04MB7058.eurprd04.prod.outlook.com
 ([fe80::d7ed:56bd:30e4:4ed5]) by AM0PR04MB7058.eurprd04.prod.outlook.com
 ([fe80::d7ed:56bd:30e4:4ed5%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 05:19:19 +0000
From: Pengfei Li <pengfei.li_1@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com,
	marex@denx.de,
	hvilleneuve@dimonoff.com,
	peng.fan@nxp.com,
	hiago.franco@toradex.com,
	frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com,
	mwalle@kernel.org,
	m.othacehe@gmail.com,
	Max.Merchel@ew.tq-group.com,
	tharvey@gateworks.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	neil.armstrong@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com,
	ye.li@nxp.com,
	aisheng.dong@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v2 0/4] Add i.MX91 platform support
Date: Mon, 18 Nov 2024 13:15:37 +0800
Message-Id: <20241118051541.2621360-1-pengfei.li_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To AM0PR04MB7058.eurprd04.prod.outlook.com
 (2603:10a6:208:195::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7058:EE_|AM9PR04MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ff7d80-9e4f-48d9-a6c8-08dd07908da1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jeLWcSGLhES6fmuUCeuJBSCJ+gP1tQb5ePd1IFa89b3mtxmWFBgzFtmzhp9g?=
 =?us-ascii?Q?+0b5pjsO6VePjJm6USuppfAUWPk4xI44iRX7ec4Yz2v5a5uFxhKqfO7erwEV?=
 =?us-ascii?Q?TIQOCMPFwi0hZOxkWQhGnfTT/nwXSd5wcVKOv9G36boUvrmVm7uCdb0LmCgM?=
 =?us-ascii?Q?ROBACRL7EyaUayFEMwZw2798zW2eIhCpTkle5X/zBVKDH2rDyeeUWv3vl1A7?=
 =?us-ascii?Q?WB+1o/0UE2nv5P9BcaQ0voW1zDWVZUQde66hjam6V45DJku9c8fKs7hMSAAu?=
 =?us-ascii?Q?Xz5wqhXIdb5mdCgCWAqZH64PX31gxKPrMCd0+Afev7lMDD2GIIyW7NvtOjek?=
 =?us-ascii?Q?t+ijDYNMWhqWw7uRpq6MGCmIWQLNFIG0WsCi3nhbmFVUh8pOGF5T7BXD56rc?=
 =?us-ascii?Q?fK1QjrDc8SSbjO7OJl+NMpwpwheK/4wgf19ZfWwaIlGie+1FjGhL+MkSpfMm?=
 =?us-ascii?Q?lyQRcGCjgFspazL0t/3YPTnh7T645UEp/WzIdy89FPG1VXeNnChkfJGrKyDv?=
 =?us-ascii?Q?tHr1WIiyE7tuPMjqyrsM+kb2Z2Hzj14jm53+yOL4FrjO+amnaNJ0ROpl1ytg?=
 =?us-ascii?Q?Ede/tyWqAZBXuLTkbNkRSw/3UiwzsWZcQTNuHj0wnSgpb7jslH0mzQOlajLC?=
 =?us-ascii?Q?ai8rilZDoQXOfBSFz9egiqtrKnyfvmqw6deitzOqS9Yn4ozw06k2TxOC2Qnr?=
 =?us-ascii?Q?cZUlDnbrBt0dhacbI9d21QMtLYsQn5UlmBzIquWR60/8V6qB2TA1+o5xSVZs?=
 =?us-ascii?Q?VeVI1vVKjKQZEXLWmd8w4c8GzZ5/sNz1mAYyB1dnuQHB7l3WJAxBg8ePZcBQ?=
 =?us-ascii?Q?RCvp9gKFAbCQhxuQkbZua8sKTQM87FIUJsmBBtyJcCAkXhXgni8f5gZrs0B/?=
 =?us-ascii?Q?RpIUv2150mZqCfT5L3oL3iYTw+0neoiGuc/gbAbsVb+DxCGWdclAgI2IV381?=
 =?us-ascii?Q?xCPk/rKM71tM0qjGfBsdKToSA2fAl6yPbgWGkqKTflzgPyXMb8COYvtqSHB5?=
 =?us-ascii?Q?qTcDoaMmdHwxbu9oTuFVRelWUr1ZEXymasLgsZNYKnADl+3ALhZLBdpudlvB?=
 =?us-ascii?Q?kabHqEpaUD7X0OuiVR7p/wpRN2gMMM7A8bMi4IRiFkC1yY7fRp0tGqvL5Coi?=
 =?us-ascii?Q?GMskY82YD7W19bYQcVxPMcb/XKJZWcMdx4HYtohiNhPdwi+TvkQEIykfTlNh?=
 =?us-ascii?Q?qVXqeA1TrDJO5k15jwMkD79K7rHEl8xZIGNl6A+AeRgl2k3R6ofYr4Vfl95E?=
 =?us-ascii?Q?jgIcABovaZhaTW8BdsJSsHCAkvCtST/3/AjCyJJizJXVLfz0tRQtB5VjhVdv?=
 =?us-ascii?Q?IZblNJg8SJAnUJjapRdzkpbCIWEOPa6kNgLLufM8b865Prthno00ZjpN2rTA?=
 =?us-ascii?Q?Og4Fu7tPGeuip/sCKATeD2a8Etid?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7058.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKVbyOd18MR6qPb7EVPPrPLUmDDzHanxZgNtA8E9mT2h6NvH+gXkT34ORxh9?=
 =?us-ascii?Q?8o8hNUFh3TY1IU8NpFw3ArtybkOWNrTNMxwOeuBaSgCzrDU0K0b1mwLPJaS0?=
 =?us-ascii?Q?fcyxG9MK2e1Q/asDKCg/eR04mJVzP38mecUK3tBoLcuE5mUlt7njieVCCiaz?=
 =?us-ascii?Q?9f8+WbNgk1p6C1iHXATpNUu7LR4F2MW/IY3ISC6odi4R8RZvtW2w4p34/Z73?=
 =?us-ascii?Q?197mJZc13VsVS4M2OWs9Gp1su98D9tWOS2BDmQYJs6gEWJAHCUimQQFw4J09?=
 =?us-ascii?Q?92EGvyevIW+l2Iv1vxtKqtcVRDM+T+gZeRnpBYdf/6hx8wZxZ/+BBuAXmRdI?=
 =?us-ascii?Q?1ktYu6DjUQd9CYgi0DfMNSaMoaVNO72V6gYU+71O5zZ2paeiWrz8/TPzUM8m?=
 =?us-ascii?Q?xLict+eXO3YzT1yztsDsZl/PHNV5vXRelA5IG7uYGafDEoqcZAwI3IDv47JZ?=
 =?us-ascii?Q?wgEewzzNXuA8WWpm32Dg+IJw5ouwQCQEe9FkZkpYe/bNvFAX/fQWFsADyG3P?=
 =?us-ascii?Q?tBlzlAah3g6cZGwtY3Bi8EWV8OxXYTqCKtcYhgVDGev1nbFq9O4eH9kZ3V0L?=
 =?us-ascii?Q?HvfHzJOYXw61j9rH1+DRVObxt8687iez/Nu4tWGJwdeJVfgdgfiJ5feZwN4p?=
 =?us-ascii?Q?LSprtXDsIkfkhQ8KZrphlSBzuf6mJGV7e9Tc7o4J6Uw9ACzPDLkarCeUJskI?=
 =?us-ascii?Q?DYprFF2TY2WJa8+rlO55okNjSipKPZxEM71gjLTMcDkmVy1Km4GcGew2sh1t?=
 =?us-ascii?Q?wEUCxGY8hdqqDiSfJ/VmCicT1qfoJ2DM1/6/C4OykpZqsYSHXwGOprhokUgU?=
 =?us-ascii?Q?qhAp8uI173nSz6d9xSsk/mxkBhEu1x4ASLU+WXqAV7fw0A4MnaGanOUS79sf?=
 =?us-ascii?Q?UbS6rWxSGhvl9U77cCnsGO9B67OzK1069XHUauyLfPe7x6PlszLbPwQ35nj8?=
 =?us-ascii?Q?7t45dVhV59ZZNK4lZbixrVpyL1XrQmdyChwK3zvFC432eR8lBbNulZmwAg6h?=
 =?us-ascii?Q?InaKlqcWX/MYpqBK3kycuYoM3VHXP+aI5HTHmmkOjAA2GrsFrzzok/jWysEj?=
 =?us-ascii?Q?iDrhkF5zgHoyyC0dfXDg1PoZmV7HTxbwV5OQZYH/hrExpX2aZSzGFe1OxO6E?=
 =?us-ascii?Q?H8qHpaEPXRn5T86zrioQZ52RY6RmWh2UfWkyFP8LXfkPBfw2YaGOPXZvtDIG?=
 =?us-ascii?Q?t9UfsFM2069HxkPQdXpsmgg2AAjyX6sIbL884RuKehwi4uXWge9fLsmyrlIp?=
 =?us-ascii?Q?1/eCW9uv+GwneqIklthOTtvsMUTQCM3YY0UVMekSualWxQIRhZUICKco76GB?=
 =?us-ascii?Q?bqf8T54jJh7HXeK60NOS8aVc5I77xrTWAdPQV7IqNPf8/f8ZzfoPlpy3erJy?=
 =?us-ascii?Q?0/tL9EtafZdZ1zuHKHYzOi1Ppy+TNMKqKDB7StK2JNlg4TA/ElceDPhXdP+k?=
 =?us-ascii?Q?Sm5VPZoEJ8udm1fiFgxSoyBeaby6JhcY+IXPJ2xmI/X5ICdFJojExOztGHZt?=
 =?us-ascii?Q?PYM1QIitcZogI7vPaMBv0kCp/pC/3scdTgGIf6rx+CF0Z9enqo/T/x9ntcGm?=
 =?us-ascii?Q?8Vrpe0U9rqmjLFFFYtEw/eS6Ily3sZprs07qcSuh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ff7d80-9e4f-48d9-a6c8-08dd07908da1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7058.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 05:19:19.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyfwoED+VpFxioroylVQK3SMsZCkVZRQO7eszq+mALwDDtQJ8LPMYaXZKgcBzc2Q3z5fGya1edNaipWI8FLt1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_211929_042469_BD18FD8D 
X-CRM114-Status: GOOD (  12.42  )
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

The design of the i.MX91 platform is very similar to i.MX93.
The mainly difference between i.MX91 and i.MX93 is as follows:
- i.MX91 removed some clocks and modified the names of some clocks.
- i.MX91 only has one A core
- i.MX91 has different pinmux

Therefore, i.MX91 can reuse i.MX93 dtsi.

---
Change for v2:
- change ddr node pmu comaptible
- remove mu1 and mu2
- change iomux node compatible and enable 91 pinctrl
- refine commit message for patch #2
- change hex to lowercase in pinfunc.h
- ordering nodes with the dt-format tool
- link to v1: https://lore.kernel.org/all/20241108022703.1877171-1-pengfei.li_1@nxp.com/

Pengfei Li (4):
  dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
  arm64: dts: freescale: Add i.MX91 dtsi support
  arm64: dts: freescale: Add i.MX91 11x11 EVK basic support
  arm64: defconfig: enable i.MX91 pinctrl

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 812 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
 arch/arm64/configs/defconfig                  |   1 +
 6 files changed, 1660 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi

-- 
2.34.1


