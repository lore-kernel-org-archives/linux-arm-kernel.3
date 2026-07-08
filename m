Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2792C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7omd6J2J6sDKoi1bxgaYKfVCN67GZzKzySVfWVBIZY=; b=cpNqzIT0vb6xd0pTFJd3ngHHPh
	kFv/G+lE2xRuOiZt5dqM5xTOeSugbGsVcHTSy1+bLbwNx56Rtmkcl63n36r7cUWYkpIvrAPnBu9Y3
	DaQFS4C1aqRRNy+d2e8YS2ZxfmnbboW5HS33Z3FaKxmtV/w7pYDGKFp0pWE8XW/4/K+b7l7YJLOAb
	oDSVmzsgQKZ+zOP+hSRfrEdr/fSaB5/Mr2T5NRd2burBTZf06Z+DlMT8wdrCQwwvCvkfIbUk1/Rci
	sCCcZDrMNbHPbSLEaADGdfHbfDhGOQ11qW3jYSJL1A0vQd9LeHZ73cDjFddkcUjyRmzScMEQdFI/d
	mhZw75Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whN8V-0000000GYRG-1qV6;
	Wed, 08 Jul 2026 07:56:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whN8T-0000000GYQI-03rO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:56:02 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8478a25f268so277680b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783497360; x=1784102160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7omd6J2J6sDKoi1bxgaYKfVCN67GZzKzySVfWVBIZY=;
        b=gzyt7JD0heH2kcuHdjeaMeeL4nDQ5ziK56Dy8ntttwpTIQTp3DXV30v1PVYnwzCUXy
         ss/2kGkUbgZxzG0Q/HxmQVj0Sl7hZg2boFPCNFtCxqBF1enSCj0Vw7dNdEZ0om6vcQvI
         HS8m6kA6n1S72mvNoA4gY1M1rogNwr3hkSkHBilTL6kTw99aH9acg2MRJJ3GsCtpRVuM
         z1MYuRMWchCssdCBzNsc/Td41Z7JzG70p2ltZd5bauykcIAByFFBp/L/gQDwgqEKVd6K
         JBGUVMMfPdunYu34kSXW2j3bq0e7ATmA7ZaQoSp7CJBQnB89y2ceabmXlm8YuSOQ6m+I
         pbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497360; x=1784102160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7omd6J2J6sDKoi1bxgaYKfVCN67GZzKzySVfWVBIZY=;
        b=lBK/CWH0N670dgaAxHqrKevfawiniOw7WYTj3OQrW9DsXz+gp3RswEuz+hgh8/19Pd
         tTNuoyk7gsS2YPoOIUbymIb2fbo0Llaj3/LWg7miv8997Qlb8fADUGjvD1VjLLE41ed/
         oxzXU2lV6mR8vnIwP02PheftiTHlWVu00hK2x3ArPwQ09ACPB5nqWzy6M3eS1A9IhQ1A
         jMcyVefE7zuLNjtwWhN3CFbGEJGJp1ZGe2ckV9v95E/VqgWeuc8gldt5V3i63NqLfOuB
         qdLUxl14R2xymGiAnkUJJHufhvZ64DN/n9L8GC7PjmOXSMyzd16QiduFUx1KM4A2pJs/
         vRcQ==
X-Forwarded-Encrypted: i=1; AHgh+Romtyj+ezEM6qAHRlvUsaZbUe+YspRdp7NdhkYyZBRC4quUDmrWgUni390xtJmeK/1LzV8sTeVH/CbD6sUClV64@lists.infradead.org
X-Gm-Message-State: AOJu0Yyub9eXjo3nvimRWUdniTM5I8cXbVaKeu2kb1BGJM9B03ymRxOU
	F+2T7cmR9qjfengt8B76x/QQAjFi6YwQ/GkbizlsFMgqt8wnUVj/yv1U
X-Gm-Gg: AfdE7ckWWrGi3vJpN7aDaYsVI8ErNUgwaKnTl+P0DIT/R+v1Blw5sdYglXRqzz5lbAV
	OedR9gjT0l17EZaDrGkvSFdsQan+3QrT49elDbzGI8em/gStbaDQgTqN1KmxdGRU8zm1Mu+ZVpL
	PzEvIRJl+Ps7Q44wlAxfV5zYUQwlGxpahLn+Xfzrz3+363Lr96PDV90XTjrBTmsZJCh6WpLVq3i
	GbvJ+NB46i0C9XvDPX3BktchAxHN2W2eG22hpAvsGUjZ6tINQvcB21grKZ1do4SJRYmnFsqlsHY
	nGi63xBaaIcx7C21/vzjcijwQajRIY1wNV0N91e1T4iQGFhcRN06M+aBsjw2JaRY8RxK0jOsk3O
	TKS3Halh6A1LZrLDh3Xdk97MWrxx/yCPF2uApoilKQ5T+UVm+RVhA90rnah7GUtKWd+WFI4fs77
	Q1G0q8Cybrlg==
X-Received: by 2002:a05:6a00:928a:b0:842:4f20:53ff with SMTP id d2e1a72fcca58-84842f9f153mr1982201b3a.42.1783497360063;
        Wed, 08 Jul 2026 00:56:00 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d496besm6668958b3a.36.2026.07.08.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:55:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Leon Yen <leon.yen@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: guard link STA in decap offload
Date: Wed,  8 Jul 2026 15:55:39 +0800
Message-ID: <20260708075539.726200-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_005601_048752_EFBA020B 
X-CRM114-Status: GOOD (  11.84  )
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

mt7925_sta_set_decap_offload() iterates over the vif valid_links mask
when updating decap offload state for an MLO station. The station may not
have a link STA for every valid link of the vif, so mt792x_sta_to_link()
can return NULL for a link that belongs to the vif but not to the station.

The function currently dereferences mlink before checking whether the
link WCID is ready. If mlink is NULL, setting or clearing
MT_WCID_FLAG_HDR_TRANS dereferences a NULL pointer.

Skip links without a station link before touching mlink->wcid.

Fixes: b859ad65309a ("wifi: mt76: mt7925: add link handling in mt7925_sta_set_decap_offload")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a9059866b701..2b6cc8e253c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1713,6 +1713,9 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 		mconf = mt792x_vif_to_link(mvif, i);
 		mlink = mt792x_sta_to_link(msta, i);
 
+		if (!mlink)
+			continue;
+
 		if (enabled)
 			set_bit(MT_WCID_FLAG_HDR_TRANS, &mlink->wcid.flags);
 		else
-- 
2.43.0


