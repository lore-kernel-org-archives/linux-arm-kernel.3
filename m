Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E854EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=; b=KFrRBe8KvIgYJd09QJtGepM3yB
	buQ09to6yq5BIii1tKuq29uOPicsW4fdJTJO7LIlgolewZP6ws+hMlShVcSQeoT7u4EM41fuYt0Gq
	V3fzcs0W3lfL+W11dqry4+SmoKECwYjCSE4CJw88Sg+p8mxJ8ifY0YYnCv9USKYM9XF490D/oLW1V
	6Z4Fn3ORDEZm89Dtk5D1PXzkKm/0WOXYuR80rzreiwIA0vlfzEjFocc+0768mrMmfYyW2hh85FaTY
	UPqijWkhgOYC7+YadTfb8mPjxIBiwHVJ0ALZEszXCgLvVxD1FIbMeHGidnewJ4+eRcI1Cvw8av9Aa
	p3WWxT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbN-00000008VYW-10RN;
	Tue, 22 Apr 2025 20:52:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IjA-00000008EJz-1qjI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:52:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so63540905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347934; x=1745952734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=;
        b=dxXTFz13LBpnSicw0qBGnmUZc0y/vuq95wZBuiMVrs33KcsHJYLtIJ9+IXi9StDebn
         PfvDI7x9WJF/uLEXa4HMa/Z2fGJQ65UfDTQ3UiJgORxxu3qXGfBhBLASIiU0LsvPSjMo
         +x5OJSyRiMV3l45GWaS8gNwBCtrTJE+nZmy7ohhYBms2uVJTa7UEXlzeEvrry1R0KW3g
         89/pU6RYjtMWyEiaK9OgcXgaHOa/BDIBZEFFSKSbyY4r3uOwDvMZsnfLjLy0B+tDH9Mj
         hRCSETwQTtBWotjTBfrfScB8GCc64Fd5G2dOvOic/A2MKtfCFYW7MksTokwUfA1m5edZ
         zjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347934; x=1745952734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=;
        b=TFsTj4mNokYaVPKNyfxN+nBuwVZ2c5zwuPDWU39QEXUHuWhXw28IEs+9qp+Yszlv2U
         PhpZdAgI1I/Rip+JmuSmUAl/zgpu2bSFPsi2NtqdvB6k9K49k4Xbw2g3aOTGo3UoLrfh
         mLV+Q1N0LLsPVyKReWHLqjV4kV7QuPnYxKQlOdfnsz0U1tW3+SePcZ2ozDTZDQp4SLHS
         yQpXcGLVVmm3nme+idC/YnCSSGY6sjnoQKinlpSCMO54s9FTbKmz8lxu7gdjlQ5WZjz5
         60fKbfJkCRu7yP85l67ZV/KZQqMlS/pPFM2/ak3yz6XPXfKi30+8qshZJsmlfOPFxRVV
         bOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmYwsUN6WfSHDyQvz74ZwO0/eHftDRGTx6TheszzjCKsoqHxkGcZrdpoKlaUZtTs6BeqcSW6uqh45engYOvb8W@lists.infradead.org
X-Gm-Message-State: AOJu0YzEMPKGFmwTFeF3okLr6VApqvlsNDfvHmoOh9AOAPFyQyhc96gG
	8MStMx2Hh4mwja+4nwY4KHwheDBh1RC3YlFioEWXdzuwl92t8rCLDizcXRT1FIQ=
X-Gm-Gg: ASbGncuKxA3OTue4XJcBVeUmZNnk2GOn3JkE7gNzwEr6JJFZTq1JEOhqdANeg8yVOsy
	LaLcPSSDUO2qOXq+IkwvPauLg5zoMcMNZbVZtnG3ejj36TV+vIER5CI2BWsJDE++xXhDg1VEtSa
	9edeDTNW3rJyeqgfccKOlZgo/9LFdd3sbXL5cz0VJ1i4+JZvCVBslloDBTNAoHQYJq/WTJ6sRRv
	+8IQPL2eWDgton99bcvZsVGM0/OMumRvGfF+lMlgZqkahAhtw+Q7g6OibExzHEA/2nfB8pwuVnM
	Yicphqkn35MywOcQ3EjarDgllHUXbvHVwQpejcAhWrrY30JA4up2jO3AWUopXkV/jFV9fbQ=
X-Google-Smtp-Source: AGHT+IFJkUzhohlFWFD4tnJxylRaHX8kyBRjPpJLd4zTyh/XarWYhUWFDm8KDecIRtmuP1EH+CI8eA==
X-Received: by 2002:a05:6000:2509:b0:39e:e75b:5cd with SMTP id ffacd0b85a97d-39efba2c98emr14139193f8f.3.1745347934622;
        Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39f069df9fcsm10861464f8f.16.2025.04.22.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
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
Subject: [PATCH v9 -next 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Tue, 22 Apr 2025 20:53:20 +0200
Message-ID: <928679d1511a43b8dda150009eb023b4eaaff5a2.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115216_478155_5A37A107 
X-CRM114-Status: GOOD (  10.99  )
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
index 9e16b494ab0e..53748ea4a5cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -622,6 +622,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -704,6 +705,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1301,6 +1303,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


