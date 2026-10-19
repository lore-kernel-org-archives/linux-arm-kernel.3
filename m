Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57840609CEF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zEe/OtAx;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bNkDF4Kc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GwztzXGiW7OnAu9QbRSyq73Z8Eatn3pZ575kk94zIeU=; b=zEe/OtAxfoLjwbJut7dAkvZNBB
	hCKRJv0cr+WHkVzTKm/K8AjW+qDeddRQ7E6rff6Faj64bog1f/n0MA2HhmMLmfhyAbgwxctTX66qc
	GvDcyeI8Tl92sYDWatjhs+WewjTxNQhRYu0CRgYFwrGoX6/pC5BS+vhCZ0HPB+UdOYlNl77myoqUU
	A6bkLgBtFOQE+z3ivCeJXuifyEpIrhd+nTzDJo/lp9gpt5T36zSb7GiQlTCB1reJfLvM8x7ruaRPZ
	VB+AAIW4MVXG44Z2RPh5Y3GMijzF2HqYW7UaP6Q1ur4HiIiKwh8DyBy0G96hnzod+BKXbLnKbkFr0
	JWD94XsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4T-00000007p4d-0Ddb;
	Mon, 19 Oct 2026 15:14:41 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4P-00000007p3B-1521
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422878; x=1823958878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OxZSt/jYZA56remEOs1LpCwtEvXYIh/MngBNA+cobgk=;
  b=bNkDF4KcJcE73Y4O1F81S4ku7pCOTu6n8sBhnPbHB3NkVQrMQu0q6AHg
   ZKbBt01PgM6VtVnT1UN+0ldmmFd0MAWCClr8RNe4kioJUSDraTy6hXuEl
   N8uP1U5RajzzjxwIuWeiyExxLPoSfj/Ww/SM5uL2zLS/eNYD7fx5a7jNk
   GknMmJ0iJXhUpHD4e9f9Yt91dg+1ZpuQhCV9g2l50bVXaxesAkYlgkkm1
   v4zkZlTQugy9PiKPiGiVRp59XacTcDJDGpywNAS6oMF5fX/XFkYh6nM2x
   c/2e/mdwr7rgxLPr+ozH0soEUnSRlLEGvPljll5uSZguobLnZKkq4uufG
   w==;
X-CSE-ConnectionGUID: GJj56m5tSSC3RPNPDQDxxg==
X-CSE-MsgGUID: j6o7cFcXRM29ErzE+n6TUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992122"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: fMGnTY3hS0iQdJ3EoYwDkw==
X-CSE-MsgGUID: pdPHpR76Q/+JLFYQNK5E1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636134"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:35 -0700
From: Daniel Byrne <daniel1.byrne@intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] [PATCH 0/3] dmaengine: polled completion status for out-of-order providers
Date: Mon, 19 Oct 2026 08:06:29 -0700
Message-ID: <20261019150632.4026424-1-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_081437_395484_C38C1756 
X-CRM114-Status: GOOD (  10.34  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A client that polls transaction status on a device whose work queues
complete out of order, as DSA's do when several engines serve one
queue, cannot use the cookie-ordered dma_async_is_tx_complete(): the
completed-cookie watermark moves past descriptors still in flight.
These three patches add dmaengine_async_is_tx_complete() as the polling
API, routing the query to device_tx_status() without the cookie-window
outputs, implement it in idxd from a generation-numbered cookie that
reads the descriptor's own completion record, and drop
DMA_COMPLETION_NO_ORDER and DMA_OUT_OF_ORDER, whose only setter was
idxd. dmatest's polled mode is the in-tree user; the io_uring DMA copy
offload, to be posted separately, is the one that needs the exact answers.

This applies on top of "dmaengine: idxd: fixes found by an in-kernel
polling client", posted alongside, which the status implementation's
reset-epoch handling depends on.

Daniel Byrne (3):
  dmaengine: add dmaengine_async_is_tx_complete() for channel status
    queries
  dmaengine: idxd: generation-number transaction status
  dmaengine: drop DMA_COMPLETION_NO_ORDER and DMA_OUT_OF_ORDER

 Documentation/driver-api/dmaengine/client.rst |  24 +--
 .../driver-api/dmaengine/provider.rst         |  64 ++++---
 drivers/dma/amba-pl08x.c                      |   2 +-
 drivers/dma/at_hdmac.c                        |   5 +-
 drivers/dma/dmaengine.c                       |   2 +-
 drivers/dma/dmaengine.h                       |  21 ++-
 drivers/dma/dmatest.c                         |  14 +-
 drivers/dma/idxd/device.c                     |   1 +
 drivers/dma/idxd/dma.c                        | 159 +++++++++++++++++-
 drivers/dma/idxd/idxd.h                       |   3 +
 drivers/dma/idxd/irq.c                        |   8 +
 include/linux/dmaengine.h                     |  55 +++---
 12 files changed, 268 insertions(+), 90 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
prerequisite-patch-id: b50615a6696ce4ffa7e20911f77b9f7f0481f14f
prerequisite-patch-id: 36d833fd556bce04054a7e373ee46575186bb58c
prerequisite-patch-id: 3aeecac097eafb6812e10b9896a242c61c4ca5da
prerequisite-patch-id: 99e0468cdabf56a287c6a7f2d7ef06aa6d5a573e
prerequisite-patch-id: b1dd90551e6b671e751aae8d2a688d9db8f300f5
prerequisite-patch-id: c99a06be81e6a56d84a14bf9e00d2b48455c3a89
prerequisite-patch-id: 3e39b306130b75fedae70a328072dc9577818b9f
prerequisite-patch-id: b1d8fb5b5f7f478adca95f4c8b632480164d18b4
prerequisite-patch-id: b6d48ab83002f113833ba874be299c241788dd30
prerequisite-patch-id: 53bb73bdfd98cd78ca5d86b00ad7e96fcebf7ee6
prerequisite-patch-id: de44e2d44df13e8e07ae00df842d67c9d5c874d2
prerequisite-patch-id: 8191bc0ef2c849d2d9d55f73fc2169f695ea8594
prerequisite-patch-id: bfc55b104522278ca1fba36d3f4adb3a306267bc
prerequisite-patch-id: 12c1f4cba95509b8e7e87ce5c2f9c4265ec0c2df
prerequisite-patch-id: 6e859bfd95e53386bce02ac6585f09a067d0bb8e
prerequisite-patch-id: 2874936c0a5b3863db0309e06ee93008890a714e
prerequisite-patch-id: 85ef17aa68aecd398d3b47ad8df435ce715572e8
-- 
2.43.0


