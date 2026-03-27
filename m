Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3BD10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLnirqdBD16aqPK+9sV2J7E0xpKf7kYfH4HWgymhsj8=; b=Qx//jZ568mXcg9yHC/wcQOPkaH
	6hTlaPwwQ6VOPkxgI8VrisPG9ffcND9rRYmhjRRy1u5L7vmZDRWugxUQhQLb44qeARBi7q/+LHRPW
	TTT/CXv5o9UEMB2KpNHFDv5KFOylvVdOrZfkjtfF0HJjQUqhYfgJ44efXFxISwuLQQahoDKz+Vjzd
	/H45wfrIuxm+izVpv0TlxBFDoB7N38Hyapd4ABz/ChEyrwTSP+lWdnpj/7a+DbgHnpr3xwYVG6d0I
	Ks9gc0Jg58wzV1q4XO1pNJV8urkbVMxa1ru7GM2nDQprLnYR2bdSRXx5unSDDyzbWTspHc9cjE10A
	aw1lN9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CGw-0000000811Z-0H2d;
	Fri, 27 Mar 2026 18:51:06 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CFX-00000007ydP-2Q7I;
	Fri, 27 Mar 2026 18:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3/PKAwXtAXVIad6peA8O2xWATxG6u18JcNRzX3lp1RxBFEbq13bzRD9zR47+JbP0BfuYY1++476vPxSUngdbdE0XUzOhqGLPUdbPRV6dCHxKCeSk4WYnKFEjAUNXMa+k5ha/3IPeJjUczFDP7Z37TrSxFR1hKJ1SwvsV/tMrjjbMnRK6L8KnBWcCKn6NjbMaimKvmP7Cr2nwH0JoqVcutuKsI9GNqLahasPXNPAr/gpEEVioaMIj+3j4XJXvyqxf7oCfvis3qDOTUjIhNO8BQyWO+Uah2dEpYZO4C1RF3dXaEsRrLYmB/AjenSaJze5vS06SB8hRaZH+dI2M9jxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLnirqdBD16aqPK+9sV2J7E0xpKf7kYfH4HWgymhsj8=;
 b=SSf05mFeliHJ6dSOmobF2O/h522ndEIpjdTTO2XvL2xgGvg7aJ0AejYasJ7HKmDdJjjgF8XKq90isSncul9FXZRUr63VIoAr61k7GUddmR397C0KSEI7E5wgSnUqGCKO0XD0gmohy85Ht+dHpfZLsqBPUfn7nIMfH9wCVoasM9gU3z6KJPfqA5ngqoH4SZIPlaoCmjBLIrOm4Yd4jRu1Y/ctf2uk//VSXmAUwryEcnc5n9Cf8KRb3poDnB4J2ccNvTolYASmHgGqLHgCdlXJa1HvmSwhknRbcc+P2Ns7EIU+itHGHytJbUMG2nAnfVEOtwHCY1P2PUNWcUhCnT4ZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLnirqdBD16aqPK+9sV2J7E0xpKf7kYfH4HWgymhsj8=;
 b=iBRfKBCSlxf99uMbCf6mej8PBUH/eG+pl40tMTYlxPQVSm3fxl1V3v0TWis18SdHkGjT668Y0M6WjPFQCVOrhQkKirhJy2XqDxuhZig/BTKooGCeJiHS2kM43+y4eotR5hM+YUsefM9q7yuqNKi98bxRSGLF3biBeRAlLDmkvK7ciSyqSQ/eqa/OnO2HNOUHc7/MSUKbwn08EGRQeS/HYgsgHaRIDxCJEnfVd9/26XylYRsznnbBzn+XTZrJyLPG84uM+e28we1gi1DKSqGVbU58TVOeiDXaSvTl8/a5v7E/iGhRH+Htu6E9B79mAe6iljuPencGJ9lMOaZuY2+eqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:49:19 +0000
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d]) by DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:49:19 +0000
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
	UNGLinuxDriver@microchip.com,
	Chen-Yu Tsai <wens@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v6 phy-next 21/28] media: sunxi: a83-mips-csi2: include PHY provider header
