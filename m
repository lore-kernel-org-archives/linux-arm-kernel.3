Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D33C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GM5K3YMcvdK6ZyeBlGyhLaLE+gMTP73HJSvrqEJgq7k=; b=Odcwlilv8CkBvFb7IrlgX2Fu6f
	a92KjHhIoFtO6q71yLWg9/9cgybJUqL40lXkVLQDEopmOY3IZKOUro0hVaKWQtBBgRFQzceiMRjGw
	97aqWm0aN2oiCOV4DwIrdLYEgqob9898jVN9BNSl9s3rUc0+vm3rSv8HiUiDDeQJ6Byq49Q8GoveR
	OcY9yy8IeQ4N/MgPhXvZzeIMsDYvW282w2l9Y7kTanPXD7/D65togmxOeNOR9/VjtxPsmUpFXqiUj
	W9v2zwSFT2bo2fVlQr0UpqnYIa2n7zWSDVz6f5LmMg+ri4MFhgBYvXn+YqhPI4RL0gHym7hxnubFc
	V3VMqf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAlqg-0000000GCid-0rcW;
	Sun, 27 Sep 2026 10:11:10 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAlqc-0000000GCi9-2JtA;
	Sun, 27 Sep 2026 10:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=GM
	5K3YMcvdK6ZyeBlGyhLaLE+gMTP73HJSvrqEJgq7k=; b=lf6wZSq3haUkfV3A+q
	fbSDB1uG3Ch6cXFx0NOtpxEYeuFOEnwi+dkEE/5O1u96q7LbOVEV+zi2rdU8zU60
	gYfiURpavW1TaYPQB51PMxli2saZPg43nxBdtvs86AlriiDjNOuDWaiJPSaFwJgA
	24OliH9h4ivqFTH7cCpIXlkew=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnn52j67hqFV5yBA--.63529S2;
	Sun, 27 Sep 2026 18:10:44 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7615: cancel reset work during unregister
Date: Sun, 27 Sep 2026 18:10:40 +0800
Message-Id: <20260927101041.957362-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnn52j67hqFV5yBA--.63529S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW3XFWkKw4kKF4fZrWkZwb_yoW8GFWDpa
	y5K3y5u340gF4DKw4UZa1xAa45WanagrW3Cry8Xw4UW395AryFyrW0vFyjy340ya1kCa4Y
	yrWUtry3ua4qvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPCztUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQXsJ2q466WNDQAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_031107_061714_161ECAC5 
X-CRM114-Status: UNSURE (   7.95  )
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

The MCU error interrupt handler queues reset_work on the device workqueue.
Device removal can reach mt76_unregister_device() while that work is still
pending, since the workqueue is not destroyed until mt76_free_device().

If reset_work runs in this window, it operates on an unregistered hw and
can requeue mac_work after ieee80211_unregister_hw() has torn the device
down. Cancel it before unregistering the device so it cannot outlive the
registered hw.

Fixes: 61c4fa721968 ("mt76: mt7615: implement hardware reset support")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index a9178e077fd6..7d8580720cd8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -116,6 +116,7 @@ void mt7615_unregister_device(struct mt7615_dev *dev)
 	mcu_running = mt7615_wait_for_mcu_init(dev);
 
 	mt7615_unregister_ext_phy(dev);
+	cancel_work_sync(&dev->reset_work);
 	mt76_unregister_device(&dev->mt76);
 	if (mcu_running)
 		mt7615_mcu_exit(dev);

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.34.1


