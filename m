Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9F1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czgduSDav/edvxpU/ItYxUu9iycZCPfau5aOpO5fZ2Q=; b=ZxDVI7HKp5nJyLrBhO36hSEYzY
	tmQweJbl4Usk0AB/solfNilFYXDF3RKQBeOg8t/9O80iF0R3l3du+P4s3+NJ9K6s1TVGrfP3mlm5K
	FnWmSuF6vBwz/GzsVUFX1cabQ0mUOBQiyRI0LugdcT7pQURg76j5q4Yov3i9QDAqwHHfqIBC+7WXY
	Abe+5wpQnw6lc4bCm1MZq9kCzTjTY17wlzNQhpb1G/9w+PGBQ8pbX9KPDt1c7/PNvMisbDWH22jNK
	VzdD25wI/r5QWXAoeP1RZTycRD8ih6f3gUYOpCGYh1NIVy/M0SENZUvCSN+Qp1DtaCmSxq40vXC7l
	yaOZB0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloBO-00000006qaN-2LxM;
	Mon, 20 Jul 2026 13:37:22 +0000
Received: from mail-norwayeastazon11013048.outbound.protection.outlook.com ([40.107.159.48] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloBG-00000006qKI-1oJ8;
	Mon, 20 Jul 2026 13:37:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9R/aWo49LawSMx6yqWcrsLkCmOVlVrjQtkhHkqBPpnCGZ2zoXfSufPJA84KQHC/rq9kIOQObgKnlAdRH96XHw2QzV9C37bVzYmfYBQdypEWSMUgA+UIhYodurkkSeOHdpdaopsRMjVjAMIbvRexfEQdKw43Y0lam1yL7r7SKAxvB8GgMc6ngnT4J+5u/WhvQl5nf9zMqA2o/d6hPlHiw8XSuzBnzxNA0J/TbjlE6drulcANBdUTsx/6A55/o+3k3hRK1qGyJMjRyGPCeF9BrRFz3iIxIvGBL+WMstTkt6VrgLbsY0wdIlsbUz/6wJN2mAKHkftGaN1OQtwy2u4yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czgduSDav/edvxpU/ItYxUu9iycZCPfau5aOpO5fZ2Q=;
 b=ivcgFOfWrncaYDOggJr6kZvM4Wcfs2cVJPHP9SykHQC3+Cq9l+ANwlWRHHMVmwJcyITPn2/MvJcAsVbO3+kgpV0aSHxx7t13gOGGOXbdciP5TsVkrskfTQ28qHyEEeZgfXj+rEl/+rwiRNN0nswNIbtBng6gDcZRu1J4rR11NWPRWPpuynZgixGmgJ4MpMgK4ro0YnLLrYcTeUWI+yF+mAFeOk8M9mrnVVHagyG9zFIBnHWbChDHMUNmaS7FqlifVt/Efqzuy8ZcDOzYN8mjy0rPzPmNuUMV12143RsDUkUIZSut1pUO/OYPo9nC/xNiEp4DksYy5KufZjQPUiSvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czgduSDav/edvxpU/ItYxUu9iycZCPfau5aOpO5fZ2Q=;
 b=PL5ma+2xPjwJAtbQz7eXn9aL/p7QJLGO5lfDsxkqZn750rx4N9CRcLwv+3NM1Ai8m4ZZdTMMbB5/tZwWVjPMS7gVPc4I9VcC0KnLIMzKlJkgOqGVHUlUwQ4Ks32RcEttWDuwxXA+4JXVQzWL8E8HEgB17mXV02auKQBp65jOO29IUwcLXBmZY4OLQBhIXM0mqTE7EdckZsUdkLt5oebFNZckH6OtG4owwa8PLDWClRZLNacMj15eSpJstlRZ0VEuePsZdA7TOHuoo/MkfVLQZopJKo47UgJCLUEne0FgWW/86hIcEbEqyF0E//ksRQvqzhNgJfVQBSdZf2UEneAZvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PR3PR04MB7259.eurprd04.prod.outlook.com (2603:10a6:102:8a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:37:07 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:37:07 +0000
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
Subject: [PATCH v3 phy-next 8/8] phy: lynx-10g: use RCW override procedure for dynamic protocol change
Date: Mon, 20 Jul 2026 16:36:42 +0300
Message-Id: <20260720133642.136324-9-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720133642.136324-1-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PR3PR04MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c92c420-f528-463d-2085-08dee663fe38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|3023799007|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tvpzQS18WyIkk2NR5EmxGMQ4Qt1w5+sQrGQzV+Dh14xPLkCDFGeEFynqspWWEQnRNV3we/FQSfDmZ/NT6U0g8TD5n0S8pEMjpqgrBv9QS7Zk7j49DjYf3JjfC/tpalBppoG1u9qEmEEInXE28F0qZ8yQEKNnOwqBQwugJNj9PSRvVWnwPJNwAe31UGnNUyJpMsQOux9wFqkNLujqn/19n+OKjV3cVjgPuZZOGRitLz6zMvdVEvC1PPXvSnDMwED0HnAsobt+m5gdxK7tu3EQWgx7yApRDfL5hsN/7M6ElmEw8XRPdKRLKWnT2kSocj+AoAz1vnkbXXFasmp0AmaYKTBXMlkOog2LwwjroPQMmiqI5fLY5P2Y4dk2SS8ixTxdSOcVOfIHNAcNALWXilozQ2ZCnhNbcjhlVdjEoU6DRIGzh1DmjBik2wXfWHV4LWgq6p0N2cPIgkGwPVBsW0TgDIi9AKp2UsI34Dq6RpYArGeoOLaGqgMwk2xIX2YqY1KnPgxh3V8/glwn8GQM2Uw6obTeP40FOXQU5riEpqAR1qY1ccB2a2JQWw32esvpxT18tV1roFPfjk+17nk8F97zmKu5kJgnyaFhQ5mYA/ULiCul2bz7KGVyAJjTtl1lerhF1uHscpRbd7sjhhE8uOy7hOM5DoeRDfEtvlM/ttb8Kfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aquV2TVtJPVEZgrAQVeiooWHiYiJxi/2HAMwzgpTtckoovoc2R5zTwta1fjw?=
 =?us-ascii?Q?uxmpV7PwizLr9EkitovLPORF5nKIE35QAOVaCfdyARAr1iFDOdryvX/9FCp3?=
 =?us-ascii?Q?1Z5w5PlShxnO/079DDud5WlB3qRHXazANPhPbHmoOAzv1uxwv9pKM8eHRcD1?=
 =?us-ascii?Q?repWzPBhvoe/2MHGArfxXCJ+mvuRGdvI1VdEtbPUU0zQa4kW0nDPT08PHYN6?=
 =?us-ascii?Q?PTfmStflEqtscNeVSoF/cSWAlOLvcBRHSrlo+p2FHoDo0tRXBKS357CywD/M?=
 =?us-ascii?Q?j5zy0DCJG/TeJ1XS4LXaJVvwFCbGgE9avxtrPoVO34liSxaaZzD+AGXyENq4?=
 =?us-ascii?Q?uS7rM1cXDV9mRGXLWTRdFhpm+iYKd9gMraS6qT0t/SZxcSxoqxIPsHy5SJ+4?=
 =?us-ascii?Q?8jcQrhm5YgPtjrnjR+88zaAHhj0ftZqZcsCq4GlcK/FmAjY/ZjIRqmERlJcL?=
 =?us-ascii?Q?FiWXkPsCZQhAViKHzIaCXM/pUFxkA/DDlvHOR9zXkQdN07figF3/7LQ7RkWB?=
 =?us-ascii?Q?Z6iqHnAgke1HLJ35btmDLN5DayLdf0mOPnuh7W/iWhRmm9r7o2Xq+Ikf/sL/?=
 =?us-ascii?Q?jgq9bYcehduBRx6iXCDxNDzpnelTXkeIKe2TZbGkbdUVczHEJc6y+JXVTghB?=
 =?us-ascii?Q?SJqeGXPecVoP8nb4SpvQRJ8R+JB5waVAy36LW8bNRv+DH1GVeGzdqyAYkW2y?=
 =?us-ascii?Q?+pPD6do3jMs5d11gI2aiacRs2dHmSCzdjCjNU33JHL+tKwBUwQNUI9/EqU0g?=
 =?us-ascii?Q?1ZG+PR9mSm1i3qY0ppvy5HCFuNnMqvTUHWl4595d909SE8+1grMJniCBOxtW?=
 =?us-ascii?Q?ceWNiBdiHLB7tEI60EzCOg0mcFAWCAH0VlgPsDwQoCINhFPRQ4sg+ulV3q5I?=
 =?us-ascii?Q?l9DuJkbwqeM7FtrQDl+fak8ABfNjpDMsUKy1aRu9V6r6sE4xL1Ha3X6u1c/L?=
 =?us-ascii?Q?5Lh8grAXZoloEcSd3bWAb3tz6sebEl7z2wNemFYp4E3Pn1rBTZ4Q3n8GwR/e?=
 =?us-ascii?Q?/bD/zy6yNBsYNdurizSBuZVSzY8NBeJlfAFlGjFL83olFUPerFkBwzMYIaWS?=
 =?us-ascii?Q?kwXIyXUAjjw2WU5C348PFW444kEmdCHfciTY1IhBRV35A18iqjV38mvBGgz0?=
 =?us-ascii?Q?OogY+Qu4EYFXia/CCBmBRmBldr/G+2IKwo80z24qXdOQgQWr4IIwXjJO4j0w?=
 =?us-ascii?Q?B3V35VLBlyk+wkQ+KcsB4/mNwJSRpMdQ3+NQFypjawyJps51TggANUj2+B8Q?=
 =?us-ascii?Q?VX5PYnXzBkiV2WLro8IuY8iy3KvxtMbtgvOuw3Pg3DG5QjIiPqcJ9Kne0g2b?=
 =?us-ascii?Q?pRipjvDMZGsSdyVPrrDwHR0utD57gSQhBfz6YM7mZ3QW5ty7knJ4i+pAFZ+N?=
 =?us-ascii?Q?I0Ch+ZJ+cwa6Y5sHVIsxDxf19aEpt3PPepq4/QCiEm2iWfVb7tWxtjVA3RcQ?=
 =?us-ascii?Q?6P4fTWALko3PB7j+y1fKVh3ylcsjXNsaDd7PWxl1/WVcFjZLCKKcWSW7fy7O?=
 =?us-ascii?Q?9pTLv7Yc5CBacSWqqEiAF+vDBJ/pww1P3VyAZyDKTsqWC+euWTs4SwNkn9PC?=
 =?us-ascii?Q?7JXIvj5LdbEHBJcaYq+B64BlFv5rM0EwvopzvJVo6EejFXrjEcZYYLHPWgJ4?=
 =?us-ascii?Q?nP2TzowAN3gf17GpJvojmnM7YOc/Hpo64B+CATZDxFfJgwz2KHtoomaWDBoN?=
 =?us-ascii?Q?p1FOIGPxZf610BTm6Y1IrDSSZiUGcCsa/eV4s2UGDPbuo7gDHUBtH4sJMofG?=
 =?us-ascii?Q?CXn/rQII0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c92c420-f528-463d-2085-08dee663fe38
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:37:07.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itZZvVp/DxCnSiJh9c83/MeR1nbHtRw5HbnwwaQhipqBVL+bEEbd7fahXD9DTIkI148kdqop+gHioVUg/qXz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_063714_479377_C9034902 
X-CRM114-Status: GOOD (  17.25  )
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
v1->v3: none
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


