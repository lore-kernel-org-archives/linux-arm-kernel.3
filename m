Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A210FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPpOywhxUYpvbT8zIkFDQanZWuSbRMA9e7oK1b0gVM4=; b=CO8bsutJ4qWGkPuam3b3PtRJxz
	3q16fWh9Sy0rcnMArUgsMuZYT7mxV2ExFID9TNPH0VnpdwMOOnWr+agMySlLYU6qcauHN1D1wO+Xr
	evYuPzvNVuMEIJCGB8Vkrz7DXbIqgSSgw3NlrY72uQ1l1VVz6vSNVxepw34/mxc402QKCBnM2j5PS
	og1JqBw8Esqc8aARQJAaFJQUIy1ZjAsY91Zf5hdBWwb80OKIs8yTNn/oDzjdfqeRQ35aldOiVsAXS
	kFeiLXfey93c2DOGmiqWYRGFCK1IIbJMiWovozJ6t2D7bTMe29gtkXao8tZSsxnGk3x22HvsETPcb
	/OhK6xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WFE-00000002aev-3GiN;
	Fri, 04 Sep 2026 15:54:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WF8-00000002abh-2a2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:54:23 +0000
Date: Fri, 4 Sep 2026 17:54:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788537246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPpOywhxUYpvbT8zIkFDQanZWuSbRMA9e7oK1b0gVM4=;
	b=NR7VB0SshEkCn8ekHb2VuYQmahkOVmFj0T4HAtnof/y45LI4Ur9o8FVFNKcCHcBczLkVH4
	5uW1CZ9m1/QixjwrJKM02hfNBizz/QbvR02e3Yg7l8uAhsegQw0p9vseu4uuah8MU3uIxB
	btZemSlkgPWGzBNl8d94W0M13DPyXEekq7LG84YlkNTzD3Lb60j8oICOQJlYKi2AxFOCdA
	QZH4JilKdFKek7TfoLvYfaY6gk0snmiDQAktXy/zZqnOuq/h6lSQJ6IT045UgRTEyKrqtd
	r2xBzacRa3vQWnsizQlyKGwfZPXXnLklqoLoACulN5mb6Wrbv0pcmXMR3xhXRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788537246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPpOywhxUYpvbT8zIkFDQanZWuSbRMA9e7oK1b0gVM4=;
	b=PRf96zVMAqAIN/FHuit61LZUjh9q3Y2QWtWZZfbGqwKuSYPGqdsu0syV75ICLNaKC1XXKf
	KsR24XFsPNaLl5DQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Waiman Long <longman@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>
Subject: Re: [PATCH v2] ARM, ARM64, LONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <20260904155404.ESPFg3zi@linutronix.de>
References: <20260814085118.OPEA_Ssn@linutronix.de>
 <20260903160710.vVf4gEL2@linutronix.de>
 <apmknG55qFAn8EPf@shell.armlinux.org.uk>
 <20260903133146.07095885@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903133146.07095885@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085418_791278_D8236D41 
X-CRM114-Status: GOOD (  21.89  )
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

On 2026-09-03 13:31:46 [-0400], Steven Rostedt wrote:
> On Thu, 3 Sep 2026 17:47:24 +0100
> Russell King <linux@armlinux.org.uk> wrote:
> 
> > What do you expect to happen with this? Which arch maintainer should
> > apply this patch that affects three different independently maintained
> > architectures?

Well, if you as the ARM person are fine with ARM part, an ACK would be
appreciated. If you have something to object, it would be nice to let me
know so I can adjust accordingly.

> Looks like the patch should be broken up into a 4 part series.
> 
> One to add the ARCH_NEED_PERF_HW_NOTIF code to the generic code.
> 
> Then one for each architecture to add the code needed to set that.
> 
> Then the architecture maintainers could ack their patch and the perf
> maintainer can pull it all in.

We could first agree if this is the right way of fixing it (from both,
perf side and ARCH side).
Then we could either route this via perf with ARCH's acks or split it
and route via individual trees if needed. Having it routed separately 
needs to be coordinated since the ARCH bits can't be applied without
having the perf bits first.
Then there is also the question if this should get fixes tag on commit
d8fccd9ca5f90 ("arm64: Allow to enable PREEMPT_RT.") (which would also
cover loongarch and arm).

As of today I have just Luis responding that it works for him. 

> -- Steve

Sebastian

