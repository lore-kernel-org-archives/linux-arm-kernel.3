Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70335CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Q6hUKo07m0tisXGEHl1vXx2So4mSCWEC1HB29LLd09o=; b=nH1bWAFnJwq31Q
	N9JVzxe6UQyrnyMmAB8/l2D9vZufaDg1Fzo9HdCDYCAuX/Dz8fQGArIOzYSMrHQw1ZUfbvwC9b0cV
	EqdpJIfGx5IcRJSt5gtD6l+Wez1WOXRay9nd1jRkwV96PwU4PcVKVf0jas5RWParGJsnIUTSxJCnY
	aiaBpS4vjqWJrvrm5Jv2hFAvhdF27+NoLrpmMapDee8kEnQ9BhXyJap7Nh9CHjjFjmRhWZb4FMajk
	jlPKtUiHqj5/F9q026+3qjn06jJQzWIPWRsc19DNmn8i3FR8VAfIjC4mBda06vLScOS3O2tKYNnq/
	gz4JUSV7XfMVdiv8MOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOb-00000007SAd-3Q7p;
	Fri, 17 Oct 2025 10:09:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOU-00000007S1A-3cct;
	Fri, 17 Oct 2025 10:09:08 +0000
Message-ID: <20251017093030.128245987@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q6hUKo07m0tisXGEHl1vXx2So4mSCWEC1HB29LLd09o=;
	b=iRDn9Ds66dol6j24A30mh2SQtUvITyG3hB/sYj16fMeHXdbzKXF/40bEicbNhI1HqhEy2a
	XwJNVm7JsPl7VOL4PYqfeA4jhZ8UNQ7x2r5M3BJh8tvw8CpneBlnbl4/F5BX/Li3PY2gI3
	cztXpiCba9mg6mPEQXFl9XWMzaNT1JO2a5rCrp+9UX2jlpA6IiGEzEnfAhTTuNcIPKxyJ9
	vTeYhZ086Z49Ve9WCGCplqFZo+b6fI6sa2T6ud3qheeoctm7xVI3CbNFvWMp39hgufFxln
	RCGgAELL/JamHlyFKxPAn0MGA/h1VCMA1/zGJzKu+RCy3OCwd/ErM3VeyfFd+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q6hUKo07m0tisXGEHl1vXx2So4mSCWEC1HB29LLd09o=;
	b=1we+Ka3NN45ZBOtjqeDCnoCSfPJah/aMjLBMgVfVCGTo+wL2wzcKrUfn1l/8ZpnTXWkF1s
	hVnmL//utitoKnAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V3 05/12] riscv/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251017085938.150569636@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 12:09:04 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030907_071746_ECF29852 
X-CRM114-Status: GOOD (  11.31  )
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

It ends up leaking the pagefault disable counter in the fault path. clang
at least fails the build.

Rename unsafe_*_user() to arch_unsafe_*_user() which makes the generic
uaccess header wrap it with a local label that makes both compilers emit
correct code. Same for the kernel_nofault() variants.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/uaccess.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -437,10 +437,10 @@ unsigned long __must_check clear_user(vo
 		__clear_user(untagged_addr(to), n) : n;
 }
 
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)			\
 	__get_user_nocheck(*((type *)(dst)), (__force __user type *)(src), err_label)
 
-#define __put_kernel_nofault(dst, src, type, err_label)			\
+#define arch_put_kernel_nofault(dst, src, type, err_label)			\
 	__put_user_nocheck(*((type *)(src)), (__force __user type *)(dst), err_label)
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
@@ -460,10 +460,10 @@ static inline void user_access_restore(u
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
  */
-#define unsafe_put_user(x, ptr, label)					\
+#define arch_unsafe_put_user(x, ptr, label)				\
 	__put_user_nocheck(x, (ptr), label)
 
-#define unsafe_get_user(x, ptr, label)	do {				\
+#define arch_unsafe_get_user(x, ptr, label)	do {			\
 	__inttype(*(ptr)) __gu_val;					\
 	__get_user_nocheck(__gu_val, (ptr), label);			\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\


