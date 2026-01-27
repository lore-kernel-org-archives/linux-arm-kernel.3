Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEFED2FEDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zstNEATP95LnRG/q+i4GDrYI7hO5v2pn1ul5vwV4dc=; b=iPlGwtdff/IFr6wKUlKflbkb/h
	/C8W4ERpwOFQWoA/l3UDZ4/Ehwhzkm5i5BAEfTfs1mCqqgu0iCZsYu6unluYf9fnmPZA9QmLCjvr7
	YRGem0HBekTB10NCjMQyqtkNZJ555MqU6aBL9XiFlalWq/wmC54Dl4OVtiZuD80o/RwwJl8xpJuQA
	R5+DUB//pI8QHA/UdeDJpPgvO5pO4im0FCN2cjk8nr+eem49w25GC6ZfNBmqj+X3VSvSwzxpMqQ7O
	5M+iOZOXzNfESRmYDQWQksvhcjYmb//BKhpeVMF8iUS7m+kySvTOAFNTwG+PSm6S8Uss+d3oNKJn5
	qd78aCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoY8-0000000Etwd-47fG;
	Tue, 27 Jan 2026 19:16:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoY6-0000000EtvC-2aEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4806bf03573so4004265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541383; x=1770146183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zstNEATP95LnRG/q+i4GDrYI7hO5v2pn1ul5vwV4dc=;
        b=LJ2kWxgVGdN/NuI6YBPqnsxQyzo+B4wzAJKcA7+3PIntaUPqr2/bndcX/hHzXIcfKB
         c5sxDD7wCI0f0yORCV3BQZ+VoO9R6YgcenRHkQv65+V7ZxQH/05hJL99Mhadqn+OVzL/
         UU8sjsH5vJlxrCzdFTwVecFP1lKmGlSbJWyM8d6UG4Gaqc91F+8GHB0QLZF/4OTaKjwA
         542W/YBmC1KfGKkKDBmB64ayIf0R8TkgKhnxRfzm53QOzyCExVU32DDfCpaLOAGDiBUB
         og7/U05rJMt7t6Pwis2kopJ+Vd3S/2ZCvz275L3WKPjokCZfxz02qdqZK4B9tT8b6eIe
         C+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541383; x=1770146183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zstNEATP95LnRG/q+i4GDrYI7hO5v2pn1ul5vwV4dc=;
        b=qVZQ0pVtCwvFGRDg+vGFtuUUmtZSJ6Bm8B33eazqowcAK/8P5BZCW3LVtESYgUGtbz
         OHPTw0jdHfnV80tRA5WxBlescv8ZSJ9+QQg+xAq50pa5FakA5o+8qn+6MXqBXctxnIvY
         w+wHlSm9iNeuMcuTDVTZPJm9RJM8OUZkHJ2Qb3VE/NXvyy7osHw2SkHQmglDp3UKmUqa
         4wCkqBRiSMZji3fT7dweXvNfLEPrx982rZ9hbWYHeRdATywEpYnm4GtFGsUrr8pvMrnk
         LCIOFnUQtTnDHcUE8aazSP4b1z/ZBoAvQG2FY09Gg3LPgAQ8fXFnQr0X9mIx7UwxlRa1
         2fDg==
X-Gm-Message-State: AOJu0YxVU/n6Bm84jKuuwRaHMefVsNMWvlEHt59D/X2Mq7skx7iOp9yV
	vOrqKKxxu+M2WhVbWP4wcBo3NvqTT4A3iqiRIVdshfc0BLnPfKjVcWmsL83+5g==
X-Gm-Gg: AZuq6aKaWxX+ADMl1pfWhPNOaC6zilsJGcR3/l32u/WO1JsllUmzOIrS8qFHHat+wxg
	3rxFRJmx8ySMGB0ts+OR4R7iOYfAxWrdcc1yZJZ5FvAGJq9GUBiAbQioRmLTKS6DQh/9Xb7VO4K
	PM9ydhr2XW6O3sRrq0URzwG8xqJrupi1wnBBTEtPhgYKrrSUm/Rq1xZwAo6AdxbF1rXwJKWrclh
	5QtTnJqpB1gOiKUuZJ6DbzSB66wl7FDFn9TCPKo6pnggbPO92fwARqr+9tn7I2JrQ5AeqvKelU4
	mtJjVNlYJUDo5ajU21wXB2FKNPjPx0+pwnP817pZC4sF6fmVr0Uq8wAExTCDyNCxuCZIKXZOAIY
	O1XbvVsTnVseqYuNDJuROqeXxgOh4m+G1ry3SpqkqxP7Tx69/4zeE1GjdSmAHum10WR7DeKksLT
	wyoDEVmhFHlEkCedv37XDKH0ZP
X-Received: by 2002:a05:600c:3113:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-48069c3977dmr33017605e9.12.1769541383095;
        Tue, 27 Jan 2026 11:16:23 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:22 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] RFC: Add support for ZTE zx297520v3
