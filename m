Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2674FC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvmNcp2BGzDYZW5Bhdvt0umZh/KqhVfSHw61I/uVOGs=; b=wtg9pB0yBP1ho1SQnukRyIeBai
	z726GFZwin5HPpPRbqMpT+MFTnJl9Afoux5+czp723T9h6eNyxSXqOe9jzAwV9r6QatalHEw8VMZw
	knNzWMiwaynAceM5mTEGorfNGfNqjoWWKS7dfjA+nRT0H+Iq3Uui5Dl1nR0UBu3kbChNa9SsQlHaq
	TJkCdZAE8sRh86rNMwybo4UCDgylb70efMSuUo3EcPiwujg7HS5tDvWxPIzVxpmYHyQatr8wGVdte
	hTxXP7OhLplhLTiuQsQnyQO+kwCDb4B7Ym//i2NA9uvfe1y2ZFcT0txSb49EmbIIa6zEvRJQAwnOF
	jOIh/I6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZXU-00000001MQg-18Aa;
	Mon, 21 Sep 2026 08:38:16 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZXR-00000001MP7-1pH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:38:14 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so2303397a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979892; x=1790584692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvmNcp2BGzDYZW5Bhdvt0umZh/KqhVfSHw61I/uVOGs=;
        b=cxQtTYMX+UTl6N2piMil25+/XbcA/qe56ecpsYbvJQOwgPL4dJfz40w0K919+0t1q2
         k1Lw+UlkxcRkFPWFfxcNnoM3J1+t+DQi94RjN//Wioo9+PVCWRWDPffUXGhaxzUvs2EE
         vkfxkRfjmk2x0p+jxbnmQjXu4LHc0tNuOlaonvrzPvvhdgfMY+B+T5+VTa8F9hU30Qjq
         dbzihXid3jprc9P5GVhB/UJOfQ7f8yM4WcZqEllzyjCPEK+UcoDZv8s4aKARHgrSl62j
         TqO+d06p/zyEgn5v0ByNLtOMZXwr9mpl595vs43pjsoQjb5Cny02CM12krEvPy8iwUUs
         0fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979892; x=1790584692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvmNcp2BGzDYZW5Bhdvt0umZh/KqhVfSHw61I/uVOGs=;
        b=GJVhobaSDK+UkgFJHtk4qoiHTEurSEPWD/7tqKPZeBMvMYIXNe4YkZh553iRmhJTLy
         BjyWdm0ejxSEgKdqKJZF83IUwAjRTZbEPfCByoI0SFxNc0LrW4JjsjG9gG/MPiTj8jcc
         wifln9GVjgmN62tV9EZBmsHFcz3eXBjJnd/SSgl6gutOUcFe/gwkCbjDZIsUjA9Vfh8w
         NEbFeBqP/W7ydb7HFN0h+bmBZ8lhXuANNkyMVnYI3khXibnoM3oD9zew/XgLT0444u0I
         2cSYMfBf2dU+oUUTB/ROisRAJGV6bMSigKSwlz+ef9gXhvLF8Ja8KV8enJpj8LpIyrmz
         Cv8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMX3vOsID0n9cGaq8HkTIhXiC1xcB8ivQYCmDiOebLGoYTImd6d0uSJc7j+GIO5RBlKuKOgiUzQLuyI5/hvS/I@lists.infradead.org
X-Gm-Message-State: AFuF++nhKhLtq4gt0Gh1eKS+nSjF2n+IgDXNROYFdtyiw+PztEOzNSSL
	oeoQoOth3ZWRHbUpZutVjZGf0JmTMtTJi/5tZtXA69rZfyU4ZMBrrWch
X-Gm-Gg: AYBFou1BNP3y1kDqArN6J1cuoX8OycthENFNpLdfC7GGuf2Qe2gjWoK4u4h0xBrFfQD
	jJL6Sfcy5hD/3y5i4/N77A06d3eqwEJARAWKMW/dPLDbAaftcrJYZUrSIgoPj18MLgxbqILjbKY
	5YmVLgaO21L6t8Ww5rHZE/FSJ5H/h78yfHDzf0FedSRzfMA+9wNINAvtTHTBX9kDvasVgUEsLDK
	S8V1frBYF655z5ho9ecM/x2xxLG+r6gPyFQq9rmyKEXEEeQ8AMw/9UuK5ZGZfO01/wfE/8K6m5Z
	g1HBWyBV1AamXDQCofcsOqhYpytUirBSUg+IRMUx3RnfBUjfFF1YrLbC/ZMHqtbpZ4PKRe+paNR
	xlU6jAkmbvpCN75AWuo+fY1T4qY24HthpykkTWPL5F5ldvMWVZviH9F7Fd0mqQh98vN7nYeCELy
	4ubEHuF6j4LdEl6cK+se9C1Zw9C9emD1YcMpkklRdjvxiGHBScrZ2DdBiFapbE/TI9W/qzGowsD
	45XHd8cytl/2OsNuH4Bz117Pm3duqG5pz002/1PmOWeFLVkU3soGCwA
X-Received: by 2002:a17:90b:17c1:b0:39e:3559:12df with SMTP id 98e67ed59e1d1-39e54aa357amr15593290a91.1.1789979891912;
        Mon, 21 Sep 2026 01:38:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50694sm15121508a91.2.2026.09.21.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:38:11 -0700 (PDT)
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
Subject: [PATCH v10 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Mon, 21 Sep 2026 16:37:50 +0800
Message-Id: <20260921083753.1109826-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_013813_478891_AF23AACB 
X-CRM114-Status: GOOD (  19.62  )
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
 drivers/i2c/busses/i2c-ma35d1.c               | 781 ++++++++++++++++++
 6 files changed, 950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


