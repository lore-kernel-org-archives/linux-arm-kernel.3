Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869C3CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbYRjcxiLRGKL2LIFUGAiQXkDS5QuVlAtEitSDKwgNo=; b=FxWQPK9XlXoQ00vtU9jrYm3dvy
	q38gxIzZkRMOoKHEGUVmCfpiR6uZDV4PshmGuo84+BM4q4SckaZjDWpe40NHh/8qe2AVDsr5w5Qnk
	2EFRdPvy12K1lvdv2DhM8mnoF5caF8akOayVXgT8biDKiLyFvDYqmf+Usz8VaiHzV5kULEOqvmovM
	cD7DGv4ziGTU3hClAzAqniwOtefDP3VnJCXCaB6lL6ys5hQFUZz2LEtY+xmqtspHCfBYALRrEAhJu
	hiiVt1VYY59KMUJp55psrH6IzS4zkBCbRFEhe5yUFSoFP7DJtacK62sEHDDFLenkBLG48HqjkCgru
	r0i2s7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94oA-00000002Nfo-06mz;
	Wed, 15 Oct 2025 16:57:02 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94o7-00000002Ner-0Aiq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:57:00 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3305c08d975so10413920a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760547417; x=1761152217; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbYRjcxiLRGKL2LIFUGAiQXkDS5QuVlAtEitSDKwgNo=;
        b=Fx9LwSV0PElMMQKnhr1h09uKFqOrPjMsYnI4/6rMPK5KzYpBKrJafaob3z5spUTz+L
         nG4F1EAPy22RFcaUq1aqCFTTbiDvTdXrmll3HHg6nDEIDRE2NpcTNFW3k8M8T16a4Z/6
         IpxV0D193VOmCPRLGlWtjlghu+SM2C/Lt3aFgPKWRhKVwyJNeX/zagePyYQ8tNYYk5sm
         Pf3EXbZku2LorQh+R2RQvYX2AbeBSeP+D3/Xqg4oL/iJpZTZ0p94W3mPLtOkwV8R7XAt
         cLcuRGwxn66awiAsbubUGL0CiFwlSnbYuJ8B6hLtXwAWpWCjJnFP4/W/eHBNkg6qK6cC
         R6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547417; x=1761152217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbYRjcxiLRGKL2LIFUGAiQXkDS5QuVlAtEitSDKwgNo=;
        b=p8DiNJWduyTGbWj1+FG9FHOhs2hqI1c3Le6t8bl5XukQQvHBIBx9or/r7s6pB2S+rd
         kFuCvzkyBmLG4sieEy0g4fbxXqdG4/mbHYgp+yWkSdgEVKaVQHtB33MO/q6qanX7Bhuq
         7MQLmlHeEUzjhKbig5iIfOabcR5P3hemEzDccgGa1FdnOVLsLsFpNWi2a+KNq7j974Nd
         W+PtY0zqEugrnDg8j7Y3M/BtzXE8QDX1rcCP75QT4zEomYKR+IyOF7MaHnP9FAoYPq0+
         4BwmLWWFU4jTJV9zLiBt82V7SE2JQZRuhk5Iu+9bvt126MUKe42u0mYah2VXlrnoKIqu
         TOug==
X-Forwarded-Encrypted: i=1; AJvYcCX8F4Jp3bMB+WGttF+QndrE9vl7ame83zcfl2sealWdjzd/aa77Xcc/ntSeo3wBzq6EXuZRQdsxHH5ijUxs5B1u@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3yhxbHZuuB2FR3TJLXLevHYnuPcnbVQt8WsN0P+6vPBcCnObp
	9EwzKd5EqQ4qfjK8YggC0wGPo5tP8pzay/qiSShxo9sif44p0BSv0wYNvWFhegYjZUr+LfnFSzw
	CWaSFeg==
