Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB1FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NffzjCDpuTmdNSnLuEbvoNsdUgp9uFncpWixfvcrqX0=; b=ZzDYiKc2f7KhxyN+SREEfkNVwb
	INlU5eMRJoFEwxSwNYtzGSSZvDfwVXf4V+AV7YZS+KbT+9ZA6e4oq0o71+UxDu4t5atPMMz8DUYEn
	mTJe282Qs4UUiQ0WCgZQ2LOcC9qRmsotmmQpuybP3YOzyeXO7SdNxBE+R5bbno3Chv+YmgLFgCurT
	lkXI5bvoS16zLIc3zGyCVYQR4O/tvDSp3sVhRltM1zJmhwdd3CijN1l9kYnx2F6OpPOJY4sDwOvhe
	iNGzHCz2pVDOepXjRbh3LKVSCY317KCSKRetAqpOry0L8IJ9Bc3PpXpa21rx3SVhljPfwW2JpqF1R
	fr+QpZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0e-00000000Kzi-0IvK;
	Tue, 25 Feb 2025 16:42:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwBB-0000000HZSM-3dtR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:45:03 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2f816a85facso11764846a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740494700; x=1741099500; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NffzjCDpuTmdNSnLuEbvoNsdUgp9uFncpWixfvcrqX0=;
        b=mGclNGHSe414+aYtBhhtyG8IxFgnATbtV3N1JAp9Eo2lLq+kiRKVpPhqopkfIsKnKF
         bKuC1cPwh1su3SICmMUFav5IvFRlHsSXkdGfv1u22Sv1qnSu9yRiBBUCWfHlXlhf9Ety
         QBrJucrUCZMoy+FdZLdAKoZtVb0wNM2eVtohxrXG/mYIWiEXWfW8t53hYqx5Ds9cYf2t
         uJ4B5EX4Lx+pCqkf8HPFP7OntEZvn8VuiGg0tH2HCaGdccNqYx44Am1Q9zU1CvHIEPGY
         qjdXfma/F9uCHDzO007OEDnIyVI7ZlkoPzAT6ITp8RK0QtRQE8tj98vSapnOqgSMH1bQ
         wB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494700; x=1741099500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NffzjCDpuTmdNSnLuEbvoNsdUgp9uFncpWixfvcrqX0=;
        b=EQHWrbN7KVHQyoL7X1B5dkYhl1nO7a+pGPgG+hzsxn1o38HKC2X1WRVzuvzxlDgwA6
         rRYbaUGqcVXNJHprjAZuvDzUH5DK1UljQEwIj3pGs8+An4+iDQqaaHYp2XJHO6Fc1jNP
         cXClPKavOqazie108LNIISj4goqFW0dc2QtRK05rZ9rFGCVL6wwWIynu/5j+h38uuzqK
         fOob/s8XwP3BuJtCOE5+UP5n081ciK8dqVzMdwqeYtz+s/+NCXzTmg6tJI/iaf4w+dGi
         ikTZeIn7weWKFDPbCLE2QMPKUzZcX0BaAuQSfgGCUkd7ZVYN508tgpPNkMoZ0p84Lj37
         jsGA==
X-Forwarded-Encrypted: i=1; AJvYcCU08Hp6iVXBRkLJ7eb+ui5eYW9xdounfTXUzj5BCPY4UhZ7cNjEr17FmRhGJU8uXs7ngaSkDoWBPU/hNQGONW8d@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Z0CnI1oJCyxqrB5/C13bs4cYPIDqH9HCGB5s6LxmQfGDKMkI
	RNxml6qgvzfUYfQOkvxGGiN2ObUBPofR97Y/t31gE9cpxk8a59GxGh7XGcIWzpsHvgxQqRwnv7q
	WFA==
X-Google-Smtp-Source: AGHT+IG2KruXetDYoI9qbCSWmcITW+yhg6mxBcrrqoCenX7IkOOc3aJKkHxPw+LBj1f6DGaIHr4WklpxusU=
X-Received: from pjh14.prod.google.com ([2002:a17:90b:3f8e:b0:2ea:29de:af10])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:548f:b0:2ee:d7d3:3008
 with SMTP id 98e67ed59e1d1-2fce86ae5d0mr31991980a91.12.1740494700343; Tue, 25
 Feb 2025 06:45:00 -0800 (PST)
Date: Tue, 25 Feb 2025 06:44:58 -0800
In-Reply-To: <Z71tlzQJISk6PFAL@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-5-seanjc@google.com>
 <Z71tlzQJISk6PFAL@yzhao56-desk.sh.intel.com>
Message-ID: <Z73XaiRZMIi_vyvK@google.com>
Subject: Re: [PATCH 4/7] KVM: x86: Don't load/put vCPU when unloading its MMU
 during teardown
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064501_909324_9519506C 
X-CRM114-Status: GOOD (  19.95  )
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

On Tue, Feb 25, 2025, Yan Zhao wrote:
> On Mon, Feb 24, 2025 at 03:55:39PM -0800, Sean Christopherson wrote:
> > Don't load (and then put) a vCPU when unloading its MMU during VM
> > destruction, as nothing in kvm_mmu_unload() accesses vCPU state beyond the
> > root page/address of each MMU, i.e. can't possible need to run with the
> > vCPU loaded.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/x86.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 045c61cc7e54..9978ed4c0917 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12767,13 +12767,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> >  	return ret;
> >  }
> >  
> > -static void kvm_unload_vcpu_mmu(struct kvm_vcpu *vcpu)
> > -{
> > -	vcpu_load(vcpu);
> > -	kvm_mmu_unload(vcpu);
> > -	vcpu_put(vcpu);
> > -}
> > -
> >  static void kvm_unload_vcpu_mmus(struct kvm *kvm)
> >  {
> >  	unsigned long i;
> > @@ -12781,7 +12774,7 @@ static void kvm_unload_vcpu_mmus(struct kvm *kvm)
> >  
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		kvm_clear_async_pf_completion_queue(vcpu);
> > -		kvm_unload_vcpu_mmu(vcpu);
> > +		kvm_mmu_unload(vcpu);
> What about just dropping kvm_unload_vcpu_mmu() here?
> kvm_mmu_unload() will be invoked again in kvm_mmu_destroy().
> 
> kvm_arch_vcpu_destroy() --> kvm_mmu_destroy() --> kvm_mmu_unload().

Ugh, I missed that there's yet another call to kvm_mmu_unload().  I definitely
agree with dropping the first kvm_mmu_load(), but I'll do it in a follow-up patch
so that all three changes are isolated (not doing the load/put, doing unload as
part of vCPU destruction, doing unload only once at the end).

And looking at both calls to kvm_mmu_unload(), I suspect that grabbing kvm->srcu
around kvm_mmu_destroy() is unnecessary.  I'll try cleaning that up as well.

