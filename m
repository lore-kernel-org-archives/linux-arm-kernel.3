Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C5C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=; b=yL5aNdDbNKf2CXPvWGSBHQ7900
	ZZCEWBLC5EOkRtvgV3p/UZIOqlOtU7qMsQfvUJQITwcdZxIb1GowK9Z4DSCsVOQOylgYWGeRiWJhx
	6w+Crwvdvkb+/eSXntIWvVlzQlcZMQTRMOkvxDcE7QBwHG1a8cImkGk0voZylc1JUxG6SsN/cwfsS
	UoC6akxrgVl1wQOEFUc0bgrZaepfpUOOiI7OAiNte3XXgiSs9SVBtuRDa0TBk/606pypTQ6CfYrD6
	zzYxGLPDM3lS1DZf2weod3JFOjrGczbozA4S9iAW+QoZK8zHdrro0lG7Q+IzTdRM6HvQC0UTpYwv8
	UfuOz15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1kc-0000000AGjy-2YvC;
	Wed, 19 Mar 2025 22:19:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K7-0000000ACVX-1e6J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac29af3382dso26362066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421098; x=1743025898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=gGbcvQACngKeiyZ/ybqFYo/A6FNyBAwh92Nbx5s2CDhXmQPGRI7HIdGtejELg5zd59
         TuMmCoQBf1DYeTNmtOcNfZi1Js8oYk5XhqYNUk6pOA24eOF6dQRTB4ROINceO26NS15d
         GPGfIS7DQuwPmU50kmsFh1TiYakwlyEGmIWXxmJfMvL5tv6WHzAjDE8ZGsLvZR+MJj5i
         W5D6ADTPAh0RGSHzv2Yrf5LXx40XG2e+TIHn4mQao34MvNTe6z1LdUdDC4u+C2cu5G6I
         F58Mw/2xgoPz5RjfZXEjQ00mBKu/6p8AMMgUFfAZ64MDW8Q9sEqHiYiI1nsC/KCazlGx
         ctzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421098; x=1743025898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=ravKWIdj8QEPioJCcpu86pHq27uTA3/OELhqiDVdW9qIj/NVYCQg9+9PsjMGA1rQ40
         1+RwUQLSM5ILlDTyqJV+2Y134X+hH6VjKi7lpGD+AVt23/6Ex+lnurNvbpeRYwchq9+E
         d1KluW00l7xJZUe7PZA+U63EymhCWKtCJySSG6wrI3+jsYDvg1VyaFiVjBFLtm6KeQI/
         iWgrgBF1u5aspCs78TYaVy0HNq5+IJL85VsPTDiKv29LZD2sOBQtvbs1uxeB3g+mj+7C
         GJKRP6PJKDwnaAsPHviagvdCWetbBMnUs/+Eq8jNhuUebhnc1vC2c4mnOr2nymcRpdut
         uv1w==
X-Forwarded-Encrypted: i=1; AJvYcCW4p/4BUs6elCQt8mcPjser1lhIltWF4hj2iEAtz493D0dg6BsNnEf0eK1QrZqOU/gwIRIjBi4M21YsHKroQOjU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Z5T/+fuvv8bnf7bO3LkY7puZ2viBYxp26rG6mBJHO3M1dAcS
	s5ImlF5MolTJLl5v6JNqxPM2Lr+L52edcsvV51JnrG9b4pT9AzC5Dh59RHboMxo=
X-Gm-Gg: ASbGncuY0N7K76O5KdSxXhdgzbIOA1utc0+EAOHulEGY8dPIR2JgjtrcRJw4Qy9JXM2
	/SWkWLSJAq28Ws47A/EIq+3Cu6OVoFPFKI1HIkPpJcPzn/emI9x9JmCUyNDsNCGEOjf/84UY981
	hB08eoHpOcFIM5oYRiwk3n3ZGmZKVZYfruhyjSu3E+cVGyu+oaNnzXtsR6ZXL+Ms99gOVtwIj4S
	8/JYweamHuRPzYO+/V45UFiJi80wbQRpfdOr3yxr6p1rqwAa8cboJm8g3thrfRNMztZjPKnQRBj
	1WeVKZNp6RGwZczGZHGQW2oNy7eH+K8rAdg9u9nnGrxXp7QoSVXcdFzl/BujRlHTG8YAQZ6ntjv
	Er/Eqip7vBA==
X-Google-Smtp-Source: AGHT+IHsXCV0Z4XO+FTHe2MtBSqBnvYKMJqwPN2z2yjiElWrSE6yFE9vrDz/hzrfrSjNw1oWh2GCjg==
X-Received: by 2002:a17:907:86a1:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-ac3ce064603mr127290766b.29.1742421097635;
        Wed, 19 Mar 2025 14:51:37 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aecbasm1051077266b.37.2025.03.19.14.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:37 -0700 (PDT)
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
Subject: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Wed, 19 Mar 2025 22:52:32 +0100
Message-ID: <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_145139_428420_E9AD8D5F 
X-CRM114-Status: GOOD (  12.54  )
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


