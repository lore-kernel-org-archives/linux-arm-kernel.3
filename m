Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FF6C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q3Fs+FI8nKUbkSPnfF+C1Vd7WakoexD0IrqitTstL+w=; b=WnZk+BdrG3AqFSxblsbKc5a7vj
	JdlawxIKoVzWlG4m9US2b265XzeJ4Pe5T0otDwnJK4HG87Nt5t4MHR2gRH3RgNo7RVSufU1mZIase
	EEGvcHUOM0cU5R50up4hAhJX8pUtU/uaxzAFk8JH7ZODS5x2+LZJzNxyB5AqYjVPAwz8MHWcI+OiT
	eWUIJMnyUsK1i12A40sdK8k4JaYXGWd8yW/i+RwbfSi7N/dnRrlpC6B7yxkVwzNKtn/x7UwKGQiRV
	1GlEE1+8OSi+1mwfsSKGkSdFH3i3iA7BqcBBTuQutKdKgwybYzVBjvQwUlUlszzV8vK0UqFPhznmG
	aBepZubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSJB-0000000CiDG-1W95;
	Thu, 03 Jul 2025 22:21:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOmX-0000000CFay-0fnB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCFDA448EB;
	Thu,  3 Jul 2025 18:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C6FC4CEEB;
	Thu,  3 Jul 2025 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567736;
	bh=4IQJmfRPn5wOvf8eRJE9LC5lIdjzqxsiARifvlsXhAk=;
	h=From:To:Cc:Subject:Date:From;
	b=l5PR6d7ij5o2bBnv3i4c24V4q+HIAjYLh8cszOeCWYjKOpgo79o6h5WGPGnTDygOH
	 yC3XzD7djv814c0IMAcvcPSBvtTEt0cAc2+0+qQCXyJ+J8qweyrqKeVsuVxnimTs8b
	 Zo5+AuLmBPopJ1DBv+2vcFWhvKowclDkkjEPJmPu8+AURPigEHktPShNgkVQyC8W4q
	 etaA28PNFdeHpmTibqbndNc+6tFSft3fyuQZxVVfwMhexKN3COovYk9onNeqZ7JoYe
	 TbUU92VGOj3rrchpEMeWYpj1vlmSGolyHJFn4/sMeVvnj3TPw0vYg0+hN6h74DAlPC
	 pVv96QlPCJAcQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwtracing: coresight: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:33 -0500
Message-ID: <20250703183534.2075569-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113537_217907_492093D1 
X-CRM114-Status: GOOD (  13.03  )
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6be..be964656be93 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/coresight.h>
 #include <linux/amba/bus.h>
 #include <linux/platform_device.h>
@@ -634,25 +635,14 @@ static int of_tmc_get_reserved_resource_by_name(struct device *dev,
 						const char *name,
 						struct resource *res)
 {
-	int index, rc = -ENODEV;
-	struct device_node *node;
+	int rc = -ENODEV;
 
-	if (!is_of_node(dev->fwnode))
-		return -ENODEV;
-
-	index = of_property_match_string(dev->of_node, "memory-region-names",
-					 name);
-	if (index < 0)
-		return rc;
-
-	node = of_parse_phandle(dev->of_node, "memory-region", index);
-	if (!node)
+	rc = of_reserved_mem_region_to_resource_byname(dev->of_node, name, res);
+	if (rc < 0)
 		return rc;
 
-	if (!of_address_to_resource(node, 0, res) &&
-	    res->start != 0 && resource_size(res) != 0)
-		rc = 0;
-	of_node_put(node);
+	if (res->start == 0 || resource_size(res) == 0)
+		rc = -ENODEV;
 
 	return rc;
 }
-- 
2.47.2


