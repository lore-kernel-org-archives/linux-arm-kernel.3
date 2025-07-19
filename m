Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD98C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfRByUZViUlkhtvwbgJ9kqHK2zRV37bvsO8dM/mnyeg=; b=c9LXVS3uRe34MZeZEi38eG6VQb
	4EbYirDx3hQGOh6yKyTY+L9B2F448DIZIP3k2I6AAPZhsbVQ5ndDKA+6bqVTT2GfqH8eWvhSFec5L
	WXlCNr7k7GNFHL3iT9bp8q4YBo6vJG/Ffqyx+D6WRHelfZV7ShcrQrCO+Ez8a8ky6+qSR60n7WdGC
	S6X+nzaXqQVZ+gWihWydgNfu3Q0k4aHhpiLVbqJ9iflwuNe1F9t1IuQaO4N6IQLfc5slVpgmEHJSf
	gfq9B7HUznLrM7HFNcVUZ4gj8s2dgQNxN3VGyYhNl0eytrtP3w8/QnSRb4dx6lE3C0m7nWgHy7Dte
	fp8pB7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud2VA-0000000E1AG-19Y3;
	Sat, 19 Jul 2025 08:01:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud2Sf-0000000E0ri-3Ejt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 07:58:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso2572579f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752911904; x=1753516704; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TfRByUZViUlkhtvwbgJ9kqHK2zRV37bvsO8dM/mnyeg=;
        b=oFDTol0Yhud+zISRInvOw6J5dYFqaxlNP+e9wQbhaPnbXWnN7A1eZxe7sMXgsImUaQ
         t05RjCja9pEAeqOwUqB11D6dG/Gj3hfzPcwmom5Obe/s+S0M4Y2CDXix2ZJBGHTSrvUL
         ngvqE0Ja7IgyXeS7pWs7K7b24hlKIrDedu0KtdJFscJMS7by2dp5SY260BYDlRw5XvXj
         /JuPbVsZp1DfEcMlOFELQZitNFVCpyBTF4mCAHYbi2nwmZg9VX3w1mhTG3Wt5rPElYKh
         DLAoIBil3eO3UGmMcs8nEHr1oJlj76xGwKuy4v4hbBaqjH/US6JFijxHUhaUlp11tGbN
         1vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752911904; x=1753516704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfRByUZViUlkhtvwbgJ9kqHK2zRV37bvsO8dM/mnyeg=;
        b=kwYSTe49S/7pcNMYCVobvpB+3LEEv6vFCwuyPyW7vgHVT/wx0wAbqAgAiMjaoY2KoI
         8PTekOnRZp5HHjbOV6silrLd55uhvFz/RCKjATIxgOPY9f6+ndOyO2OVdJmn5qwAcFA4
         OFo1o0+uH/IdXYd1G5kWHYNnjDWR50KyVuWHHTU89BnvSH0hhteNVoz57kLG4ij9e0ue
         fRYUNNff3NwZOCRpvPH1CRFJt6ZlpJeiEowUWe+U9WzP6oX5XDKLwV905xDfaz8hL6L5
         gDFg+IHFW/ZHrzSvQ00uOXgBcyTVIHfK0xU0lIpkppm7C+u3oPPcHPgQkdLPXhTDfO8M
         hhAw==
X-Forwarded-Encrypted: i=1; AJvYcCVjIqBUmrs9mCSSk818KFKk+my520aJfV4jJWDqULzTFlQ8yF4UctMmcbInuJY4NP8snHiSgEiCwWxTvf+G/3sE@lists.infradead.org
X-Gm-Message-State: AOJu0YxYQ7EPA2zjNoEoYKzdNACGZW+N1gFupvQPkFNVHKnVEetKUrka
	x4Eu6lTCEPdUbIEXaxycPHUQAsTamM9XocEOJPfl3N8JbD/R/KnYsKHD6Vb6odQzbA==
X-Gm-Gg: ASbGnctwt8AouyjyeAOlm5f7sSH4/kcmSJfh3dWDk8VH3FZFgXD/JxScgRXtdknFqIC
	0BdSIUi3xdmtPS3Veo9d/y8tfai0kqLR9uPUONFGn2Rw4jDu6Pp66VDdZJbDWa7Zg4cDHwBwA5I
	Li3pXz3BlnH4NZsl4lCi3Hv6voitSvX4suortKqbTgJnhy6cdxWW2xpSn8q17q9Lx0fyqAgp7K0
	64FrzH5ku+lU3T3W8/RrCTXfKWdfkXyntzDh0Lq6rh6p1hSWuu3ALMDS/fvntNtE+OL2Chs8HPf
	prXDcGkiPAgF9u8ElDKtFJo3yzUoImnQeYjxdKWZlMD1rJBEv4ciULCr1QxUWZlk6tnTtIU2q+G
	zEMGFCCUCw/hWds0T7F625hQz1apFBLqkBBsc5N7purouVJYQX3cWLC3K2MyD6Io/uADSJw==
