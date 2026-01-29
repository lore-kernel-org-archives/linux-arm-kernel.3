Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8612DD46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEepWOxCVSc1aX29GPbB6p8VltBEKBk11LnhK9lypjY=; b=s07eBD4L0A0LLUL3kKq8kZjYHT
	sAaz4jNhLf+CGEhbOWsBhHZwPE2MkCvpj3G+g5D8bQP/uFh38W3f9AVjaOvZUCuP8mAZ2claijy+W
	Es9yLsIlD95ynUA7PqCQYUgPAEa0qMR8cvaQGaSlqYX6icMeP2GqbvvTLQG7tdf2ZslkRyMRTyLpq
	G8kJ2YRgCs0wI9a9dFeYEyYWX1gP6Jq3chrJe8Cl6sfTCsWVVz6d9tApr55XfG2/sj7Bg87n46Mc9
	9r11lhiyBtN6uDaI/U2Jq6KUbg+hnnfwXJOUxBr9GXB3AWpShTBKQYvFqoI6upiS9S+jAGK58qssx
	/0BmwPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLW-0000000H0V6-3WAg;
	Thu, 29 Jan 2026 00:57:18 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLN-0000000H0RN-1wHM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:57:10 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b871328f6caso35747566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648227; x=1770253027; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEepWOxCVSc1aX29GPbB6p8VltBEKBk11LnhK9lypjY=;
        b=MFqJFNlrEJS6sE8+9e8zSttaQbY44bZXWp012IeRFRTVrtK0AiA/3uqS2AOl+wGqw1
         raqVHtX1XHySG825WUOL1SZI4mDMxRtH4r7wwcJfOH1MKeR0QVlD1Bx+fGpFtxpW9ela
         9lW7HgbULs44gOnw/RDfZ3d8A3pOn+nWLsVGY5c0uOSswKZQpLj77GLgw22+JkDKRGVd
         gZ9MaYnHaku0Mdsgv+1adN90GtgyBsVMQUg26tVhrukbgU1Mj4xui1AwLJ2gReux+wXc
         sOz3bcdXFD950oB+EBjA7H1AvWRsBOaH8gb6uw7aSmZIvNaeIjQ4CDNQ6qYJKl+ME+hK
         1O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648227; x=1770253027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEepWOxCVSc1aX29GPbB6p8VltBEKBk11LnhK9lypjY=;
        b=ewtWn5EYOi4Al7CbP1pOfIpA0GfT8BCT1qHZOxNGpnxI/Tn5+8YVkR9vkAElhsEXeC
         CS9cU1xhybl5zh94P81xMhXR3oFakJt/hLaqfnblxBnLE1jEwnQCe9YOgOSRNAVfE+90
         erOpKp4yTL0FJCk7dHLhjU4nXxQzT1ZhTuDgEIN4rYhBTnyUjKIJiSzTg/X5vwLcJS2T
         OHuZvV3QbI9hqecZokQ11rwi3n/17jdunZ5xoKpNdaSNLzhhS+nFd1wc0l5uncbFomgj
         14M9dOlyrMx8+6Gm016F/OxeQwt9VqOJSvcGaP+Tdhp9daZTqQh8r7JjCqPdKLrco65+
         TDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfkB94NA9aLUbZAR2Nfk4WpD64vAWe9CEh9r+FxUHh4k2cFEFB4tBTdF1OoiaMqxfSQ1t4O4PftW9XdoFae7wA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyte7smnqv0VUh/+y4LKjE4bQEsV2cAKZ2vk+EHRTRsS9ZEjjmW
	V9J03OK5j5FhfeikSG+/hoqA3bhbFf8nIpbOdPw20odKWt2gy3TeHtPIPUuUnE6Lng58xKPOBEr
	qxg==
X-Received: from ejbdt12.prod.google.com ([2002:a17:906:b78c:b0:b87:2981:bb4b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97d1:b0:b87:1d79:bef4
 with SMTP id a640c23a62f3a-b8dab130284mr439369266b.9.1769648227185; Wed, 28
 Jan 2026 16:57:07 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:34 +0100
In-Reply-To: <20260129005645.747680-1-elver@google.com>
Mime-Version: 1.0
References: <20260129005645.747680-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-4-elver@google.com>
Subject: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
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
X-CRM114-CacheID: sfid-20260128_165709_518302_A793211A 
X-CRM114-Status: GOOD (  17.26  )
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
v2:
* Rebase.
---
 arch/arm64/include/asm/rwonce.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 712de3238f9a..3a50a1d0d17e 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -48,8 +48,11 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
+	auto __x = &(x);						\
+	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
+	auto __retp = &__ret;						\
 	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
+	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -74,7 +77,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.rc1.217.geba53bf80e-goog


