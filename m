Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f7CoPC71NMmToN6IqHyZ2J7Av/IeasabCIzNKilALHc=; b=RgVhqgSY55JG/p5WfMTT3Q0f8Q
	w1jcXEVNSW+FdMMsG6YnDMpbrKLlc2/j974G2Dk+D8em9tb52sNw3EENd+v9xCBWFqnMiwn8UmBe7
	oiw0dc0n1SVXz/WyKTMaNBJafocn7z4cJU5K/7RufamIgbL29QdFXVIoCW9wu2hCMslTlxcnHhvy3
	iHk4A7JbNHtTt0oyjTt3g5Rp99UqxoaOgCZ6zTvP8gazprP5Vi9X0Ze85mVGh/bruyqyqn4N7hpLx
	NMrgSghc6VOmScHfnr8CYNmMR6Dy/c6Bbeh2T/eHHrrZlLGymlhtd9SHEmPfUAUBxtrj1FTfC7UkS
	8acvjBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH79-00000007XBP-2Tr5;
	Wed, 10 Jun 2026 11:28:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH77-00000007XAD-2piy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:28:54 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so7168390a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090932; x=1781695732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7CoPC71NMmToN6IqHyZ2J7Av/IeasabCIzNKilALHc=;
        b=XBrFzYj1MbgSwshxgR1svBSZdpaupov9D+jIL0rGoJQob1xfLVTRAnSaknvKTMGaFt
         jhXh3B6loh0l1ckR7rJBeT5FBaW145DE+xwIkgdQn7izuY7N+PClkDB2gduZz9kCgJ8L
         23uGpH7psVNnebbc0JrBSxtBh9KSqdLomVz28Ps6PLQE7f+7vG3fXRxEiS1JeDhMC2H+
         2x1dcm/mmnwkyGt7iUw5LSvVTtgqDW/5r/PtSD2BYtt3HjIq9Rm9s71NbzkHw3Jg/dFs
         fiCxZMr16xqSbksOQyLxufcHJVuaHg2bhGfwMNRXMfLGEadrvu8jeuNQrmlC6r5xkbjY
         xmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090932; x=1781695732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7CoPC71NMmToN6IqHyZ2J7Av/IeasabCIzNKilALHc=;
        b=OC0GctpZl4ocAIyjUnQu/Dh899CTmJaQvsqivZl0bbb86nxiF7oFKMZZAY8ZeoF5dF
         UptArc/xhAUkwLUTdzTRVDuHUETcS9uFDYYRHFaEGqYIREJTYLzQ3R4Ze8CwECeMOUEP
         GSBMVa63E8dDvl9MCbfONextJ/rKXo6r5VCvVAqqJ3KMjZfQi1pDsr4KzoPi7ifTabMc
         W0syNnuUzRGXtXjG4dLdAz0926iwKRmvrTe9y9OXWdomcDPH0LgHAt02rhkhiC7Ertio
         IXiu+s1MPtQojtqdG7HZJzSgkAN4dlTWi9E/DrZAOgeyrV8Tk/mhyZAbxdAu1bkP9o1W
         nrdw==
X-Forwarded-Encrypted: i=1; AFNElJ8P0+W1LKUb/aiElDZ7X7T7M8vJdAanqeBJRrJOEqaRQfXdVoK9NP9jGc5saUmc1mAj4ih9bIX5sM2A1htBuprL@lists.infradead.org
X-Gm-Message-State: AOJu0YwEpg7Rks/FNVoDKT9uPPNR43t5QeyZazNxttZovpBspeYnWWwe
	cXvarQr8iXYFL2x3lbTtjHXkGziQqgvVWJtkRCaIlB95LC0p2vJF43mO9vAXR2hqe6U=
X-Gm-Gg: Acq92OHAcpIQVFo+edG4u4yg0SdthpQkW3MlPWz9meMKmonmAu8dUE1XJlTsIcv4ldW
	nRZBTlES7omLDivVMYEsT4xSZQvFMzi0fdZYpPVq7tMhPtHBNvZ9LsZ89/rG6+BtL2wA+sowdHt
	rQIYI8Bvg50trxwxv9OFWK6sQ90SI3kJv+OAJogCrNfFq9ytpSjGu7wA50cEQqx6dw4vRTYRRVA
	4PyeNArjcS3KJ2XkzV/DnGJvE0Avk0diTbf5Tq40+PBW4FIPfPLueo+lGdTHt+EjPPKToHHUbkU
	6c2N/o843olArFMIPAvhVIBdkUItK7KpBxha9iEd0c93+unGlZ4gLbk3dWSG4s99Y4lb9ZKDHaJ
	J3HZ4oBCj6bvVuL/phmFVnvbNJmcxp45NCi/ai5tyiFTR/HxW6wqyf4+44TqyFhCbV/JxdmHlUj
	HDs13+oEzWUplhV7DkCgmRHpSqHL1bSBq5w8mAKYhiv1uk5eRebHQJmw==
X-Received: by 2002:a17:90b:2741:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-370f0b55ebbmr27067763a91.22.1781090932289;
        Wed, 10 Jun 2026 04:28:52 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:28:51 -0700 (PDT)
From: Jason Li <jason.lee651024@gmail.com>
X-Google-Original-From: Jason Li <jason.li@cortina-access.com>
To: jason.li@cortina-access.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and platform support
Date: Wed, 10 Jun 2026 19:28:17 +0800
Message-Id: <20260610112821.3030099-1-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_042853_717770_B921A9AA 
X-CRM114-Status: GOOD (  14.08  )
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

Patch 1 adds the DT binding schema for the UART controller and the
top-level ARM board binding document for the Cortina-Access SoC family,
along with the vendor prefix.

Patch 2 introduces the serial driver (serial_cortina-access.c).  The
UART IP has a simple FIFO-based design with a single interrupt line.
The driver uses uart_port_tx() for TX, handles earlycon initialisation
when the bootloader leaves the UART disabled, and provides a TX FIFO
kick-start in start_tx() to work around edge-triggered interrupt
behaviour.  Clock frequency is obtained exclusively via the clk
framework.

Patch 3 adds the device tree sources for the CA8289 SoC and its
engineering board, covering the minimal hardware description needed to
boot a kernel with an INITRD rootfs.

Tested on CA8289 engineering board; console and earlycon both verified
at 115200 baud.

Any feedback or comments are highly appreciated.

Jason Li (3):
  dt-bindings: serial: Add binding for Cortina-Access UART
  tty: serial: Add UART driver for Cortina-Access platform
  arm64: dts: cortina-access: Add DTS for CA8289 SoC and Venus board

 .../bindings/arm/cortina-access.yaml          |  29 +
 .../serial/cortina-access,serial.yaml         |  46 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  14 +
 arch/arm64/Kconfig.platforms                  |  10 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cortina-access/Makefile   |   2 +
 .../dts/cortina-access/ca8289-engboard.dts    |  31 +
 .../boot/dts/cortina-access/ca8289-soc.dtsi   | 118 +++
 drivers/tty/serial/Kconfig                    |  21 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/serial_cortina-access.c    | 755 ++++++++++++++++++
 12 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cortina-access.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
 create mode 100644 arch/arm64/boot/dts/cortina-access/Makefile
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
 create mode 100644 drivers/tty/serial/serial_cortina-access.c

-- 
2.39.5


