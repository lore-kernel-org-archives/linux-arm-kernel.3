Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500FCC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9cyDb93TE0/0D+Ql0u6NLa6G5/L6znrZIx9uJ6XbWo=; b=d85lrrj3IAVK2pXbo1xGHcRN+6
	ABzWfUeE0B7uK/LZxKH+Zm/5BHeOPCpL5o8xlwwubklZg7RsrifTeUEjlTKc2GVIiZ05GSxuC0s1T
	5kwgMkr4QulMgwji0eLsdhmdVbhYTodY49HW+DoUjarxibURL+Ps8dW1a0avx9g9uLar8cned3q4n
	P2vOmdYchu6rud7M2/Tv+rDZsW7vWcFFm8KgLmjmHvmJ7HfVOa1aVrz2sx7SUZJiO+co0Luc8xWJ6
	VM8ylQEWJZlpLDtaU+EXYVoyLN7LvGa6Rnkga57mUFnd9hcbQBDmSUarZKmlUcwJbb4Nd4J3orI5l
	A/Ufd/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSd0-00000009vJu-0mEH;
	Thu, 13 Feb 2025 06:23:14 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSbE-00000009uwD-1LJf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:21:25 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so785008a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739427683; x=1740032483; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f9cyDb93TE0/0D+Ql0u6NLa6G5/L6znrZIx9uJ6XbWo=;
        b=X42ZMJXqsG79vLVF4H6WWEvR0xyiLdJ93n9iiWOdgC36j0h1AV0O3mVWWXqUmo53vI
         bIrmuGvzSrpptQlDirnWAfr3yUz1xF7dun/9YWvPdvcQ5h+jg3K01BrHld/+YOjNZUoi
         iyul7dpih4d3Zz53qv4XKz3H1XeECoSLtpRiq7szIrrMix6Z8ccs3oHPhADhiCrPk7Wo
         AKbk07J+uP0HaPg8w8/8iY2GsR6JY99zDzbYJMO5d8f6LGXgizBhrb7MjVTTA2DOcxwk
         bOs0gw4kpeonE0nMB5x+esgKVlTqOM6D/ovzmHtHZIGXXeB+JAM7NxApJZlzvTYKg+Ih
         XrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427683; x=1740032483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9cyDb93TE0/0D+Ql0u6NLa6G5/L6znrZIx9uJ6XbWo=;
        b=JuD9THos26Pzziz9qN7q8LWokVE5bWDrZaztUnvNDovsK2FBS/NZXO2HuTwX7QlhE5
         bwX4HRROiJ2xbN8yG0nwQ62//GE/gJS8aphbRdTLyNnmeBPG/X5DYrJ7GvviL30Otj5I
         P3fkjRCgO8mg0bk8AXgucpp1JTPNANgU2cui+qClCiMP550nDBYU7exiXP4xZyFiT0+S
         8kgwNLvfwCnScZ44+lENbOEr9md0MEuUgZuGj7sB8Pz0XbawvEVBM3iCSs0uhKVbsM9V
         Exj7vKPTCulynmWl9PKKPCmZ1Df9YxBb9Wi8QcjKIClZASJBcYB3EBttTNGQQSxjrAOO
         RSIg==
X-Forwarded-Encrypted: i=1; AJvYcCWPuF0vHF98EAspEHdkVjEe6ejp5P7jbiigLMRE05Y+9EYBf2X1wPINqTWBNtdIimwqHYbx+pBKhl0EuA7nqNTI@lists.infradead.org
X-Gm-Message-State: AOJu0YxlBOF3YxNnlcKDt9KK9Ja1VY/TBdniS8HU8+j1BcDEIRbqhytH
	rWkDcEkcrffldwUWPF+dqLY4jVIa5s6LvplFh5HE/uhyC8CoMv0crGtyFcF69mPtxOwoLtQ+7Mm
	ibhh7i7QZNiTVjjW0b8HSKAIbgWc=
X-Gm-Gg: ASbGncuZQ9Ui12JgjMwca6zDyfhSVUUMEGrD2EBOm+KiLeZ8dzKowHkQIxqXXg2b3H1
	JnWohNb6CgMTJV16oZm/IUlh5HWzvLmPp7+fbH4mLrLKSAzwQ35olGLU9D2wTe41OMWwv+tAcsA
	==
X-Google-Smtp-Source: AGHT+IHrm5By/28fx7ySfNVi+JhpEMb9EuxiDvYOgbwjenRd2MLUXZ43hSkCiR1DLOCGk5FM46gnlv7cC9iyM6xN20A=
X-Received: by 2002:a05:6402:51d1:b0:5de:6038:7572 with SMTP id
 4fb4d7f45d1cf-5deadd935demr5083640a12.10.1739427682686; Wed, 12 Feb 2025
 22:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-10-memxor@gmail.com>
 <20250210101730.GI10324@noisy.programming.kicks-ass.net>
In-Reply-To: <20250210101730.GI10324@noisy.programming.kicks-ass.net>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 13 Feb 2025 07:20:46 +0100
X-Gm-Features: AWEUYZlCllGUxdyfURvBU-PhlFqaVJ1z2l67g6FO-tnFM3hCsuO7r-OHUZ-QUsA
Message-ID: <CAP01T74hRYCkrqz4JKqXH7ya0ykBfX4_6611q-TO52o1TZsfjg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 09/26] rqspinlock: Protect waiters in queue
 from stalls
To: Peter Zijlstra <peterz@infradead.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Barret Rhoden <brho@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, Josh Don <joshdon@google.com>, 
	Dohyun Kim <dohyunkim@google.com>, linux-arm-kernel@lists.infradead.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_222124_356563_055DF96E 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, 10 Feb 2025 at 11:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Feb 06, 2025 at 02:54:17AM -0800, Kumar Kartikeya Dwivedi wrote:
> > Implement the wait queue cleanup algorithm for rqspinlock. There are
> > three forms of waiters in the original queued spin lock algorithm. The
> > first is the waiter which acquires the pending bit and spins on the lock
> > word without forming a wait queue. The second is the head waiter that is
> > the first waiter heading the wait queue. The third form is of all the
> > non-head waiters queued behind the head, waiting to be signalled through
> > their MCS node to overtake the responsibility of the head.
> >
> > In this commit, we are concerned with the second and third kind. First,
> > we augment the waiting loop of the head of the wait queue with a
> > timeout. When this timeout happens, all waiters part of the wait queue
> > will abort their lock acquisition attempts.
>
> Why? Why terminate the whole wait-queue?
>
> I *think* I understand, but it would be good to spell out. Also, in the
> comment.

Ack. The main reason is that we eschew per-waiter timeouts with one
applied at the head of the wait queue.
This allows everyone to break out faster once we've seen the owner /
pending waiter not responding for the timeout duration from the head.
Secondly, it avoids complicated synchronization, because when not
leaving in FIFO order, prev's next pointer needs to be fixed up etc.

Let me know if this explanation differs from your understanding.

