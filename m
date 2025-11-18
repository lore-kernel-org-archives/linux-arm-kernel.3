Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D50CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+jcw3Tyc9gePe7gvo331XmjG2XrQfENB6QdK2dI7V0=; b=19fW//6jGpQT/TyxNEq5Gtg3tw
	NMk4mT8+1vHH39Wysgil6kKoc72dQFrVMCoUm3R0m8bXypwZiKLZv0bTp0EcZboJG90yiums0rlVH
	QCl7xPukOE4QanezUZNbipo7qpJ6ajkQZYmQz8SAnnEmxSStPrJ0ja4N2mF8GYsNub2DUiNKgdSvx
	kgU4s0ObO4JmLzE/fS1AycPIZqMsgNE6N2deLqHw+BZNSJTbZOwXfvy8ovGVKC3zSHHwugL976jsu
	HG1+hXrhZ3E/LT4zPMOFrNg281DVLZ5JR8RHLrTq5XIgbAhfdwgrKF1VYNkPbNZloF7xwIe/COSxi
	wq5GwuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGKP-0000000HaDa-2jAN;
	Tue, 18 Nov 2025 07:40:41 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGKM-0000000HaBR-10Yj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS2yBxtU0MOw5h5CKfJCkwvIg/gFvZtNNMUFatI723I8iCQQYNZS5nh+JiBJoxTWZlAgbPXSTUHifqn+jNnrm7KsWT7ED+Jpp58/GJ9hzh5S/hOmctCIzpg6mGH5U7M1NGCxttMWZeCggcAWyNVFo2g0CJqscPAVVpR+rhaxelJHm6VWk1ePNDLkotzd6tmhkuZeWgIXb6jgRPND57R/NZG5JvDlUbJKd+DYXIt75yK/VedRALdDcUB3U6OY00aP17fQcTc5P7WqVgJEUA1EMJpm8ERe1pOW47ZEz4jhgdCgAwJwUeDqMwlXJZSusuR+EQZ33FT5l5ss9pRXMxOaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+jcw3Tyc9gePe7gvo331XmjG2XrQfENB6QdK2dI7V0=;
 b=dXgucw62VItgkeUol2VLURTy25jv/ci17/cEYSuZW1ThaRryPBYHS5R+noCmhvtSgEi7f8gH5o2HvcaPrIv3xOmAnEdZXJXaXEKmx4YBPAIkcu1urzjZKDZ0ExXdRJBWlFtZpQAheu+RrJxNL9xEiACK9V6Htkd+IC+WWxNeYBkKnf2FcrJUreKIWAMALlJCF+OjdfwTKC/IPCP6uCimxquA4kCoj7ZBYWIZzVtakSdTO5jSxRmHUzFfldKQlRDIaLosNKgvfdQOXrldbHRrjITfRPcfLzoiprZtW0TOu3iw8UdPt0C3mGaLL4P58cVKtDj5aSQIFKKr+jn067mWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+jcw3Tyc9gePe7gvo331XmjG2XrQfENB6QdK2dI7V0=;
 b=nKS1WJJQg6ZhqzyyQaU50FDfnh2WZptK2hGVBtkOmizJkuTNi8Ot7CfNOIUDKXVl2oDl9ZFaCjt2O+l5Urg20hoGLNb6LKFhrKa9RNj3AKhByrVbljh5wxY/cmtG1OOqnEicBoft5u/As5iJMFMb0kI6xy2szxWu5zNWDbYZfSiKD/NkW4y+Dwz1vEGIb0QKgf9Xi3ywhu4PdbjCGKTDsNfJ482AGE7Mr/rOlVjXQK4oqLY1we+8uhdehF7WPU7OQsgvjl/fr3MyUyljbUxT7N+EAwa36kJxHv3g+UZpfaMRRaO+zJRCSB6rpyvh7/TKZslbgoKdRnKIHe127BJOQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 07:40:34 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:40:34 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	hongxing.zhu@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx95: fix hsio_blk_ctl reg map
