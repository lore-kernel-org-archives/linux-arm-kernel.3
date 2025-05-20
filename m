Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC1CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUjRkJXP7J4Xa8+xLBblWyMlboCDcuea5nf6Fk3YYEU=; b=K5BF4K/ijgjC6y8BHhebcz31Ll
	3GOmfB6tUnwdG9ngnICvGy8jfYnxPogbRws/lEEwuTUhWAK8dQ1lQSGG8YMwP3CInU9TsvZe8kf1x
	/eBarqAhmaGGdTVyQvan23tLhaaSUzcMXA2QgbzRNRG1rsejuiw6y08e1Oq475089WdFIDKwoQXqR
	+8QFjnsSyzjUJspWN3jzytleq0BdFzA2SiVpvHr1eJA3rAL0tM5jL1416UbL1wINGYuO4hr5el73H
	yDV0aPS7itfIOS87Ct1PpeZ9rdlFOdlG6NbHstN/THMWopCZspHhlhRgQR9dW3Sjm3HboLvsOOX46
	ZdpFHC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM5c-0000000CrZ3-21lr;
	Tue, 20 May 2025 12:29:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM2f-0000000Cqth-0g7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:25:58 +0000
Date: Tue, 20 May 2025 14:25:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747743953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUjRkJXP7J4Xa8+xLBblWyMlboCDcuea5nf6Fk3YYEU=;
	b=na/fp7+EL7fi0Gx8gkAbP3CnXTBJrb0NdTin6LhExr7vPTMKqZxed7SL7e1qPbxtMqlNaF
	e1uRhBCoBELWYJZtbRSZs475oOEcOzgqUCFs3eqDUrmXEdwps4g5Dub8Z6cITy9iPOdCRz
	LTQHrBYUeiZlcuDn2vQD4YTbGI5PQ5EdU34seaUKybcHbADSR3B95ZJJQpbtkYOkUs7tOE
	KFBY/J1VwFNhjZZzh+LGhsBr0KOLKnu/zdS+Aka++2V1GkBNyWWidpw0aI91LPrPBfaxLY
	sjZyn8laciBBcR1qTYIP5HAer9yb351PJEkY7Czh0jU3C4G7qvEdWYq7/GX3gA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747743953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUjRkJXP7J4Xa8+xLBblWyMlboCDcuea5nf6Fk3YYEU=;
	b=owAcx9awdFFz1d81x33l6VUVWMl7LqJIFmZbfh3RQVJqXYSdoqZiWQeQwVWcPaAe/8UzeM
	ofs0KFl6bR62dRDA==
From: Nam Cao <namcao@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250520122548.lkvaylSB@linutronix.de>
References: <cover.1747046848.git.namcao@linutronix.de>
 <f5fccde2326a896e5c568ef06a4dbd9aa7465f6a.1747046848.git.namcao@linutronix.de>
 <aCtE-RvyN6XJQjTo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCtE-RvyN6XJQjTo@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_052557_338440_CF5E46EA 
X-CRM114-Status: GOOD (  18.80  )
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

On Mon, May 19, 2025 at 03:49:29PM +0100, Catalin Marinas wrote:
> On Mon, May 12, 2025 at 12:51:00PM +0200, Nam Cao wrote:
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index ec0a337891dd..55094030e377 100644
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
> What are the semantics for these tracepoints? When are they supposed to
> be called? In the RV context context I guess you only care about the
> benign, recoverable faults that would affect timing. These tracepoints
> were generalised from the x86 code but I don't know enough about it to
> tell when they would be invoked.
> 
> For arm64, we also have the do_translation_fault() path for example that
> may or may not need to log such trace events.

These tracepoints are invoked for x86 page fault exceptions. Are arm64's
translation faults considered equivalent to x86 page faults?

Best regards,
Nam

