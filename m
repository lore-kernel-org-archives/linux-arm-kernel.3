Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1BC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=; b=yy/HbPTsBHq2YOZVg4eFft985v
	q0ZWGoPDljCWx84fljbNuJBZ0Vobg6akGG3QiHdN0PsnSEZJRkYM96udZc5c0mF3P2RPDJWk10Avb
	dEgYIaqIqb+ivNtdWe1jav8ajCepsx3dOIK7C7PsMScPwGdBzA2Y29pBlqOYIDWZB2wMx4jOFCXY1
	u98MoItBX4f7+tFtLjU6nE3lbvYlRJ+eLJQTb8hHuIAgLVnOvzRrlUKVguasf0aYnDdIUNWKjbpm3
	vbzRP3ZC/snG+aZ+1C1qOKgxSD+8zNFV5B1S4INJnZ9umgy21vgFaYFHWaXEvd0U2XHjH+UNkZbKL
	dRN9s4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrabo-00000003t4h-3fy4;
	Wed, 05 Aug 2026 12:20:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrabl-00000003t3a-0orf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:20:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso5957825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932427; x=1786537227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=;
        b=ADmpxOPu+tFurqT1oecDGYs+pMPCT2GV/+EU+P2juAqtir3DPZfU8arM8Cq2HKAPda
         YR6KkIjSz8fADBUl+kRkHJPl8iuryseaO7A4kQY2w38aL7lRqij/JdSWXj21Zlux75k3
         xM6rHu+YMmD7c1BSCU0iYLv8ozJtel4GtAlIMmwwN4PI70vrxWPxs9v0qsgZ8a25sNQZ
         vK4lUMQYkekQUE9TcQfX1x+OTAm2muSDte4qQtVDnSETFpmlZRFAe+Se+huRk45DXWvw
         Oq1UOUvS0ZGswmgszNYXRarw+b7eyPMYXdaGH3/ozd8n2esLONp1sHeNOD82LeKl5S9o
         AE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932427; x=1786537227;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=;
        b=sy7vOykAV+ph+TvATLtxaAQcuD4fdSIiJVmjm1iGbBdDQvQyhWvN8nGCcIK+noATUk
         AmbuYVcfQxgJrF8WXwUYftqqpb87G74zdiApIrQk+oDXT/TWgIab0GbXyOf2PBYwfryY
         AgYY4+BPs0jzFqcvjvbZZV4HIQAdW5clrUQEsy8VwB3H7L7UBv70P/5TGsWl6lXVDTbl
         v8uH1lF6cj0If29TEcaaB2UtB+8D072m25OiG/1oLdoUxU2NPnG5oLJti1qc56OmePX4
         2IE+wTw3oeHUgeblUBIPPHyLsqrpwtLdzcMmIpYDNI/kJxEtuvbvAMRu51I14ERQ+ufG
         kkfg==
X-Forwarded-Encrypted: i=1; AHgh+RqiQS27aGtZWB2HcDmsr1cenAzZSxLknFwBdXeAAsV4ZxbUg7tC9UDoC+iQYp45rMNJXb3kBDfpZqhqwEPJeC3v@lists.infradead.org
X-Gm-Message-State: AOJu0YzRFLWiUk/11Lc6xP5IJvupFzmhY0Ud+JyPaQzl0e3x58zVHTap
	JXDItk/iDvEdZ/zCpHpVQY3rhYkYKa7j+GfpKzvUcas08RL/4Ds7/xi6nY5+et/CgyY=
