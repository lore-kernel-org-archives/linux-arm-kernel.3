Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B573C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 21:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOLKQV5MP6URX3X9jqnRFyBsWQauQYYSupdkNVN7Yn8=; b=rTytdDiEvBe7DnPCZf0FUcwyXy
	l0VYfutpZNGpeFVHXlP7chpX6slZ6O9W9stTec1vdHDiH7T7UaJroBOqJm4V6t6/e4AQkMJglX1F8
	EKt4PI3Vk3w5RRyI1CMV/4b7mrldOmdVNpGFH1/GrhMlwgwbOeGt9SMrHFblvQLLyB2NSnZy2wABm
	4P3UKUU0wFjQLvVUacala9vLhDCmn5VhBOERY6KPGfbnC9zz/6O+729znfUIeFdFqD/eqMK4Z0kjJ
	NvUu4obNlA5vKL6gkeeHWK24KR+m8ws7C9YGBFNCCE6/VafUry4y5m4ogax+fiqAonlhki0ROUoaA
	sdAilbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mJc-0000000FPt7-1oTE;
	Thu, 10 Sep 2026 21:28:16 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mJZ-0000000FPs3-32YL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 21:28:14 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9865so1269515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789075692; x=1789680492; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOLKQV5MP6URX3X9jqnRFyBsWQauQYYSupdkNVN7Yn8=;
        b=QuNHeR0hkcwXaZ55ogKmShB01OH2fmGX7gnqZ8+ej2w/SasA9WcGWrmJXmZGdI8HUc
         Bkw0a6UuP+igYd7HOUg6jHzzEkPbcHeyGUi5UE+ocJ8SSIQcvpLnMFnPWVPUxD/jT+v3
         HkPWGzz632IdxIT282CEtoaTcfQLbxlZKENoRhAk2F5VSKG/MjULHjyydrDHGTEnqSlQ
         BDylrdmwU//YtayS6kzK4S8fl7/Xevi64YPZe/sgEZwBe+T7w9QumPmIQM/t2v4dCVaK
         Q7jP+IayGc/qW7Hv9EC1UV3uQiwwltN5BPVH5ZpfijmkJJHhaahousk4Cb4dlkz+0Bv9
         0Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075692; x=1789680492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOLKQV5MP6URX3X9jqnRFyBsWQauQYYSupdkNVN7Yn8=;
        b=Df9ZRXSXDepWcVLQX4Oc+8sqzIQYX089Ban8KIUAshj+UzAffBzPJFBMj0ICs8xhFe
         CU5g1EROYnv157nXhmB1nM0IYuyK0ghoworMDP56l5a6SyyapmDEq2IRGZSRfaliDsIZ
         A+BjRC+feu4Su/lJzo0RumIOXtIhobmTsNhX2nEBNVJLnMOcx3YTm2PwinLBCA7yPhk9
         BtbQsYHR9AF4QC3u8wmjtK/NezYasvE4ng0Sf1CM+Dkfv5y1oeYoYc5f/kEM3Xm4VRIa
         Fo5pqK6utMUL2E2vVPFXd4lSJhLLqFAtPHgIRI8BGehj6RKq1ODuvbbPPqWkV6f4Yg5N
         5bxg==
X-Forwarded-Encrypted: i=1; AKwUvBwl8UD0qVtVFSZTRHiVde3F2k+p8V4OdHaEutwfx0y7a33CbjG0ZWBacjKmgQ1shkQ+Lo0CFJhLiZRWGsJNa+fq@lists.infradead.org
X-Gm-Message-State: AFuF++kZUQ7L+Vwysxo+3Cuhz9lAEcCmGvLlkMSiyP4PCxkZkmEpxiGf
	qGI9V1jROOM9idgtYlAVmn9aNESysXPkNSEDpa4tXH87kJQAi/au6zsL/a8rz2LS5g==
X-Gm-Gg: AYBFou1qBi+u/ETSQyoWc+2feQjro2lEwc6iDomjtVnzkoEtlP3Hu/eEFfcuDXm7/jV
	j19WY3duofVkw/SsSszAzT1tWdtajZdErWm5VtchAFLzSPXJMdnYBt3SHgCFCXkM8nJMPgn77Kb
	Ovwujms+WYDjJNoD7rZgVdv7d5qPvQnztBsDCC0MSrrt3I6dI7HSEQIY2+QQk7YGSajqBcmvVWX
	gjNfuYmlOEkQfTw3JGjYZgYg1l4JrS1mD/5eK0jG0mQuDRIjbMtTV//HlI6mo9YWawLK6HGF0wS
	OxJEoFqDmlMo31+dvi2G9FwnCavj4JOLWiLf9NkMe+j+XV8OvX7YnbRMSNvPm7VwAuj4vxNLoSY
	vE+84R2odhkzypkh89uFBNQiLeMIUL2DrXauVLMZyvyx4bdW3Q5Fiz8Y7KXPBO59cBxyZAAie/V
	Qv5NAPfbh+WHQ3/QPMgxl4lkp0w2/7Ylep0iF6wHB47kadWxTEYSE9Dg53Hcs8FaWBSvrgGLXZc
	EbE9hX9jlXfeUe0KqyfCH/hbyO0Fg3LKgkenrZ+
