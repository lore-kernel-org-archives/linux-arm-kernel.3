Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA8CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2mnBr3tjwuDiPitMGmjjZXJEZ7evFYqDmAUAvxZYdi0=; b=FBKR3xZveazQRO0s9QQEHA0bTU
	frvfKzLevtWaVMiVFdcZrSWRX2VQnXkCjrNKRArjhcTcGJgwS+UHUdmkQIXaCuoFFv+N7660I/0h2
	umx4IqiBh5EXWYK/gyPNDJG0c71CMQ+NjfIL9rcKSwEnSBbrrtr1xBrpe5uoz63beUhlg/LisCyoM
	XCD740ill2fqv/bRxgkFzqC3FaQQrcZ3xpBev0DVWnQf7eAJvbIryiee2d7DFPNpx6mBc+zAfWeK2
	lhLsC9vKNF9M2gD9GEPVcNQb0M8PdBo1rEmuyCHYbO2FOorYIKIWULQK1Zu1LcHn8yVpxEqJTTIoj
	Yg/kqR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSZ9-0000000FkBD-39OU;
	Tue, 16 Jun 2026 12:06:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSZ5-0000000Fk9m-3i8f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:06:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so27858405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611607; x=1782216407; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2mnBr3tjwuDiPitMGmjjZXJEZ7evFYqDmAUAvxZYdi0=;
        b=VNUyIpHAoaS7x5k8IsvtyZldWxF2yvdGaBJiPWYESLppKcVGp5t2bNtH9IyNxf0D97
         tVAuU5E3QlybKvtZyQqzckwdWzYZa6UOlR10jsMfSAEccU5JIh3b/0wlkUweADQWXCOh
         //y5+DzQFd8NbTVlhNHWh2o2uLIc3zObwzbOxlc+z3PyIA/zyDoG9UolAM8SMafJmsuw
         R2Oxl032WcdDsxAU7djr0kYVsRDzG3kmPdsrVGyWFGfKzUlXEfAqTDSpG6oBBrkybtow
         NkPj15DOnZ+RCDMHYKDRQQ7J63/ePT5IZc2mFf3dWCn66EfIUe7qScvomIFbrSmoTpWE
         CxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611607; x=1782216407;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mnBr3tjwuDiPitMGmjjZXJEZ7evFYqDmAUAvxZYdi0=;
        b=Eh9eHrrSlsrhFQB5rWOwd+PymHLT9xnFOZ+wi+R8ceiPYFFOGUfiqfXTXCvg0SYLzC
         GQzZ572vySMlLvP3iP/ASJt8hr0PlXRsIN7jxuvV0EOtbXAj4DGb3vVozwl2v4UsdXWu
         X6duOvoltwFEJruMlCAmVv9u/P2k1KCENpLJaF2yFeVfQQ/sIeOTMBYjDeG9pkIjm8Ln
         QtDCDlMpC60XoNuRYWUhGNge9sKKD3puRh5qavT0E0LEAc70bu5Q5G+z7iJqYgWEnyBp
         cMLsxvrJO7OZhnkg2iU15RRbbi6jh/nDaxXiX47erQge3WkU/WBSE6x14cK3Vmd7kSBZ
         1+ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8ig0EGl4OPEfEARFVJpaZnziHi4dST1cJnYXWggSbSLEDKiw7tOxx3+ylRHhpca+vUjuxc/jIKzoupGzpsXsHe@lists.infradead.org
X-Gm-Message-State: AOJu0YymfRmjftv2WgxPLfNbREWyZeuor9BToUAfq0xTlFtAp+iirsbY
	EYciAEfwcD9bEpu0LHHP2D+7MCMCUdCK2HVRUCeqChK9aO5KgS/H4Ftp
X-Gm-Gg: Acq92OE0QSUGlQD1Sup3qY/c5qUM3yleV9z10h32Vr3pmIl6GnsQDyiQ3654WX9+xgf
	XPFEk+txd72RpDIQFEiJRuMJgOSm3eOhFpKWgy9EIjltiFTe00Wctddrdmkm82hwhFDkKA/xTtJ
	LhfCCuLjzTcWZzvV/jvYdJWXOaaX4hGY74siCevJ1cEZGAadKtfCUHX7UGNIPYBDI8BS1VQG0/b
	Ur7sDYQMg+bpaAo8mftfYxgcW8QjgX+GScFmBSwgpnlL5VjCajV455+G9wJ7E851tIYypBlvmjL
	gHrG4Iat21VoKIq8oy7uUkK6JdSTxNuYFzOWJkYce4krJEHgvk1EDbe1OrKpNuxAnBxARxRMx8r
	ggegPOwHJKcorXbXpzcTJxKYfnkgYDRoEyBv803c5wRomRiQ4YDoL0VbWDjYL0+xHnRn/h8DtBl
	t3U0O/fI3a0FOq6+Mv
X-Received: by 2002:a17:902:f549:b0:2c6:96f3:96a6 with SMTP id d9443c01a7336-2c69a1d15f8mr33933655ad.37.1781611606918;
        Tue, 16 Jun 2026 05:06:46 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm126562735ad.49.2026.06.16.05.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:06:46 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: Clean up RX queues in airoha_dev_stop
Date: Tue, 16 Jun 2026 18:50:48 +0800
Message-ID: <178161160256.2165161.14322392784449633554@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_050648_151686_EBADD917 
X-CRM114-Status: GOOD (  10.84  )
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

When the last port is stopped, airoha_dev_stop() clears TX queues
but neglects to clean up RX queues. This can lead to:
- RX ring buffer descriptors remaining valid after device close
- Potential DMA synchronization issues on device reopen
- Risk of use-after-free if pages are freed while DMA is still active

Add cleanup loop for RX queues to mirror the TX queue cleanup,
ensuring symmetric resource management.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..9ca5bbf64d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1771,6 +1771,13 @@ static int airoha_dev_stop(struct net_device *dev)
 
 			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
 		}
+
+		for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+			if (!qdma->q_rx[i].ndesc)
+				continue;
+
+			airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
+		}
 	}
 
 	return 0;
-- 
2.51.0



