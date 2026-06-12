Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A06CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V3H4HOP4olVSLNmNNj1Bo3P0QoS4BcVhh0MpV47574=; b=0jWlDqxY74WDP1CLhbt3g8T1Nv
	7OvQjoBGMZiEnAzy/fXfCDesgFqyzVsJfG6Qa97A0H25uKMTVVL4s3O4UFE9xWBBJq7YLKk928nj+
	43J/sT+d3TgK1zRyNkV5+hW2X7JF3ZO3ECpGW+0y+uzg0vRy7u/YHsQr+m8c7uCpti61ci7DjR4Cr
	jSlMvYa2Y8Sf/D6n8qU9b5rqnZ9mxXgQu39V+he1gEeZ/JfIWZmwsmrcwTvHniiGRTPyo6Il2V8rH
	EGNhacBjeCoMTtuAObYk3C+aGfx5XiPCgUuvujJ2I4n35xHkkrcphTYWxcRiKOalDgGmlAtjCM+2B
	C3bZGstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY986-0000000BaKZ-1yUL;
	Fri, 12 Jun 2026 21:09:30 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY982-0000000Ba48-0Yf0;
	Fri, 12 Jun 2026 21:09:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+LLM0gIbUbCN7Z92GWehsMheMkR0Yn9ZQqnLVvq9gtYMtxnjs4265tDVfgcrD32RWsICw2mpHGE7adbmCvJDG0QSR7hymphsqSBZOsVbeQESVazLbyc6kXrozhpeJ6174ahFUzuOf8WtNmUtp2MaAYx62eyXWrh+OeqMHWmnTmDCMK8oXNUmkEOA2eG+Cs7sSv/V0muOfqDLCDyplZYdSweAWvoLI0kfQrYXmmOwmuq5rhLJ1Shjq1iJJS2Zbxh7ZxYYNhM0I1Ivagi4MdZQzd0bSRh0S/GS2g1TVjD2QvhbQgisx3oLiZBUJFYoT1KNKdM3HA5KspsCg5oAZNQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V3H4HOP4olVSLNmNNj1Bo3P0QoS4BcVhh0MpV47574=;
 b=Awa1t75+7QxNIn81v4rSCdvPHqJEO+EdJhstHS5d0ZfBDLByM6BUpOINHimIq2Jfv09ZgyVTqZpkYyw+q/WcJG5sT4KrouGolnsIDJIDCIC2Ceoy3v2NY1gG4lLDWiXdOQiQR7qq6AZNOFCiufpMEX5hXJULVaU8TsC2C+LbTGhLaAuIl3aMIy+9tZG1mJ9Bs7qkxg0kfpWH2WkeOAD2G8nQwCCXxJN6TTloikHsmVuLvUBOx7UYCvDPuo0yUPbR4/TCoUJW4AdXv+ZzzYRyJwU07aDtn0Mc7lx90QWbbLediVI9vM8KkYXkAleSh+K8lYGueIHCp38zXdEoeS400A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V3H4HOP4olVSLNmNNj1Bo3P0QoS4BcVhh0MpV47574=;
 b=Sa01DgZVoflapgKa3FLdYHGyaT4TvCsNwVpUv02ZuotlBY2W45pfnspMJ+/DEsm3RVRFBCDTO3fgpmJslmhXv7UcyQEcMW3/xLn5OCdg1sFiDP2geRiLchgBHNWVW87g/hec94s1TO7Di47ZKobruqwog02eU0lUqSqAirS49cTQKjyNHAi6pnleN0w3fNBNaFSLivH4F1S8tW6PciN5ptTjwfXeHCXH6U4g5GXGDZO9+TyIHuS98MBh9Y+2Z1dTtMpHxwhLcGjuvEAyLudpH0wYy1ugscF8VveGgTo2Po61UUZMhDFU3Q9UamyUAoTKCOosCrx3iWfCAJa3+1JH6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:21 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:21 +0000
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
Subject: [PATCH v2 phy-next 8/8] phy: lynx-10g: use RCW override procedure for dynamic protocol change
Date: Sat, 13 Jun 2026 00:08:59 +0300
Message-Id: <20260612210859.266759-9-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612210859.266759-1-vladimir.oltean@nxp.com>
References: <20260612210859.266759-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: a5960621-f636-47b2-77dc-08dec8c6df92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|3023799007|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hYmu3ijo4fjVYxtGFUfImybmYThLfqZw3IzdLp1u0NIjYDdp0qMnpLFoPcW+IlSJxDzLtASdq5hjmkKOEoMtl81Ih6SPEPULTWnNpFk8zW88tWPrxSJNSBw4rv49vdj5LE6gyBhkMObNOst9tOI91lkL0dEo7hQOASJ4BlIeXsSWLwUYR4WBEIrFibWDfMMmy0QqzZVDMqjHpXfJo1yF3wVXKHSwp+MYEhNhB0H6EgkVmuBTuUguGzYzJ0DcUZONnZhgjau9tP0ZTyCCL9JIWx7xXyi9+q25uQ45YVbT/+BYqCtqt+ZFF0r1XRGXSMavz/odti64L1GJJ2g58mFjoqWrTM1PIeIrVmoduW+kL4HG2F7AXwsaRGLxNrouk30Yz7HL3A1Io/LHWq7Rn0ZBUXzywXj1qK33lGtfwvKSvEtPggq+4zy+4pouVo1VKJ7gTwdsy4ZcwMtTqbCU/UC6KP1L58WgezQzOLltt0nfrRVXHPqkX+WDiSDywsmWTm5OsNBi3UocBtif0wO/+eHE9EksJbKpmGdI0ha4yr2VBO4PtMshBE3voDEA5HnIA2i0bWRdH6AuYbR8EFmJ4HJLxZ3w2qMWDgv5QGMAiCkWpS8IUgPqLD2N/Rq/Q3trejYQw1utBI6bRkR8/TclfWCgCcxJMRPwAJVGvcxjTHLxXmtkEoA3C1za4cXU/rIap8FQ+XFiHcXaw2J+/lxmu2hDqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZf5yKEjkbSpoE2e1IJeahniBsnlg3HMysuYY6CRl9GCtXBT/L7ynojHdg27?=
 =?us-ascii?Q?8xTUJmZIL45cXmi12nDqgA7kH907kQ2YH/BLI+Tbok7nPhyEk95mktSGlrU7?=
 =?us-ascii?Q?HGyHeJqWs6uPeh62hzujLOYmJ+dSzE1odQb2rnK/Yg2G2Epdah4/2rcYjfoF?=
 =?us-ascii?Q?htpKr+FQnrd3TgHyKy0Be4o9L2Cb4pJjxWeqshm3AysEix0Wzy+OFTD5Fbgj?=
 =?us-ascii?Q?W+65a4o5JgulaQboW8y0ErpM83WrGJ3lWvZkFg2cWr1ZmbldKNP7DLqVkBqE?=
 =?us-ascii?Q?jWY2yqPXpR/4997wx6qsU9TFXnIjAhVt/O9+VoVvUyGNS9NfGcwjh5EECwgb?=
 =?us-ascii?Q?zWpUx0I20y8zutAH9mcL9pGyoJamMhSgeTVAGNgcFgjURVitSflzWpvOgvMI?=
 =?us-ascii?Q?L8kQ6Gv4mnAYseHqGFySZ96xEP4onpgRNcdpHU265m6y76ARQB17szz9H5HU?=
 =?us-ascii?Q?PJVjHP9VrUiLlWV5RxOx8WjSbD4prn4WObvYN7jeXN83okIpDUZ8R1rPZOW7?=
 =?us-ascii?Q?bf4UXOx0YMqTOGdIC1xDDrFlQHMEA5oB1ZRIXYPrPhTrTgz9SGfCrhTfalqw?=
 =?us-ascii?Q?oSVdv7CmnzHWjuXebFwG4daT1+rWUOFZ+1jbuyckTlOEcUx/M/sh8Qi1Fxan?=
 =?us-ascii?Q?sqs5O2hJ4W9I0z31f7cHOhPdaBAqDMn+gbPXiQSwAWii8XPpQaxkXqhiDElc?=
 =?us-ascii?Q?vxw+o+yg5wMHNW9ZZRxXFrnD6J+ulIE5XcRXhXglYTUu9TzeEYKagLlLnDGF?=
 =?us-ascii?Q?mWuOIsayeE4fd3f1sI5pGjksrgSLKpNiGZtwPU8RfQSNI4SAXHUySexHGDON?=
 =?us-ascii?Q?KjODWKErqaLUuJBJPrhSlmlIlQMP+wRb6BsWq3pQmhlD5I1wiI5K5Xj6ZNaE?=
 =?us-ascii?Q?r7ltscu0DR/vz39dqyVsGjf5KyehHZ88XSLPZ7beuZtMLjBSovJ/p5onnfer?=
 =?us-ascii?Q?4ar1pGnQ8jpx8YwhMVJjX2XzWLx1GzX/Jycrjot1qGjRq5dKnoKAy+YP1KD7?=
 =?us-ascii?Q?sodMgztHQXMQX7gf8TCZtCbby6wcJWfz2xutL7Tsn3KYhY5nHMHEtXQkb5AF?=
 =?us-ascii?Q?mntx1hReLVcOF3K3Ys+bttLNhhWKjiA91yf2wklxYF/3Mn7mr9IYUDHR7Gui?=
 =?us-ascii?Q?JSSKab5TTUr3lCMEvlPzVFnu8S3DuGJbVaWwRLx0lsMGe1Tw+KM3xf+0WKbd?=
 =?us-ascii?Q?4ZoS5louptaps1yz55eZPLcqX6ZgjxsrJ+49gPczeUPyrFekaQwt43KOAbjS?=
 =?us-ascii?Q?AUvULnmYAv/h2KJ0oemNHDbMQp1IK60J892JJqLQbCbLfWHB59SGo+g7FEtd?=
 =?us-ascii?Q?50F+LHnBxzaWZhrLR8AvOd9YnmoXijgxDcZc4N+P2OT/D7geW6CjxU6t8n97?=
 =?us-ascii?Q?Cz3KpSSsLuF0kWDoTC+dRTf14j5DIJemA5glfekfQ+UuKDG4tl0zCkrweklL?=
 =?us-ascii?Q?6WgPnSA/rzKpC7CG2uQZn6X1K3sLfk5YVZ+W6o146ePSHqQOoe9WnN6hLJQP?=
 =?us-ascii?Q?JW+fDMDTO5nMiAXxd5Q3uO2Yy3GKowcwUdM1Ilp++je2gsCKOiCLjrKfDRAC?=
 =?us-ascii?Q?4TA3ewKRIm7qLCpYr5gDEdpfgSVYyRmyjTJRjri0aYhKlUoKwCwWPs56lDBC?=
 =?us-ascii?Q?poYgIQDxG3+oYSL6q5bw4+gf74wVJKAWM3dpQ24Nyyroh28meoPiJM+AbfU7?=
 =?us-ascii?Q?ncfBApZrC2u5/bISlFse1uhaUQvSya0HaOhMRv7G+Ze7PFU8j3D7oDG/4KOO?=
 =?us-ascii?Q?T0pe6s8N4QjPX5MLb7OiCIBPgl/YyrPtBKkUT/x5EV7tG/v8mOSW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5960621-f636-47b2-77dc-08dec8c6df92
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:21.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4qjtZ7MfHcMN8a+3JBvHS7P344yGFX2YRIk5IJEQwfAa1/IWhwempHC72k2wWm2vt4v2F0wL/Tq0kG8hFAQ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140926_184410_864EA2D8 
X-CRM114-Status: GOOD (  17.14  )
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

Up until this patch, the only protocol change supported was between
1000Base-X/SGMII and 2500Base-X. The others require an RCW override
procedure which was lacking.

Since now the guts driver provides the means of applying this procedure,
make use of it and remove any comment which mentioned the limitation.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: none
---
 drivers/phy/freescale/Kconfig            |  1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c | 24 +++++++++++++++---------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 5bf3864fbe64..d4e189fffbf8 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -58,6 +58,7 @@ config PHY_FSL_LYNX_10G
 	tristate "Freescale Layerscape Lynx 10G SerDes PHY support"
 	depends on OF
 	depends on ARCH_LAYERSCAPE || COMPILE_TEST
+	select FSL_GUTS
 	select GENERIC_PHY
 	select PHY_FSL_LYNX_CORE
 	help
diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freescale/phy-fsl-lynx-10g.c
index 38def160ef1a..5ece7889aed7 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-10g.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
@@ -8,6 +8,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
+#include <linux/fsl/guts.h>
 
 #include "phy-fsl-lynx-core.h"
 
@@ -446,6 +447,7 @@ static void lynx_10g_lane_read_configuration(struct lynx_lane *lane)
 	}
 
 	lynx_10g_backup_pccr_val(lane);
+	fsl_guts_lane_init(priv->info->index, lane->id, lane->mode);
 }
 
 static int ls1028a_get_pccr(enum lynx_lane_mode lane_mode, int lane,
@@ -1167,14 +1169,7 @@ static bool lynx_10g_lane_mode_needs_rcw_override(struct lynx_lane *lane,
 
 	/* Major protocol changes, which involve changing the PCS connection to
 	 * the GMII MAC with the one to the XGMII MAC, require an RCW override
-	 * procedure to reconfigure an internal mux, as documented here:
-	 * https://lore.kernel.org/linux-phy/20230810102631.bvozjer3t67r67iy@skbuf/
-	 * This is SoC-specific, and not yet implemented in drivers/soc/fsl/guts.c.
-	 *
-	 * So the supported set of protocols depends on the initial lane mode.
-	 *
-	 * Minor protocol changes (SGMII <-> 1000Base-X <-> 2500Base-X or
-	 * 10GBase-R <-> USXGMII) are supported.
+	 * procedure to reconfigure an internal mux.
 	 */
 	if ((lynx_lane_mode_uses_gmii_mac(curr) &&
 	     lynx_lane_mode_uses_xgmii_mac(new)) ||
@@ -1189,6 +1184,7 @@ static int lynx_10g_validate(struct phy *phy, enum phy_mode mode, int submode,
 			     union phy_configure_opts *opts)
 {
 	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct lynx_priv *priv = lane->priv;
 	enum lynx_lane_mode lane_mode;
 	int err;
 
@@ -1197,7 +1193,8 @@ static int lynx_10g_validate(struct phy *phy, enum phy_mode mode, int submode,
 		return err;
 
 	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode))
-		return -EINVAL;
+		return fsl_guts_lane_validate(priv->info->index, lane->id,
+					      lane_mode);
 
 	return 0;
 }
@@ -1205,6 +1202,7 @@ static int lynx_10g_validate(struct phy *phy, enum phy_mode mode, int submode,
 static int lynx_10g_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct lynx_lane *lane = phy_get_drvdata(phy);
+	struct lynx_priv *priv = lane->priv;
 	bool powered_up = lane->powered_up;
 	enum lynx_lane_mode lane_mode;
 	int err;
@@ -1225,6 +1223,13 @@ static int lynx_10g_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	if (powered_up)
 		lynx_10g_lane_halt(phy);
 
+	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode)) {
+		err = fsl_guts_lane_set_mode(priv->info->index, lane->id,
+					     lane_mode);
+		if (err)
+			goto out;
+	}
+
 	err = lynx_10g_lane_disable_pcvt(lane, lane->mode);
 	if (err)
 		goto out;
@@ -1314,6 +1319,7 @@ static struct platform_driver lynx_10g_driver = {
 };
 module_platform_driver(lynx_10g_driver);
 
+MODULE_IMPORT_NS("FSL_GUTS");
 MODULE_IMPORT_NS("PHY_FSL_LYNX");
 MODULE_AUTHOR("Ioana Ciornei <ioana.ciornei@nxp.com>");
 MODULE_AUTHOR("Vladimir Oltean <vladimir.oltean@nxp.com>");
-- 
2.34.1


