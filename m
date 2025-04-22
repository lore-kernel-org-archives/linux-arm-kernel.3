Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8446BC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5FlXTAP/GpzsHWsqpirXk/6wSg5qJznRRV+qS9c6do=; b=3ST5tuyoc3BVgVUsi2k7zXM6tI
	RQmd3WraSpikueXKtY1LSc1OuHIvH/0pIdBi9zTMq8Ay39jT5jZhilvRk1BFo9cyTK1hyt8dpiBc0
	5YvahdZLosoRrwqIQOgdGG78lHHV7NWbT/vTS2MMQ+86YLSBzfjQzlZFX3RUy55QKp33GMF+DEVCX
	kF9XB5MJwDaPUfhoWs6Zmg3FmYAeFlUHrSm3ZmEAwk5X8z5+5CQ/lYNc94mLJUkOSrgyUkTWvskSS
	pR7IyvvWcNL5bvXKnvwbVjUcRtKlG3qVkXps+p6F9GeK2zdxiYHcDfTL0Y1XqdIy20sCM8cpShUhu
	r/Mwc1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbM-00000008VXF-1Bd4;
	Tue, 22 Apr 2025 20:52:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ij9-00000008EJr-1p8C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:52:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so63540685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347933; x=1745952733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5FlXTAP/GpzsHWsqpirXk/6wSg5qJznRRV+qS9c6do=;
        b=gX+T31+UHOYXR7i3+OMEZuyZe8pev1INiFr1kdzZtNu4MtICcn6TRBzGESQxo2W9K2
         EohNcxOZlYT17mJomKBvEk/o2fNDzxAl4WJ84bnSvNhTZXgkSkCNbCBsP3Ih9EHuP4p4
         gaEZf8INcghSJ4vg5dxyrRkoJ8BPxL9q24nqfAQj4RmQD+2WXFKQCnR4u4EUtBGvHy5p
         MyBNByLgvC6jrOPvruT0Ikg/8o4FJkFivPYaN6SYEhiAij+HCjcX7H+8calKYDuhw3o9
         D+4N0Fr9ET/69IDBsoBxf41k5aU4Sa+5RpLzwF5uU9OFmnVPI0Cw2IZsDVN9Qdi8cfob
         BMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347933; x=1745952733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5FlXTAP/GpzsHWsqpirXk/6wSg5qJznRRV+qS9c6do=;
        b=MlcLhjJ2It+0QK6RTbALlxMzakpOu3h4OnAsBjsY7z9u0vKWUbzfxl9ibu+tjyW0Ut
         SAmXD0Jw5Y+/4xp6OrtJmPGu6XBPi7nZtxAKWM6u3T4w9uv0njClbl9SB+DeR+ioUmep
         eTiuz2Hz3nxM/9QD3K5p2Geir51fXYDfirb6knJpo4RtDSzNqc7CscPc1AlEzyFiSnlj
         VgPMR+/WI8FlVikUsRPvkV25M01bFlXCPi79101V9m/OiNSyRpaGF+OPuCVKOXPUxg/U
         zujd6iBDyNxiHWmI1kKg+pAUU27ONBNn3gC7zApjR1RLZt2Elmua4fOSbzp8/IiwFdfl
         xaOw==
X-Forwarded-Encrypted: i=1; AJvYcCVIAeTVPlM/D4eVPCNSMzMVirr4ywRqDVb7kiNO9DMEGHLfOzrNXv8UJCqtjWRag/TWILCLpO4EkDDrFWs3Fc7q@lists.infradead.org
X-Gm-Message-State: AOJu0YxUjn4I/kfwiTT+Gm+aMSEFFAZR13WwvG8ORst9ZrcErOObr5ms
	yVrTyhHjqJqG+zxwsAadoc/AJtdyBr0+JvFMo6YbuQtF75ycysSHsIyek72tA3o=
X-Gm-Gg: ASbGnct0NOpZKsBpgZjAv2wumxwEx227qBnlKISOJjECUcSVhHlhjJiXOxyW3Nq8nHx
	Ubd73tCCz+dcx3eIklgLN3QsDgc/jkYz4rmMe9pFhz6cmSiTfqKjwhwzMpFqZnEmtK0rLNLq/t7
	cej1/qE4xmpEg7rkIA8sf8pKpI6TW77uawgTZ9/rytKz4EeQA9PPP09ZEMn+KIbO1wkucgTMQ/A
	Sv4y0Tz44k/WpqGluCvP58CTTIDbgLjZev71Yaf2R3tm4Qo0thjah7Ma6r9rFNioZu2s1Xw6vJu
	BNKiAkeL9GgBcWoWvDv+d8O4oAS6YbGUkam0WPwyEXPlSu9Smt6wg02OeAPyUEKV/REZ+rE=
X-Google-Smtp-Source: AGHT+IEVk3l0u74vuAp+CF5lDNrV556fT1PXsYCuMHNy3f4iRhiDQz8At/q2Af1Bf9oamgLCLia6EQ==
X-Received: by 2002:a05:600c:1c8e:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-4406ab6c278mr159813835e9.2.1745347933551;
        Tue, 22 Apr 2025 11:52:13 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbcb6sm181216235e9.18.2025.04.22.11.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:13 -0700 (PDT)
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
Subject: [PATCH v9 -next 10/12] arm64: dts: broadcom: Add overlay for RP1 device
Date: Tue, 22 Apr 2025 20:53:19 +0200
Message-ID: <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115215_471724_7A938E91 
X-CRM114-Status: GOOD (  15.35  )
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
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 09563c41ea6b..2c6a717040b8 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
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


