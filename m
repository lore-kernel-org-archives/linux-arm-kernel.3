Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4CCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Occ2Auitkp4TNvTqlmdDCEbjvoCr3RaS62RKSPjLibw=; b=DjczxtxBbTp6ZJtqMFGo/17sIM
	VRNKwhmdDSgPT0f1Te+y5y+MMnlwOC8/MnqzvRSv6xuMtaufUJi79bsApsdl0Addg2hOjC+854jmd
	3NBqzJY9RqAASTUPfzbW2u/4taTivLROvSIwHFVgPyIMeBLsbu5qeOsmUIRF7hw0TXDdBEi7T1Ly5
	qsUqq2ZhaS8jNTjh43B4Vp1j/Y9jLgRb7bTU638g4GmtMCW6K2osmH1owcrPodKGyHhhehfyLBH4G
	k2HiiQZVSHYd+O7cq6A3MIFS0/Ry0BiranACyHPsBRp3hsJSfEQIPmoV98pebnr8wjR8OwmKednOs
	gpLL5zCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZki-00000001D4u-2dlG;
	Mon, 10 Feb 2025 19:47:32 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZdt-00000001ARJ-0wOM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:40:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739216426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Occ2Auitkp4TNvTqlmdDCEbjvoCr3RaS62RKSPjLibw=;
	b=d9bfjWKuGE6S10cVSNw9w48WqXMUZBcGuoaR9zleSEB3XvbuAzC4YlbGcc2ewqroMo5mca
	elLQz7k9lFnDVTTaiyq7QJnP1epkIm6bLx/+8tHS1MbY+FzPSCi6D7CeXDEAktN3z6MLik
	damm9V/imb6ZqferHa0FWI/tlbvfpYFb13iC8CpOjlQyuayo04qb3V5X50TGnXAtd8lT32
	P7DfX8rVNnOgAH7LdRYMxKMxg5azLSvPtJoCumZ8L8D2xNTHcUJ+oRSKbPe7L5BGHHig8S
	5wLVjx41NtZC+lhECott69vlwiFAmIU+oscASzZq5MnIg1rkiS0DxY+xXrQB1Q==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Mon, 10 Feb 2025 14:39:56 -0500
Subject: [PATCH 4/5] iommu/dart: Reject identity domain for locked DARTs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-locked-dart-v1-4-5d97fe247f35@rosenzweig.io>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
In-Reply-To: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=Q2X3fPKVvdzr1B3hHwj4E/4Mk7pqhs1UeDt0uJfgsNE=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnqlYZblhzlpiuLR3xbq+t6xWjNWkzODbgWUFF5
 Fs8N4cPjwOJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6pWGQAKCRD+/lBaCvVY
 DfbXD/9R9X6kCnXTZvOwa5wliwk7U6TDTvgktXgigweVT9oIXCaiqPqOzuaP147ASN3CDzU+Hym
 HkKienPTMPBI8OUUsO7EH/fC9njHeIxIht6fiz1MHV23cmySLs9fgevS0rXk6+JMjQDWviAhbA6
 en0KYZA0ZEe7VRGlgqGZKDhMmwtbOp9QQMOkvNC6UKxQymcwaipOSuG8JZNIDtt5PJZt8zglc6P
 Bst0ZY4KogoLg5lXWoirtipWmtjE6LXFB27ggVATt6OxOTbSp/bgghq9pU7gMlpjtneOQe+BmH4
 KV8FGp6Bsipd11gUJPx+qVLWBc6pTmLmkiJsR4Q4Yt2gDmJC5DEnpX6BB4Zh0Y1lLNQyIvqHOq/
 tFangOvZ2w5JR7pbSNFLVo5A/7Sn3KRT6LZjC8oS5P3WvPTs+v4thCPjx07G9vKLTngzUI+ao2r
 B/L8n1NOusN93T1127AGB/+n+hPeEVxX7xv7rP4xgkpfNMAHqPKjOHFhBwheOBQ25T2e/PJx462
 I2qkNPtIHvCvsJIF5fPaf4HObzeY+quJp7eiGXkqHyQwGvbO3H2CX9dRJkgpjtNLYWUv0Sp0TIg
 OffyZwpGvQHldBCXuxjpnYA1vJP3LVFDf8VSR+O4qpSVoL/IbjYG5gFp1RbbsNPV66svskh0aB8
 mmyCRBY9jh67snQ==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_114029_418128_3972B6F7 
X-CRM114-Status: UNSURE (   8.07  )
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

This cannot work.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/iommu/apple-dart.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 9c6f780dc7220096ed6bba692fa1a4bd859b0d61..29b627b38e8c37afd2b6a72865f43d24b633834a 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -681,6 +681,9 @@ static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
 	if (!cfg->stream_maps[0].dart->supports_bypass)
 		return -EINVAL;
 
+	if (cfg->stream_maps[0].dart->locked)
+		return -EINVAL;
+
 	for_each_stream_map(i, cfg, stream_map)
 		apple_dart_hw_enable_bypass(stream_map);
 	return 0;

-- 
2.48.1


