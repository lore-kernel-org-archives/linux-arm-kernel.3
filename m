Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53472D73EB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 03:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6W/Gjxb5BYcwIBkUjagY0/HM2eFwFo2YH1eXPS7fc80=; b=HAeD3nu0OwaiDYbnUtSBXHg1OT
	MJVZDC0rQgvXJz4MOBp+V+OA0iE+ai47X58WlQaMCnOzcY74mV/ADWlhM01gjMqYqQh32z11BMXW1
	2DDbgrZa5CorgkGmKuxdxL1Gij04MYafqT38KfUotPfhClt6biUCp61Q+/hh/1KLcyIPmTW0vr2de
	tfMmnWxjp6UdnsMMNW3d+NJSMyTTXa0JH6dBRqswbhfZlMCgBG1Z61OjJopY5QQlHt13AQTdBEO0B
	+UtywwMcEtXhEpmXol2lIT3gJd0lAr/0971CKFU9az4lKC2eCAtoZfbE1wmsBAARNzDMz16vNEXtO
	mrigli3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlf8P-00000000xNc-2bKa;
	Fri, 30 Jan 2026 03:25:25 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlf8M-00000000xMa-1deT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 03:25:23 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7cfd65ea639so1083177a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 19:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769743520; x=1770348320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6W/Gjxb5BYcwIBkUjagY0/HM2eFwFo2YH1eXPS7fc80=;
        b=oeo4L2kHt+G1a5qvjjIi0M6jL+oNIVl2sk0RToCS8WpJqChwqYy6GDqIblbt8Oqzr+
         cqnDkHP0tKWWoHcBucOmxYp+faO/IOWqQoLclmNCgAdQgbzopIIarb04ypol79DKemUO
         MuA94zo2efx7YrAlo9m0EuqLK4PYflueMcHvxVucV2eFR+ERdtLE8PFXL4R2+5Ljr8x+
         KRtaf0iv5H0jAoOinsDO9BfF4OiDVL7028VHDfOBsyZ1HfdRuiW9aOycYswbwx4x6CLS
         v+ZFmXoBH2eJQxc3zDJgirx8caJw92/A7fMi1e0gzVlY8glt4wgcLdU4bJnIbMpojwRr
         wbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769743520; x=1770348320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W/Gjxb5BYcwIBkUjagY0/HM2eFwFo2YH1eXPS7fc80=;
        b=utQ1BKzD0fGly+SlHn5h9Ng1tYJbWrfsjslKCT0UxXE76KmGhKo0Mw+bXDY9M82iug
         vgwH60dAjSrltZl727O9+MO9QOGSGzf937utKjnWoBX1reiBy96qamcwXXZEh8hWp0ga
         5biFwOI2aQyZfZfaF3n38XTJuoegZ8dhAj5WwqGNWXTszLo0o1rXNWwRT07NJIfz3M3M
         cLIw1ZE5nn6gsl/F+v3AhmUdcAa5uHilFc/hpD8GQSD1WXd/udioPoKrFozDHSutuoO7
         UQQZMTdMv3ynyftsYJkE637F4luJhki4ycxoO2roZhJStwvO3q/YYtAazYYRN5pj99Yg
         xI/g==
X-Forwarded-Encrypted: i=1; AJvYcCV+3uhc8RrQeCmImr4U+CyxLQrXKleOOUkoGgBzAlJhgVZruYzlhXIc6C3tIl2nbTo6aiLdqFfysmi8bfsnaZ7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1wFUI50/N64BiQRGuTGe2w+djLtZzpO4SNbd1oif9SHGNhaIV
	thBf4+HhQ258VfofVsUv1tJmbGLC3Z7o0KR48WxhRBmpYKFKjURhdsn0xv77ZduD4pQ=
X-Gm-Gg: AZuq6aLs7lcD4jNr4dz2TBpWipiJXfZXQUHlMEqbxH5J9Na/PK+j3uwmutT+xjLfLT9
	oXdRmNyB3dl+MbClMzkkLP/M889IKmATls6ZXAgQcnFjdiowYbSAzzAsIb45bEW15b/88wUzxpE
	88uOzrh0P7Y/xBiJgzSDHzqkoD+LHjmHY32Og0ecYsTDC/HruH2Hq+mQ/gh6pe5TEc+IQoyIkzV
	dDvH6v4BQTFy7QvERyf8iQxf8rjfhBwpteVvgHcj5ZUQ9Ivt0e2tqC11U1Xt9DjaXbmHuWhec2r
	umjEJ5elAc9/oRmwdVzuTGZlRWLfRjYQUo0tbEXQRDxi2/N0AS1ZmnN0U6P0VnM5fMgyPJycARF
	E/YV+kgYryF5XWrAZVasD5CaL32z3db+TKNgBQmF8G8whLFuj9jZ7jp9EneKw6cTeRiFcwziw0I
	lO4Qn7eftBAuBUXfH+G2CaSe6PhuYCV6hVZtQlKIgeMU+hsg5X9DLn6erqfM7NTIHt/WZT57Tqk
	/0DzyXMVR1ZhMRQPkW9zo843XA8yFTnl6O4CB5dXQ==
X-Received: by 2002:a05:6830:43ab:b0:7cf:d1ed:f9ff with SMTP id 46e09a7af769-7d1a539155fmr1076078a34.34.1769743520479;
        Thu, 29 Jan 2026 19:25:20 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c824251sm4757013a34.26.2026.01.29.19.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 19:25:19 -0800 (PST)
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
Subject: [PATCH] wifi: mt76: add missing lock protection in mt76_sta_state for sta_event callback
Date: Fri, 30 Jan 2026 03:25:17 +0000
Message-Id: <20260130032517.173590-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_192522_499566_D4E162F4 
X-CRM114-Status: GOOD (  11.21  )
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

Add mutex_lock()/mutex_unlock() around the sta_event callback invocation
to fix the missing lock protection and maintain consistency with the
existing locking pattern.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 75772979f438..468bc176bacb 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1640,6 +1640,7 @@ int mt76_sta_state(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt76_phy *phy = hw->priv;
 	struct mt76_dev *dev = phy->dev;
 	enum mt76_sta_event ev;
+	int ret;
 
 	phy = mt76_vif_phy(hw, vif);
 	if (!phy)
@@ -1668,7 +1669,11 @@ int mt76_sta_state(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	else
 		return 0;
 
-	return dev->drv->sta_event(dev, vif, sta, ev);
+	mutex_lock(&dev->mutex);
+	ret = dev->drv->sta_event(dev, vif, sta, ev);
+	mutex_unlock(&dev->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mt76_sta_state);
 
-- 
2.34.1


