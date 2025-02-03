Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13D7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGhuaGjPkwo6KzmbTjNKdWlaCU8Aaxznx8JCpQTjuTg=; b=iTaLX8EdsbdB5dAxkMFZwAiaAu
	MEzosLXPi5/B3dYVq7Keo1/XYSisu8Ub4tH+7RLvtZ/n3VfjGGX9h/khs7ktb8YMCEm7XK3Cbispn
	/Ohz5kiAYVMEMBngr73a2O0f0yvkpR+/qTMQ7mQWAe8BNZcvkc0Ua2Ran6sIZGzp3lEtf3JQMFJl6
	BYGASlxNv8mI+sjPzYR9Vs5vrQbiBB2S7X/Zs+VGvNS3ytDZ6c7F3j0uVc8qXmyft4mqNHwoyWHRF
	/6SeKgFQ0lUdMMI213vw+pkS23lGmM4+f2KJnPap1UEg6sV4OrR7Xzhm/f4bV/oFclw/nKId6z8Eu
	k7PdGIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevbU-0000000FNd1-2l5n;
	Mon, 03 Feb 2025 12:31:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevQB-0000000FLZB-1IhM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:19:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so94617345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585162; x=1739189962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGhuaGjPkwo6KzmbTjNKdWlaCU8Aaxznx8JCpQTjuTg=;
        b=WM+yzpMOZjXRx0aaZdCGk6dsr5Hk1NNBJ5hba9tdbbgC71+sCyY9AsrpkFMzuRzuvV
         lekcp3I1YDyiK3taSm0/FRI6kj4FDKYhbSqzQ2w7/XGBcIHLJv/Iu2g6H3PLKf5wnRDX
         BC8Vsu06zng+2bLyB+rMIfJHBoZQoz3Trp9IhH7rZrMA2EgwTHEBS/7Zof4fYdBYq4ue
         xUXYgoHbRS77mJ7sNpkmOgWvyZKiCdRUsBI26JfzaKYWe5mr3qzWRDieJu+Iih5vRBiO
         xMTIjHMyQWmWtmE22IVHEXximVFkZA9eoSLNjJAT6WLgPxRiYTHbOkXlHQ0wqMFt2Zcz
         qYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585162; x=1739189962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGhuaGjPkwo6KzmbTjNKdWlaCU8Aaxznx8JCpQTjuTg=;
        b=HzKBdy90xafYuX89c/krQMdU+Q+1e9lc8GrG/zUk3fHuWX8rHq5Z6iWG0FqgMfVXXL
         bFRVdjmNj1WTb0/PtrEvI1D4An3C6QwxPUoXd44L3+OjRc4t8GQ4yqc6d3h9JVSjcoHJ
         R7HuavzzBBEjsmqfmlJVW3dOsJf1M8UbeVKsHY40S7roirHcWXm7na9nIKy0AhdSEAcJ
         aEZK6V74PVlCKCgI7dtPfxiQlRrJyap/035uMsiqdV4EcUqQrWH0BxpMbVuJaqyti9+E
         JIa+yGsimi1dBsgXtKU5C3+mSjlM7vksPEZqlWV1EWe4Dsgp3TX8cVZyFOMM4qgBdyxd
         pI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvJOLo2TY81+6/IDZzCuixDjzUPQQD0Zy4Cenan7KWosN6e6b5W1zDY+l2uthkUjLVqo1ek4sYICI4DRi0Gzz5@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ5VlmTZF2z6TV+rZLEweVbc6BxAQK0kGkVuBiaVk7I79XfLfX
	i+bDpArg9J3eiBA5XxxbmY7Kj2QyJ1UkNJKCpvCuQg5CcB3pT6O/
X-Gm-Gg: ASbGnctdn1cWBEZI3P5bEpHCs8BD1J1+hPXAoGC7xRM1XAjwFvEfQZvfpJ2wAUmlrvn
	4WQggc769Zi/jpkNa+Zk88x2HYAO1f/mC6iKz+TO97oyparLyk/pONv9WFSYmPfm+y6coNn29DV
	zmVzt7MDZdCXQ68G4LCt4JF6vNABldhMdPndx4yl6zLcAbmzMPfLUzUW7FCoZU02rpMuQxJbggl
	Kwt6rxEsS19PDBnkigXiSAaJXCWvi+wCg56j0TJ3hBMMGTu7JEqbdpkWCaAn5ERDzj4En1FemzB
	ikxERoEFmdcJslZa
X-Google-Smtp-Source: AGHT+IHQOV4a0syiPtXrJSGu9Y0DGi4tH3mxNHKz2DKVQmN0Rw9S6fNPD7rRsByckfdaAmcsKpGuRg==
X-Received: by 2002:a17:902:cf0a:b0:215:a80b:f6f9 with SMTP id d9443c01a7336-21dd7c449ffmr284781785ad.8.1738585162510;
        Mon, 03 Feb 2025 04:19:22 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:22 -0800 (PST)
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
Subject: [PATCH v7 RESEND 08/11] arm64: dts: apple: t8010: Add PMGR nodes
Date: Mon,  3 Feb 2025 20:15:52 +0800
Message-ID: <20250203121831.36053-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_041923_352949_32F53B57 
X-CRM114-Status: GOOD (  14.05  )
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
 arch/arm64/boot/dts/apple/t8010-7.dtsi     |   4 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts   |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi  | 772 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi       |  22 +
 5 files changed, 806 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
