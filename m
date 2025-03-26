Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA7AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLrRlp5KJ9KUIi71uk+34vr7bPpoyZem9rwFkZwg0ow=; b=e8nA0QiVOnLnQdaCLc6a59GmwY
	Edl3Kj60s8pxu9055L+3Tk8/mZbBbZNJk9j6h/McSKQW9Cet7lc1MjCS+oYso3KVRLd803RVIZ2HT
	F+AuX2LrrNDN4H28falUMGOIKnSuAu0FdNnukcVfSDvfrakR1br1Y1JbRR/64DBCa7dUl3FhKCPJj
	VeixIFS2iKgIii90AWcBVxvxzOLMviOXuOSTlTtDCK2XJnuv2RdTLisVhw3+Bt34nJeJl2KqBjfhD
	gyC4s3TEa0jZ+QCMSdB8zND75KtF6ynEZT1gjMOHYJ2sGdjLRJcqWSifCwDEumg4V32JBTcfLk9Bo
	NxYJAjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTMq-00000008zJl-3sTN;
	Wed, 26 Mar 2025 16:12:36 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTL6-00000008zB9-45nA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:10:50 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so12109137a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743005447; x=1743610247; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLrRlp5KJ9KUIi71uk+34vr7bPpoyZem9rwFkZwg0ow=;
        b=UCFagXqKUoGtfw7NCOSJTyEpLEkDG+QZp1rjsQCeaXEkAsjFdlzkL9CwKrPKjQOL8D
         qj435nEMJqDghyHeMHeI9wL/k+yMJskL29407eS/yCK8t2qSv2O/+o+x2ezWHewEy+Qf
         r3BjyzBQXI22lhHhv7jYHQYlC44NkqL3cz8fjNciDBIT57tM9Db9Kl0pIYu5ocsmcLfI
         bVAQpyXsrEUvEYw2jomJ67aE+hbw0M4+qIOHZ0UQFDaMgpgUv6peFFJr2Y0Rg5FPtkNS
         JtpdjhkSSZ85aBlT2cmd07aLdygyoEY0mF/Vrmzi+h67KfzVlYZ01gXgg7DZCxwEemxb
         hYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743005447; x=1743610247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLrRlp5KJ9KUIi71uk+34vr7bPpoyZem9rwFkZwg0ow=;
        b=PJAZM8Ke01DH5VVVA0ylJf5eMc8mCE2EHYLD2bZFD6AOtBooasodd7OgloY7SEhqRu
         8QFIimFNBW4WKYbrqLdwaT/f3meaFVZYFQ9GRZloEsy/OQxp6XhcnVwWdbCfYtGPQ4W1
         GgP1qUDbFrV1Ai3Bw8vACWxHF7NKQa8v7JxNmLp0bDT2dtxN7ViSaaHWUZEISemeZ90c
         rDf/CXbgQv7IhxbB/mKSPD+rw+RLIIljm3OuejL8CoIcvjUQdndt7FdZDCfiVJoWrjGe
         2/mw/nd8T+3UTOgoVm3+lkW3vCiO8NS4X8yptF3AzvmAUn3wcLFKwYoVJppfkfBi05Ck
         EHCw==
X-Forwarded-Encrypted: i=1; AJvYcCUpZVUgLwAEZwM/2CQtdOIYg18KZfZsdlYrCqocxzCV4m2OspAo4lkMFwKBJ9SRNt1c4O9ZEhdxYGnPu5Ok/O8H@lists.infradead.org
X-Gm-Message-State: AOJu0YxF34PnV85EB9mhTLZmo63bHua6nLUrghGacnqV6cFkNGT3qSco
	SQ5xUX0ILoM+8G/I84lMREKiSHkhShujlMRbgoI1Qx0i5zKG/Hjx8wq60MPnp45JvDrebvHPAyY
	PJQ==