Date: Tue, 18 Nov 2025 15:40:55 +0800
Message-Id: <20251118074055.2523766-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118074055.2523766-1-xu.yang_2@nxp.com>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f04a42-2353-4297-37da-08de2675c230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CpfGc31EQGrJqLjtN3x3e4L5tqr/WSojqdChEu6TeeSnvKG7sDHFd2yHY1Js?=
 =?us-ascii?Q?m2foqZ+UjuD9AEZICWaY0Zz70+JflVBdd1m1TLf87HDEVcQlYCj8U3PhfG53?=
 =?us-ascii?Q?oe7JjSe8XGFKj/dkmnj7KKKUBeczfa7xJkZpTYF4Fto2DtCCIzeJNRcQtO+u?=
 =?us-ascii?Q?3VxH5qXEZPPupcYtWVALrRQuP7uW8zOjraNhGJAP8WPQR02bz4KL9chOAbLa?=
 =?us-ascii?Q?a12mgJJ29PjYbWGQuBN48E5OM6eIgy8NDHi7S1Vz+9iEBFulDmDzW6LPKtIP?=
 =?us-ascii?Q?kr/kkOjraK+BXkgHbI5YGnVRiw8sDosOA0L9uHytC3ORLcLUyTkF41VNBOmn?=
 =?us-ascii?Q?LTSzkLujO9DIjwUuvRbQFYUNxRRgSI+QiogIagMZK8mnnrzRqypkuFSQXpJN?=
 =?us-ascii?Q?1pb11yfSQwuOnZOr/qbg9OnTR3IQDCspqQLix3xEMZRZfrZpKejdz9isV/6c?=
 =?us-ascii?Q?c7EPfLNaKclKwfrx3pYnJMA0SuW8s4Q9n84Y1v/HZqaXzhGEOYjTH/KOkxrs?=
 =?us-ascii?Q?aiLo+/lP+UD0X9JsLF4GdIzX3OYj7xbDBUHSJKMDfomEmNENH9mZglOErdW+?=
 =?us-ascii?Q?+8Eer1RpuYdoRWd+yt2PYrkI7VLq9PrEjfuUl+71af4GghpEGzX7auFzVXX1?=
 =?us-ascii?Q?2vzhn4NJuiFVr0/lUJtpVrjP96wZwSIqOsIOV9FCEbhejAN7v9AV/wv+Mcvw?=
 =?us-ascii?Q?fMXYLZH1ZQPxHNOYBmaATqvMhjVm3rnXwgdjBeuQ6BHzu0up8ibaLHmZ8zBB?=
 =?us-ascii?Q?fJmapCe4oLpr23t/K4+Kffude7UzD65Y6VV7YV/uDpYj2HR4By6DIRIpb6Tm?=
 =?us-ascii?Q?b1h2iWjnFgI4IZWP+Vb22cAChUCZprPDCdlbBs8e8Lrz9K+zo3ztfbA/7B8p?=
 =?us-ascii?Q?JFQBHfGQ5jVNkVxUsAsCUwFs88qAmpu/5gqotju2UCz/vDWW1xADOYz0jbj/?=
 =?us-ascii?Q?oRxXsrcpBs+947jafZvzCpOfTVIE81Jb6jVO1zQqMep+OqrpbWuRSnBypzqh?=
 =?us-ascii?Q?Q7Qsim7lNZJ/mHUXe6F2NopemSaTrZYG2UKt6Ae1wgCINeR2b+NpoOhGbENi?=
 =?us-ascii?Q?2RsDoVmIQlauwnXE9SEeR1MYj7IQJ9q5Pz9kBu3sJ78y99DCSariwFD1x+xq?=
 =?us-ascii?Q?zKAp33HtEn1NTkIY+br06riB8Mh6bQ4xaF00LxCiESFx5guEGlsuQAqlHeNV?=
 =?us-ascii?Q?zo0YdQ55s1/NmffF1ccfw1QG62lQWHFjuF/geJQepvn1eZSr5o8FiexAKRUq?=
 =?us-ascii?Q?yzvYd+o4ewWlkIF38NciDPcfWXmQ0KuZVwwx0VkbXR86Bvdl+utAXAt5WnqL?=
 =?us-ascii?Q?AIOHgikFzS1Pv3Dkn0OseqlJ3YKBB+0WohDJXCCQd4f+F7zLP0sEgIkWr4Ak?=
 =?us-ascii?Q?yQW0/iX/BvXZlflCqCFXIotKQOdR2SW6qPayApthE+kEQ0OaqQMT8Ak4lDY8?=
 =?us-ascii?Q?osvw4eNhC2PgJApsNBL8+cYcTHl8BsVHRScAWDgyomgmb+eZR/XZBimmbGhQ?=
 =?us-ascii?Q?WszT5LOWkwRqnALsMliFaKZaH5y10j8n9WB0ph33RyiQhUJ5iohPYa3l9w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pTMVH0mlWYtThhmfJicpTSNcXib1xLHZxGZmKQLMOpBCqaOqEGrSvKlmgq3o?=
 =?us-ascii?Q?Gwfz1RruMR4nGde/+BO3Nc+qQg2BCiDAtEvRTj1bV6kd4cLxGJG9yYYuEMBM?=
 =?us-ascii?Q?KSV5R5OBm2DN1f13FuqRWdE15vLa0mFwA9yrVZd0fRaQ1W4RjFsjnZok3cYD?=
 =?us-ascii?Q?0g930/SsRRdEqjB2CrJrI3os8WdIg1HJm4yvoRck2QW+7+/kBH5noybp3Z0n?=
 =?us-ascii?Q?f892V78AVzHL5WRHslbmqNV5ThMuGy9E+VXsgu1ItB75Jc17wn39RuAuPuSr?=
 =?us-ascii?Q?47CX5FiRsqZLelKDZIDPKcEh0dJIAJXK0DMJ+0Jz0LonFMwLunfQfUH1j8kU?=
 =?us-ascii?Q?WRPlDDMS9s8K1ugPII/KtAMOdlWhm1B+SgP6N+UEUIbLdIIZ5V2QFscOzZUb?=
 =?us-ascii?Q?D694G5h/lLXyNKrnxP5xl8lYTwHFv61bPk8P5IwxR5wlLfvkYSiQ7cFOD4o/?=
 =?us-ascii?Q?0xcGXRi3l1yggqlf80IaSBYUacyoKZq5Txp9+5UtA6NXt2hM3FEDf6el/RdH?=
 =?us-ascii?Q?vRwFnW/1b1dDUY868OXtboUoOWD+CCa5EmN5IrfN0Y8uaRYqm9BB2DR0Hk0X?=
 =?us-ascii?Q?tosk0t6Jj5KxN97PatUdRtiPkCwMfGnmOhe4NCaNo5+7pGNOwzGajwtqv4v5?=
 =?us-ascii?Q?K2iNFny/fHf6f03UZlLmw96s1TSBCM8UW6NpVGM2dc1GLfU5wKEtzL8Qs73J?=
 =?us-ascii?Q?e0OXt5iVcK7ZtB0y8QyTWD+0VsQZRJD7HiNXZWZlrD958/Tv5Vb2mTGISN9D?=
 =?us-ascii?Q?O7OHFXc60NIZM5RBGgvu/pgFOrCyFfqxSGQhK02LGc2ouLD7yEk/Clj+CJTK?=
 =?us-ascii?Q?GaJklE66R9IfRdoSzCoENYtiMkfteVooWRtKgY0g6QSrXDSmPuXUvZQw/Qz8?=
 =?us-ascii?Q?WAlzaxTIzsb9yLo8K0mYUoljC/TWij5DtcJIGylzyXYcCDo4NozlvOlcCLP1?=
 =?us-ascii?Q?rSlEZnhjmwPhKsOXIiEvGTg74xcdlByVW57Dy5k23x6sz4koFN/O5A8sITLB?=
 =?us-ascii?Q?e57H4lG7ff6PU5pm1kLmsdxgqW31+Fk5oOCDgtBQUC0e92GeRuw4WNeTO0TU?=
 =?us-ascii?Q?djjPZUObZnj8VGZHoFqzMJ0KJ9quOuXXtrNxOqNOyfjNRBpyKR7gU2638ZyG?=
 =?us-ascii?Q?6DihHI+vV8reokp3EHeHcf5/KV7deVcS4KvqzL5KVBMfffBQd1UommXlyTCN?=
 =?us-ascii?Q?sGl2eGtXuBm+xZBlfhWsJ+7gVsMjzvxKcF1drZvrm8oofJZs58+WIGkAMkdZ?=
 =?us-ascii?Q?yT5I1IzScgM0pUu51eHtrLEpHFKQ5IvmcEnxa3lHgWWWbkdQCqCXa/q3Qtym?=
 =?us-ascii?Q?MOaVhR8jczcpDl2tM8xR9bdDfQ1nvY1cqD5xKWiGJqfmm5G3y+CEYXjMTrhH?=
 =?us-ascii?Q?wHFsAlYymAog0+Z4yWXPXD0DOuEPioEga505sC5tQKaJaiDecZY4kW7Ci3hk?=
 =?us-ascii?Q?SCDEq4QOIWRUWnVZz9Q5QywN54zSPGGvfZ7Z4MSMJUMgYXgZeEZnt81lCP7n?=
 =?us-ascii?Q?SRtJL0ncDHUQ7ubqjLjxhTQRkjTSEKjsAAIcMKOCbQKB4vmHnb/rYcfba+mg?=
 =?us-ascii?Q?Uh//WuL0oK1zx44sgOf5D5uGNJ8h0fJ/mb6Z6ALh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f04a42-2353-4297-37da-08de2675c230
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:40:34.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MfcnXtORz9kmGwz8koDGXHpWyxCvnbG4n/bzrfY+H9Foc1bjpkIRGUiRVW/mveJ/6VzwnwQax0rn9B1jXwsrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_234038_693060_ABC48B1E 
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

