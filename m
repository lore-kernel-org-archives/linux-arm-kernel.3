Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657F3CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 01:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCD/2g9DiH7IGmCylqgN8SVqRAlReG1YJkLOG3TO9pw=; b=aNsa75wLxPcB7cIojNOZA5ASxf
	Kl9QGH4UMu/htcbeKvpRzIV+9FQB5iSFp5z4moFQmk1ooRoacz4M0wL+Xf2uiI8Bxj4AVKuzkF48O
	fJbyh/ovsODpYnrEC0Eyy2Gs1lR5cd3ujzT7u1bphzqSzNcAyTkqK+XvnPjoiEqJvTOeBtkRRUy1W
	D5LQQAiO1CScO5xyLELu3/7YbljffryCy0u1FcA7x7hRu+o0jip2s2n8YK5nccnBI9IWD5P6u0z3P
	Tzg4jJM1E71TOPe3iXiYGu2GRotXm8zMILi8350Vbf/HKID2xeus5oHV1O5hQAERXJ2YzJthl3Iz+
	KPBqgezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLny-0000000A55n-0MAt;
	Sun, 03 May 2026 01:39:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLnu-0000000A532-0Ly7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 01:39:31 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso4114621a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 18:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777772368; x=1778377168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCD/2g9DiH7IGmCylqgN8SVqRAlReG1YJkLOG3TO9pw=;
        b=mwKZUzPjfmabrXcp9imMRoBVbiN/Vs7RbiT0UdOSDzWe3RkMxXcMfPkBG8jCal4hep
         vJZlZiYHsP2JUFIOOPskhwTQAftfDDQbrM4esWGt9cSMKHNbgOLXBFNsd52/gJgZdqEk
         wYfvW0MKXpNXahSkqhU4LaYugvMWPtL/7jERjyyJBLnfAztXpmJY62VlvRNkjZjx+NsZ
         QC3L6Ev/YLlav7E8dwD0yeHymWbhxzh72ZjZBTwU6E9d/rmR8dFbHEf6dNSljVYfBy7Q
         INEqZVeN1VnNQyLScgD8Ad7A6s32OR6TV8zB5FsJyaeLqrYjEUAd8zI0RXLdFrTJevba
         ppTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777772368; x=1778377168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCD/2g9DiH7IGmCylqgN8SVqRAlReG1YJkLOG3TO9pw=;
        b=YKR1VdDKRSWiUio4Wf0TpiBjjLPz9SCUyZBOv14Y3LjlCmzaV07tzTnrsgr/mcWHQa
         2HNLRQsOsg5vEc0VYQtq5mMK7cybDD3k8z2AvaBnSnjW/ubobjCBlN0+44sE9Da4qAFF
         r4W3WG47YNGMPJhFrwMI7m+ww64+a+8XUrnbbFn9zKxcFzFnywzdOCJnbwiyXlibL8v9
         Frt4bEvtOiHOgcRw/rAGg5qEy4BRd0PUPHPQBaGnuhQriOr3XgDEWCMJ1uZGPepXcIu5
         T9SmBUMxvcZ0gAofyX/8MGcevgT17srOknIcmFjCpeFAosL18MyGzwx3VBvLNh2oUun4
         P5EA==
X-Forwarded-Encrypted: i=1; AFNElJ9wYsz1H9RDvyRoeShhg4S9ZRW33OM/tZKYUrdbiSv0mbeU4ttKgnwE2mqq74BSyfDeQ/KTSuoD4XyEHdRiu2ku@lists.infradead.org
X-Gm-Message-State: AOJu0YzbV2uHfyNZKg+be/TIN2tqxP+sO8KfQYmRXuDctOoNOM+uSUvD
	ASIAkqzcNAtk+fAgfqeHxGGh6+5KOWaFO2Adziso7xYCW4lY47AocT9w
X-Gm-Gg: AeBDievbvtsK5WbBx2vUtKtH0kwHtvBeXqSdxQbH7v026aC5Kvw1xJEEv76xTq3TWgO
	fWV2Rp3uB6oWFM3tGwJt8vrec8L8YRGfTnEG9JPZ7ah8mX9HV0PcB9tU273Dj4XKoUuf2dZbVpE
	gEMpSiHJdG1Xp+17Oxt5cYALL7qu+fRrlK3d31jz4RWzujbaxSbXmAVg0WaiB9M5sBzrtOjBXXi
	VxTlGpX7GRocqPlmqgdlpG5j3/HYzKYVXduqlNE5u5qHbQoEq2Xw2WpUOHvAqOaTtIoBkdKq1Bj
	9riCt9Uya1ftsKHvsZ7LZmPXRLzoAWqUKFcXzm3Xl7vhbp6yI4n7uUewAqRFAKfQrmdJiD6NP6l
	QSWzyGsgsQ6EqsKvpNOzQIGldaZ+lLcT8R74fbFrpyVjS5IiyfBEWVuqa+yzi4Lq/Bqmy8jPPXq
	KYc41ChAuaIMqG4Q4GMQMAxktkUzBDf+kpDniN0TR4sYH4L6ZULHhbxo/Rw12bBPtUMrqlo6m7o
	T37IgQ+bJzrsIBGqtp7G6CUkLpM
