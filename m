Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D670CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iueolqUDLKvRCwvYIVU8AArOHe/7DRJotawGVS0PL+g=; b=Ti0FtubJ7END7B0FO8hgqzq0Fl
	h6s9BsicOjDkRK2U/Ia947GnkcEMgeAmcXibD4bdpQnManrs5zbSJIa9aAW1dU6whEkkqJMpmtR1U
	MOB2M2LaekRW+15thqWo12oAuhLtuR4ssrK1JkZXFHPzG+6BR7Q38rvzj/NARcA75jyASHhnlUc2R
	9WFuWm61SOGdhZfgoI4zZGRBjmFMSS8zLwVR0A8vhFcos9Fv07aZabtQaRhF5UxJUHO/r2yKaAJ6n
	QncUpeXjwcQHYXA8ud0DDeCKuO8lKCDcvrVaUet8+ignVcC89gk+oDRpuejAeq8II+NaXym450tjd
	VCPjnvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7j-0000000FdjA-0dEm;
	Thu, 21 Aug 2025 03:37:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotR2-0000000FKSZ-1HQK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A454212FC;
	Wed, 20 Aug 2025 17:45:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA5B3F63F;
	Wed, 20 Aug 2025 17:45:38 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu, 21 Aug 2025 01:42:23 +0100
Message-ID: <20250821004232.8134-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174544_429176_2733EF0E 
X-CRM114-Status: GOOD (  20.47  )
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

This series adds support for the pinctrl and GPIO IP in the new
Allwinner A733 SoC.
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
for the new MMIO frame layout (patches 1-4), then using the changed code
to enable support for this new generation, in patch 5/9.
Patch 6/9 adds support for the one new feature of this SoC's pinctrl IP,
the lockless GPIO settings feature.
Patch 7/9 adds the new DT bindings, patch 8/9 enables the secondary
controller, which curiously is not using the new layout, but looks very
similar to the secondary A523 pin controller.
The final patch 9/9 then adds the driver stub file, which just describes
the GPIO bank configuration and lists the two quirk bits that engage the
code changes added for the new layout.

Based on v6.17-rc1.

I am marking this as RFC, as I don't have suitable hardware for testing.
Also I am not 100% convinced the IRQ number to pin mapping, as needed by
the new IRQ register location, works correctly.
Please have a look, check whether the changes look sane, and test it if
you have access to hardware.

A branch (together with the AXP318W PMIC code) is available at:
https://github.com/apritzel/linux/commits/a733-rfc

Cheers,
Andre

Andre Przywara (9):
  pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
  pinctrl: sunxi: pass down flags to pinctrl routines
  pinctrl: sunxi: only use PortK special handling on A523
  pinctrl: sunxi: refactor IRQ register accessors
  pinctrl: sunxi: support A733 generation MMIO register layout
  pinctrl: sunxi: add support for set/clear regs
  dt-bindings: pinctrl: add compatible for Allwinner A733
  pinctrl: sunxi: a523-r: add a733-r compatible string
  pinctrl: sunxi: Add support for the Allwinner A733

 .../allwinner,sun55i-a523-pinctrl.yaml        |  6 +-
 drivers/pinctrl/sunxi/Kconfig                 |  5 ++
 drivers/pinctrl/sunxi/Makefile                |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 51 +++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 85 +++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 76 +++++++++++------
 9 files changed, 169 insertions(+), 62 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c

-- 
2.46.3


