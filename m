Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F1C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 01:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qgbYfTaLJzZ/mWrE8M0JIJXKh7owvbsDYdf4//0WP8A=; b=QBa/cwVuLaJiawXNtUsnG8Ugeg
	heWxlz4/8dIv/Ff9u3p31W5X5pb7oPR8DzgxJK7UerFF9LFMoKaQQlbIXLv+4Oj9mQBCwR0UiH8Ox
	xDSY7QvCQATKScv+GPFuwX3PTTac76ZxXkFY8kQgwm1dUzCvlS1FGWGIPQEkvzJ899Q3M5MIYUnt6
	AePrP1epMoxtl3902bOWwOYee08g+vQE9aFIdNjRiSpb0wG9eRvwzEnwuFn145GNTaw31Wg044ESR
	cYRXrBSecMqUuruOvL4HLJ3JnPbx/rWThK0TGhZWpaG1mAetFRi3g9YQIN+8A07VrcrqnQhEWaEF9
	HDHo1sdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww92n-000000074dR-2rDN;
	Tue, 18 Aug 2026 01:55:13 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww92j-000000074cc-4Bx2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 01:55:11 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6688a2dceb8so2747933d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 18:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787018107; x=1787622907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgbYfTaLJzZ/mWrE8M0JIJXKh7owvbsDYdf4//0WP8A=;
        b=A+k9MBF18lA0PCL/2gFP/3+Jqa389D5/Ibnr6S+ZMqYGo+cQaiMN0W2J+I3QGQXs18
         usf+8pmM+0m18TqfElhMtUOAjVPIjpio1ofMaoxTUPB84dIG4PYZAOpM+sLZnYfg3Uhg
         sgS6ZSFq2yp01Rd1Ik5BbN7VnKgkczANR9Z3A/qBW60ZlWuyxyBHAHqfvzJWBZ0aZt5E
         VL6qZj3LQZ+9ONkDRVG7fcviPnBFbiU2CW8TU36MpTX+mWFHUk1p/Uyz1dgPI1MKaqLe
         or95itVC9+aKCLiPMiEUbVqCWYcjIgtAudH/bM/UPIfgucOl1O9rpaGIwee5AmnjCGNM
         EgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787018107; x=1787622907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgbYfTaLJzZ/mWrE8M0JIJXKh7owvbsDYdf4//0WP8A=;
        b=JaAyXcE3qjdrKSBWIgDPj4i6qMYyLd6z9Ad6l5a446dApVTzjwXg8V5nCkvo4NxPVP
         ct5T9IHzJa4yh2tLRGdC9IMlHOpc/OEDnnFB/GnoQbyeWqI/K6O4dj86pTkZdpGv6+ma
         2zkdJY/CKulkIjUDGqBhUFnEq7u097lFZDyiRo883HWcnYQgRsnHV++CLeYcdPspjxbX
         yvJPsreblCl0T8s6WYYMHunc1o26tEE9OL6a1GF1QxAtZEpFpHy0V9X738dYx3rsFKI6
         7VE9JknWeXFykg47NFnbhdS5R0erLNxEZVhUGtl0Mo+Tnh5XI/WirPOq+vbllzesPgs/
         SJtQ==
X-Forwarded-Encrypted: i=1; AHgh+RppfrjhG50eM7Q8yu6aiNdmlDicySFNJAp9jQrxBnkX2gUWALP8dNJhKOBoNbbm8SoZifLewXWRtgmDeCeHNTfM@lists.infradead.org
X-Gm-Message-State: AOJu0YyPx91Fr5De9r8cO1S4j2nVRzA2ESI7jCjjPBRI/QZB8vc9CQ17
	x8iOZbdzNmpX/R+IPdpZoZMqC9o3s4292pvsBOQ6Abq+JErgq+liVyRN
X-Gm-Gg: AR+sD1165IF9LsKfPGa+Z7UXGE8gFRNThDEQTKUDUQ879wm8buBvqxNW//RHiqkBbYf
	32v6p86a3OjHdr+UatT8o8us/wpGxQ/mAkWdkKv5w+Pf9UhbFhCVs7MxqfsB7LI/a24NaoRD4Es
	5cwGjczYHVq+Av2fpzxqyOKErsQXmZI86QiXdTFad5/1ESTo8yCav3UUIBANeNUMrMA1geLv7ph
	Fi4BRblOFtZT8lnZdO7K9y9FcOUDZOLw0INeA5wePVObuTDtkpQo2l9wNgtBDlesblIIt3y+mvK
	Dx23qizzgtdEHHk+3Eb3/2Qmu7mzzXJWH9R36sdQiV2SMcQT3ddXaBn6gdG8l4vy4P7Oylf/c/5
	wVoUvKt8NreBP/G2LctuFM7owDvBm1m+ndv7zzZICkhEHHnDGud4IFP29clCPZVaBhyQmFVITKZ
	g0WFkO1+bZVJh1uKT/VwHVEeR2xS6d2iYnXs7TvYUSMJ8xdrJ/KcbI5d2Rm9jtmyts1xgbHRF0u
	mCjkn5CpeV96z1LeX2nVeAEr/B6sFp/NPmBsRpCxzcTklZ1VuQxKMj6grcY5A==
X-Received: by 2002:a05:690e:1189:b0:667:a95b:59f0 with SMTP id 956f58d0204a3-66c72c826ccmr9003965d50.34.1787018107417;
        Mon, 17 Aug 2026 18:55:07 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::6219])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb47a6f8dsm1598940d50.16.2026.08.17.18.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:55:07 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jeremy Yu <chengwei.yu@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: Remove useless condition
Date: Mon, 17 Aug 2026 20:54:40 -0500
Message-ID: <20260818015440.875703-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_185510_051716_E51E3877 
X-CRM114-Status: UNSURE (   9.88  )
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

The condition (master_pref > NAN_MAX_MASTER_PREFERENCE) will always be
false because the variable 'master_pref' is of type u8 and the macro
'NAN_MAX_MASTER_PREFERENCE' is equal to 255.

Fixes: a5487a6824068 ("wifi: mt76: mt7925: add NAN MCU helpers")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index d260e803d056..8d13a42b72a8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -255,9 +255,6 @@ mt7925_nan_mp_tlv(struct sk_buff *skb, u8 master_pref)
 
 	mp_tlv = (struct mt7925_nan_master_preference_tlv *)tlv;
 
-	if (master_pref > NAN_MAX_MASTER_PREFERENCE)
-		return 0;
-
 	mp_tlv->master_preference = master_pref;
 
 	return 0;
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore


