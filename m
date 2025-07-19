Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6A2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 02:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Scnqs5pk340zKN/IMxaD8uFN1w3h3QowSgutbiQPbOA=; b=CVCPt57e2Hty5uKqRI+Yfb5aEY
	uXoFlWFsBa1SZkqPEgY4/4i+OwJi2CSbLTwxvCIdLuIqmOFIwmnK0Aq/r8XixdKtu84yfZw+uAaYb
	iM0801ionU+zNMfvM9r/WHvYFrKQUfQdQ45nGvXcWU8c7jQEnRptSt8zciOcZ0c7cqLdctVu0X3mk
	OxxWMpwbO2psRnviv+nYIFe9/SZWrZ+BrUxsks4hisYdxW+2u425GpJxbc7jUUm8eJlG7Gjw0l8jC
	3FG1jV5RbdUOFa+96z5CeSLhrzqkjXSajKYrGyXN30YBd+k7FYWlvPUI4MD65x1wvrRUT9tOoZpZH
	/8h8R9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxPE-0000000Dkue-11Dl;
	Sat, 19 Jul 2025 02:34:32 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucx9d-0000000DjsM-0DAC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 02:18:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-313f68bc519so1825298a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 19:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752891504; x=1753496304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Scnqs5pk340zKN/IMxaD8uFN1w3h3QowSgutbiQPbOA=;
        b=MeIKoSeYOHxYet1VQheOd9ScfMxNlMMQT3hRTglTDWxG2JILPYNQI+m4y+R6t8IIlp
         3FflbxlNZ/JXVDobt9ELyoroSmmksY31HJzgh4v3msfN9KHF2w1apuslXyzKZvwRmqg2
         Q8Cd97ZLcDqlK+sRZteHRrXchGLwmrBsqT58eqi/Vp2krmjzYZKcb1D6QioEVGU3BzNf
         nwnUAQAFo0DkgDeAWvrfv0yht8uxnd1sSLa8FHzwWJ+MCWRFVOJygUVSEbZ0b2op3TtX
         d15ZG+IZ04IxamE3eHK+teN9II+OHrS1EHcj1RjSV68lchlvQpgCJjqv+BjzYvlQ9ISc
         qx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752891504; x=1753496304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Scnqs5pk340zKN/IMxaD8uFN1w3h3QowSgutbiQPbOA=;
        b=vCZlFBhc7CGCvQVzlGEtqfuf/7OwV4rBu3wDTuFpFUyfXkaQd8LBuptBExa7/YFM3L
         CqF9AOfIZ0P3nEzuz7qED8JlV+zWprRMM73QKrs8tp+BPH45RqpYp5oOYduuX0qiFCrj
         nhIOaZhAYUz5khA0958OTjhXQUSzBFlaAdUwzQRBsIJSrCa9qGFqVJ5flX9r4Jnp0MoQ
         RaGo3gTnpm0q0Kv2uRcL+yOeD+h611x9a4Dl47dM4R8bnnv3eVRTv4JHUzkLBWDLtk50
         R+geAMbZn8B2Rw1IS0h+h8SYN95iUfdUiFi0JNgXiOm0W0e9vxG1wICIfjXuW8tncCU3
         UtDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVZ0tDALgabagAjYhwX1WhQSNFiG15x3wuU1JhFFrsIG+axaiQ3aZ9Oz8FYo4zh+yBz/QaXJa+KNhpM1T55uBf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcr8ZiuomyzBJxI8T/39Of+dc2Rsc83OXdnpThoGlN/1RLVann
	ITAJztJbWCzfJHr562SLzBIuWlqlzHGECUpHJ2ad96ezsrJSw9xCFPnU
