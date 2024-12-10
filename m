Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AFDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Wdkpftc7HBWtEDp2E+QyaPjn37YYogXU+liviK8rTw=; b=alTzsP5fyjPTVF6adPxk4/UQsJ
	kK7cE7LcbZblpbn7z8vVIW7Gzjboqb57396XzdD+LwquyHp/pYHZZB0aD+jNRD1OBDbo4iwlZngR2
	Ptm5jdCDfIpW6rmZGrDG2P/Fl7YJhepcwoTRinFjr0T/c7q6nVTv28p9cC/VUDbVwGGEI1bgj53Ur
	slUEKxY/xgExhUxLmU0L62A2EzDf3xZ6uHFotwZ369BkwyfVaJSZ3aXM0dsAoqeHPljvHLKKblOa4
	sCRzlapBoT/F1QOkqPPGxdB0eMKVpmd6NECIJJ0448cIBCPXBtSE3+8fMVRTccj3MDRt8L9JoVTn4
	AilNv/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzqx-0000000BVak-3wHD;
	Tue, 10 Dec 2024 13:00:39 +0000
Received: from mail-dbaeur03on20607.outbound.protection.outlook.com ([2a01:111:f403:260d::607] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzku-0000000BUAo-3Axy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:54:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDLv53/zthFXhyRnfSDT5wlkxtOqVIZ0324aBfmif3H3qL/kYy/BQtZUFBzh5qi+E+xpzAATFUt3X9OQIDR306envwNUyQeXISmnXmTf+0Ff4SAjnH8BuE2RV0eJspPVm07tFxCK6WEwPoMQxStricoHyGyWPp2XVoCPnvHe8e0oQ1p/A/opkt5RPnZMXzkIDRB1qk2ZTvbD/IIQcggrC42mCf2pnYJXJl67bF26WzYuVUlysqpRvKY/TpIWT0cIEAYAceyg+zPNGk3e1DVv997w9W4BEEWeT9LTWnoBxmp/1GI+QwPN++yzSZvec9iVMmYnJs3xO0lOKXPTEcQG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Wdkpftc7HBWtEDp2E+QyaPjn37YYogXU+liviK8rTw=;
 b=hYOIhJsNskpPrf2lPKiorAUMuFLEfnynCXXk01z17y7I+l4Yt3xQW/ZviYgQ+A4cgKnVGhYV3cPe5DDiD6ppv0e/AtexXx3KFxEPrpqcsEUSX/RlJ9oIN1Nr9HLjTpCHGs/HK9/QNusngh5QAPMNp6jcD9+Qhuq9IIM4nmPxXmzF7vRBD5vqp4c/m1hEHTJ2fgXLmySwOilUCMm347UFuOjG17vsh7sA/ez222hKf7hnvvYxneO2A8jONjuZTNnh9E1mizE8NZRgGLCNOhaIQ2hX4GR4mQ4vP1uPwj2OLFlQS4F45J6qmc8TiErWCODeHqOQW9J2AJ8KZwkC4ahYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Wdkpftc7HBWtEDp2E+QyaPjn37YYogXU+liviK8rTw=;
 b=kgr10UhYJDcxSu9emExvE33ni/qf2yLswXXMbElx/biINW1Qkdlk01hAmK7rg5lCkwOc1MMMaU/8KRaGOQv/S5B2OMFjeEgtMtMqnZxIFM5Mw0/c7kDcv44oFYmwAggKN2GBLIVBOtuyYg1eAXKE9bvNl2MNXPPIlk4WbXQhwbvFT9r1R7YuiVRG1s4hqu44tqtqPm9d/5h+dO1FaI4bdzbDG8wJeIrVP+SjGNeVXO6L9PrOoA2VlzqQxIxWJRaqdwIZIWYxCzoKlS3SdKZJinC/Gr4mlXcr+fr+OkPpT0pCY8zRp/LfWTe+Xip6SW5kjL7p2VG32BvxQjdl41+RGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 12:54:18 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 12:54:18 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
Date: Tue, 10 Dec 2024 14:53:37 +0200
Message-Id: <20241210125338.104959-6-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210125338.104959-1-daniel.baluta@nxp.com>
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb2c17f-5d23-440b-90c6-08dd1919c22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3mkhW2AdUK5vLAHlxGKWRPmEJdQNUZ+he4QLwENaO7R9e1Pnyl0Buj6p0iCM?=
 =?us-ascii?Q?5EY5W7Ys0SMqHppC9IhN/VRA3+G1x+r+SkSQ68R9rEPXssEvHubq99bc0POS?=
 =?us-ascii?Q?imEPOKyojGuCbkBDvwlHD+TEmMvBdo/RRw0/Mnw7tYfbk3LulfDkhr9i3X6I?=
 =?us-ascii?Q?lpki64D4fyHc8VTyDZjyonhGtpwZeWDq27aNHxgiv0aKu5Wby0i55xVGa3FC?=
 =?us-ascii?Q?UJshWQG8SxCgadtBSCIBRrviykSWYYhfSXM29MG//GE24RH89OPAuR1IigoA?=
 =?us-ascii?Q?1Jg1VWs3/bPy0iVgcYrs5fvndDONxWShozwinoOebvANC/kFMSDhpwii+uaj?=
 =?us-ascii?Q?RM1iJcUiFiDK+CnsPV0Dn8NWkopCzeKOr+RJ7vtwWetgYtevflnHBAqU/kwK?=
 =?us-ascii?Q?57P9dDcYKtnmrIc6C4P2Q5V0nE8bTRahP3WgcbUVVffrysKV/WOnO8OpQ7TL?=
 =?us-ascii?Q?9V5AKksSKqWCNAmN09T9eCWIbpEIVtf/es6haT9HdfVSJpNXYXQl0s0LEDtv?=
 =?us-ascii?Q?ILkylYsRRdmlVIpIdriqrF9ITEpLugsuOO8PFTjiSBV+4JyzfCcpL5BHdZ5g?=
 =?us-ascii?Q?mBsBCR9MI5hZ1oKxUqhuVbq8Gk/cMixRZdCdzSG0P4CupoEwIjyYeHZQVH3P?=
 =?us-ascii?Q?JXMSq4n2GG0Fbg8y2nFfh1sLUvLGh2VotNJS2sbDWcGzCACxQLKB0DNMM8eo?=
 =?us-ascii?Q?2qrvKbYhpdPbQ5QWQhbx2s3CKfqDyXCUVPef6WYwf71a8xzibhZK4vC7GW5T?=
 =?us-ascii?Q?aW6iz9lNKkBhJ2yrZzeZ7capb4URBhW4dEmuiLuYBFs8njdkNvBRZudYrGVH?=
 =?us-ascii?Q?j7Sb/JEj2gPkWv1Q0er1G/idVuFe3+3pBfLB7mgvhaI/b1qowf1Z+hKMNo06?=
 =?us-ascii?Q?G31dFA3/PHvQ9QtgUbiofvMOf/nQ3RfnYDgjbWrc2yjmKl8riNvaSC6TM5/P?=
 =?us-ascii?Q?A6i9zN4ZBV6GP5u29SBu3nMucQeJDU2RlemlqysyeHK2ipOnVmdQQs8Qevzl?=
 =?us-ascii?Q?RO9LTGNSBk7S4+/r8win993McOB70Zwu2TNeREx1BhZ6Xprc4y1zd1g4vlnL?=
 =?us-ascii?Q?EERuwdcnoIARrxQ9Fgbvd8c6jH5EcyDSJ8+MDOXraMwxKEMnwn1CFdnbuTMs?=
 =?us-ascii?Q?22TEGYD4qjhD+LONiGBIkaEclHBsA2Fp/ZwZ3GuU4lR+8C8qFFJvlViXyB/l?=
 =?us-ascii?Q?7segsZRERx0LkeDQVNGpZoRBZ9FzmoNcdzPjpayGklQ1iXx/u/g3TOOdJ0dU?=
 =?us-ascii?Q?2Z68O67r1W/o5Umu7uDdy6C9Ho07vEXmfu/sg3xH0DK+uy7WadxShu1u/xiL?=
 =?us-ascii?Q?OzdT171lUvWC0S7LIn7Yd8bBCkYgirNnZ+bHOb1PS+/QQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ud/f26VI13VvCp/aTdOzDy7m3lKFQ/jzyvDjMKLAQCSdQYuX5dxO3xULiK80?=
 =?us-ascii?Q?8/Ob/fz2hgzpldlcWcCGciN9Q03TmbkoKiQe+AVqWkAmqWewc9+oNihOHVu/?=
 =?us-ascii?Q?EBkHFhAf/G+hhTZtLD1Q0da3m/aL6qJkEbJ+JCZpsqZr/zGnw85SMRhgzgNj?=
 =?us-ascii?Q?+YlxwLc51QDxZr4w6ycqs1zbCjQMioJOdJLf3ZnqRzZ71yb8ZRIo71lHrhIx?=
 =?us-ascii?Q?admnrOxqS6behLDMeAftsyGd0MAJrEFggVpaeUlARrSL0psA5JBKk1+dcycR?=
 =?us-ascii?Q?lR2oMRrnZFTm/3kmUmGyAaXCkN/CirorvXqk5n/7vjHhipbVHUF4Yg1nfn4W?=
 =?us-ascii?Q?fI2jKdcthzvIJaJfkFHpScQCwO/x6sL3qy62mQNU8VvjxmXK0Is40Hii3/2X?=
 =?us-ascii?Q?2OjtWdcT7J77dFJ5va+RsCS6U8BPiPGpy/fZpKCSaEDffS5P9cb1gz7QbOEW?=
 =?us-ascii?Q?wXVMaO2Gz6E+4IxqmVJDMlMuuSP5mzC5J6LjGHr9WMnb7Trp7AiWVWqidbxP?=
 =?us-ascii?Q?Eg/3+kjSx8kiJIcpQQrl7CMvun7LfO/V1pvdaj/6oOUTldR2aLdfBNH/lExX?=
 =?us-ascii?Q?aElzqmXTowdD0H5R7OVDgNWvHyiopgV3k7EfXKH3pdJUBfQU7MWKX0n9QZWQ?=
 =?us-ascii?Q?imPmDYfSQdtJ0U0JZ4ThrtORjiSDr76r3d2wDpCXZB1mXGDAIDfoOi5L+9NY?=
 =?us-ascii?Q?7tV2FAtVELLsNLR37Oj1zV9bnKsefoddiYx0DgaO2KkapE+Yo8cYftmZiBZe?=
 =?us-ascii?Q?+kRsXHfNXVipieAdd3cQBewkwjY0GM6HSfilmhvUwEk09b5J7IULhWsuochH?=
 =?us-ascii?Q?z7jNqhrKFwOooa/EryVEAyAFqVcyYmh3lliYaluA24aoFUu0UEgGZyjMMsAP?=
 =?us-ascii?Q?6BMIMFYXsssFhlTAfNdVhRBOvZs33E6cMd3t9uGQJ/nOMwN52L4j86zLgb28?=
 =?us-ascii?Q?TFidXt2hp6HN4iZmClNDZfjfBkzZwaB+YMO1dRItxX4daU+gDRysrz8pC9+g?=
 =?us-ascii?Q?e4gsJ/J3MI/q7JDAE36InjGAUkzHfbLrRHUFgKdVw/IfCbIvOhpTaYkbS3fz?=
 =?us-ascii?Q?XzWyJc9l1biLCnMa0aAygBmBQrkE910Q9o/b2w1JzAPWgblwZIEOLPvgGhhI?=
 =?us-ascii?Q?AXX/1wLy1KLHG2ue/HoSMOTCke1XZ9IvUC3KHpzfNygQyaZgThZ1bIz1gril?=
 =?us-ascii?Q?7P+O4ppXNXM6TJEsSAVMQhTmcWt/J6p/9YChdxkpMRdmtFW3ffN/MNCHTg73?=
 =?us-ascii?Q?absuTWERTQe9WH7ytz354kXS7ts+PXTuFfyTcSQ3tiNslHwG+Ikfb7v9aZGF?=
 =?us-ascii?Q?cFAyAG3o3mZ5uuLvBZ4aCoohVZnrjO4Ygw2UE3gLxT4EQAzZqpspgmljbdm/?=
 =?us-ascii?Q?CeozpXCFYWvr0HUJTp4SWJekse/paz/1yyDg5goqmYyEbGVeFwRtVXLguDz7?=
 =?us-ascii?Q?6pvFO+Xj5sLjN5msb27D8/z/3+M/jpRvcnmwB8eWuQYfyKDSBh5uqRzxDjRg?=
 =?us-ascii?Q?CEz9tUUKUIOs7Iitklci2yC1R09TFnwMZefyOSDf2pC26QENVnLN99tmGWXh?=
 =?us-ascii?Q?mYh/ku8jDmfBmB2dJ4V6v0zfD49Enw+Fah0wMC62End5aCtiYNb/coxpEAWs?=
 =?us-ascii?Q?7s53GEI3e5kYnYvt3zIbqubMFrQCqjsSG1kVPiDGdXsSvztcxdn1v0dZKBpd?=
 =?us-ascii?Q?5vLdIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb2c17f-5d23-440b-90c6-08dd1919c22d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 12:54:18.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFngsZOO5PNNTRfI/xwPQ7onlUE0Q7JdQGOGm3NKYd0oUbgu+FGm077ParZn5FaBssTrH3yPEjYK5q1YLvaEUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_045424_793850_3C984148 
X-CRM114-Status: GOOD (  11.89  )
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

Audio block control contains a set of registers some of them used for
DSP configuration.

Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those
registers in order to control the operations of the DSP (e.g for
start, reset, etc).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b42e6430123f..c8f9347d602c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1609,7 +1609,7 @@ sdma2: dma-controller@30e10000 {
 			};
 
 			audio_blk_ctrl: clock-controller@30e20000 {
-				compatible = "fsl,imx8mp-audio-blk-ctrl";
+				compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
 				reg = <0x30e20000 0x10000>;
 				#clock-cells = <1>;
 				#reset-cells = <1>;
@@ -2426,6 +2426,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
 			firmware-name = "imx/dsp/hifi4.bin";
 			memory-region = <&dsp_reserved>;
+			fsl,dsp-ctrl = <&audio_blk_ctrl>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1


