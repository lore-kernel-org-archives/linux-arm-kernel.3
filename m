Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92820CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yEIytjhFvfRt+XRvx0wMRFGWBX0cXG5/+bdJWX+J9Ss=; b=IMAJEqDqqtBh5hf70vnfdE7NUp
	YSOv+jGYcpT8ffHP5LdL1knHhT9+1fM3pESJoNU3rk+aBW31U8A5Vdh3qcO/LAax4EF3k+OivaVXh
	q+87E/Wt69+45hpyvyQLR6jNiv3dcelhdxwEWabdbP/6gsOSW9w8yrbFHuB1rUyugUQytnm224FQj
	QO0f1dCDb22R2YCnkw/ERuSI0dVdmrDxHtZrfdhhWMjELJB0z8DHMb4+DzV0+QrrmNLEYU5RGDPgX
	qo1fFkPoSn+KYwSI9yyCe6y8nzWybc/XaSfetMYC8QCcbScRGi9QX1xe9S1BhLq3jUEOXNY6072TD
	xKUbhFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGvJ-0000000EOKg-2CW7;
	Thu, 04 Sep 2025 20:51:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuC5j-0000000CbIA-2jEk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:41:40 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuC5i-0006qc-99; Thu, 04 Sep 2025 17:41:38 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.18
Date: Thu,  4 Sep 2025 17:41:35 +0200
Message-ID: <20250904154135.2385905-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_084139_686534_6A4045C0 
X-CRM114-Status: GOOD (  11.08  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.18

for you to fetch changes up to 1527cd3b89f0db8d71828f86a64dc901415f9be1:

  reset: remove unneeded 'fast_io' parameter in regmap_config (2025-08-14 12:21:39 +0200)

----------------------------------------------------------------
Reset controller updates for v6.18

* Fix the reset tree git repository link in MAINTAINERS.
* Add support for bcm63xx ephy reset control to reset-bcm6345.
* Add support for the AST2700 reset controller, as an auxiliary
  device driver to the corresponding clock controller driver.
* Add support for the remaining TH1520 VO subsystem reset controls to
  reset-th1520.
* Drop unnecessary .fast_io setting from MMIO regmap_configs.

----------------------------------------------------------------
Icenowy Zheng (2):
      dt-bindings: reset: thead,th1520-reset: add more VOSYS resets
      reset: th1520: add resets for display pipeline

Kyle Hendry (2):
      dt-bindings: reset: add compatible for bcm63xx ephy control
      reset: bcm6345: add support for bcm63xx ephy control register

Philipp Zabel (1):
      MAINTAINERS: Use https:// protocol for Reset Controller Framework tree

Ryan Chen (1):
      reset: aspeed: register AST2700 reset auxiliary bus device

Wolfram Sang (1):
      reset: remove unneeded 'fast_io' parameter in regmap_config

 .../bindings/reset/brcm,bcm6345-reset.yaml         |   4 +-
 MAINTAINERS                                        |   2 +-
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-aspeed.c                       | 253 +++++++++++++++++++++
 drivers/reset/reset-bcm6345.c                      |   1 +
 drivers/reset/reset-intel-gw.c                     |   1 -
 drivers/reset/reset-qcom-pdc.c                     |   1 -
 drivers/reset/reset-th1520.c                       |  41 +++-
 include/dt-bindings/reset/thead,th1520-reset.h     |   7 +
 10 files changed, 312 insertions(+), 6 deletions(-)
 create mode 100644 drivers/reset/reset-aspeed.c

