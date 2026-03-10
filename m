Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC607FCC9A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 01:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJb9oHe7kobPyTsQ/blsu7kFAjj9YJd9yLolL0/IInY=; b=QT+1Axbfr8lcSKKiFT2qfv9y2J
	KLNPnTVEP7yIYIzAxGICuVgie8r+4CSUUdTg2Y1unIeXy6zXsgZUJNVrgzJzLyvMqYRxVsQIsSFgU
	ySYXJnZcqg6coeQiY4l99ahn3qtQpstgf+nDMFsMr7uBAZEd0sMEliqvRyeBOBvdxgu9nOallQ0Vt
	A2zXnwFnkoZxAHAVRVgasFcucGA/Otu5XvywKe/uyas8Vic5Eo9k4Saf/McW61ycwp3AszU+1pXh0
	VMHJNHI4bh4cVO0dmgVdKFCcM7S+ZgB4HhSoY077cf/SdGlbNadQhH4XCgNjFroxhAx0+M017xMKi
	09Sz5jZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmIq-00000008Wk0-3Zrq;
	Tue, 10 Mar 2026 01:54:32 +0000
Received: from mail-norwayeastazon11013020.outbound.protection.outlook.com ([40.107.159.20] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmIm-00000008WbZ-2c2z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 01:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7hi17SyykVFUvEnhTyZRCq+xYYUX+GQFVmkAwLqxi3PihoqkgZiuS0a/JgAqLddIifNX40fbPDSuc9mA3Zwjx5dwtINa0iev8726jKpb64zh2xPBUOFhSW8EPvRV5WALONnSCGtYrOPXd44gQ+Z1Do2Vjf4BqnE8T7NdLNA3d/vD96yQQVgF+9THuuJCJEejH5Sbd4nffK0A0WjT0r7dIojEteyVF+OSqQ+kgMWYAX0BV5RmHksG2Ojh0lUbsBMB6nYPx4aFiiN58zAINQUD7kDX7GW39f+Sa/eBZUL/JVYw/1nG3YLQDV+TFXWojpz3h3ZAV1iBkgS7P+oKjuzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJb9oHe7kobPyTsQ/blsu7kFAjj9YJd9yLolL0/IInY=;
 b=ZUxJDTn0cxOcFFO8mshQR0j0qohjbFe+F5oEzn2VPUZvHP+B++WLiSehzGi4xek7PwUqYCR82osYH/Fs4VyweA6e/7SJfzPLorleoZ9j2/Ae7A2HpoErOU431OSW8ZmabQlCS0+jmlLcLovhlpDjOTjwJb9gBMyCCgdgWWS6lvc6eOTmkGVNBr3ZD74CsKl9sBuCvcUwXEaPjaOPlZoh/WvNTKxx8C3dO0ru55lyO+dsSp1Kz1cavZOHFiHidZPO1W+7pUC6Y9oQ/a8GSefDnw8pth0dhiDWC9rlr0WIPmea/MgFngWpTvMBPMvVbrSevtT8gBdN8EmgRz0Tjq32wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJb9oHe7kobPyTsQ/blsu7kFAjj9YJd9yLolL0/IInY=;
 b=aMMriYDwYOrjA26Uud8uMeSUZ2gntfrltxxDgAjsVnvRrhYElWXT0RKIohTFq9rxC4p01FWRGOn48nBJlZARm/4buJtjZyJ41T0MlP9zjKnOOkG28bwWNMmsCvEKFJnH/NB08YSLteLRT+Z/q3urq4frjqDpJZ6JHmcyeshhlMtRh3iWa3IDxaFBOnq8JUyKDJnodAO4Fd31iyYuEPtEEfDfKovkSvfDCZhPL6D5TvBIKLMcfloe1cqBmXVuYXz7NdTc/P6VADFVnQARBMiMyxKUs2YTIKAzYIKKvuXWAZCfM3F1mjc7llSazbSMaouoc+VfVB5n0h/CtrREDcPaEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8434.eurprd04.prod.outlook.com
 (2603:10a6:20b:406::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 01:54:26 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 01:54:26 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 13/13] arm64: dts: imx95: Add Root Port node and PERST property
Date: Tue, 10 Mar 2026 09:54:26 +0800
Message-Id: <20260310015426.365675-14-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260310015426.365675-1-sherry.sun@nxp.com>
References: <20260310015426.365675-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: d7615ce3-ee2a-4bf7-057e-08de7e47f5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: zYn/GreNHoUbUzK16II1DNoVM6ajJS96N5YJhl594ehdId5KxzpkjsS3jWfsdNRi8p1TX8fYuBei1uQeOgn16vGwf4+RvxqQUBAeSbnmJpfEfV8rT5SfKsqOe6Ab4z8c934UYqBUjETxaPAOYu/vJR8cwDQLm/oYTnsG+LH7hj2LHrQ5uZbEW9SYryieAc0l4lCBhPAOVz0LwuW4btjpgZWjNjh1iSJ2DNIx6oS8HPFatNwO8+DDj69TO51REakSwKfN/6nbGYDJDQMYRzUWRu3LRdapg6KHQ0Tc99T1Pg45X2l5BUBtv+IKLCS3PetKQnzNFVuFj7Dxo+1QDpV3CMGsLly6X2ofWX6kGmvX2dvVrhVbo7swycGQf1gSPELmGpA3mX9rQtT43G6TY5HZUDZ4/dZCJSIksZ9SXLJM+SPpzSn0j142iSjJgKDzU07Q80YPWo+1Jyupr8nl/mqVbUCWK1VJg8mv3cAGzTBi4betxXINTw2o4lzTFEreSjzhVaAZtf2aSPrITDOGNJ6/KeGc1dfJ6QlTJSTqeh+Ckm8zSl+kxZPGul27PpLxMNdSm3d1ZzYFH80bADo0QdZc0mpzU9WucVKebrNJ7H/wn4HEBnMrRtGKBxwvrVuz1w4VRevaJHxR08oEQ6OKfPoEdKEyzEtX0k5AkuI5ixI+gnqEKG3WIqwBuiB0MV/DvBsvHkpU1DvkURrBiUqpCQ3a0noNuh+isxLWmCWDxnZPQDJht55fDdCMlSN36L9jVxpqetrymLF5ie19ralhp6BwWBGxWSCvKkYHJ2ghM8N+LCsVJv0IZPFkc51wVTkqDHrF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?95jQ9/+MLJ7qmE6iXceUSVzQiqeKV3hdL5GO3rh/WGGWCE9LdL7ubduwmZL2?=
 =?us-ascii?Q?fEBZ4KJJmxfi14/4tqFDcN8JV+LOpkDreq/2hANJ0Y2cVRYmd716JKY4uk1e?=
 =?us-ascii?Q?guLe4PQVmArX/bxJg05EqzO1y3E8vRqUK/F0hmh3crIbvxmCtW/t8t1HwsJZ?=
 =?us-ascii?Q?mfHUi5hCQdKTabWnf3DAkXfL35lcsGeAYgr+WtxQuGO6e6W1uG3PjDdc9946?=
 =?us-ascii?Q?aUZFp3c5fDg3OFJWeyua6DoOhdnQKtMgz3IZyDzzxpAfzWYyQ/jYEelEtp4f?=
 =?us-ascii?Q?W8GLgBVtN9HufpS4uFXX7Dj+uHrNrhi2YSkWjgDso6nN+p8aGw7wWpOVndEe?=
 =?us-ascii?Q?MIxv8iaSltL77Vt3F9grAMAgVDBZmI47DfpJ8qRQFxaoqOUD8GZ3/RzCKvwf?=
 =?us-ascii?Q?UNrBqG0vvFRVppvLHGFw5GcIWLOb+c08vF/jpCqxdYtNAiu/tegKzN2KPIfa?=
 =?us-ascii?Q?/7gbWWV+b+xFt1ZwliI9zfII4987w2u8XGf0d+P8UQ4G9Lrtl7nlfb2Ovueo?=
 =?us-ascii?Q?y7XCqUHhbcqwmVpza6ciu2oUkDsq+g6o1CaQQltQxp0fDtxdO+s1AjKDcd72?=
 =?us-ascii?Q?a6ZtuKLjuE+i7oVpO/YpdfY3EHkzCgvILFgizjyvJmZdk1kJ6YAOY3Dv34Mf?=
 =?us-ascii?Q?Uli/Ygsd/ebpV+vy9WQOmvDbOL0x1ilCY3rUnEUcNdZk4pzenNVRceAGNCDX?=
 =?us-ascii?Q?hxBnDplYIcr2N66OHZroN9Wj4x5b2kXHY2HQeXOBQeDDkBtazfb8mN40Q2TK?=
 =?us-ascii?Q?5A8o3aItawnEHBXX73l4Y44bdQ06T3QwY76z2JJ7GgVur7K83845A6sF4mmS?=
 =?us-ascii?Q?qPoCZuz2mlhGUB2r8nUF/hHBVwLfUAbgYZdO9exBo+ZN92QBTF7KRDQOViFq?=
 =?us-ascii?Q?obS7SkvCQKSnMfUCHbERXhRkp0RVSs5834g6PVF13lVLq8SRXy/HdbQ5QXKD?=
 =?us-ascii?Q?3Vl7Fg0maAaiWm+1CztzAWJXFN/9+1OO8aYolRZ0m0QUs6+dvtef/Tf81R66?=
 =?us-ascii?Q?fOlIA/8R/84qT0Wkm5wh/svn6hf6hi4RVyqnxrWMDAe8bYr8CM25soPc+beZ?=
 =?us-ascii?Q?hZwyeZYzNf+4UtseDHX7u/K6H2WPbohmVDyDrvQ/wtFKAtvJICAvhYe55x+w?=
 =?us-ascii?Q?DnWyt2/jvTllft/+GuxBoO5w00VTeuHvYK28Ts7Poe8PLnnSC6LQuwkn+Xtr?=
 =?us-ascii?Q?f8MbDDX4nBIpPvvn11beMJGkLPeWB9Fw1zastvXMBn2pt1i61lACg+Ht4nt+?=
 =?us-ascii?Q?OlgdDHjKRmox7y2caMj3ZXx3F8dbLLcr6r58BUlt9zJ0rps9d6VGijSp7qAh?=
 =?us-ascii?Q?wEpzpDhSxcBlrL8InE1h7nrMzvxroR62qpMjh/wDGiwUstHFTluFoJDskk4k?=
 =?us-ascii?Q?V2OQnIlihNpUCzmg3Dy1spj0Q08q68MiJ7bVAYB77nHM3PcF9eV1O3Very3Q?=
 =?us-ascii?Q?h81nyn3odsWM+ZiFZMJcUGxFvfdb27D25lFNxcz/s2eNfNXTAhW7NNZn/hrg?=
 =?us-ascii?Q?oOr81unoGk4JrlPIJkJ3EDRhFQMUpU32rXva7He1l+awUCm4ityN1RdcqgRb?=
 =?us-ascii?Q?9kfM/xeVGt1JnUCyadGNzHdlSffeHpBgjSx8HHjj12t9nOJzZtDkHDPVJXm6?=
 =?us-ascii?Q?ETUaxpTMoGAlptHyVBxilUx1ioDLVmOWb+VT+Ho5+mSFECxUK3n6qyW6Udt6?=
 =?us-ascii?Q?HeytWPAkATEXct4jDYQobme3ad6qj0EvAEC5Rzj1ayrKNopBmtiP8fwIY93U?=
 =?us-ascii?Q?XmqjPwMSWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7615ce3-ee2a-4bf7-057e-08de7e47f5cc
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:54:26.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dkpsy91DMAs9+enbUeIX+GzzTBDm2dUj9CVqai/uhebDQpV5D+OhanG5G+etrOW43tAFyZkdZ6WRUEqKYh91JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_185428_712318_9134E8CB 
X-CRM114-Status: GOOD (  11.10  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  5 +++++
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 22 +++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index d4184fb8b28c..42bc09e48b80 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -554,6 +554,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
@@ -568,6 +569,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..6f193cf04119 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -540,6 +540,7 @@ &netc_timer {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
@@ -554,9 +555,14 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_slot_pwr>;
 	vpcie3v3aux-supply = <&reg_slot_pwr>;
@@ -570,6 +576,10 @@ &pcie1_ep {
 	status = "disabled";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+};
+
 &sai1 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 5f61866e9df9..752236afce11 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1890,6 +1890,17 @@ pcie0: pcie@4c300000 {
 			iommu-map-mask = <0x1ff>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@4c300000 {
@@ -1967,6 +1978,17 @@ pcie1: pcie@4c380000 {
 			iommu-map-mask = <0x1ff>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@4c380000 {
-- 
2.37.1


