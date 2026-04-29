Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6362FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFugwN2FHuLETA4ERlauspTii3YovD2LhX4EL33mazk=; b=lTQJqF8XvsCZhohp3yZ7ZvuUSH
	OBfgKLVq6L6MX1QoJAk+jV23LsXS9q6mOhO+v7MqCY1XNUvnCHLPJlLng7hlT5SPml72bVbe38iSB
	+HXRSZFtPO6hCblxC9HwFSUagR68IvbkDeObUwqDw4MaFT7tH535VD3oZqJFCB/CeNsfqVYEi061T
	Sxbl0KoNfRON6BUB7FDxH2qft3gUiN6dCSBuEu1P9iTifKBmtERHqzGB5s/g6rsgzKCQ0y0RRkFqR
	HJ+c5ArzwLFUofngad4e2GyEUI4DckLwh0Ta1dJcffYyKKUvk+q1GczF4rsYXFCD2fAC0Da7l33xc
	Oc4IhEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ7-000000031Lz-1Z2G;
	Wed, 29 Apr 2026 06:38:33 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ2-000000031B6-48kt;
	Wed, 29 Apr 2026 06:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWbvbB6DHpY9j41Bp7Or1iRvy+1sXpElQP+z+YFjn6zQNZxp6ohWJjbiD5sXgGpSy7CCypjOijdhx9O1QHw78nmz4he4E+UNz0D1E7et8qiu6QgMHLXmNOIDOShHDyhvftnAeSb6RGZjXSELlkxcrriY+R1abH3pHcWCVMOcoFW7XBgz1vaf/8Ld1xs4nhijgabpOSNuKHu+R+wite9ooDYirDcyXu4KzW6S8BTRQOiWqYQWVhqMRuufCJI6AT1ymz9zxAafbfKq2/XkgjOEOgZmwNb4cXlrmcPZ7kATHgsRJDAJuEEXxP7x9nh4MUy7x1pGN3Z+rPWuUf+wMCrduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFugwN2FHuLETA4ERlauspTii3YovD2LhX4EL33mazk=;
 b=CiiV1knrDQO14Pm51jdmRFUEbhrjm731ScZGaNf4q/l64nKl3dZZM00KZUqGyxJwoUv5whfNo91pmH41nTGbmnQj5cqXSJhQONoBvMaDLPBEd0HQhq0nCHG+1vCg48OQvSJGRWVKx+6knf4q2hNyASH9C9Z6JbDg779nqU4+5VXrW90Vfgn196Uk12TtO8gKyJ1KABn+pEuEF3fJ0TBhfNA7VXvzi/e9FRtfQJD6b9sD34ruxdV2xJbSRhggMfAixjcKjSKo4bqu9KoUPZdmdhXqC9VwGoReaf5Au6D7GzDUEjkPLt9FbiUDJTEy3otJX49Y+GhOl8QyKtaFVdQWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:18 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:17 +0000
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
Subject: [PATCH v2 5/7] arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:10 +0800
Message-Id: <20260429063712.2150938-6-gray.huang@wesion.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1392aa47-7dcd-4f26-73ce-08dea5b9e54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: ZvzxU/KJgV4TktU1yBlAuKUOJp1M9wYoTHCwwqkwCnGB+OhJsumKHL2EE3Opzwf6R7bc6XNtFzxpSnVGj/e8ud7zFmdXc24t0D3jr+bb8CPq/kQuUwgqg3MOG6dJZYM/nhcBZYXGtvUwq5KmlOQHrqZwPUXkUelinEKIDz2px2tqcnI1hUHYP10HBz+PmRkoLctPG+TF4jCVpDPvqFR9IQXl9zPLfXzjYPJExM8W9WpToBz2KYruLAtchkcgayK3WRMLnQ0DdHUjO0dJU6zeUEHAyHEZDkjgVtWaFfITRbekzDh82NA2fGpn5B5kbopA2Sq3VE5L0GY6fXlq9pwdMZnZlCm5XWV/sM8dbQLk44Ta93TyEVJgDBsCgEP1KI+omcu5jM5YdqKMROza4lV67X/hVy3xOySm+/x3vWo08/MKJqINweqdbbjnE4UHX3iZ6KS9iLnaeFcX3l9v24hLL1XfIVuAxx2I04ymF8Ip/00Ox5matTxY/K5tA7Y7UgLGHA7dqWeXJL5rpHV5VlpNu//HVk4CmDLiLbnGtsoRxea7HbABKB70wSMllS5r8IGoKJqSlt7F64m8Biy0T8VPk1hFHgfsP2DtyFot1vqgoLuXmPeA0cptMZkRUMIkrs6NUQNi/a+dE6zBTh2GZG6nPweP/13oFEZuWfLr213lqlQqcBWgcp+ZtrUZDFY26LgdAHucT3294twM4zb3LuccJ3/TzUTOE24ChDHS+wmOlnP3vvOCd25fFX2PkNK8dqlyCaOEl4+0Cz4S6tyvmhTUgr4x7lV5PXeYFXYbZJDWRrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2wJocYwlw0k2BBr4CWZug6Po/qirquVzDzTBn3IJdQGqKSiifslu+TSPgbks?=
 =?us-ascii?Q?yxgKSZw8XTSjcHdyrUOrTVsCZcttASOFqn7LrlwlxT0ug41UxUxSW/bZlCJZ?=
 =?us-ascii?Q?YGhYnIlTX3/esH0DwWeSoNATvN2wluNDHForrTyUGwMC7MWZaKZ1N6WZ74im?=
 =?us-ascii?Q?FocytDEDI/zqIELWigzofM6cNWAGfNxvb+s22mKsMP5CouMJrV8RSddzf27f?=
 =?us-ascii?Q?q/Ca3d7ReRmunOgxyl0XlBrh2A5TVSkh6rZdUcLi50DGqQ1+R5AP55WYNXMc?=
 =?us-ascii?Q?0Wup5QoiIpsk1Zxhti2sLMIhxnQYlKet+XtfyPt/+2QjLPg4Jq8SRHCIGDYt?=
 =?us-ascii?Q?0d0LgUaRinvqDQDXyfVWL2zEDVT5s5/y5iTK+icTWD4v4zjSnfJvgmTrAB50?=
 =?us-ascii?Q?XrXnNJpY1pXxoSQn61acvST3A9z4CiEIgcGlr6ukdMwQwoK2bv9okjDTm+Iu?=
 =?us-ascii?Q?fcHYCoH8arryDbbWoMIEdvL8xaZAITUpv2HKWuHZo22w1a/jWfHsG7kNetAn?=
 =?us-ascii?Q?D0FsPCR0+20tf0Cir2lW0sdhgeh5TuaGlHvyXVvqTh0SEqX2+VssquuH7PIZ?=
 =?us-ascii?Q?KRpz8nyKb+lbPTx0xrqWEXLFpsREnFkzVrJVXRAqMDgcIeRfy4tLgr8ZpoEX?=
 =?us-ascii?Q?npzoIxbiKgIgRoQOIw70J7V8iuCq3UjXOCpNzoCRnsKjH7sVdhKJxQl+9rkr?=
 =?us-ascii?Q?q8mF8+C7Y+C3l33Nn34oNn9jFZD/tVQMc1l0bKAFPDY6ItdmZQFIeORiF/0L?=
 =?us-ascii?Q?z5SNKH6WroFevB72I9AH/QT3KDosQ3HAurSU+uTV2gaTSQDdNpIRQp/ezzkT?=
 =?us-ascii?Q?HgCkPHMcxUHYb9SyRCeUcsfTyjoazxiP4gqGDb+ysuV8tvS5E49LNS2yXYlE?=
 =?us-ascii?Q?aqUNuiIlfmOTwL7IWENuVQPIWM8boSDOXKqtYlKQ9QVHUcm2qIofVlRX05y3?=
 =?us-ascii?Q?+LPE9hbSpg9aTUoQoI+u6mBO2nQkZDw76rTnC5WIKEuYpXkFadhL6jzrrVY8?=
 =?us-ascii?Q?HsuYjxGVukGlCGCd09DgaTFfa6zarPvLQRczlinkukqoTun1aeQBYn3Ajlhd?=
 =?us-ascii?Q?03gPAahgctpTsmUbsKTlJ2x74mJgbQwWQpaYisl3mP1vlD+YWINsJCmkr6fC?=
 =?us-ascii?Q?BotRY6vgH0D3JhNV+XEnd9UNayBbSnpZ/LFzZKmwcXG/p/ugVdO60Pgfnb6g?=
 =?us-ascii?Q?obaM42jMiP1phnk8mdFmIZAevG576sZaVi73zBFd6+G2hnh7ZGan/w3iLzOD?=
 =?us-ascii?Q?iUN/gUkV0T5bTIxkxTlwP0m8rT8np2AaUEDY0QtU6RS9rCPwgs3/lvC5s6XR?=
 =?us-ascii?Q?atB+s5iM6MrWU2yXCNgKVmabXIChYAEDR97bQMQbmOdVu1ySo86AeLP48QJH?=
 =?us-ascii?Q?txDVBysGGUI4LGO09AW0WozWZYV3MmRMcz1bX4dnNsCS/Fo2emZUx+h65FHJ?=
 =?us-ascii?Q?BzZ6gahj9qDI4YeKSJCq4mFamxxyPw0+7yI64JIaUaCNfZ0QKpmpbYmgn4Vd?=
 =?us-ascii?Q?sTsPHtO9l2d9ywefOH0qyfv80gnvx7Ef/NW/fgjWMa5i9WoF2eIrSH+6WdiD?=
 =?us-ascii?Q?+eyidVmWAQDoe+WMEcqxU+TLEOC4KNSwMQx7+OPWzayK5VJDkE9fZk/Wpkz+?=
 =?us-ascii?Q?HafC/WwZWzYmkqNbCl/w3tp4r+zDlnpKHofNRGgRRHVsQyJXJIpPhd1LWUrX?=
 =?us-ascii?Q?220Z6E/p9ajYVH2vlJJWBVOlxXygXSUlnsaQFWDEMCUTRv9lBylAg8QhiiBV?=
 =?us-ascii?Q?am7H253rnA=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1392aa47-7dcd-4f26-73ce-08dea5b9e54f
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:17.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6PuTbaLXjBL3HYwVEm/86VPhmmXDEgvds+GP1t8gJ7/HHHrJSQJ7ZdoYwhHop+AkHCru4hpGi5kyW5vmIvAlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_233829_031551_831F0CA9 
X-CRM114-Status: GOOD (  10.30  )
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

Enable the Video Output Processor (VOP) and the HDMI TX controller
to support HDMI display output on the Khadas Edge 2L. Also, enable
the associated HDMI PHY.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 0bd6b4260427..c85285b3dc6e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3576.dtsi"
 
 / {
@@ -18,6 +19,17 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vcc_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -79,6 +91,30 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -519,3 +555,18 @@ &sdhci {
 &uart0 {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.34.1


