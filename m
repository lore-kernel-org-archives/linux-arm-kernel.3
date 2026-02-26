Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E4BFD8FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1DN/W1k3YZ4Jv19rP8LWvRmuu8LuFT/KvDWfvudDnU=; b=d97RbLQbiP+pE+y11ciTO23Bai
	dGCzrg4/i2paozerYhUElCPtFrU51Tn7PLb4zaN0FPI6U9AMRp26nK0UpVQcU5fu+szNjyL1fFpeA
	GFRMq4wi0ybu5duV2gB+Bsnba6e9ESkRv8D70MXootosURfeBLxdcwynUVdBXgRG0hWkTdKNQ9j5g
	gYpgZLPJc27Fn/eW921dtpPrf6KxVeL5tb+NBZWxMvK4ULC2npMf0gaN2F+vYeO/AwGTSUKmTql3i
	7QpuWXjt+Sm0rhTzPEDF/FltmiNRcFZSu2v/GWa5TQKxMUuz99ooKVmlTcOM6Ct+VNVfOzxMdmQHF
	7M7IYSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgm6-000000071uU-0pTQ;
	Thu, 26 Feb 2026 19:11:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgm3-000000071sO-1SXh;
	Thu, 26 Feb 2026 19:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 241C1436DB;
	Thu, 26 Feb 2026 19:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B86C19423;
	Thu, 26 Feb 2026 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133106;
	bh=DeI+YaVgUtkQEypV8sAz/e6KF5qCli71Iar/SiTs6mA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JatKUnMrwPJDmP2Ct9/VHH8yp9czB83TnnosGoPViLc6+6quAbp0vV+Xa3F10ndx0
	 PMKp/gi3+TxxUh+aCVDfqN/j2mjubVv8EOsZEKkRuEVXkrLG/9sD6YFjBNitybjY3m
	 /w+GWES4pVRcl8gRoWNKI7hkHuf/nEx61uxBrZuKoAnlyv1v2B3/sLCH4VPGBz4pii
	 5tbhv9CCvshfYeXLiDVqlJaAZu3JshLaA0j/I5Nk4SBT6v0/KWMf4cnS8Mae1BcYbQ
	 L0cUCp7X4+AjN5ge784XLXBw7wmIIePKMvS8KMdjVx0NjeQzIgbTDgy/NgFgvWKdH/
	 golWSHP5OhcCg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 26 Feb 2026 20:11:14 +0100
Subject: [PATCH wireless 1/3] wifi: mt76: mt7996: Fix possible oob access
 in mt7996_mac_write_txwi_80211()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-mt76-addba-req-oob-access-v1-1-b0f6d1ad4850@kernel.org>
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
X-CRM114-CacheID: sfid-20260226_111147_417130_485ADDCF 
X-CRM114-Status: UNSURE (   7.28  )
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
mt7996_mac_write_txwi_80211 in order to avoid a possible oob access.

Fixes: 98686cd21624c ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 2560e2f46e89a4bc46e21d796fca80b7decefa5c..d4f3ee943b4727a0e20f96a55db3bf055df20cc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -800,6 +800,7 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 	u32 val;
 
 	if (ieee80211_is_action(fc) &&
+	    skb->len >= IEEE80211_MIN_ACTION_SIZE + 1 &&
 	    mgmt->u.action.category == WLAN_CATEGORY_BACK &&
 	    mgmt->u.action.u.addba_req.action_code == WLAN_ACTION_ADDBA_REQ) {
 		if (is_mt7990(&dev->mt76))

-- 
2.53.0