Date: Fri, 27 Mar 2026 20:46:59 +0200
Message-ID: <20260327184706.1600329-22-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0146.eurprd07.prod.outlook.com
 (2603:10a6:802:16::33) To DU2PR04MB8584.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8584:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3dd0ae-3dc9-4764-1668-08de8c318d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cG9GjQeO9//vJIpWY090tskoVt5zBBYjSp1nlJyAAZ6QZgg8FL9UcTQUUnJ36vBgayNgWz2223DHscIBwBwtPX2u1UQH5+JYW1aBms9i4mRK/M9zI0yDj1TzU2XZXvjifex8zGu8DPJI+dzMz4rSiDG3P0vObVwrogB7FPyp+FM2uF8yly4aKp4PEzYillpOiHDiwA43mAmIBsJMqXZr/9vGYsR6YCkUlKcXEnAe7plk9Z0857pZxLL4yCtK3rclv6mYYGl6g7jIcLkQ84+hbum1WSX632VW9Skj6MxlBC4O5WJ9WKOKbWxCbkHvVhS/i+nkgWoYyh8aK7eZYv9WxNFOLjlHECHz7mnFbqrVlN6xtSucNu9SjgKy7DmONutoM9M1jODXC7W6UFO9mPQdj1C2xDrpxfVbMDiwMk7vBtO1guBmPs7+miSv3RRHPXkjUQcrjuP6oIfTrQbaQwRx0cECf3tDVX0wpOWdckyorGP3RBwHzHpgFUa2wFORRA1vCkallS/CqLVIZ/Ml7Qbv8zAUJkCsJaDyjHvGt9zPCPLZSuY9fWCe/rj3TEFh2ZG1XGZt4ZCXbNTyGg9fZA5Ab1OkeAF/aRQnwU5ofk/EcjtS3g/cq0xFHYuez4dS7ebbPpvyCyKb0fF3ZOFrTKG7BPiuSLdpzLsIFt0XsrKhLmUT5GkoVoHqb8g0N+lfkoxATCDPXI7bSaidiSwE5gsK2bPzpbDQ0nmlVwdJn6V7MuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8584.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cBCVh2IUNfbY4zYYc6gSaTObdB/fKyvlCeIXpMW78/Ly6uONzuni28xlCGhX?=
 =?us-ascii?Q?Do59MwmVDGq2NfvRZD9PJYycfXtZEWwL7dvl4yu5xY7Lk96EToqejjHTa0vZ?=
 =?us-ascii?Q?1pFt13uB+7sPI2RXnuLmEU5e2S6tMdd0cKFGbLQxBYBYR/B1NVd6mpiv8jvZ?=
 =?us-ascii?Q?vtLIvht0FdGtzqbLLRdepMvEfYvCIY+db19vQq6vkHgh2cGqXvsE4xPiXyRN?=
 =?us-ascii?Q?aFVLkJx9WnntSfmtSdGPCbOQXSiz0o2U8KWdWCojP3L78M9XRty/Mfm9VgEP?=
 =?us-ascii?Q?E/8drHbb3Ch3zU3zQOojtTL1GU8GiRKmW4vtgbsk8xblBLxBKytIBPDMhvkO?=
 =?us-ascii?Q?tHvsAollJP00m1T3VrlTTjpT9EkfKZ3J7JFUFACMbFDijOSeDHEE0dWFAbV2?=
 =?us-ascii?Q?uNwEDYfIyX8JfQXPMdPhtKYIqCuKfcmHA/hQFdb+8f206lspQZwC68obZxMh?=
 =?us-ascii?Q?tOrLOBeTFIM4R/TIXTH8CMFb2RsxNRQvKyXdcdhoowzuc1jwrafhhSE4ULiF?=
 =?us-ascii?Q?Q83TRzBPZHrFbTk4lvtZkhAIZqdAVnsMUvghTlFOiTLdzcMh+QgZnP+TPIkB?=
 =?us-ascii?Q?s72ovixSVJMhz1AlBa26aFlKejf4K9qsGWs+1F6YSzMxpFv8IOe6wbL62rF1?=
 =?us-ascii?Q?dPmw3rYvmMqpiabSdHLVe3c/iYed6AJt01J9zbSCqC6j91OM7JA9Zx3BuEpW?=
 =?us-ascii?Q?U8Xg5MOj4xGL390o89aMC88CA9AzNdi0Scfh2zDNoj9Xg353qGbQApL8sUL8?=
 =?us-ascii?Q?fqET6OtmOoP3sEgxdj1x/80qLUQ/0Mz6LtlvN1uYFRRPhW1Mk8e2OlIcma6H?=
 =?us-ascii?Q?oddhOVzpaKAZkkY/UXpWPki2okXm2ELT1afXI5SvSQuyjNkGd1YKuNzBNvF6?=
 =?us-ascii?Q?fvE50uRvONsSGX7snuAwfXXMAsJ5Qgc9heB/1ClLixIP5xzMVZSwr8UDmyD/?=
 =?us-ascii?Q?HPRGALyW3XnK7a1ASJjBEJuE8WBWGOjyjs3zi6f4jluc3XwZ0T+Ezsf6NXhU?=
 =?us-ascii?Q?vTOLByJvyJfK3l9alygDVrXK3GvmtiEkrrHgrHCIAmKkiQ8eOB2KKK2jR8EK?=
 =?us-ascii?Q?haWPna4ViYKzV53VI5wtd6tJMaxLcn0upxGKqLOXY7KxLmhucL0QoPXXtDiG?=
 =?us-ascii?Q?5OcW7tyEZrp+M4PpTqEMZAzbjJ6z44lyyGl3NP7m84hRhkFTfFaiduzghue9?=
 =?us-ascii?Q?Ov7JOf+Pbp8/wpiTCm2cZFmGw/xgfQGJ+mmMN6x5KFNDz5DQ/s3GugEU/4tt?=
 =?us-ascii?Q?lG7v4u06Zi+7HvliqiDi+8wlbJDIiYKYTIbsco/FlghU89jCaSSnc6w6jz3N?=
 =?us-ascii?Q?h7Nqsx0hBymhXkNyXGk54TbKbs8G+4X/qlH+mkfw8PcFmfRg6RCWwaJK1Nj2?=
 =?us-ascii?Q?YGl8QulFXMax9yMsEVnDZtEaY283hpFNr8BNbH5Zi0u8P5TVhxcizk5gdf0Z?=
 =?us-ascii?Q?sXhDjWZY4NBnvEvURsaW+oaz9/+fOQyA08QoOxkF/Y6OApGpUSitIILd9mX/?=
 =?us-ascii?Q?XBLZsMo5i4BqyfZybwkZFUlWCCh5eVkcT1lhd65GYTeQf28MDgMDkPvF599f?=
 =?us-ascii?Q?Cgd4lLrbMHtHe9xwtg0kaLPpIaUKwe8n32vjH5oGFsR0JsujAP0SwqEKUej5?=
 =?us-ascii?Q?Ex53tdcvr91ojULqcmz4EBt9OlYfoxnphYwpUp2u93qT0vbI/kOeY2nGmDV+?=
 =?us-ascii?Q?I5jrkM+jcLEpUAEClBKgKrGCMrfb97F9UELDHXfrrPQmqhr1M6VwDb7s0UFE?=
 =?us-ascii?Q?naiV0lFc7Grq+LR8Y7LRR7uk4ODk9IQFeeKLp1WvuQiQEoCj3avdwKqK/Rgz?=
