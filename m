Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86315CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=; b=kejXPr78V6CNGcc7DPD1H0z5mL
	zi3e4oL6P8J5nuAt+w4we9XWAEg6WNrwwMOXWtO8jQpbDXh3RE+P30LY5kF226HNJLzBLMzyIfRj8
	BdcQsxUBGxRnnAxYf0/5kDV5E9NR4+zEgE0J1AXV621vkUDacXhs5qForMFKCn49q2FHPvxVPUf88
	IvTqxzuAT/SSZY2f+WN8qgzktfWt/sGxW/O9E6/Zx96PnVKZfnj5tWaEXuM4KeOSAi+Hju3qJWnYL
	xx6QC4Y+PenXsFcvZz9QPTFxqVQWnpbY1rgkWoBQK+mHMThjb8wxiYkxsG+NFl1vSzrs49Xdt07X/
	DfnSWMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWlN-00000008c1D-1XQl;
	Mon, 11 Aug 2025 17:56:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHp-00000008AQS-1Xrl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:10 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso6245522a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925488; x=1755530288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=;
        b=OjXE3gmXPCJhmM9W8Jk4M2LLAMlRm7wWpsT0wUiaWLqLkfY0+ZBBm2Fwyu11rMaWSx
         Qw/toSc4BqbCiNWZHBcRBxB5+2e6sxsmfMXTUChwXNpszhNoCPwNtdRsmz/lj/ulPiib
         wJbzBQJiRyLFj84GlTyP48ygtzlFRmHfVnF3V0vByhTmwwguHVcQFsA9yq/xYqRXWpWF
         VJTiM0BuzRnwevR6Bza4wCUd2STQWDy1mr40SG4z/+khUXgQBWorOZtiYIe44zDIz2Td
         PU9+YiBJRoajrqoB+IvBCbrSC0TF0qUZo1F9oXdnz63Eks70LxD/QIn7RYwdKlUGzX7q
         qaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925488; x=1755530288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=;
        b=DBKvZSLwmVWAlJey66LM7OeoRlLuypZtePRtzkXdK4GQS4O3Vz7GV1yFCC45Ch1ObZ
         frkDvILHdBqiRo6CsmSlCAkKEnp/mN5teUpLWv/1TzkQJZrpVeuW769m8KaDHF3GGXKD
         e7UWfZYhAQA/xPHdb7TJJzd4CI/w4BH4XG+NdD8/aNQC882yL2a/UPjFgNQ9BV4y6A5U
         U9SIRJf9XdjP6vQy3q19vqQoOy2AK2rFrqkdWz0/Tz31nU1+AAwJTAZmscyPPNpbdzcX
         FF/miQVoZrjCsIDn9jiqUOXMn2PN9muLEst6+eSTPHnYJXUo0pCGWPIhA1AzSSkiKvDS
         pgjA==
X-Forwarded-Encrypted: i=1; AJvYcCU/NOZSV9rwscMxdgIf9vgx/ONgmKXS0AanBRIrQQRzvjP7tjQW3xWuyBTSorB/tCAew1jSO7TRmVJXopDOQU8d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2FJiUC2xJ5q/RJj2lEr4bZnBczE6JB0oaOsW812FKCGWJVsFX
	zQ1nPo+kKkLAHvQ3DIt8zj2PFiMk54MgEbJJ8EhblL3CNKTvUR8iURZRZTR4br0uD+k=
X-Gm-Gg: ASbGncseDWD+fFKwCJXNBOfgJiFiDi8P2oTOGuT3TCu7Q/W3hb03mmLL9SKQG8rt27w
	sdkriH7BkZJlyZzFkRRgaQdEvsNR0ZvWIgOUmI2duXUI0vZ3wl4RLdJgMDXkZLcGUBa8p4uQLK0
	eHcRGJHBez1U7IxM/xLz1JVUGv2mTATP9HlfqRvp/7CeA2bw0OMn7Q23XF75zmdQxSujosLIxLY
	vBGhGBa5ERa8KcJteLszn4Q9bY1ZCfCOq1ltzSXkB1ZwrXdRGW97JEHF6c+U5diD5cm961/MD6m
	pBrBqyJEUbVMy+Kw/8DxC4Tj0Wbdkxa47TOHiVonZuALi0dchbA3oQ/eG7Sc5eCOSHGSgezOnGA
	hMdSPX6kgapuyfYZywqPxhnRc6PCAY+7IhME1KcFnEroVYwK0gAAh0vbdU4plM86jhA==
X-Google-Smtp-Source: AGHT+IG7LX50cUABOY25rRSCA3T34uMmr0GhqhL/ccQxu60Wns2ZkoR7TW4v+bZeLiM3LVeh427NVg==
X-Received: by 2002:a05:6402:510f:b0:617:b3ee:9be6 with SMTP id 4fb4d7f45d1cf-617e287fdf9mr11118841a12.0.1754925487698;
        Mon, 11 Aug 2025 08:18:07 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f28374sm18923305a12.24.2025.08.11.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 3/6] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Mon, 11 Aug 2025 17:19:47 +0200
Message-ID: <df99c6a2eeac4bed76bcc6bd74e44a061963256e.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081809_409474_CF42BDA2 
X-CRM114-Status: GOOD (  12.01  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add pin-control devicetree nodes and used them to
explicitly define uSD card interface pin configuration.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi      | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6ea3c102e0d6..6091a1ff365c 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -53,6 +53,21 @@ sd_vcc_reg: sd-vcc-reg {
 	};
 };
 
+&pinctrl {
+	emmc_sd_default: emmc-sd-default-state {
+		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
+		bias-pull-up;
+	};
+};
+
+&pinctrl_aon {
+	emmc_aon_cd_default: emmc-aon-cd-default-state {
+		function = "sd_card_g";
+		pins = "aon_gpio5";
+		bias-pull-up;
+	};
+};
+
 /* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
  * labeled "UART", i.e. the interface with the system console.
  */
@@ -62,12 +77,15 @@ &uart10 {
 
 /* SDIO1 is used to drive the SD card */
 &sdio1 {
+	pinctrl-0 = <&emmc_sd_default>, <&emmc_aon_cd_default>;
+	pinctrl-names = "default";
 	vqmmc-supply = <&sd_io_1v8_reg>;
 	vmmc-supply = <&sd_vcc_reg>;
 	bus-width = <4>;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
+	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
 &soc {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 0a9212d3106f..8a517261841d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -243,6 +243,16 @@ uart10: serial@7d001000 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@7d504100 {
+			compatible = "brcm,bcm2712c0-pinctrl";
+			reg = <0x7d504100 0x30>;
+		};
+
+		pinctrl_aon: pinctrl@7d510700 {
+			compatible = "brcm,bcm2712c0-aon-pinctrl";
+			reg = <0x7d510700 0x20>;
+		};
+
 		interrupt-controller@7d517000 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d517000 0x10>;
-- 
2.35.3


