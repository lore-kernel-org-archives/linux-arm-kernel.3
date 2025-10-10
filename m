Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A8CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 21:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CjJmSa/xDKPrpCplLdbCAjMTmIn7FLY2jt9GfKsc0c=; b=LFVTuhZ3cAFZpSGxRyMOZ4vPtA
	s0vH1d3oJ1ldJQRtToh6J9klt01BoVhOSQQ3D0NzWpjkqCt0dVPAASSXti1/aU5p0tFA9HufxJpfw
	pItuctREpJnrUpJvaQycdv+c+yf+YD21LHvmK14if75VW0Pqh4MQ9BTHF0EVUHZwPee2hJk0Q9dTH
	oFNz5r+qQsz+BiOc6Kk56mPKAgR12OGwh43on/wzWHL+MqAXuOXMasv85n5gVYr3XN6eDsYvkjhoc
	oDCGIlFZBqgPbm5w2AC1qV1CBjv6Lj/LOgg2JbEDmRTgNgkiT/B85v7Ggi70BIkGN/cMpPmVFfmn+
	A0d5LzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7L76-00000009RTg-3PMF;
	Fri, 10 Oct 2025 21:57:24 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7L74-00000009RSz-1IPJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 21:57:23 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso8325724a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 14:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760133441; x=1760738241; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CjJmSa/xDKPrpCplLdbCAjMTmIn7FLY2jt9GfKsc0c=;
        b=noQVOPaRv8Bcp96BnnuBQyMAfP1CaFMK/LBqbfqWiN6ih4AIC3AgACZJwNi4INSiXm
         8pm2s2mfiSGhztJqT//wch0jDvBnCxrHVQuLPITqb/g4DvxiJq2Ktik+c6IPaIvIjYPw
         mzRgad0JQ9tqw72GYH+GI/IDKEz4qHxSjbHW8gN88kAkwhQQ5GBgduyQVTkWM76CZz3c
         SiBBAiNEcWlfXKf16+gf3f3XOmXz+jzxRvR9gWV685j5vtNstg1Tlbg8GhLvV+zZA27G
         AJB1ykKIo+wENXeOc9y08W8MQ+s/IU47xDEc3AKZAtJCThlm9YpiM6AG7snKJM0P8pCe
         z7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760133441; x=1760738241;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CjJmSa/xDKPrpCplLdbCAjMTmIn7FLY2jt9GfKsc0c=;
        b=ZcVo76qzgNAkaKVd+193F6Q+M956udYpVdYkJuUuL+D0YT2q7ios3/cZsZW/ir4sii
         p4mgIYTljQ/MkVPIA4QP+R88ZnzA+fw84faJB/QyMTQwZkmsRZoM1LoQdhlr3ip2WWnD
         xQYqdd+/emtCVWrvxWbx8NNnaF+T5EG+2iuJlNnp5a5Bbua3tLztBJALMN0f6rChpjMM
         iHx+sjLHuQ9P6NDAX8oUH05wp4tOI7+Dzokm0Y/2IovcWOOekuoAMfHnXe+/VODBbash
         Rf7DCRMoNA4mQzDNqWOy0ZLd7tnq+bqcYp8ydln2Ywy1+S1pKeRjOmuCuti7sAVum6Ap
         vr+w==
X-Forwarded-Encrypted: i=1; AJvYcCXO5tWR9TujAJIl9jNVJ0K+4DX/8leUs9Zv2igtXy600S7TrcQ/2rHtM1Re4vprDyCxfyTFpjSRy3/WOevcczno@lists.infradead.org
X-Gm-Message-State: AOJu0YwmFZjC2p+zwDDRAKnrqwoG/HqekdeAFzEthShitIXUZAuVHxYa
	HscT1CnUVN3rt5FXFo0Qp7qFeTH7bdxX+91+/3pephHJH3H3A7KJLc6ocaJ9bgbRm2jUpI22Ljh
	8E+qvw5B/hVq1DPijn6tB/FFpDA==