X-Google-Smtp-Source: AGHT+IE8G6rCUXSY9kLglvAN1OT5mVOTch4nfQN3hIBfcNRFcG0ozBsKIivfelaBWpgamTPWwCFJi/Lz678=
X-Received: from pjbgj15.prod.google.com ([2002:a17:90b:108f:b0:330:72b8:fcc0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3843:b0:330:bca5:13d9
 with SMTP id 98e67ed59e1d1-33b513b4c9cmr36865790a91.32.1760547417511; Wed, 15
 Oct 2025 09:56:57 -0700 (PDT)
Date: Wed, 15 Oct 2025 09:56:55 -0700
In-Reply-To: <diqzv7kmfmio.fsf@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-6-seanjc@google.com>
 <diqzo6qfhgc9.fsf@google.com> <e9bd02ba-ff0e-47a3-a12e-9a53717dde9b@amd.com>
 <aOltikRvKzCy1DXN@google.com> <diqzv7kmfmio.fsf@google.com>
Message-ID: <aO_SV0ee6h8rK9dZ@google.com>
Subject: Re: [PATCH v12 05/12] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Shivank Garg <shivankg@amd.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_095659_083717_E290D84F 
X-CRM114-Status: GOOD (  40.03  )
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

On Fri, Oct 10, 2025, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Fri, Oct 10, 2025, Shivank Garg wrote:
> >> >> @@ -112,6 +114,19 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
> >> >>  	return r;
> >> >>  }
> >> >>  
> >> >> +static struct mempolicy *kvm_gmem_get_folio_policy(struct gmem_inode *gi,
> >> >> +						   pgoff_t index)
> >> > 
> >> > How about kvm_gmem_get_index_policy() instead, since the policy is keyed
> >> > by index?
> >
> > But isn't the policy tied to the folio?  I assume/hope that something will split
> > folios if they have different policies for their indices when a folio contains
> > more than one page.  In other words, how will this work when hugepage support
> > comes along?
> >
> > So yeah, I agree that the lookup is keyed on the index, but conceptually aren't
> > we getting the policy for the folio?  The index is a means to an end.
> >
> 
> I think the policy is tied to the index.
> 
> When we mmap(), there may not be a folio at this index yet, so any folio
> that gets allocated for this index then is taken from the right NUMA
> node based on the policy.
> 
> If the folio is later truncated, the folio just goes back to the NUMA
> node, but the memory policy remains for the next folio to be allocated
> at this index.

Right.  Though thinking about this more, there's no reason to have "index" in
the name, kvm_gmem_get_policy() is sufficient.  E.g. we don't have "index" in
the name for things like kvm_get_vcpu().

Luckily, it's all made moot by Shivank's fixup :-)

> >> >> +{
> >> >> +#ifdef CONFIG_NUMA
> >> >> +	struct mempolicy *mpol;
> >> >> +
> >> >> +	mpol = mpol_shared_policy_lookup(&gi->policy, index);
> >> >> +	return mpol ? mpol : get_task_policy(current);
> >> > 
> >> > Should we be returning NULL if no shared policy was defined?
> >> > 
> >> > By returning NULL, __filemap_get_folio_mpol() can handle the case where
> >> > cpuset_do_page_mem_spread().
> >> > 
> >> > If we always return current's task policy, what if the user wants to use
> >> > cpuset_do_page_mem_spread()?
> >> > 
> >> 
> >> I initially followed shmem's approach here.
> >> I agree that returning NULL maintains consistency with the current default
> >> behavior of cpuset_do_page_mem_spread(), regardless of CONFIG_NUMA.
> >> 
> >> I'm curious what could be the practical implications of cpuset_do_page_mem_spread()
> >> v/s get_task_policy() as the fallback?
> >
> > Userspace could enable page spreading on the task that triggers guest_memfd
> > allocation.  I can't conjure up a reason to do that, but I've been surprised
> > more than once by KVM setups.
> >
> >> Which is more appropriate for guest_memfd when no policy is explicitly set
> >> via mbind()?
> >
> > I don't think we need to answer that question?  Userspace _has_ set a policy,
> > just through cpuset, not via mbind().  So while I can't imagine there's a sane
> > use case for cpuset_do_page_mem_spread() with guest_memfd, I also don't see a
> > reason why KVM should effectively disallow it.
> >
> > And unless I'm missing something, allocation will eventually fallback to
> > get_task_policy() (in alloc_frozen_pages_noprof()), so by explicitly getting the
> > task policy in guest_memfd, KVM is doing _more_ work than necessary _and_ is
> > unnecessarily restricting usersepace.
> >
> > Add in that returning NULL would align this code with the ->get_policy hook (and
> > could be shared again, I assume), and my vote is definitely to return NULL and
> > not get in the way.
> 
> ... although if we are going to return NULL then we can directly use
> mpol_shared_policy_lookup(), so the first discussion is moot.

Ha!  Great minds think alike, right!!?!

> Though looking slightly into the future, shareability (aka memory
> attributes or shared/private state within guest_memfd inodes) are also
> keyed by index, and is a property of the index and not the folio (since
> shared/private state is defined even before folios are allocated for a
> given index.

Yeah, which further reinforces that having "index" in the function name is
superfluous (and potentially confusing), e.g. IMO the proposed helpers:

  kvm_gmem_get_attributes()
  kvm_gmem_is_private_mem()
  kvm_gmem_is_shared_mem()

are far better than e.g.:

  kvm_gmem_get_index_attributes()
  kvm_gmem_is_index_private_mem()
  kvm_gmem_is_index_shared_mem()

