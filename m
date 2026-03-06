Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F243F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEUXeM7EXEx4DXmHFL22cSnuYYLuulp6HAvcgRVw7DY=; b=pea20vaqhEuWbONzTyv70EF0H5
	8ALMvqgSQAiWi2+kAsPeNqTZ5KBwmZ1inV2/UWLD0NK5gC5J15VG4MGbqRrAxYq8yI4/ljyD7hopG
	bHNzzU/c8ZXjmea1GRXfqEhJlXCtYKQL3qczlla6nZfEaUEJ1ybJ5bp1EcE/gZ36FU2LzrLgZQNTJ
	jrTsZJ4/yBk1NtOzwae5Hftbiw0L2r8OK2F98WfbTvVJcmOeGPSQfGIfZgodIfYBlcxnmgAC8T7xR
	++57TKsq5W42aGEeXtBQWA2PEtCEyp6bXqO/1llIxlipchxh2ncssrdrUYVf0t2n3zwxtFElKwYzf
	FYJnTS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUe9-00000003gWE-21HX;
	Fri, 06 Mar 2026 12:51:13 +0000
Received: from mail-francecentralazon11013029.outbound.protection.outlook.com ([40.107.162.29] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUe5-00000003gUz-3wEz;
	Fri, 06 Mar 2026 12:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+7SDu+JkPENunolmwHHRjzPVDON+TybEjklW9speaZq6g0SMgJ5ZopWkq6oF3T6fCpRmPA5zdxdKYWCQE+i0wJHzgizTZGExaMGbAD7dbHBuK2U6IXzBSTc8D2IobhTY+DTW6Qn0JwO+EnXpx2AX1MHzw+bENP0aobkcC8S7prJE6IXQdM4KsVVGRAKemlsKCqxr2eqVnSTnn2OYyu5BVHZOnYD6kWmogzIgcLB4J+5ee+U1X7CpJBzyL9w3hd8fFvJg9OPyIr3pHdWtsZepnnIuYT9R0vrU0C/YupvZNVF4fgQVvQ4diYcB/GAIcEAc3eXKq8TvxgibGDhLBdMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEUXeM7EXEx4DXmHFL22cSnuYYLuulp6HAvcgRVw7DY=;
 b=mG9x5ysZMB4TT7Q0mD/4a3DvtUx0PP0ZLj/selF5IPYiPxOJFI5iCZbV9qiskFe88Xskui/jBJukfU7HjAy2Nr0uEjIaZHrCyja9Y5eau69S8N6kEujfiigauPrSjzw6q2hr1RxEknqkorPsPgkfI1szqPA9Fg4Yorde1brtgXgPfPjawIp3/WoUspPDiSoCqq0ZCQhCMpE3A6ivZQ6ehBNKF+QFmDcwOGBAAbAykpbX9ICLTaPtK+lwMayz3/rh+TGw2KBSv3v6ulSwRLv5A3I1oDegNSYtaO9VdKNBLA7bG1YJW7C0e8bMunAUvJIsA0Q7MLpT281RSj2+VaNqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEUXeM7EXEx4DXmHFL22cSnuYYLuulp6HAvcgRVw7DY=;
 b=KLhhK79jQqW/IzPwTGljVqVs6m33YAjKf6+80sUf+/Fw/JzyH75YkTmTO8gQLL51KTy0oBJf1SxxCxZOqLuHON2q8dkCjqhNdQfaNIt5lgpQ++0GMY1xwLhb2Ws+v+rrb3BkY4s4faxrYHZR6stTBeOvnQr5p7xv0rh3yVGHEI63PR7CDY8rXLA3Sw2D/seX1h0S7Hd6kzc/blp6alBo2MjA/QERoFF6/kmow/OrfQtYHrPFmlZ21c6j7uSes7cdRchUg6di+hYDbITZD+i/eTDj0cKQqq92WqDEP8EYTMqkA6Annp79Z0ukhn6F/feucHa9RdCPfVeCUodGmuqNNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GVXPR04MB9777.eurprd04.prod.outlook.com (2603:10a6:150:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 12:51:01 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:51:01 +0000
Date: Fri, 6 Mar 2026 14:50:56 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
Message-ID: <20260306125056.hkm7aanropjmfg5v@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-14-vladimir.oltean@nxp.com>
 <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-ClientProxiedBy: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GVXPR04MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ed730a-07d9-4572-d2f3-08de7b7f04eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: ZGwEy0wCfY04xO13hpFPmIZGExGuB4ggjT5IUmqtp6sLV6MpAitOnaue/jBfrbnzia20l6kCoEEkZgPY+cW/cmI4XlkEtrXEHHhZm+nM3FFQzZGdDOQ/gfzOjebFMq/jq0JTAwJDUNZtcTXPbwyMEMk7a0xvjbF6wMNQKvBcJVzjHVh13b4HGanOb/V/iUi0XUdSGM+g6nRJVC97CXQY+b3S2OwvbpWM873d92f8ZFbEPIkd1ItXA9AN7P0BFfmBeYYgOtfKltL+9CZCykC+9bhpmNLEDbV1kPkPuWKFxy1CGrpn71hSj6HQMMz/ViB5Y3qqFgGTfQJKQ0OkLU0z7+g0gRqdxuj0LADVKXHRcz0APq0zm6r/Z9QRiRNN117j+jwqAU3RvR/I3Llqa4TZjOnzohpzEAldTcXK/Hp3QyILkxsgJFIL9XX89GnU2H08iLubZ5JmpulbcCUlFjFdKGuD2uDJrX2gAP2PzRVzaNXyDTZ9m+ArkuyBZWOJzBaUT7uz2hPNbxmAp/JAgPLzNw4zOPc7muF14jMxgmJ4Cg1xeO4yMRejf6d9E+7bqzVmUxQWx9Uh5nUMb+xJ+30sLe01Ovsjz0jOoSmZqHSxCWLI96rFIwLiPNvWsqY6k7TZFdnIY4CuzZCmjcFBNy7L5aWUvBHW71G1Oz8SFuuWd3SqE9aRfVK29ETdgPwyM+QQb2U3NRtB5ArGFzUqJIlzS0k58/QubS2fZbvDjJfJgsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+zIzLQSKiDVTUMVFOlsYRtj7q9dXK3LlwZjZB6HXRQQsHQ/NJpymMz4A3Tc?=
 =?us-ascii?Q?JNKvZW0MUqXKLtgCBL1EKq+AlqEofwPKbI0PzKgmK9SvQZ+C3GOuvBewh8QB?=
 =?us-ascii?Q?v+1EpOy/GpENkBYB6FfOq1BK6F4sTPViIiurJoyGmyCQaGjfFgTJChYkanLX?=
 =?us-ascii?Q?HFHRz7ZK4LOvA5RWRDdPYLETKOBkXklF3eGqZvkfKbvz7YXKs2J1vjxok2nj?=
 =?us-ascii?Q?K+gXKdDFi+IQ1MkzxHN7A9R78oF0ZB3F4lllQHsR5Exf+jatl0WSXJyEawIg?=
 =?us-ascii?Q?Q14OY+Isq5CbUDJ4I35bZTfAcuo406BlPr1qzAKVkZjCcOF3YYl5IdiMY5Dc?=
 =?us-ascii?Q?s8qKmyn3Hj2oLgwy3Ehg1oE96LeGx/IuqtU2mtrf8PH1TiGIOe60Qt5DCnr2?=
 =?us-ascii?Q?FZtID1KoUo4MCQH9CRbLh1zsbHSHHZLH4v7hz6cuRnpPWhA8t3qZlBj9xZFH?=
 =?us-ascii?Q?Hxi2al4j2tRhl9hYRIYuPn7TPoLZ9+rgGjUXu7eG/S8EMjzmWPwN4h+XNr/f?=
 =?us-ascii?Q?2bkofiJPau+wrd/9OPY7Zt6UdDMf04RK9c5uahT9HCCWP7XbdAReMbxPyo6c?=
 =?us-ascii?Q?9sO1aW1EMQ9bWNeeWQOYj2Vv89mnlGE8iDsI/pzJJC0t1wNZU/so+F4MUdZF?=
 =?us-ascii?Q?DBV05zjsYXOVPYJ0lcLEmnY3d447oIIZDzoSuJdT0XdSM5M5HSFBjq3xhQLY?=
 =?us-ascii?Q?NUaEttRMgHnt2t2BhfBinfAc7KhOZvl4+HNbFhnJw9b9Tz5QK/W48bLEq1vR?=
 =?us-ascii?Q?rZ1p6d1YQ2fhIpfDEi5IhI+cTVlEi/R4EiBhWrXBdVkGpnR2gvcZAtxWWTUB?=
 =?us-ascii?Q?WlfYCvuLec0TEBX/QTNy3nxLzQzKlLvn3dcaFAv3yT0Btiu2Q52unhHdlfpA?=
 =?us-ascii?Q?eIe80PLzB/M0D5Z83FmGbHUSlY49bfo2Qym+1E9ULFLqHc5dAPCmT6ONHmMA?=
 =?us-ascii?Q?qYLSggmgcl6XpT9J0jyHdw4kA3E4cWc4pDzrEKxHIHbaTEZqtOOlLCBUghY3?=
 =?us-ascii?Q?QIvvtf3PRulWenjcH3xwen6/nwJdOA7waYBxYYcletzYKq59RyHoA6xg/ZQ6?=
 =?us-ascii?Q?AJQ1t2n6yKcofAzO4GvruR6NTr9mAt6xmpND9rJMGz6HeiEx65RAzw6pQosE?=
 =?us-ascii?Q?CHG6t7d0jeYPuPgq5iVO6YutrfVEievN2uuIv6hcvZDJz792Oc80QY9Peo2f?=
 =?us-ascii?Q?VrmnZd95t6U7LQ0alHVfKhBJ9nSIfgBvjZAG1TxElVv2p88a6yFpMbU0Ta1M?=
 =?us-ascii?Q?0ZkhbSSqoGadwk+8Ryg0hOAvtgk4HSx1w8pCJHDsQOHl6swCRs8p0X6b0ngj?=
 =?us-ascii?Q?ZqgJZIMn55oaF2wVX8TyEEl7uDoHNxbgtWKWteVZuFP4d/vKaXJbGm1NjUx4?=
 =?us-ascii?Q?YAmBlms+pHV7BP0uRpUOVpvcUYUehMwU+qRJ9NVJ3lzwkowT37KT9qDGq8gP?=
 =?us-ascii?Q?8odbMy7635Bm78FWKtl60M6XcrLCkeM/Dv8BEi7tWoKRCkXtdDMUsx5AtP8q?=
 =?us-ascii?Q?zx2fOY/csmQqyrubeopPSGX/A4ule3eIyL6yy1XX4lFc0Gcru02uVjzHRY5m?=
 =?us-ascii?Q?tmZzhufUn2ijASzpz73DSOBR7yRFfTAUzdsEt9Kr0XLuOS3M9RL5fIdV2o4x?=
 =?us-ascii?Q?brOTTiuB8G61PFyQy5YKZX1/laP1JLA1RZADnyvcRJLQzctby2DXfPEpWkGu?=
 =?us-ascii?Q?jfuHXx8seadBo6KsGRTxPmWaKUBQ+EQJX5GYa6jf6RGBZjfartmImNuCbed0?=
 =?us-ascii?Q?EtluACwLJUrp+M2P4YZ+1+HOefevbcidZpTz20Q8NNuPDrtiHmHVZAt1/Wx7?=
X-MS-Exchange-AntiSpam-MessageData-1: +79mI/Urw1CJuGSmTegHZ18TfAF5uj7BZ0g=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ed730a-07d9-4572-d2f3-08de7b7f04eb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:51:00.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qh5msCp6o7lVRhOOwAiCIatW4lItCELkNRJv41zT/lCb6SOPX/EgQb80Vt+2dmoFikLURzusgIFZlAyOEbsJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_045109_993107_34058454 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, Mar 05, 2026 at 08:47:47AM +0100, Geert Uytterhoeven wrote:
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_set_bus_width);
> >
> > +u32 phy_get_max_link_rate(struct phy *phy)
> > +{
> > +       return phy->attrs.max_link_rate;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);
> 
> Any specific reason you are not making this a simple static inline
> function, like phy_get_bus_width()?

For a consumer function to be static inline and to dereference struct
phy fields, it would mean that the struct phy contents need to be
visible to the consumer directly. Against my stated purpose.

phy_get_bus_width() was also changed to be non-inline.

