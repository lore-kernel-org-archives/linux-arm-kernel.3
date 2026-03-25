Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2A9FEA80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMV23ap9cPegrO5tdUTIbEABjssSIYBYsnbwOLn6OFs=; b=zI2n2dKvONp4sRovN1Kh+dF/o+
	MkqLWEMoq36ckOxCI9d/rUv4AcRH+Tg7n3kIXgyunUKpL0rKwCZXKguXVbXiKrGlrOyAA7yAcyK7c
	HLkyLSbqbwE5hsgCxK3DfjLC97mMSBNh6oCJeLSZLAvTrg+cPb2dkFUL2TFCOxxbFx2Zf22uQSYQF
	l9mMXb8HwUO/FzePFPlTuubHG7wVwnKhng9oAII3ePjrSezR+5CsvRXADWoM2BCA6WpDr4D6Jh3gx
	2JlLJT47IMB1sGaKAcZhCMMfPnPzOfmrDbjEvnr1CQGCdTsbAdz4AsI3cpM5HmUMSl8kzWdVz5BOZ
	5gdxUI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H7U-00000002kAC-1kFF;
	Wed, 25 Mar 2026 05:49:32 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H7G-00000002jyd-1RTQ;
	Wed, 25 Mar 2026 05:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7NNXdzP/Y8jMbehz3MK6yAyqk7iDtdqEDOsgelB8PmgxZfTL2y8KEGwGo+6DhQ3RF5pTmxzvE6MvVj1DbXNpdAwJMQGRUE6tvvRe4tt4xG6ETzU+okRcU0HItnK1fz6lwNcj4ZsBzEipb+vkzOQwwErLWNO5UMZv5Uc4bzzYxhzray4V64vOSuyYmZ1lGpWhkmiGzmz31AHcD1+SYvO2a1aiLLCA+egb2/tEag5HzaGqdNZqcHhxuyy1gzuc8Rn9BfOqFWScx8hwaweOJOIPxdkOHAFSFi4MQz0H5gQKtY1WbfVUZlRU8XzKVVrxcqh8Sf0W4E4dUDTMAdkd6ddEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMV23ap9cPegrO5tdUTIbEABjssSIYBYsnbwOLn6OFs=;
 b=xSg41ZDPLSd4t0hzs0UWe5wXj41BuQQmFcWwz10di6uS66rk8gssGX+F4BRRCQrTQhsbfz2MMMs5h/kHKUbHN7P8XnYrLMcNTTYihRcpjCT9XWLoodBc4pQYZ5IUnadOvP6nVRtpFaEAkf7fhdSAtSpMpBf3dvgWpydshMJ1NQmSrfwUnbK+nWtD/yY+JOfy/RVm2Ph+W77i4eEufdsXWkArNmOlk9oMuFfNpdIFPJq5CtcJgYYAls2vdOH/6y73ASq0pynda7xPVZslBwvdoH2Tw8YHv65GAN6WN74QlNfqSjqnHk1nOz2pqeO8N/+Mxe/SP4fp/kfxMiDPVqPZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TY0PR03MB6678.apcprd03.prod.outlook.com (2603:1096:400:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:49:10 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:49:09 +0000
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
Subject: [PATCH 6/6] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:14 +0800
Message-Id: <20260325054614.1497147-7-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325054614.1497147-1-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|TY0PR03MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fe00fd-d954-4db8-5277-08de8a323c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 9zTqPP4CLQ3BACjPROEgOZI9BBIJLcqpyKXXvT7ZUL9qkS2ALDMFONiCaBi7xnsaKfeQEHvxRdP15PW0/pPObcahJDGendw3M8JIsLdg72tVykecFtLXzLucjcTZk5bAjkyZpRxxHtm7VI+MBDk6yofLWhl948sGM7k4EUCcvdF7gJM0pNHuvDOElf0JvAhit45Au9F+75HkVHB1YHmJdomNrea7RUKV7iNiZbBJ6O/6tFY0E8EvTKk5TUZ8z3ktg2a6P1G6N/OVy0aScE62j0CTWLzc20Kl51zJrHdNQyGZXYiO1xMr4LimNxdE+YCukR9ahfBepvv4zmras2GyN6uxwJMRpFP7ZXrrKUFlZLQWqcwjzrqsKqb40wZezPNg0MfTk4E9AFZv5geIV+aaTDfCw6UR1nvVLPcGE9WOIzGtqA5/erZhHIyfiyj5WJToUd3sndzaaGDemHXOScdLKGW62vXQZ0ax+mf6hsTaZHOz/38jfBJAhgaV8yRSPbNaAGZm0J9NOJPUvdrvRx5iCxDSX5d2eaXd9ajjaCGOWK8FnCmHbA5rG09p1BM5Q+COwO0B1wqvzxGccOzcL59R/k8S5K+N+5zAU0XnvpKcfJrniWEpRZyLfpmNYE4JNMO1s5l2xKMppUbNAqRM0b3fJf0e7f/1QiZgIBpyhPkbXaTRIVEh4icVVf9+gJgXHmAwPfSn8ufyoemf0Bftn6AOyBgE7GLiwZK5Yq/+F2yQ1GXN/8urxfbOsbekA9cJ7hXuQqOFNH6U92R2SQIQs+4QJrGMkoYGNm6RvoiJNcGcOQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7CkmtqlZwz+namDKut8EOfYjWcvHGPy1xAyZ5OAN4EUJHhwlnpI7pjQo1bPq?=
 =?us-ascii?Q?z7qNl8GCY5751PmHdM15ztbDb1lal9YbD8vDZzxJ9kzunw0f8bxI4YqSv0kI?=
 =?us-ascii?Q?TtYIQTn43tqcRMO5Mm/2hKH8SOcw5is8Frb8kmCoQdx2UaseJG6GMw6pq/VH?=
 =?us-ascii?Q?dL/DILT3naCgalSYoeIlhG3biUAkXqRTecfKam4oCZ1geweg9kcEpkCp8K19?=
 =?us-ascii?Q?vV8vF+fRWWYDt/aKL3Flcvg43XSoRhl2UXq4nxv9EtZNhYCvPnh0+vEhPZyJ?=
 =?us-ascii?Q?/8MPAiLTEIiGFcGlxNfkLxBa9higPF94EjTt+vGypXIwYVvZDeVMmePonup2?=
 =?us-ascii?Q?QDyB6Xc9E/Qs41xqSFTdJ05K9bqnW3EQcOEPsBz4j44EUW0CIuPoHaAtFxHU?=
 =?us-ascii?Q?nVMm96j7ruJ8d4xjXIn9wcjW9qW4YBH3VRLqrL3jll36zrMoyFk7kZk458+9?=
 =?us-ascii?Q?wvBAPw6/xg+oWvlZhmhp2XlEINKRHnjnc3QzxaUvo9SBhb30FznLZD4gELR4?=
 =?us-ascii?Q?YyjNwUr1AXIHLH5CExTbPZU542rcg0c2TCJLG8b5SDP1Am+n4AOzUo3ZKCYl?=
 =?us-ascii?Q?zoLG6v1Uz1trA1jJ1KwvuZqd4LxRWcqGktsH2uXWMMLpzmAqm5aBfjWU0ATA?=
 =?us-ascii?Q?h9/3x2zExvPLOZRnrRz9WKNIJhdO2I6YaB+59NMPWvE75kOdraPm6dobjsY8?=
 =?us-ascii?Q?fkm7sVtUaDY5GoeUEsEx+AEy0uL1MKTsgRs3ZXH/biKkY051pAblw74+bVtX?=
 =?us-ascii?Q?RA0Pso9SQwQjV9X+80/eothYiSHRV5eYPmjiRpgWWonWoSwBONr3Bf8+kRV+?=
 =?us-ascii?Q?5K+TGgMZo75lyZNY5naloF4xiSqTiB1xDofE8nzbUFF/L0d30eYS5C936r2O?=
 =?us-ascii?Q?cWwbYQHWQiIHQpbA2qD3rp7KvKHAuMTGa/GUDdKtSqX3BkgQkLSOWaJDdEwA?=
 =?us-ascii?Q?kOwJOsyFhoQfAECmAmMmt0KRawS5/YnieD+x/8tOom/AnaxR4aHUyB2GJ6Sx?=
 =?us-ascii?Q?8HJJti6/fm+V4sVwlKwgLmrMyCEKvNMSGsnu7tJc/8KWbG2iZrtqU0abKfRc?=
 =?us-ascii?Q?KMNTef3H0n4nnw/dcNUdP9LI1AqzwwbGVtgU/m99rnfPz6H4z2b6TzPq4eEF?=
 =?us-ascii?Q?vTAcQ2/fckg+dMLNWuegrfVo+w8KwGmcoJkSFpcQiK6XPA/7wxWh2SuXvxyc?=
 =?us-ascii?Q?UMm/KuMLa2EaPRX0n9RmkAee/FGdQq8hnC3zCMVnnhm7d6zEf5+bkGWofH4/?=
 =?us-ascii?Q?HLtk6NQYiUwHx4WEmCZRtARKcR3vO28lSV4PZxCPUjDl0Z2RMnRXc7FpfgZ2?=
 =?us-ascii?Q?9uT8cYB+v85j3WeFFeBdEPLBffeIByvUVHsja+d/SIgQOy78zZUIFvF4t5Uc?=
 =?us-ascii?Q?CxuqnAcdl8TkUvUSVstRiX1d6d0ulHJ34UEXRhCkkHz/9ylMVao/Uvyvvyos?=
 =?us-ascii?Q?5eicq3CxIlYY0EDJdSoVfo1QkZ//JxSRGCQoERB0X7XzBOihlWn2mJXK/Mmw?=
 =?us-ascii?Q?B43AdBSMaF5FnIwmbz2sCTr5uuoYItXYwzxkoojk4dFvC5NYzPmtOw1hoPpM?=
 =?us-ascii?Q?fluothmfS3g7Rfr+pDk/Mq5C7Ovlv6NFEiWJQENTkvcG2+26nYGQn6Hcesf7?=
 =?us-ascii?Q?PA2IZPzdtf6oFFa0ixUJcY28CfwQoVAjcydTkt90r4PUujxLuKQeDcriDL7W?=
 =?us-ascii?Q?dD+lhjX9fxAUYZkKdq7274SRX+fsnEQ+7FZCV6us3k8qvnyeynmaj1MkxBjq?=
 =?us-ascii?Q?TPonrGO+dg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fe00fd-d954-4db8-5277-08de8a323c29
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:49:09.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxDh5rKdVVrj30FDds3Xg9rVkgKESQPhG+6XYw4jWXciQSfWHZ/S2yVuQZ/B1LhCuSWbh7MzT3UsEJ2E3PNGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224918_399161_205CBC40 
X-CRM114-Status: UNSURE (   9.25  )
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
index 8ecd00f6645d..345dc4c981c1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -560,6 +560,20 @@ usb_host_pwren: usb-host-pwren {
 		};
 	};
 
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
 	wifi {
 		wifi_reg_on: wifi-reg-on {
 			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -603,6 +617,27 @@ &uart0 {
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
 &vop {
 	status = "okay";
 };
-- 
2.34.1


