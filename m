Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7FEFCD7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwcbSGp09t7fYDLIc6ZTHBDejH8ml8Uwme+4NuDlzy4=; b=pAptJzA+3mr2R277IwByxI0Dgm
	zEIXXM6W4BUwIRVmzGforw9lysSsxhR9Mr7UCGpxyA8oyypYkqYvac3WMO+e0DHAmKlVLVUstzP3S
	rBG2QtGfjTYItsqW47mi2oz0cTsWYH+npwBvaS712M2c1X1MKupB6Hxq5WCygv9WpRP6AZ9vqsQ8Y
	MrWgufWFQdrALJn1J63AF/Jd4mUkZJWp1Adlv4Blo8T8MzvNI1uNU2IAH70KPVie70R/kcNTQCRgB
	y2EWw0ne+HbQH2z1Qy9JqjOjDYj7iOqWsRnBEyVa4OnlD/DvVeFGpW7zCFw3hbd7N/BvCsTQ0Z1jb
	ZZSEecdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXw-000000073QY-3WgU;
	Mon, 09 Mar 2026 10:09:08 +0000
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXr-000000073OL-0xIW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:09:06 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260309100858d29447162f00020745
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 09 Mar 2026 11:08:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iwcbSGp09t7fYDLIc6ZTHBDejH8ml8Uwme+4NuDlzy4=;
 b=gE2T+R5HEGKddmuIw9d1finp+OO0LMtJFyHANmtCWX1Ro0EYP75YZ4b6I/X4JhV7l6XAJR
 pynHSjdVAcHXyW4KeKa5/Lr3vVHZi4ff3uXbC4uEmJl25lZkzesqhC0rEvZynnqkKuROtYBK
 mvD9LnA0AKnFQ7IX8xK2XtHiKREyqBS6Ptin2Wz52PrRAkEg7UL7vYZ8iGrj/HZxuOxac6Se
 BnTOhca+tBHRkEciDLaBH+/O/wiCLf5cZqXku6+6TaGtTsh9mumCr77BdhxObolW/TxMnr4V
 CE/l4cW+PC6FoC5XiiD+n/552AqSZBNJW+TW/lwbvXXInMOfwkh5Qk4w==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Abraham I <kishon@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: ti: k3-*: Add am64x and newer reset module
Date: Mon,  9 Mar 2026 11:07:54 +0100
Message-ID: <20260309100800.1134701-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
References: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030904_768537_D7AE5ACC 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add the reset module present on AM64x and newer SoCs carrying reset cause
information.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi  | 5 +++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 5 +++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi    | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index 75aed3a88284d..954130e8f37ba 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -41,6 +41,11 @@ usb1_phy_ctrl: syscon@4018 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4018 0x4>;
 		};
+
+		rst@18170 {
+			compatible = "ti,am64-rst";
+			reg = <0x18170 0x10>;
+		};
 	};
 
 	target-module@2b300050 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 23877dadc98dc..7c94e6e16c069 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -39,6 +39,11 @@ usb1_phy_ctrl: syscon@4018 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4018 0x4>;
 		};
+
+		rst@18170 {
+			compatible = "ti,am64-rst";
+			reg = <0x18170 0x10>;
+		};
 	};
 
 	target-module@2b300050 {
diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index 1b1d3970888b8..acbc7243cb16a 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -74,6 +74,11 @@ epwm_tbclk: clock-controller@4130 {
 			reg = <0x4130 0x4>;
 			#clock-cells = <1>;
 		};
+
+		rst@18170 {
+			compatible = "ti,am64-rst";
+			reg = <0x18170 0x10>;
+		};
 	};
 
 	gic500: interrupt-controller@1800000 {
-- 
2.52.0


