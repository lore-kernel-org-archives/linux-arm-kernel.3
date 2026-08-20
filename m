Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2377C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzpmYFmR3xRBQWp75KCP75aMVcwBSxfqQwzCsWsaceU=; b=vi+AKjfBTgGkxPNGT66HvsZtp2
	qjr38lboCHKGnApI6FnIy2cFW7Bdrj6Az7FZl89xk6VEdv48ncpWMFTlH6IT0bt7OtxU17bjAa00M
	t8otTD+ViaZFZLfB5rwsgfGrvIeOUiw0RI3zcRSI//KSdifSpWz/cjC2LCYqIMvuw/Hex4DDdP78m
	Zqx1ptdY6lB7kNVluZeQUvsQqAGIlFxCKxTtEWLYNjdRNPvq/6lzw2h4/hI8wubGYWh/Rs2hXpkGQ
	JlkirXtDMLJP+wt+19FwBF+5RfzCsNeJ2qdF+h1Q88Qj3MVVWJknmcEuIwlixbqXdpWMwerAgkxbJ
	i/hsDL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyd3-0000000BD7F-0vG0;
	Thu, 20 Aug 2026 09:00:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyd1-0000000BD5t-0HgR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:00:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49978908b35so14094115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216401; x=1787821201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzpmYFmR3xRBQWp75KCP75aMVcwBSxfqQwzCsWsaceU=;
        b=ims6RbZ7ZpY8hVxez1zhZHhom3Ld00Mcj2N96Uk2T3N8TMXg/m2WMGBLfvnraxxG48
         TqT8xBmruiYDJvzsDPdgERTDdjDmMoF6LiV26gW2tJdlk852Mro51Nnx9cdgshNNWqZh
         Ny6TmWNLqXJJJUu4nVCcnRyEQs7ipF0rmNDc9a4AoPnFi6xCxJ88usNqMEXCQMp2myD7
         wm02e9SbXau3lD7hn2Qa/Rl6GXn1YW8pytvVXvELsYtbHkXra7+3LGulFdU2vQ97P1N0
         xycYeslQZ8+DK5U+JTHwf2l2gDE6XLviTaW5TYFqLhrY0tKy11v+1gMHjaf78qTKIpM3
         MeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216401; x=1787821201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzpmYFmR3xRBQWp75KCP75aMVcwBSxfqQwzCsWsaceU=;
        b=gKmNJnSGzlDcUOrY1A3TLrUdkoxCh0CitRyYRMiRD1vdLBRKIKK6pzS1YshjfcPZb1
         LnLfJ7jc8y/3UWAbQjyskPsRxtaIUlAVgFVy4HyOcpsav6AmE+6g0KfvgABm47P24FDk
         JZ5v7HK6J4FQXpyXluiAHY7cDBGwbKGGtxycBpubNvloJ4hw4x9eOFyyuYjkWhF0OT9d
         ngQ8IrQs3TSG7Og02DcQ4tp6kNnDDP7ft7Lb8Cvq2wW8P2JHn6FqNJwsyfsIzQEzpcI5
         40zmy6yVqt+HcB5RnxW+1EipdaXgBEDHlSXNv6ha/SieNE3BSfW5Bk3PPIlwX6m4B1f3
         XXXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRt3gyhZiemtgJETNdjQxeGlczKxCwebnAiYzs+U7gmmOXJvAMMvSNQKK42xnAnMeYAQdubOvvr9dw4wL04yg8@lists.infradead.org
X-Gm-Message-State: AOJu0YzAVI2wLmVUsF9+mDKfxzQVTHjvpednWuTUabiZeNd2778zcKW+
	aD6df0E79YOqwoOYOVShI0dS1amrYKJaK6tZaN8799G87PLPGNBRLuEm
X-Gm-Gg: AR+sD12O5jzo4gWvFWhXq5h7QG9FGnu0YBpxXhiVB1nTK+tzQ7Z7UIu0bhnyuSP4k92
	8NF/XNl4Cr7J7qaN22KfCuZ+K7ioh5B7kopKOKxyCsSAAVacvj2gRe8kmqLci1MKngHs/zR+Df9
	+inf9WBPF6f8cBTNy52PO5Cc1aZg69WY3SwjddQgIbJG+2qj7Byde3JN/pqcZJBjqqvhSGIqtnM
	0WA8dY6WA0F/FF9CNwycPkptYUcGLkBYxqnaZvOUWjUFK7rRySlu+nH4oKXLNZXIG61DZ6/a/MA
	0TtF17ts/v6CL5sAhaXFuTXqEHwi1IrixLBeY5newS8GGgkM16zJz2bWU2RRm0JtM0lHsPWaFwO
	ASeXKbo5Rb3hDZM04OhoYXmSV352kuoK9S987Tf0/4X4Q/QMwCDvQWTuHKs5YvfHt42f9FFumMN
	cXkcj63vMldISogH2L3Gm2nq8fGcb2fKYXbldoDTlPupXQ5PF6vgy8aEZAso2A7LgtZYjL7kjb5
	vTrL+a+N0M+5Tr67Z3sec14EQbx07n6leNzliP5OOk=
X-Received: by 2002:a05:600c:a30f:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499b01e9125mr80109845e9.2.1787216401010;
        Thu, 20 Aug 2026 02:00:01 -0700 (PDT)
Received: from fedora ([46.205.218.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111b2sm176837215e9.5.2026.08.20.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:00:00 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kuba@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	yangshiji66@outlook.com,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
Date: Thu, 20 Aug 2026 10:59:40 +0200
Message-ID: <20260820085941.380401-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_020003_132489_2E262DBD 
X-CRM114-Status: GOOD (  13.99  )
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

The driver calls dma_set_coherent_mask() but never dma_set_mask(),
leaving the streaming DMA mask at the bus default. On the non-coherent
EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
after approximately 41 calls when using streaming DMA mappings.

Replace dma_set_coherent_mask() with dma_set_mask_and_coherent() to
set both the streaming and coherent DMA masks, matching standard
driver practice.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..4045d1eb93ea 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -766,7 +766,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 		npu->irqs[i] = irq;
 	}
 
-	err = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (err)
 		return err;
 
-- 
2.55.0


