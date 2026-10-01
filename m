Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97930CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wjagYs9Ji8AuTVXONh4xlKL2Lc9+4X1MuRUZyuptkk=; b=WQHW07hb+70DquoaBAZUo3zAb3
	7W4dDLhlBputAgWEpqA37kOaJ4Gpm3wp9cSVUpyNHGtIAEADoxxRGUiORCIOlRscoEj/B5OkOB+vi
	OoO/++xweJoQoC37hr8tvo+tu5rntV8MlY/cTdowzfHJKhO9XG48/VOJyoAgxP8Yo5PttC80RVdLA
	h6BCanGbVtR0ZNcAYrGmd67l2Ba5u4jLBeutKsGsdxqv5476N1l/TKbqbtegUed+woaf37zpInzeh
	TvDc0zZvMUDOqt7dfk6rq1mHSWvMfmXyatsNWAewmNL+LuNIb+LP3SKMa/fmqu0hgsU5g3gxEGeF7
	uAadj9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBa9-000000083lL-00es;
	Thu, 01 Oct 2026 07:51:57 +0000
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBa5-000000083kP-2EoU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:51:54 +0000
Received: by mail-pz2-x29.google.com with SMTP id d2e1a72fcca58-8867466563eso394645b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841112; x=1791445912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wjagYs9Ji8AuTVXONh4xlKL2Lc9+4X1MuRUZyuptkk=;
        b=f68VJE18cEzZRd14sczOVfLOIyu4pLzL4Xxx+CKlxhIxoS5vW98eT9ICupxKvyGZUd
         r1gUR2zDSaCO68gI6SLYa+Jx8AS9tGDh75ON3LLKc/DoMKvw+aCtKvnb9eGVgKYj9dhB
         cVaAqJbnS+zPFJukEL3UCpSc3ZCh7GKUM8rh/uE4jsoAlluDZABtQkNL/N2Y1bYoYv1t
         heV4e/H0mBufWqLCHkcEDjtbQBqzfYQ7j2Qt7Z17rmKAm4kUvxxR2aYeAfiMwT2/CG5d
         kfrWwumP2huVdmNP6jk5AAzzpEVxLNzCd40RUU4F9fJkE8gYmTHigRTHf9k/3lCqkYiz
         nDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841112; x=1791445912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wjagYs9Ji8AuTVXONh4xlKL2Lc9+4X1MuRUZyuptkk=;
        b=glPzNAPxC2owlcUEsvuRQaFm1Jyo+kn7Muqeh+9hO3OEB1kTtRpO8x+HxWJBnoObGA
         yMd8mz1sp31yyC+h7/fX/bRJV7Hi6DjhXcD8cSbND16VX+G4qTqlh7fixqYTvhL18vBQ
         4DtJoDC+HYnEroAizkA+dIHn6ROlBOT7JYYs0AVEecFq7JIzXqC1VJHPGd7/tLchCqHD
         tUExQuyoAffJ//79U3GACUL7/tISgQq6lXwzdOpjbfWMLkAU9o1Qqcf+fBluLN39z9cl
         VbAuDl1XgGtYWxgcya26BzxMtAilb6dciIE2u5pOpGUcNisfoaWVD+EccWAeJ/UF87v0
         Slhw==
X-Forwarded-Encrypted: i=1; AKwUvByh7Fb1ToaduCwF4FspKUwi8DNef4JIC5dHD8HI/Yv5xCrF4laF0wCyhgq1evtoWWAWGRWEDAVcVj7j9fA7pBE9@lists.infradead.org
X-Gm-Message-State: AFuF++lR2woGDdwYj6lBAlKI2ABNM8nLma6kY//uGcsz4Zp2x0HOrfZ5
	IbUwvHjtMWRd73Vbc8xoH7+BaV1A/v2GaKk5pU4yD/4ZUE8yxcaH4YxE
X-Gm-Gg: AYBFou2ixDPGZ6888HY4W4wWZZux40gF4Ek0ro/hntfpUE5c8UdIH9x+MmyIwMNMOFg
	pTi1hRSdt4PhuXYCr87xTyEXmL4I1hQV07sMIUt3Q9Sz3CUIn+RelNNC6YTkkWVm90wcw47BMQm
	sqwSTzVtbI9t4lpgLaxngn3aKKlSmgGEsqp/AbrUgpn01tGsQ8S7dxfhA0imq37Ys83qrZ63eJF
	QoUzLNk1Z7DK0XUVH2l/sZSrU7MTLNvMZUZRlB7RQPftU7RrpPyht76eXQjWFoW1RJxFs2wpv7j
	i5JUbDna9mogX+b79EMqDpbuGI/e9Wmm6gPYTAiWm5v5U/muzhMSuxpItbiSFFGrBTxSq6GKzxG
	WlOzg42I42TMXJagP9GbQAcCmo67GE6G9YsQpayDYw/wOcrp2UHGVA8aJtz69jRgvk4qyVW7hxr
	IQDZ99Qeki5fKz+YQR/ruOi1nBPhsPtEmiBFHWPh5N7OIqHa4TakFlnZbYDf1gkCCe29cRiJB0g
	1/8Lf00KwzfDUUfp25WZq/uPzwRk5513J10pFYztXhjx4hr9F6LEt7J
X-Received: by 2002:a05:6a00:1250:b0:886:af7d:f0ef with SMTP id d2e1a72fcca58-887fc198825mr1234242b3a.6.1790841112222;
        Thu, 01 Oct 2026 00:51:52 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm666843b3a.60.2026.10.01.00.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:51:51 -0700 (PDT)
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
Date: Thu,  1 Oct 2026 15:50:58 +0800
Message-Id: <20261001075101.489660-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_005153_580647_3B1B4B4A 
X-CRM114-Status: GOOD (  19.93  )
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
 drivers/i2c/busses/i2c-ma35d1.c               | 796 ++++++++++++++++++
 6 files changed, 965 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


