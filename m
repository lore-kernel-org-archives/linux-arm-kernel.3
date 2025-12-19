Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF2D74964
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=buAdK2zj8BSzNPlrF21IZGVkT0WqEs5WYIHzyJQ7vVs=; b=To8ogt4moMHoqcvtyhJIC4mHdN
	DMP/MaDObKcEcBuEb5YrKYF2afJOQOdGstMfMPmfdkXO2XQP2b032gEVqNWUS3mO2ZhG2WAFpSLKs
	K9VKB8S6BmXMm2ZqkFcOE8OtqTFQAfmTafgbp5t0mf5egV+luKqYDL9hmynSOnW+CDIMUrNQ2BN0O
	KaA+vzMKkhncgslApuTLaamoLgiJCXmi/cK5/HMbWH54NMRZOTwKx5epy+ZqrEHoSWsttf/vbZXa8
	9KVvwV4ReQoCuV55HyZI3FMy1qwft1re0CJoypOjlWS5dQN6RVEdqc+VzqgK3ogbqO7R2mXV78ZjK
	40XgZj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbx-00000009otX-1WxB;
	Fri, 19 Dec 2025 08:13:17 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbu-00000009opU-29BL;
	Fri, 19 Dec 2025 08:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPhEn/2keSeRs3n9O4l8KyzH2VqmpTp9TAXmyGrYIEFOWXp/Tt+DcC1SxTCjiDd1Pof21OnySkcwz7q4+0AGWr8t+Qo8I6h9OnYuqKkHFwCMJ9UDex3JbEmMlKbYezkjsLyoL5MaNE1HE2xgnjgEYs22Ii0AO+ww5pKlvoA2o3Q9h3uXG5oMuRoXvB4jkQYW8QJ6d1jzOck1oeU0rr0A8RKlx7gOzC+boRvl+RMT3mP9EHvps6She8lX1OosLtoIhNRqvAWP80HKSkyDyiR81ovpPsJr4lN2w0RAoREw2Wy5PXhn0V/pmCRXGmxfnjtKz6jNBRM0NswTOvBBqzy9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buAdK2zj8BSzNPlrF21IZGVkT0WqEs5WYIHzyJQ7vVs=;
 b=dWUavPhXal/j0RBpx+ZCXqwAbIfOScllWqH+OGEVd3UtugL+b1kAJw09nTXZKSUZT6VnJ/sO/5EKPOzPDDLgDAmSd37qugXKmlEQmj79Gi2PpZg7neuCqEB3+hSUG5ZVbgHEoYti4g9A+MxQXcGiMqT8/2bXCSa59fBRFUDSMe78cyAKVqKV5wuqO4sGHNZiqJieK7CQStJd9fN5F8b7vx1T5n7fzZSn7MH0wkkDvbcHamx96oozgXnGe5l9PLifMkzdR+/OMMwO3PF2CYgXAbkNMs2198pv1nErUni+SG2gyXdNWhHva778PAY1mFB4pw02pxu06doniLEBMPAlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buAdK2zj8BSzNPlrF21IZGVkT0WqEs5WYIHzyJQ7vVs=;
 b=Z604ZtGc//mWs6HiB173LwmsAzjSFN+CykOv/gXqcAxW74oVtb+kmYi+TDTJswYW5S+Ym/fU68IzmI3l+A8l8UsobbwZyuu6KmKHfIPA5xQjCtra03iOT7HMp8V0cF98P82hDE5IhMPXUrfHxtvKzMr6o8Udu5XcWNd+qdRqRy/03s6Y6cIx2SNuv6dZDUDPgLH1BotqYZywBhxFVf9Sy1w69k7SEiwAWuiQz752yhuc+woN5feNo/HVBQZhFyJ8haz5IkflfQ//061HpokUcoi/osNz+Ek5AlAmivoSnF/+CEQrXQXfpjc+hWbc5g8Gl9lfFJS2YCMgQ5kj2r0UUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB11456.eurprd04.prod.outlook.com (2603:10a6:102:4f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 08:13:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 08:13:10 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: change ssc_range value for i.MX8MQ
