Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96465C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MluMhfnxSFFI8oqFjDLQfkIsKgi0izjj8u1gxqAmbmI=; b=vDn+30oEGYVKW6moZ6mfqTgTYN
	0HJ9hPCrWpaHSyySjRHzGAV/eye8AaNDWM3XI0NyJUvTi7bpixGWzK5f+Htu9QR1W1xyBRGIvExSH
	QR7FR8vosVCr8cM0DCE4Xv9qmp3dyO2BuEc7bvLgO2ti8iqHQAv6m5sIYZh4bbfxVFzAs8rmpIrxo
	xZAiqe7/RjmNNOco/KTcLv/6UP4HIzu2sng775DG4ePWS9x6VBk8yNuUrfSvBhcgozTTMA/UvJio+
	b0X7L427Yxykg4tpUcmCER9E2SFOgrk6Tbz1RbFMwxgH4aPnKLDytgRmOWX2CL73zKg0cGrkWNTqI
	i5MBYn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Df-0000000BZVS-0DJb;
	Thu, 20 Aug 2026 12:50:07 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Db-0000000BZUa-3gNX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787230200; x=1787489400;
	bh=MluMhfnxSFFI8oqFjDLQfkIsKgi0izjj8u1gxqAmbmI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IzoqAMrm8M+cJ281Qv1SirZK3czDeEDD0DdBx1yNlB66htP7fAZZouXnMJjFK5rNo
	 6UboIPbLcRQwc2PI7rbJtX1xh7pEzPr79ljP1YWgVvUWwSvr/pfBVn1GXuhC2t3Bha
	 sWaXuvhlsARAvZDZju4/p7g/lz6PkdAS2jhOzQ4GTzDQae1VOzuZMKDWPFKs3lQCTb
	 30fbbe77hwK1T6ImRjHwEoPIE4FwS8yhV5wSy5/5M7LGNW5F56fGIh44lM36QpPh3a
	 eF14pvc52Yd2sqZtcn6Z/Zbtw4qrbuO9EoSHlbZfFmNj6hPBnVt6rbCAM7MWT4hicZ
	 toFmBjktedplg==
Date: Thu, 20 Aug 2026 12:49:55 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76] wifi: mt76: mt7915: publish wcid before MCU add commands
Message-ID: <20260820-mt7915-wcid-publish-order-v1-1-79d2bc981d8b@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 0e088586e06f860360d23c1e030fb46a5057ac8c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055004_062461_211BD46C 
X-CRM114-Status: GOOD (  10.47  )
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

mt7915_add_interface() enables the BSS/STA in firmware via
mt7915_mcu_add_bss_info() and mt7915_mcu_add_sta() before publishing
dev->mt76.wcid[idx] with rcu_assign_pointer(). Firmware can start
generating tx-status/tx-free events referencing that wcid as soon as it
processes those MCU commands, but mt76's rx/tx-free handlers (e.g.
mt7915_mac_tx_free()) look up dev->mt76.wcid[idx] to service them, and
won't find it published yet. This can lead to memory corruption and
kernel crashes shortly after an AP interface is brought up.

This ordering was introduced by commit 8e3e7567b8c1 ("mt76: mt7915: add
sta_rec with EXTRA_INFO_NEW for the first time only"):
mt7915_mcu_add_sta() derived its "newly added" flag from
!rcu_access_pointer(dev->mt76.wcid[idx]), so the publish had to happen
after that call. Commit 33eb14f10290 ("wifi: mt76: mt7915: use mac80211
.sta_state op") later replaced that flag with a caller-supplied `newly`
argument to mt7915_mcu_add_sta(), now simply hardcoded to true, so the
ordering is no longer required.

Move the rcu_assign_pointer() before the MCU add_bss_info/add_sta
calls, so that the wcid is visible to lookups before firmware is told
it's live. This mirrors mt7915_remove_interface(), which already clears
the pointer before the corresponding MCU disable calls.

Closes: https://github.com/openwrt/openwrt/issues/24594
Fixes: 8e3e7567b8c1 ("mt76: mt7915: add sta_rec with EXTRA_INFO_NEW for the=
 first time only")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net=
/wireless/mediatek/mt76/mt7915/main.c
index a8286f8becf9..9c6c339f1b38 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -273,9 +273,9 @@ static int mt7915_add_interface(struct ieee80211_hw *hw=
,
 =09mt7915_init_bitrate_mask(vif);
 =09memset(&mvif->cap, -1, sizeof(mvif->cap));
=20
+=09rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
 =09mt7915_mcu_add_bss_info(phy, vif, true);
 =09mt7915_mcu_add_sta(dev, vif, NULL, CONN_STATE_PORT_SECURE, true);
-=09rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
=20
 =09mutex_unlock(&dev->mt76.mutex);
=20

---
base-commit: ca800a9302764c445de0da0e84d2252400a770ee
change-id: 20260820-mt7915-wcid-publish-order-bebef551330c

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



