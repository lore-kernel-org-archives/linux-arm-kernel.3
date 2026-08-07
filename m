Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5376DC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6PCzZs9ZFtPHagAoejIEffM3VCv5wo8jmQZlG8z3fvE=; b=FqPXFFUv2D6rgAz/O2FdplpyH7
	Z5MEuVWOYJrtWvlWaJVU25fFcdsXCEs3mgMHbBkmC8Ckt48/34EDYBwgKap/Km3eKnMmDEIHLlLpL
	A1jKtc+kNrtY6r2oSfeSo1Wu0+Nngj8UJvn2Bw6qRW9YLXrFDMlOUxhJMSg4QWjwynUzq+2AKWbXJ
	B6QQo1oDG/1oWSCAVPaFnB2Roa2LzvwcOAq9HtTtNms8/4xRQK0+/ZAjJDVDCQSzVRMZBnA3TQuTo
	7yV+WLKK2QDeQmbzsJBVwusn+daczBzK2Y7uAj2yhv0aLRo/oSFqYtWwhaaVGjBTYMYLvodGIklrG
	vMq9qyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDgo-0000000796p-2bkw;
	Fri, 07 Aug 2026 06:04:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDgm-0000000795U-0iKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:04:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-381b831d535so3443252a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 23:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786082655; x=1786687455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PCzZs9ZFtPHagAoejIEffM3VCv5wo8jmQZlG8z3fvE=;
        b=fvGZ2y47ObVO6lEMNbWncbObIXEQv+nw9um5oKRJ0QEhzrGCch6Vvvb7L2MUNslMQG
         faSIWWnWseqtkuNo76qwQ+LBtn9p61NavT6ToN72nlISiS9JMUtA4Ttc2hafJe4Eloln
         NZUDZqBVvzYqu3ihHAbMl6ew53beyo6b4ERG9NQTTzlLYmE4v3ioVUcCgQZEIvWeX6H+
         f2HZ3drWcI/UCoj3/3PMYBXKazcvWdLR0dfDtse0wGyjN1gI295AtVvp8lhFYw+qPhG+
         UYGGH4QHjaCRxDShNIBnQRqkX5tND0112ueJgNlnGDU/pLlivUt6mSVDfIEmc+LEXLuU
         EMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082655; x=1786687455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PCzZs9ZFtPHagAoejIEffM3VCv5wo8jmQZlG8z3fvE=;
        b=puH1nMX087/HNWjXUh8UOtvG7evFnKTjGzrQW5Km1mh1MUAOXYGPLYkMbIkGKaS0bt
         Djwv2WODvO8nqNDLg4aZ/6PoJ3rq6m8npwVgoN59UC/sNzmBQQ1slOLfJ8/bYnNxnx6s
         RRUQP9MmMqxmPxEDZYyuIv+MplgAHYlDh470oq6IzPNJjpDrpDK7KYektieb+OxOq8Yx
         e+ScxkAS7OKOr3mVdytD50tbq9lMlti6+47fFcvXiAGgkLyEYD0l05BWc0yF1jDpaLM1
         JFnHf2EtgYsdGAwzvzVFCMqFjajgmZnsedH3AxUm/Z53buwyT2MSNlfOHyvUNyTelplX
         sPDw==
X-Forwarded-Encrypted: i=1; AHgh+RpKxDQPNyX7hC6JxeQ7mLBDJne8jfjDC8P6mWpN9aWj33DUaDwtyRwW+r3lBQ5Sipu57PzCO6Gw1Y69GeBkfUQe@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0PTzdf4AyO5YcWyblVvJ2LnwHMLatt3F732ipXRYpjZ3bs/+
	sCgQd5+6qtKPCvGqKdJyKGKiPFSpaf9HLra1gR6HzYqnEVS1ZglmR4ca
X-Gm-Gg: AR+sD13+EbknvJvscs7GQjkoOgMakJxpaD7Gn1HNobK5hac2pfzf6s/JaFh0Bn2yPFp
	ttkHS044IJKxEH1PUVyTN89szwH32RwB3Af1Le98Ve79HH6XTC3FEqOq1g/qqIzqffr9lN321pK
	k4k04Fpp2EPaoFamOPTZlX8A/BlRXnh8gAqTL39Vvm8HU4d5N3jV68EfojKyMV8s6AonOi1qM2L
	+bT65jOvHJ4E0u76pUOZh3mCDh09Jps96Sj45G7afBHSYkk/0rQArwQYXQVUK9TGmNY9ptNsNEf
	X+jWjgntSzFKWlnUkBH7RXIibCvlzOfiq4LmfwY8XzLip1XS2AvqN9LJ7HmoTNWzvkDvcpVWzlw
	kRiI3vndm35fx7zryQAQGHwW/wI/AdcJiAF7J/oL2AGJCUgwcvTk/bPI+VubQz1Rh/zEuEgRL9/
	bpx5fug+M4+lIHCslu1CX5TyPJPnqvZbfRpacLlxPbtUfSb7VKAXMelAL+ng+M5tdFlENNB4BMm
	ZA0kHJH3uKvA4jCzbdXuBb3okYX11VOZ8smaNsCTUBva7I=
