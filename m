Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ2dBFghlAXfrUpuust14xZsCtKSfXDmHz+MLMhKZlM=; b=gdIynxcI9KhOeTdZU5DdFikdnj
	YcfUj/Qw9fqPv2QVEeFDgThdLU9udmCHsSnNwxuWwZYszNe1DhpuLYoBOmspPt6De3dhSXoF4aPQj
	yOgcjcPomZl0NTNgnv4u5oZzMf3oRZDlDysF1Qy3yEeNlitSKWgvXlvJEhTy0kI8LYlZfz6gvGc+d
	M21XXFyquhj420Zs+VYJ/Ex38xAzW4T/oNsGHeVPKkgDHWoWaniORdDwin6SAeVKt3TqXdwLmdi6t
	VB2mVuHVh2+fNP96Mg6TeIdetGNsWllnrrPUkhtWDIAk/5iKJ37YvhT1i5QvtJZHRIi2JHxFxJxl/
	iZwzN2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksJ4-0000000FNao-03XD;
	Wed, 19 Feb 2025 22:12:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksGA-0000000FMZB-2fCf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:09:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74EA153B;
	Wed, 19 Feb 2025 14:09:55 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B9793F6A8;
	Wed, 19 Feb 2025 14:09:35 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	catalin.marinas@arm.com
Cc: maz@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH v2 1/3] dma: Fix encryption bit clearing for dma_to_phys
Date: Wed, 19 Feb 2025 22:07:49 +0000
Message-ID: <20250219220751.1276854-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219220751.1276854-1-suzuki.poulose@arm.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_140938_714531_CEAD7C99 
X-CRM114-Status: GOOD (  12.59  )
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

phys_to_dma() sets the encryption bit on the translated DMA address. But
dma_to_phys() clears the encryption bit after it has been translated back
to the physical address, which could fail if the device uses DMA ranges.

Hopefully, AMD SME doesn't use it. Anyways, let us fix it, before cleanup
the infrastructure for supporting other architectures.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Link: https://lkml.kernel.org/r/yq5amsen9stc.fsf@kernel.org
Cc: Will Deacon <will@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 include/linux/dma-direct.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index d7e30d4f7503..d20ecc24cb0f 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -101,12 +101,13 @@ static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	phys_addr_t paddr;
 
+	dma_addr = __sme_clr(dma_addr);
 	if (dev->dma_range_map)
 		paddr = translate_dma_to_phys(dev, dma_addr);
 	else
 		paddr = dma_addr;
 
-	return __sme_clr(paddr);
+	return paddr;
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
-- 
2.43.0


