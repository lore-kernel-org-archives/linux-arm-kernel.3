Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9214D59F6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOBsyQjKR+aopD9T4x3Q0P1OVO7qyX9T6pAaFYsEySE=; b=RXORT84T63VWOfHdATAZRDeJtT
	XCHe9G1H5cT8NQkF4WDLEi5pgExk/wf6y0wPwedFfwU8QYt2nfEx4Y1qRF5n9buOsvcZ/x6QaL5iI
	uYlVkfiifYQyb4a2jY9BZN7dERi6m+Hunhkq2rmodSHgOpief/+jPTi5jCXjROd4dvXamhWZleoY7
	XPtw3uOsJCUOcQyhdFRN9oVLuHDzM6+WTmSi65rhDKH1j2jHNXpwXY8XILQMv0wU8D5jLt39P9KBi
	+i5jKUSJJpCIF6JH+wMQ7Gl2PW11/MN3MUPZxxfx/YFNRjYqOhDGrpXbjSZoP/I355Vg88OCF1cHU
	lqKm463g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mG7-00000004dqn-1vUN;
	Wed, 06 Nov 2024 20:04:07 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mEM-00000004dZU-3gTI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:02:20 +0000
Date: Wed, 6 Nov 2024 12:02:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730923334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SOBsyQjKR+aopD9T4x3Q0P1OVO7qyX9T6pAaFYsEySE=;
	b=Ev2IHzSQp/e4ZHbWSktOjEbNH4Qrutu7t3FQZgZAUdjLZ2w0IRzdDpE0H0/CbqWzpKlYQ9
	YoBodBX6TP/KL8N4d4CPCs7LoHILZ6KO7RZoORayqY7Bdtm+n+C1UqxpuBYqJothRojsuy
	YXhRfwcYbNxEKBIQGEpmwmMsXoiL+Q4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <ZyvLOjy8Vfvai5cG@linux.dev>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-5-coltonlewis@google.com>
 <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_120219_063926_CC86986E 
X-CRM114-Status: GOOD (  13.36  )
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

On Wed, Nov 06, 2024 at 11:03:10AM -0500, Liang, Kan wrote:
> > +static unsigned long common_misc_flags(struct pt_regs *regs)
> > +{
> > +	if (regs->flags & PERF_EFLAGS_EXACT)
> > +		return PERF_RECORD_MISC_EXACT_IP;
> > +
> > +	return 0;
> > +}
> > +
> > +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> > +{
> > +	unsigned long guest_state = perf_guest_state();
> > +	unsigned long flags = common_misc_flags(regs);
> > +
> > +	if (guest_state & PERF_GUEST_USER)
> > +		flags |= PERF_RECORD_MISC_GUEST_USER;
> > +	else if (guest_state & PERF_GUEST_ACTIVE)
> > +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> > +
> 
> The logic of setting the GUEST_KERNEL flag is implicitly changed here.
> 
> For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
> which include both guest_in_kernel and guest_in_NMI.

Where is the "guest_in_NMI" state coming from? KVM only reports user v.
kernel mode.

-- 
Thanks
Oliver

