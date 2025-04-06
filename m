Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54052C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ONAYYSHQOAtd7XflFMakQ6L/UMvLNi1xTofa7izw9E=; b=jEm7QMfQYXtVr/yX7nGNrSc4lo
	F5RX4LVnnxKa6zcRO6GCiiZZalEubG1qAm8QsOsxtr4vcDiWJf3XP9U3MofhXG+HE0HC6xyUHnkiK
	ax9mM3yEP6mRBL7MYykaqZnae38U9G00hGeUtgTA/z/2/LMEW6bp3fiBrcDyAbvWYEjzREFpu6yXj
	awRzKL00ayDnsx40wDv3rWcvOG7CSLO63bqww7tLNWw7/fkMzwJPGEE9W2rw5ANx9EGokwuBjHv0Q
	SM/LQEB3smfrGouwcpoiOpH5Nz+/Y1IyBzugeeMfYy8/zsAssSG1jPpLM0oXh6J0b6pYQZ8iJ04Wy
	9SzSdEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1S2n-0000000FUXF-1bAQ;
	Sun, 06 Apr 2025 15:36:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzL-0000000FU9j-2WOo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:49 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54963160818so4418976e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953566; x=1744558366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ONAYYSHQOAtd7XflFMakQ6L/UMvLNi1xTofa7izw9E=;
        b=X73esP77TvE83Ne6pa28Y7wEjusKnJnJVSUHsvjTgQxgS0bAxo0JD/mfNdn0u8384c
         CaDc/JefP+vKpFmQuHZv/gWohsA+kSI3bbwIXl8kdALrvbLutkFeyglIlajGQSq3r4di
         OdJeultzVO3aiKhIUegr7tXzIT35NLj9nS5bVx8M1jPff56VzC5DYzUl309YKwwRpJHA
         FUmqFaFFR/GGYENMhu/BQzfQ91KKCxTacrWdvNnlY87+ATh0At3NcflDn0G3Ehsvh96o
         Gs6l2wcaJ7LDCPYIN7/DWWKD5IvRdHq/g0Bqwa7PWZ2lRupB54abkC4xUnPmNC03zZGK
         7LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953566; x=1744558366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ONAYYSHQOAtd7XflFMakQ6L/UMvLNi1xTofa7izw9E=;
        b=mxs4Rka5DrBRtDm7x7wjxXhA7GKbsES0HOv4hpGYvmQEyoStZqcnkDVDNJmPAhgnel
         MrBti3vK9KdBRFnLsXPtI2MT2RwlI3FmCh81bhHs/mYQ1lJpTdFzt51gd/Mr/JRbGOPZ
         YzgMuUefZ9iIY3S5Ap0JgyKrH+h/rI6FiiFaguC1g5L+x03j8qY4SROQN0GjFIFBnwGj
         hFt/jahhBisN5ASjkELgwBN+j5EvDjh5jHvKX0ls5gfMeAlc1TgmyHl1uOHak8Np5sKd
         kleqxMtjfHjEa11FBxybOiY2WvTLs0Oy1lFWQRCy8EsmlEQfmSm+2WGuqLJ9VI2MMktW
         /wgw==
X-Forwarded-Encrypted: i=1; AJvYcCWiCLXgdfZ1tsmzBh4CZU14vShLraKor1tp94elm7j/X7YY/Owb6mYmrAJTHiqrilkSISeKs4TLfFeMx5gQI7Ar@lists.infradead.org
X-Gm-Message-State: AOJu0YyLJ+K7CRMGD69RQppoeUTp4OIuVBZr3/gTxOZsYNX8cwOKEQHq
	oyp9spIWEKYRIZdc48aWneH+2hnggrAWpSOXndLPTqlwbTEMqQErK38JImb7fqo=
X-Gm-Gg: ASbGnctJeqcVzNTzRg8deeZ0NkgcOhHwdywJNIPXQeuCaQ4fGjgOprzF0pLF6k46CO8
	DEebZNYgbOLDRlV9xMRbTcokRXaPLw4LEUWR7VufSw8RSJLzeIcdPM6OWHjPsgC3LzwkagkdX6p
	p64+350dpEQOSKH/+zENt8LzvPYLyfBOB3rRjc9BFs2BAtTaKq5ubyYPmNd/NFRT5Wv9JA1sZCe
	DGmHX66/1hYrriLEjP3dk65Lvraem8YBL5FOFQjeWK1Blg0xNQJ9GnAVA1dPl5dQI87M4Bb4UKs
	d1YZYRoTgGBVAVx6hIF+jMzQCcV0a0eQzABW0rNR71F3KyGHx3uat/c=
X-Google-Smtp-Source: AGHT+IHnpWs6XO4mteq7F+ZLmGE9IK5O1KFZnDXVhMlRd4bDWyefxcqo6/2QiR1vaEXZVx5eFBlmSA==
X-Received: by 2002:a05:6512:1313:b0:545:243e:e2dc with SMTP id 2adb3069b0e04-54c23346866mr2216950e87.39.1743953565786;
        Sun, 06 Apr 2025 08:32:45 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:41 +0200
Subject: [PATCH v2 01/12] ARM: dts: bcm6878: Correct UART0 IRQ number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-1-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_083247_647489_D627B0A1 
X-CRM114-Status: GOOD (  12.32  )
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

According to the vendor file 6878_intr.h the UART0 has IRQ
28, not 32.

Assuming this is a copy-and-paste error.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 70cf23a65fdb5ac7ed9eabc986f4ebb4df263c43..cf378970db08c05c40564a38931417a7be759532 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -137,7 +137,7 @@ nandcs: nand@0 {
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&uart_clk>, <&uart_clk>;
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";

-- 
2.49.0


