Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001AACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiRMHvXQ/Yu4+V3DwUZaxWkUFGF/GYECp08B/7NftX8=; b=ijxFNYssLkmPBOwuhrgegnRCHD
	bjzcNzTCa8nA4Egkeu/KXXRjzpuDgoaOLFUfCAQuSgd69SMvK7BVoy2LxyLXqdlbHREe1+vC9Zdsx
	twjR9nLb2BnuGsBDtCMl0DH0ZHD9WhDiRLGJJdhxxMWbAwL/4SvFJLl5Lql7tqcwdx9eRgfMkqluQ
	PIC4voN6SRAQJ/iyoUu/rTQUq7hC56JH9E0VXtgvf63S50cZljuaBKhVdxo1PVSN56trCqUHihB6K
	Du7fIdIDH0zyVxQMDKY7bPVis2vR4FSjUMd0tg5GU2s611+yTOO8Ysr1ZAKmL5ROfcDGID1i+Xanl
	IEz9P5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqmz-00000004z1w-1emj;
	Sat, 23 Aug 2025 16:08:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqcf-00000004wv3-16rc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF6715C4D9F;
	Sat, 23 Aug 2025 15:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3F4C4CEE7;
	Sat, 23 Aug 2025 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964660;
	bh=mPhmqWPTnMNFn5FnYjezuTC9hDdu0Dic6CcLiRxG/2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uM67uI7CWhJwXbQZuvDsd7Pqr81tTyu7iVzUKwEZICsl8wP4HK5TmAVnm7uV0CroP
	 iAMEVvK7AyoGJn6vCCtyhjoVyXTm9nfRTP8hdR1zYhLKXSgXGSrSpPMQ6s1nUiCgFo
	 P6KHQx3/oaqFCaSjTnBq/MFZUG+MF+fWQcKZ9uNbuyLfQbOt9Oo457b0JN2peKe/IB
	 3vZAivVjQDRsQR3Kjc+YGcarG316pP99Q9lP7nI5gdtuik1o+yqCi6Z+NPbyuO/qJD
	 RX325lh7j7TfSkj0WLrBA//SZW9T0n0bDr2ZfoW69D9Q1GgIx0IodlvDAUt4XS4JE6
	 5P7uV1E10pQIg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] dmaengine: dma350: Check vchan_next_desc() return value
Date: Sat, 23 Aug 2025 23:39:58 +0800
Message-ID: <20250823154009.25992-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085741_343820_29B76628 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

vchan_next_desc() may return NULL, check its return value.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 24cbadc5f076..96350d15ed85 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -399,11 +399,14 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 static void d350_start_next(struct d350_chan *dch)
 {
 	u32 hdr, *reg;
+	struct virt_dma_desc *vd;
 
-	dch->desc = to_d350_desc(vchan_next_desc(&dch->vc));
-	if (!dch->desc)
+	vd = vchan_next_desc(&dch->vc);
+	if (!vd)
 		return;
 
+	dch->desc = to_d350_desc(vd);
+
 	list_del(&dch->desc->vd.node);
 	dch->status = DMA_IN_PROGRESS;
 	dch->cookie = dch->desc->vd.tx.cookie;
-- 
2.50.0


