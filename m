Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECA0E81BD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YTzvCYXiRiQsNzIWAR8ywGvKHYp+IRPHv2CPPhaIo54=; b=xPgocSfsbfAuUkyzTQ7VIE0X5j
	0H4tWO+wSBSpgYXDQ2HA1Sz6768kUDFoG+9Vfqg7pZqHBSt0ZD2Py5x4+A+BwNlh6uH7s5ILvnaKQ
	JJVL2l5/QcooX329Cktq8dCLcULIaARIkbi1WhvTviryLwDwFXKEIE7SpINwrVkeXIq+YdVNTsvzj
	L54AIuqZRE0dEL7wcQxYzbER/TSZVVM9Ya755FIc3yQ0HHEzJZ+QgpXY1lHTTTlyAgQKyDn59OdAc
	EPQh1OZ060/wtiKoecZVhh6kZWznXf5FanaUG7SQNgwFaX1NQyJCJA3LO86RbxF/RXJTbIyePT5yv
	c3fsQ7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpT3D-0000000Favz-29DB;
	Mon, 09 Feb 2026 15:19:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpT38-0000000FatV-0epk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:19:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-437696cc5a5so70927f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 07:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770650379; x=1771255179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTzvCYXiRiQsNzIWAR8ywGvKHYp+IRPHv2CPPhaIo54=;
        b=g1KM9thy7/ZRG7Q+0c2BpSM8zBceORF2xA4nfcMkkuhxggMb1pUBwY27sN4k6zwjqX
         na+4ZOPiRGyoSgRu56s106Ga/qtaDiDnJFEXhWKUeMKm4WPyZodvO3xnMVnxK6hohWf6
         Cj+igLmMBHMRRs0uX2cjVB8fyhstRU3cKbgwcVCq4nCRmrMjVYaLzwnCRFud2tLvfEsY
         v9JCSCfRDrF1FRyCRw7jqztSqkR8r6ciGJXpTQARp3YjkdcfqBdDLQIqkimEb9URyJ/7
         m9aFZ213Cvip1szWd/GloR788a7Rwe7YC32NUJd0GK2LPavyaD2eC7rhGFKNWDT6KwfD
         NYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650379; x=1771255179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTzvCYXiRiQsNzIWAR8ywGvKHYp+IRPHv2CPPhaIo54=;
        b=ghvjBhJ/Gs/qUFyR0o/z/VAuArtRcp3TJP3YruZJvGokjq7RmfbgIFQ7sXWoSst3vU
         i8ytAw6dUTdt7p9ihJ8cPJJCRVOIlqp8EmCi5zALFSTM/YQotogip5xxLxlvsVrI/dVh
         55gfZWDESBRIe71Aq3ArpA4pMxwuAGSAUvq1HqaxG4pG+HkM0sHPOE8mgzmBkOvb89W9
         FrLisD1D2gSyMsFjMm/xE9kvJxpO+jkdKIxACfCRDCrHAFAoWAEJQYYvE9YMLi4Xa9pW
         U04c3zKOWGO3urLYNQyhtfJe989+vy9b0JLwahsIbVJ7zWZLbzLvi3n5tEcxTa0swWAc
         bvWw==
X-Forwarded-Encrypted: i=1; AJvYcCWp00ckelrXwmWC3zbS4spNNG8flL8QdSiWJjkFs8IiLjNOZ+zX6nYposUhnMP/uHUNkdUcA2jIq91PulceK02s@lists.infradead.org
X-Gm-Message-State: AOJu0YyjRCjmiUvA/JcvDWiHFcI3gEv3d/1Bnzlyy5RuTI/dw8G5lzd3
	Uj7PT7UOfTcVlCgsIhuKkQsPngWNLsW8RmjRVvT6dX2ICTVa7hDzD/gz
X-Gm-Gg: AZuq6aIaH95TkO2xUEBwk/oXP3dJgwuMDLlJSuy1rkQdnq/icqEXNFGafI3THI6aYpc
	LOwowRFQ7Oe2oTaNFd6KiU5WUo+A37KEM31XVZ9ai15Ydaalm/d6M25HDPrEiuNjB6Vk3U9YKpU
	Rr8RYvmRQTwqqOM4bEFu0BydlyZtpbF/XFkmhH6L26xond3u4Hc5uSTS7QNq4gym/F/z/R+4/Uf
	x/IDzLgTCi6yFYzbMu329iyeZuK1Tg98mzBoyqcsdO3Ql8XTZHOfrW8oMBm9tyQA05dBAftY/lV
	U95QYThIpfE2XZODry/sL3cCrw9eV7uRiJxxdh+WsJUfhMFWKspoJTB/HLTHliuejBAw1FCSWl7
	OXmmTEr+GVVBpf8kdIaVum+zHJT14Uc1nhNcHx37Rc5Fcw3GhliTnRclFR51CtHaOZBtTao+zt7
	dn2EszBOC0xqspqvJlw394Zbvj9cr84IFS7/E9s/Pwfv8VJSnL7KTh2weA4hY5/XrLTUEu8uojF
	gWwnTCP
X-Received: by 2002:a05:6000:184b:b0:437:72ce:8954 with SMTP id ffacd0b85a97d-43772ce8a4dmr1977190f8f.6.1770650378901;
        Mon, 09 Feb 2026 07:19:38 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-213.paris.inria.fr. [128.93.83.213])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4376686130csm15122697f8f.1.2026.02.09.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:19:38 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: mtk: wed: Fix dma_free_coherent() size mtk_wed_hwrro_free_buffer()
Date: Mon,  9 Feb 2026 16:18:21 +0100
Message-ID: <20260209151822.136934-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_071942_262084_CE73E7FC 
X-CRM114-Status: GOOD (  12.18  )
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

The DMA buffer alloc'd in mtk_wed_hwrro_buffer_alloc() with size
dev->wlan.rx_nbuf but is freed with size dev->hw_rro.size.

Change the dealloc size to match the one used in
mtk_wed_hwrro_buffer_alloc().

Fixes: 6757d345dd7d ("net: ethernet: mtk_wed: introduce hw_rro support for MT7988")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 1ed1f88dd7f8..455df564174d 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -879,7 +879,7 @@ mtk_wed_hwrro_free_buffer(struct mtk_wed_device *dev)
 		__free_page(page);
 	}
 
-	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
+	dma_free_coherent(dev->hw->dev, dev->wlan.rx_nbuf * sizeof(*desc),
 			  desc, dev->hw_rro.desc_phys);
 
 free_pagelist:
-- 
2.43.0


