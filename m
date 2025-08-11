Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB11CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fng68D5ON4MtHXF/Xvnv7dtbGS53hmAqmZqCopjU5kA=; b=d57G3cCOTcs+FWf2ZCdMdEQOXv
	BZG2Pe1LB2OzplaciR6utMQMfh5Si3efI9vpzRHvWrV3ghlBZNgc/0Kznp/Sn+8zf9y7TYpI3aDMf
	bQmy85ZI1rHWZXaA7nCQKq1KMraAPm6idgcDyorfyNsI1qY7QvGs9N5TDkUtxpoMFnES8vFvypRLD
	DDU0+lgxztYlQlAOpUIQTAWIf/hMYj/ct3pGK1uK4mcemZVMmHkeGKVGkDQbrQWlwbJsvMGXrw21+
	s9DDAy1/B4GNNm5/khLpqrK18x5jPDI5oI4wAt90yBDNWDtu4VENc+hLf4qaFLOrvWMTRRnewZHZk
	C7eQaY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWt6-00000008cpB-3Seq;
	Mon, 11 Aug 2025 18:04:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHt-00000008ARn-0eXK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af94e75445dso805472966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925491; x=1755530291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fng68D5ON4MtHXF/Xvnv7dtbGS53hmAqmZqCopjU5kA=;
        b=Co2tKj2voELNIszCAGxIMrpGgumMAp51KJuFqm6Q5HEB2IsE3oqeuduXAndJgU5ITn
         HTrbCWHW7WKVd5T0bYfpkfQ5PvXmg9CHonqUnPN5tWa2KPf+ObL3zDZekOsx0DsZmsQm
         LWCLIQGUqGkL8m2jjNp9mc/5FhXKG7rzSeO584YySFb658O3vAyR7aviFwOklwihp9rC
         N1oljBgzT5k0nH42eLwiPAYrZIFsAmGx7/8zYBKoNLIkU3yiNEErI5Kdt4S0dnioT/GN
         MrmXgiHDE57u4yqpkkQAGAQGzB/ePK4l/dULTr96c+xw54bGiHREd1utXKA9vNR7MTag
         skzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925491; x=1755530291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fng68D5ON4MtHXF/Xvnv7dtbGS53hmAqmZqCopjU5kA=;
        b=sW8GevEf64LDmj86dHBZSUoPGjwS25e1zWlUXT1w3no3VcoGSGihtKe5fhJvk9cay+
         d4jTu3G4DocjSb7Wh7xX2atJOaGOS/QDM+nsqrAjlMHhlyXk8xNE+spKmuBbYZ+c0/3a
         VByMJZTWmRtDYgZQAQmLeRQpd7kAWV4oEs+HgHKhp1BxEUMQKoOpYf1GNCxg2HZTHa9E
         +MvLwsITRkaYUYmTm+kDYJ1Tee2cxhwM/hakO1p/gAepe08Azp1kXBGZehwTAUdg3QML
         1D4VW84BdJrlZ5GdTpjKuGakgOy6i/h14ssK1iePgPL4q3VbPx+6J2AT1HLqqPz4i4M+
         /C9A==
X-Forwarded-Encrypted: i=1; AJvYcCVDdceByowbHXnkhgNvPejZuGMEKaAVQ+O+g1Ugqr2IU8jfP6a1YNB/wS9AFKua++bQXZ6zSh2K6YhQwZUOxYNj@lists.infradead.org
X-Gm-Message-State: AOJu0YyH+cGSLUbpDuaOy1rYL7O149z8hbDdOS5Aum5nSfHgAsn5ia1I
	Zqa48pu7SCQ7Hf4bKxSQdKK2e85jH/6oyHRCix9Mh6jxwcGww90IdAho/xZu3Pacm8Y=
X-Gm-Gg: ASbGnctcXqkT0mahfpmPz+kLIgI55rRHS5Pedk/ToGtxy7KpTWdpQIHFKzbZy3gOU1S
	ktMetGYhh3xVXQp6W5n8kJ+I3wXvi/JXLRns3ZLsu+e+qTLWto823DH2bjOrMa4h4h0pMdaATFg
	M9g/cM+9Fr26KGFdhny1ir4VeY2OrmQBy4ZBo8EhuiV8WwN2UIs8rfg+gfg4/ECMx4lqTV0vZKC
	wDQP2cu1WkQn/rLfKkrM/KGDN12X54ba87byT4IybkUlXGPO+2jGlzbuF+xzhCzGx2Bf8sly4zv
	2UoY6ygt324SOhSeFgfrIPs49I6AwP0mbs40HnEZqb56Er2CQrvhH8T67kUrT80wFr18VW4AOFk
	kDH2lfTk+eBWWBqBbXWgVgGFT3q9vG1vKPFwoKq3FlngMFz0dVn5Rgs7Qd8s7cXCMGw==
X-Google-Smtp-Source: AGHT+IH258sr5DlmoIs2dXrt8URBUrKXF/WgpLPedlCY2bJF2kB5AZhyPhcJHZNSotah9gafIa5oGA==
X-Received: by 2002:a17:906:3687:b0:afa:97:55e9 with SMTP id a640c23a62f3a-afa00975734mr328441966b.36.1754925491486;
        Mon, 11 Aug 2025 08:18:11 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21ac0asm2033507666b.99.2025.08.11.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:11 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Mon, 11 Aug 2025 17:19:50 +0200
Message-ID: <c61b830b6f8f691aec9607b4707d3146bbd2ee84.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081813_195951_68168889 
X-CRM114-Status: GOOD (  11.64  )
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

On RPi5 device Bluetooth chips is connected to UARTA
port. Add Bluetooth chips and related pin definitions.

With this and firmware already provided by distributions,
at least on openSUSE Tumbleweed, this is sufficient to make
Bluetooth operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 42 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 10 +++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 411b58c1dddf..04738bf281eb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -81,6 +81,11 @@ wl_on_reg: wl-on-reg {
 };
 
 &pinctrl {
+	bt_shutdown_default: bt-shutdown-default-state {
+		function = "gpio";
+		pins = "gpio29";
+	};
+
 	emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
@@ -110,6 +115,29 @@ dat-pins {
 		};
 	};
 
+	uarta_24_default: uarta-24-default-state {
+		rts-pins {
+			function = "uart0";
+			pins = "gpio24";
+			bias-disable;
+		};
+		cts-pins {
+			function = "uart0";
+			pins = "gpio25";
+			bias-pull-up;
+		};
+		txd-pins {
+			function = "uart0";
+			pins = "gpio26";
+			bias-disable;
+		};
+		rxd-pins {
+			function = "uart0";
+			pins = "gpio27";
+			bias-pull-up;
+		};
+	};
+
 	wl_on_default: wl-on-default-state {
 		function = "gpio";
 		pins = "gpio28";
@@ -188,6 +216,20 @@ power: power {
 	};
 };
 
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	pinctrl-0 = <&uarta_24_default &bt_shutdown_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 871537366e96..1ed26a211ed5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -260,6 +260,16 @@ gio: gpio@7d508500 {
 			brcm,gpio-bank-widths = <32 22>;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			clock-frequency = <96000000>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart";
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


