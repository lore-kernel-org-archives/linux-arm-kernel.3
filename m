Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98368FED3C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnf5w0Quv+PTZ6xRTOC5Ut9ZfHwqUivD6tJWnKdJ5sU=; b=SF9QovtznP8k/UlA2ws/IsDa43
	GuyoX+i1a6yu/5R15d+7Hml9W45s2243Ol23CCm4QAGan4pA6B1tPZQMg+Q1u676yUqe9itRM0K4A
	eUEDUtqk5CvuM4jhD3QQJENf8vNNAZN+wzi5zCRloXFnMqdweyy8CAly/y0LGRl66guF1eqjeKeHV
	KV2LvFto84YMd7rKPvcdRDFdpaNi8xU/6R4arYVjnzz4QCwXu2PDTQstsHh7+FueR8TKkZRLqC++x
	ADruKkVb7KGlQjjehhabi4Wg22UgXe+hMEOhXK8Vzgbm3/l0eX3lewjE+4QJbtlSt1fm/qsTiEs1Q
	3/d/XHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHKI-0000000DIiM-2qsZ;
	Fri, 24 Apr 2026 14:16:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHKG-0000000DIge-0gn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 14:16:13 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777040169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nnf5w0Quv+PTZ6xRTOC5Ut9ZfHwqUivD6tJWnKdJ5sU=;
	b=XIsfhMsAOHGOVSikOOaqPnCe28/h7USHYhutuQBKSIvFKi5NObMieQcN5MW1VrLdTIJeau
	PbSf0mxFh/KBPXx9V0nvBqSceZ2/TOaD8xlCLXrwyoexZZ9mEf9r9FY4WtBc1/el0NSI5v
	BfT09EzHZPIkIYDV8ZSi4GXsllraEfxjqzzk+9428js8t28yb4u3oukSn9/pcdCdozJzL/
	bgugLB1vb2efXjDGvNZ07u2hlwLTmMTdMzqKp0tj8L1EEKcwvpaUb1+LS6T9X6jNCdpZTa
	DKSgFxpm6r6cb1vuAHS6jUX9L52o+pFyNs8pv+AbfB974fuGJzJmel/zRwHiQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777040169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nnf5w0Quv+PTZ6xRTOC5Ut9ZfHwqUivD6tJWnKdJ5sU=;
	b=VOKawgrwAk2LjHlmcqkr6TY07Qd5sMbsO+ylRRO8SAQ9u1nAseQHxA16OEcmcofQbWpDCC
	Kouv/Ms85MBmBiAA==
To: Mathias Stearn <mathias@mongodb.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
Date: Fri, 24 Apr 2026 16:16:08 +0200
Message-ID: <87v7dgzbo7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_071612_353240_06E04D34 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Apr 24 2026 at 10:32, Mathias Stearn wrote:
> On Fri, Apr 24, 2026 at 9:57=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com=
> wrote:
>> The only problem is with membarrier (it used to force write to
>> __rseq_abi.cpu_id_start for all threads, but now it does not).
>> Otherwise the caching scheme works.
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
> it really is a pay-for-what-you-use functionality,

That's fine and can be solved without adding this sequence overhead into
the scheduler hotpath.

> I think existing binaries depend on invalidation on
> preemption. Luckily that should be cheap enough to be ~free.

That's only free when it can be burried in the rseq_cs update, which
means the ID update would not happen when rseq_cs is NULL.

If those two changes fix it w/o requiring additional tcmalloc changes,
I'm happy to hack that up tomorrow.

Thanks,

        tglx

