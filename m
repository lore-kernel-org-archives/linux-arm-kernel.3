Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F251EF30950
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I5d1vbDMlzpvZVe5x0OL2tr0PRriui46YXmnP/2UTM=; b=KXJenpkqs01MeshBYM9eToMzx6
	ZAjxUsW50ML1fosEbW7Qzth8uSuM/wwzDa/7ekFbGJdh4sCxSmDB+8S6AtXw66Xkrb4MW+Y9YX2L0
	mfjmmXrgn+0+7X/4ZR976MJ7fGieiFi1TpqHuFLiaqvd3F7cRbjE4wBylqip6D/V6wvdeSQcjtUBi
	WeBBzjBzR+6BZelwnCZBirUarCswLTQC0mmlPid9f5N+jveuW/jzdtXVUflCf2DfoT2g+KG5O6XtI
	2WZUu7ednkn6oNEkOEkV8XahNWB6eTLLmKnecIakgH5FeFGzow2sWCHLp7JbFseM4F9Noe+hAI2Ha
	j6Y303xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7HW-00000001iFV-441G;
	Thu, 05 Mar 2026 11:54:18 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7HU-00000001iEe-37Ot;
	Thu, 05 Mar 2026 11:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0cXm4iTjfPFBWR7pUd5Bvjv0lgtrD16G9z4jrHxTtgYjBMFsSjt4ec/yCU6/gKaOVBk2M+gcykNZ5z/P37oAOsSDiJCoPi42fWa2V9SglkZ7/8isViaGpxIZsh2XsoGZAFXQb+9Vzf+zgIsPniX2hklLTkPU8YvkG47lqJgFC5FpuIkcdQ64wAXTOZXXrq3DvC0nPxv253WjeO9URmzxMjS+cL7U1fGrC1BH6yKBA2bnxTlluPGp3pl8MGPBoUCgNoWAeBVOrB8zGwb5EdxzaldqUKr8uCQitsWYhQKRM92oQzRAvU3ZbvFCZiFOfIPFQutpDzcd5zv/CpJSzTW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I5d1vbDMlzpvZVe5x0OL2tr0PRriui46YXmnP/2UTM=;
 b=IbnvnbjlqeB+aewozHlP9ywpyDev9S+czcbnTaT0eLkqh3mNJwtDiAVOtIQhi5XQ0gfp665ujgPcCxPCgLqCMb4Q287A0xUKgSSaTaVyN+RGmfPbSwc+0f7Gm2H5XnWMjXmlNMpb4989tltqBaQFQpYEq4v2mOGt2bFKnmo28K/FVfilZgn5aUeVO3lJnlmL5D2PUdyAIztAaDw0NUpyeA4vEEVeJlb0JMvdBlXzQh1U7zwdp7Lc4ISHmbbUSzKn3ua1ywDmkasDfkMwwg+jTajjGL4FJe/CKkzjfI5r32ZAL5wY0iqDyO2EWk5yH9+4yL00KjO9YNmAE4toX6xnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I5d1vbDMlzpvZVe5x0OL2tr0PRriui46YXmnP/2UTM=;
 b=NGPc21dkeFDeVvXdOMXlmYqrrxcTa9IsjRO3FazURAkEZEcRGCQGcr2CZnoIRKSfZkF0p9nob1lWNAvYFW3PPv8zNaZhYWnX6QMh1k9qKgjRWgA5gANMptbk+cc1Mdf29TbGde/B1z6wSL/qSQAax/IwZrCEPMlmW0Suu0lyoQ6uy+Jo09zM8hXIyUB6Oez4oQVKdImh3BSv8oM1xw+BlLDFlkoTEgfQdjWA2LyuKhwnfcA5xUL5Ntog3CI4QKneBFKNUPSIX5Dw9v0IXfvWDQB5ndVaJRt9pujLKH7zHBID2hn2UuUd0aHZiwptwvLqJOwbBv9K48hzgdpvypk2WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:54:10 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:54:10 +0000
Date: Thu, 5 Mar 2026 13:54:05 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andy Yan <andy.yan@rock-chips.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
Message-ID: <20260305115405.7f73yheba4xdqi3j@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-14-vladimir.oltean@nxp.com>
 <DGUQWFYCPRQZ.17SO07GXW2DYA@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGUQWFYCPRQZ.17SO07GXW2DYA@baylibre.com>
