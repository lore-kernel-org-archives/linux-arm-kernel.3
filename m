Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F6DC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKg1W6M4USiwNTbJCkdBvx9IOQ14GKTE6DwJxmpiYlk=; b=E2nELApypDU7Z489Sz9HfVlpWN
	NfGd1HJVjuSNxOnFg/VjhPGazIFvdoqKyek9dAfwEtwV0Q88VhYOdZRgYQYLFXaOdwu4jzSB/XSQh
	hZkvhQQG25DwMR1aCR9JK09Z/7Pxjzzl/XbWl0Kp7nOB6PbLC7IpLt40OfzYwOF12qFgjwqnj+V+b
	GwLDo/imKCbIhDs0mWIWtPW7G/O20W2+Tq0fPI2FGNC723M8IYejZZqjlPxeXJitNx2rzaBeud7Wj
	f/8XH+VmoKu3uATN3Pn+hHTsyhISt7ss2TpLVjG1HF+D7ZNsDZBXqurKxyEPG4Xm2amfWJkL1N1dM
	MBZAaIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlJK-0000000GYbW-01db;
	Mon, 21 Jul 2025 07:51:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlGu-0000000GYNG-0kIm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 07:49:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3008717f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753084154; x=1753688954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kKg1W6M4USiwNTbJCkdBvx9IOQ14GKTE6DwJxmpiYlk=;
        b=IvL6AxTdA7Y6KCLm131Lrd20/zRZLf4q4nW8wRZC66l9/1o4LHUSSRl8eUQ6G3AFbo
         qhfxJiiPVupB/UpERpjdqLygFNYtrlAqS7xDKnjA/3AGEj9XIC3WiWl7XXDa52ywRBB3
         T23K8z0BHb5CiXlI03mVI+ozPH9paEj6/muVF7X0rp3FsSt/ySefy0IjWpzbmAbHmqml
         qtRltoY6oLNIlW/oWvMmO1zOdul/rdjB3qEbxI+9NbdVNTEWUZO1TMvD+olaLPvtbzNs
         4YqFMPdwPCvEV8xLEwG9WRt4mhIUhJhRpIqOAfaWQaNbMaDnWteYTXe4M+6ToGaeAd32
         QN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084154; x=1753688954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKg1W6M4USiwNTbJCkdBvx9IOQ14GKTE6DwJxmpiYlk=;
        b=A8WkUUq9a0ZfCwyISgWeuR3IpxUMSbCjSOp2zeLx/Es8gKgs+dMz+Mu6E/8R6L8yCx
         GtIncsLogAIuz+F2BpVZNiCaHGNDzyItWBXaCxBT44EvKsb7O8ex2t/YshfaHWY3SF/M
         VUc5JA1ntYK+72O72eUldnMHdCGhkgR5TPZNUXRGCyrd2s0NS+euq9uaxmIMU8oBsMzC
         8jSNkXxgwQ9Q3xT0KNVcDZYYvqA7CQZH55d3DItpyjHCPE8V5hkdfqNcTlKwSR67Mq7K
         eb4mq6jqiDk+Rsw8sgwI+NqKqVGQbvIkNjR3PsZP97TDou0kC/jyaWkWCF6wwy7Co+Za
         tJkw==
X-Forwarded-Encrypted: i=1; AJvYcCUPYdA4pbzfXP2vdLFTohn8eesl/7KArxZe52/6pU5/0NJSZaEwK/c/Xkp6RSoyR0BqoxZomQ2FfaStuBBgQ1gR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3/30oS71Dcim4fi5W+Owvnlo/nniZKcSh4WcootsBBXC1NjNp
	KRmTz0nFLhTJEoruZVDFBykyl3lS536wcoPrpUwCgSz6Vz6L6LdMH9RwTpLYOZwJsQ==
X-Gm-Gg: ASbGncsDftMSEJMynRE2ttwHxLGd3NDxKa46gqSOZ92Legq2j+wfFpjPvddskUvIdav
	U8vuRZHfvXFxrn++xUyYSuf5zCbCYWo8yXdamWMvxyZXHqH6278YWFRYqaukQb02Y2aWmVO0vrM
	W2KzM7T/rh1+MKP4hjKV1jsDXQMe2i/1WAVk7gnBu7vdpU9kzkvkGGYTrtWw/KJUrOJR7n7GnMD
	chI5CumQQrRfX+tcMdZDFYSwJrDUsGQcFBicoagtcMdNNsh2o1hCWoDfKVii1rcv8B4m0BT7l/A
	t70ZmVduvpPbuhHCDM3gv7j2oYsgFDXPrMHQLfLSmGUfPxTrXziH36YR4h84La3dCDT3gYSyZgK
	9cLuGfJMk5lTr364hxrZhmfXJiQcpWnG+LBIBO5MvSor2WTwtOVGMlf0L5jMWBoW8Avg0yQ==
