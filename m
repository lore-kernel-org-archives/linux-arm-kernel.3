Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3312D3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4xgLdJ/zq3TT39TRO4Bl0cM7YUtWPRkmL+0elQ1sU4=; b=kMl4/cGLcv/rWenQrX1oLQVAMc
	pi5HLj+uzQSNiqyDDfLqpBymbZVSoFn9NHn/H6Kl4WrfRCAe7JFAMr8gNzqt+3b5vNZpGm+p0GEES
	d+zMFMR/T5Z6C72bRZlQwDMPSwT1rwV5qbk9M41ltqVCo0PgezcfDAV2D0uwR3wb2nuF9hZMvhdSr
	mDZK0uY2PTDaySe4dsIZsnKMpqGcS+GJ76gEo+a5VCaSEiOy7R+oNH//zv4jHE2XdrLhvdHfsIwkn
	cjaqXOCx0Tb/kMIztsn8akZBL+Orq98yIdF7YLtNceDOiPHAVoBuo9WQ5mCliryEuy0T82QG1c/uY
	wEJCMPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tEc-0000000Fsy8-3HhY;
	Tue, 29 Oct 2024 20:54:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slL-0000000FlH6-4B56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4dbb4a89so618777f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233462; x=1730838262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4xgLdJ/zq3TT39TRO4Bl0cM7YUtWPRkmL+0elQ1sU4=;
        b=jtQNzr91oHdCA+R+NLcAMQIcaLSsX0gNOtkQh5/ddPAR8bem/VStNrhALEnT8kYtnV
         jXDKsh9tLvHcxd+PP48u+JejqyusYwubODvaIEf7SoRBFoI5OvJ+gRgyitnt+z8Hn1PZ
         16JlDs0PjqnzNeBbPHSvg/WgjEGpL5nU/FISGjmByhPNMOffR9lxgQVF3Mg/Cf+pewnu
         i2TZqPSkdv5q6OpEtsM/CRjRIM1xDYKxIG/VQqo+6URvPSQcNWwAOL0WbpH+qNBXoLaa
         aO3pM4mRD30+60AIOjz4/8O4LoNANyr5lFLmFW+imz1eOpHOZfKInQ+pQ3g9Xj1695R+
         A7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233462; x=1730838262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4xgLdJ/zq3TT39TRO4Bl0cM7YUtWPRkmL+0elQ1sU4=;
        b=ou3CUSAGe1/KhcLGyO+p5i0V3RGsf6EkJKEUJ5gB150gCMb9qPQn1ez0pT0G44ff0X
         Y1qk4IKwdEJXXlU6xujfBN70/8ewbM/tkmAdNxlrNT+njL/J0bg0tHBWYVd199m+r0u2
         eYVnRmU04a/w1rFGPogdy28/EXmK/8QJrwffMXsJ7uzx/+JskTkxRHJNuwADtFv2uBPp
         Rr6f5L77TTUK0FDOlu6lWrug8+bAtLmY9WPNNrs1DxYh+VUv73K6Q4qdhaVnLLdrxRO3
         IjnsiLlZRcLlDbwKB7w1MIkWvG6L9ONWdK9hA8JGW4s5UnhFPSGJ8B64zocgbRYaq8iN
         l8/w==
X-Forwarded-Encrypted: i=1; AJvYcCV7WlWnqr50KLPBxPnNCrSioE/YUnUuJq9c23YhpV1VG/z+IXYVB9GVzOjaA4d4lnlkr/upIxVzM1aMNkdzWkCg@lists.infradead.org
X-Gm-Message-State: AOJu0Yysv/cEm67R/tANIfhUhJKH4gK9E4b0OjcUsMquIsOx78Sp0mJR
	LYNVNffs3cblMN6d7Rxa8xsWtC1CZf/oTJn5WJL9aqBYbHMJttvP
X-Google-Smtp-Source: AGHT+IF93dy2QhF/y0X6NxrgGak42ukUVq6DpefMzo9/fdczPIrjlQ18RH2F/E3f6Oam9A3PljccUQ==
X-Received: by 2002:a5d:6481:0:b0:37c:cf75:3945 with SMTP id ffacd0b85a97d-3806121a3c8mr4720122f8f.13.1730233461933;
        Tue, 29 Oct 2024 13:24:21 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:21 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/23] ARM: dts: socfpga: add Enclustra Mercury+ SA2
Date: Tue, 29 Oct 2024 20:23:43 +0000
Message-Id: <20241029202349.69442-18-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132424_061068_2A46EF76 
X-CRM114-Status: GOOD (  15.47  )
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

Introduce Enclustra's Mercury+ SA2 SoM based on Intel Cyclone5
technology as a .dtsi file.

Signed-off-by: Andreas Buerkler <andreas.buerkler@enclustra.com>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 .../socfpga/socfpga_cyclone5_mercury_sa2.dtsi | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi
new file mode 100644
index 000000000..f46f1410f
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2";
+	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		ethernet0 = &gmac1;
+	};
+
+	/* Adjusted the i2c labels to use generic base-board dtsi files for
+	 * Enclustra Arria10 and Cyclone5 SoMs.
+	 *
+	 * The set of i2c0 and i2c1 labels defined in socfpga_cyclone5.dtsi and in
+	 * socfpga_arria10.dtsi do not allow for using the same base-board .dtsi
+	 * fragments. Thus define generic labels here to match the correct i2c
+	 * bus in a generic base-board .dtsi file.
+	 */
+	soc {
+		i2c_encl: i2c@ffc04000 {
+		};
+		i2c_encl_fpga: i2c@ffc05000 {
+		};
+	};
+
+	memory {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x80000000>; /* 2GB */
+	};
+};
+
+&osc1 {
+	clock-frequency = <50000000>;
+};
+
+&i2c_encl {
+	i2c-sda-hold-time-ns = <300>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	isl12020: rtc@6f {
+		compatible = "isil,isl12022";
+		reg = <0x6f>;
+	};
+
+	atsha204a: crypto@64 {
+		compatible = "atmel,atsha204a";
+		reg = <0x64>;
+	};
+};
+
+&i2c_encl_fpga {
+	i2c-sda-hold-time-ns = <300>;
+	status = "disabled";
+};
+
+&uart0 {
+	clock-frequency = <100000000>;
+};
+
+&mmc0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash0: flash@0 {
+		u-boot,dm-pre-reloc;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl512s", "jedec,spi-nor";
+		reg = <0>;
+
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		spi-max-frequency = <10000000>;
+
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+
+		partition@raw {
+			label = "Flash Raw";
+			reg = <0x0 0x4000000>;
+		};
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+	/delete-property/ mac-address;
+	phy-mode = "rgmii";
+	phy-handle = <&phy3>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy3: ethernet-phy@3 {
+			reg = <3>;
+
+			/* Add 2ns RX clock delay (1.2ns + 0.78ns)*/
+			rxc-skew-ps = <1680>;
+			rxd0-skew-ps = <420>;
+			rxd1-skew-ps = <420>;
+			rxd2-skew-ps = <420>;
+			rxd3-skew-ps = <420>;
+			rxdv-skew-ps = <420>;
+
+			/* Add 1.38ns TX clock delay (0.96ns + 0.42ns)*/
+			txc-skew-ps = <1860>;
+			txd0-skew-ps = <0>;
+			txd1-skew-ps = <0>;
+			txd2-skew-ps = <0>;
+			txd3-skew-ps = <0>;
+			txen-skew-ps = <0>;
+		};
+	};
+};
+
+&usb1 {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.25.1


