Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2D4D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xSpcBA8PE/QFRkRmf1Tiwdq7sxrOhpi43Y0N5xmGRqI=; b=M1soTSo2f3bMgY9iREEA5uV39/
	YN0ny+TGIRW9npzu8pGIxNXuhfJ0XHKkoz+WEJyBquPSBVZlHLsHneRQg5YIJA4xbV2XSkb5HGG5/
	SSiB3ApsRNAjUeuwOPA+AeWhAEUp0duTgdBjjq0PxzeXi/qHXFIsYPP/iyJjvf65S5EjUpumll1nf
	KohhUrIC3xah5t3q1LGa7s4trLd1ZgvJ6NfHfufnyRAzQtzzBjwTa42pkGp4oP2PsnaMHBFvGEl3j
	3fTPBfJgtBvhyjo+/vLfGwrSO1motveGmizB1zF3NQANN44XeDFskbqV/tStpOP2frd5K/TFS1lUM
	1o6G3Zww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFl-0000000Gm7h-0Pu1;
	Wed, 28 Jan 2026 20:35:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFj-0000000Gm75-1pQX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso217989f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632501; x=1770237301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSpcBA8PE/QFRkRmf1Tiwdq7sxrOhpi43Y0N5xmGRqI=;
        b=eFfCxGbW28JRCn5EpolWNK1x+mgNu90aWowEIwPxTAkxqEZbqQ4D0GQTaHW6lxxiiX
         4hJcVeGaDgf90pgLpnxf0jsfcc4hOeswSLrtURwLgbx9VIczBqKev2ZfFm7L9CJCquoD
         z56t8AmtGN9tisB9iUK350yIVyitR83RtuD7s8PC5rSGHMvE/SpwkUOczjD+kx0C9Zdq
         UpeLwfRURxDnikbp6o1AUNLn1ujOAcauK9hecN+RWjEH4hrKY9LCWWvJ6Z4RB6OnIAmH
         FjgeKp4H/PGJsjc9blNloMb0/F9CPAULplinyf+mLO8/pPCutdL+sa8XmOO/wJqkKftk
         mjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632501; x=1770237301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSpcBA8PE/QFRkRmf1Tiwdq7sxrOhpi43Y0N5xmGRqI=;
        b=klp4ped5Lemiy9x28+cnqnNa8Er+wG+rYJZgEvYpAwDgrUi3E5t3icdIm1zvPRmjCM
         /dMqz0aJ6+6lKD+wT7TfvIZT8DDQW8FNbHreMZUw/9UeUgGbkVlxr6llfiJMl92ylVM8
         Dg9IhEsLQVEWuag4EnCn1cXN/KuJRvJEJSLgvq5QPPw3FrIoGNnYdIRuhOLR6Dnk6/Dx
         quYYX5ZdevD4h/ZHOR7I6gcA6zkPmxfUzGngOUdUxpIa5usydNSRkGA0dNNQ3VJ4n9e8
         fXYLs1Wqe8IlZ0byrG0s88S2s4zUD78xc7PRUsvHwxIvOrMNt1bSjymYM/m8VeHuhElv
         8AZg==
X-Gm-Message-State: AOJu0YwxztgeSy5MeJL9E8teIpL1hJh154EwnxMFKzsWO9A1xR/p94Q+
	4PcxUiAmFtytyLVNdD+JZW51XgcJwLynOyfQ1C3rdmgeb75/IuuWU1JfqsafLwl/
X-Gm-Gg: AZuq6aKtH3bcBUx9ONSxOyzqwQNKD/rPVkpxZN2F2td4cRHoWQVUM1ZW40qxPZztJXb
	nPMNMFqDmdiyVfy+3ToY/OIuH45lC5+Gh0BXp3nG38w2hhFIUU6Zz+SYSSLlhklKOUOGmxwIDIw
	Iyl/3q2Rju5NiBLeQ8eUncle627tpW3jUo1VE+ic2PEUricd+vUiMtfW1eykuaGAYOmco1WasE+
	5k7jHtJoTG5VYxMSnVqAtcNplc5xtkJztviJ/9vDZ+eRwpahTX/UpfOAmU/zdg/l25suU5L4PNW
	eQX/HbWxnZtjQBsQ1eUaEM6h1gDwdZ7nRz/DHuVlfBE0H4unHbvtWcZKyjLHTRhFFIYgI1XL/b/
	K2umL87KZawMkdy9vyb7vbWpGPK4wkICIpMJKRd1i470jGjGAb21c+KhrxdOHabj02uvukmtNTl
	8Prsnp9x4PKn2lk+8bI/zn1nmy
X-Received: by 2002:a05:6000:2c11:b0:435:9612:2d24 with SMTP id ffacd0b85a97d-435dd1cc5acmr9922322f8f.53.1769632501132;
        Wed, 28 Jan 2026 12:35:01 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:00 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Wed, 28 Jan 2026 23:34:48 +0300
Message-ID: <20260128203455.38569-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123503_510502_9D7F691D 
X-CRM114-Status: GOOD (  29.41  )
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

Hi,

