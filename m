Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D130C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HKYrw1mX2rWYU9hhnTeFvSQNlJmWd9SuBazr4xA8xE=; b=oI44eAxQZVQsgw31GZC5mOlbwp
	kq8AyI1kZZcfsPHsCitBO1X/DA0p/ouwrQf6WV2Dtf5cbLqJino137BAWh2nkQDxwkUK06PgJDiiJ
	fTDbjl13qKCPeC5EFqrP24lRjkUXXFuUcomag9tR3jaC1L/oGlF3Qy1Xn0S3OT9FVPDz9ELfK+eau
	lR8e30LmhJSsbq3zNhZEoIxV109v79ru4amtHvx6UngtmfwZ73YsJPexfqfV76e3KZJ5C5+f9k2NB
	jaoVGZdrG0cHwp5tLxE/oD77DliGzP41Z84NGKQIsDwfy/5ckZfRM8XI0yFfXtSVU0r6duzXhHBYu
	IajUyb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVLk-0000000EFqc-1Ozt;
	Tue, 20 May 2025 22:22:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVJb-0000000EFhA-1sFv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:20:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30e9b2e7a34so3152748a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747779602; x=1748384402; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8HKYrw1mX2rWYU9hhnTeFvSQNlJmWd9SuBazr4xA8xE=;
        b=OMdsPV+T8FYdq2vWl/mLrw7HmQDnv0NZO+sh2pqslx62NF4SfXiDMD4rnP/PMUY8XI
         peCF8dMHpsAn4Mj/cZ8LLn2bSd581DMoH3BKsnn/7yVzwV9JVlysyWAfCzydnCvSmF/e
         AbBOXxIKLr6upKpq160/XPJOPvvhCRHbxJv7H1VgFlb9/0lDPVl2E2c01f+dMiA/em78
         PwbAvAcVwGgfM+D4P6lbdyNA+IVMvanbftUV0NuRQq5msum/qqc+mx6wvJmsC+p8A7XI
         Tm1cG4z2X8tAfA6p1eZz1+KUr4P1TIfBfBQw7xE7oce1ai9FM4u+adGtJ7ZGmz9fJpvA
         fceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779602; x=1748384402;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HKYrw1mX2rWYU9hhnTeFvSQNlJmWd9SuBazr4xA8xE=;
        b=gPJnG/UXGB0xkP5uW6zqm4yMPD98PmLRgpDVQzm954or9HdtpuOy5RfVQK8LpRmuew
         DMHED8ITDjL/vX7/S4Yz5X3cG1dk2NM2Dt1Y7NYlvyOaCyYzNzLwF8McSi7wJDutroQA
         eRrElLPjUcPgOvNoQFQd2XgH6AxtCMDCNeSq5DORLXpqoW9/TZ8ibTSXGVp8NJAllNhI
         zGFzS93UQMz1gtd30WoTgMTussO7ydhIIncfalkuwZGMw5qlXntc8n2Rb61w2bB2rynF
         rn3oO62xWzmwKIDHWYVk6tXzIrnil4PTJ1fD+KBz4wlu5D0e6FgPZsR668fgjZYYEt8c
         zgFw==
X-Forwarded-Encrypted: i=1; AJvYcCVlDwmzlZdPHyc/kXpQ7Vmx52LSfBk4Ox/2QhHP6wSaDqSB9CVr7aOpCH7oIHV6PDJcE9MuM8DVSET4iF/RRilW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1JuUXPYlWY2pPOt5RZwcH3OjuU3w5WoBVR1kkUAhO0Q++aLPa
	01UmdtdSqfEMAdjULhdalEbPX3RrHBVloicvCpYNiOXz9sH2PPplmGcU2yIuiaQxf2pDO7y7+QD
	rysvHgQ==
X-Google-Smtp-Source: AGHT+IGm0Qd18FrnDfhlG7/JjUl4lMpy15ihv5+w3UyMikyFwPD+eN8+5DcFhlZu44RxRjwOsuD2Z657iBM=
X-Received: from pjoo5.prod.google.com ([2002:a17:90b:5825:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5188:b0:305:5f28:2d5c
 with SMTP id 98e67ed59e1d1-30e7d558d26mr28473120a91.15.1747779602268; Tue, 20
 May 2025 15:20:02 -0700 (PDT)
Date: Tue, 20 May 2025 15:20:00 -0700
In-Reply-To: <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com> <20250519185514.2678456-9-seanjc@google.com>
 <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
Message-ID: <aC0AEJX0FIMl9lDy@google.com>
Subject: Re: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
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
X-CRM114-CacheID: sfid-20250520_152003_490191_5BDAFE05 
X-CRM114-Status: GOOD (  17.89  )
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
> On Mon, May 19, 2025 at 11:55:10AM -0700, Sean Christopherson wrote:
> > Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
> > differentiate it from add_wait_queue_priority_exclusive().  The one and
> > only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
> > unconditionally returns '0', i.e. doesn't actually operate in exclusive
> > mode.
> 
> I find:
> 
> drivers/hv/mshv_eventfd.c:      add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
> drivers/xen/privcmd.c:  add_wait_queue_priority(wqh, &kirqfd->wait);
> 
> I mean, it might still be true and all, but hyperv seems to also use
> this now.

Oh FFS, another "heavily inspired by KVM".  I should have bribed someone to take
this series when I had the chance.  *sigh*

Unfortunately, the Hyper-V code does actually operate in exclusive mode.  Unless
you have a better idea, I'll tweak the series to:

  1. Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and have the callers
     explicitly set the flag, 
  2. Add a patch to drop WQ_FLAG_EXCLUSIVE from Xen privcmd entirely.
  3. Introduce add_wait_queue_priority_exclusive() and switch KVM to use it.

That has an added bonus of introducing the Xen change in a dedicated patch, i.e.
is probably a sequence anyways.

Alternatively, I could rewrite the Hyper-V code a la the KVM changes, but I'm not
feeling very charitable at the moment (the complete lack of documentation for
their ioctl doesn't help).

