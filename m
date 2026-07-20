Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7369DC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AXtq+ecEAywLnvDjSZM6ov2wubc0XFPi9d99IVIm0iw=; b=OXHHj7mfZmddZHh7JTWMXuTrH7
	WKAlJTC0GEe7kKQ8aOEKFYqrvOQufVMf2fp1zLxOF3VmwBXbJCMEUeao0aUHVyk9OgIGOlkuoFnXE
	//9CCj7X6mzV1LOH/T5sUa9u8Njll1ryh5LKkTPKMHl3S5hUyHZF3t7hSbPFCsQpLf6f9CTpO4g17
	TBwLiF5z0vk8+zgpZm4EIp+6PhZ1aroo0SBKqwTmOQtx+wcYznz4/EN4ES5tw6HY2OwOw9rhs5YcF
	+T+0eFMOvmK+t0zSXvjb+K9lLzdGTJHog+oY/pdTtuJcPMDYvHdeePG2qlfQMW/6XcS1t5RZOOZDR
	qJm9iVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleKz-00000005jK7-1oTg;
	Mon, 20 Jul 2026 03:06:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleKw-00000005jJT-1zOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 03:06:36 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84a652535dcso2972322b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516793; x=1785121593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXtq+ecEAywLnvDjSZM6ov2wubc0XFPi9d99IVIm0iw=;
        b=JOEvjmoDIN54EDsQDJuIqrXTwDmiw43HXNB1xh4VBM0LEFmmMxCKvIxnsbFhxvepyx
         jSPJOfbMOpXkLpOG4RymRApfJiqFSKh3INIkYJTh+DB7I33zQxCgCwVlJUtClMuN9bgr
         gShejKRK+kbK7/czL4zScQaX6wARvbdQ4SLo8OWbknZRFMRoo5iKPY6B8+/PX1Og/E3+
         Dbxz13T+rVK3Ry2jdLYV+jtU7kVZoFvi4APggTZjgmVAZFjZCi5p0dmjxxtv2Z5kgGdY
         ATneR2UyQLDwyIbmkw+xzAyBKRYPnxWx409cfPzhdP0Hwo8WvGqZulHuHSjfJnuw2OYA
         E5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516793; x=1785121593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXtq+ecEAywLnvDjSZM6ov2wubc0XFPi9d99IVIm0iw=;
        b=iCAmsys2UR93kCoqvvodIsnw0v/wJ0TTG+oQvDCo4hEiAq41/gDa0dkB/ujPhz+sLv
         KguelQpe5wh0YXfzJG5+FonIglu1bJtdZwavXHV+e8N8fVR3DAalxn9d6z/sZRfpNBKg
         wXoVb3eYEdZOoAqLY3yszgHF4GwI4+hjSFh06W5j8K7zkS5kr7AXmdJVxE8oFGiDJWWh
         j1kbIO8fM4p47wrYScCqb5GkNWxNhPlSlD0nfCj9CJLlogJo9+zct9woTcQldqyi0INa
         1o7OJKzLR6gOlwkUOJuxfQBD7cfbC7NI0WtJ5JhBH+lt4GQ4DzjzcqB3cQrCUf+HyAcf
         UtlA==
X-Forwarded-Encrypted: i=1; AHgh+RpPhBf4MbLYKGN9fnk5IVfOhg6yWRSsQ6LVz4WCb6mrsKujRmbP1LzuUskRDuWX0PVoKp+AlLv2oE7x3m+dT1J5@lists.infradead.org
X-Gm-Message-State: AOJu0YzpX5iBuyUgw7aEHx0sM7NY5tgm+m1IWt4YCBxJFGO1wy3dY87Z
	2nAh0BOKGzpHf3T3mFI4U1igyG6TD1uRp9wUgn+4WBt4A+u0keSxaJFC
X-Gm-Gg: AfdE7ck3IjC/5MYimwut5T7gkcqlDrXmjvPBvsISEf3hi7pzMeM66A0gmWlNeEeN71F
	lO/MVAtw45jQilHhlR7QQAimSOMUNmXF3Bgxls0HCrjUUVLkr+kT6bWBQpS6qTt9j35xjhThncv
	2vgP0i9nBVHe92ZF6+NNDiSTrfd/HWxu9xkzVI5/EEi8SCKARzsl4lGxaHLmZK0VZPGMJtf8Aph
	7jCa2qnNuGAoypISiEAlhIA0Nbqxh5fhbOwlxG2TYblRltIMAX0I4Vm6kkPZp0wf4JdoWx3Ypr7
	e+khvOnQrpd82hGAkson7xayfAPRoINpAzGWvEmaYBMUwT20Ix2xJ+6lPGT9LWapOtWgSygJpc/
	dqXd5ykN5jNXkHWztchM+eBu/mChvadGuODI75vcB5iIfoooL/VOvtG3nSHFehUN9/ZdSNBQ50D
	4V67Ai15K62zoOkaO1KIntkMEgSLX3DbfJVd6W8uyvuszGf6QEoyVs8Nc6GBQa
X-Received: by 2002:a05:6a00:4603:b0:848:4810:2b70 with SMTP id d2e1a72fcca58-84c294d4154mr12445461b3a.68.1784516793096;
        Sun, 19 Jul 2026 20:06:33 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm4805267b3a.27.2026.07.19.20.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:06:32 -0700 (PDT)
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
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v6 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Mon, 20 Jul 2026 11:06:13 +0800
Message-Id: <20260720030616.1067660-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_200634_521864_CFA6E18A 
X-CRM114-Status: GOOD (  17.33  )
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
 drivers/i2c/busses/i2c-ma35d1.c               | 780 ++++++++++++++++++
 6 files changed, 949 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


