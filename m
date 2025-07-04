Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838C2C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JxHqdHcr37sV3G3ZlvCyg8R1vov+RlBJSxPQmqZJM8=; b=xDIGncHOC2bdN1mj216Ts7WBLC
	Li0L6NbfclRhPkfcK/hfUQisnhVHpgtNbv2M80BnR+ArZieFqnL6i+b2yR0Wzcy/c3Ay3sZiFFM9U
	QZ/0Uax1jO+cZ6ia9rBP6Vpq5PLrUqGd2sEVL9bY5TzTvH1uFlHSTAjfQEcEnmWrjQ0jnB/wQbv4B
	OwjZQgYDWmwloNyavGElqgP4IEASSZDVahzkAlJzBZnS7SIyYKbPFzJHDlh1J28fz0XZizHPI6FWE
	PwmrEppzXyZR4oGXQ0ZnJNi15Ltp7+vsmYz3s43Wnd6fZvZSDwuNX8ZhLz26bTx4FEnQ9RGydwkEs
	DQfBxyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU1-0000000EBng-1gUt;
	Fri, 04 Jul 2025 11:21:33 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFN-0000000DcxD-3gZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615653; x=1783151653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yOZfd0doZbXNg800IlwSq25+2rcm+my/SjHfpGQtN7o=;
  b=cQ62s0S6+Tz9ONNnNiguz8NLXRHFKOGPEZ0sSssGe4LiPnoWze8NQPwP
   hGT4+0uARKtDGIB7gP0n84TGI5G2b9cbheyEUJwVUnqf2ToV6jogFWUS4
   soQ1XLX9TIiDrNBg0ikdBdwaJ1JhQnO66yEu4Z1pENV5UNgNN9og1YjBi
   LPELzHg1fFN4VBMrnTfm4wztf0fJ/Pq4kdOUdlJAnGfd7SHHySg0wwFj7
   VJgh6mIt/0LmCsar8McmOb/QXoNFS8lufid1mfG/oiSSv1mRrybRNLHdD
   mkZG9S87sG8ZHK6wDJ2I0k+T22iFqKPT/alr+EucPaV6AccH+dZETuHeL
   A==;
X-CSE-ConnectionGUID: Q93TrNpQT0awy5zcL3QKiA==
X-CSE-MsgGUID: 2/6xLdPQSt6UmxqRu9Qk2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494536"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494536"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:12 -0700
X-CSE-ConnectionGUID: 7LRH1JZBRZa36akWsFoezQ==
X-CSE-MsgGUID: Zfiru8UkStqJOwODVPppxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924195"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:09 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id B5F5044394;
	Fri,  4 Jul 2025 10:54:07 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Abin Joseph <abin.joseph@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/80] dmaengine: zynqmp_dma: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:07 +0300
Message-Id: <20250704075407.3217630-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005413_962501_0FFDEE92 
X-CRM114-Status: GOOD (  11.55  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/dma/xilinx/zynqmp_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index d05fc5fcc77d..1e2b9f37fd40 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -695,7 +695,6 @@ static void zynqmp_dma_free_chan_resources(struct dma_chan *dchan)
 		(2 * ZYNQMP_DMA_DESC_SIZE(chan) * ZYNQMP_DMA_NUM_DESCS),
 		chan->desc_pool_v, chan->desc_pool_p);
 	kfree(chan->sw_desc_pool);
-	pm_runtime_mark_last_busy(chan->dev);
 	pm_runtime_put_autosuspend(chan->dev);
 }
 
@@ -1145,7 +1144,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 		goto free_chan_resources;
 	}
 
-	pm_runtime_mark_last_busy(zdev->dev);
 	pm_runtime_put_sync_autosuspend(zdev->dev);
 
 	return 0;
-- 
2.39.5


