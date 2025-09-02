Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D59CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku1RWelcYa32c9Go7yNNmbB2f6KuSI2yh0M2bafQJ+U=; b=UcD3qzk/kg2LXEnS3uwBb3Vlhn
	VOYF6s9rmvtARAZuEoXMyP0M48uthEyVrziU2wJbaAR4zEDhRKdQ4cr7F6dFLILx6+rTo+/3+1zwW
	NGdjLUG5hOnpoHiAAiXMmZjpa+rLiuFVAGNqWKMYI9OCKLTUJP8ceQPK/K+rkmRmAmL2v5KrntVUF
	t/+k52z1mB/a14aInOIAahSUFE8ezWCJG9HEkw66wPGfMEoTzyglwos8LuaOhh9eKaxp+nlhK9m6Y
	xMbb4DpLpCNaBvgjTPJG8UFwPw0BFNxgK8/bY78RSZ4LPHzaO9aE26tTmcm8E5wLzp/pZLHiSkyMg
	YU1xXi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbc6-00000002p2E-1AoQ;
	Wed, 03 Sep 2025 00:44:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWX-00000001geH-1JlS;
	Tue, 02 Sep 2025 19:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ku1RWelcYa32c9Go7yNNmbB2f6KuSI2yh0M2bafQJ+U=; b=Y9Vrw59kvFP36FhchOpen3oPH7
	CzU3bZfEBU/Nuy5EKcyrsOamAyoLmOMBuQpsKcZTJo2fvQg7M2byaIus02xlH5MHJW2VgAgDy9b/1
	Ek095xH1q4E/AUpoya9nMtGszhLWARO8lVwu7hDngWyfTbGyqWnV44r+uvdEjl8sRhi1qYtO347ns
	ln8KtpBa0LBmRsATbAZTuIbs6P6wir84UtHI2RvlggBwYHXebjsixvbAf2NYAzjsmEOb5ePa863gj
	ivN35inYAdkdwqbi7goWd/PF6v0ut3z0YCft/cGdVawckdcB0f6HwCtoqhHy3Ptd9xDOhPmX/QiV9
	SleH2mbw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWT-000000043Ge-3eSC;
	Tue, 02 Sep 2025 19:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FE04437AD;
	Tue,  2 Sep 2025 19:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF26C4CEED;
	Tue,  2 Sep 2025 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840708;
	bh=0l7ANV3oc32SME44FBPiXCTBRDuZfxoqru6H1toeifk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JFLGLbvOAdURPWVsYXjxhlk/Ph/NXJ4T5CUubWYipP6O40+RauTGuJLU0q7BeXrUI
	 2vJIOJ4mGLvJgvGgs0dcwZBxcR8WYXoRw8P6EQf/7859/b63hakaCgB8DvK5G+Qcp8
	 etyOpIbVgfS+w1b356z752UKKTiwJNceQSNqdviwwucaiFsR8nKAPzpkYXU3VbnIUE
	 T0H/g2M4lVmdCfwgK5cWb3d33SeCetTUDE7YoL6vEOcf6O75SXqoyYXmoa8RZ5UYvJ
	 LadHOOq/t0iBKvGoCS1rECrOPTthlX2EH4vqZPLN09T5LEsU4d8075Ssm7qUytsQ1c
	 7SD2MnDpdQ/Og==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Sep 2025 21:17:58 +0200
Subject: [PATCH mt76 v3 08/15] wifi: mt76: mt7996: Fix tx-queues
 initialization for second phy on mt7996
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-mt7996-rro-rework-v3-8-8f813890959e@kernel.org>
References: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
In-Reply-To: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_201830_490216_BE15B270 
X-CRM114-Status: GOOD (  12.34  )
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

Fix the second phy tx queue initialization if hif device is not
available for MT7990 chipset.

Fixes: 83eafc9251d6d ("wifi: mt76: mt7996: add wed tx support")
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index b66ba38df570503839e1a9ba1819b4e29303532f..023f788ac5f8ce6f01e5556a6000765ed42cc646 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -703,13 +703,20 @@ static int mt7996_register_phy(struct mt7996_dev *dev, enum mt76_band_id band)
 
 	/* init wiphy according to mphy and phy */
 	mt7996_init_wiphy_band(mphy->hw, phy);
-	ret = mt7996_init_tx_queues(mphy->priv,
-				    MT_TXQ_ID(band),
-				    MT7996_TX_RING_SIZE,
-				    MT_TXQ_RING_BASE(band) + hif1_ofs,
-				    wed);
-	if (ret)
-		goto error;
+
+	if (is_mt7996(&dev->mt76) && !dev->hif2 && band == MT_BAND1) {
+		int i;
+
+		for (i = 0; i <= MT_TXQ_PSD; i++)
+			mphy->q_tx[i] = dev->mt76.phys[MT_BAND0]->q_tx[0];
+	} else {
+		ret = mt7996_init_tx_queues(mphy->priv, MT_TXQ_ID(band),
+					    MT7996_TX_RING_SIZE,
+					    MT_TXQ_RING_BASE(band) + hif1_ofs,
+					    wed);
+		if (ret)
+			goto error;
+	}
 
 	ret = mt76_register_phy(mphy, true, mt76_rates,
 				ARRAY_SIZE(mt76_rates));

-- 
2.50.1