X-ClientProxiedBy: VI1PR06CA0182.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::39) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0fce6b-b349-431d-b72a-08de7aade978
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|7416014|376014|19092799006|1800799024;
X-Microsoft-Antispam-Message-Info: QbmiMBm48UurMq4GKkYS4Ad24n4Jhg4/EoXKx9F5JyU1C4SGTNUNqlWY8e4l1rfYJEyHdUjCunBxOLhLcFBjNqG27a8QIy7MLu13Bc9u4xD8wRvKDe8phyZRnIX3esgj/IqJpcp+m/reP30rzX/3aSpIUlKXd/rkrjQy5MDoougkNrXY+8iGZJg0nxD/89jwtO8poniZap1qb4h2i0/aJHqY+gewTtJn6WcNHM8iZEfEvVz7XLLRi5MpIMY6y0ofCacpqAv53t63qI8WFwrkC69DT6KhQO2Iea7WFCBViu88URd5bGjpaOglaz2iLUSneBdjdTFyfimeUdgOFZ003uoKCYQV9ePH6zjxL1Hdxg/djWlKfFxmmbZgJB+idLpilJkzNUc2c+K8LCNp4HDMRJMxZlTiFRgkUI5+MggJl7lFeK9suYyTzSMwQQxVMFDq95Z7j5Tr3rD1ekBE2hn2CmvaSa61t3u79gjXfuj+uBLdtgM0miO2kAYgrUxTkIKhJp/Lm1Pu1LRMSlP4ROMHZKfK6sMYwIITOofKmaPxycPUaOHjdT2YYffK8aD7JO9HQ442rI2lT7LHFvvJM8pO7qzOgEdJl1yB951b6w3Bz6xLWgH1QXukpZiFlCdrdVczRFnIi2sFgELSw4kS+6kY6GVa+YTf0hV4H9rBeoteatz15sKUUjqzpDAm+oZfdNQjWrXUcXluqstW7brkn/CvU7t8lLrGd9PEgMpnS1ecnFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(19092799006)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUYGgfbDdo6wdELpnr2iA9ellVgJRbnicKPuS1BPK72I7TjgAHBAWQmjSoOG?=
 =?us-ascii?Q?/k9potN0SqTyXi2yyZcXV0LLoyTf/6n6QZycRE9RKRB17PVVtpktpZfmGVOF?=
 =?us-ascii?Q?wEZowPbURXFo2BHgOT7sWwCVlLjaLsHOl9Chnei3ewjOLPHopPNrJ1tFdxYn?=
 =?us-ascii?Q?y85wld/Jt+KSeo2KA4TNlymYqBCTopMky4p1WPoR8w6RxXYIOQl7H7ubPUQ1?=
 =?us-ascii?Q?zahw/xldl+F53tcbQxHGt8W6lJiOQys7HKMQAjcOQm7er0qdGwUixgDiLuw3?=
 =?us-ascii?Q?eUh9NEqrh+IxR1f+n40Bh177OzfbJ9NDD+HfFrka29wATvqk49E8sAfms9XV?=
 =?us-ascii?Q?ZX84V3jLSqQR97YIRJ6dmxsZJtiKdtHKIzCSf4Kes4//ubaKhKU/6v/ij+qA?=
 =?us-ascii?Q?rS4lgcnlaJJJmTA3DxxpNT7cDa6hBcmZvaG5q/EvGGZE12BN/L4vx5Pbrc2S?=
 =?us-ascii?Q?JeiEUI4mxN0HxZumB25XkR2mVx0iNMR/aj7j5saiu+MzQFlW3sl2MlvE4lNK?=
 =?us-ascii?Q?EkauDrPCjiW+eIBcvK2DdQwfdtp6yIYLTayCUjdyN0UWtKVcifBmTGW+W1fb?=
 =?us-ascii?Q?tNSFTEOaGQTw7+7XoE/Hx37O3DEoUcFEvNnUUdacF4noDsLPBRpXh3gqBYDU?=
 =?us-ascii?Q?Kk0hMNppZtg02X7lzJNEISLdMD1Cozq0Rz4t5b3XUpQS3R97yWWGOPLl3V1J?=
 =?us-ascii?Q?DO0C7nZglbyQrbMYO2eXCrhW0s223X6GerRPRygfekmcN1Kkd86WFPlSGv1T?=
 =?us-ascii?Q?GqLbuQRJs0986Yaa8/FHVC5DWnemd14H2Whp4VWg6g1WKbpn3VHuCdwhKPmo?=
 =?us-ascii?Q?+O8TuaZCBh/6dpjWTL8SMXl4fQJvsve3yXmkDi8bp/uAcP/b9AjXxAUUTaQR?=
 =?us-ascii?Q?y6+Dmh3po9LdXLAw0xWkFOjPX12TdJHccXVbkp7QULB+pvy3wv4eJVHZ3FVA?=
 =?us-ascii?Q?NoIEpbKNrFBSr1sYI/aKF1lActtvB9dBuy7hIp+knGsrYxPxA4JDp1bcL70y?=
 =?us-ascii?Q?ns1d4YgDKRP3o3a/Ro+vDx/zmmFtu4uaNzFFw04QGfTdhFUVQnEJjN3EALU7?=
 =?us-ascii?Q?gmVDOPz3Cn5Yf0uFYiMaBh9imJwqWkwqSvXPn2YlFi+kd3E+Fcpz8/lzz/wv?=
 =?us-ascii?Q?4bY2UErzqVrQ9NofymagJABNh3koVXzRPLWmkzNk+8z2E44asCu8ZhyMVwk+?=
 =?us-ascii?Q?5Z/M+ulfxhhp2LZGHz89K2M7SM2l8dsF/sL0k9VJ0zu0b6GwiQEH+Ojp62z8?=
 =?us-ascii?Q?hxTvyRjyeQsjbXZkq0t+BGhJhta9mJ0+D+bZrnjvDktaKsuQKvKXkK2uSSfs?=
 =?us-ascii?Q?m1/IUtDlf9uzUlSQBVHag4O7b9z+qJ0tdFhMk1bcFi5971m5yk3FD6RMNup4?=
 =?us-ascii?Q?iQbe+yzECFeZUwVJi48ewbTTKiVIFsKiUDZMY5MmnYkMGESoyoCRfnR2qyLz?=
 =?us-ascii?Q?lJdLe41nsH+mEtH7N8DZaKD6yyOLHaKPkLfSZH5O0i4iH5Dy1vcK2fN68syK?=
 =?us-ascii?Q?LOryXaVACYt7Z6YS/fBmL5ifrgKHqsWLuzsuxMO9iVLLuvR6jR1TFVz3jAcR?=
 =?us-ascii?Q?wkp+Q8MPe7Qgf7Io21Gup9WcIRDqasNsUDLafdSz/jsH87V0ILmIS/u8/igg?=
 =?us-ascii?Q?/mCaKWE21gSYsqZ+47NkfNVqoFFE9FR3QbAFoQm79tkeaicPe2SThFfHPnph?=
 =?us-ascii?Q?eoMmRnvEod8oGCVYYvafbGVOCtB2nmA4CJdNJKlebY4nboxFCCbKOeukw1UE?=
 =?us-ascii?Q?sN+Ib9GowHgCoEieTR+540fM9rMvQYUquajo6za3eDLIntO0GgbW5qWtoiHx?=
