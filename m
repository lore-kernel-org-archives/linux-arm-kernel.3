Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xE3kZFDNIi0jK+NzkWMjAQM6saxkvjdf1chQt0IQhg=; b=Mu40Gdd87rBSHkEABy5wcR6TiR
	fjbMuShaxopsNKCgl3TV/DhboNF6xJv7t9wXUeScAPy2KBYURqP6ourlFJPXghPhvgZ4CNI9J4/Of
	6qtBGKAyJa8qt1cQzi12bp9Tb7jwnyM9v9umWb48lsZ7zlvMBYh0ylE7BlrDbTMJC58ubdLm24kAP
	IsWWYIC+2Vbzud59BBKTxgOz4Kn7vntkTNYyY1P/eIcjqRE/Bhj8nEIgRUbodJFpdGcFSZHM4onz7
	cZa1+lZPf+S5SreHPxJ36YFDM/WNCoNtd2A1SHGGX90tBfOrnHCInXmeVVfZXHqAUDjp7JJn2whrB
	C05sxs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcIv-0000000BMlY-2eNC;
	Sat, 26 Jul 2025 10:39:01 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcC9-0000000BM5n-0b3W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:32:02 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 6932BEC01AD;
	Sat, 26 Jul 2025 06:32:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 06:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753525920;
	 x=1753612320; bh=5xE3kZFDNIi0jK+NzkWMjAQM6saxkvjdf1chQt0IQhg=; b=
	HuIWqo6o3daGdPZO4LAuPo19CaGjvym7RLnyuBrFPHm8sB9WOdtQsc6kqpk5EaEw
	eQVzjba5o3hCr0KgP8w/uwdSax94cjED7KmDSlF4UtOcsHe9PKGNOwt1wAjsgAg8
	Q2tUVyzu97MPa49pV7kTQLa+pNvoMphTT72h1AbRhJjvYtQe06Oj42PNGdKeR/RV
	CAhVQ8SSf51UiQrDsL/vJikMIiCb3Su6tjGH92gL4iV9GvTrPVysHALwg3uIIrIx
	p5OZ0ri/ElSqJijPMEfU6nMW8M0tdWih1cHqUVXUjdS5Po1ZQempWfke9uvBNf3p
	ehQ2J4mKIGd87Bz6Xn1FPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753525920; x=
	1753612320; bh=5xE3kZFDNIi0jK+NzkWMjAQM6saxkvjdf1chQt0IQhg=; b=T
	A+UnVW/tHK6qaYQmMPMqXfmX4djzgUrh2E3gHxTQbJqVUXmSn+hBUkWoZ67BeEB8
	EekLrXbhjYT3uqajaJOmrhbS7vhfwhfE6MPf0h19PmoBOioNnmE1OetWoTJDcaWx
	/2cToS4zeZlwLOJaWQ1AC/0n9388eJW+A/XmpHEwLIqBWdhHQMlJB1ImWHurjySi
	nn7JFbKkfh97ye52UxNTigPucjtieK80X83KPRt2OggX4GAW0BlnFHoXLkNxrQrk
	+uVKXBMP2xVmXypcSKtUdqOY1vCe3aZEBGAr4hms7PuQRMM2ph0uo/CKSU4Yu+fT
	/JJJfM9ISPPWVj3Pq2jQA==
X-ME-Sender: <xms:oK6EaA7UJ1odwnLrRLn30hdRv-SvENXtVFQ143_buXbYuaqEUrfgUg>
    <xme:oK6EaB76VxSmIQu1U6tn2T9m1eOM0MTP5qPeekjfvh1tzhP4hn47c0ypCIzuVRjmr
    OHCEHA2jvPANTSCMYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekiedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefueegkeffveeugeehieehiedukeegfefhffeutdettdffteeluefhheetkeekvden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oK6EaE4NjnP8RP89XXr5z0etVGs_ZC5G9jNkqn0PXQlLIRBKQY00KQ>
    <xmx:oK6EaBZRal4rIaJAhZY6GMcz78k9fYYXnehJC_sRjogzJe4tq_RBGw>
    <xmx:oK6EaJ50BxJ36p96Vfm6gGpoxp9cQTt8rpMZKi9oC70bPEYbgsnWCA>
    <xmx:oK6EaEBYsBojBd1kcN_E9SyEMxUX7T6J7r1OybeSm5JEm3pNY37dig>
    <xmx:oK6EaMqaqNgRVyWiBR1jepHPTd6laIlQEinJ0GLBMZ_DJqnZxRLcqlMd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1F80B700065; Sat, 26 Jul 2025 06:32:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td03a27401e83a0cb