index 1332fd73f50f..91fae47d25d0 100644
--- a/arch/arm64/boot/dts/apple/t8010-7.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -41,3 +41,7 @@ switch-mute {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0_fe &ps_disp0_be &ps_mipi_dsi>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
index 81696c6e302c..b83fe153763e 100644
--- a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -42,3 +42,7 @@ button-volup {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0_fe &ps_disp0_be &ps_dp>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-n112.dts b/arch/arm64/boot/dts/apple/t8010-n112.dts
index 6e71c3cb5d92..48fdbedf74da 100644
--- a/arch/arm64/boot/dts/apple/t8010-n112.dts
+++ b/arch/arm64/boot/dts/apple/t8010-n112.dts
@@ -45,3 +45,7 @@ button-volup {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0_fe &ps_disp0_be &ps_mipi_dsi>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
new file mode 100644
index 000000000000..6d451088616a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
@@ -0,0 +1,772 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple T8010 "A10" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@80000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@80008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@80040 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_busif: power-controller@80160 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_busif";
+	};
+
+	ps_sio_p: power-controller@80168 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+		power-domains = <&ps_sio_busif>;
+	};
+
+	ps_sbr: power-controller@80100 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sbr";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_aic: power-controller@80108 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dwi: power-controller@80110 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@80118 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_pms: power-controller@80120 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms";
+		apple,always-on; /* Core device */
+	};
+
+	ps_pcie_ref: power-controller@80148 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_socuvd: power-controller@80150 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "socuvd";
+	};
+
+	ps_mca0: power-controller@80178 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@80180 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@80188 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@80190 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@80198 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@801a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@801a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@801b0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@801b8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@801c0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@801c8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@801d0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@801d8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@801e0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@801e8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@801f0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@801f8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@80170 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_hsic0_phy: power-controller@80128 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_isp_sens0: power-controller@80130 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens0";
+	};
+
+	ps_isp_sens1: power-controller@80138 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens1";
+	};
+
+	ps_isp_sens2: power-controller@80140 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens2";
+	};
+
+	ps_usb: power-controller@80268 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@80270 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80270 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@80278 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@80288 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_rtmux: power-controller@802a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "rtmux";
+	};
+
+	ps_media: power-controller@802d8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp_sys: power-controller@802d0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sys";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_msr: power-controller@802e8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@802e0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0_fe: power-controller@802b0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0_fe";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_disp0_be: power-controller@802b8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0_be";
+		power-domains = <&ps_disp0_fe>;
+	};
+
+	ps_pmp: power-controller@802f0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pmp";
+	};
+
+	ps_pms_sram: power-controller@802f8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms_sram";
+	};
+
+	ps_uart3: power-controller@80200 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@80208 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@80210 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart6: power-controller@80218 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@80220 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@80228 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80228 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_hfd0: power-controller@80238 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hfd0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mcc: power-controller@80240 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_dcs0: power-controller@80248 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs0";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs1: power-controller@80250 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs1";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs2: power-controller@80258 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs2";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs3: power-controller@80260 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs3";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_usb2host0_ohci: power-controller@80280 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80280 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usbotg: power-controller@80290 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@80298 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@802a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_mipi_dsi: power-controller@802c0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mipi_dsi";
+		power-domains = <&ps_disp0_be>;
+	};
+
+	ps_dp: power-controller@802c8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp";
+		power-domains = <&ps_disp0_be>;
+	};
+
+	ps_venc_sys: power-controller@80310 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_sys";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie: power-controller@80318 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_pcie_aux: power-controller@80320 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_vdec0: power-controller@80300 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec0";
+		power-domains = <&ps_media>;
+	};
+
+	ps_gfx: power-controller@80328 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80328 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_sep: power-controller@80400 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on */
+	};
+
+	ps_isp_rsts0: power-controller@84000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_rsts0";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_rsts1: power-controller@84008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_rsts1";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_vis: power-controller@84010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_vis";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_be: power-controller@84018 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_be";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_pearl: power-controller@84020 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84020 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_pearl";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_dprx: power-controller@84028 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84028 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dprx";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_venc_pipe4: power-controller@88000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe4";
+		power-domains = <&ps_venc_sys>;
+	};
+
+	ps_venc_pipe5: power-controller@88008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe5";
+		power-domains = <&ps_venc_sys>;
+	};
+
+	ps_venc_me0: power-controller@88010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+	};
+
+	ps_venc_me1: power-controller@88018 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+	};
+};
+
+&pmgr_mini {
+	ps_aop: power-controller@80000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop";
+		power-domains = <&ps_aop_cpu &ps_aop_busif &ps_aop_filter>;
+		apple,always-on; /* Always on processor */
+	};
+
+	ps_debug: power-controller@80008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_aop_gpio: power-controller@80010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_gpio";
+	};
+
+	ps_aop_cpu: power-controller@80048 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80048 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_cpu";
+	};
+
+	ps_aop_filter: power-controller@80050 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_filter";
+	};
+
+	ps_aop_busif: power-controller@80058 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80058 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_busif";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index e3d6a8354103..ac1dda92f890 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -61,19 +61,30 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x8c000>;
+		};
+
 		aic: interrupt-controller@20e100000 {
 			compatible = "apple,t8010-aic", "apple,aic";
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -95,6 +106,7 @@ pinctrl_ap: pinctrl@20f100000 {
 		pinctrl_aop: pinctrl@2100f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x100f0000 0x0 0x100000>;
+			power-domains = <&ps_aop_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -113,6 +125,14 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pmgr_mini: power-management@210200000 {
+			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0x10200000 0 0x84000>;
+		};
+
 		wdt: watchdog@2102b0000 {
 			compatible = "apple,t8010-wdt", "apple,wdt";
 			reg = <0x2 0x102b0000 0x0 0x4000>;
@@ -131,3 +151,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "t8010-pmgr.dtsi"
-- 
2.48.1


