Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A79C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttetVpS6M0G75h0eT91zmHzUkq3oJZQqZlgUWOpt0Ms=; b=aY57PK4N828hSaXEhnXzN/pPei
	XkVSUoZtf5AuIzgEvwNNiq7P/jlwiwBnxcBWmg5lq76MQ246X6GQIUj1UtoTGqKrnNYUu9a9iXJjt
	lLaItD4l1FW9YFMWmjf2T5GWDXriPsPjvZ2Vk8bDvkc7ub0vMp3eaAOZFklUcjP9ck8S/aKtC/W79
	Vhpwzo3o+JsWgZrBSBdqIDTLL8Q1RFs+Ji+gQiOwTfOJWGByIHFAEl2+lQD1yjt90FutMH7A7f76H
	LCbrZQ7QedlJuxGvi5l5APJyJqnEy0xSy/ixoCjiYi0MscYSZT6kWyo0XZdzY63wOgAavLejzuciN
	KZ3tj2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKn-00000003OJI-4Ag4;
	Mon, 27 Jul 2026 16:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIx-00000003MjV-3zSL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 687691682;
	Mon, 27 Jul 2026 09:35:47 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E4D53F86F;
	Mon, 27 Jul 2026 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170151; bh=LQ5S0VlVbF2Y2b0QwHXJREpyG0qAxNlPgvTx84ai8/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUhRMYirWnZg+RsLGpY6JbE+8j/9MRwVScGnUbRQZbLcM8cDF7bsBVzO3zYL4yF0n
	 oA7q6ETMJ893vnGbCHYPZ2OXIn7WVt5A53baheMW159CeqZuvoikuJgTrV6K1wVlr5
	 3t1hpqj4ybJbW4KAZ9cgfkqbMqfYKg4iCBC0qUYY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 25/45] efi/runtime-wrappers: Permit architectures to override IRQ flags checks
Date: Mon, 27 Jul 2026 17:34:33 +0100
Message-Id: <20260727163453.7969-26-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093552_099278_C9B92B6F 
X-CRM114-Status: GOOD (  12.27  )
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/firmware/efi/runtime-wrappers.c | 32 +++++++++++++++----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index da8d29621644..f4900815adad 100644
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
+} while(0)
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


