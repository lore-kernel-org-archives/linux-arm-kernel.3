Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAC9FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezUivcGpZbYAVYIumNtw3ZIDDCWXxA1XbYHh1ceQxXY=; b=JanRpSoe5iunDLgnj6tvLGhKwd
	5K/aURSt76eYXttKZUO2zE1wkfBe3kgm6shFFFu8GdevQejdza4tvIIRFcG7nFV11t1pBQQl2tLUO
	DE4qy5MtUAmqpJg1HHOj3pgSZiWtdplA1ZI40fd1iMvxFhcN0EbFgZX1CDybxrbIz4Vp/JRzEqGz6
	ULNAT4XBh/FrtDTBXQxzjLktgk2SjPkmOiFI+NUP6enSQZHGYG4LTQ8zutB2nxMat9Yk9pvHKroyZ
	jYbjFjskeKdJec9fS6zPgOYUiZgZMttLpEpL7CYA8Sq8n0XxZL+5l8W4Y0jM0cibJk/0zRdVcXdGL
	ayqvXNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZK-000000031b7-44b8;
	Wed, 29 Apr 2026 06:38:46 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ6-000000031B6-27Pp;
	Wed, 29 Apr 2026 06:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTijyBZAeuC/FfNxiwkst87SZVEjK/Mn7+7rujvDlwULbS6lmqz/oN59V6pWjC5Pam22rgtU0ar5SXKji3D0FRVS4JGLGKsBB4PxzQNNFGqZjyAWmaRkgg60cgVFkh8Fiycxg2QbZvlcqwYUOPzopZ6TMLsRGwEVDSjy/9aOscAX+tmeJh/ZNf3RsBFcuj/WQuIZDTPcss+iprxCH24PHei9dwMDdgW7ZasZJq5FhR930+43LwqTtB/wBe4O8nh6LnqtmZcTMR5wANmtq4dj55RlfZs2+vVFEnyNSOUbzpgLLbaZkLIqHz8gx2hrrw+uLOqxM8/lpYIcJ6tr8OI8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezUivcGpZbYAVYIumNtw3ZIDDCWXxA1XbYHh1ceQxXY=;
 b=KrhLprq+8xmvVXhvUt8zg/GUJsP1+g+P7PLbX9gsSezKLiA+f1cOOjYUmg4qweB8NT0oycFL/uHyUo8HVVOptNavjXH4plqG+Nzmql2h67EDinR1BEHD6lidXTHMQhaT639s7xJP6RlWobmhEPToeSjqkz3FonQPW0LSfrR18gHnGMOjHPAc8LYgbGbU/+3+n0SvG6bCHwrZPY5FCNQHeXTbKY2hIQZKuokBRrwdHUA4sNipVt1fcrszbi4avosN6/gcyuQVrUsFjWO++4PapRz3nboRzIjTZf/mRnmGWomKnqtc16a4LehUXSBWg2673qxxAG7U0x+QPAVofxzT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:24 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:24 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v2 7/7] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:12 +0800
