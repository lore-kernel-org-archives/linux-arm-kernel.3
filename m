Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qyAJVegbfyrJxQWNLL4+WJEBhbqapbMYo1uIZ2+vwQ0=; b=bCvgBPW7MA4fJ1ZMBEt5GWlu7U
	qLJfI84wHUAfym9/RGcvjVsNvnCr4B0nPP9dGbbFcJcCvPwW+CKK092tTdKfUqkwhsXn5Pr4B3hhd
	7xxyeHYKgjlPxMkt4dGNwimwxMd7arxre7HqOfBkF0Nz7/Y60+6CrSsJSkntGbqz58e3muTfVqPO4
	62fMPthGWLojgUJMEqQqLzugNHbZvdORuOglfI2M2dtVg1c2hznqSrK05HQz8oMLOsMKj2cd1Eg5P
	G4qdiXIbimUKoMF+Uc4Dhx3pUiVsILODtNuTD8damEP8yCTg2+iMCL9xnGoS1MBrgaua8s71Sm3Hz
	Gz6+XXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefb4-00000000DD0-2t0J;
	Tue, 30 Jun 2026 21:02:22 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefb1-00000000DC2-0lKg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 21:02:20 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so9665149eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853338; x=1783458138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyAJVegbfyrJxQWNLL4+WJEBhbqapbMYo1uIZ2+vwQ0=;
        b=Xhyq0h6nFKNvTDQrG1/x0v9/+t7+lH1d0jpRAsCvwQLKAWTHR7DdEAWnewUaIAjZs3
         lBsqtqiTdK3vKFbv6rFRGNsZfvstETVr0fBhb6q1aRV6sNYagLnsY3/sDNWXM94l14bq
         BxyXF6yzUZHQci53nNzRR7uYwI8Cw6dWAd+7BvlOpLQx+pgCLi/Uit+9xghlJTx2vdvI
         gCU8yJ1nLbgoAR03rswuXvyL1nET1ZjTeGalEMLJ+zkgZjqYOQotOSK1WfY1h2WlEhzv
         8qADCW/jjoHiznbpw26G4WbYUIhl2DYhY9dQ9OwURvIgGaOBfrJ384WZysZ/INimiAnQ
         XayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853338; x=1783458138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyAJVegbfyrJxQWNLL4+WJEBhbqapbMYo1uIZ2+vwQ0=;
        b=UI2DG+7vk+x572Mp4q56ToJ0WtreMtVHLqh51/CnH/kEBRajLtkoccy5HlOIFzfXQc
         rNM5QHnmEdvmdeU94udg/DpxZydFGugXseW92JJj61aiZN1eRBx0vypsogFhNezYNFhJ
         MxXebFyyQfg/pqr4Mq+Q31ExlABcA/4W8xl0klr5LlmZm0el4dtdr6ya6/26wFYA7sy9
         QUIThZknftshWDBo6AlTx+H675oes1ZT22odCb1JuSTsON3oMaGA8dEb1HPSWV5BwaRz
         5nvS+f/skEUWbyL5zRxZjZTXLALchrXi46ouJqYBziSfdr6+ju1iAJQ1k6P595fJAsxN
         2GaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjvSCwVijmVEGI+CelBt40Lx5QFlA3hFZSsTf5W90csPk3ldH0CSRh1Izrhh0EKrYB02V+MyegBP//RZ7M+Xt3@lists.infradead.org
X-Gm-Message-State: AOJu0YwaD9axEXQE+zVSbBBQ5Hp9etgXSz6xd4XYWm9Vo9vAn2SOjHN5
	BWaiOTrTuTBpzcgFfU33LSp64mNswcyA6YebpP5YfEi6JiXalH4dtZcj
X-Gm-Gg: AfdE7ckJAWk1EUzx0yfqyJN6BG0D3AD+J2lsyxwPLJX24uXyt0GBZqcdqZOuh/du0e+
	cXO4PwUq168wsqC8OF6RB1Jdt1je8iCk2e0dYOHQpE/ytlG4UysBpwFipm5NLPCaxChSPaT3jGW
	eQLiY0JDct/qzhOEu9PoNgKXqYjiOUleHApt+Az2aGBk0z81GPmzo7VQ0GMQHQxG9DbkLiTMpqU
	kdxEa1J2BGdThzzIQKz0EfCqsQf1TYX2DkRjFzGgfvkELdjDE08FpbPvtUXbB/RmxJk0VA0kysU
	jSMIa+/wtaKAuiHzuiUTlLe7jY/oWkKbVdhz/aFx6NzGYQ107ZPp0z/3oBnkAiYkQrGEsv6gWkY
	nOGCx2HGJ1VMfKYyMwQViBqmvvhbuW2pfGff9UaZWGGgvVHOqnx4Ew3qhZA5D1DYGrED0Dl2TKq
	kPqoZcZmF4L2QtyKz9J9XcsGig1B0DiV84p/+o7Fzen4YGsxls3NkofjIPjsoIEDVkbQNE0HGGJ
	fKCasA+qg==
X-Received: by 2002:a05:7300:6144:b0:306:f474:7389 with SMTP id 5a478bee46e88-30ee134fe86mr3861886eec.25.1782853337951;
        Tue, 30 Jun 2026 14:02:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5c4c3sm11592642eec.2.2026.06.30.14.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:02:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF pcie cards
Date: Tue, 30 Jun 2026 14:02:15 -0700
Message-ID: <20260630210215.400379-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_140219_229749_41470F76 
X-CRM114-Status: GOOD (  12.87  )
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

If seems the check for err is wrong as the proper macaddr gets written
to from the EEPROM itself. Meaning checking err from of_get_mac_address is
wrong as the proper macaddr has been written by this point.

Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index b99d7452800f..afdb73661866 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
 	if (err == -EPROBE_DEFER)
 		return err;
 
-	if (err) {
+	if (!is_valid_ether_addr(phy->macaddr)) {
 		eth_random_addr(phy->macaddr);
 		dev_info(dev->dev,
 			 "Invalid MAC address, using random address %pM\n",
-- 
2.55.0


