Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7921BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4WKjl2E9WbuIFhs5JLmpEcHpxZyN+nyEAJYdJG5kGQ=; b=uZK76kfEhm93uFJrpQ3j6Ou6uC
	fCjD2m65vhtNzUMsTN9kmneLGiT3N6H0S63lXZfyjx+K57KfTGqG7CQ3kTBicYkfM787ovuHjf+D5
	giKtsECuBRoZwuLeFPHq0auDU/jZ/HSsWZkBRkPuJRWi0gUU8bhqoFU6umHZ7w1omtwxduo+9ASOQ
	tb8+7c15isRawoyFlQCsCFoj2ge/OgUUl4xwFX3TGdsNpCZp0satP5CRLESd5vm6sNU5rpgYruNgW
	M4EobZmAyK3v/NkkZHu77WSQ288rhN9fvJBVkEuAOIQcNNtEiC5rmnIvVKfFJG1mgfzjuTQC7vIf5
	vzv5Lubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jnj-00000009Jz1-3Jp3;
	Fri, 10 Oct 2025 20:33:19 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jnh-00000009Jyf-1F2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 20:33:18 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-269939bfccbso56374995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760128396; x=1760733196; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4WKjl2E9WbuIFhs5JLmpEcHpxZyN+nyEAJYdJG5kGQ=;
        b=JdSZEGVcNNOVU1UZog8qgPMd2WwS5OjsineZXHya24ClvCPZRwWNxFkZwTeRRjPdoN
         LwX7z18jol2nQdVVkU1AzaJGTd0ziPao15hhbXduxTjwiI2aRTPqhmyrGqXK7uxy2xsm
         rmgZ40NrG1WO6rfuLFxD9Tgn+88aUcduSBSw95jaKDmE3d+hkO4aaBbYgWZbRmlGiTmy
         jR07oqM4kQZuU0tfv1A84BwFcAhM5o7zjfODy7dFeO+pQSiw26MyrQFZEcAKnwGNU5Yr
         VWTU8Hquk1Xf3Q+SYzmn1aIps0ZYk4AKcbtzGLmkBS9DleSHinxXZxV7RZW+mSJmGn0k
         y83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760128396; x=1760733196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4WKjl2E9WbuIFhs5JLmpEcHpxZyN+nyEAJYdJG5kGQ=;
        b=KxI+Sg82UsCMmAO21ya7rXBNZzcSbmJ3XuU261ISyDZzCdv0spPOIEv4yvTA5m7YPb
         eUzGaQauPB0KgFJtJ3qMN21737p3qEN66xlWmMohZdcClun/7EW55kmgSNhaljO12OP5
         ZPn7RGhhP6SffUOCyaveEn2jBlWFlbabBrvaWRK7rY2PLFNJ9GFAkjTwUeN0te+6Xzz6
         7JbYL9q7oZH9EDc2ymhPQTtoWFfKA3EJNfLEjaQoqAoprYAu9JevG7Xn09tGc5K7nyp2
         Z2cbxUC5gsNETUt/eivOwZIwiPtr+kRXks0520cV8dvFrh1/7eQLkdr98XQAzNcKhvcx
         jN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmg26qA95KwfLALJ/pTG+b9j3Gx9Tc4n3rRT+wzeG9lWI4NMBsDbXlpzEcCFxI/y95f5w3gcG+bWlLJgsgXAVc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4YTIoSwK/k0jaJ43qtiq/dHKUgYH90D6s69y3Q894uaDZ8uyv
	MNDeYRpFbaOH8iKLNdi0U5KT9Nsnr5awNf63/i/Vu7/gjAEsbYbE8SXGqCBZfXtcf0h8aIEj9Am
	Pu20FNQ==
X-Google-Smtp-Source: AGHT+IHFcGHBjt5WD8SXsC1G25bD9P3AfNkPCXsvq/nAV+y/iv/KTrwq4V0pmquBSd24rCSDN6ZBdmCxlM8=
X-Received: from plpo9.prod.google.com ([2002:a17:903:3e09:b0:27e:ed03:b5a5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc7:b0:269:8404:9a6b
 with SMTP id d9443c01a7336-2902741e466mr159655195ad.57.1760128395608; Fri, 10
 Oct 2025 13:33:15 -0700 (PDT)
Date: Fri, 10 Oct 2025 13:33:14 -0700
In-Reply-To: <e9bd02ba-ff0e-47a3-a12e-9a53717dde9b@amd.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-6-seanjc@google.com>
 <diqzo6qfhgc9.fsf@google.com> <e9bd02ba-ff0e-47a3-a12e-9a53717dde9b@amd.com>
Message-ID: <aOltikRvKzCy1DXN@google.com>
Subject: Re: [PATCH v12 05/12] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_133317_340135_C0C99DF1 
X-CRM114-Status: GOOD (  21.18  )
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

On Fri, Oct 10, 2025, Shivank Garg wrote:
> >> @@ -112,6 +114,19 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
> >>  	return r;
> >>  }
> >>  
> >> +static struct mempolicy *kvm_gmem_get_folio_policy(struct gmem_inode *gi,
> >> +						   pgoff_t index)
> > 
> > How about kvm_gmem_get_index_policy() instead, since the policy is keyed
> > by index?

But isn't the policy tied to the folio?  I assume/hope that something will split
folios if they have different policies for their indices when a folio contains
more than one page.  In other words, how will this work when hugepage support
comes along?

So yeah, I agree that the lookup is keyed on the index, but conceptually aren't
we getting the policy for the folio?  The index is a means to an end.

> >> +{
> >> +#ifdef CONFIG_NUMA
> >> +	struct mempolicy *mpol;
> >> +
> >> +	mpol = mpol_shared_policy_lookup(&gi->policy, index);
> >> +	return mpol ? mpol : get_task_policy(current);
> > 
> > Should we be returning NULL if no shared policy was defined?
> > 
> > By returning NULL, __filemap_get_folio_mpol() can handle the case where
> > cpuset_do_page_mem_spread().
> > 
> > If we always return current's task policy, what if the user wants to use
> > cpuset_do_page_mem_spread()?
> > 
> 
> I initially followed shmem's approach here.
> I agree that returning NULL maintains consistency with the current default
> behavior of cpuset_do_page_mem_spread(), regardless of CONFIG_NUMA.
> 
> I'm curious what could be the practical implications of cpuset_do_page_mem_spread()
> v/s get_task_policy() as the fallback?

Userspace could enable page spreading on the task that triggers guest_memfd
allocation.  I can't conjure up a reason to do that, but I've been surprised
more than once by KVM setups.

> Which is more appropriate for guest_memfd when no policy is explicitly set
> via mbind()?

I don't think we need to answer that question?  Userspace _has_ set a policy,
just through cpuset, not via mbind().  So while I can't imagine there's a sane
use case for cpuset_do_page_mem_spread() with guest_memfd, I also don't see a
reason why KVM should effectively disallow it.

And unless I'm missing something, allocation will eventually fallback to
get_task_policy() (in alloc_frozen_pages_noprof()), so by explicitly getting the
task policy in guest_memfd, KVM is doing _more_ work than necessary _and_ is
unnecessarily restricting usersepace.

Add in that returning NULL would align this code with the ->get_policy hook (and
could be shared again, I assume), and my vote is definitely to return NULL and
not get in the way.

