Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB85C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xmdghfSgadBkY6GVQoxPAoUuT5sReEQgJK7Tv/QlXE=; b=ie0xGrgGNAzdzuqFJyS7gi5Grm
	yuzy/y5uoPOUlINrp3olUhmhzY7wr7dh1YiRzNMCs/1z1voJxjfeEfZr/LOKOtXUM70TvVphHu8UT
	/BazhfX/HtDkkkt23zEJHy8VMP3PGDVgJ9mTK5xt1eJQzGqNIn3GPVkJkNE7thdokebEN7fUehODn
	VkR2vKwqgzkEA4oioD1AuJ/ri0znIdDLFZvKcxeLTiurgb5ZLO+oH/PkOWsP+VT2hE63kiIhzXUm9
	06ARvSaVcdpKCJwDzeg2z5uo8hTYpgntne8kts4isOEwffkGrncx6T/t15ruIcMP+u9oVx0+IuhEb
	t1f1cDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4w-00000007RHg-3IrK;
	Fri, 07 Aug 2026 08:37:22 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4t-00000007RFB-0ypf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:37:20 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4994c49f588so17722895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091837; x=1786696637; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7xmdghfSgadBkY6GVQoxPAoUuT5sReEQgJK7Tv/QlXE=;
        b=EzNFbQ+RZNO4jSIJvGe8gyg4pKpeWj0KGk+o6fDcylDVwHkRN2IZrtmi3ejq/hi91s
         38zJf+SPLeVScBG7VTRENVxD6CkNxzHWEnEMDbksLm2vaoeVzffuLqRyZTTUUG3aJfXP
         U2zEJJLw1SLUqDd2ZcTCGhDlTOsctLKihFpq2YkqB8sgue07tFWI8RkHLDshIqD51efl
         N3cmQectogfzNsTEAmXXSsWkkTQxE43tpSiV90TxVjO8CNDLeHuUC9/jIAR1KFBl8wqE
         v7mCumx2OZu4P1aa2r2LQTuxJ0hq6kNTFtqU25mQQkXeZqL3DFMtgdT5oCK9PPW6YTih
         6BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091837; x=1786696637;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xmdghfSgadBkY6GVQoxPAoUuT5sReEQgJK7Tv/QlXE=;
        b=lr4qJ/Yra9pJWEcwxVqhih1P9qhO0QUhJIoOJPM+7lGowxQO4N9GuupUHDDTLNVLQH
         l3GfVdtxrBu13QuL8VBD/si8R9IR+KtUu1+MTUw1WhxnbzqF9sMKhCPzbo7RQC6BYaev
         EE6HFH4nHGFOcpgwaeHa+xboZDfG1gWn1H0Kl4g/SG8qvtrnfOd+z2WNqkBk3Wwcwuee
         L3cB947N/KUbWLRJDpLrJvKfkNPw5sS1d0ZlY2TqSxj3ytl2ra4FaOysK1eF9NnC4yFL
         q5dK0zRKAKkVwWrrNva4JS0t+de5ANa+k5cD9VI49Nb+IUdK0y6CEL080v4R+0CZwmqk
         xzOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1NKH81/SehuciO+4jnh4Pq/w1YlB2dlyFu/V71Zb752rUdqPNt8jdhwCREK0H4rPLsyFAbCq6xWvcSGl6XlDr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYrAPh7/z7rqe5zv0irpfM7Vj8pA92sZDZfoujbn6eRfxm3FYc
	mcAnziyM10KF68V5SQ5L3tPPYwH3e80BVmMTOlKxWH0f9cMUutWOBtoP85+7fAkBVjU=
X-Gm-Gg: AR+sD11fwGZSzZZuGb5uYYyggQoLe7aV8krs7I0C/xZNLiZXPFRim8h6P4dH75jSBAl
	FUSk7hHhNwBf0fs6OW2/UEwTOWgURJmErTL1QgToQyRSxLKisknLT6dtbqrBjHTCZthXRKI2P3w
	vM2/k+8AKptA2Kbj21c413Gjb1HOCrhE2xS+3j5ayTxhBU4V6hxc+ZAM5GObQx2e7Rl1WXv9kie
	SM8oi3xvriy6jgLeYPaybVuEPkKLVrx4P0R/X1Y0jCNclNPjyPuoz5KrItSf6ASmVRkUwqtJ6ro
	igCW9Lq8VrHNdrwGZ1g2m8h/9yqyB7qljMzXy9MxZ/Q7H50SHQYei3V+18wD2nATtbPtvygV8Gp
	ZyCHh7dFS5z3ZAWyzfiXcMMG4gKkfbEjkSC5yqs5GwMqUFzGNmNnmlrSrj1HFc3E2shHafVqEiD
	GDDFDBbAyndXq0RXH/faxiQDqyAwcuxLKHz3iQVDJfHiNhbgB2tRCgDsHDynEHAp/lWCRFo3r48
	Zdy0ldbug==
X-Received: by 2002:a05:600c:42d4:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49959fddc5emr56438565e9.1.1786091836967;
        Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device
 driver
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.7287772568467157519.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=5887;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=5Wtm4+fC2TDCkZjPl5iY3esbeKwy0U6HWjzwFQYdxgM=;
 b=BYG8RuH2of4Gbb/wv8dafAtCnP3l9bAcx9jDlUpTUBOYFB1rnN5jJmZOKiXGTGs9fny/HkoHX
 tn9LiVn8tDnCAFLsuoN9DwifuoFqneYc0Efq2nsAEZ61Cjw8cXEYapH
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_013719_302211_68AFB32A 
X-CRM114-Status: GOOD (  37.89  )
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

