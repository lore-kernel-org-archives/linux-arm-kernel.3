Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5E4C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cI4HIahx2VPhHhA03SnI6rED6PBYnuOedJBYn5OwGaM=; b=pWdWjVTBJ4ZrQNm4rVQyQQpKWz
	bax7sx8WVHK9MbAFvigECr6gZRzA/WAf00jynLyihYTvpFtBi9MOnO/TezF5sZf7VoIfZgQE3twL4
	3t2UNnRGh2RJrsvPGrAf2SXWr9SNWhwV3a9DEWHFdcIzFQm8jLkuhdMCjgzqcftCwICkAP1+P5Sdf
	9duaUsqMgyMap1SA3vDxWCtb6vSQt4D3hFIRf6OL6e2eg5ZwmRL2/uSvu3atEeNJ9DLmDaBaqQpJf
	MjpatVIyhHvO0hcyvBMUGaDzxEXvcvvXrtz3QzZvfMGE/WKp12ZfJMimFfdGLBXun+ZKWPNfdTpun
	Ydx3qDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ey7-0000000ASNd-2sm3;
	Thu, 24 Sep 2026 08:38:15 +0000
Received: from mail-francecentralazon11013002.outbound.protection.outlook.com ([40.107.162.2] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ey3-0000000ASMV-3uj4;
	Thu, 24 Sep 2026 08:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3iIC9LFvra/Io3YkrlGgpFMkSS5fS0B4MGLrLeTCFqEJfbrtpNZkvDb2KHIiHbLknv40AeqgQM5EWnCfjlJAdQosKfEWFeA+gkyiGwcj1EGKM6kgCko5XQsZEgD7c8GcYh51oH9HmXjFdk3RGNiSdCq6o4jUWeLYaNYHqpiXWtERlWnWZVQaiD7XkAE7eOjfc6iTw7AClnnfH3pKweHF1TiPbxHaWXX7biFeWR+oH3m52x9TrfhxAfDlX2Hxjvsw6/dAd5bMhsVQQdDItv7UxOszcc8cI4qktdZpgQi71LVi04+QeeLBYf+35cHWjK938cg6TiZ0flmc4Hj+Rtshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI4HIahx2VPhHhA03SnI6rED6PBYnuOedJBYn5OwGaM=;
 b=aBghUaB8/ay1Qbkpt2B7NjV2PlCxFDeDfwp8yU2mLMJoeIhpj0gFbbr89ajm5ER7byqYTtVZpviPDifvjCB+4j4FKC5aIb9qMB0zv9NYLiH3RgV3ebo1aeBoWo/YX8tm0B81XZKQ7848Cm5CC4HIMR3GV7Ju5nZsVlsT44ubpCQZIPOsqHOkMo/j8bvlKOZUDrBDZ1ODL/D1sYJA9EwqeIGJl3jKkilMQUisyxz1ukIMLjcfF/Tb/1fkPnrnljAVrmXuwubBo4hHhuNTSubP7YTKD62cFChI72AIu5HD+ts0r5zeqyHi/Ardc/jRKk2jm5cXCuSJCDEeEJT6dLg9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI4HIahx2VPhHhA03SnI6rED6PBYnuOedJBYn5OwGaM=;
 b=PoBO5+/oLbWD0ocMihMg5SnoMrN+v5aN6uB0IDCHDywFTXh0/zIdpDBBVQzT98zSayfdPHM6vV35I+HAigjvZo4LWvl4tWZs7sBTeCTEfTmZCNgK3/VpB+bSSB7H36zH7hXrEzyFVmRvSa1eASMg6tAQm713Bxs4qbCufw/htdb7t+QILgG/sBwJ0oxgbz8HjDyxl+7+wf3a/7GLym19/80tYoqpkfmXOYR5Hju9Cxd1ND2ClEyvH63jxi4Ss3kTk8mU9H7uM+YN5DbfOnhWWHTOnbGMa1xTdEUmFiPZv2Xpu4ydo+RAFM0P209afGazbEf/DvSGlj3HSmSaTS6yqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9937.eurprd04.prod.outlook.com (2603:10a6:10:4ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 08:38:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:38:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] net: dsa: use regmap_assign_bits() for conditional set/clear
Date: Thu, 24 Sep 2026 16:35:37 +0800
Message-ID: <20260924083538.461887-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 727d1b56-fda5-4843-03f4-08df1a1727f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|10067099003|56012099006|3023799007|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: JDxJIbB675ApubX3fyncVv7lerpLqLf5/AczOv7RP8S3L/3x4U93uMBo3V3wk7AWqkq0UKI5QEIBhQTYChhEHSWbQ05vgYPY7Uo2hHjqyM/Bzrc9FyW7AEvwKL6ueL4HmH+FUPQeYc4bNkpUWxt97m+6O6e905PGfyW6yzr2FZ1hODEeRjEXMAMmZrf2gg7tg28IFTmxYaw+JJ1la6zF6MZeNFkKtSp6WWmSDXM5cuFOEngdxh04eSkP2MynedNJwOzMPJeFOaQWdPgBFsUkBR/g5h9XYqjPqMIq/YfP3bWTk5RaVkuLu3kQXPa32jgg037SLngwXCszc2vmWF5EY4iipYdzkevP4apo8JMtUDhcsm98rkw1BySQ/sxD2hEjQoig0BWXqwmTONPe3DTJuo1Ejgtze+nz6GTZhmTNXG547tFtoUR5CiRruGQDuyEWzYG7oTNEdD67d2Y5SIlBPlLgLW5Z0W326cRFlFNT/70wiLeMR7T8NbX4EK6Ckj8NUj85YzDr/XedskPjSGqvLrKKHJlI8+7MNOwDuOIuIQppOgW8cfqaFKpHeF7ducEBH49WlxeSbq5xehVuxIcZeixBKfLbF4TZL58wtfp4XnlBEU9CQpQ5X/xQ60K2fjreYZIQ0eXdfafQ18OAvkwkhPRkGeBusGZlprfJxrBn/3M9QPVYsr3M6mXQ4Yzcsp6j6Aci4KhbbCYzWGnn/EfaBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X6SByYIWtOVQ3PzkNWW77TAJEzqGLIU1ZXAkjA538Dfir0UUoChBmYEfPyPs?=
 =?us-ascii?Q?82N4TOtW3Is7m5/5Dn+gUCEM8uUMOpf9+mLyL1iitzDAYkJ7gfbmI56m12fm?=
 =?us-ascii?Q?XFebIXHox/p4eX459DpcMZUQY5oZNwW2RVRu+79V7HM/UUdNysq47rqL/a+5?=
 =?us-ascii?Q?1w9UXwELXEgoXJyou7g18PO+AaXG0LD1dXq5ckVjBxlo8iQZ1W8C7KbR+Q6U?=
 =?us-ascii?Q?wHp1PXR2+dXyO0Gf0atJ1PF0SE/J/+lU2GzsjIOUN5JyoprMGIsl8uP66PYY?=
 =?us-ascii?Q?Qs54hOx3QMnRyLpkfzAADkc90/MC4DlpbR58HdOolcqH1Ri+aNiuO7mGRtTT?=
 =?us-ascii?Q?bwDkfsPIv0hFCVTCU0IH+y9G1iLEYYaoDs0LkrCtOHjRDBobj9oK/yZ7fUeU?=
 =?us-ascii?Q?8bGjm8pEj/ymRkA6Dl5tmZFOPM8AfrXaWZ37+4YY7n3+k2352ZA7smZERrZX?=
 =?us-ascii?Q?42jgIY4MJXCnr0IiknG6eZrq/PWGecSgcYarFc1n7aia51YdqH4SrGrECpr2?=
 =?us-ascii?Q?4bX3AVrDr1B57EKS2O/R3dTcUjy7/YOt/0DnENiX98rwuyigCkqg1mSSRobL?=
 =?us-ascii?Q?rzllXxleZTGQJN0AMu+/grxsCxk/G7g/t40yXUMSD6y6Dkb8Dw36wfVm9MI6?=
 =?us-ascii?Q?EvX/o1BiwR4Okqg76ByzjrnSzCLq/zBQ5kheXT9mhdfrvdPDt8TgxrHC8aRY?=
 =?us-ascii?Q?KqAIY8FmHWjF3x/GLV7shf3/p8KxImm4/LdhWjHYeK7aAdilaoPjRjvzJQqt?=
 =?us-ascii?Q?4XfMac3mJqOLmooTWD9a5lwPiTICUMuR4LnTjqmJySNmtLGt1F19uz71+LWA?=
 =?us-ascii?Q?BFRYOaxlaWK6/qCtAWXONRH+O66XssFMRRO3Xu6r/ce973M906fKncpNCcJ8?=
 =?us-ascii?Q?XFZWMEapexq3owy61H/kN6qSO4ghkENihQuYy3QoThwMSRMG8iX1cG/mCGuP?=
 =?us-ascii?Q?0cIr6GcKoTd8/RAEjmo+QpDJGVLXoKqCFy7tNrjAZ7/IJuWjdzVZb91/xx2j?=
 =?us-ascii?Q?E7mBjEDaBHq8pz/njPoKp1OXwXbPPBxUZEIb2ieCUxgMrmHFQZdzC8t0dg19?=
 =?us-ascii?Q?qQX6EVvvEAuLjgFqOTb4AnRGV88eswI9QmHFAQRB/7bnqhqDgI9sOWhoPT9f?=
 =?us-ascii?Q?KjDNjDqy8KcDOAeKHcsODzChX0Z7z3lZHu1DbEMW1vM6CSSllk7wShjENkPW?=
 =?us-ascii?Q?aLL0GZ7b0XwKiIAZXpXpp2xZk9+9Wb1de3hfHEO7DOZyIOYFbsQdHkFbzRvw?=
 =?us-ascii?Q?QHGYwqkRypA73IaPubgeEXisqQNuffbcpkbW+7dw/98Mq+1SsREoKoSH5NFr?=
 =?us-ascii?Q?4zT0PL6PpZB+4UL4om+rmT9ooMAECiC9r/Xq0wbyBiszjK3AS6eCMoYByEiG?=
 =?us-ascii?Q?VeoUahj0kSKvYP6yg3MjZcdcLeVM+iLF0fct4MadVAST6PjldQ1PMt9YDY69?=
 =?us-ascii?Q?ZKaKd8u4G8NC7b1vLqYUym56Q0xu5Fu/6nWNp2jimrDVnXibr8ItINa4F0FM?=
 =?us-ascii?Q?iz9xUvU1nJCPj08kgIdoH0uNhDsh9fl3FWq+qRPPlKJw2wxKoqrIEcg5NlGA?=
 =?us-ascii?Q?3x6jXHpNTkeOZJN/OY0JIQNes6QSbquH/M/d8D5t4ntVnK2gULoF7JFutYav?=
 =?us-ascii?Q?AZjxsQpX+RcY7MsvPoxFhIKeQvnDchpHJYTExkKzDcI/XrkFcTtm5zkxGcJ/?=
 =?us-ascii?Q?x6BJK4tY4UAkz/dOSCtlIOjkX5QQUhQuYppCdJFkudSpnS4U6K5nshGibnJF?=
 =?us-ascii?Q?s7QwAhhhIXSdKEo2FgSA3PwjxYHIkKV3dVgnMO9xfObnJjZRCdnx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727d1b56-fda5-4843-03f4-08df1a1727f2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 08:38:06.7621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfAIOhvI5YrsQLPZEbarKRiSRC+13nOJQa35FyDSxjPZpU3+jbo24mXBLxz7BE5Cik4IVf+VOSTEl1aGwMf/+RYrKnLy+tejIDr90KWt5RGY90PL5Rf3W3c86k2ZgpV+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_013811_978865_E4FD1EF9 
X-CRM114-Status: GOOD (  13.05  )
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

From: Peng Fan <peng.fan@nxp.com>

Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
the simpler regmap_assign_bits() calls in the lantiq gswip, mt7530 and
qca8k drivers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/net/dsa/lantiq/lantiq_gswip_common.c |  8 ++------
 drivers/net/dsa/mt7530.c                     | 10 ++--------
 drivers/net/dsa/qca/qca8k-common.c           | 15 +++------------
 3 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/net/dsa/lantiq/lantiq_gswip_common.c b/drivers/net/dsa/lantiq/lantiq_gswip_common.c
index 6150dc3ffb641..20ed487f37ca2 100644
--- a/drivers/net/dsa/lantiq/lantiq_gswip_common.c
+++ b/drivers/net/dsa/lantiq/lantiq_gswip_common.c
@@ -1279,12 +1279,8 @@ static int gswip_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	/* Enable MLEN for ports with non-standard MTUs, including the special
 	 * header on the CPU port added above.
 	 */
-	if (new_mtu != ETH_DATA_LEN)
-		regmap_set_bits(priv->gswip, GSWIP_MAC_CTRL_2p(port),
-				GSWIP_MAC_CTRL_2_MLEN);
-	else
-		regmap_clear_bits(priv->gswip, GSWIP_MAC_CTRL_2p(port),
-				  GSWIP_MAC_CTRL_2_MLEN);
+	regmap_assign_bits(priv->gswip, GSWIP_MAC_CTRL_2p(port),
+			   GSWIP_MAC_CTRL_2_MLEN, new_mtu != ETH_DATA_LEN);
 
 	return 0;
 }
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 14692497e1a61..834263c9b0b5a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2150,10 +2150,7 @@ mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 	struct mt7530_priv *priv = gpiochip_get_data(gc);
 	u32 bit = mt7530_gpio_to_bit(offset);
 
