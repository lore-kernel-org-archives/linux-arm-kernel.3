Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B01C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfQfOldSFPXOViGrgsXcllkedO7V2dbH1YA4jan0wi4=; b=pzGGfHhEkpiKN+KCFc1GaP5D2Y
	p1SwP8JxVwrybwv+LVCnx7fAiwVqKU9p/MAAJoy+Lp3mLTPeqyHMiOYy9QunAkH1NXcae2Nt81iBG
	ClmgQWPBCkHBDaxHmQGhNOM0hCsl3PJd++tj7g3VY4C9IUs9Ar+rBf64lr84Zs5Nt1NaZAxLo1FKM
	10eAJK+GzrH/TOxNXkMEiq5P65pI1rIZynEhSoTVtA5481yID7F8q/0euFALPVQ87x5Qf/+tV1vYy
	6J8b+Sawe74HOa2WlVhbzNpILbPZdMvNA2iuhcmTxkSrM3xTl9z0lqNLrRKbLtlUOwkIyzvW0p2TI
	L3MLPhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7c-00000003rdp-3V5A;
	Mon, 27 Jul 2026 20:40:24 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7a-00000003rdG-2Y22
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:23 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2190324b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184822; x=1785789622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfQfOldSFPXOViGrgsXcllkedO7V2dbH1YA4jan0wi4=;
        b=APyuMUrF8PhBosLX3NdpVmxBk/sSKXoAqJhH4MZ8ypF3zc7AX53i6hd59Ck0EDshLd
         Cttuy2IFvI23jOwMtI4WGBbuKuId0uuomhGQGVnWHHlqoRB2WNbhUXKI3IQDbgxVBg20
         MBGnORVZT71TbDzUzVHhrilpKwj39cdX/fPRUf3Gxyo38GxV+l+NkZusArAy1R0TxST0
         wf6yPYwqEyhTKY3AyYiZQQCARjNYxoCMuguA0N9QUldBZsZrrFM150Tn/kT2ZEblJda5
         o9DUi4xCLahkvQVaQ8kdfUpZfxHoShxqV/zxSgT/uASTpY345EQfcVS5zr5QeARyHMr7
         SPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184822; x=1785789622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfQfOldSFPXOViGrgsXcllkedO7V2dbH1YA4jan0wi4=;
        b=foyppLIo/8BwSBDKthb2/HOxs/DK7AiR0l77wPVexk0CdjCX9xjhMl2OK2dir7IhJI
         Z7zUS+YVRjva2enqXuU9jSWWRuEwYUInebsUlHGFtyGmaq4OXBBmbSZCcQ07fKQJFR2f
         beab2cEuXh3SGAAumZDxbEMWnX7QwwHmCvHr+Mmdr3qUcMdMjI1vmeetVZijmKmbwdBZ
         CVdJeClPUNvDv7SBwp6XrcR5I/gi0JhApFvMCn82dKyKFU3pa6korgTj0+e7mBfgCJfV
         kX3bliPQee/4cNgfiM/wENOjlqSozYVEys9sYPBemHBvEy1pwp4T4XjU0G/WfhP4Rsi9
         /zig==
X-Forwarded-Encrypted: i=1; AHgh+RpUrP6cp4zK5dDnswBqH3YURZ7XWmjXrhdZco4kxyr7p2wF5Nmuzwj+okxNnTv86aK9wQ7YqSv+8UcZyOYCij09@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx73kT8x4sA+bw/9ew84p5Va4M7TeAPNq6Cx4DsGlH+Lm/VMdi
	t42zgp2dZdekUU+v5xsem57lXMdukB5OWvPrm6pJyC+SBONv0bRAv9Qi
X-Gm-Gg: AR+sD12kjLdww97R6j+71wqfa0rXA3slbgCi5uIQfF6oNeF07qB6+pVU+m7+fA2c+Et
	qfiP4qTOVqZlnSrHyKqq+xVLK2x+PTEPVCqUXSrSqLhSRyVd0B2B8ZTUZOqXk42ZRhT/ZVkEPMe
	hkuoDgpSOeXCpDIX75Vf1VbUtbt7Yy8pgGvFzCWQE6xU9+UbTBQLO4JiPxFmqeBaWWewUdzjS6R
	/ecUnO//oCgWoeQ9Xd+mZyorTVZiHZ4ho0A/Uvu3eoZOa6Rf2XKzfOTP21yqhVmF0YrdOrzvjkc
	PG2yXglvqC5JKRZCWvgXXJ/1lx3ZmVA4WH7ub9Owk4oVbzvqjRNt40mxkO2DEFf3Eb+J0VlTtOZ
	Wq2HKCpXgRAPbrdyoqJv7NV4tFyXasbB3pVXY5IwLPrbcvXn4fHrUmfGfhZc2XKiaPs21tU3MKR
	1UjICz
X-Received: by 2002:a05:6a00:1249:b0:84a:2fc1:da38 with SMTP id d2e1a72fcca58-84e59574807mr7367623b3a.58.1785184821748;
        Mon, 27 Jul 2026 13:40:21 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:21 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 43/64] dmaengine: pxa_dma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:05 -0700
Message-ID: <df261bff5e82b39bce1b6a93e7c0ffac21c33dd3.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134022_648136_32DDE322 
X-CRM114-Status: GOOD (  12.42  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pxa_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index fa2ee0b3e09f..d57e5e0c422c 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -1215,7 +1215,7 @@ static void pxad_free_channels(struct dma_device *dmadev)
 	list_for_each_entry_safe(c, cn, &dmadev->channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 }
 
-- 
2.43.0


