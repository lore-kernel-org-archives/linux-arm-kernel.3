Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB62103A9A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSrvo/kDttaG782JFkAC1Ut0fksBvqP5kEvSYwWrV+0=; b=kLh2QizySkXyrtd9jrP6t/9JJU
	RcKWX9yGAVAsqKsc7iShR/21O6RwlnmX4wAG9OdWq225DQ+SSUVTW1ES1LJIM8NSSLBkZGbFCNZz1
	ZljL9M0A1jt8pxLdHmFidDsjePj4HA05xv2E4RYkb3nMdoV0Ctbhvwn1vDLbcDAfyZOtHrNijO3LZ
	lTF0Hc8v62z62cpBrgMB2qSCkQ24KWagavoX53rmeS7KfPtNf2YyANcc8srIicmVY5z85sSibvVS+
	3UpL/HiN7WvrsKlO+nv6Jv3/SpZfTLTpypHsLmL1k+nX0R8m+1kYZxMmglVRb1qpawnuvu8f1qo+j
	v8oVC+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LzD-00000003CIT-14wV;
	Wed, 25 Mar 2026 11:01:19 +0000
Received: from mail-norwayeastazon11013034.outbound.protection.outlook.com ([40.107.159.34] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Lz8-00000003CGu-28Wk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utJHbE1aijGbFk5EpflyMf3O1EcuOEpFlWxn8voya9mJ0ClMpRLIZ2YGd/z37N8bcZTUGMmjyI4EHQKRUPS6Scngqzcf0TQMPuoqtNnd5G8GlPaxBR3S9K3e+7e/Z+Yo6p6TsjjoHavR2+3Xfy564qAnT5I3LRuzwprtncXxeCQP1/YK1lk5lgINTfgKQA5KEHB7Q2kF4qNddb57uFtXIgG9QmQnC6TI/y5gLvoQXHIOzQB64x7kCNnb4LxA5YHKzGiLdEbHtK8doY0k/QcUVxg4fn5mVhgPGozKCJWypbRVD8fhgldHV8uinkKRRpa9sPockqUmBok7cxGRZLZi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSrvo/kDttaG782JFkAC1Ut0fksBvqP5kEvSYwWrV+0=;
 b=Ihg26dVIfYQI5M7cMgEitIZo2lVxXnm1pks3F5Lczu8G8pM93/mGCHw52E6iA7apTFmlDlsc97J5GS3DxlRDf8yVsV6HNZvF8TI5uAeuH5NueK1HDSZMb2sgrnyRkqy+TPhTOOzZf/88GEYp7RveheEbBpTlNCOBr24Dbxb69IpdRo0vGUvLxwhEIz9KGPIlhK4aoH/HDyXoN4R0dMWsrhjfPefz400K+53Eso+fDDYR+SrESeJyHd8zyB1KxXiMtpCW1ceGRKVfabGHnXIZL2jPYmdGe9C0sqWMuxQDjQh20WQp1+CYvCJgnVKA1mEeWZxPZh0QLe8p+LYpwhNlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSrvo/kDttaG782JFkAC1Ut0fksBvqP5kEvSYwWrV+0=;
 b=IY+xwwtxE/RTEyJbqPE0uuiy6ofAaJKai7IxS2nUfaXaCQMJ3WP2aPjZ5x6bzVseSNRc1gTpfQ3ONNyVlqwNRvL5IM6gT37aSy48aQQR0DILfnOw0ozTP9X2qu70NIYZtvTC7aoHEuLa3GNXKfezEZyI4gSBzUsyAD1BfgLsNfzt3gwqdmrqcpVj6Yw3ES4ZIkKwqInNQLnLxXu+sjmG3KmPRHpwVpM9XGcKSE4lmgAb7h647U7tHVzymI8dfbz2qjKJxBCS0Du9WZcIu5WKBmQhdyzfkECAsJSlj5v2E8VX76P1IWGdyXl3b+G/JLSBagPYQRFyUS/idNhyDLw5iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV2PR04MB11096.eurprd04.prod.outlook.com
 (2603:10a6:150:27b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:01:06 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:01:06 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] arm: dts: imx6qdl-sabresd: Move power supply property to Root Port node
Date: Wed, 25 Mar 2026 19:00:52 +0800
Message-Id: <20260325110058.2854742-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260325110058.2854742-1-sherry.sun@nxp.com>
References: <20260325110058.2854742-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GV2PR04MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: bf983148-d13e-4436-fbb2-08de8a5dc480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|52116014|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: uSNC5UwuZgmWUJs262BonAfvp0xvrEtZ8162+vRVJ3rTB6Fx9gvOdbYCPlQZz4GQOE/9DWpuSPb9f8jN3V5PjvORuK5qUjTUn9tPNpmrfO1oEc65X9gwjXMHm17exQLD4fYMFGiUrG9vITrUKSafOu8g3ZquZ0eXSLMuRHgVIkGIlB9xfqCA67rhsKJ5aVw0Lu5LwCbyU9gCQl02tgoru6qfAZDIL1SaWzEHC8bjWKoysTeI6S/NbaWASEu1WuELvupARKS9lB9WNdDIYM2+BITr2W2gM9qst1ZBOdra3/qlOAcfNEzqYIXTJff+8EHBMLFMtN+k9neATzzMUXZhUSZdKtGdq9+8bB/ujmcSs0xbr2FSQ8Pd3PhfMqtvXDRTt8kXV2jKvRX/7UguD2D+7JsXSupCEP2hwEH/0W55asw9T6BXmXuP+gmMWHGwC5JexJg7Dw53tmxIl0X9qfsjdsjdsWaT85GHDd0XuXQMmbWp8Y8dWxbZVWj8jihnsOh1nC18wkY0doEtqJ+lEFFyKX56Wag5PFJgjBIMKYSjcrPmHhZBihF1BVVP3peUaeSD+SEpAJujqg3Cin1abJWOLLue5WHeZaqc0w7E3Oe5/0G21sGqHX0CSKoFraUfl05K19aHLn0VpZ/G3umWb2G8QhR3qfD++pvDL4ev4gdTzSQPLpGRyDfkrup3wW9M9E3J+pGIxzb0IYMiF2YFqozVkqYlOiU+gbo2K3XDbYZdZ5fg+eJ+Vt4GN7tWCSuzVrg+8w4Nep7mj5pi3TQ/MQCB5WKq4KTOuEd9EJopNmSGBlDMYMZtYja/b6pthPxPRuKH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(52116014)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m4tRr8AhcZIXoSsbgG/92XO2x+47xwxM1xuY2aF1U+OqyiE32tGN2i/5BY77?=
 =?us-ascii?Q?Qeo83bcHGSVl57VOQlsztk+ioVBq7cVQYC76wkj5B6vn/YUw5H3wh6qpnqru?=
 =?us-ascii?Q?zX7Wjm1y6U8apVhHOvBbJTTWfYh13hp/rQVJRBqkgd+B8tsiA9GYP95SiGDD?=
 =?us-ascii?Q?WiHIMH/qE+gl2yeMcTYjySTJYd/fCYqu7qdjwHPAF5CVixkLUvVJxnp/qOqg?=
 =?us-ascii?Q?lzkjWFs61C/L1Fz9yGOJfFm73wJCf5VxCEkq1qsKCEyLwpFwmc2cwbP/XfB5?=
 =?us-ascii?Q?VE0bpxhOAPStvzdicwKdcOdGqpfXY/hs4YA2wTRyud/MONg2svR2AKu+UVY8?=
 =?us-ascii?Q?qQxzpJp1O7uObgeWrGvSELeQ58ID2Bh+UmNDvz23EnsejcWTUmYNK+1YG9Bs?=
 =?us-ascii?Q?wOaADhNEYkzTB9MwasK439QY9wIKxetwXifQG+3J4WATFJiM5e4V5GVGVOYI?=
 =?us-ascii?Q?xxOMEnZND463v7qMK7mtNhPj6Qm6GSVo8K0PRkryF61nv37FW393z2HIfsBc?=
 =?us-ascii?Q?vN1OxzIRkm+TX6AJBGhdLKkAOCDrHhJrv5QLO1CxpKong4pbJYdEWEl3dbhA?=
 =?us-ascii?Q?8y8Lbfhq1ZqdIa5hAraLyYBBQNlw1xDpD75j5PGz2+q2rMJDOYnNWVgLD1Ig?=
 =?us-ascii?Q?IVTs2bzqP8t+JTs1QtlJk97wtWyznDSkgr2IrFQ4cjPmJ3+FHkdcgBZuVhuE?=
 =?us-ascii?Q?lCXMu90EG6ZMw/xodhbZ/cr+Bkmxv9y3/68O4BxC8Ax4A6IGiPV43E0wn9e0?=
 =?us-ascii?Q?w9tz+GoOjkBO4YG+NV6Br8eX3hlIILBLx7ICyepJIFzTEgbu9yUa68+I9WQS?=
 =?us-ascii?Q?W4XxxKV7VXbVmW7vQ6OIQNhceResqKa40J71MelYM5UFgNl0JO72JtbMfh04?=
 =?us-ascii?Q?sD5VTvfGkeuyNP3OuIwSWHhQQ12NLX+D7nVv9PFcFgXFZuNOy1UE1aPAWBBq?=
 =?us-ascii?Q?Z4ZMlRYB3d7N2Z7ze6+ddHzIsM3T2JDgE1o7stwmPneDxnLUV/8jOLP78uWb?=
 =?us-ascii?Q?YBZliptQc/emGYgkwLOYwn7XD2mVvpjOskaiN7rwNeyi1KhLrVGVrWC+SXhY?=
 =?us-ascii?Q?QTQDTU0gTO85SkxVPn6INFI/Rptva3YfSvLmaRsIwBk9nuArQrVQSyjQfU/X?=
 =?us-ascii?Q?m3Kgc0+T3WszZVanad4CqEe+zm5sgUdwmUvdn4WtdNzqzLjOMWxHU+JDDIoW?=
 =?us-ascii?Q?IKP64AnMupCezbyLom2S89ZdZHaA/o0+BCEDsQi7ieLS7q9TP/2emhhpbCK5?=
 =?us-ascii?Q?XksGPnHsFR2OVREW87kKW0D01quERVy3vyrbcuQE0GOg1q4jWUyST04ftzoj?=
 =?us-ascii?Q?I5R55U6lCh3YWDKTPQ+htHAbnDC8Em369dst8vvnFBXrQvkvjx2e51nl7CRJ?=
 =?us-ascii?Q?R9JpDi6WQHHEMMgJAhjlXcenQ0iCdlV2PtS7PqXu0hnZcTPhFyc3p5/FjdgI?=
 =?us-ascii?Q?pUJiErS27t+u/mqIMqRBV4DuJb56VgZPusfO0SoIIJXHvpgM0LeU44ppo0Th?=
 =?us-ascii?Q?YoaGzRr8BxfjBi2df4tibRb/DwPGlsuC8jVBL+/VSJrxugUhwfP4zjj6N5TN?=
 =?us-ascii?Q?C6tecwrao4BiXRWFJhK0InNlGOreYnTtea78xUmhK05hwCteBWknogXSNlpF?=
 =?us-ascii?Q?QAXIEldpQ/Tc/x/3Rzlu3rBhWjNKez5dL54cLzXmRyZHYlobOGlE6U0ntTTb?=
 =?us-ascii?Q?KyS58juR5Rw/vCorCCqoo1qMUyoQbIkWiCZjYXcTQPCrU9sYszfLutosNklx?=
 =?us-ascii?Q?2EshU0nk0A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf983148-d13e-4436-fbb2-08de8a5dc480
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:01:06.1322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P22xK3PliKrH1jOoei8LSxLN+4luVN0Qp2oQDIBZ04MRYDTXAyQKIwdNu7tZ/5dmbZpiRVca64oNWTkQ5KyasQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040114_545958_094B5650 
X-CRM114-Status: GOOD (  12.22  )
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

Move the vpcie-supply property from the PCIe controller node to the Root
Port child node to support the new PCI pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index fe9046c03ddd..e52205d7c487 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -756,12 +756,12 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
 &pcie_port0 {
 	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie>;
 };
 
 &pwm1 {
-- 
2.37.1


