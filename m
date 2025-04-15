Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E7C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzawNatPbq1ZNSb9ZVxi6008X2uDX4ctY3uXm4ZDLKc=; b=M3uqyhExFxJ90pLKcNGOWCn6hp
	t9+BaZ88e4ZFRIIqqXnQ1XWHzi/yPXLNpvV5ZMriAOCxGzb1ynskI+bMTpoDojH8YJ0C6vuF8beYe
	xEnO78ENYqZ6tTtF/CLueyDPibxI/7ybvo6MLzdfZu7wODp3Ogz6jmsn8tweMzAwszY6vaEKKh4M8
	DP6H+51Mvm5V2gq9lkZr1ZFAh0X80z54zacVhFdLTlYExPKS5yVlxSJteD0zFGyTq9uB3AZtxviAq
	Xhg8NJbEzDxLitCvxyLNhhWhijy1A5SjvMEetpgMMLsJ2KRU+o2fgEvNPXCf5hkw9LJV4ljPQgWlL
	vameJGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ff3-00000005npk-3Hxw;
	Tue, 15 Apr 2025 12:45:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fYL-00000005mat-1e23;
	Tue, 15 Apr 2025 12:38:14 +0000
Date: Tue, 15 Apr 2025 14:38:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744720690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nzawNatPbq1ZNSb9ZVxi6008X2uDX4ctY3uXm4ZDLKc=;
	b=Ejf15B0G6V/V4b0G5v0K7G9W/9PynAnMz3ByOriTZzIq8uLtTwq/TztJPm7gIviwMkz3Kf
	n+SAP8ZLJmyRV4ouj/H8QqBot3o0aMi9V62ibzRBZeqYQNt9ouocjl5uL2ME39YppXevRm
	G+wBc3EWYtn29qYJ1fzP/Wmm8gtqH5SWS7kcaOUl2JGCN5TQilRLROj+NKi2XjHwtSvD+Y
	3NBL+oppuHwSju1FksExSQsk5xOTKagBDpX8Xfp5DA4wuUgeD99x+ITsWklHKRKdiY2P2K
	df+fVysMmQJa8BtbWzr86y5i0Yp1xh7BFjend7Z4zqMUVxuk8KhEBJXosw8rDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744720690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nzawNatPbq1ZNSb9ZVxi6008X2uDX4ctY3uXm4ZDLKc=;
	b=uXHBILYw21rrPrwmTaF++U0ZD1onpTceW7OBoUTuHRM0SLb3jzBEUCaGIaT9v6RAqz0WIp
	NxpopC2Q8LmvviAQ==
From: Nam Cao <namcao@linutronix.de>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
Message-ID: <20250415123807.2MahJd60@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
 <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
 <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_053813_570583_14FAFB7D 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Apr 15, 2025 at 02:31:43PM +0200, Gabriele Monaco wrote:
> On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> > +static int __init register_pagefault(void)
> > +{
> > +	rv_register_monitor(&rv_pagefault, &rv_rtapp);
> > +	return 0;
> 
> Any reason why you aren't returning the error value from the monitor
> registration?

Copy-paste from dot2k :P

> Other than that, the monitor seems neat and reasonably easy to
> generate.
> 
> May not be necessary in this series, but try to keep compatibility with
> the userspace RV tool as well, you need to have some special case in
> its tracing components because fields are not matching:
>  # rv mon sleep -t
>          rcuc/11-108      [011] event <CANT FIND FIELD final_state>   
> (null) x (null)                   -> (null)                   Y
>          rcuc/11-108      [011] event <CANT FIND FIELD final_state>   
> (null) x (null)                   -> (null)                   Y
>       ktimers/11-109      [011] event <CANT FIND FIELD final_state>   
> (null) x (null)                   -> (null)                   Y

I have this userspace RV tool in my "later" TODO list, if that's okay.

Honestly, I haven't looked at what it does yet. perf already does what I
need.

Best regards,
Nam

