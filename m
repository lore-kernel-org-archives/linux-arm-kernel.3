Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52526C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=; b=l/d6TdoWIsSLN3zFeWiccrX164
	dgTnQA3jkZfQ8tN4Szjs3aJ80mlYjlq0MVoRgKqUOz+sTFB8369jg+v17xP0vlwK9V2liua8OYX29
	cc0ENg1rZ5hSgrgryLdTRiQsP77+M1vYsPYfwf8QiNSzgdIOenX+/u4CQuMeP3SXr6CeNICHw/fJM
	9dUWVldONjyapSWce88UmnunUe2JHoWPHp+oTWALz785/cBEvhxwMaYkhInJIICF4mMzAqXds81Hj
	6YrtqK6rOcEbp71WKMVWIvrEswTvy/aEx6h99Hzw+NBb52zcyYMVzqcv0UL2e2wuU2CsF8hzx/DIC
	Hfijc6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKb6k-0000000FZka-0C3n;
	Thu, 29 May 2025 11:07:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKany-0000000FXdK-0ISW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso1228760a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515688; x=1749120488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=avLQhes+bxuaalIwUusHIi6H4pbPTvQGnqdmdCqC1mp+aft3XeC7W0mcOYUvbwjenj
         Huy7ZfvRY7YrB0B2HlE2ESB6BoRAVVuJ3ifOwcAAGkeHxDViJp3RhhFKRvakKox/t8Qo
         m2iHTeDVf7FkdnlGoWCXR3aiqaZxQAB6Jv5DyQ3Zwx5/CI34kIV6tGA2qXTeyqkTWqNU
         R9vfAcEccKy1zjDgCgNKYJZ2qpXcFPaekgjD+2fSYlq9MkBAYwEWfd5ZdR0/iZKC0UQt
         cjGtu3juc7+uClpeg6X6L3lfmU9ulSQjoMrR3Nn2mh4duh0KoPdnm/yNQEQPi68bMpcq
         D0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515688; x=1749120488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=qUki3GbU2iREQSRvpepN60lZmE5eBHES07tjs+HWycFojnFO5iVI8PTJTSESKYGQWL
         gpVvohzi6U5fb0lAFmCcJsagAmfbTnsQhhyMqofXVhTs3Z/8ovXELj9mU/BWDtJ9luOA
         Zitx8CGXFA3Reev4Tk31H48Y4ugiCsYt/9iaidaZoHAGNi6Fbb/pimmO7X1wx4ssUbhV
         ek8/vU2OP+mnkp4CcAuvtGhU1NZ41LH8cnQgXyttew79xY9ZVrp6jqDFjlzjYLu1Bt4L
         Navb/uy7OxPs0bzxMJCLtn0kouOEo24Ugoe3DVVN2+2+NjHnAMcxVH0gGi4pCtD8D9Sd
         lGYw==
X-Forwarded-Encrypted: i=1; AJvYcCWKx66u11soPO9FC4lN/rI9qrjM2h83BDhJMLkXMQleQpwjL2+2pg0M1djuSnWnWsahYz2Xsa2EiQmmtAAyjfDq@lists.infradead.org
X-Gm-Message-State: AOJu0YxBpygFA9eL0XFd8pUbn2Mq24+ccNZwwwSgI5LNv2Cez/n616AR
	WWVqQg3ZqvZPSkun9nNSr8Mq38ilAw7ZNk05xiacKNHbKzUFODLN28loPH6Ermgym8U=
X-Gm-Gg: ASbGncsUrDdbLEfXaVG/D0lBDkSVgPrvGdk5EOKpqIRDDUdC1jZsyzubtJALTmMNl8x
	UCKSlLcfXPy8GuN1WZxFexlG6V1GDqF43AqVp5PGwyPQ4YcgLCoerjD6ZqHs195OBTQjAKdiU8/
	HwTsYMeXTCFmPHx90iERYuotTO+ZWUKRu1LbIt7lL2gv6wNbWDq+Pjhdc1z1a5oOC7JvjW4dloM
	78AK4nnVgh9+vRSQFq1XBV8aU5k9Gsa32Cq/0QepVLcJQ87frVNSmMV4748rgrUM1EMZMpO3zfh
	ZWLjnZolLGoSHrVdYQN8QI7prCMpQn5K8sPkc7vL3u4XaFzD1vNlJ1BaZqLgTgHdjd9/CBSYRaW
	r7y/lQQdpeh1KVWs8Ch/Dqg==
X-Google-Smtp-Source: AGHT+IEUoRzh2zTeQG5yMgxNNzsY26nnUhyjPcEFO1UqoG+878XF9t9s26ZMRJo1VML2M8CmoU+PSA==
X-Received: by 2002:a05:6402:254a:b0:5fb:f31a:df83 with SMTP id 4fb4d7f45d1cf-60545ee95a8mr1317809a12.3.1748515688256;
        Thu, 29 May 2025 03:48:08 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f22c6sm2175505a12.18.2025.05.29.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:07 -0700 (PDT)
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
Subject: [PATCH v10 08/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 12:49:25 +0200
Message-ID: <20250529104940.23053-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034810_111271_FA1E00D0 
X-CRM114-Status: GOOD (  12.32  )
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
index fbc56309660f..1850a575e708 100644
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


