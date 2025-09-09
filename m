Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073FECAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ejP7jVX3oQKxjUP0aHsAIaSpTtnAmNmXF173kk9bzw=; b=EaL9ZK0oQ+YwXgSx3x/2seSeTD
	IFG157gohKuyZvtipxXP8+BELuDA1uaswhNa1Ds1cX1TuA4a0Gudo/wZDpNFY94V660YM2SzjHKcG
	OcIoS7yA0VOtF/X62uR87LKpgX1JUEgSf1JcKT5IxhINs0Hwt/bKFJCTkT9coftEQpV3O4k2VIi5E
	71LNuCkL5B9MqhgYf1yvpxbhQV6rX4Q6YQRF5DX5w36SHOI50i6NBKvW1fUKetc20+HZcTMkD3++i
	ZwH1v4rI3GpiobDG4gohzBZpZ3sEdX4ndu86aOOaDYjs+BOJxxeMJRnmLAhstU2p5zhKmPRIfDcwh
	ZYedRbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zV-00000008tXc-3Zu9;
	Tue, 09 Sep 2025 17:18:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyWa-00000007R73-1PN3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:36:45 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45cb4f23156so31498065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757425002; x=1758029802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ejP7jVX3oQKxjUP0aHsAIaSpTtnAmNmXF173kk9bzw=;
        b=DwAj0T7NOaNNexsu397K9+sQcqPBW8hh6pHdgRreGYKIauew9BjpaBiXK0X2LBsVim
         92YnIggXYpdhxpIFf0fTEWmLWR/r8EQxk0u/2SVhvm1fe6VjYO9V2+dMUkYX7JHrF0So
         fkQ6Gj0OePw5ZTVXHh5t0owdchSp+VFHvhbECvBmHg2nTBxfKCFmQpNKYpEX4ULPDClF
         FmGoJcI57PWXt0Ia4E3kW9FpNMlTVkHIDNao011HzbXfB/2tqqNPhXT0jTpdR2d2qtmi
         FQY+6k0wcO+UAWixudCpk5p3RofvqITzF3IBYPUmGfHXE9AhLsAfOTohVjRfwYeydeyx
         VuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425002; x=1758029802;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9ejP7jVX3oQKxjUP0aHsAIaSpTtnAmNmXF173kk9bzw=;
        b=p2/PAezxv/jTHqa/5dY2X290sERJB22Rhe++hEDCh9h09f41texdTTA2W9axnzUFEo
         mXg5WlyebZiAcSIwhPKONgGXBmy6A550NmbuCUV1Pm5CBDsWAEAvZ5yAGeWnpQTQvm6f
         s+4dR4IDKXVgU2WbIWkGcHVEMI/9iR/+RHaocr5Cl8xop8NrouX7NIYmxLfNnqWri1Fu
         OW/a5zamkidARGtK7vwpdVq8XVWcqhuRv9m2UPDbp3du/tFY179goYZNLnQXr4ru/b1Z
         q5KRHiSC+jXsXSHwtUsiYmcfA3h7Tz4LjP0kdcQTpm/LQQhRJn/LDp4UEBh0GhJQIWtP
         l0NA==
X-Gm-Message-State: AOJu0YzIjchZ8RTqG6oBR922bpwldewUGDd0PwzFkXOw027+iVDLGhOv
	SFEhQJrWpt/FxlSXAopN56Cb5CpijQ5DivBJhhz6r4kbT7A/XPNfZGhP/ItOuMKrqdW1oUQL3sg
	lCFKkrsABN8D2cZFGADS1N9YJoxmxzXK9IEoMItaHN+UOUwj5mAl7KpeT2Ulpb8VlY/OlAM+Kai
	MhSpG1fUmbSfXijkVqR6Licf8eJVycr+GCqz+zsFA/NS5/hbhHlsA/ly5vfqHndkbW8w==
X-Google-Smtp-Source: AGHT+IEZ4MmWEqJ4zcjlEgRxSK3Lw+dH71yaATrmPGW/tzAa4gHwSjlPd/5GfSIOf/nbPGOdCuFEx5PEaVOpHw==
X-Received: from wmtk8.prod.google.com ([2002:a05:600c:c4a8:b0:45d:24fb:e425])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470d:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-45ddde815a1mr94298705e9.2.1757425002214;
 Tue, 09 Sep 2025 06:36:42 -0700 (PDT)
