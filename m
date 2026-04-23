Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35236FDEE2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs7dqZsEBhd+oet7enpxgmKTrIOuhhSx8Ms9kGvFJUk=; b=4zkTfHD4V8VNc37jo+oAgvOTas
	SzankJupGgC7bIjUaOm8WMO9mXATXz2Iirgnc0UpSmZnAhVMppRSlZni66x6aat69iETkkSUv4789
	FYDN18Q22S2oqZzJJN42rYdrcpu4yND1UWu3YbIGuF8W0tvxInzxUXGf63TT6X6L4U50YPRsdWAIz
	/EyqCmIsOo15Rv1skjXpt0gdsVsrjUhdt5k72dMP53bI4fmTcR+UEAlXEGAJxf/2FkWr3iMwg6ypf
	Af7qvczYohKWkiK/f+Qx3tTxNDbJfw7XMJOLbXrGuolgdiNlx1AHgtoS0CNKLqRyScsfwCHXJvR/z
	9WzkHAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxfH-0000000C1ZO-0YVK;
	Thu, 23 Apr 2026 17:16:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxfF-0000000C1Z3-34uc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE7EF60139;
	Thu, 23 Apr 2026 17:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B86C2BCAF;
	Thu, 23 Apr 2026 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1776964592;
	bh=5p+VepR5wJHe4o7jIsVUYpLrJUgsXBIvYPh5Xah4Rf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s+jiOEXlNsToZuAs+kLgiqYKx6+FScUlmctoYOMjAJAav55a1VGjrfI6KzW22oVsa
	 P1wzE2ZqcEIHTYCW9pNyUYoXuuWVJv8JJWU20B9C2RtfMylsjDywAe0lNxy62ZKIAi
	 G2IOPewWlzy+DdieHRfP5JTTHdlX7R7MBfcgJf/c=
Date: Thu, 23 Apr 2026 10:16:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
 will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 david.laight.linux@gmail.com, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v11 00/14] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-Id: <20260423101631.84f26592d629eee46fbde6f8@linux-foundation.org>
In-Reply-To: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
References: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed,  8 Apr 2026 17:55:24 +0530 Ankur Arora <ankur.a.arora@oracle.com> wrote:

> The core kernel often uses smp_cond_load_{relaxed,acquire}() to spin
> on condition variables with architectural primitives used to avoid
> hammering the relevant cachelines.
> 
> ...
> 
> Accordingly add two interfaces (with their generic and arm64 specific
> implementations):
> 
>    smp_cond_load_relaxed_timeout(ptr, cond_expr, time_expr, timeout)
>    smp_cond_load_acquire_timeout(ptr, cond_expr, time_expr, timeout)
> 
> Also add tif_need_resched_relaxed_wait() which wraps the polling
> pattern and its scheduler specific details in poll_idle().
> In addition add atomic_cond_read_*_timeout(),

Thanks, I'll add this to mm.git's mm-new branch today.

This isn't am MM patchset, but mm-new isn't included in linux-next, and
linux-next isn't presently open for 7.1 material.

After -rc1 I'll move the series into mm.git's mm-nonmm-unstable branch,
where it will get linux-next exposure.

I see that further review/comment has been requested - hopefully this
will happen over the next couple of months, but please do continue to
chase this down if you feel the need.

> Haris Okanovic also saw improvement in real workloads due to the
> cpuidle changes: "observed 4-6% improvements in memcahed, cassandra,
> mysql, and postgresql under certain loads. Other applications likely
> benefit too." [12]

Those are significant improvements.   Three years :(

