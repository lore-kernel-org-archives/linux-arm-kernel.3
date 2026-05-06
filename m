Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4168CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04ncidu2w9RP0dQrMmKnvCZ7U/5L1OOGEwGtLj11dxw=; b=Ba8fj1McTXAVWlleTDkHnBch8J
	HseXP7y0bhRg04kxU6vwiQboKMeN0Br2EETkhKappXfw13qaYTFmKle9+7J88SqmQsmaD9Eolef5o
	uDjCwJUtfVa3S9mzv+nnnENBrCp6Xiqgt3o0Ptxy1/Mq+OR2w42RXPlLP1zRCWIyvBfMVq3PC7bMR
	7rtXAFIG3+QHWX1AzWxRzM1NlnbIItTzCShCrnGXEqxgydy9/6oWo5dwq4HJy6UFwmHaEy/qrC0Do
	H01d+FSJClOTYI8z7DYp0vRoAtvsRKJBWmaJCTQu7kbaSUL4vbtQuYhD6ptRJLhgfoqqDCyVoEpWr
	RqZm7OkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRF6-00000000QgY-1s2A;
	Wed, 06 May 2026 01:40:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRF3-00000000Qcd-2cDQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:40:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso5694148a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 18:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031600; x=1778636400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04ncidu2w9RP0dQrMmKnvCZ7U/5L1OOGEwGtLj11dxw=;
        b=Y+RBKYsrDInDIcWtKWqZjAGfBzwhvCoRqSnJKkfGmpDj9OOnWtCHLHQGvCwfqPtcrL
         xsfT8PpXsczJ0ky4d6iQnEODryOq9nG6sb5nxF1oCLCWrXjtJQTYEo3fKG6RDvcPsaP6
         s9PJO7j4612bE1JIW+P0t+00UtxZpbghVEx23kJzQrA20ts5uCqKLYH+doD+HdaySDxb
         bn5xGhiRo9EPjafRD9bIbnlLJ2ldkFzHLmneKAgpWYzgJm+uXH80kQdpTabYe0ytt83F
         Dsx49t57Ow095TGtsc1Sei1xXWHGnT18yKaj/AEmNl3Idzxvwhc0ksSg0qwE4lhOy074
         gHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031600; x=1778636400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04ncidu2w9RP0dQrMmKnvCZ7U/5L1OOGEwGtLj11dxw=;
        b=W3c8MGSf5FQKj0VNYcYCtXH2xcN+9vHjg9BDKgFv+tiYGDXgXZ6G3WBrrdzOKFkE/G
         FSms9CPzq4zq5OWFC51dLrOtICvs++YdnDPcEfF13RmRIYrr0w540axctiKwS/RPOW51
         OcpdBr6JoPpRHnXcjhDK+b7H8SYLgAoEKX48y5q68UYehMbjQ3bf2sWCq0cJHDEFYZEm
         PL6i/SPfEFjVV5c7nJ5Gs5lvdX/n6rtd+POrhuPsCfQPFv5Km8MSULTCe7YTAoB8LMeZ
         9H+sV0etMM/SOKdY5kjkGRpfgswzi1blDInJAyhkeqO/0qCdUHAVTEnSDLNvnHX6EUQD
         wjDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rAIetrNwrqOkHQRh9OC7Hod96FSKFoURM5TCKsXRe6TDeIiviUnPoNMs5HWadBRm8Maa/Jv1Wab2YQKM4pWqf@lists.infradead.org
X-Gm-Message-State: AOJu0YzmMZwKsrBwYWEfY580eGUDJKfqeuH6vvH26Go4WY2qCMqexCle
	1H1gvjjNbqYV38x/wy0V+kLUMzYW7dkhCjipw+PkCtlAP1cxa4JTPqpk
