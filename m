Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96B6CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ez46oJItG7/uh7Nu/qQE6kqBb6TfUQX4ZJdzBlffT/8=; b=K6hhIdYGo0SlYZdzexvb5c+Qam
	RVesPDC2IGEZw8rNqxaZaph4gh46Yw+sZ08b4BxVYkLjNF2TZXP5GcVW+6ZrNA1iMQVIJS42eRQpT
	jZY7O86cRBbKgsj13Kp+B+w7iJLOmHx8//9VRZl7QvI9VW788h9roM6an+ousoELEm/ACFAVsQef1
	DOY59x2jKvlzkswJbIYi1Y9vIsGabf/Kmy30qh2YpzMoLjFa+aL6OyhXvg0xxTB/JCRV+hlbIi9zU
	RhdTwlQRwKABpygil57uOQnH64UJ2MACX+0IwXaEzI2irJ18ARaygsXCsySbKwmt5XbT8XGPDae0b
	Esgezatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlGY-00000009xKA-0nUY;
	Thu, 11 Jun 2026 19:40:38 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlGS-00000009xCR-3Bk1;
	Thu, 11 Jun 2026 19:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnGanyWX2d6/vCQimiQqQkqpE4RhHLLLsRGJj3lELkvVP2+M/sGrk7RKM+oqimENERELjHpMpFYboZJmtfvPXLUG3O7o+HahX+VU5FL2gw2/65Go79Mdk2XAqA7BTcNKFrUvl6c6AAZn7ebgnYSEWFXKGzv9OUUgVLfSFXVdfsYrtrYKu3lCjcnIi70MC1d+dqskEf4CFlybdA2qjDPzy1JZnH3mWvk2CVE6Z/i8wuC6PFjWYdLuGR9AVl7tIRKuPniYc0OabBTYjt+7kRySakpZcOE34tpFhdk7WIy0BkVqwEV3/Qwh/pLkRlHldUFIluqnnQDsy28RSEqF9XkpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez46oJItG7/uh7Nu/qQE6kqBb6TfUQX4ZJdzBlffT/8=;
 b=MHuom13m4FtuJxtZBLk1VAkUKjv2+OZKGluyAM6A7N4mYROwU/H6OxzXsEMVG+BpRfWzSaSUVvYC2+Ntw7TXAD6NbrVZVfmjW6dP9iLSgvF/60clyJDxMpRY8EotKJvJDp0NqIqzCxbGpf9eW7jwdG9S38yEMJVEHAJE08Hd2JQteSdakFAYx4oilqHnhfAsyuFfQLHBpWuEf12hpJ/G8VxB7Zcz4elwuwvdXCKJKcTZAGp0a1l8lcfRFxbC7NhFAAnGm00mtkjQGjnpaqtsXQtMb98HK54sagKhqarUGekMoGkBnEBp5Q1Em5h86eT0dpnALG98DMQzVFAf+Bha2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez46oJItG7/uh7Nu/qQE6kqBb6TfUQX4ZJdzBlffT/8=;
 b=jEs2L3WNP+t6Y+IaqmNAZ8I34sGm1+/uK0WgdmYktw/z72noOLC54eXBzduFa2Ool9Sv3Ugu5j/PeOOy4vO5fKAIpAf4Dt94/QSuA3d7lWtRDUoRGT9AyuvA9ggTh0rOXnwTPnycgoBovgkmcigl45Dj0k6zvHOcqcMcJ4xELlXGOtzAxR0Jq5MAootR4ig+7mP8OsLZMyroXm3WL0gV0kGcTqFDBTH89YGQmLDDNMne/g/gZEWWlWB33cuKQ2zQmHTb+y0uLw3pKexO2860EPNyOUfCiWkRNszV5NF70Z12XBu4O8jsd5SH6lxmvZSGnUBAr8s07amMvWUl5Wg5Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 19:40:24 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 19:40:24 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 phy-next 4/8] soc: fsl: guts: make it easier to determine on which SoC we are running
