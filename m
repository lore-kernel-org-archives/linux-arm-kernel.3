Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C229CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yCa15UdSNTilz8kPcvrpDVJ1NX5mcsjOV3wxcM11SI=; b=4KkQs23MqaoarDbyyy/LFJS49r
	43ilhPcOej6HBtKe8/3Qa2bOEVR74OcyHSEK5FiaRV7cXZDDL+4N0Ogon+5cRjDeowjVu4naKQqPP
	uCnbmB/aiTWfXPt5hgbN74qVGnIUkocNbMETRnMyy9iq9sHhRjZaZijQAPZaOEwxKJc1cT6LBdSpO
	m1Q6WWARbM26nnr3OX3or/WoryH7Be8481AeziJVHjPa/UUpCJtLbTtKlXff4CTqHGAAYjhesdnn/
	5bEbOxcap4RDhvRvs321rIzVVMeSXlzS/4KjHRDm+3SPcukDaD+TUQ2nhxKaAVCDT+vXmwTDA0zsu
	1/xrcNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGI-00000001gOR-1x7b;
	Fri, 04 Sep 2026 10:35:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGG-00000001gNK-0YNq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5E0C43C0E;
	Fri,  4 Sep 2026 10:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D771F00A3E;
	Fri,  4 Sep 2026 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518107;
	bh=9yCa15UdSNTilz8kPcvrpDVJ1NX5mcsjOV3wxcM11SI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n94gtNfOXVpib0FqSMswq4TJBhowKoamIh5esJxUMOLzRML4Wqd1va+BRLyrw3z2E
	 U7iZ7+4+mSvkdsg+XUxTcqYqdrv0DrxyDD1z/DaqmpozjfuLGwzmO25MIPzaKQ2GRv
	 K1S6acdrKeUdBr8WovRoqksDi1FhGnIexXoMkND7W6o2/sltKmjYduLX2V8kOl3WMU
	 XS3xEmJxv40hNvlY0ZXuyS3nu8mJtmiPFWvXgv5xcFI8LcNjHfW4sfPUCWKlFdg0un
	 1jyXlYdDI+RIIEOfvHVrW+Wt3/mP2rJ2W3bqQ7nu9NaWkuCigAD/tYQW7+B6PvjVpz
	 nE/SJ2oK8+Kcg==
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
Subject: [PATCH v6 1/9] mm/mem_encrypt: Add helpers for shared-buffer alignment
Date: Fri,  4 Sep 2026 16:04:44 +0530
Message-ID: <20260904103452.1197239-2-aneesh.kumar@kernel.org>
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


