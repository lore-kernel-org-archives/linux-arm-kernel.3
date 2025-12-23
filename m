Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950E6E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1vfXs4RxjLrMI0+CYv1SSuI1FXB9RtpNik5CYzHMIg=; b=3+94gO8WNk2VuJ27HGyuxqwRE/
	WmJKDRVH//7rNfIfSz3qSEVGZ63ZE9wRE2jvo68oXqsH/mxXKEM8YcwGP4jLx2c/Qv2lHqs5wLLyi
	AGF1n1GoQPOXZfwziTZwPTXlNbOHNu1AKQFTuihP26NxuM2pL2Ccs/aS1TqhkqwR2Wzn3ESH39Y9h
	udDkXaToadVFDikaFzhNyqDKQvm59ZqUwU0cXvzYAtVIONdauDI8w1Vzg60tee/go56r91Yrn2/Eo
	PcQj5CoxbLw97Sb6IVg4kbwsqkB3CoXWVuTHrZXviePkas8CQdlB/aR4PHsfVk2//W5I2JAAZrhIN
	jQZY8Ogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8r9-0000000G2YV-1nuF;
	Tue, 23 Dec 2025 20:19:43 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8r6-0000000G2Y3-43Bs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:19:42 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso5381860b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521179; x=1767125979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1vfXs4RxjLrMI0+CYv1SSuI1FXB9RtpNik5CYzHMIg=;
        b=kkuHJFDUj5Us3jcC29CoWySBGSWswa0goGqLxSvGTnyJzyj/9t2KJR/0F6VmWcp4/V
         kPzc7UfYcdf8NCM3hrqLW/kFt7GyP1a/hPqUg/jrJd06wyIxhKuX7BeKKCesOwen4ST+
         XkwHDN8JfTUpu/FkFU9qvLehfvXdWb6n7Lcd+VlNZXGaO6UL/rACm/Ee+1dA8pcRA/b3
         YMuk5kV6/ZWjQwpSV53M4yEJYHD3/OTaWInbmguVSBPottcXBTOHhVxnXW6LSzxDu4NK
         RKRRtYqt4/DEQTPoLcui2I8CcM8eJTOJe1azubRL+RNK05JuplQLuOTr/huC8F1StMOY
         70LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521179; x=1767125979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vfXs4RxjLrMI0+CYv1SSuI1FXB9RtpNik5CYzHMIg=;
        b=WCcqT3vPnVyJajgZR+DYI5l0VcJGFC6V9xCz1zRat6Cbpf/c9XlAS9bV3/61zQwIEa
         8sysi5GPCvbzqZV3SiFkcH/1OqjYZN/IjAkv6ySlIr8SDbruiqy8M5ATl4w1L2gZ4W18
         L3htEMg2jK6pFs22r/5LRwaDZv9DbbFn6Mjt5DRUQrwZ42jE4mHz4oAgWCZ+9L3htgPl
         vEREUQjDvaT8Qv7MDVYI/zOC1g9/THNT83vHPmPNy1ys9H0XCR8ZIY8hl93+iZMdIm5h
         1ZF+g1yUVRY7I3XvDdtwhMUemW4whLtKKYjdMdb6XGkbT43PcbwmN8CEloL8HbpHuNkG
         tGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3nkpc84rY3Ht41aen3NDjMpVoXAouVgxgAGRj+95gF+QUelmbbyIpRl8hEmV6q5305Uh6Uv3ewBkVWQs3egc/@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/MgjwtLy1wpDBIIvndC0L/n4Sh8RIBjqTMah5Qp5jPBw+zHw
	CIypZ+UpdwmLX9PynWu9ron5cAsJcdn/NTn9Al1lpsy8py+NflVj5qCtd0GZ/n/G/fk=
X-Gm-Gg: AY/fxX6047SwKSlaGjiida24V36i8q9FVIHR6SFwkY/pSAjB5UXSnHMufqBaORfx0vL
	34RcurTH6uZEeZR/3zY2vZZyieGZKnlNs+Q55JC17dIExwq0pGN4iauwA79mxRd5Ey7mQ91Ux8q
	jl3Y7r7+lVlbAIzw8nFnZqU+nJDz+8b/kx7sWhKk04pEXAQk632Ip7Fw1idzmGbS2SZFwfVDTjm
	m7VWvKXH7zwOJbY2Zt2w3X2IY1X2bMppBGOKIzDe3kx2JRulxmQxOP3YVrSgLNVu8SkvG6kIKJX
	8UrLztZCtWd+nfxy/P+9ekEsmGvwMHo9WcSs5KZ1qefaQL8FbsVrfrS7WgpG3MUxddZuvuyTKJc
	0Et5u1dSel4FK2MoeV+/6wjSzSUOA4u+cJNfPUdthD7MZcvlgVXTCvOk9rosThuWoOuo8dg1s5c
	TRpULS1yGuhShH98UbXsiWNVC3pLbsdlu/eOo9nOGDseedkkgPrJoK7XOenXPPKWU1K7IGZ8iYr
	dhEIPA7
X-Google-Smtp-Source: AGHT+IElu2DeQr7IoImhfsWaHg06ftf4nZ3LUQN+WUZ/izPfinsCvzTpfHsJa/ze8aScZK07T0eUkA==
X-Received: by 2002:a05:6a20:918d:b0:35d:d477:a801 with SMTP id adf61e73a8af0-376a7eed254mr14238755637.13.1766521179192;
        Tue, 23 Dec 2025 12:19:39 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:38 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 00/15] Add support for Microchip LAN969x
Date: Tue, 23 Dec 2025 21:16:11 +0100
Message-ID: <20251223201921.1332786-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_121941_016212_1D6FEA10 
X-CRM114-Status: GOOD (  12.84  )
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

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

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

Robert Marko (15):
  include: dt-bindings: add LAN969x clock bindings
  dt-bindings: usb: Add Microchip LAN969x support
  dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
  dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
  dt-bindings: spi: at91: add microchip,lan9691-spi
  dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
  dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
  dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
  dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
  dt-bindings: dma: atmel: add microchip,lan9691-dma
  dt-bindings: net: mscc-miim: add microchip,lan9691-miim
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
  arm64: dts: microchip: add LAN969x support
  dt-bindings: arm: AT91: document EV23X71A board
  arm64: dts: microchip: add EV23X71A board

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
 .../crypto/atmel,at91sam9g46-aes.yaml         |   1 +
 .../crypto/atmel,at91sam9g46-sha.yaml         |   1 +
 .../bindings/dma/atmel,sama5d4-dma.yaml       |   4 +-
 .../bindings/i2c/atmel,at91sam-i2c.yaml       |   1 +
 .../bindings/mfd/atmel,sama5d2-flexcom.yaml   |   1 +
 .../devicetree/bindings/net/mscc,miim.yaml    |  11 +-
 .../pinctrl/microchip,sparx5-sgpio.yaml       |  20 +-
 .../bindings/rng/atmel,at91-trng.yaml         |   1 +
 .../bindings/serial/atmel,at91-usart.yaml     |   1 +
 .../bindings/spi/atmel,at91rm9200-spi.yaml    |   1 +
 .../bindings/usb/microchip,lan9691-dwc3.yaml  |  68 ++
 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 487 +++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 ++++++++++++++++++
 include/dt-bindings/clock/microchip,lan9691.h |  24 +
 16 files changed, 1376 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

-- 
2.52.0


