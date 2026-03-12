Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C77BFED2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+i7QGSZLg+0eo81oF6j8W+Spg/u69Q4F7jGv2cDuHA=; b=EnedbK27GIfoWt72c1wxNxgsSW
	v6cisOnJjukXG558p3nev5IKhk/cWP++3ZhOeEjCG0wsjyW3VpBJ5qUZJFvg4+0xK/tx/6SoPYO1+
	VsyFZU+m6pHD8uXu0n60K6E0flLb5cTiwiQElXhZ0ukW3ryvWpAzyAw3/scn8tdPtnXu/7O3yy6QI
	Uu9KbCKP8Zuk00s2CWuUCLBHd5WDFScYoJntJEe8F8zmHTmnSztCSUEF9gHrVlsFyf3BvN5radjfg
	+5Tk8YCDvJN+Xaicw/OchdJkNvgI32R4QgmBl0zDBgJo/l1ceHEv8g8h0wsQVeTL+UGq55JRPvUu6
	5cHItiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cJo-0000000DiQK-2EIT;
	Thu, 12 Mar 2026 09:27:00 +0000
Received: from mail-swedencentralazon11013063.outbound.protection.outlook.com ([52.101.83.63] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cJl-0000000DiO2-1V5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNyqr2OS2p92AgiHJ/cydzuXatKINkYp6VIpxw6e7M7zEZvN1AfNMhQOcOHsadpt0p1KcywIDdfVZYqn48ptarGtVYwQSrzEgQaY58CQlKE2EGm937V7E02GEPGXr6B25Hwrq/51dacTRORfNPejtHRSmudegiVu5GewEDIv8X0YaLSHs0uHZd6YZ8lBLqCOw/zlU3h31DLWsE2xtYLesHZI5i1P4iWS70H1yVNlGGqMNPtk04HaMAtWrva2mYUpjy/solBGzsw8r90UUPWx1qknvtpsT+QZpG2dUoAsh/S6YCNKhxgj+Nq6L6PuBvYL/ocQIJxuNG54dBMB/F2vYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+i7QGSZLg+0eo81oF6j8W+Spg/u69Q4F7jGv2cDuHA=;
 b=O5wtFNSDS9TwPOuTKd8u/XoUDrZB6vM4tNRmrKo/IGSntt6at43sRrpfNFA7zmiPPyeXYSE0xW7Bs+Wz3W8dWxYAw1PsPEjO+PfSlifKxg1bapXFi4v3ofKtI38RdAXvcaZT9FqtTdpgtJBogoca9Z7xh58kdhdO47++SCCg5Bs0OKYO8Dttbr01SSFNEa+exgaeEK39wYdsVTTvuLL5iC0PbIZzd4KFcU+WYLxbqhhWBvfuAqQr+lVY8NURO7pbhLxqRfDYhTJLIdjSqCi6c4hzx3TxJ98kaDZjy2OWLhH+wi/oQrbTjypod0/8ybrFpO1XZ1r4YiLV5YSexVKPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+i7QGSZLg+0eo81oF6j8W+Spg/u69Q4F7jGv2cDuHA=;
 b=akdGvZpJ/+Z8KlRYUFTYPaAKmpwHzjl0H9fWEu/Z2czCMXMzSd9MPhl8u/c2P0tPaID9twiGvx4W791Zw+um8EE41c4IOiDlyljrTsx9+5WkLff6B5vbOnjVAK07n4UTtRd+c4ekWxq9I5cWS8KZUKaTZ4Ciy3wc79OQGWpzUiaGwRxOMnwsVEwt8nnjImjNyboIbyUkOncsY2/t6qJn9I3J4jtuI1KuLDWjLDm7KOBLz3arfwdKQCo8m/FN7ladA63QkwtDg4T9//2GfF4dokcpwZ7+qPVDlQpvgsgDLWvqDDUtxPULMK8yRYYhd4TPPIELFBoE4hoX/uXhShKH9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 09:26:51 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 09:26:49 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v5 4/5] arm64: dts: imx943: add pcie1 and pcie1-ep supports
Date: Thu, 12 Mar 2026 17:27:44 +0800
Message-Id: <20260312092745.295578-5-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260312092745.295578-1-hongxing.zhu@nxp.com>
References: <20260312092745.295578-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0240.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::6) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AM7PR04MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8fd848-3107-4b61-12c6-08de80197d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: omTYoAhVSB19Z6Dy/ttBywJ7BCVl95PYX0Fr6DO7WtAnVVbb8hWtqcN944Q7pw5ww/IVc+ctmOD2p0/E8lWQfxwiUpq6IQ7To6lpZU0kciEx6K7jmJF2m0+AvB22CowajbkB5aLP0zqDwXDbUH3xslqnZhU0bigaixYVQOZqyKBeXtxCcbRNqG5Ui3VDpo09Qm5ETyqofMD9lIYxhzZWHi62cn51A30FjfqI6C2WiozUDyoaV6G3yf3EJ3l2XnbSv/4U8KGVruS6N4lP+UjJLFAVE02NrWXP3Ja5sw5+rBHLYtflV+ehBu+iJNR+Uma0FN1aIXRDdHp22T8zELGpEvok0xSR0+aoMvkIGeie271B5QXYOWV+UdqWrDP/cvrecQRN3b7HVc61+j6igQQU+rGzWkZ6VzsYKuLSJawTgJ2oIsamXtjQD6XRP/IEVIbwkoqAsnHrjEr5d4e3JZLLXCIlepSb76MJpxMdd4qUmN/BvsnVM8gmNtyNJaZ1eWP5DUISPajnW/Rdqx3Z8y4Tw8cHiJRxd8vl+ONZr/CgWTeEE/qdEKrawu2mPUiB9tIN6jmunfdzMKfhPC9q/UwrjSYvYx9HhNByZ/IN7AE1yi/y2aR5w+NZF0NGhmaTI5zshQq5gpJ8bBtqg9I0XsU7eAN45S6JtFvu6bPz+oywsrmHLM3QxXQbKFkAAGMNi2xXOmnD54LsEZUnVMc+429I6SrfmSlKbUhoguOPyGyn7GCQP1ajt0VB/KQsMCkwV4TJjjyG01cjaHrymbzMkZw5FEY/cpO7KhUDAYuTv1T94M4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCLUbV287MJG31xOGaWKDzkOb31CUnpJVXtiSMKSTYPHwk5fpU8akUJVCQEF?=
 =?us-ascii?Q?Vyl297PPxKoAx8S1NzXODmrYm7s2MQCjWkxrVMkicRMTbP1XD2WylnF2zeqs?=
 =?us-ascii?Q?p6fcIfA/JOjS796q4m9hSysnnzT8I/a6FfZATVrnVz7m5mBwjK9hDT8MqnfH?=
 =?us-ascii?Q?1Cc5gk1LfCyQKlLyq3t23Rd/zYVHwBQnx7JznZCdMEMTTC8vzws3+uhyJdrw?=
 =?us-ascii?Q?k6zP/TX6qI2HFJTke60a4CcLvZbY7KNtcR5/qxxteIede4Qpo/5QzFw1dwFW?=
 =?us-ascii?Q?VQiGGOM2/i6Dc/wBYUP8GtsOi2mCSiGd9MW7JGRezX4YxAZbJqsF1CeQncqB?=
 =?us-ascii?Q?jnIMhmF5pVqDULf+V9Wa7m8pBB0pMg9mCITRIlQPAxrBVDsGg40ZoVhoZLjl?=
 =?us-ascii?Q?KeLfwS3zK7HJ3GlORXIAI5rylgHdY71zuIAGU0gazrZKHmLcn40Cfkb/y9yG?=
 =?us-ascii?Q?u0TRs4U+dIIky4XpzI4T42KcY3myZjk4uRMlAqKWYK0EB80eraRI4YAMEJLy?=
 =?us-ascii?Q?1DnZF+Ev4v6BbM5MFbknSoo0PIOLTL2lL94BorHY4QeAmBsRv0PTjfz88bke?=
 =?us-ascii?Q?aeNE9um6C7DNDVQI9OLpHDqwhBD+mVRjM/0d7X7/pZm69tXsiNBSPDDfPPyW?=
 =?us-ascii?Q?TOyr/WU8Mjbb/M4WPSqwkG/W/Sb5ezdG8gOB+n10mH6e7ao+oXpqCaLnjaXe?=
 =?us-ascii?Q?IuLFlEWedmvNSOyERzHrwd0nIzSeE06zT02sEcQpxNO+h3rxx0OAEZm2duAc?=
 =?us-ascii?Q?fMXJUgp7ByVX8Ts1JOe4gSk9eD1xePXbTn2/W9CdTk8qelcWGeZLzQqTjswN?=
 =?us-ascii?Q?D9HypsnhYL6V6ZyAj+SvrrYnskDSt72rGlDIgPLVYV6j+ZoiAWqgmp7NEERd?=
 =?us-ascii?Q?cRJDhQ/QpwG34YfXZA2sXmYLYIVRwYIb5a6IXcsMRfAt6CiWlSS0UM+lYN2t?=
 =?us-ascii?Q?LL/AuPMRmr/RbMA/+DdtqxPyLMFP2ybVXoO/3Y3ZdqCiUfewLQS6Mzl2X/YY?=
 =?us-ascii?Q?BnS6fn1yoK8L802bpeDSn8i0KlYANCaHkpMPG+gYvLO1djdNGWR/iQEhlAOO?=
 =?us-ascii?Q?B62ra8a5Alwi3GnzGwaH9KV5EqSiFHJ4pdT0HbzeSE8Bu/FemjSnSo+nrWI1?=
 =?us-ascii?Q?RPQEaLSYY2J+9I0XqQ+XHCZO9IQg1vd6xilLVPqvBNbtkzwl9udhpNq+rr7z?=
 =?us-ascii?Q?QVVoHPDG1N9cMC3hayqZbaV7cC/gk5AAyGkKm0l9g6rgj6+c7sqEVqNTcs0P?=
 =?us-ascii?Q?AxTvfprpOsSRVdE65cvGCaOEB1PCPxHCaU0dHWcnCl2wt7dGly98+d/WiG1L?=
 =?us-ascii?Q?+43ZOmOs0l19rDasxJNfhf/v2qhHpJXxmh5/jb93H6NafcnAKI0Ao+cJxzDf?=
 =?us-ascii?Q?mf9ve4soFeDGuu8C6VW01GiJvaAoOJYnEuDbyr1VUkAkncPqgrsAYcKQBkUa?=
 =?us-ascii?Q?gjoGZ9AsOBw4D4zxnMH6iKBiJLG5Zy3ABWnJYz0TIikuSUXLwYOWuMrCS6I1?=
 =?us-ascii?Q?PL/bxfusQQmW3afLigSSJ6tIPKYsqJh3TcRDvMwM2Vn2hGJPV89ZflI9WD9M?=
 =?us-ascii?Q?r+1NAk4I6gUg7zPSzIjD7h1e5RMh8J46f1ulGCN4exajGaETlN2Cd//la5Hn?=
 =?us-ascii?Q?J96iHxUzijTS6mt6Dgr5APXXF88eLXk5C6boEYfQ2GbMIw9oMSH4SAuqRfkk?=
 =?us-ascii?Q?LxEZFBS4t6uNj5FtXLO9vDQ4FEMD0rS8Jx95fRkQL/GMNeGnFOR/lpGZgaB1?=
 =?us-ascii?Q?/LxBOSBSVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8fd848-3107-4b61-12c6-08de80197d16
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 09:26:49.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0L+3BvRJuHM8fiySImwqNEA8LBbrU59iYSNNKsEH46q0Dt84rIso9c3aQNOjss8SVD/PDkLhfX4DkbB8bPCR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_022657_402643_BC5E54D3 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Add pcie1 and pcie1-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87..8575134176f5 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -145,4 +145,79 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	soc {
+		pcie1: pcie@4c380000 {
+			compatible = "fsl,imx943-pcie", "fsl,imx95-pcie";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <8 0x80100000 0 0xfe00000>,
+			      <0 0x4c3e0000 0 0x10000>,
+			      <0 0x4c3c0000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			msi-map = <0x0 &its 0x98 0x1>,
+				  <0x100 &its 0x99 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie1_ep: pcie-ep@4c380000 {
+			compatible = "fsl,imx943-pcie-ep", "fsl,imx95-pcie-ep";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <0 0x4c3e0000 0 0x1000>,
+			      <0 0x4c3a0000 0 0x1000>,
+			      <0 0x4c3c0000 0 0x4000>,
+			      <0 0x4c3f0000 0 0x10000>,
+			      <0xa 0 1 0>;
+			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x98 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.37.1


