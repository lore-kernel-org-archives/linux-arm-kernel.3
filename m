Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218E5C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KOoH+QcbNIcFt9a+edbvuTeUreK6auzBcTQsLb2atU=; b=1ixEJ9LM5iehW4gyrUiyF4yCWO
	+nXegq6bZ1cCkrzBmfn0bgVe664l0WnBT4zyprw58yuybfKEv5uazTXUbq8EsndUwDK5QmOearJGN
	+wZNAx+6V1MesjWvkYb3IbTEDTTbqJXvJLHLznzqGdaWzGio9Kb3tYQnGZ0lAh5gDrNa6r55YQpim
	s94Qq0YBgOS1J2ZPzzTdcEvHMbcwUNFwVSbfh4VbG70MHM4lfnmo0Pxejd6RZbk3VNQCkTEaKR7Eo
	r//Nc7pjTETfx9093/iz7RmZV6Ezc1zwUixfW2UPfSWKjFEBs5lTGv3JvQfoQ6N5GUX+nAM06rAYl
	cE0OB5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhvB-0000000Ffsu-1lci;
	Wed, 21 May 2025 11:47:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhqH-0000000Fepy-3mbu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 May 2025 11:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+KOoH+QcbNIcFt9a+edbvuTeUreK6auzBcTQsLb2atU=; b=J+ZA1LkNIZvB2wt5zV0IUe5eaO
	GhuaqpVSmOn9urMlfTUl+99lOTpOO+f/pKPDMPFnU/NqePPiHuAxDYGupA+8qh8qXhRmbs6tX5hE8
	u6dkqBqpoh9TKIkQUILB0b5bVr+1imyLQj2jeTKmC7U4WmTqUpYnlhopptqDp7qC8cUMr6p90Zm69
	nettF2xLWVUEiEI+dsK0hKGlo+GYUn+gXM7kr0szlrZOAI+qdeOvSb5knGoIDiA2s70Jaf8XMvICI
	XanMgNn2dhRd352C3mtDH/+o4D/POcJxcolPn7egKhWx163FR8YjlkoLPFs9VpXbLQOF2bZ3QVm88
	+pS+1Drg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHhqE-00000000vno-2rKA;
	Wed, 21 May 2025 11:42:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C9BC1300348; Wed, 21 May 2025 13:42:33 +0200 (CEST)
Date: Wed, 21 May 2025 13:42:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>, mhklinux@outlook.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>,
	David Matlack <dmatlack@google.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from
 add_wait_queue_priority()
Message-ID: <20250521114233.GC39944@noisy.programming.kicks-ass.net>
References: <20250519185514.2678456-1-seanjc@google.com>
 <20250519185514.2678456-9-seanjc@google.com>
 <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
 <aC0AEJX0FIMl9lDy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC0AEJX0FIMl9lDy@google.com>
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

On Tue, May 20, 2025 at 03:20:00PM -0700, Sean Christopherson wrote:
> On Tue, May 20, 2025, Peter Zijlstra wrote:
> > On Mon, May 19, 2025 at 11:55:10AM -0700, Sean Christopherson wrote:
> > > Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
> > > differentiate it from add_wait_queue_priority_exclusive().  The one and
> > > only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
> > > unconditionally returns '0', i.e. doesn't actually operate in exclusive
> > > mode.
> > 
> > I find:
> > 
> > drivers/hv/mshv_eventfd.c:      add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
> > drivers/xen/privcmd.c:  add_wait_queue_priority(wqh, &kirqfd->wait);
> > 
> > I mean, it might still be true and all, but hyperv seems to also use
> > this now.
> 
> Oh FFS, another "heavily inspired by KVM".  I should have bribed someone to take
> this series when I had the chance.  *sigh*
> 
> Unfortunately, the Hyper-V code does actually operate in exclusive mode.  Unless
> you have a better idea, I'll tweak the series to:
> 
>   1. Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and have the callers
>      explicitly set the flag, 
>   2. Add a patch to drop WQ_FLAG_EXCLUSIVE from Xen privcmd entirely.
>   3. Introduce add_wait_queue_priority_exclusive() and switch KVM to use it.
> 
> That has an added bonus of introducing the Xen change in a dedicated patch, i.e.
> is probably a sequence anyways.
> 
> Alternatively, I could rewrite the Hyper-V code a la the KVM changes, but I'm not
> feeling very charitable at the moment (the complete lack of documentation for
> their ioctl doesn't help).

Works for me. Michael is typically very responsive wrt hyperv (but you
probably know this).

