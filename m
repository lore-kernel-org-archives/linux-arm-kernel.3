Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CEDFB5EAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 04:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srW6f7bqbkIqz44TnscoEDea+N2SlQ13ovQw1T7tikY=; b=NZT7x1smWB9TVAzNyHP3euMOy1
	Oyfo7zgj6DaF/HBY2fRjwHhg3Et78g6yJZPGaeMxBZctD8ATg4KAOSKuz1ud7JRAzhSVjaamyDpme
	Mm28gz3tLcVoSw/RpWMYyAKg69HQo4AJ6Ec4UOMfFRmfeaZ7Hk6Rtv/mDQ3vn83kxxS9uXoY5af88
	UcC8EgbXCDE0V6oXKaYbv9OdWDoFFo8PNZCix6v2RR4G61Lwx1twbOTGPXmeSu/ccuMOspJSsX3jG
	Zvfu3ufkx7us2410fTpIdQsfxK8buJr1tIDywuZtHtoov6JJuEGDrGmKQYMyoVhro+qyNRd6yRTZs
	t1nz3tHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LeJ-00000005MgM-1Qve;
	Tue, 17 Mar 2026 04:03:19 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LeG-00000005Md1-26ur;
	Tue, 17 Mar 2026 04:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM+K/7NnGh5EVGecF1C76ugvSwIAJKebmND/gyeYymF+tUtFDClA+1pqOOXQA6eV6Ro9eqCGeKFgqlJ3UyCv4Gza/ALdqVTfPSy4b8/j5z1mOK6E/obYolEJowJnQqM7DvhKLuN5btQPq3mmVvUSw6qynZODehjqfSu5gEi1nQip4n1mszBQfNa11WlOqaxQ0sTy6zWODh4hyM0WMrAB5osgtMtWpo/PTpUKBLQHGP4v5NVH+/4N5x6e2jj4Ntgx5ji1MJ6/ZgqOwuHh/Wkbu5obnwHUEZCxuu/AVW12nznEXYmVrfNUkCb2pfgZHPErrpUuo/mU7GtVJK1DjLeUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srW6f7bqbkIqz44TnscoEDea+N2SlQ13ovQw1T7tikY=;
 b=tPkky00QjLgbckYRBsUFEDDV9+01kkzemLTzqZHbP4wgMxXxQ2mho6c88ZmGcAkhTc0v1h28ox1Ju0z/LcR0qb/YrQsCoFjgzUB1brYbWuKFH/NtwGS86XA+G0Azsp8DFY1q1pdvExUvqEdQ9kGnktFqeUUxOuzhLCIPmyEjcyV3dBNzzmVvfh2sGo99Ks4BolsKoqLc64BneapRPTVILmtfCPfQkt9tpOODFmJXrE74aLD1ljwlHd9bCwwJH/f1ltNPcXYeGUdTSqUxNZs8NR8McfI+P244Cbjst+CHyee9US3jTS5fBFcnQyd3jmHoeJD6EBFBHZ+UdFR599eriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEYPR03MB7216.apcprd03.prod.outlook.com (2603:1096:101:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 04:03:10 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 04:03:10 +0000
From: Gray Huang <gray.huang@wesion.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	naoki@radxa.com,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	i@chainsx.cn,
	michael.opdenacker@rootcommit.com,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	andrew@lunn.ch,
	alchark@gmail.com,
	pbrobinson@gmail.com,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add Khadas Edge 2L board
Date: Tue, 17 Mar 2026 12:02:48 +0800
Message-Id: <20260317040248.267154-3-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317040248.267154-1-gray.huang@wesion.com>
References: <20260317040248.267154-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0024.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::6)
 To JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEYPR03MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 90306dec-5d53-4a86-3fc4-08de83da1a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7416014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: O3HwR/sbZdxlGSjxa0UbrbLwU4gY/BLhKaIqylg+8W0qkvYPOJD0Z5lWaRTNTaqllHRRG+5EkAssgmYkywdK0KXRMlXZNOI5MZaPFz9hhbsjD3auuVKzZZqliK/ee3kKcwYWA4bFrM/sEjQ5ODINmow2lTISHknhnpQOIATlTbJUNZ5eMYPwm0NeYsJxvF3cZefTk6ZT/PgcgkIZtMBxS+1BR8p1UJ1CNCmqQKuoqZvUjYzK8JfhMjIOQ9dh+WXvALEYtc0r53XV8/IaIIukI7XkvBUP4S13inFfUp/TRtc3R1FUdq1OPrxrmA4plgWveXhHAk/UWVg75vCNF0Zwhc5WrrjnE9ot+XcDZzs4gFmRXbjZeolwLYu+ZspBL0f9wdmU1lpHi17qJOqZ1r9teC5H/vaEOni4PhLS0GB9/9awX6XSW3B756stpU21e4URf9JW64ybE5has51dz0VEumOBENzqL2gYvQ9+3M9kzFvwCgSp4DQ1taILJgd9feSA/ogi/PKxpAePbv0zRbpMsiZU6PATpA34WonaUdjqXzNHzqWB03AkCDctWnjzb4O/pXvVCcQH7VL/X4+CEwqjsCOp4LsUa+imsWy2+9UcSWPY7dRzF9Rjk8W0czcaBG9E6XdZ5TzRll24Y2bc4N7P1pBgguM858VEGUMo0jZGXh82s4Ao9lHlgN0FTq0wBONEHYRlTi0qaAmui52qV8aRd3Y149DujyAvNkcgnFYW5XvNW3WRKhazj4hoBj2P2Ci+v5qz2tupK+o1ZuiMQ6i65bN8TxkKqPyB0nwiFCgx6dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fj7tQPSTqg1LbAUlH6uoqTSLiLunkQ/It5kaRInwZinXYf4AA47VFDTPX6mQ?=
 =?us-ascii?Q?V/n8YDcIVYlxp2ANEsRQfU9aM+9xdB3YOKHwiYqSAzMJ5CQ45QRjejgi2BGC?=
 =?us-ascii?Q?D2A9tODoX65FEQL0U/FOPY0XrrzheLO2y88PoyfS82akL84g5JP7P0NkdiIM?=
 =?us-ascii?Q?vFD1jdLfVWxpWpSCsTXaHNC08O6sjkOA5Dp4nyErS5w7j7AeV0qeZhJ23NSa?=
 =?us-ascii?Q?YxOWGEDR5itZsRQiP6O2E4bggemngWYfjGHJmeFIvv5Y4WxdlWdusFnFX/Zi?=
 =?us-ascii?Q?yRWMm71F5hmmNMkuc7IWVrBGbGglKizmr4tmU5265dh85m6BIAIlYT5CZqC0?=
 =?us-ascii?Q?GOTZ42AgN5z2syhJ21C/AgMRQKCnVPKBaU+UMiY991/1fo+FmSlX66sxKK2+?=
 =?us-ascii?Q?mHgrOq93SqtAanPB7f813aBjLqy2YMPH75tRBY9gx3wCH+Wq9SM6KOGQL8LY?=
 =?us-ascii?Q?anGHWYS6ZatE6l5R1XCrQonwTEV1PrQqDVJSvh9E+eA4F8jAXUV6siKO+qzd?=
 =?us-ascii?Q?eHcL244Zjo4jrFRxc1a20cHCsFRCOlFAyimhXe3a6vDxq0FzxzzmVkI3ti26?=
 =?us-ascii?Q?6+pklbCPs0iSN2IKGtkotxLYLXaiGDrpIEBqI7+wY8WEFEtjz4RoEl6KOcyD?=
 =?us-ascii?Q?KXvR8B11mhqzvEgalo12waRZHvOKoJYJvKwyRieLwA2tVOW8CDVz72Wcylnz?=
 =?us-ascii?Q?t6u/x2rm8q4g4rORj2o9cRpxJv2fVpi3i0KORC2zNLIm4NWrngLGw9d2pUxA?=
 =?us-ascii?Q?BsGsJnvIW15wLNzF0Hsg+U/7pNnPkHmfBK1JkssuH2MFLApuRcg7oiIW6ves?=
 =?us-ascii?Q?yAXjX7KOZKBJePciSIZm06bAiVsSjkMkWd/llfLsrrB/pz1taBI/A7KMraDh?=
 =?us-ascii?Q?/G2ntWN4vVqs5oh1O+DnQsELm/oameRPYrSjE2ftiSxD3Fxk00FmQa57xsXy?=
 =?us-ascii?Q?YiXxg155M95MhBpPumifom36LPtdmhlknbaAhm7g71J08Tp1MsSiFXL+8R9H?=
 =?us-ascii?Q?3kcwCSF3n0gjcvDA7JzH5yKlsFg47iQwAZ4qSyloIeKBNbEOUzU7xdcZoSuP?=
 =?us-ascii?Q?nMocysKxFGaf1zEIBCzblLws3eDbiNYcKUd5rXc0eQNEhElu2J8DqcjLwWVx?=
 =?us-ascii?Q?JlcpP0HKkQa2z5Mg+G8DyTw+zzbuBaWuMFJUxS/S4e8GRGui9fYjQ6aQlfId?=
 =?us-ascii?Q?jW2wvkF2uV80oANl719R8cpXGZpCP7Z70xzs1/NnmuTVmd+ClnuqQ/XfXHh5?=
 =?us-ascii?Q?7irHAsDQHBnUPNp7Tcckh8UqNBAYi8amuHd/xVYJLK/mO9xnNBQ+M/4JCfa1?=
 =?us-ascii?Q?Wh1NrtnvHNpU+gI4mEtdteV67L+ii2aCV2B2zdi8pqhQLVcd5mUjzssHNj4f?=
 =?us-ascii?Q?2virNhtBlYEGa/TREl2uiPyNGR9c6UsilWlkxLOWh7f6Kd6oOB/A+6k4kDhv?=
 =?us-ascii?Q?HFWYYN9JljtAefoTz2FgQ6yvYqY3SN/A8djNhjbtPeRo+x0w4k4AMo2LdWz7?=
 =?us-ascii?Q?MNiC4hAUQHR1YNmn2b8/UhRAouaKsFoJ/Mcxk9U7KRRXhf0iWvQHIKMplgL/?=
 =?us-ascii?Q?8YLQV9D24YXCaN3DWTWYNsS9W/bIgb31J/djuKMiDPFS434JnWuC3IcKbgD6?=
 =?us-ascii?Q?Q2PlXJJSWCtM98G1/YKne9Jio8NZ4rkBygGF16i5niiZmNpB5Rmkr96FATYu?=
 =?us-ascii?Q?cVsFSIFSiSWYGk94r+n02SjQgEOCDCcbhi3ExNASNFUGeclpJWLbsbgREdAo?=
 =?us-ascii?Q?IZxjPKHvpw=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90306dec-5d53-4a86-3fc4-08de83da1a39
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:03:10.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMBlPq/ipv0Tore0AZgK4a2EEZT2gV2FBx2QSnpfnjAqYPdoSam81SVmL05l67fGkfkvPYa/yhrL/jmbglyqXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_210316_549038_B44CF183 
X-CRM114-Status: GOOD (  13.00  )
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

Edge 2L is an ultraslim, credit-card sized ARM PC designed by Khadas.

In this patch, we will add basic device tree support for this board,
Only eMMC, UART are enabled, so it's capable of booting into
a basic Linux system from eMMC via serial console.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4d384f153c13..127403666332 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -164,6 +164,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-khadas-edge-2l.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
new file mode 100644
index 000000000000..68630379af63
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3576.dtsi"
+
+/ {
+	model = "Khadas Edge-2L";
+	compatible = "khadas,edge-2l", "rockchip,rk3576";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.34.1