X-Google-Smtp-Source: AGHT+IHLCPN08G76cpeAjmGFh2SwOYUq7PKTpI10Q0DJaIHMug/5GI7V+ike5MmSquAW5czvaJ/6xw==
X-Received: by 2002:a05:6000:2902:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3b60e518418mr15229224f8f.51.1753084153650;
        Mon, 21 Jul 2025 00:49:13 -0700 (PDT)
Received: from google.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4894asm9640037f8f.49.2025.07.21.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:49:13 -0700 (PDT)
Date: Mon, 21 Jul 2025 07:49:10 +0000
From: Keir Fraser <keirf@google.com>
To: Yao Yuan <yaoyuan0329os@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <aH3w9t78dvxsDjhV@google.com>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
 <aHphgd0fOjHXjPCI@google.com>
 <5zpxxmymnyzncdnewdonnglvmvbtggjyxyqvkf6yars2bbyr4b@gottasrtoq2s>
 <aHtQG_k_1q3862s3@google.com>
 <4i65mgp4rtfox2ttchamijofcmwjtd6sefmuhdkfdrjwaznhoc@2uhcfv2ziegj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4i65mgp4rtfox2ttchamijofcmwjtd6sefmuhdkfdrjwaznhoc@2uhcfv2ziegj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_004916_236962_6A4141DC 
X-CRM114-Status: GOOD (  40.69  )
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

On Sun, Jul 20, 2025 at 08:08:30AM +0800, Yao Yuan wrote:
> On Sat, Jul 19, 2025 at 07:58:19AM +0000, Keir Fraser wrote:
> > On Sat, Jul 19, 2025 at 10:15:56AM +0800, Yao Yuan wrote:
> > > On Fri, Jul 18, 2025 at 08:00:17AM -0700, Sean Christopherson wrote:
> > > > On Thu, Jul 17, 2025, Yao Yuan wrote:
> > > > > On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > > > > > In preparation to remove synchronize_srcu() from MMIO registration,
> > > > > > remove the distributor's dependency on this implicit barrier by
> > > > > > direct acquire-release synchronization on the flag write and its
> > > > > > lock-free check.
> > > > > >
> > > > > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > > > > ---
> > > > > >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> > > > > >  1 file changed, 2 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > > > > > index 502b65049703..bc83672e461b 100644
> > > > > > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > > > > > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > > > > > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > > > >  	gpa_t dist_base;
> > > > > >  	int ret = 0;
> > > > > >
> > > > > > -	if (likely(dist->ready))
> > > > > > +	if (likely(smp_load_acquire(&dist->ready)))
> > > > > >  		return 0;
> > > > > >
> > > > > >  	mutex_lock(&kvm->slots_lock);
> > > > > > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > > > >  		goto out_slots;
> > > > > >  	}
> > > > > >
> > > > > > -	/*
> > > > > > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > > > > > -	 * registration before returning through synchronize_srcu(), which also
> > > > > > -	 * implies a full memory barrier. As such, marking the distributor as
> > > > > > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > > > > > -	 * a completely configured distributor.
> > > > > > -	 */
> > > > > > -	dist->ready = true;
> > > > > > +	smp_store_release(&dist->ready, true);
> > > > >
> > > > > No need the store-release and load-acquire for replacing
> > > > > synchronize_srcu_expedited() w/ call_srcu() IIUC:
> > > >
> > > > This isn't about using call_srcu(), because it's not actually about kvm->buses.
> > > > This code is concerned with ensuring that all stores to kvm->arch.vgic are ordered
> > > > before the store to set kvm->arch.vgic.ready, so that vCPUs never see "ready==true"
> > > > with a half-baked distributor.
> > > >
> > > > In the current code, kvm_vgic_map_resources() relies on the synchronize_srcu() in
> > > > kvm_io_bus_register_dev() to provide the ordering guarantees.  Switching to
> > > > smp_store_release() + smp_load_acquire() removes the dependency on the
> > > > synchronize_srcu() so that the synchronize_srcu() call can be safely removed.
> > >
> > > Yes, I understand this and agree with your point.
> > >
> > > Just for discusstion: I thought it should also work even w/o
> > > introduce the load acqure + store release after switch to
> > > call_srcu(): The smp_mb() in call_srcu() order the all store
> > > to kvm->arch.vgic before store kvm->arch.vgic.ready in
> > > current implementation.
> >
> > The load-acquire would still be required, to ensure that accesses to
> > kvm->arch.vgic do not get reordered earlier than the lock-free check
> > of kvm->arch.vgic.ready. Otherwise that CPU could see that the vgic is
> > initialised, but then use speculated reads of uninitialised vgic state.
> >
> 
> Thanks for your explanation.
> 
> I see. But there's "mutex_lock(&kvm->slot_lock);" before later
> acccessing to the kvm->arch.vgic, so I think the order can be
> guaranteed. Of cause as you said a explicitly acquire-load +
> store-release is better than before implicitly implementation.

If vgic_dist::ready is observed true by the lock-free read (the one
which is turned into load-acquire by this patch) then the function
immediately returns with no mutex_lock() executed. It is reads of
vgic_dist *after* return from kvm_vgic_map_resources() that you have
to worry about, and which require load-acquire semantics.

> 
> > > >

