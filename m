Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA0DC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gr6ROetsJY2cCEly0Qtya6BXvmAkeMOiZVwnUxiS3ZQ=; b=zUHvaBSF1fIIqMz4JFWfAIQODq
	ezl8yCaDcfh+h7iw+Hy5OLEhBTnKfbNb5HeK7ANeQBJd1YdzWpriZufRYsDZNtz1ce1gmxr+9oVR2
	y8Dp60NT2E+6PgFADPlgMRaQNc2d2MUqjCyjxVFrWimSb4LJed9H58+VIc5yU1T5IVuf1kyqTBsPV
	g1gKyi/ex9bVlPjvuai2AH0kpjHbig6RAu5QoZNgceQWxrPtt0W2aI6rOwAovtL48yibobWzOx+lT
	vq9PmFArt+FrIIg8L+9HhkM7jXdOGiQMuf+lmWcyrs7SyITqsAOzCpvj8XXu4dcbmW9aaER0fdrZz
	QRYYr1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqe3w-0000000FSSH-1oIq;
	Fri, 07 Mar 2025 20:12:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdz5-0000000FRZm-3ARE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C711B5C61E8;
	Fri,  7 Mar 2025 20:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12084C4CEE8;
	Fri,  7 Mar 2025 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741378070;
	bh=KA79ZbiEBvPYyWfzjjnUellynBK/ryTNjq2ShoxsjFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IbatuPWVSNByvLc1+CYBlKj/PqfCXXv01QymwjMRJu/N3rxFoUulaWzfHgKPXhZLk
	 wc7j8rKZYZ5CQclCfYnzKFXHBrqEaqiFFWsbsDkKa5ioZtMYfXr9qC/ByWDo4ZTtXl
	 4+dWmZmZi1jfqjfqnejl+d23lkN3vH+XlRAgm3cjEgwyJl+Y9fXJ822A/AkWCxfypV
	 c9MBQwvh7wP4+u/tZTC0XIymnOTIyWZ+dN4PDCifWuxZB20sDwlghqcqJTBKIXaQfk
	 ANb2988indqdM3OOk1dAXIfJyztPczeaQzwWOz5uV4v+iq6AkyyIZ/J0K+VkEienae
	 0QPQD4g4CyrrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0269FC28B27;
	Fri,  7 Mar 2025 20:07:50 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Fri, 07 Mar 2025 21:07:46 +0100
Subject: [PATCH v3 2/2] iommu: apple-dart: Allow mismatched bypass support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-isp-dart-v3-2-684fe4489591@gmail.com>
References: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
In-Reply-To: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741378068; l=2218;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=3aDy2S8QXy8OI20z2hGDfoi8k/VVP4EgGDhon31Nli0=;
 b=kttzfDkZosiRjwEHcNhPQmIYNEUFg22THIwPw0L5LDLgXk/s/Jour4qoEVJ9RHWofnriYfCGE
 D3ru2R4mrUXCVs5ej3ujynhnGtQO4iSbPJvsFLF/CFfPNrplsNJA+Am
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_120751_916348_06F0BB7A 
X-CRM114-Status: GOOD (  14.66  )
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
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/iommu/apple-dart.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index edb2fb22333506d7c64ad1b6321df00ebfd07747..13ccb801f52a4d34f6653f78e92787af7dfed1bc 100644
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
@@ -792,20 +795,24 @@ static int apple_dart_of_xlate(struct device *dev,
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
 
+	cfg->supports_bypass &= dart->supports_bypass;
+
 	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
 		if (cfg->stream_maps[i].dart == dart) {
 			set_bit(sid, cfg->stream_maps[i].sidmap);
@@ -945,7 +952,7 @@ static int apple_dart_def_domain_type(struct device *dev)
 
 	if (cfg->stream_maps[0].dart->pgsize > PAGE_SIZE)
 		return IOMMU_DOMAIN_IDENTITY;
-	if (!cfg->stream_maps[0].dart->supports_bypass)
+	if (!cfg->supports_bypass)
 		return IOMMU_DOMAIN_DMA;
 
 	return 0;

-- 
2.48.1