In the past few weeks I worked on booting my own kernel on ZTE/Sanechip's 
zx297520v3 SoC. This SoC is a relative of the zx296718 that was once 
supported by the kernel. It is in use in a lot of LTE to WiFi routers in 
Africa, China and Eastern Europe, although some devices were sold or 
distributed by ISPs in the EU too. My goal is to make OpenWRT run on these 
devices.

I would like to ask for comments on these 7 patches to make sure they are 
going in the right direction. They are the bare minimum to get the kernel 
to start and run an interactive busybox on the UART.

Here are a few questions that I couldn't answer myself:

1) The GIC is a GICv3, but there are some extra registers (probably on a 
different chip) to switch PPIs and SPIs between level high/level low or 
rising edge/falling edge. The only device where this matters appears to 
the timer. It uses level low IRQs, but the GIC has PPIs configured to 
level-high by default. By setting some non-standard registers, I can get 
the PPIs to level-low and the timer works OK. Is there any precedence on 
how to handle this? I am tempted to make a zte,zx29-gic-v3 .compatible 
glue that sets the PPIs to level-low on init.

2) The boot loader doesn't set up the secure/non-secure world properly and 
doesn't enable register access to the GIC CPU interface. I found the 
Raspberry Pi 3 boot stub as a good guidance and put sample code in 
Documentation/arch/arm/zte/zx297520v3.rst . An e.g. OpenWRT build for this 
device would have to include a similar setup sequence that it runs from 
U-Boot before jumping to the kernel. Did I miss any alternatives here?

3) The SoC has clock and reset controls in the same MMIO space, even the 
same 32 bit registers. What is the preferred way to handle this? Two 
separate clk and reset drivers that write into the same place? One 
multifunction driver that exposes clock and resets? One syscon that 
contains the reg values and two separate clk and reset drivers that 
consume the syscon?

4) The CPU is a Cortex A53 running in arm32 mode (in the shipped firmware 
too). It doesn't appear to have an FPU. Reading FPSID results in an 
exception (so vfpmodule.c/vfp_init says VFP is not available). I tried 
enabling p10 and p11 in NSACR, but without success. NSACR seems to always 
read 0 too. Is this really a Cortex A53 without FPU or did I miss 
something?

5) Relatedly, are there any advantages to running in arm64 mode? The 
devices are relatively memory constrained (64mb), so the larger binary 
size from 64 bit pointers is probably a negative, while the larger 
register set might be a positive. I doubt switching to arm64 mode is 
possible at all, but I'm nevertheless curious.

6) The old removed zx29 code used "zte," as the vendor for the 
compatibles. Sanechips is a subsidiary of ZTE that designed these chips. 
Are there any preferences for either "zte," or "sanechips,"?

As for the rest of the hardware, my entire patchset can be found here: 
https://gitlab.com/stefandoesinger/zx297520-kernel/ . So far 3 people from 
the OpenWRT community are helping with testing on different routers (Tecno 
TR118, ZTE K10, ZLT S10 in addition to my D-Link DWR932 and HGSD R310).

USB: Standard dwc2 WiFi: rtl8192, but in the SDIO version. I hacked sdio 
into rtl8xxxu but it'll need major cleanup. ethernet: STMicro stmmac. ZTE 
wrote their own driver for it. I spent a week re-implementing it before I 
was able to match the HW to stmmac. SDIO: standard dw-mshc NAND: A 128 MB 
SPI NAND chip connected to a homebrew QSPI controller. The driver is 
copypasta from stm32-qspi, but the hardware registers seem incompatible 
LTE: A Cortex M0 is doing the heavy lifting and talks to the main CPU via 
RPMsg. I hope to be able to handle this in userspace, but I haven't looked 
into it yet. clk, pinctrl, pmdomain: My own code based on the zx2967xx 
code.

Patch changelog v2: checkpatch.pl fixes.

Stefan Dösinger (7):
  ARM: zte: Add zx297520v3 platform support.
  dt-bindings: arm: Add zx297520v3 board binding.
  ARM: dts: Add D-Link DWR-932M support.
  ARM: zte: Add support for zx29 low level debug.
  ARM: dts: Add an armv7 timer for zx297520v3.
  ARM: zte: Bring back ZX29 UART support.
  ARM: dts: Declare UART1 on zx297520v3 boards.

 Documentation/arch/arm/zte/zx297520v3.rst     | 106 ++++++++++++++++++
 .../devicetree/bindings/arm/zx29.yaml         |  20 ++++
 MAINTAINERS                                   |   6 +
 arch/arm/Kconfig                              |   2 +
 arch/arm/Kconfig.debug                        |  12 ++
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zte/Makefile                |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts      |  21 ++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi         |  83 ++++++++++++++
 arch/arm/include/debug/pl01x.S                |   7 ++
 arch/arm/mach-zte/Kconfig                     |  23 ++++
 arch/arm/mach-zte/Makefile                    |   2 +
 arch/arm/mach-zte/zx297520v3.c                |  19 ++++
 drivers/tty/serial/amba-pl011.c               |  37 ++++++
 include/linux/amba/bus.h                      |   6 +
 16 files changed, 349 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.52.0


