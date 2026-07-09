Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB15C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZvMATXTmB3nAegqDip7leWztUnMRPzdQF6TRC6l434=; b=SiG5c64ipW7y2JmhDRe+nuQR25
	zmbDAZ3G4lBxSpL0I2JumawUmcG997MrlsVeDN8ygkzOOtRoQmKcLG/OW2cdyEaPNkuxIMJCxSxEW
	ckAlXuiEGRnEP1jEe6NcUEKtAY7hdoQEoqGQOkI7wUBoLVz88RkfHdMZU9HOuaBxdDkGNMDRVYq7u
	CZw511B6s2cZhNdSJ4VXt6nbLxJTfKGAqcHArMpLRnfw8IRv3Sxbec7srQbjNvn3BhvCadjTw4Wc+
	Vc7cphPffmJSqfmwI6G5hPEpHemV4l0QI/mpH3F/6UfFln6eousGJ1o4yP/PSJ6Ul32tkD4bJCIzh
	cwxhOOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneN-00000002LKy-1Yev;
	Thu, 09 Jul 2026 12:14:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whne6-00000002Kan-3KJD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 882EA3595;
	Thu,  9 Jul 2026 05:14:21 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1A7F3F915;
	Thu,  9 Jul 2026 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599265; bh=HFWWkmcQIWZ+ZCbK9iVKkwj7pF1V5RHWI5TnsNAZbdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TsF/EDDtgybWTPf9stURt/l7Yl/2XE/ezCYM2HRjdIDK9hTXGldyG5djnvdpIzBQ+
	 vOnFRTY0O1ozf8hpmMtk1Vk5l61k1RtVzJ/Xio+ZAm61nv5Wt6tZL7l3gieC0Ni1t5
	 FVTV9s5EKkoV0TdCec+51X4MOyi3nSXPoWIvuP8w=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 22/36] efi/runtime-wrappers: Permit architectures to override IRQ flags checks
Date: Thu,  9 Jul 2026 13:13:19 +0100
Message-Id: <20260709121333.23507-23-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051426_881123_65BC4BD3 
X-CRM114-Status: GOOD (  11.79  )
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

Representation of IRQ flags on arm64 has recently changed. They now
track both DAIF and PMR state while remaining compatible with the
irqflags API by encoding the state in an unsigned long.

While the generic check can still detect corruption of the IRQ flags
caused by EFI runtime services, the resulting error message is cryptic
because it does not understand the arm64-specific representation.

Permit architectures to override the IRQ flags checks and associated
error messages, while keeping the existing implementation as the
default.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/firmware/efi/runtime-wrappers.c | 32 +++++++++++++++----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index da8d29621644..498fb3612643 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -137,6 +137,25 @@ struct efi_runtime_work efi_rts_work;
 #define arch_efi_restore_flags(state_flags)	local_irq_restore(state_flags)
 #endif
 
+#ifndef arch_efi_check_flags
+#define arch_efi_check_flags(state_flags, caller) 							\
+do {													\
+	unsigned long cur_flags, mismatch;								\
+													\
+	cur_flags = efi_call_virt_save_flags();								\
+													\
+	mismatch = state_flags ^ cur_flags;								\
+	if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))						\
+		break;											\
+													\
+	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE); 					\
+	pr_err_ratelimited(FW_BUG "IRQ flags corrupted (0x%08lx=>0x%08lx) by EFI call from %pS\n",	\
+			   state_flags, cur_flags,							\
+			   caller ?: __builtin_return_address(0));					\
+	arch_efi_restore_flags(state_flags);								\
+} while(0);
+#endif
+
 unsigned long efi_call_virt_save_flags(void)
 {
 	unsigned long flags;
@@ -147,18 +166,7 @@ unsigned long efi_call_virt_save_flags(void)
 
 void efi_call_virt_check_flags(unsigned long flags, const void *caller)
 {
-	unsigned long cur_flags, mismatch;
-
-	cur_flags = efi_call_virt_save_flags();
-
-	mismatch = flags ^ cur_flags;
-	if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))
-		return;
-
-	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE);
-	pr_err_ratelimited(FW_BUG "IRQ flags corrupted (0x%08lx=>0x%08lx) by EFI call from %pS\n",
-			   flags, cur_flags, caller ?: __builtin_return_address(0));
-	arch_efi_restore_flags(flags);
+	arch_efi_check_flags(flags, caller);
 }
 
 /*
-- 
2.34.1


