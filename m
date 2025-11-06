Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB897CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNngsz3qBNA3SpiGQGbZ/LzcecWjVAN7epFRMpCU8AQ=; b=r0v7rvMbQ+0J2fobUtSXdwkHOq
	jvEW8AqflskE+C1f3gfXwHmw1TtBbCvjiyBXRtztOohXzpQrbzGkcTqRHhQX/aw4of5pTrNu2dhiR
	hAtGYneoyzJ6gmZTjDvVOwpkvyFzlkZzUHREDkZNySW4PYm0/kCwKLbqQ/pILfJxZTchidc3xYca1
	IJuz2nZevmgTc8cCHDGvgUldDPU8mM+7K8is4cp+6EN0O60Dvus+RAHcrmtWJbK+3EdezROSBcNLB
	UHoO08vcC6MO7D0joCV2HWNsC+DMmdLLtdmwmrqNn6dMbfxSXu1ej3y7C8D2xZNhHTj19UgdYl9Oq
	+CTI+8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGufl-0000000F1CI-2ugR;
	Thu, 06 Nov 2025 07:44:45 +0000
Received: from mta1.formilux.org ([51.159.59.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGufj-0000000F1Bp-1BmA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1762415079; bh=JNngsz3qBNA3SpiGQGbZ/LzcecWjVAN7epFRMpCU8AQ=;
	h=From:Message-ID:From;
	b=Aw0/sHskOEvsmaWT4fbXHm5ix4D6fXhNIJ3orDHguHMNQsBf4+ev7fwmExSFI3MHN
	 JZG/zkw5HRRBd866gExwxp82Uz1umCCzLWUQCvv1xBbXt5jQO1tO1dBdx/qRz5e8Ec
	 MBvfrnAq9v+0zwNpQj8q5jLQRY7corlR0ccl1vLk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 9C349C095C;
	Thu, 06 Nov 2025 08:44:39 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A67id5u024761;
	Thu, 6 Nov 2025 08:44:39 +0100
Date: Thu, 6 Nov 2025 08:44:39 +0100
From: Willy Tarreau <w@1wt.eu>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yicong Yang <yangyccccc@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <20251106074439.GB24713@1wt.eu>
References: <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
 <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
 <aQtQRSoL8GGVNrUQ@arm.com>
 <20251105134231.GF22848@1wt.eu>
 <aQtkA0cOb6Fm9Mrc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtkA0cOb6Fm9Mrc@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_234443_742179_4B331244 
X-CRM114-Status: GOOD (  33.46  )
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

On Wed, Nov 05, 2025 at 02:49:39PM +0000, Catalin Marinas wrote:
> On Wed, Nov 05, 2025 at 02:42:31PM +0100, Willy Tarreau wrote:
> > On Wed, Nov 05, 2025 at 01:25:25PM +0000, Catalin Marinas wrote:
> > > > But need to add the prefetch in per-cpu implementation as you've
> > > > noticed above (didn't add it since no prefetch for LL/SC
> > > > implementation there, maybe a missing?)
> > > 
> > > Maybe no-one stressed these to notice any difference between LL/SC and
> > > LSE.
> > 
> > Huh ? I can say for certain that LL/SC is a no-go beyond 16 cores, for
> > having faced catastrophic performance there on haproxy, while with LSE
> > it continues to scale almost linearly at least till 64.
> 
> I was referring only to the this_cpu_add() etc. functions (until Paul
> started using them).

Ah OK thanks for clarifying!

> There definitely have been lots of benchmarks on
> the scalability of LL/SC. That's one of the reasons Arm added the LSE
> atomics years ago.

Yes that's what I thought, which is why your sentence shocked me in the
first place :-)

> > But that does
> > not mean that if some possibilities are within reach to recover 90% of
> > the atomic overhead in uncontended case we shouldn't try to grab it at
> > a reasonable cost!
> 
> I agree. Even for these cases, I don't think the solution is LL/SC but
> rather better use of LSE (and better understanding of the hardware
> behaviour; feedback here should go both ways).

I totally agree. I'm happy to have discovered the near vs far distinction
there that I was not aware of because it will make me think differently
in the future when having to design around shared stuff.

> > I'm definitely adding in my todo list to experiment more on this on
> > various CPUs now ;-)
> 
> Thanks for the tests so far, very insightful. I think what's still
> good to assess is how PRFM+STADD compares to LDADD (without PRFM) in
> Breno's microbenchmarks. I suspect LDADD is still better.

Yep as confirmed with Breno's last test after your message.

> FWIW, Neoverse-N1 has an erratum affecting the far atomics and they are
> all forced near, so this explains the consistent results you got with
> STADD on this CPU. On other CPUs, STADD would likely be executed far
> unless it hits in the L1 cache.

Ah, thanks for letting me know! This indeed explains the difference.
Do you have pointers to some docs suggesting what instructions to use
when you prefer a near or far operation, like here with stadd vs ldadd ?
Also does this mean that with LSE a pure store will always be far unless
prefetched ? Or should we trick stores using stadd mem,0 / ldadd mem,0
to hint a near vs far store for example ? I'm also wondering about CAS,
if there's a way to perform the usual load+CAS sequence exclusively using
far operations to avoid cache lines bouncing in contended environments,
because there are cases where a constant 50-60ns per CAS would be awesome,
or maybe even a CAS that remains far in case of failure or triggers the
prefetch of the line in case of success, for the typical
CAS(ptr, NULL, mine) used to try to own a shared resource.

Thanks,
Willy

