Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B00FB44C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=; b=C131hewMM0PeEff29TM7UKsXCT
	g1RroYO27oGyhvG7Ir+QUFEp0qJf+rAZImuqSpvt5DNlfx4J5Zz8TEees9s8laCh9jLCUjk4blJZy
	0zCkoBFpbgRDTRvBdpGuuRtflfO/lmhy8os/sD9uHYFjlAXZFJsAIj7g2p6TYmGrDUuycnJx//eec
	PUf8QTqzn+1ZyayyT/Mi72HpS7v9mT0YWslFmt4o9MuKiNgnhJItZwEN6PD6ClmQ3dInjF3mkSZ3h
	34sEAirqv+/4dDeP+GY0rKde04ypctlsmrQ2oZQcZEUznVuDMML8gop4t0/kMjgOd/DJ+GkpM1ato
	CRCIJDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBPV-0000000Cpqp-2mBH;
	Fri, 24 Apr 2026 07:57:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBPS-0000000CpqK-0HSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:57:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a10d130b37so7516273e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777017427; cv=none;
        d=google.com; s=arc-20240605;
        b=cflcuP9MteQQ/iAhhlNTjBhFyi5HteL0Mfzr4bkjH0Sk1myDrwE3w/qg4M62h7xM63
         y7VTMjSiJBuV+Qfy34hgBshoO/U06vpSGv7g7tAv46kUXbUjR+O+u2Gztc/KlLUfl28t
         iWF2dd3Xn0lieDTOi7a8+vRAgAmi9X4nX+vdabDuK+dyldbPVjzv2q7fQ5rJBjsPlKdk
         55kcICLeiT/dNnnFj8iSvNCFBkBThdzmB983pghFHs/+8f9m1e1czvVzNCW/J8HhZxwS
         zGFHg4QIU+J3xit8hdfmIdXIooVA6gEpaOlsQoDta6vW0SSTAc36pmBE522Uq9SL9BCP
         UorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=;
        fh=9splBoJpjaYDa78bYh4H0zGgB76Ppn+A9P/X64tbFXA=;
        b=az3WThxCC7T8H+773BJsde7Yr0WRVc7XHNMg2exM2wAVxoJVzjBpCCIT5x9i8UI2hG
         B1EZannbQjs2lQI/Y5yH+usF3mJiUm61vSsPjMj/+f51j8HgG5M/5hXRFOYaTRwEhlHq
         fWqROn48T3VneYRQpdK+neEBb54teSxd8cJ+pN4ICnlOg+mDbhnKqTO92nlZ+C2PTamh
         U93j40lycmzAwSSG886SpHUlFLV9Y+Q6vpcwymOAr7203+bOYqfrrWQrRAFZG/ISzFJN
         NYR+LQ3XCYDcmHnqI3kSVc4xpFbVG6vmYvZskOOpg/vkIQxtThU5YNxusHZ/7pkWqpSv
         DVWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777017427; x=1777622227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=;
        b=iCT2rIq8JdtJcM8PqM6YeSPU5DSfBJg2E+Qg5IjAw0obtMnlngjuujbOO3sJMVPH1y
         z3NjwMdH7jJkBWQqHBh2z1Z/s7szSSOXANFcoXl+oMhrPB360N9gF2jlGJi1wWCfHIQ6
         XFJQDYAFS4OTw0wkM92AfOuNucACgPKr/SkqmFMScG77W8EceSisoh1oEvKCfRQE/6Dj
         ESCRFE18pf/uypSGTlYBhMPjfvhSTc6ABOBWw3LwEzgMZMb2vHELY3XVCBqcftUSb0NN
         br6mlQgTXvYl4dYG5LM43AVmC/GtVDS9CyTbZ38vvz8YxeWHrn61NxLOGTy0t4+hPXQJ
         AvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017427; x=1777622227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tH1PYd1ytZ2gVkG2S56kMVCpAGOPHrHwrakfrH4hUps=;
        b=TwSvD/dRjb9QYmoJHm2eS3MdGEQmlN8nQFFsoc7H6bWUWycHkzGPqFHGAH6sFkgYyI
         6Fhy2KV07kBabJmFouzLvmzWyPsZiDAXVh74U3rR7pnrUZiIv0j/5Dllh4tKKlE8ev0o
         9cgVSQBnR42CbHeZNO27pP/xUDXmJFd4EDt42nl7xLpKhJmVbAZNgzOMBUWOIpjUrlOE
         UAAXb3yGHcDiCh++Fb9K3oKa3EPPZL6/O7i+gjIj6XWId1VZ+EL7ArdMqzhYqF72zM9T
         FuMiGcQOniqMis43qKeCJpUWxGe1UaT1GNn32mTvTB/yZ0bhQxyz5KptW8nrpxpPPn3i
         6drQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1JCp3LOc80NdR4BbppO8HJxbmk6r0RihifWy/KhoBzxsTZPSUD0fOWk6yLtKU5RtVxti4COsCKwcM3lAe9kd5@lists.infradead.org
