Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67FCCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oS/RVUCv332oUW7rywSkFmlGKWorhtvaJVg65N7O3o=; b=oXqVd5gsqzX7NKRcATRkK23up2
	uo1LiA31R86c1oTqt2VbDcekEWEbY6KaxtdYZ/pxsoZ0yvC0cyDe6DYQBOh44TeD5MTxV2ggW1RVO
	T1qFVFtSX5YV98B4bA9/LUMwCHuAyG/C+7MSaBiPWTJRYF826+6wHdrRlzMG8NU7/qDUhg3pa4Of5
	Sf6/zKoVKMyWpAH0v1eBMTLIQO4/I2LP7z9QUOWOT3HsWQ+7VRTAJwQSbEzJLll79W8xGMVS0hlqn
	pVrs/hiSH3GiENOS55AQpQcGWJicIxAQirt9+tvNnFkB3kt0M6xERBni4tRcFYfKxC05UQn/MYDZw
	1MRNmRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkKb-0000000784w-1XOF;
	Mon, 19 Oct 2026 10:11:01 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkKY-0000000783K-2MZ7;
	Mon, 19 Oct 2026 10:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2o
	S/RVUCv332oUW7rywSkFmlGKWorhtvaJVg65N7O3o=; b=gJL0OpNc92zGtVRgKk
	uvXuIi1Qsmm4ZkyANl4FrVz7EMk+vYK6EjZzfQ69pqAPNZOclIBsDZnrJiqZ2L2v
	hp/rrxb8aOTmcURAAlrmbcI7ZTTiTYcyq1cZ4Rp5o15wa6+ez/iFnkofuXG3PhRG
	z186hSrQ4gy8lXnBCLUPeeKGk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3_8Wk7NVq1VPPBA--.45843S3;
	Mon, 19 Oct 2026 18:10:47 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] wifi: mt76: mt7996: clamp VHT/HE beamforming NSS
Date: Mon, 19 Oct 2026 18:10:41 +0800
Message-Id: <20261019101043.1922205-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101043.1922205-1-yaojiale02@163.com>
References: <20261019101043.1922205-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_8Wk7NVq1VPPBA--.45843S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1kAw1UXryxuF4Utw43ZFb_yoWfurgE9F
	navF1SqF48Kr10kr47Aa9xCrySyay8XrykG3y5t3ySga17A3y7uryFvryDJrsrCF17Zr1U
	GwnxXFyjkayYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUjg4PUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgd0rmrV7KcemgAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031058_957037_08A019B1 
X-CRM114-Status: GOOD (  10.36  )
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

A peer can advertise a VHT or HE MCS map with no supported
spatial streams.  In that case mt7996_mcu_get_sta_nss() decrements
zero and produces 255 for the beamforming configuration.

Return zero when the MCS map has no supported streams.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index cd7587ce5b8a..e6243dd33c31 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -120,7 +120,7 @@ mt7996_mcu_get_sta_nss(u16 mcs_map)
 			break;
 	}
 
-	return nss - 1;
+	return nss ? nss - 1 : 0;
 }
 
 static void
-- 
2.34.1


