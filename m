Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7325BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eIVThJ6oj7D1koF1GgMYSCeT4kayJdABWWm6CbJVGg=; b=rxlolcrHZ9QMziLzaAuo3TqtdM
	KwOUfpGmJHseaqmtAONtX/fEga50rbgUjMkNdR0T9h9JFuXmqPobLw0jQ5c8kJrfO56ZPYEeKhsUX
	KwgrF6x5xcdEMwcMaGjRZMDLQ54ToxNwr8DBIIa4sJQqOZqjIJQdAZt55CunST23hwmTsiwEdOyyV
	fnTnx6Q7eMq70zDXGBLNEkKIXSg/rQAO3YvUqYjMdZaIqibMsKWIOjtH4xt85Gl5hfUCmBV9HYpvm
	BgfFLSM4IubH6MwzPSTEYj6A0skoxOJEdHPvCpad272O1bjUuNN6oizoDpoJ14W/NYBZfj/X3Xdkp
	Ye/RSj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHVi-0000000BvZO-0fVg;
	Tue, 04 Nov 2025 13:55:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHVf-0000000BvXj-1k6u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:55:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97F9E1CE0;
	Tue,  4 Nov 2025 05:55:33 -0800 (PST)
Received: from arm.com (RQ4T19M611-5.cambridge.arm.com [10.1.31.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004DB3F694;
	Tue,  4 Nov 2025 05:55:37 -0800 (PST)
Date: Tue, 4 Nov 2025 13:55:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Haris Okanovic <harisokn@amazon.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Alexei Starovoitov <ast@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [RESEND PATCH v7 2/7] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
Message-ID: <aQoF1-uKTgJo89W8@arm.com>
References: <20251028053136.692462-1-ankur.a.arora@oracle.com>
 <20251028053136.692462-3-ankur.a.arora@oracle.com>
 <3642cfd1-7da6-4a75-80b7-00c21ab6955f@app.fastmail.com>
 <87qzumq51p.fsf@oracle.com>
 <aQEy6ObvE0s2Gfbg@arm.com>
 <746c2de4-7613-4f13-911c-c2c4e071ed73@app.fastmail.com>
 <87ikfqesr2.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikfqesr2.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055543_584460_B43C1790 
X-CRM114-Status: GOOD (  15.57  )
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

On Mon, Nov 03, 2025 at 01:00:33PM -0800, Ankur Arora wrote:
>     /**
>     * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
>     * guarantees until a timeout expires.
>     * @ptr: pointer to the variable to wait on
>     * @cond: boolean expression to wait for
>     * @time_expr: time expression in caller's preferred clock
>     * @time_end: end time in nanosecond (compared against time_expr;
>     * might also be used for setting up a future event.)
>     *
>     * Equivalent to using READ_ONCE() on the condition variable.
>     *
>     * Note that the expiration of the timeout might have an architecture specific
>     * delay.
>     */
>     #ifndef smp_cond_load_relaxed_timeout
>     #define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_expr, time_end_ns)	\
>     ({									\
>             typeof(ptr) __PTR = (ptr);					\
>             __unqual_scalar_typeof(*ptr) VAL;				\
>             u32 __n = 0, __spin = SMP_TIMEOUT_POLL_COUNT;		\
>             u64 __time_end_ns = (time_end_ns);				\
>                                                                         \
>             for (;;) {							\
>                     VAL = READ_ONCE(*__PTR);				\
>                     if (cond_expr)					\
>                             break;					\
>                     cpu_poll_relax(__PTR, VAL, __time_end_ns);		\

With time_end_ns being passed to cpu_poll_relax(), we assume that this
is always the absolute time. Do we still need time_expr in this case?
It works for WFET as long as we can map this time_end_ns onto the
hardware CNTVCT.

Alternatively, we could pass something like remaining_ns, though not
sure how smp_cond_load_relaxed_timeout() can decide to spin before
checking time_expr again (we probably went over this in the past two
years ;)).

>                     if (++__n < __spin)				\
>                             continue;					\
>                     if ((time_expr) >= __time_end_ns) {		\
>                             VAL = READ_ONCE(*__PTR);			\
>                             break;					\
>                     }							\
>                     __n = 0;						\
>             }								\
>             (typeof(*ptr))VAL;						\
>     })
>     #endif

-- 
Catalin

