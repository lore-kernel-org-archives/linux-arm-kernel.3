Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26C4C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGKku8nyry7LJ3cQ2W+BxzqUbPO2qtN0RpKOVM2oOc8=; b=gpLaSFogGvmgiWO8ZAQxDo2lWT
	Vwcwl3voUeOI4ywj1O7MQrioUUX1YjiccaIzJSIZVX18ZLzFRahRoSRk5AT40bxWzdXN5mgzgC0zZ
	gO2BXqy5RSxG/uKOgSD2X/ld7dsQdxu5miDvKXMfCxY9tQz6ibc1Eb6bW4eH5k+QgDMnsr/LvTO21
	aXYNxvVjUHmsuLuTrBa+U3ezPP2Lw9/gT2dNKwzA3Hz7wMDaItkPVM76He74WAZBlnacJp9BXhvHq
	eJY/3jlekGWMFES0Hge6Yr0c542DVpC5kGTClkexW7UKzBrQfantTJevStNqDWQkut7q6LP8r1my7
	0bMe6jEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92eC-00000005v87-0oor;
	Tue, 22 Sep 2026 15:43:08 +0000
Received: from mail-qk2-x0d.google.com ([2607:f8b0:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92e8-00000005v7S-3yZB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:43:06 +0000
Received: by mail-qk2-x0d.google.com with SMTP id d75a77b69052e-532d63f434fso583461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790091783; x=1790696583; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGKku8nyry7LJ3cQ2W+BxzqUbPO2qtN0RpKOVM2oOc8=;
        b=KWs7iOm1vezm347iwEUI94m0pESdORZx0b1oj81m61HbAgX5OahoJHXvOSthLW3ZNf
         4epNbfaqw4huHG7PQEVgxpy0D6oWF61jt/i6SgY9i1KxTaf3BHPz3Ldyae/6hXLWHZpJ
         Cen1c2kmzdLVHVyFJlAj9nsReEBnER5SZlYis7KimdB+/WQlaNZJoB6kuNQR91DLiuip
         +rkt23+GX+3lLzoqu4ADehvDMiCf4tzwKaaqwmVCNFmqAO810BynJ2hiObhOTiaJdR1l
         4B8V81X0LG5OXy84hcP7ayRV7f1kVwnofvQLDwrc//JOet/2V8llPauts0awVBc6kKfC
         pzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091783; x=1790696583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGKku8nyry7LJ3cQ2W+BxzqUbPO2qtN0RpKOVM2oOc8=;
        b=rmLVztsNhIM4eFLckVzG8QwRxIQkTqU3V+Rkkn8EuV0BUY9RPyKNSgdaZbL6LJFrt5
         +vJsptamcZXwBdxntU6Fyshh39wggevCdVnL80qRmLqOQ4NRLN0sifFkyn9AtZ4o/8tn
         pBjxhwKe0xn1dFRcJtUBmIoxLnesPbBvuApF2O+1AwmEpG6ZFJjtoUX80k92uNl+qwvi
         +Ikr1OF0OmOzE9KuCLNls1tqGkUOFoge6p9XzflFv8x8lHfIAaqQq626wWvxbDw3naqj
         WN2PlE9vKFIvHky0NvmjGQC9aboieJOVLUDTLqadMIhIq7Cyuxbo8JkJP8CLb6XiXRBO
         vnFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTcJ3cJ2s+mxNk/5EMmOv/t2GdSxeF8fGqh3ztOccC6hQXvVMjwZK6TF4aqAddHzGZfOoGztvwzKMRSRFZH5E+@lists.infradead.org
X-Gm-Message-State: AFuF++kZdRZIjJtHl71QTtNArrOdN5EKpZ1j+/BGgkxRmAnvGksQkI7Z
	lH98AS0wRBszgS6pLVvtLogHjyBMvTQnMerxznEBhCfLndgNW6g/FjZ2skQ+3WYfJ5A=
X-Gm-Gg: AYBFou3Tk4BYUXe0utSDRAmHrDZs2Km5Ke51H6chKyb6/cbDk/R5x6+LhqkjaJXrFBk
	iUim16m3byGaetG4MATIEXdEF50l8EHzI9Czi34D10WF+v1g+HBYJvDweR9AO6MnghMunEiW+is
	poAhu4ybJ+40fjqhI3K+FdGSZvRbkC/cD2ycQJeOS1fdqMIqKKBdofJcNLpc0ZYpnI4uPsLEd8B
	x5fPtZPU/dplDH/OdBtl6vsDlR87wq6CdaN2/GWA2dfNTE2dOAA1sDTUmCeyPgiVYT0gm5OSjsZ
	zpin5P67IuakS1QByrarayWMBpZ1zos9qrPGgkV2xTJpXwD3HzQ1NNsCYlLt05caCF4d5Kk5r+d
	78HtCXw4FWio+BDo4ipQUoZK0yvhlC3thkxGa5zgGjay0STGHI+wPARbUjzeB3UTERf0pSIYflm
	q7mqv6A8dZJJwD8PpeyGVvdUXPkMPlkckHIIxMjs+rqwJVu3F2Mg96yQmgUhc7FJSRXY2/y5iyw
	TKEi8WMTVTTUsk=
X-Received: by 2002:a05:620a:6006:b0:93b:d79f:d955 with SMTP id af79cd13be357-93c15f2e6e5mr588176085a.74.1790091783184;
        Tue, 22 Sep 2026 08:43:03 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485dce4sm1063585a.23.2026.09.22.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:43:01 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:42:15 +0000
Message-ID: <d36fdaad78296f3c43f84bc9c5b15a36.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
In-Reply-To: <aqxLgT41UyA-bV5J@pavilion.home>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com> <aqxLgT41UyA-bV5J@pavilion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_084305_013815_7E463CCF 
X-CRM114-Status: GOOD (  16.32  )
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

On Thu, 17 Sep 2026 22:20:17 +0200, Frederic Weisbecker wrote:
> > +	lockdep_assert_irqs_disabled();
> > +	WRITE_ONCE(t->rcu_tasks_irq_ip, ip);
> > +	t->rcu_tasks_exit_cpu = smp_processor_id();
> > +	raw_spin_lock_rcu_node(rtpcp);
> > +	list_add(&t->rcu_tasks_exit_list, &rtpcp->rtp_exit_list);
> > +	raw_spin_unlock_rcu_node(rtpcp);
>
> I don't think we can do that. This is too much unconditional overhead
> on the hot preemption path. rcu_tasks_trampoline_text() should be
> a condition here.

Sorry, I missed this one before sending v4/v5. Agreed, and it is gone
for v6: the hook is now just the WRITE_ONCE() of the IP plus the
rcu_tasks_trampoline_text() check, and the exit side a single store.

The IP store itself has to stay unconditional because of the kprobe
jump optimizer: its window is ordinary text, so a task parked there
before the optimizer decided to patch was not "trampoline text" when it
was preempted, and the optimizer needs to find it afterwards.

> And do we really need to maintain both lists? I understand that they
> have different purposes.
[...]
> Can the latter replace the former?

With the above there is only the holdout list left. The optimizer's
rcu_tasks_wait_irq_preempted() now does what classic does for its scan:
walk the task list plus the per-CPU exit lists (exit_tasks_rcu_start()
and friends stay shared between the two flavors for that), checking each
task's recorded IP. That is a slow path that only kprobe optimization
hits.

And thanks for picking up the core-RCU follow-on.

Josef

