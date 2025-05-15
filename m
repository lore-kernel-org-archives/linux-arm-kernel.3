Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjSNykGxjIS8YPfLgOtVIg94PvVsL67PzUZ0Njr5hrc=; b=Ev+v+4YlXRl91mVnkeYzqoSpfg
	hjoXm5vpWPoVrt0iSq1x7CwmlqxeNP4m5PJFhMoKsJcZ3dF0xgV0yHcvaS+IUc/reAC3Qc1+BGuns
	HG9MrZR+N21wWL7lWSH9CZ2C+xa3G0vpeEYt8xmrO+oBM72dl4wCr1xriXXu93y2cuPYnx2H3YEkX
	riPAhXjvkSTTvrsUCKK5RRo9ai74cMOEkPK8TMteSiaaIqcvRBmILcxXw1pQUCVOgG9Pl5DhcC4eX
	T/R0R8Ryb01yyS6Hx6JxmBjHGtUjsDLZV7Ndl/rrm8xslSc+y2K5swk9wdHFzEZiE+zy4GsaGqeiQ
	K036mgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFb6l-00000001BsJ-0GOv;
	Thu, 15 May 2025 16:06:55 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaxA-000000019lQ-2kt5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVm+EbK72u75z7mkYv5rbwiq3tkOlEZCsblptsbGlCNfPJAVDsiqrTXDK61ehAvXTb2WvwT3/qGqiCZ3VaBUCA2bTLkY7k/MovMSIdgGUIJZRmHuLeB/1ljwaINBJ+ATMkIt0bzK51JlyfFRtALP99SOI06b7PH600nMfTykUsJWpn28Qe7Zic9Eqerv82PPpMXnTkVTP+bKpVx87YGVn90+D8gDDsTRFjzXryCS6mfTqFihqWqgTjqPR4NeJnXI578zs0LuQCGw3sijmKBNtvVdDx/BVULbvC+KNWkak+adp3AQGMHWy2Ch0mrMRjbqzBdOsB4HydKyb7lE9sL+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjSNykGxjIS8YPfLgOtVIg94PvVsL67PzUZ0Njr5hrc=;
 b=DvZtMH7rpUzpoMf3VCP30vb+E4hoN5lUmm8Fs0+nCSnqoNn4cuaja2/D2oObp/7Nmudi7K69UNf2kCDhoR5SD+h1XC9KLHhOSbULf4atDn0ugx1BZMwNsfzy1YvWpydECiT5NBpUe+BzMveHFtuXiwGsTlk/SsQLRUQHHYozmkmmR0LT8+Ixph8bhb1HplOm9219EF/cc8QP47Yq789W/qwE+MK/gg59nKu9mT6MIP2r/MV9pn6ZNW/OBWV9Lyt+43xjuI+Rbj1sADBNL/4gd72fUhebMsf7CjnrAt3AT2C5JyxoBpA6A6HVaChsgQ51Cj8pOHxSJhZALLW/Lc8pAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjSNykGxjIS8YPfLgOtVIg94PvVsL67PzUZ0Njr5hrc=;
 b=PAS7rp0zOPwXnwl2VImoiYD7TVXIxNSLejbdFPIQDQwFwiDMXTNn1dzNW4+L4H3umHl5SZHEjWva7vwYCq4yOK1uQdH78y80e6/zYQMvIl9VamzuLiV9/8o3wXm4zvYID56X4MQDA1hbIJPiXMJZSlvbPIXoGED7WjaQ+OxiHq7QqyRQ6qUKIGyPg33esHftA/YCCJdsix4HZnQonXsiEjxJ6KCAVmno9Nh8X+MQjqbPTaLeR2YrpE6yH5ixIqzWz3J01PFyLV/5Pv/6rO+9ER+cZYzVevza5/7Ezc25E19JKwW6NLiG09xrFYQEuy1+lxjeJQ/oSAz0CpRSK55ydw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:51 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:51 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 3/6] arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Thu, 15 May 2025 18:56:25 +0300
