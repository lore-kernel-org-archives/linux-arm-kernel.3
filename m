Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0F0FCA17B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V0MCvzcQ2BfV/KCNBsGJdi1muxhN8NO1E8PJumV5qM=; b=l205HZFBSZi/HSyzS0GVuQZS2c
	V/iX6khEqbNK/DzNuCNGTVb2LXz+I3g0+e+ToUrc4xqFo24xh13hTQku5E0zBeIzSJNCu4qprTtw/
	JB+W7fYuyxAmaO6bV3/M3oVufb8/Tj4PrZKCOAMQta8WcSPH+LIKjsWySQJ+q91PbeEKoSMafw6py
	GOnZskoEQYDnKcphBxwqsPeHym9a52+xSdwAoGIVmRQ7J7qAx59XIPaWq7BIv3BnTzZaRMpivhAOO
	ThMItispTzHH/F0oU5dzCP3AfdO4r1Kw4QKc90Hih9brphURKdoLF6ICXKpDayUXM3YlZ9TqnLh+L
	lh84NTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzg0K-00000007zlV-033w;
	Mon, 09 Mar 2026 19:11:00 +0000
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfzI-00000007xZd-0cE5;
	Mon, 09 Mar 2026 19:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tscDPmsdipa4v45vNTs08FzGdoFd91xYYe/afrcDrTqbFfYcOov6RBLZHbZ5ggI0wRbMRfy5U3aQuatl6vaLFO4yh5NYsiOm/oM2JsOEAaZmU9mKxtMUQve//ECVh5tgsxFqFuXhOGl5wLiCpm2DD4BcV1mL8RE7cw5HIYO7Rbmf2nshEg8jHmeGRaHcS5IIQ9aIuu5VB0rE1H3cFHwPSJgrc1RXcAADTIwDyk72QMilKUbPIPnilfZ+ie9zpQSqbewbrF5AWApKxvpJZgkoPTHmsc7HcHFwkVavDLMZSTsa0H3FrPzGDLgKbxgnvDumA3Hl/xaaYwecu0zl8dB1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9V0MCvzcQ2BfV/KCNBsGJdi1muxhN8NO1E8PJumV5qM=;
 b=p3n+WWiZWeAbtSJrNaGHhIJQkZBBsAQwH5eFimAbG29idzF7Q1ekD3qp1303/LH9t+TuPmf/wzGC5NhThM40HmBHFkHzje9OT/Vv0DOYI3g+mQG4x0sIriXlYAFkS3IdAJIJF1Xf9jXjTIJwO6linuJ02DqIYXk1NF7yxNYoGekTVXilJTbbQKDqCT9GpssNBW5ZWaCp+LSUZkVeaSwJVWp5WoOBmAU9LNXisL0UUtexcgr/5hGXUSCTtw8qIfZa45wvKwrgfvVEYC8caoYEWjlsNMMfCyEtF3WM4dO7Wmr9kc5GkvymS4ZfI2PGTMXN1sphBG0LmOGigrbkH/g78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9V0MCvzcQ2BfV/KCNBsGJdi1muxhN8NO1E8PJumV5qM=;
 b=ahEsvcC6qSwdKZbARyFsw3bht8dI/JV9A/m63AcaLdu9+Ci1Hhbuwcqazn2REyPfP3sTItC5asYUrSuc7DDER0X5BhixxhceLE8TYbX5lnbgRRXPdmaafA1XFa9LJmjbHtyxtp4mVlaA8nR6sPW3PEjgwDTV3UNOrGisxbzV7rRymxBCl02FVh6TP6leLCrlsK5uXwqu6l0CzyGNuOOlDA4pvJj8nmUBRdcjkR8d0SC4GM5+ivKjG3iZEpNyPGrUS1bZTtF47P0Z5s2o2jcdBFfRez/rh1aXkRvhPG2+KcPe6R6cvBxukA5Q/IACKdRpWlzucj1GrJjbjXio4VlodA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:09:35 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 19:09:35 +0000
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
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: [PATCH v3 phy-next 13/24] phy: make phy_get_mode(), phy_(get|set)_bus_width() NULL tolerant
Date: Mon,  9 Mar 2026 21:08:31 +0200
Message-ID: <20260309190842.927634-14-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309190842.927634-1-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::37) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: aad15bf8-72f1-4c7f-42f7-08de7e0f6700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info: CZf6jqXo9sUlPRmgR5UnqeSdrWBX6KYrNfXRcl2qF3/+DHjhQWRuI/eFjei/v4djp7qZSE09wgbpwNshnWskJ85p8bPhVrIGUvHETyUm2XFZQLCXbgb4z8u/1vVb8UX6QXB8VVJZv/xusecxEH1uoZO+o3eiBDk+PUNby5AIE4/jos5RsrPPkk7wb+EOJIAlYouSbUg0z1DfqHBvbAOnl8wl7uVddc+6CE09duNKOzZzkM+Dfp0onoxYhxhXSrOCt3zj5I3PFcrLk+2TFEJgPukrLcb3JIqwsDNmZi9zMWLLUrtWZVAkWKWNKGNCfx5qrFQ9I9zeE3BjhxtwogCuDvVmKVhwKyb2oWx0yYPUat/jLtQ/QREPI07GnDnqiOI/EHhyYs5BsP3wzn0bo5kZmd3p1zj893ORqd7Zlin1FGbO1KRUz3lri9xZUW0bBibbhgeZ78SBylacAvMBA4REHKPsdiVFg8LxsM21W9wj8F+2t3YekcDowJVkZGw6jI6U/1ahAGG4j6HNAO21FGToOFdEWsNJFTRuM58xFojpegrapBWJlZGtdp7CYzs12vcXzgxFcom0em3hHqx2ExlOWTYLJZ7vb3XlvcbluVKgIvLBvhKiCIL9cm6CL6fXs6jNyKXBxrZVUqxdI7tFXSGADJEzxVLfqKXIN6sq4FqWZzIk8ZKs7dA7v+WROeihfU7bTvFM1i77yDvCtvq453g2tY7cNhVuLg9PBUjZHeV7xj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G85LY4wQNFCm91SG83QHUJw3EbQvQi+K2yfXO6L9coYk4s6Hx71nxKOkRJWD?=
 =?us-ascii?Q?AneZ3gtc811crgFkM4J/Lsurv3doDJVhyRXhpSmlR6AW+6hLMTOvlzBohjCs?=
 =?us-ascii?Q?JgMvCysXuGmq54IvpPXkQRyysSRHKXYo/0t00AIlmY5/+hd/4+39lsF17fKn?=
 =?us-ascii?Q?3ckATmNdfV1dYGDzAxafZY8OqG24+Jtdkk+P6M1At95apGvpvVD6CwjDnstx?=
 =?us-ascii?Q?/FW0kPDGlQNkwsGLCqelLh7VvfkA8+LIvjLW1bwRHzLrvRBCQm0DZCq960Uv?=
 =?us-ascii?Q?pJiWganI5D+w2ktyeUvO8xgVHGQBFhtKqVM9zjoMvTFpUPpDU2M72k89l+6b?=
 =?us-ascii?Q?sRw6HBdlyit6S/DY0yj+AEEH6ILuv/1hn6TBICGINGl4xU5/LyIez2VJb+kK?=
 =?us-ascii?Q?VZg47vu3BJ/VNWwlUruqnwMFSc06DsSIjeMV6M4EkNWGHKneZI7fkne3z8g8?=
 =?us-ascii?Q?t6oJD3AtpPja9ZHgxoRYuDf5fmL6V/cR9RbJEpCCBv1jwC+CZ7iv9j4NfwoL?=
 =?us-ascii?Q?9DhLungWDVcR0nB3Kr2z3yDD2RY9pYx31RxjORSfltbYo8sf/me8Js0LYTro?=
 =?us-ascii?Q?3z5JkDM3uzM8d6OFPUS5WWrop3CxupmBVROdMgQGQxayL93nOZmDcmQNqvPO?=
 =?us-ascii?Q?hUa8xqjxylOafvOGPxnpCVNVgTQTBlj0s6oacBXEFsNBMZ0zoPq1Fa0QndTV?=
 =?us-ascii?Q?rxXmQWevt1uluTYe8UdkfBKKxMxAECue5pfM9e9fElE7Z5+eZlDMptrOD4cL?=
 =?us-ascii?Q?zuEwA6LBfFsKQD3HIJHsr38V1ph/hp7jZiw31yxrJI6ONd9qSB9b65lMt8V0?=
 =?us-ascii?Q?xl5YZCo5zg+BOeAOuwmfViuP7LYjzC2LYM4eyB9wcjJ9BjoISc3cWJmHPqgF?=
 =?us-ascii?Q?7QobSfK3f4Wc1+GbsEprziBITLs0F+a4CJH3pvTxTs/XRKyIwKdqJixl2Xk8?=
 =?us-ascii?Q?YJFuBQcTuuHH2TTHKxSzg16jZX51/VKJ5GBIvK1KFsuoZ15zwRKBOzjbQRcl?=
 =?us-ascii?Q?fKvtr4hXKBBRXL97vYtrGrvaM8I/awvo608WNV7G1wsSqkn/zx+sNDPFv29c?=
 =?us-ascii?Q?XHtZv+UZe1sigxqGsAbtnzqwGxeQTr/3w/MNyuYTjZVqJ6Xl2ukQ44A+1FkJ?=
 =?us-ascii?Q?X8xflUvTpAvK0qO3zo8zDSTmoJqT371x8XjhZThsZRzYim+/Xzo6GxDKo7w8?=
 =?us-ascii?Q?lcH9VWgZ9vqFJpZPmvo0uQI2dwxNhKa8K24JxpBIo7eVKfG/QQxelZhWrGQH?=
 =?us-ascii?Q?lqcnY7uhbnuEw0fA+5Jp3j7MPsM4TzFdYt5YZoE3sr+86CRu0s+tqg1H6eA1?=
 =?us-ascii?Q?IQQkBnlK36sVaQF+Nu0NhCjrsmDPOOvsC1s5p2qh1So1v5egZiWKsqmnG7Cn?=
 =?us-ascii?Q?8+AGxgSOOuN+pNsjXrF4fXRG/eRe0X75DtuBI2U9vawqIHgozWry6RUrIpCh?=
 =?us-ascii?Q?7oA6brUHvt4avWfz26uPQfF4pNNOLMkKaln6i8nYKo04JJVlEVPMReYQvG3N?=
 =?us-ascii?Q?SwCIQYFYo5sqH/hVdVOKG1cH5KeNB/9BaJqHSSCmQaMVchWf2TVbhaBW2ukq?=
 =?us-ascii?Q?LA9d/sB5Gas5l6FlOeqqMbUW+VEFc8LxssDMMcOPcqIx6a6AaAxC9adEGRgy?=
 =?us-ascii?Q?+iBtFLoRN9LvwReT+nSvPqJu5yK3gfFgmpLoBqcHxICOW39gtOJLv1xE7fhG?=
 =?us-ascii?Q?pYCUZTpixEbaPTlMOntws/VrmqNq5WdQkzSZUI3TagGf1TdoJzPJ2VYjdbI3?=
 =?us-ascii?Q?LAdo3n7QBwQ4bMEVcUvYqsxw6yx326ZdNLs/BIUVwnx2O6jgeerZQenq+Uds?=
