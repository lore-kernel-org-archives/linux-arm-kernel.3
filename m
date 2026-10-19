Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32A8CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//Nz9GXytPYhtZz3+9TgaX3FgtxnYUSmb1UPwYaHVGc=; b=s0UgWFPD81NpW/Y19wcyQ2SbPS
	fmiUe92mV1qqNViXgymoyozXBsz5JO/0DqUj8Ag4a4sDCiCB2/H4g/cs5yJDdWm7yeNZ6yzbwDwRt
	qH3itJYTRqY+pQF9ULQUN0EQrNL4YxhRB9gOtT09oyQPL2TURRaN4RL829JmZ6ASBjwQRsRWotNwM
	o3vJIO+2otOyTtGA64fVQBx6HWzXMTAoyf1xUmI8lTfk/Y621ujDr9g+OeloaL9EOXfpY0hbE8D1y
	G2krDKomc9LTElYoUZL6rih1CT2LMmWzEuzHct6A063KUPdelRznnCQSaNaf3RXxUUqUX4LM+F3xc
	A9iHIq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjkM-0000000711j-1All;
	Mon, 19 Oct 2026 09:33:34 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjkC-000000070xZ-09ml;
	Mon, 19 Oct 2026 09:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=//
	Nz9GXytPYhtZz3+9TgaX3FgtxnYUSmb1UPwYaHVGc=; b=TQRl2KGuZr1+dpMKVe
	GY6tGtlGGS2DXNI89cY5d3ZAHQ/+FW28BS/PJjYHxi8GIy6LswE4jk04sbTI34Jm
	lwXHwef0lS/xj2MTqwLD+cyFCT4Itvra1G9MOXK7cMuOVYxlD9Ofqcg3u5kPe3Mv
	e0pCFiw6yRS5PSIHzARXR9/gE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H73U49VqbIAVBQ--.320S3;
	Mon, 19 Oct 2026 17:33:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Money Wang <Money.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 1/2] wifi: mt76: mt7996: clamp VHT/HE beamforming NSS
Date: Mon, 19 Oct 2026 17:33:06 +0800
Message-Id: <20261019093307.1869749-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019093307.1869749-1-yaojiale02@163.com>
References: <20261019093307.1869749-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H73U49VqbIAVBQ--.320S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyxXry8Gr17GFWxuw45ZFb_yoWDGrcE9F
	n5ZF1IqF48Kr1jyr47ta9xCrySkay8Xr1kG3y3t3saga17J39rCFy0vF1DWrsrCF17ZF17
	Gr9xXFyjk3yagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjMKZJUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Bk-eWrV49nb2QAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_023324_796588_E9D47108 
X-CRM114-Status: GOOD (  10.26  )
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

From: Jiale Yao <jiale.yao@example.com>

A peer can advertise a VHT or HE MCS map with no supported
spatial streams.  In that case mt7996_mcu_get_sta_nss() decrements
zero and produces 255 for the beamforming configuration.

Return zero when the MCS map has no supported streams.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <jiale.yao@example.com>
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


