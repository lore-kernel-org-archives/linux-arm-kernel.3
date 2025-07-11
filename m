Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C835C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pF2ilvzgigORaz6Bo1QuhE62TmEJP1XtLmZc5o40K1E=; b=tXy6Qlvo7CDeKY5sCiNpe6D8bK
	+NdCwE8lp5kFvbMOuQg73ryynSfz/1c6ct9uNFrA2/q7W3WJByEWRELaZa1V4smJabbp0t3f3BnjH
	0Zh+pE0JribsXcIz18CjsVhXy3JOgWPjSwFlsjif8p0gKHFNJ3x/He5DkOZ53v/U2BHBtEw69QVFx
	4LnmC6S0wnrqBzQkBGUzielHSr6EIoqN+xM0bKa47kjh9wM7xCbFYrk0EEAQWxfrrVgKi6v4axqM5
	Ts8xFJNpvw4uOcLUoaM8Fy/cg1taRhlR/DZ8Zev2U9HyvMmXcv0P+FyqEcg7/btWrEp1nga9Acmen
	TJcm/hCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaId4-0000000FXEH-3pZi;
	Fri, 11 Jul 2025 18:37:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaITd-0000000FVUK-15UZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:28:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A95F16F8;
	Fri, 11 Jul 2025 11:27:54 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70C1B3F694;
	Fri, 11 Jul 2025 11:28:03 -0700 (PDT)
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
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 3/3] arm64: cacheinfo: Provide helper to compress MPIDR value into u32
Date: Fri, 11 Jul 2025 18:27:43 +0000
Message-Id: <20250711182743.30141-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711182743.30141-1-james.morse@arm.com>
References: <20250711182743.30141-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_112805_335320_B3D5134D 
X-CRM114-Status: GOOD (  14.82  )
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
Reviewed-by: Gavin Shan <gshan@redhat.com>
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


