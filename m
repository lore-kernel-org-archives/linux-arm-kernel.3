Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BA5C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=; b=lR47dDPklOs5CaRMVmKcYgLEM3
	nJPArkHXSUrRi7dJZrOWY9T67b+3BUvHW/mV8fNhF8zi8eIvM7VB6n6FP8wW3JhL3Jkckho/tbFoV
	mjK6S1olRN+7+Avy6k11NnMQ+4JC7GnKWWPxOzw0WU55GIHk1yyAX1dFmzZzGWc991VqzzTHm/2kE
	HG3XVKvOJ2qEYCVukyyvGG5rLGfN4aoMsg9u6n8LvN7ADm9i33EMHbFDHujSkkO+ucBSLHWBcqZnW
	54efl6wZq38gM1eJ41wA86LZP7P8++x3e1K1Wj54i9tjhqYo1FkQd6J75VK3NXPlgktgBc171yZbv
	m/WF7iRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKegc-0000000G19b-0JsH;
	Thu, 29 May 2025 14:56:50 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddS-0000000Fu4K-1BW8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad8a8da2376so150553966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526569; x=1749131369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=e97brsl+WPV76cLKUqneSI5P40ULOWM8UIgyiNm20JVM3y5kVdtsBkrSYxRfyr+X/D
         4UpR2RvpP0JcGuG9g+WQjX3gQkzDZ1KpgzmNc+tMRB2lNt6S+8dMlp1wQe12L2s0V4Vb
         AqLxGnwq42wMcl5SmCGkOQ/0Yaszc054GQyB+efw9PQukZH8TW/Bfaktgelp8BVAidGk
         daVUFw8BFVNwtb1Ff9Sjjs/F0baXDKqhRHa8fSbSh9FK/FsT3g9BVDx+wln7S/pGRKcB
         JHjMequatqLmx6hfsFwYAvxXpJuyC6IvWIafTF04oZB3NoCA0qc7ZPrFMpyj87Pb2Puh
         UduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526569; x=1749131369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=FDlOmRr+k3iXEfMfTGa1tG3W/ZWgdVqJaFcR2dE0IkN995O7dvVDjr3sbIxosW9Uua
         m8/1gDD2+X6J5yw7UKI7lzUeIlYEZLQKS6jtNuoOLMfthDXfSs1gdp1R4kE5zZKZcBTU
         Cn5j9Y+17I8L1LiYQaakPWrSqSOLQBoYTHrI33yNLbYqJeSqmemJDz3ZYXA2gHv4Hw4h
         gBmJQcipVH30rnykBXA1YnZHjl9zCtSo4Q7RGKCdUmBSMG9+mfQdknhCjjOf2+8vfYm3
         pOEcrXMFD20qogtRMWJACOBT7NjRMAZ5Yprkehn8fFlrl1yd2KX6N1p1MXnOVyTv6KlM
         pvag==
X-Forwarded-Encrypted: i=1; AJvYcCUzVAObObNOCyWD6LEhPYu9TobeLm/DUBkPkgSKvFDj8FQkOhHlAPkiOEbTLKw5Q63EpXt8+SJrIV7joC698QOU@lists.infradead.org
X-Gm-Message-State: AOJu0YxXlz5khKzQdGE+XRIunN3B1fwRCY0sHo+DvC0nzVNmUVbQMPjx
	v95TVY06P+skwhNsPZ53s2ZgqQUKnLPkOvWGQLpCtdmS3hyQN/GulV5ikgBvgedsUNQ=
X-Gm-Gg: ASbGncu6oM0eohDr15szM7u1hqbq0i5XBOsArK5jVoCJjMfq63xKWY010r76VK+4Yjz
	v1eoC6d7Mlu1Xr8XbrI9m5hBuau2rDl8pAHd82tG5Qk5h02sz3tQcx8pnVI5udhSpxGlMfyTD65
	hY1h+tVMbtkm//+7m7w2qGod+5Ym9bYOdL3ZL3eVHg5I4lxbgvW/YNK98T0DKjaaA0z3vYf+p/k
	CdbbDi9Idzi79ub/vm0PoNtsqDIycCZo4X9gjcMsBXWQUcv9gsy/g+MjUyVjOvcGak8ySbJWUYB
	EAtlMedJ7cZzVnTE3qtyjQ52HaqeZVpu6Koygj8F3WEV+uONFd0DAnjNHAjiEmkBxe9G+LBbrQ4
	yu36B+v6DdO741/2DHBzO2w==
X-Google-Smtp-Source: AGHT+IGVz4lZI380iOeZ0sAk76r1bOVlu9hZAX/4jbO1OiKLTkmzMHxAI8gYVfXoqODUDof6526HpQ==
X-Received: by 2002:a17:907:60d2:b0:ada:99ed:67a3 with SMTP id a640c23a62f3a-ada99ed7fd1mr251769666b.27.1748526568650;
        Thu, 29 May 2025 06:49:28 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2e220548sm26619966b.109.2025.05.29.06.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:28 -0700 (PDT)
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
Subject: [PATCH v12 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 15:50:48 +0200
Message-ID: <20250529135052.28398-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064930_316889_BE73AF69 
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


