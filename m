Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAB0E6C605
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QHrq794Ih5pYkF5V8jWF79AEJa/rQYkl6C1PtmKoic=; b=szYT20oY3qK5j38juMVzS51smW
	PFvFMoED5In4VPp9tIe2iykCHLP876f/Os4x3tXOraVMccKajcee0weKSrK1xPNNvQv8VWd5ySzDU
	NGl1NwJLNjFf3Rit9bvffgDwPWSvMvZjzJLl8YhckljKBVBVcyeDPiu7mOx4ZiEHYOENP0g6gsoWa
	TVFdz/MiFg3+C5PNhZ7jNjAtjHl8Z8kppEo3+AZReHd0lYGZWX1TKC5LLj8720MT8kw6/sc4iS8eF
	b4z75NfbvHpR7n0fowdVXHwuQVd8gbEc5VDAi6aaso9QRPqNDmDOI0rFnvXg6oKa9gJT0oRcOxYIY
	qkFicvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tILFm-00000008Iti-3UAo;
	Tue, 03 Dec 2024 05:15:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIL8K-00000008HRE-0fcC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:07:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-215b4681c94so6687895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202455; x=1733807255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QHrq794Ih5pYkF5V8jWF79AEJa/rQYkl6C1PtmKoic=;
        b=H+93TgqGVH2dXEnsnncwQB13ofH8BhZmtkzBvE96YAP6KvssAjN0b1uNGb8XccjRiF
         +VCjQbHn9m2cRC5kNzGsHW62LpHWvGW9w3GBoNkyXycZR6MYEh9QgzLb8dOpiNEK1gTL
         QSvCzPuhG9DF6DzFCBMIiIAmPRmXJdG6V6bTZHf4Ews3S+CNxeAAZeRzyvLn7BPvqV61
         eVbkoMhrctUzYfXfpxitVjJxFs/bfI+Zae1gm2SqV0v9QJOFI5tulc4eJhQelbLiIxOK
         oIKBlL9Q1DlLmnfLc4ZiIewlBozzW35mYPXmBnajR6lwUDlw/VYSvlLpvNCX5AIKcbGO
         2ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202455; x=1733807255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QHrq794Ih5pYkF5V8jWF79AEJa/rQYkl6C1PtmKoic=;
        b=jBwX3X5Jg20Bailzh/IXr0KuhSMOrXVuSjsnEBO6tAZhFw6jKcgeREl0FoLt3DPzWY
         9vLUwNHiP0Aib0krczlVC7gdYT1Gc7PN0cEBaUCiNRxS1ghSkt15KAxKkNId0qPvazrV
         pkFcQQ/dlEm/9dJcf3w6ODX2YmPB+To+Bbcd+B7MMpB3WHBGPiQhHe4ziugxkYkdO0Rv
         qtM+dgA6wEiUK6WDvpRvkI+CELFjnT4hWw9+DmcvHsG7NtBjkLAjElrbF9TDBXx2mELA
         i4BOj2pdfGENgcsIaKX1GUUudeFXh7fQYehE0F9iibh0RJZ4uoaI7fmXKlSKmoH36G10
         NYGw==
X-Forwarded-Encrypted: i=1; AJvYcCUKphLKow1pRWoPOHEufft0I8K6/n2cMI0uLPAG1U6wa1bu0mGe1r9qBdeazsF18Z4n9fan7eQMvhA9j+R1hopO@lists.infradead.org
X-Gm-Message-State: AOJu0YxrV+sLfiMIZmIcT+PcUZ8oiy2XaNCWL3EdADcqfv2S9vLzu1Nr
	UB5mYVUjoj5jP+jUPI5hEWdHJjxNZI5s9SWsS2Yg4rb9rJRRzAVm
X-Gm-Gg: ASbGncvnil9uhVJ1RMDSsoEJdDb8oHDF1V6ntywr+LhJnimNMM1XQOiSgnTEhcpldk+
	J7mojFkBWtQoJMJOqh56IU1scB+AGd40+aT8J46DHQ8YM+peOHM7pK0r0zH+zq/04icIugM2ZEn
	5DtIlsJSu/XzzpuJVqnXkGUzli6N8p5qy1Z25GQc0DE+ZjcEESa4AiaEafbCJnnHK8+QEm3WDIS
	n/0FMR01Lrf9u+2HFCC9fo5yQPfCHk2f4oqNsZGV76sQuyZeYy5SBbMPLagqW86bg==
