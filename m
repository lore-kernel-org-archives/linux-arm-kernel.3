Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30294C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mDRZjsUoooCKSx6+cGErtBppIOM6woSiVm/h9NK9rw=; b=oxkC4X3RqQNpLzVHLThfCThn6g
	kZVgGG6vI5RALzHuIHOLQGTQr/eV61LJW/Lab13SSuub8DDTdKAqcuZqBR+o13/LP6JVSDXa2EiXk
	fg0thHP/h63j4CH3H/n0QJEvJGtMvJubc6jlqE7XbDDzTeifLhF0uLPGK8DXxc47KYEn6jZaS0ahm
	xuLIw2PRbvbMTp1aeejVkpvc9G1zKGqKjo5zrzVGD0Z4WTww+qlPfLvKixZHOskUXcBpAtk1BcgRf
	+pvDlLudpptGAuMnFhcS+VV8E1RIRO0ClTk2rIM7BPZqnAc3KmjDPSs/Mi8ty0rmF19xfXTMpHABQ
	OVxxZugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSS-0000000BZLI-0uvg;
	Mon, 06 Jul 2026 06:05:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSR-0000000BZKk-07Pc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:05:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7922F60018;
	Mon,  6 Jul 2026 06:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D011F000E9;
	Mon,  6 Jul 2026 06:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783317930;
	bh=2mDRZjsUoooCKSx6+cGErtBppIOM6woSiVm/h9NK9rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mLdnhD1kG8xgRaq7xeKn+0Jdkzs3dhgyB9D6ZWISaKFEAjULs9ky4Wg1vFAJPeu5Q
	 NG67xdOLMrKAaRb6VOAcys684HHW3a01occrLAafreV+9XqK9iXtg9aoZhuKOLkWkd
	 StTEZtqTz3zGzUFEJnAUgOoG5Ff2scGN5lvUf5zpWNq9OIYYT1wxRKm8cyNrQZjlrn
	 Pi9XVtWAqSSSkhlwyJvd9lnHHRgNP/cAG3ORvmkbghTTPek3BPQ1qqmWCiOHiHiW/Z
	 vZ7gGgp8NkG3rOHWHjPVgKzL+l6slZez3B/WhGSJbztUaKWDwTe1pHNg8U9HOIu3R9
	 YrIQoaI6WI/6w==
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
Subject: [PATCH v5 06/10] swiotlb: Reject misaligned restricted DMA pools for CoCo guests
Date: Mon,  6 Jul 2026 11:34:28 +0530
Message-ID: <20260706060432.1375570-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
References: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
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
index 1d77746b6f31..ad8a1ccf3977 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -2002,6 +2002,20 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
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


