Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B4CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 01:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=syAHkvAn4YNYIcaHBObgsW1JOoqD1UVZ48XNPLhl2Qw=; b=Z32LcpKhVBInIpDd+XkhtVLKHi
	rjjbHApXPZ0aad/AvFONTKdCmp3jv8kVCAYVBfaseAY6tIZWBvLOTTdkstBxBTP/UU/axSn14Vd1Q
	nlCMA0m7s3sN2Ulcw/uLYHndNJ9o7cRSjyt4fbmGWNjrm0Y7N/Jw+ge39cg4ICn/q2vuIdJ3TKU1m
	FuH9NqD6esgtrsio4VaZOzuJifnRyUHAbmGG/+A3DkpZm52a7IAVO1g/vi3szBAdLXAuqNGAZRqUi
	kDr5syCbHfc3cMhvemouoXFrYrQNv2oYUX/wLBmgBqm0/wqumq7cbAGPbFk8uTkmMzyEHvphh8UWI
	NnobTvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWNs-00000001f2e-0hFM;
	Fri, 16 Oct 2026 01:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWNn-00000001f0G-3vjS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 01:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=syAHkvAn4YNYIcaHBObgsW1JOoqD1UVZ48XNPLhl2Qw=; b=lLx/C8c/7FiK2mucD6vrVYLzQo
	HHzxJC16OJ5rP/2MArwI9MIA5KFmcmHx9TUdoIEk1mhHv/NmqIh0pUZb6UMmgs3Y8JFwq0CmMXIky
	02ZGKP+lr8nvdp8AOxUSsvCTMzc2BA2WyDwvyqR2si4lLjuFTK9mi8Wue6N+T6lbMHWuOthqYlbgE
	WQ3j5FoXVjajAxvqcXJVv+twwjXc/uLIAkhkkNIVue81lSItcFnHv7AGOCnIGAIdeTHxcBAVAzST2
	maf0Ub6PHHx+DOo9e2jmBR9OxLhF2UIxTC8vMuZbYP4l2uHRxzm26kVSq4xfoBteZn/Kf0y6zMub+
	HFCV4Cxw==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHWNb-00000000y4b-1e1z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 01:05:14 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8935f42e8f0so1189339b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112701; x=1792717501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=syAHkvAn4YNYIcaHBObgsW1JOoqD1UVZ48XNPLhl2Qw=;
        b=MJSNNhEgJnSJgRn9Y/fVDrBO4gNMbD3tYCaseaPxUJ+M4RDyTxmQ2Qn3qd9QsdPILI
         vhorAwigrHoacgVF71uafxb7GN7fLzdk7+XhWSbHY4zD/+zZy2uJTTqxTQI4qjwmJnOF
         xxHlJ26Sn2yWqbjspOzUa/aIEoKDoefvLFRJSboGlXWF5VzfMczJ8BFg6i62yaPgMShg
         IFCX2aAsPbxsuSyTjvzDZCsOYYKmw83ehEVpRWI0bQGFndRAhpaF/qs9T1RxEnC4oxrb
         IlbrTaE01FLn+HCXEAquUgJ3HPt/xrz2cPdgj69e9kFf7J+XrmJY7JR0dddjkStmJIpi
         8Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112701; x=1792717501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syAHkvAn4YNYIcaHBObgsW1JOoqD1UVZ48XNPLhl2Qw=;
        b=HJKz0S12T+zGMnKoU6BZnJrCou6zy9zdZJh0mEzNkIl2izQEQ6STX+KplROgrP4JBF
         MMWIY3mmMygSp6dhWbGITLU2JTSZmUQQAFzJCluIgp3jM32uZVRoY8kYMOBXXzZWURsd
         ja3I0u1jEV4v382UNSw6Ssa+Kj/QsTMzuL+ETxNQZ06BYh81YqzTcAF9rR/r3Pm4HrIx
         y0Tq89r1b1XAmOikrbDhNLU0uBX9Jr/ISFL5W5lyfasA4LdSY9l0/LcbtTDBTf+goNTf
         EdI6ltrNwdTWA3jkpmJ5orIaCAJhMFC5cYU3pkZyuIzUsDBSHooHWGlw8I4ABKorH7W8
         PbyA==
