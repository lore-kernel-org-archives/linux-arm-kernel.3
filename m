Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8SB7g/SQE94W836Nonq8Wq3k7Nj7c32M69MG7wU2+o=; b=zJ2q9gQODQvKr+2U8fTSHKsojj
	Z0fgeuBndU0efXeGEStOLsyBz86zfT6blelVc+8byu2zvSTv/FZkGOyx7lEYH0wYzOhzFaJ3OdrTG
	5RajBG0c1c7AvkiRAEvSscn4ycnGBcSRQeOQZfXPRVhndhlYhBpsV4tkrWMPd+WeUTaEllcTlPXy0
	L6GetQNGOt4dgTatuZQkKb2aO5Ua+lKWXaXl4k5fSyVF40Rwyj6nvMQob+xzRRyZfqahQWVRUTunH
	3zFWNl4dB7KIpgO5kF3Rwj4jCj0WanJh2HoBauWpypqbQwRK6l25kuNGZbwsIfP897EkFqNQEvvpR
	JYje3+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwoz-000000092js-2Y8H;
	Fri, 15 May 2026 17:59:37 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwow-000000092jE-29M5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:59:36 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8ca12973e15so590126d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778867972; x=1779472772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8SB7g/SQE94W836Nonq8Wq3k7Nj7c32M69MG7wU2+o=;
        b=Av/YFu1bXEk8mZN6Jctj+/iSXIKKGaaPT7mpzIZa+rbPSvqyO6/j/ZTHSd6jMrT/Fh
         O68UEJIAF1Gah47CUQowWGLRWBWnqFh/qrmcIuu0Bjk6t1yJZEc3RZJG8yGGR0mFvP8O
         wuh6mUOUkbvUaZlbsZNc8U5X0JG1Y4Xnoojxx4BVKDAEodz+4opR3Jvlbfw26dkRi6oO
         j6S9f8zQw5FeODWSGO5K2qbGr2hemBcyPxSXb6dmhlWaedogPoFSTIjQ4OaodXr2A2T0
         ya3W8eymg63vOVJHu8zDWND5QWy0S8E6K4ZlvJtYWXN7byI1KP2c8CUf6ZibecHQ0HRX
         EcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778867972; x=1779472772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8SB7g/SQE94W836Nonq8Wq3k7Nj7c32M69MG7wU2+o=;
        b=LVOPljr8UHWNw0hNTMWd1VjzBSVVfAGAjJ+/5tCTwACnDzNn7K/wIM4JA4A8smF8JB
         NuEiLxGN65sFGfjSOVzLejMxG3YKBusfLv2MZHTMxkogrCmNQ5oAECLKcbxE6UuAQ4+p
         x4Hz/IR/tUQ9THSbRhzoq3ye0+5MvoFe3xc2pzFu89pQWUkMvT2HVTHfP38gAhCsmVTh
         f47qSg/LwOrIZ0jvPIuIUQCgWsFkOkafU50UdRTfT1stmrcO0XWbQ1T7nNowT02ZiOAO
         B0vOv8ydiQlynJ8zAhVNQrT14hxkv/F60Fj938qXbZFe/mjMoH7qnsX1OFGjTmOK5R4t
         nZwA==
X-Forwarded-Encrypted: i=1; AFNElJ88CruPNRVfxZGYC9TO1yvhf8lT6pJ/SrkQWDvcXkdfPJU2sNuST4yaJdwMf8IkoCL1URg1dTAv/Hb1W54Iv5vn@lists.infradead.org
X-Gm-Message-State: AOJu0YwY2nWDi21SPm+o7oCypUEZd0Om8vql53jnULnuz7ZtUXonnZtk
	7oAQMECX1GWMcAk2JywkLbCuqifApOH0ncHn6tekMwcuuUvvrtA6lwZlgwxAPSAI2Ug=
X-Gm-Gg: Acq92OGduQh0d4Tg1SjpX3sPQzPkSbXlbUvRBgPLfooHDMxgAzSBJmrCn1pqURluOBj
	izT0HsymPB+jFvItgDwI8i7ECg3U2bz/ZgP8PSD7CKiZSXpXIKJzaqqGMCVbGVVoV7XqaBDF9XJ
	nRewrJ4Z7K+sgE7TcczDHsEPDuSYhkF6X61hgT0+UKIr8XAI8Ol4KAXbmx3ULIk/+t1KOuA3swI
	gAv+HUuIAih7o5ubCgOux8YAnjmq3TvMaxZOlDbG9GkYVGzvoeqmzSVd9iyiklXdu8fPc7pR8wd
	GOfRA20bMeeDlbJFSjdt9bCUJ7QsAQO++7p2rn7p8azP4u8B7wG/+79xwAuLwtKXEAaOipNsz5u
	q42OGmzFtjcVJNzASV43DEA8ZjOhxH9hRjlIJPGoxGvVogAIkPLas3nnDJa9pGndX4x+0x5fHjD
	CuQU9kGin4bPwKdojAExaXaRTXJWsc7+PuNXJgU/l5Yn7oL4y7b9arbqi612Fwyyc=