Date: Tue,  9 Sep 2025 13:36:30 +0000
In-Reply-To: <20250909133631.3844423-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250909133631.3844423-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909133631.3844423-2-smostafa@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Dump instruction on hyp panic
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, perret@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>, Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063644_374898_0727AB16 
X-CRM114-Status: GOOD (  19.81  )
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

Similar to the kernel panic, where the instruction code is printed,
we can do the same for hypervisor panics.

This patch does that only in case of =E2=80=9CCONFIG_NVHE_EL2_DEBUG=E2=80=
=9D or nvhe.

The next patch adds support for pKVM.

Also, remove the hardcoded argument dump_kernel_instr().

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/arm64/include/asm/traps.h |  1 +
 arch/arm64/kernel/traps.c      | 15 +++++++++------
 arch/arm64/kvm/handle_exit.c   |  5 +++++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.=
h
index e3e8944a71c3..e92e4a0e48fc 100644
--- a/arch/arm64/include/asm/traps.h
+++ b/arch/arm64/include/asm/traps.h
@@ -36,6 +36,7 @@ int kasan_brk_handler(struct pt_regs *regs, unsigned long=
 esr);
 int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr);
=20
 int early_brk64(unsigned long addr, unsigned long esr, struct pt_regs *reg=
s);
+void dump_kernel_instr(unsigned long kaddr);
=20
 /*
  * Move regs->pc to next instruction and do necessary setup before it
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index f528b6041f6a..83e6d1409e1f 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -149,19 +149,18 @@ pstate_check_t * const aarch32_opcode_cond_checks[16]=
 =3D {
=20
 int show_unhandled_signals =3D 0;
=20
-static void dump_kernel_instr(const char *lvl, struct pt_regs *regs)
+void dump_kernel_instr(unsigned long kaddr)
 {
-	unsigned long addr =3D instruction_pointer(regs);
 	char str[sizeof("00000000 ") * 5 + 2 + 1], *p =3D str;
 	int i;
=20
-	if (user_mode(regs))
+	if (!is_ttbr1_addr(kaddr))
 		return;
=20
 	for (i =3D -4; i < 1; i++) {
 		unsigned int val, bad;
=20
-		bad =3D aarch64_insn_read(&((u32 *)addr)[i], &val);
+		bad =3D aarch64_insn_read(&((u32 *)kaddr)[i], &val);
=20
 		if (!bad)
 			p +=3D sprintf(p, i =3D=3D 0 ? "(%08x) " : "%08x ", val);
@@ -169,7 +168,7 @@ static void dump_kernel_instr(const char *lvl, struct p=
t_regs *regs)
 			p +=3D sprintf(p, i =3D=3D 0 ? "(????????) " : "???????? ");
 	}
=20
-	printk("%sCode: %s\n", lvl, str);
+	printk(KERN_EMERG "Code: %s\n", str);
 }
=20
 #define S_SMP " SMP"
@@ -178,6 +177,7 @@ static int __die(const char *str, long err, struct pt_r=
egs *regs)
 {
 	static int die_counter;
 	int ret;
+	unsigned long addr =3D instruction_pointer(regs);
=20
 	pr_emerg("Internal error: %s: %016lx [#%d] " S_SMP "\n",
 		 str, err, ++die_counter);
@@ -190,7 +190,10 @@ static int __die(const char *str, long err, struct pt_=
regs *regs)
 	print_modules();
 	show_regs(regs);
=20
-	dump_kernel_instr(KERN_EMERG, regs);
+	if (user_mode(regs))
+		return ret;
+
+	dump_kernel_instr(addr);
=20
 	return ret;
 }
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index a598072f36d2..99a8205fc104 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -559,6 +559,11 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr,=
 u64 spsr,
 	/* Dump the nVHE hypervisor backtrace */
 	kvm_nvhe_dump_backtrace(hyp_offset);
=20
+	/* Dump the faulting instruction */
+	if (!is_protected_kvm_enabled() ||
+	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
+		dump_kernel_instr(panic_addr + kaslr_offset());
+
 	/*
 	 * Hyp has panicked and we're going to handle that by panicking the
 	 * kernel. The kernel offset will be revealed in the panic so we're
--=20
2.51.0.384.g4c02a37b29-goog


