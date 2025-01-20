Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C25BC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VM6sOkfE8iqC95N0AKyRjkMPid32wJ87nN4QCxrUuqo=; b=2JXWdbI+z75sBKRtDevr+WRRG8
	t7cy7U3VDzepNpE6hKXtcGR5EcN1hWWTeXIP+CnQLiOXlcnV30omQHlNz7sk50R8xsLHJ3+nVkumi
	iLx5wjlVdlu1c3B7TvSv978QNg3FOoCGXiOcCxfxqcG+3D4T3uHqR8hBvqa95ipV9IIFD7n3rlatn
	2f/5IVa5YsnzlIDdpVL0aUW7DXhSdoweUKOAHodN0tZCFNVX6tMBRUp/r469r5Is4BN2D7CDaL577
	JnSlx0GEaL4nG4fHngQ+Ip9aUZE+63PXE6N91ctZlGxgOaCq2lXnELCyzFMfY7aArl8HTmvlhobo7
	zMmx6VwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoYn-00000005GMa-08DO;
	Mon, 20 Jan 2025 09:59:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoN6-00000005EMp-05Zw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:47:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3863c36a731so3672120f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 01:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737366422; x=1737971222; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VM6sOkfE8iqC95N0AKyRjkMPid32wJ87nN4QCxrUuqo=;
        b=pA2iqZ52MWqZ4+HR35lBaop4SlqV3md4Wamq9SobcYhXfFVP7o7xqoXQ3Dntf15lol
         LUsZ579QThdwuMJYsuIvBRkZwrDQqd6MjLvLwEeKwGdgaqAdR3oes+4yb5fpHSswk5c1
         gTZ3Z2itKzv1gpZysL4tHAkfcMIf/TM5mhSSOnC9Aln1iotbAUw+V4+OaZWvGUY/kyy9
         oPF2Kv11hV7Pe+iakxjnvySt5eBnkTW/YkPeWAadWcKH33S6WIqkITScHW+8cv2eQ5Wk
         5GHhpK1ugXtCHjSKz8HGaRsoWRIbdocelow7SCTmsNFxs2g/9q2/1MOCeS6W5zqXdHIW
         Gn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737366422; x=1737971222;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VM6sOkfE8iqC95N0AKyRjkMPid32wJ87nN4QCxrUuqo=;
        b=U5/qdGGNYPvSvGylYK9REZIvoWs83hWp8AayWSsKPV5fNbPLvCmNIw0NOuICVoQ6/o
         zuw0yqfgrmzBvYjHLWwqVV9KuFdU9rvJHQzD4vivX9QK84vMf7G6ZZ7NVZMttxNf9z6D
         KnECrFOET73wn++yGRGzdWXivBDqC09Cf4ILhcUq8MQGuQXPR12UWaX37mYxXiobOo5Q
         /Nb81+8qj7+Cc83zyRbg8Gp4jpfPAtM0HVyQvpLWdccVowuEKlOX9CCVTAXOQDHWTKpk
         wHzMWjsxjpXF02gUCqKUTvgAMzTTPD4GGF4KEvq+99YVZfsWx2Xa6rpinEqyvUXnCxhh
         prwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx4LrJp6RctGZIRz+X65DAMLRsAFwjwkuQamklsNQEDxfBdPkvbKgexKbG2TL86esKPbUHVRi9Te0AKosxWD73@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3UhLvwrErTb1azZAD3Z+zu+PzXXOqjnAt10ed+lqCqquPsNSb
	9HzrU3TEQjt2KHCjFHUgnSE7H0YvfBXMWrWIexN9hZHOzrNy+IgGHx64kwJMiPo=
X-Gm-Gg: ASbGncvvgPjjk+P9Ekbj8IawyuswXNQco8tw8Dvfyjz8NI5nSp0QozxNA/++vAdnTYC
	svW8ATWEOu85DPxm/4+K0vn69UQyZNop5NTp/BSaUR50TBr/O6eT9oQpLSsI+Citx6YEhK73+ua
	6svKTLf3GERrm8Z3EfLJZ+2I246r7yUFGu8Ggj1EhBPEoWuW3ePuDhKZUGE8SU/lgZqNIg3FqQR
	3l0hWKaUbWQBG8pwe63HmNJl4F0+pW1hq2SZzUUn9CyJsrZk+InuIXnPu+uES/Ci4H5387MdIQ=
X-Google-Smtp-Source: AGHT+IGPG329V2074yOYSMY1ziObuL2UZ+m5lYehxxQsiJfOBHTxj4D3R6O9lmeqMjiIW6U9yiBaRw==
X-Received: by 2002:adf:9bca:0:b0:386:3356:f3ac with SMTP id ffacd0b85a97d-38bf57937a7mr7522401f8f.26.1737366422340;
        Mon, 20 Jan 2025 01:47:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32758dbsm10018595f8f.64.2025.01.20.01.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:47:01 -0800 (PST)
Date: Mon, 20 Jan 2025 12:46:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: fix error checking in
 mt7925_mcu_uni_rx/tx_ba()
Message-ID: <063aafdf-3234-42ac-a4ea-3ff98e2835b6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_014704_071896_EE51E51C 
X-CRM114-Status: GOOD (  15.55  )
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

The "ret" variable in mt7925_mcu_uni_[rx/tx]_ba() needs to be signed for
the if (ret < 0) condition to be true.

Also the mt7925_mcu_sta_ba() function returns positive values on success.
The code currently returns whatever non-negative value was returned on
the last iteration.  It would be better to return zero on success.  This
function is called from mt7925_ampdu_action() which does not check the
return value so the return value doesn't affect runtime.  However, it
still makes sense to return zero even though nothing is affected in the
current code.

Fixes: eb2a9a12c609 ("wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 15815ad84713..b3a00964e802 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -617,7 +617,8 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 	struct mt792x_bss_conf *mconf;
 	unsigned long usable_links = ieee80211_vif_usable_links(vif);
 	struct mt76_wcid *wcid;
-	u8 link_id, ret;
+	u8 link_id;
+	int ret;
 
 	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		mconf = mt792x_vif_to_link(mvif, link_id);
@@ -630,10 +631,10 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
 					enable, true);
 		if (ret < 0)
-			break;
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
@@ -647,7 +648,8 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 	struct mt792x_bss_conf *mconf;
 	unsigned long usable_links = ieee80211_vif_usable_links(vif);
 	struct mt76_wcid *wcid;
-	u8 link_id, ret;
+	u8 link_id;
+	int ret;
 
 	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		mconf = mt792x_vif_to_link(mvif, link_id);
@@ -657,10 +659,10 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
 					enable, false);
 		if (ret < 0)
-			break;
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
-- 
2.45.2


