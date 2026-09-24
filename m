Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79EAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvhWLiAmSVeUcRiZOSiSzgt8c6ktpzexIIkYN0GRrD0=; b=E4QQ5SoM/OMxF+gr6oFoKqh5a1
	CeFcl7b+jPkm1x15DycI+ec/sKrOnYBY16E1Kuyo38cW30To5EvQNE4aLacIyw0Tsizovnk/NAtwW
	doMbHqPiwCGJ6uYHASczFDtlO9YYNPCzwbVDCbCzRQXhz3AAckF8IYRRoA3Ty3I+0HInWuTWz+I3I
	BWfHN9ma/OE3Tqp/N0C5lmCnMAoS7FZGWVqDLIhQCN1DoebSkE1Qpf6YwvzFyeoKn261U/bWqbXKZ
	r6qOGiqgmPE59ZU/nUWJ1KfnP5BEKQLzkEXY8RLSkdRi9PW602c9Us9hfFxMcpRlmGW1ahQ6NZBWz
	qHgKyadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jMi-0000000B3s5-1nFe;
	Thu, 24 Sep 2026 13:19:56 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jMf-0000000B3rS-1qj6;
	Thu, 24 Sep 2026 13:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ov
	hWLiAmSVeUcRiZOSiSzgt8c6ktpzexIIkYN0GRrD0=; b=M/mnBXT4aCvmAaUIDT
	f0rxoPud8wmEs3aWtmVNG7nfnjOLQgCuOwW6gANFWhsetTR54p0hBASfqy61/Ui+
	ze7XHG0PaYYRUAAMXjIb3ZC0bPQpdzPLtp+wD+LhUS6UrVkt91NRSYzepH5q3MSl
	ArAsj11ukCtPWMVYkinh/5x2g=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3d5ROI7Vqq0FrAg--.32720S4;
	Thu, 24 Sep 2026 21:19:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Leon Yen <leon.yen@mediatek.com>,
	Eason Lai <Eason.Lai@mediatek.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Ville Nummela <ville.nummela@kempower.com>,
	Marek Vasut <marex@nabladev.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Nelson Yu <nelson.yu@mediatek.com>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Amitkumar Karwar <amit.karwar@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] wifi: mt76: mt7925: unwind link BSS add failures
Date: Thu, 24 Sep 2026 21:19:02 +0800
Message-Id: <20260924131908.950229-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924131908.950229-1-yaojiale02@163.com>
References: <20260924131908.950229-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3d5ROI7Vqq0FrAg--.32720S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr47trWfAr1kAFyxZryrJFb_yoW8Ary7pr
	ZFgFWjkryDGa1DKw4UCw18ZFW0van5Kr1j9ryruw1rZws3Ar1fArWjva4UZry0kayvka1U
	Xr4DtrnxuFZ8uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEl1v7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR7nImq1I141qwAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_061953_836822_2039EFD8 
X-CRM114-Status: GOOD (  12.02  )
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

mac80211 does not call remove_interface() after add_interface() fails, so
the driver must undo any state it published before returning an error.

mt7925_mac_link_bss_add() reserves vif and OMAC bits and publishes the
station WCID before asking the firmware to add the device.  If that command
fails, the function currently returns with those resources still installed.
The WCID pointer then refers into vif private data that mac80211 can free,
and the mask bits remain permanently allocated.

Use the existing link BSS removal helper to undo the published WCID, mask
bits, and WCID resources when the firmware add command fails.

Commit 2fb6480c52f6 ("wifi: mt76: mt7915: unwind state on add_interface
failure") fixed the same failure-unwind issue in mt7915.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 5993b31e1aae..25ad3bbdcd2c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -439,8 +439,10 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
 					  &mlink->wcid, true);
-	if (ret)
+	if (ret) {
+		mt792x_mac_link_bss_remove(dev, mconf, mlink);
 		goto out;
+	}
 
 	if (vif->txq) {
 		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-- 
2.34.1


