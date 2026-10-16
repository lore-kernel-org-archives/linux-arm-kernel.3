Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687EECCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=; b=ElxwPAIrV0K0koFhA5m+iyvepS
	vRe+7Y3XlSRsGSC7ZvecnuXK4GsLfPHplef1DpvJLkoOkDgUr1EEO8+X+eLY0aTvkNjglrN+RfLJC
	XsoLX/lTf/lCPAbytuhMT+cn/EJhZWsVna42c3Wgwhj268Nlk3q6Ix+NpG9Y2x+kbhsjd0SsLacYE
	ODzz2Sij/0rK0CWF8LP8NbVqZ/AFnwGlPnRTbWKLira1i+Unv7dSFrYmSRPlyJ0wvR/3hh0NoAT7g
	c/DCXk1O8agTjBbs2QRqKEKLa19OQBjACwO587N3Xi+4qkr7UzMIhcN9CKTLKf6gWDeG4NeG18vH0
	htW/KInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe01-00000002RTc-0YPe;
	Fri, 16 Oct 2026 09:13:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzv-00000002ROh-26OT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 09:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=; b=fqCc3ybiz+1gy0tzlropmbiZAx
	pV5MdY46iEvSoPHJfl0GR1llPiK966p5tuHsNvADxmgecwfK5CE/gFndRiLUai00bZ/kOWWrmprtb
	35M1N8iuHsCFS8oWnket/6jdPPuu4nLap5xUfpdXbvHaSovmzvTRoQSeeKvfsJFHASJHTzjpqpIbl
	hokp6us20MLbwql7APhBNesO56zrrbHWneaVVNEIg4ttf6VFTKRMqW51e+H9iGl7gcN23jc16eVB8
	Oas8lOWTbTf14AWTqcZAn9ToZ7aS80hP9aCXYB3ygQRKA5tusk684GIocIr9ieH9i9RrjiHT8CZkY
	EQsSELZw==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdzs-00000001J35-2NPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:06 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so3495155a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141982; x=1792746782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=;
        b=VUVJ676ZXq/IJnFfnEotpZVpC8NhalwDCMfcf362FDRcbYmCSGsW8F9eR/EOsvh9jv
         ualMd5oeuiNmzwap5CDZ9Zr7QCQXiPrCOXq0XQQW0QnVGn0lT/qFkfYC7599Bu5IK3uO
         fGVjdmHton3nhrT+Q0gdsn1gi6sJfs4ZCQRN/It7NBhRCkMWopoXRJUH6uIOHIpXccxB
         zRPtB5vafdVBOuV3GBsEhvIiQG+F+ufsJlK3GxnMmltivzrYKRL/LZ/RlVf/SKfaaw+Y
         CT5hJaNEfeZg79oXODS2Fwj/3O8jIaZKAvpye+0xvpzi2sdBJ6Fto8YdlkI4iLpmkq/A
         urTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141982; x=1792746782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=;
        b=dVVkTzyY3NxJ17lw/FljBqrbx+corS00q7ZqSxM7LJPz1QmxjH1RYx79zEzOJQq+4M
         ugRFw7KYXM1t9OoJ3PnuNA1+2jQj1nPhG+2U8INd1s6WsLYBsqP9oMUVOjA0na1TyO+3
         77GyGEgujGJRPM42nhuv7OMjxZS42a9vaIkVh9oYiQ9NToNx9jgffILKDNes2swDVUDN
         pOnXlwmTILvR52IRUfDP3CD9t3wNducidXe+O3Ewo0vwOD+TYzpj+yavVbPLM0NmD00y
         X54GZ89EfFAnhBUBnHwmo1biSnHSsHEOLoh9AVVVvpKYdSpOBS8w26HvMWBdV63JT27H
         kH1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxG7mPx2IQwzAE7q1qUi9Vxh2o396C9jh+jREN+FWWQ8fsw8Zinqg5mctSRayrwf5gYSrxENmhYXgxIg5OBWeSW@lists.infradead.org
X-Gm-Message-State: AFq9FYLpztwzEdnIJY3sYjsusAIosdNIYvvwUOGFrxKRG+J+/KUy3lZ1
	ySbTXEuezGnfQXR2oVp5Rkll70MIrpx9oI4z9EgMUgNeRs7pHuJ9voP4
X-Gm-Gg: AYBFou0VZSoSTPv4LU/0Bqydb0HjwtuDAOZhqPFSUNA8UhXxcTFYCmQoXfRmqEBuo3f
	c/9ZZRSHJDEtmXpzGn+sU3T9UUrwZn9oca8zmyRY8TmB+V6XPWiwUjxw7SY0hANYlI8S8wEM2x6
	YaJCI8Sh6Xsij6XYOWtIbgr2WQtxTj/dc/CzNKPfhh0uxVwHPpOuIEE7Eqb4V3LIfTKVwwiatBk
	QCpKd/KPSFtY0hB++pg4db3QUKLojKkFPgN/G+PwoBxiQFq2CwrfoDLZOs6xUTCo9b8xOeptlL0
	AsDq5lkQLvJbE8FA8OMpLeG/QVh3zITXA5oi+eamrEEj1kKI46NVRY2e/O71Jyvr59Txl1hhOU9
	JGdUe2ThdSwZeo9cz0FuLNhZ9dSYIFxk3SkxG1APLTIo3xgv2mFIWw8OdiP2opCZQpdcsFqxF6V
	T0yD/kHK8QQawZzsBe9mbNF9GgjUbMmD6jai+MAv9zkOage0t843cBVHZ9D06QGmuZd9yVHOPkc
	vCvJnSOtR2GTqXAADvB/jQ4aSJ545z8TaHYiceYY83plXnQ2g==
X-Received: by 2002:a17:90b:4d10:b0:3ab:e789:ce84 with SMTP id 98e67ed59e1d1-3abe789df31mr14032439a91.65.1792141982237;
        Fri, 16 Oct 2026 02:13:02 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:01 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:34 +0800
Subject: [PATCH net v5 2/5] net: ethernet: mtk_wed: fix reset condition for
 rx wdma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-2-8b02e78fd34f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=911;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=ef7Fw6tWRmoS7SAlJ88r6e3K75+WCUkomH/n+4D5raw=;
 b=+PQFTR5s+TTWwx7Z6oJWtXxCv8fvB1yIrErU3O65A0x/ZCM9asxgNMV5LpBxXawCXZOXvZ+QF
 sEZym+shfFOBc3c8pjPDBrbFSHIHqiTE/3NTqOrXjEhY1KjtJmVMjZJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101304_852926_22C2EE11 
X-CRM114-Status: GOOD (  13.60  )
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

In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
reset which is wrong.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,

-- 
2.47.3


