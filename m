Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1339C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4CdrV4Ee8NZHiWicfEBhecLPl2Fi4hX+Hn0hDWKuVUI=; b=EoNO+lfIIK8LvD
	Up6hmbWJuV7WmpzPsvBcMaPHSmlQU3QvDv3a+OvsXsbndHSd1wsBHMI7yT2m55F9wyj5LfaZdwCrC
	wBEojOBAPst0b7xj64DWEF4AlTHBfYnjrmCmfUQRvWth/eR9wS5UuykWliDNm63A6Os1bOcCKZB+K
	Op2MZVgqd5O+34/f8bagQLo39gYPokLrZmoG+wvG9gr9YcUUohAmg0BBCilFMlZ255cxG9khdGBoN
	Yz539Lf6A+RJedu65BKPUp8L/QdO6yCdi+aUZ8C0cYtqyHFfVnqdAZpmcu6tmJVr+FuxotQUJAFUS
	syHk3sOqp7CneD1+ze6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1S15-0000000FUOT-34AA;
	Sun, 06 Apr 2025 15:34:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzK-0000000FU9h-3p59
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-548430564d9so3970842e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953564; x=1744558364; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CdrV4Ee8NZHiWicfEBhecLPl2Fi4hX+Hn0hDWKuVUI=;
        b=xHE5Xi7rmWSGI1xKCP4EK95aSrLHygPJamRzWtoSNxIeibE1XG1YwGe7LKjHGYz3g7
         xbCzGZRcSPtjgqg35vw+glCuWHJvnC0PtnYZclhL5d6FQFbPknMkeaFpLojPvq+sQCiv
         gTfC+3liPhEguFRbmVU83pry6PLpv6r94wNz/nd7JkslJI5vakmBekmfpCDhqO0c5z1b
         NOr3GCDCcswm/uAvAzXM+pk5bdi2p5wD8KytLWrpoWcL7nyeQoNk+IrIDEYPMQbDVhN7
         3td/YLXrlHCPBgUKyKeLTYsxGZf6hRqI4EtTiyv3zHDHZGdx0r78AbQJqrIUDeEUCa+F
         Z6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953564; x=1744558364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CdrV4Ee8NZHiWicfEBhecLPl2Fi4hX+Hn0hDWKuVUI=;
        b=jU13d7bQ60iw4gMFakLuNMTnHFYW/fCP8vgTZbXhJuxF1HqrymjhX+t7SiVn3hRnNS
         bbXq8pBpQsJirxu0f7t1Ej2HSfZyu8Xi5FOhEls23f6UV5rsmFtRFGONhOVz0yyahQTr
         vMpltYvQF7CP5AfmtJamKNdktp/UPUEorDSTc+skacNVu9sK+R/bxZW/lkLfTZ1bDTGM
         icq5zvfosQzTqHqfxUZwKdFjzIoH3IzOrlDTPzq34d7lgebzEpUNPwcXZmawoEMF0oo4
         kIbuu1DGhge8DaNhAYSMJHYDSDd3DyKyYmPNdtCXkgYxnRdLaWI7Wx+Qbc+YW/hBYeun
         N2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH34+KKXwGTNMBroJra7hQrhCDDHaKQJUHAjTE/UCclL55YR55CcX4ScdsrUmahId11hcudF/j6j/PQRIMzCpe@lists.infradead.org
X-Gm-Message-State: AOJu0YxjcAy7Hk2U0fcbbyebnFMSRQ3fIfjjf37PUON77jKm7obaoh0B
	TcWrzgAQ1bvnF2Tbpb5wDkf+OfzqAnZraOdZCNa4W6pMsc2Gs8zn+q7mDmbgg4g=
X-Gm-Gg: ASbGncv7SvlLkQxVksNKzw8jQR68LktfpZzsWE3XBSHVU8eDMKzAtx/5p8M/d6hZ3Kw
	8qbTjHgn4U/uCmXx2cv0or1n+v+th9zgGt15ylBHXW5nxR5RSzhhZ9DFDCWuI+4bG/GdcKXbBJc
	hXOvVeODYgDq31FXy4Y3bxmIPLgX0xKaHs5Ll+G3CkdriG38TxZeB79SPOc3jodpBeAHs9a0NpE
	6VTBa3Sb/3ufrZota1XtDtNgi4KuK7so0hRgqCrhHHiuGjXZFJCNFnrE0KfXLT1aslZjuoqSo7S
	wNeLvCo7y4Nyrcka58oiGKs+LrNz6TfIDwZHbbt8QWVA6lG64LAQvv4=
