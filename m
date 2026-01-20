Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDD8D2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMHvdme6k2EpGG6bd1DqWMGYdejAUqqTn9P7OB9FPU0=; b=kTQLkY1aTq25CtxaoujcZW/jJS
	+pI8H4BaUWNRulcwv00yT3nVFCTWae9oeBU1Odcxxpe2B6xc7072I3jih79GjzvqDGfPIQosaiP/0
	caJ1kNcFmTCej1mCDG2vduSoPFA007JjC/iU9antpqgmZIBISL4iHL7eslno+XkZa7A2q9hseEtB6
	2yLX7uSaqpu0hnNFN20rp5LLpsYEU37RNhnY8T30ETP1cCYwpxc0cFRm+q3bnJUv/UXyomLO+qKMp
	R2glz6gEFGhjlJHsjGmZZp3ul49y5Q9gq/0vpwdHxk5rotQkZxByJGNsHrorB0AcEUg2DrsyOwZQB
	C3E2uQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5jz-00000003JwD-1LH2;
	Tue, 20 Jan 2026 07:01:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5jv-00000003JvO-2Bda
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 07:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D15D1400EA;
	Tue, 20 Jan 2026 07:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5FBC16AAE;
	Tue, 20 Jan 2026 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768892481;
	bh=Ka2VmzEd9yItw/Rs1DcMA39bphAvE5HWx2Aao3EwXjs=;
	h=From:To:Cc:Subject:Date:From;
	b=h5W5hgNsxyxwQdq8nNyCppH5wxO+ejIAuT+vvDykcH5xl3sGiW7mMyoruOJWOdp1m
	 NE/7NzT1SewLuSkLJQOadlfN2fo9MD5ip3v/u6F3CpM4bLneD/8nEUeiq6RHsAQRJg
	 YHfjjpqelvigz1jRWo+EIZz6gzk4Tmh+MS0zmvHXYSWTky3olccqcBYsBw7mggawsX
	 Xykr24qlby4gufIxI8XDA3E/4ur2GVP0KAQ8VfAUNwKhYy6e84q+6CNvzuYTZeILk3
	 MGvrUlaCvimcgNowPjGBQgUwCktIoLALg3FnymZrDGIlQBseFSDd2+5NlCkRAzYi70
	 OA2ZycH7U789g==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH] arm64: swiotlb: Don’t shrink default buffer when bounce is forced
Date: Tue, 20 Jan 2026 12:31:02 +0530
Message-ID: <20260120070102.182977-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_230123_580692_9CD56E20 
X-CRM114-Status: GOOD (  13.42  )
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

arm64 reduces the default swiotlb size (for unaligned kmalloc()
bouncing) when it detects that no swiotlb bouncing is needed.

If swiotlb bouncing is explicitly forced via the command line
(swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
query the forced-bounce state and use it to skip the resize when
bouncing is forced.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/mm/init.c    | 3 ++-
 include/linux/swiotlb.h | 7 +++++++
 kernel/dma/swiotlb.c    | 5 +++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 524d34a0e921..7046241b47b8 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -345,7 +345,8 @@ void __init arch_mm_preinit(void)
 		flags |= SWIOTLB_FORCE;
 	}
 
-	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
+	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
+	    !(swiotlb || force_swiotlb_bounce())) {
 		/*
 		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
 		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3dae0f592063..513a93dcbdbc 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -185,6 +185,7 @@ bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
 phys_addr_t default_swiotlb_base(void);
 phys_addr_t default_swiotlb_limit(void);
+bool force_swiotlb_bounce(void);
 #else
 static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
 {
@@ -234,6 +235,12 @@ static inline phys_addr_t default_swiotlb_limit(void)
 {
 	return 0;
 }
+
+static inline bool force_swiotlb_bounce(void)
+{
+	return false;
+}
+
 #endif /* CONFIG_SWIOTLB */
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0d37da3d95b6..85e31f228cc9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1646,6 +1646,11 @@ phys_addr_t default_swiotlb_base(void)
 	return io_tlb_default_mem.defpool.start;
 }
 
+bool force_swiotlb_bounce(void)
+{
+	return swiotlb_force_bounce;
+}
+
 /**
  * default_swiotlb_limit() - get the address limit of the default SWIOTLB
  *
-- 
2.43.0


