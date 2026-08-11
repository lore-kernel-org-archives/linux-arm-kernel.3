Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFFEC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMhZi9etRWtnaHOdlgeIDPYPs8YW3ryoczmOB+92hZg=; b=zc+WV0KQgrpLiGMWpMFWL0hCF+
	IhU4vWEMTtICfy7bOT5t6wXQPuqhOQwBU0TbOhdiCzvy3uPXDydt8mw9oyN5/3zACDJdbCp5+35mS
	EktWCP32XxypB9lBfRTvVoGaSkexb9C+E/MEIZGvas/2sg8JWUAYHYBmX6IOvmi+QHgHOPoRVg+Hl
	gRAD8D4Um4j5hONS/Hhj8oIGVthp2ZyXopipiLqhj8nPqo5ZnrXn05cisyVUOyT41JfqNhvS4CKa3
	zhfQ9mX2Zm+Fm/2sT/fEbYuQyOs87zavDYP73i4r9BR5anuLVYnjB8Fq852Ik8SrlCq8/7JuMVNGg
	jTxQop6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmoW-0000000E7xb-43rM;
	Tue, 11 Aug 2026 13:46:44 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmoT-0000000E7wx-0yqt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:46:43 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso3308316e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786455999; x=1787060799; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMhZi9etRWtnaHOdlgeIDPYPs8YW3ryoczmOB+92hZg=;
        b=US9hMSvwOhqqTfk9GCnQqTXacgAqjqAkWDJcVyWNf0fcc8roNZEm8yvLYzKN6Ow5x6
         qchKFJiIyEsd4JSZBSKWsCF/oHzyJV3c7NnlBGhfMflHBCzC/qCJRaOdmDLIIGLVoEVt
         LerHlh2SM00YLGHmAy9J+3t1ihGiGVm1OGXbFGg15FhjTbC3n+EixkGQqBSXdK+mfiN7
         /+DisEdVjawD3k1xjvbWIBWYtiAuOIrA+iHB7YJp6YcOsTHdua5MsnhLZvWiUTMNxaZZ
         UITFxs9+GimlUzwSlIIJtfT3KHpl2amk7yazg7eQAnIj9J2CYraNAKyWSRbSwH7Ycckb
         eNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455999; x=1787060799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMhZi9etRWtnaHOdlgeIDPYPs8YW3ryoczmOB+92hZg=;
        b=Nym0DamrrYbylbWEevsyiABO3+wo2zX6NZ15mBaRv5FHGlURBiSH5eeKBycNvFYMBd
         LkS1CSHoTKePzIHfa4RByHa95MoYpB04LKYi9DeOPlsyMgKCe57m844XuYMorA4CeTsy
         QDztjj+YsKkqC2vLw/hwBItB2GtgzRtyNTZCL35tccVusI3HeY97pbgJCWjIpma7xQBd
         JalQkrFBFylqHEgZd439oNqURzBrF6OmwTwKdPFzJZMs9ae8PxWfk/o+cfAjfYU77ECs
         XO5chdXbZIN1wOBaNOwKSwXSwV2ZLGS9GBu1IyaA71CXDOVnWE9mGFbkGr4s4WIfu6NY
         58jw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7X+fMUfTuV/izmBZriO+MKQisUrMp9LTRMHHiALwxmAKAg5UrpC8YLjUqnqyAzyZq4HRN5GDYjYmqqD5CJcHT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+fBH3Fz244kxzZhx3XIQof2D/MVYy5EhOPac0Lm22x7wy5TU
	Fl+cy9qfQ7o4cPhcalNExNajfU0N7OOgNyDbcX7ype7AkMbtRf53kER0U7snUMgayaU=
