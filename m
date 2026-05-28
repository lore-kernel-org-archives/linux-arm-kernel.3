Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D32CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=; b=iTz49XdL09cS878hdl9Pwj5V/y
	PGJYKaDvWB+4fN7tiyyWaIODMei0m7EChkMYaizM/FJ8bY9rszikFQDDYPOpz1aSed0yuj3nnrpgu
	KeWofdnijtvaffnSyeSDHStr2QgGDVUPwvh74NIRBQeG+pglcqqrLTA330+H1qoOqdhsEN1DkMaDC
	jf7hW2/Bno10fjV1RUOIV0xLi5BoerCFCcg/Ln1IEWkfWP9Nnlml+3LAMwYZ62+oRlKtP7Q8KRtlx
	BddCcAxM0qNdBwc/S8SWCqnKfIzo6uhcmF/R2KBSElYZvNUMfcOeEa+rXroQm/NM8KaW5uVgl3kBq
	cZKcU8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdDT-00000005xdt-1Q7e;
	Thu, 28 May 2026 16:04:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdDR-00000005xd1-03Wm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:04:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-459bf19e87bso7849081f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779984251; x=1780589051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=;
        b=ADlJeC9oWyzF1CZqvmh1U5XU0Rs6gmHFl2ZqD3UIQ2Km9LUoeZiFkXqTNTAIrYHLW7
         fYjLecpQ4zM/NoGDJsfHlmbKnL5MFTD0hgZpTdWOswIBxdftRIc3cAUyxzybjLwzqj8A
         pv7p1weSZK78pirDo5xx+GENQxCfTs0omhrZCmTGt/dXPIL1kvVY5dxEY6yf/Et+Fpnx
         q/0F6MLZWLTh/dafFjYEomNMDrn5MlNnUGFvTaagtnPZvzeGz2+pCVXkBzv0CRn8wy7q
         EeHg8croVzltVl8Iy6EkGJPl13Q/2SO9Exrrh+6YyeeOUEF9i/lvt30Apy48g6ebEmN0
         e9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984251; x=1780589051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=;
        b=YUe8PDBCqI2M80FpQXKLWR8M8uGFzxqzhNJmuew7itJOujQFMoTwmoDfB5moatAFOA
         O+awaaMpaK8OqFvdDVZp+el5wq1doxqHmRncMa+AItHMFCfo7KPwpnOiZXKaS/3xxXzP
         kqtK+pj2/FTm54Rs5a/o23wwyX3E+9S5iira1BvNcTKf1hScPIx9femJ7Oux8BdKXGg2
         RPiYYXg8amhTKimlBaUtLkoyaLrQbSWDaX7/AK+ZcH6iHeToqY908I9GRt9Ar9+kD4Zy
         4PQ4MhXLRFuLW2cvyu/tzLjPwIu/LE2SH7CaeAkEOj0AOxv/v4i8IZPmCh27G45EFsGM
         L06A==
X-Forwarded-Encrypted: i=1; AFNElJ/PoFrSup15/gqvt/xahSPlQqXPyLdkhzAZGkync9m+XSEEPKRdk2znp+ceWzhW/wdhpt5LL0mwNogTT3uDoPPV@lists.infradead.org
X-Gm-Message-State: AOJu0YzdIUUFQ54W6+MHSbToKRCjDusQFpQMzZI1dITEVFPyH4DXP+Zm
	VLmEZbqTUWdZOG5lQrwaqW/FrFajsk0ap4TgNPqhnoOYbimRYwUXkd5e
X-Gm-Gg: Acq92OFPnOR84eEi+z2rDiEk6G/5woUBqZrSufI8sGrcicK6hZWBwfuqEhaI8NjUrPA
	ikhs9sDiRZCtxn2IusAnc9Bs27EJnOg6PTc1TF5gzCjWb7CiHdhFgmEGVUmnUjcIQOg/ywdY70m
	4r3/sHnw1ZsRC3IZDLthEa6W246WeC/XO/+tYS8SqeFGSLucHnr7wO2A3jjPu+b5hUZshb3tx5f
	GDukj3IkVzYYQJOckCA0E529qnR83a5Tl3onlwjlQZAZ14bVyA+IpLpkEUcSHCr0AqkykIX0+s8
	4GHBnWS5BltT+NN0cNNgSlprNkNkQQlNKOiezdn2wyQwX8jFQ4l0ARyPwmdd1+WYocGJzE6KgC5
	jUDLEc/uV4/e9CR2rUhdmgPelIyYA6J+dnvuXlkGArhb/DHhuylU2wUEuzsriapR688AJaVgHMm
	xCGNw5gfL9EymeMIV+heSXaMIe57EU4DwvlmGQhenK2yOI9749ExM2WB6e3PFlICWbwgMwZURDt
	AInOMIOTA4yT95uZ8pzTRFJEIQDkwqhNTi0VTSspxDYvSGH
X-Received: by 2002:a05:600c:c168:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-49042268d98mr482071085e9.0.1779984250724;
        Thu, 28 May 2026 09:04:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908d9fb1b8sm34979495e9.2.2026.05.28.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:04:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Thu, 28 May 2026 18:03:58 +0200
Message-ID: <20260528160358.19006-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_090413_086388_ACEEB10D 
X-CRM114-Status: GOOD (  13.06  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the MCP251xFD CAN controller connected to LPSPI7 chip select 1 on
the Sonata carrier board.

Add the second SPI chip select GPIO and describe the CAN interrupt and
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx95-var-dart-sonata.dts   | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 0f3d2e488f4a..7985a42f5785 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -168,6 +168,10 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	status = "okay";
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio", "sleep";
@@ -280,7 +284,8 @@ st33ktpm2xi2c: tpm@2e {
 &lpspi7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpspi7>;
-	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>,
+		   <&gpio1 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	/* Resistive touch controller */
@@ -306,6 +311,19 @@ ads7846: touchscreen@0 {
 		ti,settle-delay-usec = /bits/ 16 <150>;
 		ti,keep-vref-on;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk_osc_can0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <12000000>;
+	};
 };
 
 /* Console */
@@ -442,6 +460,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
 		>;
 	};
 
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__GPIO5_IO_BIT15				0x31e
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22				0x31e
+		>;
+	};
+
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
-- 
2.47.3


