Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D19AC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGYawXsFxtfcTKVlpDc+Ke46BWKOapo3rEvB7gvYYrk=; b=xY0Jho1KHh8tIYbMi9wGUZmD5n
	lL63OcQjo9w4EOXSKaxjgQb+MM2Mps3FO7vfqKTZn7NQ7YTs4xpHlMpacP4ErFoviqonXJUroCFFP
	z896xtZVqUKSQMyFfCQuQNzorzGqrHMDHMCpKuSXV/Uu6ur7k375LmgYaGqLV3mEQbi02vvKjNsft
	usn+0sAiqKof7ET5Z5lHj32K+jM72U3ncV75UsUycfOAO/I1FlW7EZwVOKcHQUJ41gNaz+cIBx+tv
	qfmk+nCZjkxLso6aTa3Ak0DltIkxMsHolK3Blmy71uxp9tNE39un4UKUCOc7sHV81RV9sxjThRGtm
	5ZXLQEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8BN-0000000C5tA-3b1Q;
	Thu, 20 Aug 2026 19:12:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8BM-0000000C5sa-4Ad4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F47E4391F;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CDC8C2BCFB;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787253128;
	bh=FClt2rXZfpheNKgojWzXtNzlVz6kIXUmUxfCqnurlQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K8ZO7HpnJU8dJkDP7rMbPNU6BEe9coezE1NuY6A+PMdpR9SHdHO5QpiSZ2OcnNKxn
	 rpD69lypdibG8FMcZZ+BrEvBGBLs/zffIZ1skw1LYYvLz8yEKnYiraMae0tyl5Z9c3
	 mR2mqg45/xv1fCv2n7ghjyn9n00DeOXvsrJn1+LKJ0yW+Gz8ZVciVZmjqDy+XTMIjd
	 3frmvOUJP3FEv9uE25Te/hHqII6tw9p9BcCdwgg2dnOGm7Py4tCXR3NnGJmVpnPpue
	 V8CIvuJpnHHLSiTYdR9ea8CkA3haAVhsvtMqE3E4bSLhonqTSMNQ1ny7G4LHBlxpSa
	 LeiFOA16UomMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668F8C5DF8C;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
From: Markuss Broks via B4 Relay <devnull+markuss.broks.gmail.com@kernel.org>
Date: Thu, 20 Aug 2026 22:12:06 +0300
Subject: [PATCH 2/4] iommu/exynos: fix the enable sequence for no-block
 SysMMUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-exynos-iommu-fixes-v1-2-6bbcd673bb15@gmail.com>
References: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
In-Reply-To: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787253126; l=1548;
 i=markuss.broks@gmail.com; s=20260803; h=from:subject:message-id;
 bh=K4btCYT7ezjlx6H4fapioD7ShFs/jWpvk5zQdk+w7+8=;
 b=eWfEM667DBzpg9cwP+89xFePRCc5Xqc6CdWKOSqJyauS4P76wUs+9H76z2L5zWlaTjSRxLcuD
 8bTDvt94nd4AEmQKh38tilyh8prRWFXzKOGzlp4YWDUx7VO7+47Egjo
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=oKzGUTm30BCDqinRMpiHQqByOx1mp2mwmhg80Mv7Zg4=
X-Endpoint-Received: by B4 Relay for markuss.broks@gmail.com/20260803 with
 auth_id=911
X-Original-From: Markuss Broks <markuss.broks@gmail.com>
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
Reply-To: markuss.broks@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Markuss Broks <markuss.broks@gmail.com>

__sysmmu_enable() writes CTRL_BLOCK before programming CFG, the page
table base and the VM registers. CTRL_BLOCK has the enable bit set,
so on hardware without BLOCK mode this write immediately starts
translation with whatever FLPT base the registers hold: reset values
on the first enable, a stale page table on re-enable. A master that
is already emitting traffic at that point gets its transactions
translated through that garbage.

Keep the MMU disabled while it is being programmed on such hardware;
the final CTRL_ENABLE write then brings it up with a consistent
configuration in one step, which is also the same as the vendor driver
sequence.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 0319da9fd831..a3a59d8a4cf1 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -655,7 +655,12 @@ static void __sysmmu_enable(struct sysmmu_drvdata *data)
 	__sysmmu_enable_clocks(data);
 
 	spin_lock_irqsave(&data->lock, flags);
-	writel(CTRL_BLOCK, data->sfrbase + REG_MMU_CTRL);
+	/*
+	 * On no-block hardware CTRL_BLOCK acts as a plain enable; keep the
+	 * MMU disabled until it is fully programmed.
+	 */
+	if (!data->no_block)
+		writel(CTRL_BLOCK, data->sfrbase + REG_MMU_CTRL);
 	__sysmmu_init_config(data);
 	__sysmmu_set_ptbase(data, data->pgtable);
 	__sysmmu_enable_vid(data);

-- 
2.55.0



