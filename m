Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC8EFCE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHVsTK8x1f2+2nyCcutCEbLl8F76FQGE5hb/pt7oQuI=; b=EaOo9/74DwyzdwbrAJ5xv3zyca
	r2v3TaZ1BApO8aW2YxOZw67CMR4Xj4vHKTYvzhF8Cq11sKafsWwYLJ+qD+PJ6oDGWGtQEEDEWuGJD
	AJXYKPY641dbpB2ub6DDLTBanllQqzedjrjLLteGUOfmPKpZ7pCnerBfGj5nKKogCtSLCzpInFCxH
	qnr3vl3GcvT2Z29pZlHI2WGSnIzy8lJGSznYAyjVZmB7hacdOxPiCwoVI+chNIEbATDOY6GTwANWY
	znXStR3L/0DcJFqbdUWZXo8oT1AWQJ02g7u7PkeDKeGAbmuv/JIO1OhkYFhUs81vWty0Ftq6u5mPa
	Bm4m4EJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWB-00000000Dxu-3xzd;
	Wed, 04 Mar 2026 18:00:19 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqW6-00000000DWN-0OrF;
	Wed, 04 Mar 2026 18:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbBNLyQtHlAxAhfKY0gHPF6oNIpFgP8TlYptTMdgK9BdF4o3l/Y+EinOIFIfNt6iI3beK6BdMQZ8MHITVCHW5MB/RrEaIpPWhJ/QbKSRsl2daaiZqsdRAEhbqATIFJrddCdTDmF5AVpBtuzHtnRAb7foxtf/J7xZaBtUCASF7CK+QFojT6Fu5qAqjrkM68SvpBspb0iDwrUCo6T5lAyMKmv7Ve3ulppXXrfkGokGPSDEHL4g6ywuyLc1fJs6hDQ5XVtVndpiOb6dk7AifCkFSuYqsm6aij4gfx7ZPhTTThrF4OLV9Ddl1T7W5VvBjubNUbc29GJFqxrI3vlgEMIYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHVsTK8x1f2+2nyCcutCEbLl8F76FQGE5hb/pt7oQuI=;
 b=m3nj0woGu6lJQCzlE/Gwmwrt+ZMqvtB2damPtKxZiWSRD37qVaTcquPpwjgps4S/waQ5YuJM0QENWVvaZpZWBQP/f4ZE6oFJmjsfGmndnUxQK6f5vLuno0dIxRgsaoSa1gN04BcWJT1aXfXQggt7XKIAdu0BWhft9CFqUYhs+nj68YLxfMmHxbvtedFtF+Og6+RnHtUHgamQSawvPoLGLDN1HO2DmF7uWZcJqdm6qKdhA4zLCEXGxIEa+sfR0/RBhsTmKNnAQ7uMMxPlVhv5rg6OYcbpK7wdwA+SCtv1HC58yxIcPEs7QcAfqCA3R0gyrXrFksh2lmOKSWrih80JBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHVsTK8x1f2+2nyCcutCEbLl8F76FQGE5hb/pt7oQuI=;
 b=HZQhrP18ZI399MoaqOeO+L1E8IoHTcUit4MD4V3Q4FAKwl9NdmDQ89d9ywgWJHZnGEy4LPGoe5RFBgcOfZwKcF3mbA4sRcYkBe3Cs8tCZNR6q3undqvU14WiAtm3kjUOUwGnw4vjN7fe9mVU+c4R1f52unl0BUcQyYA1ujGz4Oh7zphbTf5ma7ZuEUNn259ByNaYs7ZdGWJ1B60xD1Rw9FmIj4+sdMSbAmWvqNFNrq4rThjPeWy6XZgygY5uAFAx9Lsj+pc43sCLRBli/IbQzpDIGMX5bEaiwRyiSkqaj57WaJ6EF242Nj7d+KeFBQJ6TI8+alzFrKmg588NuAcsAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:00:04 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:04 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Yixun Lan <dlan@kernel.org>
