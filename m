Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F153C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FfB93ixwGIuN7i7kFELRsGdjtIkmuuNYPzfGKiws60=; b=AjwuHP+SSzz1i6o2ApwN9m8hwb
	+zflSUTFcUEFmXwA4HaJdsjLuF2AlUp/VoAeT8FcLKtkRrQrtOY/4yAyZ5LxBzQQEf0H+smamVEBs
	0ojMovKqsEwnt1syT/zuxf6wX1NpAAAmIzMhQzR5D9Lr1CbvzBfigmXSUpUYWO/+6N+SLXBDgqh1F
	IsmEt9mR/I9Q0B8ELZplT/E5C6HxDhHn1qmMYzFLLcXWNKxPnOTE842GFx5gJBZ9hlegvcuG2i6JW
	tRxp83cZ0EvrGb+i6v1qzBtqpzR6P3fhf3OmeCJ+809uQe07vN5UaCrxrlmmiPq0ixIuSE55zcPIi
	Rsn2dDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVmn-0000000GfQW-0vwJ;
	Tue, 30 Jun 2026 10:33:49 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVmi-0000000GfNW-3NUV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf7e1/7gsfljfgjHviKdZg5+42qeeSfsiqnrV/h/vFAGVNoSYUAos8GwqVSzuybnQswjlfrHDN1HpvHRE8E/kDdZDkQgxAe4EvMY9waHNGwYEFU1OK6QCkmXwl3ZaC3wjzbZL7v12uJpXiI9gmtVJnTv9gE5rCMBXRokelSmnO/rTRFjB+xK/apzu3+hY/QTwN9qVxAEI55TP/eGdCrEQz4DVNMSlyW1rZFJIlh3Lbcwl4D1heo2CcN3Qc21RN0rMX6kEkqzFeOEDuxxa3DJCFnfCPXod1ECFHos9DW+a0BCNCFKg9sVhu7vOp21CkLnVCFKeq0dEQ1virVDMSCb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FfB93ixwGIuN7i7kFELRsGdjtIkmuuNYPzfGKiws60=;
 b=I+M17zhWP4Hrgr2WpC86qHj3czBg7PLZAZ0KMl2yUgboTcAQmSCZSG9Zh3cIeR+6lU6zwtL+GRg7Mov2xMw2C6yfpjOZVPuexI/ipxU/XFgiU+DxyvY211Zn8Wld4u3jfDV8RNgYQ5UPcSbeQMdNqqsq9OhzmPO2CmG9LZYfKW7+lrxztsW++N2MgAPUtmVjSyGi6u0uoGTk7aEVesvKo0iIfGyRAiRnRkkoAoQ5CnWpUTqOLiR0HDCsu4g1LBZgc5y0EC16aib30HKnnjdE816XiPcHl3s8P8aL7CoPE/L8ZLbYbriD4uZqSAUTOQgbyjkWRAa7WUS8Upv4WZ9QXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FfB93ixwGIuN7i7kFELRsGdjtIkmuuNYPzfGKiws60=;
 b=kA0zq6pbDvUkYEVTFVkRDJS1dCzXNUMz01TptfXybyLimmZ1SzXjv4jfVXTMpfcPB6dtBrcDzoO4dgy6RTuk+E2J069q+1fGYGi5UYsjotd5ZmGpjuwrs11la6cdGkGWKf7glYxTJaIgVKEgqiRZIsnFSMNNs9vUKriGI2iDdyyy0e+Dt3cecNTB99mr7yzsK1mckB3h3gjXDADK9JRG3YF8fxOYF7c2+uQvvEKjXJjmhFdshEel9x7Q4spHoshI8cxZ9HqJKa5hPPwBN6AWM4Ud5BqkCNPwA4YAj4PHNE+AeNKaSsA6NjV7q/18gRFfeYAcxXXrz8/CMvHOXBVZ9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 10:33:42 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:33:41 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v3 4/4] arm64: dts: imx8mq-evk: add typec node
