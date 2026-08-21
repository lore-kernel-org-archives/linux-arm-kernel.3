Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DD3C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvQD6+MhAqrZHD+Spx/wMDCkvEy0KGRXaEdYaUDsVII=; b=viqTJO5QL7SAPE6mdJXReIVjRm
	cS7RgUaBhgTolC8+bV7oGK+BUyZURHLPqsvs6iYmGxcABSECxAZVX++XRoELQAcLPuyjeMFgwbJ+h
	dYQC0qbQ86aYC0gHR06v11w3tKPTdNM4Hkea9qCg/HX691k2Vb3ZRrXdaOB9QPkkvkUuzWFtELwpl
	SoyRi3J44zBPhK+KIKOqmpTKRlXf6DkwwU8jxhMazOKxV0IVmCArcTWosCE7n23AfyKIcSqIqB+zk
	qc+mCYKz79YZ5hjksXOsNsXiTtN1iosc7QLznUECHlb8w/3MXFBOKDkXnfUdkHgQo6As2Cl5tSG7T
	8wAkedTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxL6j-0000000CrfF-1X0I;
	Fri, 21 Aug 2026 09:00:13 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxL6e-0000000Crdw-3iw6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787302805; x=1787562005;
	bh=xvQD6+MhAqrZHD+Spx/wMDCkvEy0KGRXaEdYaUDsVII=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tq+5clErfQ6SBAbT+ljkuxv8fKbInx4wTP6ZB/qDNkN+SyukAV9CWY2+IgwjvvMRU
	 W78oaD95cBzScWSBbELl90K5+APT/p+tjOHx2z3k2d6egYXFvApqBawIhdJXKX7oX9
	 6nRNl/v3NQ5LU2dFH8KQmqqTINl0saEIu8x2GT82ArfoLbSGNAlJ22NOP1uHVlRiAV
	 7oVKuq9KNqFT4kBI3AWCpHp1FVEoAjvRo2uRlKMjTgbl982Roz9sXbTmtHChLzWQC/
	 47UsZDvH6dN2gpVVHK9EhlHdj4/UskR5c+KBQSvVH105E0FthAnWdiMrueWCy+9r+8
	 oCmtnCXtkgsLA==
Date: Fri, 21 Aug 2026 09:00:01 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76 v2] wifi: mt76: mt7915: publish wcid before MCU add commands
Message-ID: <20260821-mt7915-wcid-publish-order-v2-1-acf0b7f32cbd@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 925f30d38a406df4b0ed3723747f01510db6bb67
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_020009_307024_2260469C 
X-CRM114-Status: GOOD (  11.60  )
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
it's live. This makes the ordering symmetric with
mt7915_remove_interface(), which keeps the pointer published until
after the MCU disable commands have been issued.

Closes: https://github.com/openwrt/openwrt/issues/24594
Fixes: 8e3e7567b8c1 ("mt76: mt7915: add sta_rec with EXTRA_INFO_NEW for the=
 first time only")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
Changes in v2:
- Reword the mt7915_remove_interface() comparison in the commit message
  to correctly state that the wcid stays published until after the MCU
  disable calls (not before).
- Link to v1: https://patch.msgid.link/20260820-mt7915-wcid-publish-order-v=
1-1-79d2bc981d8b@protonmail.com
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



