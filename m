Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA0D75BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmFdBAmyPJlGFUTTlreUxBYzIDgdjp64ciz7CA5AoGc=; b=uQFYeN610A1jyibGoUr4VQBSog
	4FYIquiLll9MxVezu1SdcGxiYMibzxJl/UZ66CJSgUcMX9ChmdVrdCT94hxdoPRxo0xq8AZb9llED
	8OhfR4FwygASWs+BlQ+NyNxLwrzRvhefe7CtMWjwPVrPhR3OsQ8dwH2NjMqByBcfL4cU9Cy5VnlzK
	AH8yhn4Av+qJh+VjcldkAVoU7drQx+joPMMiO17g8YBW8n8fvY+LxY7jszloXwo+I24c6EFg7/5k5
	+9SWC9xmvsVTAqUWKeKYSFnUh5R3ng2qeTTQw6cg9/ZEjYyWq3HvNZMRPf2eEtObTYrn9Yr4blDPe
	mVRu0bVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQQl-00000002AZn-0WPF;
	Fri, 22 Nov 2024 09:58:27 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQNC-000000029hW-1Qrw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:54:47 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7f8095a200eso2315204a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269285; x=1732874085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmFdBAmyPJlGFUTTlreUxBYzIDgdjp64ciz7CA5AoGc=;
        b=ZlWbGt2TQSBdhwFwjoXrC3bqVG88Vh/Uw+HcEs3BS8KqEj+Df+6d13gN536fzRvuev
         PYtbdX6oeEzE/NWQEAaLdBqysBulgNT1GOOziKzlI9fx6zCeGg3Lz7gZY71HIE0FAkVP
         fzZa0HWSxuzElv5NIXd5X9BtXQbaueSjjU//eNNKkr91CJ6c115b6C6HGyHzcvIXhoaJ
         11xbEypbJabLM+hU8qOhE8TnkKlTzvNUybPG9DrDQV6ZK0UUzut200fJe+XkkT7vVFHM
         /FDiUB12RwaIyX1AqUZoT3qQljQ9PD8C81qtX/oB+YcUUEZ1Tk3IUxxeTC69R6oos/bm
         mOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269285; x=1732874085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmFdBAmyPJlGFUTTlreUxBYzIDgdjp64ciz7CA5AoGc=;
        b=Pbc5DkM4J8pJvAesnJXSAIes0HfZluPFZPEqe3fsQno7hX1ZFmwUO9JZZzYLvjbjDl
         xzggGI6kOwKBkOOg6ClaKImAlp0l0IRBpsdB+nP4xVpdNqXxsakwIT7PGA2WsHeGlrk9
         3jJUYbWvAUD9ATVOmfLOO0WwWhBm+hLGqUKAP79EStg0+/K3F864+lFaL9FCUAVeDBJy
         cMhm7RpUVF5zU5NZZ3FidfxO8a02iSWpojud42V5NgFkpEdcr0/1r+1rHUr9aWOO4RBJ
         M8Bq5F0UZY47/RlZbzXSrMQZEDCkmVb4NVuPFAhds9gZglJAmGiU6dAEVTFDH5pC1EjX
         gkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4uxfhTvg4wjpT9CUGGOux/sV6UMnG/+MMdkKGENlQVS5hAY351tulHEniAZsMe8RGuNMPnwdJnSylT0HsLdAT@lists.infradead.org
X-Gm-Message-State: AOJu0YxjaC0tM6WUPnyBe4FJTcVWwTBlYg26KrkC0I12+2inauXdiH2b
	7vQZfBKy7JvHhatbTnBG5di0U30N/F7vXMWVu0/FDExPhlGmdgfP
X-Gm-Gg: ASbGncsGsWvjfPBOkgT+/YU1ORkdeXIvqnt4SecD/hOqEcMjDP907rI1JCJQ2mWlm55
	325v+nKBECt1E4BZc5dQYy/IFgZzklu+x5cslE1AmhNiul34vZiX0UWUq7wabs/0p3gSZVvhYb0
	MzQxVXYLIxqPYZGgVku6+KgR2JW8Bdz1zEvkjV+AWJdiEX0yEfDreW64yCLBj8B92s0IHFynaOM
	/kKyvgXuDQhcJ8n6sA+H69hMMVVHU7t/7Bgpdw1rDOy0E1R0RocmaUiHPAH/1LahiE=
X-Google-Smtp-Source: AGHT+IFz9q3oc2RE2NYFjE+08PZk/6LU2//+16PK588l/k/No7GlDauB+hoMrmFRQHWGF887IrqsCg==
X-Received: by 2002:a05:6a21:9984:b0:1d9:3acf:8bdd with SMTP id adf61e73a8af0-1e09d9aaf87mr3983535637.22.1732269285104;
        Fri, 22 Nov 2024 01:54:45 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:44 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 RESEND 03/10] arm64: dts: apple: s5l8960x: Add PMGR node
