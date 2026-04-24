Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F28FE51F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=; b=KsjcWZYkZHcEXgDp4RDhwXbRXR
	9S3z5EKC08eHVZXZn6Jtf7ijDZRPoHbfXN1eUajHlAqaaeRxtscVkPYOl0vAbK0AvfA7jGrwWGZ56
	Gd+EZcXgCa5IfrZv51sdCTl94r0NKK+cp0u93HmLWYwzy2rme8DC7hV6cXeq8RLX/dxiUGy5BSnOB
	cJ2gtZe38qbWp0tgQjWKfOvqDycixhpJK0ZgfR2p9EMdV71xjuRGDIwOIzy2uHUNfEonItOSXd0IE
	436WWAJQBfV8eH6Zmgj9v4itj8WWpO3YZ+PJ1/5tOE8qS18ypQFaxIR+KphhUeTI/F4paB5wEibPr
	b+WRGKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCsX-0000000CwB1-3fRM;
	Fri, 24 Apr 2026 09:31:17 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCsR-0000000Cw9j-33rs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:31:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a402b2d102so8518918e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777023069; cv=none;
        d=google.com; s=arc-20240605;
        b=i374YUbmotkU7DvKhkHwdxiKkBVqW+H3qVV/vOz4hp/gVcToTZNk8t3nXIza4nMO6A
         wFjUHh0yWXRxWakN5hk7IDfHtdDtdTXRQnCiSVmoEAQ8u0ctx+D71dWgXwQ3czF/1srV
         DPGyeNKfe9CI2xMFrySFz7Zf55dHMJ4DC1A6P5SPyY2xoTcQndIU7ln2gvwdUGxohBcu
         0XW/19mu3MPGwu5oE/e2yvieg33V/fFAbqvh2hH+vD0lgKOCuY/SSlZyXczClSUXE2KI
         4A0efsBtjSUIzocrAOVn0sP9K/QfMAEP+MI38GoAz+yCOTUNWg8GMFXWdMoPEzw5qlcE
         B+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
        fh=MWGX3fgS0RyjIA4OZUzWgTDIobdNhkQqhy+wRI+7Rhc=;
        b=ieDEWLLNVPf7jIybGTPF4YZIzixcqDC0X6kYxf7Dg2WKLFL8dFS9f6BWWWg7jXJAJF
         Cd+m1C59Y+SpLVjsMlUgQGwoqLctTzxnbJRKn27JvoZNe2pFpVDjE9IXQ0rEpz1k/yIv
         H1reHhtmbiZLjiF4DYwIh3QfKjDQ8TkCcrzwlrDJ3dPwVTeH+JmnVrJ9XkBvsIdEJ+Gq
         7HOppVZvTJS4J2kNUSv3saDEhLyOglwaMYdvsNfgbwlZWH/LFtLLyc2tkZNguf/xbtqq
         ulaYC0f4h4+0z6ylx9Yq7jWQyZSX8yRXpHKR+fmrEGH8eA2TomtV6/4CZrnQiumKazCs
         g4sA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777023069; x=1777627869; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
        b=Zu1LINqzzVC9YYFLHS73nNzEZyPAy2gB1/seR/jPQMEltE6JRLcQ2RFGZieY25+mrF
         3/w10Qx/XjaQNA6d15maZBrQ/S9QCwY9D8AniMq5pUH+8sZGbKcVWHWfTOws60vymvjN
         MTu5SLWOF3Jxo2a/+KOO8Egs+hE6ScAcvOp7hlrBLc7EBe+zPM0sUNPwmI+iJGbYDJGQ
         b9Hucu1EDcFUBCLnCva/f2MQJTh7dK0Wk2sWettdNIdeoEg1wz6R9qfoQ/tBc/U3KfjT
         gbB6uRtagLbFo8mCQeqLAW/Y3K3DeAUWsrxl8aeDEu7SU76UVF3zC9DzPcxAzfNXG2HB
         0FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023069; x=1777627869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
        b=qyKWasU/tx8FuV1xEUJrQcZVCKwAr96wJrpISAibg7E9XHOiRf2rD/TBliHXFKFvk+
         8dWtJOS8jLiWJuCEpuxfjVZDZjr+JQUJyHhHZkDku1YyD7sGLzqtRfafKG3EJKAsdDmO
         atE5jn1tTdLkJYPdGheHKfu4vQ1HwsVm6jG5cZtAgS0EgOslmM4gUc9hXkha4Udw/to7
         Cu0+BLHDWW3H5q1ybcmcbCLkGZsK4YpS1ow65rUm2EDXGS0Mv+YBQLNBxwzNudSey4b7
         0B7nITjvZ+OfeSG+8XJgZTdLi5T0hbFeIM2NW2uIr3NdNawItFp0/iCUhBd7JUp43+Ti
         gxbA==