Subject: [PATCH phy-next 06/22] phy: spacemit: include missing <linux/phy/phy.h>
Date: Wed,  4 Mar 2026 19:57:19 +0200
Message-ID: <20260304175735.2660419-7-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 901e085f-6b99-4f8a-d521-08de7a17dcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: A4mIM2zSuNIA3I0IbRaZVK2P4K1goA2Y0+sCQ52Io09IS+a2p9eLDWdETSwl6VhG+zgXXCfVgT9VTev73bLBLL4d7dk2b/eqBK5p9AX7NyFIV9Zso7xKEjlpLP8S4+3boXh42EMfzuppJzl5FQm7Xya9K8MxaUIKBwr02synSnNpSOuJnRz2kEoFMadmsF9+Esax8Rt+Lj2fLyiJdOjckadiWPiMqq2MtlYHYzCivrA/qsx4a5w2f89VE1X+QuMefRH63SNaxr7dT69ljMYEduydL7ofdImyjDYti0lLgnGZsTQ2slw0HnB5V2J4g3xdNU33myjF2d2WweYeQYgsRzfNj6DNea4gkRytnKbxLuehioBPU+Tuz2/eeydtfKKXMr4DCuC3j1mHJjsSlIlWKAewuDj/GrxXT0UPV0JjamaChwe50/nBVUdjL3uKcDQGeAYkn7KFYtSyRIGmynQxm7G7vRN0leyA+Qxw0k5b6sO1Wg36+d0Jd9LU4zjHxI67m2u2HG8+HcFj7hECjCaTZUp3XmSNqoYky4FtRqQnhjybM6sorJIfDCC3xsrm4hE+Tv7ew9uu1uU2dzgyZ1w3p7DbdfDkodHcTs3UN8v3cY9yggROHmpe5nLigwjxXoSLVaU2g4pxoiwQ+U6hrhwMsu+KcHmuGtLpm6g+1HzMVymeWLc3lCj5E6VwyMbgLW+a5QVOzowvBUX3zJ6kW3gjmwyhjsHwX4c3/oWZ0bwi0+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MApwKU9zPIU1N8F9RoZcL19wY4yr8XgFDfbaCsh7Pg3MtCSn0y+LURwqKwz9?=
 =?us-ascii?Q?Dmk9YHbPEEzSFotXBKHonNB+iBrNsXnYfJ4QjMM5CwzShRtsTiBJZvtfju3T?=
 =?us-ascii?Q?V3T3Qukeel3EQ5gih4ZfDnIRT/kku8dMLVlZ64RNVNj1t/FGqXg5DPaPFBos?=
 =?us-ascii?Q?nCN4mkDaWkGEJ03v4geHqHlFq1OxdyNzmecXZVVkzTi7DxyKn2FmQRH/z4yk?=
 =?us-ascii?Q?2pp+57T+sWNpsCNOaGN8Nlyp2uf3Uo55P8v07uCbMc1usbfSX1KLXAVkXGIz?=
 =?us-ascii?Q?Ytf4vS5F2ehegLvOnuJYvFSC2F3aOz3Br88jTbj64WVdZ8N0krsNb5pQDZJE?=
 =?us-ascii?Q?ZlbnEKgW6PoVfRmSyl5fAK78Ks3Auti4Eo1B6r9Lms5Oh59JQRkpYX89G1n0?=
 =?us-ascii?Q?e5VLPInPkpt3dgGgNmXZE1q30anJqXa22wCluVSeD6BMr7yJO06dvUJg9RAg?=
 =?us-ascii?Q?8pIaqed6Rxt6XbJyuqt7faVqefUrpzIc/bImjc1L5MUGTophNPRj+UWgSip0?=
 =?us-ascii?Q?xirXgPB7KqUVgO4X5Jgu0YMnG2Cg0/nQpDiL/7vJ4golhrhHl9/S9Wz2pL0L?=
 =?us-ascii?Q?Z+uP8k2ei2MCo6YKcCF6I/y8IqB63rGyzK1WJKuAiYPtQ9HgatX8HAqGuHnz?=
 =?us-ascii?Q?W2l3l+E2mbYsOx6EckEEuWFUG+VA4yg0JM/wPJGxfuGZ/ePzmHXwZ8TbDwip?=
 =?us-ascii?Q?6jB8GNkQLwnqBufk0zhGAETBdqsN3kDUidV1W70FOFwXQethxp8eDNOvuhy9?=
 =?us-ascii?Q?Bj1Txpr8c0oIqZBnEw5nG6VbCVrneCr+7qXiG97nYOtbFH1vb1VQG5npnlDh?=
 =?us-ascii?Q?ZwDXSor8NMB4s4pGAhPvYATxhJr/poQks+Z7kF0VqhOk0gmiPlZZidlOdxHw?=
 =?us-ascii?Q?oxamx5wK0yokqfiuGdjltyNNsk3JV+9FxPHUeKT23EPl0ehcuxLxbiJPu7Iy?=
 =?us-ascii?Q?x8618GG0lQ/RUYJ2ExAMpnNlSUSRSFcLHbpOsmvrJYIL5WNhC2ODgmAAS/q6?=
 =?us-ascii?Q?0hEkjzNhlB2gXSKsCj0Pg6lA6JXoOnktZabTdV0WbV24/qRnSwzv3owqrcCe?=
 =?us-ascii?Q?o2xHssmOlK80cxxBxIY8sCp6SjoyFhVjC+C8511iEYiPGLbQo/X2iDZxno2y?=
 =?us-ascii?Q?FryF74Oss0xL+zc/PDVA9lkkWZphXPdQR9b5Tc8aNb3YFdqwGfgsj0dNOevk?=
 =?us-ascii?Q?W9m13I+v4Q2OGe6B2eW/6k/tLN0XSiyWfGurLO/maoILnijLF3rlGX6VLztM?=
 =?us-ascii?Q?CMVzCHZjWa276Q/bkF+aN3mSpM+54YsCIqQWMpIGwiFsdRUyvKIyvRiBQ14X?=
 =?us-ascii?Q?lteD96rrGAsR97qDV7gH8H14PFadGUCTl1A20+OwwC9b7eLr4nJo0GC1ByT9?=
 =?us-ascii?Q?hYhOxtqLFGeGKSFqof3CoXE8baByZEbRuwTiqwnUXD7DSBExYsJTk3YXXcgr?=
 =?us-ascii?Q?yzRq2YD8y1KnXdEb0/WEhM0KtFfCyWGSg/mBdhoMPjTDWqOdLLmmoYKgyVQ/?=
 =?us-ascii?Q?9dO/o5neJ9bb3UPr9nti87Tp/LLEaaPoz8Fxo3v+6xCU0M3gqvhByioYM55w?=
 =?us-ascii?Q?AGEypLQptZtX3O+x5y5iOC3e5fBTSm9pw3Lyu30DZ3/wX1J0HGcF1fzDIKBo?=
 =?us-ascii?Q?aCfpMdX/+wnk9oMTDH2L1RIly827hkR5F1tUdpanYZIQ3Skm9dyvL21kmnFz?=
 =?us-ascii?Q?sjMCLMYvU93kxMuJj9kc+YwaJgo5wHx47qObTS2c8A7YGvEmVp+ysN/RHRVF?=
 =?us-ascii?Q?Vk1BPCQyp4tYrTxn8dBeTfiBaWuP0WDl48I9faCb9EjwUBoz46gvAbh3kwO+?=
X-MS-Exchange-AntiSpam-MessageData-1: /ROD+aJ4S86dRxU1HYyH/yyqqT0E9BysgP4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901e085f-6b99-4f8a-d521-08de7a17dcd4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:04.5985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpGahPI13ntY9T7Pr94IlBzWJra/oL52MlwgtUPYGElLBabcfDKmWJGOGd3rzbt2oP43Y+LQGKg6SmvS38U0cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_100014_170761_2584E076 
X-CRM114-Status: UNSURE (   9.22  )
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

This driver relies on a transitive inclusion of the PHY API header
through the USB headers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Yixun Lan <dlan@kernel.org>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..14a02f554810 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -9,6 +9,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
-- 
2.43.0


