Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B488C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=; b=fxlq+r25L90o/KpVcVFwXGSmS9
	nMoOTGkzkS4Qg7evr58m9WPwJxia9cSHZr4dXYO2o/NY5WEoVrEkDOlrPQtdW5ZuqqLv8UudanBdx
	CVe5Qmjf3cCj5YFdq5BBZ0mqabBbfhWhk0gL2At9y93/UBfIpi8oRyMAiu/NaSJfVqzR2EhGJhFH7
	sM5zvhacpcZpP6Q85bFk8ophBpAwTdtXgIls6bXC4WOqbgGwQ3hd4u5oSErvETKUR9etLL85PnK48
	0uRZRu4mAcaOaIXgE+nJg0dkhgTVFt1XECcpV+I+/MWCsR1R49d5UYoG1+tpJkM08LETPJmOo2J7h
	M35WnP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1mH-0000000AGyN-19Zc;
	Wed, 19 Mar 2025 22:20:45 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K8-0000000ACWY-31RU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so265106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421099; x=1743025899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=;
        b=OUBzw9H/uXNj3ep2lmw4VnLpkXEFHuSn5YKfyJZhxxM6jnic3H+WX5gAN7QjwcxDfE
         ssDaHNPGj20wHoDwi81glVhGtyRGQ7CSSNK/+7KzBrPkZtIUrX1zJ4224UVtcap5Tftk
         fTU6VBT09LAU0P5GnBBEYhYBhFZMs9FdBjY6Ae3lXxjE573A0pURDB9aDaYAUUPZGe9x
         S50MWDubhQLBCY6xq7WN6HxqOh5MP+IG6QfXWGwMCagAxFvU0yI3Q/FlQQsAhCo5376y
         xr8nrD8MKTOWW9eE09WI9F4JG2QrJbZ+bvz0oJhZFOZ3nEQNnp3paCNGdAdC98w16+WI
         yjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421099; x=1743025899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=;
        b=ZwO8CjUIxUA3NhwXf6AP+DlpvwuX0zk4TI4DEkeGrRnEixdPI7YDA92f2JPSA63s70
         v4WiRZwlDyk5iSl0gPOh1ausqc0hE20sGn5X2QqrSlm2pZXQCRD9jWQE5YnSGCrPwbFD
         mP9tpXzso8/+AacV/OLF6u32d+4icTmWcz4mK3TO1QXPll4BYYtzmOPS70uTiF0rYYw5
         vROS83GL9pGhPBYV5Z6xWcRmfxFIceeAgJLekY9D8FksKpMz47dBQhreb/hERHeC6Xpn
         aTD+k8Gulgv0Uk15S6fCwAhGDNlTmUPJOWLn2/OYT/JZWPavzf/HgfxEuMXoX9lobMIA
         lwMw==
X-Forwarded-Encrypted: i=1; AJvYcCXtydHz6jgvTGWSLp9wsPr28Nh+SWBFVawlu30nytI/DSGmBmPHdXbs9kHbtglPDlMYIBWDFDdpjdtBHoVONUKJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYpt1DjHm35sh8vl2vCkpAttkRFSoxhMEKKiPiPhsmUdxTtyKD
	ZYsP8jxkR+V9W63n2+t9QIBNCKiAMJ9NP+2pIoG+N3FBCuN/QQl6wsfGgctfKuc=
X-Gm-Gg: ASbGnctcHXxgmJWlF+nI7Vjng9QJnMhWx616+ieDuMbvrlX+OOkapsSAHcdE62yZY4D
	BSVXzM9qFSOIXIB/SioLiPzcpzYg4kXktH4VdQcge8xNjre02zQJQSrvWyEC0k/K4Kif2PYdXD7
	CQBRymIK5o2K5E2148y/g4T00HZWfNazjSEHYY8gvDYACK+GczENY2m/4G/oQgDIwjZbKaWP0JA
	MqwwuU6VVG0PBmpnFmvr9XKVcDqBlFYuFwKWPWCXM31s+ILEsvrqcCjpJ5QHR6Q7qSI0nA+cuPj
	ffKnAQlhpi4O27vtsaGn6SrsLOx5RH9mXAz9dT7FEn+slUqCX3Yf4CHNPWO9bsvajICxWR/Fryq
	CqY2aIrjYqw==
X-Google-Smtp-Source: AGHT+IHnjg8ip47n0umRwsuHPNgFyT6zs/YGRrSkkBMrSE2e0JyIORLF+LT96OI94/1opTBkG6cz+w==
X-Received: by 2002:a05:6402:d0d:b0:5e0:8ab6:65fa with SMTP id 4fb4d7f45d1cf-5eb80d4a3eemr4555608a12.19.1742421098973;
        Wed, 19 Mar 2025 14:51:38 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b1623sm9678655a12.39.2025.03.19.14.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:38 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 12/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Wed, 19 Mar 2025 22:52:33 +0100
Message-ID: <378f6ef859d7c23770b1532a370f4af97cc9a922.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_145140_760314_1BDEF025 
X-CRM114-Status: GOOD (  11.25  )
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

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..cc70793e97ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -618,6 +618,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -700,6 +701,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1289,6 +1291,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