X-Gm-Gg: AR+sD11q4VgIeSurD5g4oM45syxKImRYYblY2Bjh/+hlv1a4IqrXoKHNrpBQqVsE72C
	0fi517wgZ65s1Hhhh/exBQbyuTNC8EVSjOnq1/6YloIQ1dOHhbPFPZIscyRXW7YoOeWQgBMeX9h
	tqY913AauixU6pRgTlVnqktPttjfb+f1pzF+ZTfURceWibpHgdpNPaxT3jNCmufc+VywKrecb88
	k3uT8IxEjQwX267SV4W7OapyWTCR0OPtoWYG29am/Bf/EFCZuXSv4dMzqSFS6ORRjKdkTzTYVe3
	nEvdASWonLdd3/jIquVSJgy67SldU5T+zNbnhgRBUY3mYSAqSMPjYIqQpEsyX2WYeDsLwH5c9lK
	swscqimXui1nWYhXsKSzbAbUsi987fnj0ZuYdqlcwuSRcg/C0xF+qf4WXtHDbQLMA0WvSYgiIlL
	BEm1K5uYH+5p1fCBN+RuqoZ7WFwrPePmprr0R5KJxiU/H4WCOMl28U/wYresHb
X-Received: by 2002:a05:6512:1386:b0:5b0:eda:de2c with SMTP id 2adb3069b0e04-5b4485f7b4cmr557681e87.17.1786455998165;
        Tue, 11 Aug 2026 06:46:38 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b448724cdcsm316327e87.49.2026.08.11.06.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 06:46:37 -0700 (PDT)
Message-ID: <43047f17-7cb4-435d-8313-91c9362f085e@riscstar.com>
Date: Tue, 11 Aug 2026 08:46:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/14] net: enable TC956x support
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
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_064641_719377_2D456820 
X-CRM114-Status: GOOD (  58.59  )
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

On 6/4/26 8:00 PM, Alex Elder wrote:
> (A fairly detailed list of changes since v1 is included below.
> Because there are so many changes listed, they are not repeated
> in the individual patches that follow.  Note also that this
> series depends on two prerequisite commits, as explained below.)

We are now ready to send version 3 of this series.  It has undergone
a complete restructuring, though many detailed bits of code remain
the same as before.  Because of this we intend to use a new strategy
in posting the code for review.  I describe that here; if you think
there are things we could do differently to improve this process,
please say so.

I can provide a longer explanation for how the new model works if
that is requested, but here is a summary of the process:
- There will be no "version 3" of the original series.
- Instead, the TC9564 will be treated as an SoC that consists
   of a set of distinct components (clock, reset, interrupts,
   GPIO, etc.).
- Support for each of these components will be provided by
   distinct platform device drivers.
- These platform drivers will be upstreamed independently.
   I.e., the clock driver will be sent to clock maintainers for
   review, the reset driver will be sent to reset maintainers,
   and so on.
- One of these platform drivers will provide support for the
   XGMAC 10 Gbit Ethernet interface (whose support was the
   the original, primary goal of this series).
- The anchor driver is a PCI endpoint/function driver, which
   implements the framework necessary to support the pci-ep-bus
   that all the other devices use for their MMIO.

We will send the code for all of these parts out for review
separately.  Upstreaming each can proceed independently, and
when all are eventually accepted (including devicetree updates),
the originally-desired XGMAC functionality will be supported.

Here is a list of the "components":
- PCI driver (drivers/misc/tc9564-pci.c)
- Clock driver (drivers/clk/clk-tc9564.c)
- Reset driver (drivers/reset/reset-tc9564.c)
- Interrupt controller driver (drivers/irqchip/irq-tc9564-msigen.c)
- Address translation unit driver (drivers/misc/tc9564-translate.c)
- XGMAC driver (drivers/net/ethernet/stmicro/stmmac/dwmac-tc9564.c)

There was previously a GPIO driver included.  That has been
reimplemented to be accessed via I2C rather than PCIe BARs.
The new version will be associated with the PCI pwrctl driver,
pci-pwrctrl-tc9563.c, and will be posted for review separately.

					-Alex