X-MS-Exchange-AntiSpam-MessageData-1: LTtLQ+adAOuKdOvKFL28yv1zpb36pn15/og=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0fce6b-b349-431d-b72a-08de7aade978
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:54:09.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TElDQQd78Uo1U1ic8BvWfSeo0bry/nZ/Oay11goe8JNL6CmvTcvG59O7jL8U1FN5ZS/cYNQEtHl4s3LMMZ+zcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_035416_792460_6FD6C6A2 
X-CRM114-Status: GOOD (  16.43  )
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

On Thu, Mar 05, 2026 at 10:36:14AM +0100, Markus Schneider-Pargmann wrote:
> All of the can drivers that would use this function are checking phy
> before assigning the max_link_rate:
> 
>   if (transceiver)
>           priv->can.bitrate_max = transceiver->attrs.max_link_rate;
> 
> Would it be reasonable to have
> 
>   if (!phy)
>           return 0;
> 
> in this function to be able to drop these individual checks of the
> drivers? This would be similar to clk_get_rate() which does the same
> check and return 0 for convenience.
> 
> Best
> Markus

Thanks, that's a good point. The transceiver is acquired through
devm_phy_optional_get() and NULL is given by the API as a non-error case,
so I guess it means it should also tolerate NULL coming back to it.

This just leaves an inconsistency with phy_(get|set)_bus_width() which
are not NULL-tolerant but should also be. I'll leave those as is for
now, since I don't want to make the series any larger than it is, but
I'll update the new API with your suggestion.

