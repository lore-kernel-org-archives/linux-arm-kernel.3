Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1694C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzUqR1jHKNDNB1MvP/C818suEL+5EgmWCT+bBhmdbf0=; b=bF00oyqmYCnceb/HtTUZtnt4Ya
	hIboL8PrHgfviI4xchocYwFWIk05788uCN3bty1Hibq+qQ0Hal2RbTSdOW4m48SsQezjRaOBOO81I
	N+rMkypZzzjarYqEeWye/SHXQIkSo5ChTnmL5EUYOq+MbdjwswyFdAWXdyUkpAQ72AzVBtF3QpHZ8
	T0lptdtrAU3I06uzXz6JswAid98eJ7YVgRQSPaIVQj75TzGMGDDfA9MJv58BlPIZbRhYjubSRNMIN
	HzsiDdRbPBlmHETXr0Rja/VcBhMy2sXFwZNuhvVNRCEQXDn19caBKHOtL/XEA/xnvCC9GgYswPuSu
	grnbIJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6H5g-00000001v2Z-01B4;
	Sat, 19 Apr 2025 22:55:16 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnC-00000001sjB-0r8u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:12 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so3370368e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102168; x=1745706968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzUqR1jHKNDNB1MvP/C818suEL+5EgmWCT+bBhmdbf0=;
        b=U+R6uL/leDWp+PTHEUcVKo0BKkSWWakewqv5gP2Z0xE3kpXmWywb/QpaPlEukU5slL
         f2Jtj4LDbnhpaIVf6w/yXyPsGd2y2MX+Wg3IOU1XhnJO5ZEfNg0mYBC2K3kv2WU67Ivq
         6J84g0W1S/X6DdK7G6gHTc1bpYqmX7hABp7oSg9NxTj3yscJRsp9rWniEYnAN+mY2mgF
         qlybYJbF/KWPFYFovph4AD69JKT8YuPnuyn/9vamQjmUd1UKVSA2qr3/MpErvBNnPcUd
         ZHC0PlyiFP5LhhmTXu17b+alrZjxgfmC/BWskMN4VqqDrb4TBTCcPq7KPZldSil3iUud
         Es5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102168; x=1745706968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzUqR1jHKNDNB1MvP/C818suEL+5EgmWCT+bBhmdbf0=;
        b=TiilwsYIlMtm06RfP+yYkwyEmVCDwA5DOVEaM6ywx63eqgETQcJhM0VEzf1wFFTkrT
         1MBrSsxnLT99E9FIu0Kybb/P13Rk30qqlqRnk/h71zlLYretP3Qvyft4h3oCBou0IPoe
         0iYqouTHXJ9GAbCPGlaGDBZ83nlpO2QSr9jUWajJfqAkmXRKbTNf0MtB39QWifJp6ucy
         lYPj1GX0UT/DLRN1oFVoixFHZ9Q60ON/aCChoWIhUHjo9uMW+hg1HMikGaDXulFCE2Pc
         Kt0OqnG9bYynTaXoHO6DHVFufLpWwQOZEzxkcfZINAXBVRcGLBZOmFZgDh64x9IgAhxE
         tcGQ==
X-Gm-Message-State: AOJu0YzV7OaDtEx5D7NCxNJFRRRcSz/eMmz3yWArlvcXepx6Ie9ZRESY
	Ozu+wo9WvgLYq1ZZOf8YXNaQH99SfF8z2IIXj6vXIboz5v3xe1jSC+wptCjTJjE=
X-Gm-Gg: ASbGnctpzZY0qihmaEHQr9TAm24aypngSbm32+Ap0QB6YHqTMZZf4ZbU/UpprlgO3yB
	xHTmvraFGGCYvUyQwo7odRDu7MA+aaPsa3kV0ZjMx2t6kqDOXyDf5pL+Ml0lJB6OpdjUUE6zkN2
	ILl2KrxqGSMsOto4D7p1ivZT4jUxWXFFfktT8JUEIsixKgch4EwUShN8ZzFxPYZq/l76GJm3mM2
	Yqzg+seb5mrUGFjliapNsIfqXb2Yc64ru4W+mpS4MN2NLoohGfmB31DbW0v/PDJ2kloWxNuOQ3B
	T1emcqUGO63DH14bLGPIa60XXb3h1yqSEpi2WLrQxOnHdpEHLwI=
X-Google-Smtp-Source: AGHT+IFmea0W7fyk5E36UX+d1KPazK0iLChsYY2dcspCJddLKNCeOYSi+wYuBVuxVxg8eew0JWKzvA==
X-Received: by 2002:ac2:4c47:0:b0:545:2cb6:af31 with SMTP id 2adb3069b0e04-54d6e62cb53mr1849382e87.15.1745102168217;
        Sat, 19 Apr 2025 15:36:08 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:56 +0200
Subject: [PATCH v6 09/31] ARM: entry: save the syscall sp in thread_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-9-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153610_249542_C1FEB43F 
X-CRM114-Status: GOOD (  19.52  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
index 123f4a8ef44660a39c4eff2a6e5fd86cb48fb572..291de33ec53d11d87d39d9b87c3c82843e4ebbe8 100644
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
2.49.0