X-MS-Exchange-AntiSpam-MessageData-1: 4DPxYVjjlDf4PHY080mVE2rWFmKWuPr25Bg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3dd0ae-3dc9-4764-1668-08de8c318d9b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8584.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:49:19.1304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rn/TatKcOi8xhyPG64wvMxVKmcd3RcM1u3/dOLUxH7Tt7kklXJSaJzeArr3l2LmICZCb9/ZFfrLymzABb8MgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114939_699769_AAEBEABA 
X-CRM114-Status: GOOD (  13.41  )
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

The introduction commit 576d196c522b ("media: sunxi: Add support for the
A83T MIPI CSI-2 controller") says:

    This implementation splits the protocol and D-PHY registers and
    uses the PHY framework internally. The D-PHY is not registered as a
    standalone PHY driver since it cannot be used with any other
    controller.

However, this does not matter, and is not the only instance of tight PHY
provider <-> consumer pairing. According to Vinod Koul, having PHY
provider drivers outside of drivers/phy/ is discouraged, although it
would be difficult for me to address a proper movement here.

So just include the private provider API header from drivers/phy/ and
leave a FIXME in place.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Chen-Yu Tsai <wens@kernel.org>
---
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>

v4->v6: none
v3->v4: collect tag
v1->v3: none
---
 .../media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
index 24bbcc85013d..1143feeb4fcb 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
@@ -4,9 +4,9 @@
  * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  */
 
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../../../../phy/phy-provider.h" /* FIXME */
 #include "sun8i_a83t_dphy.h"
 #include "sun8i_a83t_mipi_csi2.h"
 
-- 
2.43.0


