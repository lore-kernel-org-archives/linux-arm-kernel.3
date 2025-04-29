Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F22C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeBJMhQyyG1RQnNgel+KZd/M8odIiZqEzCYJ3l+mOj0=; b=oyLjbo4noGLb1idgiC10hoGQgE
	8a7pORpJlWrECcTjppYxjrVmNW4egjyCyaeYTRZ+vgGPC1AGsoU6OR0ReV3AjoajmUBm7phgJZ6r9
	SRSoyBXpV6SPz55v5VBvckPO07QDD2TDIUhfyHZfW/pxAvrGDZDbSYO30lMXPksOkBP79oZmcN/kK
	dpugAR8QwagB8uJGJofukVF8V3eZuyhhq8AmApMPa17gHocKirxoHs8My+Gd7wo3oAB3nAme6Zsx2
	J8bF/sR5h57AzKei1TQXF5eXdMB3fcUyRYD2aMDAAnZDg3JO2cjGWOtbyiIvzDr9dqO5sFO273XpE
	Z+Biu7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nWo-0000000ADJv-0mXA;
	Tue, 29 Apr 2025 16:09:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n67-0000000A9xS-092d
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AeBJMhQyyG1RQnNgel+KZd/M8odIiZqEzCYJ3l+mOj0=; b=ir+y+STXaA+djexoWHB92QoJ2c
	NKqN1N4D5D73FfXdtYxjvaVaeiTRS5MZ4CP4knrWrhTEzQbqUCG3TnILr5qdWVosQhdrY7NyIsdvh
	oTBhgk8Qo66mZpPOAxdUj3inu3UovO4EHWjLkvI/9YdKRxyIGdHx9CgmWd3LllXFY8Zm0GwdairXh
	RBmVefoyRfi3Hdp+/sCqIbc0cZEP/6CuZopta4slRdblPscL1BAhX5KFsEasXC33GndlJnenhwrp4
	xler54Wx9Y5bzwQDoSOZPK1Iohr6lCY83UBZgZeoVNNFI2WBRK9z8GfqxfspdMXADZF/t9ih0q6fM
	FOIvScZA==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9n63-0000000DS9M-3p0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:42:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfxoa3121174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745941319;
	bh=AeBJMhQyyG1RQnNgel+KZd/M8odIiZqEzCYJ3l+mOj0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dFjFeWwT8n8D+AQy5+HHmmwHtTWtyg40LpqESMRGetHT4ygBj5ok4w0csjEsPIBHq
	 Kkq/rOgUHfwH68R+IwFvK1biV2QeOijpYv0Cb9QXHW42RQfIkH8F+2qxGhX4pbq4WV
	 d+qcYH0+5GqxBGZvP1NnhdP/Tl61qfTz4P+pH43s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfxpR049671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:41:59 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:41:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:41:59 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFfXVt030051;
	Tue, 29 Apr 2025 10:41:54 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v1 4/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for TEVI-OV5640
Date: Tue, 29 Apr 2025 21:11:33 +0530
Message-ID: <20250429154133.3377962-5-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429154133.3377962-1-r-donadkar@ti.com>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_164212_261415_6839DE82 
X-CRM114-Status: UNSURE (   9.34  )
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

The device tree overlay for TEVI-OV5640 requires following voltage
supplies:

AVDD-supply: Analog voltage supply, 2.8 volts
DOVDD-supply: Digital I/O voltage supply, 1.8 volts
DVDD-supply: Digital core voltage supply, 1.5 volts

Add them in the DT overlay.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
index b6bfdfbbdd984..123ab0e5e8dfa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
@@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
+
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
 };
 
 &main_i2c2 {
@@ -40,6 +67,11 @@ ov5640: camera@3c {
 
 				clocks = <&clk_ov5640_fixed>;
 				clock-names = "xclk";
+
+				AVDD-supply = <&reg_2p8v>;
+				DOVDD-supply = <&reg_1p8v>;
+				DVDD-supply = <&reg_1p5v>;
+
 				powerdown-gpios = <&exp1 13 GPIO_ACTIVE_LOW>;
 
 				port {
-- 
2.34.1


