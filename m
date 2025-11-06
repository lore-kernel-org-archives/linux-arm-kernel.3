Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1983FCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ancoHQbMh61Zmy4JFkPI+TIiC//k3vHCV4hxEmDTqYU=; b=sVOFNQE0oqJRFiiDZu39iD0yuu
	k+RGt1ruCl9QSXhdaDhjVPhrA7MZb2i+Kul2vhSIFN/nUr3MLDnih0yVUp+tT8hXXNJ/hjx6OlcLN
	y+uiUpZMyqtGMse8zg488aft6mjb2jB8U/qwH0hfK47TSXo6cG+Zp6GXGOYEOlFATVEFaQMILE3Il
	BdSwjHHbEfaczeDDkjemdChIQl0tPDY/6936cBQoJ82nLnZ17/wAeqVV9Xt/3VecNCsH2xNkOrUu7
	+WklFPAW6M0PxVJyJ8AL7fFpDmQLcdVyzPLfMZu6RvY7N120eb4BxHrCJ6g3NzH+SqcjJU+9skVWm
	9u2pXyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpc6-0000000Eks8-0C46;
	Thu, 06 Nov 2025 02:20:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpc3-0000000Ekr8-19In
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:20:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7afd7789ccdso84440b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762395634; x=1763000434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ancoHQbMh61Zmy4JFkPI+TIiC//k3vHCV4hxEmDTqYU=;
        b=AKqOn3SbMDZLkKDset/5fjQX6r/9qDGvP1Hi8fVkmFhaXvPKgIdO0Jrs9j0zKbUSQ5
         syzT7nufk2gG+AxT9sUAPIfwbS5LDp3StWq/RTkd18rwXZXReJm+zfR78A0aN6Nd+PFg
         5Fnj/aKOqWjHz2TbndkN+w7Q/+zLGf+cUPp5hGAz+pOsxdvTKin7+UJ8s1RCV2PsgFYt
         t/eie9agoe2BirZTqtvqyuCY0P/383pJjwqR6uzxuVS0/i6ItQMXXFn6TMbw7CdZjGFV
         rgUWwu4IE0i461IK2xkP7WyiHNEb42qBLLMpUSEVGcAr7Ou1g8aAJo1dn68Vfo3X/hjJ
         RVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395634; x=1763000434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ancoHQbMh61Zmy4JFkPI+TIiC//k3vHCV4hxEmDTqYU=;
        b=oxXeFybkMzA99ZnAgdET1vv6TV8D0pm20vIDJPpugZzVbG7Lh22nqeWKtU7aHTheaa
         Th9VlZcmfj5nNRBJ0PVXmXLVQa3MM3Y6bhBp4RjgL99SI9lU2r2+SYk2iBQQUbylNVbs
         Q79rD/D9EZEPWK7fBg8mEUg4yrYFQfTLOf1niEl59ARN85mRdVSMzC2Jt8axT2J3sB8e
         +YEGe1n3aTFOJ/dHWkBAUFnWONoBCgb8Qdytm69cCIV3ZILkcFC/rQvT97agpUIGBkdt
         iePuL2befcOv/KnHeiZFTIh0KzasrPorFb3m9ved2S0EPR4OO1WwLnIzAyudsiLteb1t
         vG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVU9q91JH32i3G7I7eKaYGwn7iG5PAXOUxNN6vZaG5cG3fL6uHn1hi3tXoFJ5I2jAYRzC8nAInJbjkUfVYmJ7fh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5MbuUwlpt6mKkMqOAaHSJISs525l2UIKieLmZs4DO5CrnIKn1
	T0Ya4c6nY20aqli0mG9JhaCUQ1+RukOSrt7EDokINzVvd6xcywzAm0Lj
X-Gm-Gg: ASbGncuPclmn9i6IWemjBPrlLE9OiwnJ4uDdVR7I6sRasEBnteTYwn/yqdLI4jQhwdK
	t3mp9jZ3GUlJN6KtO1LgCBtbsGbFomfky6M6msdX/nT7arYJWi/Z2eF00BxV8fc52pNNU+GxWFQ
	gwj7BmQ4qZTNeeMLzPgACc89WtT8BuBUomqILIuCaVAkxVTX8dJbsVDWgzx1VE3FJARGNSLP+QR
	7ECyAy0gDeHBrr/NhJoaGM5xE7HbmhH7gMVIpLNtiRdWxMoe4/QdDLw3C0+M5ySay7h3ptc+arW
	4NIML5L+SO0tPSd8VwlU4j5Iw8UTOqlNzHpeuG/9zhpTtLSwz92G3OgC1TVOpZzlmiFvwOFyKh/
	OIF+OXLfwbGxjiTYsZ0RBKNMVIb0hk52gw7rCAZNxZxMCTnXnthz2ram9zw==
X-Google-Smtp-Source: AGHT+IGpq6uwBfjJREOx3KBhbuv4UhxImGhe8wgrE5sf30EQLGu39b3EiCt9niZiEO5dlsWN+gAzTw==
X-Received: by 2002:a05:6a00:22cc:b0:7aa:aa7:a83a with SMTP id d2e1a72fcca58-7ae1d15cac3mr6415584b3a.9.1762395634403;
        Wed, 05 Nov 2025 18:20:34 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd57f91sm830516b3a.23.2025.11.05.18.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:20:33 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE)
Subject: [PATCH dmaengine 1/2] dmaengine: st_fdma: change dreg_line to long
Date: Wed,  5 Nov 2025 18:20:14 -0800
Message-ID: <20251106022015.84970-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106022015.84970-1-rosenp@gmail.com>
References: <20251106022015.84970-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182035_310899_1B7F9402 
X-CRM114-Status: GOOD (  13.01  )
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

The code is encoding a pointer into an int which works fine with a
32-bit build. Not with a 64-bit one.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/st_fdma.c | 2 +-
 drivers/dma/st_fdma.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index c65ee0c7bfbd..01211090844f 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -68,7 +68,7 @@ static void st_fdma_dreq_put(struct st_fdma_chan *fchan)
 {
 	struct st_fdma_dev *fdev = fchan->fdev;
 
-	dev_dbg(fdev->dev, "put dreq_line:%#x\n", fchan->dreq_line);
+	dev_dbg(fdev->dev, "put dreq_line:%#lx\n", fchan->dreq_line);
 	clear_bit(fchan->dreq_line, &fdev->dreq_mask);
 }
 
diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index f296412e96b6..f1e746f7bc7d 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -120,7 +120,7 @@ struct st_fdma_chan {
 	struct dma_slave_config scfg;
 	struct st_fdma_cfg cfg;
 
-	int dreq_line;
+	long dreq_line;
 
 	struct virt_dma_chan vchan;
 	struct st_fdma_desc *fdesc;
-- 
2.51.2


