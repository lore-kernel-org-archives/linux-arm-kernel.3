Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DC6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mutBHrPPn84rf+SwTAASYZI6R7q+QxGKCuZHvQ7HuZU=; b=qHCK8fr+SXxidBqxI3fS9QNL5K
	15fwUwlRfr8pAMouMeadfKG68x+fEOmBYgOt+NhHu2NlNiBJUcxaBcKj/cymbPbM8LBJNl5f7B16X
	+d9QoENThXYCwoLPeGANHv2ohKgb+BYsJbHHvDd6cG9f/Tqd9k/0BIoZA/vJyjB8fHxW17ZZlecei
	UHammraNZSO1wlukCOExXxNztCGwZMDdB1OwFxYhhXhEPgASh0btfd2DQTQaXZu/j8XuilGsZzrqq
	tfmRUn+fs3kMfSEwyuxaVdwWonbgG196unIjoxUhdt+le61rxGmaTvlggFYMkY2/W4r4LH5Yo0Npg
	c3Snz8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7t-00000000YhX-1Cwg;
	Wed, 08 Jul 2026 22:52:21 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7m-00000000Ycq-2EcA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:52:16 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-44801afec53so1280206fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783551133; x=1784155933; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mutBHrPPn84rf+SwTAASYZI6R7q+QxGKCuZHvQ7HuZU=;
        b=m+84I6YhieBIX9k7vw5PtrCli0BmYKSUPJmOo+u8PZWuyid/UuKrSZqc3fjyG6LJai
         /zQg2nvTUr2myp07un2Q+BMcs4ddCGPLBfSW4WB3cDlExZQe4LRWztO7ekVsnLD+6YOY
         ZV7HuoE+lmiFqkvp8dZBZ73vUqGVYHcQqPoxwC7beOv3YX/iQr/YJLVik9kCkOiCOfLb
         3J800VH/WMxP84aXu4k63qsOuFN6ykc5SypV2P8E84/CJms0JYlCsrRNW19g5CIKGqm2
         kYJReuoro08et74WSYM6lYNHsr2nJkfxK4NrJMMrAkwBGg9OMoN79TUy9gkD0RK7+AcN
         Evkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551133; x=1784155933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mutBHrPPn84rf+SwTAASYZI6R7q+QxGKCuZHvQ7HuZU=;
        b=Ajtiw2X/wvMn/+KyoJIyfdqz8m6D/uy0o7jyZullnKHlLEW1R/tM5rSHMvtcCVK89I
         kXy89M1IGbBNqnrLCeFwQjG+umNntW+tjGc1FVgvXfJMThjjN4kk6hXoR8b7hidhe2er
         s7tmk9P4mf8yWPU3fqXuhIMfzxmXve0W48yiWaYzANAV9jZQEjWcDVmN+NxqPnekVmk7
         rd8rFCujUSXVlbWNp/3D8CjVLwXpZNertrvk7vwLaPqA9b9AUQHj6ROnTOJg3iWtOU0J
         vxBvlVCiBLRO0dCoUwuxEgQ2MdIjSMg/CeBxBLzN/+nV8bNitCU10Ish0XDk8awG5zXG
         n3Zg==
X-Forwarded-Encrypted: i=1; AFNElJ8tkMngwOww5kj7aLiRHwxYbszD7ygGEeMv7C/M05k/lYFiEopC4dnQD2Pnbil8ie7LXU4t0MB6PPZTWC+Bg6z0@lists.infradead.org
X-Gm-Message-State: AOJu0YyzW+c5+eTbvD2Q17ojKjWeWbxMjtI8fMsZUEZJgfmENZUwWUXA
	RSJsbfWkNMZ9PoocvC4PZ+CaIkYQNT2OY/jP6khnDj64Nlt8EpPLnUaWQLEZlMyPIb9Qi+NAgs7
	48PHqXlBpSBGHhPEp16MQ+4knag==
