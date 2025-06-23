Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E35C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7kuVokWEyEF9d9ayk3nUYco45ae5orMCXOmUYHhDvPU=; b=SCibehnjZugmIZ411u+QNWZJz2
	NLN5Fh52n6+4UAJPtBWejk7l3gCeViIDBkn1F5+V1Qv4w8VI+2bwu87x00/oPb3VnXDJ2c3zyo2+m
	0x5t4ZhfXxapawnrbT3ZkygJlw/+K6dSWe3ACuWmjDdL9maGATb2biRnu7mHT1983QdleSZQjki/n
	D7qWm/Ay3bQ4YkD9DJmmrUrZpNthzQ/hqcBsRhNxxprt2aJyBe2fwo99bZJ9FEp/rtInEDweh5JFM
	rHdPNIuc/ZEnhtCdQgl2/gxpmC36QOwMCEYk6kdNkuzvKCBW9XGgTxkWYs+6gjrhgO+cguEkDeoEe
	BmDeSI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlJW-00000003bkq-1vUv;
	Mon, 23 Jun 2025 17:50:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi6f-000000032VS-1syl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:25:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E55945C5DBA;
	Mon, 23 Jun 2025 14:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086A2C4CEF0;
	Mon, 23 Jun 2025 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688708;
	bh=DwatPil1kiw2bB7RdLdxAbx2UQPaiRT/izcYQBaKOfc=;
	h=From:To:Cc:Subject:Date:From;
	b=UEHrMkC3+xLCc/uMAggm8K8LStm1DhGUy+I3ZaXIGQxzEN6zZtkPtkrjaMwHLk/5y
	 v7TI5rDex2dj62GjVKOA0Y11gyDRuflWHIWkdV4zvkZjuQLkTthi/RXt61Q6NJyq1A
	 hidq+ShB35cxwjKB7qOAphK08WcPUAk2r8OJ4Z8tzZ9xtPBuRZlj7lmaspN/BBJfgI
	 0+d6pRVksueRECDVCR+ugPbzk9ZEDYehs2n2LNUFlGGoic+3r6I5YuOYR6FPUaXV81
	 BOBUNgRogFL3Mhc2VHrO5r/MmW9kAuVjBO4Q3BcteLCeaEQqPMekCBrkoppeLy80ZD
	 8xCC5Y+FbUuqQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uTi6Z-0000000060g-0XlU;
	Mon, 23 Jun 2025 16:25:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
	Georgi Djakov <djakov@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] interconnect: exynos: handle node name allocation failure
Date: Mon, 23 Jun 2025 16:24:37 +0200
Message-ID: <20250623142437.23068-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_072509_527601_CA753537 
X-CRM114-Status: GOOD (  10.21  )
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

Add the missing error handling in case node name allocation ever fails.

Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/interconnect/samsung/exynos.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/interconnect/samsung/exynos.c b/drivers/interconnect/samsung/exynos.c
index 9e041365d909..8e8f56186a36 100644
--- a/drivers/interconnect/samsung/exynos.c
+++ b/drivers/interconnect/samsung/exynos.c
@@ -134,6 +134,11 @@ static int exynos_generic_icc_probe(struct platform_device *pdev)
 	priv->node = icc_node;
 	icc_node->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn",
 					bus_dev->of_node);
+	if (!icc_node->name) {
+		icc_node_destroy(pdev->id);
+		return -ENOMEM;
+	}
+
 	if (of_property_read_u32(bus_dev->of_node, "samsung,data-clock-ratio",
 				 &priv->bus_clk_ratio))
 		priv->bus_clk_ratio = EXYNOS_ICC_DEFAULT_BUS_CLK_RATIO;
-- 
2.49.0


