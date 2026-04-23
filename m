Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCCAFDEE52
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1IQQeWnAi/WmXsc0Jq8evNouVPa3nP74k+TBTX1EPI=; b=2mzJvxH8vSpBl+cVC3ved05khJ
	Ap9vAYWN+C9Z+Ix+ev+AJ+OH3FQGkOim34U08sS0EoofG8ou12rjEB/A7soH4xPswrjl4ZKeZXwmP
	NLoMujXj5mcLsnNuEzgYjwwG5QBoPuxLQH6podBK9oFBsH3Xx0+AP3KtwdJwhkUZ58d+or9CUOepa
	fDQOuzk/o1i6lu2GdPw5loOy3rG/1ZizUHS0yuevQMmm3RTBNySEGSXTb/+YtV3l4dCbsmKGccZsa
	a8bdxCQ6QODR+55CIBSxdoj+IZ0gnVwB/0ThiXpDL2KydmYdN+GBlNrZTjHpnKt9aN2wA/1yKdQLl
	20/qUoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG3A7-0000000CP1R-0HDR;
	Thu, 23 Apr 2026 23:08:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG3A4-0000000CP14-0mue
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 23:08:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so10023819a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 16:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776985722; x=1777590522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1IQQeWnAi/WmXsc0Jq8evNouVPa3nP74k+TBTX1EPI=;
        b=YzG3WOy+F83tiSfXtE/EdSq0WpgWn/Gm101YXlGRkwMwcNMLemiD5FokgU8SCHM9ns
         jo/2qzTl2YqTqonudjRJVBYiRV1HGFiH0iZwTZ3sPFWMjwaUFIJekJdStpKbYBfoCtVc
         qKv5ySycrhlw/Z8yAmrZcX01mb7IWn1jsrMpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985722; x=1777590522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1IQQeWnAi/WmXsc0Jq8evNouVPa3nP74k+TBTX1EPI=;
        b=Bwka2Zv0eAMORQKkttycU24qnrBRUF13o6gzYEdkPzznVPnhAZnqgToq+leI46eLYE
         MX/35kZZnR8+9FgqtgA1rSNlJZFr8r/Ma2pJSn9vZsk5rry5Q9emtT7p4I8M+4yVzhnM
         3Y4FW1+3GQRl6lKA000B+2vH2FH5/P4Tc1bo/qQnT/50kHVDkdym0vO8uJ4FqoqSVXJr
         3Q/3L/DHRIAF+itxytWTaIPWrleRD/vxABb3O5q7+am/6MV1MxCPSMeTtSn6RtRj/2aY
         TqOqsY0AqylS5m8IIolh0PEZCu6+YUdg5Po/TCDxSHyCvwynUA9TS2W7d0vi8qBy9KGN
         0vag==
X-Forwarded-Encrypted: i=1; AFNElJ8HMXlVC+fSZeayP6mnDAHX6RPbjviqhxavqy89vdvYGYDrNDE5S82XUeN+QkO+dVuC6yS89DLFgPPkAwXmuKik@lists.infradead.org
X-Gm-Message-State: AOJu0YwjUXB30LKk+4BBzzm8zwBJn40zz0CL4sWA0KtM4Tk+MyCLDPgW
	P/bMD0RhOmipeeiBeMorg4pssHxVwFYdzz9imNbj7UaQHvoxhlsi4UZAKaoO/VPpfqxggq6k6Sk
	IdasGbv1eUw==
X-Gm-Gg: AeBDietHpRIL8zM7pxihC50k33+H6Qcsjb7hMWFmAEXjcVlQ4s3P97kHDWwKXMZt1/x
	kIlVmEVu1HBHXTdSn5E48IvfIdlB/PnrPjd3W68VW3aY9r7SyFdDBojMQ6CNeuKpg5r9VEAqk2X
	47L55eWfvAoF1y8+HjSFNT+bw4F3BNI+i2OPbP/5KLc+5L/RfprfNd76ocuqRNhnRL2US8SmRSV
	rk/j2OtsUy+HugZKm2OF9Jg8KByJ2LNFr8imLQaE5psin0KnOzDn0W6Uzdi6y8JOmHjqs+1PO6Q
	H8xDvBpGaGjlWc2mz0U7OMTIxH6cICKrwOvD7vXDCUt9t+B/548+3GUt5+douK2sv0CxXC80FUh
	mWEiElUUHb/zDFYy+YP1/GTqT5k14TunVf/tt4SanY8nkXmDpDS8NWgD0GMF2/hPDBOAaeMt8ij
	02NMvUfnQi5jF2XneLRbxig+/eAQ/1ZgWafeMThejw625s2Doq/H5+B9DIYgus9RcquLqrM8jkJ
	/kbckJ06cg=
X-Received: by 2002:a17:906:4789:b0:bab:b930:474d with SMTP id a640c23a62f3a-babb9304787mr399951666b.1.1776985721776;
        Thu, 23 Apr 2026 16:08:41 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4516f7b11sm705286266b.14.2026.04.23.16.08.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 16:08:41 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6715006f4f7so10953652a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 16:08:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zk+rhe6q65iWRJZVSTn2kmyZJ2xjeeWJ9Fu2m5/tYZKgQg/KOoVPGvBspsAgc4aSLkFunM/WHPin2ginsJaBW@lists.infradead.org
X-Received: by 2002:a17:907:9407:b0:bad:9363:901c with SMTP id
 a640c23a62f3a-bad93639641mr39954666b.17.1776985720966; Thu, 23 Apr 2026
 16:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx> <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
 <874il11jac.ffs@tglx> <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
In-Reply-To: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Apr 2026 16:08:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd-QaWjFvumdX0BPga8ntZYwo=e4ZJr9Cb+sg=BCgtDQ@mail.gmail.com>
X-Gm-Features: AQROBzDxtByE_zL0yeL09a8qRHzmOD6033ygRjIYzuhDNj41DscorVUQ0eIqXEA
Message-ID: <CAHk-=wgd-QaWjFvumdX0BPga8ntZYwo=e4ZJr9Cb+sg=BCgtDQ@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_160844_278091_FEEB8AA9 
X-CRM114-Status: GOOD (  10.01  )
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

On Thu, 23 Apr 2026 at 14:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This is all 100% on the RSEQ kernel code, not on users who took advantage=
 of it.

Side note: when RSEQ was merged, the *primary* documented use case was
literally user space allocators with percpu caches. That's what I was
told at the time.

Now I think it was jemalloc(), not tcmalloc, but it's not like
tcmalloc is some odd minor use-case.

We are pretty much talking about the raison d'=C3=AAtre of the whole rseq
feature, not some odd small corner case.

               Linus

