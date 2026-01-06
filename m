Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA05C47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsJJOzya3cvYihpIwq796R0nHpBIF37n18oyXT0fuvE=; b=3Oc+M+ZM0I39vvz53gDGUL9gx9
	64dmOlz5WtUM1Lb6VarQRdIfhG3WkQX+uqM3Hf15KEQM1/lAdelG7hyuUZUO5REewXLykgtgxObhx
	gCWbWwZBodV9dnqlpQhRPz60gA/tSQfXKxYijGMnkY5FlgvGUwHrULs45mGka8XzdtNuK43/e25qN
	/kKXS9ZYp6HDGxyoTz1Jyy5F5BMopNmMtkWz2RXxiDTKWd48RE8vhmhjF69mRwvZ7g2xJ1IgFSg97
	38IaSEhl0x08x3UOj7NQPO7EIrfNU8Zi7k8/y/TSxcxMZZmElOdylL8dELOctyk4nBwtLobGQExoq
	WUenS72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Km-0000000CnjR-2HSs;
	Tue, 06 Jan 2026 10:30:40 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Kk-0000000Cnid-150I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:30:39 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37bbb36c990so27014101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767695436; x=1768300236; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=NsJJOzya3cvYihpIwq796R0nHpBIF37n18oyXT0fuvE=;
        b=VjqE9VmRW2OU07ibdrUEuPCzFynX8ReHtxk+93q7sQ1D8DZBMJNBdeONxsWkgfJxfi
         x0jP8qBA3vBGPwRAOr1NlNfVvgYUVx6zhaPQ4dm4xSDaHMGnOIIg2OuS8alZgvN4IWgm
         n4WitUVacGSZ7bYLNDQXEAJ+Y5UHxkbL8IGH4tG0r4X+h9tORial8Iq31ks3eTip8LkH
         iHqK+RbpwOUSwdZ4SypKj7M8tHy0dL0Crr2osuppvjS5oXORZ9/dWTioHm2kqNxQqz18
         JLQIZbIk65jAlyi34VvDdc+mpwr5dwf2Gc6ATQybPcOn/K+o+vOzDmlgA9kAAMYG6IGb
         kdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695436; x=1768300236;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NsJJOzya3cvYihpIwq796R0nHpBIF37n18oyXT0fuvE=;
        b=VEzEK/sQKkNtbyV7Hyr/u+bAYaGflcyit0M25aLb6G0LfPi4hi2j0zee/j4YzRW2pc
         1qTacVI0P5JqpuQa9uaTQMnZzXcdoxCWvk0r/7Aq4+ICUMQjCJhQvQa/sQ4rxfXa08si
         nd3Brd81cEDkb3nZ00EBKP4jpKYbQgAodAbAc0j3o4jnx2rPVJhkacPlMsuK1BooB3SN
         evL6ptH7RnhHfe0JASC1BGlp5Za0u7u6M7IT5EMDoG2/Za/nk/Kp52EXf39bq5yIFglP
         pZ0cVX4TybwxfjppjiJMWA8BdfxV+gKZ1SbJ/wMhVvvsyAdOWzdS6iy6LbHDTraVgpuP
         BvMw==
X-Forwarded-Encrypted: i=1; AJvYcCXY1UCbOOHAIvhVg86z6j4WD3wYSC6AnR/N/fPuoPPPgPy0OPGFa/MTU6uO6yCkBfHVB2En/vcHZ01DE7xkh+Oo@lists.infradead.org
X-Gm-Message-State: AOJu0YwxR97uAIDmnnXzyzRCVBBR7TQCIDEA2Lc4K5Jmm+0tEG9wnvnF
	trR8RBtGPBHqOFcMs1ctsixX0UXGpowsc7uY8fNGkSWqHCVTFgSdurqM
X-Gm-Gg: AY/fxX4Ymba4IeVfzA0iZYcEERbnFw88NMZUDiqc9+QNC0bkU0dEf7dv/KaVlaVorsI
	ZCcLabBcckMXuoI0R8dJMJOwRLHoqeBvPwkGYaVKPOP4vwCZ4R5abAi31VrQ4E0ehAMtTiJPo6E
	5Q4DPn7kjMQp4pdnDpvkYtoM5XZHm9aT5Rr8Qt5NYoWUdvxCxuF+2gsXEm4tOVivFDnf+40ah4b
	F1trFf1eto6vQk6cOVjBnPaESCqFAydKmkfN7DP0Esj8cCYFebgxNdrNMfYyr6E4SQ5P5OCMSV9
	IOimV6KG3/nGT1K8c2DDVnCz1M+SvQSvp9jvp8/WUXGlxBQAV+vY7z9oqu3kFyRuNwiu39uBKNa
	Cvb+2e57aUR1p06FFzaYzpaM6sWQEXWPQHAHjrPPjZM1fMmxm7UXPFfrs0h2ZSvqa/vSIpF/E
X-Google-Smtp-Source: AGHT+IFmb+80wkKZdKxRHpidfReqxOHlUmLsipFT1rzzTuNx9rKmNHYR/9f9tfCpJuYk6MXE4I4WOw==
X-Received: by 2002:a05:651c:1148:b0:37b:9361:711d with SMTP id 38308e7fff4ca-382eae68ac5mr6985121fa.8.1767695432846;
        Tue, 06 Jan 2026 02:30:32 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadc0sm4315921fa.33.2026.01.06.02.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:30:32 -0800 (PST)
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
User-agent: mu4e 1.10.9; emacs 30.2
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew  Jeffery <andrew@codeconstruct.com.au>, Bjorn
 Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
  Sadhasivam
 <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Date: Tue, 06 Jan 2026 12:58:40 +0300
In-reply-to: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
Message-ID: <875x9fuj7i.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_023038_332571_B46AC4B1 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Jacky,

On 2025-12-16 at 09:49 +08, Jacky Chou <jacky_chou@aspeedtech.com> wrote:

> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> Currently, the ASPEED PCIe Root Complex only supports a single port.
>
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Implement ASPEED PCIe PHY driver
> - Implement ASPEED PCIe Root Complex host controller driver
>
> This series has been tested on AST2600/AST2700 platforms and enables PCIe device
> enumeration and operation.

First of all, thank you for your efforts in getting this driver
upstreamed! I am trying to understand whether this driver supports
PCIe devices that have an I/O port BAR, where CPU access to I/O ports
is required for proper device operation.

If I understand correctly, this line in the Aspeed 2600 dtsi file
declares the I/O port range:

    ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000

During system initialization, the pci_remap_iospace() function in
arch/arm/mm/ioremap.c maps the physical address range
0x00018000-0x00020000 to the virtual address PCI_IO_VIRT_BASE
(0xfee00000). After this mapping, inb() and outb() calls work by
converting I/O port addresses to virtual addresses starting at
PCI_IO_VIRT_BASE, then performing reads and writes to those virtual
addresses.

What I don't understand is this: according to the Aspeed 2600
datasheet, the address range 0x00000000-0x0fffffff (which contains
0x00018000-0x00020000) is mapped to Firmware SPI Memory. This would
mean that outb() operations get routed to memory-mapped SPI flash
instead of PCIe.

It seems like there's a missing piece to this puzzle. Could you help
clarify how this is supposed to work?

--
Kind regards,
Mikhail Rudenko

