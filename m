Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B36D715DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ni6euuty8UhEzPgdrD9/AxHBt1gb0GvikCOCV2OCSQg=; b=sXH5s+izaq2x2bOGHLL+UFSJKF
	wRAjOu/9POS9+q27b6bDL9O872gCp3in1H/pKJK+xfi4Jurd3Dn0yHsy4iX+7WGnSlcB/C61efMij
	MIwXjfBAlz57A4Yn6KViaoWmeyCUT+bWWj+joRKkXeblOznpelIp4HEes9VEP95LrvYCpQlc7tjqK
	C2pOd7khDs6Xl/PCw92k6MxS1Ojc4EyWzzdppAkcewDQMvpE3isBOPstn3HM6YoATZxLPBqOoADId
	AFq+MDrWwtsKEOqS6eNf96+U0p1sYoEht7sgTeeqr55laTiwxN5FdzbR8i0lpBY6gK4kkp9rUaeRl
	VHqRa1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaCX-0000000A8NS-2xsR;
	Sat, 24 Jan 2026 09:45:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaCU-0000000A8N0-11pz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 09:45:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47edffe5540so33655315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 01:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769247900; x=1769852700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ni6euuty8UhEzPgdrD9/AxHBt1gb0GvikCOCV2OCSQg=;
        b=kYxzYAcVF2G3pLRC74ICQqqAtBZy+NVFe3uvcQ7H/VMVAml2rzgKicUPePlcIHeJFI
         IltUx1c4Q3iJmryEmWHR65w5WiVeI44IIoJAO4GuYO+aae0/Y1PA2Edxcen/p/6dDwiX
         L7LvI8NX37prObC7+cCLnGoDT4ARXvpvKrC9CS4BHN7kRvGQAxuN2bF7gRrFKwCuPP/L
         cwd8L0D8AhQv9vskBQFc/5GsQM7oLrs0Tr1Tq59C21fOesOPIyt7NmC1dDbWp0ygxxQX
         gz9COp2NQbrSjbiXpV2mb1ITwam6W/OdRB2jW3fez/Cqd/jdSrf4C4VLLyCaRc2ALdrV
         74JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769247900; x=1769852700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ni6euuty8UhEzPgdrD9/AxHBt1gb0GvikCOCV2OCSQg=;
        b=C3T5QEIEFC/bXOOyTy6/sVxcqCUf9ewmpDVOjbInN28Mknzf9NiWOA09dPSeX95J8U
         la+5XzEFNaiCSnbdKz8KqdCN8T4y9ACDVJvX1bCY5UaxTpGnVY+8+u3JyuGYoNLwxny7
         pKc+ZZRTOUAu79mgOjR4tmY3VRUAOGqB2aHt3wKJ9zTjc8fvvcRklmDYyC7Dx7iX330o
         dExjDHj379YBtPXgp8jaZgdVhrQ61fm4I/xG5Wug5wi6z7mUXaQy9769dBwZLPkJqqe8
         U6niPQjr0NWQ2CQZ0XoGyXZzSMR7L7z2eFnw2/oBryIH5aXs2//cRBN4LWqxpshI4jib
         M0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUaqYx95RmdHxm1JGis9UI+KMTw6kFqkGEKt43FFTDt4tmlNRAaNesLCeoEBkHjyH+TOJvu+0TI9XFP4nwYA3Hl@lists.infradead.org
X-Gm-Message-State: AOJu0YzQLmoCyj2t4TQuS7OBRkrFaAJqh+3TRuEUeS6ES6mC5cUsTtlq
	eTXWOd2s7bVASx3g2dRkQnXbEiJuSKprFAECsN26e3qjccBiDfgCRY9QlMjX96QEtgdZJJUDV4q
	3gYUn
X-Gm-Gg: AZuq6aKyPGynpNT7A/oq1tSu5rldQBV718M7/93YdA1DxKJ99/gj8jX04oUFDwGl3AF
	LDe01tGk1Mw9UwgPz/ZbqGFfXyzCl5LVfh4L7twyXl+c3eBLecM/HSKUYv5ltYu/1A5oNrM0c1g
	H+zZnvpbNLL6id1wDnvknXZPXniCwYb2ofsZyPujlir+fulfXaNn5qJ93Ll1ctKR97s5maHVg2N
	2mj2if1izkALSP6HAYjsHPepWd95lFvYVSMOkCzXuU46f8eZZTWDuPlY3fJKyjGQ/yzeCQ9TFCz
	w/ThtnwJR06Rbd38/7/J4hFYWsi0fSPhBKTPPa2Vr8lUclmPf4L9VW1y2BotkUiQzdTI4pstrZi
	fztSjOVQ8Abmqe/swqzQg172tWY9/gkraj15zeMfFt9+mTZivIVmGF7p3pg9E6ZGT+KA5dmzy6e
	6tAWJLyzaaUNt23kz536QW3fB/eYF7
X-Received: by 2002:a05:600c:450d:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-4804c959a14mr99138375e9.15.1769247899809;
        Sat, 24 Jan 2026 01:44:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm13123243f8f.11.2026.01.24.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 01:44:59 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v6.20
Date: Sat, 24 Jan 2026 11:44:58 +0200
Message-ID: <20260124094458.2106570-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_014502_398885_4D172103 
X-CRM114-Status: GOOD (  11.40  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.20

for you to fetch changes up to e9ed88a4ce42bf42cd8b95a5b05298cf225b8b52:

  ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi (2026-01-23 08:58:25 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.20

This update includes:
- update the SAMA7D65 flexcom nodes to add the missing i2c, spi, and usart
  child nodes; the flexcom child nodes were also updated with DMA
  properties
- add basic support for the PCB8385 board, based on LAN966X SoC
- drop usb_a9g20-dab-mmx.dtsi as it is not used anywhere in the tree

----------------------------------------------------------------
Horatiu Vultur (2):
      dt-bindings: arm: at91: add lan966 pcb8385 board
      ARM: dts: Add support for pcb8385

Nicolas Ferre (3):
      ARM: dts: microchip: sama7d65: add dma properties to usart6
      ARM: dts: microchip: sama7d65: add fifo-size to usart
      ARM: dts: microchip: sama7d65: add missing flexcom nodes

Rob Herring (Arm) (1):
      ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +-
 arch/arm/boot/dts/microchip/Makefile               |   3 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts    | 131 ++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 279 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi |  93 -------
 5 files changed, 416 insertions(+), 96 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi

