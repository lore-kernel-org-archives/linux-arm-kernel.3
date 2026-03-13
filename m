Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964B9106FD68
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=; b=Pr1AGSXA2S4k5hcXpO0WnfaXTt
	ue/IRuYYM2wYrT+ynHqr8geQkfZDF5aIwDUEvMMYAx3CTlYvawkGYpaEtlOYcnfkeKT9KpdeRGvi8
	MKGzGKRkLiyGN1Kvcj/u2+4SSW9g75cy8V2nFaVmaa4nfQOBTFeCfS3mqNZDugQIxW292dJoe15R2
	JoQ6hJMDxFJqfcR/32fdTXP/DxJWXzfoYbEf+aeE2zjCQKSgd2pPwg+nU4nz2oc9Ivug+B/pLzS/b
	g2ir4pfFRgYNyyQOpWA7hnEzGwgb4Vw3ZRuTeUtYJxaz400vqATilsWL0kblmnFJLONnpUr+Z/j2h
	j8oNWbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rx8-0000000GAHG-3QdH;
	Fri, 13 Mar 2026 02:08:38 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rx5-0000000GAD1-3p66
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExFMKScd0IQEJvzPdwiv7CuJyT/X+fgB39qoTaRa/SSS6D72lXtUxiFKb1B+bbUICsqGuEN60NDCp0oRh1FP2hSxCbFp7u+ryOWRAFhG/g+q+hvAzgWA2WGglP/lex1F0c7NiMsFqccJFJdoKDbFr/sUx3SMjo1Uklz65PKDaIp0QtAHKpt/cxWHLALqw+PFg0uG7oClvKx/8NiGVM6BZ38PYmbS3Wrp10fMLVdcT7jRTG3FUdeNSe0ICZjj/cZ3MbTQJ4TpKYYZsZH65S+0W2Kl4+i/F3rc1vtJ+6prcHCkzFPkfKOFkbqxlpXEk2JKJOxtVRTaowP6u1uP+6RH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=iuwJONNYSmTsVEzYcdy9/wEEK37W+y9SQro0RNMyL/4z3JxQxPBFMQi1WLydeaq7kKZ8CaJsBjuThuAgQkTg+GMfJmqmEz9Saf//SgDbKuJw+kGUzMlCujw4eiE9g4Or2lmDJNHgrvQ6PG1I4FsqGvDsl95VuH8R4GWcB/tL4Nn1aqQ1SFE+pVH1HmONPsNHpPZ7cR2Dtxv/yaL94lfDQf5UdJ1Tr4/zibzWpwx6KXfXjJH+xzZYZ7fTSJd3sdMTQ3qoLnbaoK40l2pjfwJVf5B/Ys9mUVUNucsuOKN1mEVmWkvAUpN4NTUrNN86lIh48MB3O/srXBd0h8akuSc8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=bPWGqxRsvKL0bBRJaIOZvyRQJH7WIaWojnT0LzTX+sS2Rgq3ShX2GP4RQnbOShWSmF7rGFJdeOoO1MaVQ4loRp4oCdtziyk8e2VLfoJRITgD44xwq8yRoHB1Rt6oHcsILkGj7d8SDQnYie7MuFPPAbtiMs6tZQG98CdgvEHoRVljyEhWp62LDCGrXl+IA8ZFJsQ4mfLKEEuNddAGTwfuzY4AQtl4/4yLhJBPdpbXnc+23XtnPYGUjJQ9jlv4ySSnEsNFyKQVyBvdJjwlsfFOE3/MrRKM0mNNkr3IzN+nFgDIauWOyFpl6hD3B8FBpJ040h066kqUZF1TYQ1NYbgFTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB8PR04MB6844.eurprd04.prod.outlook.com
 (2603:10a6:10:112::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 02:08:15 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 02:08:28 +0000
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
Subject: [PATCH V8 07/13] arm: dts: imx6sx: Add Root Port node and PERST property
Date: Fri, 13 Mar 2026 10:08:17 +0800
Message-Id: <20260313020823.1592389-8-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260313020823.1592389-1-sherry.sun@nxp.com>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB8PR04MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f182b01-4b91-4ae4-bf68-08de80a56aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pkkPaIhi0MNSwv5h4adoCcRPvZGP6xE2mMhhCyhwUiow9sH76ZtVh2E1VuyFIxWIkMjLjxF6EVQosmq7s5+uFHP66wQABYZe6BCQwBpx2rRDXvwR5No71PbrogORqcYlIa9gYA53CnpK47Z7XL+nEhDW/8Jz/tXdspj8hTioS1lqwNohEQyHYu7yqqi72BnLGv5zbZK1ew7mUZUqPQmT4pc0Kv5pM5c1TZCHXc33zjVs9M6ucPqATUthgUfXPUspbCGMMEgy5nTu4/IhK2k55IruoSWnMiQxHfhpScsAS9QIDkDJcOJoBSMgK9NaAPaT+5SuUqAcTuVi3ol6G7LH/h8lYrRfLF/CgR7tS8vcpnYVpM/zbNj5QcUsgTQeCfGKzFraOnVaYgPcvwmi7HQEUzu6URzhZW4iCso40me6ByF3Zc7C9JxAecB+4114cjYHS0TfnWSEOBNB+iz/dvhFShlcoamC+l3sI8NqJ23vu2iSj5KV8kEaVL2DRBNX+5RP8hs0WViMxDprDDHYfoozmpSYs4jVVvrYwvwdG7ISdcMvSdgzuqD8cnBxsHJg1eWvAqMgQfguZ3b4kiaPwcEUQQUYWUyLZtodWJSFpdAREDUMYdaa8YQfVnW0qx5/mjOWMznsm4gTc/mqjVot6BDKIE4K8nGzFGJ1cHHsHliFdus53CaKqe0sYv9dzxIlvYtwc6nhL/lYBXS1eqBu3DuAJ9j2stSyZ+nkPf9UfEpNy4+8tUV+a5JbsWIg7j9nZdkcyoXavZxJcTVojMy8ZgdBJWUunVQ+g/1GllAaS0BcNJvma2G3NOzGiLVh0FM2NrTF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EyA4Sc1B/PfOlPLCYoiSX8kF2dVeSvyx67BsctoATl+O5wF6p2ZGk7V2uPVH?=
 =?us-ascii?Q?+DoYCfi95ZrlEfG+728OUnD3TbmbmYqisTCuQiDgZd4gBpebqYGF7Ms/+qNd?=
 =?us-ascii?Q?3OTOe5BoQBrAeAYnWADofFWaFKQJIRtbyBlFcmhriFHdP5KzMvOLPNk81/Rr?=
 =?us-ascii?Q?831MAf21lPOJlBJ6LWK1/JSYymwNrHWO+vTdbVFAX9dKTiSuLv4rTQN0f28K?=
 =?us-ascii?Q?PsvUwynm2WiN6ave+HpYxcoSAjMUK6zd39bdi92npMHz/FUXx/6dFpfXGPJ9?=
 =?us-ascii?Q?U+PCnEr4NQc86lJ8u3EReosP4o+FGJzaacT+ABa08D5Jyp+1QKIa3v11yC1l?=
 =?us-ascii?Q?HQGBkK4jpbYOMDfHjzH7zTojmQ8FuiDkGVJpvQkjP0yAXeGu4I53IkmWy8h2?=
 =?us-ascii?Q?KwZxGhh02mUPmANESb2ctNAwNXC6gWu60baUpiKm+rpuKltRCTb2WQMe1Hb3?=
 =?us-ascii?Q?F5C9Qk05pSgpBPZ9uHCz3faodyixJj9XopZetGys/WLN8snq3+rbp/jy1Sh9?=
 =?us-ascii?Q?8ZDWnzUCQKKi68l+oQkxznv2Z9k8kaFJ6FMBKw5vzjKmiX/U7aLTvR80Hab2?=
 =?us-ascii?Q?L+fG7Bj5cLYi3ztU7lZ502m9Vrv1XEX0kcKvmXAgzboVfwpqUvZpExchBEGT?=
 =?us-ascii?Q?ZQM+MS5FCwo8tgR6DOQUL47MNqQE+kc935RYk5wPLNoUydzRbesJI9G8zB8A?=
 =?us-ascii?Q?cdwpP+s9rAMO+ot+aR3bTWvugbuf2j6O6TF0a1wcQLRRwRy1OkE2dIcsdD6b?=
 =?us-ascii?Q?N7NBZz8Fo+x27CJGXooWPAK5USVJDd4dxpMFb72dIaT/eCJJS98cORhGjCzP?=
 =?us-ascii?Q?kDZGDFiYHzPUF2BuwXv0lxA3OSrgnS2cBlLwPfKiHLUrhjnbCGkHizd+r/KS?=
 =?us-ascii?Q?waKOM2c8X9yKlqdBQUoeDSjp8cVS54rXKYki9Nxw+58hd99fXSvKXOviNwac?=
 =?us-ascii?Q?DNpOEt9THAkSGwvUHy5KheHO10aKAJf+oEvMK06H7Fr36RzFupRuKL4Wunya?=
 =?us-ascii?Q?Ek7HUrIn5judP9wc+5HPnkiudrycAS5K5NwWltDcWn66YSJc0Zq3cou0iQVm?=
 =?us-ascii?Q?Xq3ps57slGltlvKr8UfWbv0fI9l/bZXfSlJyYCA9ikZ9mYGL8AjM/8xhUatq?=
 =?us-ascii?Q?+4KuL5azWSjLKY1bHJNqlX6sCbF3DjW8lV4INbJa3lp7cdpc8ha0TPYa3DJo?=
 =?us-ascii?Q?6VgMVqAprzd/i9HmH5XaLI8IzvJ1BL5PMlA/iU+f502vrKtcfZlQNvB1BTLO?=
 =?us-ascii?Q?t/4J+iLNGv7HngzE+/6gqboGdiecfsnIkx5nHcwwZl9FNGGfXexc7totuvxQ?=
 =?us-ascii?Q?qL6UDhtKRAbJuEVettjLKzmqH7/DH6XPzbWjFnPMiMIS6AqpPekmSGto0iTT?=
 =?us-ascii?Q?ZppFS2XIAdYk7c4cvT7Wbb/dr73QnUVTj1ctRFHD2gmX1kO2v9U0UHrUV7WF?=
 =?us-ascii?Q?rovsbOK3ldwT7/3Y90JcUkWDPTznUr8BwTaO/TW/7OVm0mDhhHd3LSYXmXIX?=
 =?us-ascii?Q?Szr2cg5pm9vlK84zcAaIeP1hTf5b+KKwiEIWgLfXVsRrlk6LQdDDKWd3K+gg?=
 =?us-ascii?Q?NtdqzV6osrj6+Nlx7t6Ib5ov6UvzmoLiPTMTROh4BS1Af+bYDHf1+ghxyq/S?=
 =?us-ascii?Q?6rDdqD89ngVxtiroQOHxeDYskCBKkfEVT4XIHEdCmPVcLcS+df/WbqjUGD7Q?=
 =?us-ascii?Q?IMFrevC8al/aEjg8fFMme4z70inTGi0OssOCQJ35Q59OsG2tSBAzrfwCX6QV?=
 =?us-ascii?Q?qReTGsisFA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f182b01-4b91-4ae4-bf68-08de80a56aba
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:08:28.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ck4AEtaPEtVHfpHOspENpSgYGK+PvPjb6l6K8aYeMmuQPRR4VCQVPB3jrj9Wgjz8p0SRBKjiLzPiWdZhBVt1QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_190836_220048_3D72232E 
X-CRM114-Status: GOOD (  10.61  )
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
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..338de4d144b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,11 +282,16 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+};
+
 &lcdif1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcd>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index 1426f357d474..d42363cb5105 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1470,6 +1470,17 @@ pcie: pcie@8ffc000 {
 			power-domains = <&pd_disp>, <&pd_pci>;
 			power-domain-names = "pcie", "pcie_phy";
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
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
 	};
 };
-- 
2.37.1


