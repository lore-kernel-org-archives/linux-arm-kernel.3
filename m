Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448F8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NpSUpwiTP/Xiue7s5oWlbnZP8JdPTRuZjo6UuAa6VL8=; b=uZrqjgoXNImjeZGkJg6tmMcMw2
	XUvCxxJ+8XOlwKYuxg9EvGF6LwQGTkXzb1rHWcl/5rBZo3K4YwNcSQOztRCC90voasDO8OeG1+swt
	/5WzYJUQw7oGF+KlXRilrlD/LCN+Nj/2ROh5Dp+JU+T0QucqoADSF10uVVS6tjagCNiA8pStfjgg0
	kYIS+G5fEYr0UYS2WSXulG52ljM4Ir6rpB9IRVs9cWtV6wDOzaGm1k/piThZ5Dn4XVpHGhUcWeqpw
	xbB0yI2vKFny3pSJkr5NtKAfckQorw5hxOvdS2QxxGnlxMIVS6UUv+lBFCVLymk8m8g13z1E0DOV8
	YN6otPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfj0V-000000043iF-124N;
	Wed, 05 Feb 2025 17:16:11 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgqs-00000003g7D-2djd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767487; x=1770303487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7H2ugvXbJPmCuRopy+9t0WK9d/y8xYbHP4xu7MXLSn4=;
  b=eu6IwLpRvS2Y4MS9RW09eaE1mf3Ui1wz7U/+w2vu27EniHs3XhB0c4be
   f7o7FqnJVPkVASFpNI5xD/2n3c9yWvsOlIIMdPs5/3SBk2gF8t0gK5FBm
   FNbi/0/JRot8TX260oB+BvuCWBKNShYEZ7o3mscCYsu1sEF43P01GIR/E
   J6oTeoHoGSQtmdPzEBbnRFObTuYWhfezf9n3lz+760QOt1awe1SXk+SCg
   6Uktuj0XpOVKfe4ungCmqmqRJ5yrp2EP2w3tkG31Pjik4YNnydNEq5JP/
   /hDre1mCftrEzkSCxWATIwqmvuncNWpiZZtQ1G6+1j0npllBE/eKcq7wU
   A==;
X-CSE-ConnectionGUID: YZdRW1AFQcWQ1X4lwB5tLA==
X-CSE-MsgGUID: G9x8dl13SB2Sg9iLBhM2YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39232340"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39232340"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:04 -0800
X-CSE-ConnectionGUID: NAfUT5uvTf2GQBabAJrOmg==
X-CSE-MsgGUID: vZjT9jKDTv+KWp5c2VKFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111806974"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 06:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9983710D; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Frank Li <Frank.Li@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/4] dmaengine: dma_request_chan*() amendments
Date: Wed,  5 Feb 2025 16:57:08 +0200
Message-ID: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_065806_716500_BE7F7F5D 
X-CRM114-Status: UNSURE (   8.84  )
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


Reduce the scope of the use of some rarely used DMA request channel APIs
in order to make the step of their removal or making static in the
future. No functional changes intended.

In v3:
- rebased on top of v6.14-rc1

In v2:
- updated the commit messages (Frank)

Andy Shevchenko (4):
  dmaengine: Replace dma_request_slave_channel() by dma_request_chan()
  dmaengine: Use dma_request_channel() instead of
    __dma_request_channel()
  dmaengine: Add a comment on why it's okay when kasprintf() fails
  dmaengine: Unify checks in dma_request_chan()

 drivers/dma/dmaengine.c   | 16 ++++++++--------
 drivers/dma/imx-sdma.c    |  5 ++---
 include/linux/dmaengine.h |  6 +++---
 3 files changed, 13 insertions(+), 14 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


