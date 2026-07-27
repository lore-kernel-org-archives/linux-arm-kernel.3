Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438BC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jXep1uGvdwsg2KGEwgMEGwkfuZIfA4T97ML3q98Mj4=; b=oHsNOfB0rF8vbL84/zcsW1JPCn
	9nKfG7FYs/3upYPHKg/Prc2LM/EJyLqnLdEdeLYXkpLSYUdpHsNGEZKe40US3HA3zJ0aG3/tJdlOe
	lxo8k9OA3B892jMED7+hrx1u9tjoXSRU+OZu9uN4c4esFHRMo8w9o2A3Op/wIQidQNLb72YVgESVZ
	aEbU9B/7WPJNWg6L6yxvcL5Ag5eS9jIAOwAnm+aIOG4NfUZx81mgGpgS4DQGdrO478yAHewHnKXqN
	QgW7WmC8AXUwlL0MVSjd3oiZ2P1rSrfFUAsstBRBFfpzALLPftuQvP5Szot8Bp/rdpA2JjZiZvwQT
	biuEInZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKo-00000003OJb-0UhI;
	Mon, 27 Jul 2026 16:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ0-00000003Muf-3ZuE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A91F1688;
	Mon, 27 Jul 2026 09:35:48 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2C653F86F;
	Mon, 27 Jul 2026 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170152; bh=fHmkqXdLwqgPIEJGDhQds8Gthjfy6JV2G6/glAMBm0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdkkO0TGaysab0tvR1ka46Z8+PoF/6T2uMuwS7hX5cQ1eaz8ZZZcra1+d3eUZIv8T
	 oWwgBjlrzMshQF8QuXD/qfK0jENxABQK3aafv2sMepiK5FlVfE6Km4ucxC+LEQBmMZ
	 G79TJaMJ508UyDwBemBPlhaTIVtbgO/7Ug5bFt1c=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 26/45] arm64/efi: Implement override for IRQ flags checks
Date: Mon, 27 Jul 2026 17:34:34 +0100
Message-Id: <20260727163453.7969-27-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093555_046829_7824E9C7 
X-CRM114-Status: GOOD (  13.58  )
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

Take advantage of the recent changes to the way arm64 represents IRQ
flags and implement an architecture-specific override for the EFI IRQ
flags check.

IRQ flags now carry both DAIF and PMR state. EFI is not expected to
modify either of them, so check both when verifying that IRQ state is
preserved across EFI runtime calls.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/efi.h | 38 ++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index e8a9783235cb..0fc5a8cd5850 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -5,6 +5,7 @@
 #include <asm/boot.h>
 #include <asm/cpufeature.h>
 #include <asm/fpsimd.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/io.h>
 #include <asm/memory.h>
 #include <asm/mmu_context.h>
@@ -48,18 +49,43 @@ void arch_efi_call_virt_teardown(void);
 	(efi_rt_stack_top != NULL &&					\
 	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
 
-#define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
-
 /*
  * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
  * And EFI shouldn't really play around with priority masking as it is not aware
  * which priorities the OS has assigned to its interrupts.
  */
 #define arch_efi_save_flags(state_flags)		\
-	((void)((state_flags) = read_sysreg(daif)))
-
-#define arch_efi_restore_flags(state_flags)	write_sysreg(state_flags, daif)
-
+	((void)((state_flags) = arch_local_save_flags()))
+
+#define arch_efi_restore_flags(state_flags)			\
+do {								\
+	arm64_exc_hwstate_t __st = {.flags=state_flags};	\
+								\
+	arm64_update_exc_hwstate(__st);				\
+} while(0)
+
+#define arch_efi_check_flags(state_flags, caller)									\
+do {															\
+	arm64_exc_hwstate_t __actual = {.flags =  arch_local_save_flags() };						\
+	arm64_exc_hwstate_t __expected = {.flags=state_flags};								\
+															\
+	if (__expected.flags == __actual.flags)										\
+		break;													\
+															\
+	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE);							\
+															\
+	if (system_uses_irq_prio_masking()) {										\
+		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
+				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
+				   caller ?: __builtin_return_address(0));						\
+	} else {													\
+		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
+				   __expected.daif, __actual.daif,							\
+				   caller ?: __builtin_return_address(0));						\
+	}														\
+															\
+	arch_efi_restore_flags(state_flags);										\
+} while(0)
 
 /* arch specific definitions used by the stub code */
 
-- 
2.34.1