X-Gm-Gg: ASbGnctAYBwYXiqGV2Uz6EEDIQp7o2Mg5nkTaic0im8RbxYvTgATjAa9PXdRoWg7eLh
	/y2YApo8Kr9pIpgOPiQW24oMaaaiwmJMWVV33HVizTfC/AOqlhmsaRV3a5JqCGghuPQF/EHMZ8m
	B23zijHk56MCrP+I8A/7Icx6/yIVNqZHR5EQQ9vY2l2o3bgzVZaelJmAz8aQoVS5vX6/vFzhK/a
	wu8jhsAO2p/F2DpJjnRnmia9aKbtW39a6tQErAbklfg2PsK1EOLcVYk9CpFybJMGDTiYO0MbkAG
	hR04M//kmEqgE/i90cNOi8q6d7m4xpt6MM04Y8Mm6IzweMrf5a9g9AjuQJKBD3DzLxVBUsb3wJR
	m41gFUTbve16QPLxq5AYi9FA54Q==
X-Google-Smtp-Source: AGHT+IHXIiFPtH//gJNmM/1/06X218/c+AnTD0afEkaxcRjYT0TB+ufmUNpan+0zr5nVWSbonniezQ==
X-Received: by 2002:a17:90a:d60c:b0:312:ffdc:42b2 with SMTP id 98e67ed59e1d1-31c9f4b409bmr17155214a91.23.1752891503580;
        Fri, 18 Jul 2025 19:18:23 -0700 (PDT)
Received: from localhost ([2409:891f:6a27:93c:d451:d825:eb30:1bcc])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c9f1ba530sm5900828a91.4.2025.07.18.19.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 19:18:22 -0700 (PDT)
Date: Sat, 19 Jul 2025 10:15:56 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, Keir Fraser <keirf@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <5zpxxmymnyzncdnewdonnglvmvbtggjyxyqvkf6yars2bbyr4b@gottasrtoq2s>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
 <aHphgd0fOjHXjPCI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHphgd0fOjHXjPCI@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_191825_092527_59DD2BFF 
X-CRM114-Status: GOOD (  27.28  )
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

On Fri, Jul 18, 2025 at 08:00:17AM -0700, Sean Christopherson wrote:
> On Thu, Jul 17, 2025, Yao Yuan wrote:
> > On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > > In preparation to remove synchronize_srcu() from MMIO registration,
> > > remove the distributor's dependency on this implicit barrier by
> > > direct acquire-release synchronization on the flag write and its
> > > lock-free check.
> > >
> > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > ---
> > >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> > >  1 file changed, 2 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > > index 502b65049703..bc83672e461b 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > >  	gpa_t dist_base;
> > >  	int ret = 0;
> > >
> > > -	if (likely(dist->ready))
> > > +	if (likely(smp_load_acquire(&dist->ready)))
> > >  		return 0;
> > >
> > >  	mutex_lock(&kvm->slots_lock);
> > > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > >  		goto out_slots;
> > >  	}
> > >
> > > -	/*
> > > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > > -	 * registration before returning through synchronize_srcu(), which also
> > > -	 * implies a full memory barrier. As such, marking the distributor as
> > > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > > -	 * a completely configured distributor.
> > > -	 */
> > > -	dist->ready = true;
> > > +	smp_store_release(&dist->ready, true);
> >
> > No need the store-release and load-acquire for replacing
> > synchronize_srcu_expedited() w/ call_srcu() IIUC:
>
> This isn't about using call_srcu(), because it's not actually about kvm->buses.
> This code is concerned with ensuring that all stores to kvm->arch.vgic are ordered
> before the store to set kvm->arch.vgic.ready, so that vCPUs never see "ready==true"
> with a half-baked distributor.
>
> In the current code, kvm_vgic_map_resources() relies on the synchronize_srcu() in
> kvm_io_bus_register_dev() to provide the ordering guarantees.  Switching to
> smp_store_release() + smp_load_acquire() removes the dependency on the
> synchronize_srcu() so that the synchronize_srcu() call can be safely removed.

Yes, I understand this and agree with your point.

Just for discusstion: I thought it should also work even w/o
introduce the load acqure + store release after switch to
call_srcu(): The smp_mb() in call_srcu() order the all store
to kvm->arch.vgic before store kvm->arch.vgic.ready in
current implementation.

>

