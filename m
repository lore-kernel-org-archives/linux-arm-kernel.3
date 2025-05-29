Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332AEC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=; b=Ru4XcqtXU1jq4S7DnQyE2Lx1fj
	5NY9fwxvmiAXT4zBcEW/3v9OzVvaLzyiX1go7GE8/TcA9XVGhSTqwu6Qwxmq5nhsFgPDASczLHO66
	qHpDHkRIHZBtwRyveFJmzElWTG1lxFHdwXljPtIeJvALtCkw5gOba2LBTLu1zVs/V+NHh4VsxuA6c
	WQFhYWcTLaC0SCGbnbV9hpEVkd+KYTo8OyR+x2SA05NcuLtWTRs4KnUBdJvy3bichn0cBYWIB0SIs
	fUNZUK5GoCPrDeTbydqNmK6GJ/7Bqa7OzYro+2TzHoJjauDl3qr3MvEC0LSLN0cmwgcBekmpiMzvW
	vBDjOoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbD0-0000000FaEq-0jmR;
	Thu, 29 May 2025 11:14:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKao1-0000000FXeZ-0vx7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:14 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad52dfe06ceso85025766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515692; x=1749120492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=fbV8zPjPCS+qjXdAlQfaQ6FqJw07k7OJnM2x9orc7HnG3GmWZfJow00qQEUBiH7Sir
         v7VoyT68KX8BCeY71VpwUjWdROQQKf8ePDsW0v7bCEzIqe072gbcO+OucCNaBm4hD2uo
         7wBfMZ80FQ3uwGwfmr8HAImTK2Qjozl9+oyve+UH+bFvHT/nUDPeIt94xhOrWKOReLCi
         i1ANYrztRQ9dTZssuJcLkq+kEzR8wmj226SDCD7l/FC3hpx6lAJ8Wn6XzZpZIOa/grG9
         r+7U2jFiwbbYzKrCxd/ix+hV4bzYPCt1pjM5CcLH61CJb2RCAN6cPzs7hHgB2LieLujQ
         ENkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515692; x=1749120492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=XffU/ZQJ1r2PqI/OlhlIVes0XtWY3g/izSjjzOkXZv4ZvA8rHbBltktb1/r4O2Wb4o
         5ZLaSYonhALL5ZUDFZb6QZm5svQoiy6X1nUzajWTp8+RpWSD9FSWf24S+HpEMaoRs7Mo
         88tDC8J4FrYZsppYJvj1K41B882CKAKptHYN62yOHy+qd4lPl/LhB9V+8knKnip1YL4v
         L9aEMnrxNC5LWcw3vNXPmFxgRJnQ0I30rr/2CY8ZuCQ3p0TQnlom5oIINgdFuNxqGYda
         W08r6NLXfAOlMH4iXvBtJGa+C9XVXq/YexaR7I67Ue2r7kjNMK1O+55D9QSaBKVUTU4S
         9iSg==
X-Forwarded-Encrypted: i=1; AJvYcCW64SwqMMVS6Ekeeq3sZzdznkmNxG8KgbCloz14l1KTq2SdFiHJHcSl4EgsrsNASHIuAYoODGUejFFghv6RUA7o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+9dip+bskJzStUccayNOS2ZUj+ZJxKhgTpVs8+HEIOMxeInYD
	OlHtSw7Tu1RnFcTtNLuEECP+nfWqYGP7n8H8Bav0i5Wz2xg+I31ZUZzMgqnHBDWf/Lo=
X-Gm-Gg: ASbGncsLMy25qml2PPilruUZvSeSdjjAZNp+QJQOca0+qX/511WlBYrvkFUW9KSaQ4P
	mntt6te11nKU0Jbek2mOW9esjOnbkwO4v/VrkDDXgpAiljsmH3GvW+9qIO04cPUN66ZIJ6O5xTL
	Pd3XNl9AJl+gFbAfEsaIHKqxIEZRZLlfIgnf/iblBSSiK+kXab+XpyNqClC864owiByvCypzyJj
	JP+iLzJI07KAp+2iQ51n7YTBL8kivfTXDDq4jrJ5BcBrowTXdhdJ0Jbj5n+mMPwMk9WGOmu1eUP
	kB3VrLxbrVbyDQcLVBh9Q5FuBRhFEmv8q92bPSEr92tefNRb+jzi77uSAwbaunlCTtJvkEZHgSe
	nRWJMaL7GCfDFm3PC1jrYKg==
X-Google-Smtp-Source: AGHT+IEOw5cpXlLDmXIJhM8OBLcgF8g3GUa1YjbEQIaeSF9CfzHeg4v+PZD6a/l5I2bu7UALxAndOg==
X-Received: by 2002:a17:906:2809:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ad89997ab7amr545955266b.37.1748515691621;
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3acf4sm118421066b.150.2025.05.29.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
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
Subject: [PATCH v10 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 12:49:28 +0200
Message-ID: <20250529104940.23053-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034813_258971_549F9907 
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