-	if (value)
-		regmap_set_bits(priv->regmap, MT7530_LED_GPIO_DATA, bit);
-	else
-		regmap_clear_bits(priv->regmap, MT7530_LED_GPIO_DATA, bit);
+	regmap_assign_bits(priv->regmap, MT7530_LED_GPIO_DATA, bit, value);
 
 	return 0;
 }
@@ -2191,10 +2188,7 @@ mt7530_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int valu
 
 	regmap_set_bits(priv->regmap, MT7530_LED_GPIO_DIR, bit);
 
-	if (value)
-		regmap_set_bits(priv->regmap, MT7530_LED_GPIO_DATA, bit);
-	else
-		regmap_clear_bits(priv->regmap, MT7530_LED_GPIO_DATA, bit);
+	regmap_assign_bits(priv->regmap, MT7530_LED_GPIO_DATA, bit, value);
 
 	regmap_set_bits(priv->regmap, MT7530_LED_GPIO_OE, bit);
 
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index 13005f10edb7d..ab978cc8367f7 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -471,10 +471,7 @@ void qca8k_port_set_status(struct qca8k_priv *priv, int port, int enable)
 	if (port > 0 && port < 6)
 		mask |= QCA8K_PORT_STATUS_LINK_AUTO;
 
-	if (enable)
-		regmap_set_bits(priv->regmap, QCA8K_REG_PORT_STATUS(port), mask);
-	else
-		regmap_clear_bits(priv->regmap, QCA8K_REG_PORT_STATUS(port), mask);
+	regmap_assign_bits(priv->regmap, QCA8K_REG_PORT_STATUS(port), mask, enable);
 }
 
 void qca8k_get_strings(struct dsa_switch *ds, int port, u32 stringset,
@@ -562,14 +559,8 @@ static int qca8k_port_configure_learning(struct dsa_switch *ds, int port,
 {
 	struct qca8k_priv *priv = ds->priv;
 
-	if (learning)
-		return regmap_set_bits(priv->regmap,
-				       QCA8K_PORT_LOOKUP_CTRL(port),
-				       QCA8K_PORT_LOOKUP_LEARN);
-	else
-		return regmap_clear_bits(priv->regmap,
-					 QCA8K_PORT_LOOKUP_CTRL(port),
-					 QCA8K_PORT_LOOKUP_LEARN);
+	return regmap_assign_bits(priv->regmap, QCA8K_PORT_LOOKUP_CTRL(port),
+				  QCA8K_PORT_LOOKUP_LEARN, learning);
 }
 
 void qca8k_port_stp_state_set(struct dsa_switch *ds, int port, u8 state)
-- 
2.50.1


