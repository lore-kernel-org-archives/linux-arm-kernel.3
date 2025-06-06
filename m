Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8636C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy4s6eK2oicgrVJHBktYrwR1uwscm0ofZKzJBnShpYk=; b=H8DpGb0HYG+6DXw20goGqAuqKb
	tR61gNIUe3/mUDxMUHy2m9h5dJRDWBQtU4C/nnpVk9nqjCJREuHEf25nVJJ4kkZHCG70ZTKtUgy4i
	v0j9oksqoC2N6YlbZElR/19WEyb64JmLgrsHJYLFUHYGmORSoqCM4evxFJnILgfRNJPZ5ZhqfA+L7
	PJtUtOia7E8fBbomRU2Ld1fkfK3Wtm2qOIaxlIjQ5Ktcx8ek1xIuig8wLiv/wR34XwNV0ej5rbhl3
	vxMPe/E4D7CL8SWhKq/uUmUjkrp0uWQ+ymfHo9ijIjrlKh5tPqH2CHXavrp4jvetbV8xOzjZR7fLd
	nc5JF3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbM6-00000000lms-1Y4k;
	Fri, 06 Jun 2025 17:59:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbJy-00000000lcZ-0f8M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 17:57:39 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7370e73f690so2949941b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749232657; x=1749837457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uy4s6eK2oicgrVJHBktYrwR1uwscm0ofZKzJBnShpYk=;
        b=x/Wz+cm5MxZUwNgwaPLIDGpFSmKDrubyGkipTludn2Ow63VBu4pq52hNtiDKAqfYi8
         hPK2tUFSfAYU/dCrhHDKRGYR9I4ophHC57h/XY4bSOqjodkiQPK7elBQ/DJMSVNH50Y/
         PN3GWr0JmxRU5a0n4yPkFD8QnlUis1UAVtFJ/QlrM4P7QOX20qQWBCs3cCX8aqHPu6nB
         OVedt7lfi5diHkBQf0ytvke+TVL+DHhFti/05b88P9m5tnzEMOHXwycpQv0yIITZPXxm
         IGLmEGQqGKd6f+loNVYbqAiRYkxjV2HfhDhnF/BFqRd6X+1+i+G57orpc6FTXJyKy7Nf
         ORjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749232657; x=1749837457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uy4s6eK2oicgrVJHBktYrwR1uwscm0ofZKzJBnShpYk=;
        b=ej9XqfX/ztN8aoBnm5XSEju+twnwKgXs2Jt1GVGZ4/SL9Le//WCvhBneg3+I+9jNxq
         1dhTHShlQGvjecpHhQCdcxOcL3r3znnsQKmzPt9JRsIExoafpgpII3vnvqPUYxsG2Jdo
         SJoA53Nffarp7qljqA+iQJisB7sBZ3slt+yyA2ImeVwJesTqnkTDjiACv/fKu9w1+6R6
         8HWDwfSdHvfB4+UXSHnsYyPgRTcUoDxihUjs6dmqJ0WTZQkOooGXXi4LcOnKf+g87s6x
         4Yk9OuOzHxzljMSIUui04UWgzuO7wiUrhZqGT8pSvCvdsdBNZNubzIqlcrBpF1ENAY62
         qtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDyMF5xHuL40D6ULtkSJOIoYEfPF6Ceo0tO/JSw/o7APTMoUde2U3Lz5abLdHj5H9CKAs6HGXZarkCMCMprsDd@lists.infradead.org
X-Gm-Message-State: AOJu0YyO9e9z/syI6+n6zLAm/2vpjoD2vaAZ3NQ6+qoezzVQF1IuqJ0U
	BHypzle15ZLyJCUuNVZ/75QoZIwO5hvppwoKmYlLhf7v9L4o+yjApt+wY7F9U9voL+hNA5ibzeU
	0VjMW4g==
