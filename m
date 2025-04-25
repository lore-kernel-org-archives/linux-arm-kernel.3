Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4780CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKxsj0nnE+lfD3mVQ8izaMHHIpOy8/rQMYt7k5L622s=; b=AihLgdzpJ+viT85octNFEfrBtn
	YoT6MK5xd9hZCy2D1qfVOhT0dzxxvehAGcI5veXi5tIVRIcG9rB8xCimY3hG5820ulQEDAeT7Q0+t
	cU+HkjjbNdYRJKCp8nKpHDOnI2WixmxySHBj+MROZ4KFqRT85jXm2cINhyygsiv7EyJsUHZ7V/NTx
	d0FW3J9lyNu6RDJfS3cbFHIUTxIkko+SZeaXvMYwXK4FF9z3x71MAqvfoKqDKYSwQPZOXTfJutY2L
	FHLbGG8/ifcKR1Hvc8b22DYGD+t+IBpgw78r51NocPXLXaZ5B6teLxlUjyqhZc9t2LOpsyf1fH6F4
	P/BYXKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IbY-0000000HC84-40Z0;
	Fri, 25 Apr 2025 12:56:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8H0i-0000000GtjB-3A9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=LKxsj0nnE+lfD3
	mVQ8izaMHHIpOy8/rQMYt7k5L622s=; b=dn38agaDMahHu4LoALW9s6sNr3NP3y
	WLGeuX1acyIIzU4uaPYGEfWxRCAtLeIaDCqUSoUGY12YZ3sCNjDax1jztVGQMjkZ
	6ydN6OlDCkadPmJc3/1geOFYRiTlK8eOjEe7BMJpiFg9jSBUQ9U8CmqRg2y//7Ji
	wVZF1241/DeTBOCYhbTpMBoFotbo7/flpDhuAEWTL2t/KapTjW5VKXfRQ+2ji6fy
	eGVKnPX66jcylv3Z1FEGcPBiaHH5aOrxOyAOykzO2G5gz7xRiRs3Y4h38aoPLpv/
	pIxsBKLWGl7pIOPb6qp2czFGeQ4UAnztCvwZMDkyDDIEGGRdJ7z9NRgw==
Received: (qmail 3801015 invoked from network); 25 Apr 2025 13:14:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2025 13:14:16 +0200
X-UD-Smtp-Session: l3s3148p1@A2dRb5gzWoYujnsE
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hu Ziji <huziji@marvell.com>,
	imx@lists.linux.dev,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Viresh Kumar <vireshk@kernel.org>
Subject: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
Date: Fri, 25 Apr 2025 13:13:56 +0200
Message-ID: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_041425_668761_07CA5BFC 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

As discussed previously[1], here is the next set of MMC core function
renaming to indicate if an action is relevant for the host or for the
card. Local build tests went fine, buildbots were happy too.

[1] https://lore.kernel.org/r/CAPDyKFpsJpLre2bO9T7gsSthsta9f3JXoXTGZbjTjWVXH47gCw@mail.gmail.com

Wolfram Sang (11):
  mmc: rename mmc_retune_enable() to mmc_host_retune_enable()
  mmc: rename mmc_retune_disable() to mmc_host_retune_disable()
  mmc: rename mmc_retune_hold() to mmc_host_retune_hold()
  mmc: rename mmc_retune_release() to mmc_host_retune_release()
  mmc: rename mmc_retune() to mmc_host_retune()
  mmc: rename mmc_retune_pause() to mmc_host_retune_pause()
  mmc: rename mmc_retune_unpause() to mmc_host_retune_unpause()
  mmc: rename mmc_retune_clear() to mmc_host_retune_clear()
  mmc: rename mmc_retune_hold_now() to mmc_host_retune_hold_now()
  mmc: rename mmc_retune_recheck() to mmc_host_retune_recheck()
  mmc: rename mmc_retune_needed() to mmc_host_retune_needed()

 drivers/mmc/core/block.c           | 16 +++++++-------
 drivers/mmc/core/core.c            | 28 ++++++++++++------------
 drivers/mmc/core/host.c            | 34 +++++++++++++++---------------
 drivers/mmc/core/host.h            | 22 +++++++++----------
 drivers/mmc/core/mmc.c             |  8 +++----
 drivers/mmc/core/mmc_ops.c         | 12 +++++------
 drivers/mmc/core/mmc_test.c        |  4 ++--
 drivers/mmc/core/sdio.c            |  6 +++---
 drivers/mmc/core/sdio_io.c         |  4 ++--
 drivers/mmc/host/sdhci-acpi.c      |  4 ++--
 drivers/mmc/host/sdhci-esdhc-imx.c |  6 +++---
 drivers/mmc/host/sdhci-of-arasan.c |  2 +-
 drivers/mmc/host/sdhci-of-at91.c   |  2 +-
 drivers/mmc/host/sdhci-of-esdhc.c  |  2 +-
 drivers/mmc/host/sdhci-omap.c      |  2 +-
 drivers/mmc/host/sdhci-pci-core.c  |  6 +++---
 drivers/mmc/host/sdhci-pltfm.c     |  2 +-
 drivers/mmc/host/sdhci-pxav3.c     |  4 ++--
 drivers/mmc/host/sdhci-s3c.c       |  4 ++--
 drivers/mmc/host/sdhci-spear.c     |  2 +-
 drivers/mmc/host/sdhci-st.c        |  2 +-
 drivers/mmc/host/sdhci-xenon.c     |  2 +-
 drivers/mmc/host/sdhci.c           |  2 +-
 drivers/mmc/host/sdhci_am654.c     |  2 +-
 drivers/mmc/host/tmio_mmc_core.c   |  4 ++--
 include/linux/mmc/host.h           |  2 +-
 26 files changed, 92 insertions(+), 92 deletions(-)

-- 
2.47.2


