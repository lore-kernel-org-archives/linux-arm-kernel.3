Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF767D41174
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cROdaZB2e3rP7WqjBdCtWuYMmHKRB0QhTDeH6xpIT5w=; b=UWgeeevPd06JsXTcqUjVrKouqP
	4ZYu27r0b06si0YPAuNLQ2x3uJPkw5CdXEpIaHp14PB7OewvoXYwoXZlQMrTRfhoPb5t4jUANpWzu
	/l1gI1Rzs6QH4t4g+X3IHJO9xIhyZOcvioMBL9zMdjpj4Q+ysr7za6lrnIy9iyyJ2/5ulqvsrdles
	HxzZjRwadXCaiQ0Wg0lThFzSooDA0jOigngG6rXtBI+YpbVFKiMtub/Nandgh0+6QCQ6XFGttZ69/
	o0tGqgolzuBUw0AUCPZjSuLqsPucZ6jRvscaUGOpOic/1Xm0TCXaKxcAKzDwI4p9F0OZ43n+dflwH
	M5WAnUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLiV-0000000CF3f-1OO0;
	Thu, 15 Jan 2026 11:40:43 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLiQ-0000000CF2m-4BlB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:40:42 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-1233702afd3so943694c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477238; x=1769082038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cROdaZB2e3rP7WqjBdCtWuYMmHKRB0QhTDeH6xpIT5w=;
        b=nY2qz6bY6qq4t5rbOXc1rdLsDIJOpXx7Qo83bWfIkHINTcZ5SLJJ/pz2LELt1Ysd4Z
         /JORqTJYxn1zCtO1dA5rsqIWFnSJj84t/maeFPpdKykXpkMLH3SCZsYIc8AevsUUicNW
         mbccdJBiO3uRZqqaVvJJgjk6bHSOUNVuDc+waoaBbgjB/eyy0N/i3hRKN6Hxb41GPpNv
         eWPufbCGP0sjuAMRKCM9W/8DCSiUT29qDv/rFOejqDXlTQu8Tb/UP6TtyWfBon6xEfMj
         tK5/wDGVnOhGTN0PhNQzpFSh/Nf/Q9IPd21dcB8BKL+7/VdDuqYEAR6MT5AgbHHoN+yY
         44Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477238; x=1769082038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cROdaZB2e3rP7WqjBdCtWuYMmHKRB0QhTDeH6xpIT5w=;
        b=n6Hij3oNwWrxavg95uMywVZ8cyjR4jCuLlfJCZb0VV7r0CvHCpw3raC2nHHt+kJfvW
         709K+LZGG91EG7fzmXLo0sTdXYoMi6oYhcJ/EH/YSyhBUh61Ilg7SrhHR1Jg4mgzVNvT
         G8E+4aJX98uCSChhH2G3JUBK/SUI0AZHXwFdvrVAjzuink6X7LjOiaU5qRNZ3RvW20YL
         mKFfFGmpZqxpQsfBbYtN8c/gzQchjZSssnOfxjPPHR0DsXblXSEWccGelSHRXu3n8J0F
         n96XVH8OvLIGM6u2yBqh2kr3fWdMw5Pe9/9axobKf+0461w2cA4aBo4GCTi+GxxyMTCG
         WgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGbV4gGy0sJrIjQh5n/3hym2L//wseyVmg2clDf/wHWqzKfnxx6Kb18SLLLwYCBqnfizDREk3lzuYEPvQmm5HX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5276A1BnN34VYfqpleJDr+rRgQUPF7V/j3w51fKNVD4vocxJi
	LA9kphSBKOFrmcrlgrJtlo8n0fG6lQE1O0obAzmeuh9rxR+TX5tiHZYDf4miVQTfJ7U=
