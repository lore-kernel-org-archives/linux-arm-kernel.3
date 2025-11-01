Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FBACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0eX9ffVZuSx8AzMfC6dO7RaiByfwb5AFnzt99aseqI=; b=Dhj0VjeTZSjtCgwkgW1nlICAEk
	x07TSrdbv05dLR+vVoKYToLvQZ+7KnwCUbV8vGEmh3CD6Erg94vAl0/DrNU+YbLTmgML0HzwYDyU9
	DsCunOI8PjV7eA1jPoRz1TOsjJDm16EymJMPb/TMI6/bujo5ef+WZOpIYnH/UcHQw1Z5p4eG8h6dG
	XQPx2itNenUlk/4qL1B1t7Beqs24niKgy6u7XNMMQlhskEev9/x3hinYJNVLDvZDCf0kaQR9EJFrG
	oSIuZfOc26HpV62+oAlhFtH8q5PQdAHJnXaBBUUex0CPkomsBecIvoMJ7JwamlQ/Op6YsgYuHNeZj
	Q+aAKVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF8AK-00000007F53-1knt;
	Sat, 01 Nov 2025 09:44:56 +0000
Received: from mta1.formilux.org ([51.159.59.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF8AH-00000007F4Y-2uP0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 09:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1761990288; bh=Y0eX9ffVZuSx8AzMfC6dO7RaiByfwb5AFnzt99aseqI=;
	h=From:Message-ID:From;
	b=QvYC6dwo8jQIjh/WuPbaW9F3kHHcAmjMNxWgHIrOC2woQYIQyz15cIRoxJhUg/amM
	 rK7EGGFYthofFF3UcCv7Im/xOzB5Lo4Guhu1SJJJAlScHNEhNhd3JtHmLvduBaAU+O
	 /tZmM0ajQvam3luj6Qd+v7Zb0OaJiR+DuwE1FU8E=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 662EEC06F2;
	Sat, 01 Nov 2025 10:44:48 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A19imlM028979;
	Sat, 1 Nov 2025 10:44:48 +0100
Date: Sat, 1 Nov 2025 10:44:48 +0100
From: Willy Tarreau <w@1wt.eu>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <20251101094448.GA28965@1wt.eu>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_024454_245687_AFB955BF 
X-CRM114-Status: GOOD (  14.89  )
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

Hi!

On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> > > -----------------8<------------------------
> > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > > index 9abcc8ef3087..e381034324e1 100644
> > > --- a/arch/arm64/include/asm/percpu.h
> > > +++ b/arch/arm64/include/asm/percpu.h
> > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
> > >  	unsigned int loop;						\
> > >  	u##sz tmp;							\
> > >  									\
> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > >  	/* LL/SC */							\
> > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
> > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> > >  	unsigned int loop;						\
> > >  	u##sz ret;							\
> > >  									\
> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > >  	/* LL/SC */							\
> > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> > > -----------------8<------------------------
> > 
> > I will give this a shot, thank you!
> 
> Jackpot!!!
> 
> This reduces the overhead to 8.427, which is significantly better than
> the non-LSE value of 9.853.  Still room for improvement, but much
> better than the 100ns values.

This is super interesting! I've blindly applied a similar change to all
of our atomics in haproxy and am seeing a consistent 2-7% perf increase
depending on the tests on a 80-core Ampere Altra (neoverse-n1). There
as well we're significantly using atomics to read/update mostly local
variables as we avoid sharing as much as possible. I'm pretty sure it
does hurt in certain cases, and we don't have this distinction of per_cpu
variants like here, however that makes me think about adding a "mostly
local" variant that we can choose from depending on the context. I'll
continue to experiment, thanks for sharing this trick (particularly to
Yicong Yang, the original reporter).

Willy

