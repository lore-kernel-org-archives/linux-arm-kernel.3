Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673F8C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 00:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvbtjEj18PWGX0x1t0phF/x8ckso/td4YZy4kcOPVcw=; b=oky7DWb0UZlgCW3DH4eefz53Y4
	ZPer6cl4mDttL5aiSRoDCGpgWZIU5QpolZgwOEq1AEVHC3fzjKXpyPHH8BOSYZtJKfB3olxjr3R+J
	vZxXecsv7o8IludcO0DI0zi7wWfEgDTrVF8+UK9Qkdf45DP1RphXxWnLGlbPCHdbgRrHXpIeqt5GQ
	ZaSuQuS3/MMV2pzoC7UOkxjOZI//19wfGtknoIrLDnKeiIQ54mUuINPO4Lg5W23sRLFXg7evOj5Av
	fto9Obi6kEJc7mYHzF1fT13kOi/up9x/fHgTpdfMITmUIXtFaBmoPYFkh+U1xHaS9DCaP1TtLXr3V
	DaobB/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYZ7-0000000BOAo-1vOv;
	Fri, 18 Jul 2025 00:03:05 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYKT-0000000BMb1-028s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 23:47:58 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b6162a7abdso325632f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752796075; x=1753400875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvbtjEj18PWGX0x1t0phF/x8ckso/td4YZy4kcOPVcw=;
        b=qmsqBRpiPN9a/wFeR0wOugmOJPIRESns3433CAcD5zdqbcV+kImUmx1tW3bAVOogCU
         D7UyWVKzZMdPLEl65MMoHFH45ueWaGCIggDimDKsA5x00DZeQsaXSRNweZtJYSHc/or4
         GdR2TA+GJqsgA7FW+FjbsB1nflj8KEBzr8/xmtdPeH9Gs9ceq4XbC9Z2qFepof1KwZtr
         YBegcL3EDIn5EYS08mSmpPIJG4ffyX9fRdIPMQZi8w7cyjaKNz53nvwfkW7+317u/2EO
         sypTRoBglIwGfz9esLpFMGLNMCtfedVDyIT7/wHGueskd9vdfmp4B7ivtDm0yo6AI6fI
         cgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752796075; x=1753400875;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LvbtjEj18PWGX0x1t0phF/x8ckso/td4YZy4kcOPVcw=;
        b=aTfdoQBHIL/62bMgBMlO8IQ8S1IIQ5ccooeMuNHpLrcd+lFkAgF8tAWNJib7vBseOU
         xtKfZLXBBVtGGMcPwCIrxJNhgU7iVDi5p1fcoM2uZm2ijy1qwKfxbZI99Yg7iaCG+ntB
         2UsNo2gjkOJ+MzmAc3PUvqWLmE/f3lBnE08WOaZwpHKnwo6cZhEQ8rF/VM5UtX8hgfvs
         tOTujCY/3u/n/+3k1TR4zHIHX7a+/4ZdDVRz7+trXWyQWQICjoum4Lz27X+rZeFWinRK
         al1oKpEh1XEVstzYcyJFJwG5MrSCys3M+wDWkxwQHvQbwvyoDCDEsAx9PK+X/A4jEJIk
         IWXA==
X-Gm-Message-State: AOJu0YzMtdsJSqQWXGpbTiPQ7BynD6zfuTKv1Qi2qxLpVDQQCS42BG6A
	JJPW4yck7EPkJGo7pmSp3qTIdF9MQ5JjIxukMe6pGY6rLHtuNqGSsPRUrelcuWKPM5CwXx8TI5i
	J/xqCzCusqfetHyT9ri15ftgt11OHp52zTkaQXn9F0nzegLQN6jmAb7WjUEKtlYUydFMdNeci6X
	y8NVofsklqCNmGoiWblaLOVNI1+hS8peQeoFGoA5xtkVhV86O1wMleKKqU06Gtmqd/1A==
