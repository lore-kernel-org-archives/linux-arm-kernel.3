Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A983C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOD2Sq5+ZH4AcnNDOmSUoO/ljPGq1eIifxgBsdfQLiY=; b=wBof9CXD2OUoo3u60JTd9f2Z1k
	d0ug6P7hwt2SYxzNJbh6fGlZQTuYScguOtzkoNZ/sAeJy8yHKQCZeaJdVB1sDA9+eAq7nA8fkVlyY
	f4mlRQz2l9qthV7dBY8cvipWvOmC/QJSCrk/ib9wWx6LFt5QYeN2S4n9Eql5Hbmx6w9fMGbGJQh2U
	S2B4EkwfOOarMmwiioONiJt3MgkJg7do89LYra2mOInRD7ZoAdDu34PH6BSn77jmkMHXm9Ptj/7rn
	6wyRWuxkie2tMpyi5nJnAb4iycD92mCTBBar5yDqvOvAjlu9TpzzJJ497bbnPCI054dQSqmEeJYdM
	6m6JfmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZm5-00000001DVM-1WCw;
	Mon, 10 Feb 2025 19:48:57 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZdv-00000001ASG-01aJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:40:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739216428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOD2Sq5+ZH4AcnNDOmSUoO/ljPGq1eIifxgBsdfQLiY=;
	b=mEB+Xkj8T8zGigBKiyv7FB06VJrCxIGpILs21+CpcutU5jlc0MWNb1aUfNlgnvwcp5Zwub
	psyi+BgX8tRe1LYfw35T0eLHelVndz55BfAqxCuXw8Ecyw0yPUbJcHTsJmD9mZhEfT9DdP
	bIEZWiNNb4U52rCnloNeb9NjZMv1yOVQTL5x3mbfRvc+Mc+xFEwZJkf8kk25clMtRcvDa9
	IRYHl+O2rWr+dmA452gcgDFHawO8b09IezIHm3NA553dfTGiaPHi47vRE5ObJdaO0iIQVI
	T45sAe5S5uPg7yezUVNN8zVAS4XMYpOxL9Fw2Ebw1edHwxE2E2qT4Jho5N5uyA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Mon, 10 Feb 2025 14:39:57 -0500
Subject: [PATCH 5/5] iommu/dart: Assert !locked when configuring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-locked-dart-v1-5-5d97fe247f35@rosenzweig.io>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
In-Reply-To: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=apwlrHK+NFmUFcATPM4IEl3yfbQ24a1UqxWS9zc+/wc=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnqlYZdwU6iimgUcyo61wE4/xA3zJtr53OpF+Dx
 ctCIBx48SSJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6pWGQAKCRD+/lBaCvVY
 DVycD/49tr1weIxdnNGNmj3jpsXXmZOfwks2OSyN89yavv1Na4aT4E+O2fNw3BRnk1VspirBigp
 ll9E48WekXnXMa8kQxS/2I1/aYigRPd2T4L2iiKbxPEi8UCNQgbAqGlHGxvqhCLvvYh+2aiDLpv
 xH2nW+kMVzdMlunP7GVyAZZvOyCG2RtlbboG0Qj5J4G3nZpDU6AaDXYbHX1a4FzTsPS0LqiTnpt
 qUqjp6NjnCOMaQlHvKIjhf83bVlSMr7tzYIhdzb80lX/ZAJGtOhM5feKQyeF9wkfVhaFtU/pN4V
 35/in4R1dTefaMz6tsoF3MBj/m44M8slSaK86gCIePgTWDpr+e6z8wqy8fjqgghaxlNuV7f1wMz
 34yVh6f/hp1tQn0C7xlKfF1rhCAk+LblHY9/U2CLdt85dWhLBFnANsyPpPgMCqqp0z6G2pqYGOB
 qz1a1oPkM8XMYzed6vENNWVflXNkAYPcHfY1/tXCck/4jWHVdfp7ZUaCDX6wTFBOMHKy9LVPJsl
 UBZX50SMZJhbfMPNyhvJFTuPc3c0W4HFibXi+NA2Pw92klqA2ja8fy8CQ6hOMYf+PvjKayDLUZv
 lil/vSW3MdZk8Hee4FrkwJv+iftK+Js8/p9i3HQRHdzCNRXjNkiTXHTc6x/iYwiWIWIM3oaGoWz
 T6IiGUagk+V8YCw==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_114031_196215_F1D227A1 
X-CRM114-Status: UNSURE (   8.21  )
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

Configuration is only possible and needed for non-locked DARTs and will
fail for locked DARTs. We cannot try -- assert that we do not.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/iommu/apple-dart.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 29b627b38e8c37afd2b6a72865f43d24b633834a..87eb87bb2f5158d000a2c2fc801b722a2262c941 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -309,6 +309,7 @@ apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map)
 	struct apple_dart *dart = stream_map->dart;
 	int sid;
 
+	WARN_ON(stream_map->dart->locked);
 	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
 		writel(dart->hw->tcr_enabled, dart->regs + DART_TCR(dart, sid));
 }
@@ -318,6 +319,7 @@ static void apple_dart_hw_disable_dma(struct apple_dart_stream_map *stream_map)
 	struct apple_dart *dart = stream_map->dart;
 	int sid;
 
+	WARN_ON(stream_map->dart->locked);
 	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
 		writel(dart->hw->tcr_disabled, dart->regs + DART_TCR(dart, sid));
 }
@@ -328,7 +330,7 @@ apple_dart_hw_enable_bypass(struct apple_dart_stream_map *stream_map)
 	struct apple_dart *dart = stream_map->dart;
 	int sid;
 
-	WARN_ON(!stream_map->dart->supports_bypass);
+	WARN_ON(stream_map->dart->locked || !stream_map->dart->supports_bypass);
 	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
 		writel(dart->hw->tcr_bypass,
 		       dart->regs + DART_TCR(dart, sid));
@@ -340,6 +342,7 @@ static void apple_dart_hw_set_ttbr(struct apple_dart_stream_map *stream_map,
 	struct apple_dart *dart = stream_map->dart;
 	int sid;
 
+	WARN_ON(stream_map->dart->locked);
 	WARN_ON(paddr & ((1 << dart->hw->ttbr_shift) - 1));
 	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
 		writel(dart->hw->ttbr_valid |
@@ -353,6 +356,7 @@ static void apple_dart_hw_clear_ttbr(struct apple_dart_stream_map *stream_map,
 	struct apple_dart *dart = stream_map->dart;
 	int sid;
 
+	WARN_ON(stream_map->dart->locked);
 	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
 		writel(0, dart->regs + DART_TTBR(dart, sid, idx));
 }

-- 
2.48.1


