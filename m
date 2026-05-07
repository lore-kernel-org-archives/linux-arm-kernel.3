Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6BACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 03:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r99aOQbqBEVaFG7rvg1sBi1c5qVVYxsDfADifN8ZMiw=; b=yUxTfy+wGjX2eGb3ZnNhQT61eO
	e+mE7dd8LDNwF9qSkyWWNLALphELOzqn+inPy2bR4aVL8ZcqbrRc4yhf86tJ6sQUzdbz5jbd7Gp5r
	+R57vC5BYzjG61YXZoVTsdq4YsrcR/1W6j2Pkj4RIHy8Aw9hS6NLNQ2ptFlz4LL0/rquDIznpiRvd
	eOxOYhYas9DXDYy+jQ1wR+kHtZdDcpUIdmSZvcEbs+wsNWftoe9vAOVKjMS+BYMFQ57yHtv40OBaR
	m8F0TMiaJO3yD6kKCySkxDecqvvIN5xk+uQOyYFQm+eSzxxglNC0JiI8CgWEfgxbrm0NfZO4SDPpw
	JhHzXu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpXI-00000002eBF-1HmT;
	Thu, 07 May 2026 03:36:28 +0000
Received: from mail-koreacentralazon11023074.outbound.protection.outlook.com ([40.107.44.74] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpXF-00000002e86-3UXd;
	Thu, 07 May 2026 03:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmgRfJRHgoLm4uX0J2tg3XiUqlC+wIkW1fYypmfvYIYys364hCs91LhbSo96TQ0yOIrF5DQACt2SITwyK5jUXO3b7bST3QVU5qHzq9vwP9MPNY+iZAgJkRs078juZxZoit2N1YHDIGK949Ovt/DfNzkLV4pdfZx6oON/nvYs9PtHfqeBeULdQubUe17tKKtTpoAhUSJoJpLY7V45tGfVenfV9H0tga3WFQ0QOFK2BK/zSKZfdizptEJOKGRviaXauZMlpyOcbIH2SMRLTDD7CJ26jyGOF/jeudqb8Zb8c0vOA3R0du0bhWztkpsinwN6QP0R4c+3r4+vDoKhvJhIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r99aOQbqBEVaFG7rvg1sBi1c5qVVYxsDfADifN8ZMiw=;
 b=HL87XpiY5a8XckBH4q3hbC9TT64HVbXid463nZ/WXXj8N5lJiFrngTD7pj2gWt+aYjSsOJv83EI5rXuvhDjTbJbOqqmWyKYOWek3T8RKg5n4pJ919zuMo63hi9B2pnyIDYXZ+P8JjkoJI3/KvpZh9mzK/H1PG0kL98wJFrohBIE0M7tvPYb1bwJ5v8icqjtt/4Xkt0aTlNONMTvfazAk+XyEAybSTsKG59+gh4EhSjRuzB0G1uZ6HUnakJAfBOdQsFhNj+5V9HoWw+6adiOLTpFUX5aJGjRCVVUsjZnXJ/IcTvw4Sj/IyXo1DhY+wRDYtCyIjNdeaSp89dnQSOXBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SE3PR03MB9965.apcprd03.prod.outlook.com (2603:1096:101:32d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.12; Thu, 7 May
 2026 03:36:18 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 03:36:18 +0000
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
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L
Date: Thu,  7 May 2026 11:35:41 +0800
Message-Id: <20260507033541.2576335-3-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507033541.2576335-1-gray.huang@wesion.com>
References: <20260507033541.2576335-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0028.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::8)
 To JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SE3PR03MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b89e079-ea7f-4bb0-2efa-08deabe9ccc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|22082099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: gaJZF3T5ToAZhhMVI9gUUBZvk2hUtLXQcEA54NxSjC6DGAreD7Qq5ShpWBFLVfBRGVXvAq3MEQZ/XhhRlreUjjMvtFZV5t2dYcCY06gJPakAqq9nLoDHCnrnqcid8blR4apCsdrsN+0v+1NTSo0EgYpyYHD1QPtFAjj5XEj2btcfNMoV5tIyyK4PMgrZvEB9Tb8exJOh4tSbHH04OXgp5MjiBmysygGv7/TYQgo9CrlRSSrnNZopyPtlNul1wyU9R3rM/PJoOWiO2gawScsRg5CllWdE8jPYUPrtCtSF32yvZt3E3wS/QbKEkxTugazcmn3PlW+plYWL6qYhjK43XAN7WnfxnL8aBeQKVEDDhXZ6HX3X27t43pkr876GcVxFEsYrfY+xPLHoUJhU7Zw9uaR4koEXzhJq6pANlMYQHhLhgrCP/9QoAgby+1kH94iF4y+Mzw/kKfHaTZhYtUxjXW4FCVgTZkisWfPmBOu1Ttw9rinpMop1WYFkFfe2x6jeHsdvT/VZ1cvmehpnYrsyIVcFJgO/EXlr16JDa23DUc0ZWLX9IFuX1yeTLE/uJfV/z8Ru3XB3XNSamHyf2DvkUbeLvhrXMtu/YafIEQ6Ks8XB54jiXQ+1+qmQGJBrYFvmdDmJ18IonY/96nvB92G4Exm+3W8Mr74FfNuOQWzFMh3Zjqb8JwHWNhoofceW8yA3R8l+lsEEKtb4DNO0NJdhudIO3HlJhyr2zf0MGBdrhvj2z+9QovPsK+L52atE9RBw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(22082099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qiylRB/nIGye0mPl6kpC4xD2b/2TqBisgiudQ6uQWVPqhKYCArDaJmm7vjVb?=
 =?us-ascii?Q?ro/C8fjcL+tP7eTRl8CXQQjuABlicj2URYOqQO3NKWjLrp3UeB59bqMRm1yG?=
 =?us-ascii?Q?6rMO8b89a5SMjg7Q4bzY6D3CmAUe82FeElaIcSIQVRmMFeae8SkelcQQmmV/?=
 =?us-ascii?Q?NtAu/42j1JJHYLQs1Q49ME8dvg/2EsoBzEU3SXyy3p9U6ilrKNxLG7PMqdE4?=
 =?us-ascii?Q?T+pW8htVaLwOHyE4USXrEim0Z0J2WZlOBeJTK1hvo9LdZS5ZHEBWXn7/9718?=
 =?us-ascii?Q?E6Qce6P6MOvS+VVk8zKBOlGRimpp/3g4ziahCB4WVDfhGAen9ZkN3oJyUQNx?=
 =?us-ascii?Q?gAjhpTXpbXGRZCWkLCkEQ1jZEUaAYCEZYStBxbs7Li5JAWaonA1gtbTELOC4?=
 =?us-ascii?Q?ns3Q2X1EmDW1bhyjcfa2ULzGslcm9br8Wj2g5dY9ujaGs8zGPT1zrSjGI/86?=
 =?us-ascii?Q?Uh3ujbshHIYImiWSg5b3a7ZKYrk+/+xYBIgmEfWPWBD5wBBF4DfHcsNhBzuo?=
 =?us-ascii?Q?sCnw+AleR/PLd6mLWQNH0quHHRD7N/3P8dIrMgll0e8DOAi398ZLLwNhzvsN?=
 =?us-ascii?Q?z6RRQ/2L0RdandyJQ1GMw6uk+wjYczFV2hy9xR7wz/P5EP1/GRuYYSZEzdez?=
 =?us-ascii?Q?cafcdUk3rKTqLsb5c8CATCiuQjnWrNJLsgW/SB4zL4HMOnbKKwjb+bcEAc/n?=
 =?us-ascii?Q?nx2/2RF0JIuQ+stxt7jbMpbyHDLFd3vagyqORjjdtsU11yMUWR18a5fZVwho?=
 =?us-ascii?Q?ZDrjqhHAUS7nWJHCmvbg3m32OCLoTbGH/si7ylYIkb7p//JMgAl2RBf9s/4s?=
 =?us-ascii?Q?EJtLHpnQxwc5lPW0ZwbvkwJ05Zg/lk0DmfRE/cDBIF08uwr93iPin+hwA1PE?=
 =?us-ascii?Q?34P58Hp/uZtNsk0e0QAAF60h7fXwOKqVXFQperHVdr3R+Ay/lTTvmnZq1AjK?=
 =?us-ascii?Q?gx0kPLi9WvDMcU58cZAW5pD9z8zgFcKiEBanNfFN5McpnoDILDNodxOcdKDV?=
 =?us-ascii?Q?jzYO0awzf4ZObEmjyu0Ud4UwTF9ucuSC1INL9UW8EXz/TSR9QNB5ERWTpFAn?=
 =?us-ascii?Q?XlBBHEJEQVFNf0MjGVlcsEpMIjNWOBdVWOS52Aq2YhWXdw/TbL62rJxtxA+2?=
 =?us-ascii?Q?j6akvi81JNiVlx7Xrsew3WPJKdxYSM3G7jNUEI9ff+zyo4Oh4KHpmla5q8kI?=
 =?us-ascii?Q?a1J1gPf7JMyIlLkuMsehUYB9IhD9ZdDVa8C1VSs5ZW/swTyKDuvlZsWrEqvb?=
 =?us-ascii?Q?ZiWYC/b0XAvvEGaT2V4XCAWwjNXWKQEHtUDeQ+hi32HNri1nSJ9nF2481atE?=
 =?us-ascii?Q?8VlqEIZeikO5rkbV8u/XkugerBubaohm3QLgQGxEpFQPrC5Thl3u565mJeKS?=
 =?us-ascii?Q?GuUfhXeLBxR6d8C8x8QjCEyMisT2SrArH2w0bFLUvI9z/xOiNPdxV3XwqLON?=
 =?us-ascii?Q?jMY2v9YWhXNKxlj9mK36DK1vJDsjgSiCOuobtSbK1i1tyc3Q9i/scDkiZKSN?=
 =?us-ascii?Q?EGPsQua+6CnrzmvrXKCvPsXNbxmfLkhlR1ygubZABJeE+JZgf6XuY61C0z2p?=
 =?us-ascii?Q?BuC26QuJu6QkyzrMmLtGqUNkF6GITdSVr1qNLdaVUzKBFwqTzxYL14o1RdMG?=
 =?us-ascii?Q?EB7Zhi8xXOW/32sKFu2yGKFcVBIACU9wxC4Cu5+vbLrmLyIYKrS88+Ayei9Y?=
 =?us-ascii?Q?qSzUOpiPQ9iMrQf8R9w1/60OOebvYgJdrENhhect8UFFvLI7J3lHJRNO3hqB?=
 =?us-ascii?Q?jfRBIyZn0A=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b89e079-ea7f-4bb0-2efa-08deabe9ccc2
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:36:18.6073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKrQmNxk574+Wr9M0W5KWnkO9Z78AI/nEn/hi5pVAzLZ7MT2EgMPXDnFVmF7buu+9HZdP73nNAj00WEZ61rPHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_203625_868291_D16896A8 
X-CRM114-Status: UNSURE (   8.77  )
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
index 0c55ff5331ce..8d65e1fe9ca0 100644
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


