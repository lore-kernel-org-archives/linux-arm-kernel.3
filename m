Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D444EE92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xMNev2+IL4W0rOk2+Sz1iWUW5i0ra4Z/24SBDIc4eIk=; b=cDTnuReBDX/69+07/jqZ/xcwTL
	69cYvrrTpMnQe2gPDE9mNPqI5/c05qUxiBNKn5xNmDFtvRCjYm5c7QJ2fBuaNWFlrcVfeypQJSimk
	6B/ctVIwCzHh581RskpUC3zcPDiPt72Oh20eeD/wnCZL4m7F9m7mXwmf32IYlbWv+EkRhs6+LPRy7
	SqQqeJrKM+lH4syuaHpfVtZ5fnalecWQk12I5eFUkh4+RZU9TvtJyT6JPZ/OlSZfKuzrSmqIWEG/9
	6OMJo/vbSmF2gq9FJZyWneVomGPNCgLlL+PJgZbgNoy7Ulg5nAd7NJXcJpa6bomqtjQhiMJQ2AyxP
	2VlCLmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAD-00000003xS5-04eR;
	Mon, 29 Dec 2025 18:40:17 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAB-00000003xRi-0Xmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so73237585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033613; x=1767638413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMNev2+IL4W0rOk2+Sz1iWUW5i0ra4Z/24SBDIc4eIk=;
        b=Nry6+uOGVVCwIYXq8D3uy1Y7zGMEikLGzcGFLvE3FwMJWDJJvCU9JYXEERYu6nGPXY
         CoiCkNuozX8oazA16/J3nmE7z7l6KW58/gj6fMrJ2Kd0uHo25MqT9qLsta0UX+o2dBL9
         n8hWllG1UtkA8rNaq+CnmRsQdyt72SvjDPL+oSlYX5PiNnW1c8k+w0fdgyH/iwFwE6uN
         e9q9QGNBU6FvbQahE1LI0/eg2XAiN8AxbD3UTNUm8IOHxtCpbq1fz+jnFIdw4KKMiL+4
         AZnlOiuBngxq6nPcqdj3/iOlANQ71t67NzaY/+dBU35c6YJjEa5tUgN1c039LLvU4DYh
         Olng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033613; x=1767638413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMNev2+IL4W0rOk2+Sz1iWUW5i0ra4Z/24SBDIc4eIk=;
        b=Vmwel+sHgT6/oUE/gxTUJfNd2DDJoSgR251+wdu3Q4ejtTixDq7sjEB56lxTQuy0/t
         Exzf5o+ndpe7l8ma9E9c3UR/hSMfnUQ6ge8FIfTasaF0/lp0WSCF8RxdFVDarcbElX37
         xy4GLLRyCwUFwYlvstYKvcT4i/n3xwNQqzlEcv+xUoz7Xxp/Wa4/2f5w+tMvPULbe6GA
         /To62YBNEe5vPPE6TlA2LtedxeawGfg/0VT6lWH9Ga6YR6tpVBe4KpE0Ps/laRXhCoyB
         8L0pFOlcIrc/VQV7zCGRzNlhBU7LuBVZPFahQmXYBMc9x43g8puxApIqqCIJivmCwRDW
         FBAw==
X-Forwarded-Encrypted: i=1; AJvYcCV6cJMkTfC16KDSUOGjQJg8KMx4xvdbfJApkpF+DiQmfC6lKMLp8sdQ6fusCsp8St7kLdtL5RS4Svg3bdK7XVgy@lists.infradead.org
X-Gm-Message-State: AOJu0YxDuTbejVMe1Iv+1cS3TAW/wN49jeZABLACesc1UWso1BFlxQFJ
	BI+zP+xE9l/1n00EXDf9R2EeWlsFnO6VwNyUAOASzbluniYTmqxo0AXrpavIa/TPCf0=
X-Gm-Gg: AY/fxX5N8qs4WJtLCtlW807/eX4iXooY6mD/kt+dT4SLBS1HyYsHCBsghMKtjGTC7Tb
	3halAeOz4j9PErvdRXqmlwG1fVt5sw5tPBvPZO/OW0J1VN1m+LmcTgPsdfQeogDUvCP9BTxZFTz
	4YVfh6imiMYJK6z1jT+UuQoAObtOfZPsG1HpO9WcSvN+i0ci+rJ1yfr63kxNhi735u0rucLkOnm
	Wx54TKX8pP10mEuVfvHSl7aD+pOxBxc46rA2/fjzWr9a+FMjxcALDleMqlN/F1yQsDdqwlrXYJj
	4IThJKYRlJLbC/621WcE0ZCNfx6x5oTEi95vQXhDgJYHkiWXR5OE0P74EDcIFYcxXZZUaTP5jeO
	HVliWEqipvzVIJf1fBsY3VLTr7vP+QdXV1MSdJlMIhneTxHr/ECUMiEVHNQ9UWxFupweVgV8XYe
	+QoSRQ6tHIgUUpxON4nWu5wiACrJu6j3JN+I/7gnbj5c1GPKLjdPS5jNK1U7QrvKjBQavDDSAko
	NAN9QV+82qkvZcpdNS2hYmgjoC3
X-Google-Smtp-Source: AGHT+IF5mVbnc4OdKlh0x4EYHuw7zUgN0QfqgRBI5YPkVwIvD+VFTU0drNG67nyewlPrP/fkHHcexg==
X-Received: by 2002:a05:600c:4ecd:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47d19593e32mr383263515e9.30.1767033613155;
        Mon, 29 Dec 2025 10:40:13 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:12 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 00/15] Add support for Microchip LAN969x
Date: Mon, 29 Dec 2025 19:37:41 +0100
Message-ID: <20251229184004.571837-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104015_206677_D36AE4A6 
X-CRM114-Status: GOOD (  13.24  )
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

Robert Marko (15):
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
  arm64: dts: microchip: add LAN969x clock header file
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
 .../bindings/usb/microchip,lan9691-dwc3.yaml  |  66 ++
 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 arch/arm64/boot/dts/microchip/clk-lan9691.h   |  24 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 488 +++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 ++++++++++++++++++
 16 files changed, 1375 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

-- 
2.52.0


