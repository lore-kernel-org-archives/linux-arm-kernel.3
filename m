Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21124D7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=; b=JQoDSM3bPWr8mc2wsar9OEKhpA
	LN9ZSO4WjXy+e0Qobd3zZ/eTWYQVNhQ1IHYg687gWrjZneWfJobmcIvSIpJ+cVB9OSm/NfeLV0Qkm
	3izyJSpv3bYOPUHLgVgyTXpZGXexSDySkrC5D6ckoQnZKJOX8gJ1g+bZE5EeShGv2x8Ako7td8w5y
	hyt2MPcE8Bl/ZttndlH0vv+XTlx5GvBqbRZwcxAsZmEXdBi4e7/X2FV+4lVw6Tx1zOmWu38EZhQdx
	lsKlakZAtyGTLBtKIiIDaBAYJ+FtTR/t/yq+y6fZoOS9gBwVoHTeaeob1ss05OMIlPADcUFOwXLKj
	uCrxe47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4d6-00000005tzG-12t4;
	Mon, 02 Dec 2024 11:30:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4SS-00000005rNr-3SlW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:19:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d0c92e335bso2772347a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138355; x=1733743155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=JNdZ3Krk6NzQDnVQFijWrXIo47qwZqTUeWIQ8SEiddB0f+SYAzLJVL3aRGRlrVSEj7
         qx/Pdt0dr0irAzuE58pRSYDTNe+jNpKjjXUCuRMrfN8gPbyCBZzT1SiVbOLWhtzRx/Vz
         3fLrafOE+6wF27d3Z+Mox9MTXEsp8ICpNSevjX/Vu0LMrAuUYumDokFTsxFhvl/xzMJl
         gMXJrJtC2JnQ2xhP7UroWWQB4HXN4HQnjEE1EW5fJdhoS8lzqT4HOJ8jUH1MUKnYR5sQ
         1feQAM8PVmuJEqsTBSVZyGG7xMvcwZqff4LzT39k8g9n9rR/R/VMhnNcHln+lz+wDpg6
         CsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138355; x=1733743155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=F38zOwQAqbHesSXAclUE098kI8bj2yhIHooy7qWhBcEHm6dB7WXGvjHqW1/mqqgt6e
         2rm1aioGss2eVZFD5BJ8hVrrNNttg7Edy8TKfHDmuHnFm7k2lsj16HFBQTAUxIv73TI7
         r5sDLWUz2DIbd5izr6cmlIopL3b0QSvXRRLJmBExIz+AML2ed16yQ98tchSOaYwNQpz6
         +0nkXhRTRyuENUhrCLRzDhTVKvA3YD64mPpBYn207qimdwtJ9lqYmkX70MURcGh6VjKQ
         K9IpCkJCPWw0VYGZg1bx58eNyQV6ZNz2v7d2bvapiy391eLJdetcs05K8ehgJLqrTpTA
         EPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH9Fg50hT6DSDs4TOULvSWkq8Vv+mS6jDlkbOkBIBj9VmksohrXRvpSEOWIcHU0l+ghAELMIypIF8v4SoOHA9M@lists.infradead.org
X-Gm-Message-State: AOJu0YzUCcQ4HUU9bRmEpzoES3KV/0p5Q2MUZhb/1y95h65i8sDfJ7y6
	H2k3vCVXET7RNH4huEPi2WRf0mYw+buUBg5jePxl810EVjVSRuOrCM2r3XZ4JN8=
X-Gm-Gg: ASbGncvtfhggvrlXtoGlobqmOrBitZjkbhCEDLZlSkhg592qkKL59JEzHXaQi+qgrBL
	33VJpBo/dyw8juY68rzqFqo/hY7r2OW4961vYq7Sit34ZQSYzWd4DRa/kw7iSikmO/g8rhSJbWf
	ac95r01enzNg7ZBH6Uihq4Jml5NjLFe0J67Y1iFrEdZLbEFRHwKVhdGYXyLg+vTZVYLaK+GAUJg
	qWVYnkL51AufV/cAXcOG48UiHNd3tcVKkQluN5I/wIb9vu2Jq8CNGvuTtVAcUIobmb6Yd+tQXXL
	YVwCn2NunBLoDnzf+06s
X-Google-Smtp-Source: AGHT+IEh8VAXDJC3bTBBrwDpqq8+bh66QBF8HuQqB3DA5Y6Ne4IKysOOgMjNIKrVqzCRG1epx5t5JQ==
X-Received: by 2002:a05:6402:3484:b0:5d0:904f:710b with SMTP id 4fb4d7f45d1cf-5d0904f726amr20592659a12.34.1733138354832;
        Mon, 02 Dec 2024 03:19:14 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0d2f0652bsm2371980a12.25.2024.12.02.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:14 -0800 (PST)
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
Subject: [PATCH v5 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon,  2 Dec 2024 12:19:34 +0100
Message-ID: <2dc27b08d82e5257a831026c963ac148d11cb6e8.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_031916_859751_F544A416 
X-CRM114-Status: GOOD (  10.46  )
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
index c62831e61586..91b39026dc56 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -690,6 +691,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1272,6 +1274,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


