Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C352FEA80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8/Me2QW6B9YocVfpWDHGrq4WHQtyn1RHD8oAEIKrUo=; b=wYByGc3yLjRDsCXRZmVZLugtKE
	z+s8IK7gsoiCrHpOKYgxrYYqWWJFcZSiu1uiIGn4AzfvWRbfEo2ieHPS5EJLo8fnnszUkPdjtBnga
	gKcCXRnryd/t6YOJCz5GCYYV3+THMskM/KqlF+0wZyIxCoYdZF+A1rZ5KxUjTR1dPW4k2Fqw4Tqsq
	buzwqz4zxZEcUFVhmTM/q8MNlv21giwy+sWxFYCVy1qoXGc2oFDhkniX6Cdf4EII04zLBnmnS2wuz
	fLGdKg6HMy7Cg1qx4/pfmf0XzNpi9WBdRsH9BrQ0lKqzah7kiYEKbiOX3mp1bcKLScsZ4SDFmEF5+
	Q3NRN97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H7J-00000002k2H-0zQd;
	Wed, 25 Mar 2026 05:49:21 +0000
Received: from mail-japaneastazon11022139.outbound.protection.outlook.com ([52.101.126.139] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H77-00000002jqs-2QZM;
	Wed, 25 Mar 2026 05:49:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF9EY63dqf9LVxHokYOBrduaOsPPKGGR+e+2TBt29x9c/2y45RiYUxz4/KTS7ZTRgt2qq4wPY0CdZv22yBY7HTBfuGshOP6IFzwKezibCS/j04MbXDfFdLSIYnkGZn2PfF9n7SCXNLXqKUvQgnIakuoovbvmAkgLnBPtsd9JDpq+jG2XRmcszvxxy50c3ZRiJs+zizfByi0x/vtZJz01W6VCdSP3gENXsfwzkid0awxZytPi6+uZ900MUZCJxaSD1ej4yQmyiTrd5wGhkifMZUNoLk62mE9SR7k7a/1kcbl9GhNwcwo9R/MH3+SFBYRtv667sDqMWeSkD3EiEAOgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8/Me2QW6B9YocVfpWDHGrq4WHQtyn1RHD8oAEIKrUo=;
 b=ga4cafxb/3efAF09eiEsnTGg741s/ggynfkVW29yhgGVX8EHBSFs2NYw1F1aQAsrIgDhckzP5Dmz2kd8aexLpWSASiYT66idDVqfM3HUlv3KLmzVli0caW6PfHu0UO5h2hVyN3Za1wUAq9FmkVNOn0LCTeY7wbVtnB4gdBy7F1Hqc9EoR+WXq+fpQPNtPbLQAnA2MpncqLoVv2VrI5NdYyabqtSx+WTF+d+vCjxJrSt7WWtDSx1leQQaiGzBuxAcPpteJIWAfMzIcMP98ZK2tfw2zhgUZVu8f2OzMmDROYnZexl3qdhCHRgGQIoQlH34I4tmuLN9JXxD+vx4lh8cBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TY0PR03MB6678.apcprd03.prod.outlook.com (2603:1096:400:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:49:07 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:49:07 +0000
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
Subject: [PATCH 5/6] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:13 +0800
Message-Id: <20260325054614.1497147-6-gray.huang@wesion.com>
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
X-MS-Office365-Filtering-Correlation-Id: 87753bbb-e173-49ed-beed-08de8a323a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: R+a/IGV9oWrctlRglCliPGuaAs2ovG0uEvUL5gXwJ6Nqgd7/JWfQ2Zks7nBME5WKX1i/q9OFatV7nJZdGR50yNuAg8hoS+kV+v+n/AdWWVaf150bT77axs1fk1Axu0MWYuWVjXSsGb1+Ke8877xX6A7BuAYXvLtAQ1e5J36JB5nyEtPZrZeei4xlB4z77GsdWfSr3nRfJAl1MfsmJf4S3SDaRx7PU6ONgO1EgzPQsVJyN3BIVPEBARQrSWHnvgViGnX8pk56lv/yD6xMUJ3jiBrP+cj6UUp1SVeIWS9cgHg5ADmMfNkPcjsmf4nBcc+pDfIr9umuUFUPQWWomlZgVkkJfP9AJCbz6H+qLQnEzyXuwYw3uKFBZiMxhs+nyE0/kNMZphDJNqDoPChj+i2AMKQoYjvI7o7C8vhOVnMwY1jwYWzH1SR4vuuqm4HVRsFyl+UfT5i8lJWtg7Qy1QXj21v7FFF/+LaRSPq5kQ0RWvls/ZTQmGuD5Lt8X0bjrV6XMtiNofCyVoaAi9yinI7piXkhSSV+gckskxPC/bOhh7k9wLtR6Si/rCZTrNQAIUjPLjImZDSTr7kz90J6ZukMllCKofOGJV1PxET8mrAHXUxE7v3PPGiHK5l/TJ0Bk1iJYI74QoBMFFWU5obI4ry5UOtfBGT6a+TlqxMI+qOtlivdqroDfbbLvPUzn2XOTW3uNXVT6cwGlMTAyJuQho2XhBBu6hNO9S46itMMa97mR5lU+D72Us6L8tzjbhleIrpVM72n2PjKUKSeRJVhWOZqtRzSUHT+8gPIWoKlK2wpVp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3y6hI49mHgPgL+Wy8Yuca44QItAtqceYJfuTqSCTxqW/I2MKIffXFDEkSVKF?=
 =?us-ascii?Q?Sko2OnVIO/a2Fhqd6pxWEjjZamW4uRbyPmN0Q1XpSANWMj125qh0MpGdbTIS?=
 =?us-ascii?Q?bwhNM7kZ/Idzz3YFQmz7FGMPVSfXvXSc9rYEO304rPyzUNv/5I3UGfsTLgJk?=
 =?us-ascii?Q?Lv3idvH1DLTh48XNr1p2n+BgnuJGvLqHLh+vfJjIGjyCt6Oe1Lutts7zrqle?=
 =?us-ascii?Q?evp5mnWvCbRB3M8gs6Ptqg++OIMw/fTdW92b64Vu6R1TjW/cZqJJxp2aMasl?=
 =?us-ascii?Q?oBh3LX+1Xr40VKr8xzHk5Eu+0i8Ik0DYwsbmv/E0qu42AUONfGjF0QxMTTAI?=
 =?us-ascii?Q?1jImqJkr3ZpSGjgXxOFZgHbMmOjE/lNUqM5T41Ie2CD6EPy/fHVecZEz/VHH?=
 =?us-ascii?Q?V1j0UXg2NZ7rpi87n/x81l0/ptHxq4QDeZmZswNchaZtfu9CZi+ohXcdcAgq?=
 =?us-ascii?Q?YniOslE807B7OOp4Ut8w8EdrpWwbdDxvzO5Vz4t+Xd1+I8MDzlQO3ky5/qzw?=
 =?us-ascii?Q?9iufwVBz8m4cGEW+/36iGpDHiWtlMuLhqTWHLJRsQR1GW125Cw04O8GFGNCg?=
 =?us-ascii?Q?/hdM7yxN0+t9xIB3rvAX/q+UNaulnnC+kLZhYf36el+vXGDq3aUUVFpYf8hW?=
 =?us-ascii?Q?9/G94RwnQmHfeWvjVR0kZ3U/AeDwQv0OnDll0+6QWjLBzr45m3aNXgyupXEl?=
 =?us-ascii?Q?1StHt7tvNs54RomlpI5/0b0E9tR6AxmEW82PfMzKpShNTxnR+2d5NVxXONU2?=
 =?us-ascii?Q?a8Q7ytzpqNe27bvn0bDrN+ognFGNOQ4fHZHCrKrH/XpyzwVRcgkzxxGzzIDh?=
 =?us-ascii?Q?yGs/Y2f8Y+g74QofDGR/33Y6GsjYgHzUJqKuJucPUA7vepJ1csY2MhGkRPtH?=
 =?us-ascii?Q?/KnHGnzzvHW131XzIeOiZJEXAe1/KVJ+3WzcCR06NXnvN01JFiDEWhwJecy0?=
 =?us-ascii?Q?/EPAjKPT8xKHUvnzPGXAOg0hd/u/+5spANgf+uF8vLaNWt0oIM9CUzyZjX8G?=
 =?us-ascii?Q?yWFEeiXhecpUEGWKaun6AW4EXvSVVkrnrSS3fmiX+EWmZZb3szv7dswpTtAB?=
 =?us-ascii?Q?JL/xYSG8iC1ortYPW9aGAstGDgtGe9idv4wK8kC58GcCVP8sl30CdLKtsF3r?=
 =?us-ascii?Q?ZYXPbkRujlNYi7t4Scn9qcxrZDgUqGpK+8zBw63hi1+9vcbhI9jrZaD2V29q?=
 =?us-ascii?Q?d88vSQF5jzeqMD4/M8tBMx5gC53WcyLbgR61k9Qly943XDjhTopDRrKa46eP?=
 =?us-ascii?Q?Gl3+5xP1M4VZtVlnE1uE4fz7A4RojEUiMBc4/3+tiXV2QVGHyp1R7urnRXQE?=
 =?us-ascii?Q?+dWbTa0C1d6odWyFYYmFldZE9ZWPDB5dRNWeyBOe3mjWqkZ0nv+VcCda1amK?=
 =?us-ascii?Q?2UJTdZcQBa2Mhh2LWK2szsxL9sVuBcIlhAzKRL7aPX6pBLoPX+h8D7QCEjW+?=
 =?us-ascii?Q?9fiJQXiepTEOG7KQ3uU0n9ql4AcrpbZwWfON+h24TVLF1Drhz9PKu6GbkOJR?=
 =?us-ascii?Q?U6539J+BUd9I+4Zz19apTIRdXOYPXL9+Nn8gkmTIScGTeJMVswPd/niUZK2K?=
 =?us-ascii?Q?CKvh8Zr+pDL15y2nTlhLwI+1bCvdol1r1JVX8Nudbdq2YHPxSWGnFkJjyltD?=
 =?us-ascii?Q?0Z1dBz3SDbi9GbfNS54EU6Z4aW6fcNHOYy/EykPQPkSJ6X3a+/dRy5tEdCZd?=
 =?us-ascii?Q?Np9VDxrN7i2SJMS1Ek/pHfOf5dCIno3PDuAC8y0o966m33gKjpgX7aAcSPXH?=
 =?us-ascii?Q?NUoQ028ZIg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87753bbb-e173-49ed-beed-08de8a323a85
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:49:07.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7dMF9GFnMzmMR/p35hEHno2pxbFatO/CrejjUnyIIeaUUl6eRrJ3QkIawnftPqKGBEwWhblUj9N43rLr6LNzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224909_624990_A73B57A1 
X-CRM114-Status: UNSURE (   8.87  )
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
index 003342fd69a7..8ecd00f6645d 100644
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
@@ -531,6 +554,12 @@ pcie0_rst: pcie0-rst {
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
@@ -542,6 +571,24 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+&combphy1_psu {
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	no-sdio;
-- 
2.34.1


