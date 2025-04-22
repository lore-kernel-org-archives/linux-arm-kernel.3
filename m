Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC690C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vicY9L19iJtQaI2QNF37hlfrrbiq8Z/BEy6LDnCcWlY=; b=4Lchk1/r/QcaZisafFbR055O93
	8nR8mXjeYX5VEO+7PMrBYt7Q9psNJkIp663jaXnIxRvyJNpnGiBhzBkTYAkkI7pwiJ1+D5b30XM+R
	i41QsCf4K31oM16C4m0WvL6rYX3R+1VPB+Sh251+VTySu4l0DXnVGJHLRugr3gPhs99lGenkSnJ0G
	z5yvSf8Ncw3t+G+4Z1tJ1ZTve9K/Cl3VTvsTSwMtrKlM/P9cBugOqMw0bWbb1BjbOefjtSrXlAgFv
	Rod7dZ5LWlUMlE8vbdZURtwOMNG6UAbiIRZnp0432Tc4WwcDuYWqgsGGK09CnSx5pWZxNKPZg58Qu
	x016NUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbK-00000008VUa-3ALc;
	Tue, 22 Apr 2025 20:52:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ij6-00000008EIm-2P6m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:52:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso26981175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347931; x=1745952731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vicY9L19iJtQaI2QNF37hlfrrbiq8Z/BEy6LDnCcWlY=;
        b=a7sm6ubb6g46Q+ZNQRE6tXGWD1HbK7sCyuBmQInvH/b219FF9028Nb44ZmJfIGqTic
         VCuqo1o9t0S3SUI9QCbeQ7yZexiBIo0Arcgoac06BXKKUYM1Bhk3T0BLn1svO9sC3fyZ
         GBQJNaK/LwDPo23TIUlexAjw+Y561ECzO66CQKLMRusm6tCsF40MUi59rSuRSaQ1RgK6
         6obkXySpXTG7s2CAYzC9KODK7JUbatQzy3dvfoH0k7T6XlmrMsWWUGL+OwCScAfwQPjn
         /m8uGNkIkEIo+dAui38mwhj2dGCaprIUR4+tJCGK+Cc+v4mExpVuQMDZj8iddXCzZZKy
         x6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347931; x=1745952731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vicY9L19iJtQaI2QNF37hlfrrbiq8Z/BEy6LDnCcWlY=;
        b=HQ9Gs67MC0hAW4+wdiSmv5v0RurVRVN4eMUUJDCa2bc7Nc2S9WYA6qtgUbsuNrEgJs
         T68q906c9udv6PjIgLi5ZQy/g5G1D+jL+C6dnwcxKtl4YkFl0pHLMcffqjZjxPdRsvtp
         KVB3Pa6brQfGc6MhDI9hVM8C9lG9rTJt0rA8EqpPLjsVRFqj9dKRNbK7Nc8iGqmVtu6X
         l6/XsFkeNJjl8BlKLwKg9E10NEUOwa0DO+rSx3qHVxResFMhnd5Q+fTM0Eh8K3rZDKIN
         MNLhe54C7evtnjyksrh8DaQzFUwEbTnhhFUy6yeU6H5YgXI/OGOBFvw78SteZdyvZwZg
         qxEg==
X-Forwarded-Encrypted: i=1; AJvYcCWIgQJW6kLed5khaK3U6ohAJlwiFKANj6D1st5EExz5+Pn0/l3s6JYmwvwnKvNAxHxE9+QvdZ8Rf0j/hDX6Ysj0@lists.infradead.org
X-Gm-Message-State: AOJu0YwRQlT9ajSqeBufGmaJ6VzOyXpwwBQHlrKnFllR2Oz8L/yyj7hV
	TWL2hl6ppXfLcdpJOr4IpSGLYobUUV+4JRxK3spGvUXj1ssomVfYNHchgdSzrGI=
X-Gm-Gg: ASbGncvuRv6xtTucsb3fr1FUp89vK3RVbFvsjhtC5XY4UzIjpW7DKr3r9KuIhXfPS73
	e27FctyBxxiyBqK/tnK8iLviaO5emy/wbzRZpK10qTzwU7c4dxMbgEfcRgDExvfHSA71EDqgsFg
	m1g9dbLp5bclFEYVtPNiXlwd/usW1XKQJbJUdbuY38Ymk+l4fDoZujN5exzMJtgmcnU/HDO/vTM
	VRrQ80Mi64bB7cKD9zMChuqSMfr40tk+oleyO5nFOJZ1MSeYFYZkuAQNCI3/mF7LFiQITPToYt2
	H4fBcAyVTV2H8Pfgcbapny7anSUmNUhAPYh7oKIvkwEzgogb4NxO4yx5gZGz3hF4JUOlG0A=
X-Google-Smtp-Source: AGHT+IG0zP44yiBEiM6Mgs05Kqo6u8c7BaNE+GEuZ+mESJXY73ChZjIdgSppFK2ryjzO5qAlx8Pdsg==
X-Received: by 2002:a05:6000:ac3:b0:39f:efb:c2f6 with SMTP id ffacd0b85a97d-39f0efbc32emr3882747f8f.33.1745347931291;
        Tue, 22 Apr 2025 11:52:11 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207d0sm16336036f8f.11.2025.04.22.11.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:10 -0700 (PDT)
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
Subject: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Tue, 22 Apr 2025 20:53:17 +0200
Message-ID: <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115212_614875_F1C61027 
X-CRM114-Status: GOOD (  12.39  )
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 34470e3d7171..6ea3c102e0d6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3


