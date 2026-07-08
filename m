Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BCFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6E2M/OW82zq935Lg7IK8OFbhLBXo8GmRMpNDGq8g+oA=; b=LowxWb3Banj8929PiDYsE33bYi
	elqSsAeG0CgrPMR6lUHUYo44jrVSowiqsjESnL64SO2opKHfES2JtXE6B1EWlARxnmrAU5BHhR5D1
	gRrBrs1QJ8dNC8LYUOHJ2YpaIyRBwYEUGUWiErHiwnITwWgEK5SfYCUgiXsjcX8u3xGvP9l47UNR5
	aoChEXBXtVMfzzc3i6wpDRkCgKZCyJlL8Uv+ofhwwnfunBU03nz9U8DQRR6PyqcqIsG3atH+Khqtl
	oIIR63FFVokryX/Mb4qANhocYHbEUxG+Mca2iHeaxi2PgnUAXnNfUHQDwhXC+fK9vFGFv3HDSf2ej
	9JhciVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUM1-0000000HUoI-0NXw;
	Wed, 08 Jul 2026 15:38:29 +0000
Received: from mail-wr2-x01.google.com ([2a00:1450:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whULy-0000000HUnW-0WuR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:27 +0000
Received: by mail-wr2-x01.google.com with SMTP id ffacd0b85a97d-47301772842so271200f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525103; x=1784129903; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6E2M/OW82zq935Lg7IK8OFbhLBXo8GmRMpNDGq8g+oA=;
        b=WVL+8vSO3zBeORRSnmdUb0XgpIqDHEck7MMu0y9FCxf/JOL3Mv6NmSjRZoQ7qCz17L
         xgs+/Okm0wek1bsZWpERnWjyYdFHwUTx3YY3dS1Hx9yOLChGPGX1Qrca3lIj6EzDpLgR
         fgJGMQLs0JhI1I6Jelgn9sWC6K2ThqLZBTYxjS0plzCDpuUw/Yt+auAJC0h0TsGiY2tC
         18gybn7aDniXWTGKmIvxrCBgKN1+nHhoS9FawSmVoJBU3tpLro7HIWdThaOh1ojNqhw4
         DwwCxkYFbP0j+hehlt2KiwRLmkqXX7fJOHM6qaP12t+hbpGqjYuQE7p/2VidaEGeSaXu
         7cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525103; x=1784129903;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6E2M/OW82zq935Lg7IK8OFbhLBXo8GmRMpNDGq8g+oA=;
        b=tCsuFVluR0om0zU1fwPKbVg5rTcb0TDIvwreJU7sduLpiZoNzZKLvpASlRQvpT7T78
         S74dAmUuM7PNhFMh4o5QIocoqo5L5p2wTTQvdCltWQTMViTDO/+fN6+TVyD3q1rUe0K6
         MtXaYJnr75VZn5YXPuDDflQ6MQNexiWPLG204rgoJy129AO3oyopQ0HRto+btCzRFZxu
         l4LBOd1dySaNMeEMBVQ6rpqeMpduHl8sF9vDxe0gM1U2LAjQRKrmeJjkDTg21hDU9ddS
         cyfsMByYzJN5/vbucQmFbu7Ai6V4Rch2U0ia80vb2whrxjH0b5axD9wlF+FLKI05pzwJ
         bCZg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7oETW0oHxo9IO8JIm6UpkwuqPnoVZ3UlVSo684XhZ5Z6IdlvH+B9/bOe08l2c36ReZ5TPR1fWGzNySqbaIyK8@lists.infradead.org
X-Gm-Message-State: AOJu0YxSV5g+See60JaR32R3wOZOPmu0vlZBPFRQh/PzYWdijPpvIqqM
	HxPrerWHP0w3OozSUPe2wLf7hT3aVFm7OrZ7eybwncWjwXzfpK8GCRucxR/8ij4PRRw=
X-Gm-Gg: AfdE7cmAaUoTaRazFvrxaT8Kmh/sGf5qxmASXu7aDtSe4nRLv+Y7qVffTU74PlEbcNe
	ZcyGRTS9LYrotHUqCxt4I2JdVTodkFQw1ECICnxG4XqfS7HH5neUvSG6ths8laJRlRe8uOqS5AB
	Q+4LS0tOP7M507qQrvSHE90y136cM2q4fwG06J41WUvSds7oqA+LBA/n78rTTG9gLq/ds7nMRtk
	PWpEYXZM7ndMZemxlWlLPJiX+7HZq2T0TCqGCbtI3foD6sLHQdKgokO/0bMF/ATbBp6dccYPGY9
	enBAJRMg7TSR63acQq528ewWpOXdsy7AMgu+pQcs1xGt9LenPaHje1JlbrqG+dua3xwM0MY2+qk
	jdfD4Y11fXkMYaSZhwSgwPfR46nHLykDOcfCmPrLeIYmwxE8rV3WcLQRlk/03F//Odd/IeR91nA
	Xt3fAad0vOrK+ATK8YB+VjB8dhfDtMHyphNrdLYR1WXv0P+rqhPB//Wd1Vtw8DTRgHzTkEteNqQ
	chesfN9bDz+lkoPtBJoqy2L6AXK
X-Received: by 2002:a05:6000:1ac5:b0:45e:f302:95b with SMTP id ffacd0b85a97d-47df078ba55mr3258189f8f.37.1783525103272;
        Wed, 08 Jul 2026 08:38:23 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:22 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 0/7] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Wed,  8 Jul 2026 15:35:52 +0000
Message-ID: <cover.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083826_298413_45CBA1C9 
X-CRM114-Status: GOOD (  27.41  )
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

This is a v4 for upstreaming the VUART over PCIe BMC device driver.
The initial driver is from the ASPEED kernel SDK (master-v6.18) [1].

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The virtual UART is an 8250-compatible register set.
On the AST2600, two VUARTs can be exposed over PCI via the PCI BMC device.

The host cannot access the BMC's memory. Only the exposed features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality for a communication between
the host and the BMC. More information can be found here [2].

The v3 and this v4 mainly modifies the BMC driver and focuses on VUART.
The BMC driver is now incorporated into the '8250_aspeed_vuart' driver.
A specific flag can be set to indicate that the VUART should be used
over PCI. Several changes have been made to the 8250 device tree binding
and the 'aspeed-g6.dtsi'.

This v4 serves as a resend of the v3 while applying Krzysztof's review.

Changes since v3 [3]:
- Add the aspeed,ast2600-vuart compatible entry to the '8250' DT binding
- Add the aspeed,ast2600-vuart compatible property in 'aspeed-g6.dtsi'
- Add the aspeed,vuart-over-pci boolean property to the '8250' DT binding,
  only for the aspeed,ast2600-vuart
- Add the syscon phandle property required for aspeed,vuart-over-pci.
- Add the aspeed,vuart-over-pci flag and syscon phandle to the vuart3 and vuart4
- Cleanup the VUART over PCI code in the '8250_aspeed_vuart' driver.
- Further cleanup of the host side driver.

The host-side driver is still in /soc/aspeed/, as it is very specific to
this SoC for me. I didn't receive any feedback on where to put this
driver. I can, of course, change this to the relevant location.

It's important to consider that the host driver will do multiple
functions. The AST2600 also supports LPC over PCI, with a specific KCS
channel (KCS4). This driver should also be used to enable the IPMI
automatically via this KCS channel. The UART and the IPMI will depend on
the same PCI resource (BAR1), so this must be configured in one driver.

As with v3, VUART data flow and MSI interrupts have been verified
working on the test hardware.

Tested on:
BMC:
- Asus IPMI Kommando Card R1.01, AST2600 A3.
- OpenBMC
Host:
- Linux kernel v7.0.0

This series only supports AST2600; the AST2700 is not supported.

Same as v3, I would like to know whether I should add the 'lpc-io-reg' and
'lpc-interrupt' values to the vuart3 and vuart4 nodes directly in the
'aspeed-g6.dtsi'. The host driver is not capable of finding the vuart
address on its own, so they are hardcoded to 0x3f8 and 0x2f8. It will
not work with other addresses, so perhaps they should be in the .dtsi to
ensure the correct configuration for the 2 vuart over PCI.

For the interrupt number, my test is working with interrupt = 0
for vuart3 and interrupt = 1 for vuart4. I don't fully understand how
the silicon routes MSI numbers to the VUART but the following
combination is working :
       | host MSI idx | BMC lpc-interrupts |
VUART3 |      16      |       0            |
VUART4 |      17      |       1            |

The original ASPEED driver used MSI index 15 for the VUART4.
I tested every lpc-interrupts on the BMC from 0 to 15, but none of them
worked with the host MSI index set to 15.

For me, the silicon only routes the MSI index 16 to VUART3 and 17 to
VUART4, and the lpc-interrupt needs to match the 4 least significant bits.
I might be wrong on this explanation but the data path is working with
those numbers. There is no explanation for any of this in the datasheet.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1782224059.git.gregoire.layet@9elements.com/

Grégoire Layet (7):
  dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
  dt-bindings: serial: 8250: aspeed: add aspeed,vuart-over-pci bool prop
  serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
  serial: 8250_aspeed_vuart: add VUART over PCI
  soc: aspeed: add host-side PCIe BMC device driver
  ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
  ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 .../devicetree/bindings/serial/8250.yaml      |  46 ++++-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  12 +-
 drivers/soc/aspeed/Kconfig                    |  15 ++
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-host-bmc-dev.c      | 174 ++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c   |  87 +++++++++
 6 files changed, 323 insertions(+), 12 deletions(-)
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c


base-commit: 564edaca14861ba9e58d4e646d272c677296d285
--
2.54.0