X-Google-Smtp-Source: AGHT+IE0O8E/z1AW0aCKfeQ6ZwKpA8wqWW3uIA5Eo0Mj+1d46DIjhKhwh8m8l5jhmiyq44/R62b0WTD+8ZQ=
X-Received: from pfaz1.prod.google.com ([2002:aa7:91c1:0:b0:746:3185:144e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:22d1:b0:742:a91d:b2f5
 with SMTP id d2e1a72fcca58-74827ea2140mr5987849b3a.13.1749232656472; Fri, 06
 Jun 2025 10:57:36 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:57:34 -0700
In-Reply-To: <SA1PR12MB71990A84FDB4350DC02CEC6EB064A@SA1PR12MB7199.namprd12.prod.outlook.com>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-4-ankita@nvidia.com>
 <20250527002652.GM61950@nvidia.com> <SA1PR12MB71990A84FDB4350DC02CEC6EB064A@SA1PR12MB7199.namprd12.prod.outlook.com>
Message-ID: <aEMsDsi3DSm1up0G@google.com>
Subject: Re: [PATCH v6 3/5] kvm: arm64: New memslot flag to indicate cacheable mapping
From: Sean Christopherson <seanjc@google.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "maz@kernel.org" <maz@kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, 
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, 
	Andy Currid <acurrid@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>, 
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, 
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>, 
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
	"ardb@kernel.org" <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com" <tabba@google.com>, 
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_105738_217110_0A9383C5 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, May 27, 2025, Ankit Agrawal wrote:
> > I thought we agreed not to do this? Sean was strongly against it
> > right?

Yes.  NAK, at least for this implementation.

IMO, this has no business being in KVM's uAPI, and it's a mess.  KVM x86
unconditionally supports cacheable PFNMAP mappings, yet this:

  bool __weak kvm_arch_supports_cacheable_pfnmap(void)
  {
	return false;
  }

	if (kvm_arch_supports_cacheable_pfnmap())
		valid_flags |= KVM_MEM_ENABLE_CACHEABLE_PFNMAP;

means x86 will disallow KVM_MEM_ENABLE_CACHEABLE_PFNMAP.  Which is fine-ish from
a uAPI perspective, as the flag is documented as arm64-only, and we can state that
all other architectures always allow cacheable mappings.  But even that is a mess,
because KVM won't _guarantee_ the final mapping is cacheable.

On AMD, there's simply no sane way to force WB (KVM can't override guest PAT,
i.e. the memtype requested/set by the guest's stage-1 page tables).

On Intel, after years of pain, we _finally_ got KVM out of a mess where KVM was
forcing WB for all non-MMIO memory.  Only to have to immediately revert and add
KVM_X86_QUIRK_IGNORE_GUEST_PAT because buggy guest drivers were relying on KVM's
behavior :-(

So there's zero chance of this memslot flag ever being supported on x86.  Which,
again, is fine for uAPI.  But for internal code it's going to be all kinds of
confusing, because kvm_arch_supports_cacheable_pfnmap() is a flat out lie.

And as proposed, the memslot flag also doesn't actually address Oliver's want:

  The memslot flag says userspace expects a particular GFN range to guarantee
                                                                    ^^^^^^^^^
  Write-Back semantics.

IIUC, what Oliver wants is:

			if (mapping_type_noncacheable(vma->vm_page_prot)) {
				if (new->flags & KVM_MEM_FORCE_CACHEABLE_PFNMAP)
					return -EINVAL;
			} else {
				if (!kvm_arch_supports_cacheable_pfnmap()))
					return -EINVAL;
			}

That's at least a bit more palatable, as it doesn't create impossible situations
on x86, e.g. x86 simply doesn't support letting userspace force a cacheable.

And Oliver also stated:

  Whether or not FWB is employed for a particular region of IPA space is useful
  information for userspace deciding what it needs to do to access guest memory. 

The above would only cover half of that, i.e. wouldn't prevent userspace from
getting surprised by a WB mapping.  So I think it would need to be this?

			if (mapping_type_noncacheable(vma->vm_page_prot) !=
                            !(new->flags & KVM_MEM_FORCE_CACHEABLE_PFNMAP))
				return -EINVAL;

Which I don't hate as much, but I still don't love it, as it's overly specific,
e.g. only helps with PFNMAP memory, and pushes a sanity from userspace into KVM.

Which is another complaint with this uAPI: it effectively assumes/implies PFNMAP is
device memory, but that's simply not true.  There are zero guarantees with respect
to what actually lies behind any given PFNMAP.  It could be device memory, but
it could also be regular RAM, or something in between.

I would much prefer we have a way userspace query the effective memtype for a
range of memory, either for a VMA or for a KVM mapping, and let _userspace_ do
whatever sanity checks it wants.  That seems like it would be more generally
useful, and would be feasible to support on multiple architectures.  Though I'd
probably prefer to avoid even that, e.g. in favor of providing enough information
in other ways so that userspace can (somewhat easily) deduce how KVM will behave
for a giving mapping.

> > There is no easy way for VFIO to know to set it, and the kernel will
> > not allow switching a cachable VMA to non-cachable anyhow.
> 
> > So all it does is make it harder to create a memslot.
> 
> Oliver had mentioned earlier that he would still prefer a memslot flag as
> VMM should convey its intent through that flag:
>
> https://lore.kernel.org/all/aAdKCGCuwlUeUXKY@linux.dev/
> Oliver, could you please confirm if you are convinced with not having this
> flag? Can we rely on MT_NORMAL in vma mapping to convey this?

Is MT_NORMAL visable and/or controllable by userspace?

