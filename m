Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912A1C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=; b=T5cM9jwPdw1NoRjAEbKXoBVDUT
	u8trT4PA7oV/4rFb6bLMIQq6LGSGOmpF3sWO4LEIZ2kV4VqUe4VaydKfAUNa57dg8GvFk1k1X0M7G
	EHE1/Vk2RtaVHNQYcF/LILbXuzej/XlJSpaPMx4Bot/AXSIAp0hYLG8ydAieZZLQPaF9yIrE/UVKr
	MjIYjlgPDoJeur+eX1vQVd8pQhLYUbcePEUyJ2BadTS6E9L9kPl5xTU6cr9Q8GYDz6hZXootIUa9R
	Scdg6J9kqEVWsm4L3vfEyxIRosDWtZjtGR/3E5PFuq8miCnrYfNow5PgsUy0EHYBlUd1yp7GHpk5T
	NACBTx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVov-00000004Tzf-2xam;
	Fri, 23 May 2025 17:04:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUvD-00000004LQ0-1bTq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:07:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a375e72473so74356f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016418; x=1748621218; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=HVxB0Z7cGLXznn1fucStNVy5NKPK06UQow4kxUHRBKZ4+lCQfI6OtQ3HtJ+UIq4pxw
         wx/8H+xRsI3ArzgugofS4mI+wS5V8S9ix2Vo5dGkigp38CZd7bD+9YchEg250fs3AGhH
         A+UqzcNpbaiUOO2UubBYBfgy/iu4x1hcQpvO8m0xY0YgLLChwGvgzrEKmlU3+ufxAkry
         3p0SmXMacTXb1pOWPp4wT1E691IUY4qdXssJ9mkNC7iR6VzlKf8YoR5SIttW4NzI01vK
         ZxF0UotI6cCJOxUUHb3/Q3j/HxkBEeONlPVdanY0XhSHvBNZQt2JO+AVerAFdAHqseD9
         ApaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016418; x=1748621218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=Bs1dZM/dBIRJ/d+5o9RSE54RqPvhS2luqOfJJa4hORzJusFMx/wPcA2OZcsU4l7TVL
         SbSBtiaaRflJutcH8OCeYtlpVEiTU3EnEl6wRq0KK7T6AHIfXQ5/oq415vu2cvX7FWiw
         Ueh9TrdowqE59pgvCljp8pWmeXODWcycx0QE2eEw6Z+ZF4gLVWRS9SUGylXwsZLptbC/
         gPPea3hHuWy6+IDO1xDZfrv4irEMEJtFOapK0RbI2y6Q5eDHibsrNcygFqOO6lt0nhJb
         kYJoU4fUw9LejJWemLzpQQJB56gSz69hm9V8+HITuS9dIFpQsdqPfRQq1DHQXxTh5ebg
         /faQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrb56oxmRV29lQpu0L1ceQSkekX7VGRZOgk0hJMm2urY8jUj/S6TPzFh5wxRJ9r7JI8dLcqq0Xz60BMk5RwySK@lists.infradead.org
X-Gm-Message-State: AOJu0YxeqGJSNmN1e/Y6IAYvSDFRLAHywt7aZsbkowesUnV4p6NxqEyC
	FBr43WYcJy5dmgvdc1WNxL8oX8/drYiJPAYtQuvb6jjcjUFH6h2c+ADeGorz/+9H6R4=
X-Gm-Gg: ASbGncv9UOBRcgW4Vt6buLMFzXiyvsJC1n5WlTGdLA4+bsFIIn07q+pRbSg3QErTRc8
	K9RHxWkCb6cgbXaYLM1fXPkCsMiXmlzTZWo01kRyB9z35anNxIBMGPLYmSju0AACqkyv3NvurXd
	i/QXnBt+tLeW8Ix97l3KaB1Nqd05b8BbLOqD5CmMIpoND0ctnxe93v0UNVsBgAksk1wjC2sWAoI
	tsho43H36rcdUxmVzLUUdGRb+6/H8iLx64t1MwLPknh5cFNSHhUbmJ+olaNamFJ+abG7oq9TQqQ
	Gk5/0UxwEmeMK0NP16qLX5wmOVX5eQyg7lQd1D1ngpOQpJo4csezBDS8gENVzteVA3c=
X-Google-Smtp-Source: AGHT+IF56UQSCz5q5QoQKyBHSndYLKMFyKvT78EcNJOHgSCsSRrkaKawUqXQh0qLd3vhveIRpS1mOQ==
X-Received: by 2002:a05:6000:2011:b0:3a3:6f1a:b8f9 with SMTP id ffacd0b85a97d-3a36f1aba52mr19442998f8f.15.1748016417661;
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca5a8cfsm27334537f8f.37.2025.05.23.09.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Date: Fri, 23 May 2025 19:06:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: mediatek: Re-enable IRQs in mtk_cqdma_tx_status()
Message-ID: <aDCdHh-G2ShU6uid@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_090659_423746_57D2F84F 
X-CRM114-Status: GOOD (  11.57  )
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

This code calls spin_lock_irqsave() twice but obviously we can't store
two sets of flags in the same "flags" variable.  The result is that we
never re-enable IRQs in mtk_cqdma_tx_status().

Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 47c8adfdc155..9f0c41ca7770 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 		return ret;
 
 	spin_lock_irqsave(&cvc->pc->lock, flags);
-	spin_lock_irqsave(&cvc->vc.lock, flags);
+	spin_lock(&cvc->vc.lock);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
+	spin_unlock(&cvc->vc.lock);
 	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	if (vd) {
-- 
2.47.2


