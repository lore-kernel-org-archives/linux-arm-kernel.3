Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD2C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=; b=pfa0gJOnsJ1huXS//h+dJL4R66
	9ncbPonxYTJ962iaLWXZDYpoWzO+rrrv9A1kIFoaYnVDZYHcmrV7frVejgaXb9vZ0voUMFQpf7uso
	0qOBJOs8dd/Vmede+u1fY40ReXSvqH4NwT3EWw8/AE3WNgZgK/hz1aHAexKIdHfM6nduTiAflahoG
	qRskYm7bYRhSD/Qv0FJqEUx37kWdvojCRcFngabRA4n+y7M1FcrDNE/GfMr5mWxvpCvoELuI32pfV
	NlaGZ13+Eis24ELfNB4tCfSp+75NWL9J1YXfZkJXeLwMbABrbF5vT2chqtVnz8OtMMMGGCBnlPwuq
	5uNF1pEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubotz-00000006O3o-34De;
	Tue, 15 Jul 2025 23:17:35 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboeJ-00000006MoD-3jPl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 23:01:25 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-41b6561d3e6so980459b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620483; x=1753225283; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=;
        b=fR5Pw5OPm7LMCLVPrPrVPThQtmvo1DogcKqKqmM2DbhpG5Yt7mZdFOvaenfQBVfHzy
         vrsrOSckqzDb/W4lfrEi8LJE56z+D55nm3C31I8+mKE6VeGeW1htxtKeDUwTTqSV7A0U
         sIxMOdWCoZ9VlWYHxhwFcv0rbwVwwu1JNevCS+vNrKKZswQsG+G/6rxwWhHq7/3hVdNC
         4HVSx9KUqljeJn3WFNQpDGekrMCIIzqNUyh/0fKzRhQ/x8LO+aAsuBxI5c3hy/GcUYy5
         YD6/pUfoheRdpFXMC9TrNjO830sUV2uBOOeSqXEE3Y9XULfKfFyn9nLQoSqK142pq77L
         HbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620483; x=1753225283;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=;
        b=dUYEDq539BAsEeKU9aoeqUZtOGeEyX7s/bFHfWkIQ0IdS04u4bkkOYlZb4rEjZW8cR
         xy2o9OHyoYxI4gXwO+egspw6FkQcwcFBHVF0UJ33xl70wAtZgx9Kk5xKgC7Ljkd0jDK/
         hk+7uc8uytWbzMcc2brinKSCSxmdW73CBMk2t6u0EGlol516fUT2FbHNg1xSGoYRleyL
         4x4CFFh/CmNbdlobMYxjGIxSqStBhhtcKK2E7HLR1gJ0fKheQy/PW8NnOiZ2IkDS9ki4
         v3wtKvrNKSgtLgqlpzqkvF32Fo57vMQvIn+DvUErFO9agN/5nUzipiVyayp4l9dEz5XR
         07yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgDxB1qFQT3HHz6pBqs+jueuzvnOoi0oq48mMHs+J4gfL515rvRIYOM2MMsaMdrMYiQvk00IlWpRos7BtHCIqB@lists.infradead.org
X-Gm-Message-State: AOJu0YyuJcGkQ2zAtkONgK2SrwIbcC36CydguMTwealnmfkRiy1ro8M4
	L4WJdoZhRoi63i2SMhbcZqCLCgjl6L8djr1SPiQDeazbdMs+Q/VxLnzNzoykeBkRq8k=
X-Gm-Gg: ASbGnctw9MggAIaUYr46397gNrMLrbMuU1pooLvnK09vvZppgnpl38n3Xua8KRhsM4T
	sBPdXklpQIjfpIK6ajGAeBB9xz+TBvrG2rum7bwCGRNyrWTb1HBfq7scl5JTeY9bFllpSkNqZAZ
	ZaQ1/x/qwXgsumAY5KnMscxxZO6UK1AauvDa3Fi1pdLr0+iqE/daDYWBiD5CjhE53S2WTjNgHpg
	Yd/V2kYNM6p1vbjYrIMdottV4RbRZCMoSAZT4vODFSHgNQafxIWBd5778OpE2l6a+ROwfPMX/9Z
	JLY7L9jJXmQb1ffknpog0gpK18N2ia33j4Sw7Wt5l8rrBmqag/AflAVZ9368WgRXQfEw1pOztFk
	oQuJeu1F6GblTyxtDuuYslj/JEhN0
X-Google-Smtp-Source: AGHT+IGQtllmBc9kuXNMSNrT8BdEoXm/J1sAHyCL8mClXy5PmdAT8mA8+MNoRfXMLo08tASsstG21g==
X-Received: by 2002:a05:6808:199f:b0:41b:75ca:b104 with SMTP id 5614622812f47-41d05d37a1emr470408b6e.39.1752620482690;
        Tue, 15 Jul 2025 16:01:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41418c0ae9bsm2349086b6e.6.2025.07.15.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:22 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:19 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: mtk_wed: Fix NULL vs IS_ERR() bug in
 mtk_wed_get_memory_region()
Message-ID: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_160123_927973_DB5CE6E9 
X-CRM114-Status: GOOD (  13.63  )
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

We recently changed this from using devm_ioremap() to using
devm_ioremap_resource() and unfortunately the former returns NULL while
the latter returns error pointers.  The check for errors needs to be
updated as well.

Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 8498b35ec7a6..fa6b21603416 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -247,8 +247,10 @@ mtk_wed_get_memory_region(struct mtk_wed_hw *hw, const char *name,
 	region->phy_addr = res.start;
 	region->size = resource_size(&res);
 	region->addr = devm_ioremap_resource(hw->dev, &res);
+	if (IS_ERR(region->addr))
+		return PTR_ERR(region->addr);
 
-	return !region->addr ? -EINVAL : 0;
+	return 0;
 }
 
 static int
-- 
2.47.2


