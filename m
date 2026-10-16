Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56DBCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N4qyFuyYUzsn7yKUmEA1eVXAS1dMHnjfF1B2UXe6bw=; b=B/po3CFzwV40FrFeiOFFck0LwQ
	Ie7t7VHsmCdgW0Sa29rqjRpi1QowHbA7gl027JC9/dkXVGUxRjD/2eOCgbZSn6ryCWk28L7bXk3O4
	YGTlrbuKJ84/zKIZWJma/vlLaITUc5T8rZeLMDn6jjOGhR3EFcwTsgB+yYwqLFmWTfuWWFvza26Wm
	XPkjneQuyCzzyXshyQBNAm4W63WRPPsCTNprq8OSPifK20HGun7eRPCf7t9Z8NR1c3c38bu+2gKAP
	XrNl/e2bdlRqFNucWzwJ0i2+TXZP8xpdYY0uk2sKVsJLaMu+3pvO2DU+ZXZy0NPJjYY+2KH3yvT6O
	ThCalDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe09-00000002Rem-3Y9G;
	Fri, 16 Oct 2026 09:13:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe04-00000002RXy-1Qdt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso2830678a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141995; x=1792746795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5N4qyFuyYUzsn7yKUmEA1eVXAS1dMHnjfF1B2UXe6bw=;
        b=qXy3GLqiHPbZ6nSzWSUIkC4s5ylJrH4cONgSxQlr1voAoOLoQXMyf0yYOj2fZLpuu6
         yknw2l+ySIm6mHJRK60M2xDgqIbS1Dp0+kMtGaf8N4BeA/8V3S+fs5CM1nJ0S/b7OVja
         bRdtZHfMq86Lk7JYSg7JAGAf45xL20TGv2pEDUodvYNznsrH4HvkIsZtmW6baghyGPhx
         Gv6VpFI3YtSm1IrRnYtJFKpX7nnGjOLAZvdbgMAE6u2T/UPLZUCS+Wf/BkuzKiHrZ2G6
         jP6VLFRNaVe2zQpgmSCDnSOTe+MuV61cle3E/uW5IuuwSWezf9tH9hFVkQxG2zgnq6X5
         v7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141995; x=1792746795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5N4qyFuyYUzsn7yKUmEA1eVXAS1dMHnjfF1B2UXe6bw=;
        b=PB23OpGEnLAQwj1Q0zyvnN0c9tVrFYviu9Jj3Rw4JDmMvJyUa3cE0Ak3w9abejAoK9
         uREjrGrbtIMH+BcqqDjjHgsvU2J0XixAhTxkK587Dr189nlSnJ6yiiQm/hYnUXe/QEW9
         bUY5+UP7xK6lGwyp/fT6GSGoVarIoVNQfRDlstf05eke7mi2UsxPL5UZELVGFC2df9xL
         +wDuS+W1hT80y+GqZRGHigkm9XzcnmDIqrrtRW0s2i8xpExNdoxcr/D1u8lpO4AV54e0
         ozaJlMMFTbSeDXAelFIlKmCLp4or8NrAdAUOKLTF3xygILmJ7kTR7j/q1mbEvlykc9Gz
         RnaA==
X-Forwarded-Encrypted: i=1; AKwUvBwaEUBA7Fd5ptRLHRFOet6IrGshzbE7vjakQtYZAi0bFaa7o7KfLlUuIL43JmjtRK+D3MnIsoCVIIdVWwXA8QD3@lists.infradead.org
X-Gm-Message-State: AFq9FYLZy+7UnXOvh4qWcs3ML0QjKzPmxok2LGcZtDQdydQxwUIwlHo6
	NgOtK3rxr8WEZXvhq69zhD8GzYC5BxOBXbC7Xbe+dnKmga1ihDRv77wc
X-Gm-Gg: AYBFou2tEMrR4E0PlvwebwoUQmkir03o5SaW96zGOmQHEMrvIdeQx3r7zMDvklwD0Sb
	Zv31B2cge7E3FWerjKqDo7Ucwa+c4gFAX57rntiMBnjryBbL2LMOPmmbiAwpxoxiL+ibZwhdqn6
	eN9dGDMsx1vPU2VpZKxH7KFKGcRd3Xe7ih7M4zVp1VR/C/tVJeNvwLeTRVys1LsgEfR/A7A2uUt
	sDbNVojtmAd4GiD61fA3+BZiRKKs0SYQO9dXawjGsEBk+ph/YyiIK1n90Aom0jz1j01cgJWTzFC
	bVGKLBKUoA0bzs9XjRspGeWAgRKSBDusIAZ2+6Y7Krhdg27WE8gTts0Ddb543dfVYq+J4/mir9T
	o2qcnml1g7YZy8b8bZgVqz1HfdN2axg5gd4sSbCRs9gjyNocrBXrkgndI5uXMN8ksr1cGhdaazR
	AlnkMHwZUMYeNesrU06qNHSKdkaL+op1KWlGyhvYRwULFykPKnnovJMPexxtDlEuzj03sOk5ICs
	4X5MBAMh5MyoJdm9RvYFZHFYojuLc8jfOtT3w26Bb9sbSmCRw==
X-Received: by 2002:a17:90b:28c8:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3aca7ef2e00mr3511520a91.2.1792141995392;
        Fri, 16 Oct 2026 02:13:15 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:13 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:37 +0800
Subject: [PATCH net v5 5/5] net: ethernet: mtk_wed: bail out when failed to
 set up rings in wed_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-5-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141974; l=1511;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=ePo8kYEQepEUUlHGep4r47dMcAUe+w0OHJZFIANEXVY=;
 b=n9KaOOF5fBmx0U1LSDXbITyZem2x/eJbiwispep6tmzvNhm1EtTdd5kx/xEfHrdoEZpp/bctn
 SxpS9hnOJO6A+sKBm+tdCHRuzDp4HbwtG6Evlqx2+TjBkoY99pVw88r
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021316_390636_B36BFD68 
X-CRM114-Status: GOOD (  12.50  )
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

Add error message and return when fail to set up tx/rx wdma rings.

This is suggested by Sashiko.

Link: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3a7c2bb33691..86845893ae20 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2353,14 +2353,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
 		if (!dev->rx_wdma[i].desc)
-			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
+			if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)) {
+				dev_err(dev->hw->dev, "wdma rx ring %d setup failed\n", i);
+				return;
+			}
 
 	/*
 	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
 	 * but tx_wdma[0] is also needed for WED to function.
 	 */
 	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
-		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
+		if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc)) {
+			dev_err(dev->hw->dev, "wdma tx ring 0 setup failed\n");
+			return;
+		}
 
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {

-- 
2.47.3