X-Google-Smtp-Source: AGHT+IEqpHOI0zrJb9yR1cFU4cC/jK8HJFkKzvKnqDRgTErFGhbJbdyVNV2Vo7dJPqX0P3eL6UZg+etWnzq0eA==
X-Received: from wmbek11.prod.google.com ([2002:a05:600c:3ecb:b0:450:def3:7fc6])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:430f:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3b60e4c94b7mr6619655f8f.11.1752796074851;
 Thu, 17 Jul 2025 16:47:54 -0700 (PDT)
Date: Thu, 17 Jul 2025 23:47:43 +0000
In-Reply-To: <20250717234744.2254371-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250717234744.2254371-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717234744.2254371-2-smostafa@google.com>
Subject: [PATCH 1/2] KVM: arm64: Dump instruction on hyp panic
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, qperret@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_164757_048956_8C3318C8 
X-CRM114-Status: GOOD (  17.55  )
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
---
 arch/arm64/include/asm/traps.h |  1 +
 arch/arm64/kernel/traps.c      | 20 +++++++++++++-------
 arch/arm64/kvm/handle_exit.c   |  5 +++++
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.=
h
index 82cf1f879c61..0d7e86a95d62 100644
--- a/arch/arm64/include/asm/traps.h
+++ b/arch/arm64/include/asm/traps.h
@@ -30,6 +30,7 @@ void arm64_force_sig_mceerr(int code, unsigned long far, =
short lsb, const char *
 void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const=
 char *str);
=20
 int early_brk64(unsigned long addr, unsigned long esr, struct pt_regs *reg=
s);
+void dump_instr(unsigned long addr);
=20
 /*
  * Move regs->pc to next instruction and do necessary setup before it
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 9bfa5c944379..d692c05e3686 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -149,15 +149,11 @@ pstate_check_t * const aarch32_opcode_cond_checks[16]=
 =3D {
=20
 int show_unhandled_signals =3D 0;
=20
-static void dump_kernel_instr(const char *lvl, struct pt_regs *regs)
+void dump_instr(unsigned long addr)
 {
-	unsigned long addr =3D instruction_pointer(regs);
 	char str[sizeof("00000000 ") * 5 + 2 + 1], *p =3D str;
 	int i;
=20
-	if (user_mode(regs))
-		return;
-
 	for (i =3D -4; i < 1; i++) {
 		unsigned int val, bad;
=20
@@ -169,7 +165,17 @@ static void dump_kernel_instr(const char *lvl, struct =
pt_regs *regs)
 			p +=3D sprintf(p, i =3D=3D 0 ? "(????????) " : "???????? ");
 	}
=20
-	printk("%sCode: %s\n", lvl, str);
+	printk(KERN_EMERG "Code: %s\n", str);
+}
+
+static void dump_kernel_instr(struct pt_regs *regs)
+{
+	unsigned long addr =3D instruction_pointer(regs);
+
+	if (user_mode(regs))
+		return;
+
+	dump_instr(addr);
 }
=20
 #define S_SMP " SMP"
@@ -190,7 +196,7 @@ static int __die(const char *str, long err, struct pt_r=
egs *regs)
 	print_modules();
 	show_regs(regs);
=20
-	dump_kernel_instr(KERN_EMERG, regs);
+	dump_kernel_instr(regs);
=20
 	return ret;
 }
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 453266c96481..de12b4d4bccd 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -565,6 +565,11 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr,=
 u64 spsr,
 	/* Dump the nVHE hypervisor backtrace */
 	kvm_nvhe_dump_backtrace(hyp_offset);
=20
+	/* Dump the faulting instruction */
+	if (!is_protected_kvm_enabled() ||
+	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
+		dump_instr(panic_addr + kaslr_offset());
+
 	/*
 	 * Hyp has panicked and we're going to handle that by panicking the
 	 * kernel. The kernel offset will be revealed in the panic so we're
--=20
2.50.0.727.gbf7dc18ff4-goog


