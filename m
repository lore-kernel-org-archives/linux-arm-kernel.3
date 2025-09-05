Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1466CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7SGgiq8e0ibQjNE492pNxUn28Q/j5kSsNWzW80icFw=; b=bY+Sq/q3c5bSRGz2H6Mzz3md7Y
	5LHhp8u0rrVtiMROnlGYSxp2pNwimY+Y/gN8qLYVGteHaSbD2woKvQqIWO3E6VZeaHCiv+hd3C/f+
	3yCBvBtvlq4xFxEGmD5fGJmU+JiNCsbWGHNnGSgBCRayGHvgqpVeLTdELnIJkj7hHWryl6UH2MY8/
	q0XwmI3P7G7nTjhkJqsarHuvsCodwjs4qjxtd5uyzKu8IWJJRaqk1FUleajTGB+N0YRtJK6hi/jvy
	kpoIXuLGcJoRh4eQ+hQwZBi9roC2PXz/at9RtdhNGn/8SoUsxkjPut47cP+x9Ek9e7d0yKQs+wZGW
	D46+olgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaL4-00000003W2G-0fd9;
	Fri, 05 Sep 2025 17:35:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWm-00000001zTQ-2RSm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45ddbdb92dfso2306345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079055; x=1757683855; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7SGgiq8e0ibQjNE492pNxUn28Q/j5kSsNWzW80icFw=;
        b=zRls/mr7PDZ7uXhoDsnJ4Ea22IGNFlg6fbAY/l7XeFglACIOOXxL9OFBn3gatZe8p8
         tbnSIdBc8zE8dYP3wvzrDn3BXcoVL1sy5EuCSVtalMUvzKJqB8JnKR7QoUfXY4Im1/Nw
         YaTDwDQteccYJAEnHDWtsjMF7E+t9hZp70EyLhRJsrZfnIagrgMbQaFQPyjw/gI005we
         cCEc1+PhFl1RQ3JTyjnel5xYzZRW/4nzLiaR4Czx8Q37pSKbhvgl2L79WIuVpmHfV5eE
         BZbDGEhJeO/CFtR50Rfk8CPKjHcQtHXn5DXUmnQqUgtV54qtk4qnlyzhyyexsRxivwaH
         H68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079055; x=1757683855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7SGgiq8e0ibQjNE492pNxUn28Q/j5kSsNWzW80icFw=;
        b=ux9CFzeLDg6nhM3JqLUbsEs6JRVTP6UOg7u5ogTK1LqnAnAGGz36ySQHgakLSjeQ8R
         sp5ZCywZshnObOb+QMVyYFkIdz+KzXfGlGFlBRLvE+33dzK2ZY8y2WunWzAFFsZgoLnD
         dGZoTnAUNFGgxcQqk8aQpg7Ot9OCf72laT8GkMp4n6vFuoc5ptYwsdzhg5XRXdjBcfAS
         IxPjkFGUXRmM4tcJy5vM0nu+2UqsIpXOKa94wdfDZtbP5WFEu33IsoiW0TAOIicCUbe9
         EdE6fM/bdbPZBCMXomqOBxYKsuvAYZDdHtnfqoCVT/YxA/L7cGnHV6/3m1uM0ML4iVeP
         pn+w==
X-Forwarded-Encrypted: i=1; AJvYcCXJM3VECtCwMgDCqVyx0D1rNZsIjju+gnUz2uciPz9xpbVQVpGMnvrJ2F4BpsspXv7c/cWG+7jgScwZfRXYOmaw@lists.infradead.org
X-Gm-Message-State: AOJu0YwxJTGY/BWEwA/Ow1GSLdFN/WcpHbX6Yl8nTylaTgDxm2yMwiho
	jjDwVn1SVPvwqaI1jaese97TWIWTiPXuYKD8uF7hfNP2QX0YjW+cLIaVEEfIu6XOlbkd9xvq6w=
	=
