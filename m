Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB3AF55102
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 11:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg537CMOAw5KXaYyaBTjKxJ4ZWpTtB64wlRFWLAI5BQ=; b=trOnXf0A5golhLUREmEydz8yAI
	82YY/Rqbxx5m5dDlfhpmztRvpWw69ts+xYoldZT6LS8CzsPtsquoC+3VHltTEVyNPdrfxvAtY8on8
	D46FDJXvGwQd5yKDFNESMeyJwS29BVUOtCudZJkcdoHGbNpKtbwJQsQHNhEx9X6Zn/TDE8lhP51Nn
	mDd9puGUwhEJY9RlplAmpW9QVLF1wQLHJU88p0GX4xNlaI+SeFcgx2862qbBzN1zrzqgOICYj0WOf
	F0ednRBOz8JhoLgZpO1XALZvnu/K51qWVTlUfo8Vs0inYEWzhbnOkz8z5qFUGHJ7QaUzNExnnTRXu
	Piato/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXU-00000005uKo-03Xy;
	Sun, 08 Mar 2026 11:43:16 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXP-00000005uAU-3l2u;
	Sun, 08 Mar 2026 11:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTbYAbvLGAyOle3UkMB+x6HDAf7iZ1P40f+EeFaB3H617lzjRssc8HygidecP+QMliexVvJgbW67WC+P/v161J/1OOQzwOWn4A7IWrqMGmiUHLZk8fEhSC2Dpt0/Sk0wRc7Wy/Vk2alYI46PGMblRY9CfMrKIRTrQc7qoXau/1GRV2yfgTmg3AUYcMgDpnUwNyGA3pfMt6vjf3O+d+b4z+TaSTrsnt0h7kRc7p9slT19Pr2yiT/VTxjhdi18eUR+kpBrAC9teFhuike0KNrnz2Ga9RAex/qQXqhcHsIyHADLDIBuGLpU7fjfUro33X3Ta0qG7Rhm6PcKrLN1mWtJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eg537CMOAw5KXaYyaBTjKxJ4ZWpTtB64wlRFWLAI5BQ=;
 b=P1PZ9VxJ/HacHCqBoy+tF1CRA9xqQCWpfPCLSRAGhrc6mOqj4qo0iSFPcoAPaqhLz826kLU1NHyojXIbTe9GwbARRLUS5KcpioNereAwyV3os6Ss+BA3VfzMyYWT0f2S88zTgPnCi9jv9yC9Ex1a8OKE4buIAOnV4Xcm9NI6l7S0DuwyHy5lwqoZx5e1az9gvShN0Ike3M53/Ojbbyz+D9DiKGolhsRvTqWCdCYIDO+XFqJ1j2NWtikIMRKsSlkIZuAN5qDEkx6AQUd827hn9RHGwM/iQXm6IGW03JBjJgPXrmObV/4LMcfTrTvZBn7vKqBwraek32JSvtoWAhCNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg537CMOAw5KXaYyaBTjKxJ4ZWpTtB64wlRFWLAI5BQ=;
 b=eM5jsqPZPl8Z9vN5ovu1+FCuYhSdafTwLZAJCsNQlpXO0whkcloat1Ssjdx+kwU9KBx6MzAspJMFBxpgqoj+43iXyez8kwF0pZ+sjNmYnvJa6XFtYwYzarf4BPd2WCOiOwuttLn+mxgrBRRGKOE42l+3359hJ3LqFO7oOliLhB7XKDCIswYuJCaSdOGM3JLm2C9SctElp1IrILUkI5rjXuSRcpv0DuHtFiHF/5iUd0TcjU36cKRIlmyzHYpgqcIE5Xgfi3K5tip4YIdD0xemqnN+70MT3XlaCibZ15ltDxUr4iqY0nTNxjNSf+IWdWaYS9GcIeCQkxKEZ3qiMyaMsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:03 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:03 +0000
