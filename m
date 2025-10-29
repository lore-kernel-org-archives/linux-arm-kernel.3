Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A365CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFO/V4h4fszx7JmKEX4+pQ6W25t5QSCTuaQ3p7c5bTk=; b=cmdxEzSXk8pv1fK29lnD43J03Q
	iJhVayNVz1bogeb7gSUCo5KGrJeOmV+9bU59NppiioFwWmA/ty+8zSmkf4L1359tigpABVqhP+ZDo
	eNqS/2ZsC12v224ayGwvZE7C8dFSNhY6oOa0XWbll/zp0STaQbWwNazpCFkARa2jYwHadxZbnaNPD
	H05K+QG4Y+ImYsT4Xi6ud6EBANOgVsCl5P1/61xLm+Fhi23ljiSZ2t5UuWVLu1ycyRWFNeLoJsusi
	7BfAxN4yQEU1ZqE93+WGZzCR8Q/1ZJlVDJueWjpvs28+HNC6A6ltKNxi5GIHENTI7YK3MZ2/yTH/o
	Qq4go32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2fr-00000000XHb-0k1y;
	Wed, 29 Oct 2025 09:40:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2fp-00000000XFj-0RoC;
	Wed, 29 Oct 2025 09:40:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761730853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EFO/V4h4fszx7JmKEX4+pQ6W25t5QSCTuaQ3p7c5bTk=;
	b=3sTXMxsIKprUjnsDC66p+RBYJd9y6TZ1M3AyJLTlStJ+fElxuoiyQSYqwAmRVPl9VCYYPv
	e8LoYCTUGlmJz3YFZqzz44NvoEOGiy/HMpmKljmKvp24Xo/prnzqfa7/3zvwo9yekzvhre
	yYozK/wb82vBfLPgjnmd5TLh17uFgGvr/0Gqkf1SgjaUWdbprblGt269I+L1TvWs7Gayln
	Iwd81TagqU8MwWufrGABN3adYripPGFZF4G9Zur3J4UTbrqOMQwefmFc0M5wmTe/7FOd9B
	W/+bAHiStdDK9PNOl3peIdUp5EXACfesjCznurUapyJ3iIjnSjUcdIuZbtYeNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761730853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EFO/V4h4fszx7JmKEX4+pQ6W25t5QSCTuaQ3p7c5bTk=;
	b=Qu2A8dkhT2JhVGdB5ITQtPpq5eKRqmyaPGfzBMENu1kheISQNRLH52GqMZHNnXGu4rwWXY
	EQqPF2Atk1+ec1Dg==
