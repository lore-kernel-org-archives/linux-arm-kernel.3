Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7FAC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ZR2UVpqmeFDPx4PfDo4Uk4g9Hsu2oDRhSNi1KzWe7k=; b=nQlhoNXZm+RStdsDJ8yiIioj0L
	/fTF3HOLInEtZwS3W0A8wQIcPYOJsQolFNrX6xpmkvk7jbFfF18oJQg/hRUIyARxwZcVAR1PkveL+
	s/7yimtLQmsu1bwjTUlvmLMSUs9UKzIF+uwrDcvRUe9tX1prH3+AMF7GObMwXG+abzLbgi8NW+Jue
	IoqBhh9dC/I+yy3XVPcrUqLrm7rcyMjHR51vB+8ht/wI+9x2EVSDHQbqK3O7dq7wr8AKJ61gRSsLx
	QXCcQj+Jb7k5mWky+vSAzuXiPu9ac0cGKSN50N9a5y0fIuPE7TmjliOWeymGNJmOfphgbVpYJiwLL
	Lqlb4BNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ENN-00000005DGr-0v1X;
	Tue, 08 Apr 2025 19:12:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2D4W-00000005121-0aP5;
	Tue, 08 Apr 2025 17:49:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so30591535e9.1;
        Tue, 08 Apr 2025 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744134554; x=1744739354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZR2UVpqmeFDPx4PfDo4Uk4g9Hsu2oDRhSNi1KzWe7k=;
        b=O0/YERsuNXF3w+hxdST/u57k97xBpQllQRdLNRkUBdsSRk4aEn+15skJy7Qm0D2abp
         A+Dx64A8asF//LoMwvIYMkxyTz/lrl9SHfNKGt/sC1sBeCfxQsN8gMduK7PhLMLCBBYJ
         xEAue2X36mC/uRrgx6TeCIOj+Zcf9onSjM9MZNC8S0nJyqePqkqOuVbE9BfN5kwHLBrM
         wWyho/+8USlEN2sDgBqUvHYSxdfpKo8T20t2vDnjcdkB3hxIKaLlonjNhZudNux5skJ+
         6mibIOt890W0PwtkJORgG4QhdSCwMQsB3ZmkpJEky1aZjxi+I2Va94TfB2EYM5MocHya
         H5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744134554; x=1744739354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZR2UVpqmeFDPx4PfDo4Uk4g9Hsu2oDRhSNi1KzWe7k=;
        b=wYgPrXw4rOFbs5yrzJX5gwHBdQ5odJXwiG8UzeCOYsB1QxN6y0XqQmzMlX3fyHCQuv
         EmbJa8T4yr9s+oWwDjYPOW0xbUmnw8ihIwih4gfQbA7aFsjHYNshGASZMPzBU2AjqZ5q
         rq0G8g0CVhKeM+S6X9R/rb/oOhQD8I4BHVLCFRr3MgC30bAO6+tbwCeWfirn+9nPS39n
         wtpeBH5n7Yntetxm9p4olKNFbo9Qbv7oVtYBmHQNwPmogGI1WXWr6MTLCGgYyJkXUbVc
         JEqvXWHMKJoJBLuWfmK7WLFN0VJUESnby9mSva1YRS91YqI33i3/OHVNGuiHUi6BiL6X
         NnmA==
X-Forwarded-Encrypted: i=1; AJvYcCU6F1iNygVtWFJnhZKRbpUppD107ij9+wNRyXOEx7fyxPofVgWoGUFNSI0rpNvOHOcbR+LP1R/Sog7XEVEq2KQ=@lists.infradead.org, AJvYcCXQunD9QuPV1iF5QbgHs5mpWxKBOyV9ueDOag5gK9EHDMurlCxX/AZYLfL9ae/RpTvgqvXDoztTn6lpQupnXgwm@lists.infradead.org
X-Gm-Message-State: AOJu0YwrPwaas8LvbTR67qKuHMIIm6/ZbobN6ZTu9aKbp7qbbN5mpAJL
	MX5IRmHiir0gVRWo2NE7qFSwS/9R6loa11Z6OEgDbOIaIPevj49L5NouYg==
X-Gm-Gg: ASbGncs83Tmage9xJHko5gIwn18zuPIC5dVF0BW8wrlFBRczAR2tSlCMAxvk9SAYpYA
	Sk2BjLW68ufHNz+kLrkTCDrFaNbdMhJbFdu9VZq6i8NzcVTat/4nHq5WmdyHdsZ7epw9iCTLKu0
	15damAC1kIIjSviU7csNZ8Lp7aCmkcVBMd6ztwCwuvCov89pGk8FW1EJU8dRr8Xz7Yd6iIRHo83
	sQalnAH9wpScCqybVJcs+Gy7cxntAyoN834+H9Rpylsmy38Rxx0jPz4ZPVC5FfG3T6dG276JiBx
	zBwCdYubSTT2M5qdPz1Y9DCmxnf9YCq1jHDsqAoAbXJWsA==
X-Google-Smtp-Source: AGHT+IEZ3U5D/EEyRNJJA0h121CkODT3waTKE0XhCx7gpizhS9Xryu5e5ySB2/sFUv+P+fwP9Vnchg==
X-Received: by 2002:a05:600c:1e20:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f1ed6727bmr189225e9.30.1744134553902;
        Tue, 08 Apr 2025 10:49:13 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:5b45:5642:beb0:688f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm173535645e9.22.2025.04.08.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:49:13 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 RESEND] wifi: mt76: mt7996: prevent uninit return in mt7996_mac_sta_add_links
Date: Tue,  8 Apr 2025 18:48:58 +0100
Message-Id: <20250408174858.15847-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_104916_193438_B988192D 
X-CRM114-Status: GOOD (  10.04  )
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

If link_conf_dereference_protected() or mt7996_vif_link()
or link_sta_dereference_protected() fail the code jumps to
the error_unlink label and returns ret which is uninitialised.

Fix this by setting err before jumping to error_unlink.
 
Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Added missing semi-colon as pointed out by Jonas Gorski

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..70823bbb165c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			continue;
 
 		link_conf = link_conf_dereference_protected(vif, link_id);
-		if (!link_conf)
+		if (!link_conf) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		link = mt7996_vif_link(dev, vif, link_id);
-		if (!link)
+		if (!link) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		link_sta = link_sta_dereference_protected(sta, link_id);
-		if (!link_sta)
+		if (!link_sta) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
 					       link_id);
-- 
2.39.5