Date: Fri, 19 Dec 2025 16:13:54 +0800
Message-Id: <20251219081354.3806806-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB11456:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b38f7ff-5785-4028-3d30-08de3ed67299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mAAt1FnUNgVF4fbd0AvvcVFR7WD2EnMuN70pKtlMEfMkQDNLYmuVl1BQrKKg?=
 =?us-ascii?Q?h7i78wvDPDX/9sb3s1gI4tkl2/fTkqinjgA8BmEyJX1PZk0LpeWDyi7WkCmL?=
 =?us-ascii?Q?BKkkdsgmfVSsm33pgqJnUDmn4OU9fKZQYgteBbdYwRm/XUWwKIQ+GNd2wyiT?=
 =?us-ascii?Q?iaBrgaEWoDdVtit9nxIbGSgbNJ1tuCpt0Csz/vFG+9WPVy+rQjCUSKyuzQu3?=
 =?us-ascii?Q?rDwTbDpf6iJNzba3sacIzgjQsOF98dUZ3gzLcicDBTtcdVjvE2wrpAj3DdYw?=
 =?us-ascii?Q?6MuYWsqTHyI4eOHop4NoYfglwnnOZGf72I4FvwmKrYg9AwM2R/XyRjMmXjy5?=
 =?us-ascii?Q?HqMEUozH1NtXJLqD4jRgWBXrMUC6kMfyq843UfO9BwgLxp2kxVDyY9XNJgZ3?=
 =?us-ascii?Q?xjM7T9JmRAkiWLPQZnZnYBwtfw9W6bNsUm4vHxUTVIdEqXPC4a1ZsxwBRkeE?=
 =?us-ascii?Q?7Oi8YKuySD93W12lYe/ln9crYBCSXcM7H6PqAn+kltyWPIQxrwSbhC9TWuoC?=
 =?us-ascii?Q?fuc/zM8cM6ZQkuw6VpYtVZpB8XI6DuzIeho880v5yzKBrRxSC1JNfvW4CQmz?=
 =?us-ascii?Q?NaoDCKZ9YDyRd5zZdZLCFJPaoRZlBDKzJNIeaJXB9QErcUC5g0348HoSvHBF?=
 =?us-ascii?Q?aMm643d51wjrCjoG9PGtOFt/PIYclJfnQ5u2xwOSYaIFDM7FFBYWQLYm23Xj?=
 =?us-ascii?Q?hYg4biWavDUxm8XyH08Al/NdFb2xxsEp119XFMpJ2WLQX4v1m86C5zy2YId8?=
 =?us-ascii?Q?LCp3xi53Eh3ENWkp5ITbwpvNVH0hxJ5ZjRXFOt95VNLxT4DPRBZDnGD2AwZS?=
 =?us-ascii?Q?cQXiVL16Bazt6TX88KBZgYykwPpID51VHyLaBWdBSo0nGEvTPTsDF7GZn39K?=
 =?us-ascii?Q?BksxBdDeq88NpMzqCpF+w7j+clKkLR/pdB2RRyfS1NPG1zvfTQ7i7P0ZTr+N?=
 =?us-ascii?Q?eO0KtHme5z2jLeX145qqxCg+ka+e5ZsQnUFDxgQ3Tn57GiVXjsBU7hIaKpg4?=
 =?us-ascii?Q?slyIDZquKLPC3FYj0ocNwzZNOM/3OT5lHW/TGXOxZaGvwKGeEu7Fqx8ZOG5I?=
 =?us-ascii?Q?e72T3M25biHATX8SQjlY5LGak/53IckDNuCmAUOe1IqE0QeqRLuwJzn2mP6T?=
 =?us-ascii?Q?9D3ZWOsU788hQQX+9A0MoPl5WYTuV6OZ7HUbc34+UUixK/bgqliNbCUvpdrO?=
 =?us-ascii?Q?ilLTOihZV1MXOVYkMFh4MluIP8dkJKL4jiTxogG0gpSzbtyfbGgzLxW9jSkX?=
 =?us-ascii?Q?cdVFy0lUowY3TQoKpYYTNI0KEu7p94t5KgW3zdAUIV5j5IvhSUWYbOELxyCT?=
 =?us-ascii?Q?/iLtSdGHvYenXeMb1b0O0gcYBAkObfKFxnHAC8bX1Z5BnrO9JmgMGcUS5LBr?=
 =?us-ascii?Q?5Y+QCnnxsva9tbSBYItxujTYvYiJ0NMujHI4mpvz3W2zkl77HRuPojY9d2aO?=
 =?us-ascii?Q?aRXNpXNsUkRqZO5R6hE1EesyoMLh8Yn36gSB62QgZouPo6MvyNG/Bjyqy0qG?=
 =?us-ascii?Q?9eOftVel6eMSFV+5zmw4dJrJzA4WHe5GPeDx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mryitYfaP1jn4Um6gkLwy4AIRi6s+tAsKm8PNcnNDfjls3ILnT8+tPQXN0TS?=
 =?us-ascii?Q?9S2mADOgaiaNYo6fsBnxoKrtwMoa6HSUGrvjegSm567UccEw3x+0/sysqSH9?=
 =?us-ascii?Q?/YTyRr8iOyScD0X2rZFfJu1vSJtBL1CXQwnDz+wB46hicCMOk2UofwJQZh3i?=
 =?us-ascii?Q?XHx+VHKmUYnknqSX/K26wSWEWfivsw+gi1tLijkpXZUeu8O88q1OmXcXDHYE?=
 =?us-ascii?Q?3WNKaQEBeDerMJCcu88XN4pQteKDIgl/IL3ndELo2whqiK7lh2qJa7l7wvMI?=
 =?us-ascii?Q?kuks4Q1bxFYr+FIZEicQqCI2/BC7xBEEodU1y2O3oeMxeZX2omZlvR4x9GvD?=
 =?us-ascii?Q?6R2PZ9iSUoeGofe1llBUXmJKROHqB8PvOIvheEmZAhlaRNIFa3WbZLh7xWGi?=
 =?us-ascii?Q?H2LQU6teUvTSeaa0P3jJT6wcks9aLoJkCMaHdL3MYWVLzctj5iztKFp42rXL?=
 =?us-ascii?Q?Oox2rh6hldIG7G6l7QQ9i7SCqfgczhxdcQnv7hJh2okfYmgG1zsv9riiCnI4?=
 =?us-ascii?Q?ttm0XUQNjafTexRkzt0cwQRluhrD3Z1/rbNwRxYJRKpWTqeKAICarLUVJ4IO?=
 =?us-ascii?Q?jV6j/QcAf7MgAQ2WksctquNw0Iya8cV5d3U8jF4w5Jvcm6wjQbd/HYduW24C?=
 =?us-ascii?Q?3Yp5f+M/99ZYALlQHxDiPz/FvUL4T5pbK5LvvBOdTzdiWkU7i2iHvpvj24Hy?=
 =?us-ascii?Q?KV387ip10RkHvYoTllQzEOYZXKx798k0nNn+8rLEw8yeLFMQsLArmF+ulJch?=
 =?us-ascii?Q?XVFMHkkBEp0gG6jbjpMDfU0mmCVn9tzIU2J61a7X7Okj/iqAr1gcrnO7QYbL?=
 =?us-ascii?Q?VBg+go6Yt5UG59+k7RGPJawP/umSX2B545GZfvd1oa0yT5mSqtqDWBBVIiAY?=
 =?us-ascii?Q?n8L65kt1Gr4PfJ8P+9oS4Z4eUbGmlQnumz6O9yyC2nABcmTtzvc23dQjeEdE?=
 =?us-ascii?Q?4E/6lSd5mlB92cMrwbMAZDKuJvBq+BUgT7bdUm0ZLIRE5wuHEUNs8+IsnFIN?=
 =?us-ascii?Q?kMIGcZjFytV8WOhdSacDyLT5IuQL0Nk2Dxeog3k8AU7qNWlwR1pZGWTYj8Kx?=
 =?us-ascii?Q?+FkPXzQq/csa8VmKHsxIw2Tbyg6Y4z7+2uPWX8pUSgy8xBNPi9giPNBWhjhk?=
 =?us-ascii?Q?l1QK3vS0ohj1zbgvbtFCdJBhpVCBdf+D2PPwYOfm3+dyh9p3b3JCXVCz2NeC?=
 =?us-ascii?Q?dVSe8K8Tz5arOAvniA+Kllfcv0BR5LgLt6TcP+zD/RSTeRdnHzSXv6mVf7fH?=
 =?us-ascii?Q?YbbfQloDoDq2AqWeIfp2kh/msjwCA+1RSFuJQQCZKLHC+/t+VB6aEnw6FJAK?=
 =?us-ascii?Q?mq63EwwUzP7sUKNEbj1g+8Fv1DyAJFlktKVLL/ehTnocWliIVuQ51C882Gyo?=
 =?us-ascii?Q?IhX+J5Fv+iXiVQ3oHY8KK8IFrGYUZwzlNilS80CeCmNiu8BBw4Za42c+HQHe?=
 =?us-ascii?Q?Qp6f50qU9KDYKgCFfoiDfsO+x6bWM+BVJ7tjyXTY3DxmpTm6tCrvE6P7FKYj?=
 =?us-ascii?Q?8+zQSU9J1VTBce+ZnIrWAJQ5dLjg5yW5xp/31AkO5IKEErN1i3iuTE4Xy10T?=
 =?us-ascii?Q?tHgbJPM/QgbL2k/SZSXuWYENqwuWwmXEzhUWXk7s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b38f7ff-5785-4028-3d30-08de3ed67299
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:13:10.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5t9Fz/4M1o9qScLyNsWr58cOi5RmSbISoT6uWJicbSG6pwUw9+sOdsR3Q2Vg0U1X99ln5jUcicOk9yBvA7+QAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001314_579026_084BC686 
X-CRM114-Status: UNSURE (   8.48  )
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