X-Google-Smtp-Source: AGHT+IH9Zj8Sie+1djBoT8jRSDy8Q+NDwYSbOAjVh0kWnwssstjjIHWaSUiNz3Ecv1vUll7ozzg2eA==
X-Received: by 2002:a05:6000:42c6:b0:3a3:7115:5e7a with SMTP id ffacd0b85a97d-3b60dd7b0dbmr8359452f8f.42.1752911903972;
        Sat, 19 Jul 2025 00:58:23 -0700 (PDT)
Received: from google.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2b803sm3923821f8f.19.2025.07.19.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 00:58:23 -0700 (PDT)
Date: Sat, 19 Jul 2025 07:58:19 +0000
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
Message-ID: <aHtQG_k_1q3862s3@google.com>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
 <aHphgd0fOjHXjPCI@google.com>
 <5zpxxmymnyzncdnewdonnglvmvbtggjyxyqvkf6yars2bbyr4b@gottasrtoq2s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zpxxmymnyzncdnewdonnglvmvbtggjyxyqvkf6yars2bbyr4b@gottasrtoq2s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_005825_832179_205E244A 
X-CRM114-Status: GOOD (  32.82  )
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

On Sat, Jul 19, 2025 at 10:15:56AM +0800, Yao Yuan wrote:
> On Fri, Jul 18, 2025 at 08:00:17AM -0700, Sean Christopherson wrote:
> > On Thu, Jul 17, 2025, Yao Yuan wrote:
> > > On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > > > In preparation to remove synchronize_srcu() from MMIO registration,
> > > > remove the distributor's dependency on this implicit barrier by
> > > > direct acquire-release synchronization on the flag write and its
> > > > lock-free check.
> > > >
> > > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > > ---
> > > >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> > > >  1 file changed, 2 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > > > index 502b65049703..bc83672e461b 100644
> > > > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > > > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > > > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > >  	gpa_t dist_base;
> > > >  	int ret = 0;
> > > >
> > > > -	if (likely(dist->ready))
> > > > +	if (likely(smp_load_acquire(&dist->ready)))
> > > >  		return 0;
> > > >
> > > >  	mutex_lock(&kvm->slots_lock);
> > > > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > >  		goto out_slots;
> > > >  	}
> > > >
> > > > -	/*
> > > > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > > > -	 * registration before returning through synchronize_srcu(), which also
> > > > -	 * implies a full memory barrier. As such, marking the distributor as
> > > > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > > > -	 * a completely configured distributor.
> > > > -	 */
> > > > -	dist->ready = true;
> > > > +	smp_store_release(&dist->ready, true);
> > >
> > > No need the store-release and load-acquire for replacing
> > > synchronize_srcu_expedited() w/ call_srcu() IIUC:
> >
> > This isn't about using call_srcu(), because it's not actually about kvm->buses.
> > This code is concerned with ensuring that all stores to kvm->arch.vgic are ordered
> > before the store to set kvm->arch.vgic.ready, so that vCPUs never see "ready==true"
> > with a half-baked distributor.
> >
> > In the current code, kvm_vgic_map_resources() relies on the synchronize_srcu() in
> > kvm_io_bus_register_dev() to provide the ordering guarantees.  Switching to
> > smp_store_release() + smp_load_acquire() removes the dependency on the
> > synchronize_srcu() so that the synchronize_srcu() call can be safely removed.
> 
> Yes, I understand this and agree with your point.
> 
> Just for discusstion: I thought it should also work even w/o
> introduce the load acqure + store release after switch to
> call_srcu(): The smp_mb() in call_srcu() order the all store
> to kvm->arch.vgic before store kvm->arch.vgic.ready in
> current implementation.

The load-acquire would still be required, to ensure that accesses to
kvm->arch.vgic do not get reordered earlier than the lock-free check
of kvm->arch.vgic.ready. Otherwise that CPU could see that the vgic is
initialised, but then use speculated reads of uninitialised vgic state.

> >