Date: Thu, 11 Jun 2026 22:39:36 +0300
Message-Id: <20260611193940.44416-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611193940.44416-1-vladimir.oltean@nxp.com>
References: <20260611193940.44416-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0123.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::20) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: 724e1652-ae0c-4907-3bfb-08dec7f1482f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|19092799006|366016|7416014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: Y92U7ybJgNFDldGL/WmcUn/3f1XLfuZGxo4CiUY3xxAuELBjjdlI2QMIDf+N73i6BHx4UwrdzAcEFNF4vQ9mvT09CwVjrzivMpBRQNIpxSAgV5lTQXezzNOnB363UADlmCyoy21Fm8O0Lf6eIvTaEgU6urUi8sAmtrVQ7ocyemu99MB+vE2gUEl4wKYJaYbD01881anONqcVtFHhVU1ST266q66qFPxZVzdIBoYawOEaFZoc8/jp27uRbvvPBd811UVFiFr0czAaA0Ae/+MCDSMmwfl6yQigmxxo77wzBWvWD00Bz3sb7cuDT9WriNWiaCVRFRElHo6Ormrz77tm8LpA4qKUdb+phdgem+4oGnlw9AdRfxmjdAYEyxG1y1GXrGCO4EddTtgb3AT2iIwTU93S4mJ/Bg/ve0LqonJQo2n5T+pydixzqQXaYVXQmK6daPY13MhGccmW1mrLU7EY+rIZZKG/MaQ1A3A+YpxQbYHc8jHEYgpybznLxhRQOWzsixqdwgFtioyKmQqji4Jv2Qz9VrKq2z/nEY46DBRp+yKcemTLtrlzpfGqs9/g4lklPyOwWdEir8jwWLpWK2KfMTjvLuB5m5JbWLwFQGBcrwjvw8h0iRWb1Qtr0oi4h32k8F1O/zTGXn+rkjewYf6qHP6gCv/0eGOiNTdg6NTl673CW73LvcbBvD5orcjDxcy3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(19092799006)(366016)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RyyPMry2KdtkTqo2i4vsdvIQ08bubaYvcGqN/We8wiRN+qhhlFV583LthSZ+?=
 =?us-ascii?Q?HKF7uvd2NKYDpAF0Gz9qDSiqcMpkIVU6SuUxOCkOfai/IxEtkVKoSnntMPWh?=
 =?us-ascii?Q?CDDLEAQxUl9SXuIc+Azq7QDWbdmp0u8w1mX9PeyfAv3hKpDaSXgjhyRUuhjg?=
 =?us-ascii?Q?DY7cokbcjPgN9bfS5f2Q4qaDfQuVpr+gXUibwq+jmfyFQ9gIP7Tny0/B1ea3?=
 =?us-ascii?Q?MpX0Hhxx9cyF85WftA1eXHhsPxYTlriQhe9Lk5JlWnpnionOIYBiuihupBgm?=
 =?us-ascii?Q?90GFfWBzvwh50vpyyenfTyNTDES5uA9dX5F1Wyx1Kr15iUMe648wqyfVV8yW?=
 =?us-ascii?Q?ElXiWI1AcGOdNgUOaNtiMLG18u9NPeyfj0B4ITVp+TDalAHsRvNE1TOAJwxS?=
 =?us-ascii?Q?Fg55NnJAY2PClCAm4Uoc0P3Hd1QpHXaZR6lYISGyJvxwzPUTrWqYOIE4Wlhd?=
 =?us-ascii?Q?NGkNa6ZJha0CPLLfh6hreQHxSCpV9TX+2WCuFBBnJAfkDtQK8EMaoN+Yf5co?=
 =?us-ascii?Q?UpyqL2t1mkAC0Qej5MIaZ3tZDCixsUd31Vrr+hEDrGppwdojUY3nZI9j5JV8?=
 =?us-ascii?Q?ex2ne6D7aIM3pWcajOzCHjUMLC31/Er2FyQutSTnUUsw7Ft7/ieawCp+Uz34?=
 =?us-ascii?Q?1J+Q63q+Cr+8cC/T7qW77Fy22uHo0ymfRgdagxNBqwdIS05Fc4O1mO1jEa1I?=
 =?us-ascii?Q?mVVc8jHwcTSVLsZEeVxWRBIRX4emkuHBxoB7S/cnP/aP/doljw9+VpGDXdoj?=
 =?us-ascii?Q?NDReOuoahXoNFc6qk888HQASKQf0B2aRODJnIuR8/tRS8M02UdbpA184qwGx?=
 =?us-ascii?Q?0bONZdEYrl7lz8Oj7W5mR8pjlhnMQ2svBC+qTADTkjuC/k6UKqIraaVAgNJ9?=
 =?us-ascii?Q?8AnKiU39GC63EbunhEN6Dm+E1R+Del2NK9Q1ZyhOdWmBLzB5IcgXPMUaxoaD?=
 =?us-ascii?Q?O9wht9cPV879R6MSXi+RrlzAYHljfo3B9jShfQ2RuGKv3G4rlusKr5ab9F7J?=
 =?us-ascii?Q?S9j4SEl/xYFdY+4YYikWBkR8dnHSXZYGxLxdg01EQ5Yk4fkbffMVXATsjHiO?=
 =?us-ascii?Q?/VrCWx+DsGreFRFjBvC714GVwCD7gvKWbZKB3NMaC96uHGsrij91kB2bIpeO?=
 =?us-ascii?Q?emG4XpMHBla8hRmXZDNv2DI73x3ztBeRySHLiKRSUhr8nrAdKL/c5QrsBtLb?=
 =?us-ascii?Q?Ot1mr5G1RQIny06zjcwrnwEcDFFlkYYWnYHu/RaECs7s1Qhtwgyi/wlumZ7s?=
 =?us-ascii?Q?NiYepcHhFSKcgPOV+6GXCo63oJx+DEOmBtaQ6rchT761T0fuhTjzvSnlyVVy?=
 =?us-ascii?Q?ov/3tg3HBOG1gvufu4QETyWgPXcHdxBKbeHNQuZlI9EoFjOjmHDVizXOYwAL?=
 =?us-ascii?Q?bUDREyRmKR4lr3rLrHuh23+6OBJ04avgpn4avuaLU3tRXpfbBSfZpcqDmO4m?=
 =?us-ascii?Q?qn8lTDWPhiYGDDjmIlGKhz+c/eIeGPYTLGH+lpdihGNqsFKfgisjTJAUUCMx?=
 =?us-ascii?Q?5TalHupOJRcE/I2MbyffhU9QTmmHMK01AG1F4OukrRF8GOdDmNbTnay27tjo?=
 =?us-ascii?Q?hyE1kOs1mVI+oMH3dHgDUiOtw74sYIoX6tupfzZPtleeYRVDPjBzfMyg2dEt?=
 =?us-ascii?Q?2UNvSK+pD7DJoU8hCFjBf0hsaIH2kzb/c2SUlIvcCIjnnB+hssdPxo4wW8fN?=
 =?us-ascii?Q?rTweBvvaWtksCNFnQPW8orP9xxkltz+oL1aViTV5uah81HdfoNJjQq7q71HZ?=
 =?us-ascii?Q?fnWqSruwdx5lt9QIOG1AQm4tACL+ivcNAwRdGCr6eMSJJhg5bZja?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724e1652-ae0c-4907-3bfb-08dec7f1482f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:40:24.6779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLAZwqAncJsFeL1MwQVjYFMLz9W5wNqTDBBujOOIRZ7l+PlSx3JwfABwqyqDXqFt/TU79oyi/N1CBP1seu96DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_124032_812501_8A33AA05 
