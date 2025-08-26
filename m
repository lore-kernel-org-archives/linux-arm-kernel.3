Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F23CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsY3QiK0IbnEstf82hU96UYsRAXIuVACCLqPo2mVzDA=; b=gbNjymHRH/wUObrxg0Eo3RDtQu
	80LQJEv9Cjols7PIhGMUcWL8sdgRuEsf3R5sS85fM8irWJ4eVDUZ+F54x8fSxrquFQMiSudywZ9Se
	MS2iP7SmfYp5yxWG4JqKOwDxQHeDwczYbu6YS5D7NXQrTu8rpTB5+NuLcBhaMkzY4PEIlDEja2zdF
	2Ac16kd57o57IWbx8cbGwQTWucDvd+iZ7hR8zGjoG5bM4IcPe41VHBj8MBPSaaQyCEgL+3+HYTHt6
	yZ2kutGvp0jz1fnibgX9jlGhEKd9PNFkBHuLZlWdAj9e2KPyKxwyLf9w+xnkoxr7XGCxuxOPPn2/q
	vNVBM/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyuk-0000000CwgS-36H3;
	Tue, 26 Aug 2025 19:01:02 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqys1-0000000CvqW-1Hds
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 18:58:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32505dbe21cso4204648a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 11:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756234692; x=1756839492; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsY3QiK0IbnEstf82hU96UYsRAXIuVACCLqPo2mVzDA=;
        b=HDNCyAxXp2inzOlbjyWh7dRxhmLYZNX3wzriNoCJz3L99okG1sMnULEpWd2fsI5qrP
         B8MXYVrYPO+sRJ3r6Wxm+iM6pejz1Q9nOjaaJDIcEUMEQEHrwX8i3sWrQhT09ALyl9kZ
         gGbE24NdmC2K19O4mNZEVsvsWLFOSS2CwDIJqJMYiXcnkGABfr1Sl3qWd4qrec44D80w
         kf4LuW1bKHJA9AN4scUuwBJ+9qugouBuc67xPT14Rsh8AzFe6dZXWnz0EEmTybM0stps
         oSqT+jXQ9zSf8DOOwCBMSh7qhkHCr8mg2PVqu75dhzuJtCBV0tXCkaKHIqiyRDTPUyfY
         ZF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234692; x=1756839492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsY3QiK0IbnEstf82hU96UYsRAXIuVACCLqPo2mVzDA=;
        b=Kwaz1vyQYRb0FR717O9OOCn7Wel5hMwiWiE5xaCWRdv3dKhTEUAhD0xfi+AG2rmmYK
         VG3MxB8xBiAoo9oQS5TAvHq+2Hu9EAN6ze6UGJYfin6InBlXLY7Myg9gcswN0e/uIAZT
         E+ytr3pkVqGOU6Wym9wBOW8jb04LiZqT+B/zJ1tjy++xh1WsA+kRbaGvfAORGnuJQUVY
         6qM9k5tNHgAL5U5qSPLvF3HCeCsV+A/w8TFrR4+b3/b+AzSIdCr8FZ68UpACm+DKbVuN
         qw8JDU/S8OqpthzMvqDod9wkDm8zD7zMEOwdHIGxSPCh7V4hmnUuhk0xDCSKYRCjVn28
         aKHA==
X-Forwarded-Encrypted: i=1; AJvYcCV8XG4lNcOdMwbY9iHRgIXZZUlMEZvlTtwm5HkvJUQEG4ndOw8TtcTElWT1N/n3zZ4nO/fir2KQQbbgPe0mSm1I@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/HPEdeyl9HW903YX/gzYJGqREqhdKqIWFYwisLBVaHC8GI5df
	1qFcpeWBGuIAK+A1wj3yq8Z+Ss/nZVcCWQj2KcIJvfsGCrqsPokQhn+yKuMydK4E4lES33YdLsV
	PuTiDrw==
X-Google-Smtp-Source: AGHT+IEbYMyz1OK/7DxpodLpUWaOFW3JDTS/P5ttB89uVykFsbXSvA935+WSo4TPCjtqlt5OUT9tb2npKgM=
X-Received: from pjbst5.prod.google.com ([2002:a17:90b:1fc5:b0:325:b894:3c5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d06:b0:321:87fa:e1f1
 with SMTP id 98e67ed59e1d1-32515ea158cmr20429199a91.22.1756234691802; Tue, 26
 Aug 2025 11:58:11 -0700 (PDT)
Date: Tue, 26 Aug 2025 11:58:10 -0700
In-Reply-To: <aKeeRynpwFTSONfm@linux.dev>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com> <20250821210042.3451147-6-seanjc@google.com>
 <aKeeRynpwFTSONfm@linux.dev>
Message-ID: <aK4DwtuQtzYvRei-@google.com>
Subject: Re: [RFC PATCH 05/16] KVM: arm64: Introduce "struct kvm_page_fault"
 for tracking abort state
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_115813_346019_B7DF3578 
X-CRM114-Status: GOOD (  26.39  )
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

On Thu, Aug 21, 2025, Oliver Upton wrote:
> Hey Sean,
> 
> On Thu, Aug 21, 2025 at 02:00:31PM -0700, Sean Christopherson wrote:
> > Add and use a kvm_page_fault structure to track state when handling a
> > guest abort.  Collecting everything in a single structure will enable a
> > variety of cleanups (reduce the number of params passed to helpers), and
> > will pave the way toward using "struct kvm_page_fault" in arch-neutral KVM
> > code, e.g. to consolidate logic for KVM_EXIT_MEMORY_FAULT.
> > 
> > No functional change intended.
> > 
> > Cc: James Houghton <jthoughton@google.com>
> > Link: https://lore.kernel.org/all/20250618042424.330664-1-jthoughton@google.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h |  18 ++++
> >  arch/arm64/kvm/mmu.c              | 143 ++++++++++++++----------------
> >  2 files changed, 87 insertions(+), 74 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 2f2394cce24e..4623cbc1edf4 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -413,6 +413,24 @@ struct kvm_vcpu_fault_info {
> >  	u64 disr_el1;		/* Deferred [SError] Status Register */
> >  };
> >  
> > +struct kvm_page_fault {
> > +	const u64 esr;
> > +	const bool exec;
> > +	const bool write;
> > +	const bool is_perm;
> 
> Hmm... these might be better represented as predicates that take a
> pointer to this struct and we just compute it based on ESR. That'd have
> the benefit in the arch-neutral code where 'struct kvm_page_fault' is an
> opaque type and we don't need to align field names/types.

We'd need to align function names/types though, so to some extent it's six of one,
half dozen of the other.  My slight preference would be to require kvm_page_fault
to have certain fields, but I'm ok with making kvm_page_fault opaque to generic
code and instead adding arch APIs.  Having a handful of wrappers in x86 isn't the
end of the world, and it would be more familiar for pretty much everyone.

> > +	phys_addr_t fault_ipa; /* The address we faulted on */
> > +	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
> 
> NYC, but this also seems like a good opportunity to rename + retype
> these guys. Specifically:
> 
> 	fault_ipa => ipa
> 	ipa => canonical_ipa
> 
> would clarify these and align with the verbiage we currently use to talk
> about nested.

Heh, I'm so screwed.  x86's use of "canonical" is wildly different.  I can add
a patch to do those renames (I think doing an "opportunistic" rename would be a
bit much).

