Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5991C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK9XnUrCtZQeTWZ9YMNn/I/qg2zjs0hWiSjFdXFm63Q=; b=DRO3v3Vq+OQp7ti49IeS7VDGIF
	Dcd2+fxQGl8gcc/vtJ496tX+Kwysxth+yx8KFQyS8O76BEstm+Kk6fiSYfgvAWRBj0FfnWfKpAHiO
	FHb7gNfT7fB6uWddPSxhkWQg7PGGS9Gqo9+N3QxNQSMWCmq+9c3KaT4AUxAQOuSSHAdo7b5atO0U7
	y0bVowaa4oljFNOkklGtDcPckciykiFTns3kt3DRXW1SZBCcRL2yTFFYpEKGv4k2gUsvxOGsjBEvh
	fsmJKJNesJoFPm9D6Uz9T5hoTXFBybOrP2WUFNpiyhpjqj9szb4yXpTVY1t9uiDG4rg4ayoTxCZc9
	f1DVemLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBek-0000000Adyl-12ff;
	Tue, 06 May 2025 06:19:54 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAIZ-0000000AIzN-3MOf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 04:52:57 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qeZ11133658
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 23:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746507161;
	bh=FK9XnUrCtZQeTWZ9YMNn/I/qg2zjs0hWiSjFdXFm63Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x1ttBAGu4Ei/HaBNkXcLYwkpFopFkx2nv642DjG3/dKGFrpmKYfvmuV9cZqDKUDrs
	 5cOeC+f2DVFTIqFK2UPgu6Y/2RiecwxzVDvHYtSxLhxFUVMc65zmxPMwT8ySRP2RVb
	 fO8QwowWAqC1VkRbl493Ifa2TbYUomZ1VX7Xlekg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qesV050167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 23:52:40 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 23:52:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 23:52:40 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5464qPcV069139;
	Mon, 5 May 2025 23:52:36 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for TEVI-OV5640
Date: Tue, 6 May 2025 10:22:25 +0530
Message-ID: <20250506045225.1246873-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506045225.1246873-1-r-donadkar@ti.com>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_215255_930363_D8FD5C35 
X-CRM114-Status: UNSURE (   9.59  )
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
DVDD-supply: Digital core voltage supply, 3.3 volts

Add them in the overlay.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../k3-am625-beagleplay-csi2-tevi-ov5640.dtso | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
index 81a2763d43c65..8a7a9ece08af6 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
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
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
 };
 
 &main_gpio0 {
@@ -39,6 +66,10 @@ ov5640: camera@3c {
 		clocks = <&clk_ov5640_fixed>;
 		clock-names = "xclk";
 
+		AVDD-supply = <&reg_2p8v>;
+		DOVDD-supply = <&reg_1p8v>;
+		DVDD-supply = <&reg_3p3v>;
+
 		port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2rx0_in_sensor>;
-- 
2.34.1


