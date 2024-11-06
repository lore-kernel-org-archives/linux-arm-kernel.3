Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8508ED59F6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIYHrYeDhg7kNxYUdjNDrUK44gnqtUzRYj+2b/H+nmQ=; b=u3RPgO+wQpWb7cE4QYiIFHkh2v
	FgLmitTMUvZW/gI83nGqlsb5tTwDIcf1wLXOmjU4CKsR+MCbl7+/ZSvLIqyk8w8g/LmF06ul4T70o
	c696fdlRXACtPGf8FCFSrEybV3Rygk5fAIi3MeawCrSvmkniyvNGiAfgiXaKca8uU/aYx33rHfuKQ
	3AwhgBxJAgaXIOPjJkP4G9ZBeUAMVyoGl3gkMkadDkUZ0G43VH3Y/EsoSxpWmHwUTUFsUgnviQYR0
	XEmVNMZFkcI6H63X0rYcnTNJPI5eDheR//pexpw1l3B4ZIVGNOiiaWJoPqn+VDwrzyX9u2nUtp9ps
	+4xlKIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8m7W-00000004cQr-13zh;
	Wed, 06 Nov 2024 19:55:14 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8m5l-00000004c4U-30Jg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:53:27 +0000
Date: Wed, 6 Nov 2024 11:53:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730922800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIYHrYeDhg7kNxYUdjNDrUK44gnqtUzRYj+2b/H+nmQ=;
	b=azPQPKMcRZ7n0haevtf+gW2LUqUgNTZ0txSbzF62ESJFFuZ5O81yldkwxJtbt9eMJ9rYhP
	N+C8TyY7NMWCBJoFUX2fQEo2lLIcOBBEbEAiDRA7VK/RvAEm4WY0TpFGNaZYNkz2wLfxEo
	3CDxbqePxlmasgDPRU9wm5HtPnrmBuo=
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
Subject: Re: [PATCH v6 5/5] perf: Correct perf sampling with guest VMs
Message-ID: <ZyvJIx-UHXawnUYs@linux.dev>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-6-coltonlewis@google.com>
 <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_115325_987582_8E6C0A81 
X-CRM114-Status: GOOD (  12.91  )
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

On Wed, Nov 06, 2024 at 11:07:53AM -0500, Liang, Kan wrote:
> > +#ifndef perf_arch_guest_misc_flags
> > +static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> > +{
> > +	unsigned long guest_state = perf_guest_state();
> > +
> > +	if (guest_state & PERF_GUEST_USER)
> > +		return PERF_RECORD_MISC_GUEST_USER;
> > +
> > +	if (guest_state & PERF_GUEST_ACTIVE)
> > +		return PERF_RECORD_MISC_GUEST_KERNEL;
> 
> Is there by any chance to add a PERF_GUEST_KERNEL flag in KVM?

Why do we need another flag? As it stands today, the vCPU is either in
user mode or kernel mode.

> The PERF_GUEST_ACTIVE flag check looks really confusing.

Perhaps instead:

static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
{
	unsigned long guest_state = perf_guest_state();

	if (!(guest_state & PERF_GUEST_ACTIVE))
		return 0;

	return (guest_state & PERF_GUEST_USER) ? PERF_RECORD_MISC_GUEST_USER :
						 PERF_RECORD_MISC_GUEST_KERNEL;
}

-- 
Thanks,
Oliver

