Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C35C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eqq9EOpsvH4cCrKKHdoK8XIb3RBbsUtuMBaIr9hLm9M=; b=W2Ec7DadjQx9mh
	VOxhkKuV3lGx47jTctIkyudNoB+TrW51q1QOBEpww8+vhHTW+DVJJNpXDUh/SkMRnamxuMCM5jeqG
	BVIj7ju741QJY+0yVWN5ehYVyD9GC7zMh8GKNVrncDb1zgYZ21bb1CJPvY6r4vHIRFhhjvhhlDKXF
	R6zGMtbdhUedtwrsdIhApK/B9GtjCMU6EIzws1kOTaxBqLTkyidgnlS/JYDRbo7EDDga4ILgifw/N
	+AP1mW11GnpXydhg77P8DqcyOap60mVjzPAc0HaaL6dsXVUTSM9CbTQkahVZMUfonM8ghidS4xGSz
	fncok7seouoxQJoepFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES2t-00000009M5b-28QL;
	Mon, 12 May 2025 12:14:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERuq-00000009Kq9-2ktK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:05:54 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54e98f73850so4964506e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051550; x=1747656350; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqq9EOpsvH4cCrKKHdoK8XIb3RBbsUtuMBaIr9hLm9M=;
        b=ykXA5i4Tyr9jqDc64TkwLjP5VAIscpcNkHzWwiq50I5F+PthRFCxN78G8MC0ZXkXuH
         ZRc1WJWF/r97Bi8Y48MgAwpE113PuYw4Z3i7ciGh5TCyFerOoZQpOBTaH3LUiUQ5gO+T
         xGFwDBTiUKLCiY2c/5yX3FVw8NwWp6WHjaMPc75yXqbwXC5zkBCm2SMCqDduAXb1cIvY
         Ol61qKqqNe7KOFNUtlf8YlvnSg8Ojl4X7wEUESsPUAZVbVE6QssHqoXz4nJeKAZ3DF0g
         +/8oYUuazZydTDQT6SGH8hGOgMLbf6sAbY5ZuC9GwCFkGsga/B6ZbcMoLt6e1CRhOVJm
         SwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051550; x=1747656350;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqq9EOpsvH4cCrKKHdoK8XIb3RBbsUtuMBaIr9hLm9M=;
        b=mI9LZZsca/xW41kdIaGOqLU96DK1TReT+WLFwi08JAiEimY+qEbw+REup7acaQeUq+
         HN+KiqvIS6/fr4xzVxLULMWgfedC0ZsOdxHUrt6SbE+/5D4mhgp7oTdstgdQHUoLPEcg
         TMJJquluOfBhQIVxoqsUJCKw6vwOq6Ghcr6+BoL09CzxNDbkYnzUvpAOGDWcxX8tkeuj
         IVNIauAdgKcQvf8oXq2JDox/Mr7SD1VNnwlmb9nJ5/VClOCt81Ke1R7zYZkJU2Z35Qmx
         Pe/qjBueMItDSUK1I5ihRdr+tG7va3fQH++4FNxRNGwBgow9zZqaM/sdL+wAWRm71Jj/
         WT2w==
X-Forwarded-Encrypted: i=1; AJvYcCXoj8O7doZToQSbTPNiqoUYkxl2FEb+xVObdAk3qSu5eAcUtmFhCfdSvDi++wFieWY994TZ3T9hSC1gvlCqwZDD@lists.infradead.org
X-Gm-Message-State: AOJu0YyKpKyxvONMhISZwUPDVKw6jWS9rDJgqApARrlr3uiwESiW298M
	z9Zz4Wxbrkfa3Y7MqhtusIU5Ki8i5TvtyK+LvJKYb651y8m2NMTiZdbIjwcYl3k=
X-Gm-Gg: ASbGncu7r4E2JzOCs8GjStigJqNI4cxNPj1bAbQBA9eMf6hzSy09KqdbocJda/ae8ma
	xHYFNtj5dbWEEZsEJYaRzUUldaiHtgiUkiAB3aJQNjKXKBVQ0cVqMGSYel0X2mRJ6MpDTiQqAUN
	nS1zTb3y/tQA9sLATnyq180dBf2mPDUTdcUk+q3Ng0XBs2wNfmhfVpwbAUJZImmPts1mRIrpZ1X
	MVBsJdPHYqYD5Dns/Iwn/cn1xLBO0hobsXdfkUWMZFguLwfFktBnq3QFgMp9mcHM4peKEjjZiqW
	0EgOmYKFx2ZZwPQaqa6wSLpFB4o8a+q3TPlCRhQAKTTUazPm8g47mw3V/wJTGw==
X-Google-Smtp-Source: AGHT+IEtMbYBx+a632QmIMw0l2IjvUt8nlgRerOvebXBflb81teL0c+tliYnd2cE+4Cdmm0EE2PWZg==
X-Received: by 2002:a05:6512:228b:b0:54a:cc11:b55f with SMTP id 2adb3069b0e04-54fc67c97fbmr4315059e87.22.1747051549931;
        Mon, 12 May 2025 05:05:49 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 00/12] ARM: bcm: Add some BCMBCA peripherals
Date: Mon, 12 May 2025 14:05:46 +0200
Message-Id: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrkIWgC/3XNQQqDMBCF4auUrJuSTIy1XfUepYskjhpQI5MSW
 sS7NwqldOHyH3jfzCwieYzsepgZYfLRhzGHOh6Y68zYIvd1bgYCtFBw5tYN1hk+5dnUIZk+ckM
 DrxurJAgNqlQsjyfCxr82+P7I3fn4DPTe/iS5Xr9ktUcmyQXHArXUtbvYyt16PxoKp0AtW80EP
 6cQ5a4D2QGQSlSqdID1n7MsywdvlilcBQEAAA==
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
X-CRM114-CacheID: sfid-20250512_050552_720214_CBCE7A2B 
X-CRM114-Status: GOOD (  19.69  )
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
Changes in v3:
- Rebased in v6.15-rc1
- Set the UART IRQ to 92 and not 28 on BCM6878.
- Set RNG IRQ to 85 on BCM6878
- Set RNG IRQ to 85 on BCM6846.
- Set RNG IRQ to 85 on BCM63138.
- Extend the peripheral bus to 0x400000 on the BCM4908 and
  add the DMA at offset 0x59000.
- Extend the peripheral bus to 0x400000 on the BCM6856 and
  add the DMA at offset 0x59000.
- Extend the peripheral bus to 0x400000 on the BCM6858 and
  add the DMA at offset 0x59000.
- Use the existing 0x800000 peripheral window for the extra
  peripherals on the BCM63158 instead of defining subwindows.
- Link to v2: https://lore.kernel.org/r/20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org

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
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  79 ++++++++++++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  64 ++++++++++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi           | 112 ++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   1 +
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            | 127 ++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            | 120 ++++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   | 116 +++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 129 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 130 ++++++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 119 ++++++++++++++++++-
 11 files changed, 996 insertions(+), 7 deletions(-)
---
base-commit: 35ec8841914c9777209046ea0838acbe23e06b39
change-id: 20250327-bcmbca-peripherals-arm-dfb312052363

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


