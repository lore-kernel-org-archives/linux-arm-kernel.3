Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79722E87846
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQyv24/iXdQ2aRdQ2HpqyQ52xvrvAW0EJ7tcYz/lItk=; b=L/RcpaUfkyOThyNMIwgNN7sOav
	EYzMBKu19ECVS1YgxM+0CpJUP8Y95LjZkqhS2jEH33+uv801RGY5wksna0jrUmEVg+dMjOaHEGp0k
	DdxcEXLfM3yCmZoV4TtQJXPiqksooE69x9XBWxpecvqniPFF7OqVo7J37LbfhiUHzLPZ3BdqCPA2m
	yOzz15K19hztzcwKZ4AKQaCyipFIYWO1E+G1K3pcs8iycVuYBkw65UoKGhW6jLTCXBLy537JJaA3l
	eb8q0SJKEa4ESPj5ewHqDcfzs8AOeEum0FPXAwnFLsgtCo1PhYZLiRECFmYp1stjSIoSc1fEu0E3h
	QZBs4jxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJCY-00000006wbn-0mZ1;
	Tue, 03 Feb 2026 16:24:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJCW-00000006wYT-0CAU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EA6C429EF;
	Tue,  3 Feb 2026 16:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67218C16AAE;
	Tue,  3 Feb 2026 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135865;
	bh=8NKPdRGnNXMEdz6SK51aPIBdadbt+NTxQ5tH5rjBnLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MaUjymV4lKdPf0XW+6SntLKjqRu0SDylDV87yaAezrkqan0kKNSBHX779dFlqpeQH
	 FYhIfLq5kq5KszvVkPnx0PHf3l15PcMZIVUgs0J6Yq+4d+hAtwCy0yj00Mw4kuIf3c
	 kNVfliAXcz4lqQSy32MHVXv7mwLZWtGN6hVn6imLl9F6pUW+ExsN3UrvXI/Bn6UtWK
	 DSHsp6w8Z9Xsh6QPHfipea6LeSd4dZh7u3TVVsZeyljiBZhTf3H8xZUPYfCfb2nbQN
	 2FfoIUVILOtvCm9ceEcjJgtGjp8HPYY2hFXlmeSA+X5SHOE8cbIZtle9RYq7ivoNqd
	 PtWit4mC/NaAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] [RFC] iommu: io-pgtable-arm-v7s: avoid gcc-16.0.1 section mismatch
Date: Tue,  3 Feb 2026 17:24:00 +0100
Message-Id: <20260203162406.2215716-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260203162406.2215716-1-arnd@kernel.org>
References: <20260203162406.2215716-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082428_184615_70E47519 
X-CRM114-Status: GOOD (  15.84  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-16 has gained some more advanced inlining techniques that enable
it to inline the dummy_tlb_add_page() and dummy_tlb_flush() function
pointers into a specialized version of __arm_v7s_unmap:

WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)

From what I can tell, the transformation is correct, as this
is only called when __arm_v7s_unmap() is called from
arm_v7s_do_selftests(), which is also __init.

I have not come up with a good workaround, so this simply marks
dummy_tlb_add_page() as not __init. Since there are currently only two
files where this happens, that may be an easy way out.

If anyone has a better idea for how to deal with that, let me know!

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 523355e91a2c..705885924afb 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -775,23 +775,23 @@ struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
 
 #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST
 
-static struct io_pgtable_cfg *cfg_cookie __initdata;
+static struct io_pgtable_cfg *cfg_cookie;
 
 static void __init dummy_tlb_flush_all(void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 }
 
-static void __init dummy_tlb_flush(unsigned long iova, size_t size,
+static void dummy_tlb_flush(unsigned long iova, size_t size,
 				   size_t granule, void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
 }
 
-static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
-				      unsigned long iova, size_t granule,
-				      void *cookie)
+static void dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
+			       unsigned long iova, size_t granule,
+			       void *cookie)
 {
 	dummy_tlb_flush(iova, granule, granule, cookie);
 }
-- 
2.39.5


