Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0A5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXincFsGPd4t/V1M7vzyJrviqv80PAJbxZi/T5A4VKI=; b=AfbXfXAhjZV9eKq6If48Kw+XMl
	WzDfIXACyIMr7ZEQQW+6EK9N4aQIaWWm935w3SN2WMIxLf/huJzS21OEQZHqRD94AZpq2JhXzNIY6
	aRonONxBSHS1HrzZh6rjzgddpgiguxsA6+DEJJ3c0bMg9lcFqj2y1O/rSgsgbmCKtQzDEDM0Fv9Fs
	XNwJaaLRHcx28M6TNP75osQGmtnCwP5DtY8McdztJDmCQQDZbgCXYTSbOakT8KFB45mP4LReCxXHX
	xMMisikzH6NXltEsCZaar08E8+8k7T8tmHKcbu13V1mXKiD5fxvWeqZYrkUzC7eBlXHKub3E213mF
	wmrdBHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Rcm-00000003f15-3S2i;
	Wed, 08 Oct 2025 10:42:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Rcl-00000003eys-0rBr;
	Wed, 08 Oct 2025 10:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A180C61F53;
	Wed,  8 Oct 2025 10:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02499C113D0;
	Wed,  8 Oct 2025 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759920142;
	bh=rm5wdK2uJNnErMUOf4H7M2S9QIT0yFPobsLvDwKPFgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WAeJ7Y5GNB4E4Y1VCg1NEphRXbA6Rs/sRnHaxI1qP0Q+mXg1gZEh0zoNDP2j88f1b
	 7jaBLtOVa5+q5H92c8wgVH+8NTbqaPadVJE1+AJcD8ymZbzgkcb3ycagf0sK2IcDq5
	 YjraSm+orTRtElVRLiQkCj8aNFjUvotXk51fIMrk7amhemiSx2o+6w8tcA41dhetVP
	 XWmEhb28SKhRkoodDG/0LpUrTzhUVMGO6RQfs2sVpPTvRje/l+IbBYNpI+sbT/ZFLb
	 NRIxS7kP56B7oPK8ngBvVFNe3wdmTjYihVk5gcZf+KAnrNfgXw7JzHlrMjk0ZKm1ex
	 n3A6jImSzI/Tg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Oct 2025 12:41:49 +0200
Subject: [PATCH mt76 2/2] wifi: mt76: use GFP_DMA32 for page_pool buffer
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-wed-fixes-v1-2-8f7678583385@kernel.org>
References: <20251008-wed-fixes-v1-0-8f7678583385@kernel.org>
In-Reply-To: <20251008-wed-fixes-v1-0-8f7678583385@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Daniel Pawlik <pawlik.dan@gmail.com>, Matteo Croce <teknoraver@meta.com>
X-Mailer: b4 0.14.2
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Set GFP_DMA32 flag for page_pool buffers allocation since the hw relies
on 32-bit DMA addresses for WED offloading.

Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
Tested-by: Matteo Croce <teknoraver@meta.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 7753afa3d883d6c7104bbb68d1d61b562e828ac5..aed5dc347ab11903ed34ac33bc20dea63a9e926c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1869,7 +1869,8 @@ mt76_get_page_pool_buf(struct mt76_queue *q, u32 *offset, u32 size)
 {
 	struct page *page;
 
-	page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
+	page = page_pool_alloc_frag(q->page_pool, offset, size,
+				    GFP_ATOMIC | __GFP_NOWARN | GFP_DMA32);
 	if (!page)
 		return NULL;
 

-- 
2.51.0