X-CRM114-Status: GOOD (  19.35  )
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

From: Ioana Ciornei <ioana.ciornei@nxp.com>

The guts driver will need to easily determine on which SoC it's running
when it will need to perform RCW override at runtime. The guts driver
knows this already because fsl_guts_init() reads the QorIQ/Layerscape
architectural System Version Register (SVR), but it doesn't save this
for later lookups.

Add a new qoriq_die enum to be used as an index in the fsl_soc_die
array. A new fsl_soc_die_match_one() function is also added so that we
can directly determine if the SVR is a match with a specific die.
The SVR value read from the DCFG CCSR is also kept in the global soc
structure so that it can be accessed when needed.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/soc/fsl/guts.c | 47 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index dc1a42cd9544..1494b545bbb4 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -27,6 +27,23 @@ struct fsl_soc_data {
 	u32 uid_offset;
 };
 
+enum qoriq_die {
+	DIE_T4240,
+	DIE_T1040,
+	DIE_T2080,
+	DIE_T1024,
+	DIE_LS1043A,
+	DIE_LS2080A,
+	DIE_LS1088A,
+	DIE_LS1012A,
+	DIE_LS1046A,
+	DIE_LS2088A,
+	DIE_LS1021A,
+	DIE_LX2160A,
+	DIE_LS1028A,
+	DIE_MAX,
+};
+
 /* SoC die attribute definition for QorIQ platform */
 static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	/*
@@ -34,21 +51,25 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	 */
 
 	/* Die: T4240, SoC: T4240/T4160/T4080 */
+	[DIE_T4240] =
 	{ .die		= "T4240",
 	  .svr		= 0x82400000,
 	  .mask		= 0xfff00000,
 	},
 	/* Die: T1040, SoC: T1040/T1020/T1042/T1022 */
+	[DIE_T1040] =
 	{ .die		= "T1040",
 	  .svr		= 0x85200000,
 	  .mask		= 0xfff00000,
 	},
 	/* Die: T2080, SoC: T2080/T2081 */
+	[DIE_T2080] =
 	{ .die		= "T2080",
 	  .svr		= 0x85300000,
 	  .mask		= 0xfff00000,
 	},
 	/* Die: T1024, SoC: T1024/T1014/T1023/T1013 */