X-Received: by 2002:a17:90b:2dc7:b0:380:fead:448d with SMTP id 98e67ed59e1d1-392620e6e25mr1754412a91.13.1786082654831;
        Thu, 06 Aug 2026 23:04:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9c0fsm3375588a91.5.2026.08.06.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:04:14 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v9 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Fri,  7 Aug 2026 14:03:57 +0800
Message-Id: <20260807060400.2047517-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_230416_211280_6254F017 
X-CRM114-Status: GOOD (  18.70  )
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

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
Changes in v9:
	- Centralize SI handling in the interrupt handler.
	- Fix target mode comments.
	- Initialize the target transmit byte.
	- Add reset_control_deassert() during probe.
	v8: https://lore.kernel.org/r/20260804084806.1846570-1-zychennvt@gmail.com/

Changes in v8:
	- Remove rpm_put avoid duplicate processing.
	- Add synchronize_irq wait for interrupt to finish before i2c->target = NULL.
	- Add ma35d1_i2c_restore_idle() to handle bus errors or spurious interrupts.
	- Change return types of TRX helper functions to irqreturn_t, returning
		IRQ_NONE for unhandled status codes.
	v7: https://lore.kernel.org/r/20260727081859.1737223-1-zychennvt@gmail.com/

Changes in v7:
	- Disable IRQ before clearing i2c->msg.
	- Support	CONFIG_PM=n, and simplify runtime PM setup accordingly.
	- Remove redundant register access in runtime suspend/resume callbacks.
	- Defer clearing i2c->target until after pm_runtime_put_sync() in ma35d1_unreg_target().
	- Enable interrupts alongside I2C enable in ma35d1_i2c_reset().
  v6: https://lore.kernel.org/r/20260720030616.1067660-1-zychennvt@gmail.com/

Changes in v6:
  - Patch 2 (driver):
		- Removed dynamic IRQ toggling helpers for simpler interrupt management.
		Based on Sashiko AI Feedback:
		- Added zero-length read quirk.
		- Set i2c->msg to NULL on timeout to avoid use-after-free.
		- Cleared hardware registers on target unregistration to release the bus.
		- Protected suspend-path register writes with a spinlock.
		- Validated clock-frequency to prevent division-by-zero.
		- Removed incorrect I2C_M_IGNORE_NAK handling.
		- Corrected a comment typo in the receive data path.		
  - Patch 3 (dts):
    - use a generic functional name audio-codec@1a
  v5: https://lore.kernel.org/r/20260630012106.3616821-1-zychennvt@gmail.com/

Changes in v5:
  - Patch 2 (driver):
    - Add spinlock protection for MA35_CTL0 register access.
    - Add NULL pointer check for i2c->msg in the ISR.
    - Use devres-managed cleanup (devm_add_action_or_reset) for runtime PM.
    - Use pm_runtime_force_suspend/resume() for Controller mode 
      system sleep.
    - Control I2CEN bit enabling/disabling via runtime PM.
    - Refactor arbitration lost handling in state machines.
    - Remove unsupported I2C_FUNC_PROTOCOL_MANGLING flag.
    - Clean up readl_poll_timeout() parameters, retry loop, and
      unused macros.
  v4: https://lore.kernel.org/r/20260610030208.2020275-1-zychennvt@gmail.com/

Changes in v4:
  - Patch 1 (dt-bindings):
    - Update example interrupt number.
  - Patch 2 (driver):
    - Remove redundant spinlocks and fix 'irq' type to signed.
    - Fix target address recovery in ma35d1_i2c_reset().
    - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
    - Fix timeout UAF via explicit IRQ disabling during recovery.
    - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
    - Limit suspend/resume wakeup logic to target mode only.
  - Patch 3 (dts):
    - Add missing i2c0 node to dtsi.
    - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
    - Add nau8822 audio codec node under i2c2 on the SoM board.
    - Drop redundant i2c0 alias and clean up dtsi property ordering.
  v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/

Changes in v3:
  - Fix minor DTS formatting issues (whitespace, missing newline)  
  v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".  
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.
  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.
  v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com

Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 779 ++++++++++++++++++
 6 files changed, 948 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


