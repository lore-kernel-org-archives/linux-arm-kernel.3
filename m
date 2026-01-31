Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4312E6BF22
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 03:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a+tuxKzfIwGph4KGmy/W4D3saam1yAaOrHAbmg45lyE=; b=VvYomG2qkXxCVg0QCKUvBrBfer
	FqHpL6mD6sAz1Tp6Njr2o/fiSlkYGRG/aCBm8lY88APj7Dhohwsp75N4ocvqrSrmq4Hg7/YhvQFBX
	oHx5kWI2r67PBSSXKfJ5Q65usvyvdINZsV613/XrRtSk1GY9SHtiEc6EurZA7ZLWaJC6pIxM3JA0Z
	9Ar0LebhUtrkHWpa/0XPCv7dSF9/VbGNmQhj01MYWjTRkChw5WTQwIkWaEfsIwOyV9tTaqz4v8nIl
	nyLDsrZkX5aEauAlFVAutch2OuEzMPrboYAUzvyORHosvckCaNzYYVqrZEi2bzNDCyWgjK0SeScR0
	TLep3Slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm21y-00000002Hwf-2Z7q;
	Sat, 31 Jan 2026 03:52:18 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm21u-00000002HvK-2nV4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 03:52:17 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7d18dd2adf7so1647646a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 19:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769831533; x=1770436333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+tuxKzfIwGph4KGmy/W4D3saam1yAaOrHAbmg45lyE=;
        b=tB38abUrOAAB1zOZa893UpwOZMgw9/z9RYCumu3BFV4HRvaBH+TE0I2r+G4HgYmrPF
         GaTR7Yrjp7RLC4wiwdv71J/o/cvfyAanKNZXsA4hJ/OhKuBTvcPBZuYTmlC5qfM8US4R
         Ya0OLKCrUXyQZL2pRzUzKp+Ddime6FemcmC4jZ+fRw7ILiZm/3xc5MzPN/zF1kWkZvya
         8mbKnykz0E33Kz8pQlRMrVANv9RtyZaBm2gw17B2aeGul5c8CH9gnN/80P4G64DKf/EF
         kfkPgaALGGhcel63nR13x6RL/xPLcUT75YZMJnbo1izqYSAnLJmrOeq6Lg6skhRuZhSK
         0rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769831533; x=1770436333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+tuxKzfIwGph4KGmy/W4D3saam1yAaOrHAbmg45lyE=;
        b=L+ThjDApVXzMXbqouTyJL14FRr50AaYVPY6+t4miQGIFmKCOjoij9cfO2P0/AeSXu7
         7hMrndtelHSsw1v53nvf15uMrZFe3iELEXlPomBLojhXmdAsZrUynYSSmspKoF1cNCL7
         RAqqYL9OIR9u/l9dWPNBf/Fz9eI3m/H/ARvmdTeUapUuA9L66ZjQqwx148wkVg8O6o3A
         WAVjhNDVXDky1ZRuFWIashaV9BRCFsnyHVhoolUvfHHrA1/0W+eq0XnL7zbcgZ2Ms6+I
         +n7hzcFnnBdkuqbzouvOVQtACDgi9l9VgK6BOVRPbGRPefLSPD9HItEBIcbMM0xtkrkd
         GuWA==
X-Forwarded-Encrypted: i=1; AJvYcCWar5ucuuyNm9A9I3oggPJG0rwhdevA1s/tp9r763u8jxx0TyQecyB5wmg4sVOr9CWX8juGOBety+qeIMJu2uB0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHq0r2Za+szlowHi6X0rfzxzt5vi9uoWf6r5K0ekJExtkXkK4h
	2L8bMKVabtIahuTphqkHYqNrrlFdBxdK+C4fiVBjJSgtxq0a8H2W2ph8uMZf5vN+BGA=
X-Gm-Gg: AZuq6aI/8f0D9iuvn4JKNkJcRPNeLExBca/bu+4bNJzOQjV6y1vq+Z90G99hoDdt/H/
	J8KPuNO3E+BGu+P2oelpLpUlmr4EB6+NEewYE3GLupiwfzhuLZoHI9t33KXm+ZVE8S2A8bZfQUW
	to8PyPCSjqGRtDnAuPDFIuMwOM3Wmjria9ACpA2oAUhrFcM/MEkJVz+9jH7KaegDXonbztGTyg3
	WekMZaR60dSflCZti7tgOEFME8JUU3r4e0I8q6t7KmcoYt5ngVBJRVb3X9rzWCIgDlTdNhzHQTY
	C0QCr8CPQ/71SPtL4mSYPTUH+dBN5dGITACK+ild7U/iD3ySy4xs8Oy3CF8aQfkAnbYIynKior3
	73quvrXRbSfeH4XGyM+KAXlVZDWzzCDA+JiKhG9XyxBwOQEYcDpeIP6VC6Xabh5wIYTr7AI/Qv4
	uY2w7fQ09Rdj/FOxLsMbLqt44aLR3L2Yr2Hf4cn64qDycJ1zuhACysDTQFCt7Tkv+u/B0H4DE1o
	9o5r7FdsftgONAnfSWVnp/s+XSQch0=
X-Received: by 2002:a05:6830:6738:b0:7cf:d96d:7882 with SMTP id 46e09a7af769-7d1a5250f74mr3189657a34.3.1769831533374;
        Fri, 30 Jan 2026 19:52:13 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c69ac16sm6727975a34.7.2026.01.30.19.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 19:52:12 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH v2] wifi: mt76: add missing lock protection in mt76_sta_state for sta_event callback
Date: Sat, 31 Jan 2026 03:52:10 +0000
Message-Id: <20260131035210.2198259-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_195214_972129_39F6B446 
X-CRM114-Status: GOOD (  10.78  )
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

mt76_sta_state() calls the sta_event callback without holding dev->mutex.
However, mt7915_mac_sta_event() (MT7915 implementation of this callback)
calls mt7915_mac_twt_teardown_flow() which has
lockdep_assert_held(&dev->mt76.mutex) indicating that callers must
hold this lock.

The locking pattern in mt76_sta_state() is inconsistent:
- mt76_sta_add() acquires dev->mutex before calling dev->drv->sta_add
- mt76_sta_remove() acquires dev->mutex before calling __mt76_sta_remove
- But sta_event callback is called without acquiring the lock

Add mutex_lock()/mutex_unlock() around the mt7915_mac_twt_teardown_flow
invocation to fix the missing lock protection and maintain consistency
with the existing locking pattern.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Move the locking to MT7915 driver to avoid deadlock in other drivers

 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 90d5e79fbf74..e212e964fda0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -851,8 +851,10 @@ int mt7915_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		return mt7915_mcu_add_sta(dev, vif, sta, CONN_STATE_PORT_SECURE, false);
 
 	case MT76_STA_EVENT_DISASSOC:
+		mutex_lock(&dev->mt76.mutex);
 		for (i = 0; i < ARRAY_SIZE(msta->twt.flow); i++)
 			mt7915_mac_twt_teardown_flow(dev, msta, i);
+		mutex_unlock(&dev->mt76.mutex);
 
 		mt7915_mcu_add_sta(dev, vif, sta, CONN_STATE_DISCONNECT, false);
 		msta->wcid.sta_disabled = 1;
-- 
2.34.1