+	[DIE_T1024] =
 	{ .die		= "T1024",
 	  .svr		= 0x85400000,
 	  .mask		= 0xfff00000,
@@ -59,46 +80,55 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	 */
 
 	/* Die: LS1043A, SoC: LS1043A/LS1023A */
+	[DIE_LS1043A] =
 	{ .die		= "LS1043A",
 	  .svr		= 0x87920000,
 	  .mask		= 0xffff0000,
 	},
 	/* Die: LS2080A, SoC: LS2080A/LS2040A/LS2085A */
+	[DIE_LS2080A] =
 	{ .die		= "LS2080A",
 	  .svr		= 0x87010000,
 	  .mask		= 0xff3f0000,
 	},
 	/* Die: LS1088A, SoC: LS1088A/LS1048A/LS1084A/LS1044A */
+	[DIE_LS1088A] =
 	{ .die		= "LS1088A",
 	  .svr		= 0x87030000,
 	  .mask		= 0xff3f0000,
 	},
 	/* Die: LS1012A, SoC: LS1012A */
+	[DIE_LS1012A] =
 	{ .die		= "LS1012A",
 	  .svr		= 0x87040000,
 	  .mask		= 0xffff0000,
 	},
 	/* Die: LS1046A, SoC: LS1046A/LS1026A */
+	[DIE_LS1046A] =
 	{ .die		= "LS1046A",
 	  .svr		= 0x87070000,
 	  .mask		= 0xffff0000,
 	},
 	/* Die: LS2088A, SoC: LS2088A/LS2048A/LS2084A/LS2044A */
+	[DIE_LS2088A] =
 	{ .die		= "LS2088A",
 	  .svr		= 0x87090000,
 	  .mask		= 0xff3f0000,
 	},
 	/* Die: LS1021A, SoC: LS1021A/LS1020A/LS1022A */
+	[DIE_LS1021A] =
 	{ .die		= "LS1021A",
 	  .svr		= 0x87000000,
 	  .mask		= 0xfff70000,
 	},
 	/* Die: LX2160A, SoC: LX2160A/LX2120A/LX2080A */
+	[DIE_LX2160A] =
 	{ .die          = "LX2160A",
 	  .svr          = 0x87360000,
 	  .mask         = 0xff3f0000,
 	},
 	/* Die: LS1028A, SoC: LS1028A */
+	[DIE_LS1028A] =
 	{ .die          = "LS1028A",
 	  .svr          = 0x870b0000,
 	  .mask         = 0xff3f0000,
@@ -109,6 +139,7 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 static struct fsl_soc_guts {
 	struct ccsr_guts __iomem *dcfg_ccsr;
 	bool little_endian;
+	u32 svr;
 } soc;
 
 static unsigned int fsl_guts_read(const void __iomem *reg)
@@ -119,11 +150,16 @@ static unsigned int fsl_guts_read(const void __iomem *reg)
 	return ioread32be(reg);
 }
 
+static bool fsl_soc_die_match_one(u32 svr, const struct fsl_soc_die_attr *match)
+{
+	return match->svr == (svr & match->mask);
+}
+
 static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	u32 svr, const struct fsl_soc_die_attr *matches)
 {
 	while (matches->svr) {
-		if (matches->svr == (svr & matches->mask))
+		if (fsl_soc_die_match_one(svr, matches))
 			return matches;
 		matches++;
 	}
@@ -202,7 +238,6 @@ static int __init fsl_guts_init(void)
 	const struct of_device_id *match;
 	struct device_node *np;
 	u64 soc_uid = 0;
-	u32 svr;
 	int ret;
 
 	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
@@ -217,7 +252,7 @@ static int __init fsl_guts_init(void)
 	}
 
 	soc.little_endian = of_property_read_bool(np, "little-endian");
-	svr = fsl_guts_read(&soc.dcfg_ccsr->svr);
+	soc.svr = fsl_guts_read(&soc.dcfg_ccsr->svr);
 	of_node_put(np);
 
 	/* Register soc device */
@@ -229,7 +264,7 @@ static int __init fsl_guts_init(void)
 	if (ret)
 		of_machine_read_compatible(&soc_dev_attr->machine, 0);
 
-	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
+	soc_die = fsl_soc_die_match(soc.svr, fsl_soc_die);
 	if (soc_die) {
 		soc_dev_attr->family = kasprintf(GFP_KERNEL, "QorIQ %s",
 						 soc_die->die);
@@ -239,12 +274,12 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr->family)
 		goto err_nomem;
 
-	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "svr:0x%08x", svr);
+	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "svr:0x%08x", soc.svr);
 	if (!soc_dev_attr->soc_id)
 		goto err_nomem;
 
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%d.%d",
-					   (svr >>  4) & 0xf, svr & 0xf);
+					   (soc.svr >>  4) & 0xf, soc.svr & 0xf);
 	if (!soc_dev_attr->revision)
 		goto err_nomem;
 
-- 
2.34.1


