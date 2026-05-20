Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF96CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV0+qdcdmk/5gJ3OGKgI5SQDH91h3lWhZ4d8lGRbL9E=; b=b9LRmHJl+U2RqSp8G1mLwxStEE
	aUaVeQmJN4oYg0QAYH84+1q0H5De+SEchBHlORPYX6TluaOe91W+2ZG4NPC/qCsd+A98adY4G/U4P
	gTW09/fDBSHIW0FJm+f+RdiT/iGT8GQHOCO8QmofnShJ+D1Bez24doCGU5i2yT7HzK0edN64OovpP
	pHeIDWR4pBmGpYVk2/cfsU88xYlBOTxZNQQ5hNMu8uEk44RkBkYJtxBkIdTTJrWokxxl7r+7xz9Kr
	eFR6yW/AVpQZ1iW4CphHwl4Aj1dDR8Zil5GbgT+K+4xBIr/Uegf4Pu2vIn397FB0D0MeFKNQgC0YB
	7jz9ihOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpl-00000005VA7-2zqh;
	Wed, 20 May 2026 18:39:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpF-00000005UH3-25oo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:39:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9F8160212;
	Wed, 20 May 2026 18:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8921F0089D;
	Wed, 20 May 2026 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302364;
	bh=TV0+qdcdmk/5gJ3OGKgI5SQDH91h3lWhZ4d8lGRbL9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JLCEdIhj+ggOrppkcYTTrQNTM5KqIoCtxO1KENxrD+9U8PWht6Vy6TAMPqqiknlxb
	 6a1MobDRSDwonLHkb8k6hipwd6d7okdssLui9BmALeqBm36GRhcBjxVXezpAYhtc3P
	 nMTGo+V4DYSSFLuRGdYBj4xSWfM8HAPTM0kpSBxtn78GbWehT1cK1V9zzYmqM/FNKE
	 Or49PD8deMVtSMSljqB0Zu+RaI7Rj2FQRkH4sZHZtZ/lBsn3Z0sAfD84FsIflSjV5l
	 nTzEA0Jh7v/sS3RlFlLhW2mz5htjnN1eTc3joHVAhGl7tXJh8xU5n1O9t7dhqWVbHO
	 MfjrowIjjlgwg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 05/10] [v2] mips: select legacy gpiolib interfaces where used
Date: Wed, 20 May 2026 20:38:10 +0200
Message-Id: <20260520183815.2510387-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

A few old machines have not been converted away from the old-style
gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
symbol so the code still works where it is needed but can be left
out otherwise.

This is the list of all gpio_request() calls in mips:

  arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_cd");
  arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_cd");
  arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
  arch/mips/bcm47xx/workarounds.c:        err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
  arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_one(board.ephy_reset_gpio,
  arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");

Most of these should be easy enough to change to modern gpio descriptors
or remove if they are no longer in use.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: no changes. There was no discussion on this, but the patch
    has so far not made it into the linux-mips tree, so I'm including
    it for completeness.
---
 arch/mips/Kconfig         | 5 +++++
 arch/mips/alchemy/Kconfig | 1 -
 arch/mips/txx9/Kconfig    | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..b91e62d69a5d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -206,6 +206,8 @@ config MIPS_ALCHEMY
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
 	select DMA_NONCOHERENT		# Au1000,1500,1100 aren't, rest is
+	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
@@ -307,6 +309,7 @@ config BCM47XX
 	select SYS_HAS_EARLY_PRINTK
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO_REGISTER
 	select BCM47XX_NVRAM
 	select BCM47XX_SPROM
@@ -330,6 +333,7 @@ config BCM63XX
 	select SYS_HAS_CPU_BMIPS4380
 	select SWAP_IO_SPACE
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_L1_CACHE_SHIFT_4
 	select HAVE_LEGACY_CLK
 	help
@@ -999,6 +1003,7 @@ config MIKROTIK_RB532
 	select SWAP_IO_SPACE
 	select BOOT_RAW
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_L1_CACHE_SHIFT_4
 	help
 	  Support the Mikrotik(tm) RouterBoard 532 series,
diff --git a/arch/mips/alchemy/Kconfig b/arch/mips/alchemy/Kconfig
index 6ca81e1bd35c..cf5ad52c0a0f 100644
--- a/arch/mips/alchemy/Kconfig
+++ b/arch/mips/alchemy/Kconfig
@@ -12,7 +12,6 @@ config MIPS_MTX1
 
 config MIPS_DB1XXX
 	bool "Alchemy DB1XXX / PB1XXX boards"
-	select GPIOLIB
 	select HAVE_PCI
 	select HAVE_PATA_PLATFORM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 7335efa4d528..92b759a434c0 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -37,6 +37,7 @@ config SOC_TX4927
 	select IRQ_TXX9
 	select PCI_TX4927
 	select GPIO_TXX9
+	select GPIOLIB_LEGACY
 
 config SOC_TX4938
 	bool
-- 
2.39.5


