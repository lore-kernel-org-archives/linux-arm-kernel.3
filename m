Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B547CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMEWMetexcI+STkq+hwuSVo2b3x2WsR206J4SHSMQSs=; b=iD6+0sSEAX/wYYUcFlrxYzURlN
	7fRSN+RUE/3T2dMfBQNSRHSCgsl8mcs/EPe9a13dpz+nOGw/0l4UghdqRVLhgHajnk3i/2ZuGgsFI
	JbTh5uh97e5rTmFuNjQ1R6VJH6WAtOrn6pOUUchfNdvraGCGQm7Zh+rSijttmys0u81nzwnS6s+V3
	eqMg7QKElkqDtna6i0NgxPa34oNqc9hl0KYZ3rSyDXVw2jAvEYnWj5HybRgsFe2NRT837P360ocfI
	77Dh8eAE7iAWmGcWuFf/B9zJ5uxftv/FgQkqHFYOdxH4YLgVATJK5Nl4xBV6THzkKS1Pi+zgX0u4k
	TXJD/c8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpfo-0000000ElBP-1FPM;
	Thu, 06 Nov 2025 02:24:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpfl-0000000ElAB-27t1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:24:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2953b321f99so5482105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762395865; x=1763000665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMEWMetexcI+STkq+hwuSVo2b3x2WsR206J4SHSMQSs=;
        b=j1+RiV6rLxyAiupHSsk1gRIByEO0iHWI3pYt71RrEMrzt/ZYocZ7oX9k9mkRn+PfjR
         OT4qDY8+Gj+VbKIei2+1NeSQaZU10TEJyDDb+a1J3AL/qJW2hfg8xG+euA/+HE9J5yjD
         CnMKJmjrGzoxJ/ceO+v7zOOnghv2s0RGaCk23g7GSn3rshfVtXyKZTJ2jjA7/Pe9bMVh
         wRE8FE1rqaQGz7AO68/1UXhTL7Hn+vTOhIEPzqwUyJQIxnmd/FWg1pZFiNSuET/xVfUv
         SCgXcQIy8RY1Gl5bD80yAYxpzU1JWC/e3ymsklrPYQD028FhOBxzUw4MEEaVZhXKZBgB
         cbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395865; x=1763000665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMEWMetexcI+STkq+hwuSVo2b3x2WsR206J4SHSMQSs=;
        b=RGPgI9m19MscOVVaXULAh1wIHrcxCwRTxiQdt07atZh88HQQAV0G9e1hYqAO0htRZf
         ES6SnN5rkScULOBjc0YTgZsa0/H7xD7FrxjKq8I+ZZXDumUtukVOXg9+jzJruWFsq5Hc
         9YXg8U6prFiEll+lswrwS530d6EZcEBBoklLhA/rJp9P8T6cokb/njGcdYfn/SWrFpTt
         pG93tKpTPHstkmxomCXRyNFsuph8P9o7fFDWKBkHsuSlHKuQoZP+OBd87gAIn7Akpoq6
         nLiAQ8pLc3vLvOGjSTg2pxJUNKIcAbSeX4khEKgPviVUPyh13fwxpagoJsOJ6FgW1uLy
         vXCA==
X-Forwarded-Encrypted: i=1; AJvYcCUir/KrCxF4IXeTN5au80HbKV832ySlEeo8i73n1B+QR/m7/l1Q1yPX+0FmCs1vpxiwSinugHD4yMewmod8hZRQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwRU5Wkx12FmpCTy/MYTo8uud07JHspvsZVermV8Ulv6AcTaRLE
	eIBlCryrtjGCJWnGBMJg8nXXAKLKgY4apQp4GY5Pa4vgbSzrbIhKHjzq
X-Gm-Gg: ASbGncsrj2gzYN7oFQt+mM/UsppkVoXplS3K5ByMLJ2lOwV6yxaLzMb+yGW1ApuD4NQ
	WQjMocm0ioe9BrkHfpz9IgeDUz9aQX+k8uYZ0/uwP8Cxs6Nh7oo7gHd5OETuehUf3PQiI17TBNX
	ZV0MePsKIOC6WmZOMbZu0L7QrwPbmDMAyu5lqO7bZ5xhWy4nRX/EuiCP4WMfdBQfs8ufeDRJWLo
	fBw0Efw3W1Arfd7gjH5Iwj5pZAU6ZmPCSkn0Qxw8H2Zmz42oJkxhQV5em+r1SzWVGMKLn5mzl9X
	TNgnnogU1b1c836pzbl3c3HJN/rOxpa87GJWmVrKRCGEvSm+x+ezNbaTLzoOVM5GS2h1EN2ddon
	+idF/RxfvyGgJmtkz+2/I+1awfwrdDdEuF3FOZWYv8B7G4Ps=
X-Google-Smtp-Source: AGHT+IENNM4E7OUgvdk01D8ULNDZQyF8NWNscTrYBkmBG5cFCwDSrn2aDfQaeI7APGPNpdLQZG7HDw==
X-Received: by 2002:a17:903:1447:b0:295:4d97:8503 with SMTP id d9443c01a7336-2962ada67bcmr70131855ad.30.1762395864661;
        Wed, 05 Nov 2025 18:24:24 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5fdb5sm9399935ad.44.2025.11.05.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:24:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS)
Subject: [PATCH dmaengine 1/2] dmaengine: at_hdmac: fix formats under 64-bit
Date: Wed,  5 Nov 2025 18:24:04 -0800
Message-ID: <20251106022405.85604-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106022405.85604-1-rosenp@gmail.com>
References: <20251106022405.85604-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182425_545448_1B57C777 
X-CRM114-Status: GOOD (  10.61  )
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

size_t formats under 32-bit evaluate to the same thing and GCC does not
warn against it. Not the case with 64-bit.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 2d147712cbc6..7d226453961f 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -887,7 +887,7 @@ atc_prep_dma_interleaved(struct dma_chan *chan,
 	first = xt->sgl;
 
 	dev_info(chan2dev(chan),
-		 "%s: src=%pad, dest=%pad, numf=%d, frame_size=%d, flags=0x%lx\n",
+		 "%s: src=%pad, dest=%pad, numf=%zu, frame_size=%zu, flags=0x%lx\n",
 		__func__, &xt->src_start, &xt->dst_start, xt->numf,
 		xt->frame_size, flags);
 
@@ -1174,7 +1174,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
 	int			i;
 	int			ret;
 
-	dev_vdbg(chan2dev(chan), "%s: v0x%x l0x%zx f0x%lx\n", __func__,
+	dev_vdbg(chan2dev(chan), "%s: v0x%x l0x%x f0x%lx\n", __func__,
 		 value, sg_len, flags);
 
 	if (unlikely(!sgl || !sg_len)) {
@@ -1503,7 +1503,7 @@ atc_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
 	unsigned int		periods = buf_len / period_len;
 	unsigned int		i;
 
-	dev_vdbg(chan2dev(chan), "prep_dma_cyclic: %s buf@%pad - %d (%d/%d)\n",
+	dev_vdbg(chan2dev(chan), "prep_dma_cyclic: %s buf@%pad - %d (%zu/%zu)\n",
 			direction == DMA_MEM_TO_DEV ? "TO DEVICE" : "FROM DEVICE",
 			&buf_addr,
 			periods, buf_len, period_len);
-- 
2.51.2


