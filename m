Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3197CF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v21jXxp6j2FDo2K9FM4gq78UoqZJU+EV1IHRTIQnOk8=; b=1oTAHFHYeEf2VmUB7a4QllOdci
	nl5JS+JJF0EbbVylpQTdMhfFOQ+pk05Xh/OhtnzP4p1wPjh1nBi7E99vjwPPRT6XCf9pr1BYzsKsp
	sEiiPDbfUI4Bb7URF+GrZyDYkZPXj/3pjeBzlZdrd4NIH88JXDMtohDhWrDlpqwHas19Sd+bT628D
	AyevhxAjnctNYGfCbcI6Tx9TrE98RrNyblyFTs0/JLc0ZS5gixCrf/+jOAPN5pPPq4RNp/XeUHBy5
	2LSFmg0M+mU/PlpgIrJIgs5grKRpZIvVUruh2kp9Npf2P+S6OT43YnAihtn/ZHtOQrxQKPJhUZ22M
	6WJ3db2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7b6-000000071Rt-2IjW;
	Thu, 20 Nov 2025 16:33:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7b2-000000071RD-3QDg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:33:26 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vM7av-0004dB-QA; Thu, 20 Nov 2025 17:33:17 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset/GPIO/swnode changes for v6.19
Date: Thu, 20 Nov 2025 17:32:52 +0100
Message-ID: <20251120163252.34760-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_083324_853632_8B5F7470 
X-CRM114-Status: GOOD (  13.39  )
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

Dear arm-soc maintainers,

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-gpio-for-v6.19

for you to fetch changes up to 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:

  reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16:51:49 +0100)

This tag is separated from reset-for-v6.19 because it may also be merged
into the driver core, GPIO or SPI trees, if needed.
It contains a single series [1] with changes to swnode, gpio, and reset
code.
It is based on v6.18-rc5, which includes the prerequisite commit
e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the key for
GPIO lookup").

[1] https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org/

----------------------------------------------------------------
Reset/GPIO/swnode changes for v6.19

* Extend software node implementation, allowing its properties to reference
  existing firmware nodes.
* Update the GPIO property interface to use reworked swnode macros.
* Rework reset-gpio code to use GPIO lookup via swnode.
* Fix spi-cs42l43 driver to work with swnode changes.

----------------------------------------------------------------
Bartosz Golaszewski (8):
      software node: read the reference args via the fwnode API
      software node: increase the reference of the swnode by its fwnode
      software node: allow referencing firmware nodes
      gpio: swnode: allow referencing GPIO chips by firmware nodes
      reset: order includes alphabetically in reset/core.c
      reset: make the provider of reset-gpios the parent of the reset device
      reset: gpio: convert the driver to using the auxiliary bus
      reset: gpio: use software nodes to setup the GPIO lookup

Charles Keepax (1):
      spi: cs42l43: Use actual ACPI firmware node for chip selects

 drivers/base/swnode.c         |  30 +++++++--
 drivers/gpio/gpiolib-swnode.c |   3 +-
 drivers/reset/Kconfig         |   1 +
 drivers/reset/core.c          | 146 ++++++++++++++++++++++++------------------
 drivers/reset/reset-gpio.c    |  19 +++---
 drivers/spi/spi-cs42l43.c     |  40 +++---------
 include/linux/property.h      |  13 +++-
 7 files changed, 141 insertions(+), 111 deletions(-)

