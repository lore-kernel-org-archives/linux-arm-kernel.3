Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D388E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv2bLhxgCipDgAlqGw2meVcvTJZKTGG7+QdJlzmxrfA=; b=HHieoxGrE++Lrl/luvJKVNBXgc
	P89+FJxO3P5Br7KIxQw+vJPnxqPkn1j7eRq3IGHkrWSGcL9aCXtw89wHVWt7eAh4brwOaXAB7yNaq
	wlDbjwZV89BzfqLrugz/sULqsZlCnu921t6Vp9SQbjQkNKcZqXp0Vj4vHuE4fgT2lSffD7GdCIIg4
	giilACoSs1hreA/hKlMmBUVSbVoaaOGGTYPZOs3UFOeFUZTpg4aG3DBLhZP/X2H34p8HllFUBc9UC
	lsRlUczcioZZbKAm2n6UHFgfTJiajT6SbIkhb0ojOt/luKFKWzrLzQPxKZRn+2l5LV19Ph3cqSDNH
	NBSZqmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOA5x-00000000ylu-1DSr;
	Thu, 19 Dec 2024 06:33:13 +0000
Received: from mail-db8eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2614::609] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOA2m-00000000y9r-25y4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 06:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6dNccC3TJu8Vi/+x0vEAhXGby9/Ov8+K8XmIbMjrve2ItJiJke9KyfLFPezys9Pyu7xXpi5XZPmp8xXdcE0jb/H5BppIwhqPrIrOC6gkoeM+Xj2xh068NX16va69fgz1PH6EU1u0tUR03xFF1rzpEyCAHKr73InvWt3FobqFm7otzPVsOmi29Nje1pPOxolSt9onCZhjyetwPuLpHwFfNv5IGwFPcCRufrWwEtLe4df2TsB17+QtbKVcSn4lz5dIVTkzlbLHjHUe9rJoBJl3LleO/LVZMdMY/Q0p0QDBCzo4fN5HsJ03NaXOkpKGiMl4DJiUUmTAWb4qnfakarzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv2bLhxgCipDgAlqGw2meVcvTJZKTGG7+QdJlzmxrfA=;
 b=pv6yu9vjv8cIMbWJiGr40j7Z5/j1bnNBhGw3bkFFQmNJhiuTNvAW4ZKsZfFe+n6EklStLv3PbQ9i2kosHXmmCO4lgSvvy2EcASTKQ494yGhgHDLJGzdOTsskxno/tyVMeKV404mj7OjWU7b3Y2XrWm75MoKCtowbbLM+WiWAON1HOZ+A2WFdmPxgCv6NGzIPhaV6HOB5lw/4CxeyQuwqnloflo6wwlxKLHkrbpL7Co4B4DvF4ZUGIpVJ5/d1U3IkNJV8Z5beqZWcUxrs1wo013LYbUq6eSLYLJI7jfYhP7KRoTlIkj31bJcFWVBmJ1QmhmTSZRZXXXduUp8w6IUJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv2bLhxgCipDgAlqGw2meVcvTJZKTGG7+QdJlzmxrfA=;
 b=QYeYmeUwSaIuyjeYoixG8lY1B9wDaqTv8ZmHv3eBQObFI8AMqX9J/3oqvq8iw9M2N26PUYBMcdo48kpccBpoWMdkANrSNx1CbXapmF/86kfAWgQvLCHRWVcYe0fJ7ViDBHlLx6RgifHGzlP+NZDIEsw1EE+DNzBRZjvVM0eIfSBJJklgNJVaEC0NFeErlhY5Nr6YfcsNTkNqyMgykQeQ+smY5wJwTHwxXSIKB9W0X/3vKftJEdU+KZPIYzLG1veokZCD4EECCRQqqOb2HvD5B5GKYvjRIZsAnLaqUjdvS0dXTmluj8VW99wKWupu+8WeIfzE/ThxSX9tFA4k0lzCIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7966.eurprd04.prod.outlook.com (2603:10a6:102:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 06:29:53 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 06:29:53 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: imx95-19x19-evk: add ENETC 0 support
Date: Thu, 19 Dec 2024 14:13:40 +0800
Message-Id: <20241219061340.1633173-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219061340.1633173-1-wei.fang@nxp.com>
References: <20241219061340.1633173-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e5b0a2-6c64-4070-8df8-08dd1ff68c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f8TvW/PoYw+J38Sm/V0q29JrWvqNQ/FVv5qU94RVOlPK2fSyuQfRKSlZXLnh?=
 =?us-ascii?Q?Xs4nE1OamgZQGst9DR6mC0okl4fYmJ/sMdqWEut0SA0PeIF8bs78T8DGAQvM?=
 =?us-ascii?Q?Wi0TnbkGogMjw1Q7gOmn9cGmpxuyjlyBXD468Mg/1R9Ub6NkR41nEUZwJAZO?=
 =?us-ascii?Q?SNf0cV8OUU7X13r3PLoPjzkgzK+lWhKSYZ3mtZ1YZAok9BEdoleBldVfbbqL?=
 =?us-ascii?Q?GHikXOdfPRgrd3VnxH49XsOrVRliI8ltZGrjcJhatiJaZ0bwczFW/b2xp1hv?=
 =?us-ascii?Q?crgbVkLsMmTOTbWYsHtoBZEm0bxq9LK+sK3hRrGBQ3ctpZ47OeXw15t++0UW?=
 =?us-ascii?Q?8u9ChkXEEYP9/ire6q93/oTl0qHSehZ7TSgkHASmo9jDAcUaVmogVz01JYGA?=
 =?us-ascii?Q?YrYyRGQn4YNWBCl+njFjM9618yalMRdGvK1/MGS+1GTReL/+fF4Lqmdn3C/r?=
 =?us-ascii?Q?O4TjVxFsQ56J3PWesq+jpYGCqoRVGUx5bTQA0HwxeeeHwKPOkhILGB84rDbI?=
 =?us-ascii?Q?crZJ8E8OOpLj2gct56d04Xzg9XiI8Vg9OrHN0vJfThzW9Oo9WaspvcSZLtw/?=
 =?us-ascii?Q?SSUua4CFz1O/KZptD7xI7tMjpon+lzCH9DJJWnzyIVtpF/rf1Icv5r4urJ/c?=
 =?us-ascii?Q?koWv5ySH+akOBnsiXtk7jgMA4T0GCK78lSaHJuUWKxZ83TLQLeYcLNA8qytb?=
 =?us-ascii?Q?FXc3W95SAO2pJ4MhUAuf1kP9Mxb1/Vhhr8OMgCkjLL+27jqVVcFbi+TxYU/B?=
 =?us-ascii?Q?uqPmrPcmWMluJiIlEEsPLB49fFnvNN7AyO7iRld/JEGaq9vWdtEKaNae8QXQ?=
 =?us-ascii?Q?DevxJPi5K6EgCpSa0BTOhItQ+8c8lOQ4xyusEoqJb3zqW3msR/4I/YokpTZg?=
 =?us-ascii?Q?fu8achDRJOsfxFekNsl3i/sASCmjl0CI5u6bkwzf1AtiQHqzu3YTpkY8eXyN?=
 =?us-ascii?Q?aUipf1+L9OcTrloCnb72EQ4ISen2S9ebNMqM1gB205Z80IXtrRUUhRFMDIso?=
 =?us-ascii?Q?B3ovJ4Fs9HABdO6V/VvOolB1OK7fqhGnRxBo6CszzUvgG9YHAIbIx580kyRO?=
 =?us-ascii?Q?rAguMjRlHYjAToHfgMCPfB819GY16bQ73mHTZAZvhUIykLi+Oq4FFlQKRa3C?=
 =?us-ascii?Q?l+OQzZ+kDz/JjkBQDoF6AQ7xHIIPOM5Y9SpamdsNXiCwz+QcKoiG8mpnLKzk?=
 =?us-ascii?Q?I6yPH2Hx4YBalvgCb2kVE4evonuD0EteW2c0JNCg56BAa5LyRGJrc4boa1El?=
 =?us-ascii?Q?uoYkOGxvtFvmANVjB+F+qib7b2fwK5mEsOpMhH7L3CcE4XCrowdyMxtY2FAR?=
 =?us-ascii?Q?tQ0OK/pULLLUuQPII4sJmj654YObR2diHQNsia0ufuahwNbQLBEICFGBZxOX?=
 =?us-ascii?Q?GXD4FPJR4BNcxAxovNwkAbvtlBGrFHCv/U3O+3UaiC1idXKwrVV/VXa8b6W3?=
 =?us-ascii?Q?zLlpwN1A1uAJmvvn6bVofRr+AHUu8Tyo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJOwRGp3G5iMcDPSLi9ciJ1jiW4oalCA2pEbls5kPFU5bg7xDpMKCGXAToIu?=
 =?us-ascii?Q?teRpF1UNNIGQpMC49q8gQkHk2/ratpa7NI/9WYXS9Py01Lh4eG4lM7vlGy10?=
 =?us-ascii?Q?jJME4QP35hLvicZLPAUvuLRMUJ0zqMsm9MXv24hyxcRXC1Qz57P+VOHpPMNO?=
 =?us-ascii?Q?Mp83RPZNRjixBYxk7dX5sb5dKosn+5tio53vA6nji4YtyDQZfyRJ+0DvROOF?=
 =?us-ascii?Q?XbrzyoL556CDhWMmr41VMG3jpEHaXnbrQ9bcCbemIwGCoZKM3SijIGiO3b8X?=
 =?us-ascii?Q?RfZ6+aHQXOQZQcfZ3ki4SZ6w3C//rxsxmXf56JGEhp/T2qTCYz3vnbkGrzm1?=
 =?us-ascii?Q?PF9i13SpW9wFLCCrDQxv13xCg4MRtJd2rSkEtcaZ3jkVm8JLysFDYDkZt07C?=
 =?us-ascii?Q?tqaOhOUmnQoBtlMyUMzEsIs7SWQg8qHCNRJ3RYR1/I9sYMOc7pywB2VgTuDF?=
 =?us-ascii?Q?z5TwljttzUgHH0Wkl2bhEyrrZeVpQ+sWV02+dR5ZBZ827yUDPhN4IxNW/Xpq?=
 =?us-ascii?Q?3LNSO+ftRgj9kN39Gx6sUOzFShsQU1VdTbTBJJuqt0IVoo83/DDOZxuKnr0B?=
 =?us-ascii?Q?+H6aNdZ/JARC/dJpYQZ8xiukD3vBmL6f9d/2pkaRSR9Ij/Gh8+7vQEH3nVqB?=
 =?us-ascii?Q?IVT0YTVDXLf7G6JF5ohX0L1etqepbBvfP4A7lA6ec9WygvPmYyp1MWSNyJf0?=
 =?us-ascii?Q?zWoscTHiW4YCpPWyiy027pki7rljViLsBh7wTdhzV1wVm0DVpNOyTNb0wsVC?=
 =?us-ascii?Q?v7c5A8tMs09KTnaxvKMlJbVhLNOBdGeXQnJ2GHorgp2kF0dQ0VVl8wYmMbTt?=
 =?us-ascii?Q?xyd7WIvkGZeS7F13QqebdWPqIkq0ZBx+5ahFkmxo7doL7mi6JqnO3bdrb76H?=
 =?us-ascii?Q?FH3rrFSgpdgyiiGxs6EMaoxt/p5iNvApWfsSCpzZQDw+zqAcUW3xFLl5d5Yu?=
 =?us-ascii?Q?Pag/IdbD0EZTxFf2RSsWXLYrO4z2/dL88Ofl2R0JfXV2CmIhUXJrLjkuMm9F?=
 =?us-ascii?Q?SYn9iFD91kT4LkGYYnOt84bxzWK2AXpuKhM7WqWL8Uk3Bxkz++rI7jsT4Few?=
 =?us-ascii?Q?t/VIUivCK6zfsU6i2RNHYExlO8QlqiOdzS2ezFOZYTpYOalb2kk8VzTtIk+j?=
 =?us-ascii?Q?Riik30hPYjFZruzB7gAeeUAInwNX/6+6NMkSk4+urpgzD85i1FtNbbmSo8lE?=
 =?us-ascii?Q?1tVP+44qRnOtFcIAFDymgmS800sKyrqeKdqz1dEKUMFaC6AwYtdSIc523z4e?=
 =?us-ascii?Q?KwYfn9BDxtVkY2WQDXslVR43AWqKsQmyeTxV/B8Yjs7dsyLQYd8GLTGJaigL?=
 =?us-ascii?Q?1+Vha8Bp2bXMI51XwZA+HmZi94O038w5bfVsT35Hj3mLDtp4q+Dysf3lHO8x?=
 =?us-ascii?Q?1xRlaHZH8MVCRq9Nu4HY7YDNz11YBv2G2w5GeT/zGglBRr/v/42j7JMZDvKf?=
 =?us-ascii?Q?fwXAnQN/z3SnpG7aeMOWxqXFd0+UxkNEPm+/NflCkRV2HJfC/bvTIzX5WKmA?=
 =?us-ascii?Q?izds84Z4o6EW4XO2LiZXOG7yUI6hPOHP99aemOyYvbK493QgmRtHDZIQ+hlm?=
 =?us-ascii?Q?cwk8UN2lqb71l5uuro+GHPbXbJsZLkySiTmKVKGY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e5b0a2-6c64-4070-8df8-08dd1ff68c5f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 06:29:53.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AUN4FOt1c2sjRZWm8JHBmJPARUTbbz7WL1dr2QxfV8vBdxAfCQW5kQ1NfWqBfGPWd0g7bDlpVXzPY3uTPaJBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_222956_542515_5C3ABF29 
X-CRM114-Status: GOOD (  10.64  )
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

Add ENETC 0 (1G ethernet port) support for i.MX95-19x19-EVK board. In
addition, because all ENETC instances share MDIO bus, so enable EMDIO
at the same time.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6086cb7fa5a0..8bc066c3760c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -22,6 +22,7 @@ / {
 	compatible = "fsl,imx95-19x19-evk", "fsl,imx95";
 
 	aliases {
+		ethernet0 = &enetc_port0;
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
@@ -193,6 +194,14 @@ sound-wm8962 {
 	};
 };
 
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
 &flexspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi1>;
@@ -338,6 +347,25 @@ &mu7 {
 	status = "okay";
 };
 
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		reg = <1>;
+		realtek,clkout-disable;
+	};
+};
+
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -429,6 +457,30 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	pinctrl_emdio: emdiogrp{
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
+		>;
+	};
+
 	pinctrl_flexspi1: flexspi1grp {
 		fsl,pins = <
 			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B			0x3fe
-- 
2.34.1