X-Received: by 2002:a17:902:d984:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd2a33648emr23827755ad.13.1789075690962;
        Thu, 10 Sep 2026 14:28:10 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb715bsm1812275ad.39.2026.09.10.14.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:28:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 21:27:58 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Logan Odell <loganodell@google.com>, arnd@arndb.de,
	pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, pbonzini@redhat.com,
	maz@kernel.org, oupton@kernel.org, bhelgaas@google.com,
	alex@shazbot.org, kevin.tian@intel.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	linux-mm@kvack.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] liveupdate: Move to feature flags for LUO and
 memfd ABI compatibility
Message-ID: <aqMgjXfTJ8u3n7Kj@google.com>
References: <20260903023452.721732-1-loganodell@google.com>
 <20260904160009.GV4157646@nvidia.com>
 <aptFFYqcSiBdMLE8@google.com>
 <20260905012403.GX4157646@nvidia.com>
 <aqIAtOoew-_6jw29@google.com>
 <20260910143448.GD3968357@nvidia.com>
 <aqLOWkuVKccR-I7W@google.com>
 <20260910171210.GF3968357@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910171210.GF3968357@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_142813_771231_C31422FB 
X-CRM114-Status: GOOD (  71.60  )
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

On 2026-09-10 02:12 PM, Jason Gunthorpe wrote:
> On Thu, Sep 10, 2026 at 08:35:54AM -0700, Sean Christopherson wrote:
> 
> > I guess maybe we have a different definition of ABI? 
> > 
> > I'm not saying that upstream has to be 100% forwards and backwards compatible.
> > I'm saying the serialization payload itself should communicate what features are
> > effectively required.  I.e. *if* there are incompatibilities, they should be
> > naturally expressed in the serialization format, not communicated out-of-band
> > through magic numbers.
> 
> The ABI strings were introduced specifically because extension makes
> the actual compatibility indeterminate by userspace. 
> 
> Keep in mind the actual goal here. Someone has kernel A and they need
> to blind kexec into kernel B and NOT have the machine explode, or all
> the VMs sitting on it lost.
> 
> Meaning you must have a way to determine before the kexec if kernel A
> is producing something B will *accept*. Accept is not "parse and fail
> with EOPNOTSUPP" like most uapi schems. Aceept means bring in and
> actually fully support and use.
> 
> So how do you solve this problem? You MUST declare in some kind of
> manifest exactly what ABIs are supported, in some way.

I think this series solves this problem in a fairly clean way without
relying on version numbers.

Each ABI is now extensible with a set of structured featured flags that
are exposed to userspace. Userspace can inspect the flags that the
kernel supports and confirm the next kernel also supports them.

I think there is still room for improvement, like determining what
features are used at runtime rather than statically at compile time, or
allowing userspace to disable use of certain features to control
compatability, but I think these things can be built into this type of
model.

> > The scenario you describe fits exactly with what I am proposing.  
> 
> It does not. What is really wanted here is to tell kernel A to only
> support ABI 1 for memfd and so kernel A will fail to serialize if it
> cannot do it because a newer seal flag was used.
> 
> We do not want to succeed to serialize then fail to accept after
> kexec and have a dead machine.
> 
> This is not anything like a normal uapi compatability problem.
> 
> > actually starts using the new sealing flag, the CSP can downgrade to
> > older kernels at will.  And if the user cares about downgrading,
> > then they need to prevent the flag from being used until the new
> > kernel is rollback-safe and deployed to enough hosts to prevent
> > stockout.
> 
> Yeah, CSP broadly has to do exactly this across a wide range of
> topics. It is a further reason why this feature is not exactly usable
> by a "mainstream" user :\
> 
> > > This is why I think the very idea we can support any version pair is
> > > too much to ask for. We should focus on supporting a small set of
> > > version pairs and not making it too invasive or hard in the kernel or
> > > on the maintainers.
> > >
> > > Thus live update within a stable branch only is my proposal for
> > > upstream support.
> > > 
> > > If it really succeeds at that and it becomes very popular, then let's
> > > discuss upstreaming doing additional version combinations.
> >
> > Why on earth would we have version numbers in the first place?  IMO, monotically
> > increasing version numbers are flat out the worst way to communicate
> > features.
> 
> As above, discoverablility is a key requirement.
> 
> Each version number is a very specific upstream defined ABI, in the
> sense if kernel A emits version X and kernel B accepts version X then
> kexec *must* work.
> 
> You can make some manifest in other more complicated ways, but I'm
> deeply skeptical that is really going to bring any value. It feels
> like it is just increasing the testing matrix :\

