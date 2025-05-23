Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B187CC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkGecMYpua+Bmlv+uj+Z1FNZ59a0f5qAxumGfDkBAC4=; b=qoHjMwYlXQ2UHQn/DM9Hdzd2XV
	5dYV2dgko7DY0Gc3ddTRF8HIX2N6G5V99BILVQKcTyFEnM5enMZyUBZsK+YZv2iXZxG6nC7pNpLC/
	5pgNZM7zUkvMxQwTqPMaUS3ELh7GDmasbzXn1OA++L1Efj59lKsa0uV9buMrG5IK7Q2gosLRAY/Qh
	3Ss9HpAMCsbmfFFejZfzRt9u260ozgOBWH/0YwDOJjouTKhZcn+RCHli9GGUIWoqOt6nRlyd+FWHu
	YPG6322fCPSFZVA91yt8tVSQrhtDBWTjahT0CQ4Umww4X7YydZubRKTR33ZsS7GjKEZSywH5kefQE
	meotOe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVST-00000004QrE-0YnM;
	Fri, 23 May 2025 16:41:21 +0000
Received: from mail-am7eur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260e::601] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIV5o-00000004Mv3-0fon
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:17:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6ti7oW90crC14nC6fRBcuCPnv1t6RbUHCSBVHh2JAXkAjDvpVgYHQYMxlwvdBmVO4N71Zp28bovdpRoAwzelhU23+L4g6wV8T7/Dqo7f4I5iJsxVrdYg2VGd/st8OygHzhHi+qu0Xe81gl6sbA2Q0T+BjLMD0WnuTsmlAcawoxdRgEV3x4L1dqXt4Z48fpHBjGy3rKJpRn5YLyA2eWPEwEDw78GaIkrDakbFrzncUcS3wYYkkqiBwzy+NyfgIAqE8R+PFz3L8o+yI2EoF6XTDMN04zW6OlSozRrasNbOUTkar1pKZXqbVehU3sJ9RCsAIB7VtvFdv76sx8gqxKacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkGecMYpua+Bmlv+uj+Z1FNZ59a0f5qAxumGfDkBAC4=;
 b=X4yEk2vZeoEwZLVguXQI1U10wxiu9x2vqvd6j0/sLDhtAhvyN3sCaVkH6ehheWy06eDxB3SrLrlJ4ocqqiJU4B96A6QDZQmixvbExrU+lVUMwORuVKgpbXv/V9IEjofICbL+ndybKQmUUJsMOhlkrvYjq6BlyoqgEQ4Si3RhAy8/GO/0/cJ+oXH1vs8T5jxUUVtvyk93dUw4MDoUjkxNDAV1WF4QlzD8OV/hCLCSfwTA+OXztNkEFIBXvoPFYPVabalqpqaIdd7dc8Lztd+OcG+X8QRNI1gBvuSgOtXPdeM4C50EWDbWEW4T48WSHftuHeiUHIk+rTA152hbcc3feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkGecMYpua+Bmlv+uj+Z1FNZ59a0f5qAxumGfDkBAC4=;
 b=Ov4PHOHDMmhpwpn+IzO59n9mUy5wLge6gbqv9g99t0cSB2t7ttJPnMI2KBFBwB2Fvg9rsu7t7UQu8n8Nen14DHTV3uN5y2sQ8wiHvmqX6HXvhiemhr55kx25OerfEMnyNhTjRibcAgovwx3FTutdb6NxNR4KmXiZlyTzuCLT+i59z+CioRu+32GsFtZ6sYQBFT8eyRfCoPWo3ZJJyS3SPosJotApHpamKmYTPS0waF0csyuuN3E1ofmQwIMZ9yTqSsxwILsPpEjUrjB92RQrNnmjqaDSCDmR9kWPsSTagZzvWMHDO0D/7STovkPlU56FuhNuBPfCbu3HmuO2S8ik6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:17:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:17:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 4/6] ARM: dts: vf: rename io-expander@20 to pinctrl@20