X-Gm-Gg: AeBDietIX9uuZl5GGW31o4mi2jO9BWhMRfcfderKQTIZZ3nZBgZfx9PRHlC8p/gO3CI
	F/ZJT+BaXKM7U83HwUmQN8Y3JODBQhZPV0FWUxXFQWSggqyUq4N5x4+C/4LiC7Ef+d+DpmGPqXn
	l5oprX9GVky5DAKOtBTndApls7JD/gm6Ex01NsinY6liIkWN6ka8T0trquNswTV4TYe91+CCDeZ
	wLO3pfPthNw+AYeJyMTo60p47LjLYMCgRlnQRGB893ujY/rlq1SsPElOpUs1meu3zNw8hRbyyr1
	32P6DKcYE/UDX4L18hMiCjdv2kRJ6yd5f6fNoxwY++oc/pJF6b+6SX/xgjk0WpfiIP673v52cPR
	C/Gtgao0/NHaCtVQHDLNwM9tQuQezP0bju7HCa8MY5gc6UGCejPxL1NRVaOOEg+7TLWEaQfsDEx
	pUcCBuI6FqfSLi3146JpcMyBEYuFjr1HbyAAX/O7ELMCUJUKYAhhsqit4dC0s1GwoCqNArUhpAx
	WL6+QVszFzBETcl6AnH5sPSCgJIK2LsUQ==
X-Received: by 2002:a05:6402:a58b:20b0:676:d85a:5faf with SMTP id 4fb4d7f45d1cf-67d63d855e2mr287194a12.9.1778031599366;
        Tue, 05 May 2026 18:39:59 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-195-107-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.107.195])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm849388a12.0.2026.05.05.18.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 18:39:58 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Date: Wed, 06 May 2026 04:39:15 +0300
Subject: [PATCH v2 1/2] wifi: mt76: route TDLS-peer frames as 3-addr non-DS
 in HW encap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-mt7925-tdls-fixes-v2-1-46aa826ba8bb@gmail.com>
References: <20260506-mt7925-tdls-fixes-v2-0-46aa826ba8bb@gmail.com>
In-Reply-To: <20260506-mt7925-tdls-fixes-v2-0-46aa826ba8bb@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 ElXreno <elxreno@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7203; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=P5GGRaMT2aaO6cv++PtfWsFBVuVNFRyIWoxv/wx8yfg=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzF+z37CkRks8YFK1O3i6MfHWBs38PUVOqrP26k6r3
 OJ977nJoS8dpSwMYlwMsmKKLDzn9tbmLKtbMrmeKwNmDisTyBAGLk4BmMgCHoafjDOtp26wYNxz
 Kzg7cdfWd8xmjgvrFonlvHN9zeFS4GG7lpHhno1S27m34vs2//vjuJ7d1TtvY+Qy2ZzrPQ3bVzT
 kS7jwAAA/IkcZ
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_184001_780344_931894C2 
X-CRM114-Status: GOOD (  14.53  )
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

With HW TX encap offload enabled, the mt76 firmware builds the 802.11
header for the 802.3 frame using the per-WCID context. For a STATION
vif the HDR_TRANS TLV currently sets ToDS=1, which makes the firmware
default to the BSSID as A1 and emit STA->AP-formatted frames
regardless of which peer the WCID points to.

For TDLS-paired peers this is wrong. Data frames go on air addressed
to the AP, the AP MAC-ACKs and silently drops them per IEEE 802.11z
(an AP must not forward to a TDLS-paired peer). Management and
control frames bypass the HW encap path and still reach the peer;
only user data fails.

Add MT_WCID_FLAG_TDLS_PEER, set it in mt7915, mt7921, mt7925 and
mt7996 sta-add paths when sta->tdls is true, and override the
HDR_TRANS TLV in mt76_connac_mcu_wtbl_hdr_trans_tlv() (Connac2 -
mt7915 / mt7921 / mt7922), mt7925_mcu_sta_hdr_trans_tlv() (mt7925)
and mt7996_mcu_sta_hdr_trans_tlv() (mt7996) to set ToDS=0, FromDS=0
when the flag is set. The 3-addr non-DS form matches what 802.11z
uses for direct links; the firmware then constructs the frame with
A1=peer rather than A1=BSSID. HW encap offload remains enabled for
AP and any non-TDLS traffic.

