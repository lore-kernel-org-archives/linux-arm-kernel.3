Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BADBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg6lhM3R2ZSR9+KErjTtlCk6Ufu88DsvjnmmJE09rCU=; b=aWmCFLwBtxx+C7dHsXNrngzXxL
	+VymwgYt5QKrnItysPsO7VCpJW4CT3auW4rlNHYGb72qzutCzfHcL2veobw6zTZOUyxT6IqfSxZmX
	/wM/xYQl5G/0oLcZOdHyzz+Pc5WgIfVOzyaW3yqlbw1JWhPudofPdJpp7zGTPrBs0aStL6YQC0Ph4
	8wxsHcUW7qXY/kDoIaSDSfhAJo4wbQGiU96MPl2BDFd5BwbL30XSpg4vNm4DKn/PzttKDW/MNRb8Y
	gWWjwsXnh0NFlyzk4i/AnO2rJQWKukd51Rj1xcwLJ0unNkFOrJG0p0/oVJoLAYtU1Ghg1p4sHKkXz
	HqNtX1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rPX-0000000DG40-3K5Z;
	Thu, 24 Apr 2025 07:54:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rLe-0000000DFYY-1Gdg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mg6lhM3R2ZSR9+KErjTtlCk6Ufu88DsvjnmmJE09rCU=; b=qhQKrhhsBkgVp1PMiWQC9bp2UI
	1knKbbVf26RtjIYShB0Q3tSU46xWetm+H1rtM82uTZ4ssADDtZTEjJAzSYLoTyCA9wDOqjAv894mC
	eA92LXRdXIdMxpzghPaJko/ncWPPKoMCWDJlzwi6hvMfiVf2moKosBdrvNzfV7tW/6Sk7pKEFyh2L
	bMpZjBz7ZFNUToFeCU4ufaznJhW0IZ79gzZ4ubnrq8wTo+cB7zegnBOElfI4u3pHGcgEusFku0Nni
	p/2VBUZH8QsOJ33xFkSbdnzSQPCOGOuYvEX1P340x50VQCGcH7a+fJEdVXhmEvN9OxXdki5WDN/TK
	az+CAdWQ==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7rLb-0000000BaEJ-1yXZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481015; x=1777017015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mg6lhM3R2ZSR9+KErjTtlCk6Ufu88DsvjnmmJE09rCU=;
  b=n9b+9RShjA6g9B223WbBx4hty9P5/OpVaez0giJXp/01R/+QpjIRtWr+
   OZvExcqrTvIzJXYe4gvU1NrWf4taX2yCIDXgqvl+49uy4h2eYTlYERamt
   wrOcGRHQjpwwG6mbJUFqjX4PuVhnRSFtf3SKPfxoLf6xGEGD9X0BeiC8u
   r49WwsQSas80WWTT3BwiU60shFiAl/E2miosqO5A9sWi2Cvn8NCcoljkJ
   aU+Tr4t7sSt3WP6besHyYcO2GeFXUjV0xJ9zWqKstX9XL7QYHllNEVQSY
   64aqN289rxvcRY/x59nqP+Fo2+himCXX4SlGtrK91hkPqlPPFNSQYVoRW
   A==;
X-CSE-ConnectionGUID: QGD/Gg/jS3u6KCNl1aBeXA==
X-CSE-MsgGUID: PcGB5fQAT9Golh5t6TkTpw==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691475"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:50:13 +0200
X-CheckPoint: {6809ED35-3C-903EAEAC-E04C76C8}
X-MAIL-CPID: 43870022036A7357E589DFBA273AC112_5
X-Control-Analysis: str=0001.0A006376.6809ED40.009E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3067163FAF;
	Thu, 24 Apr 2025 09:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mg6lhM3R2ZSR9+KErjTtlCk6Ufu88DsvjnmmJE09rCU=;
	b=NMVMRiOIBdx3fzw5lq8FizjygUrUu/GUdNN59KCfjoXxvWG7L1ZA1Y0QbeZVEFnX/cb2Kp
	C6b1zociLFLoIJQUIpxytZQudu+V6UNsRoAtmFbmqYGEIBFtqkxfN9sAkdu+NQbgbnLQHe
	dVaBtnPv6/UKGq9ukriFpOVl7nuEhIGq6nFihgLr7Vsv/rIxb8UT/oFkmFue5Q89AU/l6y
	UI7ubySg1MJfXFfCjMVJqisQRcaIV2kH26Dzfj4SMBD24pW/LIihKriDAgCo0yG/F0764D
	CVCJynmi6eoDf3nsHF0lDRyG6aLbiIS6xxTkYIzy6BzC74peAwwyebiwgZ8kwQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 2/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
Date: Thu, 24 Apr 2025 09:49:59 +0200
Message-ID: <20250424075000.1263138-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
References: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_085015_748095_DB3F9C99 
X-CRM114-Status: GOOD (  13.14  )
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

This overlay configures IMX219 MIPI-CSI-2 camera attached to ISP1.
Also add additional overlay both using LVDS display and camera.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Thanks for the review.

Changes in v2:
* Renamed camera clock node
* Fixed unit-address of sensor node

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 ...imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso | 107 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 6f87f28f4583e..47cb156c94e7b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -247,10 +247,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
new file mode 100644
index 0000000000000..e5a2b3780215d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	/*
+	 * The three camera regulators are controlled by a single GPIO. Declare
+	 * a single regulator for the three supplies.
+	 */
+	reg_cam: regulator-cam {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam";
+		/* pad muxing already done in gpio2grp */
+		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_vcc_3v3>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	cam24m: clock-cam24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "cam24m";
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		VANA-supply = <&reg_cam>;
+		VDIG-supply = <&reg_cam>;
+		VDDL-supply = <&reg_cam>;
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			sony_imx219: endpoint {
+				remote-endpoint = <&imx8mp_mipi_csi_in>;
+				clock-lanes = <0>;
+				clock-noncontinuous;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
+
+&isi_0 {
+	status = "disabled";
+
+	ports {
+		port@0 {
+			/delete-node/ endpoint;
+		};
+	};
+};
+
+&isp_0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			isp0_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				remote-endpoint = <&mipi_csi_0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			imx8mp_mipi_csi_in: endpoint {
+				remote-endpoint = <&sony_imx219>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0_out {
+	remote-endpoint = <&isp0_in>;
+};
-- 
2.43.0