Date: Sat, 26 Jul 2025 12:31:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-Id: <66ad07fe-3aa5-496c-8c5b-1b7ed18eb056@app.fastmail.com>
In-Reply-To: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
Subject: [GIT PULL 0/5] soc: new SoC support for 6.17
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_033201_259787_2C15BDFC 
X-CRM114-Status: GOOD (  17.73  )
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

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456=
841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-n=
ewsoc-6.17

for you to fetch changes up to 05a623030b3cc2250755e4d4d6b1440a03aed674:

  Merge tag 'arm-sophgo-dt-for-v6.17' of https://github.com/sophgo/linux=
 into soc/newsoc (2025-07-23 22:19:15 +0200)

----------------------------------------------------------------
soc: new SoC support for 6.17

These five newly supported chips come with both devicetree descriptions
and the changes to wire them up to the build system for easier bisection.

The chips in question are:

 - Marvell PXA1908 was the first 64-bit mobile phone chip from Marvell
   in the product line that started with the Digital StrongARM SA1100
   based PDAs and continued with the Intel PXA2xx that dominated early
   smartphones. This one only made it only into a few products before the
   entire product line was cut in 2015.

 - The QiLai SoC is made by RISC-V core designer Andes Technologies
   and is in the 'Voyager' reference board in MicroATX form factor.
   It uses four in-order AX45MP cores, which is the midrange product
   from Andes.

 - CIX P1 is one of the few Arm chips designed for small workstations,
   and this one uses 12 Cortex-A720/A520 cores, making it also one
   of the only ARMv9.2 machines that one can but at the moment.

 - Axiado AX3000 is an embedded chip with relative small Cortex-A53
   CPU cores described as a "Trusted Control/Compute Unit" that can
   be used as a BMC in servers. In addition to the usual I/O, this one
   comes with 10GBit ethernet and and a 4TOPS NPU.

 - Sophgo SG2000 is an embedded chip that comes with both RISC-V
   and Arm cores that can run Linux. This was already supported for
   RISC-V but now it also works on Arm

One more chip, the Black Sesame C1200 did not make it in tirm for the
merge window.

----------------------------------------------------------------
Alexander Sverdlin (5):
      arm64: dts: sophgo: Add initial SG2000 SoC device tree
      arm64: dts: sophgo: Add Duo Module 01
      arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
      arm64: Add SOPHGO SOC family Kconfig support
      arm64: defconfig: Enable rudimentary Sophgo SG2000 support

Arnd Bergmann (5):
      Merge branch 'newsoc/pxa1908' into soc/newsoc
      Merge branch 'newsoc/andes' into soc/newsoc
      Merge branch 'newsoc/cix-p1' into soc/newsoc
      Merge branch 'newsoc/axiado' into soc/newsoc
      Merge tag 'arm-sophgo-dt-for-v6.17' of https://github.com/sophgo/l=
inux into soc/newsoc

Ben Zong-You Xie (9):
      riscv: add Andes SoC family Kconfig support
      dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bind=
ings
      dt-bindings: interrupt-controller: add Andes QiLai PLIC
      dt-bindings: interrupt-controller: add Andes machine-level softwar=
e interrupt controller
      dt-bindings: timer: add Andes machine timer
      riscv: dts: andes: add QiLai SoC device tree
      riscv: dts: andes: add Voyager board device tree
      riscv: defconfig: enable Andes SoC
      MAINTAINERS: Add entry for Andes SoC

Duje Mihanovi=C4=87 (5):
      dt-bindings: mmc: sdhci-pxa: restrict pinctrl to pxav1
      dt-bindings: marvell: Document PXA1908 SoC and samsung,coreprimeve=
