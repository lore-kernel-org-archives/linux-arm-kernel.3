Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB4CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyxD9Boc+ibOartMo5HwRbgyceQjp6DjZGkKk0jShXE=; b=4AuDrqLVO7VlqwyLYiwuo4UcNk
	wtqLFQtkcNOTe/U5Zvs4aNs4ZcdUJKoJ7ThweDgwdFBKEQCZ+PpEIoZb7VWlUUyi2nosruqXdeg6i
	PnaBNd96fxhEpjQV6dRdoowvEjRgB8CJJJbKS/QNepW4QytCFZdK3PPBvNoIGdVy0gjPGFPgUorKc
	PSlqJayq1SizQOXYt/hkBVxUMdj0NelSbOvraEyE3GQktG7BiwpFtXrDY+os7EHg7pB9q4eFD85sV
	cwfy0akBji8bOlG/+5gd9+sIwwn7+rMbWrkBSfyRq6pJABojNT1lUGUsdbJKJyzfkyjiwmEOGeViL
	2Z6MoSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNL5-0000000E2yB-2By9;
	Mon, 27 Oct 2025 13:32:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNL2-0000000E2xl-2wtU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571965; x=1793107965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mSv4aivh/25dKTV3yCbWUl1DefAAZN9jvBNFADSthdA=;
  b=ixm1AiBv5DGw2Qrxn49U98hf89fTl73hzmUsus7YrmRk/p2xroOriCg5
   G0kuX1i4Nps/k6m6B/OqLmzRnCREmbAColxzzE5sLYCyd86Omp2KLz/Wu
   uZiCvIloZY3IqH3Y/CfPmC/IABOfxUj0BnwpMAWO3nmHeFEN4RfoFPqTW
   1UqwDY0fSP5nI9b3BUbUoSkf4fZILDbMgRdXB/Tu0TrNQVWILYZc1qAmm
   +wPIn/Ia3MRMCnD4MxVH5L63aBygHklD+G3G4cG86fvt9dZZKDoQXyF6Y
   L376V9a2EMnE+R53fYrDKOAXUytZSXSQhIbU4LyZL1WfVjUgTD4gUkXka
   g==;
X-CSE-ConnectionGUID: HL16IUF6RySnSj03tenyhQ==
X-CSE-MsgGUID: AfnKlprwTbiVG0PVMoSaNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86277752"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="86277752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:45 -0700
X-CSE-ConnectionGUID: U+nLFdlWRzyJoRqjD+5+rw==
X-CSE-MsgGUID: z07qLKJvQUqaBN4Doutzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190176389"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A3D22121F01;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDf-2iIp;
	Mon, 27 Oct 2025 15:32:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/6] dmaengine: ti: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:31 +0200
Message-ID: <20251027133232.392898-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063244_798847_65DF41E6 
X-CRM114-Status: UNSURE (   9.82  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/dma/ti/cppi41.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 8d8c3d6038fc..88756dccd62c 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -390,7 +390,6 @@ static int cppi41_dma_alloc_chan_resources(struct dma_chan *chan)
 	if (!c->is_tx)
 		cppi_writel(c->q_num, c->gcr_reg + RXHPCRA0);
 
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 
 	return 0;
@@ -411,7 +410,6 @@ static void cppi41_dma_free_chan_resources(struct dma_chan *chan)
 
 	WARN_ON(!list_empty(&cdd->pending));
 
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 }
 
@@ -509,7 +507,6 @@ static void cppi41_dma_issue_pending(struct dma_chan *chan)
 		cppi41_run_queue(cdd);
 	spin_unlock_irqrestore(&cdd->lock, flags);
 
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 }
 
@@ -627,7 +624,6 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
 	txd = &c->txd;
 
 err_out_not_ready:
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 
 	return txd;
@@ -1139,7 +1135,6 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_of;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.47.3


