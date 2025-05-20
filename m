Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792F2C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKutgaWFEQ+3gu/ouPLFwWIwK8y5oHoRF19CwGZ+S/c=; b=rB9OhW1k5MjXUNnjBGGTGvJ0iM
	r4GREmLRQU6ZmVWWq9BjgG1Nc8zIjSopXH5q6L44QEyH/H7Q0byYojhuWl1S7IWHHanGIMsKG0Ojl
	HILQ9aK9olkPC4LDGaxQL+OplaPqjHpF838VYQGlGbd3QTNgi02QxqczXHyH3gMKyFLvH+8DCcVEf
	Rh5YY9fyuJWut/7ZEfbFvsnxNqH7cOtxyEcWziy/uCyWViQtkQ3LPkcXja7tOTU4mqBa3e4Z54aHT
	blfLQ4BPpbn7J91qJh4W3Wi7/BRBOUAcTLHJB3O8XDiAuFNYrC17mFCgYrOUvD99zJu08nylQ4WBI
	ajEcHLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHU3P-0000000E8HS-1dpL;
	Tue, 20 May 2025 20:59:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHU1I-0000000E88E-0NdO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:57:05 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30ed0017688so2774878a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 13:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747774622; x=1748379422; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKutgaWFEQ+3gu/ouPLFwWIwK8y5oHoRF19CwGZ+S/c=;
        b=jjaWAFouXuwvd4hgywsCC7MpMtQVmeoktF8ua57698j5xXH/Ztw1uccJ9TX39Rgfg2
         PDe8c8gAAhmO5skMS+D1X66LUKj46kxUClM3hA9AsOchSPy0hSsBb62fxYO7IlIq/+V7
         xtEEMi5L8XhDDyVFgeeeRpbhz+B+sz8uT7TorYsPJ14o9yzIuL9tFsKAkJAj2llVJT0C
         FfkXdDq44S5WtMJQ7e71hGJ6tC9h5JQ7XxcP6jfOLqLB9v9Gfb3NTI7m9EawQcwb/Fal
         jXp+PFC5A0SVKZyGOzPnaWXCNJI4YVU6j8pbd35gjIENk9hyy9b5c9u42RgZ/OlMSjyX
         JNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774622; x=1748379422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKutgaWFEQ+3gu/ouPLFwWIwK8y5oHoRF19CwGZ+S/c=;
        b=L2zsGuDAUdeBJBvH9CYB9jzPkqeYZYlAJRCurmPvv5kTH3Y7Ki7ZbA1umRT8dYZ8in
         Z4goOSKklUG2S6haXRQLTVFmi7obe/dbMXT/BCaMcmkVfZ2IDGO8Hi4KcODg6xImWXhT
         a5aqyx1ANtnCAR/5IbjATZfe4l1APekywOPrhOMKyv3JWhtOvhSeAa/lkLMS0Rt1QlUF
         G3O+inNiLVVmVdlcZVjAf7wfqIu9d7AnSGJSWrgZ2+et/bwWmRq+L81tCN5AQTa+f8rY
         gjf23v4wZX/88EVPxiDC+WthEnNL9in+jV9M/n5RtaVESbAU45+m9pakEn6Ni/R+97f+
         D9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcwX9duIHyhAUWi3W3+yvqCPeR6wtvoSfIV/2MRWZ7PCaBfFUmSP+RZuclbHik9owx1sdwuMQXLOAk9P8xliNp@lists.infradead.org
X-Gm-Message-State: AOJu0YzVbpbZ7wTF0CJAzz/DQ3MXGEhWKTZ2BaFpuFNlp5NQJIYQsEHx
	uHZ++8QzFU5ItVs43mjvU5taJoKUFlzA4zFL2T9zYOlmHrWHOQtsjru6peJR8kh6lYQSF8+x5dq
	dtiubbg==
X-Google-Smtp-Source: AGHT+IFjfH39vLCcnXRNh1tmz9SqmTftxmR4IbkXgvupWrNryIrlY6xpDKX1XUbGhNR1KVx0wuk++Q37G+U=
X-Received: from pjbli1.prod.google.com ([2002:a17:90b:48c1:b0:30e:840f:131e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1846:b0:2ff:6488:e01c
 with SMTP id 98e67ed59e1d1-30e7d5bb354mr29441493a91.29.1747774622388; Tue, 20
 May 2025 13:57:02 -0700 (PDT)
Date: Tue, 20 May 2025 13:57:01 -0700
In-Reply-To: <20250520191723.GI16434@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com> <20250519185514.2678456-7-seanjc@google.com>
 <20250520191723.GI16434@noisy.programming.kicks-ass.net>
Message-ID: <aCzsnXPQ0TtKtqu9@google.com>
Subject: Re: [PATCH v2 06/12] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_135704_132740_AD6DDEE1 
X-CRM114-Status: GOOD (  15.70  )
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

On Tue, May 20, 2025, Peter Zijlstra wrote:
> On Mon, May 19, 2025 at 11:55:08AM -0700, Sean Christopherson wrote:
> > diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> > index 51e38f5f4701..03252badb8e8 100644
> > --- a/kernel/sched/wait.c
> > +++ b/kernel/sched/wait.c
> > @@ -47,6 +47,24 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
> >  }
> >  EXPORT_SYMBOL_GPL(add_wait_queue_priority);
> >  
> > +int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
> > +				      struct wait_queue_entry *wq_entry)
> > +{
> > +	struct list_head *head = &wq_head->head;
> > +
> > +	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
> > +
> > +	guard(spinlock_irqsave)(&wq_head->lock);
> > +
> > +	if (!list_empty(head) &&
> > +	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
> > +		return -EBUSY;
> > +
> > +	list_add(&wq_entry->entry, head);
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
> 
> add_wait_queue_priority() is a GPL export, leading me to believe the
> whole priority thing is _GPL only, should we maintain that?

Oh, yes, definitely.  Simply a goof.

