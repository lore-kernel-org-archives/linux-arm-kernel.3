Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yCa15UdSNTilz8kPcvrpDVJ1NX5mcsjOV3wxcM11SI=; b=oaSR4MTF8bOIOYL901WnkUCXzN
	yB3M1fVR0rM8Jd8ViiL/bqauz6CdiHp9v6dTCColFq4pB/D7Nsdpj3ZNdPXW82WFcr+Sp79o1XX6c
	KDBIxhb1VXwbU42j0vbY9OrXnK3T+5asKlbMbPfF0WNBhNbLaOKoN/iiFcgpY1aSBDavde1drRkqI
	Ak3UHEDkFkVFONI/h8Ls3JQzyptjF3wZ926AQMkU4/ApN7giYpHLWvVMIVsC4K6sAKRnt/stHm4Dn
	8Rw/YkcgWhlz43GOYBh6NdH5a6N1NbzlmpJ5dqM4/mgOhoU02y5IX2XbL+VRozLW7xD9JuETzI5WZ
	gSWBmKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcRs-0000000BZ5f-2gAW;
	Mon, 06 Jul 2026 06:04:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcRr-0000000BZ5W-2Q7C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:04:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D73C600BB;
	Mon,  6 Jul 2026 06:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553DB1F00A3A;
	Mon,  6 Jul 2026 06:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783317894;
	bh=9yCa15UdSNTilz8kPcvrpDVJ1NX5mcsjOV3wxcM11SI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oaHBKusRrH3Y2ilylkIH9d0RsAMENchHR7eS8HqrdSQJ52O+CCOzBdV6jZddtpdU8
	 /eKWJF9Jsozfx5NaFN/1VAKLrBbhQCjZ4i9jFQhPVnN646zhGad9YWscawBzYx285L
	 klC1SGv1BXQwomDn9gmR2nU7UgHurqliT+s9EflGjDn9G/YhTCoH240yvV2iH5JSLH
	 bUbM2oCK9GDc2EqY91jDshGRPy42N4eWC2K5FK/iPiq+RV1+hIFDB7sYkEhmYDKKkF
	 wpoPscSuZ8IBXD36GnNnULpR0XH42dTAA1jfuadu27cyxx2KMLNuPV8+ZjQOEp9d4m
	 PmguWNr7Mi7jg==
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
Subject: [PATCH v5 01/10] mm/mem_encrypt: Add helpers for shared-buffer alignment
Date: Mon,  6 Jul 2026 11:34:23 +0530
Message-ID: <20260706060432.1375570-2-aneesh.kumar@kernel.org>
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

confidential-computing guests may require shared buffers with alignment
larger than the guest page size. As these buffers are shared with the host,
which may manage shared/private state at a different page-size granularity,
the required alignment must account for the host's page size as well.

Add helpers for querying the shared-buffer granule size and for rounding
sizes up to that granule. The generic implementation defaults to PAGE_SIZE
so that existing architectures keep their current behaviour unless they
override the granule size.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 include/linux/mem_encrypt.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
index 07584c5e36fb..5d2a868f8d3d 100644
--- a/include/linux/mem_encrypt.h
+++ b/include/linux/mem_encrypt.h
@@ -11,6 +11,8 @@
 #define __MEM_ENCRYPT_H__
 
 #ifndef __ASSEMBLY__
+#include <linux/align.h>
+#include <vdso/page.h>
 
 #ifdef CONFIG_ARCH_HAS_MEM_ENCRYPT
 
@@ -54,6 +56,18 @@
 #define dma_addr_canonical(x)		(x)
 #endif
 
+#ifndef mem_cc_shared_granule_size
+static inline size_t mem_cc_shared_granule_size(void)
+{
+	return PAGE_SIZE;
+}
+#endif
+
+static inline size_t mem_cc_align_to_shared_granule(size_t size)
+{
+	return ALIGN(size, mem_cc_shared_granule_size());
+}
+
 #endif	/* __ASSEMBLY__ */
 
 #endif	/* __MEM_ENCRYPT_H__ */
-- 
2.43.0


