Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8E7C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVleagUiVHw/5vhkBi8LDSAfw55ruRJcasWRJK+un3M=; b=ifG/ZJWwcJrKyTQfukQk15JtWv
	aQ2C9317t9YoufunuQEvYdjqbWWIzRzeBXTR5Us3Z8WxTKgMaRWIzZbm5kkkLogKbmnBbd3q7ZGiK
	pWby62QcBUg5Wa3eQE6cBvlaSTVZ8KALpX8CzP9m1m1vS6Bsta6Yds/Xr6rkZ/fkISsnzvz3U699q
	LKLnwuXcpqoAsiwYeYZ6LeqyJ259xuiA40UZQG1/sg/ZJWRdd4r2IrL9tVAD3nRq0eN2/F894PJCi
	86BOffbuBamrG8pyNbRoaRILlMBoJaLsTUmo8skuj8iNfMHXTaPrqE7FTfGyjCPBkfN9Dmk8aKZr6
	KPIpdVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHl2V-0000000GE7p-2Ynw;
	Wed, 21 May 2025 15:07:27 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHl0J-0000000GDfY-36UL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:05:12 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-73e0094706bso9504492b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747839910; x=1748444710; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVleagUiVHw/5vhkBi8LDSAfw55ruRJcasWRJK+un3M=;
        b=MCVVcQQbMCjsSz2S+H0MsqrXWXXBxtc+Fr7ovJmJI7PgaE3h0W5cSR2Ifg0MKmadtq
         8BU4/ORmmHgskvXH4kLgtPzHGzjakKe7mVOVW4IlO5md+I9D6/m7swYCbHqhLKOMLv7/
         E4Q5MS5Bp9e6zZQkt329dI9uf9whSvk61lQeiaYNwIjrg9y3d7MfUbw79VvW4na1y4uy
         iqdyfRjOBFw1M6lHyFE+Ep6yUZH8Xz6v2aajJK+53jzkkoSCJH0+VDI0/FSfdBVKnXNW
         bNL/0caZeGsopAMVNqxPGaH8VE80T3QY6KMr1Uv4CaBYuX7r4hbZrtwVc9LLy3A8gxEo
         aUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839910; x=1748444710;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVleagUiVHw/5vhkBi8LDSAfw55ruRJcasWRJK+un3M=;
        b=TEji0cJth7F35DZamtRZo32yw/A2Ias6+wPjNyLkRZ0khyuw0Zg3RFMjsQhRVF4Kor
         cWdMI2jbc5ycL8TG0phI1XPUPsynIsrVwhQdI3tLuwgVobqc+UjLzfhin1BcsqqKD+Zn
         NNwWpMxA0lqmuJyNJbcw9dEJ5cT2AMz8uVAcEvxgQWukpXzuSmWSWWM4gq2YZOlwqOss
         ESQNNnjdxCdWc8AqTeDvMDW9XabEpBdlM1/bI30cuhSlbxKUBWpQhtwkVNoGR0v9SeFm
         CX+v9LKWaoDFt7KT/yp62l3OdLhUae+FZDbTPlpYoIu6zjB5VR95HAlTKbGy1aAyhioO
         KkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeXtlMbnSbAr7Gf7favoyxmiDt3Wpzfw7zDCLYJjHnCBipz/J90icL1gdZAO5aBS7BmR9//bXhlW/BUcSazZ+7@lists.infradead.org
X-Gm-Message-State: AOJu0YyBlUqPHX/UMUF7Nt3dQi4XfSSBMOcKTzsuRzpWXwMODErKBA/C
	v7PAT6htvkzMpLZRdLPArXIHk5gqeLL/Wrxcdm2BP/bp7wg6Mg0DGOmCvInwuTlQF2gA/uooN/w
	7zKoI1Q==
X-Google-Smtp-Source: AGHT+IHGSpJmNv8SAS14hmKKh6ZIg5876VKcdbgoWSZxr3DEmUJT2DSMLR2M8INJy/4FyAqIRr98hcZr/w0=
X-Received: from pgbfe5.prod.google.com ([2002:a05:6a02:2885:b0:b26:eac3:3979])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:103:b0:1fe:90c5:7d00
 with SMTP id adf61e73a8af0-216219c82fcmr35252646637.28.1747839910386; Wed, 21
 May 2025 08:05:10 -0700 (PDT)
Date: Wed, 21 May 2025 08:05:09 -0700
In-Reply-To: <BN7PR02MB4148503E1599C1310F408863D49EA@BN7PR02MB4148.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com> <20250519185514.2678456-9-seanjc@google.com>
 <20250520191816.GJ16434@noisy.programming.kicks-ass.net> <aC0AEJX0FIMl9lDy@google.com>
 <20250521114233.GC39944@noisy.programming.kicks-ass.net> <BN7PR02MB4148503E1599C1310F408863D49EA@BN7PR02MB4148.namprd02.prod.outlook.com>
