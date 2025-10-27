Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60FBCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=EKzyB0lrI1vv7+y80GeaggsaapcXMx0ewLMg7+vmnx4=; b=vqesu86obaSahs
	VhvmfDoZXPTohHAHz1cufSj0u1QwDLLsoaSXU6rxdDuBi9ptgRGJ3q9Oe0M2L4e2NGxZdjye+GQiC
	XU2GYQLOFXVMjkAAZVOfekJwO6vHg5GtsIDNpVkl1IbqEaGYWVqF+loloDnGkKAsUNMflxLjVotgA
	5hPz1Xiyiu0Bkx4wAr28LxIkAZ+g0STBeML/w8wo7Z30ETMItCejzmPatteWCqFDiRHJKehRLuw52
	OL+kpzUMzpv7qY7nVr6YTxaVUuMhZZKmnDMzZ8hvxlrCWBSkejL6C25LGtGbHyNSyxV8CPYjl/fez
	JzFCOzq309SBdKK+bo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpZ-0000000DO6E-1RnA;
	Mon, 27 Oct 2025 08:43:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpR-0000000DNws-2ViM;
	Mon, 27 Oct 2025 08:43:53 +0000
Message-ID: <20251027083745.294359925@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EKzyB0lrI1vv7+y80GeaggsaapcXMx0ewLMg7+vmnx4=;
	b=f7URCY0TR9ngNx+ZE1kYF399YPHlCW2R464N5D1nINUxLVUiedaieiKbYdrtnyP5kNjN0S
	5KssZ03JP1lyw2KPiALYSsZa/q6vKSn+CzHBkjnk8xqYfH4muQNFqw+T+qRjnc/0hhq9Bo
	wRHycNe6JmU69bMgYxKgtgYHCEMMDBGovCmj7rIKGpZHQyN3jBty20W+u10BfNO7bpjM43
	xrTn92A+2N2yyo9uiLanEt0BYKc2uAacE6bah1ytK26+xwgY33tfuL/iEWw3gufhZYW/UN
	O1ArHPyolf7kgV5C7h1MKCVG4+OuP21b9CnAxz7kJXdHu5zqs+gl9xYoYdanFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EKzyB0lrI1vv7+y80GeaggsaapcXMx0ewLMg7+vmnx4=;
	b=6ORfe7vGObPfrhxyRUXWtMNjB8eOm7ffGS2wmPG+hUOUXR0gNG822D5Mj2JN/tv/It+Bhy
	5UL5oCN2ZCcSYcDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
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
Subject: [patch V5 03/12] x86/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:43:46 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014349_818039_A626A95B 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: x86@kernel.org
---
 arch/x86/include/asm/uaccess.h |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -528,18 +528,18 @@ static __must_check __always_inline bool
 #define user_access_save()	smap_save()
 #define user_access_restore(x)	smap_restore(x)
 
-#define unsafe_put_user(x, ptr, label)	\
+#define arch_unsafe_put_user(x, ptr, label)	\
 	__put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), label)
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define unsafe_get_user(x, ptr, err_label)					\
+#define arch_unsafe_get_user(x, ptr, err_label)					\
 do {										\
 	__inttype(*(ptr)) __gu_val;						\
 	__get_user_size(__gu_val, (ptr), sizeof(*(ptr)), err_label);		\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
 } while (0)
 #else // !CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define unsafe_get_user(x, ptr, err_label)					\
+#define arch_unsafe_get_user(x, ptr, err_label)					\
 do {										\
 	int __gu_err;								\
 	__inttype(*(ptr)) __gu_val;						\
@@ -618,11 +618,11 @@ do {									\
 } while (0)
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)		\
 	__get_user_size(*((type *)(dst)), (__force type __user *)(src),	\
 			sizeof(type), err_label)
 #else // !CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define arch_get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	int __kr_err;							\
 									\
@@ -633,7 +633,7 @@ do {									\
 } while (0)
 #endif // CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
-#define __put_kernel_nofault(dst, src, type, err_label)			\
+#define arch_put_kernel_nofault(dst, src, type, err_label)		\
 	__put_user_size(*((type *)(src)), (__force type __user *)(dst),	\
 			sizeof(type), err_label)
 


