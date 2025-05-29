Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A053C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=; b=btm+39nZ6QGF7+Gs0OAXEsI2tb
	JX56Tnl8yxqAUKhqB3KAuU3C3FoUnWmRkim5YHVFvq6gmUt0aHSAPHjFHx/6zKVtbUdbD/uiC3AON
	5pv6r+sBm25YNK01XAmwlNB3GCg7A456JA38K61fpMdCNAJAdqi2r1gv4JYUXQzOlkzTGPPGji5MY
	jpH44EQOTHf8xr/lD2XBqqT8n4lcffQwrwGjxUBl5ZidarcPEGyIk4HziTHJJMMdfQDchJWVUayQI
	xEHvs18d7Uu/JDpAuSZYWPLa1QlLFNBiKfo9NRDzn1KDpc4WpcpsDuIp0J4/dtNMLE7B3YpqqtRb4
	V1qaHupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbqq-0000000FgaU-1f2t;
	Thu, 29 May 2025 11:55:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbLC-0000000FbGS-0id8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad89333d603so147513066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517748; x=1749122548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=U6aa3JVdzSiwMPmAAzB/iJw8uIqAo5Gp/Cr8uCJ+Mvus1HM0xdYy6k2TBJfkPqRsjh
         p77JTfwckKP4tAJ4YUmGXrzuOvqPmxB8m4DNH/RawoX9ib73jFQoZMMb91ftoTUGWt6d
         K5V+pPQJ/3221KdCLOqskPLprSPSdjoMw4Fksa8/IAG+kCdM60UZEsY4MsvWNzC7i/Aj
         kamYf5fMoAt4yHKDbCopzERdwwFLjt29NZU/2DJS3+rrTWMDGeZ0geiUYx9EfmKq38/y
         s8w9Rmw0ZtLWWf1uZ1BYXJDcQOLWdo6f2htIkCTdwqE8K1JYcvrIImOGZ7LyaWUu0XPn
         N2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517748; x=1749122548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=NnuIkEplw9uuIkyIOQTHlHWMwOcGjl0fiJFuZm/JJ+nIIDAhgdne0sVad/CC1UboQt
         e+9adlP2f1i0efClMJQXjKEJCtnYAab750WsjauoTSKO3X3DlZPw2fz2FYzKSQtHVTMf
         qI9GWwN7G6RS8bC/4tiu1ByIgNGUzEEtAH4eeZCXP0URj0lQaaqL1QCj3o4fMZNp0KfX
         lWvOtMXvMLb/OS+TSJIYqvfRvw6OQrv8rA/HkNluqeR/UA7fNKlRQduS0dm1DN2sM2Un
         bSIcEwV30yT/jKW6o+GAE0XOlPrp1ZmBQPMnF6fV26D8eTtLwQb+5E03gyeKmFW438KT
         f/vw==
X-Forwarded-Encrypted: i=1; AJvYcCUJGCnAqyAK1UpQCme853cLvzpvbUi+mbQnAyH06VDwp/GXOUIVcKdEeiuz/ET9S1zJ4ieVsd5WKSJ469sFtExU@lists.infradead.org
X-Gm-Message-State: AOJu0YyQtQQbKvPvXFkscQkqCZClQUQHQXORGd4TvvOOLl9OttRx1ZXl
	/R3d0ORHU0Edn9JV1DLb4uSTQ3JuAX2DwL2au1VZggQimandjNp0ZQgz394ysOS8chQ=
X-Gm-Gg: ASbGncuVPBg+5N47U2QQM3UmVtcTNme5GVrQ0VdI7w3ouzt9TSlhuxIM68s7n4z2FfH
	qhKDhjjabKOyXHaa6on5WRmkZVqDeHnZ75Drmg/iA9AiRpLR7EAGj130Cu2XSI7aTTcOTMkAVvt
	Gre7YFXeZwaktvcFs0TXJ5EK9rhz8aGR8bgMhHI4+eiOYuvniIFT0PKAHI6IHP/XVTBrCua/oSx
	cd+TafK55lgRRzRefHJFkmyPN1EwVu6/aQgDOquHq1M25zg9YZho1uzeNqYfG5pXy2L3KL5A8yP
	hnaNr4nfaEtZ+6uLsFKr86ondTvoz6BzINRM9lz4Oxbj+ykivFWwqhFgc5+bZwqQwTPdmlk3VEg
	dRnbZ3Lr6HfjieW+2Jp5wEA==
X-Google-Smtp-Source: AGHT+IEJVaL78WGUYXXOjvm6W0GxbUpCLixhBH4c/y3R/OI7jUleYio+vMA2WVkvn9YFZoalSxDrog==
X-Received: by 2002:a17:907:7ea0:b0:ad5:b2aa:847c with SMTP id a640c23a62f3a-adadf2a13e1mr175465966b.54.1748517748298;
        Thu, 29 May 2025 04:22:28 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d850d88sm123925166b.77.2025.05.29.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:27 -0700 (PDT)
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
Subject: [PATCH v10 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 13:23:46 +0200
Message-ID: <20250529112357.24182-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042230_202012_60D9B54E 
X-CRM114-Status: GOOD (  10.93  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..f6e9bb2a3578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -620,6 +620,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -702,6 +703,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1299,6 +1301,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


