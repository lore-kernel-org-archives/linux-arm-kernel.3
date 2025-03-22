Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EFC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pM9vLebllQghQbND97wqUp00Uf5kZppdIdNy+FWYMvc=; b=U+TGFafljGvyZ4yifrWKaPyK5k
	Aw/qikR1XRaNLARnvRnnhIpkIUHfojVJfd/qZSldr7gdPbr4CcktQF8tGE3mlVCUzKXRmhCuyjQhA
	7CR6+hNFxjuOcxd7/SCkNBWVf1o1QYi0DMjzwfQr92tuCfjwvW9dB10hA/I0MMusHXerp6FHLp/q9
	fuw+VvN0CCMpF0JGpDzHK9iFtA6YeAeYoxYMC+fWPEZ+qiWzkfubwKUlBJVfL580ORY8Vk9t43HHR
	5xAKk/FL1fn9jpoe5ciCqsOSuRPWc5O/dUvXY/ftCTQEBXtmxiqZwPSBM//P0ncy6DRTmnMTuk0Bp
	QQrLTd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw62S-00000000KNM-49vt;
	Sat, 22 Mar 2025 21:05:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw60l-00000000KG9-15KR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 21:04:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742677442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pM9vLebllQghQbND97wqUp00Uf5kZppdIdNy+FWYMvc=;
	b=Ao6jD+maG2AyhVkdqyHx3qauJvKFaFcrIhpgCwPf5nmg1yS78gC235uTL4d5HSMUbG/yQI
	pYPbsAYhP5Qfdf2t8/8qboWrglX6BPuzpvVofQYzvOSa9q657oMHicigOuSVCJiXuUpXBP
	ZAXwaXms3vHvjpq7u2ld8t0aX00304j4pGEKb00RLgT1qpJPPoRCGSUmz3m7BZOwS69v8L
	AN5Tvt9mTX+cGf1jzbJ8pHV8nAg8i6n0ChgZ3c/6sOKNNYUwSR748CRvmdEPAcbClDgwEZ
	l0FpPV0lz4vVtY3m1L6m+wguEs4lk1ozR73sTEISmE+YnBm4jQSBJfqj5KdgNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742677442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pM9vLebllQghQbND97wqUp00Uf5kZppdIdNy+FWYMvc=;
	b=BM/cU9Wt+vkTnRYv0tA6Cf+1FrYUmvuD0rM+IU4rojWTWleWpdLMDnAnH7gs8vbgzCjLoh
	w/cJHDZ4LFFJN9Dw==
To: richard clark <richard.xnu.clark@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: hrtimer precision issue/question??
In-Reply-To: <CAJNi4rPaPeVWzBve6Toi8hhrxP6GROAGRug7+c3zg1crDeOt7Q@mail.gmail.com>
References: <CAJNi4rPaPeVWzBve6Toi8hhrxP6GROAGRug7+c3zg1crDeOt7Q@mail.gmail.com>
Date: Sat, 22 Mar 2025 22:04:01 +0100
Message-ID: <875xk022wu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_140407_437583_A77EACA3 
X-CRM114-Status: GOOD (  11.41  )
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

On Sat, Mar 22 2025 at 11:20, richard clark wrote:
> With diff below under the 'cyclictest -a 0 -t 1 -m -p99' trigger from
> the arm64-based linux box, the interval is 1000us and the arch_timer
> in the system is: arch_timer: cp15 timer(s) running at 31.25MHz
> (phys).  1tick = 32ns for the arch timer, I am not sure if those
> durations less than 1000us are expected?

With your method of measurement yes. There is a german saying, which
describes this. It roughly translates to:

   "Who measures a lot, might measure a lot of garbage."

But it accurately describes, what you are measuring here. You do:

    t1 = ktime_get();
    arm_timer(T);
    schedule();
    t2 = ktime_get();

and then look at t2 - t1. That only tells you how long the task actually
slept. But that's ignoring the most important information here:

    arm_timer(T);

cyclictest uses:

           clock_nanosleep(clockid, ABSTIME, &T);

and T is maintained in absolute time on a periodic time line.

    T = starttime + N * interval;

So the only interesting information here is at which time the task
returns from schedule(), i.e. you want to look at:

        t2 - T

Why? Because that gives you the latency of the wakeup. That's what
cyclictest is looking at in user space:

           clock_nanosleep(... &T);
           clock_gettime(..., &T2);
           latency = T2 - T;

Now what you are looking at is the time at which the cyclictest task
comes back into the kernel to sleep, which is obviously

           t1 = T[N] + latency[N-1] + execution_time;

But the timer is armed for T[N], so your t2 is:

           t2 = T[N] + latency[N];

You surely can do the remaining math and map that to the output:

> [  165.555795] [ 0- 0]t0=165550399226,t1=165551394303,d=995 us
> [  165.556802] [ 0- 0]t0=165551398751,t1=165552400997,d=1002 us

Right?

Thanks,

        tglx