Date: Fri, 22 Nov 2024 17:50:32 +0800
Message-ID: <20241122095136.35046-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122095136.35046-1-towinchenmi@gmail.com>
References: <20241122095136.35046-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015446_387073_212C5D96 
X-CRM114-Status: GOOD (  14.84  )
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

This adds the PMGR node and all known power state subnodes. Since there
are a large number of them, let's put them in a separate file to include.

Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 5 files changed, 635 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index 0b16adf07f79..51c081923657 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -49,3 +49,7 @@ switch-mute {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0 &ps_mipi_dsi>;
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
index 741c5a9f21dd..7d6e799c933a 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -49,3 +49,7 @@ switch-mute {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0 &ps_dp>;
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
index b27ef5680626..2ba846db2266 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -49,3 +49,7 @@ switch-mute {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0 &ps_dp>;
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
new file mode 100644
index 000000000000..da265f484307
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple S5L8960X "A7" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@20000 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@20008 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_secuart0: power-controller@200f0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "secuart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_secuart1: power-controller@200f8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "secuart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_cpm: power-controller@20010 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_lio: power-controller@20018 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "lio";
+		apple,always-on; /* Core device */
+	};
+
+	ps_iomux: power-controller@20020 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20020 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "iomux";
+		apple,always-on; /* Core device */
+	};
+
+	ps_aic: power-controller@20028 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20028 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_debug: power-controller@20030 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20030 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_dwi: power-controller@20038 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20038 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@20040 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_mca0: power-controller@20048 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20048 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@20050 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@20058 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20058 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@20060 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20060 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@20068 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20068 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@20070 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20070 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@20078 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20078 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@20080 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20080 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@20088 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20088 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@20090 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20090 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@20098 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20098 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@200a0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@200a8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@200b0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@200b8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@200c0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@200c8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@200d0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@200d8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@200e0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart6: power-controller@200e8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x200e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio_p: power-controller@20110 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+	};
+
+	ps_usb: power-controller@20158 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@20160 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@20170 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@20180 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_disp_busmux: power-controller@201a8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp_busmux";
+	};
+
+	ps_media: power-controller@201d8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp: power-controller@201d0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp";
+	};
+
+	ps_msr: power-controller@201e0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@201e8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0: power-controller@201b0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0";
+		power-domains = <&ps_disp_busmux>;
+	};
+
+	ps_aes0: power-controller@20100 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aes0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@20108 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_hsic0_phy: power-controller@20118 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_hsic1_phy: power-controller@20120 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic1_phy";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_hsic2_phy: power-controller@20128 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic2_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_ispsens0: power-controller@20130 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ispsens0";
+	};
+
+	ps_ispsens1: power-controller@20138 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ispsens1";
+	};
+
+	ps_mcc: power-controller@20140 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Core device */
+	};
+
+	ps_mcu: power-controller@20148 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcu";
+		apple,always-on; /* Core device */
+	};
+
+	ps_amp: power-controller@20150 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "amp";
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb2host0_ohci: power-controller@20168 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usb2host1_ohci: power-controller@20178 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1_ohci";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_usbotg: power-controller@20188 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@20190 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@20198 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_cp: power-controller@201a0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cp";
+		apple,always-on; /* Core device */
+	};
+
+	ps_mipi_dsi: power-controller@201b8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mipi_dsi";
+		power-domains = <&ps_disp_busmux>;
+	};
+
+	ps_dp: power-controller@201c0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp";
+		power-domains = <&ps_disp0>;
+	};
+
+	ps_disp1: power-controller@201c8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1";
+		power-domains = <&ps_disp_busmux>;
+	};
+
+	ps_vdec: power-controller@201f0 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec";
+		power-domains = <&ps_media>;
+	};
+
+	ps_venc: power-controller@201f8 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc";
+		power-domains = <&ps_media>;
+	};
+
+	ps_ans: power-controller@20200 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ans";
+	};
+
+	ps_ans_dll: power-controller@20208 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ans_dll";
+		power-domains = <&ps_ans>;
+	};
+
+	ps_gfx: power-controller@20218 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_sep: power-controller@20268 {
+		compatible = "apple,s5l8960x-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		power-domains = <&ps_secuart1>, <&ps_secuart0>;
+		apple,always-on; /* Locked on */
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 0218ecac1d83..7705215fbdc7 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -62,9 +62,18 @@ serial0: serial@20a0a0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,s5l8960x-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x24000>;
+		};
+
 		wdt: watchdog@20e027000 {
 			compatible = "apple,s5l8960x-wdt", "apple,wdt";
 			reg = <0x2 0x0e027000 0x0 0x1000>;
@@ -78,11 +87,13 @@ aic: interrupt-controller@20e100000 {
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -111,3 +122,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "s5l8960x-pmgr.dtsi"
-- 
2.47.0