X-Gm-Gg: AR+sD11Ye+PMLxr4WnW1fXYzpkm9nT+VUhduhDo11lB/vtBN+OAoCTzQj7mJTkwk8Kj
	UYdRcQNRfITR0BWapD1523DzjMb7xC4x2EprxncJJyOgtDZAgU1h+U223/sja52EPBJJQlLfeYz
	SAAZnt1QKvApqGuMUL0wXXW7+9uNshTfoZphOnqMfpkq4xHnwTu/tcy/JJvhAB0jnP19DahpytO
	+fG0Mp2ns98JEnFksgs1HjozjplTp3pEkCRyee8a3Mgyq1LVCsvIAq/WlTeKPpFxBTex6x8HzCn
	cVV2PeJ0/Ug+e9NiZvufh3jp7ifggISvxHT3sbEKNbet7+4PJByh3yRlbpyFFfQEToLNiB/pcQf
	pMB0yA0DoBH+hf3ZHiNgV9u4Fgm8twEVNBZ+xOSOC8egl+Cz/RVS9K0jT3eugQQ4MoRZVqePsgc
	nVGLrfk83Mnv918+WOsxfza7HU9bKk4KTTnfYI7dlzzABr/fkxlu+P2z5wv36djtXYC9YLNjtiw
	I48PQzPWVXt/KE9e/ZSihqs1TtaRHWsfBudXyI/TZHD0ixikFacplnuCZQ49hlF/F2Pt3aSPhKh
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr76610975e9.11.1785932426940;
        Wed, 05 Aug 2026 05:20:26 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 0/6] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Wed,  5 Aug 2026 14:19:47 +0200
Message-ID: <cover.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052030_156129_49C219F6 
X-CRM114-Status: GOOD (  20.73  )
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

This is the v5 for upstreaming the VUART over PCIe BMC device drivers.
The initial drivers were taken from the ASPEED kernel SDK
(master-v6.18) [1].

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The virtual UART is an 8250-compatible register set. It is called
'virtual' because it is internally a simple FIFO.
On the AST2600, two VUARTs can be exposed over PCI via the PCI BMC device.

The host cannot access the BMC's memory. Only the exposed features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality for a communication between
the host and the BMC. More information can be found here [2].

Changes since v4 [3]:
- Squashed '8250' DT binding changes in one patch based on Krzysztof's
  review.
- Removed 'aspeed,sirq-polarity-sense' support on new
  'aspeed,ast2600-vuart' compatible string as it's a deprecated property.
- Renamed 'syscon' to 'aspeed,scu-syscon' in '8250' DT binding.
- Cleanup in BMC driver:
  - Changed bit 14 to RESERVED macro
  - Changed macros ordering
  - use FIELD_PREP macro
- Cleaned up of the host-side driver:
  - Removed unused INTX. Only use MSI interrupt.
  - Proper use of dev_err_probe.
  - Use of 'module_pci_driver'.
  - Used managed functions and simplified exit code.
- Changed the host side driver location:
  - Now in driver/mfd/aspeed-pci-core.c
  - Changed code to use MFD cells.
    VUART are sub driver of the core driver.
    This allows for easy expansion for KCS support.
  - The core driver now only sets up MSI interrupts and
    instantiates the 8250 sub-driver.

The host driver will performs multiple functions. The AST2600 also
supports LPC over PCI, with a specific KCS channel (KCS4). This host core
driver should also be used to enable the IPMI automatically via this KCS
channel.

Tested:
As with v4, VUART data flow and MSI interrupts have been verified
as working on the test hardware.
BMC: Asus IPMI Kommando Card R1.01, AST2600 A3 running OpenBMC
Host: Linux kernel v7.0.0

This series only supports the AST2600; the AST2700 is not supported.

The findings regarding the MSI interrupt numbers are explained in the v4
cover letter [3].

As with v3 and v4, I would like to know whether I should add the
'lpc-io-reg' and 'lpc-interrupt' values to the vuart3 and vuart4 nodes
directly in the 'aspeed-g6.dtsi'. The host driver is not capable of
finding the vuart address on its own, so they are hardcoded to 0x3f8 and
0x2f8. It will not work with other addresses, so perhaps they should be
in the .dtsi to ensure the correct configuration for the two vuart over
PCI.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1783524645.git.gregoire.layet@9elements.com/

Grégoire Layet (6):
  dt-bindings: serial: 8250: aspeed: add ast2600 and
    aspeed,vuart-over-pci
  serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
  serial: 8250_aspeed_vuart: add VUART over PCI
  soc: mfd: add ASPEED AST2600 PCIe BMC device driver
  ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
  ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 .../devicetree/bindings/serial/8250.yaml      |  42 +++++-
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  12 +-
 drivers/mfd/Kconfig                           |  12 ++
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/aspeed-pci-core.c                 | 120 ++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c   |  92 ++++++++++++++
 7 files changed, 280 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mfd/aspeed-pci-core.c


base-commit: 253b1036b9163f23f7b18274a0d4e904ac8821c5
--
2.54.0

