Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06135C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=; b=sOQnG0KWBaAZkWACDlz7UJNVvO
	/qoOcGbTIZURaUG3ZJAZn7S+OF4SpAzgZrrfOC2Hvd612n8RWK+8iPm9JvWSXEWer6vqpOW4f3WDE
	Bm0tY22nkT3R9/batOMUI2TXL0+Hke0TTdJp5xcD1GXYbvpHuudQoaHahbSu/8Ar4k59vrAWGOqpp
	1L7ZYE5E4xFn3c1MPa1+yHV6/SQ9PY/4O4nbowExjdYoF/2NwqJmH8o5IPcNoJiy6X6BFWKGS9aUJ
	yPviJ9TTnaBZfuEKKvwQM5hwzJsTPpTpJp/EKPowiDIoDe4PSoO/IH5SXjmD2qMIP8s2mwLWPvOL5
	1oCrw8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUVB-0000000CcGF-39Yp;
	Mon, 10 Aug 2026 18:13:33 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUVA-0000000CcF2-0I99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:13:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1849799a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385611; x=1786990411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=;
        b=kh39ZdONcDZuCyNN6y11QjoBBJqrZ8Kj4GVY2GIlH8YJQX269yoJ2AD3OCnXifJhHF
         ydNacEmAne48MSeYFv4gu8bcWfiyL3SnD4sNKO3XxN4ve0Kw4loEbf3Gt2S80GAP0LQ3
         nU3kPdrtTaAr/wk8dd3rqsNWSWH+wEQ6hAgCOx+bMZWjOCJx+buDO2zZnwbKcyFnigvf
         EA8bduI2Qf0MpdSPHo+TM/8ylm0z9j0ejXFU10CK31Ha2m0MrIUiGuIsEZmawP4PRmGY
         lRwYj1T67fV1Yta75KlVThwiDXbQrBNfIx0lh0Q+lbQGUgCQIMDdfFSD6Xv6xMsS3yFh
         8kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385611; x=1786990411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=;
        b=eNAX9IIAhHCZb3ccHczzpdbBEEpWXGQismwTVU3zdhA+gIUTYkMV6tVxPDjv1sJoky
         fm7dvXBwJ0yDmi2dtLeU0pSODu+tuX0UovZ71Qb/YL8/VG6kQo/iQY94btLbjk4uA/9f
         ksquNdb4tcnLq4qPXeGKGucGEpXwCcL6xdGdee7nX8qpguHDZAXNijUn3omGKB4WaN9g
         Q1+Wt6T6RWwxnDM4Pus44Y4aAze2gD06g2cqflV50qPVzQHoMbzdc/DKbekEPW5Brbno
         8zDrkUQozPRuqpXxJXUPVvZy6QQAO2LTjxzvowuGk6yMMJYmNdzfEoSQhySvTEsQqNkF
         KgUA==
X-Forwarded-Encrypted: i=1; AHgh+RrdjaBgdGKZ5va35wr6QUn7YaJSaige/KLkkKIyrnKHYFrghsx1JsChpTuamGbkRcH26JkHTrCOCF0heELHNvIi@lists.infradead.org
X-Gm-Message-State: AOJu0YyYMie7QWPJTlROIFG23yN8Se2tTikwBlbYRLL8slNhl65fuvQy
	MuruaD6cDA1OB8YLSE1aNknuopAbGZzNv5tqIpTickFWTDIGLY7mQn7i
X-Gm-Gg: AR+sD12N/290NpiRAZaNfDAcKWanTnyfP3HRKF7u0bauxh9UIEbmX73yM9q8EY8ogw9
	VZl43zZFpgCK+p1ETfWyK/Wt19cFnBBbre1Q4mxch3GqV5RlC/nhbHmnw1yvVGr+AzkTQhRKiaS
	DLhw7e4uXs6LMXhInEfTzSUH2IHclE/ixwIndQbXubbEWnv8hkqvGXigaDkgWVzaZoUj4P0JPvB
	KnakbqCWIJajU66jFUsq7YV/adxB+/1OqW82H8WaEf1XJpvokLUj+o/6TulmkpBGiX9VRExjReu
	7qGBurpQUBfB376Gfy6I5T1AFvbQz/JcbHawMVy56GCjtsBuXmND83PlKexIev8uLj9/KAUJ4i4
	Hep3yAl2xD2Gnu6nMAIrZbgaFBvm6UFz8PGKUzlbdx896O7RLF0/Wr3GGoycxXqpMSvjs1O1Siy
	MoVW8pq78BJl13YHvDrW5o8worf709wtssopjE9qzEnJXEtqihYB3K7w54/Cke9FA=
X-Received: by 2002:a17:90b:5446:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3909d89bad6mr31304315a91.11.1786385611271;
        Mon, 10 Aug 2026 11:13:31 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 32/34] dmaengine: hidma: defer callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:33 -0700
Message-ID: <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111332_113633_7CEBD658 
X-CRM114-Status: GOOD (  12.68  )
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..486a2c61a9fb 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
 
 static void hidma_free(struct hidma_dev *dmadev)
 {
-	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	struct hidma_chan *mchan, *next;
+
+	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
+				 chan.device_node) {
+		dmaengine_kill_bh(&mchan->chan);
+		list_del(&mchan->chan.device_node);
+	}
 }
 
 static unsigned int nr_desc_prm;
@@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +194,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +216,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
-- 
2.43.0


