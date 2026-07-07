Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szIHOKiiQMmcespUdEZ2qm9hjWqIn6wnj+Nvzpqx6X4=; b=Z1qX5IVcHWSpPnStq4nFhwjZIH
	TSQu9cpV7TgBf+ZvsG3bFKxzGEIiVZVce0zorwLBckfK+v30dyUD85mlkrmuCDiXSeHfVuRyAmPbU
	IFP24R9a2O75E1Tp6wQY21/4zfe72De85aXY3dyilOARJdyf5Hbsmpu9kBobuONTXcuwUGpyASvJ4
	4hlPFcOzOexTeJBJxTGvFWjikiDSJXUAwZ6fyONh81K6FeRlLRn0K8QyrGi2Dxw9edqHAC5+6e8JP
	ADpOZI0+NeX5I9nUWvnmj3Eh094+eDyIfm3DUVAi8KX1Tgf74Bd6WPyIqSr4CLM/XaJj14CZ4vYP2
	7psF+3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz3W-0000000EBH2-3hGP;
	Tue, 07 Jul 2026 06:13:18 +0000
Received: from mail-westus2azon11010069.outbound.protection.outlook.com ([52.101.46.69] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz3U-0000000EBEc-3dWU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:13:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTMckm2Hjl0rL+urM1UJjSDmkyVA/C87Qdeg++BXp2tlBsI9CjtS6asxkeF/koIQJtwAwbavRzjJSpUoNsXWpMLltUdKOJieSk/CL1brmplAa5fTAUSi00G7p5eW2+7LxzP2L52KTTlOIhfbX9R8BtwIRgsHF7ky2nDSj/SkVBlZDT/adzASZtiO/ZV3cvTzHRLHzgLBHSPGsBSgkQIyf8UNg3DDQnAhdeYkA/V4duU6TO61At2nT2o0gavnGvqR9RZacegXUszxhjgxy++fStUTL8AOpBn34tom1K64OIQaBh6V2lwakr8fXHO6hR/0c4jzE9814dt5q+/ZzMwH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szIHOKiiQMmcespUdEZ2qm9hjWqIn6wnj+Nvzpqx6X4=;
 b=By6ewNOM3o9a3fuwbLAcjBDU3A6nU+CuB0VT04jXnppHOX6ACc+MrjMi2Flv/CYf1MlPjTxiZVN16ge77+p1PItAv6Y5qfQyekkt/zazAGlDSUVG0bbE9iJOscx1BY3NGxm7hMaDCZmwuDCObQXmhmBCpvH3o4s6hrnl16a9Pd2d1/nSsPrZGfGmajHjlA9mlGKBxdHb1ZZRcpJbycQIZxvjXELgaybDywjRlOgkLU9vhpW62++7AJIhiZrSwO1F70q4GgVa+J4B/ZF3mmF90jdI3XOk3NVpBeBHgDF5zpCDdj3MwklMEzFHPpzBaHTTKwYEID2QiigBFIXWLGxZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szIHOKiiQMmcespUdEZ2qm9hjWqIn6wnj+Nvzpqx6X4=;
 b=gL1j1X0x54dCZY9V1G+iMn7MJPBplCHk8mgXLGyqmLAqQ/spt4sClcq+eG+/qKe2EghGEs1dOPqJcCZ3zxK3mOWaeyVrV3zyBff8gOgxMwJ5UVbTqdXJovXMiiA9RSfYpjI12VkjJ75/B0Gu+SGsz71I+9Uyum83Myavfh735+OPzZnwaWObVZTgAhnEEPExp7d9ekN7+r1ORF1u3BnMBwxDl6H3PLeNkypUbh47WmSZVSwLanXSgtXBRhX+/Pv3Y+bi6RaYygra0S2NSo+P7S2lttHSKLt508KjqVsjMCIEOeFMCLsEWipP3/8Tc78d1VS5zgh9Y9z0at0FN1uAbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SJ0PR03MB6598.namprd03.prod.outlook.com (2603:10b6:a03:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 06:13:08 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:13:08 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
Date: Mon,  6 Jul 2026 23:13:03 -0700
Message-ID: <20260707061305.27580-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260707061305.27580-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260707061305.27580-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SJ0PR03MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d35276-d578-4a29-8cff-08dedbeed0a2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003|55112099003|6133799003;
X-Microsoft-Antispam-Message-Info: Kt83llUbgnH7PYoh8KLhr7t6prUgkNJ7KTTBTg7f4BB0ae/GilejWjq3JcpK93MCJT8EISTYMtJxXyYpMK91i82UK2S43wBbWfnnpiiT9Xg7rMOZW1lHO74PG91ajZ9ucYnMirZ951ulARoSzG7Z1V6s7iRQM62w4PVHR6Ra6mZ4bqDTONNLePbmxbpplV18Dy79LbwKUE9v79Edsy8/GsJuKnmBx5z23A4nb1gALHmp1tDug4YakNGC8/VtxaxWM6hjhPNQ5O4fmNzrYjIYMsdk7cSbht9zb07H3nA/p48LxjFU8cdBj2swcRcvxK1D3/EG7X+X9zibfyk76KMxT5PZ9AAo+IT8f1XwTYZtYFDjItc3G5rQw3ytectSnOzcvnHFGAJ0dyqY/hOoJNODBycUDDyvgNJO7jt1EWRRakq4CoSMWYRob27DifZeJ8ZGtHr/7gqH38IOqqoJqXm+Xk6MSAQX/3Isqd7f0lNPrF/GU4Asn5qSGBzk1OHS34XBsycgGan0E1gB/fj8Hus4u3Ny+071FjE09auQcv9KA10zijJTRJA+ekuyBQYstCAAAcVhUtm3DB95trSNR7mx+xZl9uepLNws1B0GdZSEPEe7AXq9YuVQrDTqkukS8f/uL58vbgBdN0Aa+i+N64ZEeknADw2ahVQ1nkx9QdfhozM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J4ivp3GbejL9O1YQWKjB3ps76whHYmLZXqAEVGCDK6m4nsxZV0CWvc4uUmZB?=
 =?us-ascii?Q?qvFmaBKgYKGsSTKO5Xyfd4hmEosoBgHX+mLwE/ulIxuS2kFAjSIsGkmMh3Y7?=
 =?us-ascii?Q?Di+CuZ9DkeSPd9r1GQclJvkhRR1XXAuCcnI4+HrOfIm1qdxeWQQycTBDGafx?=
 =?us-ascii?Q?vGrjVM79lEFal3OY0nAYlLAa7nf2VWtYs5o4GW0WGR5ZIMe6LdLLDFeptuGr?=
 =?us-ascii?Q?NvBkRlYhzL+BkQdESEHoqZRmGOyKrglKZaS9646IJSesX9gxIhS9+9gZGNNC?=
 =?us-ascii?Q?waMUoSrdjRqMratqeMQgaQLahfl5ROMls+xbEzfnFHMDzjrMz9MVTqmh/gS8?=
 =?us-ascii?Q?kGYe/+yVPYoKrh275c+ZlxJAL9TOfVhCLh/ZUeAS9gq1vpEx3NSXoaoXlVUm?=
 =?us-ascii?Q?I+jH/t4NT68MtpaaJSisK52v9fKPtzuytZOkaytqlCvo5ao/8oFPsMoTXqoD?=
 =?us-ascii?Q?qc3giq/zWZigpWQr189So8TIdaALRGueq98OIzgQQhFRvcVgKno07vn8mcq/?=
 =?us-ascii?Q?LtBDtqIYdf9AnbxUGtlFmILFnHhsz/z2osFdTMFO3MKYMx3m7WdG2pjdenXo?=
 =?us-ascii?Q?x/J61AmL/Xzuory31tvQAZxbu+B/KISNbuxNbp5xYdfJm1BrdSu9Vv2Jan/B?=
 =?us-ascii?Q?abXsXUMbggz9w1FR/ogJuQuhSKXc3ngurf/vNBGHJjo4Nrm+9W+PDds0QnY0?=
 =?us-ascii?Q?/Ndr5Bwvv+YKaXhYHMj4w1ciGRmn2u/IKKhGq+NuBzlvUGk5hcKC+LfU7zqu?=
 =?us-ascii?Q?TrxowCLmvj8dbTh4kpokYUZ6gGz9dJ5GBGaMgzZkrCHq+LSrj2FGyzhmp5t2?=
 =?us-ascii?Q?c4jrGPjpmpyaDVW0ULRcPamTh4AkTkTFEuYCa6E345oRzytZIzsVFV/Wt0h/?=
 =?us-ascii?Q?4o3geBRycXje8EoFMDbSqDazUBgrzqk1n98YJZ22AvL65R+QTVh66MBCoo+L?=
 =?us-ascii?Q?aIXKMvJtGiz9h4gBSNuCyPxHsM7YHrUPNGWyTSvLBidGHkjesbjI5Rg8GRWq?=
 =?us-ascii?Q?R5P0uYndrVRrGh9eJuOzknDDPm6gqdDFWfGuv0G2l50HaGZNx1h1VjGfMNJq?=
 =?us-ascii?Q?kCFArm4+enkbfA+g2wUmPNoiIvdJkWi7mfaNgTUwVstNp5Rw8pCkF/HComu+?=
 =?us-ascii?Q?DnJLVdYaLM2CL9LRJaZf9CTCFd2VArdpXQjkccFarW1Vg/Yop1DpKyEYIAG3?=
 =?us-ascii?Q?xftFGP+HQDeC/GaIdI/atdWh+OUHKOrybtlowz1MD7N67uxtCaivrxVc/4Ir?=
 =?us-ascii?Q?+02PfstKv37Tv+uc+hI3N3BgOk7f5zuRB+yhPeeOs3hKaaU+cboAguHW+SvP?=
 =?us-ascii?Q?DD6ZGcx+hukof3+qdA5JCu9eUavyf0/x3p1Y27KOVr/cQqBsZxM2UbbAcwl0?=
 =?us-ascii?Q?aMlCX6nibhPBCXcV7O/y4DYfwMs489pZLsPFTIbF6qkvLrb18Qp4JJO3zr1d?=
 =?us-ascii?Q?d1kUxP6viEOH+iiLg5qKbI2bczeWLAtOFHY9DR4MdTzjcOXAqK3J/uKZjRRG?=
 =?us-ascii?Q?6LzTKfy9aKiob/LhSDBBzx+y1GT7ghdrjCNEsldK7vnc9vqqwBGTiz8ZCcwW?=
 =?us-ascii?Q?MfMHMfGZ8L559pmRSsde+8qvkqB3BGRLoYZFgASaWkWNK4nDnxBDGIijhtzc?=
 =?us-ascii?Q?jQRULJ3ffxvNVaVrly6BKvcNOQwDfKz4xPKjpwgm6p9koa5b4p1jOyGCmL2T?=
 =?us-ascii?Q?NuephV9fE1ktAqBcSyz++rRDT/J7jgidCIRiRTk7S4KyTTPxM2k16lvMvWMq?=
 =?us-ascii?Q?ZPDAMHqOZ5TFMRdWGKGWOhR8yFLIj8hQQaWpp+JlSEVN9CPjUUSKX8oFFdni?=
X-MS-Exchange-AntiSpam-MessageData-1: 2yhSMCP9Ejgu2Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d35276-d578-4a29-8cff-08dedbeed0a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:13:08.3912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmsOcNwdR3l28tEjCIJcaGGFnutVvlcWZCeUf+hwn2ilG/1P4nFL9Sezhr+5xyqAebgKi4QQSzuVYPLJMEyem4FXvuDb1SnqKE+J/q30OCFupj9RN2i467GIJFpa9Xxbc9yeU0tUq4HUyXlrBRNI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_231316_912034_3860488A 
X-CRM114-Status: GOOD (  15.74  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add device tree for the Intel SoCFPGA Agilex5 SoCDK TSN Config2 board
variant. This configuration enables gmac1 as a TSN port alongside the
standard gmac2 Ethernet port.

The TSN port (gmac1) connects to its PHY through a GMII-to-RGMII
converter implemented as FPGA soft IP. This converter provides the
RGMII TX/RX clock delays, so phy-mode is set to "rgmii-id" to reflect
MAC-side delays. A board-specific compatible string is used so the
driver can detect the converter and strip the delay bits before
configuring the PHY.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../intel/socfpga_agilex5_socdk_tsn_cfg2.dts  | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 270c70fdf084..ce7cf3a63275 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex5_socdk_tsn_cfg2.dtb \
 				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
new file mode 100644
index 000000000000..bf13ccfc1faa
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK TSN Config2";
+	compatible = "intel,socfpga-agilex5-socdk-tsn-cfg2", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			gpios = <&porta 11 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+	compatible = "altr,socfpga-stmmac-agilex5-tsn",
+		     "altr,socfpga-stmmac-agilex5",
+		     "snps,dwxgmac-2.10";
+	phy-mode = "rgmii-id";
+	phy-handle = <&emac1_phy0>;
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		emac1_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac2 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&emac2_phy0>;
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		emac2_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&qspi {
+	status = "okay";
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x04200000>;
+			};
+
+			root: partition@4200000 {
+				label = "root";
+				reg = <0x04200000 0x0be00000>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.43.7


