Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7A5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 04:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/24BpOBFggVP4Qf5Sk+TOwiRXODhNI6Ut5pVQz3vwE=; b=SdekpbVD7RtPTly2+iB3I71Bau
	cGLGyLYxc6XyPOd1dPiWUtsVU1JW2Z/VR2iHzX897g9fA8040hhVMGoihb0WIDxAY6slPYt3iEzbB
	uUAvbhVww6kkjmxAhrmzA3wHU1IIkQHl2BFnXnqHrjAiH1qjKge0GWqVSAZep8BrNPVcGEgAY9hcv
	Si9SrB8BP+6U/0pcmkFarQqZUGhPN4218BjNsERPGQzKAcB0WfZVvckXnCggivVXoQqtdT9LpET0p
	+WSYh7U7+WZmODbqJmYoIE/ZEhFMxKQj6spCelntwltn16UN4SproWWvGGYir9tFnLGRdBFfE8594
	vLvCcjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW6Is-0000000DxDw-29Se;
	Fri, 10 Jan 2025 04:07:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW6Hc-0000000Dx90-3CFQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 04:06:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaec111762bso311399466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 20:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1736481962; x=1737086762; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/24BpOBFggVP4Qf5Sk+TOwiRXODhNI6Ut5pVQz3vwE=;
        b=cyRm1gunCUV+JRND7gNXD5bd0g+yWZjONagEQruGDohugPn0yxu2Z5GMGDduXxca/T
         iFSFD/o9C/LeQlnTY18XD4fBhuvD6wETxTPdNcfr94B5oUjv+yhdvguz+c0Gk81iEbI7
         Ip3AEdq2o9HPeAv3mh3IMpj7X0tPl2iSiYoiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736481962; x=1737086762;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/24BpOBFggVP4Qf5Sk+TOwiRXODhNI6Ut5pVQz3vwE=;
        b=KAfn4KAsiuX6uSsgpktprVP4yL4DIb87MHSAEn0P+ZeYsJQknoTb/gyjS7KhqLhBaH
         5ssGEyR05/fXlgDwBuqsjAJkzHOisH+KdTnZP00MXLX3vJjurLWiO60+zmCHbOCMq0EE
         Nc4eSBidDW4SgLEQD6DyFKH8DaLxZlCDcFbY5Hxps2w5d/EI0LbUbdrT9l2Z5BXQP5Qu
         vf508sfz5QiCuTGQWCdDQYXyXIqGOPNKUACviQ3erH5ZhtbTRbsBRtVEfEA/Q36v9sKV
         gl/fIdlsszJeVnXOTiZ+dOVdXWRzMmEM1gDbxMORTjcCfYUUf6PYbg1MzqX+weNX+Qct
         TsCA==
X-Forwarded-Encrypted: i=1; AJvYcCUhBib5HgkA9Ria8ekuC/WVTcO36trSJqMy5rAlSRXE79CbUcqsOO6inY2qtkIX7P1c/DaTwToMMiuNAnQVffSc@lists.infradead.org
X-Gm-Message-State: AOJu0YyN0jzF9YXmDhzhi2YW1eLvKNtOTBqtaWgb68gmaoRNUMjlDxZs
	Buvq/3n2R4JRzbDE98EHA36yRVl6eR6caa5438XBOe9UGsSvqXCkQraOetuXJm9XKPyhY4rAm2/
	E833dAicnUsc3gA9QBoaKmeZ0lKg=
X-Gm-Gg: ASbGncuTAU0f3y4d6heJ5neF44pqpyJCICK3Q+6V/1M2r+xSywWnjz21RYjI9IsZS1b
	10kZyyuWM3ud5ixy/xCJKRld86MG66ZNeO4JJRvw=
X-Google-Smtp-Source: AGHT+IGqymY4AvkBSU1XQNYWlZtUCEzdAxywQjDfebNLm1G7SLuFYvEUjUET31E/9WQZk30AzUm2yPHyCp7zotDgCes=
X-Received: by 2002:a17:907:781:b0:aa6:995d:9ef1 with SMTP id
 a640c23a62f3a-ab2ab6a84d3mr845449566b.12.1736481962317; Thu, 09 Jan 2025
 20:06:02 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jan 2025 14:35:50 +1030
X-Gm-Features: AbW1kvZ_i72IdjrqMlOp7-vfRZRdXCzz7gff0Z42evFFJX0klOqybwJks_f63EA
Message-ID: <CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 6.14
To: SoC Team <soc@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_200605_142438_D89290CB 
X-CRM114-Status: GOOD (  14.24  )
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

Hello Arnd,

