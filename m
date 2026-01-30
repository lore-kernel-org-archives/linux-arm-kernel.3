Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C385AE6BF04
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=; b=1bWTv6wHyLuB/lG0WJNAn4y8Vd
	C3GEamBJ2H5iuwZ8/8SCH3McZsPKd5LU50faKkgc5ZqrgeaBZqveEPKXj+KekWLSmMNQmxtOux/7t
	g6jk2rC0IEyBb+gcmZAyu+VG9LRbBBGS3lEa4KIQq+12YHP59qS809gIqFghrjBVvU8cyBOU25Prs
	XaCxdh/zxBLQtVBLNPhHw1jTeSZew2ZeLp/my4lvfwut+IzpwmLktYPQUPw+hlh3ZHlRRqmDjBGUl
	D+Kb9oJRNgvHn3Ohwqu/JuyPjUqbR7QqHRCCYDxMfVnorxlyOGTCroGPnkNyXe0jdDqH4BcAVEWyr
	Uhkrr2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnFm-00000001SbB-33KF;
	Fri, 30 Jan 2026 12:05:34 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnFk-00000001Sao-2ds2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 12:05:33 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1233b953bebso2318926c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 04:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769774731; cv=none;
        d=google.com; s=arc-20240605;
        b=bpMOF/VkOEBblwu4OMBBECzVFJP8WOH9byeCP8RuA9GULvzGwSmWYzn+IbfhGawHqb
         BTy9cTeW2SPnUxbovJbPNz1WMdeZWKyPH33O2kvkyK/XczlWGs7VMNg7ZxGlBdL4hFRU
         x7K0QDiR10Ht+W0qc3mFP96OCvNH8POTn8UjBIX27jzJGKWelBC2JUIyCUxG9xnR+ElA
         HmvU7MQVQrpsj+1ocAUvkABORUsszCknnDAuaKrwFyGUFZNd8VSV4FrxpiH11UQ9LGvz
         HhtV4Jj2VNRfVq9xx1N0BJSXbZ0vtHLpoRBNfTJtxksf8xRnOS7vgRKbEhQN60JjE9bC
         1dLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=;
        fh=+MqnLBW6IEqHYB3ose8Ov0ZOuZMeveCnIJsdwal/Xh4=;
        b=YgQugXw/FuszU3HKc8fszr0TF7EfGuozYrWJLG3M5G9waA8vx27tcq4NWXA9bAmgtM
         hCR8e6e0jxEQbOlvX879Rw90JaNQpQRGupqv8mrOQaPmOWC30Y2AE2z14zrCrpnKs0nU
         Z47ESjqHVu12UBdxoptZA5rmM/xlUUxvR2rHhZmM7qFWIaefkHw35rrQxs5PkzbVPXj1
         dsWQPUzB00f6+kv230uoFtcd9HbSefg1kUwnC5kXY08wc2J2Ls1bIlJ1I+UsAdNAJob6
         jhYfT0jiU37qGaN3taf/cDhUC7z6Kp6tdsKHF7VYdVWLO4vpni+2yOzV/A8zhl+Fb4pz
         Hvwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769774731; x=1770379531; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=;
        b=zyv+pA1k+4gHy0m6nm1dnVmUplCw9QsHZjhKdS4FjzzS5t4pDjmTHKz6gGOf3jrvAT
         Wm6KoCCsdIYps4cQtpNUkFmhtJjhFLKSCrZ3BiAkvTWjzHr9dgg6tEBcVGkqj+IeysZQ
         /rd3uWDh07rBh7VpcY47XSAtWOIWmD08IS0Ov5vrPog/cbz1MERfl3/8kwOLnOPL8+1i
         4uBEU9kYDn8kt7g+Tdj1KcXDauSXZOSN/CZsjBNY5cTduG9Ux39bc2PncCN+3MwH/E+3
         VyB20CAYaQ2BBkRCnsgM8dXYzRNNswoejtXK6P3Ro4Bo6hN8sg49c1KDlouZFJksDXpi
         TssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774731; x=1770379531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=;
        b=s/ewwDQnwYaJLJ7PzgMf3q8Qk4fsWscqYExfpi2vGS444LzVK3o49/V4BZn7rGhrdY
         CmI/9+IRcxP1ANlG2lXXjsPxMzHviM0DNLpcnTM43a3I3ilEj9EHDhakEAObL8LogNZo
         7qdOikUx+yOB9pDv5sTxd1CHHFcncRlIzUun4Cs/dduCis/PmkHTtKU9DbIHeMQHX0dt
         eeOUWMuC2ISDi6EpDIsm4wnKZuWqg6fykl73ynigy+3Bh0CHLgLw1aWKr9UvfW7Dqd6L
         qTkWVdJouTtStyElgQe7Qt4rBAHKBPBrwNunnxZ08EOI5AgAYPw5+6iInyIQO0Zqfvod
         JgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR8xlQxPk3L9NjPsZ7U6sKHKl0dA+tDBsi5df0nYv8U1UOCtEphcry2QBFyeMWQ018g2qbq8fX3HhYl8lwtehS@lists.infradead.org
