Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B9FC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWxLyhgTyl/DhJ72aDVVAmJ5czNKKPxS788lHnLdM1E=; b=ZES41tZAXnYQYSltsRTm2XtlvM
	+aA1LOSokoR4Ez0/E2j+DexZpvcId9N2qKbby4qbzXj6VA7BXGplKJLvASalJIvNfh2Gdp47HvsSW
	TYTI0Q/kzoYUVRXTr2sTciFm9Yn+oiscFHUM+ivw9SgcE3Nte7hKS4+eI4pXIsTLDvHyp3769mVIC
	6E1YLZYeP2LZ9vrJWFO5RdtnbyL3KKfbEXdff/hFK1aJzC7iU81tKpduWbQKk11YG0GT6hxe/HzBb
	2VDW9WdozM4CM8HlybexCPVw6eMTaMfJ4JCuJMuPuLzBDhLlX9b5kGTJ/zd+3gMkzuTwvu+E9z0DD
	VMyrcFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknEM-0000000DuiN-0a7p;
	Wed, 19 Feb 2025 16:47:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8U-0000000DsXN-2Qtj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 16:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DWxLyhgTyl/DhJ72aDVVAmJ5czNKKPxS788lHnLdM1E=; b=hVUrOQ8rucnc7fXLEi0XgX5TVs
	YWF8KL+MEcJNiSLjbdWZntbtqilboni6e5kJSiUL1HLdd+xPco7gdWN6aDpPdJ+l3RUIUQMtrpP8b
	Kpggm9NXbX2MVvS1oNBabFC3XSYdKqThPAN8fKZS2pIEBh7tOze6sRLi1FO521G4ZJvAm3iboCuoN
	k9OA8kxbCG5qI9oWEilxK7NQd84+SXEzvVUrVtZ3kYEKmh/6WkiU8a4Zc4cpttMQHws71OMcrs3a+
	mxRxjiUWqF1PADsjq4bdSn3g8QwhPuH6wxgxTcp87EXLhOMyy4/yIUcjFoMrVuBP80H/2Xv8pze5E
	fPT93PSQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8R-00000002HIH-1jfu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 16:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820B51688;
	Wed, 19 Feb 2025 08:41:35 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BEA23F6A8;
	Wed, 19 Feb 2025 08:41:15 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 1/3] arm64/sysreg: Improve PIR/POR helpers
Date: Wed, 19 Feb 2025 16:40:27 +0000
Message-ID: <20250219164029.2309119-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250219164029.2309119-1-kevin.brodsky@arm.com>
References: <20250219164029.2309119-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_164119_857220_FB6CD53D 
X-CRM114-Status: GOOD (  15.78  )
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

We currently have one helper to set a PIRx_ELx's permission field to
a given value, PIRx_ELx_PERM(), and another helper to extract a
permission field from POR_ELx, POR_ELx_IDX(). The naming is pretty
confusing - it isn't clear at all that "_PERM" corresponds to a
setter and "_IDX" to a getter.

This patch aims at improving the situation by using the same
suffixes as FIELD_PREP()/FIELD_GET(), which we have already adopted
for SYS_FIELD_{PREP,GET}():

* PIRx_ELx_PERM_PREP(), POR_ELx_PERM_PREP() create a register value
  where the permission field for a given index is set to a given value.

* POR_ELx_PERM_GET() extracts the permission field from a given
  register value for a given index.

These helpers are not implemented using FIELD_PREP()/FIELD_GET()
because the mask may not be constant, and they need to be usable in
assembly. They are all defined in asm/sysreg.h, as one would expect
for basic sysreg-related helpers.

Finally the new POR_ELx_PERM_* macros are used for existing
calculations in signal.c and mmu.c.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 36 +++++++++++++--------------
 arch/arm64/include/asm/por.h          |  9 +++----
 arch/arm64/include/asm/sysreg.h       | 10 +++++++-
 arch/arm64/kernel/signal.c            |  2 +-
 arch/arm64/mm/mmu.c                   |  6 ++---
 5 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index a95f1f77bb39..7830d031742e 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -169,25 +169,25 @@ static inline bool __pure lpa2_is_enabled(void)
 #define PAGE_GCS_RO	__pgprot(_PAGE_GCS_RO)
 
 #define PIE_E0	( \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_R)   | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_X_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX_O)  | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_R)   | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_EXECONLY),      PIE_X_O) | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX_O)  | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX_O) | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
 
 #define PIE_E1	( \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R)      | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY),      PIE_R)      | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW)     | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_ROX),    PIE_RX)     | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_EXEC),   PIE_RWX)    | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_RO),     PIE_R)      | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL),        PIE_RW))
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R)      | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R)      | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW)     | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_ROX),    PIE_RX)     | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_EXEC),   PIE_RWX)    | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_RO),     PIE_R)      | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL),        PIE_RW))
 
 #endif /* __ASM_PGTABLE_PROT_H */
diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
index e06e9f473675..e6bf00bd0500 100644
--- a/arch/arm64/include/asm/por.h
+++ b/arch/arm64/include/asm/por.h
@@ -6,26 +6,25 @@
 #ifndef _ASM_ARM64_POR_H
 #define _ASM_ARM64_POR_H
 
-#define POR_BITS_PER_PKEY		4
-#define POR_ELx_IDX(por_elx, idx)	(((por_elx) >> ((idx) * POR_BITS_PER_PKEY)) & 0xf)
+#include <asm/sysreg.h>
 
 static inline bool por_elx_allows_read(u64 por, u8 pkey)
 {
-	u8 perm = POR_ELx_IDX(por, pkey);
+	u8 perm = POR_ELx_PERM_GET(pkey, por);
 
 	return perm & POE_R;
 }
 
 static inline bool por_elx_allows_write(u64 por, u8 pkey)
 {
-	u8 perm = POR_ELx_IDX(por, pkey);
+	u8 perm = POR_ELx_PERM_GET(pkey, por);
 
 	return perm & POE_W;
 }
 
 static inline bool por_elx_allows_exec(u64 por, u8 pkey)
 {
-	u8 perm = POR_ELx_IDX(por, pkey);
+	u8 perm = POR_ELx_PERM_GET(pkey, por);
 
 	return perm & POE_X;
 }
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 05ea5223d2d5..c9ce4ce5131c 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1062,8 +1062,11 @@
 #define PIE_RX		UL(0xa)
 #define PIE_RW		UL(0xc)
 #define PIE_RWX		UL(0xe)
+#define PIE_MASK	UL(0xf)
 
-#define PIRx_ELx_PERM(idx, perm)	((perm) << ((idx) * 4))
+#define PIRx_ELx_BITS_PER_IDX		4
+#define PIRx_ELx_PERM_SHIFT(idx)	((idx) * PIRx_ELx_BITS_PER_IDX)
+#define PIRx_ELx_PERM_PREP(idx, perm)	(((perm) & PIE_MASK) << PIRx_ELx_PERM_SHIFT(idx))
 
 /*
  * Permission Overlay Extension (POE) permission encodings.
@@ -1078,6 +1081,11 @@
 #define POE_RXW		UL(0x7)
 #define POE_MASK	UL(0xf)
 
+#define POR_ELx_BITS_PER_IDX		4
+#define POR_ELx_PERM_SHIFT(idx)		((idx) * POR_ELx_BITS_PER_IDX)
+#define POR_ELx_PERM_GET(idx, reg)	(((reg) >> POR_ELx_PERM_SHIFT(idx)) & POE_MASK)
+#define POR_ELx_PERM_PREP(idx, perm)	(((perm) & POE_MASK) << POR_ELx_PERM_SHIFT(idx))
+
 /* Initial value for Permission Overlay Extension for EL0 */
 #define POR_EL0_INIT	POE_RXW
 
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 99ea26d400ff..bf6226256549 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -91,7 +91,7 @@ static void save_reset_user_access_state(struct user_access_state *ua_state)
 		u64 por_enable_all = 0;
 
 		for (int pkey = 0; pkey < arch_max_pkey(); pkey++)
-			por_enable_all |= POE_RXW << (pkey * POR_BITS_PER_PKEY);
+			por_enable_all |= POR_ELx_PERM_PREP(pkey, POE_RXW);
 
 		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
 		write_sysreg_s(por_enable_all, SYS_POR_EL0);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b4df5bc5b1b8..69a83a77ccce 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1557,7 +1557,6 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
 {
 	u64 new_por = POE_RXW;
 	u64 old_por;
-	u64 pkey_shift;
 
 	if (!system_supports_poe())
 		return -ENOSPC;
@@ -1582,12 +1581,11 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
 		new_por &= ~POE_X;
 
 	/* Shift the bits in to the correct place in POR for pkey: */
-	pkey_shift = pkey * POR_BITS_PER_PKEY;
-	new_por <<= pkey_shift;
+	new_por = POR_ELx_PERM_PREP(pkey, new_por);
 
 	/* Get old POR and mask off any old bits in place: */
 	old_por = read_sysreg_s(SYS_POR_EL0);
-	old_por &= ~(POE_MASK << pkey_shift);
+	old_por &= ~(POE_MASK << POR_ELx_PERM_SHIFT(pkey));
 
 	/* Write old part along with new part: */
 	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
-- 
2.47.0


