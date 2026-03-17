Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32875FB5EA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 02:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iE26rERb6B7QcmrjrJmdQn95jwV5u7wPjuHXjzs6mm0=; b=gzeEhs6KitSqff8qmx9r/vA4ER
	x1aMu0U/DdshSzHFPtKBHvP3EJ81r8O4mF1+cVaGvbXY1DyQRMLa1jvuzjetTo0lVEfZ/OGUVcQYo
	u47BGFJLMNFfDUaUVm32RdsC59fGrxSM/pwT5wgz3rLogJvc7AZuPaTgOVM+bAlRij7UIVHDAqt6h
	7rpYJtIE9yfzDihPBNWeYa3+hgaqrabTgRIwLTvvJazVvXDzW7ZAUv/37bjb0LhFki6X4EEFNYIy5
	JkRpOFMc8l01bFRt5zySln5pQ7eQISWm7W7bCMqt+tSUDozQYThiNFlANHYLVaTOo4jdLshAv50LT
	WK97Hw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kbn-00000005Gt3-2Vr6;
	Tue, 17 Mar 2026 02:56:39 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kbl-00000005Gsh-0GLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 02:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEYOu5dq8YCV1JXliXvldSEMJTX1hFzOnviqM8uNpJPds9b7fv+SLpc6YjhZh8tjdh7gvfqzf36Mva6UE/qmVX77t/wFcxKzsCj7PEd8bXwUyT9P6ce5KEHe+jl3TESMrOx3c/mJNlflsj/czKwqedxOc0/DtbioQpyJ0kz7REWQBWCRCMry8dBTcCkXOy8UYLssFcUCkl3TrmnuDr9/+v/565RjYUKxwQklgHL64IuTsXAHq7Jb3AQyZvckmcBMrcZf3njZnc3MG3ng8MfjR29Xn6F+aK11PWZmUAkraSZJUETgrKkOQASGuZbhwNOqeqXiWmhMUJjlx+zSBIugtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE26rERb6B7QcmrjrJmdQn95jwV5u7wPjuHXjzs6mm0=;
 b=X0lGq+PLjU9dQBMcn6p8nacoZ10EkkGr6A7D5BK+SyG6wEBgv1NlkvDb1bBpq/g1GWlfMcJBL5tDkc15LvPjxgozGq9uVrhJTCPQwDmKu0a4WqKMXpexasX9n9au0QCejIhbC0zzhXYwgrJtszJExpD2qTqGh5W9yftSLW+c5vVgl0wXmyw69zuNWBbiCOyDACEWIOIB8Ma9vH597aRX22x+C7SxLF2cL1oC1r2ekAqRwNMBXREVvVpQpeVTChaoQ5xh/uUJzBuRgjgMtq6P52t57b1HpTmqKy9QPv2yZhIjpQlu+VcKEHKbg9A/2REEz/tj5LC176SqQSfRVRBUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE26rERb6B7QcmrjrJmdQn95jwV5u7wPjuHXjzs6mm0=;
 b=QuV2EoL4Fs1NyLD8zw1bLlQn1majn8zm7mgH0P42qIU2FANcFWrrUQgarfAkh1sFatKGf+j4hGcdZ47mxj/aUP3XC0PVnNa41WxqFBpSZsBOjysI1PkGI+yXsbqdvgjKK/zD5QlhZvyjxUGw3Zr5KQsBFPBNSMlZdxDTPPm5eaNrQo6cox8ITgowdT9OWW2RjVSbgq4LTP+FxKcmFHQQmJ2ji7Y0KU/OJIhOsxk1HOpSBKvkEXy+9Tg027Lf9y2cinRKpmO3cDwy3BBkFnSTliQc/5Px5VyAM+hskXYBS1QncfwqgoarR+PGfYvxGm9GdwYBJNgEYgU0cqLtp3WMCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB8219.eurprd04.prod.outlook.com
 (2603:10a6:10:24d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 02:56:04 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 02:56:27 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
Date: Tue, 17 Mar 2026 10:57:51 +0800
Message-Id: <20260317025751.440633-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 99dff92d-7dea-43e2-e829-08de83d0c829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: qrgpxq4XHX7RuJ9m23ItfQZsRnXXndDCj4xE5y9cOFZ1Qed/A6L2EOEWhMwUjjt6d+Xqv10IobuplfpMIpDXerl/ag9UUhrCzdoJXS89vF50dRmO6U/dxKhqx75rjajS9DfSYPdLsjUnGVNxJAXy0iq2Nruvaw13SGqEbhceNZ4sB7Vq+XXPuOywOa4+gg3i2XR/DvV0gGWzgjNEGL2kDkzq481geIcBwen3x8KgKHlhHW6G4+IR4gj/FMaTWdcfyXCnvhJbFims1lEJWbUU/8FWvcWeFMX8Dv4GCiCenuAMAmA7iSrPG9HGi5+IsPKIQ967vb8E/eGiaqv4d/SbcEEMChURcNUqE/1cd+9I4pHop172Nu6nreMKd7git502MIhDZm9kZzxKQ5pDbeWNImBsdMeMrb1+uHpi/1eIa0ujS5AB3bMLpr6bJxaCC/2UQPx8EGwxL4mI7lXxUC8x2xoeGCeqGPCFYtGrb4p0PXJsHIh0zRytNStH59zB70NMvfjadQUJyWaVUYlaBw7DFLW6A2XRCG9AuVotpWLq4lJqKKKZnNJQAPGHG8BK68yK3mQnviEgasQOnyOxWhRg7mNS0TFlSTNNV9p1rU2PC9mGqAtApXmzNN+tQUH8WGvevWQcKprD8/WtpnSRYhkJUvoPCoyEoZaXJxS39Z1Be+7sIfmfXtdZBpWaDhQWuILPu6lHqLYvI9ETj9wy7b+yJLgqlcPqQN6NGfVOfLW2lmWw9Dui/8wT04akFFbcEBpWc029RH64TZZq18iTv2YWkMUD8GcKXwJm9PQLZKEMRIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMogFLEzBMI8V33bRI6tVVN/jQf+INum3dGkqwBVYbvSFu1f4MYBAdpIIALr?=
 =?us-ascii?Q?IkN1Aa6lfu+0cU0scg5cV/Q0DfWNZl3KL2pqsiLDLNTWiDQYaRuNN61CZ8zw?=
 =?us-ascii?Q?8Eo6WDwwo8q3OmAwpe9P5UYvXEgZ/Kah1MQyYFIX7MPjgk+drG/78sMF+9jf?=
 =?us-ascii?Q?eTa2vJ8tRPT346ywxMYc0tDKWsDdJrE5T5UG9f5TXzMzgJIL1z2q7crdpvW1?=
 =?us-ascii?Q?j1vj8n0F9P+ToJd4TqQkQjczxRumS2vLWhvML40IdOXFwniudK5vrLaECIOI?=
 =?us-ascii?Q?bxxj3y4S3u2m42EkBylfUwYEqBnY2o8myYNNlY7kDpvhVxJVKhtuLK981MKW?=
 =?us-ascii?Q?IoBaQ1REareOIoza5hEv1/1a5QxU07Rd5HtPjmKFzlQlNtEkayXgVIocLXcp?=
 =?us-ascii?Q?a1spaxJouKt+y8dBbRs6vxfDz+X7kXV86L231cYL4kecr5rvJiwrwVHtsVJU?=
 =?us-ascii?Q?zwXcCPXlXGKcrzYNKriAnV6sv/NpdY3GyDAWVwQUHUGOKf/ft1osReSdLT1v?=
 =?us-ascii?Q?avZ9nB+otn5/jAUGKhOnhhqLi8IzS80wA7O1UrpK3yQl3O4hD8sDQ1+z4Bkw?=
 =?us-ascii?Q?ZkCEY+aXsb1RfbAuhW34t37oYiZ8Q/y60+TFxFyqIEurWk57xpyo5rsqIet/?=
 =?us-ascii?Q?QPANm/5HfpAkPC9zHog03jJlT7/zOaAOMI9iHmg79dV3XZrK7vf6GkbvdZAg?=
 =?us-ascii?Q?bvxE93CG+jsG/v+tvduz8/5wtjV11GkSTQLzyGg8sXkkBsbLEbQrNPACxcF+?=
 =?us-ascii?Q?eYGDZneOcd65usw1ZIlhzD4UzwITaRIwPozZJyQqdQuHscxqSzPpD9H6IaDZ?=
 =?us-ascii?Q?doIzIBtMLpeKCOTbzLCp4rRBdZ4SjdGWZUb0BCYdMeCsj5kmn32/CCZLb0+D?=
 =?us-ascii?Q?TzyVNI0g4itCduP0sVi3VUncJ1LVXh4Ar20zWnYdw8sjJ3k1U8ti2+cvmUB7?=
 =?us-ascii?Q?3CPGQ1wPKZkBb5e/YcJ5v6EzQe+E2LXiz1VHZN+84ctBpFFBOF+KCKpZr3EQ?=
 =?us-ascii?Q?p8iVXgSW/fUqTdlu8Bl029n308P+GCv80u5wOP4I2GGYF26Yxy901dZxRa1w?=
 =?us-ascii?Q?ew0ed6WY+PyjAejUgMrXOeIqJZMBBp/oj6zrFK4YpdCSCHaNU7o/zff85tjQ?=
 =?us-ascii?Q?H9Wc5JP07feKzr384ieEbKYFfjlgEmBW2WIZ/3QwT07rJb7TTgDGIZD32HwM?=
 =?us-ascii?Q?0UuIrlwCrK6Ay9mglXq/fuhUzB9tNHvrqfMvX0iJ9CSbC2P1toOfQzAT3b7v?=
 =?us-ascii?Q?1m2wzRfcK2cgSSrESAUP8bZyV7xvtOt7kEn3QKvEFsLgl/Em2eXkEOYcEHZX?=
 =?us-ascii?Q?JoTDZ5jQeXmvN2HyLo+8XOjVLjF2O1Ydp6V/C8siGiTWejtoLo2ADKTiUB0/?=
 =?us-ascii?Q?sLEzTA1NBQNYS1VyRyFeDijFOH4ZTnbYbN4l34k7AWmFn057ISFIAiZ6MGYB?=
 =?us-ascii?Q?qVHYoTJYcuXb5vAeEwMNOZ2SPXxqfnQjDQzzJN/Qwx7lVvNjScOlcPA8870O?=
 =?us-ascii?Q?DIl+u8bg7OsCSDjoRe+f2XrPb5k32CzNnzGCe78wLUNcqmJ4gSW2WiGyYaGk?=
 =?us-ascii?Q?imDHRYMTzahoGyTdZ9iC+G2YvrUH2cSoaV/iGfQYKuavluVqsU0m6E2yu8Sm?=
 =?us-ascii?Q?VA0HS4Qk1jdanW1HrG8k6PK6sXvcoPNhLmdwuGkwzK+LEO4GAq45kDJ37wc4?=
 =?us-ascii?Q?W10z/lJMZQLlt6VGowTY8fmV4ph9XFWu053BVvMv3OSE9O62jAK99waQt7pB?=
 =?us-ascii?Q?gM7xRrds+g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dff92d-7dea-43e2-e829-08de83d0c829
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 02:56:27.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OkbO8/F7XeF5MWI+ZK9UA7kcBgBKBdvj0RYrrE+nrrpwTmPfaG8Yy61cqNrquDv4Mpa3O9KzVueZUQK7kj0Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_195637_111011_98CF2D35 
X-CRM114-Status: GOOD (  14.32  )
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

Enable the SDIO WiFi in the default imx8mp-evk.dts, and add a separate
imx8mp-evk-pcie.dtso to enable PCIe bus.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
 .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
 3 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c42ca3f77b07..c4e790a268ae 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
-imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
+imx8mp-evk-pcie-dtbs := imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
+imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
new file mode 100644
index 000000000000..4f6546d442bf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..f09335e6388d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -763,7 +763,7 @@ &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	clocks = <&pcie0_refclk>;
 	clock-names = "ref";
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0 {
@@ -773,7 +773,7 @@ &pcie0 {
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
-- 
2.37.1


