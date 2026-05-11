Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B16ACD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6PvZiJbdFgg6CfVXI3ZnA/W5wMYdblVvpzZVyQN69HA=; b=1pBbu3QAo1OwfX1Mx2nYG2IoD2
	xxsJIPS7go10mEPw090v4n0IhyKoskwz9QtWcnwfdd9sd4wZ7sWIRo/DBLRhNtKI9N19cT5GtKVAw
	fD07w0thXPX++ZtzABq8FJe8qifln6gdrrkYeU1W8+JGDeWJu4wXikEC7yNTMZN5Y/AXUVOZrNfk9
	X/x85rZdd+nKhWI2qRcl9visPx2ydQieA4T8WTId9rb9GYRu/EwJdO4/cTIaE6ADjAw3FOOTV8pAu
	8IY4ChKJXVCm3LFxVb4E4wBE9Q+jFhm/6rtTVLYw3XooX0xHoHVyyD7QDrH4HgWkf8Xhgtvm1hG6w
	umEEk2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT1c-0000000E7mw-1qnP;
	Mon, 11 May 2026 15:58:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT1Z-0000000E7lq-0pjq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:58:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D7274E42BF3;
	Mon, 11 May 2026 15:58:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3184760646;
	Mon, 11 May 2026 15:58:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FFCD11AF9F17;
	Mon, 11 May 2026 17:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=6PvZiJbdFgg6CfVXI3ZnA/W5wMYdblVvpzZVyQN69HA=;
	b=jYe5/IyV4+QQoPJhoH7kASCQK5hWPxqcsQRvqBqCShiZy80aw0NHrK/bRUrBiV5WbDCiry
	/8JLDvNB6TNUw2z1KYOuG43u+dnPBL+j6KyU20SWwuuGIoIL5/ZMss7RWIzfc5fEfQogdg
	91P65zTkGl/3A8bCLa9FlGNWKPYfQa/+wZyNiB1SHEXeKDXurNSCCJMEgXABD+4FfSoyfH
	s0DXPDs0iJXUUlljvxnUT2JX0EVBicPQHfIgDilYiACGtiqQkfba7QGiIL/DJViqR86wdY
	ZPlO2RSX+fQp9jT8ff+AbeAyzZPKUEqiD2ypxBO1MjuQe4+VmR9cAexa5Vtf8Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v7 0/3] lan966x pci device: Add support for SFPs, core part
Date: Mon, 11 May 2026 17:57:47 +0200
Message-ID: <20260511155755.34428-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_085829_378080_6F4E29B3 
X-CRM114-Status: GOOD (  15.31  )
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

Previously, I sent a big picture series adding support for SFP ports
available on the LAN966x PCI device [0].

In this series patches touch several parts and sub-system in the kernel.
Reviews have be done and it makes sense to split the series and send
parts separately.

This current series is the extraction of patches related to driver core
subsystem. It fixes devlink issues when a device-tree overlay is applied
and avoid a warning when a device is removed.

It has to be seen as a continuation of the big picture series but
related to this specific core part.

Patches 1 and 2 fixes fw_devlink when it is used with overlay. Those
patches were previously sent by Saravana [1].

I rebased them on top of v7.1-rc1 and I added a call to
driver_deferred_probe_trigger() in Saravana's patch (patch 2) to ensure
that probes are retried after the modification performed on the dangling
consumers. This allows to fix issues reported by Matti and Geert [2]
with the previous iteration patches.

Patch 3 avoids a warning on device removal.

Those 3 patches seem ready to land and so having them extracted in this
current series will help having them applied.

[0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/
[1] https://lore.kernel.org/lkml/20240411235623.1260061-1-saravanak@google.com/
[2] https://lore.kernel.org/all/072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com/

Best regards,
Hervé

Changes:

v6 -> v7

  Rebase on top v7.1-rc1

  - Patch 1
    Fix conflict due to commit f72e77c33e4b ("device property: Make
    modifications of fwnode "flags" thread safe")
    Add 'Acked-by: Rob Herring'

  - Patch 2
    Use fwnode_test_flag() to test fwnode flags value
    Add 'Acked-by: Rob Herring'

  - Patche 3
    No changes

Older iterations:
  Patches 1 to 3 in the big picture series
  https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Herve Codina (1):
  driver core: Avoid warning when removing a device while its supplier
    is unbinding

Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix overlayed devices not probing because of fw_devlink

 drivers/base/core.c       | 86 ++++++++++++++++++++++++++++++++++-----
 drivers/bus/imx-weim.c    |  6 ---
 drivers/i2c/i2c-core-of.c |  5 ---
 drivers/of/dynamic.c      |  1 -
 drivers/of/overlay.c      | 15 +++++++
 drivers/of/platform.c     |  5 ---
 drivers/spi/spi.c         |  5 ---
 include/linux/fwnode.h    |  1 +
 8 files changed, 92 insertions(+), 32 deletions(-)

-- 
2.54.0


