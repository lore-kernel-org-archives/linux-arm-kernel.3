Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9EC56207
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P8/Uc5RoXpFVHkZ1epqzt9nXXbG81Fj6PP6hKjU9EoQ=; b=K3q/YiDYK0FIWlGnSXSHc85w4m
	+zf78d/zKtjE2/TpAvYX0zMwlWfv+RVi1UejJpfmhPDpv9Y8zgnBamduK+biWEDEvUSHmby6R3RQt
	ih0PVAzHNWvKA7cqiZ+vqUZDmst6ZNAMywQQBzgcza+c75YSMBkjOkh99DQ5+aXFtuiia200tBlcU
	pZTNLBL2RcOVGA8cpAUzhGsmdbJwVH+iaTSAlJgmmf9t0iedTqqecxrJI/ipiZmD8BRP4FbVkMizx
	PFP53i54wX44eLokdw4rsahzxQMJQnkAftBV9i5fimHJZFY09oxcaIPkPU/IBhTxlU+5MZIg9inYh
	Bb4zkVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzaz-00000006388-0wrO;
	Thu, 06 Aug 2026 15:01:21 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzaw-0000000637K-44Cf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:01:20 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so16641725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786028476; x=1786633276; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8/Uc5RoXpFVHkZ1epqzt9nXXbG81Fj6PP6hKjU9EoQ=;
        b=sFDpwAo9WLxFchSzBIaw+7MOtXVMEspH/uEnPTLi+kZWWpW2VW/kjaeJkAY8oTr6u6
         P6V7dvrsuzj5yVQJb3XsIPzAP08Uu5lnNJf8xg96Ud8vTwtz70Gzse4D9m/FlInLEQXC
         /ZwgfGR4VesH4d/4rzIpXgTb8PcjIa0Q7KpG89w+reIxZQAQs4rgARWjL8E2o+2IfP/4
         v0dtWgacqSibs8Q/JIGjcUUADj93ajcO4a8OVIfL28kFeS09dJA/RdbtgdI8Nfu1wvil
         uoWyiYWnD2d6Yr1huJ0iq8kby/8IQHAogq3SMNErlvlE8trMBJkSgnrwX3TL931W5H51
         LOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786028476; x=1786633276;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8/Uc5RoXpFVHkZ1epqzt9nXXbG81Fj6PP6hKjU9EoQ=;
        b=KpV4skLuYKi6pqgnWPg3167cgo2ob5/S4M2Cca0laiI8Qww0jAcQTAWv+ymoCrwNVG
         CDARqbwuydZyOqeD/Sj2bfBY5oNPNqIAtyc94lMB0TOsP64w+ti+PrlxBqp1IFpPSWou
         4jXK1w3jKZ3XMLybdQCkFCXWAB3Ns87haullo98t4ZCXaPI/PLZttxiDARdVSgsNoCv0
         ixEkxDWf90u/R9EfoJcqgG1Wx34am/ktwrz67UCkSBbvDCxQEpmGIoxbr7alPlVniapc
         J53iFY8W1LzqmbEw454pZ7hfpHfjguCX8nDMB4MJf1+7uxruexq/64wcifmzainWHhkl
         etxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIlky35p2GycBkBICPpb5HGmJJlrqQdEYjtWi81+ZMpXySNnry4SXGS6s4tyyder2dIO9GBQ8IVK8F139H02tR@lists.infradead.org
X-Gm-Message-State: AOJu0YwYgOZ5dukKnZWAKKa9rXz2cUD4q5X8NVSKAnET7CsUYk4iZHyY
	kZFCHSJPyHPlEzO5KdfPBg9JpJCEMcnCQp3mriGnNN4nZ+05s2zmsJUAEaD9mnhzkBCjJV4y0i6
	dmrtSgVo+JdrGgw==
X-Received: from wmok17.prod.google.com ([2002:a05:600c:4791:b0:495:5b2e:3824])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:cc0b:0:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-49959e38ecamr25064705e9.15.1786028475423;
 Thu, 06 Aug 2026 08:01:15 -0700 (PDT)
Date: Thu,  6 Aug 2026 15:01:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806150105.4010701-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_080119_021435_DCCD1EA9 
X-CRM114-Status: GOOD (  13.88  )
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

