Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FFEFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zp95h01o2/Wl98SnFb+AukwrIEiz+o1jaPsbSAEFOD4=; b=sTs21SEZgxgmXH6UsYMFE+mdOb
	s9nRgfWzK8ej4OXwz52Op/Y1FuZydlQgQNDzXlxC3IvWzV3+t76QuEmQS86tsLKLr0DYema7ZAbfA
	ZuYHEXn5q9hPaSY7ihLCKTtStmyyJRoJNvqp0oISlGeRrcN7oBtTKZAEP9ywxwqfSx6BOksfxlRc5
	mWuVCtqo5ZTZ1qJC+kWQm7qDGiSNXKrEGmUOXw3T0GJX7tYq9Kt68WFmYXDjcAiQ3noFN6WgQ4ROV
	AJbfgb+JTx1thAwK1hkOZL5RyebxZdSHWG4a60VjQwbQ0rPN8152w3A0nTHekJVT3q40qkAbY6suh
	0Dp0qTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH0c9-0000000FcVM-3Jai;
	Sun, 26 Apr 2026 14:37:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH0c6-0000000FcUU-3Cy7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 14:37:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so4195310b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214257; x=1777819057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp95h01o2/Wl98SnFb+AukwrIEiz+o1jaPsbSAEFOD4=;
        b=tCG/3ug3UJUzCR1enQNV/iUhdJCWzSGsT08ioFiB7oC+SQUH6k7r0rTkvISAIGH6Ka
         Xaahbdu/yD+P0HFSmdkwl2yXdZRIct54YZP5kgSrVcj0f7YfixM9TSCzzZ1RkEZEyLDX
         O3ETdMHXRyizzlkerg0vBKBhgh1Ij3+e9w48iQ8eVlEf4yWmkVPu93reaFgsubCtySIF
         1QWzoDU48mzbHJrfxz2P1g2Oh4L+Od4vq8i/A1890I/eKAODFnmv/+mK0AdHvlrAXhUQ
         xvDBugE2KePPF2mAVmow7JhSW3/J13gWw7wXkuZPEoNN2cSwLf49kI1z8XXn9sPW/SeR
         4rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214257; x=1777819057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp95h01o2/Wl98SnFb+AukwrIEiz+o1jaPsbSAEFOD4=;
        b=mF2Mb55D2p8ivXMDm5n0OzZ/FvvQDC07ZVtRyQfB+hd0txptNDcVxk1agUTQUcX2Rq
         +ocr+qNZO3WJrfmpdl9h6XaiEOhK83l0+jMUv6KIIXR20aluRl23F2O6U0K34JJC1woT
         uDYa9ZC28ZF2yscpBTFzKh64wIC2RAU0j4EFhqpsSpl6+/oYanCbtHWiujwNkhg31qUW
         IslJapMth4YL69wMFHL6l+m0DtA713iWyYD48Dp9TELpGGtDc3swaiFG8b118YtZDD5B
         WKoVOk80IREohIRD2hZJz+FZVhRIu25lMCV80KhIzPJkXEh8RV4HNSAcy6K8llhzueXX
         41Og==
X-Forwarded-Encrypted: i=1; AFNElJ+1/SEo5Ulo7dVyUEGsVJzxF6fpwbSkLD0/+Wdi8t19VG3Vm71mUh6s2TCLxuwyIp68PeS944DoHU5Cj8YYXLlE@lists.infradead.org
X-Gm-Message-State: AOJu0YzQe1NEPUxgIS18nOq5O2sThK6y/gIFZC3VRHvyo7pTpLWWW9Fl
	RP5Vu57BtB63rUeZulCbPDy0jp2gIoXME0hhi2NEMOwXuBSfsiK8htE=
X-Gm-Gg: AeBDiesn0Zgaj0uFbyuhqETpjTlLU0a04+Ty7t2zkaljtCY4Y1oMhc78Fs3ZxIw22bO
	7+FE/X1+GhnzKbfrTlS+CjB15dfn/mot3UftKOiJYoEikVQss620AFJB8aBNS3iQVOGLxdaplO+
	pdMD4t5CQTjm/8Awa/sXehDywhvpJkvt9QwSiCaeIm1V1uuUDD+y1bc7LX5xSqjghmXBGWbxpi3
	v+ia+NPvyraLOAB6CPfXhfxCWayDY+HBAuPsE5a8K1rablacIJfBmztMte2Jp0j8mrU+DKNaZ+M
	z7lhp2nRQGf2xyGjDOkF7j5SmfN3AIL5z/ERz1qk60JhsNvCN/lLUDX+wxVCQbT4PRtl8DSLQgi
	0wEy4rz9ZLVVxMeWjWrWAQOVCiOo88If7oErPQpQI8AAV92x7GdHqLU4Iamo0gKBTWKqkOep68B
	zJtCnOLckiBUP5eYBA6e4jPcUDxKaHMq4vC+kXR9hXbT0fdTTltLhfd18JwbpdriQlTL3/SaumD
	Cvicd9TPKlRrg5NfZ6vA5oJnc/9awRabpoCtKg4HFV/fcQ=
X-Received: by 2002:a05:6a00:7484:b0:82f:4a4d:3792 with SMTP id d2e1a72fcca58-82f99814b42mr31000118b3a.4.1777214257392;
        Sun, 26 Apr 2026 07:37:37 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm30061828b3a.15.2026.04.26.07.37.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 07:37:36 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ijae Kim <ae878000@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: clean up DMA on probe failure
Date: Sun, 26 Apr 2026 23:33:36 +0900
Message-ID: <20260426143728.41534-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_073738_809217_86F4D1EA 
X-CRM114-Status: GOOD (  11.93  )
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

From: Myeonghun Pak <mhun512@gmail.com>

mt7925_pci_probe() initializes DMA before registering the device. If
mt7925_register_device() fails, probe returns through err_free_irq without
tearing down DMA state.

That leaves the TX NAPI instance enabled and skips the DMA queue cleanup
that the normal remove path performs through mt7925e_unregister_device().
Add a dedicated unwind label for failures after mt7925_dma_init() succeeds.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c0..4883772302 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -415,10 +415,12 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 
 	ret = mt7925_register_device(dev);
 	if (ret)
-		goto err_free_irq;
+		goto err_free_dma;
 
 	return 0;
 
+err_free_dma:
+	mt792x_dma_cleanup(dev);
 err_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 err_free_dev:
-- 
2.39.5

