Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA9C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=; b=KCs64E/pLLV5D2SihyEpU360+W
	5aslz2/h6WwbpSU0t1HFovOW45ShnkC91mjrFl1jw/qpt2TCzEETjI4UMFgdTGW39QcvKEGKslHyE
	cGoICR45n5DyjlKEtpf4rOGyU2G9F4ZTQduyPdJYlHIqzaO1FXUzpSw2PDIR2vVY6A3j0IfpbIXUT
	qT5OfoCJa2Oa18LmlYYr/nByHbrRDcyxlfUny+PFO6sA4kIR75bBA3pZzoVPsw3Jo0M2lc4H3nr1O
	zbdrF8Ed+FsztexN4rReVch5/tBmsbgXDa7kl7a1H0Y1EaTFdaLLlt5pmdHfvw5MQ5Sol9wKFFDAE
	RIUwIrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrbw-00000000uKi-40qS;
	Tue, 25 Aug 2026 13:54:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrbu-00000000uJn-1hpd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:54:43 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c214321dc32so929317866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666080; x=1788270880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=GCGnhmXJtpYyrm1FuAtiV6YqpasuZTW4Zaewx0ObmD9FC9DL696YiCgC2V0FParLha
         MRxtFcxPmcH6RF/8/Hi8JA9XLh6jFKjrAZTF2aCPdv+mxTI/z1SsYQQLrvGTeb0gXfzD
         n+hF/+7PgS21mwhQaXhShTZV4z7tIjpZicIr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666080; x=1788270880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=ex+Z6v/1WzE76FwB/1VPU1FqDyEwX9b/P/RhijNMfwCKgVteXgdvVngMR0uaTxJyMF
         OiTAl1vxviCzWoQQ6nGVHSVS1D29JVQX8Kz2A/1J22NlR06BbhwX+VIK4YjCBzUZrP2K
         DJC5sD3IE2ALvGSUBXPu80LU0oauTgyVZcmCg0WyKP/PZI0t9oJVGCBo33yaFT1KjuA2
         MTYqC2UKOjb4ihbQbaMXTLvGgCYRhNuOageAMty5gvM7xi2dLMtqmBLq6P4GuMfKLNkR
         ca5PpB139LRIoHSLubD77WHP1tKgW57nut7Yf2IkNM9T8LUL6grPWeDYSE6E6ylgwwhX
         iL6g==
X-Forwarded-Encrypted: i=1; AHgh+RozJxHpAH/+LyyIE3wY0Y5oXflJqAG0S+EKzwV8w0jqHVioHXLO6LMS1F7Qjmn1i2ZYpB1KDWaYAxvtJUtrwPMP@lists.infradead.org
X-Gm-Message-State: AFuF++kWN8KqKPesxN9b+JbG52Atb/vE5JGza4RmFBn7qyDtwq48b8Pt
	H20xP36sscUvmdRKZYPKSzCdHEF95yfADk12ZBCmnJi0THRZNzvCzkLm/fOIukg6fKMwF/CTFRc
	KPfDN
X-Gm-Gg: AR+sD11NoubotU4K+xyIytOaSXOtbq420X7wgb9INlePkL/FoOVV2ciX28oWOvMWG06
	p9mVc9+0CmDcH496X5CLWKRQx52TBJ7rdgPwJ2wNvJhaFRlvXbQJhbiP8omlfj0575bzCq2m6zc
	LWyga70d13NwKTSN1V1SlycsZ51GBYAPqtEULNzqqNxqbeQ6PxH0zqbmeXwck4eaX1Th53N9n2e
	zAVWZocngbQfakSYp1iSiSK99qHIfPzhTZX92flHKsUVPFLLysuy1lDiiI0wQFVd21xHveXPaPM
	bJOrCSJ4Ij3yoMk6GEHaeNWYyaCWrHzWxRSX4+/S5Kimdh5HxjivzMaSaBHw/wPLuTL4ZhK54Lp
	4L8QOKtohiTILuPmcpisgWj4hukr1AxjnhBHnjLtT6o2iLUBrPQW13HbCiLc/+DrnFOrurI78zW
	tH4ibM6j9rvEDhJI79rzy49GTkY82X3nS6/Zom9dTz76Uc9zrRZMYJJPJIUph3k+qUnShMKr3tU
	TfeVw==
X-Received: by 2002:a17:907:3e16:b0:c16:3074:657f with SMTP id a640c23a62f3a-c246a4ce3b8mr3890086666b.9.1787666080385;
        Tue, 25 Aug 2026 06:54:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1819330866b.60.2026.08.25.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:54:40 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA Cyclone
Date: Tue, 25 Aug 2026 16:54:25 +0300
Message-ID: <20260825135426.3967333-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825135426.3967333-1-petko.manolov@konsulko.com>
References: <20260825135426.3967333-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_065442_462873_AC976823 
X-CRM114-Status: GOOD (  15.56  )
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

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index 8df0976da01c..cdcea11abdfa 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
 	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
 	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
+	socfpga_cyclone5_draeger_m48.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
new file mode 100644
index 000000000000..fd597f15c0d8
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,M48/socfpga", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+
+		/* 1GB */
+	};
+
+	aliases {
+	/* this allow the ethaddr uboot environmnet variable contents
+	 * to be added to the gmac1 device tree blob.
+	 */
+		ethernet0 = &gmac0;
+	};
+
+	soc {
+		gpio3: gpio@0xff202000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202000 0x20>;
+			status = "okay";
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_I";
+			};
+		};
+
+		gpio4: gpio@0xff202020 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202020 0x20>;
+			status = "okay";
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_O";
+			};
+		};
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	rxc-skew-ps = <1860>;
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	rxdv-skew-ps = <0>;
+	txc-skew-ps = <900>;
+	txd0-skew-ps = <0>;
+	txd1-skew-ps = <0>;
+	txd2-skew-ps = <0>;
+	txd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
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
+&gpio2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom_mac: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&mmc0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash0: n25q00@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q00";
+		reg = <0>;
+
+		/* chip select */
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,page-size = <256>;
+		cdns,block-size = <16>;
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+	};
+};
-- 
2.47.3


