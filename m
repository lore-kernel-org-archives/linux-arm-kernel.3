Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76179C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=; b=R8mKjMYf4LXYpgS0e3I4QFXCgk
	9ubsre+VZPP2mcCL6AhdFY6C9gcvcmQvMuFFMzA54FPs8BwNuYi6CyIXkkp7WDTfRa87nAGlwul4i
	nn7Dqm9L0xH0JOm6L8n4cCpHik8L0rgLqgDkmx24GIDVypYlxLNB1xSuZFGAysf7NzGaHnri7Rgrb
	exYNSoqVUJRSwcjc+ivAn4RYRQWuJ1N8E8/hrn/r5Na8OSNj9NjrHDMiLjf/FAF92ZrZspt9GDmeU
	rQBxpk/sXhP12omgH63IRIrcS5as5iZEW9GIJogRjty6AVBMURHE3zkH/NoQmAeJaHjTJ0O3muuJ1
	s8lTJO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLL-0000000BZf5-3bsW;
	Thu, 17 Sep 2026 14:44:07 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLJ-0000000BZeK-0DOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:44:06 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d249c4so795577b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656244; x=1790261044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=;
        b=QcPO+Y67x/+Lo9mf4/Ef/50iuXEjpycG4RaArYZipcIWQ/9mQrVY/+tBhtMwNp6bb5
         UgQEgldCZY743InklLELo4fCxQjhwpSYvEq+nRbmFJr9Lygumcdu4UqdqG696Wv8Zy1a
         Gyf/OumJR7GjxX0aR1LyO+CbKWUzfalWQmvGyw/AXBWAxpOQFVaWaHvU4htuJPH1iozX
         7Lydmxvqj34h1p2qhk3sNyaJKhtKwd0RWwYHJBaMll8Di6+CXtiybDBKpii5nhZu9tS1
         gYFlQeSyKWhpplFXm+pO0bLBRW+cvolBBk5hFIBJKsLJmIpliFj9n1lDWdixQlP+SjBn
         jWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656244; x=1790261044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=;
        b=VTR5q9+CVATyjn9u0SP/4+2p3esdEqKodtnO19ylhASaRVjS9NqNdIbhVYIRERtQcF
         9gCdphbukWdcx/p2ICBzd1BafGK2PC8t+wQv10FLMvJoxtXuDtEBmQULr+ImqvtpkNrB
         JhXPA3VFggYOutcy7Mo57UssMMeubmLEcdKufIL0Yl1zsWJMrAHN9Ph/3m4isEI7G9d6
         v/oh7SX4bz6UpiOOS/G3WsC5CQ5vssub3rLhASvUcMQwQupsr392H0ZeAMsBoZnKWtUI
         OWvx5T9YQBqkfeGeSiupVwu9X/q0uHUgg6XM5/LWsBGTf+ab1JJ/Fj7kionB9IdTi7j6
         +hqA==
X-Forwarded-Encrypted: i=1; AKwUvBx7sreqI0Kr9V723/Y3jwOkrz3o4sJrGa0mGmKPnZ+rY0lqSYymXxGc2yo3py2CSCyEEJR1FLUnvlqiXI5CvZSe@lists.infradead.org
X-Gm-Message-State: AFuF++mApPWo3EcNZHHUJdptM1vGvjgwR2XRfE6ZFLiLOy9PzdDlJ/X/
	oGpbS89EuuteYGrsM6hOFdo9ttjvURZN9MB4HWM/MEocqT099Oo4BHFVyqjLK/3kwHA=
X-Gm-Gg: AYBFou1me9NHrAmbNZwGajTaQQFV7Quc5yQ5t5d8WSLPmMvh+FIn0ulAMGE5Z0OMXba
	u8IvKxW2IEom3lK+rsk0PE2nWduvSQ+ZxnH1LrOaCga+lUQgeEPuC1iCYQtqk8SE9o2qwmK+6sn
	r4W82dAbigew2/Ir0pxub/AH0RUX2fZepkCt2VAPW8y2F8ORJVL1KorJQuducl6y7hWWL58rkyy
	8BgqD5fL4n1dA648IQ4rP/CxC9evHzQDZ1Xp4BHSuVhd+9zPgmzbekJOguXcKTMEc7ftA4FHH0D
	XX65EhYG0/y6+1Qlcnvtuzxp4b0whOK78s2/W6BZggb97HdtH5JCEMFnXP0a7Sd+VmZeyVmVFQO
	fo4DNcWF5vdC7EI2ZOITJti35gOHdXOGhPtJNk9/OnAcOiOBK4cNvNRMOPbjjnUwg0S0sNgAQ/i
	9NPk6jtvH6IgHe71jzYQgOUi5WbO5oJpRVOZqPzf9DwQQpb6nse6G9gJrM6vvg2N3WH4RFEMTol
	4v1zN6lv/ZxvhkCYoGB8ILw8wr0iH5NhsEWAYPZuQ==
X-Received: by 2002:a05:6a00:1887:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-87236fd6341mr14621831b3a.7.1789656243473;
        Thu, 17 Sep 2026 07:44:03 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:03 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 1/3] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
Date: Thu, 17 Sep 2026 22:43:33 +0800
Message-ID: <20260917144335.19466-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074405_092708_8B90CF65 
X-CRM114-Status: GOOD (  13.03  )
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

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- no change
- Link to v3: https://lore.kernel.org/all/20260724172040.1653-1-hujy652@gmail.com/
Changes in v3:
- new patch addressing WED v3 ring reset issue raised by Sashiko
- Link to the review: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {
-- 
2.47.3