X-Received: by 2002:a17:907:198c:b0:b9e:8e4:8765 with SMTP id a640c23a62f3a-bbffb23fe1amr237176266b.10.1777772368030;
        Sat, 02 May 2026 18:39:28 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-39-71-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.71.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1671c1d3esm24796466b.42.2026.05.02.18.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 18:39:27 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Date: Sun, 03 May 2026 04:38:30 +0300
Subject: [PATCH 1/2] wifi: mt76: mt792x: disable HW TX/RX encap offload to
 fix TDLS direct-link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-mt7925-tdls-fixes-v1-1-dde847e21081@gmail.com>
References: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
In-Reply-To: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Soul Huang <Soul.Huang@mediatek.com>, 
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, ElXreno <elxreno@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4215; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=7uwJxgvTxpOn6gNEIOPNEioHiEozfkGob7zPtdELUWI=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzG/LfTNMDDbv83x9t8ziV+VZJeNKo5MB9cwrXz83n
 G6x792x7W4dpSwMYlwMsmKKLDzn9tbmLKtbMrmeKwNmDisTyBAGLk4BmEgYD8P/JKl3nJpLa/Ka
 bl5Idnp1ekbCjzrz/qdJrJfP1259uTL4GsP/7BX+oeF7w3Y+5euOWn36UPq8FvE7J+wZ5pQrrju
 6pUKAFQAL90r/
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_183930_153963_D737B41A 
X-CRM114-Status: GOOD (  15.88  )
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

On MediaTek MT7925 (Connac3), QoS Data frames whose destination WCID
is a TDLS direct-link peer are silently dropped after submission to
firmware via the HW_80211_ENCAP TX path. The driver sees submit and
complete counts match (firmware reports success on TX queue
submission), but the frames never reach the PHY. iw counters show
tx_packets growing, tx_failed = 0, tx_retries low; on the air,
nothing.

This breaks TDLS direct-link as soon as a peer auto-initiates one
(Samsung phones do this aggressively when both peers share a BSS and
traffic exceeds a threshold). Pattern is:

  1. Any sustained direct traffic between two STAs sharing the BSS
     reaches the auto-TDLS threshold within ~1 s.
  2. Peer initiates TDLS; mac80211 routes data frames to the TDLS-peer
     WCID and the AP stops forwarding peer-to-peer traffic per the
     802.11z spec.
  3. Direct-link frames are accepted by firmware, completed in the TX
     descriptor pool, but never PHY-transmitted.
  4. TCP collapses; the peer eventually tears down the TDLS link with
     reason WLAN_REASON_TDLS_TEARDOWN_UNSPECIFIED. Cycle repeats.

Effective TCP throughput drops from ~300 Mbit/s (AP route) to ~6
Mbit/s with TDLS active.

Verified on mt7925e (PCIe) at 5 GHz HE NSS 2 MCS 11 80 MHz and at
2.4 GHz 802.11n HT NSS 2 MCS 15. With this patch, TDLS direct link
sustains ~750 Mbit/s and ~130 Mbit/s respectively.

mt76 advertises WIPHY_FLAG_SUPPORTS_TDLS via the shared
mt76_register_phy_helper() but does not provide TDLS-aware
firmware-facing peer setup: no CONNECTION_TDLS constant in
mt76_connac_mcu.h, no STA_REC_TDLS TLV, no TDLS bit in
mt76_wcid_flags, and no TDLS-specific code in
mt7925_mac_write_txwi_8023(). TDLS peers are registered as
CONNECTION_INFRA_STA with peer_addr set to the peer's MAC and
nothing else. The proprietary out-of-tree MediaTek driver carries an
explicit cfg80211_tdls.c (PTK/TK install paths, etc.) with no
in-tree equivalent. Whether the underlying gap is in the firmware
HW_ENCAP path or in mt76's missing TDLS-aware setup is unclear from
the kernel side; the software-encap path sidesteps it either way.

Work around the issue by not advertising SUPPORTS_TX_ENCAP_OFFLOAD
and SUPPORTS_RX_DECAP_OFFLOAD in mt792x_init_wiphy(). mac80211 then
takes the software 802.11 encap path, which submits already-formed
802.11 frames via a different firmware path that handles all WCIDs
correctly, including TDLS peers.

mt792x_init_wiphy() is shared with the Connac2 family (mt7921/22/20/02),
which uses the same firmware HW_ENCAP path; the disable is applied
globally to cover the likely-affected chips. If Connac2 is later
confirmed unaffected, the disable can be narrowed with is_mt7925().

Fixes: 5c14a5f944b9 ("mt76: mt7921: introduce mt7921e support")
Cc: stable@vger.kernel.org
Signed-off-by: ElXreno <elxreno@gmail.com>
Assisted-by: Claude:claude-opus-4-7 bpftrace
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 152cfcca2f90..f9610c6c1597 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -681,8 +681,14 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
-	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
-	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
+	/* HW TX/RX 802.11 encap offload is intentionally NOT advertised:
+	 * the firmware HW_80211_ENCAP path silently drops QoS Data frames
+	 * whose destination WCID is a TDLS direct-link peer, breaking TDLS
+	 * data flow. The mac80211 software encap path submits already-formed
+	 * 802.11 frames, which the firmware handles correctly for all WCIDs.
+	 * Re-add SUPPORTS_TX_ENCAP_OFFLOAD / SUPPORTS_RX_DECAP_OFFLOAD here
+	 * once the firmware HW_ENCAP path is fixed.
+	 */
 	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);

-- 
2.53.0