> This series introduces stmmac driver support for the Toshiba TC9564
> (also known as Qualcomm QPS615).  This is an Ethernet-AVB/TSN bridge IC
> that provides a high-speed connection between a host SoC and Ethernet
> devices on a network.  It incorporates a PCIe switch, and implements
> two 10 Gbps capable Ethernet MACs (along with other IP blocks), and
> is essentially a small and highly-specialized SoC.  The TC9564 is a
> member of a family of similar chips, and the driver code uses "tc956x"
> to reflect this.
> 
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
> a 2.5Gbps Qualcomm PHY on port B.  (The Marvell PHY is not populated
> on all RB3gen2 boards, and only the 2.5 Gbps Qualcomm PHY is supported
> initially.)
> 
> TC956x chips also implement several other blocks of functionality,
> including a GPIO controller, interrupt controllers (MSIGEN), I2C
> and SPI, a UART, and an Arm Cortex M3 CPU with 128KB SRAM.  The GPIO
> interface exposes several lines to manage external resets.  The
> interrupt controllers are used internally by the eMAC functions.  The
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
>    - A "chip" driver, associated with the PCIe functions
>    - A driver for the GPIO controller
>    - Code enabling the TC956x-specific eMAC/MSIGEN hardware
> 
> To manage the common functionality (including configuring address
> translation and controlling internal reset and clock signals), a
> "chip" driver is implemented.  The chip driver binds to PCI
> functions 0 and 1, and creates a shared data structure describing
> the common chip elements shared by the two driver instances.  PCIe
> function 1 defers probing until after PCIe function 0 has created
> this shared data structure.
> 
> Common/shared functionality is handled by PCIe function 0.  This
> common code uses PCIe function 0's mapped BARs to configure the
> hardware.  If the TC9564 GPIO controller is needed (i.e., defined
> in a node in devicetree), it is created as an auxiliary device
> when PCIe function 0 is probed.
> 
> Both PCIe function 0 and function 1 implement an Ethernet
> controller as well, though one or the other might be unused on
> a given platform.  If a PCIe function node defines an ethernet
> subnode in devicetree, the corresponding eMAC is enabled, and
> the PCIe function driver will create an auxiliary device to
> represent it.
> 
> The GPIO driver is implemented separately because in some hardware
> configurations, these GPIO lines are used to manage resets for
> external Ethernet PHYs.  We describe these PHYs via devicetree,
> where the GPIO-based reset signals are defined using phandles.
> 
> The code for eMAC and MSIGEN consists of a new source file that
> populates hardware-specific details about the two MACs, and integrates
> with the existing stmmac driver.  This also required implementing some
> enhancements to the core stmmac driver, described further below.
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
> NOTE:
>      This series is based on net-next/main, but depends on these
>      two commits found in linux-next/master:
> 
> 	68d801eabda52 gpio: regmap: Support sparsed fixed direction
> 	806e7acf7f331 gpio: regmap: Don't set a fixed direction line
>         
> 					-Alex (and Daniel)
> 
> This series is available here:
>    https://github.com/riscstar/linux/tree/tc956x/stmmac-v2
> 
> Changes between version 1 and version 2:
> 
> NEW
>    - The qca808x.c PHY driver now supports enabling up to four optional
>      regulators
> 
> GENERAL
>    - The order of patches has been rearranged a bit.  One consequence
>      is that the TOSHIBA_TC956X_PCI Kconfig symbol is now defined
>      before it's used.
> 
> PATCH 00/12
>    - MAINTAINERS entries have been added for all new files
> 
> PATCH 01/12
>    - devm_xpcs_regmap_register() now ensures the xpcs_destroy() is
>      called when the device is unbound (suggested by Sashiko).
> 
> PATCH 02/12
>    - Reworked how the quirky behavior was handled.  Now:
>      - A soft reset is issued in xpcs_pre_config() *before* calling
>        xpcs_switch_interface_mode() calls txgbe_xpcs_switch_mode().
>        It does this now for an SGMII interface, not just if the
>        need-reset flag is set
>      - xpcs_switch_interface_mode() calls txgbe_xpcs_switch_mode(),
>        preserving previous behavior
>      - For other (non-Wangxun) platforms, if the XPCS supports
>        10Gbase-R, xpcs_switch_interface_mode() programs the interface
>        operating mode to use a reserved value rather than the default
> 
> PATCH 03/12
>      - This change has been removed; the default_an_inband platform
>        data flag is set instead (in what was previously patch 10)
>        
> PATCH 04/12
>      - Two issues were pointed out by Sashiko, both of which were
>        problems related to DMA handling.  They were pre-existing
>        issues, and I plan to send separate patches to address
>        them.
>      - A mask local variable (to shorten a long line) is no longer
>        created.  Checkpatch no longer complains about that line.
> 
> PATCH 05/12
>      - The description was clarified a bit in response to a comment
>        from Andrew
> 
> PATCH 06/12
>    - No comments received, no changes
> 
> PATCH 07/12
>    - Sashiko suggested that exporting some symbols from the stmmac
>      core might not be desirable, and suggested using the standard
>      DMA API to accomplish the same thing.  For now we are igoring
>      this suggestion--not finding a way to do what was suggested.
> 
> PATCH 08/12
>    - The description has been revised to focus on the hardware and
>      not the "node".
>    - The ASCII art (copied from below) has been incorporated into the
>      binding
>    - The file name has been changed to "toshiba,tc9564-dwmac.yaml" and
>      the $id value matches the file name
>    - Only one example is provided now
>    - The references and unevaluatedProperties have been moved later
>      in the file
>    - We no longer reference "pci-bus-common.yaml".  We are describing
>      a device, not a bridge.
>    - Subnodes have been added to represent the GPIO controller (on
>      PCIe function 0) and the Ethernet interfaces (possible on PCIe
>      functions 0 and 1).
> 
> PATCH 09/12
>    - The GPIO controller is now implemented using regmap-gpio
>    - The Kconfig entry for the GPIO driver has been updated to select
>      GPIO_REGMAP, and to define its default value as "m" unconditionally
>    - The Kconfig entry is now defined in the memory-mapped GPIO section
>    - The regmap use has been adjusted so it's clear it is MMIO-based,
>      which normally does not require error checking.
>    - We no longer call drv_get_drvdata()
> 
> PATCH 10/12
>    - The name of the IRQ domain now includes the MAC ID (0 or 1)
>    - SP_SEL_SGMII_2500M is now named SP_SEL_2500BASEX
>    - A typo in the commit has been fixed, and the error check after creating
>      the RX IRQ mapping now checks the right pointer for an error
>    - The Kconfig entry now selects GENERIC_IRQ_CHIP
>    - The PHY interface is now taken into account in the fix_max_speed
>      callback
>    - We now check the correct pointer for an error when creating the RX
>      IRQ mappings
>    - We are not implementing a shutdown driver callback
>    - Xilin has other discussion related to WoL, which we should save
>      and use, but we're not acting on it now.
>    - In four function, Sashiko noted that a 32-bit dma_addr_t can't hold
>      TC956X_SLV00_SRC_ADDR, so the type of local variable has been changed
>      to be u64: tc956x_dma_init_rx_chan(), tc956x_dma_init_tx_chan(),
>      tc956x_desc_set_addr(), and tc956x_desc_set_sec_addr().
>    - tc956x_mac_disable() is now called if stmmac_dvr_probe() fails;
>      suggested by Sashiko.
>    - Sashiko noted the MDIO device tree node was being leaked.  This
>      has been resolved.
>    - Sashiko also pointed out that IRQ mappings were not being freed,
>      and this too is fixed.
> 
> PATCH 11/12
>    - The reset and clock functions are no longer defined inline
>    - The REFCLK clock name has been renamed REFCLKO, and a comment
>      has been added to explain it is an (unused) output clock.
>    - If the PCI device has no DT node it is reported with dev_err().
>    - <linux/bitfield.h> is now included, to avoid errors in various
>      non-Arm64 builds.
>    - The devicetree Ethernet node is no longer leaked in adev_device_add()
>      (noticed by Sashiko).
>    - The Kconfig entry now depends on ARM64 or COMPILE_TEST
>    - The Kconfig entry now selects REGMAP and REGMAP_MMIO
>    - Sashiko reported that the reference count on the PCIe slot
>      for function 0 was being leaked.  This has been fixed.
>    - Sashiko questioned whether the cleanup action to delete
>      a created device link was associated with the wrong device.
>      It was, and this has been fixed.
>    - Sashiko also suggested that the allocated PCI IRQ vector
>      was not properly getting removed.  It now is.
>    - Sashiko suggested that function 1 might proceed with probing
>      even though there was still a chance that function 0's probe
>      failed.  The platform_data pointer that function 1 uses to
>      decide it's OK to probe is now assigned later.
> 
> PATCH 12/12
>    - The PHY interrupt is now defined as a level interrupt.
>    - A typo in the PHY name has been corrected in the patch description
> 
> Here is the initial version of the series.
>    https://lore.kernel.org/netdev/20260501155421.3329862-1-elder@riscstar.com/
> 
> Alex Elder (3):
>    net: stmmac: dma: create a separate dma_device pointer
>    misc: tc956x_pci: add TC956x/QPS615 support
>    gpio: tc956x: add TC956x/QPS615 support
> 
> Daniel Thompson (11):
>    dt-bindings: net: qca,qca808x: Add regulator properties
>    net: phy: qcom: qca808x: Add regulator management
>    net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
>      regmap
>    net: pcs: xpcs: re-order xpcs_pre_config() to update after the reset
>    net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
>    net: stmmac: dwxgmac2: Add multi MSI interrupt mode
>    net: stmmac: dwxgmac2: Add XGMAC 3.01a support
>    net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
>    dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
>    net: stmmac: tc956x: add TC956x/QPS615 support
>    arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCA8081
>      phy
> 
>   .../devicetree/bindings/net/qca,qca808x.yaml  |  14 +
>   .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 +++
>   MAINTAINERS                                   |  12 +
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  48 +
>   drivers/gpio/Kconfig                          |  12 +
>   drivers/gpio/Makefile                         |   1 +
>   drivers/gpio/gpio-tc956x.c                    | 130 +++
>   drivers/misc/Kconfig                          |  12 +
>   drivers/misc/Makefile                         |   1 +
>   drivers/misc/tc956x_pci.c                     | 741 ++++++++++++++++
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>   .../net/ethernet/stmicro/stmmac/chain_mode.c  |  12 +-
>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
>   .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  12 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  79 +-
>   .../net/ethernet/stmicro/stmmac/ring_mode.c   |  12 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c |  58 +-
>   .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   2 +-
>   drivers/net/pcs/Makefile                      |   4 +-
>   drivers/net/pcs/pcs-xpcs-regmap.c             | 219 +++++
>   drivers/net/pcs/pcs-xpcs.c                    |  93 +-
>   drivers/net/phy/qcom/qca808x.c                |  30 +
>   include/linux/pcs/pcs-xpcs-regmap.h           |  20 +
>   include/linux/stmmac.h                        |   1 +
>   include/soc/toshiba/tc956x-dwmac.h            |  84 ++
>   29 files changed, 2478 insertions(+), 76 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>   create mode 100644 drivers/gpio/gpio-tc956x.c
>   create mode 100644 drivers/misc/tc956x_pci.c
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>   create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>   create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
> 
> base-commit: 07c4bca9d92e51ab6b46797a86c6ea559812351a