To: Yann Ylavic <ylavic.dev@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, Darren
 Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: [patch V6 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
In-Reply-To: <87jz0fuinj.ffs@tglx>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.231716098@linutronix.de>
 <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
 <87jz0fuinj.ffs@tglx>
Date: Wed, 29 Oct 2025 10:40:52 +0100
Message-ID: <877bweujtn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_024057_432255_167BF2D1 
X-CRM114-Status: GOOD (  18.95  )
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

ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:

bool foo(u32 __user *p, u32 val)
{
	scoped_guard(pagefault)
		unsafe_put_user(val, p, efault);
	return true;
efault:
	return false;
}

 e80:	e8 00 00 00 00       	call   e85 <foo+0x5>
 e85:	65 48 8b 05 00 00 00 00 mov    %gs:0x0(%rip),%rax
 e8d:	83 80 04 14 00 00 01 	addl   $0x1,0x1404(%rax)   // pf_disable++
 e94:	89 37                	mov    %esi,(%rdi)
 e96:	83 a8 04 14 00 00 01 	subl   $0x1,0x1404(%rax)   // pf_disable--
 e9d:	b8 01 00 00 00       	mov    $0x1,%eax           // success
 ea2:	e9 00 00 00 00       	jmp    ea7 <foo+0x27>      // ret
 ea7:	31 c0                	xor    %eax,%eax           // fail
 ea9:	e9 00 00 00 00       	jmp    eae <foo+0x2e>      // ret

which is broken as it leaks the pagefault disable counter on failure.

Clang at least fails the build.

Linus suggested to add a local label into the macro scope and let that
jump to the actual caller supplied error label.

       	__label__ local_label;                                  \
        arch_unsafe_get_user(x, ptr, local_label);              \
	if (0) {                                                \
	local_label:                                            \
		goto label;                                     \

That works for both GCC and clang.

clang:

 c80:	0f 1f 44 00 00       	   nopl   0x0(%rax,%rax,1)	
 c85:	65 48 8b 0c 25 00 00 00 00 mov    %gs:0x0,%rcx
 c8e:	ff 81 04 14 00 00    	   incl   0x1404(%rcx)	   // pf_disable++
 c94:	31 c0                	   xor    %eax,%eax        // set retval to false
 c96:	89 37                      mov    %esi,(%rdi)      // write
 c98:	b0 01                	   mov    $0x1,%al         // set retval to true
 c9a:	ff 89 04 14 00 00    	   decl   0x1404(%rcx)     // pf_disable--
 ca0:	2e e9 00 00 00 00    	   cs jmp ca6 <foo+0x26>   // ret

The exception table entry points correctly to c9a

GCC:

 f70:   e8 00 00 00 00          call   f75 <baz+0x5>
 f75:   65 48 8b 05 00 00 00 00 mov    %gs:0x0(%rip),%rax
 f7d:   83 80 04 14 00 00 01    addl   $0x1,0x1404(%rax)  // pf_disable++
 f84:   8b 17                   mov    (%rdi),%edx
 f86:   89 16                   mov    %edx,(%rsi)
 f88:   83 a8 04 14 00 00 01    subl   $0x1,0x1404(%rax) // pf_disable--
 f8f:   b8 01 00 00 00          mov    $0x1,%eax         // success
 f94:   e9 00 00 00 00          jmp    f99 <baz+0x29>    // ret
 f99:   83 a8 04 14 00 00 01    subl   $0x1,0x1404(%rax) // pf_disable--
 fa0:   31 c0                   xor    %eax,%eax         // fail
 fa2:   e9 00 00 00 00          jmp    fa7 <baz+0x37>    // ret

The exception table entry points correctly to f99

So both compilers optimize out the extra goto and emit correct and
efficient code.

Provide a generic wrapper to do that to avoid modifying all the affected
architecture specific implementation with that workaround.

The only change required for architectures is to rename unsafe_*_user() to
arch_unsafe_*_user(). That's done in subsequent changes.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V5a: Use put in __put_kernel_nofault() - Yann
---
 include/linux/uaccess.h |   72 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -518,7 +518,34 @@ long strncpy_from_user_nofault(char *dst
 		long count);
 long strnlen_user_nofault(const void __user *unsafe_addr, long count);
 
-#ifndef __get_kernel_nofault
+#ifdef arch_get_kernel_nofault
+/*
+ * Wrap the architecture implementation so that @label can be outside of a
+ * cleanup() scope. A regular C goto works correctly, but ASM goto does
+ * not. Clang rejects such an attempt, but GCC silently emits buggy code.
+ */
+#define __get_kernel_nofault(dst, src, type, label)		\
+do {								\
+	__label__ local_label;					\
+	arch_get_kernel_nofault(dst, src, type, local_label);	\
+	if (0) {						\
+	local_label:						\
+		goto label;					\
+	}							\
+} while (0)
+
+#define __put_kernel_nofault(dst, src, type, label)		\
+do {								\
+	__label__ local_label;					\
+	arch_put_kernel_nofault(dst, src, type, local_label);	\
+	if (0) {						\
+	local_label:						\
+		goto label;					\
+	}							\
+} while (0)
+
+#elif !defined(__get_kernel_nofault) /* arch_get_kernel_nofault */
+
 #define __get_kernel_nofault(dst, src, type, label)	\
 do {							\
 	type __user *p = (type __force __user *)(src);	\
@@ -535,7 +562,8 @@ do {							\
 	if (__put_user(data, p))			\
 		goto label;				\
 } while (0)
-#endif
+
+#endif  /* !__get_kernel_nofault */
 
 /**
  * get_kernel_nofault(): safely attempt to read from a location
@@ -549,7 +577,42 @@ do {							\
 	copy_from_kernel_nofault(&(val), __gk_ptr, sizeof(val));\
 })
 
-#ifndef user_access_begin
+#ifdef user_access_begin
+
+#ifdef arch_unsafe_get_user
+/*
+ * Wrap the architecture implementation so that @label can be outside of a
+ * cleanup() scope. A regular C goto works correctly, but ASM goto does
+ * not. Clang rejects such an attempt, but GCC silently emits buggy code.
+ *
+ * Some architectures use internal local labels already, but this extra
+ * indirection here is harmless because the compiler optimizes it out
+ * completely in any case. This construct just ensures that the ASM GOTO
+ * target is always in the local scope. The C goto 'label' works correct
+ * when leaving a cleanup() scope.
+ */
+#define unsafe_get_user(x, ptr, label)			\
+do {							\
+	__label__ local_label;				\
+	arch_unsafe_get_user(x, ptr, local_label);	\
+	if (0) {					\
+	local_label:					\
+		goto label;				\
+	}						\
+} while (0)
+
+#define unsafe_put_user(x, ptr, label)			\
+do {							\
+	__label__ local_label;				\
+	arch_unsafe_put_user(x, ptr, local_label);	\
+	if (0) {					\
+	local_label:					\
+		goto label;				\
+	}						\
+} while (0)
+#endif /* arch_unsafe_get_user */
+
+#else /* user_access_begin */
 #define user_access_begin(ptr,len) access_ok(ptr, len)
 #define user_access_end() do { } while (0)
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
@@ -559,7 +622,8 @@ do {							\
 #define unsafe_copy_from_user(d,s,l,e) unsafe_op_wrap(__copy_from_user(d,s,l),e)
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long flags) { }
-#endif
+#endif /* !user_access_begin */
+
 #ifndef user_write_access_begin
 #define user_write_access_begin user_access_begin
 #define user_write_access_end user_access_end

