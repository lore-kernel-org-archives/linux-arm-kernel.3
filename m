Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7711EC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 03:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti2AV9H5OmIhJ7TBtoRF1uJCfDGB9x29ksYhj+T6ayk=; b=JdBPXphoYbKHmiCYsAqAFblz/y
	+GSOpxoM8xDSnscsTNiNl5rksTYzW3bKwIHTQMbjgZAx5uinpxxbH5TEbVnCw9UKSddv9i4MCCT+I
	83Ea20B0w3V2+mT6ZOQPhi1KtRXEgTvqg7RIH8GQwSNZpsetLyGZSIytvUxqcQyULtat3qeWlLKyC
	CAWuy5Y9cco/ywKx9FxGctEnPgECbXaX9bcEvTjfl0q+MZbxos+CDLPwaFAt0a6RH/uX13uHMDW7q
	ftniHtPazIYeDg+KbaLFPQwARytpAYedn159Lqx7BiE+8fe5/gqAk4jtAUoUrZ2mWYpdVw1irc8r5
	59PWB5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkvTr-00000003b0F-3rT3;
	Sat, 18 Jul 2026 03:12:47 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkvTo-00000003axV-3FGL;
	Sat, 18 Jul 2026 03:12:45 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id E77471380329;
	Fri, 17 Jul 2026 23:12:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jul 2026 23:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784344363; x=
	1784347963; bh=ti2AV9H5OmIhJ7TBtoRF1uJCfDGB9x29ksYhj+T6ayk=; b=m
	rHUy57RU3yJfHtoSAa8dmztzxjJNo/DSFk6M/1p8LO64gv6aWeMiDV1nW1gkboo9
	cuydNQ3o3dan11sI5BJmKqwuB3WBeGPZv7UtsSPtNyjqYWBXr7RbRwcaJMPG2oFR
	G/qg/waI6i7awe4k2Y7JKeeGUrqxPrHAuiS1VN8XXBtW1g4UOuKH9CTd1UXugv8G
	+coeHV627lGLO61JwMmmq1p2EdKfH+TO5NJsm003zEAVyfSjU4vS6C0e0X8s3jlv
	vpVaSkbaHjM5o35mnjqDFs4QOXhzK3rwDwlkJGhtO4PNBYW/JLE570PlIrIjIPkM
	lJ4ddaxGTk3Em5/RY9K2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784344363; x=1784347963; bh=t
	i2AV9H5OmIhJ7TBtoRF1uJCfDGB9x29ksYhj+T6ayk=; b=Mu3/T3SDKYIG5E1Ww
	cMv6MgUyY0dBx5//6LGjtO6oa8LLv/CGq4h+G6TkA6sTmNa5qKZpfh/dEsjwSS4C
	XY9Ha0tUYruyjcE2KItGwKqS0FXNmEv7P3dnJkZb8bo92L0G1Z8IpoOZUlTaHr9W
	verneyOxBo2KNCHUY686atqLtEBExrl4u2MVq/DlRsEZTqrZCBX4gU5C5R2K41nF
	awb8d0DMaCTpcXqc5tXrDbHUW7kZc5AA7IwQUbrJNHAfrUaEhGHicpuaV0af7jSy
	P6MUTD19c2NrDvPh5GTRLBchMYGtCvtx7FxgZzsTEW7tOXFFGU/FWNfJv7QfQ4dJ
	iRqdw==
X-ME-Sender: <xms:K-9aaooqKbnQA0th5hh3L2ggqqM79pLEG8NmZreDtcs2Evq8bK76kg>
    <xme:K-9aavDMBYCG7C0demDuIOYnV6HCTbpVgzE_Th_z6wLF4rHv0Yu5A0JCccd5WiDWU
    mGX-yBHqdiIC5rBOf-ImPfFmHbyJ15eV7_fF-vBz-1kk9YOs5nr9bk>