Message-Id: <20250515155628.233007-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515155628.233007-1-ioana.ciornei@nxp.com>
References: <20250515155628.233007-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:205::16)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cecaf2-f797-44cd-74b7-08dd93c91b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tesi3aKZZ3w5jNOejXOTAqdUphq1iRcnSFmcs8xHfbWvlxt0/hE5wGl7eUVC?=
 =?us-ascii?Q?X4I+/7wmJGpTmNrDQII9ClJwu1JZ2IOFXU9TJHaK+HEpv+k6hqXzNk1G5A//?=
 =?us-ascii?Q?CJM+43vKFq1iXdptTmkmAhGdzENBR7oez66Qz6OzdQe07qdDmbrd+2DbAb2P?=
 =?us-ascii?Q?VdCxJdM58NlJ04e6VBYSfaHTk5sgz0mYbIfOgNZqNRogDTmzPZLTZ4GsDkmE?=
 =?us-ascii?Q?uuUWdM1MWpAxXaJw3lF8UuKJuJ6Km+7SVqQGQQ+p15SZqJa7FdJOFyxHdDlP?=
 =?us-ascii?Q?pCvAzW2fl6DwwT0GWvSRKgQJX0dizcpifVWkb3D5DHs87LqQ2voTrej4PnpK?=
 =?us-ascii?Q?7/bk24AYkpO7y+SeJX0j7p1ff0/CXAeQjncmmbLYZHEwgdrAyuf5rLOUsATX?=
 =?us-ascii?Q?YysQtSZbOBooMVlY36Hz3U3kN1yk6ENmZnAvFQckQW0pFY7U+IX1PeOZVhHu?=
 =?us-ascii?Q?nVNaT0+FEbDslBuTJ1oGWCXvzyQY71kznA8yJwYu8JBVeyqBJ85Ff9AtF3CI?=
 =?us-ascii?Q?thbb7mJTQb7iNxzV1trSe8Q7g7QWxFJ9VorwelcaWmI1ASFVGdPgUsbqzNOf?=
 =?us-ascii?Q?ZLwAh5kGGoy3jARsx5ptOzGzbbjuG7xg1hSkyF8KSDoqOK4UocTBV7Ef8Uki?=
 =?us-ascii?Q?cnPDCUwdNPX/XXd5gtdLnVKHDMWSALQF6U54t4ZoVw3La3AGjbwaDZ8rvv4z?=
 =?us-ascii?Q?ZzDwkKM3elrNoylGeHycoKhxXmfOTwgdkL7kEkknHkoZ35bO+zCvyBnz/xqY?=
 =?us-ascii?Q?3ULUe4tEwwyQCHlLT5MAMsRxeKdADFruJA9Tqm7qe/gJr8S8x6IrEY+4QVbd?=
 =?us-ascii?Q?rioeklht/kueeHjDdGipQNbz3SaPNGCLsV2L8EHuGIQDRySD9XJ3D89Y/cKO?=
 =?us-ascii?Q?WxkzH+13dg3UEtx+bW3BHmHlMLY6fvi0Jw+4J/869ltDpXwSiIZ0F3ii6FXa?=
 =?us-ascii?Q?9yPchtiUwJlGFTotCkFjMwMNDPkaRw4gi+J5GWhzW/X/vcYABU0WovXEYRPX?=
 =?us-ascii?Q?HdRST0hDu7H+RZekC+gc+GlyFEWCJ0IcXBWdxmY8UyPnRL0wOXDwZhQhcjSm?=
 =?us-ascii?Q?vbo4/ZxoB1Yxl50VZUYq4HZbmnDparg39pmGYD11CQUyT6UQ6mu3pFJAqpRh?=
 =?us-ascii?Q?R7qfFvsJFQ8tt7bHn3MxTrS5Ne7pPIoXW5opcUv4A7jpQjQ1PVvdYTKwr2r2?=
 =?us-ascii?Q?CuJM6dAfU3RC1ejpzpKDKpZuE5yDX+yCgxUced2AoRSXYa5VfuX5xbe8hYmO?=
 =?us-ascii?Q?sdxrwj5IykNIFOcd2ZZHuePtrvpDhmqLiolRBeRmxrrynuR9oDgV85aEkXFf?=
 =?us-ascii?Q?d1dgS+T9VuH6GnBmgzauNghn28nF0grP0pQDsDEGkws0y7j9en8bY3pLnUBO?=
 =?us-ascii?Q?pI//2fM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4bLoe/SpLUyW+iUHEjzvtHcDMxUYOQ4kGG8kbuav3rae0pgToAI8s7ufBrD?=
 =?us-ascii?Q?O1lY7IwEoMAcrR8ndK7ZmLrvwce4pZ7NDr4qqFtkeQhpWmt2YBJKJI35mpUJ?=
 =?us-ascii?Q?I4CgNz0enQEgVKPGyq+3NT1y0nxZT8XwTKc3V+kSdcGytNIawxook4qeJiDE?=
 =?us-ascii?Q?262JaaN848i6AaTfU+jmMK8N74CXGVPak3vJWx8++bPGMpW6X+WdIki72NIV?=
 =?us-ascii?Q?6o2VyXqVyGNk2ddyHsjMWBwKMm8kkVPhAk/JFtUtDyrpVGCuk/ndc7NorBwi?=
 =?us-ascii?Q?+YNf4pDXDnNqk2hmQNoUNSlKNg+Mcl7YKfJrqM4jQbGOZhVMCw1p0IdQaNHn?=
 =?us-ascii?Q?RJiVYSkpigfFgR87fEB4ramTakv1TUbhHMXSqERLz4fPmo3MnsAhNUybwP3G?=
 =?us-ascii?Q?pb1IutdItwIq1rn1CboNRSHnjGWhdpzOA0kE3ErICU6JnLrXVm1x8UBuow/c?=
 =?us-ascii?Q?4/z7tDMF9CQ38Gm+XuUVVAeYcp+ZLl3RSdJ8rEEB5L09urq29GU+UHukXevb?=
 =?us-ascii?Q?K3BDRhJb6WWl+EsKJz9W3yH3v4O3pQKGgzfiAXCx5hzr6mTmlHp0GdRoZZuy?=
 =?us-ascii?Q?vpk6SWy+pw2iS4vjlVIOJtHypltWSN7DJJw2b/+yMrQDie5uOWkkr3nx+WaV?=
 =?us-ascii?Q?8e9fTWMIW4jr5e0kvSF+6np4y77kSVz4Yb1g91gs3hRTPPinV2MnXnZd2wK3?=
 =?us-ascii?Q?zMGqqaNZ90Y+Ae4WAw+WN9IPcjEYgVxw4kJ4YR+Ch0Germk8GqT1Ka/0nIa3?=
 =?us-ascii?Q?IG2Efb7C/zna1b8Ab6FjeKIrEehtCRDvCC0jxaEZKxY7pKlT62zQRyMQjlno?=
 =?us-ascii?Q?nLQJNjuKXyQ9wXRN7hKWc48SN3Ld5wPH/+VvvZUmbKaS8jo8sL78jUDiDwbt?=
 =?us-ascii?Q?KSqrNCItCI/A+HTEaz29YL16IqXpRQAbfQYzisWMWH3wLuWHZho/QRBQJWyX?=
 =?us-ascii?Q?W8ZgG4Avj6233S/bsdzAF7yPUWtodYfOp3S6onI4JSlXK3+cHENKUE9eDvNf?=
 =?us-ascii?Q?X6GjKlpKMj5Rj99pErreMeNYr3fanV+Dsxer/V96g+d+aaQo60gaIQ8QgWQc?=
 =?us-ascii?Q?LigjMoDvnEbePvLbgSx8cFZH6BHN9JQnLYOt+kMsLHTeifb36y5jWI4Pzxfq?=
 =?us-ascii?Q?wzTpkVnQ82CLPhVv1+Q+CGQuge9wzs5dhbAnYC7yLyVnVrmFVLhGR0ZpHxcK?=
 =?us-ascii?Q?zkSxddFfMIgUY1RMMsZYxUYP0LO22W1v3koOpafk8zhOoUs4ofjWT5dbbGTa?=
 =?us-ascii?Q?2Ca6ieMTCfK7rT5vOcZF6BudBg5LFU1ZmohR+HETCaJs7yYktWHkm6HYZDDH?=
 =?us-ascii?Q?YQiI12tqyvgpbulEzm8MJoSgPd+SBYKxzCHbk6QHciP7/oVOsENqsFo1Xpae?=
 =?us-ascii?Q?IWQU08k44cEvAo//t/39JZv0SIAzqzxcU91Ba7QHoRFtAKC+MOrOn1xU7vTT?=
 =?us-ascii?Q?FLwPpd8a4Zw94p2GHnHfH1NOVIy/+XgjMMyklsWk838bO9245e5tM4121nGo?=
 =?us-ascii?Q?le9bkCkgdOtAmyLZ+4z4NZwDq2lPgzj/yZ8rGPiJXIIM0WaSet4zYCRmnYpr?=
 =?us-ascii?Q?NnG+LAqeV4uLyMgkYkTl1Rb+3jDNFXH7uf3uxQ2j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cecaf2-f797-44cd-74b7-08dd93c91b85
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:51.7722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZljPXklsFHRFuZJKT10Dx4cIqtmaGCHi5/hNEeSfUEIUnNPfMSqzmzcAei65pA6QTtQCUWi8K25KxOTOmD7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_085700_695954_7C388F48 
X-CRM114-Status: GOOD (  18.27  )
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

The MDIO mux on the LX2160A-QDS never worked in mainline. This is
because the on-board QIXIS FPGA does not have a driver that could probe
it and register an I2C regmap for it which could, afterwards, be used by
the child devices - such as the mux-controller.

There is a downstream driver for the QIXIS CPLD:

https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
and the hardware works with the simple-mfd-i2c driver, so there isn't
any reason to upstream the other one.

Since we want the QIXIS CPLD to have child nodes with "reg" and the
current format lacks that, change the compatible string so that we make
it clear that by using the simple-mfd-i2c driver, and its
fsl,lx2160a-qds-qixis-cpld compatible, we expect dt nodes children with
the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- none
Changes in v2:
- updated the commit message to explain better the context
- used the new compatible string

 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index 4d721197d837..426fb4c39ab8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -240,12 +240,14 @@ &i2c0 {
 	status = "okay";
 
 	fpga@66 {
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,lx2160a-qds-qixis-cpld";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
 					<0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
-- 
2.25.1