X-Google-Smtp-Source: AGHT+IEnYInT+/EXod4wh55jG/4Zhv6qOk7tq0BaUQYN4n8Layq/ZFFn0o1b+z4invx6ozzD24CwEA==
X-Received: by 2002:a17:902:d2c9:b0:215:681d:7a52 with SMTP id d9443c01a7336-215bd17a76cmr13736895ad.55.1733202455219;
        Mon, 02 Dec 2024 21:07:35 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v5 07/10] arm64: dts: apple: s8001: Add PMGR nodes
Date: Tue,  3 Dec 2024 13:05:37 +0800
Message-ID: <20241203050640.109378-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203050640.109378-1-towinchenmi@gmail.com>
References: <20241203050640.109378-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_210736_207781_A03FE72E 
X-CRM114-Status: GOOD (  16.64  )
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

Add the two PMGR nodes and all known power state subnodes. Since there
are a large number of them, put them in a separate file to include.

Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 6 files changed, 873 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/s8001-common.dtsi b/arch/arm64/boot/dts/apple/s8001-common.dtsi
index e94d0e77653a..91b06e113894 100644
--- a/arch/arm64/boot/dts/apple/s8001-common.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001-common.dtsi
@@ -24,6 +24,7 @@ chosen {
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
+			power-domains = <&ps_disp0 &ps_dp0>;
 			/* Format properties will be added by loader */
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi b/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
new file mode 100644
index 000000000000..e66a4c1c138f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (12.9-inch)
+ *
+ * This file contains parts common to iPad Pro (12.9-inch).
+ *
+ * target-type: J98a, J99a
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+&ps_dcs4 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs5 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs6 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs7 {
+	apple,always-on; /* LPDDR4 interface */
+};
diff --git a/arch/arm64/boot/dts/apple/s8001-j98a.dts b/arch/arm64/boot/dts/apple/s8001-j98a.dts
index 6d6b841e7ab0..162eca05c2d9 100644
--- a/arch/arm64/boot/dts/apple/s8001-j98a.dts
+++ b/arch/arm64/boot/dts/apple/s8001-j98a.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s8001-pro.dtsi"
+#include "s8001-j98a-j99a.dtsi"
 
 / {
 	compatible = "apple,j98a", "apple,s8001", "apple,arm-platform";
diff --git a/arch/arm64/boot/dts/apple/s8001-j99a.dts b/arch/arm64/boot/dts/apple/s8001-j99a.dts
index d20194b1cae7..7b765820c69e 100644
--- a/arch/arm64/boot/dts/apple/s8001-j99a.dts
+++ b/arch/arm64/boot/dts/apple/s8001-j99a.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s8001-pro.dtsi"
+#include "s8001-j98a-j99a.dtsi"
 
 / {
 	compatible = "apple,j99a", "apple,s8001", "apple,arm-platform";
diff --git a/arch/arm64/boot/dts/apple/s8001-pmgr.dtsi b/arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
new file mode 100644
index 000000000000..859ab77ae92b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
@@ -0,0 +1,822 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple S8001 "A9X" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@80000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@80008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@80040 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_busif: power-controller@80148 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_busif";
+	};
+
+	ps_sio_p: power-controller@80150 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+		power-domains = <&ps_sio_busif>;
+	};
+
+	ps_sbr: power-controller@80100 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sbr";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_aic: power-controller@80108 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dwi: power-controller@80110 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@80118 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_pcie_ref: power-controller@80140 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_mca0: power-controller@80160 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@80168 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@80170 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@80178 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@80180 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@80188 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@80190 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@80198 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@801a0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@801a8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@801b0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@801b8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@801c0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@801c8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@801d0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@801d8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@801e0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@801e8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@801f0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@801f8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@80158 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_hsic0_phy: power-controller@80128 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_isp_sens0: power-controller@80130 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens0";
+	};
+
+	ps_isp_sens1: power-controller@80138 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens1";
+	};
+
+	ps_pms: power-controller@80120 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms";
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb: power-controller@80278 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@80280 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80280 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@80288 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@80298 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host2: power-controller@802a8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host2";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_rtmux: power-controller@802d0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "rtmux";
+		apple,always-on; /* Core device */
+	};
+
+	ps_disp1mux: power-controller@802e8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1mux";
+	};
+
+	ps_disp0: power-controller@802d8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_disp1: power-controller@802f0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1";
+		power-domains = <&ps_disp1mux>;
+	};
+
+	ps_uart6: power-controller@80200 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@80208 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@80210 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_aes0: power-controller@80218 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aes0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mcc: power-controller@80230 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_dcs0: power-controller@80238 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs0";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs1: power-controller@80240 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs1";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs2: power-controller@80248 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs2";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs3: power-controller@80250 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs3";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs4: power-controller@80258 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs4";
+	};
+
+	ps_dcs5: power-controller@80260 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs5";
+	};
+
+	ps_dcs6: power-controller@80268 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs6";
+	};
+
+	ps_dcs7: power-controller@80270 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80270 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs7";
+	};
+
+	ps_usb2host0_ohci: power-controller@80290 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usbotg: power-controller@802b8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@802c0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@802c8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_dp0: power-controller@802e0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp0";
+		power-domains = <&ps_disp0>;
+	};
+
+	ps_dp1: power-controller@802f8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp1";
+		power-domains = <&ps_disp1>;
+	};
+
+	ps_dpa0: power-controller@80220 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dpa0";
+	};
+
+	ps_dpa1: power-controller@80228 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80228 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dpa1";
+	};
+
+	ps_media: power-controller@80308 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp: power-controller@80300 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_msr: power-controller@80318 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@80310 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_venc: power-controller@80340 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80340 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie: power-controller@80348 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80348 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_srs: power-controller@80390 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80390 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "srs";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie_aux: power-controller@80350 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80350 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_pcie_link0: power-controller@80358 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80358 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link0";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link1: power-controller@80360 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80360 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link1";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link2: power-controller@80368 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80368 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link2";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link3: power-controller@80370 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80370 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link3";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link4: power-controller@80378 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80378 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link4";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link5: power-controller@80380 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80380 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link5";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_vdec: power-controller@80330 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80330 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec";
+		power-domains = <&ps_media>;
+	};
+
+	ps_gfx: power-controller@80388 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80388 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_pmp: power-controller@80320 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pmp";
+	};
+
+	ps_pms_sram: power-controller@80328 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80328 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms_sram";
+	};
+
+	ps_sep: power-controller@80400 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on*/
+	};
+
+	ps_venc_pipe: power-controller@88000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me0: power-controller@88008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+	};
+
+	ps_venc_me1: power-controller@88010 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+	};
+};
+
+&pmgr_mini {
+	ps_aop: power-controller@80000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop";
+		power-domains = <&ps_aop_cpu &ps_aop_filter &ps_aop_busif>;
+		apple,always-on; /* Always on processor */
+	};
+
+	ps_debug: power-controller@80008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_aop_gpio: power-controller@80010 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_gpio";
+	};
+
+	ps_aop_cpu: power-controller@80040 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_cpu";
+	};
+
+	ps_aop_filter: power-controller@80048 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80048 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_filter";
+	};
+
+	ps_aop_busif: power-controller@80050 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_busif";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index 23ee3238844d..3963c6d8ca5e 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -61,19 +61,30 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x8c000>;
+		};
+
 		aic: interrupt-controller@20e100000 {
 			compatible = "apple,s8000-aic", "apple,aic";
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -95,6 +106,7 @@ pinctrl_ap: pinctrl@20f100000 {
 		pinctrl_aop: pinctrl@2100f0000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x100f0000 0x0 0x100000>;
+			power-domains = <&ps_aop_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -113,6 +125,14 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pmgr_mini: power-management@210200000 {
+			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0x10200000 0 0x84000>;
+		};
+
 		wdt: watchdog@2102b0000 {
 			compatible = "apple,s8000-wdt", "apple,wdt";
 			reg = <0x2 0x102b0000 0x0 0x4000>;
@@ -131,3 +151,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "s8001-pmgr.dtsi"
-- 
2.47.1