X-Google-Smtp-Source: AGHT+IGMVcgjpgCj0fYnAQnPKXCiqk1ze3TosYAsajSIn5jZ7TsL42ec0e2/MVtEl+5C4vOlf2f6anST6us=
X-Received: from pjbqx4.prod.google.com ([2002:a17:90b:3e44:b0:2fa:1803:2f9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f81:b0:2ff:784b:ffe
 with SMTP id 98e67ed59e1d1-303a7d6a9b4mr402639a91.11.1743005446972; Wed, 26
 Mar 2025 09:10:46 -0700 (PDT)
Date: Wed, 26 Mar 2025 09:10:45 -0700
In-Reply-To: <86y0wrlrxt.wl-maz@kernel.org>
Mime-Version: 1.0
References: <Z9nJ42PllG8a7AY7@linux.dev> <20250318230909.GD9311@nvidia.com>
 <Z9pryQwy2iwa2bpJ@linux.dev> <20250319170429.GK9311@nvidia.com>
 <Z9sItt8BIgvbBY8M@arm.com> <20250319192246.GQ9311@nvidia.com>
 <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com> <86y0wrlrxt.wl-maz@kernel.org>
Message-ID: <Z-QnBcE1TKPChQay@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Ankit Agrawal <ankita@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org" <will@kernel.org>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, 
	Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, 
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, 
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>, 
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
	"ardb@kernel.org" <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com" <tabba@google.com>, 
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_091049_039301_71D4B7F6 
X-CRM114-Status: GOOD (  39.01  )
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

On Wed, Mar 26, 2025, Marc Zyngier wrote:
> On Wed, 26 Mar 2025 14:53:34 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Wed, Mar 26, 2025, Ankit Agrawal wrote:
> > > > On Wed, Mar 19, 2025 at 04:22:46PM -0300, Jason Gunthorpe wrote:
> > > > > On Wed, Mar 19, 2025 at 06:11:02PM +0000, Catalin Marinas wrote:
> > > > > > On Wed, Mar 19, 2025 at 02:04:29PM -0300, Jason Gunthorpe wrote:
> > > > > > > On Wed, Mar 19, 2025 at 12:01:29AM -0700, Oliver Upton wrote:
> > > > > > > > You have a very good point that KVM is broken for cacheable PFNMAP'd
> > > > > > > > crap since we demote to something non-cacheable, and maybe that
> > > > > > > > deserves fixing first. Hopefully nobody notices that we've taken away
> > > > > > > > the toys...
> > > > > > >
> > > > > > > Fixing it is either faulting all access attempts or mapping it
> > > > > > > cachable to the S2 (as this series is trying to do)..
> > > > > >
> > > > > > As I replied earlier, it might be worth doing both - fault on !FWB
> > > > > > hardware (or rather reject the memslot creation), cacheable S2
> > > > > > otherwise.
> > > > >
> > > > > I have no objection, Ankit are you able to make a failure patch?
> > > >
> > > > I'd wait until the KVM maintainers have their say.
> > > > 
> > > 
> > > Maz, Oliver any thoughts on this? Can we conclude to create this failure
> > > patch in memslot creation?
> > 
> > That's not sufficient.  As pointed out multiple times in this thread, any checks
> > done at memslot creation are best effort "courtesies" provided to userspace to
> > avoid terminating running VMs when the memory is faulted in.
> > 
> > I.e. checking at memslot creation is optional, checking at fault-in/mapping is
> > not.
> > 
> > With that in place, I don't see any need for a memslot flag.  IIUC, without FWB,
> > cacheable pfn-mapped memory is broken and needs to be disallowed.  But with FWB,
> > KVM can simply honor the cacheability based on the VMA.  Neither of those requires
> 
> Remind me how this work with stuff such as guestmemfd, which, by
> definition, doesn't have a userspace mapping?

Definitely not through a memslot flag.  The cacheability would be a property of
the guest_memfd inode, similar to how it's a property of the underlying device
in this case.

I don't entirely see what guest_memfd has to do with this.  One of the big
advantages of guest_memfd is that KVM has complete control over the lifecycle of
the memory.  IIUC, the issue with !FWB hosts is that KVM can't guarantee there
are valid host mappings when memory is unmapped from the guest, and so can't do
the necessary maintenance.  I agree with Jason's earlier statement that that's a
solvable kernel flaw.

For guest_memfd, KVM already does maintenance operations when memory is reclaimed,
for both SNP and TDX.  I don't think ARM's cacheability stuff would require any
new functionality in guest_memfd.

> > a memslot flag.  A KVM capability to enumerate FWB support would be nice though,
> > e.g. so userspace can assert and bail early without ever hitting an
> > ioctl error.
> 
> It's not "nice". It's mandatory. And FWB is definitely *not* something
> we want to expose as such.

I agree a capability is mandatory if we're adding a memslot flag, but I don't
think it's mandatory if this is all handled through kernel plumbing.

> > If we want to support existing setups that happen to work by dumb luck or careful
> > configuration, then that should probably be an admin decision to support the
> > "unsafe" behavior, i.e. an off-by-default KVM module param, not a memslot flag.
> 
> No. That's not how we handle an ABI issue. VM migration, with and
> without FWB, can happen in both direction, and must have clear
> semantics. So NAK to a kernel parameter.
> 
> If I have a VM with a device mapped as *device* on FWB host, I must be
> able to migrate it to non-FWB host, and back. A device mapped as
> *cacheable* can only be migrated between FWB-capable hosts.

But I thought the whole problem is that mapping this fancy memory as device is
unsafe on non-FWB hosts?  If it's safe, then why does KVM needs to reject anything
in the first place?

> Importantly, it is *userspace* that is in charge of deciding how the
> device is mapped at S2. And the memslot flag is the correct
> abstraction for that.
 
I strongly disagree.  Whatever owns the underlying physical memory is in charge,
not userspace.  For memory that's backed by a VMA, userspace can influence the
behavior through mmap(), mprotect(), etc., but ultimately KVM needs to pull state
from mm/, via the VMA.  Or in the guest_memfd case, from guest_memfd.

I have no objection to adding KVM uAPI to let userspace add _restrictions_, e.g.
to disallow mapping memory as writable even if the VMA is writable.  But IMO,
adding a memslot flag to control cacheability isn't purely substractive.