> Add support for UART over PCIe between ASPEED
> AST2600 BMC and host.
> This is the host-side driver.
> 
> Based on ASPEED 6.18 Kernel SDK and trimmed down
> and changed to MFD driver.

This doesn't seem to be aligned (72/75 chars per line).

> 
> The AST2600 has two 8250-compatible register set usable over PCIe.
> These act as two UARTs. As there is only a FIFO internally between both
> ends, they are called Virtual UARTs. This patch adds both VUARTs as
> plat_serial8250_port. This is the core driver in charge of setting up
> MSI interrupts. It doesn't bind the whole PCIe resource to allow each
> sub-driver to bind the needed addresses.
> 
> This is not added as a PCI 8250 UART device, but as a MFD driver, as this
> host driver can be expanded upon for IPMI over KCS. It can also be used
> in the future for custom BMC<->host communication with shared memory and
> doorbell.
> 
> This host module should be the entry point for setting up all features
> related to an AST2600 present on the PCI bus.
> 
> Notes on the implementation:
> The host can't detect the VUART addresses, so they are forced to
> 0x3f8 and 0x2f8, as in the initial ASPEED driver.
> 
> The MSI vector index of VUART2 has been changed from 15 to 17.
> The index 15 used in the initial driver was not working.
> 
> Tested:
> Data path in both direction is tested on both VUARTs.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..33a0351819e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4011,6 +4011,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/aspeed,*
>  F:	drivers/crypto/aspeed/
>  
> +ASPEED PCI BMC DEVICE DRIVER
> +M:	Grégoire Layet <git@gregoirelayet.com>
> +M:	Tan Siewert <tan.siewert@9elements.com>
> +S:	Maintained
> +F:	drivers/mfd/aspeed-pci-core.c
> +
>  ASPEED PECI CONTROLLER
>  M:	Iwona Winiarska <iwona.winiarska@intel.com>
>  L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782..dd780f72d169 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2573,5 +2573,17 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_ASPEED_PCI_BMC_DEVICE
> +	tristate "ASPEED BMC PCIe device"
> +	depends on PCI
> +	select MFD_CORE
> +	help
> +	  Host-side driver for the ASPEED AST2600 BMC PCIe device found on
> +	  BMC expansion cards. Exposes two 8250-compatible VUART
> +	  ports.
> +
> +	  If unsure, say N. Choose M here if this machine has an
> +	  AST2600-based BMC expansion card on its PCIe bus.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index dd4bb7e77c33..a364b1b5936b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> +
> +obj-$(CONFIG_MFD_ASPEED_PCI_BMC_DEVICE)	+= aspeed-pci-core.o
> diff --git a/drivers/mfd/aspeed-pci-core.c b/drivers/mfd/aspeed-pci-core.c
> new file mode 100644
> index 000000000000..ad6732133ec5
> --- /dev/null
> +++ b/drivers/mfd/aspeed-pci-core.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (C) ASPEED Technology Inc.
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/pci.h>
> +#include <linux/serial_8250.h>
> +#include <linux/mfd/core.h>
> +
> +#define ASPEED_BMC_MULTI_MSI		32
> +#define ASPEED_BMC_PCI_DEVICE_ID	0x2402
> +#define ASPEED_BMC_REVISION_AST2700	0x27
> +#define ASPEED_BMC_VUART		2
> +
> +#define DRIVER_NAME "ast2600-pci-core"
> +
> +static const unsigned int vuart_msi_index[ASPEED_BMC_VUART] = { 16, 17 };
> +static const u16 vuart_port_addr[ASPEED_BMC_VUART] = { 0x3f8, 0x2f8 };
> +
> +struct aspeed_pci_bmc_dev {
> +	struct plat_serial8250_port uart[ASPEED_BMC_VUART + 1];
> +	struct mfd_cell cell;
> +};
> +
> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
> +					     struct aspeed_pci_bmc_dev *pci_bmc_dev)
> +{
> +	resource_size_t bar = pci_resource_start(pdev, 1);
> +	struct plat_serial8250_port *port;
> +	u16 vuart_ioport;
> +	unsigned int i;
> +
> +	for (i = 0; i < ASPEED_BMC_VUART; i++) {
> +		port = &pci_bmc_dev->uart[i];
> +
> +		/* ASPEED BMC device shift addresses by 2 to the left */
> +		vuart_ioport = vuart_port_addr[i] << 2;
> +
> +		port->mapbase = bar + vuart_ioport;
> +		port->uartclk = 115200 * 16;
> +		port->irq = pci_irq_vector(pdev, vuart_msi_index[i]);
> +		port->iotype = UPIO_MEM32;
> +		port->type = PORT_16550A;
> +		port->flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
> +		port->regshift = 2;
> +	}
> +
> +	pci_bmc_dev->cell = (struct mfd_cell) {
> +		.name		= "serial8250",
> +		.platform_data	= pci_bmc_dev->uart,
> +		.pdata_size	= sizeof(pci_bmc_dev->uart),
> +	};

In the commit message you're describing that the MFD driver will be used for
setting up MSI interrupts:
> It doesn't bind the whole PCIe resource to allow each sub-driver to bind the
> needed addresses.

But you're adding the UART devices here which now means that the core driver is
doing more than MSI interrupt init.

Suggestion from my side would be to have an array of `mfd_cell` where you define
which devices are part of the MFD, and your VUART lives in another driver.
See `ls2k-bmc-core` for example.

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

