Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BDDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/9mlqypEYwMLPqLGza7vsYQ1p2MQtFDNvHLxUj5F2k=; b=k42aWDuzCtVUH+rlK7HhC6e9Ix
	4u8azRAthxXiEQZMIMEm0petH9m7JZmPfz228yBDIR/Iod7eW9dViMvqPnpB2be69ldJJl/fOQ5YE
	xV9jHb8Qq1FzPAwr6nBy9JAQKFU/oJZCd0aBN/n3BHTCVYk6yaMfkisQKDdn9XdFWbDhojOSFe7yZ
	u8ZmBWttXo3a8mT2IDceYD04rtz7SjmVcIsU+37NAeQdzBF0KOZ/2x3lsA7ppoQLwkVoOiix1ROta
	fo/lZtAGoUa99UsOVqsY0GUeM9yeIrCsEBy5qo0zorKOUqh2f3WmexTjr0r26ZPi+iOya0W2x6e6v
	Sdsak5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgGy-0000000EUJT-3Kw5;
	Fri, 04 Jul 2025 13:16:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9V-0000000ETIl-3z9J;
	Fri, 04 Jul 2025 13:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABF9845060;
	Fri,  4 Jul 2025 13:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BA9C4CEE3;
	Fri,  4 Jul 2025 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634509;
	bh=Tqd6c2PBuvH0+CD+jJ53eqF3MMSBYOHgiwjdQEVbvJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P4HHiL8S0fid99gDAM/Ju/gve81njtuioaHPOpZXNN196xJDpjEOXF8OyR2+Ju+8D
	 5NaHh+e5FOwmezX0iSHaUWaogNU1ByowWfYp972EhseAqjUKYR35kgdQEHnG7xSpxG
	 ozi/mnANdDxkXYJy4jzgaddfO1+QReMUDUjj9PlUComKK/fMpaWpTT3w2ZssLE9k1m
	 RYuy+9S01Ruk9wKT8NN50i3cSWWNyonfIw5WZuqNMGvAHvOehD8F/If+NPmJnjRaPy
	 Xti5lBb943WKCT60csqa5nkR0jiwzZ/5pFTQKNV4zFe5eB6OxQDMnBt99vRSOXxlwT
	 VMG4vSOd+96Vw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:06 +0200
Subject: [PATCH mt76 2/9] wifi: mt76: mt7996: Fix secondary link lookup in
 mt7996_mcu_sta_mld_setup_tlv()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-2-356456c73f43@kernel.org>
References: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
In-Reply-To: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060830_009534_6475C2DB 
X-CRM114-Status: UNSURE (   9.02  )
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

Use proper link_id value for secondary link lookup in
mt7996_mcu_sta_mld_setup_tlv routine.

Fixes: 00cef41d9d8f5 ("wifi: mt76: mt7996: Add mt7996_mcu_sta_mld_setup_tlv() and mt7996_mcu_sta_eht_mld_tlv()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index f0adc0b4b8b6ccdc6ce11991a4d99b89500fe7a9..1bf5632cb0f754d49ec6201254d35652d23c0a8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2243,8 +2243,7 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 
 	if (nlinks > 1) {
 		link_id = __ffs(links & ~BIT(msta->deflink_id));
-		msta_link = mt76_dereference(msta->link[msta->deflink_id],
-					     &dev->mt76);
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
 		if (!msta_link)
 			return;
 	}

-- 
2.50.0


