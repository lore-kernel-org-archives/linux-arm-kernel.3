Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A15CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F8x/z/Nkqrr7H/Lu9hfS6HH6GDSoLC2Q3m41soDjtO8=; b=dMRLz/5bw3GaOF
	7RN6hy9nKmvOKsbPDFqnmrlUiYCoSva9VPwg+djJgDl5lPmdU+rFCjKJaCpWoikiiipmpcg264bU1
	EUYwy9nTd/E4HYPAk07a+C2HQVzoE5Fv9bfDdoc2UbrvOIL+8SfSayQJYh0aXBwOj1qiZgf74YPp3
	dmxnRA53VfWYiUm3EYvOrGXcMq+3KvdYg/Cdd5/y/bi6ln8crkdqLHyV8xvWTFlj11dI0jt7o4ol1
	Wymsc1FlAX718phuNbMBLH3XYILrkNl+r3enbFgrB3zpXn18qGAOe62sNZiW+ktPCGyzc+m3NRP6z
	cxdVh2qeSN1UiippkY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4PZ-0000000CpOu-3GmO;
	Fri, 28 Mar 2025 07:45:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Np-0000000CokB-1XSP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54957f0c657so2080006e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147843; x=1743752643; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8x/z/Nkqrr7H/Lu9hfS6HH6GDSoLC2Q3m41soDjtO8=;
        b=Z5ZzZ/ukLIHfgelZS2+e/w9R8F7vehxjF8sgihDeML12xNPyrrCivX0jm0vzfaTXiB
         pI2nhyOkg51r5u2jp3KzTvVrP++HPEmJLricUZl7z2UQthEYp17vnPP0EEUPZxO1kGrm
         ro0ZVq5qKIH89PEuE6cEtzHVi+MxGIWEuQ0w/pghIAlhWWKIOKiL/g/efT34mdck1dcw
         pPCfOELhTeBajHx6Tpa7RqSEpVPeEJb9Z9AunqhqCyoLg2K8VCTuzI7Q8w+DcXEPswew
         XeBVHssDElGVPGrCyURTdPifmQKtoH9EjkjkwcbO9wJKtq4j3wnrrFEYHu9dPSy1kqyT
         tcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147843; x=1743752643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8x/z/Nkqrr7H/Lu9hfS6HH6GDSoLC2Q3m41soDjtO8=;
        b=u6OmyICkS89EM4z86wFeBn8jm1Z2IjPN5crqFc00krb8psJdLT3DF9uKwb9eCUhzBb
         DwevsTzyXCg5/NUzyfLWWMSt8OrZ2j/hpccm0uf0RATOL93LxgRziwBWfWO18r4FhOVt
         aHy662GZOgoEQOFtZ777KyYGmQIY6z3VITEpDrF8HhCnUhMH00CES5bSnF6cZdOXjp+i
         zNf+vwXoTWmyqml0gqNcCcpslPuRC5gavNIUjKa3XUVk3Cjy8w7tyZTdTNUeeTfUfRoE
         a4abzhoXFs2iqye6L36iKdg/j5hRxgAlcPYG5YvjBe2TJzaIwP1QJ+CU4iut3OI7vcJc
         bogQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTNEEU5HlZ/b8ijxfIq7Y2TkU8W3Fm1Op3EVsJcCKGWXghvhfHrFQHKj5yuRQug8MJbQLWD3QJ+CFEyHwKijne@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwxz/rYS9HXeR+sK5tUNWqgCyb/iDPTDSeRD145D5HOr94EEZc
	XjY57zB7/CP0/5y8ZJBeQHb2G2VkLLkEJ5M2xqPULQ2VZctt+4NtXOiMGqI4ozk=
X-Gm-Gg: ASbGncuQYIfAx9GFezKlh15xgjHlJsIUlmm+EEfUIIL2ngq00D5U/pWdb+Ef1nKFbhD
	o/XdvosgUWINw8jhlsikxpJ2lZuJL4S7+PZtJxEdtaRFQLulcQB0pD7fIXX5LM0VHDoDpH5EvQB
	MQ7hoaTu3KKwmyfBc1/OC4TYD7f09zuh49c/sZsD1ImufjJiNZkwY4342+HI5JRfmTcRYs1tAEs
	iLaEge9PKcTsjWHhGWqkvSxQ/9asGvZT6SOGoQL70QjHy76cvbop1hICqfTpSUQi580qb5D5J4o
	vyQwVartPcpXzXu35PDt75q55QR3vWbHY7hmotVLMTFLTnPjg/yqpmU=
X-Google-Smtp-Source: AGHT+IGwOpwq5nTctC/xlT0Ki4waUjHwgO55lfPawCG5kxZPMW8PL2t6IaqM0EloVwWDIeWXGrpXDw==
X-Received: by 2002:ac2:51c7:0:b0:549:9813:3e6b with SMTP id 2adb3069b0e04-54b0ad08976mr814131e87.0.1743147843127;
        Fri, 28 Mar 2025 00:44:03 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/12] ARM: bcm: Add some BCMBCA peripherals
Date: Fri, 28 Mar 2025 08:43:50 +0100
Message-Id: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdT5mcC/x3MSwqAMAwA0atI1gZqigpeRVy0NWrAT0lBhOLdL
 S5n8SZDYhVOMFQZlG9Jcp0lmrqCsLlzZZS5NJCh1ljq0YfDB4exsLixuj2h0wPnxduGTEu2s1B
 wVF7k+cfj9L4fFwvIjGgAAAA=
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
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_004405_417789_9B434F05 
X-CRM114-Status: GOOD (  17.52  )
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
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 120 ++++++++++++++++-
 11 files changed, 1030 insertions(+), 9 deletions(-)
---
base-commit: 8359b1e7edc722d4b1be26aa515041a79e4224a3
change-id: 20250327-bcmbca-peripherals-arm-dfb312052363

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