X-Google-Smtp-Source: AGHT+IGYgyBc6HexQmAe6kTYgJMM1MjLeDik4f5tZp5udMaitkKnqtOlleS/fc4L8ze18sw7c/5OQ0YI+1OxGD54kg==
X-Received: from pjbfs19.prod.google.com ([2002:a17:90a:f293:b0:330:9af8:3e1d])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:244b:b0:325:b6b:9f80 with SMTP id adf61e73a8af0-32da845fdffmr19296952637.43.1760133441208;
 Fri, 10 Oct 2025 14:57:21 -0700 (PDT)
Date: Fri, 10 Oct 2025 14:57:19 -0700
In-Reply-To: <aOltikRvKzCy1DXN@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-6-seanjc@google.com>
 <diqzo6qfhgc9.fsf@google.com> <e9bd02ba-ff0e-47a3-a12e-9a53717dde9b@amd.com> <aOltikRvKzCy1DXN@google.com>
Message-ID: <diqzv7kmfmio.fsf@google.com>
Subject: Re: [PATCH v12 05/12] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_145722_350273_4FB9D92F 
X-CRM114-Status: GOOD (  30.06  )
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

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Oct 10, 2025, Shivank Garg wrote:
>> >> @@ -112,6 +114,19 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>> >>  	return r;
>> >>  }
>> >>  
>> >> +static struct mempolicy *kvm_gmem_get_folio_policy(struct gmem_inode *gi,
>> >> +						   pgoff_t index)
>> > 
>> > How about kvm_gmem_get_index_policy() instead, since the policy is keyed
>> > by index?
>
> But isn't the policy tied to the folio?  I assume/hope that something will split
> folios if they have different policies for their indices when a folio contains
> more than one page.  In other words, how will this work when hugepage support
> comes along?
>
> So yeah, I agree that the lookup is keyed on the index, but conceptually aren't
> we getting the policy for the folio?  The index is a means to an end.
>

I think the policy is tied to the index.

When we mmap(), there may not be a folio at this index yet, so any folio
that gets allocated for this index then is taken from the right NUMA
node based on the policy.

If the folio is later truncated, the folio just goes back to the NUMA
node, but the memory policy remains for the next folio to be allocated
at this index.

>> >> +{
>> >> +#ifdef CONFIG_NUMA
>> >> +	struct mempolicy *mpol;
>> >> +
>> >> +	mpol = mpol_shared_policy_lookup(&gi->policy, index);
>> >> +	return mpol ? mpol : get_task_policy(current);
>> > 
>> > Should we be returning NULL if no shared policy was defined?
>> > 
>> > By returning NULL, __filemap_get_folio_mpol() can handle the case where
>> > cpuset_do_page_mem_spread().
>> > 
>> > If we always return current's task policy, what if the user wants to use
>> > cpuset_do_page_mem_spread()?
>> > 
>> 
>> I initially followed shmem's approach here.
>> I agree that returning NULL maintains consistency with the current default
>> behavior of cpuset_do_page_mem_spread(), regardless of CONFIG_NUMA.
>> 
>> I'm curious what could be the practical implications of cpuset_do_page_mem_spread()
>> v/s get_task_policy() as the fallback?
>
> Userspace could enable page spreading on the task that triggers guest_memfd
> allocation.  I can't conjure up a reason to do that, but I've been surprised
> more than once by KVM setups.
>
>> Which is more appropriate for guest_memfd when no policy is explicitly set
>> via mbind()?
>
> I don't think we need to answer that question?  Userspace _has_ set a policy,
> just through cpuset, not via mbind().  So while I can't imagine there's a sane
> use case for cpuset_do_page_mem_spread() with guest_memfd, I also don't see a
> reason why KVM should effectively disallow it.
>
> And unless I'm missing something, allocation will eventually fallback to
> get_task_policy() (in alloc_frozen_pages_noprof()), so by explicitly getting the
> task policy in guest_memfd, KVM is doing _more_ work than necessary _and_ is
> unnecessarily restricting usersepace.
>
> Add in that returning NULL would align this code with the ->get_policy hook (and
> could be shared again, I assume), and my vote is definitely to return NULL and
> not get in the way.

... although if we are going to return NULL then we can directly use
mpol_shared_policy_lookup(), so the first discussion is moot.


Though looking slightly into the future, shareability (aka memory
attributes or shared/private state within guest_memfd inodes) are also
keyed by index, and is a property of the index and not the folio (since
shared/private state is defined even before folios are allocated for a
given index.

