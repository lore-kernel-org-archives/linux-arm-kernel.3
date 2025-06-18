Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88EFC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF8FChrkDuPz1pKDYbAfDf2mWO3Vl3/6TjWiBlEasWs=; b=paBp7gZrURw2Ra4nK98KSbvKty
	OVYXsqKEToklT7i9TfDxuP8YL+to11Sd8xpyYsU9fj0b6lgqIdwvQ1FcXBSBh6z+Qtf0dXQIfoxfy
	gLYRFMFDcRLs28V16UB3zhyXxLIVGYybqzUwaH7dOSgXHoVXxlJJAxn7q1MevYzrnSxobksKEYdsI
	9e5TaZWzeGSGFLfJ+GobzHbwfigexVdltIBKbaJfbY3+PKYV28AIRzN7O9YB0RBlgEuK1Jo7oIFz3
	yEl+ja2Cxp9wbGBXMbRjknPH+zDN5BitTqoOpYXohDSZP/Pa+xs1/eQMfa7u4icf7PAxVR7xfWmki
	xi56CHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzuw-0000000BOL1-2SMY;
	Wed, 18 Jun 2025 21:01:58 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzsj-0000000BO6w-0KhI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:59:42 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-747cebffd4eso41832b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280380; x=1750885180; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aF8FChrkDuPz1pKDYbAfDf2mWO3Vl3/6TjWiBlEasWs=;
        b=YlbDb7jTKgRslMv97RQMh78/JqL+6RtZ/NGpwP5MB0sIIEJlbBfTpZT7Da0hJBCtac
         sFcFZmqzntqIK9Dc0VZsXwcEB4P0zl8XJQ9Cp7YCLCZlcwKXcQ/YAR7uu7QxhU6RVLxe
         KZuv28IjKKW70FzFuSacgRy9SN99wqcyJ6dVD0WSBxD5h7ayroELTVD+Pl6j8wVIC7/P
         JrJqUSf4xqgCEnkWzVnbV1/00xgtx5GCLb57juCqoKIHkg6voniW9CTXFiEi/0qWTDdW
         8BZLvn6qDr+CVhy0s9wGYKSM4HlOz+fwyLl4gvbllpnX9ueBa+Q620ov3Nx0N76DwGAc
         lEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280380; x=1750885180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aF8FChrkDuPz1pKDYbAfDf2mWO3Vl3/6TjWiBlEasWs=;
        b=cpV1CWCo1Ja+uOX/y2m3EshofL0vCufTTeVeKdLmvzhxQDTFpPleozY+EWzuMvJwcc
         Q/mQZ1E5kHpzmCfNGDP+D9E1gFnPuYNJvFv2Lf6LNttVhFQz154YGWFsIfetnurFG9O5
         68W+GCyOMCe0mB23ykoTSysyhLTrRzlWQd+ybHnE2S25f0rRNdQex2ZcgPVwGeP19+kr
         5d+iXc5ls34s9+wMq1nZSNjYTO2ClMcLB6Sb/67l7u6UMhhIA+g0AP2VCbwfR+IDYm9v
         yrbFC0G/JQBtz90cnVxFltWUDRpiDnEbp5CZt9SAXT7xRNsrUysmed0G3dD1yuFwiU7Z
         p18g==
X-Forwarded-Encrypted: i=1; AJvYcCWeu+FOK+9GrhKdYYRpfWehOxlUsNOcbRb/jdlsDHP3cDvqSWpj+eMHPHNcqbI96QakHwgENDIZmOeOa9Y4txJg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzody34vvKP3QNglwD3SrcwLipVhAb7i5v6/I9cS9mK9SldOx/f
	am1h4nP07m0qQRUmyPoUa1G4UG153g9xAOK9CD+rKCUoNrH52R++ufwu/LT4RCDOq54alQle2Ti
	gkkdRTg==
X-Google-Smtp-Source: AGHT+IF2uJOMlygI0ECXMxjUKFr94MDL8dRFNErS7/emaEcq+7yIxFlJ3NplEPfGVdrHzu/gZljNYVWfvEE=
X-Received: from pfoa20.prod.google.com ([2002:aa7:8654:0:b0:748:2476:b25f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4646:b0:748:3822:e8e0
 with SMTP id d2e1a72fcca58-7489cfd5dbemr25408374b3a.13.1750280379840; Wed, 18
 Jun 2025 13:59:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:59:38 -0700
In-Reply-To: <7timm7vdq4vjwn6jo5bwgtbn3f7pdtdch7l5dws76pjg7syqwb@al5mifdmboog>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-14-seanjc@google.com>
 <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
 <aFGTYoxlLhZsiMUC@google.com> <7timm7vdq4vjwn6jo5bwgtbn3f7pdtdch7l5dws76pjg7syqwb@al5mifdmboog>
Message-ID: <aFMoumQ8ILTLr7PZ@google.com>
Subject: Re: [PATCH v3 12/62] KVM: SVM: Inhibit AVIC if ID is too big instead
 of rejecting vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen.rao@amd.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_135941_116829_BF74C9E9 
X-CRM114-Status: GOOD (  21.43  )
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

On Wed, Jun 18, 2025, Naveen N Rao wrote:
> On Tue, Jun 17, 2025 at 09:10:10AM -0700, Sean Christopherson wrote:
> > Hmm, yes and no.  I completely agree that clearing apicv_active in avic.c
> > is all kinds of gross, but clearing apic->apicv_active in lapic.c to handle
> > this particular scenario is just as problematic, because then
> > avic_init_backing_page() would need to check kvm_vcpu_apicv_active() to
> > determine whether or not to allocate the backing page.  In a way, that's
> > even worse, because setting apic->apicv_active by default is purely an
> > optimization, i.e. leaving it %false _should_ work as well, it would just
> > be suboptimal.  But if AVIC were to key off apic->apicv_active, that could
> > lead to KVM incorrectly skipping allocation of the AVIC backing page.
> 
> I understand your concern about key'ing off apic->apicv_active - that 
> would definitely require a thorough audit and does add complexity to 
> this.
> 
> However, as far as I can see, after your current series, we no longer 
> maintain a pointer to the AVIC backing page, but instead rely on the 
> lapic-allocated page.
> 
> Were you referring to the APIC access page though? 

Gah, yes.  I was hyper aware of the two things when typing up the response, and
still managed to screw up.  *sigh* :-)

> That is behind kvm_apicv_activated() today, which looks to be problematic if
> there are inhibits set during vcpu_create() and if those can be unset later?
> Shouldn't we be allocating the apic access page unconditionally here?

In theory, yes.  In practice, this guards against an unnecessary allocation for
SEV+ guests (see APICV_INHIBIT_REASON_SEV).

That said, I completely agree that checking kvm_apicv_activated() is weird and
sketchy.  Hopefully that can be cleaned up, too (but after this series).