X-Google-Smtp-Source: AGHT+IEMHKYs50VUiFzJJhPb55V1nqrOulEUzIjHGG1eD8uKA6HQzfi4EyS5Z1ub10c0zQJ8J/mcug==
X-Received: by 2002:a05:6512:118d:b0:549:6451:7e8c with SMTP id 2adb3069b0e04-54c2984805dmr1640715e87.50.1743953564304;
        Sun, 06 Apr 2025 08:32:44 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/12] ARM: bcm: Add some BCMBCA peripherals
Date: Sun, 06 Apr 2025 17:32:40 +0200
Message-Id: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJie8mcC/3WNyw6CMBBFf4XM2jF9WEVX/odh0ZYBmgBtpoZoC
 P9uJXHp8tzknLtCJg6U4VatwLSEHOJcQB0q8IOde8LQFgYllBFaXdD5yXmLqWhpILZjRssTtp3
 TUgmj9FlDkRNTF157+NEUHkJ+Rn7vP4v8rr9k/S+5SBRIJzLStP7qan8fw2w5HiP30Gzb9gFLA
 zCzvQAAAA==
X-Change-ID: 20250327-bcmbca-peripherals-arm-dfb312052363
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_083246_967879_332FC38B 
X-CRM114-Status: GOOD (  18.28  )
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

This adds a bunch peripherals to the Broadcom BRCMBCA
SoC:s that I happened to find documentation for in some
vendor header files.

It started when I added a bunch of peripherals for the
BCM6846, and this included really helpful peripherals
such as the PL081 DMA, for which I think the most common
usecase is to be used as a memcpy engine to offload
transfer of blocks from NAND flash to/from the NAND
flash controller (at least this is how the STMicro
FSMC controller was using it).

So I took a sweep and added all the stuff that has
bindings to:

ARM:
- BCM6846
- BCM6855
- BCM6878
- BCM63138
- BCM63148
- BCM63178

ARM64:
- BCM4908
- BCM6856
- BCM6858
- BCM63158

There are several "holes" in this SoC list, I simply
just fixed those that I happened to run into documentation
for.

Unfortunately while very similar, some IP blocks vary
slightly in version, the GPIO block is differently
integrated on different systems, and the interrupt assignments
are completely different, so it's safest to add these to each
DTSI individually.

I add the interrupt binding for the RNG block in the
process as this exists even if Linux isn't using the
IRQ, and I put the RNG and DMA engines as default-enabled
because they are not routed to the outside and should
"just work" so why not.

I did a rogue patch adding some stuff to BCM6756 based
on guessed but eventually dropped it. If someone has
docs for this SoC I can add it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Pick up Krzysztof's ACK
- Push the BCM6858 DMA block into its own simple bus.
- Fix GPIO node names and registers on BCM63138.
- Fix GPIO node names and registers on BCM63148.
- Link to v1: https://lore.kernel.org/r/20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org

---
Linus Walleij (12):
      ARM: dts: bcm6878: Correct UART0 IRQ number
      dt-bindings: rng: r200: Add interrupt property
      ARM: dts: bcm6846: Add interrupt to RNG
      ARM: dts: bcm6855: Add BCMBCA peripherals
      ARM: dts: bcm6878: Add BCMBCA peripherals
      ARM: dts: bcm63138: Add BCMBCA peripherals
      ARM: dts: bcm63148: Add BCMBCA peripherals
      ARM: dts: bcm63178: Add BCMBCA peripherals
      ARM64: dts: bcm4908: Add BCMBCA peripherals
      ARM64: dts: bcm6856: Add BCMBCA peripherals
      ARM64: dts: bcm6858: Add BCMBCA peripherals
      ARM64: dts: bcm63158: Add BCMBCA peripherals

 .../devicetree/bindings/rng/brcm,iproc-rng200.yaml |   6 +
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  79 ++++++++++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  64 +++++++++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi           | 112 +++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   1 +
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            | 127 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            | 120 ++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   | 122 ++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 150 ++++++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 138 ++++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 127 ++++++++++++++++-
 11 files changed, 1037 insertions(+), 9 deletions(-)
---
base-commit: 8359b1e7edc722d4b1be26aa515041a79e4224a3
change-id: 20250327-bcmbca-peripherals-arm-dfb312052363

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