Date: Tue, 30 Jun 2026 18:36:29 +0800
Message-Id: <20260630103629.76604-4-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
References: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a6f180-7f58-4b98-455b-08ded6930d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: buWrrMtgYQhc2g+JeXOf3gUxy31OCVpmMfLsv5uk6am9GWHsG0d+2NqMJxSI2sW2MNHIuPf4fCqpWCs0kQ/COT9589+dDvSwXrlAYMlUN8pXsDuwZiuHECrYCinCjxtynxGJr9blZEAWYuYGkuuF/3LJxHXLVCAGRuWcYct5waagB2CYcmNzzKX5tPWD2z1MXFmAtkuvFx6JE5R0puOqXh1K7+022Ugj9ABFtabyJHcBOQv98b89lYRXFbuF+zvGHiNEEjqtMNZy0559RCd8WZLi+qBbP7ZOWZYAbEgT+GAxtEA7SeXtMgDf2Pc3p5sT0+BDDGZpO2pWtksuAveCe2NuuRgcHHI9iraL9HKOs6bXqN83CX6sBQ0Hf9uqD8S77E7YRjYZ0gEOsHgrAs6cF5bAzs7p0ovXWb3CI8VFY84xzoXz4vTaIknc5iVSQyDXeBnrioYUYtJMFQn89um/uEtbq4TdKwumnH7Tti+qR/mm7JwewKOm2ApJA3WbTO5ISEMcxn6WDd+UpSSdXcVDcPgK9vKl4DYmwfHNSijRRXBGlf8rY2y63OBwnS8R3ISJJ47wk9qISafVizGGD++nSqCVUqXoONSgI08nCP3joNep6zgaXXEFFEtU+AkDSe8doQU4dlfGoe6a2YiugSKy9OOoYcq51QWTYDjopjOkuwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M2gostrVt4qTsVcHYE4dWMjP2tbryhBHY5/L76ESYtka23+91EWwv7ze8QdE?=
 =?us-ascii?Q?AcfokrwEV74eftrILrG3aFHK55zf62+vyQf/95LgzIVatwenwB/Bz+Da8xRf?=
 =?us-ascii?Q?0H4c9xCUWqfbEhRWafRf9bDco/Lpjv8/z8V3miBBgiUJes5Gtx7zzk9M8/ox?=
 =?us-ascii?Q?fztwGj9AQ+9D0KE0rV3V3kEJBdIj3WSpg3hTpj9+yXN6suY/SuyEhEW5fXmS?=
 =?us-ascii?Q?sW4/Z6wr6cxJ6v7/6xyH8M1j24Fkg3ujq2iwbGmzbDaig/CARpcDt9uylL3z?=
 =?us-ascii?Q?fMiE9LxpECbGb8dznDNIvCRGN+XmgjIzfdfFeF5ZRGBq1vqIqSP8t6Jsa9Y9?=
 =?us-ascii?Q?C0HAN1Pq+lvrIxEc2IyxN+jn7TOdWIcIMU7L8+b+whezfcIFe+jdUk/jMl0t?=
 =?us-ascii?Q?e0j7E63Vbbr87T/w0FLqHXhpPgp3uum5BEM9VyLu7LWTNh00V2sSDrJnIc4a?=
 =?us-ascii?Q?05W4hPuaroJ/3uWQP0mERSdqGNpl2ILRUgX65uxOJLWYRQQkfIQjElMZZjPw?=
 =?us-ascii?Q?xwUhEji8s5b9VaRKgoIekp9D2TTCEBPWbOQsIOcyZeUWjARMJpzPa/JXNOCH?=
 =?us-ascii?Q?Qc6SUq0RGO+SeIoiSo1FFgRmDnthsABR0CK4WuFe6o/ZgwD8bjnwf5NxRy1p?=
 =?us-ascii?Q?+hY/ERXI0qDVTgMl4MO5c+zbYbnoNjduo9dbMlm9g9GKEwXkSfWF9zJOP9Bo?=
 =?us-ascii?Q?9Snt1hr8SrrDamVg1e7g9eaxRu2//n3/ll2Je3pZjYFB9wzIMwfxJ+TuSKYi?=
 =?us-ascii?Q?Rmgzdkb7VHNFH7M9v2OUOE1vot6bnITscJE7skyDkRdY2KDtOtFb6Ljbo8Ln?=
 =?us-ascii?Q?M4hjxd16PG4pxkcOvNcyNK27WI4we1NMLnKQgTGXHg4MYPoaHjUIWSTgjkki?=
 =?us-ascii?Q?escjO7NMAhqZCer+fCItHiSej6Vk9IwG9VMvR1HFycuM4U3pQ9vfE1aABHrr?=
 =?us-ascii?Q?RxuticQmUONGa7Ekz7jg5IHGphvL3feYY7FmU6plImMEBhjWzUcyqNvXY1RQ?=
 =?us-ascii?Q?gBrZu5YCVO3nX4jnWkCR6emPe2uFtqFJFbuH7YyaKhHIr7kxM+Ed5QaB8JcK?=
 =?us-ascii?Q?kE/B5Ve3xAyB8a1S3jc2qXARRpDs0+h1/nZdyKxP7iJhFHreXIu0oOA0ff/9?=
 =?us-ascii?Q?197dr75ZDDBoFUKyTA3c14mqxQqVrLojChzckp34YQzmIeqT7RE3hsE44W+P?=
 =?us-ascii?Q?6YbqZ77jff7W88GTr7CBnplHladnWTM43CleQ6wCTld86rxcmVx/m5fOmu/k?=
 =?us-ascii?Q?MJXsNvY8/GV2asoJslaRZvqJPbpr8IyHWC2B/LHuZP8DfefJjqUiy2KAGvUP?=
 =?us-ascii?Q?okMOjc2wo4SjhXrHRXvqcEgVyZB8oBlOUs+I0+CgxPJ8/MLPyZLR4QXYwMSO?=
 =?us-ascii?Q?/TzTfOr2GHDhJtRX9GODIEUea7v78RLCVUuTNVzRmbF1CBLVfHnna+SeNPCd?=
 =?us-ascii?Q?Shcl60RlY1ttTf1DvGQ9UWGgpfMnGbvy6WkMpL/Z4KsZ2YoQ4u3cmZhqK8CP?=
 =?us-ascii?Q?eqqe4G/yOQxMFgmWSy0NPegh9XP1A/4XSxnXCPDNMCV43xNmw6hIfTVokK3f?=
 =?us-ascii?Q?GNw9fDlxxe2ojFmLIso5pbOwRk9W68CXn4wCgxfV5Qh2zJhpm3CPItSh7Oh2?=
 =?us-ascii?Q?IsOFeMwbenALgcT/gBhPsJ1sCAzBDZtto9h5SWYAAfU1RNz35yhEcXcCPx+8?=
 =?us-ascii?Q?XhcIRIaIV2a9iPv5JTIpdV8S5HEYuTRYQM8DDis/VhJpfO/f3QOJXGe1ZIU2?=
 =?us-ascii?Q?zTjM0lVcbaiK66MdR9fR8Gy7pkO0jHPW1xdDh7vZJEGHUuuTczNL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a6f180-7f58-4b98-455b-08ded6930d5f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:33:41.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etgd3SXA1QJ+jGXqRiJ1k3I5LehWe3zzBVKmqQyeZYptcq7qBWtJVLq8jhCkW7viCfeo9WTLC+aLVBSPVGY1R6PTjFYVALM6kld8m9rtcEMkL+KkYiriqwuTHCXX90if
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033344_920644_F3939F61 
X-CRM114-Status: GOOD (  10.87  )
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

From: Xu Yang <xu.yang_2@nxp.com>

The first USB port features a Type-C connector with dual data role
and dual power role capabilities. Add the Type-C device node and
enable the corresponding USB controller and phy node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index e7d87ea81b69..9d427fc3e000 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx8mq.dtsi"
 
 / {
@@ -330,6 +331,35 @@ vgen6_reg: vgen6 {
 			};
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		orientation-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&usb3_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &lcdif {
@@ -498,6 +528,28 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
 &usb3_phy1 {
 	status = "okay";
 };
@@ -650,6 +702,13 @@ MX8MQ_IOMUXC_SPDIF_RX_SPDIF1_IN		0xd6
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_CE2_B_GPIO3_IO3		0x17059
+			MX8MQ_IOMUXC_NAND_RE_B_GPIO3_IO15		0x16
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
-- 
2.34.1


