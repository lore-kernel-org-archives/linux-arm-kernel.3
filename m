Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A6C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdjsjsW7gTao4JGqSdtTZcqDO/daSds2ybCp3eONEAQ=; b=FMf5ZNo8yK9/s3wiYD133nr2zc
	Q8VV0l3KtaBa5SrYPgoTd1riEbGz+OYE+HYBqRvPc3GURpPaoMXnBNK5PJ84Lu1T3c7cS0hXNi7th
	B5OZhEVfn5IVIO2Ax9+XHjSfTS/K4Al3tyT/N/F3EqAQCMfzJ9ANcFM3o3KgUkJ2WQLfAw1l7los3
	G2/7SECWPXS6oYNHveA5tlxnbG87yzpGJxmutjgoQ1yZshvj4bYZPxBr9R3B85hcGj7xZK4QPyr64
	8DjbGYolTJh8PtJDZJDaLYjA8WXvAi4ds3aaXxeJABCMYPF/xgrudx+G+2+gnAfVD0pBPR8P3rJ8N
	1+KM69Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGk-00000001ggB-2taL;
	Fri, 04 Sep 2026 10:35:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGi-00000001gea-2dc1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6185A43E23;
	Fri,  4 Sep 2026 10:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5E11F00A3D;
	Fri,  4 Sep 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518136;
	bh=zdjsjsW7gTao4JGqSdtTZcqDO/daSds2ybCp3eONEAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NtwiJQNmBfj5pcFUU1SRjet42Lr3ykAyOTfvl5s/CFq27c/0PRf0StcdZDxH3Jb66
	 oMa/1VFXy+THz5WtX9Pv5+h/lZn1yVb1miLtQLueNchM3UqjnE8VK+Lrp9l8AdqKG8
	 bxVd8V1DQEGLD8bexSfbqdXI6iyLTuIH8wDGSAwK8kwaQ9uKl0OHcZEqWNnogotGfr
	 HkMLklu1eRbRSlU9OD4TNxiqb7nuVI7K4we3NHhhEAXsMr/X0F6r/bG8zokaU052sc
	 nUxUgwa4LAVh8ideLSiv7yVMlmqQKLqib2U2W8a7Yeju2fuk3BXmeyM4Mvo2cuQ5sE
	 3E2H3TV5eC4Sw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 6/9] swiotlb: Reject misaligned restricted DMA pools for CoCo guests
Date: Fri,  4 Sep 2026 16:04:49 +0530
Message-ID: <20260904103452.1197239-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Restricted DMA pools are described by firmware reserved-memory nodes and
are not resized or realigned by the kernel. For confidential-computing
guests, such pools can only be shared safely when both the base address and
size are aligned to the shared-granule size.

Reject restricted DMA pools that are not aligned to
mem_cc_shared_granule_size() when guest memory encryption is active.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/swiotlb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f8936b03d942..d1bd06be628d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -2037,6 +2037,20 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 		 * if platform supports memory encryption,
 		 * restricted mem pool is shared by default
 		 */
+		if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+			size_t cc_shared_granule_size = mem_cc_shared_granule_size();
+
+			if (!IS_ALIGNED(rmem->base, cc_shared_granule_size) ||
+			    !IS_ALIGNED(rmem->size, cc_shared_granule_size)) {
+				dev_err(dev, "Restricted DMA pool must be aligned to %#zx bytes for memory encryption\n",
+					cc_shared_granule_size);
+				kfree(pool->areas);
+				kfree(pool->slots);
+				kfree(mem);
+				return -EINVAL;
+			}
+		}
+
 		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
 			int ret;
 
-- 
2.43.0


