Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72610CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 02:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wtsl0ZUy9+FjGz3bOCtKxLHU4fboPLGc7A+Rl50kstc=; b=Jqr644ySLe+udhU0FpiEZiGfFN
	f5uj7RCBI50YB+ui8frMLoQ8Mz5zd9d8aQxWW7r1tn3FVRmQqgX6znJKXyIvyxLdMRU0pdSdf2DC9
	Gm0KkUIKJpc9qoMw/g1I9+Hy6BIyFpTjcU+LuPJ30EXJh4V8jgRLVmgNelpLRCTjbGsd3sWaEsPK1
	95csOEIoGJeI91uPH8L+08BCDHsrzCsbf/UV9nnSmig9GDK8LR618YurWwQMpLv6qkstt9A+lIzvX
	1Z8Ezzxj+j/fXde1i0snIa92POQY+dURDyIcXTdmR0uA54yT8KQjQ3xK98ZUIWRsXJIzVF+qj/yTZ
	L9D2qt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rND-00000000FXH-3CaK;
	Wed, 15 Oct 2025 02:36:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rNC-00000000FWt-06mn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 02:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51AE21A32;
	Tue, 14 Oct 2025 19:36:08 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3119B3F738;
	Tue, 14 Oct 2025 19:36:15 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop redundant extern declaration for rodata_full
Date: Wed, 15 Oct 2025 03:36:09 +0100
Message-Id: <20251015023609.427911-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_193618_108955_E2241341 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

Drop the redundant extern declaration 'rodata_full' which can be included
via the header <asm/setup.h> after moving exiting declaration outside the
function arch_parse_debug_rodata(). While here also drop 'rodata_enabled'
which is anyways available via the generic header <linux/init.h>.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/mmu_context.h | 2 --
 arch/arm64/include/asm/setup.h       | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 0375ca3162ff..e4b3563e1d96 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -26,8 +26,6 @@
 #include <asm/sysreg.h>
 #include <asm/tlbflush.h>
 
-extern bool rodata_full;
-
 static inline void contextidr_thread_switch(struct task_struct *next)
 {
 	if (!IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR))
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index 3d96dde4d214..902f1aab520f 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -12,12 +12,10 @@
  */
 extern phys_addr_t __fdt_pointer __initdata;
 extern u64 __cacheline_aligned boot_args[4];
+extern bool rodata_full;
 
 static inline bool arch_parse_debug_rodata(char *arg)
 {
-	extern bool rodata_enabled;
-	extern bool rodata_full;
-
 	if (!arg)
 		return false;
 
-- 
2.30.2


