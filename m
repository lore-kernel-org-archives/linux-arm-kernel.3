Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F457C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=; b=qG5TyYRs1qNE03Z/7eoeH4ucQV
	UZZ3IItC6Dp263rcACTqB9ugCrNmnDgN4ejWIIECN4azCN48QEuyOZpCY1C9GHHna+pskaHm9Dg3P
	+vgrX/7gkeWQdKGrDQW8RgDwOvYjYOdAy5YUP9PxxmTKEfUVc6Gnav/ZZdrlGU1fGQbXPkklmrSgd
	I1cKayPHeekCgyKC+Q411OAovWhGqBzPxFvmCTlym1cuH0B5vRckqrvLnsWcmL+IebauguGEoqLMd
	uqvak3UCVv6LrIQfiwqYBCxx/aPvwfBkdtia6HxXQX5gCOJftJbk6ZcldEY5v6wmr/EebJPLzgb9a
	iaIhwCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR53-0000000H3wG-0Xje;
	Wed, 08 Jul 2026 12:08:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR51-0000000H3vW-33Uf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:08:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cace7da66eso6108245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512523; x=1784117323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=;
        b=npHLKXMCZf1w8s7W8+b9foi/zVHcPzJvM91nn5BHEEQkgjm3aJqtXdqtHQFMC9RLtC
         TMPbUaFExlxc7Tchczn/YFqe8N3Bzts7Lrwnt9xy2lWx6g8CCBeyFo9pXgoYNnB5BcX1
         ot61mdVi8DrMp9hJANMlKuM22nnBozNsPRyIUTB7am04op5/gUUjDeqY/rQipJvThmt7
         A8LNtowhG1lQr4PnREwuKfxqe6/y+R8j6LIAKeIsxr0WAPtTJthOPv5MyD6Etk4ncWBJ
         Jh2rgGRq/tYzlqKyaVzLeelKFRAplBfkK5MrtjRPVqF2rISTnkoPm+KS5OYQbM+qMlzi
         FWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512523; x=1784117323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=;
        b=ZrKgLky5saygt58imJ3ePqRDTY6LuY5WWn336WthlyJxYUM4qRmL9EPH1PHahIGznC
         itGCmrlL+xRWLoLH7MiChawewj2VFPg1s4LS/GwaYPCgd18fjB2QQik/OHBPZJImu2m/
         7kzNxFO4FWRFHYSTtfmIGTaFkyvbQ776cAistwJ2yEkdW0fZ6tLXgy4Ago/HTyK/4Fo7
         Nd5V7xBgi4ar4jh0IFrvjcjOdFRZWvHtvZgC/t547+qFOYfO6RdL9KtUWsm38Aas+VpN
         66sc4IVwi0EET5IN15nVJk1MS3f+axnl1fwrHn75FpJz85nYR4tZ/Bx50GgMk7VqikiF
         XGqg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/sRudSwBeFn/e0mIHBNsuBfY3Aegh1vMFZjUPx1dXXKeSJbbr/hwmyM9pOd0/wc/J1MMnam52P3/TpAJP+/QY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9G7FW6HTrQViv7zvOGiESjdwHIdQ6aguzdUnu2pqHn3qPoCgW
	STCC1HSI6hSMsEOjVopCabVwgS8dbpFgG5J9LFnxLuN54xBGGTJtWz1v
X-Gm-Gg: AfdE7cmhhGfikqWdKto3f5XqHQ9Wccn8N5PPWYnIrOUCN51oe5JF2Dh+c7468mdKNyg
	fhm3gtDV1kcq9jKsLgTUWR/Z6qN2O0e5crka6ubM9PaoJfG6WO6ifT3HWR/nhPZQmTYsePycxK9
	ByqtWiAmGlUKhCz0F8YAdaDbvYsMDnU8ezvQI5OQm3yXkC8I020Gw9B1Tb/f9r8Uj0D+iTmnMW4
	RZU3+1OMGVcT0LjJY6q6Dps4ZxaNpRVi8TL9u0okjz+Je61g8SOyeBTNhirVL/xu8/RnSbE5ZNS
	5BcxKDieabsaN0tQjrH/97icAnPwx+ylnmYowOgc1uXGEP0ls4Jvee9PBx2sBogbepQuNPaNC5f
	EqoTVZYjN45XlsOTS3ZZuWn39lm/2YySMP5ygneBaMLaFrPmwIdw6ybNQ1DSimn1rLuBS5x6py1
	8eD41Q9H33X7+Fow==
X-Received: by 2002:a17:903:fa5:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2ccea3b0e5bmr25272395ad.21.1783512522781;
        Wed, 08 Jul 2026 05:08:42 -0700 (PDT)
Received: from lgs.. ([101.36.109.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1f030sm27088705ad.51.2026.07.08.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:08:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mtk-jpeg: drain hardware completion before freeing context
Date: Wed,  8 Jul 2026 20:08:33 +0800
Message-ID: <20260708120833.755998-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_050843_778251_A8BFA5AC 
X-CRM114-Status: GOOD (  14.02  )
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

The change referenced by the Fixes tag cancels ctx->jpeg_work before
freeing the JPEG context from mtk_jpeg_release().

That prevents a queued or running JPEG worker from dereferencing the
context after it has been freed. However, on multi-core hardware the
worker can program a hardware instance, arm the per-hardware timeout
work, store the context in hw_param.curr_ctx and then return while the
hardware completion is still pending.

In that state cancel_work_sync(&ctx->jpeg_work) can complete even though
the IRQ handler or timeout work can still recover the same context from
hw_param.curr_ctx. If userspace closes the file before the hardware
completion path has run, release can free the context and a later IRQ or
timeout work can dereference the freed ctx while updating the done queues.

Drain the in-flight hardware completion state associated with the context
before freeing it.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..bc9eea0483ce 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1202,8 +1202,11 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	if (jpeg->variant->jpeg_worker)
+	if (jpeg->variant->jpeg_worker) {
 		cancel_work_sync(&ctx->jpeg_work);
+		mtk_jpeg_release_hw(jpeg, ctx);
+	}
+
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-- 
2.43.0


