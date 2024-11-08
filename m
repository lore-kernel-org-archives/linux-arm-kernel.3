Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3981D6407A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YcjDPRp+ch63AiHWbyUonpJU1I1xzWMm60VjxeSPBg=; b=zHsiOOmnqOsvSJXASuxzhQr+jA
	uMdqMPpoHmG35Yqvj+F/UW9WbEhYAM/+94R5z2k4KfegfSRf8WdmTEqaLnpy1dOWNRHysV8EuC2UA
	6lg/YDJzvUdlNSnMBlXm53JCzsWRXT3JrXeceIqn6AYslblBHXO+EvyxXTRBGu8E/NFlsPT0B4BH7
	yiW77ihRGz8IriDB73vehikBbPZ+KHa30wgcoKAQLvfG47oTxh5hv6XkQ1qgaAjM1OK2EWIdEzclR
	9lhr6G1xBDE5w5YXf/tj1km4C9iPUYWX04Q1U5RwWY7nJr/Pcs4yaGr6y81vRi0LeftiuhtpDUhYd
	TulVpICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UZ4-0000000Bj3C-1ogx;
	Fri, 08 Nov 2024 19:22:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UXJ-0000000Bipb-3qWT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 Nov 2024 19:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8YcjDPRp+ch63AiHWbyUonpJU1I1xzWMm60VjxeSPBg=; b=cZYBwdrpfBq0WkAzRag13fRlS+
	+srbnreYjdRBxyphguUoNEdRENMc2XQvjvdmcPCG8tSi0IBd8RLKxJ9tVIKKCXbrYhVgAlphm7nFw
	KaOQ0DI3OZtCLdtVPbfYEJVunJWsU6yxRKMG5SYnngYK6zSyWVyBmQMCBmKL8ASErMzOjFliOr1mf
	2LGzPOyztA+UnoRF4/9kZWW+fAaVytkEptmIljkMleewymLWOvGhcue0d8GGy16tmNypfEEULMmnL
	CkTYE7C3ZtK277xJSY/wpLNDvmH4tyWeyO6lWNLkHljqzc1EiAJps/puK56riWhqlGDWL8ndXq/w4
	lQvZSyMg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UXE-00000009Dec-12gL;
	Fri, 08 Nov 2024 19:20:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2150230049D; Fri,  8 Nov 2024 20:20:44 +0100 (CET)
Date: Fri, 8 Nov 2024 20:20:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, will@kernel.org, linux@armlinux.org.uk,
	catalin.marinas@arm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <20241108192043.GA22801@noisy.programming.kicks-ass.net>
References: <20241108153411.GF38786@noisy.programming.kicks-ass.net>
 <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
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

On Fri, Nov 08, 2024 at 07:01:16PM +0000, Colton Lewis wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> 
> > On Thu, Nov 07, 2024 at 07:03:35PM +0000, Colton Lewis wrote:
> > > Break the assignment logic for misc flags into their own respective
> > > functions to reduce the complexity of the nested logic.
> 
> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
> > > Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> > > ---
> > >   arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
> > >   arch/x86/include/asm/perf_event.h |  2 ++
> > >   2 files changed, 26 insertions(+), 8 deletions(-)
> 
> > > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> > > index d19e939f3998..9fdc5fa22c66 100644
> > > --- a/arch/x86/events/core.c
> > > +++ b/arch/x86/events/core.c
> > > @@ -3011,16 +3011,35 @@ unsigned long
> > > perf_arch_instruction_pointer(struct pt_regs *regs)
> > >   	return regs->ip + code_segment_base(regs);
> > >   }
> 
> > > +static unsigned long common_misc_flags(struct pt_regs *regs)
> > > +{
> > > +	if (regs->flags & PERF_EFLAGS_EXACT)
> > > +		return PERF_RECORD_MISC_EXACT_IP;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> > > +{
> > > +	unsigned long guest_state = perf_guest_state();
> > > +	unsigned long flags = common_misc_flags(regs);
> 
> > This is double common_misc and makes no sense
> 
> I'm confused what you mean. Are you referring to starting with
> common_misc_flags in both perf_arch_misc_flags and
> perf_arch_guest_misc_flags so possibly the common_msic_flags are set
> twice?
> 
> That seems like a good thing that common flags are set wherever they
> apply. You can't guarantee where perf_arch_guest_misc_flags may be
> called in the future.

I got confused by perf_arch_misc_flags() calling common_misc_flags()
twice. It is in fact worse, because afaict all of
perf_arch_guest_misc_flags() is 'common'.

Isn't the below more or less what you want?

static unsigned long misc_flags(struct pt_regs *regs)
{
	unsigned long flags = 0;

	if (regs->flags & PERF_EFLAGS_EXACT)
		flags |= PERF_RECORD_MISC_EXACT_IP;

	return flags;
}

static unsigned long native_flags(struct pt_regs *regs)
{
	unsigned long flags = 0;

	if (user_mode(regs))
		flags |= PERF_RECORD_MISC_USER;
	else
		flags |= PERF_RECORD_MISC_KERNEL;

	return flags;
}

static unsigned long guest_flags(struct pt_regs *regs)
{
	unsigned long guest_state = perf_guest_state();
	unsigned long flags = 0;

	if (guest_state & PERF_GUEST_ACTIVE) {
		if (guest_state & PERF_GUEST_USER)
			flags |= PERF_RECORD_MISC_GUEST_USER;
		else
			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
	}

	return flags;
}

unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
{
	unsigned long flags;

	flags = misc_flags(regs);
	flags |= guest_flags(regs);

	return flags;
}

unsigned long perf_arch_misc_flags(struct pt_regs *regs)
{
	unsigned long flags;
	unsigned long guest;

	flags = misc_flags(regs);
	guest = guest_flags(regs);
	if (guest)
		flags |= guest;
	else
		flags |= native_flags(regs);

	return flags;
}

Note how both perf_arch*() functions end up calling both misc and guest.

