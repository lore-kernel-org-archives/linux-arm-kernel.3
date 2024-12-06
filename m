Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5383BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0mOxBustPxojlu+qPM7wRKUHEpzeQd+SLH4Hfq3xaM=; b=WpO+SUsyQlxDqRsceOwpH5ESPs
	006v2VaqV684rxYJ9MpOaM7XMu8E5fQ3lhNkK5aAXlzlUpu2qHaLeS5sqYheZLZgd7TdEPm02oQY8
	gFG/m9PKBRtsLTVtmRmHlhdYEgS7f/KVZf/8tyimBksP6Xo7Dp102nwj2MndF7jkqmNpImQJ3R29J
	M7o4AOWCDQJvL48i54rDxwamvjzKY9k5Wfx/NiDbwbC7gSvK1qrMIcknmttQd0gUaPVRWOGZJGD1v
	+t+lzEtqJyNFrc0E9bcqL6Ftd1TQk6RrehYXtrgDPXJ5o0cQgePLWW/nSIbnJu7EqKq9faeJb8SiU
	m3WVxTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVPq-00000001F6K-2hCV;
	Fri, 06 Dec 2024 10:18:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVKw-00000001DDz-1HJM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:13:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8224512FC;
	Fri,  6 Dec 2024 02:13:53 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98E183F71E;
	Fri,  6 Dec 2024 02:13:22 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	jannh@google.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	kees@kernel.org,
	maz@kernel.org,
	pierre.langlois@arm.com,
	qperret@google.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH 04/16] arm64: Introduce por_set_pkey_perms() helper
Date: Fri,  6 Dec 2024 10:10:58 +0000
Message-ID: <20241206101110.1646108-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021326_381102_1E999A2C 
X-CRM114-Status: GOOD (  11.83  )
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

Introduce a helper that sets the permissions of a given pkey
(POIndex) in the POR_ELx format, and make use of it in
arch_set_user_pkey_access().

Also ensure that <asm/sysreg.h> is included in asm/por.h to provide
the POE_* definitions.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/por.h |  9 +++++++++
 arch/arm64/mm/mmu.c          | 28 ++++++++++------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
index e06e9f473675..7f0d73980cce 100644
--- a/arch/arm64/include/asm/por.h
+++ b/arch/arm64/include/asm/por.h
@@ -6,6 +6,8 @@
 #ifndef _ASM_ARM64_POR_H
 #define _ASM_ARM64_POR_H
 
+#include <asm/sysreg.h>
+
 #define POR_BITS_PER_PKEY		4
 #define POR_ELx_IDX(por_elx, idx)	(((por_elx) >> ((idx) * POR_BITS_PER_PKEY)) & 0xf)
 
@@ -30,4 +32,11 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
 	return perm & POE_X;
 }
 
+static inline u64 por_set_pkey_perms(u64 por, u8 pkey, u64 perms)
+{
+	u64 shift = pkey * POR_BITS_PER_PKEY;
+
+	return (por & ~(POE_MASK << shift)) | (perms << shift);
+}
+
 #endif /* _ASM_ARM64_POR_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e2739b69e11b..20e0390ee382 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1554,9 +1554,8 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 #ifdef CONFIG_ARCH_HAS_PKEYS
 int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
 {
-	u64 new_por = POE_RXW;
-	u64 old_por;
-	u64 pkey_shift;
+	u64 new_perms;
+	u64 por;
 
 	if (!system_supports_poe())
 		return -ENOSPC;
@@ -1570,26 +1569,19 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
 		return -EINVAL;
 
 	/* Set the bits we need in POR:  */
-	new_por = POE_RXW;
+	new_perms = POE_RXW;
 	if (init_val & PKEY_DISABLE_WRITE)
-		new_por &= ~POE_W;
+		new_perms &= ~POE_W;
 	if (init_val & PKEY_DISABLE_ACCESS)
-		new_por &= ~POE_RW;
+		new_perms &= ~POE_RW;
 	if (init_val & PKEY_DISABLE_READ)
-		new_por &= ~POE_R;
+		new_perms &= ~POE_R;
 	if (init_val & PKEY_DISABLE_EXECUTE)
-		new_por &= ~POE_X;
+		new_perms &= ~POE_X;
 
-	/* Shift the bits in to the correct place in POR for pkey: */
-	pkey_shift = pkey * POR_BITS_PER_PKEY;
-	new_por <<= pkey_shift;
-
-	/* Get old POR and mask off any old bits in place: */
-	old_por = read_sysreg_s(SYS_POR_EL0);
-	old_por &= ~(POE_MASK << pkey_shift);
-
-	/* Write old part along with new part: */
-	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
+	por = read_sysreg_s(SYS_POR_EL0);
+	por = por_set_pkey_perms(por, pkey, new_perms);
+	write_sysreg_s(por, SYS_POR_EL0);
 
 	return 0;
 }
-- 
2.47.0


