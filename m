Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F0FD8FF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJMHauOOK/U9nG8NfDqoXR3G0TJviUEEgXGTQaffNqY=; b=lm+89I7Jxx6JypOQaOkLXq4G5n
	QiN1cmB+sqrRkeAgmdC4Y8/79EdbxEWNYcNTptxZshq6AvbKaQdR2Qa+XJGSNgRwVaLkkgGB72PSc
	EQNILXUxlgc9VACiSL3DmAoqspE7OVY80RTwC7ea1gjv5VGGAsJMs4NDrUw95PFzQqT/XHd6mVcbj
	XBqyGBjCuN45rmju8uxI22fxh3M9p8jjg7ZeJQC+piYSteVFYbDkaIXxrU/S2QUgHHIL3yBjS6mTa
	DYndtNKlluySrDWq64xdAQQZw+XRgGNyADUHXCZ/pcSDVWNvHXzA7mZMh0+7CcRih9C0Bft6KtEaf
	buLxGpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgmA-000000071xr-0yv9;
	Thu, 26 Feb 2026 19:11:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgm5-000000071u5-3pZP;
	Thu, 26 Feb 2026 19:11:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED05B44318;
	Thu, 26 Feb 2026 19:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74011C19424;
	Thu, 26 Feb 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133108;
	bh=lTVyJVB0aB+uUxxgnjTFm8CX4/aNy1Ar67t0XoIonss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ODS1ZyA3OhWzSexAR/doIaElmBQzLPrjiQUrFHktBCxnFa65NWXzYQqrB61gtEaP7
	 U2VvHS/eSScJPBJhhdMx1XX6sroZ9WGxy/fvZAVs+N6b2rA+EBRdYhjs0lMCSLINwi
	 Ewyu0NoCNfZkORSuPMfTa0ZgSoSTbqA4/rh/61rq5CrKqoDG/zUhccDVMTSeMmQntV
	 88IPR7T1BS6eqggG2h+l7WwKCCS/H5Ck1N+zMvz11dIjhkLttBa63xTzop6UvsKKqV
	 13i5LwA2tyeCTjLYuI5ODKP382RQik/wRolAY6Jg7IyMPsxbicScyoQqEuoimGFyJ+
	 SdIrKtihaqN+A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 26 Feb 2026 20:11:15 +0100
Subject: [PATCH wireless 2/3] wifi: mt76: mt7925: Fix possible oob access
 in mt7925_mac_write_txwi_80211()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-mt76-addba-req-oob-access-v1-2-b0f6d1ad4850@kernel.org>
References: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
In-Reply-To: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 MeiChia Chiu <meichia.chiu@mediatek.com>, Leon Yen <leon.yen@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, 
 Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hao Zhang <hao.zhang@mediatek.com>, 
 Nelson Yu <nelson.yu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_111149_980883_3EC02AE4 
X-CRM114-Status: UNSURE (   7.39  )
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

Check frame length before accessing the mgmt fields in
mt7925_mac_write_txwi_80211 in order to avoid a possible oob access.

Fixes: c948b5da6bbec ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 871b67101976a7d72ca10c9736ccfa59b0f21122..0d94359004233e94c11a2d09f67b1ae61ccf71ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -668,6 +668,7 @@ mt7925_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	u32 val;
 
 	if (ieee80211_is_action(fc) &&
+	    skb->len >= IEEE80211_MIN_ACTION_SIZE + 1 &&
 	    mgmt->u.action.category == WLAN_CATEGORY_BACK &&
 	    mgmt->u.action.u.addba_req.action_code == WLAN_ACTION_ADDBA_REQ)
 		tid = MT_TX_ADDBA;

-- 
2.53.0