Message-Id: <20260429063712.2150938-8-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429063712.2150938-1-gray.huang@wesion.com>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ac69cf-deb8-41c6-7924-08dea5b9e9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: mhJn0wVE7fSbGVY6LvGCsk50kSuu/DICIeYSI2fjdpCoJ6T2X2WPHXm6f3x/Zd+TlXef7h00ThG5emIsna2/r+gFNXcUL29XD04bUQQWAh6UiPnDoqFh/AoYG375wu4toMhL0uekIzDm76qGMmFyoYws4ka4SDB6tCsE1ZhS7UDPqoZlCYrtT1y3G/yPKu4q2lKw9ZQzU3en5r4YNiZQy5Am/GPKiTCxnYirlGbSM5DMfhbalUy7WdcuSXCugH6gMzj8OOe/pQMS6/JzJD1sOjNgiJxRb+hCo5+614x6ulnpvyecH7wuKJpy1hwO+xOahYiJNKQisvvolHngEa2IWeu7zOgpbyytbiTnn+YVLvb3cAUDq9oXaCjjlzq+gGSNmXjy2hFJCEGZHaNT/GKW6IAFVN9eQuhoc963GDunxS8YaNNfZ2yUsns4/sn86L0oj16E+KkjkCsR2lvAvOFCGxsH5QiYarJHH+gm7QuzM+sB1h7xpa/eWv0dh4VWmqiFWBcuTtgX0kDFilqS3cvK3N4XAMD00f81vqkNBb0oBnhUAwyHHoA1gaX6Zfw/+jhME+dXEwI/1D+1VF7S2sf58tJL9eINujJaEpwa/RvKEbwtCqHjG3HKtMC7deXTGHS2eJgB74j9LTAPtIXjU78ir5Gt3aKSeuwv7jotBASBudzTPzaGQ13cIaRTDjO1nBoTPgHV4Yg/G52TziPIrTE85ma91AyUDFlBuKRqPGQme5cUSGJt8+wz1ZfnblToBTiBxohJTQYyiSYj1Zk9C968RrTh8SEZX2dkM5hYZGyWY7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SCMdpQJ50cUOh3tpxT0np5KGpWPWOFvitevSSTdwyunkoqU4XTHqSzA4zPNg?=
 =?us-ascii?Q?9j9TMpTFdooazFVBmAMUgu8NFrCJQLpFWV68+wsM7sD/5BrFCuWqCSodh1uw?=
 =?us-ascii?Q?hSobdf+3GS33jJXxUqRFWU1UxoA2/u299g4BJ1a1OnC2K5CwyOkEflQXjlse?=
 =?us-ascii?Q?w+GoQ40ltaopUTO7iQl3HXkhfiIaNn7bObfMK1VCaBbdqvpAjPJV+dhHha9l?=
 =?us-ascii?Q?/7N8xSzCBKpDp+Up+dKxqEZ7Tuu6ppLc2dZ+ga8aGnKbhlhAILqLMbeucO0f?=
 =?us-ascii?Q?jLm6AAgSiGJhcsFXDYj/Kv7U6BrDybZ8byYwKY6KYRIAUSkj32KLNDhbgPtO?=
 =?us-ascii?Q?l23g65Aij/9aRPd6rdJQp7JbUCYDSGT7DrTgKm73rmpleKQBre9xUoQnHR2A?=
 =?us-ascii?Q?cT3LT9f0qhSkdxu3cSGnFwr96tAhtKp2Yg+Yz/BUH2jlFslnC/0hQfeVK9MB?=
 =?us-ascii?Q?jvnYXCst+W3NDwhfVBT6L9+IMlZNKWk7XSdFTaAgx9QSUf/pMQDr1lmhXsHP?=
 =?us-ascii?Q?xYZxYo8AjOaVQ0yvODVapGlq4NlHb8JeHwK4F0EQSLeIb8b8unKJsm8xGpOF?=
 =?us-ascii?Q?l6/EHMXY+y3VPjEDsCjQ3Xr4yd+9tglMbsoQ85I3ReuVioxXHuCDrLyBoxPF?=
 =?us-ascii?Q?skm6IYi/Sm6Vl/awnMr66HbUnsGFT23yyuWkeQEjz2jdrUGBIoWEQjSJPkTM?=
 =?us-ascii?Q?9GdwyfZ7cSKLmc2izWBNzbh0UHA1GMlAXcphuR43lf4DGxj2+RmnpWXaow1U?=
 =?us-ascii?Q?HM/7Jtg6+d5rTkPdWmAoO8+wuMv0seKjggVd9umTyyvtgl/HwE0yAdAk99tw?=
 =?us-ascii?Q?YO2yfVC2WMzYwzdxlJ2YKu1/fcbDXo1vxyxFeeXuPZEyvIHLcNrAenq1EMpr?=
 =?us-ascii?Q?rmWxtCl3yXqtiBjs6kwDo2gnLmCcgedySEU1WklNuz3TsYQztQyyufn4ocdi?=
 =?us-ascii?Q?umBIkZAeFLc4/jNepSPDBqMHa56cmvDJbgoP5SodQD8/u4Z9YB342GoRYmc1?=
 =?us-ascii?Q?QZeVxW6NayzSmqN8fBPRxCY8xL/4TZrGYhUU7EbqXdzqKfgEzc/PD5M+/I2Y?=
 =?us-ascii?Q?VxrTxNCBOQ2Oa2go68JK/5+YGnZgiu+DYn+YYCXCHQnP+if4PsfvnWClbbZO?=
 =?us-ascii?Q?/vSwXMPaBTL1NwM5iifN9yw1btJd3j5meUvIiclCWNbq9ygbklHPFv0pC3yr?=
 =?us-ascii?Q?vKUFXoT+4Qc1xTnlv6Q7SFVF2/tMsNDDIf9CBHt79iKA4oiOS5DOisyxRNW4?=
 =?us-ascii?Q?rdA1muQwY1h8RKqdcCEhZLLmvmlRyuArSNpmEt3nSKDDFg09Ovzy2domUh9F?=
 =?us-ascii?Q?STjySJ9QrFNYkvgnU19sg7VaY50BFnYfBXTRbaYUL2FHkeydQg4ZYSv99zt5?=
 =?us-ascii?Q?Xjuzrf2X7UN+b890g8mIdkyynX58frPlPaKkmISOyjHljDZxjwgAbe2yYFA7?=
 =?us-ascii?Q?PWI+fKB9fAC7p65Dkim1C9JSDFkgFTNqdNMKDm6JIeLEBmINiQzmXdvSw+ix?=
 =?us-ascii?Q?JvtttPlD7jusA+bhxxYwXXBoHGMrlpkHItG5w8vtyFlNHlDdLcLlq6v4BD4J?=
 =?us-ascii?Q?Z5MaLP0AVBhRXT68TuBbPDOwd4Z7eyvCfarpQPC2QThcEKN3tBhC4vKhGMun?=
 =?us-ascii?Q?0i+ABthj+tsVba7sVFmpSkxBZDIpzEVfePvLIQWpHQJTHob+l7hv6G5DCF/Y?=
 =?us-ascii?Q?6nbO+YGPsRXFSRezvrUxsRj0XhrUtD6nXC7usDRoMwpINisbW9umW0AGgRD5?=
 =?us-ascii?Q?5G2AR4EZ4w=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac69cf-deb8-41c6-7924-08dea5b9e9e1
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:24.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b11EOex+w1GRi/rCUsTtMRXviYAUMEhC9DUcskxvJXejiYmfWgn8L9ANYTZIQV8g2wfCD/4xc2NfCsu9U0joDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_233832_578372_E4680F31 
X-CRM114-Status: UNSURE (   9.07  )
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

Enable Bluetooth support for the Ampak AP6275P module on the
Khadas Edge 2L. This involves enabling the UART5 interface for
HCI communication and defining the required regulators and
power-sequence pins.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 84ac8ffdaa32..222cde0ea44c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -552,6 +552,20 @@ wifi: wifi@0,0 {
 };
 
 &pinctrl {
+	bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	pcie0 {
 		pcie0_rst: pcie0-rst {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -598,6 +612,27 @@ &uart0 {
 	status = "okay";
 };
 
+&uart5 {
+	pinctrl-0 = <&uart5m1_xfer &uart5m1_ctsn &uart5m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-0 = <&bt_reg_on &bt_wake_host &host_wake_bt>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
 &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.34.1