X-Gm-Message-State: AOJu0YwYEFNhYBZWeZwlJ8u+bNy/VFtXb3O2RSkQFoss8HsqPb0wte6i
	E0dF2CxA/aR3jpCtUsREK0YYcTl2zgDmVtgV5M+ouQ1RWFi5kSMfYH4pwPIL/VNzpE37JlXM84n
	VdCFb4Hkaj08HfPeW03Dw48uFSx3MSHG/vxoDVy7a
X-Gm-Gg: AZuq6aKVk5Ol3L9FsPlJ01JqevsJH4DomR1gnpEqAmTgh8VAYaj4JrmAkBn8Qf4c8j0
	I6h7SNOH2/EwoxlvbDXy9J7p+e72DPeuW25Q6Q7K/J4V80ptVr1t/LGpC5THZMnaOsen+2T3Gf3
	eaQtJjVqDcv2qf+FtHrmoTCkJHX6njtRrqVoCD6/kTEFt4CQXbzhlzPjyrcx5ShGtfphHM9T/hq
	Cq/YGYxzRfE/qyPHM+RAyAK4KzCnDsFNkqyyQgo/SKhMi+GksvhrQHPpy0MhSJ5Z+yy2N6c5hLB
	Z1esuqtTo8j385bR670f6oU2vos=
X-Received: by 2002:a05:7022:660a:b0:122:153:d161 with SMTP id
 a92af1059eb24-125c0fa713cmr1267052c88.17.1769774730831; Fri, 30 Jan 2026
 04:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20260129005645.747680-1-elver@google.com> <20260129005645.747680-4-elver@google.com>
 <20260129095219.6a3b8dc8@pumpkin>
In-Reply-To: <20260129095219.6a3b8dc8@pumpkin>
From: Marco Elver <elver@google.com>
Date: Fri, 30 Jan 2026 13:04:54 +0100
X-Gm-Features: AZwV_QgCEUOQyaM6FamGIBtoY0m3tlb8ivndN86S9L9oQ2RkXeS3PyM7AKCtSe8
Message-ID: <CANpmjNMMueMWBKXEyu8Bj69Mdj3CAgnu8DiSW2PY8MWmUap=Vg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_040532_678611_90772DB1 
X-CRM114-Status: GOOD (  29.37  )
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

On Thu, 29 Jan 2026 at 12:31, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Jan 2026 01:52:34 +0100
> Marco Elver <elver@google.com> wrote:
>
> > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > could see:
> >
> > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > |      976 |         spin_lock(lock_ptr);
> > |          |         ^
> > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > |          |      ^
> > |    2 warnings generated.
> >
> > Where we have:
> >
> >       extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> >       ..
> >       void futex_q_lockptr_lock(struct futex_q *q)
> >       {
> >               spinlock_t *lock_ptr;
> >
> >               /*
> >                * See futex_unqueue() why lock_ptr can change.
> >                */
> >               guard(rcu)();
> >       retry:
> > >>            lock_ptr = READ_ONCE(q->lock_ptr);
> >               spin_lock(lock_ptr);
> >       ...
> >       }
> >
> > The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
> > Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
> > 'atomic ? __u.__val : q->lock_ptr',
>
> Doesn't the previous patch remove that conditional?
> This description should really refer to the code before this patch.

Will word-smith this a bit. But this refers to the state of where the
original issue was found that spawned all this.

> > and considers this the identity of
> > the context lock given it can't see through the inline assembly;
> > however, we simply want 'q->lock_ptr' as the canonical context lock.
> > While for code generation the compiler simplified to __u.__val for
> > pointers (8 byte case -> atomic), TSA's analysis (a) happens much
> > earlier on the AST, and (b) would be the wrong deduction.
> >
> > Now that we've gotten rid of the 'atomic' ternary comparison, we can
> > return '__u.__val' through a pointer that we initialize with '&x', but
> > then change with a pointer-to-pointer. When READ_ONCE()'ing a context
> > lock pointer, TSA's alias analysis does not invalidate the initial alias
> > when updated through the pointer-to-pointer, and we make it effectively
> > "see through" the __READ_ONCE().
>
> Some of that need to be a comment in the code.
> I also suspect you've just found a bug in the TSA logic.

Adding a comment. From a soundness POV, yes it's a bug, but I think
reassigning a pointer via a pointer-to-pointer in the same scope is
just pointless, so I'm willing to keep this as a deliberate escape
hatch (might need to add a test to Clang to capture this and discuss
if someone wants to change).