Date: Fri, 23 May 2025 12:17:23 -0400
Message-Id: <20250523161726.548682-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523161726.548682-1-Frank.Li@nxp.com>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 0363be29-5f28-441d-1d75-08dd9a155fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JUUeBNTyBBG1nJJ1L1EiPR2W4VmSwaOXNhG9/Fkb7CAW0UU8rP1pz2d/IVzL?=
 =?us-ascii?Q?jk6GKrzQVttxRRly7JHj8/wqAkpUuldWGgfFJE+AvTYdwQg1WyFOCX49ID+m?=
 =?us-ascii?Q?yDx3mdASVFSyUz9vob5nfXkwP8vkdlJvdGr4BLdkY4KO8Qi6xs3WjijeJ6ss?=
 =?us-ascii?Q?Jpq0DfAwd5OxoLcqvbjZNrfUxVxf2JNtshGqLiZsLjTGLf4a+HXfCFqFEie/?=
 =?us-ascii?Q?BhM+QGFGZVlbd5+s+eb0VD2FOnPDh6Up5a+NcOH0aB0Jsvcea7k3LAeDFrOK?=
 =?us-ascii?Q?fN3HcKX2qENnwhj/VVl8wbc+UYdLmsjzVZAfiU3J9HfbJdmbA8UVLoRgoWgj?=
 =?us-ascii?Q?zNpJ8EHtcY/4PJQ6GrCnaCmhosNeGdIK8zkcLT/HREtwzgvXqNJGty4LcWZX?=
 =?us-ascii?Q?/34qTxvRMT80mZTxaaIKEx8TCzMTGfXWg7vwLJ0jmMu6GETHwPwp8Usa8VRc?=
 =?us-ascii?Q?/EhUltjCisUT/GT3no2HSdEM356iCfmRPOILVhuZaMeUS0R2jEtEnG1wi8fP?=
 =?us-ascii?Q?J1SRqetgsSmqvon9GwlvJWfWyNFw0jRrki/L35RSfshA/X8kKDWVeHs/51Gz?=
 =?us-ascii?Q?XdQIh1jrl0DDFMofigkuRmJRHVBvfmifdBDnSe0AOXas38/zcMse9K6elkmu?=
 =?us-ascii?Q?Iiga9Bi23shJAQ2xAP69yxtAolWkQnVA/IrO7R6pfYCTkXTo58USG/MY3iVQ?=
 =?us-ascii?Q?axyM9MzrMLMyWn6DQbGaTg8hEZPobmpquklGtvvKR/wd1qZNgMh4baVKUNcg?=
 =?us-ascii?Q?nxAqDOlhpz58Y8gWbYZykVR0gnDJYIbyUC9AlYFf59xjpUW3V2TEiyOWMCNF?=
 =?us-ascii?Q?LeNR9IHXxq+0FptWIlH1Qk/+lT+1AdzpNOWwjNdsLhB8JfW/Q+w1xxc+C28k?=
 =?us-ascii?Q?AOYful5Gu+Cff92sE1imDUm0qTN2ugn00uFsZmwrSjaYFSV005eUi3e03C3O?=
 =?us-ascii?Q?joyEyKtH64DaG5DOyiSUQK7eQP3oeVlBOajFNDAuPg7zdofMggCfhazkB3RZ?=
 =?us-ascii?Q?v4lsCaXHiNeF+kj94a70lmSQBidrilL+A9uewfdevWpONoT4KJn9bdpOTotk?=
 =?us-ascii?Q?JXeV72AARjcNP6Tt+3n6x+D6Bl5GLvoQr+uQ7PKomZK+0/4jjQL2LJHGyuDQ?=
 =?us-ascii?Q?1MU5HNShD9kHuCa5ebC4NmkVUqlFd5Y0Fu9BqvHcH0Yj9+MfRlHGk8Oe/G/A?=
 =?us-ascii?Q?H4Kx8th633hdeQkV8B8RZp6xUw94XlbPbTvgH+d+j5+WZ07FxGbXarQaVUDC?=
 =?us-ascii?Q?89qhig/p8Wv8Ex8+BdLAoE8LS4Cylz4hj5eB5cgEC+L/1xTF+rPwSOKGn8uQ?=
 =?us-ascii?Q?AjVAN+qo6D7zVWppLGm4VujL27guOWwR1gcN6aBGE0KsHQVmJ+yDUqhMxf2r?=
 =?us-ascii?Q?/d6e9UJZaqVqggcug8AdC7K+TFgD+p3kY5cU/6VI7t5k+PK5tMDQ4iA68S4E?=
 =?us-ascii?Q?9CPxd8ak74ylcLuq8Q+1q9ZyVagFBy/RzbIo1rgv60sc2UbBe+U0LqtjBCoF?=
 =?us-ascii?Q?8DGcAppMjDGPZJo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JnklEsugwn9puLmyaLUzA+drkeRck9GUxfmsBxsl/ymSW5aXnlKvqnW057pb?=
 =?us-ascii?Q?wrnXluKQp1DavZo1ZS2SHMkj7351Yq7DzGOamzCNiJd7an29q7IBkBy8ImUu?=
 =?us-ascii?Q?progo5np5sXbiGbhfrfI2LT3IZmGT8nTkWKveSil000sD/hU/8OQcaYPb+hO?=
 =?us-ascii?Q?LtDqBezE3g5zX0mrujGq6qflLsxZes+C/9eJvScD6+9oax0FrdKScjU66hAU?=
 =?us-ascii?Q?K6slLg//MlYusBQ91NdavgB4TejUVqU6NW/yWJv501kD51TbtLEXggSbYOuc?=
 =?us-ascii?Q?9HIgTYxSUaMHDRsGEEiCQwYeac8lO0WzG3iO4BtQsGrOKbsus70rx7VeRK+g?=
 =?us-ascii?Q?V9nTQ4L0wS8B96JTjcVCSpmb4C5s0cOCndsEE711IBuokYzkHWJr5GPDMcT8?=
 =?us-ascii?Q?gLKWpA3S01b3m9KCK+DXOAN9HNpO89jQAdOf73RXtQ8z9+jYKRlzNChNK+ZI?=
 =?us-ascii?Q?sPCo4Khdb+vtO3r0fCPTTBVbZhmDcXi/nGgbDG7PyYlcsv3OdHkSmSkwSUou?=
 =?us-ascii?Q?AV6RDDHMUPbZI61hs9NgAuJD9YCsIACu9pUZ+Hv6IRC8fu1D7MSVXakCvZ/z?=
 =?us-ascii?Q?f9SoXmKyPzkCESaXo6M43r7Y6/DFgON3VqcN94XMNAGlDiBJlI/z2jMuWb3L?=
 =?us-ascii?Q?JDAG7A/TN1HNq6aQciMHcvnc0tCKr36hUJYBGNIF9E8b7NJltqYZgqQORyKx?=
 =?us-ascii?Q?CczT6Dh8o5qf+Dgs/xZ4DvK8O5Y8bjZKLYhfntxHMzk369G7GXN2BggCkxMu?=
 =?us-ascii?Q?dINuvsv2VvjAn3VX/7IHex2GdNjSt6sMq+1uyCwjci0K5VXWzKDFaEjx2I7J?=
 =?us-ascii?Q?n9wgV7K4MKZ1W6R5XrLCICrvd08Lbokg67FBqhQpIaehgTklXgKOCbKShvd+?=
 =?us-ascii?Q?bIk08hk/gbOA/RPDs296E0OprQ62h9V7RacE4wGloYy4Fx7FJat3TtJH0Aen?=
 =?us-ascii?Q?q6uAm2r6/Rq5yOKLsJAhNae6hGS+YK8ABMRHsalmSxGGT2YfLvIcFyexBNLN?=
 =?us-ascii?Q?cRyP7L0ve0gnJxU8EzDl6GECyFrIkwEMKxiyq87S6Wl+2yHd1VHZp+1k9y2R?=
 =?us-ascii?Q?1ByDC+aKEGXXwiRpkleSEGKijeCGJbWFSYfRTk4Iy5fnizU5HmK9N1w8Lgw8?=
 =?us-ascii?Q?SS8E8qTO/8irYnHkG/D1do3Y8L/OeMVXqSUnhdUTqOUOoEqZJtEF80FDEYgh?=
 =?us-ascii?Q?XzxQmQk7raLXGj6pgVsRBuiKEvI8LRLhByvf9mCMwVbcO7HkNPBBRxc1dFG5?=
 =?us-ascii?Q?RTcfsTzhsXpkEPtWgXiPfNO1JVsoW7NIAvY7YU5zkBJJoYjTCzjV1Kj7eBks?=
 =?us-ascii?Q?pB87D5zBs5MsELNGiOMNPMtxXk+1l65h0UdWdzWbI1K8dyOO1FN3tDg3axD/?=
 =?us-ascii?Q?qnLvqfj2ib+TW9SeeU7qu1ncoiWlOqrkVZ+OWOVlLAmznNYaHCU0VmCtOXdh?=
 =?us-ascii?Q?wCUYw9DBXfK6h8VELILON8r6h68AfzVBUUZKCKIC9/Hc6H83GcGeCCIUJNij?=
 =?us-ascii?Q?dsUmXpu3MJYZIEe83Qzh77iw7bU8a8hsOBtJ7m37vH8Otg3BFFXjahjs1cLG?=
 =?us-ascii?Q?Lta0iaLNjkechv1RMteXkEyg6GTCMCgPEkPX693B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0363be29-5f28-441d-1d75-08dd9a155fe2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:17:55.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMvUkrwqe5tPRXtG4THzt3UM+83SnB6m/skHybotZoyUtLZYV116kM7bJ/oqQWC5pcXgX9exBL8QTy/boMJCjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_091756_197016_A3A393DD 
X-CRM114-Status: GOOD (  11.95  )
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

Rename io-expander@20 to pinctrl@20 to fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: sx1503@20 (semtech,sx1503q):
    $nodename:0: 'sx1503@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts | 2 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
index 7a209c9c57a4d..79ea7cf57a4dc 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
@@ -311,7 +311,7 @@ gpio5: io-expander@18 {
 	 *    I/O14 - OPT1_TX_DIS
 	 *    I/O15 - OPT2_TX_DIS
 	 */
-	gpio6: sx1503@20 {
+	gpio6: pinctrl@20 {
 		compatible = "semtech,sx1503q";
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
index b3d338312df4f..8020a644dd9d1 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
@@ -583,7 +583,7 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	gpio9: io-expander@20 {
+	gpio9: pinctrl@20 {
 		compatible = "semtech,sx1503q";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sx1503_20>;
-- 
2.34.1


