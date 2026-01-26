Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385B5E63CB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 00:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzvRauRfmowbTuXqteNercyqQMxwj4TFlVBC4P/9vK8=; b=3cY/mnRCfD+AaU5SGb8TO1yZQp
	+zclAwqOMgkh9RxRHBoHAwiGgW7zLob4TZLlJLYcn/YL0M4YEcTLN6tSgosa8dvIXscHymnYumlZL
	iF2rqvYI0zc0d95AsRfvdAWsBzN99YpJbVQXENW3eyzpmJ9f8hLgCpJ9gdIgTK0vKkM7l5sqkilZH
	MWFCoC17wKd1Z1w1NyJX+3U6c8QddSL782du0oWMIbxKoIt1uJ98FQMRNqqHuThvY/89t1e5x8Y7d
	G4NsO/BVOdYXhvNbZB65optTJ///Jl05cxaSy1XRuSqp3U6j3LIdy3pVk55O39qMfGLTZmkpo/4td
	rQz4WqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXe-0000000BiPH-0a7n;
	Mon, 26 Jan 2026 00:33:18 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXb-0000000BiOG-1OzV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 00:33:16 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso31726795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 16:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387593; x=1769992393; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzvRauRfmowbTuXqteNercyqQMxwj4TFlVBC4P/9vK8=;
        b=V722QcCJ2yqEroy/alDZTxh3q/WlgMIiMWPf9s/KEPmNcHiX6emHJM1ij+eA3mKXJC
         lJnH3YW+0bKprtcu3FJuBy3S5axfgX7iXn05DsHoe6IjfX9dHiYD4uFfUH2vIOCJyk14
         v29ByR5ufXi+sCMiUVsXrwc/xHDt5TLqJWUvdWpPkCJHZKV8fCkQu4srG7Evv+llYtmA
         yvjIxo8rNEB+Sg2KQlIIdgnGS2o3hjlXMmni8ljyOm+8ceUmiCSgd1aYZ9bAKRy2r2QB
         UO7r9jHCDh2/9aJUkmCcw9LFUjyb+TMyFLEjwZFD0LTtM6LehkhL2fjdGj9c4bbrud1x
         dyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387593; x=1769992393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzvRauRfmowbTuXqteNercyqQMxwj4TFlVBC4P/9vK8=;
        b=Yic2+ZdjDjVdTLOuR7yX3bJh4wXq5+sEH8UNbB1w+ZiYezwm8au5kTdzwy5YZSeMx9
         9eR9NcezqlpngKYR5DTQEkkzuc5qNF43xun7JZgUxZMKiDq4XiZgUyTIsSINro9Vk9QG
         21ysqUb6BaL4tXOmV40oPfIYXeHyYX0kwa7x+gi+N9qKDtLyFKT7HwRrtT5TXbDXgEFg
         aFMv7ZwTzGxuY9hzctoEkRaJojOmF/cHGo/RZT+puj9LDlre5DEyq0ydw65SROhqXzuv
         eW8nWKaRlsuCpDekV2mRqKggbClgEySKW2IDE5o0luZIGTDaPVp6NdJ4jM8DZKrRTsn/
         OOyg==
X-Forwarded-Encrypted: i=1; AJvYcCWR6GtjgltssLLSuPbtXPiWj99IqLxwW7wcvbrpDopOId/IMNMAi8tKvlRWwytgQ4CG8Yl4isRhUmqRzR8yocUq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1iS40fRsiw2ljIdok+MPJG304r8/6TCGHHE96TFgbfC+WXmEY
	8crDnBVJnJvlF1su6NYRT1YalblirEMPHoXu8AAukSethoAw13VKDXZ0KcvJxxxIMz9ihvVmeZF
	rYQ==
X-Received: from wmps41.prod.google.com ([2002:a05:600c:31a9:b0:480:4a03:7b7d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4684:b0:47e:e20e:bba3
 with SMTP id 5b1f17b1804b1-4805cd44c41mr51919685e9.7.1769387593066; Sun, 25
 Jan 2026 16:33:13 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:12 +0100
In-Reply-To: <20260126002936.2676435-1-elver@google.com>
Mime-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-4-elver@google.com>
Subject: [PATCH 3/3] arm64, compiler-context-analysis: Permit alias analysis
 through __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_163315_408982_5501DFE5 
X-CRM114-Status: GOOD (  17.63  )
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

The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
'atomic ? __u.__val : q->lock_ptr', and considers this the identity of
the context lock given it can't see through the inline assembly;
however, we simply want 'q->lock_ptr' as the canonical context lock.
While for code generation the compiler simplified to __u.__val for
pointers (8 byte case -> atomic), TSA's analysis (a) happens much
earlier on the AST, and (b) would be the wrong deduction.

Now that we've gotten rid of the 'atomic' ternary comparison, we can
return '__u.__val' through a pointer that we initialize with '&x', but
then change with a pointer-to-pointer. When READ_ONCE()'ing a context
lock pointer, TSA's alias analysis does not invalidate the initial alias
when updated through the pointer-to-pointer, and we make it effectively
"see through" the __READ_ONCE().

Code generation is unchanged.

Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 9963948f4b44..85b1dd7b0274 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -31,8 +31,10 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
+	auto __x = &(x);						\
+	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
 	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
+	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -57,7 +59,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.52.0.457.g6b5491de43-goog


