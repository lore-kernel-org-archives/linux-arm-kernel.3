Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C667E83EF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SA7IlIKRCo7+1x0X2SE1Ps2HAlG6rSGavrypyMNT6oM=; b=OgDdV+LFhkW8g72kNj+x5zL6TN
	DDaVZG7953MI5zFJuPE17aTD7PlJCVmugyGxfGOHTx34/xtFnaASJEA2n8BxcUtWDcihjfGUrSo9P
	ZZppuw4/Awg/iH33p82dEFc3sv4gtRpCBDrXudxaU9oLGGvMGJbroYO0mXrGW8u/t3V1aGF6yCTlc
	YrGKNoM88UD8Wpwh4v5j+qJutitn6OCjQY+7jOg1YxIg8eYQO19pI6pCsKQ8ey1TIH5FVc53VqlxJ
	PStlmg4ng2RrDJvicZnonkjf6Zkp0ob/aSzqXFjpDeuPv+m/6M5KHPlm+YuU000tFYRJ3YWltKP/H
	OgDcXJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYLn-000000087r3-1JZg;
	Wed, 04 Feb 2026 08:35:03 +0000
Received: from mail-westeuropeazon11013059.outbound.protection.outlook.com ([52.101.72.59] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYLl-000000087qE-3I32
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 08:35:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3jwhQpvRXzO48K4IdMgbNkCQ0zvV/9irWgJiEc5jz/pUYNEDdjBlDHbiz/o8mu+1wK87zoyKNd6SrYYH0QAsywyoEBjZi4gv3WhXZ4Mz7Bq+djGmwg1S98e06YqAYfgtIywZNkdrlS9DSkfo2i64vWxQIdjvzDa9gdSSK4/bV4nBQ2DvBrMQYW947LCPlDwMetl64XGMR7G35BrjOBKOKT3Fl9iJnC92gE59auurbe9fuEndL4zWdYNP8kQtGtuO2NbZA4dgdbR5AeBpLnPHrvtNqsHZ2DoRyKOxmIIz9uHZnjjUFd/fL3cEQ0h+aFtC+8t3II3NxsX+HlHmu6eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA7IlIKRCo7+1x0X2SE1Ps2HAlG6rSGavrypyMNT6oM=;
 b=TaR02C9k0BiA0/4PqnBQFbRyOyPXUr51zaLMP7s81W0V1yqPfJEj8RwSEm/bNTW1sZxVwSjJj7aVebThprYNDH9xhMgcqgnYNE5b7hpuzDXwa9QfKG8xwYb/H44LsMw5HXACjiYFnjKVojYBx1PFIT575PSR1ALbjwFo1MD6zWncytozEx16qRk/H25OFKhKNcjYWfwwcTJx3Y32reqwZkKn44qGYDNIPYmv4exlao7CuoO+UCzshuAeO3StfeqDdAhhAsEkAq7uRHMW7b5hXN4sQOZt2UTEdiBgLbYIY8r93l7U+iEg6RV8OO+FZw0+8/vbZIH6/qIcfk9SSU4AEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA7IlIKRCo7+1x0X2SE1Ps2HAlG6rSGavrypyMNT6oM=;
 b=cKbR6gPmDP8Xw2CtH8IjHrecWd3BV7gq/rsi7qRoTcUKAxB0XAv5wOnuecRZq4+Gvxp8P568DseYjds37u1stPuWPJA1SnodrWr448/DNggwfk97pKgsxPOelq1lVI2tHw1XWU63plgGeQqKje8jLrivraYpod1Nvjoy2ts90YVYT0NONkRD1VPvfhOsiPZ7oCXuQIJugdJjidSLGDbdq9cFn3GSa4VgUbAKdkK+/Lbxpe1aFRYHVQWSOYFAWafoNRqO6k/XRYki0KhfTEpx+kb1kfLfbmlhHVZGZJsl2ayvNHGbyQs2a+a43c1oFnRsiViedaOk7ZMinQ127maN6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB10738.eurprd04.prod.outlook.com
 (2603:10a6:800:277::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:34:51 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 08:34:51 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V6 0/5] arm64: dts: imx93: Add i.MX93 Wireless EVK and refactor common parts
Date: Wed,  4 Feb 2026 16:35:46 +0800
Message-Id: <20260204083551.2867263-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB10738:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f1f640-41cb-4ad3-20e9-08de63c84379
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|19092799006|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ndPMsaEailQkk8jcDqp8wiz8wo+ti8zenbrOMYrPIUBfzSIDmt3dpQLyG2ST?=
 =?us-ascii?Q?69JkxG9255oQBd174BIx5Fd/DTR+D2IMns/7Zx6AufRF6WPg/ngYkFAlx1Nn?=
 =?us-ascii?Q?Yx9C2ImTKA5o+Xg1wbs3/deAK/315rohHkbqixZMZqlmDvBDyzl4tiIId6SJ?=
 =?us-ascii?Q?Na69bkJg0ieQ6ry8qXss9yj9fOtzC4CFVKwSvUP+1Nux2YrJIGFQBWVaHnvE?=
 =?us-ascii?Q?K38NDWmHnp/Z4J5LczgJGzffDBanAzyKbN+cx8Vtb+GXa/oiGQYUB5MztyOM?=
 =?us-ascii?Q?Nfxv5l5cWS8hRFIXoc6jmBJAd/Osyd7xePxSZbqT6HxcZVtS/LVkxp2PXvvp?=
 =?us-ascii?Q?B10ANlaJ4SeLK4a0+C/eX1pLzcnG4j35QNs+Z9yfeMWVVWgXOg7xb18A/IpW?=
 =?us-ascii?Q?eIh2kAS4HFAnAGdAXxjxZZVXskAoVk/NcDem8wikh6HQ8mTE58Ex7m31Njqw?=
 =?us-ascii?Q?ROGR8zppiUDBMdNQMO1uvth7osl8iF9DSJmNlNMmqGEJucC1goFQe+3aM7XU?=
 =?us-ascii?Q?1dHK+kYiOuxByR7yQoKFYHhHGsxCTwdu9H7pLhtXix59QesKp6E67OqmW81n?=
 =?us-ascii?Q?+1CU0CRQ2QdCSFkKAsyL0RhrEVDJ3UsS5+jBy5WBJg7u22WC0VE4ZwWFdd1D?=
 =?us-ascii?Q?FCqqRTZlyYjxz0nl7dGoNmifYftUCPoVa+JJeT4GpMniTmpX7NWTA0qjPS0F?=
 =?us-ascii?Q?RVI2NChm7YhEJM/yqrLn7+9FRXz45tShjDooemHyK4XbvqJ7TK/T+pIW+D5W?=
 =?us-ascii?Q?u6nPQ4dhfM+MR9cSKZ90A2tYyq8JLVTcIVFYv2FuMomKYLzNv+YiWAFgvWS5?=
 =?us-ascii?Q?TaG1qAetv2wALCx+ggk5B12jbLwyR+wYsqKhhf/pfnuy37vYn7q6Zfh27WPQ?=
 =?us-ascii?Q?V4hABp3a+uDdEbW4jCrzg83IAqvZ4ht00VJ0we6+ZP0OxagNkjjwT5q2NT+t?=
 =?us-ascii?Q?Tklf6vTul/Zf3chnkSBe0p8tM75AD3Yz8bNaLvco4CUJwmKGwiT1BMjZejJA?=
 =?us-ascii?Q?IRet65ocjqzEEBmQ3m7sEoOvh4Ofhmlir9xGFyVfO2RkgrqeL2PuBmj9kr05?=
 =?us-ascii?Q?+sBl5JlaTCZZSL7P6cgCpZjC/JgvWf57nSs8WBxSo/AkqvaivVi+AwABIe3a?=
 =?us-ascii?Q?DBI0/8xgLYI5zDYcpSYi+M8IWldEx8KDaKxu9MPNmAEs+pFTNqE6ejin7DWM?=
 =?us-ascii?Q?oJ3lwcv8oCxfhZl129aLnBaGofxzGseUPJHo0c8Ml4dpYgW3W3K52CNpwiwp?=
 =?us-ascii?Q?N83/6TQhpry6DluUhWA93/9guFikvYsfmzte+09PeJdo5rSsfTI1u4sIqv/0?=
 =?us-ascii?Q?O55Pje6eZm7e8TorxceVJIxnyfeHtAKN+eNqwSQ6341CaCxGl8b0EmpiR4D1?=
 =?us-ascii?Q?VBJQIu90y42Zb6afWNa2ScqeRj46p6S3gaWfmiR88qi1m30GDgFYHdLSCXhZ?=
 =?us-ascii?Q?IMerkgxHo982WVEDPLjh4oUX7HuzoWTg6z5dZGS0WY5dDGKNSiA0x8bzqaKd?=
 =?us-ascii?Q?MVigb+uRe1mQWHlmozjEtn6+UxnpVuuOm8gW7Ur/Qr9cikyzmxuCq0cUqfoe?=
 =?us-ascii?Q?sl+N6w77pqEtO/qr1L8R82sybX/4THmU4e+tNjIL3q0/WY0W4gdFc/UL2VZ2?=
 =?us-ascii?Q?ZJwpp2nIakAwc4Ra99CIrU6xVQUZ35Gt0f1W7Z69QRMM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(19092799006)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sR/8N1uqwnmdHPn2qQtatVylwRlrXqEb+KEEckUlnFh+0bQxThtL9lfOprbL?=
 =?us-ascii?Q?dHmIJ/JgkExTlz8kR7GjxznmGtquq2CILM7YwGkHadMffB5kyex7BY8T1+iu?=
 =?us-ascii?Q?Oi37wJBHM7+JzG1lqBy9TTPl3oI+sErOPEOcXGBqC82UG1VOJjayGdSQ4nU+?=
 =?us-ascii?Q?1B923Jr9HYrp7MsX+NIzzRygBdsVACSSpHYzQMdQwliWsGllKTeFJPX0GJri?=
 =?us-ascii?Q?PJ88x5RprG4xwUB1jkN1g8WWh3+3HTkXMldRV7lIUk3jAlfuMAOEwm/e6vt5?=
 =?us-ascii?Q?KODTx5K8+xbDQqqfzkW98ut7j8RtkBKiDP/ufyY2COUEChS7xZNGKabRVbpz?=
 =?us-ascii?Q?ka0eZtBLrOfeqm0ZYjVtSbnT4DLcNJH20OJnztIGC7MP17WYwCUS7GhtdRYN?=
 =?us-ascii?Q?ZIld04U7Z/v6KMrJxyf8k8KW6MRs96f/J6vCko5r9zY40TWk9iyckNdWQ0PS?=
 =?us-ascii?Q?47T7sb0McKuslgC6a79ZGNM8h37DTj8o0Dckrxy2wIgT8ThS2OfwaC2UCGfd?=
 =?us-ascii?Q?1yMttTZohjaFlwxFhRTQIGq1NXryInVQjnlabmeuvnzN9jFJjMi378GYvEhn?=
 =?us-ascii?Q?DvkUicmAr5u+4K5FrZYZXjbpNwr5Y0LfkDn22AKn4TgInPH/MHp771xLTJoZ?=
 =?us-ascii?Q?9FlVRVt/I3ZOYKpN6/dkPKPPDW7vA++YA9TK/fKgVPLCOEG107cNEgagAp8t?=
 =?us-ascii?Q?KU4vcFym+OahRCtbeBfpYqPYWADJopk8tN1lkDd13TvUJivOvHhRUm0cC2UC?=
 =?us-ascii?Q?nHvxDo65OtYVkrtoSsd0uSw0sC88gkg45puHas4yA5tA427TZqDiuLUoUVTv?=
 =?us-ascii?Q?Yg7bBpGe+UGhBOUdV4YOEB/d7cTXyGtCMpx3uQ+O3z2xcpHw7NjF3VaNiig+?=
 =?us-ascii?Q?hJTubzec+XqgrAOZ3dq3tR9b3E3fMzeAybon+rQObs4X2088vrxFNtiWN5Np?=
 =?us-ascii?Q?wmwyFmQBa5gQe6SoJ/NE+olMFMHumsffi0q9jHvP7Xzr8TY7WVQgLceZbQUy?=
 =?us-ascii?Q?r0WN6QQ6ZUVLU/B5khIP8LGK7QVX/RsNwquMxNTJCfl1JFpWslKVLx/AwR6S?=
 =?us-ascii?Q?mzj0A7QqSOg4atFFE3CEGk0xdnwhEUlMXUz3D8csPwCcWtqnyw0r/fJBze2a?=
 =?us-ascii?Q?v98PklgyXXggZ7G10pQzc+QKazZDII8476l0an9bESu/arPi0VOnG3Fnbnak?=
 =?us-ascii?Q?1TmqZcMoSNjWv+kigMSXYI9+x1h4PjuzDt4zhh5cdn2YkLG/NYZ2UZI3pRkm?=
 =?us-ascii?Q?Pi0GXQLFvm1apDjdCQZk/GHRZh06WA+n0Zi7+cYEUGSx5Ylcyq9qT1BP1bbk?=
 =?us-ascii?Q?WsdeY2tr93c/Rz74SBBs6Jh8ZTYOl2pQXOlPrFGzvIp8SppBAPOUdwMsqPXG?=
 =?us-ascii?Q?QNas7OxhRNAINA/IxfL/LSvR6oDsUruq7FtbtJ/9vl0ItZCb23RASGIofWjz?=
 =?us-ascii?Q?lunfU7+6VqOZBhFly1SVdVX012Xwwxq2qfyoLqf/y4oOqAS0wqaSBSNGED7J?=
 =?us-ascii?Q?y1EBBNlp9CF5yUcDOawHXIPU9KqVALkDDmg83JQJhBShWHsEh6eAwwS5MzLl?=
 =?us-ascii?Q?lhXKZemKZRou64EQI1WxCkQF14DOYOmGbDRV+p/9e79kQyIXxKkBjcevayPT?=
 =?us-ascii?Q?8rB6K02CPtFH6goPSxsD1MbnA9/QtLuvwZnlByIbdu96actsKNDaelkTXvSS?=
 =?us-ascii?Q?hm2Q5yfkjq7Y5ieRsIASVu29B9wrYWEbT7YhPVw4UKYNW1yHzs15S6H2mhUX?=
 =?us-ascii?Q?/T21kCLfRw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f1f640-41cb-4ad3-20e9-08de63c84379
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:34:51.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To26tKv3Gr1N1ygQ1WD/I/PAAS8qp798KBDIdeUvoJndVrofIgNsmdmP3j6rNTxe49PMHlRN6pyy3IhNOjVOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_003501_858165_2152E84F 
X-CRM114-Status: GOOD (  14.45  )
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

This patch set adds support for the NXP i.MX93 Wireless EVK and refactors
the existing i.MX93 11x11 EVK DTS to share the common parts via a new
imx93-11x11-evk-common.dtsi. The Wireless EVK integrates i.MX93 with an
IW610(WiFi + BLE + 802.15.4) SiP and reuses most of the 11x11 EVK design
with minor functional and pin connection differences.

Also introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP so
that can be reused by multiple boards adopting the i.MX93 Wireless SiP.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Changes in V6:
1. Rename the imx93-evk-common.dtsi to imx93-11x11-evk-common.dtsi as Frank
   suggested.
2. Improve the patch#2 and patch#3 commit message.
3. Add &lpi2c3 dts node in patch#5 to help understand how pinctrl_lpi2c3 used. 

Changes in V5:
1. Add patch#2 that rename the imx93-11x11-evk.dts to imx93-11x11-evk-common.dtsi
   and patch#3 move 11x11 EVK specific parts back to imx93-11x11-evk.dts for
   easy review.
2. Add Reviewed-by for patch#4.
3. Move the usdhc3 aliases to two EVK DTS files.
4. Keep imx93w-evk.dtb alphabet order in Makefile in patch#5.
5. Enable open drain for IW610 PDn pin to allow the IW610 JTAG connector to
   control the PDn status in patch#4.

Changes in V4:
1. Add imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP in patch#3 as
Frank suggested.
2. Modify imx93w-evk.dts to include the imx93w.dtsi in patch#4.

Changes in V3:
1. Delete unnecessary parts in patch#1 commit message as Krzysztof suggested.
2. Add Acked-by tag.
3. Add patch#2 to extract the common parts of 11x11 EVK into
   imx93-11x11-evk-common.dtsi.

Changes in V2:
1. Rename the compatible string to fsl,imx93-wireless-evk which is more
   clearer and better aligned with the naming convention used on previous
   NXP boards.
2. Impreove the patch#1 commit message to add more info. 
---

Sherry Sun (5):
  dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
  arm64: dts: imx93: Extract common EVK description into shared dtsi
  arm64: dts: imx93: Move 11x11 EVK specific parts back to
    imx93-11x11-evk.dts
  arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
  arm64: dts: imx93: Add i.MX93 Wireless EVK board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 ...11-evk.dts => imx93-11x11-evk-common.dtsi} | 206 +----
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 861 +-----------------
 arch/arm64/boot/dts/freescale/imx93w-evk.dts  |  28 +
 arch/arm64/boot/dts/freescale/imx93w.dtsi     | 110 +++
 6 files changed, 150 insertions(+), 1057 deletions(-)
 copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-11x11-evk-common.dtsi} (79%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi

-- 
2.37.1


