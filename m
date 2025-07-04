Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CCEC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhUBC2e0hoTUPcZ0PfEi91DTT+QY4avDsR2LwRkrfIE=; b=MzZBAOi2+KIPkA2DMGGZhSjs4w
	He2/lpsFDHPdYwuKhF47E0MHSEJK3Em7ZE3xag+ile3U0g6/oUYQJUM4Oy0Cy0D6bPnpEdgorfrdc
	5eRF59CfU3iE4FlkuPdZR7njcz3cDp1aXoqWcO3+AaBpvImkvlm86O7dRSV6829eRIaEd370NMr9A
	v8pX/tM10aIuwtUoMXjMW1/FUrhVV89zV7rL+1vR1ghhn72mC3OfxAq4wAooAa3sGk8hQiuXA4mSq
	8WFDY1PjmN6fJMA3Gq/ezeLP0gEAKrQolZkgcUjVHD+7zw410SY9S+ftRsSbwrycskUiwJTD1gmkd
	nQdAVnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeTz-0000000EBmV-3fgk;
	Fri, 04 Jul 2025 11:21:31 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFD-0000000DcxD-3tV4;
	Fri, 04 Jul 2025 07:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615643; x=1783151643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CWpHJt0mAGlZmpQFo1TAIOu+B6eRgVjwmndVF9RzlEU=;
  b=UoJSx5gn4DLSS6OE0AcrJwjNMmRSFf9BnqCDbi6SxXl4KpWFAh2iEsgG
   o0VdAAvqQK6CmA37K/7z4wl2pkA8KZrb9KW0C4uj4prFb6q4H4oWItx2V
   kFhs1O1Ixf6cTAJQguCBg5KhP93yZKXmmDNHEuIV1/VBlMZNlEDeUFDq2
   +7o25/6hetRz//K5CkSTqy0BfFPNVfINtmAZcHBlMzoNXRkw2u/QwogAB
   lFoVjTTnMgK372geXbULU5dGzpBWemUguj1gNj9o0W3LGsv96mgXKvfYp
   QlOjolNq9NC8PfzcSsEuAk9KzT2dJTMvJxYvyz+wzxEoCShc/Vx++qPLq
   g==;
X-CSE-ConnectionGUID: aq1EMJM8TE+EbwBEROX3gg==
X-CSE-MsgGUID: RMUC+vMbTuiM1lJ9jcY3qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494455"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:03 -0700
X-CSE-ConnectionGUID: uzep9yVhRC2bPONuEIo4wQ==
X-CSE-MsgGUID: XbAEsj6mSMenUt/c5Hz3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924157"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:00 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 648B844424;
	Fri,  4 Jul 2025 10:53:58 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 03/80] Bluetooth: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:58 +0300
Message-Id: <20250704075358.3216833-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005404_014838_D894FEC5 
X-CRM114-Status: GOOD (  13.81  )
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

 drivers/bluetooth/btmtksdio.c | 1 -
 drivers/bluetooth/hci_bcm.c   | 3 ---
 drivers/bluetooth/hci_h5.c    | 2 --
 drivers/bluetooth/hci_intel.c | 3 ---
 4 files changed, 9 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c16a3518b8ff..83aee551a848 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -615,7 +615,6 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 
 	sdio_release_host(bdev->func);
 
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 9684eb16059b..08f9a232e375 100644
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
@@ -749,7 +747,6 @@ static struct sk_buff *bcm_dequeue(struct hci_uart *hu)
 	skb = skb_dequeue(&bcm->txq);
 
 	if (bdev) {
-		pm_runtime_mark_last_busy(bdev->dev);
 		pm_runtime_put_autosuspend(bdev->dev);
 	}
 
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index d0d4420c1a0f..e932d66a1cc0 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -592,7 +592,6 @@ static int h5_recv(struct hci_uart *hu, const void *data, int count)
 
 	if (hu->serdev) {
 		pm_runtime_get(&hu->serdev->dev);
-		pm_runtime_mark_last_busy(&hu->serdev->dev);
 		pm_runtime_put_autosuspend(&hu->serdev->dev);
 	}
 
@@ -634,7 +633,6 @@ static int h5_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 
 	if (hu->serdev) {
 		pm_runtime_get_sync(&hu->serdev->dev);
-		pm_runtime_mark_last_busy(&hu->serdev->dev);
 		pm_runtime_put_autosuspend(&hu->serdev->dev);
 	}
 
diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 811f33701f84..6240ee23e030 100644
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
2.39.5


