Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CA3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdT6uLvt7v0OlGBZcXbpnLNPp3K3v9W/E3AD3dZIWto=; b=0kK3/aqVWdzq6hFBT0yJAEoO/p
	fb5JEbwO3pEy+7pu8f3iqc2tPe/Py4Dt+GplLRKG6SpcvsFShFEIaxyVfTYB8kcUd08EKkByCndFS
	9yG1ha1Bq86Kfmi2Kn01tpi9MawNtgcv0wVvQ+YAOMLGEcg3eJdJfvX49UjpekLSWXLfsvWwABFcs
	lo8B32RK7hUJ/RT9zDJOM1xpzpzLJjkCSGsMudhCWDEICaazrjVNpxl3abvAlQbCCnovWvMnwaDWj
	bFCgrC7UoMxkQ7+EvJ6O92YIUy1b/XJIhsLajMw90niLam2pSTSsbNfimMtsW2Ob3DEzDIJFCyhHV
	jPu+srkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvQI-00000006rbY-2Jep;
	Wed, 16 Jul 2025 06:15:22 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvCo-00000006pkO-2pkU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:01:28 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56G61Nl92779980;
	Wed, 16 Jul 2025 01:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752645683;
	bh=cdT6uLvt7v0OlGBZcXbpnLNPp3K3v9W/E3AD3dZIWto=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oNnIfuEshX9GFXX0l92jgSjZlaaLE158rLYIK0dSwhhHkq2KgpFllx5wcmbGHbgL7
	 CZl+YVWflOF4FJzW+gyFIGkwU0lcKI0RwmICOkeTZD8j5o8jA3C9uQysg7q7lL6rxj
	 3vLe4fCHYafMSJImrG/pBqUuXwD0+sdnN3+c06sI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56G61NK21145911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 01:01:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 01:01:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 01:01:23 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56G61MGc3833036;
	Wed, 16 Jul 2025 01:01:22 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
Date: Wed, 16 Jul 2025 11:31:11 +0530
Message-ID: <20250716060114.52122-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_230126_799607_3D832946 
X-CRM114-Status: UNSURE (   9.65  )
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

Add dt node for main_i2c4 instance along with required pinmuxing.
Also add the gpio expander 'exp4' required by display connector.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index e2fc1288ed07..793d50344fad 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* (AC27) MCASP2_AXR1.I2C3_SDA */
 		>;
 	};
 
+	main_i2c4_pins_default: main-i2c4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) I2C4_SCL */
+			J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) I2C4_SDA */
+		>;
+	};
+
 	main_i2c5_pins_default: main-i2c5-default-pins {
 		pinctrl-single,pins = <
 			J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) MCAN15_TX.I2C5_SCL */
@@ -370,6 +377,23 @@ exp2: gpio@22 {
 	};
 };
 
+&main_i2c4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c4_pins_default>;
+	clock-frequency = <400000>;
+
+	exp4: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "DP0_PWR_SW_EN", "DP1_PWR_SW_EN", "UB981_PDB",
+				  "UB981_GPIO0", "UB981_GPIO1", "UB981_GPIO2",
+				  "UB981_GPIO3", "PWR_SW_CNTL_DSI0#";
+	};
+};
+
 &main_i2c5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c5_pins_default>;
-- 
2.34.1


