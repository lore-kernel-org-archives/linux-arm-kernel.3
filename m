Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E7CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 02:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZtFmMhyMGfT1NFDdGlfN/z/sNQ9Ez5tGYs+20CJr9LM=; b=A08CFCbwFidzrmFV3/0y4Wvgnn
	tV9hHil43AWL1UnwxQQpXMf9xWQ3LzrEvBgSrtNGSPSqUYSqGhNPRoI96dY1PAdfF96OthHnA7DZF
	u9noxprr2a3PBN2MWalkXPh/flNxQRSTb300dvUNvkQp9IWt+yXK3rBxxbZ5Sl9RVJgUaL42iJaOD
	Z5h2rjainwN1G58DIAOCVaa/yQj9E3WT0zTQo9bDlueNwM/9zSWjr+OzBMNEM/edTGfFbapZkowzR
	rTh+lzFPDRRZEXovdrG/ONlW3jQ0fhXfR7dbF+QSz4ZpLL5fnGH1+1IrLNxGeCTFPsVpEPd32Ej20
	G5zXnXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLAw1-00000005M00-0Zo3;
	Fri, 08 May 2026 02:27:25 +0000
Received: from mail-norwayeastazon11013023.outbound.protection.outlook.com ([40.107.159.23] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLAvy-00000005Lz2-0LtX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 02:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbOf6JBaWvOPvGwGOppcfxwrev+PSLgmj0DxKC1Luqi5ojczvOE2k0qo+K8rXIA1Q0i4NY3Wi00Bqhk51DE66MVbu7zvb72aRUpD3ivUPM2axIMQ/0xEn2ncUSN+hfVZDOlRwUO+VJhKpkheNi23sSKD0xGZmNYGbirM+0oPwmBvq1kM6Ewd6DYOwGAjwM6DM0R+vZD/233RLEE/y91/1oxMZnrlqTYEx34LH7fR57N1ufGiLFj+Rbvd1qPYRNUjZ8iJuOiAcgH6TbbABIf+3gnxfNqtukSdjOobq+yym8Vvup1+hdxsOp/S3vl3iC+RnUh6B7Z84FUnBlU6wUQhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtFmMhyMGfT1NFDdGlfN/z/sNQ9Ez5tGYs+20CJr9LM=;
 b=O2NgZzQpempT0XilbCYtcM2QeGXahfL8P54m8FalVclBE7DhrNRTyTPjGzqRg3KSd1pHlMy+/qKWyVLGU7OYsgQypvAZC1W0eR/ruSlPp1KjmndH3rEn4V8lk/pD3Z/9gWs10+QvnIeGJtrhFq/9OwLhY66jlD9ts0BHnTQ0qFaFrsPM8OvuinwXB46F3NHKZWS8RSJkk5iZ408uew1CgsjcjDKkGV13Ua9HrA/zZ/ZCmxaGT4Lb5zkPckN8EW5p/9y8RzVRAtlZefZqzdan7L5V6wMuykmwCexZwsAFhYOz79yKHMDPEUR9zljYTk3ghceC/v/7Z3y6QJ2YnwsMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtFmMhyMGfT1NFDdGlfN/z/sNQ9Ez5tGYs+20CJr9LM=;
 b=ftY17poq/ky8oLguLrwf2GMZT+j11fQ8ePHYPQG5GzKhJFqci8EnKjtOWKG2wPixEPUCfqAjaBBIGjBMot3lLJdVoUhPnVMEH+rhmWXHyldTASuOXgorLQNF1y5LNK3aoyWzKTrXEX11G98s1LA8aT2CmMTSB9u437DMEzO2d8ogKz4tHEZJ5yfXVS7zLPkcsV9xfHZ24twAzlW4ilfN/ioLqC3hXntCjH2KVD3TnS4ZW9dQIAP7TL0UFElpgAY4lyTMQWAZVjc1EoOBC7eOxzcn0QScIJGbkKuUhyhOAtZnPRFziqrR9c1EhNlBHix9fw0gdoW06qgEoG/GMO5DLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by AM8PR04MB7841.eurprd04.prod.outlook.com
 (2603:10a6:20b:244::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 02:27:17 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 02:27:16 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] arm64: dts: imx95: Increase PCIe outbound address space to 2GB
Date: Fri,  8 May 2026 10:28:57 +0800
Message-Id: <20260508022857.1500938-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8dfbe4-ed06-4389-40dc-08deaca95284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: CdEMZUTNjnzg/TcuDlQGhIWUZLiTkaUFbciXexMZuNs4cr74qAPgZu467KeSSxLEThOe9CTCXlt5YsgnNqeShFd7YDuXNY2lTd+0DVtDXN5zj4Yt7lORr8NOQFmxT63J3PMfm3wZ88vtu/d5CW357Qs82PWdWsEwPJF2rZEgfKUze4oO7JUYk/39B/Mj/jTVKUh3rgJrUtKIEicUTXZl+o6hR0e2aMDsNEY27NATqa6aDw5pDGWWNMk1zWj37UEN9jije//VtMFU5E7EEluxnrZgdYKp+dgIVLP+wKgwS2s4Ito4GYUuyAA9WgG5Q8cnEWLHkKjCgOE1D5+yy0dj7bsWBj0PvnzIR5dUGbxv/W2qDLmbsA2z+3BE+GQtOUUlV3iNdLrFDFlxnRVbfKnBmuh5iNwPxF99M5OzCT/yQ5ImudCNDYJKY/POvRlG1IcPNnZ8kA/u43XVzF/6x5gDlDsoIW6q6v5MY74LE62iOlJh28SGTb38SIfGJXjDSj/bet09tjUsPld+vjsMPtNisDmOSE2IRDNh11k/FSPQiBp4AKs9TxR6MidHSU02wLHk67VQqCVK9mbTA8v7Swlhn/kZjGC41elKDwmpXrSjzAqvbwHQAJWHGfsfR/ljN16grWMR7uEFmuzW2Ls0DGe9RclPM8ZsydFneT9ycyk43r6FI9ujAptHn3ab2BnB1TRxdkSowxxszInxHjQ4vU3BQgYLlrUh9rlrjyzbK5RKFQWaBH0AlqrbZPFn1FtsOkc7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LD8/8wmhTNFMRuPle8enEFpWP1mIsGJJzb+segw4UBkmVqBnb1rLpq0cl/jj?=
 =?us-ascii?Q?6XU6nlCHtzoq4Qx6vi1h9597087gFxAxMMt5tCmc+WXWvrsHWCgQ8vjsZY6u?=
 =?us-ascii?Q?VahPVNo5zpIMCpByVtFO+xFkf/OQ4NdLgBbdMxjgmxIa3jlJLvNrHrlYpEpx?=
 =?us-ascii?Q?JPEpSkdGdpi1oX6+mljDeo57pUJ9iFjtFa56p+tOLYb+muqIj5Ten1pWhIXA?=
 =?us-ascii?Q?CHOXv6JSC7gs22aaYTdbjfXwH2eNDA1iKWrva20oMBe6QanSanzICGmGqOzc?=
 =?us-ascii?Q?2RWh0I1VuVEuho0iHoCf6DFUuIkNk97ambdNp0ZWL6WQyqxFnTH/XOPoIbit?=
 =?us-ascii?Q?Hbuub/3GL7Au3DsbmE76OQZcMaIrxQwKllS2im0mjbzX6wfz6aGRORw5VOWJ?=
 =?us-ascii?Q?vOkulXvDHbb1lh51AEwJtlm8C1j4tRY5lpB4Xft/ICnhoWgh1nBtbQBCv7OS?=
 =?us-ascii?Q?gSdvBpxBnzJU5qZKobVzz/BlVAkAWwm6mJsSeKr5HZt7PtV1GeVXXMCNFWmB?=
 =?us-ascii?Q?KzmMwFyDVS+ZjUxGQfDx7EU2kAdz9CEnY5ybUDdWcoVZJN2c88TiYEnIy3yb?=
 =?us-ascii?Q?hRzaSMcS8NuWNB2f1yT7LUHIpx3UqalXRQNlxy50MTkiT69igtQ0Z4lOo/yU?=
 =?us-ascii?Q?b2KDr+i22kUvqWvXpsaifphPikAikozcuOlyq+1Al5AlWTfI1acsO8PetgEi?=
 =?us-ascii?Q?ZNPI8bJJvbrsreCBxTl4/ak4WcXLQtnjw2jwNIOrjj2rYhv9kylGnwZgxWGM?=
 =?us-ascii?Q?wSK63LNZ3DvM6+R5VlGB+mgwM5twMkfYXEkz+qPCDWIvdcQk0uPQMBKDFUlO?=
 =?us-ascii?Q?OHwsX5eGPnjFjN6hJ1sUJL++UtetRDMJBohiujJkoPqREC6J59Q8CIKrg2RZ?=
 =?us-ascii?Q?482LX+o6m0PFZToUBn1rxz9s4tphf4HxUaB7SitTWgff64KGmqXEu+NSLGie?=
 =?us-ascii?Q?SiDwek08Wb3z1XBKS7khnh5Htvk6DJDJSnIoLd+pnqzk4vfRxItOIeVzxzUd?=
 =?us-ascii?Q?xCyUDPFcD4MhqQrVJtW5VdKhyioEQ4BwjJ/cBAtQNz0pK4MEqpzBKNDv4KYa?=
 =?us-ascii?Q?VpF7OtcUR0T39UGH6tHsAxoN547WLupE7ttjKNwD6jvK7ZEhW7KYMsKNbmXi?=
 =?us-ascii?Q?r2U99ubfytzYuedP5ND9aMzhPnhoA7kPl5+DAN1UvCYJtdk9UwPGAm3D+b2S?=
 =?us-ascii?Q?hGNPcXmB143Baegh5uMjFB3fMP3vOqtKVIO/CVw59jv+AKmY3sgGtFie5vu9?=
 =?us-ascii?Q?6dxyJreBu4/7+YpFK16yGBMvf+TenzrJl56bMa92gOOiAEND60hxepUIxjCf?=
 =?us-ascii?Q?bvHNAnh73m48h1bDA77dLUOWBa0hOniGf03BrKUPu4a/Xzdbflz2HKh3Z+mj?=
 =?us-ascii?Q?rzcwUQ9SOrZiN99W+hTGm9i/v0ew58xk2/fhWgaYv9+HpbrSFYB+dlNMMOd2?=
 =?us-ascii?Q?tZmgk/ag5UlaXE5GbJhP5SvtKI3qk93ZLH3/cbfiRR7K43+ErQ9y6zMDNwB+?=
 =?us-ascii?Q?9FoTLen77cKws+ssvmgP8AXQswy6blQvq6Nb6EdLWYcRebLyQZ55X1+aexea?=
 =?us-ascii?Q?mWb2UXwHuLaSlDRDp0/Ocoa9W3AiBKAG7kGeRwdMGj7sJTFn/Mxl76vJfhVc?=
 =?us-ascii?Q?zukW/i2DuPljsa4js5/hmRKicwETVlkrn4eopXz9B97Ubg8hTBI8/Nyi5rWs?=
 =?us-ascii?Q?1o34StsSWgepz8ks1OxVisGTyl790rygNq73cDOFLQTpnfVtrIDYkCiuG+Tz?=
 =?us-ascii?Q?eTpSZ71BoA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8dfbe4-ed06-4389-40dc-08deaca95284
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 02:27:16.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLthBH3oq2G4EQWMyZcS+ury80kRui4Csv27/vTZSCYBs7XodT7F/XK8C/ipM+0RVIZADqR1cWkL46R7VSEJhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_192722_142950_CA944692 
X-CRM114-Status: GOOD (  10.90  )
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

Expand the PCIe outbound memory region from the current size to 2GB
to support devices requiring larger address spaces.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696b..201c0eae13948 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1940,7 +1940,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2015,7 +2015,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";

base-commit: d570a0d019a3d84832bfc6867647d3581b0052f3
-- 
2.37.1