X-Received: by 2002:a05:6214:5541:b0:8be:143c:955f with SMTP id 6a1803df08f44-8ca0f710315mr86073156d6.49.1778867972151;
        Fri, 15 May 2026 10:59:32 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90bf6720asm62107926d6.39.2026.05.15.10.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 10:59:31 -0700 (PDT)
Message-ID: <2414c9e9-0672-417a-a3d1-993bd06d62db@riscstar.com>
Date: Fri, 15 May 2026 12:59:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/12] net: enable TC956x support
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_105934_719498_16496F07 
X-CRM114-Status: GOOD (  49.61  )
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

On 5/1/26 10:54 AM, Alex Elder wrote:
> This series introduces stmmac driver support for the Toshiba TC9564
> (also known as Qualcomm QPS615).  This is an Ethernet-AVB/TSN bridge IC
> that provides a high-speed connection between a host SoC and Ethernet
> devices on a network.  It incorporates a PCIe switch, and implements
> two 10 Gbps capable Ethernet MACs (along with other IP blocks), and
> is essentially a small and highly-specialized SoC.  The TC9564 is a
> member of a family of similar chips, and the driver code uses "tc956x"
> to reflect this.

I'm writing now to just state what the plan is for version 2
of this series.  I had hoped to get something out this week,
but it won't be available today, so I wanted to at least let
people know what to expect.

First, we received a great deal of really good feedback on
this series.  I/we sincerely appreciate it, and have already
addressed almost all of the suggestions people have made.

Andrew Lunn asked a number of questions about the way that
the TC956x device is represented, and in particular questioned
whether having the GPIO controller as a device subordinate to
a PCIe function even made sense.  This led to some additional
discussion, including some offline work exploring what other
options might be reasonable.

The plan for version 2 is to submit it fairly soon, to include
updates that address *most* of the feedback received so far.
(I have sent e-mail with clear confirmation of what we intend
to do--and these changes would be incorporated in version 2).

However, because there remain other outstanding issues,
including "big picture" questions about how to represent the
hardware, the series will be sent as RFC.

This will allow others to see the changes we made based on
feedback, but also makes it clear there is more work that
needs to be done before we're confident in our final proposal.

					-Alex

