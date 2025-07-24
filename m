Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B84DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJzN6WlnYhuqkVPILS7TtqvV9Aa7zVPm3CAK805yxM4=; b=Nshw/VVCby8INpZ8/QQjOA+iio
	FM0sahzLFjDg8/eB1HwVmnRXwHG183QG+zHOYFHHYeR4TQ6ngFfT6SwaiyRJBvdX6ZpggJrQcbQSS
	yuh4Q9ubm+IxZI1IWTyh4T5gsDk/6jDmR5NzgrHA8gjjkym0xGF4aXy7nmqPE+6+STRi1oLhQarY0
	fqE/gI64BEOpP71UsI+lW3eFyaqFEwKLPrWxORWgT6ln1K+JcZc6dsQBw2fCqD1v0WzI1VFVXCu0U
	NoZvhNaTIoLSenLP0+vVN2EhvR8YEKDPwl4i9SgLz2YhpSriuql/U0/iuhSnN2rIv2Rvft7GLgIbK
	l/W4Jzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewN5-00000007Z7r-3z3m;
	Thu, 24 Jul 2025 13:52:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uet8t-00000007CNu-0IjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 644C961135;
	Thu, 24 Jul 2025 10:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365DFC4CEED;
	Thu, 24 Jul 2025 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753352738;
	bh=HBCOj9X488KZ8EnGV22QDU0a1yTLfx7WU/YCXnS4Ax4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPbDDm+cRKEYAvRaF8+5CoNKgi462vLKxYcf7h6hZqkKxCZ4WGm1og6XBGIc15S/D
	 EVIzQrKrcGrW2SVFWz5Qx2Bcs5DjbpxtwJFnHgCet7z9MZw6a3zxSl8XgA++3EP1j0
	 UWnS2CUOzhpZs3voKHDB68vzCZIlBdlKWhb8gFxnChP9G1Lz2wsxmmIS6Msfml3x2Z
	 0rN5W0pxqizWkRG+bW6koilrIHglKTNXrtMdBAUjpjr8bBpN+G6VWXofw7Z2gVMg8C
	 Z9ObT3bvh8tC/jDx6x5x8qqIByhwARzYS7AGb1yDw4QYz60E1JlKaEP4nhrvblDbSE
	 ffqY0R+I37a1w==
Date: Thu, 24 Jul 2025 11:25:29 +0100
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [GIT PULL] Immutable branch between MFD, GPIO, Power and SoC due for
 the v6.17 merge window
Message-ID: <20250724102529.GA11056@google.com>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
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

Enjoy!

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-power-soc-v6.17

for you to fetch changes up to 819687eb28e501d21dabd6a3f52454638a815071:

  power: reset: macsmc-reboot: Add driver for rebooting via Apple SMC (2025-07-24 09:47:33 +0100)

----------------------------------------------------------------
Immutable branch between MFD, GPIO, Power and SoC due for the v6.17 merge window

----------------------------------------------------------------
Hector Martin (2):
      gpio: Add new gpio-macsmc driver for Apple Macs
      power: reset: macsmc-reboot: Add driver for rebooting via Apple SMC

Russell King (Oracle) (2):
      dt-bindings: gpio: Add Apple Mac SMC GPIO block
      dt-bindings: mfd: Add Apple Mac System Management Controller

Sven Peter (3):
      dt-bindings: power: reboot: Add Apple Mac SMC Reboot Controller
      soc: apple: rtkit: Make shmem_destroy optional
      mfd: Add Apple Silicon System Management Controller

 .../devicetree/bindings/gpio/apple,smc-gpio.yaml   |  29 ++
 .../devicetree/bindings/mfd/apple,smc.yaml         |  79 ++++
 .../bindings/power/reset/apple,smc-reboot.yaml     |  40 ++
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-macsmc.c                         | 292 ++++++++++++
 drivers/mfd/Kconfig                                |  18 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/macsmc.c                               | 498 +++++++++++++++++++++
 drivers/power/reset/Kconfig                        |   9 +
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/macsmc-reboot.c                | 290 ++++++++++++
 drivers/soc/apple/rtkit.c                          |   3 +-
 include/linux/mfd/macsmc.h                         | 279 ++++++++++++
 15 files changed, 1555 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
 create mode 100644 Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 create mode 100644 drivers/gpio/gpio-macsmc.c
 create mode 100644 drivers/mfd/macsmc.c
 create mode 100644 drivers/power/reset/macsmc-reboot.c
 create mode 100644 include/linux/mfd/macsmc.h

-- 
Lee Jones [李琼斯]

