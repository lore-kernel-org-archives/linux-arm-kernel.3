Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ADED3398B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=; b=GvmG7QqaG45Udym7anjJlG732A
	YB2rwXsRuKqTcesAqYhb2pcViAduo45Kz+RWXngRTfkqPyMD8D8y6NErO4I8PKbluJ6wHNSZk9IIF
	JOoeWVM5QbHG8hIkLkS4eOQVj2jHPiL/9hioGsA11jkCx8+9ENqVYEIC50r6+T0sNOl3GXbFEdOkD
	spIyMk4rF10uKb/o/gEzPDn1RsujWSo8FJCvwb3LTQ7RdY8r/g/dWktefIndht2/S1if800z7gM2c
	y6BMctP38uvUPl/BfbCyFbobxS8I3P7f3pEjxlOwrJE3VAfgFDX11n5bUb3Urng4LH8fSs0kd200L
	2Zo+H8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qf7-0000000B6j8-0Bws;
	Mon, 28 Oct 2024 14:24:05 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QP5-0000000B2oy-0r8c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:34 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a68480164so603344966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124449; x=1730729249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=;
        b=RXARUEknjKsNsivfZ/1gE38lZ1GYFWwxPKxPd/wByFVg5Ic1RGnJVySMUCFjL2yS5g
         GFys1WlrI9jpQuvyJHTCVd+D9IUioM73VmFUx09CZcPW3Af+n2+scAgowqa4jpPTrCrh
         LuAA/qgMBqOuJqBALtBUiR4NdwCd/g8joyBNJl1QgsFQQMKtl4441t7RiZg17fVEcWE9
         HfHDSLcpaVMLdbPkVdlHnrP/bumRWlvxctfjmbEEYM21Midf9kSLRCZ7SmJE3qbxMHFe
         o8U1xQMfkiT3gadvB9MgGJJpXnaJxe+8WXPCTbLbqQEz5UiZXVv31JUS4zDxRz3kKF+S
         h7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124449; x=1730729249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=;
        b=oaBb5SgJtDOFiO0Y8YpPiH3l+n0eY27PM37EVkSzr8OvJWdg2fWf6OkmAMYsXACu9u
         TcPxEPzS1ws3/t05hHLnTbecnqgi/lo+pM98MrNXcfn6avimmqJcJmhbKirPBZ2SLcdJ
         KdJZRw0OHfS3pDUwgOQhAhyPobGTaqoQovJnFhs5FC2MQS/akFqfwKzt8ObOfI41uE8j
         647ctX6cghmwpyQadOBJNsvmqrmZroZxWwCgn9hkLDV0vU6g8iQBqkEfSDXkjlfHMPe6
         0DkwPo1wH6tiTHK/f2EyBNHvXiUHhEMuNh8USWOesq8wKfAt+xFZZpiJiJPsPK19uvQ/
         fH1A==
X-Forwarded-Encrypted: i=1; AJvYcCUtJPCdXroSjGNivq4LF1PYq91eeSjutXRbjzjvwQObepd4FOwdQH+lrRYzQa/2LSyaE/+fMsHKvWDhDoyEUkOj@lists.infradead.org
X-Gm-Message-State: AOJu0YxpShKwC6Lbs6BUUdxSI3FlaRKtIoS/YPrCqU2G3nXxZRj2BMMQ
	7YMy5liEjEJOUfKETz5Kj4+bmrYrZxONSdQ568Ja2JxZmYB/8boAwX8DYxta2to=
X-Google-Smtp-Source: AGHT+IGqxvdjrDjtQcNnn4jWGuT849mWymPdjWEdlc16+0LL2sooJ9QKroNYPN94MhkXvqI/l5IquA==
X-Received: by 2002:a17:907:970a:b0:a9a:4a:284a with SMTP id a640c23a62f3a-a9de5d8690amr826616066b.26.1730124449033;
        Mon, 28 Oct 2024 07:07:29 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297a9csm374074266b.126.2024.10.28.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:28 -0700 (PDT)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 12/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon, 28 Oct 2024 15:07:29 +0100
Message-ID: <53f9c2cc91403070475ce01e2f1491e09abea72e.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070731_337480_51A99B89 
X-CRM114-Status: GOOD (  10.89  )
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
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..5fcd9ae0d373 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=y
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -689,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1270,6 +1272,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