X-ME-Received: <xmr:K-9aauXvkUQ3ZMiynFTUn97A_oAoBjvzuhBlF-QCerW1LX3G7rvlWPGkte6KYGmtbQ_I-y4frXUDwvf8-9U>
X-ME-Proxy-Cause: dmFkZTEMX89gCC44dqObrbulQ/I2vRcOyTSU2dL37a8Nf+rFxjy5PE8WS5gpE9RXw7+0PS
    yxUIuQ6gupe5zEJJchZQE4bKfFbHmQL7INM15u9ExRdXgkO57kNGwURGa++uDEBsULgTHI
    t0ZbzRzarKEWrP6K0r8ac4f1j9EfeJOBqZIOuHi65D2zEb8+Hr9A3pyCOeN8z68LWwn2cR
    nBEqlZGvm1NlJl0MtKgrU7cphGYeMLoNKly7LudZuf9EOf4mYb3xk/iIY0lHGtBrmlZsu6
    7UYsbLPlBovD5Ne0jETTe/ihY/4xpQnFOtQR8dx/YbbAYNmrYk14/xo0JBShoHg0ykTlOm
    z6ziJ2x85LrhfqPRXEIb73dow6FbHcETwOp5vjRuyDMBfforhzhRyfoONUHmoJ5eQInyho
    cxMpmoDqRAF3JoVP7ZzCQ+7dsYrEtyjHm7D4oJEsE4vQXtY8qm2/QyO5isUo85nZjTM44b
    s9Xo47f051dOil6peHJ/Ov0+6BvDZULKtseyuLNoMpC1SPPPxQ9bbXc6LrI8P93VVzM4eI
    JWdPPuzlnhnIO3uay8gkxOykB8G7JubSmFI3dzweVt39ojR1BrJRgn6ekuyUryHxHBWhFx
    tkOWt+/psBfVRWR5vEYKmVqhSr6LnfbWddRF0DPWrFI/9Z+SoEwM6RkNlKoQ
X-ME-Proxy: <xmx:K-9aar6TmKrE9XsLUjpksI5mviE5xoLw_TjmLuaUyoCcrhp4745KPQ>
    <xmx:K-9aanCgCkpiOgj0FLj9vbpZbAaud_qS8bcwoDuS5bvDhLnGlM8ctA>
    <xmx:K-9aaoCXpsSBW0OWfu_1YO5X2yZbtq36odX4zzAoWFcj7Pl7QJQr0A>
    <xmx:K-9aavgeMVfydrQOQLiKPseka-6p3yi2FoXlhgZ_Fdq3mvCYcYPeUA>
    <xmx:K-9aar91DddQnFrlenV0-KpDInPLj0l43OF7cJ9wCb_PdSn5UHbwycpX>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 23:12:36 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org
Cc: chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v2 4/8] iommu/rockchip: take all DT clocks
Date: Sat, 18 Jul 2026 15:11:42 +1200
Message-ID: <20260718031146.3368811-5-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718031146.3368811-1-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_201244_887744_36FA24B0 
X-CRM114-Status: GOOD (  14.11  )
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

rk_iommu only enabled a fixed {aclk,iface} pair.  On the RK3576 NPU the
MMU sits behind the CBUF/DSU gates, so writes to DTE_ADDR are silently
dropped until those clocks run too (reads work, writes need more clocks).
Use devm_clk_bulk_get_all() to take every clock the devicetree provides
instead of a fixed pair, so a platform can list the full set it needs.
Clocks stay optional for the older clock-less devicetrees.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/iommu/rockchip-iommu.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 0013cf196..62cd6b022 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -93,11 +93,6 @@ struct rk_iommu_domain {
 	struct iommu_domain domain;
 };
 
-/* list of clocks required by IOMMU */
-static const char * const rk_iommu_clocks[] = {
-	"aclk", "iface",
-};
-
 struct rk_iommu_ops {
 	phys_addr_t (*pt_address)(u32 dte);
 	u32 (*mk_dtentries)(dma_addr_t pt_dma);
@@ -1246,25 +1241,20 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	iommu->reset_disabled = device_property_read_bool(dev,
 					"rockchip,disable-mmu-reset");
 
-	iommu->num_clocks = ARRAY_SIZE(rk_iommu_clocks);
-	iommu->clocks = devm_kcalloc(iommu->dev, iommu->num_clocks,
-				     sizeof(*iommu->clocks), GFP_KERNEL);
-	if (!iommu->clocks)
-		return -ENOMEM;
-
-	for (i = 0; i < iommu->num_clocks; ++i)
-		iommu->clocks[i].id = rk_iommu_clocks[i];
-
 	/*
-	 * iommu clocks should be present for all new devices and devicetrees
-	 * but there are older devicetrees without clocks out in the wild.
-	 * So clocks as optional for the time being.
+	 * Take every clock the devicetree provides.  Most IOMMU instances
+	 * need exactly "aclk" + "iface", but e.g. the RK3576 NPU IOMMUs sit
+	 * behind additional gates (CBUF/DSU) whose clocks must be running
+	 * for register writes to land.  Clocks stay optional because there
+	 * are older devicetrees without clocks out in the wild.
 	 */
-	err = devm_clk_bulk_get(iommu->dev, iommu->num_clocks, iommu->clocks);
+	err = devm_clk_bulk_get_all(iommu->dev, &iommu->clocks);
 	if (err == -ENOENT)
 		iommu->num_clocks = 0;
-	else if (err)
+	else if (err < 0)
 		return err;
+	else
+		iommu->num_clocks = err;
 
 	err = clk_bulk_prepare(iommu->num_clocks, iommu->clocks);
 	if (err)
-- 
2.43.0


