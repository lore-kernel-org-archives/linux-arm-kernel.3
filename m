Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4053CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dF7Z4uf6So4kcsY5DTVUHGs58d6p63lEZVd0UOOfc60=; b=0xu86xAvaW1+5z68BDokoB8Vku
	bpJltU7E1g5Ke0H6s1gyewvX5vyJeNm+lO4n7L0Ioo04ImT+eZWidsqD9x3FHX8lSLxJcYZoa7BA7
	rX3lUhJRBMydPnzN4C3bs6G3YkodlfHokJ90w+o4xH9H5Vobmh9x+HFKxhMQ1r/xzZrlyMfyp/pWo
	pRB/EUOM/bHilnv7l9jK/3X9LYxcx3P1gQjJmTt/1hxZ8RoyynD91DO9COubuUp9G9qMC0qyffD9o
	N6gCsVyIl9Oxl169Wmzk+KDFUSJD7Cr3AHPv2dvqH/IbNgFsA4mnYghMtlfECitUlmeQBAZ4iLWer
	CHzIh4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNNx-0000000E43d-26ot;
	Mon, 27 Oct 2025 13:35:45 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNNu-0000000E42Z-2bwW;
	Mon, 27 Oct 2025 13:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761572142; x=1793108142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G8I7MYOKAADcUiNhrxg4rHdSnpHAvfS12L4GSyQ1JFI=;
  b=nAIcy4F/qeSAJt9rvrgCpjvVcyqbUTeQkvg1nKZPjOVNz9OKhpFCD/Vd
   xaODUGm0TSIhxmc0DJoWoPjLTkg8cZX1mNs497AXzv06mxjZIkuet6N2V
   /0UulzvItgvlej5s19JpU0NwHZOZ6gXik/X0S/ip6NSQ6SYS3XY4xFqT6
   0cqElCZRTW+fQmcIKctiJjqmavhlmH9p2nSpnrWscivl6oE8QzmHhR2Mr
   8GhhTsCKAGgV9NwJswFA+5KYRROPwENwDGKtwsC90dGmo8q4VCSBnLYpS
   gsjoMRnJfSe+bCcitVpfFoKbquINtCx+Nramko25s/ewmuiRKCaoMbM/S
   A==;
X-CSE-ConnectionGUID: v+9ek5vEQcG7DJfopa3h2Q==
X-CSE-MsgGUID: e/DvewSATpSuC6C/kBoFkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81280581"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="81280581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:35:42 -0700
X-CSE-ConnectionGUID: DLCoqoqJT7aiU6Mnlnl3og==
X-CSE-MsgGUID: uWrY6G3cTv6Z38089zaNyg==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:35:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 47A0111FADA;
	Mon, 27 Oct 2025 15:35:38 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNNq-00000001eH8-17jf;
	Mon, 27 Oct 2025 15:35:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/1] Bluetooth: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:35:38 +0200
Message-ID: <20251027133538.393138-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063542_671787_3CC0AF29 
X-CRM114-Status: GOOD (  11.76  )
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
 drivers/bluetooth/btmtksdio.c | 1 -
 drivers/bluetooth/hci_bcm.c   | 6 +-----
 drivers/bluetooth/hci_h5.c    | 2 --
 drivers/bluetooth/hci_intel.c | 3 ---
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 62db31bd6592..fba3ab6d30a5 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -615,7 +615,6 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 
 	sdio_release_host(bdev->func);
 
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index fff845ed44e3..9286a5f40f55 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -326,7 +326,6 @@ static irqreturn_t bcm_host_wake(int irq, void *data)
 	bt_dev_dbg(bdev, "Host wake IRQ");
 
 	pm_runtime_get(bdev->dev);
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return IRQ_HANDLED;
@@ -710,7 +709,6 @@ static int bcm_recv(struct hci_uart *hu, const void *data, int count)
 		mutex_lock(&bcm_device_lock);
 		if (bcm->dev && bcm_device_exists(bcm->dev)) {
 			pm_runtime_get(bcm->dev->dev);
-			pm_runtime_mark_last_busy(bcm->dev->dev);
 			pm_runtime_put_autosuspend(bcm->dev->dev);
 		}
 		mutex_unlock(&bcm_device_lock);
@@ -748,10 +746,8 @@ static struct sk_buff *bcm_dequeue(struct hci_uart *hu)
 
 	skb = skb_dequeue(&bcm->txq);
 
-	if (bdev) {
-		pm_runtime_mark_last_busy(bdev->dev);
+	if (bdev)
 		pm_runtime_put_autosuspend(bdev->dev);
-	}
 
 	mutex_unlock(&bcm_device_lock);
 
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index 43371f389fd2..96e20a66ecd1 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -616,7 +616,6 @@ static int h5_recv(struct hci_uart *hu, const void *data, int count)
 
 	if (hu->serdev) {
 		pm_runtime_get(&hu->serdev->dev);
-		pm_runtime_mark_last_busy(&hu->serdev->dev);
 		pm_runtime_put_autosuspend(&hu->serdev->dev);
 	}
 
@@ -658,7 +657,6 @@ static int h5_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 
 	if (hu->serdev) {
 		pm_runtime_get_sync(&hu->serdev->dev);
-		pm_runtime_mark_last_busy(&hu->serdev->dev);
 		pm_runtime_put_autosuspend(&hu->serdev->dev);
 	}
 
diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 1d6e09508f1f..20baf2895dec 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -280,7 +280,6 @@ static irqreturn_t intel_irq(int irq, void *dev_id)
 
 	/* Host/Controller are now LPM resumed, trigger a new delayed suspend */
 	pm_runtime_get(&idev->pdev->dev);
-	pm_runtime_mark_last_busy(&idev->pdev->dev);
 	pm_runtime_put_autosuspend(&idev->pdev->dev);
 
 	return IRQ_HANDLED;
@@ -371,7 +370,6 @@ static void intel_busy_work(struct work_struct *work)
 	list_for_each_entry(idev, &intel_device_list, list) {
 		if (intel->hu->tty->dev->parent == idev->pdev->dev.parent) {
 			pm_runtime_get(&idev->pdev->dev);
-			pm_runtime_mark_last_busy(&idev->pdev->dev);
 			pm_runtime_put_autosuspend(&idev->pdev->dev);
 			break;
 		}
@@ -1003,7 +1001,6 @@ static int intel_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 	list_for_each_entry(idev, &intel_device_list, list) {
 		if (hu->tty->dev->parent == idev->pdev->dev.parent) {
 			pm_runtime_get_sync(&idev->pdev->dev);
-			pm_runtime_mark_last_busy(&idev->pdev->dev);
 			pm_runtime_put_autosuspend(&idev->pdev->dev);
 			break;
 		}
-- 
2.47.3