X-Received: from iltr14.prod.google.com ([2002:a92:c5ae:0:b0:502:eb99:7080])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:c0d4:10b0:6a3:76ab:476b with SMTP id 006d021491bc7-6a376ab4a96mr1122254eaf.57.1783551132443;
 Wed, 08 Jul 2026 15:52:12 -0700 (PDT)
Date: Wed,  8 Jul 2026 22:51:23 +0000
In-Reply-To: <20260708225124.4130846-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260708225124.4130846-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708225124.4130846-6-coltonlewis@google.com>
Subject: [PATCH 6.6 v2 5/6] KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, dbrazdil@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_155214_578860_76352B7F 
X-CRM114-Status: GOOD (  16.56  )
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

From: Ahmed Genidi <ahmed.genidi@arm.com>

[ Upstream commit 3855a7b91d42ebf3513b7ccffc44807274978b3d ]

When KVM is in protected mode, host calls to PSCI are proxied via EL2,
and cold entries from CPU_ON, CPU_SUSPEND, and SYSTEM_SUSPEND bounce
through __kvm_hyp_init_cpu() at EL2 before entering the host kernel's
entry point at EL1. While __kvm_hyp_init_cpu() initializes SPSR_EL2 for
the exception return to EL1, it does not initialize SCTLR_EL1.

Due to this, it's possible to enter EL1 with SCTLR_EL1 in an UNKNOWN
state. In practice this has been seen to result in kernel crashes after
CPU_ON as a result of SCTLR_EL1.M being 1 in violation of the initial
core configuration specified by PSCI.

Fix this by initializing SCTLR_EL1 for cold entry to the host kernel.
As it's necessary to write to SCTLR_EL12 in VHE mode, this
initialization is moved into __kvm_host_psci_cpu_entry() where we can
use write_sysreg_el1().

The remnants of the '__init_el2_nvhe_prepare_eret' macro are folded into
its only caller, as this is clearer than having the macro.

Fixes: cdf367192766ad11 ("KVM: arm64: Intercept host's CPU_ON SMCs")
Reported-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Ahmed Genidi <ahmed.genidi@arm.com>
[ Mark: clarify commit message, handle E2H, move to C, remove macro ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ahmed Genidi <ahmed.genidi@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Link: https://lore.kernel.org/r/20250227180526.1204723-3-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h   | 4 ----
 arch/arm64/kernel/head.S             | 3 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 1 -
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 3 +++
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 3498dc5d02c18..76b0d50d286d5 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -229,10 +229,6 @@
 .Lskip_fgt_\@:
 .endm
 
-.macro __init_el2_nvhe_prepare_eret
-	mov	x0, #INIT_PSTATE_EL1
-	msr	spsr_el2, x0
-.endm
 
 /**
  * Initialize EL2 registers to sane values. This should be called early on all
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ff7769821166a..9996029853d23 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -601,7 +601,8 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	msr	sctlr_el1, x1
 	mov	x2, xzr
 3:
-	__init_el2_nvhe_prepare_eret
+	mov	x0, #INIT_PSTATE_EL1
+	msr	spsr_el2, x0
 
 	mov	w0, #BOOT_CPU_MODE_EL2
 	orr	x0, x0, x2
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 3efa9cfaa9d48..9b2ada54be538 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -207,7 +207,6 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 	/* Initialize EL2 CPU state to sane values. */
 	init_el2_state				// Clobbers x0..x2
 	finalise_el2_state
-	__init_el2_nvhe_prepare_eret
 
 	/* Enable MMU, set vectors and stack. */
 	mov	x0, x28
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index d57bcb6ab94d2..5688a16e2ea75 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -218,6 +218,9 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	if (is_cpu_on)
 		release_boot_args(boot_args);
 
+	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
+	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
+
 	__host_enter(host_ctxt);
 }
 
-- 
2.55.0.795.g602f6c329a-goog


