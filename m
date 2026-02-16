Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203E3E81A2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYdVr7BD//ML3cPspm8e51p1r/jn9khxfOY35saBUOQ=; b=Q9d7YHX2cTBnLb1q7NY4hIV2d5
	cZ0KfeLs2/eVzHp5KGtrPVbmGJLL/6EsjelxQdVVUx3s/rsrxpwscr3r+s6A/YC6WocgdS+tlBlJp
	EsAZwjIOiHcLZaP7n4d/gxEqQcv47ZYcB3UxkZmMthk3a46+G4NPnCpk86R9fuaMYd+5NWZbTxRSL
	MY5nRJ4OURqow7l4z5HMyFPGFQrrN+WmFSALVbIdJzBoExn6lkuWJ5Zj4yuzXrKnEBTKJrLly6kJZ
	YKhxYf7b/LRQpbDKNHNVM2rdrHZzh10yW2FH23AJWhSv7WYYCKYI0xJNHu2U05ZgJbgW1nN/53Mbr
	C+sgv5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzwA-00000006oxH-0MVL;
	Mon, 16 Feb 2026 14:50:58 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzw7-00000006ovM-1Y6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:50:56 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4376c206493so3100233f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771253439; x=1771858239; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYdVr7BD//ML3cPspm8e51p1r/jn9khxfOY35saBUOQ=;
        b=UiUYv9iXyjzIB1bhqPYhdKWyy2D6iNkpKEa2xWV2ZEvsoX+tGe2wY0KACizZm1TG67
         ZDUD0UPxiWcOz0/pPWxP9vCGEozDDVPla/3gKJc4rAM9kpAmStIODw/SVLz1R6VESqri
         lfQ66bveAQC82fEyr0OkWYBY6RwvHglw32dsOW7brlPD3/aL0WgKse1YrbtO4ooTxwyp
         CBny3U3KCiEjS4EXN4H2ZfcKnrdmnMtGQKakUAOojukpZZYVupgmSIPZHur3RfvJ3fOK
         HtYiGWGlP+CwTpx4ZtveDdjpyrQGSfSzfJevxdg2ZxDzqr5OhNBrZC91uUfCd0TLwZ1Z
         srvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253439; x=1771858239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYdVr7BD//ML3cPspm8e51p1r/jn9khxfOY35saBUOQ=;
        b=mPNe8N+HdVJn4lcEc3PmS1BT8L66HCvOuOMB3gqr8zqN/lqc6e6L5n5OjMmhRKsQIl
         xPtCMqwJOAUTcAgmQnQimlMi3W3IaLi+CyZZHBfhgNEYHDhUYGbqNcRUCDPFea37qUCO
         Ib4MMbxq5U+uaICK/GWzoPauW0ooDyimNIInXNQ1hJcmUIBjfXWXVxoHFSF0ecOQAu2B
         7OyjuZMwLO7akADMknBzZaZ+K+FnfWh6nFBMoo+wE0AfiRONxW6MJPf9tfOAkAUnzjcC
         KLe2FSTOYeO9cq39WeEH9y+j/JMJTI9BGRLUb5XnTU0XbiEbkxVsxZq5MxaqvBXg1osb
         8ZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5XRb6TF49R7KnDtGME/7FBoDa8K2Yyatbs7HxgNXeIKZ4Ac4BfKe11a8v5bahAjwIeFfDLEfOBWHKL9MWYo+G@lists.infradead.org
X-Gm-Message-State: AOJu0YyieE4ut4PDt81d+Zx1Rkd58q+THjOxTdX1eUBhpop/LQrunp+b
	KXTSbGYuRvM40I0eTTkvul9Y6MQ6bLzAekq0JOhkYzJZtNeKZKqNnk4vtZzzZpLWNC9waodSWZO
	vcw==
X-Received: from wrqa11.prod.google.com ([2002:adf:f7cb:0:b0:437:72d9:7316])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:613:b0:435:a0ca:bdca
 with SMTP id ffacd0b85a97d-4379dbae796mr14728899f8f.57.1771253438836; Mon, 16
 Feb 2026 06:50:38 -0800 (PST)
Date: Mon, 16 Feb 2026 15:16:23 +0100
In-Reply-To: <20260216142436.2207937-2-elver@google.com>
Mime-Version: 1.0
References: <20260216142436.2207937-2-elver@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260216142436.2207937-4-elver@google.com>
Subject: [PATCH v4 2/2] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_065055_421783_4FAC8617 
X-CRM114-Status: GOOD (  18.73  )
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

When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
could see:

| kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
|      982 | }
|          | ^
|    kernel/futex/core.c:976:2: note: spinlock acquired here
|      976 |         spin_lock(lock_ptr);
|          |         ^
| kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
|      982 | }
|          | ^
|    kernel/futex/core.c:966:6: note: spinlock acquired here
|      966 | void futex_q_lockptr_lock(struct futex_q *q)
|          |      ^
|    2 warnings generated.

Where we have:

	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
	..
	void futex_q_lockptr_lock(struct futex_q *q)
	{
		spinlock_t *lock_ptr;

		/*
		 * See futex_unqueue() why lock_ptr can change.
		 */
		guard(rcu)();
	retry:
>>		lock_ptr = READ_ONCE(q->lock_ptr);
		spin_lock(lock_ptr);
	...
	}

At the time of the above report (prior to removal of the 'atomic' flag),
Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
this as the identity of the context lock given it cannot "see through"
the inline assembly; however, we want 'q->lock_ptr' as the canonical
context lock.

While for code generation the compiler simplified to '__u.__val' for
pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
much earlier on the AST, and (b) would be the wrong deduction.

Now that we've gotten rid of the 'atomic' ternary comparison, we can
return '__u.__val' through a pointer that we initialize with '&x', but
then update via a pointer-to-pointer. When READ_ONCE()'ing a context
lock pointer, TSA's alias analysis does not invalidate the initial alias
when updated through the pointer-to-pointer, and we make it effectively
"see through" the __READ_ONCE().

Code generation is unchanged.

Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Tested-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Use 'typeof(*__ret)'.
* Commit message.

v2:
* Rebase.
---
 arch/arm64/include/asm/rwonce.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 9fd24cef3376..0f3a01d30f66 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -42,8 +42,12 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
-	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
+	auto __x = &(x);						\
+	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
+	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
+	auto __retp = &__ret;						\
+	union { typeof(*__ret) __val; char __c[1]; } __u;		\
+	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -68,7 +72,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.335.g19a08e0c02-goog


