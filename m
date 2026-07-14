Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBDMwG9/ky6ssL+TbdSqxt4N2oK3lmPKFilDE6MIEWE=; b=h/zBiMgYwxjpR49vU0Eio54v8h
	xvrf1smsmnTe6WlmwTF6fzcICbNN7rU170qDykYUYalxds3qGmCZJSNHuwhvDGTop/4kBIo6rf9ls
	ZlszSAqf15thzlsv1FRhvbEOPdyeBG1OHi0nnEOl9aFp5UQcJRWNQzSgxpE9RoYhKfVI5io2j6D81
	tkNFo8SdN43i5GhymlYk/97kCqmstCBZdw4mIp3om9ygCS0vvSAqb2QHmv2SFFtKiPKFB4TJjb8K/
	UJvRY9DlG3zmDa9bG31KYPyaFQ1qJxU+3hLstNCnGauRb/+CWi2XeFA/I89Q9N6AN+RDWKidYrbPL
	d8395Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLO-0000000BYyr-2bK8;
	Tue, 14 Jul 2026 10:26:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLH-0000000BYsj-0iva
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:26:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-471eeac43bfso4052331f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024781; x=1784629581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBDMwG9/ky6ssL+TbdSqxt4N2oK3lmPKFilDE6MIEWE=;
        b=XZdV4G7PX8dfaWWnLaBZJmOgddqP8n8XhV+lNR7sDqXcv1OkIW+Ot9qwSy13YQx8mw
         fZduMgRdFuuRQkMfF7jkEPDm8MPGGzjUf5zYAKALwJNI+ducL2TVtj7BA7vIyOWA26va
         18rFvR074OlkE0aqpy8RaTAHE8u/Uw5j3wiP2WgK2S+VLQ6bp19M6ZUqA6NXpHTqEnYx
         cPNkVwWEUZ1wYCepH6d9xpMy9eQ/xSCv2KpkTkSJxvQWZDEGdRmvKR06J3Cpasn6Kgya
         rcA/X/xsFAlI2mwxRe4qtk7hZI1Qg0/UwERsX04dF5cKKpWS3v7tnmxEyl+WKZs5yuix
         WIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024781; x=1784629581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBDMwG9/ky6ssL+TbdSqxt4N2oK3lmPKFilDE6MIEWE=;
        b=Ajq5RdFgMAVCAnOv1PZQAYrli8SDPuQbPw07XUnN8R4OA2ZSsfzqY0UfkKw4ulhG75
         Lfxs0nnxXuTlTs5yKxXJOxOMFvARRHgFMXm+Z38xalmgfuIZAPIa9MWsZGFWQhXYl/7N
         +B2CykwRCV8Ts9JedEP9GhV1c4wWr+cvZLJBL4SEAJCHBazTbX0APCz2OOJRVtkKSxtX
         lQHdNaa10wdWFe6S+PD7igLXWuQMT4fZlAcOSLTdKCGCnlfE/U1ySLk5z2TESYwGGwv8
         LuvNnYlaxdT04sj8YEhp6PE+aMPKKH0iXykE6jNRxtzIGRJvPTCliFq9a4SuDk9lXkYy
         iOqg==
X-Forwarded-Encrypted: i=1; AHgh+Rqqjq3nr+MhGMfvdRZiST4Zfwf7H6NA8GnY2F6YMXANgqaeBr9gVygzx1qM04YtXMOjHt3OYr9f+GtZfBUnIkW2@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ5soyaBSBurP1cdaTcNuKUENbjSSgFmZHUo/XAlv7AMWNzJoj
	eNr6Hi+CDbkc5lEP2DlXyXUQAcH7j3/Zxb1ufWb0cmMGyHtmS9qhm6xE