> TC956x chips incorporate a PCIe gen 3 switch, with one upstream and
> three downstream ports.  Its PCIe functionality is already supported
> upstream, including a power control driver that performs some early
> configuration of the PCI ports ("pci-pwrctrl-tc9563.c").
> 
> One of the PCIe switch's downstream ports has an internal PCIe endpoint,
> which implements two PCIe functions, each of which has an Ethernet MAC
> (eMAC) subsystem. The eMAC is composed of a Synopsis Designware XGMAC
> combined with an XPCS and PMA.  Each MAC is capable of operating at
> 10M/100M/1G/2.5G/5Gps and 10Gps.  The initial target platform is the
> Qualcomm RB3gen2, which supports a 10Gbps Marvell PHY on port A, and
> a 2.5Gbps Qualcomm PHY on port B.  (The Marvell PHY is not populated on
> all RB3gen2 boards, and only 2.5 Gbps support is included initially.)
> 
> TC956x chips also implement several other blocks of functionality,
> including a GPIO controller, interrupt controllers (MSIGEN), I2C
> and SPI, a UART, and an Arm Cortex M3 CPU with 128KB SRAM.  The GPIO
> interface exposes several lines to manage external resets.  The
> interrupt controllers are used internally by the MAC functions.  The
> UART, SPI, microcontroller, and SRAM are currently unused.
> 
>                ----------------------------------
>                |              Host              |
>                ------+...+----------+........+---
>                      |i2c|          |  PCIe  |
>      ----------------+...+----------+........+------
>      | TC956x        |I2C|          |upstream|     |
>      |               -----        --+--------+---  |
>      |  -----  ------  -------    | PCIe switch |  |
>      |  |SPI|  |GPIO|  |reset|    |             |  |
>      |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>      |                 -------    ---++--++--++--  |
>      |  -----  ------     downstream//    \\  \\   |  downstream
>      |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>      |  -----  ------   //PCIe port 3       \\     |
>      |                  ||                   \======= downstream
>      |  ----+-----------++-----------+----         |  PCIe port 2
>      |  | M | internal PCIe endpoint | M |         |
>      |  | S |------------------------| S |  ------ |
>      |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>      |  | G |function 0|  |function 1| G |  ------ |
>      |  | E |----++----|  |----++----| E |         |
>      |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>      --------+.......+------+.....+-----------------
>              |USXGMII|      |SGMII|
>            --+.......+--  --+.....+--
>            |  ARQ113C  |  | QEP8121 |
>            |    PHY    |  |   PHY   |
>            -------------  -----------
> 
> The primary objective for this series is to support the Ethernet
> functionality provided by the TC956x.  The code providing this
> support has been structured into three distinct modules.
>    - A driver for the GPIO controller
>    - Code enabling the TC956x-specific eMAC/MSIGEN hardware
>    - A "chip" driver, associated with the PCIe functions
> 
> The GPIO driver is implemented separately because in some hardware
> configurations, these GPIO lines are used to manage resets for
> external Ethernet PHYs.  We describe these PHYs via devicetree,
> where the GPIO-based reset signals are defined using phandles.
> 
> The code for the eMAC/MSIGEN consists of a new source file that
> populates hardware-specific details about the two MACs, and integrates
> with the existing stmmac driver.  This also required implementing some
> enhancements to the core stmmac driver, described further below.
> 
> To manage the common functionality (including configuring address
> translation and controlling internal reset and clock signals), a
> "chip" driver is implemented.  This chip driver is associated with
> the PCIe function *itself*, not the eMAC associated with the function.
> 
> The driver binds to the internal PCI functions 0 and 1, and creates
> a shared data structure describing the common chip elements the two
> driver instances share.  Three auxiliary bus devices are created to
> represent the GPIO controller and the two Synopsys MAC controllers.
> 
> The driver instance for PCIe function 0 has responsibility for
> controlling the common chip functionality--creating the GPIO
> controller auxiliary device, configuring address translation
> between PCIe address space and internal addresses, and controlling
> clocks and resets.  It creates a data structure--shared via its
> platform data pointer with PCIe function 1--to represent shared
> "chip" information.  In addition, PCIe function 0 creates an
> auxiliary device to represent its attached eMAC.  It allocates
> IRQs and maps BAR address ranges for use by the stmmac driver,
> passing them in a structure via the auxiliary device's platform
> data.
> 
> PCIe function 1 defers probing until after PCIe function 0 has
> created the shared data structure.  After that its only job is
> to set up IRQs and mapped memory and create the eMAC1 auxiliary
> device.
> 
> The version of the Synopsys MAC IP is 3.01, which is largely compatible
> with version 2.20.  The core stmmac driver required several changes to
> enable support for the TC956x.
>    - A change to dwxgmac2 support changes the interrupt mode when
>      multi_msi_en is enabled.
>    - While most support for version 3.01 simply uses the 2.20 code,
>      an erratum related to the RX ring length is implemented for
>      3.01 DMA operations.
>    - Having the PCIe device be separate from an auxiliarly device
>      implementing the eMAC required allowing a distinct DMA device
>      to be maintained for an stmmac interface.
> 
> In addition:
>    - A new source file provides memory-mapped access to XPCS using
>      regmap.  The alignment of the TC956x MDIO registers aren't
>      suitable for using simple MMIO.
>    - Two additional XPCS changes are implemented that provides
>      support for the XPCS as implemented in the TC956x.
> 
> This series is available here:
>    https://github.com/riscstar/linux/tree/tc956x/stmmac-v1
> 
> 					-Alex (and Daniel)
> 
> Alex Elder (3):
>    net: stmmac: dma: create a separate dma_device pointer
>    gpio: tc956x: add TC956x/QPS615 support
>    misc: tc956x_pci: add TC956x/QPS615 support
> 
> Daniel Thompson (9):
>    net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
>      regmap
>    net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
>    net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE during link up
>    net: stmmac: dwxgmac2: Add multi MSI interrupt mode
>    net: stmmac: dwxgmac2: Add XGMAC 3.01a support
>    net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
>    dt-bindings: net: toshiba,tc965x-dwmac: add TC956x Ethernet bridge
>    net: stmmac: tc956x: add TC956x/QPS615 support
>    arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCS8081
>      phy
> 
>   .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 +++
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  45 +-
>   drivers/gpio/Kconfig                          |  11 +
>   drivers/gpio/Makefile                         |   1 +
>   drivers/gpio/gpio-tc956x.c                    | 209 +++++
>   drivers/misc/Kconfig                          |  10 +
>   drivers/misc/Makefile                         |   1 +
>   drivers/misc/tc956x_pci.c                     | 667 +++++++++++++++
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>   .../net/ethernet/stmicro/stmmac/chain_mode.c  |  12 +-
>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
>   .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  12 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  78 +-
>   .../net/ethernet/stmicro/stmmac/ring_mode.c   |  12 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c |  59 +-
>   .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   2 +-
>   drivers/net/pcs/Makefile                      |   4 +-
>   drivers/net/pcs/pcs-xpcs-regmap.c             | 203 +++++
>   drivers/net/pcs/pcs-xpcs.c                    |  43 +-
>   include/linux/pcs/pcs-xpcs-regmap.h           |  20 +
>   include/linux/stmmac.h                        |   1 +
>   include/soc/toshiba/tc956x-dwmac.h            |  84 ++
>   26 files changed, 2341 insertions(+), 53 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>   create mode 100644 drivers/gpio/gpio-tc956x.c
>   create mode 100644 drivers/misc/tc956x_pci.c
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>   create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>   create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
> 
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731


