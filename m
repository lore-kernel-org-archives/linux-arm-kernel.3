Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2314DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU+q7eWhkGer8GyP69DC5ptsWUViocS21pDQ3GPfREM=; b=IxDkTNnPYa8X/SSIM6OBCyJgRo
	lcdEjXuGkc7vpaiKE9pjPMuHusrQsPJgtwCtUwbOM3+yF2oxAmxQC5LZC9Np/zQ8S6+fsuUCzTtfZ
	j5CXi0Yt8sDiiPTuS4Z9wKB0AwRm+oA+mOziwh4ALMpGpY5hY512WAe65XcApgzfyth5kfnrd2ir5
	2TS0HeTJOsFVju1NnpZrR1u6l376wkb86EAb9l7kZoni89DSiuBjf06G/JsTFRMxz6QLyfP4QNqj7
	9FRXhlCfvcG5R0ipj8yjn56TpDjVUgt8F0mrNgsTx1l03tR3tKJlZH3mniHRX8TnvbQHInIX7z8ds
	DeTU23Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRFA-00000000QkQ-2zaL;
	Wed, 06 May 2026 01:40:08 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRF4-00000000QdW-3Jsa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:40:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso8451886a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031601; x=1778636401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU+q7eWhkGer8GyP69DC5ptsWUViocS21pDQ3GPfREM=;
        b=rVO4RBkFWYYEihdt65R7W57M5KDTagm1l+CzYHMZ4TRyN+MtlBTRwgS8jrt7F1cFnI
         TLURokl2h0pFPyvvmWwKQ8W59UK//+hCQOaBvh3/djFFA91i715tGEnqRc3Ajtd16wAg
         TpEJvIOzREio8XKaQ+kAV6N2tirfHQN7FFRA83Zu+MgyKQF6sTXJ9XVuldqYIS+915Xy
         Bz2fmdvEPRGCJRCkmcJIP2CFm1v4iPb1faLvVZTfRGbOdPV8AHti7gRz/LXxK2pE6Ekl
         cwq+k0cUnxF1suxkyyjOXvfrZbR+zO1uInN41g0Izxe6IPPXBSdSbzXK1A+EletjN3Cx
         v6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031601; x=1778636401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EU+q7eWhkGer8GyP69DC5ptsWUViocS21pDQ3GPfREM=;
        b=UHMO16tWfBr3pn6aI0kC/yGb/Azp2aqYpJ+dkdnnkvWNGyCQwBZSekpLx4/Ry1laTt
         0/VJB3hBrKxjJyWndBfg9oPFc2nd7Ew09cPt2yC0ZS2CxdCjs6UbV/FUbl3QkAj91FUr
         j3yQF6w1gqCZZO7mdbnDL8ngUEyiWQeZ3aSwcxFTEd6GyaH1BlkyQ+UtVjAQexltWRRZ
         91eDzBe8M3BEKJr32BhILRFLW5YtRu7TaA96JifLWS++duu1CCBQHqrB1UyYZ+bpt34A
         PYc0vHjLQhhIT/jOUJnh34nTSN/DMu/LBdwgZ4VTSLu57cZhHGDMEA9HcDHiDBBJJd+4
         stqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V+wQyLVWZJ9oUsh9AFPaQAL/gpncAvtSbFztqkGkYjJLRifmDoJB/TxF6eFdJGLjQecmGqSQnDuBPKZ0dJrxb@lists.infradead.org
X-Gm-Message-State: AOJu0YzH52Gz3a+xLJybJ4hMuY1cjgbrIg+sZkO39LGvxj/TGVS4opI6
	1tzXDvx1SmnpWLgEen4bsDi+TYwSQRzAW8v5xJP9aZchwUt/OFrXHiQY
X-Gm-Gg: AeBDietrrY6UaCbFOIR80G7LSkJfghUgpjQxFBfEndF2a7F5n3RGEdi3luBo06CaqtW
	ayYlxPoBzp+Md//CteOQSOE35blYTVYp4e9za/wKiaPWWGAqy+eRiO4brPIbmNSkzJvnI964l6y
	lSfvFetmG/XgSLKxsZzRHIK441po+UrAoaulfShNZj9og4fd06OcYb9BSscvcCVmRBJEFAEyRUL
	g+ZUUSxTFOPrB/UjGyfzuDB6p9qmGyakCDcKKCxStJxtXAgoquDsta2shmxAQjFjbVmCM4Y7PUk
	ewnrdMaPoip0XRFalH7rbVpYeDEHcK/Ug9CGnHTkIcfuYwTZ+mXL1LnN/f1goJT0HKTM6TqTsf2
	0UXzsOg8heb9oHRMuuDfEW92s5ZsHT5O7Hqo0m5WFb6hKgYoYVurCjK3k2jQA/V6OIbhuycDjkn
	pfCz/jwA3HoTQPE8u0236Mzws9PVZ4AdlvH2z0Pz5mZZwhR7kEdCodhDQh4Krzw3sks6fQAv8rE
	fsyOQQ5LZU8+JfpLpKMFzgMlK3aGqeKisbbPym98ZWl
