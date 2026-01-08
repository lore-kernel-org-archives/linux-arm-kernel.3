Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B701D185D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HH+DD4cIbxf4+sCG5RdVz9NQII+6wY3bzAy1NiV+f20=; b=fKFL+c23NjE871xwUP+LY9qz6W
	pzQF8qV9yoG033cVQ/19QPe3guVCQwXtv3/riWtKgdCL4yT+5cWdhxlzbvJAELmrtZPsOBGUjgV4t
	QuEYVzS9pfVWjD2rLaCqawLggFyUcsysmuGon/pZAXTK0LPFjNLsDqD0iF+vMBNGKCqQoMT74K3hl
	5b58Q6V8Okq8fZkQ4YXHXdKBr6R3btuXz84tegSvTvGB7LEeI53Ee88zqpIPW8OILfSnFj4SEF2EF
	CqqyOY+IAtzmlx20csaFxUWGF0d7gvWQhWM3ooE0ImQ7etMbsyDdzgB8q/UuEHgaUkJjJhH7pX41F
	ZEYKeDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnh3-0000000GkTy-0vvL;
	Thu, 08 Jan 2026 10:56:41 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngt-0000000GkJh-1Tuq;
	Thu, 08 Jan 2026 10:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869792; x=1799405792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R/veCd+MoZYz+/H4HoR6cR9O2PqmUFTICzNu+LpTN+o=;
  b=TXsD1ipM65a+q/Uew25v7E0vgx3++9fUUFzgvTgHpLaO+OQVnFAlg7I/
   6ybFMpmWJ521GszE3B/K3KJaQCaOTW0KFXJiyE7e7qfgQM0OdV6GMjB8W
   kh7YJNH4uKSl69ymcadGjX4sbHt+O9W1AiS8IHZazoUKxi8mUCxtR6E4k
   4GjRA4eMb6GgQEGN9VZ1ElD88OJZlkETA211GMO4rHxLYXX64+wsslwe4
   MG5BwZNRO3dDF+2NqBl816MVlrkCN9kwBpYO7Qq+KlrB2f6gLwtaao2yM
   h3WHWYdkqZb8ttfetXZeRPHKmH+mjL5Yo5tL9AyPdwjW5IyqYFLyjcoYY
   g==;
X-CSE-ConnectionGUID: 56j8HOjYSQOxxRQngNaDdw==
X-CSE-MsgGUID: BDPiHgtzSmSdvEzLZEeE6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80354585"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80354585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:28 -0800
X-CSE-ConnectionGUID: TLQoBmzxTyqlR0Bd+co+kQ==
X-CSE-MsgGUID: q8cFpDAKSr2AxYqPiM0Nmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203615538"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 02:56:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3DE2E98; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 00/13] dmaengine: introduce sg_nents_for_dma() and convert users
Date: Thu,  8 Jan 2026 11:50:11 +0100
Message-ID: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025633_746419_780F6FF0 
X-CRM114-Status: UNSURE (   8.78  )
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


A handful of the DMAengine drivers use same routine to calculate the number of
SG entries needed for the given DMA transfer. Provide a common helper for them
and convert.

I left the new helper on SG level of API because brief grepping shows potential
candidates outside of DMA engine, e.g.:

  drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
  drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */

Changelog v5:
- fixed W=1 warning (Vinod)
- `make W=1` the whole folder in allyesconfig and allmodconfig configurations

v4: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>

Changelog v4:
- fixed compilation errors (Vinod)

v3: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>

Changelog v3:
- added missed EXPORT_SYMBOL() (Bjorn)
- left the return type as signed int (as agreed with Bjorn)
- collected tags (Bjorn)

v2: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>

Changelog v2:
- dropped outdated patches (only 9 years passed :-)
- rebased on top of the current kernel
- left API SG wide It might

v1: https://patchwork.kernel.org/project/linux-dmaengine/patch/20161021173535.100245-1-andriy.shevchenko@linux.intel.com/

*** BLURB HERE ***

Andy Shevchenko (13):
  scatterlist: introduce sg_nents_for_dma() helper
  dmaengine: altera-msgdma: use sg_nents_for_dma() helper
  dmaengine: axi-dmac: use sg_nents_for_dma() helper
  dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
  dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
  dmaengine: k3dma: use sg_nents_for_dma() helper
  dmaengine: lgm: use sg_nents_for_dma() helper
  dmaengine: pxa-dma: use sg_nents_for_dma() helper
  dmaengine: qcom: adm: use sg_nents_for_dma() helper
  dmaengine: qcom: bam_dma: use sg_nents_for_dma() helper
  dmaengine: sa11x0: use sg_nents_for_dma() helper
  dmaengine: sh: use sg_nents_for_dma() helper
  dmaengine: xilinx: xdma: use sg_nents_for_dma() helper

 drivers/dma/altera-msgdma.c                   |  6 ++---
 drivers/dma/bcm2835-dma.c                     | 19 +-------------
 drivers/dma/dma-axi-dmac.c                    |  5 +---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  6 ++---
 drivers/dma/k3dma.c                           |  9 ++-----
 drivers/dma/lgm/lgm-dma.c                     |  9 ++-----
 drivers/dma/pxa_dma.c                         |  5 ++--
 drivers/dma/qcom/bam_dma.c                    |  9 ++-----
 drivers/dma/qcom/qcom_adm.c                   |  9 +++----
 drivers/dma/sa11x0-dma.c                      |  6 ++---
 drivers/dma/sh/shdma-base.c                   |  5 ++--
 drivers/dma/xilinx/xdma.c                     |  6 ++---
 include/linux/scatterlist.h                   |  2 ++
 lib/scatterlist.c                             | 26 +++++++++++++++++++
 14 files changed, 52 insertions(+), 70 deletions(-)

-- 
2.50.1