X-Google-Smtp-Source: AGHT+IFvcFnuIOuoqBisDROlcvYmwSXQfsXo7xa1mO1oe2SxbUKBbSt14Xcgr/JdOQQx2fY9o0Bwyd8Z
X-Received: from wmbds17.prod.google.com ([2002:a05:600c:6291:b0:45d:cf67:3908])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1584:b0:45d:d609:117f
 with SMTP id 5b1f17b1804b1-45dd60912c7mr22883895e9.8.1757079055152; Fri, 05
 Sep 2025 06:30:55 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:43 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; i=ardb@kernel.org;
 h=from:subject; bh=p0S4tXXYoOutiRiXN4g5SW9wNTpd5LNBz7e6ejjtylE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPXM6a5x+oyuYWeVatHRHPziD3YeKNUdPtTxXs12SJnl
 Od3eJl2lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImomjH8U0s6sDv2b+D/4x6C
 tWKuAms0VPqiFj35WPi5XDr/7YONqowMx9Vfi//Ymfzk8RSXx5mrF5VGb3q0ap1LTp9bBVtGypV SdgA=
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-16-ardb+git@google.com>
Subject: [PATCH v2 7/7] arm64/efi: Call EFI runtime services without disabling preemption
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063056_634265_8C9AD2F2 
X-CRM114-Status: GOOD (  18.47  )
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

The only remaining reason why EFI runtime services are invoked with
preemption disabled is the fact that the mm is swapped out behind the
back of the context switching code.

The kernel no longer disables preemption in kernel_neon_begin().
Furthermore, the EFI spec is being clarified to explicitly state that
only baseline FP/SIMD is permitted in EFI runtime service
implementations, and so the existing kernel mode NEON context switching
code is sufficient to preserve and restore the execution context of an
in-progress EFI runtime service call.

Most EFI calls are made from the efi_rts_wq, which is serviced by a
kthread. As kthreads never return to user space, they usually don't have
an mm, and so we can use the existing infrastructure to swap in the
efi_mm while the EFI call is in progress. This is visible to the
scheduler, which will therefore reactivate the selected mm when
switching out the kthread and back in again.

Given that the EFI spec explicitly permits runtime services to be called
with interrupts enabled, firmware code is already required to tolerate
interruptions. So rather than disable preemption, disable only migration
so that EFI runtime services are less likely to cause scheduling delays.
To avoid potential issues where runtime services are interrupted while
polling the secure firmware for async completions, keep migration
disabled so that a runtime service invocation does not resume on a
different CPU from the one it was started on.

Note, though, that the firmware executes at the same privilege level as
the kernel, and is therefore able to disable interrupts altogether.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index ece046bcf0db..cf62980006ea 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -10,6 +10,7 @@
 #include <linux/efi.h>
 #include <linux/init.h>
 #include <linux/kmemleak.h>
+#include <linux/kthread.h>
 #include <linux/screen_info.h>
 #include <linux/vmalloc.h>
 
@@ -177,7 +178,19 @@ bool arch_efi_call_virt_setup(void)
 	if (WARN_ON(down_trylock(&efi_rt_lock)))
 		return false;
 
-	efi_virtmap_load();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		/*
+		 * Disable migration to ensure that a preempted EFI runtime
+		 * service call will be resumed on the same CPU. This avoids
+		 * potential issues with EFI runtime calls that are preempted
+		 * while polling for an asynchronous completion of a secure
+		 * firmware call, which may not permit the CPU to change.
+		 */
+		migrate_disable();
+		kthread_use_mm(&efi_mm);
+	} else {
+		efi_virtmap_load();
+	}
 
 	/*
 	 * Enable access to the valid TTBR0_EL1 and invoke the errata
@@ -203,7 +216,13 @@ void arch_efi_call_virt_teardown(void)
 	 */
 	uaccess_ttbr0_disable();
 
-	efi_virtmap_unload();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		kthread_unuse_mm(&efi_mm);
+		migrate_enable();
+	} else {
+		efi_virtmap_unload();
+	}
+
 	up(&efi_rt_lock);
 }
 
-- 
2.51.0.355.g5224444f11-goog