From: vladimir.oltean@nxp.com
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
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH v2 phy-next 04/24] drm: add <linux/pm_runtime.h> where missing
Date: Sun,  8 Mar 2026 13:39:49 +0200
Message-ID: <20260308114009.2546587-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: 555f0e9e-9993-407c-05a4-08de7d07dba3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: bhzjanMrC7MI4tIcJW68v6GzgkvTVBFFrToXCJfBON8VxEn9+yq7dgSSg7UfcsUMnqDu7UiqEkob02dGQrLw7TMcmkcuJPjHWTZQghzUK3t6Sm+S4bBfeTjeIdh1Y6XLZjX14XiAopCWlXTQQEtSpLoQsQmvXHmswPCn6ymRIBw06OTwa22cnrA09mNdZsVGwAXrGecPS7UwVSn49t2E1EC5BJV3nxA1DZerjk/pNyQ7rci+NLOxfURAE3lW54AHhQpstwSjQ6tLTPqE8DtGJRF5VQsQKjJnRDU2NS5nOEwW8RGbSvGst+013ZpVXMlykXzEOqUhwyVKVM+Q9ZfceBeu6a712pFdfl69vRP5RvfTy9qZ2HyA63HvFNb+jxqVBdZkoBpWiCxHBwjr3Tq8iU+ThMw5J6I2ag/BuacXDAK6iJNvatY54dg4jb9yiIhn5xs68Q8pssCl+pKmcCfbAsZ7JDjTLi3YF3zmi6+XMpPq8NY7avHFD6Ro9ES5vrZf0zChyDWo7XGzaMDSy11HHxYB+7R9XGQcE5IbkLytii1sQ6zTManUG9YZFXSs0hVwrGdUr96LC7XUDDNQPwEXBO7mKpIe+GvcJRy0Jjv5o9HIwg/OKHWETQBpnm9Bmw9x/2ctYbSIrIWxXx+7awOb8pEmDdq/WMHPalJ/qZwJtM312h9q9gZrOIuoqkF55zTsSZbyX3XW76vX/vq7f5sTTBXozEovWiazTms9uia3YOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bvAiOI92IXzUujN4ERKiBN3VM2TBs5iO9E540o4g+f/HVxvusTTHpQkfalj3?=
 =?us-ascii?Q?w85XIHikDDijhnTBz9yHh/iYCpmgvtXlyIsP6OOH/ryGx2ItAZvZyO86jGfq?=
 =?us-ascii?Q?5qaxeIzixWVs5xW8yffQ+s2uxaNmC7+vi3AQya+Y2bEbQw4UivxsoNFZZABp?=
 =?us-ascii?Q?/bR9ct+2ey7nt/f4FydDRWwcMKVBKYmyZSBuByyMwTtKCPVFf+4zJTaJnfhT?=
 =?us-ascii?Q?BOSf8b4X3VxKjepR4PxdDk8nDqoFGLpOafPo9t+Ug+uevhsTAMJkXF1Fs3Ma?=
 =?us-ascii?Q?n2kGH3qDIqHdY1FSXBd0VI6nagvBKs4twGw2eJGXRqVYGBOP54CJh6JqM/Pu?=
 =?us-ascii?Q?n5+mlqbFp9JL3IbryBlMCcBbAj1twO8kwok5mNpTbN66WfiC+ghE5YD4voVq?=
 =?us-ascii?Q?9X4H0DfPrY09CHCFaj8E0fLtx3vu1SW3knI0FIa5ljqXY/23+InzxXI309S4?=
 =?us-ascii?Q?uMEGBSZAFD46e8O6NjCB+LREYrk7/JYkUFw4dvd0qrEdKNmd+95qdliszYip?=
 =?us-ascii?Q?9MtTvqWOZRxNGq3MACDjT67f5jjvUGAwEhJlyY63CUYf0fQ/c4uNpTUJEay2?=
 =?us-ascii?Q?eI+qVeJ3ETzMnuC2TINZ1eDoADViz6zZdOW4A4M4HZAXNhx/N9rQcUFhdAs4?=
 =?us-ascii?Q?HQfXRR9I8nmf0iYvU2c4GY4fNemxARPa0dbMVe+ErKFcQbL6f7yFLNmNv2EG?=
 =?us-ascii?Q?x+fAdG8v4lBS6gETQr/tBWQs3WLkKm1lM13iZWM1Cw+BysZ5MOgX+Fuw6Hi9?=
 =?us-ascii?Q?mkrsjv7tSb9AzcVZcjIXFjjT3mXJU/nsX15QGGFknbVa/uDTv1RJcG1TE2N/?=
 =?us-ascii?Q?Yh3fm5Xrv9qWZgT3BU/yhW3w8ANokrwd/1f6ap5VZt5akGDhz7dbwPxznZ1E?=
 =?us-ascii?Q?sJBB93T0zi+afwCkYLvGr39D41Klm9qs+1Og4RM31p0rFJqknFYmXTVB1kEN?=
 =?us-ascii?Q?67Oce7iHbDCYeZA3F//u/M46/nzzSZ7/FjvGf4bZ4ZTTlqzQVD5IENHBO6jJ?=
 =?us-ascii?Q?d3xkIxuoPy1az+YIQvN+uo+LuLjd1/iwzwQAZk6yxjuiSuR9EwgZ8dtQNLMF?=
 =?us-ascii?Q?kFMT4jJd2PKZn6BsCFLl5wBLcGEpg8aZ0+zLWe6eD1Ht/tKH31iUQKzU5PTP?=
 =?us-ascii?Q?KIY6V3B19kduC5bIsYOycHoszGHHRWFu7IBTDQvZZjknTRdy8SDJJVniRZiD?=
 =?us-ascii?Q?5oyWkqYVp8aWtjgDYAacN1rzAB7+kAPVSxtKDdywUZHrrZQdbEjnDO/FqEZ+?=
 =?us-ascii?Q?RnWqdiwEzNDHLHfV5M9io8hnGcI0l8GIqSO1AUZsvrxKjhb4vcmdd4/r8iA2?=
 =?us-ascii?Q?ffvxPZWdZ9TfSxZ4vzGgyI/h3V8Ti6PB9hbw17obN5HdcEkLcIvlRROrSl/8?=
 =?us-ascii?Q?w8xFclg2fXZJWOlB9RsU+SxTTviZxOIWzgZ3ZCimVKpUdAlpLZ+ZWxyd9vU7?=
 =?us-ascii?Q?W+2QYSscyQUMmPJCvY0JIBdQ7q66OPmJLqnaTKnAftyEJzg6scRiCHqWn+nt?=
 =?us-ascii?Q?SDG7wuUTrMJ1D3ShwvYxSF24AqqmQJYDlNtKwqelJhRKOgKICxulgjdBgpjg?=
 =?us-ascii?Q?qX4MhkfTcmPGREo0s7XiOk1WgR9fha/hf3iLzekLzn99fGaZ+GiXqpiR9ur7?=
 =?us-ascii?Q?AdwQSzTaV66V59MsKzgmy1T6UAAwklTetj5gNRUXQF3LiYXRCQPI7rllRSLf?=
 =?us-ascii?Q?Nw07xm7Mc/k2BDIJSANDUaLW/3GfSsocv0zlFAcFR9A2TxctpFpwSwhRzybW?=
 =?us-ascii?Q?a/52f3lmr7O3GWsgFjH9/UYsHtli5E2OhRok77Xm4B/xorqbMU03ohDztzxR?=