lte
      arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
      arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
      MAINTAINERS: add myself as Marvell PXA1908 maintainer

Fugang Duan (1):
      arm64: Kconfig: add ARCH_CIX for cix silicons

Gary Yang (1):
      dt-bindings: clock: cix: Add CIX sky1 scmi clock id

Guomin Chen (2):
      dt-bindings: mailbox: add cix,sky1-mbox
      mailbox: add CIX mailbox driver

Harshit Shah (10):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: cdns: convert to YAML
      dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
      dt-bindings: serial: cdns: add Axiado AX3000 UART controller
      dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
      arm64: add Axiado SoC family
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval bo=
ard
      arm64: defconfig: enable the Axiado family
      MAINTAINERS: Add entry for Axiado

Peter Chen (5):
      dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
      dt-bindings: arm: add CIX P1 (SKY1) SoC
      arm64: defconfig: Enable CIX SoC
      arm64: dts: cix: Add sky1 base dts initial support
      MAINTAINERS: Add CIX SoC maintainer entry

 Documentation/devicetree/bindings/arm/axiado.yaml  |  23 +
 Documentation/devicetree/bindings/arm/cix.yaml     |  26 +
 .../devicetree/bindings/arm/mrvl/mrvl.yaml         |   5 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml        |  84 +++
 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   |   7 +-
 .../interrupt-controller/andestech,plicsw.yaml     |  54 ++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/mailbox/cix,sky1-mbox.yaml |  77 +++
 .../devicetree/bindings/mmc/sdhci-pxa.yaml         |  36 +-
 Documentation/devicetree/bindings/riscv/andes.yaml |  25 +
 .../devicetree/bindings/serial/cdns,uart.yaml      |   7 +-
 .../devicetree/bindings/timer/andestech,plmt0.yaml |  53 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 MAINTAINERS                                        |  38 ++
 arch/arm64/Kconfig.platforms                       |  26 +
 arch/arm64/boot/dts/Makefile                       |   3 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts          |  79 +++
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 520 ++++++++++++++=
+++
 arch/arm64/boot/dts/cix/Makefile                   |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts          |  39 ++
 arch/arm64/boot/dts/cix/sky1.dtsi                  | 330 +++++++++++
 arch/arm64/boot/dts/marvell/Makefile               |   2 +
 arch/arm64/boot/dts/marvell/mmp/Makefile           |   2 +
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 331 +++++++++++
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       | 300 ++++++++++
 arch/arm64/boot/dts/sophgo/Makefile                |   2 +
 .../dts/sophgo/sg2000-milkv-duo-module-01-evb.dts  |  76 +++
 .../dts/sophgo/sg2000-milkv-duo-module-01.dtsi     |  40 ++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi             |  86 +++
 arch/arm64/configs/defconfig                       |   7 +
 arch/riscv/Kconfig.socs                            |   7 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/andes/Makefile                 |   2 +
 arch/riscv/boot/dts/andes/qilai-voyager.dts        |  28 +
 arch/riscv/boot/dts/andes/qilai.dtsi               | 186 ++++++
 arch/riscv/configs/defconfig                       |   1 +
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/cix-mailbox.c                      | 645 ++++++++++++++=
+++++++
 include/dt-bindings/clock/cix,sky1.h               | 279 +++++++++
 42 files changed, 3428 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/axiado.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controll=
er/andestech,plicsw.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-m=
box.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,pl=
mt0.yaml
 create mode 100644 arch/arm64/boot/dts/axiado/Makefile
 create mode 100644 arch/arm64/boot/dts/axiado/ax3000-evk.dts
 create mode 100644 arch/arm64/boot/dts/axiado/ax3000.dtsi
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/mmp/Makefile
 create mode 100644 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-core=
primevelte.dts
 create mode 100644 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-0=
1-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-0=
1.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/andes/Makefile
 create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
 create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi
 create mode 100644 drivers/mailbox/cix-mailbox.c
 create mode 100644 include/dt-bindings/clock/cix,sky1.h

