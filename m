Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB72BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKELw1rTYkv1B6yffpxYDIyQglfQZjpB1wV9KreHqF0=; b=jIfZAQZDgU9CCQc+m63niIlK2m
	Oz6N0BAqDKWDtvRaQiaPDPu7LyL2JY91+Qb4vpESl3zhpVEC2zWOXCElNTTl0HT6dt0DXGpbDEMky
	6O4mr+Tt5thUcWr1CoKeojmvydiU1IPR2PzvQvnpYY+8T1qVdNdfKDKiwc8KjwXCy6CuAlNj+/50/
	jQ/Csg0HbbHHlC18Q2XBdBhmk4OFMrSFEJIrMrt/MGrNwQD5GGSlysv3GLqnAlY1zBk2DWq/YKUWY
	rN+Kf8+UE//N/FSn5EGDz3g5JHIPo/xf9X6TQveVF1zvs+zBsN3RcONrFscKnW6aCzJVHpHTqNQ3/
	8subgcWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnl5-0000000D41D-1x9G;
	Fri, 18 Jul 2025 16:16:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmy8-0000000Cvzq-45d7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451d3f72391so21639345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752852351; x=1753457151; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKELw1rTYkv1B6yffpxYDIyQglfQZjpB1wV9KreHqF0=;
        b=jOW5tfuBqNDF4YZ2iSQQuwYiT+mgZDTL4Dow2PKuA9n7aB1pRy3/++GJX5ET7SYlhX
         wu0ophUh8nCiZWr3Q+6LS2WQ31elQIhz0Ni8vQx7z79nyXDugjJeaj4qf8JQaTmAcbh8
         qalxxDALAtG9EnwfOfw2AVNN2bcDijXA+UknZeiStd0BE2rlTQ2V5YvvjZVy9rIpMQ5c
         voay3s2YP7ljmtAmOpc0UD0EbLR7kgbQW11Q7nTuEf60fIDeEOjtzPLtfV5UsITsc76M
         n8yMdriUoDHFdtRVmBH6ULGxQZhweEJoKQNZ/p2i1sfEHuRYH+vQ/zAc9YuSOtpY+2r5
         ILXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852351; x=1753457151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKELw1rTYkv1B6yffpxYDIyQglfQZjpB1wV9KreHqF0=;
        b=xMqG4x3fdkFuF58eb4vlsD8PR1xuRzptLpwFBNB8s6/r54wMUYegDe2vvTipf44wE7
         JX+1CmU6zPvj5qsO5SmbSlEktgvJkFZwSeXZLjspdEwNnRxz5Y/Ms8svAk6MI8iFit43
         ZSxHaeIL0eAfdOE4Pk3lbI5H55fO+ZO0t1jnfLM+o35qtL0lIN/ImS1wnJ/CTAowLBWZ
         5mcgXP+S9Xv8vN8Sl+yAHnEfK/svSYljqURWocOULsZjA+aD4fxwBAjfy/T8/8SYsXbN
         cMRpqyrERG2h66qzEuvKYHClbOEE6EMqBDus1RHr4VRBgBuMxIkhjknJICRQGeEcCDCN
         WIiw==
X-Gm-Message-State: AOJu0YyCn7RVnU3Ref1w+aVj669VnVIi+e/IBxMmm9ZTLwBRYla+7wj6
	K7VYVlmrAkDO+4LVhnivKEmVyA3cfYbWIGV2qrWBSUezYrk2R4nm/5klXHBZnKekAQ==
X-Gm-Gg: ASbGncsJJqw9a3QfXJfbVIyRJyv3uZVT6y6mfVYpbbzM0jJcZkOGG1t5gKTJxCd3IT0
	wPWVyyD4Ls5fYYpnoOqaT4BkpYMoYu6QDAcN+jfpEKJLhpMocwxZIfG65Dk5HL+niVBSMIX2Z9s
	lSSjysB5ebJvfeFFcLMNXzTgydGYSjMDFA5/EDndHfjhgqeOKiXzBlUKZ7ocAPto4FY0oEcoTeJ
	ZkGMI6a89fZjANcQ42XwFMOzsX8zsrWl7hnJm6aiSFogQ/uxPCTgQl5qjV1sObxGZDoNj/2swjh
	C+9TmW1NFgTCCxVZ8F+6ztvetx5FPZ9VwxvsbmCKzR+JfmAdhGe25mRa5G/Xrkvs0Kgy2qNSUvB
	mg/5fV+hMuP53MGzretuFh5mmeVCP14trt4jpW4aW/WCdzs9B7vNbQcdQqas=
X-Google-Smtp-Source: AGHT+IFEsX6w3p5b6OeCBzStdZQoPsSCNKy051XczTJ053zdaGJ5GR0dhN6hyLaShk4ohHEKc14IQw==
X-Received: by 2002:a05:600c:450f:b0:453:5fde:fb5b with SMTP id 5b1f17b1804b1-4562e39ba98mr114063145e9.19.1752852351230;
        Fri, 18 Jul 2025 08:25:51 -0700 (PDT)
Received: from google.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b76148asm23877905e9.35.2025.07.18.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:50 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:25:46 +0000
From: Keir Fraser <keirf@google.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <aHpnev3hf1bEllsy@google.com>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
 <aHpf9vuRK691J7HD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpf9vuRK691J7HD@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082553_033590_B2E365B6 
X-CRM114-Status: GOOD (  26.48  )
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

On Fri, Jul 18, 2025 at 02:53:42PM +0000, Keir Fraser wrote:
> On Thu, Jul 17, 2025 at 01:44:48PM +0800, Yao Yuan wrote:
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
> > 
> > Tree SRCU on SMP:
> > call_srcu()
> >  __call_srcu()
> >   srcu_gp_start_if_needed()
> >     __srcu_read_unlock_nmisafe()
> > 	 #ifdef	CONFIG_NEED_SRCU_NMI_SAFE
> > 	   	  smp_mb__before_atomic() // __smp_mb() on ARM64, do nothing on x86.
> > 	 #else
> >           __srcu_read_unlock()
> > 		   smp_mb()
> > 	 #endif
> 
> I don't think it's nice to depend on an implementation detail of
> kvm_io_bus_register_dev() and, transitively, on implementation details
> of call_srcu().

Also I should note that this is moot because the smp_mb() would *not*
safely replace the load-acquire.

> kvm_vgic_map_resources() isn't called that often and can afford its
> own synchronization.
> 
>  -- Keir
> 
> > TINY SRCY on UP:
> > Should have no memory ordering issue on UP.
> > 
> > >  	goto out_slots;
> > >  out:
> > >  	mutex_unlock(&kvm->arch.config_lock);
> > > --
> > > 2.50.0.727.gbf7dc18ff4-goog
> > >

