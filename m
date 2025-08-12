Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AC3CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5aImXme3gOQU/pOSB7kqei5E9wyfdYQvACc7haullE=; b=oe7dVE8ZrOg9Yvz5fYZiSjotMf
	VmZ7+lotHhBK4izVIkpFDXj/bZU3Gx7xM2AWyuleD3mm3G7yODa6C79bHv3vBS1g+dFk8dqm30FUO
	F/vUtwM1uZZsqk0aJ5yeID+0RXyuK5CpP293E/wP9ZbOb82dRq87Q1ui5SVRyYE17BDBHmyqSfWXL
	AYAlxktTt/P6TfmO7h28g5wUgBXvY4hrVh1BYHwWUZlS2fH8ORj7tC+zJepYx3d5S0wEhkhpKiPT5
	izs4WXI8oG/pYSBuPniRchHe5LPtcopJ7nPhg80JkmzrVnWfG2HLKfktORE0FScSmKzSSsNgBEKEZ
	qaa5zaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluaf-0000000Bmso-2jfT;
	Tue, 12 Aug 2025 19:23:21 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpPO-0000000AycZ-0ZY7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 13:51:23 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDRMS8015833;
	Tue, 12 Aug 2025 15:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	f5aImXme3gOQU/pOSB7kqei5E9wyfdYQvACc7haullE=; b=Zu7WXQ/e7DyTGGHj
	fxaSwM4T+AZtmAbzs5i8U4KIvcw8nfscQZCODS5KzRNNAv3aO9hatkcNuHvk+KPK
	RcbEA2Dqtrhpzlob5yM+uTyCI1TXCIpJSyUcxH4joLss+oH2qQ2TdLDHFEbtHxQ6
	79QZb6deO9Jqkzq9zzLLKlSoWTjFkWp5veDIrKlKiPFoJYd4ZhGAT+tmSUBy+51t
	Tz34JyJXwvZ1YHnlo1s7Eec4UUrU0EoBalHviqCwCUnIE2ejXPrKvnZfupstji9B
	CRtRt0KttcqLuJqgQJavEQw+DBIIsoeDxNnTr22WMy4CsOjVaBsextDseahrJA93
	anW4eQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7gad9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E6BAF400AC;
	Tue, 12 Aug 2025 15:49:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DF0B765D1F;
	Tue, 12 Aug 2025 15:49:07 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:49:07 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 12 Aug 2025 15:49:09 +0200
Subject: [PATCH v2 12/13] arm64: dts: st: enable display support on
 stm32mp257f-ev1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-drm-misc-next-v2-12-132fd84463d7@foss.st.com>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
In-Reply-To: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_065122_511338_C5BE28F4 
X-CRM114-Status: GOOD (  10.45  )
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

Enable the following IPs on stm32mp257f-ev1 in order to get display:
   * LTDC
   * LVDS
   * WSVGA LVDS panel (1024x600)
   * Panel LVDS backlight as GPIO backlight
   * ILI2511 i2c touchscreen

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 79 ++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 2f561ad4066544445e93db78557bc4be1c27095a..b324b0c226ddf043e62f01245240f3e8d2b0a53c 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -86,6 +86,43 @@ mm_ospi1: mm-ospi@60000000 {
 			no-map;
 		};
 	};
+
+	panel_lvds: display {
+		compatible = "edt,etml0700z9ndha", "panel-lvds";
+		enable-gpios = <&gpiog 15 GPIO_ACTIVE_HIGH>;
+		backlight = <&panel_lvds_backlight>;
+		power-supply = <&scmi_v3v3>;
+		status = "okay";
+
+		width-mm = <156>;
+		height-mm = <92>;
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <54000000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <150>;
+			hback-porch = <150>;
+			hsync-len = <21>;
+			vfront-porch = <24>;
+			vback-porch = <24>;
+			vsync-len = <21>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_out0>;
+			};
+		};
+	};
+
+	panel_lvds_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
+		default-on;
+		status = "okay";
+	};
 };
 
 &arm_wdt {
@@ -183,6 +220,15 @@ imx335_ep: endpoint {
 			};
 		};
 	};
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiog 14 GPIO_ACTIVE_LOW>;
+		status = "okay";
+	};
 };
 
 &i2c8 {
@@ -230,6 +276,39 @@ timer {
 	};
 };
 
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_ep0_out: endpoint {
+			remote-endpoint = <&lvds_in>;
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			lvds_out0: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.25.1


