Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFE7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjoB3wqNejEdyCazSUYDlve5k375sL88kLeO0+FLp9k=; b=RYZVye+xX83m1YP0iLMPSfPpQB
	VutVzX7HFX4fx0T/HBMZzIWfQJ1HArkAbFb6uH7taEunLe9L5xqlKiU1l9Rtyu2usQYTPNmhIcDFe
	LQi4p0QtN9kfSqeVygrx0ubV0X6VfY9/dcbQ8If35DYY5vVyquhLO7ev1dg6dZCR1EMkiGxycpxRs
	d+2or/15r+mw9RmoVRkLAj22kutpHQUfz9GBqRGWI0ySFBKJLkjlx8SPEOa6krOJ0SYSVPKHs5tj5
	ti2fNixAAAnBX4RKqZ/JdC6ALh8qHdLG6DY/NRC0LQ4JCHXf2b7CIK4+agrhw3XgLszUBwaPW+Yi4
	yckjRC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7g5Y-0000000BpQL-3FgW;
	Wed, 23 Apr 2025 19:48:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fza-0000000BoQl-2qK8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2F716113B;
	Wed, 23 Apr 2025 19:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FD4C4CEE8;
	Wed, 23 Apr 2025 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437365;
	bh=unEvAgjEXaifATfQLY+rUlEDDFjsnO4G5ZkCTJbRQE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VIjZU/QpUi50/IPulSmOpn4kWiFWTDG3gcinh++VKxhR0g3SnwhE5VxJ/GFzGnHHe
	 chTGuKVY/RVqQ2+ptgJuzbncEHvSYeh5XibbcYG5uqp5eDcvD9FFN41cCbDVEY/gyH
	 hrG1wheiB6Z/TJIlLaj6REEInD8RiRVU7LObwgdTi3G16jRgbdW+mYVT+GMGO4i3EU
	 zJ8hxmKd15iZmkvAASb5LMaMvheK9A9GT4iNst9LrPx7w0+hsnxtf82eK+jQIYfRLL
	 y9phE2/T5rX6btTzGxZNWwl54yPEsJeiUp3NPnoz0qUTNNE1U5Unz+xJO5YnupYsOD
	 UQECtDvjOsWwg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:14 -0500
Subject: [PATCH v2 2/4] of: Simplify of_dma_set_restricted_buffer() to use
 of_for_each_phandle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-dt-memory-region-v2-v2-2-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
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
v2:
 - Maintain prior behavior only warning if
   of_reserved_mem_device_init_by_idx() fails
---
 drivers/of/device.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 5053e5d532cc..c80426510ec2 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -35,44 +35,35 @@ EXPORT_SYMBOL(of_match_device);
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
+		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
+		    of_device_is_available(it.node)) {
+			if (of_reserved_mem_device_init_by_idx(dev, of_node, i))
+				dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
+			of_node_put(it.node);
 			break;
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
 }
 
 /**

-- 
2.47.2