X-MS-Exchange-AntiSpam-MessageData-1: pHsNidLOp3sPVvpFe8V8jRDVRvboUBhGXO4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad15bf8-72f1-4c7f-42f7-08de7e0f6700
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:09:35.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOkJDDcmtWXsfUGARkL+R9ReND+EGRMMuW3vdKTjTLl9UGbOpErjgUB/XHp1TS6buY1hLJzJYiWgf/zxIPXkyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120956_271134_B7A7F110 
X-CRM114-Status: GOOD (  11.88  )
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

The PHY API has an optional "get" which returns NULL, so it needs to
accept that NULL coming back in.

Most PHY functions do this, only the formerly static inline attribute
dereferences did not.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: none
v1->v2: patch is new
---
 drivers/phy/phy-core.c  | 9 ++++++++-
 include/linux/phy/phy.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index a1aff00fba7c..0d0be494cfd7 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -624,19 +624,26 @@ EXPORT_SYMBOL_GPL(phy_validate);
 
 enum phy_mode phy_get_mode(struct phy *phy)
 {
+	if (!phy)
+		return PHY_MODE_INVALID;
+
 	return phy->attrs.mode;
 }
 EXPORT_SYMBOL_GPL(phy_get_mode);
 
 int phy_get_bus_width(struct phy *phy)
 {
+	if (!phy)
+		return 0;
+
 	return phy->attrs.bus_width;
 }
 EXPORT_SYMBOL_GPL(phy_get_bus_width);
 
 void phy_set_bus_width(struct phy *phy, int bus_width)
 {
-	phy->attrs.bus_width = bus_width;
+	if (phy)
+		phy->attrs.bus_width = bus_width;
 }
 EXPORT_SYMBOL_GPL(phy_set_bus_width);
 
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f208edd25afe..a7e2432ca1ae 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -248,6 +248,8 @@ static inline int phy_notify_state(struct phy *phy, union phy_notify state)
 
 static inline int phy_get_bus_width(struct phy *phy)
 {
+	if (!phy)
+		return 0;
 	return -ENOSYS;
 }
 
-- 
2.43.0