X-Gm-Message-State: AOJu0YyZlckAPk9PoSVHzgiS7SjxubJ+R68/3ACDKwSu6naVsdU8OW5F
	O00qyOuourULZLkofGF5a4PgoVUBzQgp7P/W8vCeBNZUGtZow/nUCvtNvgDdGiL6U+Jrpy5RFkr
	AKN9iBjHYYEV8Fn4ziEh5xFtlLqcn1uWcbVwtH7gu
X-Gm-Gg: AeBDieuR2nI+bcp4X+oMRpP/uQDDVAv2lCUF3iPU9/Zw/ygG2acOqwaZ/rs3HHh1fMV
	Mq0JTpytyMybRaomm1pJHuY3CZVzAH/5E9Qsbp3iEKQ90CZtqYCxJyHCneX+VLrt8T/gg214JWv
	8fYbYI/qc3Q41OhSHBqutsS25k6RNxc26y4rS0EVnW2CJntksy/iByO9lYVCIRDcR14kech3eL/
	SWGN/A5sRyciuHJxbtTL36E4u0hmC4OKmJPtoKj9nLDZnrj+oTCAqCPmFJkmH1zj0+2DT46/Ckt
	tVqK4BbgOpTEmf7cUgCCbTI4e4NLps9uxdhWQRC0TR4TYEg7AkYwgtR75iyjoB13UeRUuZmceWB
	Bn8vmwVw1ryC38dmYD5CucrYAAKs=
X-Received: by 2002:a05:6512:61b3:b0:5a3:e7f1:5946 with SMTP id
 2adb3069b0e04-5a4171766e8mr10818350e87.9.1777017426431; Fri, 24 Apr 2026
 00:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx> <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
In-Reply-To: <87a4ut1njh.ffs@tglx>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 24 Apr 2026 09:56:54 +0200
X-Gm-Features: AQROBzACQ3yI2kl8vg3Kcy5MxWLQ9Q6j6OYD-UEZj9wyuB3F1SqwdpFTVc0GJDU
Message-ID: <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathias Stearn <mathias@mongodb.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_005710_166283_2F5360DA 
X-CRM114-Status: GOOD (  48.70  )
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

On Thu, 23 Apr 2026 at 21:31, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Thu, Apr 23 2026 at 12:51, Mathias Stearn wrote:
> > On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutron=
ix.de> wrote:
> >> The kernel clears rseq_cs reliably when user space was interrupted and=
:
> >>
> >>     the task was preempted
> >> or
> >>     the return from interrupt delivers a signal
> >>
> >> If the task invoked a syscall then there is absolutely no reason to do
> >> either of this because syscalls from within a critical section are a
> >> bug and catched when enabling rseq debugging.
> >>
> >> The original code did this along with unconditionally updating CPU/MMC=
ID
> >> which resulted in ~15% performance regression on a syscall heavy
> >> database benchmark once glibc started to register rseq.
> >
> > Just to be clear TCMalloc does not need either rseq_cs to be cleared
> > or cpu_id_start to be written to on syscalls because it doesn't do
> > syscalls from critical sections. It will actually benefit (slightly)
> > from not updating cpu_id_start on syscalls.
>
> I know that it does not do syscalls from within critical sections, but
> it relies on cpu_id_start being unconditionally updated in one way or
> the other.
>
> > It is specifically in the cases where an rseq would need to be aborted
> > (preemption, signals, migration, and membarrier IPI with the rseq
> > flag) that TCMalloc relies on cpu_id_start being written. It does rely
> > on that write even when not inside the critical section, because it
> > effectively uses that to detect if there were any would-cause-abort
> > events in between two critical sections. But since it leaves the
> > rseq_cs pointer non-null between critical sections, so you dont need
> > to add _any_ overhead for programs that never make use of rseq after
> > registration, or add any overhead to syscalls even for those who do.
>
> Well. According to the comment in the tcmalloc code:
>
> // Calculation of the address of the current CPU slabs region is needed f=
or
> // allocation/deallocation fast paths, but is quite expensive. Due to var=
iable
> // shift and experimental support for "virtual CPUs", the calculation inv=
olves
> // several additional loads and dependent calculations. Pseudo-code for t=
he
> // address calculation is as follows:
> //
> //   cpu_offset =3D TcmallocSlab.virtual_cpu_id_offset_;
> //   cpu =3D *(&__rseq_abi + virtual_cpu_id_offset_);
> //   slabs_and_shift =3D TcmallocSlab.slabs_and_shift_;
> //   shift =3D slabs_and_shift & kShiftMask;
> //   shifted_cpu =3D cpu << shift;
> //   slabs =3D slabs_and_shift & kSlabsMask;
> //   slabs +=3D shifted_cpu;
> //
> // To remove this calculation from fast paths, we cache the slabs address
> // for the current CPU in thread local storage. However, when a thread is
> // rescheduled to another CPU, we somehow need to understand that the cac=
hed
>
>                   ^^^^^^^^^^^
>
> // address is not valid anymore. To achieve this, we overlap the top 4 by=
tes
> // of the cached address with __rseq_abi.cpu_id_start. When a thread is
> // rescheduled the kernel overwrites cpu_id_start with the current CPU nu=
mber,
> // which gives us the signal that the cached address is not valid anymore=
.
>
> The kernel still as of today (the arm64 bug aside) updates the
> cpu_id_start and cpu_id fields in rseq when a task is rescheduled to
> another CPU.
>
> So if the code only requires to know when it got rescheduled to another
> CPU then it still should work, no?

