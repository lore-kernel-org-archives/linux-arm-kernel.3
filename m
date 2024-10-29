Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0538D2AB15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDfFcQtwlsb8sdhUPifGiCfwGPVjyTJuTkWI2AmcsHY=; b=BB111JrBTqHdlgTmW3jAIXKCOb
	UnRNNpgp97T3FKsezXts8N24h8AGmykj2ovENSNvBRhw5Pc3Ih/nBwZVXhFZopf+cOH192OsPd9Yi
	8f2d/K4VA/x4Ae8sI7zdbIgVVlrUCLkCrTsdC6bVlTquIykGNLWXv4t+KEKACLt8knOwlE4B6NISx
	xs5/pN1Xqm2V3qktlyhaVvUobPB/hCO3UzRw823NR8nrwqoa1NHE2UhI3VScqkPSKhk/yqaIQJ+Z6
	a2KUJLJi6v118Nu2lSIKZnhrjdClj05g0V4k00t1ogZa4xOqKZklnA3exFRgx2igHebaQWB1lvPxH
	RzuKIBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tBS-0000000Fsjd-30nG;
	Tue, 29 Oct 2024 20:51:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slH-0000000FlEu-3ArE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so7110945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233458; x=1730838258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDfFcQtwlsb8sdhUPifGiCfwGPVjyTJuTkWI2AmcsHY=;
        b=FhjWIGSUOhi6ZYJPwl9iOwX4+YerF1EVv3nw/bh4vWqw5/pLeD3MCiLrpV6i2FjRgU
         2cA9CSghp3vkKFvUEmoyzutj0EjG/9e/YDUUbvCEpDh9FWWjtYGFRq1rrDserBiophba
         hljeBgVFHXxif7q6b3wT75hwePy/pXHdNb1hmI6D1WNmFc3bXc155Yn8bmdG1TJxm6Ro
         jFchFLm5a0E0mBCET2lFoZ/hMrjvaLe+iPh/T1X1Q28b6DKlnhSr+W/nZofacvnHiJOJ
         MZLGfRiirHJfh5/TrrgYnggL4WrzJZc7Mhmo8GwdIY6ypx/dA8L6bugmYrLnlypsP+6r
         1UmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233458; x=1730838258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDfFcQtwlsb8sdhUPifGiCfwGPVjyTJuTkWI2AmcsHY=;
        b=VcgGDMWVj2KnqFyEKehoS51TQLls2IUFjawfRm5B5/nycyfNWm5w46p7yi3CM10oWP
         wwZ5pGduQ/BUNWGfZ/Itu4RlC8K7n/aU1WJmh7JdVlxMLJJlSUCRUh2Y7zlBSdku55rv
         Fq/npePguQhCX50Cn62FIO+p8u0BSB01a/gM1nTSlDaY0MMRMzNMzvZrKKdHJR0ogOVX
         jpaOrJ1KAbT7qUP/HnsrpOMxa9TPg+w3o7AfNAt64kj9YnMC8bEjSh5gE1ilw+vP7PxG
         cV/K48rmS9laqGQQxgvFoO02jF9fKLlup+fjA7+fpvpNbUnyQy+GLLNpjH7zSfxcEIh1
         Ri6w==
X-Forwarded-Encrypted: i=1; AJvYcCXm5gjZXIjbIY1HT5GChmC5v0YX415Nlp0zrX+EaAE6Pe++sAqkfFSQ8RW7dNtTUoeAW2CeDOkCW2WAm8Ks8to4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKjruLxlEVDNXxGq25yu1VXhFXrH345s9hP3tvteY/CP2f1Brj
	A2PU3ZiGJL4Bxy346KLdQO5DJlJONCB8iI3RZCHpfcbsplvyPgEy
X-Google-Smtp-Source: AGHT+IFE7f+mcTgw3Qv3uKYNuqGe8n7rqs8Z6UWT4HyGHwg4bDM68NzHpmbNTH0uzMtZGXQ9VNYBUQ==
X-Received: by 2002:a05:600c:1c29:b0:431:50b9:fa81 with SMTP id 5b1f17b1804b1-4319ad368f4mr46961705e9.7.1730233458241;
        Tue, 29 Oct 2024 13:24:18 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:17 -0700 (PDT)
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
Subject: [PATCH v4 15/23] ARM: dts: socfpga: add Enclustra Mercury SA1
Date: Tue, 29 Oct 2024 20:23:41 +0000
Message-Id: <20241029202349.69442-16-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132419_824631_DD49BE12 
X-CRM114-Status: GOOD (  15.62  )
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

Introduce support for Enclustra's Mercury SA1 SoM based on Intel Cyclone5
technology as a .dtsi file.

Signed-off-by: Andreas Buerkler <andreas.buerkler@enclustra.com>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 .../socfpga/socfpga_cyclone5_mercury_sa1.dtsi | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi
new file mode 100644
index 000000000..2041088b7
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1";
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
+		reg = <0x0 0x40000000>; /* 1GB */
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
+	/delete-property/ cap-mmc-highspeed;
+	/delete-property/ cap-sd-highspeed;
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