The value I see of the flag-based approach over the version-based
approach is:

 - Each component can have one ABI struct that extends over time and one
   serialization/deserialization routines, rather than N for the N
   supported current versions. Supporting multiple versions within a
   single kernel would be required for upgrade/downgrade. Maybe there is
   a way to make the multi-versioning support maintainable but it seems
   like it will be messy to me.

 - Features can be managed individually. Let's say a downstream user
   wants to use a new upstream feature. If we had a versioning model
   they would have to backport the entire version delta from their
   current kernel to that feature upstream. With flags they can backport
   and use an individual feature.

I agree testing matrix becomes more complex but maybe that can be
mitigated with your suggestion that upstream only "officially" supports
(i.e. tests) some constrained version sets like within a stable branch?

>  
> > > > I could see things like HugeTLB not working if someone booted the kernel with
> > > > support for only 1GiB pages and then tried to feed it payload with sub-1GiB ranges.
> > > > But to me, those sorts of things fall into the "well yeah, don't do that" category.
> > > 
> > > Okay, how about worse, todays kernel has hugetlbfs and there are
> > > patches around to luo serialize that. Lots and lots of talks about a
> > > post-hugetlbfs world out there.
> > 
> > And?  Adding a compatibility layer to a future kernel so that it
> > understands an incoming HugeTLBFS payload should be trivial.
> 
> From my experience that's optimistic :(
> 
> > > Do we want to constrain what is possible to ensure we accomodate this
> > > hugetlbfs serialization? I vote no.
> > 
> > In what way is providing strong ABI guarantees for individual components
> > constraining HugeTBLFS serialization?
> 
> I bet it will. Other things we've looked at seemed to be like that.
> Even the above about "yall screwed up" with memfd has the problem
> already. I don't believe we can ever do this so right that it won't be
> constraining to the kernel internals.
> 
> > > Do we want to reject the hugetlbfs serialization until we have a year
> > > of debate outlining every possible ABI scenario? I also vote no.
> > 
> > That's a bit of a strawman argument.  Is designing a forward-looking ABI easy?
> > No, but IMO "a year" is a massive exaggeration of the effort required to come up
> > with a scheme that can survive a variety of plausible upgrade/downgrade scenarios.
> 
> Have you tried to get anything merged into the kernel lately? I've got
> lots of uncontroversial stuff pushed out past 4 months already. Some
> luo patches are close to a year already and don't even have any
> controversy.
> 
> > And again, I'm not saying we have to support infinite compatibility.  
> 
> Okay, I said same stable branch only, do you have some wider
> limitation in mind?
> 
> > > Should we make a downgrade round trip a downstream problem? I think
> > > so!
> > 
> > Hard NAK.  There will inevitably be boundaries that cannot be crossed, but I am
> > not at all ok punting on downgrades.  To me, that's basically saying "we want to
> > add just enough support upstream so that it's not too painful to carry full support
> > out-of-tree".  That completely goes against the spirit of open source and upstream
> > Linux, and I want no part of it.
> 
> I generally agree with you sentiment, but I think this is a unique
> case. I've asked around a fair bit, this is sufficiently complicated,
> requires alot of userspace that the CSPs are not open sourcing so has
> a very minimal usage foot print out side their world. I found one
> other possible user that might be more open source oriented..
> 
> So, if I was feeling unreasonable I'd say stay out of the upstream
> kernel entirely.
> 
> Though, I think this could grow and maybe some open source ecosystem
> will develop around it. I don't know. I'm willing to give it a
> chance.
> 
> HOWEVER upstream is not some kind of free outsourcing for the CSP's
> proprietary forks! Do not ask maintainers to do significant and
> burdensome work that only a CSP is ever going to consume and can only
> really work in a closed proprietary environment. There is no "spirit
> of open source" in that kind of demand. I will be NAKing anything like
> that in my subsystems, I am not signing up to do live update stable
> ABI so the CSPs alone can have a better proprietary product.
> 
> This is how I come to my conclusion that upstream should support same
> stable branch only at this point. It minimizes the burden, it is a
> decent trail of the technology, and if things go well with a quality
> open ecosystem then sure, upstream can change its mind.
> 
> Jason

