Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C8CE66894
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsaRoA1lnMwJ/rap2hmEXWNKa+6PDipeQK8JYQOi1WY=; b=HMAGt/9S9KJi0DJaSR4c6N6Xu+
	bMGSGLQer0ZO8hmyTmJlFiPFJCYDcNCFPCPAj57w605UL+Iuh6aclYTa1huakOEHeCbXekCkO4n+o
	tecRgYN2bJA7t7BebF+6mBfsz6Z65QBCQYdIt+dFkHrkqn8oAe+m3caSJ5/V0WUHvVX5XKKiBaOxt
	TJQxmNYtNHE4ur2NyGp7WYOJR8uiBwuOtsnN3/0j34gs8K5ZeGUEqFLGds/HR/VKLSko+nVNkxgXL
	BapVkwEN61Lzg+81shtVRPJKbZTbXS1W4rYyw5Lxs9NDz1bqKiUjaMse9JG8NVEPm+eF2roXhi+eB
	83V+DvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAL1-00000005f0J-3eSH;
	Sun, 24 Nov 2024 10:59:35 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFADC-00000005dYQ-2C2R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:31 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so6059818a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445489; x=1733050289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsaRoA1lnMwJ/rap2hmEXWNKa+6PDipeQK8JYQOi1WY=;
        b=TdEdvpbmtg1eI3/Sdr5EW85q4jD42ucmdaebPpO5RKzYZvMWq1TkK+Hzp7a+itpCwL
         QmwjlcqpSLtAM7L8NwE90ZruXQ81LRx2o904eHPk2f3V4NPd6Pl5fIsdqXQ2jWHkhYmT
         F+f+0XH+pURFnFrH7NSAmMHEZdx5bM4RBpfS41OpxPds1QWZehS1t/YpRORBEDhpIBey
         LcGta2Vtz9QQOrgkPKi8Vyf8nTzFH7nSHGZA+f9ZDpOwVvM0ER4nCsSu0GJGztaCJhwZ
         mqimnh/x7ywZtCG7m0svZU8YuhhlRVv57KVgJFQADaNwospl01rwThR6cRTdEMHg0AUM
         6VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445489; x=1733050289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsaRoA1lnMwJ/rap2hmEXWNKa+6PDipeQK8JYQOi1WY=;
        b=L41XGegjYQaaLGTyx0WytXKx77z75ptOXZARWz6ZeV6R2xDBYBf0I+nIF2VPQxtNpb
         /EP98bMJjS9zgUBFN7BIOPJ5wThDtN9urWm7uG8GPvKjyBQkEAu0RLA21STtkCKQ80qG
         rq58zjPszRm+lZmEpt8C02lhVNQVsWYuNAf3EXiKwpshXgiqypIVjp8PvwbBoN3jJONi
         XGa873tYnNccdtlx3XhA2BObwiZu2sVZCIm6qk0gchrFAHdORWK2P8nPeSDQc0PQ2FDY
         UI14fNLdj4FYp3Giha1KuKuGmPOKEaH+rhnIbYPlEe5Tencq6YYskKb1HwXcHaKQgm0z
         2cWg==
X-Forwarded-Encrypted: i=1; AJvYcCUCgDTlYQ39LcMfW1lYTmL/NXY4rnGSMBiGYiSDdc8SuygOUePDVV9eEc5kTyKudnGr98u9QG8/UN6tZEEy/OuB@lists.infradead.org
X-Gm-Message-State: AOJu0YzWuNrLnenkhDmg7aVaBQVoYmlfSlTmVooZ8PJdtmwyY8jZdoIB
	HHESBFz29/IJmyvTP1P6Pl4IYQaI3hqFuQFti5Bv5QW/hcE1uf1zR1YAyhKTFMs=
X-Gm-Gg: ASbGncs/az/Ptd4jCa6ywJL3CJiRTWgGICMin9yCgKDbjEmddTY9eEgzlLZyYUXj8wO
	g53rVRDJt6FQ+7wyaImkm2PJO8kNoQYN+WTg6Q+bFVZ+U4eF06oeDdgcdJfiQXOBD8/qF/Tlo/k
	PU4A3Futz5n8Y8SonBD63QFPe2MPDtwJcAr0i0Wdu3qCQ+PAzqH+897MMO6DA5MHD+KepGHx78F
	939JT9ejnbxN/ZMbs0QyOmENoirDy7Sn6I0ZCoFpkwRFHT/JdpDtRBQ7iJ5I1hWyz6yFriN58QR
	MvLBt+wRJzVXtMDa5BmL
X-Google-Smtp-Source: AGHT+IEOYxg6rA0GL3wgI9aS+qtVFpqrOUZqHHOpUaiFmnyQfx8cerOV23q+NR4gIGgGPlpOfQbCKg==
X-Received: by 2002:a05:6402:4589:b0:5cf:e76a:f96 with SMTP id 4fb4d7f45d1cf-5d01d3fab44mr9140439a12.8.1732445488782;
        Sun, 24 Nov 2024 02:51:28 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3a342asm2885244a12.15.2024.11.24.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:28 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 07/10] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Sun, 24 Nov 2024 11:51:44 +0100
Message-ID: <87fe9d5c88da7e2fd8315615578bd5b97f50e1b3.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025130_568887_3F19A462 
X-CRM114-Status: GOOD (  17.95  )
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
---
NOTE: this patch should be taken by the same maintainer that will take
"[PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver", since they
are closely related in terms of compiling.

 MAINTAINERS                           |  1 +
 arch/arm64/boot/dts/broadcom/rp1.dtso | 58 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index 06277969a522..510a071ede78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19383,6 +19383,7 @@ F:	include/uapi/linux/media/raspberrypi/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..cdff061e2750
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			compatible = "pci1de4,1";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			pci_ep_bus: pci-ep-bus@1 {
+				compatible = "simple-bus";
+				ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+				dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				rp1_clocks: clocks@40018000 {
+					compatible = "raspberrypi,rp1-clocks";
+					reg = <0x00 0x40018000 0x0 0x10038>;
+					#clock-cells = <1>;
+					clocks = <&clk_rp1_xosc>;
+					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+							  <&rp1_clocks RP1_PLL_SYS>,
+							  <&rp1_clocks RP1_PLL_SYS_SEC>,
+							  <&rp1_clocks RP1_CLK_SYS>;
+					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+							       <200000000>,  // RP1_PLL_SYS
+							       <125000000>,  // RP1_PLL_SYS_SEC
+							       <200000000>;  // RP1_CLK_SYS
+				};
+
+				rp1_gpio: pinctrl@400d0000 {
+					compatible = "raspberrypi,rp1-gpio";
+					reg = <0x00 0x400d0000  0x0 0xc000>,
+					      <0x00 0x400e0000  0x0 0xc000>,
+					      <0x00 0x400f0000  0x0 0xc000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+						     <1 IRQ_TYPE_LEVEL_HIGH>,
+						     <2 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+	};
+};
-- 
2.35.3


