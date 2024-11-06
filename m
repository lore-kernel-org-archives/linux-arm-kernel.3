Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A83BD59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTbQ6DPhP6MjHwSaDILXhZVjYXEH8BwsiSbm61YVqgE=; b=f/+UdtZJrvAQWxOEjAZYKwmGCx
	pbQCX7L2viOPw62hLd09pVsMyVtmMbG9ze3SOvLI1H5jfEqmpxLfrRcK6DYOQgRnytiUFFtpLRadO
	WmBgFZ2yPxa0X/DdVvHQXnx5/HjOZcv3K5tZG6XjY+7vnBVAh45Tpxr6JhobuittyYto+mfptxR9E
	zZaLvrsWbLjX5q8n4mZ7rNupK3FoLc8T/WFC4xfTqWV0zfDrZjnyC3twuXxcxOQygPIhQQWdXGFAO
	VUatgMzSpbOeHJGo/nncqj/hnQqj+BTb5TZpotqUUqf8CpWLNHKYrGWSyA4RnfE/Uf0vxmuHIkz5g
	iXrn3tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8n2B-00000004jx7-3Yf8;
	Wed, 06 Nov 2024 20:53:47 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8n0R-00000004jkV-2k6r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:52:01 +0000
Date: Wed, 6 Nov 2024 12:51:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730926316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTbQ6DPhP6MjHwSaDILXhZVjYXEH8BwsiSbm61YVqgE=;
	b=Bw/NSx1j2z8iH74+2uUPsORZOF/lHwjDSE1XgPO3bR7hc3VDGRgJjxxqihTFVbyt2Vu2w8
	raQ7DhoPXKD5HHKOAaOJujYj6vS582FOQLBKtpnd3xvd1RSxRYMmmhyO+1CxVOE0maifyR
	a4U5OreS2n4YhRCs77wj4S8lLE19n7c=
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
Message-ID: <ZyvW3FxcezmYyOMa@linux.dev>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-5-coltonlewis@google.com>
 <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
 <ZyvLOjy8Vfvai5cG@linux.dev>
 <597dbcf6-8169-4084-881c-8942ed363189@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <597dbcf6-8169-4084-881c-8942ed363189@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_125200_277611_871F99CD 
X-CRM114-Status: GOOD (  22.08  )
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

On Wed, Nov 06, 2024 at 03:33:30PM -0500, Liang, Kan wrote:
> On 2024-11-06 3:02 p.m., Oliver Upton wrote:
> > On Wed, Nov 06, 2024 at 11:03:10AM -0500, Liang, Kan wrote:
> >>> +static unsigned long common_misc_flags(struct pt_regs *regs)
> >>> +{
> >>> +	if (regs->flags & PERF_EFLAGS_EXACT)
> >>> +		return PERF_RECORD_MISC_EXACT_IP;
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> >>> +{
> >>> +	unsigned long guest_state = perf_guest_state();
> >>> +	unsigned long flags = common_misc_flags(regs);
> >>> +
> >>> +	if (guest_state & PERF_GUEST_USER)
> >>> +		flags |= PERF_RECORD_MISC_GUEST_USER;
> >>> +	else if (guest_state & PERF_GUEST_ACTIVE)
> >>> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> >>> +
> >>
> >> The logic of setting the GUEST_KERNEL flag is implicitly changed here.
> >>
> >> For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
> >> which include both guest_in_kernel and guest_in_NMI.
> > 
> > Where is the "guest_in_NMI" state coming from? KVM only reports user v.
> > kernel mode.
> 
> I may understand the kvm_arch_pmi_in_guest() wrong.

kvm_arch_pmi_in_guest() is trying to *guess* whether or not an overflow
interrupt caused the most recent VM-exit, implying a counter overflowed
while in the VM. It has no idea what events are loaded on the PMU and
which contexts they're intended to sample in.

It only makes sense to check kvm_arch_pmi_in_guest() if you're dealing with
an event that counts in both host and guest modes and you need to decide who
to sample.

> However, the kvm_guest_state() at least return 3 states.
> 0
> PERF_GUEST_ACTIVE
> PERF_GUEST_ACTIVE | PERF_GUEST_USER
> 
> The existing code indeed assumes two modes. If it's not user mode, it
> must be kernel mode.
> However, the proposed code behave differently, or at least implies there
> are more modes.
> If it's not user mode and sets PERF_GUEST_ACTIVE, it's kernel mode.

A precondition of the call to perf_arch_guest_misc_flags() is that guest
state is nonzero, meaning a vCPU is loaded presently on this CPU.

-- 
Thanks,
Oliver