When running on a setup affected with broken CNTVOFF_EL2
(has_broken_cntvoff())

Booting with VHE or protected mode(nvhe) (id_aa64mmfr1.vh=0
and arm64_sw.hvhe=0) works fine.

However launching a protected VM with protected hvhe mode panics the
guest kernel:

[    0.000000] Internal error: Oops - Undefined instruction: 0000000000000000 [#1]  SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc3-g05f75bd71e0e-dirty #29 PREEMPT
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 000003c5 (nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : arch_timer_shutdown_virt+0x4/0x1c
[    0.000000] lr : arch_timer_starting_cpu+0x1c4/0x2d4
[    0.000000] sp : ffffa6bd9a193c00
[    0.000000] x29: ffffa6bd9a193c20 x28: ffffa6bd9a1bcf88 x27: 0000000000000000
[    0.000000] x26: ffff00001be70dd8 x25: ffffa6bd99d85000 x24: ffffa6bd99d85ee4
[    0.000000] x23: ffffa6bd99d85000 x22: ffffa6bd9a1499c0 x21: ffffa6bd9a1ab900
[    0.000000] x20: 00ffffffffffffff x19: ffff00001be8b600 x18: 000000000000028c
[    0.000000] x17: 00000000510f0010 x16: 00000000510f0010 x15: 00000000500f0000
[    0.000000] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000018
[    0.000000] x11: ffffa6bd9a8ac000 x10: 0000000000f0000f x9 : ffffffffffffffff
[    0.000000] x8 : ffffa6bd98822e18 x7 : 0070752d65746174 x6 : 00111ff76e007261
[    0.000000] x5 : ffffa6bd9ad68078 x4 : 0000000000000000 x3 : ffffa6bd98822a0c
[    0.000000] x2 : 0000000000000073 x1 : 0000000000000001 x0 : ffff00001be8b600
[    0.000000] Call trace:
[    0.000000]  arch_timer_shutdown_virt+0x4/0x1c (P)
[    0.000000]  cpuhp_invoke_callback+0x11c/0x280
[    0.000000]  cpuhp_issue_call+0x1e8/0x224
[    0.000000]  __cpuhp_setup_state_cpuslocked+0x1d8/0x2b8
[    0.000000]  __cpuhp_setup_state+0x50/0x74
[    0.000000]  arch_timer_register+0xc0/0x148
[    0.000000]  arch_timer_of_init+0x148/0x170
[    0.000000]  timer_probe+0x74/0x124
[    0.000000]  time_init+0x18/0x58
[    0.000000]  start_kernel+0x1c0/0x3ac
[    0.000000]  __primary_switched+0x88/0x90
[    0.000000] Code: c80b7d2a 35ffffab 17ffffeb d503245f (d53be328)

And for non protected VMs seems to hang or progress really slowly.

The workaround avoids setting non-zero CNTVOFF_EL2 and trapping the
virtual counter to emulate the offset.
In the VHE path (timer_set_traps()), traps are only enabled when the
guest actually has a non-zero virtual timer offset.
However, __timer_enable_traps() in hyp/nvhe/timer-sr.c unconditionally
set CNTHCTL_EL1TVT and CNTHCTL_EL1TVCT whenever has_broken_cntvoff()
was true.

Which causes 2 issues:
1) Protected VMs: kvm_handle_pvm_sysreg() does not find "cntv_ctl_el0"
in pvm_sys_reg_descs and injects undefined instruction exceptions.

2) non-protected guests are trapped all the time even with offset of
zero.

Fix this by adding a check in __timer_enable_traps() similar to the one in
timer_set_traps()

Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/timer-sr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
index ff176f4ce7de..98b6e37ee8fa 100644
--- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
@@ -10,6 +10,7 @@
 
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
+#include <hyp/switch.h>
 
 void __kvm_timer_set_cntvoff(u64 cntvoff)
 {
@@ -63,7 +64,7 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 	 * Trap the virtual counter/timer if we have a broken cntvoff
 	 * implementation.
 	 */
-	if (has_broken_cntvoff())
+	if (has_broken_cntvoff() && hyp_timer_get_offset(vcpu_vtimer(vcpu)))
 		set |= CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT;
 
 	sysreg_clear_set(cnthctl_el2, clr, set);
-- 
2.55.0.654.g21b8a5bc05-goog


