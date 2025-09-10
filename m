Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA34CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5bYSYMP2Z0IUIJfdQoYkXYkAGdrYTGhMeil+naL+UQc=; b=0Fnl6/coDchyiybfkhmxOiMeY7
	/YuFA2dEpxFMkxRGzqyLnoxRH8D9KN/NDVAavdVbbQ0cYtJHV0Aj5yhX5GmTeadBudtpeVismJ5eG
	9FmIJhvR0pCG0bRULpKPiCBZS1f/xHLXn1l+nINEYMzL3zYYyGzTfd1itrcUDIQzuVs2fNBakblnR
	4obc1xETSAdWsl042u6jBYh5oHjxRvFEqUy2VyAcJBAsHKLj/Q+ptfYXeUhU0fUrTe5bUmMAeZcwQ
	TY475hdfZQx7ntnsXOepycgy4l2eIBMSgH3UYpH+jlHL7oc2eynbbMsXVfWSQM8Nsrq99StNdw23z
	0qLDc0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGI6-0000000CxpT-2JB9;
	Wed, 10 Sep 2025 08:34:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGI4-0000000CxnQ-1nfF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:34:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de185c04aso7178015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493294; x=1758098094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bYSYMP2Z0IUIJfdQoYkXYkAGdrYTGhMeil+naL+UQc=;
        b=kjpOJjEqOP5yOvh1PbkvPkp2ZNZGORfoYgrIJgXzcELYm+DYy5YMKErwnUMJNT4DfG
         1519WbrUD5xzD5pFJVRw9dq1p9VW5oMEoUEHdZzIALSa0WP18HljlHvyPJvo/GKlhw+J
         VW45LdlrH3OHTg4GaU/fjDBkkzkPxX5V9iktafKqug7rMrH6lt+pAOF0s02fmq6tO4Zo
         k/CyQ9jut9pAohhqqfmc+NGSjKjAqdkfoDScPFTLfcHrxhis88t9wyOAEKd+5swlp38a
         WzG+6RPfi878ugK9QjEKECqztXGJAsxroUaHjhcW1rQ6b5dvAJ4frFWHSvlVN3k0MB5F
         zxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493294; x=1758098094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bYSYMP2Z0IUIJfdQoYkXYkAGdrYTGhMeil+naL+UQc=;
        b=YCC7dlXzPQu7J6um6uhaOgG2ccjJ1YzR8lfKKJIhpnSTReOzRvRwKbb9v4MNucL6Uv
         Lv0Ech7LjUz9M+5mLYrmrFY9vlJLR+/MtjTcjphMTWLEbZWFI5XKbkqYUU0ghMV5Wqtu
         a2mnyI+kNWwISlVfiynbpcnzOvhKZkxCfHTUGd7taPxGKGC8btkFS3vVTh+WVhriuyTx
         f8kPbgJZmra9FOp+lCoTxq6CvLzfJzyZabg4zTzgKvqXAYhHhewfAWOagHayHI0MSSgH
         PT1H3V91Q5IemLCjXQ92ATiHwFv4vIBXTiKAysf5lGRKOLpEmbjcpLgBWAMWHHYzMu0V
         d0VA==
X-Forwarded-Encrypted: i=1; AJvYcCX6FIzE1v6xPwIIOAPrrpAvDUPsVRXmV9So21OQBVy8RzLZzV/2e/z4sOHZej3bb7pxHIO+GYxolQz1FVMl7xta@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmt6tfE8OqLo3x3OF05lJ5Y7wIB88sYzBQQxGvsbdAMNaYXyOF
	igxDuCTFoalXBKn+R7acdS9TSvqbvgfJNaX1YjpKn6Amm03LGc7PMh7L
X-Gm-Gg: ASbGncsGMsEE9YxBIX0R8FTuk1Q7pv4HcudKufl+Ru3pi0cnTvJHAsakspDpGHBNLXs
	HAGY46MQommy6ZBszDD9TOcjT6a/f59HXC427VvyrrNxQ1DjkK7iALE90dFjx7uwpx8AG4ZfaXT
	0vtU9BHJBB/yV61VSlpACvgZlSXPeMgUhGvw/jYZx0gzM2i7Sepyn0Km4lbD1/0DZ9fcceVB5hr
	m7VIRO+W12oD7ad+AcPNjbM0lzPMFHwZ4Hg7R3RPp6rl6fHBhidiH8zi0hZNmcISR6/ccY57uBL
	tdmJYdR2ZeTp0Sguy8yQA/zj/iqspyn0GT7A6KZu5PeF9Y2Hl62ZmgRfwb7F+eNROV3OxERwZ0e
	xvoAQqUumMT18cdrKaL8JXNmOmpDuhTt7RRkgZe/TpZCjZwIiiPwrfz4pOjyu+fuoUmQ=
X-Google-Smtp-Source: AGHT+IFvK6FSXou9OenUrrz/PdbIoxF3WcJL69A9lP4CdFPOW3aq92qZPlSoHiBDeanssK1jlGOOKg==
X-Received: by 2002:a5d:5d05:0:b0:3e4:e4e:3438 with SMTP id ffacd0b85a97d-3e63736d9bcmr5889161f8f.1.1757493294125;
        Wed, 10 Sep 2025 01:34:54 -0700 (PDT)
Received: from thomas-precision3591.inria.fr ([2a0d:e487:311f:7c67:b163:f387:29a1:c54d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e7521c9a2esm6378854f8f.14.2025.09.10.01.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:34:53 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Neal Liu <neal_liu@aspeedtech.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Johnny Huang <johnny_huang@aspeedtech.com>,
	Dhananjay Phadke <dphadke@linux.microsoft.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: aspeed - Fix dma_unmap_sg() direction
Date: Wed, 10 Sep 2025 10:22:31 +0200
Message-ID: <20250910082232.16723-3-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013456_474520_22C0B44C 
X-CRM114-Status: GOOD (  13.75  )
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

It seems like everywhere in this file, when the request is not
bidirectionala, req->src is mapped with DMA_TO_DEVICE and req->dst is
mapped with DMA_FROM_DEVICE.

Fixes: 62f58b1637b7 ("crypto: aspeed - add HACE crypto driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - fix confusion between dst and src in commit message 

 drivers/crypto/aspeed/aspeed-hace-crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace-crypto.c b/drivers/crypto/aspeed/aspeed-hace-crypto.c
index a72dfebc53ff..fa201dae1f81 100644
--- a/drivers/crypto/aspeed/aspeed-hace-crypto.c
+++ b/drivers/crypto/aspeed/aspeed-hace-crypto.c
@@ -346,7 +346,7 @@ static int aspeed_sk_start_sg(struct aspeed_hace_dev *hace_dev)
 
 	} else {
 		dma_unmap_sg(hace_dev->dev, req->dst, rctx->dst_nents,
-			     DMA_TO_DEVICE);
+			     DMA_FROM_DEVICE);
 		dma_unmap_sg(hace_dev->dev, req->src, rctx->src_nents,
 			     DMA_TO_DEVICE);
 	}
-- 
2.43.0