Message-ID: <aC3rpZChhtw4NODS@google.com>
Subject: Re: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Nuno Das Neves <nunodasneves@linux.microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_080511_781701_B1F542F7 
X-CRM114-Status: GOOD (  37.06  )
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

On Wed, May 21, 2025, Michael Kelley wrote:
> From: Peter Zijlstra <peterz@infradead.org> Sent: Wednesday, May 21, 2025 4:43 AM
> > 
> > On Tue, May 20, 2025 at 03:20:00PM -0700, Sean Christopherson wrote:
> > > On Tue, May 20, 2025, Peter Zijlstra wrote:
> > > > On Mon, May 19, 2025 at 11:55:10AM -0700, Sean Christopherson wrote:
> > > > > Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
> > > > > differentiate it from add_wait_queue_priority_exclusive().  The one and
> > > > > only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
> > > > > unconditionally returns '0', i.e. doesn't actually operate in exclusive
> > > > > mode.
> > > >
> > > > I find:
> > > >
> > > > drivers/hv/mshv_eventfd.c:      add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
> > > > drivers/xen/privcmd.c:  add_wait_queue_priority(wqh, &kirqfd->wait);
> > > >
> > > > I mean, it might still be true and all, but hyperv seems to also use
> > > > this now.
> > >
> > > Oh FFS, another "heavily inspired by KVM".  I should have bribed someone to take
> > > this series when I had the chance.  *sigh*
> > >
> > > Unfortunately, the Hyper-V code does actually operate in exclusive mode.  Unless
> > > you have a better idea, I'll tweak the series to:
> > >
> > >   1. Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and have the callers
> > >      explicitly set the flag,
> > >   2. Add a patch to drop WQ_FLAG_EXCLUSIVE from Xen privcmd entirely.
> > >   3. Introduce add_wait_queue_priority_exclusive() and switch KVM to use it.
> > >
> > > That has an added bonus of introducing the Xen change in a dedicated patch, i.e.
> > > is probably a sequence anyways.
> > >
> > > Alternatively, I could rewrite the Hyper-V code a la the KVM changes, but I'm not
> > > feeling very charitable at the moment (the complete lack of documentation for
> > > their ioctl doesn't help).
> > 
> > Works for me. Michael is typically very responsive wrt hyperv (but you
> > probably know this).
> 
> I can't be much help on this issue. This Hyper-V code is for Linux running in
> the root partition (i.e., "dom0") and I don't have a setup where I can run and
> test that configuration.
> 
> Adding Nuno Das Neves from Microsoft for his thoughts.

A slightly more helpful, less ranty explanation of what's going on:

KVM's irqfd code, which was pretty copied verbatim for Hyper-V partitions, disallows
binding an eventfd to a single VM multiple times, but doesn't handle the scenario
where an eventfd is bound to multiple VMs, i.e. to multiple partitions.  What's
particular "fun" about such a scenario is that WQ_FLAG_EXCLUSIVE+WQ_FLAG_PRIORITY
means only the first VM/partition that bound the eventfd will be notified.

For KVM-based setups, this is a legitimate concern because KVM supports intra-host
migration.  E.g. to upgrade the userspace VMM, a guest can be "migrated" from the
old VMM's "struct kvm" instance to the new VMM's "struct kvm".  If userspace mucks
up the migration, e.g. doesn't *unbind* the eventfd from the old VM(M) before
resuming the guest in the new VM(M), KVM will effectively drop virtual IRQs.

This is purely a hardening exercise, i.e. isn't required for correctness, assuming
userspace userspace is bug-free.  The KVM patches surrounding this patch show how
I am planning on ensuring a 1:1 eventfd:VM binding.

To not block the KVM hardening on Hyper-V's eventfd usage, I am planning on making
this change in the next version of the series:

diff --git a/drivers/hv/mshv_eventfd.c b/drivers/hv/mshv_eventfd.c
index 8dd22be2ca0b..b348928871c2 100644
--- a/drivers/hv/mshv_eventfd.c
+++ b/drivers/hv/mshv_eventfd.c
@@ -368,6 +368,14 @@ static void mshv_irqfd_queue_proc(struct file *file, wait_queue_head_t *wqh,
                        container_of(polltbl, struct mshv_irqfd, irqfd_polltbl);
 
        irqfd->irqfd_wqh = wqh;
+
+       /*
+        * TODO: Ensure there isn't already an exclusive, priority waiter, e.g.
+        * that the irqfd isn't already bound to another partition.  Only the
+        * first exclusive waiter encountered will be notified, and
+        * add_wait_queue_priority() doesn't enforce exclusivity.
+        */
+       irqfd->irqfd_wait.flags |= WQ_FLAG_EXCLUSIVE;
        add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
 }

