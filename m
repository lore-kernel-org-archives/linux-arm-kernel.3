Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0F3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUy2L+59XSB2dO0W6jnqgQpUaRtZ0LvR6wu2Q9qABCw=; b=rM2Owigs0uqH8xTs8NWqP3yFNq
	rDd7zmAKzso/lok426zfhb2DAw8LOmKU3UpShbnQjNAwx4pLz+RnVAD0TdpqnDfTjYW/Egwk7VkyQ
	crmIk0HouryFpiUvYPkg3lVXn8oyNk7YWc0gylNTT1AJDMdwnvjvDEdYQ+fRIj/uD1uWOmX8v0Fp4
	UV59BSvVz/oiBB1FO1oAwEE8WhqIsTjZPAglbAoFFzT+jGqig1AFN6A0BPePPyr9IOGmuYD11qmof
	3nTHDsTV7eppI67CRuqUW8jKwrnTqsBc7LXjLfZY3nDZ7jsm0/o2mf1Z1/FGbA2jAcJgqUyxMKQ0M
	f9WYrx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB4K-00000007DBb-23L1;
	Wed, 12 Feb 2025 11:38:16 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApp-000000079dn-30d2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:18 +0000
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-308edbc368cso32848351fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359395; x=1739964195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUy2L+59XSB2dO0W6jnqgQpUaRtZ0LvR6wu2Q9qABCw=;
        b=PfLleF3FJZhAg4fNGZykvQMXqrapXK7/oGYhltGHJ20nkr4VuN2gW0WOGItoBWivMU
         ZApB9rTmnIWwkODIKBFAztInmqygz9uBbbSlrX/4I5r4fFLlcAw8VWItPcaZ/fjcChz4
         e60uQg1M9RwiQ9EaURPkSF4qE2DwL2NHW+1LY9etMLZtsR9Lz5opltDld7OHWOnh5A9a
         fHiAZkVjcxuSCVz2vFRTvgkO+XWne1Q/wvQapCLSQinsievMypz+WCyXUHnYKj3EfC3X
         HsmFEy0y3QvhUYvsr9Eza0fw41uN01f+a0LSb1DZA1lRYJHRqxmIeFfiXklsT4du0y4U
         h80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359395; x=1739964195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUy2L+59XSB2dO0W6jnqgQpUaRtZ0LvR6wu2Q9qABCw=;
        b=mFRs6NcCl6/46TieOw40ViXMYGehJVMbVyDLKw/CUgULWtCKQGQdK5yVY630TOlRdS
         9kDDHmDo0rDk8rYXY/te9j5/LJ4MI9RsrDL3UMG+Xf1eEZPmrp+e7l+krAa+7BSV1VOz
         gcPp2exGR4EvuZBW25wMXU7ZJJTD9a+GW0vKv6y3p3FAOBhTf4G+hpQTmNWZvRymKp9m
         lH7rWbFTiMb8b3b2ttm0govOY6t2RI36PtzeQWYS6uRkw/p9pGLeGo2BfZjK//wl4QJX
         i1kQY9fq+3qUXHXBHPL3uF5WqUEt9JXP7AvuCX600CJZKrYJJWeb66tMxYKcdNmEsygj
         Bd1A==
X-Gm-Message-State: AOJu0YyPerKAnaugQhJA/TSoub3hKuCd9JBVlFtcftwRNK4dbIsQFE11
	5dF2Z1plRp/JaoUkigSz2xS08nVSTp6Hk8RPmNhO+EbgnyU+a1CCOfeY5b/P3ic=
X-Gm-Gg: ASbGncseHYhWRFaBlkgfIhGVRd5z5gp3stxja5Ef6Td8Gk4zJT2Rp9curxMHTEOM4e9
	m9S/Pvdaa9JMucMgVrobPemQxBtISipSFjMxqb0PA8ZLd1z/oVMPvihbWTGiSQKEkbNwBBHkFZ0
	meonWTYsU8Dd4KORV/JZAw86MCN1wbqVtIoFeQmIc46vEFRVyS4CpcKurtfFuc1Y8YgAK1GWVQM
	IjAxvOIKiuOZF/OJH52gnv4w1s/auRkrNQbYcujl8Z9mlZ3Ck931QPKa4ADAnGz9GPSqAASnzWj
	UVpZKmS0+dWZn7XufaLJatrGDA==
