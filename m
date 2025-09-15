Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC8DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1gfrnPfm8XQ0MKKa76eU2CbRwfmF4Xe1pI9KnOOXnWk=; b=ZnZyWXc7X64G7sdH2TppZFq/Lj
	OEb51yiOeLhAQRymz+Kro8glpnzGsjPSnTZm+Qn1p/mHeEnA1DaKSrTlJVIbdeQ65y3FltwN1glO7
	Wf/JCzVfGWhVr+xRkUvbEPFX+2r6nDuU9to8s1tN6B8Yme5puY5MNDHYaf6SFdfvBFxxiaZVazp61
	AqfH2X+k6bNxfwXhLvjcq8LEQa2k/NUiUfV4WTon2hnJ32dPhM6Dfp111l1I7oAQFr0CbhsWcxRnA
	53X8+BbFVN/3PEWvl6oF5KaUg4hXHSkwlts7o/Oma7+LBAv9TtiIWVoGFQKJrurGBY0yTmrUk8kBp
	ih0Lom8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8RA-00000004AE5-3nBg;
	Mon, 15 Sep 2025 12:36:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8R7-00000004AD7-3FlB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757939762; x=1789475762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8WAKX9Yt0aPAj7BPYhrIG/WG5HjmT+BCIgCWmzHGujs=;
  b=C57Jr3SMs8upr7G0U5QjxxGdeTzUAaxBkQoq+ERMWhGJbliGygUnoWmi
   yn1sCnVYH2eqy1IYwr3o2wwvY/zebM56rAUD8et5GkRlERDWm3qcGR9bk
   hOpNUv7Vq19EbXnxgQc7MGKOvxBL1Gj3yy0KsQORVObxRyCNAoLFb1nNF
   m/48CJ100bLWVWgOh2ACQLEVDu7LYhwq40JeN/bxwm8CWHVIJHF4REpAC
   V0ixo6LHe9hhnwiLE29rSM+NR50Ka5eItM4t9YaKJCEbIdO+FGoJIaChB
   DTK7ZZJiSz4qC1p9wvNghPU4bJ4ptvB8R6HuK8SFziwZ0wRbf0DVZFSVY
   A==;
X-CSE-ConnectionGUID: sq4SIjShQDG3RWVIwKVdaw==
X-CSE-MsgGUID: c9y2E6emQa6v91bNyc89Pg==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="46513138"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 05:35:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 05:35:56 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 05:35:54 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [GIT PULL] ARM: microchip: SoC updates for 6.18 #1
Date: Mon, 15 Sep 2025 14:35:47 +0200
Message-ID: <20250915123548.13722-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_053601_997240_EACE8A77 
X-CRM114-Status: GOOD (  10.07  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Dear arm-soc maintainers,

Here are the SoC changes for 6.18 which set the Kconfig infrastrucutre for
addition of the Microchip LAN969x SoC.

Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-soc-6.18

for you to fetch changes up to 38b22cde38aba61eafd752c8a2e43e631014e58a:

  crypto: atmel-aes: make it selectable for ARCH_MICROCHIP (2025-09-09 10:34:22 +0200)

----------------------------------------------------------------
Microchip ARM64 SoC updates for v6.18:

This update includes:
- basic infrastructure support for Microchip LAN969x SoC
- SoC ARCH symbols (existing SparX-5, new LAN969x) under the
  ARCH_MICROCHIP hidden symbol (already in use by AT91 in 6.17)
- addition of that new symbol for drivers that are shared by
  Microchip SoC-s now and in the future

----------------------------------------------------------------
Robert Marko (8):
      arm64: Add config for Microchip SoC platforms
      arm64: lan969x: Add support for Microchip LAN969x SoC
      mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
      tty: serial: atmel: make it selectable for ARCH_MICROCHIP
      spi: atmel: make it selectable for ARCH_MICROCHIP
      i2c: at91: make it selectable for ARCH_MICROCHIP
      char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
      crypto: atmel-aes: make it selectable for ARCH_MICROCHIP

 arch/arm64/Kconfig.platforms   | 51 +++++++++++++++++++++++++----------
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/mfd/Kconfig            |  2 +-
 drivers/spi/Kconfig            |  2 +-
 drivers/tty/serial/Kconfig     |  2 +-
 7 files changed, 43 insertions(+), 20 deletions(-)

-- 
Nicolas Ferre

