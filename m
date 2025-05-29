Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82A8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=; b=OKW3GX+p/jiK231EMpKgjdrgLv
	v+rTHA2SLvm0fzKj2vKvqqna7tsBV0JiS0X/zQ/umzgK1azRlh2HTh2viap+9GNUvI9ojdpkvzC80
	OLhc4pZ9+QeaJngU57bJso/UIOQFsd7gorlvbthYImmQNDAYBJFrOqwvj6mpstrl6hfTP62ZVpoM1
	RWfs+Ko4snc1aBFbdjm1ZxCmOau68Yzd0vwgahXFEMy+43rEz60tzjSgKp+3M5lU3+X8VwGPmM+/a
	Eou5LmwuQE+62wvSABJFgpUbc2EE0phSym71dGTFfus8VQCPkqPEI6AduYKp3I/9C1W/BVDkPMUyV
	g4kEpxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbAv-0000000Fa2p-25jA;
	Thu, 29 May 2025 11:11:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKanz-0000000FXdy-3nEj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:13 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so124413466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515690; x=1749120490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=HdCi9IkVAnYNJd3m8luhzqT4mc/aeQm7/o1saF0yKNwX2/JzHxXyUUIht/5R924owH
         xpYWLrQCcuU+nRaB0hpAQ7/Tbh2Z2PntaRkkf5Sj3o7/RlX+w7AMbcovh2hkZo0dwEEo
         rcskU2AaR4gCGig0x+g0/QJwsjlVgiXGd4YnT93Fnzxm6Uj7PV/gcHrG2yJTw5HmmIH+
         rn8sw41CJd0gQHSrTu0VJxjZyNtBkt39mrmO808BCKVtJByscEMbBTiGXFPz6CLRXLdv
         5UtqMqpZHe7VjiLL0Fgswq8gWBK1PcV9+8FkZ3+YkITa1szJbGB+PXgObkKn8nbnIsfc
         KHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515690; x=1749120490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=WL9GZaH5Z7scaEeLqq/xbVthM+IcipZ1Z3eiGxApvzUojq/B8z/8gxfa9fMF4nix5h
         0ZaYho4Cgq75pB9Xta8Z8eBxoyim7eB21n/Cd6/ZFezVKh+V28d+prbwsEn/61sePuCb
         J3xtRK1wbeMdE/2eUcQJEHT2dj/hZ22P+rO0nVu2Lnn9dfimbkNprVv+0sxT5vbrLA4k
         b7HbKd8wtacSqhkJFBdHfKOUMkhYOyWLZSrtG6i55BusEvWK+J92LtZUITyr4PrKb87b
         0VFHqpz9EX34ZyDAN8rg/hL7dE/M/NdMjM8jSECtceBMDntAdT4rtAe2yD8JcgUOKOMj
         dW2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXCPDjyL0ufsBBfoVkCkXpvxMWZnDpteoiCGk1oIsWE0HGaGNWfw9x3dzCqBcea2nDI6f0YVKInyhDjwj2Adt1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Du2F/ruXy7v2Ao1YL+WJ6xicA3PZwInyiuMsDRSAKW84Zvas
	jJ0HhCxYPzESwBVnxHnMa3DCh60jSWWCyeT/D3sYwsPxqpWkaU4RQ0kA2NbZY/IPYQY=
X-Gm-Gg: ASbGncva3Ad4x3N2IWwsRUyAFd8R92AY8a8SSZIA3iSmE6Xh7VzcpTRZnCBXw3b1dXV
	dgkOuktYifRFv56cI0c+EFJf1y0BAwiLfSkkd/l1HH7mOCdqRGucKy68vwXnaop+hdoABDq3vZf
	SdMzQ0h1lLfCFpN6Tb8ChNQCFpnMtVqzgFrLfCRIJt0Zq8cvaNENhdSEGiEbjiuvdFcQch02tF4
	maJAry+tg4lavEuVDpMXquSqaXAZVXApcGHFkHMa6iUHYZAylk7b8CSnzNmSDuxRPEz8P/mYSGq
	zJvTyWxMQZZPSDFjyaqk7Q2hPqvIyOOmHZH/BTgjp++3pcf32spvWiKVwfClycUx1m9vwCJnntr
	jqPZSMznIGyTh1kHVmLC5Wg==
X-Google-Smtp-Source: AGHT+IEvqDlvsLAy+T6fI+vBgq2bdMThjlvuZRnUHLwEn3hRivUFxx6+EsUGWC1RvaIzLQHDhitSEA==
X-Received: by 2002:a17:907:7245:b0:ad8:9645:7965 with SMTP id a640c23a62f3a-ad8964582e8mr902544766b.42.1748515690473;
        Thu, 29 May 2025 03:48:10 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e8780f5sm119453466b.95.2025.05.29.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:10 -0700 (PDT)
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
Subject: [PATCH v10 10/10] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 12:49:27 +0200
Message-ID: <20250529104940.23053-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034811_947339_3A070FB5 
X-CRM114-Status: GOOD (  15.28  )
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

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


