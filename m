Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B39CD72348
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMEi1H5AF9to/9RA4CfAP2VOWux6r6MRYkM9sdThIjo=; b=HE4G5b22dPFV0SmIce6h9tO1hI
	NhsvsFEuW3Ev4uMF3lNeyX1hjCJ3sX0cM3dT7jz+lurNpxMEzg0a0XEkJ544oTbsiGJCXlAzhgjTm
	0HUr0FoX+cb0el0pHE9yEvD+uO0Slp5v0Cn1GZ9zYWVglS7E6T6zygSTUttOoEGmSC5g6BqScO3AP
	Q41lHjPkZddA4T6rTOIqNdTVLPK4nOi9YGNYpZV3awrEaK+Tua8dyiG27rF5JJOtFxxyrmjMoKSTM
	i+AcDZrYlXyybOGQxo/qm0d5IIm6Hgrmr9k1y+cGqBKfpLa2PhKVBpvbcQyhX/6nkcvgOOvgvZEF7
	zYPGk9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCBi-00000008QFV-0y9l;
	Fri, 23 Jan 2026 08:06:38 +0000
Received: from mail-francesouthazon11011040.outbound.protection.outlook.com ([40.107.130.40] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCBY-00000008Q8D-2yQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:06:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZKrQZkxId6ysIqQUkb5KB3XTbJhT/Ayw9E3cL2EdG53R8DNljUr+sHz+KGOjiSFKJoMB1BV9xXvGc3fGocmXfJgQaoAszijWct0M3TT0smMqW8xjc1or9gjpVEW90IyTqDpuUJszFVtaMvyViThXWO79CWJV5WHxemTout9jQYq3q1IuoEJR5lzXEbFHIw/YoetJ6NUG6Y+fZzpnJZjjQa+OPFx0zZybuLALm4DvyAn4BoaWRiICFB2cDSLVuOFcF1zE7NGNdaKJaU0dEW+TLEYcTu35ZZM9AhOGHcEizay2Z37l70pBhXs+iCmJiSbsZmxDLzr6h0dz5/HW2kH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMEi1H5AF9to/9RA4CfAP2VOWux6r6MRYkM9sdThIjo=;
 b=wkqIZCCLvql5PSY6uNUHnfEYJWZyUHaPjMaFYKKsGuK71IBYin2Ea4YNLVkOW13i06E1H2rn1qB5IcpPWjikF7Q9ZzeO8hgteNASn5k4aTQo/2yizRBb3gQLrrIxjI9NWNoJRv20bKTcfDZDrLOFs1UflXwNKb2AtGDNvywmtWO4lAoDsAaeUo+jQrki84AodyMUbcveWehOSFPkfyN+3KfnX9u0Lgd7m0DN+FNlHbj9WfJz9Zzj9FlcQsb+EWH4ghWbw6CpwTCHwXysLhEAC4H0YaOKk5TvM98S7vwnbz6++1QaLupjA4ZnmsfwdEvQvHTO9KJn/14SW5kpb1kp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMEi1H5AF9to/9RA4CfAP2VOWux6r6MRYkM9sdThIjo=;
 b=iRzL654qK8KIeBpwEdinrBJ/BPXwodd6WIDZ6RFS92+FrQBNqUcdjIvS2Fmd2ki44e2ehGuDjx7VQzQTV923AGNzx6bcWEu1VQtgSHK2HdXwgo1fqN5xh9JU+ryTYygrv2I2vXUOhM/jiIGkkyIW1q5axa7ETC7WkOXshh/hH904lBvtk0pGTT+yY5rTsyk1I/+Lk+xmap8JU103n2DRdnmLhnTlHRmPQD//XTQkERb+3Id9naUWAac1SlW4Hj0WUQkVUgikfV6LMohWmTRnx325+qKqbipfZ1JBZutNDCnmpLz3yt7aeQ9TtbVB3RhCK5UnEV8O3C5L2jyZ+JdJiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:19 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:19 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 02/11] media: v4l2-isp: Add helper function to compute extended stats size
Date: Fri, 23 Jan 2026 09:09:29 +0100
Message-ID: <20260123080938.3367348-3-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 14aae559-c8f3-4ae6-0949-08de5a564a05
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cv6R4MKgCQ7hMSpVohKoI8W5els3lZM2VFgTIzyfP+4uDT8z6RD64ROoegBO?=
 =?us-ascii?Q?nm4JWWf0BMS+VPOaKViEQSGn+BW9Qg67UUIgMI6qrvlaL5yTXMaR81qvJrQ6?=
 =?us-ascii?Q?ZXSVPSL0j29l7ssj1w/rcZsZWR79oaQen4f3HLfrLTlnylv64X+cmaLKfOvU?=
 =?us-ascii?Q?C5E2Q/eb92y9jGgYxvYJHSkU5fJ3V873livM/KEiM//nVYgLFJcyVhbrU2E0?=
 =?us-ascii?Q?DBrmJWpuwmPztI6bqQejOHlthu7ZKVO6xf4ISceSis9b8o1xwQPNTELg3RlW?=
 =?us-ascii?Q?K6x8/SixSZpdyjb/p+hW+gCVPWvKTfBg2J/1U0VSWCVqOeR5ozxpHUrEcM7K?=
 =?us-ascii?Q?Wnda2PTqIXYyp5Pput8fGTM6rot6++c0gahWkprOvQ0grwbPgs5fqCMbGsti?=
 =?us-ascii?Q?m6n9XfrkGaDQOSh/ZPhE3D5OoYDzbioporWrg1JYZWKmBCkl/hTMEWtQhNMr?=
 =?us-ascii?Q?duyDhqyorswPqnQo4WrtJVCga80A8dzwFtpdYN2iA3jHI+ThCYL1TFGGW5lv?=
 =?us-ascii?Q?LK/3IhqCYVxehejsofxNiekfFie8SmyLANz0TSleCFb+YWYMZJ83nZtCnNMO?=
 =?us-ascii?Q?+Wb3GOBda4K4dhdtGpW/FuWvHTH4NeeZF9WBTJVpFhf5Yzz/YI70LoettVdJ?=
 =?us-ascii?Q?Aj+WFjuOSyQZQrT++FwQudUwe74JEHbU0u+tWuCLQILMpyY2/Ll/h0H8ru65?=
 =?us-ascii?Q?SFkKo7f3xlOlspaKToJ167oiV2/fRysUCLXAGkw9BGoRI++GZCMeMVE0tYj+?=
 =?us-ascii?Q?+fLmsAQmiDuHvhrdKiiFV9mlrtcF5yypnmFSA5LseCkmg+rG05kM2X+qziI4?=
 =?us-ascii?Q?cCThmKUSWX+AaOEur+447A/5LIlb5fhD7tdwmRX1szQd5yOixhyhmy8vRZJw?=
 =?us-ascii?Q?o9jRuUzrcoJP2MoMwPGufwNcXmJ+04Vd+TZwvGCLXTUK5lajTDYGOz8w+8Rt?=
 =?us-ascii?Q?Ia4qWVovkmYhr2lZ+cbihJQZow5GJP+PdncVxrUFCJxenvNSqUPqlrTXPxV/?=
 =?us-ascii?Q?M7I56GBO74nGi/AJQC6yZSQjNlGbc7JIElkjM3HlVRt4v4TUXG354ztqHqoP?=
 =?us-ascii?Q?CqtF+hBVEululGXeAMwIhpFGLhv9Bi3VPobn2pNtcY9yvhhxE+PKMv9wslKk?=
 =?us-ascii?Q?bWmCQJiSkwDt7uGzAB81ClJsFGyImf+XymonLHCzD0YylFhanPYd3BQebBUm?=
 =?us-ascii?Q?u/WN6IGDBQG9b7jpvXetoXc/aJ+prKAKTKxveyK7aDzo2hOIeql5D/KLeiK8?=
 =?us-ascii?Q?ZsgBAAbkHv737C5DjddmkwO5rryeU5WNsevZ/lpBDEQsVzY0aqscUXzZLkNv?=
 =?us-ascii?Q?MoIQwtsa1B4CaFNa1rNz/l9i8hry0NRiN0GpfsbF+yOHbXMeF7w6aHR/20Mm?=
 =?us-ascii?Q?79kQ5Jxnx3YZr4VGKGPrMu7PTRE4MsqwLXyV+QLfQVh9zBXu/zxgFI1YBrRI?=
 =?us-ascii?Q?7McFkaQx1uGF3+p44irZjlvHnBUqyGQgYBcOUTi8i8X0wuOqh5GU9L9iZXiu?=
 =?us-ascii?Q?FF0cFM4XFXbinro+HTcul/MTAJfrqeacSMw0YP9NgShktkcqooQggJOKbgmZ?=
 =?us-ascii?Q?0uc80hUfuadbxarb0nAy9Oe3fzpKV5pS9Nb84xzevHKqRy6Ja6GnRPHLW+/n?=
 =?us-ascii?Q?ubUHCsPVN/SocuypP+AFp5FQtrgVQuEEGcsvyQNHVpN1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EcpcyDAkfmNpHUb8FUpF6rqyivsTeKU4f1zMIsPJ2GpgJlgfM0v4FjMtBdqE?=
 =?us-ascii?Q?5LzWxANYdvCXHopD3HEI5PwAZeUrt6jTDk561fdfI4BZpmYot7YRWAEJQyXw?=
 =?us-ascii?Q?RTedCasVdC8w+K9mOzyKobnSeq6gE+GCwDZa5DRXMNUzqZtOihtslPITAAPW?=
 =?us-ascii?Q?5V0HAfe/ItTzXRYQb+n+0l6EzQmJpufbcla2rnO+k0qtVfACwezpC7gV/Oi+?=
 =?us-ascii?Q?8emlLcDPZlgBIQWN3sO+KnsLoUdremeKXAxz9MEfMARmRYPbsuXy1KUgWyh2?=
 =?us-ascii?Q?1f/VzbDY1VrTa0z/tpT/Tzlcm4th/F4uS9fEbUrKT5YqwN+5/rjU3XDJubIX?=
 =?us-ascii?Q?/2Lmpu81oGQZpc+zFLK6NNGQKf/vyUZY2QzWheHF02YQoYIha7jtlZv3lUk4?=
 =?us-ascii?Q?cXqkJNT/8jb7iGiegPVRgDIZiu5br/YASwVx9J8xPG1hxV6QMSGq78UXSMxa?=
 =?us-ascii?Q?K4kroy6XdNYLjrQTwsuIv2F+kzh59NUWGrQ8Qw+QkPYAk+5sLeU0P/Lwzqpi?=
 =?us-ascii?Q?abkAR+vhy+7t+T8uCIWjZ4cMVeOZp0z5ZU8uuJ8lFccvQFSJGS2PfMce5J+2?=
 =?us-ascii?Q?MM/L0XwFn3A6/Wwx/jg9Z3eRy6HlMLkLex52v0TTkJFXnHIIriZtOEMQXWdv?=
 =?us-ascii?Q?0xuKzOs83qTArhxb7JvAjWKWRaQKw9cniGupIt/R0pCnpPQH5xZdE3lBuhx2?=
 =?us-ascii?Q?7GS1Se7FAQm4BNj4zU3L/cAsn6mzeo06nO0zAA1Fd8V22zCX+L7YyjDcYfZ0?=
 =?us-ascii?Q?g5xORckqR7yL23SIPIikJWMPP4Pq3KtiNHr5qCHFTeBa10Mz9OZyWLJfPB+K?=
 =?us-ascii?Q?jv0Q18RqAUhbnBzGmiyJbzh7dfq/GmZ6N1NMlcDZw8G1crOAyLwU4mbr4cnF?=
 =?us-ascii?Q?O4nCMnMJllNLwZk+wrSWvMGGIRbLkq4ajfPLm304J/pTAchIACgeKYAA0EcT?=
 =?us-ascii?Q?CcL0GUI5k9/rs355Hu8qk3AFeKSKSKTVPj69B+li1U/+cN4fQRcQsdOrNsUz?=
 =?us-ascii?Q?m2IJgvKCnaMtOwP4OesixUEAhdMMhRCWMw/0cO8UhIFsrwjMjN5iU5ARa4S1?=
 =?us-ascii?Q?zpjEdvkUNad3x4XvJLiX+1IXbR6A0fGhT3wIo82f8tVmcRe2SHfSzdacxS4H?=
 =?us-ascii?Q?itMXarNwVvHoxdVtpCaJqos6DcbobDErKxR2IfTNN+esvtqW9PLe6qU6WFU6?=
 =?us-ascii?Q?To39wNrwUggKzuV81iUgULiNoxvcLI/qZ95q6hRZcPioCmY3fJ+7LpglpZWJ?=
 =?us-ascii?Q?Bp0kZ/0wv//7tFvIqHlAtgKRmJxqAAsenok+w93CoM2fI1iIQUaGgJ/voR9f?=
 =?us-ascii?Q?B984yhl/1JAD7bGRlnyn9G+zjnXIl/bvnHHHXfoRWJ8dgmqlV8gvwjWL7/7V?=
 =?us-ascii?Q?dxZpGvUB9zm/BlFwTrhORWh82yd0v4TexX5Ua7BcckBK4rDGOPFezsMXWqKf?=
 =?us-ascii?Q?+neONJ/j8/u+JJDhuc+CENLY4/zfL7mFgp3TAb7wwMe6voMiuWuLVT7qQ7NQ?=
 =?us-ascii?Q?NCXJ1oz6LP19z3TZvYunsnOGnPKOepD6lWIEyWpXgcL9D824OrJDoZK3bqs6?=
 =?us-ascii?Q?s/7WJPMMkA2ONodKJ0EgL5Wpfe16fiuzajmg5kprH8+1QrGkQOISYIccj3Gs?=
 =?us-ascii?Q?rM/rj++fCVDxL92Nh9QkPm1NOj8qxKO8Rp9Y+TY4C/PnpQCsIA900OPgCLhp?=
 =?us-ascii?Q?UXKqkv7FiOZYZgKBO+Fi21YPKBiNHMlVXQoKsqk0EpQRdxgdZmQ+TRUbBgS+?=
 =?us-ascii?Q?4CEAi3WSFw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14aae559-c8f3-4ae6-0949-08de5a564a05
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:19.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qh5N7jKhoTKWLJQiHeBlcvtDQJtKQ3XZHDfe2jUeUPTSnDixjCzmJfUs3FNki07lIOc3Q4xFycf86mHCTtE/hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_000628_749124_D66F1D00 
X-CRM114-Status: GOOD (  13.45  )
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

v4l2-isp framework only supports extended buffer for generic ISP
configuration. This patch adds simple helper function to compute the
extended statistics buffer size, exactly the same as for extended
parameters, except that it uses the `v4l2_isp_stats_block_header`
structure definition to prevent conflict with the
`v4l2_isp_params_block_header` one.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/media/v4l2-isp.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index f3a6d0edcb24..d0a265162440 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -27,6 +27,19 @@ struct vb2_buffer;
 #define v4l2_isp_params_buffer_size(max_params_size) \
 	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
 
+/**
+ * v4l2_isp_stats_buffer_size - Calculate size of v4l2_isp_stats_buffer
+ * @max_stats_size: The total size of the ISP statistic blocks
+ *
+ * Users of the v4l2 extensible statistics will produce differing sized data
+ * arrays depending on their specific ISP blocks. Drivers and userspace will
+ * need to be able to calculate the appropriate size of the structure to
+ * accommodate all ISP statistics blocks provided by the driver.
+ * This macro provides a convenient tool for the calculation.
+ */
+#define v4l2_isp_stats_buffer_size(max_stats_size) \
+	(offsetof(struct v4l2_isp_stats_buffer, data) + (max_stats_size))
+
 /**
  * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
  * @dev: the driver's device pointer
-- 
2.52.0


