Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760FFCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aZmQ10b0wpN+iMg2EPUIHXrTZZaaV+5qOQVOwN9O4k=; b=XjSFw0jOnedBl8ByzwuwT2LRaa
	wjPfJQSKCAzr4a4amP2UGDFVu9d3maAplQWyV1oj9ChPQVsodMejlZZUhqLLO2CRzVY172i14MCkX
	F/UsZp0EIeGSYCMvWncjbpdYN216wIlTCaaJCrmofqewjzTi66cKzHZKL2WIs56nUgpii/1DYTvyp
	RXQL1kmiYDoQTEsau01uW6p8QlM6y/2DFAaySruito56B28/I6QsfPDwvj3TkX2tIK9OcoI04BkCz
	a6MidNhWcNYphnRBl5jZ23OpPYDIhHjWiUCOvTerfFfez0ZHKmBhbHAZCsIfCqwkE17PFEWg1MEhV
	Zwcbe5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0pP-0000000Fq2F-3Qpy;
	Wed, 14 Oct 2026 15:23:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0pH-0000000Fq0U-0TYM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 15:23:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9B61570;
	Wed, 14 Oct 2026 08:23:21 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32C683F7B4;
	Wed, 14 Oct 2026 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791991405; bh=1DLWRMbZyOAA0rVioqQfDUzvKGaVa837pvjO2TrdaZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiwEjp9uaNUxIi5ciO5EDAG5qEO3ENWk/lYMARr7Uggqz/ut2q3CTw8kTspOFi1zo
	 lHQZGmwZP0ZENsvMT+FmZV5rbyvIcKrLhkmCA8C0J04SvgcNDM5XXlrPenFvd6Mrkj
	 BUk3lDOPxmpqk7uJw7yqDFTdYVgi5JOvXJrteTiw=
Date: Wed, 14 Oct 2026 16:23:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Haris Okanovic <harisokn@amazon.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
	will@kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, broonie@kernel.org,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v15 12/16] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
Message-ID: <as-eaNfjOAUnfvVF@arm.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-13-ankur.a.arora@oracle.com>
 <178908146776.2725577.2613699832033292946.b4-review@b4>
 <878q58z2ej.fsf@oracle.com>
 <3e8bda45-0aa7-d0be-8aad-dab95902dcde@gentwo.org>
 <as9EospGcR2e1mpO@arm.com>
 <20261014130306.GK2009045@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014130306.GK2009045@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_082337_060686_9AB545CB 
X-CRM114-Status: GOOD (  13.57  )
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

On Wed, Oct 14, 2026 at 03:03:06PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 14, 2026 at 10:00:18AM +0100, Catalin Marinas wrote:
> > It
> > would also be nice to get some acks from the atomic infrastructure
> > maintainers.
> 
> That'd be Mark and me I suppose. I don't see anything substantial
> happening, just plumbing the new function.

Thanks!

> Now, I really rather dislike timeout based schemes, but given we have
> users, I suppose this does improve things. We should however be weary of
> new ones I suppose.

There's some arm64 precedent in commit ebababcd0372 ("rqspinlock:
Hardcode cond_acquire loops for arm64"). This one went in without any of
the arm64 maintainers' ack and we've since been trying to come up with a
generic interface instead of reverting it. It was fixing a bug where
arm64 smp_cond_load_acquire() does not evaluate cond_expr unless the
pointer is also written by another CPU. Arguably the bug was in the
rqspinlock code for not using a plain cpu_relax() loop.

Anyway, we had several incarnations of this series, some with a default
timeout but others objected to it (Arnd and Rafael IIRC), hence the
proposal here that pleased most people (not all though ;)).

-- 
Catalin

