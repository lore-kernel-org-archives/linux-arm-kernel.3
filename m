Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A6BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=; b=G6B/Nc51D+UziSZbVjVIflruWB
	twiIHlUy2hNZwLY8VjEcEXNI/DlcvAYxBcWTTlXdMkTh/jHtd6TRN1CT7x9Yd/iqNfBM+gSX5qTBp
	AE6C7/NBIDdOs+1Gh3n3zbQn62bqzMj98o3IpkOtZavkbYppYgqmMqROR+9ocWAGIEtzrZ1FG7JIC
	x6qAEVrHVSCp4iNIUq1Fxq7BCzT/PLNF8uUnJo1b6FQIy4QQLc59q6r9ofdZmfy3e5TIECEUwfiwt
	wEudAE2zE+Q4nlOJDvOQvqCja8xel7WWCbWHnqVuA7jA1GmxkJ0BnRO6d9kDQLtgqrmojIPTBU9wh
	zN8OoadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKb2Y-0000000FZEo-2Ya4;
	Thu, 29 May 2025 11:03:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKanv-0000000FXcD-1zee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad88105874aso108299166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515686; x=1749120486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=MkOB/NnxSrmyZZ39Km17m2kdV4gXB3CpNnU6AFpESVPUKYZeRC0IMKoVpsGpLlJBd7
         x/tD6tUkTTL7Z/AAVhg326Nu9QxzstIjm66a0SXGtG9XgXgOSBO/K0658JJPUgCq3Dh+
         zRpjv2AZeMUhv3dDotdqbx34EhCKOBNLK1kFlU1mez8j+TZpGztLfqmHf5heHMD8TkZ0
         koxH4ALPDSn/SHmMUEVh6lB/PJEkUDbO8CZTa6ttScVUwltvPFv+Hg1uCqeFFxGX2t1o
         j0LL8mtrk5WzIMJ6pHzK9docwiSpeC9JLa4y7HKa7N2Bpew7/fe6SxXxCJOq2eYDDHd2
         FUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515686; x=1749120486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=rO6IFebt1QbzHNXdZAWRKYfn3YmAsCY1jlX5W9Rbo3LcTVDa6AvXdDTC/o+ZIxV63t
         5MQaYf1fpaVrZFRWGgKDxonblGWuK4uRkAOf1+/AyomcIjFKMBKuvpCN+LQgFMWG4ptv
         It4PPW6SFJ6CYkwx6OxD8L5NximES9P60GYkVTgyMkniakXz+YvxilyC9IkeZiSWdJFA
         9167LfoLYERDHx6M6+j5vaBzPRy3RNyxHDbV3C97RjPRQvh3Df3FBjY/YPVdMwTuT0+e
         R18R0lYADsed6NMFYMxelnfZjF2lukpo+i/l5XtQDIpeiohPhmojLd/QvaZb4c4eWbGS
         lccQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYvdxe/Jo8UaKI38hzb6bewIYm0eB7z+mdN3/iz/QGG6jxPfyJI7dFeislc7LjGoox0xbEljf8f4XB6j/QyHCi@lists.infradead.org
X-Gm-Message-State: AOJu0YxuxEuPuox9q0FBvNS5e2lgIUaB5lh3v+PFBBhRMjvcDir1IAuU
	vRxy0S4+RbgLMevXm62rIO7l85seOm/SLQcWLTB5shZ25NBrLsz/gBFiHFIlnENOdYg=
X-Gm-Gg: ASbGnct7RIyjyHOUsqMZm+ouM0krHGkqcNm7DdkYUQONzdjydGW6lYCtPNRCDlmuvVJ
	bq9dNKyXIRNnDUi5FwT+ryTpJwrhMzMKKiBjOOSOVTpiovhgkuju5ElLfyYif++8A4wTNaCI/Hz
	BVp9U72+e9yf0TjjkUM53CJkmLULnTqLA4u9bqNc7IHiN/IRJHLhmB0XRhXUhJYCfSTtwht4tIb
	1AunO+HSQagkPIbwWF1H6DrZNdwngKc2Z83d0NaWj9fuVgRrtjzgrnLpYJixj2fGY8zahkoYxiO
	/fMjwYUJ79UOQH+P46j6avptzrnzuyt6EAUH2i1F38O8HoAtDpmQFLTmud6diekvORFd/N2kBDa
	b//pLBp16iNtH3k8BWEtLbQ==
X-Google-Smtp-Source: AGHT+IGh8TR0aTk3/840g4wSBI4XDXnF7+SV7GWaCLcPzE7octWCVbP3trjbOevfutoSZKgkJ9B+LQ==
X-Received: by 2002:a17:907:7b9f:b0:ad8:9428:6a4a with SMTP id a640c23a62f3a-adadee31232mr162318866b.32.1748515685891;
        Thu, 29 May 2025 03:48:05 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf045sm119807466b.108.2025.05.29.03.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:05 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Thu, 29 May 2025 12:49:23 +0200
Message-ID: <20250529104940.23053-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034807_518735_E5E7F379 
X-CRM114-Status: GOOD (  15.79  )
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

RaspberryPi RP1 is a multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.

Add a dtb overlay that will be compiled into a binary blob
and linked in the RP1 driver.

This overlay offers just minimal support to represent the
RP1 device itself, the sub-peripherals will be added by
future patches.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi  | 14 +++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
new file mode 100644
index 000000000000..5002a375eb0b
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+pci_ep_bus: pci-ep-bus@1 {
+	compatible = "simple-bus";
+	ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+	dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	rp1_clocks: clocks@40018000 {
+		compatible = "raspberrypi,rp1-clocks";
+		reg = <0x00 0x40018000 0x0 0x10038>;
+		#clock-cells = <1>;
+		clocks = <&clk_rp1_xosc>;
+		assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+				  <&rp1_clocks RP1_PLL_SYS>,
+				  <&rp1_clocks RP1_PLL_SYS_SEC>,
+				  <&rp1_clocks RP1_CLK_SYS>;
+		assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+				       <200000000>,  // RP1_PLL_SYS
+				       <125000000>,  // RP1_PLL_SYS_SEC
+				       <200000000>;  // RP1_CLK_SYS
+	};
+
+	rp1_gpio: pinctrl@400d0000 {
+		compatible = "raspberrypi,rp1-gpio";
+		reg = <0x00 0x400d0000  0x0 0xc000>,
+		      <0x00 0x400e0000  0x0 0xc000>,
+		      <0x00 0x400f0000  0x0 0xc000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+			     <1 IRQ_TYPE_LEVEL_HIGH>,
+			     <2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
new file mode 100644
index 000000000000..0ef30d7f1c35
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+rp1_nexus {
+	compatible = "pci1de4,1";
+	#address-cells = <3>;
+	#size-cells = <2>;
+	ranges = <0x01 0x00 0x00000000
+		  0x02000000 0x00 0x00000000
+		  0x0 0x400000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+
+	#include "rp1-common.dtsi"
+};
-- 
2.35.3


