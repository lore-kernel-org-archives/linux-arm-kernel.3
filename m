Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD47EC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7lV+EdrJiHZUENL9nZ+vLpZffSX0le/6v3EV1toAGc=; b=c4w7HF6R9j5qvq+6JtpLfrZICl
	QBpKFjIFqOLqDTOEFZY6zHjpIitMEXGnMlwEAzMbDCrvZHOYBLIuting6IQqR51cSHOzryqD1J4/D
	pcc4wBwwtVb3keCVEExO0ZbGeBVdCVCctyCavh1bdeZDm0qZoUa9xnpsIdYN/7rJBSLnIOdMA0ccq
	HvZyZUQrtiIq6xuqbDInP4HAAeN17hozSP9N5+vkQvK/+FulYfn6AQWkWPWb091qwDdKl+IdYAhJt
	W0SMPRIk6/oTAvjclS/QVXKvn5LVhbTBys+LG2ZuD0x8lEDbpX+nZN2oQQ0uwQJ4W+HOOAGAcGYEQ
	+H3LZVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWV16-00000004DlK-2vIu;
	Tue, 01 Jul 2025 07:02:56 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUQv-000000048f8-3WVQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351133; x=1782887133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e7lV+EdrJiHZUENL9nZ+vLpZffSX0le/6v3EV1toAGc=;
  b=WmDC2ANOpz0iymL4F4BJwdOU2X+JEzioy4pqI8CUkU05oPNPZ8lxKsKP
   YQoOyIcH0Mu/oOCGEoKkcGwlQ3e00TSv+08JW3NmCUHCiBigMZfQrD/QP
   99m0aOvV1fRGmmIvhchBo0kCEYBrt6VSRUK1A8sYvfTeCQSw0laGdoWeC
   88phLpC9Itghkpp4vbz5M+kkH9m67ko8ieKH43HMv9O0uUDwl0BZdXHMj
   6qRGNbq1wDG6/oUN0cVkAPf9caWLdOLNqPcae2L0LYHkb8lGMdEvxg4FV
   hDOAG/KgMx0KRz/r+2glpt2J9iSD0p0moYQrducQlUvXRmCJivYCaC3bp
   g==;
X-CSE-ConnectionGUID: 0RKO7NnNSJ+x7W/9+zamMQ==
X-CSE-MsgGUID: E0IA9g6BRdmBj+637XBcRw==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943378"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:32 +0200
X-CheckPoint: {68637F5C-2B-B6FA1C9B-ED1A9D03}
X-MAIL-CPID: EDF74480CD697FC205C2341381A821B7_2
X-Control-Analysis: str=0001.0A006377.68637F6A.0016,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43F9E16A551;
	Tue,  1 Jul 2025 08:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7lV+EdrJiHZUENL9nZ+vLpZffSX0le/6v3EV1toAGc=;
	b=cjO63h4SEuKC+q1qWQhIztfxkIqB1N72p6lg0UiW348Pc9Dbu2vp131f2K8KR7FTCsZVHs
	cAz+lQ54jbhiOt+KD8emsCUAXs+bXc7LqculcIglCdSiY2Hx80nQ74372Unko9FaCRmoN2
	7keU9yjlXvlnJfJt61X1UKkGiDpIBwfUGYczLiErTWe+nHLXGr+LH5qOIT7bHYi1iK8NDr
	RKZX65cqa7Ov9l1JZRkCjcGb5ZInv4h5Eu2uXtaB5BcUZ0gSHFbbvHD6x6HMBO1Vu0bdt2
	C3U264oLAnwNdJebsVeDUY9jFuHS3iuYbXzH57706owzecHOwq4+MzofQyf4hw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 4/8] arm64: dts: tqmls10xxa: Move SFP cage definition to common place
Date: Tue,  1 Jul 2025 08:24:52 +0200
Message-ID: <20250701062500.515735-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232534_205735_CE056D39 
X-CRM114-Status: GOOD (  10.64  )
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

SFP is placed on mainboard, available to TQMLS1043A/1046A/1088A.
Provide it in a common place, disabled by default.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      |  8 ++++++++
 .../freescale/tqmls1088a-mbls10xxa-mc.dtsi    | 16 ---------------
 .../dts/freescale/tqmls10xxa-mbls10xxa.dtsi   | 20 +++++++++++++++++++
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
index e567918f6afc6..181eeab55aa07 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
@@ -53,6 +53,14 @@ &esdhc {
 	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 };
 
+&sfp1 {
+	status = "okay";
+};
+
+&sfp2 {
+	status = "okay";
+};
+
 &sfp1_i2c {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi b/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
index 2471bb109e8e5..9d44f488c0836 100644
--- a/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
@@ -10,23 +10,7 @@
 #include <dt-bindings/net/ti-dp83867.h>
 
 / {
-	sfp1: sfp1 {
-		compatible = "sff,sfp";
-		i2c-bus = <&sfp1_i2c>;
-		mod-def0-gpios = <&gpioexp2 2 GPIO_ACTIVE_LOW>;
-		los-gpios = <&gpioexp2 3 GPIO_ACTIVE_HIGH>;
-		tx-fault-gpios = <&gpioexp2 0 GPIO_ACTIVE_HIGH>;
-		tx-disable-gpios = <&gpioexp2 1 GPIO_ACTIVE_HIGH>;
-	};
 
-	sfp2: sfp2 {
-		compatible = "sff,sfp";
-		i2c-bus = <&sfp2_i2c>;
-		mod-def0-gpios = <&gpioexp2 10 GPIO_ACTIVE_LOW>;
-		los-gpios = <&gpioexp2 11 GPIO_ACTIVE_HIGH>;
-		tx-fault-gpios = <&gpioexp2 8 GPIO_ACTIVE_HIGH>;
-		tx-disable-gpios = <&gpioexp2 9 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &dpmac1 {
diff --git a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
index 65b4ed28a3d4c..40fa41eadd836 100644
--- a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
@@ -47,6 +47,26 @@ reg_3v3: regulator-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
+
+	sfp1: sfp1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		mod-def0-gpios = <&gpioexp2 2 GPIO_ACTIVE_LOW>;
+		los-gpios = <&gpioexp2 3 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&gpioexp2 0 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpioexp2 1 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		mod-def0-gpios = <&gpioexp2 10 GPIO_ACTIVE_LOW>;
+		los-gpios = <&gpioexp2 11 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&gpioexp2 8 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpioexp2 9 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
 };
 
 &duart0 {
-- 
2.43.0


