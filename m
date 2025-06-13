Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E755EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0LFMuqHXWkTJ4awf4idaEKlfDmyGmIUrKjvtKYZTok=; b=WSZCW3ShCdjrwZ6DluZ7nKA6O3
	fP56taP+whYnPlcGvtqOHlMRJO31j8np299D7tFEGjFBI5kxqHjLh2t9rsrohjOlJUwLRJkpOQ+As
	vKsXOAhNHHkckvw+O6kx3TGs+U39R9C0ZrWX5IKLGHmszjsTafq0Ktfg0xJGChOD2KDj/snj+dJEZ
	leACJS/2a4n7xlc9mjndjrEyj/t+54HrJl6HSIhWYUqO7Usjr7ek9PZL3XxaDJnHqSOpOIHl21/nw
	U0BQ37M+F7FY0pcwXgkasxc/gEtkWPH9s/fPxZV1R65WCAEnCH/Yqt7P5gdVbJM1zfAT+3MjF9OwO
	yBw0GwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4Dp-0000000GT3w-35Pa;
	Fri, 13 Jun 2025 13:13:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ44v-0000000GRvZ-0CsP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:04:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F8A41CDD;
	Fri, 13 Jun 2025 06:03:56 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 609623F59E;
	Fri, 13 Jun 2025 06:04:15 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 3/5] arm64: cacheinfo: Provide helper to compress MPIDR value into u32
Date: Fri, 13 Jun 2025 13:03:54 +0000
Message-Id: <20250613130356.8080-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_060417_131214_6A0A3089 
X-CRM114-Status: GOOD (  14.21  )
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
---
 arch/arm64/include/asm/cache.h | 14 ++++++++++++++
 arch/arm64/kernel/sleep.S      |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 99cd6546e72e..f8798dc96364 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -42,6 +42,7 @@
 
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
+#include <asm/suspend.h>
 #include <asm/sysreg.h>
 
 #ifdef CONFIG_KASAN_SW_TAGS
@@ -87,6 +88,19 @@ int cache_line_size(void);
 
 #define dma_get_cache_alignment	cache_line_size
 
+/* Compress a u64 MPIDR value into 32 bits. */
+static inline u64 arch_compact_of_hwid(u64 id)
+{
+	u64 aff3 = MPIDR_AFFINITY_LEVEL(id, 3);
+
+	/* These bits are expected to be RES0 */
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
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..ebc23304d430 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -50,6 +50,7 @@
 	lsr	\mask ,\mask, \rs3
 	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
 	.endm
+
 /*
  * Save CPU state in the provided sleep_stack_data area, and publish its
  * location for cpu_resume()'s use in sleep_save_stash.
-- 
2.39.5


