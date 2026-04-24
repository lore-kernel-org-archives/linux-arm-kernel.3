Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E29FB44C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=; b=wxrLMyrqfJO/GiaFTmQenawJJZ
	w0+LRh2aHPCLmgmmrj+ZcAaQgIKnLKzM9coGfU+IqCBL1u6UN/X6yd3Z4KkDjVQjwkNOdvSGBs/3v
	j+F1ekobyqj7DwBjbQbI33SsIHOZp7vduu+Tfd9TReGY/ujYBGL0d1WCMlv9bmziSEAMDu1oc26F6
	feaxDOUQstYe8OIdtcIn/+6uGW7j5MJ9PEWHFa8Gj3NRSohNFWFRtgk+KlbsAgnH355/0Rj7t8e81
	zVd4QmTY0LYiFjLHsxHe+htq9p4hXdStUonFm/17/s92W2ryJk3W101QYavmxxXpYAJmYNqMO+43u
	X6Ix9rFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBy7-0000000Cs97-0YKa;
	Fri, 24 Apr 2026 08:32:59 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBy1-0000000Cs8j-3CTi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:32:58 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b936331786dso989585666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019572; cv=none;
        d=google.com; s=arc-20240605;
        b=cFChGXOc3DP3wC2Hmu2vjtPRZRflpBMLu8dLLkurjDaOMLn5bsyqpQr0fo6iDUBedq
         w+qMdZIQzb6l61w/pGwX5sXAE4qnZV+o0t3l8HgHpiOlQE3FK1U+pu0kj5tV0PgfBXOB
         jm4vRYC4W1HFCESUcSP98/svOw4FUzQSc86Z3e+mx4AnYqh9rOB+atIh8OzCA6B4GzB/
         XUsfPSM7NPBMsyChTlZ/Ops3ArIiK8j41PFV/QTAfuu+5hLarilLyyvwm5hQ4SM/nHa+
         YfZu4DPKnX2CtZ5b1LNgyfIjYEdttdqB3NQ/ynnBla1JzCVOiAJJbISdkkgEOAc7o9wC
         YWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
        fh=0gTkPR2y44HnishM5BnpK/fMnBb/kQTi0kedG/kHd0k=;
        b=ZSUBuSt6jOV06QI1bPIzGtfQV0fG1HD9Z7kXIOCfgqJvfIlMOjVv8w8GmfYfQ4Khy+
         Ml60z/UY4YmWSOrBUz4HdD/6roIW/2bzYWVcToMHD0tBhXPZNtPE7Rrku0P+GOBdGIjD
         tpABIwMmIum10sjradYe1R6Nf1hYyWshn/UAbSeF7tr5Al/2ZLs53b+SuQZHiYAr2O/0
         aDHHaS7XU8CBGFLW4v14eOIBsVXP3NT21yFHGBGEv132MVUrUUKzDjfIxklfyZKW5saR
         dLkDc9Eqs4m/8WvKdbtr53b+csoQgGS+tbtdeRS4vJoqToQIlQBq4LdDdXoVUPhiYcac
         JP3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1777019572; x=1777624372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
        b=aV/XT7wXKjMGXIjo+iX/bl1I7ofrZVwFTN2H9lSEqexB9a0MuC3jdSDmQpgnt32hnu
         Y6Q8kcNB8kBlL/ZWxmg+NRqMyPb9/SNTWcuVv72JSbb+YYMzukgXk2+fYaePV5JLPnUm
         dS8M29FZF4htf+j21LXRn7f2WjUC2XD5aQm/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019572; x=1777624372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHd592fobwdTWqnUNJFyuiJGQEtz3MizalfeABFs5so=;
        b=pcDq2r8NSQStqos0GxQ7daWzVWYHrAQ5PRfYAwUrUHf3XPfYf/45/LRbpFnEtnO4bx
         DF3UtHByr5uq7l55mkbBUVLXnbddpunasjck2tqdnsu4Nj61vWuT7kb1XJrcpfEYqu1I
         KQsKMyj1zyjQgko/JJkuC1Eld1o99BLg0Ej5pRdQ4fxQle99HMO0vdeS3LXCIq/ZPlcG
         TWuqkNNvu2HrJdUmiOLUdk3322vVnnKMf0utj1tgnsQb6nsCr4tI7cbQfk0QIx3M2oJQ
         SmONioZuFojVm88mXSVDOWBBPHxUI2+XfG5XqdQQXbn7MkQHufyGDch8LDjIFQwmOnvd
         IbTw==
