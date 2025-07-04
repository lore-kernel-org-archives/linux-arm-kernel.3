Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AC9C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKfe5tVOLWCJaJDex6l3qnCQYVKo+kdFKG9FdUEXfpY=; b=Jb+diLjClN37Ci9XJUNLvSF6ug
	b9RMPuW3A6FPVf+3VDUrPxxOGLWsEHAhJh5vS7xwfnqL2rLwLr98zzjKXKrofsFG+BOkoGtzf4KNc
	hzM8aax6wTinniujsF056eAjbVyLWdQ9NCu7fqAFRywRG/h4rtlCcJLtBp1jzFrtOp9fYpLCUu0Cv
	xF6GRxkb2t1g063SalGL6yuZgQhQv3bHWOGguqQ9/jZGuUNh5kzGJu5Y16V48iOVEM9eCmuZj6LKZ
	Edwhw4tTLRkqo33YlbR0fQy5ovKmkE6MzIdut7mxeLgm/O70t7hE+yNV1rBCQffZg86IEo9B5RvjQ
	KfsrQD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkX6-0000000F8xf-3hxi;
	Fri, 04 Jul 2025 17:49:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkNF-0000000F78P-0bGf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:38:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B39D302D;
	Fri,  4 Jul 2025 10:38:42 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6C873F66E;
	Fri,  4 Jul 2025 10:38:54 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	WillDeaconwill@kernel.org,
	James Morse <james.morse@arm.com>
Subject: [PATCH v2 3/3] arm64: cacheinfo: Provide helper to compress MPIDR value into u32
Date: Fri,  4 Jul 2025 17:38:26 +0000
Message-Id: <20250704173826.13025-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250704173826.13025-1-james.morse@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103857_227253_8A05996A 
X-CRM114-Status: GOOD (  14.89  )
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

Filesystems like resctrl use the cache-id exposed via sysfs to identify
groups of CPUs. The value is also used for PCIe cache steering tags. On
DT platforms cache-id is not something that is described in the
device-tree, but instead generated from the smallest MPIDR of the CPUs
associated with that cache. The cache-id exposed to user-space has
historically been 32 bits.

MPIDR values may be larger than 32 bits.

MPIDR only has 32 bits worth of affinity data, but the aff3 field lives
above 32bits. The corresponding lower bits are masked out by
MPIDR_HWID_BITMASK and contain an SMT flag and Uni-Processor flag.

Swizzzle the aff3 field into the bottom 32 bits and using that.

In case more affinity fields are added in the future, the upper RES0
area should be checked. Returning a value greater than 32 bits from
this helper will cause the caller to give up on allocating cache-ids.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
Changes since v1:
 * Removal of unrelated changes.
 * Added a comment about how the RES0 bit safety net works.
---
 arch/arm64/include/asm/cache.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 99cd6546e72e..09963004ceea 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -87,6 +87,23 @@ int cache_line_size(void);
 
 #define dma_get_cache_alignment	cache_line_size
 
+/* Compress a u64 MPIDR value into 32 bits. */
+static inline u64 arch_compact_of_hwid(u64 id)
+{
+	u64 aff3 = MPIDR_AFFINITY_LEVEL(id, 3);
+
+	/*
+	 * These bits are expected to be RES0. If not, return a value with
+	 * the upper 32 bits set to force the caller to give up on 32 bit
+	 * cache ids.
+	 */
+	if (FIELD_GET(GENMASK_ULL(63, 40), id))
+		return id;
+
+	return (aff3 << 24) | FIELD_GET(GENMASK_ULL(23, 0), id);
+}
+#define arch_compact_of_hwid	arch_compact_of_hwid
+
 /*
  * Read the effective value of CTR_EL0.
  *
-- 
2.39.5


