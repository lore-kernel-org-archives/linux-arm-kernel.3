Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D167EE6B46
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wt243DaEXQsr8P+AufdGik9IHnyievMbf7evNvSL7pc=; b=qySu60/yFnqbU4AyWSHsVc9B/C
	nVB2+4S6nGy81+w+loqkIuA1jBYtvtPMQE5ODEHbQ12Fz/pUzGSjFzYwZ+MTo6mV4Ze2pcxVyX9se
	haUogXosfFMvRPFUMS5Y6O+33S9gC561wZXcxSFUkMElRZwR0PK11SoUQAMAt6ttJuO2sVNvavrHP
	uVvBnxsv8CS0HzgA3O3I460PjA6S+GPHKAAMYHI8fsLDW9ftdW4UQPpG4GCjTZd7ZuM/KeSPwBpYz
	U4/rjEiu9QZ/3Yw+57wPPTQkUl+tNjw949W5qYf40CC+t1n9IqIUJ1NctTivviwg4rHOqLvLBXbWn
	u15EYulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKb-0000000BeiR-202x;
	Fri, 06 Feb 2026 18:13:25 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKY-0000000Beh7-1WpT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:24 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12460a7caa2so1198837c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401601; x=1771006401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt243DaEXQsr8P+AufdGik9IHnyievMbf7evNvSL7pc=;
        b=NBLKiTdz+zxlEuAF6YGxmuzbKntcjLGuP1zSu/QADYfX8bvT3clLa7qRSl/GRhLYjn
         NFp1rsK/pQ75bHA/wUCMPet0ZBJSpK8dFYG/nJ4Y+dPIRLdxpw0bl7V6ruvqjGIVXS+0
         0YMGg3cxzRrBsBW2csS2phc2qfHoRpiwrtYYkoZDyI2RYNd7YCaW2KVQupio3mmPKd4Z
         y3DEibB9MYbuKY2VsQbefBFDW9iuTaPE1p9KQ680BcBFWJfJ0vahYZ7dfpX8IyBozf98
         2X0cihHzLlsSIP3bhSf/1399BouKCqQSC7rZjfuokW03pKpfdT3eO4ie96O0IbxlbUBN
         0eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401601; x=1771006401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt243DaEXQsr8P+AufdGik9IHnyievMbf7evNvSL7pc=;
        b=r7G0lMSgjTc2b6ZJ9rHKxHtTTx0wd7c1RgyicpuFA/4+1opXpZOn+K1/7qd9+nZ67v
         qpn9QP8aY7n47VtRp/O7wBmWm0ziCpDMotQbvrVvEFiu1WJUNEwzleaGxoLE7V22PzXg
         +9QYUXSMvduU/NE2puhI780B0ANnu3sFydIY5hwPcHaSWktmfSH4Vr7gHvUcnh9tcV1p
         +pRWhY3hwTGevrS4lajVfu42ddeg348VsLLtlmg+H510iZE22leo+e5wy7m9v5Q054OX
         zS4u5kzAZlgi1iq0D5GPlvoUj+qrbGh3kmALXI3YkQ9IpiyycfSc2g7IL8vhe+9Mptim
         BcZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5EXWTh6SAeiJVQODETgDeW1jyk2jFygq/aYrHg2m/HgySr5wF/daRwZKESdiq9qAMAP8/ggcLyj1SWBv+OnYX@lists.infradead.org
X-Gm-Message-State: AOJu0YyRBKRK9FqUXVFkNQr/3Ti5fgfNCulMAhbt4JVyLgthWklAqs76
	YsBUNtUu8RTPlS7gYlNdcaCmujHO+SmZBVJIIQAkIoE43V535qWwseB4fUmXpg==