The HSIO block control register map should be 0x4c010000~0x4c01FFFF.
Correct the start address and set length to 0x100 for available
registers.

Fixes: 3c8d7b5d2bed ("arm64: dts: imx95: add ref clock for pcie nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1292677cbe4e..21c9df445be0 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1774,9 +1774,9 @@ usb3_dwc3: usb@4c100000 {
 			};
 		};
 
-		hsio_blk_ctl: syscon@4c0100c0 {
+		hsio_blk_ctl: syscon@4c010000 {
 			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
-			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			reg = <0x0 0x4c010000 0x0 0x100>;
 			#clock-cells = <1>;
 			clocks = <&clk_sys100m>;
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
@@ -1844,7 +1844,7 @@ pcie0: pcie@4c300000 {
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
-				 <&hsio_blk_ctl 0>;
+				 <&hsio_blk_ctl IMX95_CLK_HSIOMIX_PCIE_CLK_GATE>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
 			assigned-clocks = <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 					  <&scmi_clk IMX95_CLK_HSIOPLL>,
@@ -1919,7 +1919,7 @@ pcie1: pcie@4c380000 {
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
-				 <&hsio_blk_ctl 0>;
+				 <&hsio_blk_ctl IMX95_CLK_HSIOMIX_PCIE_CLK_GATE>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
 			assigned-clocks = <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 					  <&scmi_clk IMX95_CLK_HSIOPLL>,
-- 
2.34.1