According to IC engineer suggestion, set ssc_range as -4003 ppm
will have more tolerance for EMI, and suitable for more boards.
Besides, it's confirmed that with this setting the TX SSC test
will pass on one customer board.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index cb2392008ad2..02d9af409b08 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -18,6 +18,10 @@
 #define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
 #define PHY_CTRL0_FSEL_24M		0x2a
 #define PHY_CTRL0_FSEL_100M		0x27
+#define PHY_CTRL0_SSC_RANGE_MASK	GENMASK(23, 21)
+#define PHY_CTRL0_SSC_RANGE_4003PPM	0x2
+#define PHY_CTRL0_SSC_RANGE_4492PPM	0x1
+#define PHY_CTRL0_SSC_RANGE_4980PPM	0x0
 
 #define PHY_CTRL1			0x4
 #define PHY_CTRL1_RESET			BIT(0)
@@ -780,6 +784,9 @@ static int imx8mq_usb_phy_init(struct phy *phy)
 
 	value = readl(imx_phy->base + PHY_CTRL0);
 	value |= PHY_CTRL0_REF_SSP_EN;
+	value &= ~PHY_CTRL0_SSC_RANGE_MASK;
+	value |= FIELD_PREP(PHY_CTRL0_SSC_RANGE_MASK,
+			    PHY_CTRL0_SSC_RANGE_4003PPM);
 	writel(value, imx_phy->base + PHY_CTRL0);
 
 	value = readl(imx_phy->base + PHY_CTRL2);
-- 
2.34.1


