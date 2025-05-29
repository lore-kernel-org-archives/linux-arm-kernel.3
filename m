Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2128AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=; b=1t2yvMmU/czROXkRMR0aKwEI5x
	QXYgLmDm6rXIxTtEzo+FSo0LOxuY96g+A0bfVyADDAsa0jgiNexZUK1O3oEScrtYrzt/3+K5j9Q+G
	35w/YAUMh5fcnHNgEaJpLlyrZqlaiHqM9DNhwRooCeeNevsyBWao+zNibTgNKW0r5PlsBwjwD/y4E
	14Ti+pyG0UsDzu9ShmKwHgQ8jEQ3+YeU6xeRq3fyxHCumnanG9Bp/MJqrf2Re1Xj0ugfQlSHSK4k5
	PsDiNIQ4AavAN0E+WB865aJwLHh1ZldTo9+ce1AqQDeWwNpNyq8PF3CFz5u9vo8yEd+2EjZjuMxgl
	Q1U4vgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdH2-0000000Fr0G-0Fjb;
	Thu, 29 May 2025 13:26:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcaq-0000000FkkN-353b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-acb5ec407b1so141873466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522563; x=1749127363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=VN7J3MWZOZVrJM2lLndjJqxF4wkgdbZJRQWK8pr5zUmp9Jf62t6UOaNdE4I3E+DJ6P
         TTgR1YKC3zmvIu3qbfMYGM7MJKZpl5w6gpYG3O+kWx12aIkbNCFWQKzfrm/m9yOM1zob
         ISgmtj+sv/E7pph5AcxD0DDwKjCS+YIqKAR7smP8L0JLqFhaly0VjqcPYRAwmClm0B0x
         w0yVEAOrBpMayfG2iOXc1071ZCRF9i0FGCnBsEbpqpMOCx0cZfjbREQfBNxSKo/hkpZr
         nAJMJnihSOigzrwKKWgEtDd0EBxaLlSpu1Ec0pJBRR7SG54c2s8S2BIedLasq9cFUUNc
         31yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522563; x=1749127363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=qjKC0jMjE+9UHdSWd5HlyNe8NyHLZtIYTdzw73UqSVSm7LVajDVdxRtGsmTG0qvJ74
         svWbMIcb+bouPcCAMfQ8dC384VFY5z42ha5PJR9yX1AFNTb4nApAPJgd9n2eMbcNjHlG
         QJmxj7hgsoeHZLE9rGU9/HDd0zBgLZLrT8SKSQBA3MMnvKf4B1+fFeJiFDfSVAfAm2Pe
         e3psjADxAkRorV70Lh0MlYjX6//pAhLLonR4kyaur3eD3AJwf04JDKf6j6y1JWG08KJ4
         /ZSoOkyr2lGi9592KnBoz3tZXsgbM661WwqsMT+fRUT7oBhhuZSeCKtdQWVoPZUwQlzh
         igSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMy9kVbymd76LFK+DjSUMYdJFbC5fThGaiKrpEWiL6LVspm2An2tbx7Szws+yUZGu6OCtPa5/BaoqdPuOMnPuC@lists.infradead.org
X-Gm-Message-State: AOJu0YwrcETa33AzYqyMQ+z/olXdWQxlALklAQ7Fx3awuGA2tGXknkcy
	jSH+IAz/WgQBVgvHEniPOYLNykkcJUzYza2++OpWIshzj7CD/NjEntMMciDAT5jBm90=
X-Gm-Gg: ASbGnctjEKfsXJv74mcR2Kffp8QYKb8gBAo7HwlWHK3H7RcgF/rXbND+n97nrPNOciQ
	5A5hfyeOn3RJhilquNRLm4xlh7V4hKi5eAzvkNWcdZf2/V7SLzrStX/C5P/DrT369/jnePoDQgy
	1+Hwb3T2LB+TLN79LilOYUupuIvstcqczpSdr2nkDQS3uqSlZ4oZNHSR/W5S3XjGSmp/DYkelYP
	Z32hoOm11yMQOlvkKRmyc3wGv5wbeInuopjcdp3VfE2rUXdMqpvwaMg8s62cs74MHd/TGi4+91j
	1xA1HaSt6YnY7T2lwrKMkr+nnd3FhdHid/kjPIkOamikzWUZd5W4fnMjbd4ybvkvYAIfaEFmnGw
	FUbL8+HZgXKJVN+NCGC0kxg==
X-Google-Smtp-Source: AGHT+IHryfaMX1R4GUnBG1aUg7/5bkW4Kn1TXAXHNfS5nQo87GficabaeaZc6nwlybjG0MJv0P5uAg==
X-Received: by 2002:a17:907:3e13:b0:ad8:9257:5737 with SMTP id a640c23a62f3a-ad89257592bmr966243466b.25.1748522562865;
        Thu, 29 May 2025 05:42:42 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39409sm137309066b.148.2025.05.29.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:42 -0700 (PDT)
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
Subject: [PATCH v11 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 14:44:00 +0200
Message-ID: <20250529124412.26311-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054244_778122_0340B407 
X-CRM114-Status: GOOD (  10.83  )
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