X-Gm-Gg: AZuq6aKRUrpKUHd7gniNhvHdIkWwGy4nT+kCoSy8FZQmYxNyqOrZ4GlHKW03vejVP1c
	Tz29XHXRLqPOlvPnZBWtG0VuelOqrYX+PsetBdAZaRbjiXgk0PWsnAyiFOuhtNDX7jaEyfvKiuw
	POhWDvxOp/L7XjKL/GEXfvDBvvNiHW0YQTqUVtarWc7y2ZEB5iTNzuaeIJDbHvDSf3mizeIYzpu
	3cAlZWveIY+LGG7M0/TCWsjXWt52+ScBq6qqOkMtCcB4MlvggFBFOdy1bVAFPCbT0aA1SFaRiOT
	nAaBghtpawmZ9rZ2ps/WUuLQtBdoOh9agpASj3+NNMr7eJF9QbyfaRBfEOUwvMlvAoqVjgimd2a
	mE9ZyqW0qn9GV/DVgfz/DEf9zKJoZEGid/eA2L4n7qIZfRnyU6f5crCPbf21+dnso0hrer7LbGS
	QtaXgy0n9ioN4p0x26X+qT7AqO
X-Received: by 2002:a05:7022:622:b0:124:b11f:67ec with SMTP id a92af1059eb24-12703fec508mr1446023c88.39.1770401600840;
        Fri, 06 Feb 2026 10:13:20 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 00/11] ARM: rockchip: Add initial RV1103B and Omega4 board support
Date: Fri,  6 Feb 2026 15:12:58 -0300
Message-Id: <20260206181309.2696095-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101322_431442_F4D895C1 
X-CRM114-Status: GOOD (  14.41  )
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

From: Fabio Estevam <festevam@nabladev.com>

This series adds initial support for the Rockchip RV1103B SoC and
the Omega4 board.

The goal of this series is to provide the minimal device tree and
platform support required to boot the Omega4 board into Linux
userspace with the root filesystem located on SPI NAND.

The series includes:

  - Base RV1103B SoC device tree description
  - Omega4 board device tree
  - Required pinctrl and clock definitions
  - Basic peripheral enablement required for boot

With this series applied, the Omega4 board is able to:

  - Initialize DRAM
  - Boot the kernel
  - Access SPI NAND
  - Mount the root filesystem from SPI NAND
  - Reach userspace successfully

This submission intentionally focuses on minimal bring-up support.
Additional peripheral enablement and feature support will be
submitted separately.

Tested on Omega4 hardware based on the RV1103B SoC.

Boot verified with root filesystem stored on SPI NAND.

Fabio Estevam (11):
  dt-bindings: clock: rockchip: Add RV1103B clock and reset unit
  dt-bindings: clk: rockchip: Add RV1103B clock header
  clk: rockchip: Add clock controller for the RV1103B
  dt-bindings: pinctrl: Add RV1103B pinctrl support
  pinctrl: rockchip: Add RV1103B pinctrl support
  dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for R1103B
  dt-bindings: serial: snps-dw-apb-uart: Add support for RV1103B
  dt-bindings: soc: rockchip: Add RV1103B IOC and GRF entries
  ARM: dts: rockchip: Add support for RV1103B
  dt-bindings: arm: rockchip: Add Onion RV1103B Omega4
  ARM: dts: rockchip: Add Onion RV1103B Omega4

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../bindings/clock/rockchip,rv1103b-cru.yaml  |  63 ++
 .../bindings/mmc/rockchip-dw-mshc.yaml        |   1 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   2 +
 arch/arm/boot/dts/rockchip/Makefile           |   1 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts |  92 ++
 .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 831 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 266 ++++++
 drivers/clk/rockchip/Kconfig                  |   7 +
 drivers/clk/rockchip/Makefile                 |   1 +
 drivers/clk/rockchip/clk-rv1103b.c            | 670 ++++++++++++++
 drivers/clk/rockchip/clk.h                    |  49 ++
 drivers/pinctrl/pinctrl-rockchip.c            | 313 ++++++-
 drivers/pinctrl/pinctrl-rockchip.h            |   1 +
 .../dt-bindings/clock/rockchip,rv1103b-cru.h  | 488 ++++++++++
 17 files changed, 2791 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1103b-cru.yaml
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rv1103b.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h

-- 
2.34.1


