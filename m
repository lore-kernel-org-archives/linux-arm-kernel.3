Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BF8C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HywNmkLx1a2fIwQ1MKGECZwlag+2mOKKM/v1tKzG9U=; b=Y4NUanoRrxA/Q1Jgwmdrc3PrKB
	+rqQbvK080PSFE6rpVeGCritbb+w5cUfvByPxjfUpOU3NMZHCBonKv1M9ABIpRBAWzIJMH8cpMGtu
	idjfyKazuT0dsCWYuJ58QxAwUzmMMY8kx09K25uCA7dv7PeWG/oPMvtOEnHLGhQ9LS1PbkAxsLasM
	LqzJls0IbwZLkcYajhm90OJ8D0ns7ZOiW81qBhgKZrQi30SZJVUZsOKOoFmZOSKNsyPiz4tZ3dz/V
	oDegCt1zXSZEpDH43USXp9bhYq6LhdhkXa6CQ5UU5QA1T8zjEeyV0wmy8u7hUgnYyyCMpexJJyUlA
	yyTkdQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx1x-00000003rIA-1mXm;
	Fri, 16 May 2025 15:31:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwh2-00000003nLk-3vD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:09:50 +0000
Date: Fri, 16 May 2025 17:09:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747408186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HywNmkLx1a2fIwQ1MKGECZwlag+2mOKKM/v1tKzG9U=;
	b=DpATQzQpiMsmPc2dhSdfVki2qv6V1T1FPApCFSccA9IexCrgo2HB6JnP6pUYc3iw5MyxLZ
	xKzvlkMvWYlaH45FAVBUTVvTU5haDKGLfNd08lgD7hrcGUzND18JozDr6Y2WjzFOaPoMKc
	VOovosrPDxZAMpEy/HQkzkoR/pitXOdNXw/dIlChjfxH6jWf+hS1b/FhIMaQdp6SyAtA2r
	UAlU1AGVoybWkKhjEEFINDuk7bnnuwKebThPxam1EjJkX0r5jfWQ3X3FOjRoHSjVueroZ8
	QnGxdWjnpNnTEKgSmOr9k5GVS0zYLZEcdI/XysSksx/SrmEI1LFY3Yu1xaHTbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747408186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HywNmkLx1a2fIwQ1MKGECZwlag+2mOKKM/v1tKzG9U=;
	b=wR/KQUOJAaOhA0xA2yD2/13hVP4puE4PEPSgv/ajVZtt+MDrPHQjqUr8yfTUyxJ89ar4PI
	XIK0P0YYX/bvWDCQ==
From: Nam Cao <namcao@linutronix.de>
To: Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250516150928.4Y7is6pg@linutronix.de>
References: <cover.1745999587.git.namcao@linutronix.de>
 <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
 <20250516140449.GB13612@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516140449.GB13612@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_080949_125343_6FAB6E5E 
X-CRM114-Status: GOOD (  17.25  )
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

On Fri, May 16, 2025 at 03:04:50PM +0100, Will Deacon wrote:
> On Wed, Apr 30, 2025 at 01:02:32PM +0200, Nam Cao wrote:
> > Add page fault trace points, which are useful to implement RV monitor which
> > watches page faults.
> > 
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> >  arch/arm64/mm/fault.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index ef63651099a9..e3f096b0dffd 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -44,6 +44,9 @@
> >  #include <asm/tlbflush.h>
> >  #include <asm/traps.h>
> >  
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/exceptions.h>
> > +
> >  struct fault_info {
> >  	int	(*fn)(unsigned long far, unsigned long esr,
> >  		      struct pt_regs *regs);
> > @@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> >  	if (kprobe_page_fault(regs, esr))
> >  		return 0;
> >  
> > +	if (user_mode(regs))
> > +		trace_page_fault_user(addr, regs, esr);
> > +	else
> > +		trace_page_fault_kernel(addr, regs, esr);
> 
> Why is this after kprobe_page_fault()?

This is me being incompetent, sorry about that. It is more logical to put
them at the beginning.

Best regards,
Nam

