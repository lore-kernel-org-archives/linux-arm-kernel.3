Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6E2F589AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtlmVXsrBR7qEczShYHnYwWDm+M14LhdN7rkrKGVul8=; b=Lobs9e3Q3VweJybyf9ERJ1aJ4Z
	4lwlUTgLgOqwY2L3rIvHQNWoYXkaqT7mtuIV6j51pNDmRQVhwpdru1UGqym/nvDF97H1hY8871iGS
	mh3brjdIIzPMu66JjpgJKtu8VtPb7lsWn5/C22fGv62TGdN44o7whZVNsvHb6vrOWIY+ASgR041lk
	PX0VoG6y+3sQNCrHr512+ercAEAaLJzqbZ9m3ZbA1NV9X8AdnxrymkB2IHMTRjo5hlqAnRcixoJPe
	77mUKQMFs11tmXwl4coywxxWiInTa2zNYQAUY0quMjHjLoZ4VQ+6EANEsGBxU4MucdfUpYj0g2Mdz
	mp7MHtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFt73-0000000Bbrj-39Fv;
	Thu, 23 Apr 2026 12:24:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFt6w-0000000Bbr5-2H71
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:24:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so5360609f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776947088; x=1777551888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtlmVXsrBR7qEczShYHnYwWDm+M14LhdN7rkrKGVul8=;
        b=ExqwccURa1Fv/yzUm9Rfhf5KQocijrXSes90djzJapsSDkwx+KCqbvVqZsm5gx1DK6
         USTHJJFi0cYJfAzr0JtQNRVCLraQKSgOYrD2ULTqsywvZIp2aiFlsspzdC462n2ip3c+
         LpCunpJmBlp3bK6ubtlzieDF+GHp8Q5n2IkC4L3D0aASmz4yoIG0URk8wOi/Af+GwL4K
         4rjTZE2/1A+p9cRqSxcpfvak8Jo1rbMDwAkk02RORi82vnrNpnCUfebhaaIMzoQAOdjT
         bBA9jZq+FYazEOpN4vJWvr32jXm1hIWLpDG1DREJ/MJQMeFOOKW/LUGVOP9Wt3GfePkf
         M8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947088; x=1777551888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtlmVXsrBR7qEczShYHnYwWDm+M14LhdN7rkrKGVul8=;
        b=PuOdJt9fwmVDZm9gNrdH4695pgMXPvoW9AfZa7GJsUFHZLxTBzLyhlbFQv3YqOTuuV
         qYgqBfc6JJku31GrLdnp9FGsr5dKHkIw8IJQwRMO+9PcKsicYgtch4U0SWHcIORXDSsX
         rzU++H04muczy9Mz6oJLPyqbuJRmRJFhRLZz1VWM9PBJJuqrDwPkOOvjiWbSJtQf+K7l
         WZMuGGwmqmbkxuuk3KGytRJ05fJqapB++b9HpDDnKNAO2X5I4GR+FV83w1VUVU5HGCBH
         J9UmkK+ehuIOKgDewce2cmMr+oa9hTznanSt5vjfgmDFcVXN0ZrPfdporS3RsCcWOrYM
         PAsg==
X-Forwarded-Encrypted: i=1; AFNElJ/hpLzZ5cuEKPOgBd3dvpSlf+Exg3exXBuqXrM+YWY8bkmy40vuOV4mYmwfAOXB0y3LOduaffz+T+hqYqzUZ8VN@lists.infradead.org
X-Gm-Message-State: AOJu0YykKef+vfBC7fIfer3OhNLhPlL0MLMU4chHJGDDhX1UWDmtSMDw
	czUbvgbgPzNkn6DS/Q1gMW4Mx/ykXjugVh4SaoCTdHhiF+YVY0u77eSD
X-Gm-Gg: AeBDieskgM67WC6+9Y3Okp/dtcjpdk2DtVws8mAG9DUpT6tGrN7/qhoItGwvLgor47q
	UFJQeENPURnRA4vymuGEGp6Znh6VXsfkanDLI04HxAeJ+Lv1StDhU7K/Lq58iA57WTXkIREbZ+/
	jG6Xp0w5zWC7c3GOOETpRPJlR9dP+HFQZQHA8Hh/W1paTlDb6SilKkYGKgWc/hi4sn0mtZB87Jm
	IE+uzKKD+C3YnCb9RStfc3UWKKoaHY0jVlUkBC1bTTRbIXpLewNBAb9l67GMdRXfG6iQfsWnfxY
	oF5Qat9ykZSXuHUiZoN7Pmi8zlQ1vCvsf+gcyNeOjfyCRlTqKB09OmBn9lZh6I27VUN2glACBE5
	Gn5ylVyziTWtfaoKXP93HnOJULGfUj+HNxcLChhk6vRe2J/pMGHRNBFaxXz1o8eecwQLWGVvESC
	MmVERakmtJlQjJz66qA2l87gZDf38xYosTpPVnVcIYp8FIxvPPQ0dDQ2B9P1Lcf2Rkb0oCKgdji
	0k=
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr40367257f8f.29.1776947088049;
        Thu, 23 Apr 2026 05:24:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm57552815f8f.24.2026.04.23.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:24:47 -0700 (PDT)
Date: Thu, 23 Apr 2026 13:24:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov
 <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake Oler
 <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260423132446.70478a78@pumpkin>
In-Reply-To: <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
	<aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
	<87zf2u28d1.ffs@tglx>
	<aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
	<87wlxy22x7.ffs@tglx>
	<c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
	<CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
	<87ik9i0xlj.ffs@tglx>
	<CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_052450_626238_693E9F6A 
X-CRM114-Status: GOOD (  21.85  )
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

On Thu, 23 Apr 2026 12:51:22 +0200
Mathias Stearn <mathias@mongodb.com> wrote:

> On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> > The kernel clears rseq_cs reliably when user space was interrupted and:
> >
> >     the task was preempted
> > or
> >     the return from interrupt delivers a signal
> >
> > If the task invoked a syscall then there is absolutely no reason to do
> > either of this because syscalls from within a critical section are a
> > bug and catched when enabling rseq debugging.
> >
> > The original code did this along with unconditionally updating CPU/MMCID
> > which resulted in ~15% performance regression on a syscall heavy
> > database benchmark once glibc started to register rseq. =20
>=20
> Just to be clear TCMalloc does not need either rseq_cs to be cleared
> or cpu_id_start to be written to on syscalls because it doesn't do
> syscalls from critical sections. It will actually benefit (slightly)
> from not updating cpu_id_start on syscalls.
>=20
> It is specifically in the cases where an rseq would need to be aborted
> (preemption, signals, migration, and membarrier IPI with the rseq
> flag) that TCMalloc relies on cpu_id_start being written. It does rely
> on that write even when not inside the critical section, because it
> effectively uses that to detect if there were any would-cause-abort
> events in between two critical sections. But since it leaves the
> rseq_cs pointer non-null between critical sections, so you dont need
> to add _any_ overhead for programs that never make use of rseq after
> registration, or add any overhead to syscalls even for those who do.
>=20

That sounds like one long rseq sequence where the 'restart' path
detects that some of the operations have already been done.

	David

