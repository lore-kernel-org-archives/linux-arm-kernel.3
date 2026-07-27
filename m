Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39F5C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=; b=r/6v42NiKXUuITuQ7a0RzSvchU
	b3bZCQnwwtz6/2yb4A5rJS8MPf9x6YCeBlizketnSx4rgxvlka6WmlRBDk5THuXOg1Hc8vHdS/fbO
	TyUQCApSQdbwp3s97t5u69EHKI5W5+KVQ+8UfI0hFLIKk1HuvNRhRGjsNzuUnoX2rPvZgZDMcr2ll
	x3tHjAjWeH45+wfLxszROOzECUbJEGBNmYbE+F7wCu/RGXnXZsp+iOkXfkUWKsD/1oiz4VA9xisZB
	LBTx0T75td++fyBoK+s15HzfGr0ONpZizVnIM8raP4T9U7ZaOxtVwRsZsp9cGgbFAMJaUc4SrF925
	7UKiEYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS66-00000003rT1-2Mp8;
	Mon, 27 Jul 2026 20:38:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS64-00000003rSH-3cl2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:38:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3196221b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184728; x=1785789528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=;
        b=LQ757hX0G0Rmf+S7mixwKK3s+f02lI5hn/2UxUT0RRAyX3edOtBzbtHDq2NNuaOome
         zUlpu0ZeaGTvPboYay8d9N1VT9wik4YoHy/nlC+HudloVxsiydIMxuq5N0Tp4Me5+Rz0
         QGnDNeOfQIsWehKGcDqq3U3f7XUKUrptF1IevB+WccFm8SohAjiiX5lHw2bOrLkwg/hN
         NdKUeUqKphLQaBmREUmIzIMw9+Fk92+i47qyL+wiXD//oGBlCK5UBLvdWpr/k/s/u4oh
         bGhn13KjlfH33icDd2Gjeqrad2YXUjHgz1Rak64mPAfMwE6728wuVKKm1F4aHGzYIv5D
         UjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184728; x=1785789528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=;
        b=GxEZHnGawrpvHpnaFj8+vCyFQ+GsmEWm2LakU94OM1BZwSqN+hB2iMpBlNKgg1HwZC
         M6m7vMl1hAEa4mkdriwB3MGEzhhVHKwT9F7nDH6nkxRY13ahlxboP2YckN/VZHxDDuOr
         y0tcY4YBbay6C43D1jWZ+UIYxvtT+2CH4Qkx8O2iImmIHW32MKxAzAb+ctz4P9+MZuat
         Qe0+LH1fshA6nhNgmrAojRweY1F0Z7duoQCppJqnU06qYp3/rps4A5QwQy0Wgn3nDtQz
         iAghwUQnwgZAjhOyu/50Vx1+vFdsLc4gNxcjzRQCKcvDn/jNCeP38MVbAWH5PJQSi2Fd
         uxLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcFTRImiWRix4VJgWS/fVARSdjM94w/mUPVp3fG6Pci70Gyifgkba/iYFLTG5Ic7eavPjIEcqZjDtGzsU4TLad@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6PnUocd/7//+NjYCN1I8cdwonRYpz80P01mwICRmNqf4PuOrv
	QIr+KaqKgaNh50lhlU0zM9tKzxJ8vW73HyZZEFjT6IINStW6QbnxwM5L
X-Gm-Gg: AR+sD12cWYBvqoz2TEa82sN7nAjA8NIH0sXy9OeupWppFq2M5P3/+K/As0pBSbNv7wp
	iaA0iyaEy/URcqoXbVlgCWUBuC4XLHwi1rhSdctzeEWlwxahfLLbRT0FOI1lntVfakCBGtjRKgp
	Tdum9W7jx8KBIKxvpPQvfBU9XPrOX7lhoxImgxt8RAHoSlZJrgSB8oydR41WW169uA6D6kbJa0A
	y9BMCYpLz5IWH4hSy/nEIx4qjqs0ItsvI+1DQxerYu9IQEVWThZ7cBis6Z2BvDHgJIdoaNjYJNM
	CVuIIn48sKiEF1C8Jf6ZDKDSYeU1yEaAMO6OGBcZNd1JysfbW5/n+zo7+YNgps2QorgEGJtHOPo
	nQFb+lZ6yXF9poXCdfu1dQBXEa0cJjCi2EMM70GfNnlwfHoYeY8QQbJSqa3Gq34/64ZtExLojDz
	SRELcJ
X-Received: by 2002:a05:6a00:178f:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84e8d4c5f77mr750987b3a.70.1785184727948;
        Mon, 27 Jul 2026 13:38:47 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e583sm3472383b3a.57.2026.07.27.13.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:38:47 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 34/64] dmaengine: mtk-cqdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:37:43 -0700
Message-ID: <b0f12f19d5ad706bb5dcb26cb0e573d78ca22e2f.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133848_894349_B1A23969 
X-CRM114-Status: GOOD (  12.72  )
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

Use dma_chan_kill_bh() for virt-dma channel cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 80791e30aec2..3b0f1d8fa205 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -895,7 +895,7 @@ static void mtk_cqdma_remove(struct platform_device *pdev)
 		vc = &cqdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dma_chan_kill_bh(&vc->vc.chan);
 	}
 
 	/* disable interrupt */
-- 
2.43.0