X-Forwarded-Encrypted: i=1; AFNElJ9aY8M0yvMQlc7ry7DZx96na+/62YT/EVp+tyWuXkCuH5TdfOx4IdnEIklFnJGggK4VsLbfEQ7+I4Yzva2G1k/p@lists.infradead.org
X-Gm-Message-State: AOJu0YyXx4VNeNXTsXdhUGbarGfOl7lV2oDnarW7/wgehlqbSmLMk7EB
	pNTCxMOVYTp98ixGzWe6+tCpXIRnXHeItnlC+8tdxNL6+6z2QipTgzi3H1JzCNqPYaSU0UI7EuP
	tPvLDGq4ezWkxw7XHNeDesYYwRyeM0N7HTEZtjP/b
X-Gm-Gg: AeBDieuEaPHqEzQuO8KaZMbFZrPA+ZsxL8ZhtLfkxqAih9eUENQM/GmdkJbMJqGC9zT
	xR+FW5T91ZUaZpyNs0YrNIFWrASFEhf3t6aYV7CgsMlxLK4ZZaLzWHoP0aVmy/m4LOU4X3YgozQ
	8jmabsRAt+yGQRTVLvCxTIpioZtzkQrzkMD+XosH6rFE0bB+peDEFLf7yeBZuIJawfaHiG9ilEj
	epkP3W+GkU3Wfh7fBF6nHbX+gX99tR42oFwg4mCdC44COwKl0LXwm6NnZ+PDi+/XkvktRyguYy/
	8iWOag1iAKa+yHxi0krOu0pKkZCDo3c5uJuHGb9U88t2ap5pG0nIQm7sVhUZmxkLPH6KmWBGM+7
	RRNWc0PsSGyASZRJYXw==
X-Received: by 2002:a05:6512:6d6:b0:5a3:d30b:958a with SMTP id
 2adb3069b0e04-5a4172de887mr7940708e87.22.1777023068865; Fri, 24 Apr 2026
 02:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx> <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx> <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
In-Reply-To: <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 24 Apr 2026 11:30:57 +0200
X-Gm-Features: AQROBzBE4JDXzMDFtK-HkrG9FqByjQjur9lylNZcv0FqInRcXzflA0csSOUyg18
Message-ID: <CACT4Y+bhsxSJhXMvwpRi=Z4tfq54uDicp-Xrp7hmm_qEjKpttw@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_023111_803598_BB1C44C0 
X-CRM114-Status: GOOD (  23.79  )
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

On Fri, 24 Apr 2026 at 10:32, Mathias Stearn <mathias@mongodb.com> wrote:
>
> On Fri, Apr 24, 2026 at 9:57=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com=
> wrote:
> > > So if the code only requires to know when it got rescheduled to anoth=
er
> > > CPU then it still should work, no?
> >
> > This was my first thought too:
> > https://lore.kernel.org/lkml/CACT4Y+a9GnOh3wHKSRwzoKF6_OSksQ8qehnHfpCgk=
QSt_OOmYg@mail.gmail.com/
> > The only problem is with membarrier (it used to force write to
> > __rseq_abi.cpu_id_start for all threads, but now it does not).
> > Otherwise the caching scheme works.
>
> I almost wrote a message last night saying that we didn't need
> cpu_id_start invalidation on preemption. However, I remembered that
> the Grow() function[1] does a load outside of a critical section then
> stores a derived value inside the critical section, guarded only by
> the cpu_id_start invalidation check in StoreCurrentCpu[2]. It really
> should be doing a compare against the original value inside the
> critical section (or just do the whole thing inside), but it doesn't.
> I haven't reasoned end-to-end through this fully to prove corruption
> is possible, but I suspect that it is if another thread same-cpu
> preempts between the loads and the store and updates the header before
> the original thread resumes and writes its original intended header
> value. Ditto for signals, which sometimes allocate even though they
> shouldn't.
>
> I was really hoping that we would only need to do the "redundant"
> cpu_id_start writes would only be needed on membarrier_rseq IPIs where
> it really is a pay-for-what-you-use functionality, I think existing
> binaries depend on invalidation on preemption. Luckily that should be
> cheap enough to be ~free.

I've prototyped this idea too:
https://github.com/dvyukov/linux/commit/1284e3723047cb5afd247f75c53de43efc1=
8db82



> [1] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a26=
99dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L964-L980
> [2] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a26=
99dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L551-L605

