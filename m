Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6CECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MSRaQ+ObtkD3Po8EdVDm3zfPKQVhGfP4jfrtmOzXWk8=; b=4/t3WW3SQUDizST7Of1IMowFfv
	FYjhcJCm23aYWUVcwaGCrao143zzGg+oGTfIpLLgF2pF0Y8KFA6xMsuUbZ55jwm/vVsNeX4zB6rLk
	Nig0A1w5bzbE/hbHI9E77hhQcXPYjGGy/vQMPvNidwedvZhNPxqb80qf4OAmaUfQeIwjUU6rQLIGR
	vT5Ng2Ua+g3RrZfnXkfeVre0VLpzZe/OPZzfQFuK7hq41BM0qOI6A40tjYqoBXjzVHMruoI0hsrnp
	yZl7dzgF3rCSz5ca3xXpfw7gkH1PuOsS/7qM+YUZFGYnR2l0kgfDQU4I4ut5hTvGFm1o4uBjscsar
	URuj757Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uFF-0000000GZyi-3e6r;
	Sun, 28 Sep 2025 16:27:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uFD-0000000GZx2-1KZ8;
	Sun, 28 Sep 2025 16:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E440D438D2;
	Sun, 28 Sep 2025 16:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B1AC4CEF0;
	Sun, 28 Sep 2025 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759076845;
	bh=FnampJXSHrU0rM+ZuwqnJeG9CYsIVyW79tDZuVj+Tlc=;
	h=From:Date:Subject:To:Cc:From;
	b=E3hevEsRkAecdgEYvHKNhZ8v4gsgm28pIuhVG+LL+Eu/q7VgguRHflI57Rdj2v29j
	 vXQjtAg6q1qb60SebttOHthzVm2IRUwxTbbYBjOf4JeYYbFUMo8Q2DUMxVTQbSqfhj
	 4pT34ONqp3P8BO325vhssd0Pum4old6ek0zs3n+qi8CAB47zdBBGAHJ1TeYck8+zFl
	 o0TkpHFL1wXBJRjwRyr7URiYHeK/X4tC18SpUDT1yaUjNCcBKVGlT13nDBdaG7YL3V
	 4TmEKqPW0q1TuMzlwufsd6QleGGiUbUdwdGpFGUfOtFleEzbK9NSwnuSM9zoCVbswz
	 OkUqNU4gEp/mA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 28 Sep 2025 18:27:01 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Add missing CHANCTX_STA_CSA
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-mt7996_chanctx_sta_csa-v1-1-82e455185990@kernel.org>
X-B4-Tracking: v=1; b=H4sIANRh2WgC/x2M0QoCIRAAf0X2OcHz0PJ+JUIW22of8g5XQhD/P
 etxGGY6CBUmgU11KPRh4T1PWE4K0gvzkzTfJ4M11plgL/pdzyH4+JOptigVYxLUJqy4OuM8OYQ
 ZH4Ue3P7j622ML4eAnYhoAAAA
X-Change-ID: 20250928-mt7996_chanctx_sta_csa-093a35056e5a
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_092727_381635_FA28AD1B 
X-CRM114-Status: UNSURE (   6.70  )
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

Enable missing CHANCTX_STA_CSA property required for MLO.

Fixes: f5160304d57c ("wifi: mt76: mt7996: Enable MLO support for client interfaces")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 5e95a36b42d1645dbf63d8bf6717ac6a29a91a5c..5048f8cf175c2ef4ba6ff343830bdab79fafc441 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -521,6 +521,7 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
 	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 	ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
+	ieee80211_hw_set(hw, CHANCTX_STA_CSA);
 
 	hw->max_tx_fragments = 4;
 

---
base-commit: 56d9de46715245c9cc46dbe16830e431056abbc3
change-id: 20250928-mt7996_chanctx_sta_csa-093a35056e5a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


