Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E5CCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 06:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1QXG/OHOueFMbmPjMgjHa4I8+bxiyo5Fb5MP2BTqljM=; b=xEN+YeXMQsGwpDHAM4mpqpYcGm
	fXufFG835mBumROMVnNCqF5Ljo2+pPjOwO/nOTdo5p7xIr87rLfSwfDZaq7iTW2iuu8fiqjGRFrXI
	9+Qfwsp0xq+fvRk/WHJu5zkUrEJvcrBrlPWm/TSCgQaxrAOzIH6BnGVYU7piZyBift8ZUzJZ6uWRJ
	+p5lw/bNN2CFo5238wGTPKJ0IEnkVOlFGnDQNmXNPF/3IgqQ3QhHP+lX0u29ZGbzPDPcPWQr+3/nq
	d+iApErNnYb0JbNfpDMDm1q1RE4a4DFA1Nf++mA/9wKqum4IDGVcJvwmVkCOjXm3BPFA/tS5lBPJZ
	1aTkfH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnL8-00000008mcH-3VXc;
	Sun, 11 Oct 2026 06:47:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnL6-00000008mbv-1JsK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 06:47:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so8000035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791701238; x=1792306038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXG/OHOueFMbmPjMgjHa4I8+bxiyo5Fb5MP2BTqljM=;
        b=BbabS2/8A1jOnCLFgadmE8yvg4d0B3DdHmfZ2MHNgzqDKrdovh0+ys+PiYqAR3tc8o
         pob59hA7ImzvG4MHdONb+s0QB40d1KLmjHR5V4oZiT8T10MvsSC4KbJd4+6p5fyP3BAc
         YbqJczWFE/pDpXGjA1qmRUgNX4i6xrqQJlBgOVU1yXb+tY58Q6167jyFm5xnLwa6uJTy
         xDQ3tbMsY6TbXrw0YcKmkFASh7CUs1ZLB458daFJ6EF3LIJgjdDRAyQ7Ir8RQjY0B8o7
         4X+B3vo0FN+DBvU7nWMqNi95nScBRFPR556f0kA0Te4gJRdrOv7x8sf+1DT84o5+RFm2
         AmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791701238; x=1792306038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXG/OHOueFMbmPjMgjHa4I8+bxiyo5Fb5MP2BTqljM=;
        b=xtceSyFqhuBiD5yTmf6NN+z/InTSRc4KcPhmwODCxNVCn0EGtHLRsUAOBGgpdlu6lG
         g6h1FhsrySmrPA+P3fZu5i7pQWI0JlTslvQZyLtZdV7BHPm3bLMLdCGT4O08/Dxmb2v4
         DW0dH6TaCI+q9LVNE8wCThQu09K7A0Z2qa5FOkhfSxalrcwp27vQGDER03y4eLsgjrKX
         OQqTgsDRvRjyrETT8JDu8nCuoYnhZBruPTfBZJJOvizGOzXSlLS5CtM7robJ4wkfCc+C
         eqqJxLdJERXNy6Tt82QxF3lzGGwOmelGowtwwA1x6QfftqZNjDsnJz2EoMEJbQ3VwLwO
         5X1g==
X-Forwarded-Encrypted: i=1; AKwUvBxDqrA9XpsoPmCnwm15riUJHGkmVxgzfQVGVbYslJUaYBbuL/JIsYqtlrErupK8jVFWcN/gVZpnSFIm4TSKiVdg@lists.infradead.org
X-Gm-Message-State: AFq9FYILeS3xE5vVqtUCoKY9D+rdrkcKs+0QldT4NcHC4KmoP8CNFdnU
	SGqk6RNIxuU1Eak9JRKqwtnTO0l4h7XM8TnDsrUtp4rTW5FM7qAgjAP1
X-Gm-Gg: AYBFou2RwCzwPoFrqn/gjdWGQ10Q1KK6d2BElUKxw9hu+MeJvRtXX7bRHM8/2VOoASC
	/ZqfWG2OKJ2F1WsshCWjLm3B2kJIGXhR898jkn2KfSkxQprxzKulCdqgc8Ye+rxMuLLvh4Qu5aX
	suuofocrrsyzz0GPhLUTBcEu4+fP3neDCbeygMK5UXBDDKF8AbkSj3njkWfNNenUxMMuE9e7uOi
	GEblcIj09ROtIrq43ZQym7QIW7c4mhaphQSVzvARbwZOHbGrhdjfto5Du3x2wDRGp+TC9+6Hfmw
	ig0a/v0Mkus75LpZNdjLFoqUFfVNzE/+YmEiRvDVg0p4ZzOvjdrf6eUYqLuzY6RCPI1MZ4wW7k1
	MG39G0HNndGgfjnvuXVbRLOmvzLpJDCQglyLN7nQwW/KQX9zZKoD8rMyJaH197vKpqBITvS7GRM
	+audbQ+xLEHgjS54kWnFMpvg6hrUcVHGWEMc54OG7Vi9XHIi93i57/sY9Rh7RDdNVgAmzcm0b0l
	w+ds8zW47A/8eikDmdsquGVrDk2UcHt8NQ=
X-Received: by 2002:a05:600c:1c15:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a18e4d67e2mr131695315e9.30.1791701238379;
        Sat, 10 Oct 2026 23:47:18 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:e952:dc8f:95c1:823c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm194319945e9.12.2026.10.10.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:47:17 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/aspeed: Propagate DAC mux register update errors
Date: Sun, 11 Oct 2026 09:47:14 +0300
Message-ID: <20261011064715.2422596-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_234720_382821_42EF2FCA 
X-CRM114-Status: GOOD (  11.94  )
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

dac_mux_store() currently returns 0 when regmap_update_bits()
fails, implying a zero-length write instead of the actual error.

Return the negative error code itself for observability. No obvious
reason that this return should be clobbered to zero.

Fixes: 696029eb36c0 ("drm/aspeed: Add sysfs for output settings")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index c8746766f258..a933ad358852 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -268,7 +268,7 @@ static ssize_t dac_mux_store(struct device *dev, struct device_attribute *attr,
 
 	rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
 	if (rc < 0)
-		return 0;
+		return rc;
 
 	return count;
 }
-- 
2.43.0


