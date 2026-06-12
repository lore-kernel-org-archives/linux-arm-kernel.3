Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF693CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0jVXe+HmAmsUTiUc8ErqpJQFUp2A/OQkNGrhA6RgKRc=; b=dbG5ZdUGyi/xAEg825pdKOliQq
	zblEA+keoKlWoia1KyHYHnw1JU88uTqAToLc1sL/okoGhPe4oe4y2Ub1AFy6R9p2y0by1nwChmDCC
	T/PB6VnKLJHkMqewZ1GIaJakwaibNxCxGHBGSPUQc5IsfJviQrZtyQJP/fiWzjMGSx3DOTzKs4rFN
	W2Y/lO9aeF1XQX/gS/WCbOyazdzKyVxsYv1zlfVPOvSg0WER1x4Eof6JCLeriHqVFPSWE2MMi3379
	ivr9138qeacfiw2uxBA4Ax3gTWe8MpIhzSUabDvXiixHXXFQ6bl/8YD8ECM3Y8nBtmeSYbJ82pqaB
	+aYaMi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtH8-0000000AL37-2CB2;
	Fri, 12 Jun 2026 04:13:46 +0000
Received: from mail-m2417.xmail.ntesmail.com ([45.195.24.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtH4-0000000AL2L-0rAC;
	Fri, 12 Jun 2026 04:13:44 +0000
Received: from PC-202605011814.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 421956ae9;
	Fri, 12 Jun 2026 12:13:37 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: nbd@nbd.name
Cc: lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: mt7615: avoid waiting for mac work under the mt76 mutex
Date: Fri, 12 Jun 2026 12:13:31 +0800
Message-Id: <20260612041331.2596331-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eba0914e503a1kunm03fd2058183751
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0geVhofSBkfSkNDGRpPQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=cWjZqvCkwXxZVEbFjh68UQ7EaB9BcYLiUm9fHZlAvdm5EJyYXSjW+nOjIoALwAHo/UPqk9Txv9JBE3aq6u1bPw4ivGw+gzoZbUE12ysfRWnAdD4KKa6nywJJhwBOtfNngJPPp84UWNvUoM2z5o8nqs2eSK5COoxOt58ERLBOfdo=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=0jVXe+HmAmsUTiUc8ErqpJQFUp2A/OQkNGrhA6RgKRc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211342_804241_90D78AB6 
X-CRM114-Status: UNSURE (   8.39  )
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

mt7615_suspend() takes the mt76 mutex and then waits for mac_work with
cancel_delayed_work_sync().  mt7615_mac_work() takes the same mutex at
the top of the worker, so the suspend path can deadlock against the
delayed work it is trying to flush.

This issue was found by our static analysis tool and then manually
reviewed against the current tree.

The grounded PoC kept the mt7615_suspend() ->
cancel_delayed_work_sync(&phy->mt76->mac_work) path and the
mt7615_mac_work() -> mt7615_mutex_acquire() edge.  Lockdep reported:

  WARNING: possible circular locking dependency detected
  mt7615_mac_work+0x1b/0x29 [vuln_msv]
  __cancel_work_timer
  *** DEADLOCK ***

Stop queueing mac_work while the mutex is held, drop the mutex, and then
flush the delayed work from the sleepable post-unlock path.

Fixes: c6bf20109a3f ("mt76: mt7615: add WoW support")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Notes:
  - Validated with a grounded Lockdep PoC that preserves the
    mt7615_suspend() -> cancel_delayed_work_sync(&phy->mt76->mac_work)
    path and the mt7615_mac_work() -> mt7615_mutex_acquire() edge.
  - checkpatch.pl --strict: clean.
  - Not tested on mt7615 hardware.

 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 15fe155ac3f3..fcb619c0f6cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -1242,7 +1242,8 @@ static int mt7615_suspend(struct ieee80211_hw *hw,
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 	cancel_delayed_work_sync(&phy->scan_work);
-	cancel_delayed_work_sync(&phy->mt76->mac_work);
+	/* mac_work re-enters the mt76 mutex, so flush it after unlock. */
+	cancel_delayed_work(&phy->mt76->mac_work);
 
 	set_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
 	ieee80211_iterate_active_interfaces(hw,
@@ -1254,6 +1255,7 @@ static int mt7615_suspend(struct ieee80211_hw *hw,
 		err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, true, true);
 
 	mt7615_mutex_release(dev);
+	cancel_delayed_work_sync(&phy->mt76->mac_work);
 
 	return err;
 }
-- 
2.34.1

