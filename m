Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E9C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NkF+N0UTMUAuCV32wzpvbEEFJ7QOlBg6lBSc9eDzN4=; b=wZtEl1PRhhh02AVFNsWzFO3ONa
	/UeYVF06RL/Or1awgODRKsVzyhGqgAszZe7/SuiB7l+HOQS+1B0v2wX6FLVJPQUXIZ6dKC1RSRUK1
	z66Kq2ysro/ZS0KvjLyPvLUjj/E+MV+F2G6pCsSXmLkvHL0BxHIpKZf5urGEjWm5et/7ZYwAhcv1l
	3vzbMH0rq9KUDYxrO1ShbIX+ELb/gBjX9vsAtG6cnp8+nFyYEG2tF5R3VOOZ9rsR9CRRaax8AXdYE
	Mu4JHnmOgg/emPqFfhrpqdDWviCns3iYzmOEuRMghRBJDeAMbj7T47PODXlmumqnsosIsiWMQ8KnB
	ymE1XG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVAH-00000004F0F-3Yvu;
	Tue, 01 Jul 2025 07:12:25 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWURG-000000048f8-3dmG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351154; x=1782887154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6NkF+N0UTMUAuCV32wzpvbEEFJ7QOlBg6lBSc9eDzN4=;
  b=IfIUrpmt0L/xu8pJnIU7xUONZsJ+9+nNKEa9VovsSfb/x+vY9m96zjrL
   cvZf799MkyF+4Qtye1/0FGYsq2xc8YmKHK/a+cPcxgjkNBEVuYZZdoB8D
   0ZTr/5iscIgYSnLfZxRYK9Kek2o78pTb5HLTcU1vxqJHVUufdscKjapRo
   5T2i9wuPytyknHqYOYi1kZXePFMWhR8Glgrxv1JpeDalBK366sW+Ts7Eu
   R0aL6W50o0If7H0yX5nAaDFrzT1JijQiz8sPn/I/Wehrhp/lzzh9gMlQb
   xg2aoGBwMEWH1lGaAqIY6jDlJ6BEIgsqKwGb1bcw34YSXpY540EIh1QOE
   Q==;
X-CSE-ConnectionGUID: 4ELenKTjQHCpdQmFjYVtEw==
X-CSE-MsgGUID: P6lS5ylOTCykmUzLB5Vl8A==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943391"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:53 +0200
X-CheckPoint: {68637F71-46-497D558D-EBA6F5A1}
X-MAIL-CPID: 05F84F041D6AE13DEE7297BF9477E7D2_3
X-Control-Analysis: str=0001.0A006378.68637F8D.001C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45F0916A623;
	Tue,  1 Jul 2025 08:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NkF+N0UTMUAuCV32wzpvbEEFJ7QOlBg6lBSc9eDzN4=;
	b=oABy/B+xOExrtUzf9jDLKkdHAW6oOE9sq083m6MstFeKcEKypWM+21acdRu2SCvNE3C0Rl
	SJHmkT8xjAJjsVBISKENbSU7cGD1HQdlxpZ2Ejgr7N0IoK8h8xdcnacQsgvIoVADV3L0yn
	ClA0UhKz/4Qce+9f5yLqzzkf+Q1ob0bcg/eexKftv7bPRXSc+XIn7aSGSrO9+W0EGiCil6
	ibnL2nzq5749gH4pFFo9f2o1gODm7Lh7E9mAGRiqtPF58nIgytLC65twPnut335C7WY9qc
	3a2upIpckF9XEvHF9MRdXvgDNv619XbAYON+i/A80BiizymxfMHB8y+Gb1eT4g==
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
Subject: [PATCH 8/8] arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash
Date: Tue,  1 Jul 2025 08:24:56 +0200
Message-ID: <20250701062500.515735-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232555_206995_4D29AA12 
X-CRM114-Status: GOOD (  11.02  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi             | 8 ++++++++
 4 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
index e39eaa1759365..257d90bb9c206 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
@@ -20,6 +20,7 @@ qflash0: flash@0 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
index cafb35f674aa4..fa543db99def6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
@@ -20,6 +20,7 @@ qflash0: flash@0 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -36,5 +37,6 @@ qflash1: flash@1 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
index 66a7aff893b32..b8a213df238a5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
@@ -20,6 +20,7 @@ qflash0: flash@0 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -36,5 +37,6 @@ qflash1: flash@1 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi b/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
index 138f8778afde6..7da1bfd83cca2 100644
--- a/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
@@ -8,6 +8,14 @@
  */
 
 / {
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
-- 
2.43.0