X-Received: by 2002:aa7:da97:0:b0:67b:790e:bf12 with SMTP id 4fb4d7f45d1cf-67d642c098cmr294960a12.12.1778031600972;
        Tue, 05 May 2026 18:40:00 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-195-107-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.107.195])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm849388a12.0.2026.05.05.18.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 18:40:00 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Date: Wed, 06 May 2026 04:39:16 +0300
Subject: [PATCH v2 2/2] wifi: mt76: mt7925: don't disable AP BSS when
 removing TDLS peer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-mt7925-tdls-fixes-v2-2-46aa826ba8bb@gmail.com>
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
 ElXreno <elxreno@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=Gr7EWkvsipUpzm6yGXOHgRC0cyi+bO2nl/KB1dA/mFg=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzF+z37i4btCS8Hxb1Jjfq5GaszDbxFTh898l1w1sQ
 pn37H/EGNpRysIgxsUgK6bIwnNub23Osrolk+u5MmDmsDKBDGHg4hSAiewpZvhneTPCnv9UuPQc
 l8k1B5Juay1R3BVzXovxruVS1ZBrrMkhjAznmaYfWXBieixbQsqpA1N445dZTxbw/yXbrpVXMDH
 K1IQbAIBdQ48=
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_184002_865922_9C2364EC 
X-CRM114-Status: GOOD (  14.10  )
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

On a STATION vif, removing a TDLS peer takes the mt7925_mac_sta_remove
-> mt7925_mac_sta_remove_links path. The first loop in that function
calls mt7925_mcu_add_bss_info(..., enable=false) for every link of the
station being removed. For a non-MLO STATION vif there is exactly one
link, link 0, whose bss_conf is the AP's. TDLS peers do not have their
own bss_conf - they share the AP's BSS.

The result is that every TDLS peer teardown sends a BSS_INFO_UPDATE
with enable=0 for the AP's BSS to the firmware, which wipes the AP-side
rate-control context. The connection stays associated and TX from the
host still works at the negotiated rate, but the AP's downlink to us
collapses to the lowest mandatory OFDM rate (HE-MCS 0 / 6 Mbit/s OFDM)
and only slowly recovers as rate adaptation re-learns under sustained
traffic. With brief or bursty traffic the link can stay at 6-72 Mbit/s
indefinitely, requiring a manual reconnect.

mt7925_mac_link_sta_remove() already guards its own
mt7925_mcu_add_bss_info(..., false) call with
"vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls".
Add the equivalent guard at the top of the cleanup loop in
mt7925_mac_sta_remove_links(), above the link_sta / link_conf /
mlink / mconf lookups, so TDLS peer teardown skips the loop body
entirely without doing the per-link work that would just be thrown
away.

Verified on mt7925e by triggering Samsung-S938B auto-TDLS via iperf3
and watching iw rx bitrate after teardown:

  Before: rx bitrate collapses to 6.0-72.0 Mbit/s, oscillates 17/72/
          137/288/432 Mbit/s for 30+ seconds, no full recovery without
          a manual reassoc.
  After:  rx bitrate stays at 1200.9 Mbit/s HE-MCS 11 NSS 2 80 MHz
          across the entire TDLS lifecycle.

bpftrace confirms a single mt7925_mcu_add_bss_info(enable=0) call per
teardown before the fix; zero such calls after.

Fixes: 3878b4333602 ("wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, assoc, remove] for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: ElXreno <elxreno@gmail.com>
Assisted-by: Claude:claude-opus-4-7 bpftrace
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 61330e3c18b2..041d06143ef1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1268,6 +1268,9 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (vif->type == NL80211_IFTYPE_AP)
 			break;
 
+		if (vif->type == NL80211_IFTYPE_STATION && sta->tdls)
+			continue;
+
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 		if (!link_sta)
 			continue;

-- 
2.53.0


