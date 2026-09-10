Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE45CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cDCZbvoUqbxEiYkoFZ45w2v4oUTAj3iYwhU3KZbQxrc=; b=rs3xwJGyQweRLph7WTbbV57Por
	EuQ+Iwz699hxJWUeT02PvUEmvtMz5i+AVWIINWwc2uMSc5L9pfjWzBwMFxyhCYQRq4qRAhtn0MXym
	XFZd+1n+ELrixuk1g4FopIaOsBaP9Kgv+kxa3KU13niDLuLeKyZ6y+Bx92hj21NlJ+L1HJPTC2wDk
	tU6d/kYbVvCw+WZ2K62VhItUCl6sU6zBVeO0fvqhBCCDlSqCuC5DE6iR1j2iaRI5MGKt3FkKvS8gN
	IgA/kd5xZ0Zy6iUmOWm/k4bcLTSGi8ZZ8ySM3UbMz8PwNpDvznqjvzIh1566jk43TazK/TMPjtyQY
	fPO5GHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew5-0000000EU9S-1kB1;
	Thu, 10 Sep 2026 13:35:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew2-0000000EU95-3QCp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B72204C;
	Thu, 10 Sep 2026 06:35:21 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7123F528;
	Thu, 10 Sep 2026 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047325; bh=HwQDBz5oLzKG9qLyiXZqxlvO7T32/h+XjqXU5wEETFo=;
	h=From:To:Cc:Subject:Date:From;
	b=kaDox7TvjHq/wLCyMuQdsXIbtx5DQsNGh6oyDgT/Cxvxv7vQRdS5r1UxLlsU8LSqJ
	 TIOw8AIde6Yiqu5gR4NsOicFXr/Jc9q71hdDMzsKKlAsCNGeBJb1UaJkp4aCk+sooD
	 wpvyIg4tLtxqqDtTqACV790BKbDzA3cExEwNs8JA=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
Date: Thu, 10 Sep 2026 15:35:11 +0200
Message-ID: <20260910133519.459011-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063527_116214_0905A91D 
X-CRM114-Status: GOOD (  22.70  )
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

Hi,

more than a year(!) after the RFC, now the first "proper" version of the
pinctrl and GPIO IP support for the new Allwinner A733 SoC. I originally
had planned to prepend the GPIO_GENERIC support [1] here, but there are
quite some nasty details to solve there, and I don't want to jeopardise the
hardware enablement for this SoC on this rework. LinusW, I hope you can
forgive me for dropping this rework (just for this series), I still want
to work on this, but it takes more time. I do understand this would make
you to give up some of your leverage on this topic then, so please let me
know if that's fine for you. I can elaborate on the GPIO_GENERIC
problems if you like.
So compared to the RFC this is mostly a rebase, dropping one patch that
has already been merged (RFC PATCH 2/9 "pinctrl: sunxi: pass down flags
to pinctrl routines"). I also dropped the patch that introduces the GPIO
set/clear optimisation, using the new separate registers, as this would
become obsolete with the adoption of GPIO_GENERIC.
Changelog below, based on v7.3-rc1.

[1] https://lore.kernel.org/linux-arm-kernel/20260313000652.11470-1-andre.przywara@arm.com/

================================
Add GPIO and pinctrl support for the new Allwinner A733 SoC.
With all our abstractions and data structure driven code, life could
have been so easy, but Allwinner decided to change the layout of the
MMIO register frame, which requires all kinds of special handling and
code changes here and there. Hopefully this new layout (which admittedly
looks more future proof) will stay around for a while, but I am not
holding my breath on this.

In summary, the changes are:
- Each GPIO bank now occupies 128 bytes instead of just 36 or 48.
- PortA (not implemented on the A733) starts at offset 0x80, not at 0.
- The non-bank specific registers are moved into this gap at the
  beginning.
- There are two new registers per bank, to set or clear bits in the GPIO
  data register, to allow for single-write, lockless GPIO settings.
- The drive level register is moved (to make room for the set/clr regs).
- The IRQ registers are moved into the now bigger respective bank control
  registers part, instead of being grouped separately, as before.

The series follows the usual pattern of refactoring first, to prepare
for the new MMIO frame layout (patches 1-3), then using the changed code
to enable support for this new generation, in patch 4/7.
Patch 5/7 adds the new DT bindings, patch 6/7 enables the secondary
controller, which curiously is not using the new layout, but looks very
similar to the secondary A523 pin controller.
The final patch 7/7 then adds the driver stub file, which just describes
the GPIO bank configuration and lists the one quirk bit that engages the
code changes added for the new layout.

Please have a look, review and test.
I tested this on a Cubie A7Z board.

Cheers,
Andre

Changes in v1:
- rebase on v7.3-rc1
- drop already applied RFC patch 2/9
- drop SET/CLEAR register patch


Andre Przywara (7):
  pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
  pinctrl: sunxi: only use PortK special handling on A523
  pinctrl: sunxi: refactor IRQ register accessors
  pinctrl: sunxi: support A733 generation MMIO register layout
  dt-bindings: pinctrl: add compatible for Allwinner A733
  pinctrl: sunxi: a523-r: add a733-r compatible string
  pinctrl: sunxi: add support for the Allwinner A733

 .../allwinner,sun55i-a523-pinctrl.yaml        |  6 +-
 drivers/pinctrl/sunxi/Kconfig                 |  5 ++
 drivers/pinctrl/sunxi/Makefile                |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 50 +++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 41 +++++++----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 71 +++++++++++++------
 9 files changed, 139 insertions(+), 42 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.3


