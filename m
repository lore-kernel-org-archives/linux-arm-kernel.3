Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213AECD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kkxqiQ4zP5GBX+kUzVlvAXk0Z7GWlJPzsDOx8k6B79A=; b=vmm3FK9ztiUowSHrsckIJ1Uw7l
	V9rwRkCTU0rLx1N5thbcdJ+QABMEFVjyxeim+SiVySAlHA/1k4dwiTLFQimmnPEreifAtHp040hn8
	kzeBD9xjwze4Jntjoooul78D5qS6eX4GWKV4acZFkXxfrNi0LL1QbjcrhtpaRjs3M8mLNse9913fB
	xEiF7MnQH/MAS8UqMF2GWC3dq8DnRU6LlfTi2GMbjyfYatFb+HcA/ezA4Fx3dzVDDFdOI/nN8lR+A
	wVnv3o+tvvJK32uL1MnjgClfjzPj+wtDv7/hLc94/QyYSJWQzC++9Qs6N6jFa36csSrqx7tNQMqnD
	DFEelONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjBl-0000000GfpZ-0Rqh;
	Wed, 17 Jun 2026 05:51:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjBi-0000000Gfop-2AgH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 05:51:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84230ab8857so2494947b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781675505; x=1782280305; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kkxqiQ4zP5GBX+kUzVlvAXk0Z7GWlJPzsDOx8k6B79A=;
        b=Z8qpz9buVFOiTutjs6LP7cPXRYfGhB9xhbJmklNHHk96XXy94Xv2Wsr9JM8+9+hQd1
         uaHxha+3iSDfGsBNWxsetWyq4evJblQU80D1mYX/TXkERs/UOKBaBMFbKnqXZjA+9mZO
         N2QgXTlBTgthS4YY+azEeJ2NNY7Rya/un4Dn1WZbHVCn7Kxeq2LXOOuDsk076x8Wo6fU
         VsMiVuvzL8FA+wQuGjk06rWHo8lvwRvTC7dVMpDc4/Tm2757rj3N9vtCHLV5gtWUzhVX
         4AuEhpQz975tM6HKByBINT/1IaywZZe3t2NsMTSFrm3QdGKa9+JP9iNAV8vczKzKjNvH
         QeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781675505; x=1782280305;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkxqiQ4zP5GBX+kUzVlvAXk0Z7GWlJPzsDOx8k6B79A=;
        b=Gzx8CO+usLiPX+9siAXBH84dWBFaBpSos28If4O5kruTQCiNSfqgcHld5uOF8PamEj
         I0H5HAdgPayvfdl7ui6CnzW0pRq1bLDmMdsJ1sgY6Fc7e+rjKEu9Q+dfzdxar3FIQ/dj
         FKR0eEPu9JjPOuou7+ikmCw+Y/JmrF1l1LaqiJBU0qkJTphRNpAvq//O6LDsVlDPQR2R
         tvHLt1raf6D+kfVEjJWnu+S9UXbRk9t9mQ9h50psjRQsSYrsqjv2NrbnY9wSaN3EGUDp
         od9txEtvE2FqIn69ZdWgCVuHvJwRG0PGGK9P6tJXNe+YOi2faJWYk/BiJh+5J3spNkTh
         ozhA==
X-Forwarded-Encrypted: i=1; AFNElJ+bO1xt7xVIa2NAZB92bObPVOWFGg3Ey5U2akuXB9ZABDfAU03bQJDt4VpRvPBzU0UjIl4qnso46wie8dNvFeWP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuwe3sK9KTqzVuLQgbEotyemzZgaPZfgKMrPljkdU8U7KLXyCW
	D6zSWiN0BO45zeWQXs7VQWx18mtafqERPAxB93a70Mh7Zpjf8peb4Sh/
X-Gm-Gg: Acq92OHJiy3I8E7SMOOdWknQUAJMYhgc/v23sTU/yAyW8A0AAYGRB/lKTy1Lz8l/DwA
	qaUtFvjKDkIpVYIwJnJCHI+kKTyiT7E3Tj18qoayetjde+Jvvt8yVRfLBCyzbyzdI/2aO5k/5z+
	mb+e+bTS80u27MDl8SUeROuR06WOcTocKv3HxAb5T0lpUQojM7EaiA0ZGaRlfRSyd4dI0HiNH6d
	fEH3qIclyQqXMTgVJj6CoeHkGYnKChSSwSN/jIT6Keb06ZAyyXA54dTfXVyTJNIW3ZyNO2Jqm+Q
	tVzTIaKrJHBCXvftLWT4O3oY4ZuN0lns8u4I2riaPaXpi4BjIb6zMhn1OTIThNmdCvazz6EPchv
	2rHhhmBb4y3Cxbcexh4XPvFp7E8oqKnOl/sd0AQ31ktx6DefmsrJdamHyAk5vTo3pfL0DsOR6xq
	VKwpBDDA==
X-Received: by 2002:a05:6a00:3925:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-84524444c85mr2332894b3a.8.1781675505554;
        Tue, 16 Jun 2026 22:51:45 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc87sm13810534b3a.4.2026.06.16.22.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 22:51:45 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_ppe: Fix rhashtable leak in mtk_ppe_init error paths
Date: Wed, 17 Jun 2026 13:48:13 +0800
Message-ID: <178167550101.2217645.14579307712717502425@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_225146_559020_1D92D509 
X-CRM114-Status: GOOD (  10.36  )
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

In mtk_ppe_init(), when accounting is enabled, the error paths for
dmam_alloc_coherent(mib) and devm_kzalloc(acct) failures return NULL
directly, bypassing the err_free_l2_flows label that destroys the
rhashtable initialized earlier.

While this leak only occurs during probe (not runtime) and the leaked
memory is minimal (an empty rhash table), fixing it ensures proper
error path cleanup consistency.

Fix by changing the two return NULL statements to goto err_free_l2_flows.

Fixes: 603ea5e7ffa7 ("net: ethernet: mtk_eth_soc: fix memory leak in error path")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 18279e2a70..8451dc3fd0 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -918,7 +918,7 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index)
 		mib = dmam_alloc_coherent(ppe->dev, MTK_PPE_ENTRIES * sizeof(*mib),
 					  &ppe->mib_phys, GFP_KERNEL);
 		if (!mib)
-			return NULL;
+			goto err_free_l2_flows;
 
 		ppe->mib_table = mib;
 
@@ -926,7 +926,7 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index)
 				    GFP_KERNEL);
 
 		if (!acct)
-			return NULL;
+			goto err_free_l2_flows;
 
 		ppe->acct_table = acct;
 	}
-- 
2.51.0



