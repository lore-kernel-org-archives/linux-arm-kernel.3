Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64B8C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9FjnS113Bee+s6RQg4ZO22zZAEtN/uZhHRlnUSx64o=; b=MgWliQ+ctsrL7OjHEs5irh8wwC
	KtL8y2NyTdjBw9Hu4x598G5vKiQ/Y177KOfEdJaey4mntEXz8eDPy2FK1+RDHttvm9GyGu3LBlS+e
	KgcrxOy0Qscpo14LBZOYs0uGNJCfQ+adpK/PDaVp4FbaMAy/HUlqnlkgj6HOh8Ie6TWTywbLaOo02
	r67CU0ehxGfAlxZCbA3Ece9KsxXbHSD0D/GQG+dMklBGC875JmbCbo4hve2eKyG80DqmY8+7o+HQm
	WKYe084lTBJxgHWateUU1RHRhFLCtXO41F5hxqd5lYA2dNkAuNk79xAYtphDCeDsjOojvx/Azx7su
	I6di255A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjja-00000008YWY-1WXI;
	Thu, 27 Feb 2025 19:39:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhBB-0000000890a-0m7G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F08B761F39;
	Thu, 27 Feb 2025 16:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 185F3C4CEE8;
	Thu, 27 Feb 2025 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740675368;
	bh=7HnH0tkGi++tfrMg4A08fP3/JgYCMXFck9UdnyuZJUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=udyyN6QF3gJwdGi82uRXy1tzgOU7TXWlRPmdUlftb9igMmTr9KWTJHIVQdQCP0xjC
	 p9zo264hg3iIvw3m3l7l0v5+qjAn36NUP/DPGXJ6v+GBvVXW770vxgLJuZPIr6d5ca
	 zfyMSVLGdv9e3RNF2R/Rdt2S0bjkgVJ3ZPUgQNEn7OAMdNq6IG+g+Rnu0qmZuhLuax
	 JqTZckq5slG6yr4FLb8yNNL8PEb6yVZxkSS3CJal8ufMtzF3ejs2IqQXwAhvpfoGmd
	 QIRXRJBC+/yzR8jS1TnRRmaoJBICCBZKUef1bhKBsxTII8XFXNrT6TsbXG/8460pUk
	 2IybkQuOlVzUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08632C282C6;
	Thu, 27 Feb 2025 16:56:08 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 27 Feb 2025 17:56:04 +0100
Subject: [PATCH 2/2] iommu: apple-dart: Allow mismatched bypass support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-isp-dart-v1-2-161e91ef4f46@gmail.com>
References: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
In-Reply-To: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740675366; l=2179;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=oluYR6lIJ3W34r9MjQqDF6TqqSgqgYrQRwERY4BEI9Q=;
 b=eSN3v9XIi1argWNG7Tks59zvBzP73SHZjZmG7g7vHKGjGjGTcH8kxslRl9ra2VlQRsSOi+cNx
 TvD1Mx+i6jVD/mlzanTcUEi2j/UABzguTp0j3oJDjvGU15w3aEgz8t6
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

This is needed by ISP, which has DART0 with bypass and DART1/2 without.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/iommu/apple-dart.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index edb2fb22333506d7c64ad1b6321df00ebfd07747..a41ad0627be003f2b0ce42a128c3b04bb2537d56 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -277,6 +277,9 @@ struct apple_dart_domain {
  * @streams: streams for this device
  */
 struct apple_dart_master_cfg {
+	/* Intersection of DART capabilitles */
+	u32 supports_bypass : 1;
+
 	struct apple_dart_stream_map stream_maps[MAX_DARTS_PER_DEVICE];
 };
 
@@ -684,7 +687,7 @@ static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
 	struct apple_dart_stream_map *stream_map;
 	int i;
 
-	if (!cfg->stream_maps[0].dart->supports_bypass)
+	if (!cfg->supports_bypass)
 		return -EINVAL;
 
 	for_each_stream_map(i, cfg, stream_map)
@@ -792,20 +795,25 @@ static int apple_dart_of_xlate(struct device *dev,
 		return -EINVAL;
 	sid = args->args[0];
 
-	if (!cfg)
+	if (!cfg) {
 		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
+
+		/* Will be ANDed with DART capabilities */
+		cfg->supports_bypass = true;
+	}
 	if (!cfg)
 		return -ENOMEM;
 	dev_iommu_priv_set(dev, cfg);
 
 	cfg_dart = cfg->stream_maps[0].dart;
 	if (cfg_dart) {
-		if (cfg_dart->supports_bypass != dart->supports_bypass)
-			return -EINVAL;
 		if (cfg_dart->pgsize != dart->pgsize)
 			return -EINVAL;
 	}
 
+	if (!dart->supports_bypass)
+		cfg->supports_bypass = false;
+
 	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
 		if (cfg->stream_maps[i].dart == dart) {
 			set_bit(sid, cfg->stream_maps[i].sidmap);
@@ -945,7 +953,7 @@ static int apple_dart_def_domain_type(struct device *dev)
 
 	if (cfg->stream_maps[0].dart->pgsize > PAGE_SIZE)
 		return IOMMU_DOMAIN_IDENTITY;
-	if (!cfg->stream_maps[0].dart->supports_bypass)
+	if (!cfg->supports_bypass)
 		return IOMMU_DOMAIN_DMA;
 
 	return 0;

-- 
2.48.1



