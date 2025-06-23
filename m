Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD5DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gz8t2oZkkwfZO8pX28gYQB4KOa728jeU/jhzTTj6UZc=; b=djWq4rmIgpWQCX1eV86ttXXI/x
	WmtwpWBbE69yCu2AUQG7hTW2QtFkIuNuTWlvAZNt7EAf0HIju5KF4FvhHFHjwvmsHfCoNPwvw60j6
	Q0XTcxqj9EUm9DwnLDHs4IuBpTrRRcxp7A0MZ8NdogXiWGc16XFVNQnSpGH8dXACAGDrNGXYdi2La
	ZhD53npr30ablBt3r6zQ01HS5khgwqoPqwOAwW/sfiRbX0puDBhYvRaA3S6D9RImv194j8TcMPo8b
	0TmqqEVAye95+AQ4iJc0afdSpUpcFjwBMalxEwucuqa1OfchrnpXfONn9EJB2q7+UdKpzK2uP0YuO
	68/81etQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdOF-000000029wL-01cY;
	Mon, 23 Jun 2025 09:22:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdCm-000000027pa-2Mse
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:11:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-453486940fdso1325285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750669867; x=1751274667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz8t2oZkkwfZO8pX28gYQB4KOa728jeU/jhzTTj6UZc=;
        b=kGIyz/8KbaMRDJiMwMyG5cWqFESZ4pNJNEv65ybgexvDll1ve9B0Jj6HdoI5cto4eY
         HW+fObyKpRmCvbUYF60pnjTLpsCbJAF/d+mz3C4KFEf2LRRYp7Y7+8f3HX/wBlHYlgWA
         JwOMk0ULg0AVKwEBl5lgr1iy4NgEdFrBHL1zkC9iDTagBZXIPKarsXXCJCV7hqPKqGHx
         XFeKrQhpjr7JNVIB7glPM8579BNj8xGSzGyHkB9F+IB3UuzsY2/t2yQ/5zFLNu79iS+8
         W+rpBjHDkLvu0G4K3lrbK/mU7wIe57xoaVkdfMxd9cTVNR/Q6ZLttceeomGcKZHBP1AP
         y/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669867; x=1751274667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz8t2oZkkwfZO8pX28gYQB4KOa728jeU/jhzTTj6UZc=;
        b=NiCrfdT5njPa1QDVXnbZmjVcgLM3uS2s2qMX8J6pIvKpsC69CXBkj3grsnFCLtsTLa
         Y5t5xMk5eJbriCGVK8bpcf1wi+aa/ObMDJ6WHFAQnc4bKtdYY2T9+CbP1zW6C+xnvihU
         uMjDnLgbTVPHLejLdoHttrn3rbWeG8eekdiJfPDHPk52ckn/KBhBzosO/e/tOB9+HZrq
         iFjqSfZDZU4Lp6dr2X2GVsM2ftaCEOLsN8ax7X/Hyd9QkAErtHKl+hchh0kaTsQN4+UO
         yfrq7dGVxMaqZvVT8TPSLePNqTYKl6vnD9MOsqcylo+FMoOSeyom6tQvB4jxskja9yj1
         2ohw==
X-Forwarded-Encrypted: i=1; AJvYcCV2ugdDYXVoGWRXDNWV0DPhHw3yWiY2enrCVm0BRVjcPAny2ThIZhPQmUELARCZsrzKlko6y2m6BY0a+D5gTLJS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk8Ub00KTEozFtv/JslddpCIFO5roq4vw0QdTp88pmuksqesEV
	eQz2HmQtC0kcu9E8Hq4S2DRsGs7kYd4O4zlDYEyfm2sUrTkWvi56kr7U
X-Gm-Gg: ASbGncv0ebgIGpyt3UhWbysBIL6lnQ5Amx2qflIHb6AYv+XMDAdoSL2UQTVCCxT2K3M
	SP7TCqUVA5IB19iyfisaPj13AoP6NTlLhV+/+Hcj1LwkGcg1Wv2vwieDhUd0zC9WfZOKfKz9UxU
	+Y7d5efgwaJ/i72a7xponAZctoHKwHKBAshjKSQ3S9uyN2Yh/X7P4vo/3JRRv5LVEbNG0qj3xEz
	7YK4XLcmNDa6AiRISlP6zMdaUzACxNV4obyHwEcemnsB01wlcSkgJvswEhGriflnTKQ62ORZcYB
	akCOCRhIQjyzGsT+nEb84bzyFerGLUil1pd2LwJtGFHeK6Dy8fAwqcQ5/6vJm4ap/ciTSRp9wn3
	wqauWLuLS2ha9mfVP2WmvV4Wugw==
X-Google-Smtp-Source: AGHT+IGDWWZaT403xBnNIukKkNikvHSsmJYoL9MI3srvKJv2z/ou2KLsn00R7ev+p8rY646+IShMCw==
X-Received: by 2002:a05:600c:4685:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-453653d3d5cmr41354345e9.1.1750669866408;
        Mon, 23 Jun 2025 02:11:06 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:9a26:612f:7b52:ee76])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4536466596asm107683615e9.0.2025.06.23.02.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:11:06 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: sun8i-ce: Fix `dma_unmap_sg()` nents value
Date: Mon, 23 Jun 2025 11:10:06 +0200
Message-ID: <20250623091009.65436-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_021108_608646_1B7EAE0F 
X-CRM114-Status: GOOD (  13.81  )
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

The `dma_unmap_sg()` functions should be called with the same nents as the
`dma_map_sg()`, not the value the map function returned.

Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f9cf00d690e2..ce9d071f5693 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -326,8 +326,8 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	struct sun8i_ce_flow *chan;
 	struct ce_task *cet;
 	unsigned int ivsize, offset;
-	int nr_sgs = rctx->nr_sgs;
-	int nr_sgd = rctx->nr_sgd;
+	int ns = sg_nents_for_len(areq->src, areq->cryptlen);
+	int nd = sg_nents_for_len(areq->dst, areq->cryptlen);
 	int flow;
 
 	flow = rctx->flow;
@@ -336,11 +336,11 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	ivsize = crypto_skcipher_ivsize(tfm);
 
 	if (areq->src == areq->dst) {
-		dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_BIDIRECTIONAL);
+		dma_unmap_sg(ce->dev, areq->src, ns, DMA_BIDIRECTIONAL);
 	} else {
-		if (nr_sgs > 0)
-			dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_TO_DEVICE);
-		dma_unmap_sg(ce->dev, areq->dst, nr_sgd, DMA_FROM_DEVICE);
+		if (rctx->nr_sgs > 0)
+			dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+		dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
 	}
 
 	if (areq->iv && ivsize > 0) {
-- 
2.43.0


