Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B0C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VHG46qePRTbpWA1WuU7Cofgqdo2WqWeWDnrTcNG/Fbc=; b=mAqmiSUAf2kq+e/JkyT+LVN5wU
	/qrv+ixEaqkW72oSTAjgrAFQDF/J3BAa4oBL/+VROwpjG2RATVe5sQpmpIIsxk3l0BdkiTj0KHqC8
	pKFhCd1IPjds/EsDJrESgyEHmlm1snJuVflUljw3HU6LiWpCwc1i7wDgN3xQ++/O8SJzde8noMQDS
	NyXq+NKiLsk4uGUnv8FZLsqZusos4IxOHCN0oqA4ZoQoNrSxXuK0ezAQBpb72r3UNCPvRIQLsYRMg
	R0SINrrKlpFxpUQ0h1l+Sd4pEh+FRnjr6izfCPI9by0W63paimfz31ZrGnAsQuBXHxSWVAl4C3dCs
	4a8K/uiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULxc-000000082zU-3ESu;
	Wed, 25 Jun 2025 08:58:28 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULHe-00000007vQE-2Ouf;
	Wed, 25 Jun 2025 08:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750839307; x=1782375307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VcCasfOKf3wY7lXUeCooCr/f7j0f+z8fz2NB7sEXlwA=;
  b=MLWLEBRJ/myjFCWlLX9se9DU2PJb8Ke2D5RZXJCv37SHFADBhjvr6pjY
   ZkEnh4l/1xOwC6FgJCQFzp7yXreQRthMcu08AYcZ/hwUSTiU8Ot8C/qCe
   Rj3SwI2oTPRCZOMc5gvm1596bvFHPG69Bn2/UEcItcj83D/ZB9xeCGw6b
   pCuWoa+wSv09yA2qdpVeiumch7rZV3AXdUi907haGLLaQKBlvfBqycRLy
   ZGuWB7CCbfINqSgM1vnneYFtdpB3tiu3GbUUuGiNBn+p5iJwFCMsnkhFl
   Pd4BgHF8tzzo+OB3WuyKmMY2LVbJtgGeGTioMhvqYOC8XBmnBluUoNG/G
   A==;
X-CSE-ConnectionGUID: vm00gCzqQYWe7anyZCbppQ==
X-CSE-MsgGUID: fwP8AJ3WQDamSydetTThMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56775911"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56775911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:15:06 -0700
X-CSE-ConnectionGUID: SEsMtY16SReC2E4iL3FkOA==
X-CSE-MsgGUID: 4EhfEAXgQKqA5x5dAH4ATw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156716161"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C24FC11F742;
	Wed, 25 Jun 2025 11:15:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uULHZ-009zq9-2U;
	Wed, 25 Jun 2025 11:15:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] mailbox: mtk-cmdq: Switch to pm_runtime_put_autosuspend()
Date: Wed, 25 Jun 2025 11:15:01 +0300
Message-Id: <20250625081501.2382657-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_011506_652819_603EEC1A 
X-CRM114-Status: GOOD (  11.81  )
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

__pm_runtime_put_autosuspend() was meant to be used by callers that needed
to put the Runtime PM usage_count without marking the device's last busy
timestamp. It was however seen that the Runtime PM autosuspend related
functions should include that call. Thus switch the driver to
use pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index ab4e8d1954a1..532929916e99 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -390,7 +390,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
 	if (!task) {
-		__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+		pm_runtime_put_autosuspend(cmdq->mbox.dev);
 		return -ENOMEM;
 	}
 
@@ -440,7 +440,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	list_move_tail(&task->list_entry, &thread->task_busy_list);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 }
@@ -488,7 +488,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 }
 
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
@@ -528,7 +528,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 
@@ -543,7 +543,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 		return -EFAULT;
 	}
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 	return 0;
 }
 
-- 
2.39.5


