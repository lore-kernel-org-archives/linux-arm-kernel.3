Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D993D12680
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmihCSpSLQT8dLFw3CGHvyAd/mgQnT03cqqjgLI8iF0=; b=mlSXKTaqrYu8YRVdoG+tZgRwFP
	gPHYB6JuE+f3YVBROfxtylv76kY2vv1bIXb781gxfhdBNS0nboIX7yzGTU9AndYo1QEwqMNYHGLLv
	HsNI9RS8sFwJGJ1UN7XsunmItxUZ2wnYptnhOCJGT4Feva72Tl8aRKxMwiCS9VD66Fr/8Ij51ubHW
	scI9E/iByvcEWfz4tqcO1VGZPQXhWyb3brukztQoyepFBLTXdLe/KHnHUfVEoxSWa3/sitlZIAKL8
	uf+zJSu5TJ/Ve95tuH4kEsduvtctt63nshCBXpLKy31OuyI8wSohAFagsem2TWMcPK9mNJgz7Qd7R
	YARE0LDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HCf-0000000GjTD-2Fqm;
	Tue, 05 Nov 2024 10:54:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HAw-0000000Gj78-2jXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:52:44 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8HAv-00054d-6F; Tue, 05 Nov 2024 11:52:41 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.13
Date: Tue,  5 Nov 2024 11:52:29 +0100
Message-Id: <20241105105229.3729474-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_025242_714472_F159BD3F 
X-CRM114-Status: GOOD (  17.31  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.13

for you to fetch changes up to cf3e10cc0e88bba51d330ef851bcffa0bce1070c:

  misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent' (2024-11-04 14:34:25 +0100)

----------------------------------------------------------------
Reset controller updates for v6.13

* Split the Amlogic reset-meson driver into platform and auxiliary
  bus drivers. Add support for the reset controller in the G12 and
  SM1 audio clock controllers.
* Replace the list of boolean parameters to the internal
  reset_control_get functions with an enum reset_flags bitfield,
  to make the code more self-descriptive.
* Add devres helpers to request pre-deasserted (and automatically
  re-asserting during cleanup) reset controls. This allows reducing
  boilerplate in drivers that deassert resets for the lifetime of a
  device.
* Use the new auto-deasserting devres helpers in reset-uniphier-glue
  as an example.
* Add support for the LAN966x PCI device in drivers/misc, as a
  dependency for the following reset-microchip-sparx5 patches.
* Add support for being used on the LAN966x PCI device to the
  reset-microchip-sparx5 driver.

Commit 86f134941a4b ("MAINTAINERS: Add the Microchip LAN966x PCI driver
entry") introduces a trivial merge conflict with commit 7280f01e79cc
("net: lan969x: add match data for lan969x") from the net-next tree [1].

[1] https://lore.kernel.org/all/20241101122505.3eacd183@canb.auug.org.au/

----------------------------------------------------------------
Clément Léger (2):
      reset: mchp: sparx5: Allow building as a module
      reset: mchp: sparx5: set the dev member of the reset controller

Herve Codina (6):
      misc: Add support for LAN966x PCI device
      MAINTAINERS: Add the Microchip LAN966x PCI driver entry
      reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x
      reset: mchp: sparx5: Add MCHP_LAN966X_PCI dependency
      misc: lan966x_pci: Fix dtc warns 'missing or empty reg/ranges property'
      misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent'

Jerome Brunet (9):
      reset: amlogic: convert driver to regmap
      reset: amlogic: use generic data matching function
      reset: amlogic: make parameters unsigned
      reset: amlogic: add driver parameters
      reset: amlogic: use reset number instead of register count
      reset: amlogic: add reset status support
      reset: amlogic: move drivers to a dedicated directory
      reset: amlogic: split the device core and platform probe
      reset: amlogic: add auxiliary reset driver support

Philipp Zabel (4):
      reset: amlogic: Fix small whitespace issue
      reset: replace boolean parameters with flags parameter
      reset: Add devres helpers to request pre-deasserted reset controls
      reset: uniphier-glue: Use devm_reset_control_bulk_get_shared_deasserted()

 MAINTAINERS                                        |   6 +
 drivers/misc/Kconfig                               |  24 ++
 drivers/misc/Makefile                              |   3 +
 drivers/misc/lan966x_pci.c                         | 215 ++++++++++++++++
 drivers/misc/lan966x_pci.dtso                      | 177 +++++++++++++
 drivers/pci/quirks.c                               |   1 +
 drivers/reset/Kconfig                              |  19 +-
 drivers/reset/Makefile                             |   3 +-
 drivers/reset/amlogic/Kconfig                      |  27 ++
 drivers/reset/amlogic/Makefile                     |   4 +
 .../reset/{ => amlogic}/reset-meson-audio-arb.c    |   0
 drivers/reset/amlogic/reset-meson-aux.c            | 136 ++++++++++
 drivers/reset/amlogic/reset-meson-common.c         | 142 +++++++++++
 drivers/reset/amlogic/reset-meson.c                | 105 ++++++++
 drivers/reset/amlogic/reset-meson.h                |  28 +++
 drivers/reset/core.c                               | 119 ++++++---
 drivers/reset/reset-meson.c                        | 159 ------------
 drivers/reset/reset-microchip-sparx5.c             |  38 ++-
 drivers/reset/reset-uniphier-glue.c                |  24 +-
 include/linux/reset.h                              | 274 ++++++++++++++++-----
 include/soc/amlogic/reset-meson-aux.h              |  23 ++
 21 files changed, 1235 insertions(+), 292 deletions(-)
 create mode 100644 drivers/misc/lan966x_pci.c
 create mode 100644 drivers/misc/lan966x_pci.dtso
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 drivers/reset/amlogic/reset-meson-common.c
 create mode 100644 drivers/reset/amlogic/reset-meson.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h
 delete mode 100644 drivers/reset/reset-meson.c
 create mode 100644 include/soc/amlogic/reset-meson-aux.h

