Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5AAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/s+gGcz6+xNOJGHO1I/6CjF3gZYSbDgTKOtrUWssss=; b=aNZY2lRAGhYEkfGHxYbI45YGTy
	Uumnrs7qpPFGrg99nLENQQSm5TCpqydEpg/jqkQHLwv+D6C2mgsp8JgVodDeDF/TZYRWUsuvVAjfW
	3YDHEdlpOW2WCTlN3T2YQD5DzL4sSX0UIK0ZSAJfUo8OEGcUD0wyiDB62GjcvLIITaSHt4hS3iirQ
	dbRm0zhSNn/RBAfLBwdl6CNVmtszTyG4GyhzhogeZP77+hnnEjWSlaJRfGDhuFM4ZtQkBUdTmc9bR
	Dq6zax8XJupPiyf9uqxK+qzU6kgOSVRXyXZV/GCXVJtoYePtE3fmAs2WcXz3GlgoHK8tTrglROIXS
	cqGWW++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJtw-00000004Boo-21wF;
	Mon, 17 Mar 2025 23:29:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJp0-00000004BLp-0nFI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 23:24:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B33C85C5759;
	Mon, 17 Mar 2025 23:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16309C4CEE3;
	Mon, 17 Mar 2025 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742253877;
	bh=ntMn2ITUTPUhGAIqv6TVX+CHm+RKieyU9jYM8nDojVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtBxQCHGCCUfaRKilodwzCHd2KyUvLLbflwi3znhIMfAIrEogRngrjwN/2zDHaKhV
	 1m6cYo+M8AMILvzXmBYO9M10VyotHIYJAuh4uxpRb2aMlv8+eM9t+9etq4BtmxvQKI
	 piDkWV/+jKEzbGPvLHqPwvU5Q/UO4zGBLaVwLR5ZGHfzbf+7IpMiw98f3jxusNhKs9
	 DPBTjiLsnlvLK3/Q/J0R4/GcKUo+pSLhtE5gfyPs4kHjQ6uTgJplaOolCUbN368oZe
	 okHiCMB22lQNevyhqZko759YeC5aonjysf6ArbpbLKCx0haWFwc8/5B2fkqyJqNBae
	 RTQWIdonPVVUQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
Date: Mon, 17 Mar 2025 18:24:22 -0500
Message-ID: <20250317232426.952188-3-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317232426.952188-1-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_162438_336421_E40C170D 
X-CRM114-Status: GOOD (  14.07  )
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

Simplify of_dma_set_restricted_buffer() by using of_property_present()
and of_for_each_phandle() iterator.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/device.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index edf3be197265..bb4a47d58249 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
 static void
 of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
 {
-	struct device_node *node, *of_node = dev->of_node;
-	int count, i;
+	struct device_node *of_node = dev->of_node;
+	struct of_phandle_iterator it;
+	int rc, i = 0;
 
 	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
 		return;
 
-	count = of_property_count_elems_of_size(of_node, "memory-region",
-						sizeof(u32));
 	/*
 	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
 	 * the OF node having DMA configuration.
 	 */
-	if (count <= 0) {
+	if (!of_property_present(of_node, "memory-region"))
 		of_node = np;
-		count = of_property_count_elems_of_size(
-			of_node, "memory-region", sizeof(u32));
-	}
 
-	for (i = 0; i < count; i++) {
-		node = of_parse_phandle(of_node, "memory-region", i);
+	of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
 		/*
 		 * There might be multiple memory regions, but only one
 		 * restricted-dma-pool region is allowed.
 		 */
-		if (of_device_is_compatible(node, "restricted-dma-pool") &&
-		    of_device_is_available(node)) {
-			of_node_put(node);
-			break;
+		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
+		    of_device_is_available(it.node)) {
+			if (!of_reserved_mem_device_init_by_idx(dev, of_node, i)) {
+				of_node_put(it.node);
+				return;
+			}
 		}
-		of_node_put(node);
+		i++;
 	}
 
-	/*
-	 * Attempt to initialize a restricted-dma-pool region if one was found.
-	 * Note that count can hold a negative error code.
-	 */
-	if (i < count && of_reserved_mem_device_init_by_idx(dev, of_node, i))
-		dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
+	dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
 }
 
 /**
-- 
2.47.2