Date: Tue, 27 Jan 2026 22:16:11 +0300
Message-ID: <20260127191618.551317-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_111626_704998_730B11B8 
X-CRM114-Status: GOOD (  30.00  )
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

In the past few weeks I worked on booting my own kernel on ZTE/Sanechip's zx297520v3 SoC. This SoC is a relative of the zx296718 that was once supported by the kernel. It is in use in a lot of LTE to WiFi routers in Africa, China and Eastern Europe, although some devices were sold or distributed by ISPs in the EU too. My goal is to make OpenWRT run on these devices.

I would like to ask for comments on these 6 patches to make sure they are going in the right direction. They are the bare minimum to get the kernel to start and run an interactive busybox on the UART.

Here are a few questions that I couldn't answer myself:

1) The GIC is a GICv3, but there are some extra registers (probably on a different sub-chip) to switch PPIs and SPIs between level high/level low or rising edge/falling edge. The only device where this matters appears to the the timer. It uses level low IRQs, but the GIC has PPIs configured to level-high by default. By setting some non-standard registers, I can get the PPIs to level-low and the timer works OK. Is there any precedence on how to handle this? I am tempted to make a zte,zx29-gic-v3 .compatible glue that sets the PPIs to level-low on init.

2) The boot loader doesn't set up the secure/non-secure world properly and doesn't enable register access to the GIC CPU interface. I found the Raspberry Pi 3 boot stub as a good guidance and put sample code in Documentation/arch/arm/zte/zx297520v3.rst . An e.g. OpenWRT build for this device would have to include a similar setup sequence that it runs from U-Boot before jumping to the kernel. Did I miss any alternatives here?

3) The SoC has clock and reset controls in the same MMIO space, even the same 32 bit registers. What is the preferred way to handle this? Two separate clk and reset drivers that write into the same place? One multifunction driver that exposes clock and resets? One syscon that contains the reg values and two separate clk and reset drivers that consume the syscon?

4) The CPU is a Cortex A53 running in arm32 mode (in the shipped firmware too). It doesn't appear to have an FPU. Reading FPSID results in an exception (so vfpmodule.c/vfp_init says VFP is not available). I tried enabling p10 and p11 in NSACR, but without success. NSACR seems to always read 0 too. Is this really a Cortex A53 without FPU or did I miss something?

5) Relatedly, are there any advantages to running in arm64 mode? The devices are relatively memory constrained (64mb), so the larger binary size from 64 bit pointers is probably a negative, while the larger register set might be a positive. I doubt switching to arm64 mode is possible at all, but I'm nevertheless curious.

6) The old removed zx29 code used "zte," as the vendor for the compatibles. Sanechips is a subsidiary of ZTE that designed these chips. Are there any preferences for either "zte," or "sanechips,"?

As for the rest of the hardware, my entire patchset can be found here: https://gitlab.com/stefandoesinger/zx297520-kernel/ . So far 3 people from the OpenWRT community are helping with testing on different routers (Tecno TR118, ZTE K10, ZLT S10 in addition to my D-Link DWR932 and HGSD R310).

USB: Standard dwc2
WiFi: rtl8192, but in the SDIO version. I hacked sdio into rtl8xxxu but it'll need major cleanup.
ethernet: STMicro stmmac. ZTE wrote their own driver for it. I spent a week re-implementing it before I was able to match the HW to stmmac.
SDIO: standard dw-mshc
NAND: A 128 MB SPI NAND chip connected to a homebrew QSPI controller. The driver is copypasta from stm32-qspi, but the hardware registers seem incompatible
LTE: A Cortex M0 is doing the heavy lifting and talks to the main CPU via RPMsg. I hope to be able to handle this in userspace, but I haven't looked into it yet.
clk, pinctrl, pmdomain: My own code based on the zx2967xx code.

With best regards,
Stefan Dösinger

Stefan Dösinger (6):
  ARM: zte: Add zx297520v3 platform support.
  ARM: dts: Add D-Link DWR-932M support.
  ARM: zte: Add support for zx29 low level debug.
  ARM: dts: Add an armv7 timer for zx297520v3.
  ARM: zte: Bring back ZX29 UART support.
  ARM: dts: Declare UART1 on zx297520v3 boards.

 Documentation/arch/arm/zte/zx297520v3.rst     | 102 ++++++++++++++++++
 .../devicetree/bindings/arm/zx29.yaml         |  20 ++++
 arch/arm/Kconfig                              |   2 +
 arch/arm/Kconfig.debug                        |  11 ++
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zte/Makefile                |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts      |  21 ++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi         |  83 ++++++++++++++
 arch/arm/include/debug/pl01x.S                |   7 ++
 arch/arm/mach-zte/Kconfig                     |  19 ++++
 arch/arm/mach-zte/Makefile                    |   2 +
 arch/arm/mach-zte/zx297520v3.c                |  19 ++++
 drivers/tty/serial/amba-pl011.c               |  37 +++++++
 include/linux/amba/bus.h                      |   6 ++
 15 files changed, 334 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

-- 
2.52.0