This was my first thought too:
https://lore.kernel.org/lkml/CACT4Y+a9GnOh3wHKSRwzoKF6_OSksQ8qehnHfpCgkQSt_=
OOmYg@mail.gmail.com/
The only problem is with membarrier (it used to force write to
__rseq_abi.cpu_id_start for all threads, but now it does not).
Otherwise the caching scheme works.

I have a tentative fix for tcmalloc:
https://github.com/dvyukov/tcmalloc/commit/58d0eca91503f539b26d20b6f55fb2f6=
f8bc0c37

The crux is as follows.
Tcmalloc needs to make all threads stop using old cached slab
pointers. The stopping procedure is now:

slab->stopped =3D true;
membarrier();

and all rseq critical sections now check the stopped flag in the
cached slab pointer. If it's set, the thread does not proceed to use
the slab.




> But it does not, which makes it clear that it relies on this
> undocumented behaviour of the kernel to rewrite rseq::cpu_id_start
> unconditionally. I'm not yet convinced that it relies on it only when
> interrupted between two subsequent critical sections. We'll see.
>
> ....
>
> Now we come to the best part of this comment:
>
> // Note: this makes __rseq_abi.cpu_id_start unusable for its original pur=
pose.
>
> So any code sequence which ends up in:
>
>    x =3D tcmalloc();
>    dostuff(x)
>      evaluate(rseq::cpu_id_start, rseq::cpu_id)
>
> is doomed. This might be acceptable for Google internal usage where they
> control the full stack and can prevent anyone else to utilize rseq, but
> in an open ecosystem that's obviously a non-starter.
>
> And they definitely forgot to add this to the comment:
>
> // Never enable CONFIG_RSEQ_DEBUG in the kernel when you use tcmalloc as
> // it will expose the blatant ABI abuse and therefore will kill your
> // application.
>
> If your assumption that the rewrite is only required when rseq::rseq_cs
> is non NULL and user space was interrupted is correct, then the obvious
> no-brainer would have been to add:
>
>         __u64   rseq_usr_data;
>
> to struct rseq and clear that unconditionally when rseq::rseq_cs is
> cleared.
>
> But that would have been too simple, would work independent of endianess
> and not in the way of anybody else.
>
> But I know that's incompatible with the features first, correctness
> later and we own the world anyway mindset.
>
> Just for giggles I asked Google Gemini about the implications of
> tmalloc's rseq abuse. The answer is pretty clear:
>
>    "In short, TCMalloc treats RSEQ as a private optimization rather than
>     a shared system resource, which compromises the stability and
>     extensibility of any application that needs RSEQ for anything other
>     than memory allocation."
>
> It's also very clear about the wilful ignorance of the tcmalloc people:
>
>    "In summary, the developers have known for at least 6 years that the
>     implementation was non-standard and conflicting with other rseq
>     usage. The github issue which requested glibc compatibility was
>     opened in 2022 and has been unresolved since then."
>
> Thanks,
>
>         tglx

