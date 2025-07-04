Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F5FC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+egu3oillamN7jU/mQE0MZfVlGAw3DJ1hNUC9ldWzH8=; b=Vlu8mIkP/VHNNX0kxxmEVM4Zh/
	AZqUscLN8B92oyqHcFUWCvvr8l2RpZgYYywbd3mrYL8pMCaO1BA1GTBGmDV7MlX7ra7wuN31LpMJt
	WKHU8iXzVgfq2lZDoL7GraT1EjqMOGacuYgLNowFyDv7kq5hhNdnxGBcYlaTiH3cMMPotkNKgJsi0
	Nx5Sj71NWUXAwgP4tWrZf62EBT6Pxwy7rAtRa2fpa+m/qtUfrtnkwZlS5FjT36DwcvoSG4iS97JEw
	ghm8C+um6lCV4Q73sPS2iQu+rYtAkt/L0UwrIDQRZcsq5NLNVU4PhgKViDposUWLOGJFF9umCGsks
	lFzyWp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbXl-0000000DgPZ-0csv;
	Fri, 04 Jul 2025 08:13:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFQ-0000000Dd1c-2aMu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+egu3oillamN7jU/mQE0MZfVlGAw3DJ1hNUC9ldWzH8=; b=R1JRxYYXaVr+o0taaTSAuXZcUl
	ZDpnbLUbpWMvtPZum9IdvlFlnLjj3/UZa2NbZixNeWs/WW2h54t0883h9E13/+YMZuJoPzIGFGlTZ
	cvHEzyaCSwahRq16TzDpS6Dz6blXsjBTectSvIu+zv65p18SFjVa6chppl7hIGt1e338v8Vi1gjKA
	haw97WE6XlX8IBIBYyGZMIoeNaL2ZDQYflC1zp4Y4+2VYfuZBzRecrpNV1RroqyCCW/aq8rBGELnp
	PS2QCSjf0DtaljWIc+MN/rjOQ6BPn9es4sljD1u5osXqFcxbltXA6L0NTI4q5UOYd3Y8me50rGEga
	dNhkShqQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFN-00000007pd2-19QD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615653; x=1783151653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=idtG3pDBv5DgyV7D3aigFbrwhSp2laJtAcE/7Pv7P1g=;
  b=BzLX2BVNLfq6uLsSj/mKbS0lCE+DXFJ1kopsyMgdR2llABQyZDPzVQDJ
   lfZqMvSU4vjfa7iCfCCSVLltQdLLKFXGvbsieiLLadag1g0QOenI6mQjy
   Wy6HCEfNJutdUO3RbjbgokWNvyqFkVZCSfwMbS6M/DI8sI3MLhF21k9+S
   gesuqkLUVeTltNPxGYG7sxnOQFJ+T66p6kuUCQMi3aXlrvROu0sOAMpIZ
   J2WfP+2/k/lMgzEknecnVIH5Uao8TK5gMkImg8ndjo0NZPltzGpimo/Kx
   FPLcD07TT8CWX0twzltRulbFHmXYditJqzaw6Ru538rmLB5hty7dqJNyx
   Q==;
X-CSE-ConnectionGUID: dvwaIyXoTlSCZnUZcL80/w==
X-CSE-MsgGUID: evTodkk7TfSqxW7gkIrImQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494477"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:07 -0700
X-CSE-ConnectionGUID: 00X7z1oiRGqCCXA6+HS3rg==
X-CSE-MsgGUID: kKQmFDQvSoyWf0iOufJ0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924183"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:06 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id B64E244424;
	Fri,  4 Jul 2025 10:54:03 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/80] dmaengine: at_xdmac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:03 +0300
Message-Id: <20250704075403.3217327-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085413_732660_66F84E89 
X-CRM114-Status: GOOD (  11.36  )
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

 drivers/dma/at_xdmac.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 3fbc74710a13..ada96d490847 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -379,7 +379,6 @@ static void at_xdmac_runtime_suspend_descriptors(struct at_xdmac_chan *atchan)
 		if (!desc->active_xfer)
 			continue;
 
-		pm_runtime_mark_last_busy(atxdmac->dev);
 		pm_runtime_put_autosuspend(atxdmac->dev);
 	}
 }
@@ -413,7 +412,6 @@ static bool at_xdmac_chan_is_enabled(struct at_xdmac_chan *atchan)
 
 	ret = !!(at_xdmac_chan_read(atchan, AT_XDMAC_GS) & atchan->mask);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return ret;
@@ -446,7 +444,6 @@ static void at_xdmac_off(struct at_xdmac *atxdmac, bool suspend_descriptors)
 		}
 	}
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 }
 
@@ -1676,7 +1673,6 @@ at_xdmac_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 
 spin_unlock:
 	spin_unlock_irqrestore(&atchan->lock, flags);
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 	return ret;
 }
@@ -1758,7 +1754,6 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 		__func__, &bad_desc->lld.mbr_sa, &bad_desc->lld.mbr_da,
 		bad_desc->lld.mbr_ubc);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	/* Then continue with usual descriptor management */
@@ -1822,7 +1817,6 @@ static void at_xdmac_tasklet(struct tasklet_struct *t)
 	 * Decrement runtime PM ref counter incremented in
 	 * at_xdmac_start_xfer().
 	 */
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 }
 
@@ -1954,7 +1948,6 @@ static int at_xdmac_device_pause(struct dma_chan *chan)
 
 	spin_unlock_irqrestore(&atchan->lock, flags);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -1998,7 +1991,6 @@ static int at_xdmac_device_resume(struct dma_chan *chan)
 
 unlock:
 	spin_unlock_irqrestore(&atchan->lock, flags);
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return ret;
@@ -2041,7 +2033,6 @@ static int at_xdmac_device_terminate_all(struct dma_chan *chan)
 	clear_bit(AT_XDMAC_CHAN_IS_CYCLIC, &atchan->status);
 	spin_unlock_irqrestore(&atchan->lock, flags);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -2235,7 +2226,6 @@ static int __maybe_unused atmel_xdmac_resume(struct device *dev)
 		}
 	}
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -2412,7 +2402,6 @@ static int at_xdmac_probe(struct platform_device *pdev)
 
 	at_xdmac_axi_config(pdev);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.39.5


