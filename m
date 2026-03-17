Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CECFB5EA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0E8FGT6wial+KqgDhgQemLnMUarmjBV3/9a2bzRfiFM=; b=wxStA0jNaVU6Ceoyfbz6ttXwwy
	KCd/YVM58yOh5nDm7gK6mNsCsvn6Ys9Wll4OV1MCXiTkvOxl6UuR5jlIWUW1LfHIZdOFZPDe8U6Iz
	vVvJsDzA63cDmXStjEXASxJ4u4LuFUNLPOQlqG84TKxvuJXp6SJIhrP95HpGPESf/HXLj7IhTwh0a
	ZqmhMRJbupUaodG4RiU7SIoRvfUGhTigjdySNHlvVo99GUg4sv9Kj99PpR7IQQvbF+QhZjHPMB39J
	tCAA1732jj6kYcRx7mYz8SnPbxPfxpTBI/ItCDqp3PAHAYQPDKtSgDA/sSZSJDIHnOa6MD92Wngv9
	ic754Auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Knq-00000005Hgj-1epa;
	Tue, 17 Mar 2026 03:09:06 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kno-00000005Hfv-2d6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeGgeWGUG2OdVMdzx6Sr7pNPKpsIs29PRB0rMKtquORsIAEcsbRkBGdgFAj9/HCIj6pab8UL6TCpxT2L7w8ah0EDzz1v0Ig3VjggFJncTG8a0P6J0Gl59WPQxLMtQ3VhN8WS0RrvkZStupDVn2Q3wZb3ACAZKL33697aaG9LOUr2awp2Bdk7hx3L45t5ej9KXGLL3CqUEOnU8Z79UjEWQHY2hrDHdTT2tCYzg8LaiOV0h1K/SHAIstdTixgYDV1cSWJvXt2XMYLKQEeEjsMthwUJRL6pHX5KPOvhqQ43RIX5H0AvKtP6ZvRF8OyY5V3WctZCZKqAKSMtOBvYtP3/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E8FGT6wial+KqgDhgQemLnMUarmjBV3/9a2bzRfiFM=;
 b=QWmoTswBIwmxdp1QYqtwmtr/lISZR+CClHqVf30AGi7ZntZJBVZAw1DIH7GV7NjioTBMRyGzQUfExKIYy7VWZez2rydAvF1PuMxb3xKkKuybLZs+1SQAWahekJ2Jyix3qwPSi9xV82W6a/TIKNrQ33lBRN5ZA1eZPhISAxHJltMQQH9K/4cDoHkTL2jsbR6zxbwRLh3s4zVAROjAIHRHOhbx/Kq9wLdxU0Y9njo0sZCRpj2aoOP0SaDT4m7CEg6CcuLbKrVS3z/SYFJDpoRxBKRhNfrT255vLrowbKB3npPIVDgqqilivuiR8Ue72Z0gJoMgk87hl/c73QjXYp7gFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E8FGT6wial+KqgDhgQemLnMUarmjBV3/9a2bzRfiFM=;
 b=MQRUPyindr1b8FMR10KF+m6ODMHkUHFTpJPV+RPPh1Oh960daZuZBRbzPRF11TTxD44ytLQxfRhclGBFSydozgS3tq4Vxrfbm/vGD28QE4u5gSQ8lyjntDSfgDtWA1MGP3dogZMFqrZ9a2Fpqcfnx2IQLBH8EsmqcSA5+5UjSGD5oYcQTfJZO6qM9gdIiYdJYgTWvWEMz5o3Mw9Y8od7yKG603ArMaa9e/ZriuS5KD2FzyZ8lw54gPOuiLZFmKYUMma0ucq6td+R01hProPjF60rxXOvT72Em6qaSGFJFd1USV9FHmPKJJkY5uwlWG5+f6YwYLPuqWkvQvwVMmLRPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11029.eurprd04.prod.outlook.com
 (2603:10a6:10:590::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 03:08:43 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 03:08:58 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
Date: Tue, 17 Mar 2026 11:10:24 +0800
Message-Id: <20260317031024.444157-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DU4PR04MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: 065470c4-081d-4adb-00de-08de83d287f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|1800799024|376014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: fQNan0pv4EkcQh+bGWE5yxOMCiqvcaZrbXExevkQ+qzNZ5P9cjuE9zBAKTXYfzeyTSzoWXHtnMm8kuR1++1pDbNAkJAeC4aBzekzwJVp6Su7ZS6F2mRRa6KFO0jGJvpPpX7viKmm8uaWeH1gGSm3aSn9njR+S1GO22zEeTQWFtXw7Dxvea5j0SR78szLK1Q1XbpvCKUT08htDX4N9qybbe5+dhYrNGKrRL7vvZagObHFeciCEx8C8h9RBkb+CRY883t0GEoTVjOn74eWGmLyi2qFmJgV3o+8EvCfbNpMl/CKOMClT/QsbIK4NNqhCNNq4EjAQkSU/MEBcrMBeyH0xMi0T5eQ0mAnrI6me6PkO1v24NJkU6MpXGpPp/RMENccHG2W+kWog26IlEuPI3wLjy0SasT9yHW7jyQ8lTEjLu4LcZso95QitxO0bIR5EIDt7U0zLtiwJqFisJKEJ5CqluQ5CSpBt/IdhavW5I05BDf1KI1EfwG5bvf/qOp2sS5KQsqK1m5mC5NwMUfU9dG+65x5oWkkGLyrk2VPm90dNC8My4cA02+gQAo90ZfCpMeA7lRdKOvGY4Xl0RZTubQdDVMXu4tS1kO2OzEIF5Fct4vPhy46v7qmHUUVZkWG/hMMpU4kJ6vwK7wMHFa09AS5ZPJtUILfJnds4gb6gDYeLqsqufa+fxGLrsKUBGUqGzpz8NVB95yJnDIuSbnWLvUFT0BC1EC/Tc2JCzXSwLiYeNlyds1vTi/zusbvnPGfKlKCp5tz0Z4XIgg5yqPk/XvEuiyq1IkzMoFPAtKwxvKnp9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hTYF8TECJNEHExc69jlpRwFQF1Mm3R/GEHxpcpXRi08yURRWP/37nbpkio9G?=
 =?us-ascii?Q?KhV63D5N5TBOILAu+kph2khaMk9PfvAmrAbfUEd1Sr5SQYOKYMRQ1wWJl9ml?=
 =?us-ascii?Q?RzbgRlYkwnsw6ebXN9lDQF7W30+dwLRBfANE7Z4LVXPcTnGWDY0ueOsrbuvM?=
 =?us-ascii?Q?/SqF0M0/WPvIojI3xqdqDZdjh8ADt7iw434WYVLV2jvWV4pshDFinNcfU1sT?=
 =?us-ascii?Q?fKsC9WhUUxikYZ9mjeliwH0TkoXVdV7FNHjy98RfhL428K62zE7G0IbZIfnh?=
 =?us-ascii?Q?/QdDqqg2LEzS80XP3MBIEteIwa+vP0oR2+5pQiacz8j8KFiWg7J+u93Kry6X?=
 =?us-ascii?Q?qb3kaybbVhvyoPDZSeu5/+BZrX1G9rIarD/aC47zICGQo2uZX/OBxgynJM3Y?=
 =?us-ascii?Q?1Mrq6POdo+6/TSQGOwy4J9zjxI9/NgTC3SoJWtoUrZEAdGPem3DZl67qjZuT?=
 =?us-ascii?Q?tXzQXXz9QKdUoG/fzmAA2QQytTZr/VbDxEvmkUWXME2DqK5P/dKTdPqz9Qfe?=
 =?us-ascii?Q?5wD70MLTvMQ2MjK6IVYPc4l1M50qW6yIseLQP5N8jf4lj32rXk1S8XHaS2nb?=
 =?us-ascii?Q?jckJC6B6vmZeijDm2iznJSOKMGz1CUl2cP8O+iVIwPUMVxe4SzsoMon4+TAt?=
 =?us-ascii?Q?wcq9IW+JLOnYTvvWMWuG1sidELIsHMV8nh/rBajtCxFyXBGQFXXDxcgJ4qp6?=
 =?us-ascii?Q?B95HbIS4YumR8t9zv8DD2nfCcCOSS1COprxc/MkHpOXuxpSDgeNcKG7HTx3t?=
 =?us-ascii?Q?E6fv17FiSrMoT/8ZdO6Fq3+a+ATgLREj7WK6qHkMWksgB5WdUWAaLMFyWqHr?=
 =?us-ascii?Q?72sNzYz0RcUTa2lAoJpV8m+V/tmimrhRRbKh6nf+4nxd+gmGYbzKEHSD62uN?=
 =?us-ascii?Q?J4jNIph2GkUPA0cO/SIxwHMdBvOEOQuQ1jVz8jdo19BHhX5YNu+SMhE6xVVa?=
 =?us-ascii?Q?UitX1EJ1RRX64qWUGcLQUg8bSd0nUoImrw4/zM648NfPRhdiY/A2obXZxYbO?=
 =?us-ascii?Q?GG8P253WdDtjPL7J5bCaqvvwoaeNG39ne9CXFZQeqMemp8jJ/2LflgDbquB9?=
 =?us-ascii?Q?K/vx9sKNalGVKNGFn5z2/hfP1H+kLny6UBlUzOSEg566VqcX0w+3UAk8PTVM?=
 =?us-ascii?Q?mXn29EHS1U1kpYhgumRX5Tk8+xW9/w1S9TRLV1/aar2BD6jtH4kN6wc7dabu?=
 =?us-ascii?Q?D0losM+t4PaSyaMe/C9pLDy+EsrRwS1GW5HC+FMHpakVj2+WIIhVvlsLo7wB?=
 =?us-ascii?Q?VWB/+2kaR0UlfU7cIUuAM3bQdyJc0r34J4EGBF7Lvc96s3thSR0iEJrsybg0?=
 =?us-ascii?Q?zzWw7hbxjTQi1TdTUbtaVplZBny4QoMQXct13QDMCZMX2P08iRhL60GRhZGk?=
 =?us-ascii?Q?Hwc1aYGjKex009S2ubjbJKsiBohwuzYPkQV8MqGhn16PDx1+TIUbfZLJhKmX?=
 =?us-ascii?Q?mBxJZNT3paFG934e7iNbPEZRKUntk66jgIga5Ju0v7CI71g2+wxa+cV1JjwK?=
 =?us-ascii?Q?EZopQEbDHJHiiMTIHflqeEJpUqMPwb0INjcD8QiYJaJAEkU6xaMwqbLEJIRd?=
 =?us-ascii?Q?Wdlldi7cqgdK6F+I1lDlhBJBtmzLAOU9XvuMKu+6mqDwjlLx1N9gsXpk1l1A?=
 =?us-ascii?Q?ZVuY2WWqw32GM87nJL/C2AAKmAs71Wood+kcU9iOf2bBxf2vfdfmd1RPC9O6?=
 =?us-ascii?Q?17gdmMPOikyt/pNdjo/dgbDtuzW+b1OgyZpSI9qw6TyHOsAvl5s0lK1azFKr?=
 =?us-ascii?Q?R6OeqvAE3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065470c4-081d-4adb-00de-08de83d287f6
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:08:58.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzenBxSKTgiATvyL8Ra1z9A+mQnhdtGgTRXRQ3hxZVJTMY/GaxAxi7nHIGALG66Vay10a/hvGFKNOCIgZBwI7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_200904_665346_58D3AEB6 
X-CRM114-Status: GOOD (  14.11  )
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

Disable PCIe bus in the default dts to avoid the shared regulatory
between SDIO and PCIe buses, the random probe order between the two
buses may break the PCIe initialization sequence which cause PCIe
devices has probability of failing to detect.

Enable the SDIO WiFi in the default imx95-15x15-evk.dts, and add a
separate imx95-15x15-evk-pcie.dtso to enable PCIe bus.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |  5 ++++-
 .../boot/dts/freescale/imx95-15x15-evk-pcie.dtso  | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  2 +-
 3 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c4e790a268ae..505efc9ebd58 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -471,7 +471,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 
-imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
+imx95-15x15-evk-pcie-dtbs = imx95-15x15-evk.dtb imx95-15x15-evk-pcie.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
+
+imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
new file mode 100644
index 000000000000..42384e6233f3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie0 {
+	status = "okay";
+};
+
+&usdhc3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 7eb12e7d5014..afd89ce3cc5b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -557,7 +557,7 @@ &pcie0 {
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
-- 
2.37.1


