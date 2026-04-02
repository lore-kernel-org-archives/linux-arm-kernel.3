Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66912D3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFVV5a13pdGxDTiitNaeqM3PbeJr1QgeUSzLHnD+YdY=; b=jPebegDedMElUxEG/1iduCaSKz
	qX4kVMjfLefE34VxXTxwnhonfVWSiw5yBkCMnoiXhx0mbLTh7lPiuvWIjsGTifcUiRglOqdUKewoq
	AecIYpL9p+K6Wn8zgTwa+TFfnzRaJ9sj+fqsj8AxfZud+aOlGbmGLcCtnLT4d3lMXnQVvOFNNZhxV
	tp0rIi2x7GCRmf1pZVfge8BuOKDAfndzbqCA4ls78V+Mv3HCqHjYwobg6XcNe2Dr/n/oM8pfKADGg
	11XnyEDsLn7q29WuaHlYachmqEaHfO1ZzKdxi56T4CFE6g4Gd0en8kXOcPpBlfHbW2QVAjQCSpdyc
	FxhQabig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ezr-0000000HMUD-3l67;
	Thu, 02 Apr 2026 10:09:55 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ezo-0000000HMQX-3zF0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:09:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GffQnIC70uxUoAEX6pFT0m9XoQ118mXfGk32RGZadbMUXc2k3p2otkwtBg1sPe9lvfQJVTiW1epZRUmvNlQmwwhSrvHknN3RPtzrVQMj4B9Q9W7he07Hoefn0GZi00f3i6mC7UIf6b1+khQ1PJV0GCRlnpoPl98lbunzoTAaDjrrWUuvkL3GZqj4Y13FGodPh8TXFzZH8RWVtz6mCK8OrlJrFa+U4AacPUyso9araD4Wy+nc5ng1KW1hsus7Dage9/V/fX1fQ4iX5gZfecBOvelRTRP0Fe7FDt1khGBUDmKvtV6W39xwFELfvIq0IxTCRZ7Ql9qrtx1GXdNoFk2pwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFVV5a13pdGxDTiitNaeqM3PbeJr1QgeUSzLHnD+YdY=;
 b=FKIsRu2H5N5qcOhuBRRdYMb0AntpXJz5nQzHRp4BX7N0RvyK57aoE7MLCB+lFlwHl/yvtVp4MyA0zvJnihXbN/epztpeX2yVHwRKhA32o2X07JDsV/1NAT6HjF+TPseVspJIdwQNjSQn6rwYm8UptWAF0TTwAfrof4CPb+eDHCxNvJHf/R0606Z8SAtOuXKlLKZD+rDtAb3golhfD6mZWt6iqW41e+7Kla5v0fYvC5C9dvKX3IrxUezHtenkwb+tL/ImIKuYidAKcaW3gy/H9c0VtMdVqAohkSnZGeWcT9tZF98tRQDasmzAZXW5LlXkgE85+WOo5G3KOIBi5TkdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFVV5a13pdGxDTiitNaeqM3PbeJr1QgeUSzLHnD+YdY=;
 b=d3fBkoUiFlr6PnNXgu8F9YRDPZ4VcEF5s0M2hnZ4/YqOvp5Yl8CEljfzLRnyUsyg29olRr4eW/jLg/5a++Ey9kCsrTxdIt9A6UHBGdF2TEgAmWpIWLxIZ49JQceelNWVTY802GgRir+Uzbem4/D6Z4qcsUgjIcVKhdEQ57IsJgDvS9Tgi4Fy9IXcbej/QcXzPFtJZRsIKrervFwUIhrY3ZPjH3ApMLDXty0AXELuwxlgCZnbcPi65+0u0CscLqPZ9qs//pycxqLn2J0NsFDq4a73W63OdVP9UJis90CWCGJm3bYEolo888p4UVMON7lmC4HGycoBIXyriBSAhTKp5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV4PR04MB11944.eurprd04.prod.outlook.com
 (2603:10a6:150:2ec::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 10:09:48 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 10:09:48 +0000
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
Subject: [PATCH V2 5/8] arm64: dts: imx8mp-evk: Move power supply properties to Root Port node
Date: Thu,  2 Apr 2026 18:10:04 +0800
Message-Id: <20260402101007.208419-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402101007.208419-1-sherry.sun@nxp.com>
References: <20260402101007.208419-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GV4PR04MB11944:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acf11f8-3ab7-40ec-248f-08de909ff8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: zPB93QCoAbZ2u6RnlqvJHlOYWQI3SlExK5TcM3zi4+nFx1p4ouQm8CdHm2XFUzZZ3/zIpgdHDT1DrQ5XwRVr7Y/xynz/SmpzNwaePtLWmBU/43rwV3nB3gH4/HJeu+0ZK1sN2LqU+fbx7VbTeqzXWIQqgx7SjUnErHAvqYkEKfRN8UXL8CcKw2E/3suO6XTTG5vrfW6u/cl7TeqnbYhN875CbTs+wvuWnWwyWaBKAORSa7OAI/w87QlKuOLjkUsb2751z3BM8wHXuKku8fox38CnBHDnJk+X/OXTkn86Tka3pc9rGu5EiMemlyFVsz5qZvuFDBBh4iwqZ+pQtGvS8DbPnImbRq2MLeIwFPfLhP9IUgyce6QJZpuTuAPNtAFROQOfwNWYJFEee9tMbbQpn7pNO8kxC0B18fTRZPmA95Y1mimTb5QmAZlL6OIeeSd+Nb2Hy/bZ1varvCcQYTii6UWHVoYkNOcEEdnN4okhvra8Z2+40QMRH2rp14XtUElxXWU3c91E5N33gv9kb/wrX/z9mnHjZ6Th6Wfvfsm1NvLzDrR0I+bUFEkYHMJMA7XN+2QDOjPEkANonfrrNbGZipMMpw+zGohSgNr56ZIzpVpSafbjFlNIzOD7xmJzV/696QI5JdZFGoA7s/NSxSI16fhX0KvUPVoVw5q7EZBvKQgtmoXLhDQI2wEBIsuKO7IRrIye94HgeZToexUexD02N64xoscvnnF2+Z6H1wgfcBE5HZuyqLQpg22cVJeeFC4RVHsMsU/52724vngLkNxw74VBZMKjj6zmtOMGtKldsYfhq1IHrhf/Pz+EoYgPwUiD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?duOGLZ82ZXW5b9PeyFI97AMy48RwrYOR3KBZo7vxWPHLLVvVKR4yT5uRquLy?=
 =?us-ascii?Q?dX8HbmbtHBCb42J8JMUPRU+Ze835jvd7ofLDaEK+y6uy48c5x7ERGVKQgUw9?=
 =?us-ascii?Q?+lKHyO3/16SiqbNGoSrTBrjPxYGrKa/UUo+odYWRMhn6qYTtxxykSb4lyG8R?=
 =?us-ascii?Q?ykDRmsWi2b06Ea1Zl11UZ1DENcbWc+Tetbg0WmdTmC95ci+uzRZoX8Rbyy9e?=
 =?us-ascii?Q?RcWwFhKnOVaBrFgvWwbaRWEricdlxMUkebJ8qQlXrKNz+s9bFJM5LVvIx8fx?=
 =?us-ascii?Q?LS4ITQXgHhTyMVa9aWwCDLvyOPlgmgTKZkrhU62PH26S0Xkhpi7ZKMqEHJEo?=
 =?us-ascii?Q?DRtf+43zICOiPxv5oLoLi024BC4z5ZbeNO9zm6nApfzwjKf815jvv04uQVXy?=
 =?us-ascii?Q?CQb9g1TOnPwZ0uDHqfZffRlW4WEhURwGJLZ5ofVJ+FC8zX+iSEs+NxN/W6yr?=
 =?us-ascii?Q?Iy+jf+46I31RUVlMtAfQvaMM4lPwv/IlBg6fHVJBA66aJRal6JLbJZnamZdw?=
 =?us-ascii?Q?1dMJBe2SPveVNTOvoR7JSmbyYoPOkyx7XDs4fFaMraWsM0KM9TNVqEUrHt4r?=
 =?us-ascii?Q?GH3xdTyByH5dT2FHm2uYn21Hfq/sNjhIDDdYdou2wJM+1e66AsDo7pfX+KoR?=
 =?us-ascii?Q?ZVcywzGmH3ZvFDr9hpbh1tVtxYPRfkzpWrVr/NBJ8M+HVR0b4gq0Dn9Vx6J4?=
 =?us-ascii?Q?eBjcwE41AsaWhDFJEZtCCXLdPMX2Xa/x8ePGFP3mvMr2F/Bwnli3zRLPN/9X?=
 =?us-ascii?Q?mofyQCz81uOE/2GAdUVJsCAWP1eICTPz0Yt6gOjgETNcZ+4rYjIc+G5gjS/+?=
 =?us-ascii?Q?LiRZlWvPZ3VJRw7e8LsFDv7/kDOf8BPdb6PDvR0OrgEYx4c8UdYsdHyFbCq3?=
 =?us-ascii?Q?sufLpiIlUhrn2EkGsnJcCMlJ4pHw3pgvhkoN4y3y7cVhehxPVFJGKoMKWqFw?=
 =?us-ascii?Q?MqUnmZY2AMbfTVInqpczbpw8UFSwH/emkJXlljltL7qUzwzjpHYgjbt+FV69?=
 =?us-ascii?Q?ctHE1bl2G3DiLIfT82USxTOBQB/FmFPg4eZl8PUdwA7B2UW/sjSoT4aNDH6C?=
 =?us-ascii?Q?A0wzx9uyb3dId/VwXnnOTAe8HnRM2JXH1nUNUw6zEsrZsdhHGK3Ua5gVgnl8?=
 =?us-ascii?Q?CN2ocDNTiLZ849pH0vyF4ATl4SXFj90FfW72XV41aAjbQejpfcuySiLWtXJa?=
 =?us-ascii?Q?X44WZIyJtyrwn+2yIRph7Cb7YMM0EJUUzr/1Cke4qeVbB5EqDRqDOmkQ4CxY?=
 =?us-ascii?Q?SKyyoDrahzHnz8elX8NDgdLYUiujKlJkGp1ImPsADZKz3VMTbvWOAujScP7w?=
 =?us-ascii?Q?ZK6p0ySeau5QlUAHv9NZoPyB5jEr7vX86vzsJ+AJPn1clUSqdiyYw6DtCMw8?=
 =?us-ascii?Q?TqSAT8K2nbhI7M9fAZNpWNgQ5riotVWdqZNsGg8n5IuFNfJcbNPlb28BRw7L?=
 =?us-ascii?Q?YAMBCPHu3tjU0d0k5wXyocSP+JqfxdupwXwYnj1hAxFXzMCCQig9Mgso8ovc?=
 =?us-ascii?Q?EheGRHlvEbb8WKeP5idAstJRMiZO+0HLeGdcqniv4ZBt8eeNyYKU0N/k9QB7?=
 =?us-ascii?Q?KX8E/Y83ldptF9Fkx517xD7GPuEAZh6GqMXmv0ADaNuF5QtxTZvBawIhCTLR?=
 =?us-ascii?Q?NCWk8mdXRZJLn1Z5vECSB4BhEQHv7Eqb01irY1uVVfmo/gpxmOXQ6EqXFjyO?=
 =?us-ascii?Q?ArMSXsDce9aeVBnxXMB4GquqVncQzP8lfKywt7UWFViIzM8qIfWCJVyKGVin?=
 =?us-ascii?Q?QZhdQsDTIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acf11f8-3ab7-40ec-248f-08de909ff8a9
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:09:48.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/3SSik5H5jA+RiVAka7Hf5qk8e53oIIKHRcDPufYanyF3IFDoG2R/zZEeC0wmgK6+7Gp8FQZrN6gav4X3XhBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030952_992538_04B9056F 
X-CRM114-Status: GOOD (  11.80  )
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

Move the vpcie-supply and vpcie3v3aux-supply properties from the PCIe
controller node to the Root Port child node to support the new PCI
pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index a7f3acdc36d1..cb2b820cf3bc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -772,8 +772,6 @@ &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcie0>;
-	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
 	status = "disabled";
 };
@@ -786,6 +784,8 @@ &pcie0_ep {
 
 &pcie0_port0 {
 	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie0>;
+	vpcie3v3aux-supply = <&reg_pcie0>;
 };
 
 &pwm1 {
-- 
2.37.1


