Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83F9D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmyWHlUgH4wy2mROsVBmtOEuwt69GYIjL+o0GEOyuKU=; b=ecUNo93V8BJ30GasTLw9Kzz3Do
	YAPjCbGdaNBrzET6UZKIUPi4jhjBdfGKz85YFSTQXvKeG/+X+Rt5iq6c737nTTFWuvmi/hGNBQC2q
	6cjBHCBLu/wRCimEJ5+uEHR4PJ414MriL+pvUZBnL6ZzWThRUQIocVLPtWUHcPLYc5k6WBbzZv9zr
	PtlaCFCWVUkVQjviRm01GL2HKZ61qLBOEk3CxLJ33D+dq7SRx3qYzMlQfCtUp5OSkwkfysiRbtmH5
	x5QnK35CXfXhvXjC5Na6t2+zj0YZUZdb3+XrJj/qSfiM+t4IzeM9fxbUZTtqtdmspWm1SZ9lWcA0M
	SYC6J9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCGB-00000003wYn-1xSM;
	Tue, 20 Jan 2026 13:59:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCGA-00000003wY8-25ZY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 13:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D0AB60008;
	Tue, 20 Jan 2026 13:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B34C16AAE;
	Tue, 20 Jan 2026 13:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917545;
	bh=9051yFq57Xie5pjtJjoBq/HvBu5GE3EcHvOKur+xijo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoV+ZHYiLGqOe4NWfwMjBJu+d8Nl30ZgHgckXnZ5+4Dix/UB0LdlIn6fjHwSKWM1K
	 dwvGdy3JXj2FQ6/DunG343ZTszE2CKh5rBIljRUWiLjM0GYEGr5lXnTc5tk+tt2llS
	 T5uH1cP9oJulukrS8qlW8HNvtGYoJQ0w00MNZ/HhcfRL5Nlru7mbGOkQj7T7JBOa+J
	 j+FVJiWMl4bHHjEP4BCb9zpI4p5eovVAH+n3nga0pcPEdMpaypnwHbU0TD31BOvLTf
	 cDZgR62kgZFwdz4V2ZjMgRdc8TNRWFMUylQwBV2z69vLTCgBS5H/xBtUVPX6aNePpp
	 x2YFoC1FeMHkg==
Date: Tue, 20 Jan 2026 13:58:57 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v8 04/12] arm64: support WFET in
 smp_cond_relaxed_timeout()
Message-ID: <aW-KIVQ_H1mVpGHx@willie-the-truck>
References: <20251215044919.460086-1-ankur.a.arora@oracle.com>
 <20251215044919.460086-5-ankur.a.arora@oracle.com>
 <aWEOALG07jHC_oHC@willie-the-truck>
 <87wm1qmx90.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm1qmx90.fsf@oracle.com>
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

On Fri, Jan 09, 2026 at 11:05:06AM -0800, Ankur Arora wrote:
> 
> Will Deacon <will@kernel.org> writes:
> 
> > On Sun, Dec 14, 2025 at 08:49:11PM -0800, Ankur Arora wrote:
> >> Extend __cmpwait_relaxed() to __cmpwait_relaxed_timeout() which takes
> >> an additional timeout value in ns.
> >>
> >> Lacking WFET, or with zero or negative value of timeout we fallback
> >> to WFE.
> >>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> >> ---
> >>  arch/arm64/include/asm/barrier.h |  8 ++--
> >>  arch/arm64/include/asm/cmpxchg.h | 72 ++++++++++++++++++++++----------
> >>  2 files changed, 55 insertions(+), 25 deletions(-)
> >
> > Sorry, just spotted something else on this...
> >
> >> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> >> index 6190e178db51..fbd71cd4ef4e 100644
> >> --- a/arch/arm64/include/asm/barrier.h
> >> +++ b/arch/arm64/include/asm/barrier.h
> >> @@ -224,8 +224,8 @@ do {									\
> >>  extern bool arch_timer_evtstrm_available(void);
> >>
> >>  /*
> >> - * In the common case, cpu_poll_relax() sits waiting in __cmpwait_relaxed()
> >> - * for the ptr value to change.
> >> + * In the common case, cpu_poll_relax() sits waiting in __cmpwait_relaxed()/
> >> + * __cmpwait_relaxed_timeout() for the ptr value to change.
> >>   *
> >>   * Since this period is reasonably long, choose SMP_TIMEOUT_POLL_COUNT
> >>   * to be 1, so smp_cond_load_{relaxed,acquire}_timeout() does a
> >> @@ -234,7 +234,9 @@ extern bool arch_timer_evtstrm_available(void);
> >>  #define SMP_TIMEOUT_POLL_COUNT	1
> >>
> >>  #define cpu_poll_relax(ptr, val, timeout_ns) do {			\
> >> -	if (arch_timer_evtstrm_available())				\
> >> +	if (alternative_has_cap_unlikely(ARM64_HAS_WFXT))		\
> >> +		__cmpwait_relaxed_timeout(ptr, val, timeout_ns);	\
> >> +	else if (arch_timer_evtstrm_available())			\
> >>  		__cmpwait_relaxed(ptr, val);				\
> >
> > Don't you want to make sure that we have the event stream available for
> > __cmpwait_relaxed_timeout() too? Otherwise, a large timeout is going to
> > cause problems.
> 
> Would that help though? If called from smp_cond_load_relaxed_timeout()
> then we would wake up and just call __cmpwait_relaxed_timeout() again.

Fair enough, I can see that. Is it worth capping the maximum timeout
like we do for udelay()?

Will

