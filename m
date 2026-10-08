Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5143CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+63oyHFpVlKLm2fFB+eRfZfb7Yox0WTva56stGfeC/M=; b=uaaqgCd515ysr1UDEsNAQZZBwy
	tjFEuSP0/Ls/47Q9pRR26d8W2EDavsb4pzIDCEOfFjvvBEgALLJvHXoIA10aD4+/F1PMMGJ/NywwW
	A61GNYVnIWhFYyUyVuhfHtr2QXeO9Ei4BOUd5ktCrWvzSxN5KtmSnMSXOh0MQCxSXGPMLzHzCQsYV
	uXr+JYeFbCH/Sa7dqGNZ1L21Y313IVjUKV/+T3FIMkpgAz6aNcV2slH5ZmlSRfHQkWka1HTskGoOf
	ZRyx22SzM2Gdg0A1E1Wh7RMXBAEPlDC89vTzFa9htgUyJl1lXuED2YQz6thda1fuOF83VsQyTFBfg
	GchK+gbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtgm-00000004vNb-0Jg0;
	Thu, 08 Oct 2026 19:22:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtgj-00000004vN7-21WQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:21:58 +0000
Date: Thu, 8 Oct 2026 21:21:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791487313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+63oyHFpVlKLm2fFB+eRfZfb7Yox0WTva56stGfeC/M=;
	b=3NiQg1KM/RxrWv3Es8saISg/XEX0a7lyhAveiP9Hacs4na48cGEdg7ueZ1y22mY3KnoMyU
	jcvyh81zOjXYkNaa2mXRBXgDBEGBbADfkvOOxhfHxWRyINmeqWf6GGE8B6SGP6air25VHU
	9UuUkjEbbXEGmJTMP3+N4KmRJYmgd60xG4O0cdc0CTC65f+SMWWQHkDqnMqvxPBQ1Ses3r
	PN7v0XLiJtAk5G/z3itnHA4lbVcrKIKbQ4WqSbQLmSXDUwx0gWJgo4Iu1bbCuiPpPPpdDB
	l2wzUjmSbwTefo1Y7dNvDZSu4ZF4HGeUciWM85uoo1cz97dT38k75mzXtuTyqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791487313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+63oyHFpVlKLm2fFB+eRfZfb7Yox0WTva56stGfeC/M=;
	b=BVMxivl8vZ4TUv3H5NJDMo+/BPW5ck32et6AZKG7cYAm1fHunVmkFylJ54M2+v26uqsj6S
	TKtEAhN0jmgfFyDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	WANG Xuerui <kernel@xen0n.name>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v3] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP
 notification to task_work()
Message-ID: <20261008192117.ZIKKU3Yh@linutronix.de>
References: <20261001143516.Ew8C97WS@linutronix.de>
 <fd405cda-51bd-4b1c-803c-f2597b2b128e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd405cda-51bd-4b1c-803c-f2597b2b128e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_122157_680699_154283C9 
X-CRM114-Status: GOOD (  19.82  )
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

On 2026-10-06 18:17:52 [+0100], Ada Couprie Diaz wrote:
> Hi Sebastian,
Hi Ada,

> I find the function names a bit counter-intuitive, compared to the other
> arch-specific perf functions.
> Given the name `perf_arch_...`, I would have expected them to be defined
> in arch code, rather than in the generic perf code.
> From what I can see, usually perf functions calling an arch-specific
> function lack the `_arch_` infix of their `arch_` counterpart.
> 
> I do not know very well what we expect in perf, so I might be off-base,
> but would calling them `perf_hwbp_send_sig()` and `perf_hwbp_notify()`
> make sense ?

Thanks for looking at this. I renamed them as:
- perf_arch_hwbp_notify() -> perf_hwbp_notify() (generic)
- arch_hwbp_send_sig() -> perf_arch_hwbp_send_sig() (arch specific)
- perf_arch_hwbp_send_sig() -> perf_hwbp_send_sig() (generic)

> Otherwise, it looks good to me on the arm64 side !
> I had a look on the arm side as well, given the debug handling architecture
> is similar, and I think it is OK on there as well, though I wouldn't mind
> a more experienced arm review :)
> 
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> I also tested the patch with pNMI and CONFIG_PREEMPT_RT on arm64 : I can
> confirm that the atomic sleep warning is gone and everything works
> as expected !
> 
> Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com> (arm64)
> 
> Thanks a lot for looking into this, combined with[0] the hardware debug
> handling should be much cleaner ! :)

great.

> Kind regards,
> Ada

Sebastian