X-Gm-Gg: AfdE7ckgsmFDKuGbI8gbVQOfFPC7vCMNBR9Phdoo2ZVvxNmoPd9SAFDAx8XZxzePKet
	R37/N+2XHtuDPCsJWx/jq6SpiM27CN80d8ERRZwCDTnOPZyNQv7IqKAUB1UFGK6Ci9b68WeZi4S
	vOf8ULrENejOV7cp9/ucOXBRx/XomXz/Z0FT8iOoJOht4Jtdv8YvijaEbfvo8EfCjFILZj2qZFn
	3hoUOeKctYJ0s7Hzrpik9l6pwR/bBFmwPHOhxVm0D75tvauH6pqR5Gtb4WhQ+EtD2wZeHpbGHMT
	kjaZEZqne4nxJhMAMfsCZI+5j3BiDxGYmUf2JG7gENRpiiR0t/oDkzelCIHEyRU8/k7T6MPcBML
	bHOTLwj/3jyLvh2i8Ebpf0kCckkGMksAU6udWdidUzYzUtEeddM2RN9BewA+cBYk4+qpHadmgdO
	uWgapCVtbjjFvkWwblKcWAYRzABFRxatriRPVs7FvxqcqgIuHGrSztI96t94r3thd933vJd6fLE
	ucevVM=
X-Received: by 2002:a5d:5d0c:0:b0:473:987f:c0ec with SMTP id ffacd0b85a97d-47f2dce7e1amr13941311f8f.36.1784024781255;
        Tue, 14 Jul 2026 03:26:21 -0700 (PDT)
Received: from localhost.localdomain (ip-89-176-136-191.bb.vodafone.cz. [89.176.136.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm7251991f8f.29.2026.07.14.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:26:20 -0700 (PDT)
From: Petr Wozniak <petr.wozniak@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	rex.lu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Petr Wozniak <petr.wozniak@gmail.com>
Subject: [PATCH wireless-next v2 2/2] wifi: mt76: mt7996: register a LED classdev for every band
Date: Tue, 14 Jul 2026 12:26:15 +0200
Message-ID: <20260714102615.2943-3-petr.wozniak@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714102615.2943-1-petr.wozniak@gmail.com>
References: <20260714102615.2943-1-petr.wozniak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_032623_221642_45A1BCBB 
X-CRM114-Status: GOOD (  13.66  )
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

The per-band LED callbacks (brightness_set/blink_set) were only assigned
to the primary PHY (dev->mphy) in mt7996_init_wiphy(). The 5/6 GHz bands
are brought up later through mt7996_register_phy() ->
mt7996_init_wiphy_band(), which never set those callbacks, so
mt76_led_init() bailed out early for them and only the 2.4 GHz LED was
ever registered.

The hardware path is already per band: mt7996_led_set_config() indexes
MT_LED_EN()/MT_LED_CTRL()/MT_LED_TX_BLINK() by mphy->band_idx, so per-band
hardware TX-blink works as soon as the classdev exists.

Move the callback assignment into mt7996_init_wiphy_band(), which runs for
every band, so a LED classdev is registered for each band.

Signed-off-by: Petr Wozniak <petr.wozniak@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index d6f9aa1ab..b77b85654 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -472,6 +472,18 @@ mt7996_init_wiphy_band(struct ieee80211_hw *hw, struct mt7996_phy *phy)
 	mt7996_set_stream_vht_txbf_caps(phy);
 	mt7996_set_stream_he_eht_caps(phy);
 	mt7996_init_txpower(phy);
+
+	/* Register a LED classdev for every band, not just the primary one.
+	 * Under single-wiphy MLO the 5/6 GHz bands are brought up through
+	 * mt7996_register_phy(); without these callbacks mt76_led_init() skips
+	 * them and only the 2.4 GHz LED is exposed. The hardware TX-blink path
+	 * is already indexed by band_idx, so per-band blink works once the
+	 * classdev exists.
+	 */
+	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
+		phy->mt76->leds.cdev.brightness_set = mt7996_led_set_brightness;
+		phy->mt76->leds.cdev.blink_set = mt7996_led_set_blink;
+	}
 }
 
 static void
@@ -542,12 +554,6 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	hw->max_tx_fragments = 4;
 	wiphy->txq_memory_limit = 32 << 20; /* 32 MiB */
 
-	/* init led callbacks */
-	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
-		dev->mphy.leds.cdev.brightness_set = mt7996_led_set_brightness;
-		dev->mphy.leds.cdev.blink_set = mt7996_led_set_blink;
-	}
-
 	wiphy->max_scan_ssids = 4;
 	wiphy->max_scan_ie_len = IEEE80211_MAX_DATA_LEN;
 
-- 
2.51.0


