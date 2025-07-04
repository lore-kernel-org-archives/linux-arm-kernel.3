Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63C0C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aSORnn2h120W7GENCbjwr6hybaTtoVybLkEaCT6Yfg=; b=p9Y6WGrSp7hsIovE8vPHuaYz+z
	lQAtKrm/DYtks8IpJCE53qJTd2I45gzvvT7jscjEK+q0xw7ySyIFUIvWadwX4lJzb54DaScUhPRnt
	hih4yfd26sqF3NxlPMuJC+zPeXsVmXB7AVktbXgJabk4UdWiwFKpVYcAUu3B/AkTLd0UYzt3dVVgQ
	XiUvioXE3ZdeB0cKtdwVPqX85NYuyHNwkhh3mvR/QV0E9lTFrcd6OMoJJqt8+7Sv2L7CJKlYMABHQ
	6VLwVVlI7DMhSTnXYfeM5x7dPBycFT+jg7UVwGArUSIjnWkYUDSvw4Frz44qi1vjoUsrMxSDBrMEj
	OgIvhSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbQo-0000000Df5Z-34er;
	Fri, 04 Jul 2025 08:06:02 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFL-0000000DcxD-0EC7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615651; x=1783151651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SwA04YuHfWus8Oxzal44FMeOvDW0ynNWLHU3HfszPns=;
  b=dWzM/nVMjhk52QC1M8NF50BrAhfsZiZAhExnJb2Ig2gJ4YnOasdamyEV
   nXO5vQMEjWQqkuMo/39Be9jM0SgVxfOvIPN0REZ9a3wwIs+xao8C8Uy9D
   zszUkumQaq/agqgW/oMwbCIOP77i3vxj/5HmPQ6ZoKtBF7CaiGJNSfDdO
   Fvm8qNj5L4Te8kimbGrnyh+06bDCDW/EylYYfcG42e+8UVv42wL9tnHRv
   LzSpLoSnnyStmuVRfHnM2Cg4x9QN9Ui2YvdcarnXgHJqqU9jSs4bwr8o0
   UsyumyLrJFxdhX8nN3Sz6RrMEnmBkUtDiSSKCZhVLRmsD5LDsHrRfpI4f
   w==;
X-CSE-ConnectionGUID: LkjVJXNpSdCVK0vC/nZCfg==
X-CSE-MsgGUID: T8hOs3j7RjuSaZwykscFMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494499"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:10 -0700
X-CSE-ConnectionGUID: bJgNRm1OQAaHdiPuqBupcQ==
X-CSE-MsgGUID: buF3RBOsQzOoL3A+8dOOYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924192"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:08 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 270E44488D;
	Fri,  4 Jul 2025 10:54:06 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/80] dmaengine: ste_dma40: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:05 +0300
Message-Id: <20250704075405.3217535-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005411_139015_8BE37198 
X-CRM114-Status: GOOD (  12.11  )
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

 drivers/dma/ste_dma40.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d52e1685aed5..13d91d369be2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1452,7 +1452,6 @@ static int d40_pause(struct dma_chan *chan)
 
 	res = d40_channel_execute_command(d40c, D40_DMA_SUSPEND_REQ);
 
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
@@ -1479,7 +1478,6 @@ static int d40_resume(struct dma_chan *chan)
 	if (d40_residue(d40c) || d40_tx_is_linked(d40c))
 		res = d40_channel_execute_command(d40c, D40_DMA_RUN);
 
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
@@ -1581,7 +1579,6 @@ static void dma_tc_handle(struct d40_chan *d40c)
 		if (d40_queue_start(d40c) == NULL) {
 			d40c->busy = false;
 
-			pm_runtime_mark_last_busy(d40c->base->dev);
 			pm_runtime_put_autosuspend(d40c->base->dev);
 		}
 
@@ -2055,7 +2052,6 @@ static int d40_free_dma(struct d40_chan *d40c)
 		d40c->base->lookup_phy_chans[phy->num] = NULL;
 
 	if (d40c->busy) {
-		pm_runtime_mark_last_busy(d40c->base->dev);
 		pm_runtime_put_autosuspend(d40c->base->dev);
 	}
 
@@ -2063,7 +2059,6 @@ static int d40_free_dma(struct d40_chan *d40c)
 	d40c->phy_chan = NULL;
 	d40c->configured = false;
  mark_last_busy:
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	return res;
 }
@@ -2466,7 +2461,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 	if (is_free_phy)
 		d40_config_write(d40c);
  mark_last_busy:
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return err;
@@ -2618,10 +2612,8 @@ static int d40_terminate_all(struct dma_chan *chan)
 		chan_err(d40c, "Failed to stop channel\n");
 
 	d40_term_all(d40c);
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	if (d40c->busy) {
-		pm_runtime_mark_last_busy(d40c->base->dev);
 		pm_runtime_put_autosuspend(d40c->base->dev);
 	}
 	d40c->busy = false;
-- 
2.39.5


