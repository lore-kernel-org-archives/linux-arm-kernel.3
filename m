Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E04D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qa/Vn79sYc/2vpTEh8B+lsrkZfuYz71JIBQPlwooPhc=; b=3AcCBu+GB0KHZ4Q+R8gYT6zFhk
	cNMUwZFgIkLYEvLpIPFRd07SX4TvFJ+zTgyjgGkrNdxvwJ10iAHOEaRm1To4Hp7zWL6omRX8GDxMg
	cuqnY6FvnioaheYHv3KCLacnxPyCp/Ty6Ft+yCv3bEivemUyMcP3R2Hcz6P8sbuTuICH+9KHcrOPd
	AFUNqticRHmLK7c9H1IZ1kbaguuxo3gHJA3guNDm3JbreGiSUCtjLfbQcQLd5+TtzPKpkRqsKqwjU
	WZZ20ce3lCU28Zq2msZNTqoZRmnoE+508055PWYwX81XzGlAssyv4m4f8d6zdUcFtEzyY0VLaFpUr
	NCxarRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7ae-00000003bTS-0GsH;
	Mon, 15 Dec 2025 12:22:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7aa-00000003bSx-3a8W;
	Mon, 15 Dec 2025 12:22:10 +0000
X-UUID: a8a33f48d9b011f0a52f393f94899d25-20251215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qa/Vn79sYc/2vpTEh8B+lsrkZfuYz71JIBQPlwooPhc=;
	b=XpD3toFO5bN5TlyGuWrok+W1ZUkSrP5q8DnWwmmfAgMI/CwQRiricRBjekECrs98U5HJE7oiqGN251uG9E6n2Mzf8lfmfOWqDDHv8bVyfLFEq5AGKmO0U2zrpOYCBtgvC85vs7O9TaEzAaPAgT+uHfOYLmsRxVqnzgRcmfVJtBs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9013a1f1-98cf-455a-8b6c-6a6a9e8e04f6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:7f0036aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a8a33f48d9b011f0a52f393f94899d25-20251215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 627645115; Mon, 15 Dec 2025 05:22:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 20:21:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 20:21:58 +0800
From: <ed.tsai@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <freddy.shin@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/1] PM: runtime: fix bitfield race of needs_force_resume
Date: Mon, 15 Dec 2025 20:21:42 +0800
Message-ID: <20251215122154.3180001-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_042208_983089_019374CC 
X-CRM114-Status: GOOD (  10.65  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

needs_force_resume is a bitfield member in struct dev_pm_info and must
be accessed under the same lock as its bitfield group.

A real concurrent write was observed between needs_force_resume and
idle_notification; stacks below:

write needs_force_resume:
  pm_runtime_reinit+0x110/0x360
  really_probe+0xe0/0x464
  __driver_probe_device+0x9c/0x104
  driver_probe_device+0x3c/0x1a8
  __device_attach_driver+0x100/0x17c
  bus_for_each_drv+0x10c/0x168
  __device_attach_async_helper+0x7c/0xf4
  async_run_entry_fn+0x4c/0x1b4
  process_scheduled_works+0x1dc/0x498
  worker_thread+0x220/0x320
  kthread+0x150/0x27c
  ret_from_fork+0x10/0x20

write idle_notification:
  rpm_idle+0x464/0x5f8
  __pm_runtime_idle+0x7c/0x170
  scsi_autopm_put_device+0x18/0x28
  scsi_sysfs_add_sdev+0x1a0/0x1d8
  scsi_probe_and_add_lun+0xbd8/0xcd0
  __scsi_add_device+0xb8/0x11c
  ufshcd_async_scan+0xb4/0x3a4
  async_run_entry_fn+0x4c/0x1b4
  process_scheduled_works+0x1dc/0x498
  worker_thread+0x220/0x320
  kthread+0x150/0x27c
  ret_from_fork+0x10/0x20

Fixes: 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()")
Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/base/power/runtime.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 84676cc24221..3328543b1ed8 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1879,11 +1879,22 @@ void pm_runtime_reinit(struct device *dev)
 				pm_runtime_put(dev->parent);
 		}
 	}
+
 	/*
 	 * Clear power.needs_force_resume in case it has been set by
 	 * pm_runtime_force_suspend() invoked from a driver remove callback.
 	 */
+	if (dev->power.irq_safe)
+		spin_lock(&dev->power.lock);
+	else
+		spin_lock_irq(&dev->power.lock);
+
 	dev->power.needs_force_resume = false;
+
+	if (dev->power.irq_safe)
+		spin_unlock(&dev->power.lock);
+	else
+		spin_unlock_irq(&dev->power.lock);
 }
 
 /**
-- 
2.45.2