Verified on mt7925e + Samsung S938B over a 5 GHz HE 80 MHz channel
with iperf3 -t 30 to the TDLS peer:

  before fix:  over the TDLS direct link, 7 TDLS Setup action
               frames and 3 RTS frames reach the peer; 0 QoS
               Data frames make it through (mgmt/control paths
               bypass HW encap, the data path does not). iperf3
               stalls.
  after fix:   2.90 GBytes transferred at 830 Mbit/s sustained,
               0 TCP retransmits.

mt7915, mt7921, mt7922 and mt7996 are not regression-tested in this
change for lack of hardware. Their HDR_TRANS handling mirrors the
verified mt7925 change; the firmware behavior is shared across these
chips.

Signed-off-by: ElXreno <elxreno@gmail.com>
Assisted-by: Claude:claude-opus-4-7 bpftrace tcpdump
---
 drivers/net/wireless/mediatek/mt76/mt76.h            | 1 +
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      | 5 +++++
 8 files changed, 28 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..07955555f84d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -361,6 +361,7 @@ enum mt76_wcid_flags {
 	MT_WCID_FLAG_PS,
 	MT_WCID_FLAG_4ADDR,
 	MT_WCID_FLAG_HDR_TRANS,
+	MT_WCID_FLAG_TDLS_PEER,
 };
 
 #define MT76_N_WCIDS 1088
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 89bd52ea8bf7..f61d0625ef51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -491,6 +491,11 @@ void mt76_connac_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb,
 		htr->to_ds = true;
 		htr->from_ds = true;
 	}
+
+	if (test_bit(MT_WCID_FLAG_TDLS_PEER, &wcid->flags)) {
+		htr->to_ds = false;
+		htr->from_ds = false;
+	}
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_hdr_trans_tlv);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index e1d83052aa6d..51643a48ed15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -760,6 +760,9 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->wcid.phy_idx = ext_phy;
 	msta->jiffies = jiffies;
 
+	if (sta->tdls)
+		set_bit(MT_WCID_FLAG_TDLS_PEER, &msta->wcid.flags);
+
 	ewma_avg_signal_init(&msta->avg_ack_signal);
 
 	mt7915_mac_wtbl_update(dev, idx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3d74fabe7408..d39cb881d75e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -828,6 +828,9 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->deflink.last_txs = jiffies;
 	msta->deflink.sta = msta;
 
+	if (sta->tdls)
+		set_bit(MT_WCID_FLAG_TDLS_PEER, &msta->deflink.wcid.flags);
+
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0..61330e3c18b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -887,6 +887,9 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mlink->wcid.link_valid = !!link_sta->sta->valid_links;
 	mlink->sta = msta;
 
+	if (link_sta->sta->tdls)
+		set_bit(MT_WCID_FLAG_TDLS_PEER, &mlink->wcid.flags);
+
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 22bad3cba8df..333cacfaca9c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1091,6 +1091,11 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 		hdr_trans->to_ds = true;
 		hdr_trans->from_ds = true;
 	}
+
+	if (test_bit(MT_WCID_FLAG_TDLS_PEER, &wcid->flags)) {
+		hdr_trans->to_ds = false;
+		hdr_trans->from_ds = false;
+	}
 }
 
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index a8a6552d49f6..9b8db6efb5ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1164,6 +1164,9 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 	msta_link->wcid.link_valid = !!sta->valid_links;
 	msta_link->wcid.def_wcid = &msta->deflink.wcid;
 
+	if (link_sta->sta->tdls)
+		set_bit(MT_WCID_FLAG_TDLS_PEER, &msta_link->wcid.flags);
+
 	ewma_avg_signal_init(&msta_link->avg_ack_signal);
 	ewma_signal_init(&msta_link->wcid.rssi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 16420375112d..6aaf3ed94221 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2139,6 +2139,11 @@ mt7996_mcu_sta_hdr_trans_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 		hdr_trans->from_ds = true;
 		hdr_trans->mesh = true;
 	}
+
+	if (test_bit(MT_WCID_FLAG_TDLS_PEER, &wcid->flags)) {
+		hdr_trans->to_ds = false;
+		hdr_trans->from_ds = false;
+	}
 }
 
 static enum mcu_mmps_mode

-- 
2.53.0


