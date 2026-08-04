Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2500EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=06KxuYZYGUvdwJLxO6YakdqqJzGpR3ZKZOXLQyVhILY=; b=HfvHK6yIhUVEqavLo6ul5omiml
	K1lAsInx8Ie7+LlFV9TbFFWgJAok5trMZZNV9df2L42/DNh2vSKTIr3BNeZBbm4hQ2s6vxv20VzY7
	q47deH4umMT0VJgOvdhRJ+fs8Eqq5i65miKoNQAk2uL2+Qv7R+5cBDjxIwmshUfRE7Eo4BOG/rFC9
	PsQYT2ESmMx7yGVbxosGtN0hTSUrmPaViRGD3vlNx/dD5+G6rcOA5yURlbsI/4LOufWb1L6VDkqPm
	iilutd4NL3N2k1wvvbw66cguiXcGFVv/za3OPBDdvvaX5DrVNnFTcKn8cKK5n1SEZF6mveAsmty1E
	BcESOJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAt1-00000001O5s-04ek;
	Tue, 04 Aug 2026 08:52:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAsy-00000001O57-0CQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:52:33 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so4114107a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833551; x=1786438351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06KxuYZYGUvdwJLxO6YakdqqJzGpR3ZKZOXLQyVhILY=;
        b=c76GqOIafQ0ov4APYzcCO25oKbtnm9CGSqeXhgnmzX8ovE63ZYiVg1Xuw/SpTu/sjG
         7zxoblgXbXSLRMk65UqtEOhvGWx0dBvvImXRodrwB0z8xmJPtZPegUXhxpo3BNpR9bAj
         Du9f3P7C+/hn8LsXTGS64yeVhiXvqVbQ+O1NpiYlD845/VJZR4ikIHCElf+BX6H5JEZE
         s7rGs2mxtcWyr22lVVPnFpQ1rbm/1l/p+Y28HmlbCuaCoKezepynaUPnVse3eEikDxCq
         Dmf4Us1Pc5NNMOAKFngFcWJrRwvfv3OFcH2Z8w18rBdaTF30bVfEE42hXmUuutfoBLw5
         Voug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833551; x=1786438351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06KxuYZYGUvdwJLxO6YakdqqJzGpR3ZKZOXLQyVhILY=;
        b=B2pqgn7/UriZR63OtIqmmjQiOiD9ZQMvAuyZXaKec+Qu1e1aKVLWWBS3XHHB/QUz5F
         6HxTd0efW2QJaeeOitNR8hy1r0cTR4gvDrtwOFmAhEbvQ7O0WczGLXTFz/5U1eXM6ayQ
         5novwsjP1BigEnijw/96F257wBmkHWJ4JwklzISwAXjUqM36Vy9uuPfEA7IYupvUX0vu
         /nGSiduw97FypK1I/L6CYS/l1qWWT8rN/8rZBVjNk87qtwcZc0f/n+8+DgZfZ21OydN7
         pZMt3sEe3BYkUF01xk+DIy/+stL2ZukuVkuTqjWANafJbhosWgmatUg6RlintMQ7vyQx
         x98A==
X-Forwarded-Encrypted: i=1; AHgh+Rr8cIJc7cmrsFMx1QH9t9x9b5l95qAG/NYNNnLrIFs8KgZtKraToWhx8+e8z/7M2bxPXx4zlqx8IPbDgtShc/48@lists.infradead.org
X-Gm-Message-State: AOJu0YwuROoJMSXsuHxs0afKdBxcF0H85fzEjqR7iiTHYMSS2Gsl4tBh
	eR/4k+48TCrjGrEKm8S/Pg/r1BEihKsDXnCvPIZNbsEVE8bauIhJWbtA
X-Gm-Gg: AR+sD1173UxR37ADr1rkbgI5YMx4mD3VhJ9lg/2/ty+FGVzLscYRromiHhAlZsxOxaQ
	7xh+CR1oVahj0aZxyhKwv5nn0Q7Bi93aSrkM3o7JunU5SHENIq0KhHX3pCC+kFz/8YKPMqthgzN
	Qq1k/VF++PpM9V/DpyE3U3sGhxCKcnV8NG0GAxOg3up0nbzKrJalBIVAfk7UsZQotnAOOdpg+Im
	7R5XLoz+Hdx+XDNbjUQCoHMAWyqihRtxSZCuG1plG7V32mLAjz7GS21UWQ7mj3XHskQc3RTICgl
	yHxVaT0Chog81v3CKe7IKtr9z+C488tuBfa8nR33S0FPDuGcQOeBfbB35J8sMDxRtJCN/HTti0D
	cVKPEjNjOVf3fozTE4ectWRO1l+NAMNaSNViJCSYH9mzuOmvlU5GA9M+wyczlmfElZGcgDX5j4g
	qMAWUjSbH5avu7x6ePOLPc6RU67nOcmsYsd171wXtK82UWAeFYXabRyU27OAl7eQXYdgsVsH6OA
	9wgcmb29e3q3Ffk7/rD2+R3tam8Uw6nBDPvEnmF13ukvyE=
X-Received: by 2002:a17:90a:e7c4:b0:38f:23d6:b4b4 with SMTP id 98e67ed59e1d1-38fbc5341dcmr12857447a91.22.1785833551137;
        Tue, 04 Aug 2026 01:52:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb36dsm1012000a91.7.2026.08.04.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:52:30 -0700 (PDT)
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
Subject: [PATCH v8 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Tue,  4 Aug 2026 16:48:03 +0800
Message-Id: <20260804084806.1846570-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_015232_088428_842657C0 
X-CRM114-Status: GOOD (  18.88  )
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
 drivers/i2c/busses/i2c-ma35d1.c               | 777 ++++++++++++++++++
 6 files changed, 946 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