X-Gm-Gg: AY/fxX4xRcCPuwGff5gNgJlkhROk12iesEFhT2l3ZF+RL0XsCtc0e4X+pzVPG9QeGv5
	uemALRJ/kOSS2bFm46JAioUep32vQDUexvxmAmYEarWmhycqvh6QsdmQpDq3Xutl3H3Sv7pWo3M
	Eim+NxIOxJZvry+m01MC9hGSendMlXyuMiT5aI9MyUzcYEZ+4LIwgvpp4H21dEXOUEAQp/aM+04
	/oXGup6LXk29H7gKd25mJL+ArVgf1jeadRpkFZaeY5/yxNTziw9wn+6S9p3M58CYy4RxxcOnVBb
	edVb2lwMmmTqoW9vz+ebCTk+0D66TNzDBmP9Ka0ao68zOHnnfP7V8pDl/aj8G1Lve3fPTe009wz
	TgtOgV2ne68IysXH/s0w8379t5FE2ADqS3MpUTB6lJbzpoFfxFXnoWXVyFF/ghEh5jSuLBL7Ao7
	dSzEeEi+iHZIu/GCi6zRuQflTvs0jmz5jDOtJOZAc7rVT+f4IU1lrjbvltnisKzGns0dfJFoMrG
	kObivNp
X-Received: by 2002:a05:701b:2305:b0:123:2c7f:28cf with SMTP id a92af1059eb24-12336a23a4amr5794003c88.8.1768477237584;
        Thu, 15 Jan 2026 03:40:37 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:40:36 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 00/11] Add support for Microchip LAN969x
Date: Thu, 15 Jan 2026 12:37:25 +0100
Message-ID: <20260115114021.111324-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034039_042745_4FEA0FF1 
X-CRM114-Status: GOOD (  14.38  )
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

This series adds support for the Microchip LAN969x switch SoC family.

Series is a bit long since after discussions in previous versions, it was
recommended[1][2] to add SoC specific compatibles for device nodes so it
includes the required bindings updates.

[1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
[2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
[3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/
[4] https://lore.kernel.org/all/756ead5d-8c9b-480d-8ae5-71667575ab7c@kernel.org/

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v5:
* Picked Acked-by and Reviewed-by tags
* Change clock header license to match the DTSI one
* Alphabetize EV23X71A pin nodes
* Remove the requirment for all ethernet-port nodes to have phys property
as when RGMII is used there is no SERDES being used
* Drop phys from RGMII port on EV23X71A
* Drop USB, DMA, MIIM, SPI and I2C bindings as those were already picked

Changes in v4:
* Pick Acked-by from Andi for I2C bindings
* Move clock indexes from dt-bindings into a DTS header as suggested by
Krzysztof[4]

Changes in v3:
* Pick Acked-by from Conor
* Drop HWMON binding as it was picked into hwmon already
* Document EV23X71A into AT91 binding
* Drop SparX-5 and AT91 bindings merge
* Apply remark from Conor on DMA binding regarding merging cases

Changes in v2:
* Change LAN969x wildcards to LAN9691 in patches
* Split SoC DTSI and evaluation board patches
* Add the suggested binding changes required for SoC specific compatibles
* Merge SparX-5 and AT91 bindings as suggested[3]

Robert Marko (11):
  dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
  dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
  dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
  dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
  dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
  arm64: dts: microchip: add LAN969x clock header file
  arm64: dts: microchip: add LAN969x support
  dt-bindings: arm: AT91: document EV23X71A board
  dt-bindings: net: sparx5: do not require phys when RGMII is used
  arm64: dts: microchip: add EV23X71A board

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
 .../crypto/atmel,at91sam9g46-aes.yaml         |   1 +
 .../crypto/atmel,at91sam9g46-sha.yaml         |   1 +
 .../bindings/mfd/atmel,sama5d2-flexcom.yaml   |   1 +
 .../bindings/net/microchip,sparx5-switch.yaml |  15 +-
 .../pinctrl/microchip,sparx5-sgpio.yaml       |  20 +-
 .../bindings/rng/atmel,at91-trng.yaml         |   1 +
 .../bindings/serial/atmel,at91-usart.yaml     |   1 +
 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 arch/arm64/boot/dts/microchip/clk-lan9691.h   |  24 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 488 +++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 756 ++++++++++++++++++
 12 files changed, 1309 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

-- 
2.52.0


