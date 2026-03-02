Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC75E9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OyoJW81V1ePbm3yEDh6NHzrMwB3X1grrgMlNcKt/q4=; b=qo4ZuPNfEZnL/QK89iR3j49VBg
	knBkrXhgDVLpDLhY8O6NzZ2qP1ssqBqPCVapCUkM2z25ZaFYBlN//reyKXsykN5lDFucSXn+4lDCH
	P5tvWb9zw3A9WAkOYgR329A4JFgnqYT2wFB1EpQnzFesffAnKBHzG/8bhGtiRn/i7MQk+B1N5yhrs
	yGvqsYsoSpvu/wQ8oKf84aKO84kkZ85CtbdAKWjLmSuIJ1qe68i1RU/LijG0+tdy/9T9aAwh6QDl4
	OWOEGr5RVHdWUY5OgKu569EDh3bb5KDj1HmHCKer9qAbqQODMylvUyApbbhdEefbeQiElRHk4riZM
	D+GA+qHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lj-0000000Co58-0QZT;
	Mon, 02 Mar 2026 11:22:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lh-0000000Co4G-01HT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so49756945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450523; x=1773055323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OyoJW81V1ePbm3yEDh6NHzrMwB3X1grrgMlNcKt/q4=;
        b=x4+w+YAgQLCHcPwkOVCb97jtVZa9WyO0CsccTjPToqWMMqz0cmN96O6djy8kTcQWEB
         Ip5HX80GWMdpyeUCCypKhMaoRwkyJaKolLISNACUdHf5L9zE9JjRmtNbyKymGtESmjr8
         tpQN5V6IPgC0Xc4hFaE2W2aCmOnCFB4GN8txCo8K8wUcuQAN1FmYAEagPHxq5S+wm6pe
         WUVtvBlkfTSuHSDZzBr7RmhZeiYpIz6fE23pZYAaIPXjzDZ+xp2fx4AEpqWIn5w/6+Hu
         12dx5kgyFPMEoNntWDKIDwEZLD5l+dVrPKtKPEWWAndj7j1bulw7cTW6Jwj9T7T86bf4
         0qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450523; x=1773055323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OyoJW81V1ePbm3yEDh6NHzrMwB3X1grrgMlNcKt/q4=;
        b=NKS8mfvW5vKGUJ6UZztbK7djwrKwl/MU7lqQQCNzhDlzCM4zeHbC5C2Xs5fXRCDtf/
         pkkHH+YIyIwI6n9pGgzRWw3u70PhxsMG03rJ0vHjCVHtBHkRtqSzsxh33bi3N1R2iNJW
         CoQpc22ZPVYu+a5/8X5Dy3H+iCATBkc9M92DOkNeYMKMbuw4EzR5tkCa+l13yTdF0PqF
         6EmLus55Cy/FkiCfF6i9iLjs5b44nBoVaBEaZI76NRqx7wjYxiu7iQ2I/IEs4IdXXYrb
         NhE2kTm5fofnNk7pQ+JGgW2SNslBMOD8IC3L4ujYNstAFuWLY4oYpv0LwIIMaQxrUITx
         fUAA==
X-Forwarded-Encrypted: i=1; AJvYcCV6LTxKqwAqpZFqeTfUuJ/ZemLzXqIKB9Zc4YbtQGlA1cmunNWMj0Jg+syvQggwpdEr2/MTcQ6NEATxKdAS3UxO@lists.infradead.org
X-Gm-Message-State: AOJu0YxEORHtj9f/uF1cTV3cXEt/I9eyfB7PlR9A/k9BQWtHv0xjMbHO
	g0AkLRW7crmkkm5/089kDB/AM5ynZ77eewaP8BxSUnx068EGCb6puPEYVEZLCnJ9Jhw=
X-Gm-Gg: ATEYQzwiQfPfgDTZwdrkfglR0n5eK5cygtqZhwMzX7mxDFmmyYUybG9EosovYV3vQxm
	z2kkCfut/GoVGK/U/8hRqfL5WtiojZD66lbk29dMV7Ymy+BdS1kaRLRoeuMX+fFkCUte/LaiRBh
	lMNxN1QqEx7oId0615KkyeCnTuNGdw3IzNmqPwRtsqS5a743uZtLP8dXBsoFVLBhsoLnY1jYcDI
	SJCzOPX0wJh5NHvuEJf+hKMrBz7ulY5zug9XR782IzS6kL6+BAQ7LVG8Zt73rzQGARGXjcmKXDr
	EjCrYCrloIMux8H9vDmhqaGQBe/+6nmVus/I5qXYZTOj1FZTk4xDVVBMfuKL55BwoyjNiAs1+AL
	5hhYQpbyNsPE+cpQLFKmyKQyFQmoYebrAH9l9DqfIScXouUB49S7hM1rGWrN2UMqVxdJJC2rSBA
	U1OtMF38kNLM68OAu+5dOWnr9I0c2qJK0nism+3LBZBu3CXSSfASNBWkJkzatqmYcs3gqDzQy0D
	SgjLCn12Pm+3bhHXFRYcgLGaFAFbkst3mqeictBSuU=
X-Received: by 2002:a05:600c:548a:b0:483:6e32:50d4 with SMTP id 5b1f17b1804b1-483c9bed9bbmr211639925e9.18.1772450522114;
        Mon, 02 Mar 2026 03:22:02 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:01 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 0/6] Add support for Microchip LAN969x
Date: Mon,  2 Mar 2026 12:20:08 +0100
Message-ID: <20260302112153.464422-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032205_066047_25F8E672 
X-CRM114-Status: GOOD (  14.42  )
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

Changes in v6:
* Drop AES, SHA, SGPIO, SparX-5 and Flexcom bindings as those were picked
* Add Reviewed-by, Acked-by and Tested-by tags
* Rebase onto next-20260227

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

Robert Marko (6):
  dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
  dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
  arm64: dts: microchip: add LAN969x clock header file
  arm64: dts: microchip: add LAN969x support
  dt-bindings: arm: AT91: document EV23X71A board
  arm64: dts: microchip: add EV23X71A board

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
 .../bindings/rng/atmel,at91-trng.yaml         |   1 +
 .../bindings/serial/atmel,at91-usart.yaml     |   1 +
 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 arch/arm64/boot/dts/microchip/clk-lan9691.h   |  24 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 488 +++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 756 ++++++++++++++++++
 7 files changed, 1277 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

-- 
2.53.0


