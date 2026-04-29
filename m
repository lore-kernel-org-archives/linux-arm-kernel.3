Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77EDFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/M9sfkH3sKoAnZbi8guHqIPoXN6pnDVvz+Q/N1e8vOk=; b=voPEBGPeQZMp4oyZlnwA1M4QDA
	50kyB/EHOl9WVDIcXNkoUNwTq1LEgCzGIC0TfXv5I2SuFEuB64loZG4iMQpKKhcH40SSqCk+/KRdZ
	IUf5xxlI3Gi2QvQIH1tOqJtHmicN6fvu8y3eOCcK3WJg65l3SQNtnCfXXvMPNxvfxEtwCz0AzXpgO
	ifTUz5Wy3ZfhhmbYRDBZgKmIgC0sm8hdIriris5g2txD3Jn4qmjmgqpVeQSUuuYNcOukjlL3howJX
	WmLZ9v+zc6Zr3BoSsZWFPHmP2VqFFirFuzezeU6qTsAwygjqRSSkQs7r/B76Ks/Ho2sp6ULv49d3y
	6pZ0ooWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZK-000000031ag-2iaI;
	Wed, 29 Apr 2026 06:38:46 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ4-000000031B6-3AeS;
	Wed, 29 Apr 2026 06:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp4EkZhE9Vmw8mPfP3wzXlf4nBv2zfLcQueL1KqPXc5ZrV9kxTESzXzew6wvrm3TiR5CbweKSHSoDhL0Ra0+a5LZFSuedIKoNgQSEflAkanbbJLGxFFxRaP6z+K19JljC+biJAUCTjRnyMri9+Cu2vfUSNvKml2VtcOLgB19xbkedPyugJ28DuXwYsi5xEVeclXjxKzY6AP6yMkBmuqAsrzQ2wwifmzYTeGLZ2tblrkzf3kIuO4fo074An6LmQVByp1Ck7mfA+uM8nKD5pMQS/8LOwJcLr8ua+8T+/AjsHSYo5iDHoVsfE/r3GM46BtrSZVL6Gnw9fmgx/HPmu6Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M9sfkH3sKoAnZbi8guHqIPoXN6pnDVvz+Q/N1e8vOk=;
 b=jBYjqQYN5O/TSplGlxSfs3VcZxqz4/zSLXEiPnfqpyXkyrbtCl0y/mbwL00sLZQBEv8VRCX0w0J+cCNu8uWZiQ36pmU61j8tYZttiFgx7P0cDhhLZXy8EzmSxPAJOjGTx7sKMnBWOPSpSpVeD+eSM0XywQGj60pQ71/IE6cSoL+X7KiKf33fHbIAw0GmHJUTh1KvLwteKf8EftAfrK2jkHVutE+q+pu+D12n0hVOWqnxTaKNtS2Km4SZ9Erv7CQcQA69YRgQ6kMNS7m+ytPlYLRdHl9sHCukEFl/fc+zk5sTisEA13xi4jnvtw2RLuKuYFvaHd3xYD3g08fFcoCcSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:21 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:21 +0000
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
Subject: [PATCH v2 6/7] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:11 +0800
Message-Id: <20260429063712.2150938-7-gray.huang@wesion.com>
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
X-MS-Office365-Filtering-Correlation-Id: f2d68545-d2fb-453b-9452-08dea5b9e7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: kNniPbI06mXCwegs5xTNlSAOnf8vIPQSlt3juQEg/TD+22NtGCx+CFAky9JwDSDCK9THVT1wPKoyb4rUyEdL6PnL0TqcDWMtACtVulJosrmOZ0bZJroKjNVMNmvrbZSpSMHNYsgmNVp1W6cBbUlz01QAV4vu08CIB3R7oJrhq7dsC6FAqmlw190I+a6Oo7o2QGLNYuzVBZniEFqLP16j6bZTFViVi95dQy/BZAe8D8yfddrgCxkK0HX+6WOUHD7H4E/bSXBkkvqnDHr4M3Z1tb0pKAnRQxp2Q0FGPr9now/nT1/tW790+XsFKEjfd8dTJiTqshpL4Py2ByHjFzQb2kT6sxHOMC6LmjFEcrJayfZYXQV1CYi+r1EUL7iI+Z5LyV/7mzn8gSvi4spc2trIGE3QSOOhG40cfqup28bpo1eDtDLeHpkvF0dUeEHCgS+UgJSuVKkLle+FiAeM8wrGZr+A61uFYBUQ/kAr7NFUkxDYhnWjmIKdUsuAAd50bD0nGNTvqa63BOEcXP14UT9xzJTMuVg7K/oQZeYEnL6dKiR1O/X9Z3VTrWktyLkaeCMz56gXDxZOH8fbnwSG3mCptgWrNLnNXmRTHCaoKk5SJoSfqywWZBjyCy8LyB6ntX4ihjoQbJUIaqgRTiWuIQIvXCvwyvwXNBc/eKgoWVYTqRlM5ezyW/+Tk+d2HMtASpvebq5xXzkeY8SsEjETMSq67/knn6wZCgnEhswJPbcPRWQttUfgJTr08yC9uaWeu+rfRTHiWMFEJ1QWXEKkH8Dc615fjOGKC5wiSALWghXvdxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cI3k8ANq0elifIG9dvGz395MKwtELDtW9rxBJb5lxk5qB7+IRC16BbmTbygo?=
 =?us-ascii?Q?tF0aqs2DAQK4zl83Ze4RKy5U2W+8bkFNiOghQSCFEHr5EvpHGkbuieXNaKnu?=
 =?us-ascii?Q?iXpBNdXRAI0M8oeGbUC6rJAUmzSlOW875HW6hm9342WuC++TkPhwhmqdUHzQ?=
 =?us-ascii?Q?DZxbfO6vRX7ymxI+v6p5DNNgW1v0AZyLFkLsIFqxzPYtCR0NaZxtIs7PvhEY?=
 =?us-ascii?Q?scC+ONEoKpfxg2e0WHMs2CbkJ/RPNxAvI0Vgyyf3+3UXuLP6M3CTAjgqcOUQ?=
 =?us-ascii?Q?yc8JYMV4njA7qYOvJ47xB6Mhdgr+ekYKwn3nJQCvfZ4blWpFtFGWY00YGF3A?=
 =?us-ascii?Q?KxahapMnRJM0tBV/u0QDkyi8q8JJXw26FfeD4P0CV4RQ0+HLxA7ylf/GHXoR?=
 =?us-ascii?Q?kiSKiXiJdwHnSOZGuCwasE8nanbasakeTaZXTBTrys2vVm3IGLzPyp4UVNkX?=
 =?us-ascii?Q?hLIEmU9gjwfwcKZ1LVfTYUu0ic2skIia4eR7Y2KzISbIX4yjFO64hoov6ZsU?=
 =?us-ascii?Q?t9DImbaJbRsxs5oPD/tfSYmTpTbgdvYycsF0+Dwar9awSB5bNXlieBhSIH/2?=
 =?us-ascii?Q?cFqUvx/fYehOA/a6MoU7mDfavS44YUEMVyL+7HZHlB1Ff3yo+R+NsE5As91H?=
 =?us-ascii?Q?Qnaw2G95rfzP+pOMUZPU8wWhoczgfLMUKz0wJtU/MqL9+Locu7boiykgLfmB?=
 =?us-ascii?Q?Yo9raqkc95mNK1fo4z5oNk6934YRuoNWQy1xlNLPvm/pVKK7y7L3yryz7oaa?=
 =?us-ascii?Q?s0rGUmxVm0xoVbYLIXTYfxNDg0MJxIcmLthNJUCsmTlYSHr9rQoMd4Si1cSn?=
 =?us-ascii?Q?QYtGOvuoSrD5kWrt46YG575n8Mk0No9aV1A5UpDZ1ToPB1j+XPVlNtv4u+gm?=
 =?us-ascii?Q?sgzADMN5ygqlQ8FaV8kRvTYCEr8MO/8ErMIGBSdNapVDTSSCEFYbYLOQhltJ?=
 =?us-ascii?Q?66bk4pQgMU+TQcE/OnAUO0IdVfEgdkQ5aPRwJ9qG5D3QefPyROZjcgDFRfHW?=
 =?us-ascii?Q?5/5Ri4BH4Qysuie0KZCgqdTbKWEt34bkTA2DTUIa2vq0azM0pshflCLBb9SQ?=
 =?us-ascii?Q?SsEKoxjS3KVnSY6G+no65jyoD/Xo7fHdKMp0MSeWYIoqGde2qdrKi7be4exx?=
 =?us-ascii?Q?EGABXvD0yJHkVap4E5tiC47c3QzH8mwyzQmCFoiSRgR8F896dpUJL9avUXhF?=
 =?us-ascii?Q?iMNQVSYRbNCUZNhbbndOfyDZMg/3GPCYU8wgkD0hVhMeGuyzJWKeKiKXGTI6?=
 =?us-ascii?Q?WSlfLHPT45mkv7m+Uyrrb5LAH1JwFnCuADWgm3wWLR+MGMnie1XZpWW4A5+7?=
 =?us-ascii?Q?uKoUu52gU8WGAMQUwV6KDTvVTIsc9pgASD6u7CKGtQ2fczSOHkBegMzXi+/B?=
 =?us-ascii?Q?fl58Tc/lyj0iy48uMXchBOWOYruPwVGPxPh+lMjeyJjvUkPnsUE2d7eDWNdm?=
 =?us-ascii?Q?XlYYguMoL4/8ktdSUwIqEooYlFqrj3tnoN/XO/XzcQffAWinUnDCz8YdlirM?=
 =?us-ascii?Q?dzoIlcbmAHLUIttKGwbZXUucVdX6bJR3MlqA4j7IruXTRhj3FII2QW68a75v?=
 =?us-ascii?Q?jTJxAlKNgR+9FenZGcYNKY6WesRQb0yV/IQs/G6knohaU73pyCEYFol61fuZ?=
 =?us-ascii?Q?B7Gx1Efly+dGtE5MV0znf/ZXwitB5tEP5WaolkggK7xMMO+hz673vTh3+vtd?=
 =?us-ascii?Q?52w1wfm6YjTa3ULN+cC1RqdSh7+vIKNGn45dasT79AvPJtyDj1lukfYjG5Uz?=
 =?us-ascii?Q?05HN5Ck4EA=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d68545-d2fb-453b-9452-08dea5b9e7e7
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:21.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SujmExwr+JkI2/bwAw7w/76Q6gRMOzTsA4JOtKNEqJn1ljKseo5GtqWdwy2fxVY5YCFUfEzwZKcIwi0p2ojHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_233830_808044_C508F4F1 
X-CRM114-Status: UNSURE (   8.88  )
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

The Khadas Edge 2L board provides one USB 3.0 Host port and one
USB 2.0 port (connected via an internal hub). Enable the
corresponding DWC3 controllers and PHYs.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index c85285b3dc6e..84ac8ffdaa32 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -30,6 +30,29 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	vcc5v0_device: regulator-vcc5v0-device {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_device";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_host: regulator-vcc5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc5v0_device>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+	};
+
 	vcc_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -78,6 +101,10 @@ &combphy0_ps {
 	status = "okay";
 };
 
+&combphy1_psu {
+	status = "okay";
+};
+
 &cpu_b0 {
 	cpu-supply = <&vdd_cpu_big_s0>;
 };
@@ -531,6 +558,12 @@ pcie0_rst: pcie0-rst {
 		};
 	};
 
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wifi {
 		wifi_reg_on: wifi-reg-on {
 			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -552,10 +585,24 @@ &sdhci {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
 
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
-- 
2.34.1