Here are the aspeed changes for v6.14. Andrew has done most (all) of
the work applying. We will get him set up to send the pull request in
the future so we can share the load, and so he's not blocked by me if
I'm not around to do it.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.14-devicetree

for you to fetch changes up to 3540adcccc7179d243216bf488532a62c37d9007:

  ARM: dts: aspeed: yosemite4: adjust secondary flash name (2025-01-08
10:57:53 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.14

- New machines

  * IBM SPB1 AST2600 BMC machine, a Sapphire Rapids x86 server
  * Ampre Mt Jefferson AST2600 BMC

 - Updates to mtmitchell, rainier, blueridge, everest, fuji, system1,
   harma, catalina and minerva

 - A big rework of yosemite4

----------------------------------------------------------------
Chanh Nguyen (4):
      ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
      ARM: dts: aspeed: mtmitchell: Add gpio line names for io expanders
      dt-bindings: arm: aspeed: add Mt. Jefferson board
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC

Eddie James (4):
      ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED names
      arm: dts: aspeed: Everest and Fuji: Add VRM presence gpio expander
      ARM: dts: aspeed: Blueridge and Fuji: Fix LED node names
      arm: dts: aspeed: Blueridge and Rainer: Add VRM presence GPIOs

Manojkiran Eda (1):
      ARM: dts: aspeed: Enable PECI and LPC snoop for IBM System1

Naresh Solanki (1):
      dt-bindings: arm: aspeed: add IBM SBP1 board

Ninad Palsule (4):
      ARM: dts: aspeed: system1: Bump up i2c busses freq
      ARM: dts: aspeed: system1: Enable serial gpio0
      ARM: dts: aspeed: system1: Add GPIO line names
      ARM: dts: aspeed: system1: Use crps PSU driver

Patrick Rudolph (1):
      ARM: dts: aspeed: sbp1: IBM sbp1 BMC board

Patrick Williams (1):
      ARM: dts: aspeed: yosemite4: adjust secondary flash name

Peter Yin (2):
      ARM: dts: aspeed: Harma: add rtc device
      ARM: dts: aspeed: Harma: revise sgpio line name

Potin Lai (6):
      ARM: dts: aspeed: catalina: add i2c-mux-idle-disconnect to all mux
      ARM: dts: aspeed: catalina: move hdd board i2c mux bus to i2c5
      ARM: dts: aspeed: catalina: enable mac2
      ARM: dts: aspeed: catalina: update NIC1 fru address
      ARM: dts: aspeed: catalina: revise ltc4287 shunt-resistor value
      ARM: dts: aspeed: catalina: remove interrupt of GPIOB4 form all IOEXP

Ricky CX Wu (23):
      ARM: dts: aspeed: yosemite4: Remove temperature sensors on Medusa Board
      ARM: dts: aspeed: yosemite4: Change eeprom for Medusa Board
      ARM: dts: aspeed: yosemite4: Enable watchdog2
      ARM: dts: aspeed: yosemite4: Enable adc15
      ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
      ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
      ARM: dts: aspeed: yosemite4: Add gpio pca9506 for CPLD IOE
      ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Spider Board
      ARM: dts: aspeed: yosemite4: Enable spi-gpio setting for TPM
      ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
      ARM: dts: aspeed: yosemite4: revise flash layout to 128MB
      ARM: dts: aspeed: yosemite4: Add i2c-mux for Management Board
      ARM: dts: aspeed: yosemite4: correct the compatible string of adm1272
      ARM: dts: aspeed: yosemite4: Remove IO expanders on I2C bus 13
      ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
      ARM: dts: aspeed: yosemite4: Add i2c-mux for four NICs
      ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE on Spider Board
      ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan boards
      ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
      ARM: dts: aspeed: yosemite4: Revise address of i2c-mux for two fan boards
      ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan boards
      ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
      ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider Board

Rob Herring (Arm) (1):
      ARM: dts: aspeed: Fix at24 EEPROM node names

Yang Chen (7):
      ARM: dts: aspeed: minerva: Revise the SGPIO line name
      ARM: dts: aspeed: minerva: change the i2c mux number for FCBs
      ARM: dts: aspeed: minerva: add fru device for other blades
      ARM: dts: aspeed: minerva: add i/o expanders on bus 0
      ARM: dts: aspeed: minerva: add i/o expanders on each FCB
      ARM: dts: aspeed: minerva: add bmc ready led setting
      ARM: dts: aspeed: minerva: add second source RTC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts   |  622 ++
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |   18 +-
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    |  191 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |   45 +-
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts     |  998 +++-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 1011 +++-
 .../boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts   |   46 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |   27 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   |  111 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |   17 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 6086 ++++++++++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |   31 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |    8 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts |    6 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi    |    2 +-
 17 files changed, 8802 insertions(+), 421 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts

