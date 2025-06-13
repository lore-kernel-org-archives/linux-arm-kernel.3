Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E9C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAlqrQQWbkbvoKidTObvE+rQ7hlZuZeeP7MKyw+1b4A=; b=leY+guugV7A87mVGkB0lsj82Zs
	+JZuy/Ojp+gZ8UH2xjHEaxBfqMmpSwYsuwn7Igoj8qSmSlM9WiuswTwbKHOSIJGwEi0AS2J/kgeGP
	Yrq6v3B5gVwXFLSFKa9D8Ul1p1VPCpx1dsQdbRssEWgrR6fwrioKckXj7J/qyOJQ4LG0ytdYE00gX
	irsRO1OT3xwoTw7cefU+6gL2mOFGs8BcvIfQzUfpj7kaz3z5OPiJ+5je0MLScdMNt7luuvWpRgjFZ
	Tv/+8mxrMFLmHarCQhWQU0fCWU4O6MXQKW/rVQq/nHefVRp1Z/Xt/xZYMtc1ebGmeDl417K8YrFrn
	JDmZ/ySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2dR-0000000GCZg-2hmU;
	Fri, 13 Jun 2025 11:31:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2Kc-0000000G8sC-3rr7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:12:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA9E1D14;
	Fri, 13 Jun 2025 04:12:01 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 284E63F59E;
	Fri, 13 Jun 2025 04:12:21 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	sami.mujawar@arm.com,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH 1/3] arm64: realm: ioremap: Allow mapping memory as encrypted
Date: Fri, 13 Jun 2025 12:11:51 +0100
Message-ID: <20250613111153.1548928-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613111153.1548928-1-suzuki.poulose@arm.com>
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_041223_044868_185215BF 
X-CRM114-Status: GOOD (  15.77  )
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

For ioremap(), so far we only checked if it was a device (RIPAS_DEV) to choose
an encrypted vs decrypted mapping. However, we may have firmware reserved memory
regions exposed to the OS (e.g., EFI Coco Secret Securityfs, ACPI CCEL).
We need to make sure that anything that is RIPAS_RAM (i.e., Guest
protected memory with RMM guarantees) are also mapped as encrypted.

Rephrasing the above, anything that is not RIPAS_EMPTY is guaranteed to be
protected by the RMM. Thus we choose encrypted mapping for anything that is not
RIPAS_EMPTY. While at it, rename the helper function

  __arm64_is_protected_mmio => arm64_rsi_is_protected

to clearly indicate that this not an arm64 generic helper, but something to do
with Realms.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/io.h  |  2 +-
 arch/arm64/include/asm/rsi.h |  2 +-
 arch/arm64/kernel/rsi.c      | 26 ++++++++++++++++++++++----
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 9b96840fb979..82276282a3c7 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -311,7 +311,7 @@ extern bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
 static inline bool arm64_is_protected_mmio(phys_addr_t phys_addr, size_t size)
 {
 	if (unlikely(is_realm_world()))
-		return __arm64_is_protected_mmio(phys_addr, size);
+		return arm64_rsi_is_protected(phys_addr, size);
 	return false;
 }
 
diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index b42aeac05340..88b50d660e85 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -16,7 +16,7 @@ DECLARE_STATIC_KEY_FALSE(rsi_present);
 
 void __init arm64_rsi_init(void);
 
-bool __arm64_is_protected_mmio(phys_addr_t base, size_t size);
+bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
 
 static inline bool is_realm_world(void)
 {
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index ce4778141ec7..c64a06f58c0b 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -84,7 +84,25 @@ static void __init arm64_rsi_setup_memory(void)
 	}
 }
 
-bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
+/*
+ * Check if a given PA range is Trusted (e.g., Protected memory, a Trusted Device
+ * mapping, or an MMIO emulated in the Realm world).
+ *
+ * We can rely on the RIPAS value of the region to detect if a given region is
+ * protected.
+ *
+ *  RIPAS_DEV - A trusted device memory or a trusted emulated MMIO (in the Realm
+ *		world
+ *  RIPAS_RAM - Memory (RAM), protected by the RMM guarantees. (e.g., Firmware
+ *		reserved regions for data sharing).
+ *
+ *  RIPAS_DESTROYED is a special case of one of the above, where the host did
+ *  something without our permission and as such we can't do anything about it.
+ *
+ * The only case where something is emulated by the untrusted hypervisor or is
+ * backed by shared memory is indicated by RSI_RIPAS_EMPTY.
+ */
+bool arm64_rsi_is_protected(phys_addr_t base, size_t size)
 {
 	enum ripas ripas;
 	phys_addr_t end, top;
@@ -101,18 +119,18 @@ bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
 			break;
 		if (WARN_ON(top <= base))
 			break;
-		if (ripas != RSI_RIPAS_DEV)
+		if (ripas == RSI_RIPAS_EMPTY)
 			break;
 		base = top;
 	}
 
 	return base >= end;
 }
-EXPORT_SYMBOL(__arm64_is_protected_mmio);
+EXPORT_SYMBOL(arm64_rsi_is_protected);
 
 static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 {
-	if (__arm64_is_protected_mmio(phys, size))
+	if (arm64_rsi_is_protected(phys, size))
 		*prot = pgprot_encrypted(*prot);
 	else
 		*prot = pgprot_decrypted(*prot);
-- 
2.43.0


