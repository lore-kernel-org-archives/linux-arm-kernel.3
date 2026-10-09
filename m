Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54193CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mHDReJbU9bHLWD9bwg1RVBJ1LaKr4aLK8gowy4oSBzY=; b=cciJviYPN44RVsWK0cwLFOHn4h
	YVibXSTuMNJI+goEln9Wl762DUSF+/r9baObnnymCe3PL6gqjjZDwSagNoiZz6NXu6uWlkJGn9JTb
	W6BqxU5PM0kj+n1+tJpN/itocWDdsuqVFIJr1iC18I/xNN+EOsxsZZlgE90u7ykyzWwzWvThNw6aa
	cmrkDR+L7CJywThrkhS9v+GpY4+GA9r9lfaHGKYTTyBBH1+YHLrTEaim2bD1546nQ3+TA2zlJbkl/
	+xHoXHRnJ+AgitZ9rKI8ZGRz4WEiRwIISKZIZVH6Ion7YSoSlk8q0+9uwvrjCfDl95d31qEZoCIh2
	Xl4XmtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBgR-00000006STY-0qCY;
	Fri, 09 Oct 2026 14:34:51 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBgP-00000006STE-0kv7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:34:50 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a9b7e63963so624559a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791556487; x=1792161287; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHDReJbU9bHLWD9bwg1RVBJ1LaKr4aLK8gowy4oSBzY=;
        b=tJCwO23wctzcaP0YnLeLAAIsqgqR9ajnyTJ4jVUwn7NEGynqfhP4/TlOBWIfuMSN87
         CwE46baS0LaXmiipRUWky3vByYmce/ojjj8R6EibETlLr8vOeuijtSyqivll28Vek0tZ
         CBzM9BjduTHejYFRj5ypguWeoliGT4yTrAxPd3DASrZIOEkGPxg1Pejxnu8u28/6qPhj
         S78Xu1IHImTiSWBrHx8LcEIefIMhX/xHMFlxMtU6i6Q9QuX09iK3dkxrsfOG14UIx2c3
         MLFNZ9qZg5TGAYBrauDbr221dTJhRMVwu5TCnKqLMbV+TSe1yZOUsiFJwWNVyXORS1wV
         ir2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556487; x=1792161287;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHDReJbU9bHLWD9bwg1RVBJ1LaKr4aLK8gowy4oSBzY=;
        b=wFgCg+4pQg31afiAxwdqvYkY0psMOwJ2j5gKbkP/sxnQWdcpz3x+I725yPAAXKkAru
         +KJQnoc8Kvsqepjp6l1iAGhnfN960bXd/N1AUNViZsN2QLWvLq3X2U6LdO8x31NUaDIp
         PGUy4aiyXArShZ9nfpD9ckBbPA+o5vjVNmOQnOmrBvngtlnZ6RxwmoBql9t8B8TzUSWh
         OMWaDgf/ytrv+zhnOU9iYJIWoNRNiUwYTNuueOlARQgr5aUKBH85z06oxGefh0ORughy
         8DIZBkHsYlyvFiGJ2bRs0k2AJA34xAzw+LwxiXRvJZXF6ntnLZQlqtNwFUyo9c9sw/z0
         jSUg==
X-Gm-Message-State: AFq9FYJwNI65l6K0ojhBITJI2+FWwhNo9GSpG4yGai+ChNqkZFvAMKQo
	G8Z5Ege1OKX85hEg6tYKzhp74Pdmol1tiSOWmSwlT8h+9Se3xm4Ehs1jbewR3fjM0isU+JgprYo
	21Dv+98hKTRguXrm7tWAd1pUo/qmlMANInhqfq1+EI5FdG5Ltr0bc+wPNSQvAbvwHgcOruodFZV
	NOzTHe1BCCJyzeZLuPU6VIVqlHcDbvGXnHOw/OkdjR9jmB
X-Received: from edsf8.prod.google.com ([2002:aa7:d848:0:b0:6aa:e0cb:47eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3218:b0:6af:9f9e:c1bf
 with SMTP id 4fb4d7f45d1cf-6b17c257b08mr2023254a12.21.1791556486444; Fri, 09
 Oct 2026 07:34:46 -0700 (PDT)
Date: Fri,  9 Oct 2026 16:34:39 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009143438.330265-2-ardb+git@google.com>
Subject: [PATCH] arm64/mm: Route faults taken by EFI runtime firmware to no_context
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_073449_232840_C550A517 
X-CRM114-Status: GOOD (  11.67  )
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

From: Ard Biesheuvel <ardb@kernel.org>

When EFI runtime services are invoked from a preemptible kthread, the
kthread runs with efi_mm installed via kthread_use_mm() and preemption
enabled, so neither faulthandler_disabled() nor !mm applies in
do_page_fault(). A permission fault taken by the firmware on one of its
own (TTBR0) mappings then hits the 'access to user memory outside
uaccess routines' check and oopses, without efi_runtime_fixup_exception()
ever being consulted.

efi_mm has no VMAs, so there is nothing for the mm to resolve. Send such
faults to no_context directly, so that __do_kernel_fault() can recover
from them as it does when the call is made with preemption disabled.

Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/fault.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..db308fe01c4f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -40,6 +40,7 @@
 #include <asm/kprobes.h>
 #include <asm/mte.h>
 #include <asm/processor.h>
+#include <asm/stacktrace.h>
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
 #include <asm/tlbflush.h>
@@ -621,6 +622,17 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	if (faulthandler_disabled() || !mm)
 		goto no_context;
 
+	/*
+	 * Faults taken by EFI runtime services firmware are never resolved by
+	 * the mm (efi_mm has no VMAs), and must reach __do_kernel_fault() so
+	 * that efi_runtime_fixup_exception() can recover from them. When EFI
+	 * runtime services are invoked from a preemptible kthread, neither of
+	 * the conditions above applies, so check for this explicitly.
+	 */
+	if (IS_ENABLED(CONFIG_EFI) && !user_mode(regs) &&
+	    is_ttbr0_addr(regs->pc) && current_in_efi())
+		goto no_context;
+
 	if (user_mode(regs))
 		mm_flags |= FAULT_FLAG_USER;
 
-- 
2.56.0.385.gd3acb90ef8-goog


