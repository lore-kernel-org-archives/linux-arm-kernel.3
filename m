Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A2FCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUzS1FlJJem1zWHteh/brshjzgj4HQ9TMqISmQwh+sQ=; b=NENAXFvLAQYFVtDkYZsQeTdIM0
	ZtkTuk93OI/9zqERmFDMDYf8o9Vx/uHMUROcKWFCxIFk9FCgCEE8qAucG2jO/J5NPRTCAgcbEFhvn
	PRHe+hKwmS2Nr+fg9ruzyFU4UY7inCWDpHBFg8s/5HFiWtCem2D55hmQ9eiuT9f0TrxvflMLOkrGe
	BHxEGuBHtcdGkfSUE1xl1v0Rgr5LEThLLM/kzf4OknEin88GNRzLta4KkPOwDJuAQSJzjmtceUn6i
	KOGVUuuf4do8aVCpPaZiHARiG8vk1mXQOpblHwkPEH24H7XsKVQPXs/IKeYuL9d6geoNfjA3caExK
	vNzYENZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urB8j-0000000EZfC-1SbM;
	Wed, 27 Aug 2025 08:04:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urB61-0000000EYwT-1BpG;
	Wed, 27 Aug 2025 08:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=IUzS1FlJJem1zWHteh/brshjzgj4HQ9TMqISmQwh+sQ=; b=MAdWts2B9DV2xN5PIpDeOEaIBW
	TPUwEP7zuYn/983CgYAdneCV43vGmPIgeVNNFRrh38w4Qf2/5bSbVA8ORbVtfJ8GGiLbTqdnTL3YI
	9aoJQMebMGuRdhnMvAs2lQ34uJOy8v1RzViTi+UA0eXtsASo8ykTs+KMqvjjnNRFLUHhlAwmx+lkc
	I4lJvw/zqOgCw2w9nS5BGxYhjn1cccLIGoolftSXu68BGG5PEYSsW70rmp/qq44kL+DIATJblh6ns
	kjyPwDVyyTbqxsDASKbH8+hzP0WZHgPKKiFhMzWWPIELzS4UwPrcDaZZELnzy21EwuLrHeFRPgwzA
	LDG6xkkA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urB5w-00000002NhI-2ILP;
	Wed, 27 Aug 2025 08:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1FBF419D4;
	Wed, 27 Aug 2025 08:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BD2C19423;
	Wed, 27 Aug 2025 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756281680;
	bh=Nw7JExH/BxnTMttSxUeig+mm8bvREsbFmHsG7msCRWU=;
	h=From:Date:Subject:To:Cc:From;
	b=fUWbZQf6BTh45TtW9SnQDPvRvz1ZrsIj0ybgAJZg/94MJJIyoH5VUd8EhWV9IrXrL
	 8tfTk9AQAOfuW3D2ehGFWMmcYTB/HLHihB6ycrOpasAnuZ3sMPCu6ucS790oEy0Oma
	 Gs8PWt/U37CqW0g8ih4br4TayvqbiziZOwAJUFkt47fnelHbwKShovqG2PnmKZ6mrA
	 NxbRfElpaDvVaYMlPyk3VJyvD4xay7pbOVbcRS+QqykSHsuPUlANEjG+HLUJBBU0Ea
	 D1jZ3eLlCdorc5hnr5WpkBPdPHwTTGPyvoafDmpNE+DGyefi9Syaa5QfGIrILi0mr5
	 f9zHBnae9AjxA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 27 Aug 2025 10:01:02 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Export MLO AP capabilities to
 mac80211
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-mt7996-mlo-ap-capa-v1-1-b5cfbcafa25f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD27rmgC/x3MSwqAMAwA0atI1gZqUateRVykNWrAT2lFBPHuF
 pdvMfNA5CAcocseCHxJlGNPKPIM3EL7zChjMmilK9Vog9tp2rbGbT2QPDryhKRK66zhprQVpNA
 HnuT+p/3wvh+oqyF0ZAAAAA==
X-Change-ID: 20250827-mt7996-mlo-ap-capa-a04bcb7e84b5
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_090125_295172_410C77CE 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

Report MT7996 MLO AP capabilities to mac80211 stack.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index a9599c286328eb2b1ff24504109d25a9d916e044..29e0cf966bcac5ab805b927fd73b7a23d15877ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -63,6 +63,24 @@ static const struct ieee80211_iface_combination if_comb = {
 	.beacon_int_min_gcd = 100,
 };
 
+static const u8 if_types_ext_capa_ap[] = {
+	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
+	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
+};
+
+static const struct wiphy_iftype_ext_capab iftypes_ext_capa[] = {
+	{
+		.iftype = NL80211_IFTYPE_AP,
+		.extended_capabilities = if_types_ext_capa_ap,
+		.extended_capabilities_mask = if_types_ext_capa_ap,
+		.extended_capabilities_len = sizeof(if_types_ext_capa_ap),
+		.mld_capa_and_ops =
+			FIELD_PREP_CONST(IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS,
+					 MT7996_MAX_RADIOS - 1),
+	},
+};
+
 static ssize_t mt7996_thermal_temp_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -463,8 +481,11 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	wiphy->radio = dev->radios;
 
 	wiphy->reg_notifier = mt7996_regd_notifier;
-	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
+	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
+			WIPHY_FLAG_SUPPORTS_MLO;
 	wiphy->mbssid_max_interfaces = 16;
+	wiphy->iftype_ext_capab = iftypes_ext_capa;
+	wiphy->num_iftype_ext_capab = ARRAY_SIZE(iftypes_ext_capa);
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BSS_COLOR);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_VHT_IBSS);

---
base-commit: a7cc1aa151e3a9c0314b995f06102f7763d3bd71
change-id: 20250827-mt7996-mlo-ap-capa-a04bcb7e84b5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


