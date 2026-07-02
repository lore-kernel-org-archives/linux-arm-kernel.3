Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529CDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usqHyr4FCppk89cjD1Lh8z87EZeT9dV/v0SgCLCx+zE=; b=mdh2/+C4QmgDn1p7R5apcCGj0/
	0j2tcGOp7MNT1OhDoxhvyY9RwaOBj9RuCDwnhw5BNVDGO/SsRuuw0khaB6V585qsZOjzyamt5+rq5
	6l4wpXv2ZusmpA5swQGKCx68a5yZUlqMP9TVTby7HLL4f9p7FbXEwWyfVBrtaf4IKnPJG419U3OPr
	Q+MrVCBCxIKi+ehoQJHUm2s06aNLrRSu0Ef/BrBDQr982bqfBkI7p/8dSM2Zwp1Ui+VVYpe2bq8IN
	giDoCocgF76artCHluMrN4oGjIgeTHEheUSYzTtJqZH+dRtRPgbT+7rd38rdZbrGTfV8hOTS11PTV
	tBGJVfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDGe-00000003wMY-37O8;
	Thu, 02 Jul 2026 08:59:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDGZ-00000003wKP-2Zxu;
	Thu, 02 Jul 2026 08:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=usqHyr4FCppk89cjD1Lh8z87EZeT9dV/v0SgCLCx+zE=; b=g7X4++BeQ2q3zvMDe0NyPsUx45
	3RF7kSMPpRJbYt9i13rM6nx2YrMi6bglLo9KaWHX2kW0o8LMDoTT//Ifa+E2G6xEy8JVh7LI3VLhV
	pfLPjaeloaGkxDf/EyrDWK2d7ZPwETD3mnRd+Zm8U6Wo+zHIzbHkfvtnSaV65UQjpEgZlRWPz74t1
	uZ+2Qyh1y+o5EGlK7R8iiQorjBWQbQ11s5JP91ZxzfTGtLpP9bGB4U2aA3Jjn9RfPRYqPUK6KqVbt
	qrDiRFk4oGgCIyvEEwrlJoQ1fPKiasr1jqeVQKiw9AwCA6vyTYqUeBHmOLeCCitZYCa+2W1O3HTS0
	CCZNiKSQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDGU-00000008EIf-3h8q;
	Thu, 02 Jul 2026 08:59:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EF899300402; Thu, 02 Jul 2026 10:59:21 +0200 (CEST)
Date: Thu, 2 Jul 2026 10:59:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH] futex: Optimise the size check get_futex_key()
Message-ID: <20260702085921.GD49951@noisy.programming.kicks-ass.net>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
 <20260701084150.GNOeboLw@linutronix.de>
 <38239f40-1673-469f-baa3-4a343d2aa4c3@amd.com>
 <20260701161736.xYYizA0e@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701161736.xYYizA0e@linutronix.de>
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

On Wed, Jul 01, 2026 at 06:17:36PM +0200, Sebastian Andrzej Siewior wrote:
> The futex address must be naturally aligned and this is checked via
> "address % size" where `address' is the supplied address and `size' is
> the expected size of futex. It is guaranteed that `size' is power of two
> but the compiler does not see it and creates here a `div' operation
> (x86, arm, gcc-15).

That's pretty stupid, since size = futex_size() := 1 << (blah); so it
has every opportunity to actually see this. Also, see below, clang does!

> We can take advantage of the pow2 property and rewrite it as
> "address & (size-1)".
> 
> As per testing, the command
> |perf bench futex hash -f 1 -b 16384 -t 1 -r 30
> 
> improved from
> | [thread  0] futex: 0x5619f931f740 [ 7001583 ops/sec ]
> to
> | [thread  0] futex: 0x55da173e5740 [ 7376137 ops/sec ]
> 
> or by 5.3%
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> Could someone verify this, please? The 5% look a bit high. This is on
> top of the series (but not worsen by the series).

Bah, I tried to reproduce and couldn't. Then I noticed I did a clang
build and that is in fact clever enough to do this optimization itself.

/me tries again with a GCC build.

pre:  [thread  0] futex: 0x561f14430680 [ 9021408 ops/sec ]
post: [thread  0] futex: 0x55feadbbb680 [ 8977527 ops/sec ]

(and this seems to be well inside the error threshold of this test).

So I see the GCC build do the DIV, and no longer with his patch applied,
but for some reason I cannot get the runtime performance to actually
improve much of anything on my system.