X-Forwarded-Encrypted: i=1; AFNElJ/w572ATSAOt+FCvxoLviiihR1TlQbc0pBIaBQ7jwAdZjRjqZKe20tm/9LMBndUi2cs0NWYQ+GlBKk6KQ7YKLp3@lists.infradead.org
X-Gm-Message-State: AOJu0YxdaT7v7Ms9Eqd3FuhOaurVO53dFktCGI0ho5mv5X5txLyHuj72
	JecHkkjROyzIa8Fj1ELJk2YpG30nDgKFgSO/ssMamOXzbVGTUGNktVTyowy8R8UVkQ+H8QjUEZJ
	topdGUeWxcB4AasfvElgCiuUsqjAfnUZpns+yDVOQlg==
X-Gm-Gg: AeBDiesLeTLvcyedgZ1p19Fb9LFJPRFSNIemmgRT5HrEgbzHv+9cDHsYgv+Vu4emUAr
	s4vw2fPBkY5vmiTW/RLKSy758wA9qWUP0HOpM/U/3d6dF8aL74xGNPidYuup0C4hQabGIB0ThOk
	eHEnpCPTAtpPIHopqGJ8b2ZyWOMzGQWiR8znII0fe1kiBnE6RChzDw+N1LB3JIcnZ+oB+jL6H8/
	SzeM3MRnjqC9lZO5IYf2sTaD7k84gCWRa619JpCCQhXiGI+PMUliOwpt5F+JTtrQw2Fvu6yLCtL
	xIfroQwVmSfSb9QQ
X-Received: by 2002:a17:906:fe4d:b0:b9d:ed9a:5f30 with SMTP id
 a640c23a62f3a-ba41b1dfccdmr1577746366b.48.1777019571404; Fri, 24 Apr 2026
 01:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx> <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx> <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
In-Reply-To: <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
From: Mathias Stearn <mathias@mongodb.com>
Date: Fri, 24 Apr 2026 10:32:21 +0200
X-Gm-Features: AQROBzCHcP8gD_lsen-_9uWdGTZxPs_ZNz8gEN7uOeloBdhtK06l3MK7cQ3RsCY
Message-ID: <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Dmitry Vyukov <dvyukov@google.com>
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
X-CRM114-CacheID: sfid-20260424_013253_873689_DF64ABEA 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, Apr 24, 2026 at 9:57=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
> > So if the code only requires to know when it got rescheduled to another
> > CPU then it still should work, no?
>
> This was my first thought too:
> https://lore.kernel.org/lkml/CACT4Y+a9GnOh3wHKSRwzoKF6_OSksQ8qehnHfpCgkQS=
t_OOmYg@mail.gmail.com/
> The only problem is with membarrier (it used to force write to
> __rseq_abi.cpu_id_start for all threads, but now it does not).
> Otherwise the caching scheme works.

I almost wrote a message last night saying that we didn't need
cpu_id_start invalidation on preemption. However, I remembered that
the Grow() function[1] does a load outside of a critical section then
stores a derived value inside the critical section, guarded only by
the cpu_id_start invalidation check in StoreCurrentCpu[2]. It really
should be doing a compare against the original value inside the
critical section (or just do the whole thing inside), but it doesn't.
I haven't reasoned end-to-end through this fully to prove corruption
is possible, but I suspect that it is if another thread same-cpu
preempts between the loads and the store and updates the header before
the original thread resumes and writes its original intended header
value. Ditto for signals, which sometimes allocate even though they
shouldn't.

I was really hoping that we would only need to do the "redundant"
cpu_id_start writes would only be needed on membarrier_rseq IPIs where
it really is a pay-for-what-you-use functionality, I think existing
binaries depend on invalidation on preemption. Luckily that should be
cheap enough to be ~free.


[1] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a2699=
dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L964-L980
[2] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a2699=
dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L551-L605