X-Google-Smtp-Source: AGHT+IHZJ/tBIMRwnLsYcu+g9QAXHEyBK/NodAzDXyRtpuVQmFBcjHxeJrEL5OicySIl+6hJ7MT1qQ==
X-Received: by 2002:a05:651c:895:b0:308:efa4:d27f with SMTP id 38308e7fff4ca-30904fc98f2mr9827531fa.2.1739359395534;
        Wed, 12 Feb 2025 03:23:15 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:03 +0100
Subject: [PATCH v4 09/31] ARM: entry: save the syscall sp in thread_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-9-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032317_811704_3791056D 
X-CRM114-Status: GOOD (  18.81  )
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

We are going to rewrite the syscall handling in C, which
means that the stack used by the call code is no longer
predicatably 8 bytes (for syscall arguments r4 and r5)
but a varying number of bytes depending on how nested the
C code is.

However the current code is just assuming it can rewind
the stack by adding 8 to sp if a syscall is interrupted by
a sigreturn call.

Solve this by storing the entry sp in the per-task
struct thread_info and use that in the sigreturn wrapper
instead. We already have the thread info available in
the SWI entry and sigreturn is probably not so common
that retrieveing a pointer to thread_info should affect
anything very much.

Storing this per-task in thread_info makes the solution
SMP robust.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/thread_info.h | 1 +
 arch/arm/kernel/asm-offsets.c      | 1 +
 arch/arm/kernel/entry-common.S     | 8 ++++++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 943ffcf069d29cf4a035964d20d56f7ebdd6d602..d8a45c5a10496aaf806bfeaa0353d5e8985bd6f5 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -67,6 +67,7 @@ struct thread_info {
 	__u32			cpu_domain;	/* cpu domain */
 	struct cpu_context_save	cpu_context;	/* cpu context */
 	__u32			abi_syscall;	/* ABI type and syscall nr */
+	__u32			sp_syscall;	/* SP when entering syscall */
 	unsigned long		tp_value[2];	/* TLS registers */
 	union fp_state		fpstate __attribute__((aligned(8)));
 	union vfp_state		vfpstate;
diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index 4853875740d0fe61c6bbc32ddd9a16fa8d1fb530..c9525cbb26b73827821aa746030e56b037f49556 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -49,6 +49,7 @@ int main(void)
   DEFINE(TI_CPU_DOMAIN,		offsetof(struct thread_info, cpu_domain));
   DEFINE(TI_CPU_SAVE,		offsetof(struct thread_info, cpu_context));
   DEFINE(TI_ABI_SYSCALL,	offsetof(struct thread_info, abi_syscall));
+  DEFINE(TI_SP_SYSCALL,		offsetof(struct thread_info, sp_syscall));
   DEFINE(TI_TP_VALUE,		offsetof(struct thread_info, tp_value));
   DEFINE(TI_FPSTATE,		offsetof(struct thread_info, fpstate));
 #ifdef CONFIG_VFP
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 3cfc6d952ff99be9c4c1be4481ac3039260e3e57..8baab7f97f59c434396f30b08ddd3029c5f9c0e5 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -232,6 +232,8 @@ ENTRY(vector_swi)
 
 	uaccess_disable tbl
 	get_thread_info tsk
+	/* Save a per-task copy of SP for sigreturn */
+	str	sp, [tsk, #TI_SP_SYSCALL]
 
 	adr	tbl, sys_call_table		@ load syscall table pointer
 
@@ -377,13 +379,15 @@ sys_syscall:
 ENDPROC(sys_syscall)
 
 sys_sigreturn_wrapper:
-		add	r0, sp, #S_OFF
+		get_thread_info tsk
+		ldr	r0, [tsk, #TI_SP_SYSCALL]	@ read back SP
 		mov	why, #0		@ prevent syscall restart handling
 		b	sys_sigreturn
 ENDPROC(sys_sigreturn_wrapper)
 
 sys_rt_sigreturn_wrapper:
-		add	r0, sp, #S_OFF
+		get_thread_info tsk
+		ldr	r0, [tsk, #TI_SP_SYSCALL]	@ read back SP
 		mov	why, #0		@ prevent syscall restart handling
 		b	sys_rt_sigreturn
 ENDPROC(sys_rt_sigreturn_wrapper)

-- 
2.48.1