X-Forwarded-Encrypted: i=1; AKwUvBzW0GVnykBVICb24SGP9uE6qJTDvwqSB1IIoPUXdnmGMNamLNZ+6UcQriqjcwxF7EfaE6c0k3X+KYDl3w8HP9Rf@lists.infradead.org
X-Gm-Message-State: AFq9FYIyMNbszAiibEcTkG0/92sk2ZSP/sQiUlTHvSvdCj8jsru7Qb2k
	VO+6dIaC96tX8bOP0i5yqo0zR/LoY9u5myvv89WKUFTwQghYG7iR9lr2
X-Gm-Gg: AYBFou1CZ8fvA8e1D1samwvaVwRB9tx4gzdQkskFoIFSUa6iHGhMe4f/jgGgnCHuWY0
	yjCS+Bqd7JIpT75E83fOsivXNGJ4DeEA4ZUvE+7oe8ib2eW4c3sH3F0LMxzEeCUWgg76+0xxa3A
	ZPtGMrqvzd0grkN+df0Ba9xPPn/qugp3amOGIswh6qkhUNC/eD7BvBHtIo1ZMEltnSrxQsJALMJ
	Ny1tmANaTaGD/FmuXx/GrBqo03qCynnZpdohxEX1HRS0ewAytm/ImgWeaIlk7JsspEIWCvmWOCE
	cLKUWSRpVBDa5p8RFE8IX5gu1WV2usorf6q5STCXhrg5im18Gb9fFkxbUikdqs2aeIJu9xWh2+B
	dj1OPo4n9TWHltsovSHwlv4Ly7x5RDRpzDwJe8+RKvAU+hNhhEwZU3y/AcKkLiNx68lG7ifo8Wx
	iwQIY33tEOKFmfoqqY9/Wmz75m6unuPZDTA8YlD6fdNwbjJXoKYtw95wDp6JmkF5jt6r9xgJQZQ
	QvK4pq0qRkhRc13IjYkpPTfe5bnFn4rNaEsoSDxUVU3esctane7vLFs
X-Received: by 2002:a05:6a00:2e95:b0:874:708d:b620 with SMTP id d2e1a72fcca58-897c6e1be95mr18132833b3a.30.1792112700968;
        Thu, 15 Oct 2026 18:05:00 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm302821b3a.27.2026.10.15.18.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:05:00 -0700 (PDT)
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
Subject: [PATCH v11 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Fri, 16 Oct 2026 09:04:45 +0800
Message-Id: <20261016010448.324856-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_020511_432201_8DE51AE0 
X-CRM114-Status: GOOD (  20.31  )
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
Changes in v12:
	- Synchronize IRQs while initializing transfer state and issuing START.
	- Clear wake-up control if enabling IRQ wake fails.
	v11: https://lore.kernel.org/all/20261001075101.489660-1-zychennvt@gmail.com/

Changes in v11:
	According to Andi's comments:
	- Prefix the remaining timeout macros with `MA35_`.
	- Handle errors returned by `i2c_slave_event()` by sending NACK when the
		target driver rejects a request.
	- Use `dev_err_probe()` consistently in probe error paths.
	v10: https://lore.kernel.org/r/20260921083753.1109826-1-zychennvt@gmail.com/

Changes in v10:
	- Handle enable_irq_wake() return value in suspend.
	- Correct clock divider mask and maximum limit to 10-bit.
	v9: https://lore.kernel.org/r/20260807060400.2047517-1-zychennvt@gmail.com/

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
 drivers/i2c/busses/i2c-ma35d1.c               | 800 ++++++++++++++++++
 6 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