X-MS-Exchange-AntiSpam-MessageData-1: QfIcUkZ4+HEUWxfB7Gakm9CB/3uJyrAbQ2k=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555f0e9e-9993-407c-05a4-08de7d07dba3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:03.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPTjqMZgbEdUr3Vf5LoWAFwO2QLOpVcQsD4S1Mdd4CZIuchoA84eo+60uX7F4UYYrq5+b+QhfwsQXQ5RJ+AmQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_044311_958874_B29FBB70 
X-CRM114-Status: GOOD (  11.27  )
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

Multiple DRM bridge drivers use runtime PM operations without
including the proper header, instead relying on transitive inclusion
by <linux/phy/phy.h>.

The PHY subsystem wants to get rid of headers it provides for no reason,
so modify these drivers to include what they need directly.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>

v1->v2: none
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  | 1 +
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                    | 1 +
 drivers/gpu/drm/bridge/samsung-dsim.c               | 1 +
 drivers/gpu/drm/msm/dp/dp_aux.c                     | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c              | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index efe534977d12..9dfe790e6c14 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_atomic.h>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 9392c226ff5b..a8b6ae58cb0a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -32,6 +32,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 2f7429b24fc2..9ac8796ae91e 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 930aaa659c97..54bc148fc29d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/units.h>
 
 #include <video/mipi_display.h>
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 3825a2fb48e2..5ee22f88bd28 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_runtime.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 177e30445ee8..68556daa54ae 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-- 
2.43.0


