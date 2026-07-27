Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA338C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qPnz/v80LXwYp0PVxXjwmAK2BJ3kZ1bk+zxjufazDlY=; b=nqnyGovo/U08yNmG/2AwpkPDbJ
	DmSeVY6k+ctgRC+NKQK0Du4O/xxH6j6SFxCFsYrQvhaL2nBzWo1cQQEHTRyPUnAA/BuiJSHuLD+Ck
	XzwAsktuoHXXJiOA79WvN6G33M+SM25aEkcM4HwBvRnUBz/lGoWKseFnTVMIt3BFEZAIVTgTnmo6C
	T2v3tDUQq23TmEr0pEwGec1NDTIr80U+2RE3jXrmv4ez1drxEhc1jQnxuotBGxH8d64f4B2lLJg6z
	iqE2yTdwjgfuUueanAYnoZIPfrdkSSfeN9KAT0urQQ1m5XOOBcsQo5l7X1EMb0oxKCQ0Byh1+xm1W
	TiyRCzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGZC-00000002Dc5-0jYP;
	Mon, 27 Jul 2026 08:20:06 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGZA-00000002DbM-0wY5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:20:05 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2009951a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140403; x=1785745203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPnz/v80LXwYp0PVxXjwmAK2BJ3kZ1bk+zxjufazDlY=;
        b=hP163aKr+b5t1zQuHRoPwttN1aVYJG83ZxalCWx2wHuPQ30qFHS7q32iIiiec17uV2
         Ax7rhehSKTuS+usszSCZOv+Y++LW4E3deX4S/Z7QG1dVPGgHbZM/iRuZ3Z87gqtdp8Uy
         12YXFBm8MHWoldrOr+PjAwwS5WoI01WCtlM7G9wDfpDAzRHLUaYjCZ2EhgC3T7GMSpk4
         YLufNJdAl7nY4YKb9MmHY++kOXLv+QW6azyh00usy3cSTQMMYszuMFj/Icwdrpjkm9EP
         78oxlQq2G6j1KDuxAwEiiNa/4gZeifVHRrdbnmBI7IiRlVBsPWA6/wVTRuLGf4/NQD4F
         4AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140403; x=1785745203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPnz/v80LXwYp0PVxXjwmAK2BJ3kZ1bk+zxjufazDlY=;
        b=JFZxGU2OyctK8q6iDZuHa2pkvSoIznZhiom9Db4Nu3AWgK5tfttgvV+c/c/XD5pixZ
         ljMRyRNRqLeGgwbJy7Xh/nkHV6MdTc2J0Un9rvkZwvSjqZmXtfpvwhbQvTaYreVMyyxk
         ivqHZxuMwNmmDFXckCJre98BzBqVEOCcprMFdLXENo14sVT7aW3kpYCiawCKm6/G123m
         8qARPaAvHZjvYGovhEaGZv1ijeDgy/EX2lvlb39klJOMRZ1NjyDYFjNaLaSD+bXLzTLd
         kLwwj1wmHxnBfzxLt5hkjUlLtpFNcTjoBnRp8LY2e65Ore/uh5QOIHo7nVZcfY0Ri96k
         upVA==
X-Forwarded-Encrypted: i=1; AHgh+RogTo5vAjHkh1wjWcx0X51M3o8gWNPmqbpuSFmfShspKLxWstYlt7zybvKj3n+00RaOj5fhivA5XblaC0aWcE3z@lists.infradead.org
X-Gm-Message-State: AOJu0YzEvHRQzMHV+XW6xyr8hTELTFhjVImrf6HUVa89GhFmALaAxkbu
	JKegwxbkws3lZo5r5urk381as8OADoIpVxZetv26zfKRURxBBXTuUlYf
X-Gm-Gg: AR+sD108TzsBsoySAehewdvcvKY1pQXmyxFY8/OQxvKXjfiAlelnWWpHqEWj64P+sg2
	e4KA1NNtgmj/mkSQYILD2wI0UazYWnjU1/3gV0WHpmZP6BVWxovjQM9cNp/31nRxpGyp6XCm03Z
	XyjtTx1h7nFvumtKMW2YTGuiw08eZVgxy7+IB6bhEtGuGVZta6LasePS8iSDBXNRSKb04oxCHqQ
	n554Qj2MgTAWzEWJYAueuWDB/EXZPZJqykJyOLd7BJIQ+abljpank4SUxVU6dRmajGhSOsBC9Hx
	8nl3lb44Aje3lmwHKQGgdJKVT8FpgmklHSSaLuOFyZdH7/Vr+sSDIUk2fGwmO5qbBtuLa68ixh3
	VX20zX3BhoHHzuCCdLemF4NYSpRsMl5ifv0VQT9d3WG67rq/yOc7W7nIjBeaU2Dc7mvrPGuhtNK
	TDmI4VcgdEC9OsAbCy6a3rzYQRhoK94Fbfiyw4FXhgSdjbtqxiNCqk2AVEw5/g
X-Received: by 2002:a17:90b:268b:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-38f293caf01mr7455177a91.11.1785140402768;
        Mon, 27 Jul 2026 01:20:02 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292aed12sm2629156a91.4.2026.07.27.01.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:20:02 -0700 (PDT)
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
Subject: [PATCH v7 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Mon, 27 Jul 2026 16:18:56 +0800
Message-Id: <20260727081859.1737223-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_012004_271713_D0160D4C 
X-CRM114-Status: GOOD (  17.76  )
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
		Address review feedback:
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
 drivers/i2c/busses/i2c-ma35d1.c               | 759 ++++++++++++++++++
 6 files changed, 928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


