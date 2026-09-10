Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44505C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=; b=B9dNH10JnNoU4T1M5nww1u8TVP
	UonGJa65C4rSTMsBL0hlcJSR17pz5/+lLBYle8jZPmn0WfddILdjv0ZccB8AW42pWCzk3dIxUzgS0
	MpOkBFhvu1tOlyBh78ieGoDTf2WFbtMWkJoTPMMcyWJBQpPV7snLwnVRmwdGqrZt6/mcudQe1RVyS
	lU+GqXkc08UKUakQIRGq8lCtqh9Bu38zgKtK9CphUbdJ29picF1iecPcy+W2jgyojUk7wu4ZTO73j
	SFSsLphKcpiC7wto6FQUV7BUgv12f3YnRPZXKRdvjA3EmYBMStLQ+T8zP1yTbgDUnRrdy+cRtK7+6
	Y9loNIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mjO-0000000FS3s-26rR;
	Thu, 10 Sep 2026 21:54:54 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mjM-0000000FS2w-0abM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 21:54:53 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso2207276d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077290; x=1789682090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=;
        b=nY9SCpwelAsGDZzJiGP+WGXYaYsnmUFoQUfJ6/eVorwR6hoS8hD2BYPl9vF28ACeWV
         5VrQoryxCKh55Xb1uRZ/YFSwxrmAPLyt1ENpUNAFyhcdG20nstSeBhSD+QmEeY+sLU5N
         qMsrP9LOaJSs2KkdJQBrP7cTidsZvEpREWfCCO4Z3xECAIAVYzgKt8eYgvbOBZHfmTYR
         X/SuW0PXvu1aMQZTVLM43c5FjEHpKCCwdjdsSOc1UScHwqlRjl4dTCrZDjtQswihg341
         zBttLBnEr6uO6O+mgJP3OJixooZsoLY1XTjIbnhgy6vJHrl6sv6vT0Yi7cl6GDof7/2o
         j0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077290; x=1789682090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=;
        b=Jjnv0nWLtTEzK1tegpezHStKLEG9DFWuG51QvwBBLkqgwsrQCUdfcNamiw0BKIKqHi
         YRKNyiwro/XrY6UE0AGHUflTQZxfUeFe4sS6WEa1IZIKgB55w6Qg4djwP50qcc8heHl7
         w/D//CWde/MzK+AHxKvYmvD9Mj9t9yb1xFHUdwQL8pt7jTU2fKWZoYlSyEUD1WJf6+RE
         OofHXrIoYdz3l1bEFIzs53D9upfYAiJ4SvSnGCXDmhaJWY5tVWyaVPvuo7clylR9eNJa
         OxcOFEnTtXb1xg3x/0UU5peWg5MI9CClTm41feAwDCjqPkS2eZypNBXXrc9Hyex6jykW
         Np5A==
X-Forwarded-Encrypted: i=1; AKwUvByhZFEiSJOfhhIOqDqLatcRWl5f+iwN1LK14xkbmDEljWabuszZ1rzBs+/Eu8K9/sPhMsVPNMfNP92SzSFacnam@lists.infradead.org
X-Gm-Message-State: AFuF++lgYLsaGYhhpArQa4/XwcEpoCi6yDwfOVBxdHYAwZ1S6sLYtzgB
	m8xO1OKrwVsP58Eu+ZlkVks7i9SW+wcpwiHbKWoNQfapCnwSkCLateo=
X-Gm-Gg: AYBFou0Oo//j92OO/jI3Twr+RYYe1QOJdBu3Ffi5jjjiineeNL4dQxrbVl6FqZgQoOX
	0zEBGs/e8ygO5jmims38Tfikx35rq/Q7/STfrdiox2K5CS4oyz02o7kFuR/pNrpLBBgnaqUkJas
	/pvZEmD9X9HOpLBd+qRYmIm68rcWd7VfW8M6Wbkf4v3tWkBQxFS7ria9lzmbCOGy4Z2DwVmlPJa
	kjmqsHY+HQ+YSrYmg5T7TAxk0bsyUhXqWI6APK+jeZQdDr6L9rfB3O9kzX+mH1dVga9cBVQklnv
	gtA0sma98NPV2ZYEJS+ltWZz6vOK/972rb7zlXGXKVaYQMGtsQP9eIyKtjy8GhkQRN8pKfYw0th
	bXkTfUI+f59WBDA36k9ywE1zcdp3Ngeqbd/0NTfOaKTI/0xdvVC5TrKZfjr2WERNPOIT5ROVhHj
	fHAfqS9nmlCGIgCytCGbh18oiLSi5uquYO4X3oL0UJwf4MSUnO+Ev3McLT9StOIbHHogHNx7OK0
	88zyIbQPErpmtIxw9TFAkEeAaLJzB/x1DLozbCA0SCgm3aFWnJkIbX4KosjwJIVQPnqiTuluoGR
	gN3LVRm8tlHYljcOW2Sf+0+1RGVD
X-Received: by 2002:a05:6214:3d9b:b0:90e:93b2:3205 with SMTP id 6a1803df08f44-912120d689emr17573146d6.22.1789077290445;
        Thu, 10 Sep 2026 14:54:50 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f496598sm5826736d6.35.2026.09.10.14.54.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 14:54:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] wifi: mt76: mt7615: restore DBDC state after ext PHY failure
Date: Thu, 10 Sep 2026 17:54:41 -0400
Message-ID: <20260910215441.76683-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_145452_194498_D2A35DB5 
X-CRM114-Status: GOOD (  13.34  )
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

mt7615_register_ext_phy() limits the primary PHY to DBDC capabilities
before allocating and registering the secondary PHY. If allocation,
EEPROM override, or PHY registration fails, it returns without restoring
the primary PHY capabilities. The EEPROM override failure also leaks the
newly allocated ieee80211_hw.

Route all failures through common labels that free the secondary hardware
when it was allocated and restore the primary PHY capabilities.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 0f2173f093b3 ("mt76: mt7615: add support for registering a second wiphy via debugfs")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c    | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 42e11ba1206ee..02e51b2d42ed8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -542,8 +542,10 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	mt7615_cap_dbdc_enable(dev);
 	mphy = mt76_alloc_phy(&dev->mt76, sizeof(*phy), &mt7615_ops, MT_BAND1);
-	if (!mphy)
-		return -ENOMEM;
+	if (!mphy) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	phy = mphy->priv;
 	phy->dev = dev;
@@ -573,7 +575,7 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	ret = mt76_eeprom_override(mphy);
 	if (ret)
-		return ret;
+		goto error_free_hw;
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
@@ -591,7 +593,14 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	ret = mt76_register_phy(mphy, true, mt76_rates,
 				ARRAY_SIZE(mt76_rates));
 	if (ret)
-		ieee80211_free_hw(mphy->hw);
+		goto error_free_hw;
+
+	return 0;
+
+error_free_hw:
+	ieee80211_free_hw(mphy->hw);
+error:
+	mt7615_cap_dbdc_disable(dev);
 
 	return ret;
 }
-- 
2.47.1

