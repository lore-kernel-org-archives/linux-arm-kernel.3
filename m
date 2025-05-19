Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B0BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSIIDWdlqzl+xIuuE81sCKCMdcV/4Mu0UdNur2XU8WE=; b=EHuBLBQf6d5CeImCx8TYd+dA1v
	79r7vSp5YQ3BTZJm7aOq9t7MzSxo+7+N4lx5K0248Ngg3QgqqGmcjnGANSWmEMWZ6jXwOYr6nNdZ5
	EzoLNnar6PdMOdxlmgzyq1L0NYsSJuZ7S/YXQqg9JqNTCkLVDXUxr3bVMPbRTH2Q9iAqQsQS53eqB
	mH1tFJOSHsbWCypwt6kjyhAuzhKMS0OY1rEQmCCXy7kF824/fRALIQwFNQJyGPzY5dt3MbeKt8p6u
	WQR6v88wTg5162Rwbflm+3Whx6fpdJCd7fvJfAJYgpQ8zrsEJxyo2jrXeaU6m4RpEIwaOzZif52Wm
	Ope1VuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2g1-00000009f1W-0QYz;
	Mon, 19 May 2025 15:45:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1ku-00000009UZp-0lOW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:46:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-601a5747638so3620151a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747665974; x=1748270774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSIIDWdlqzl+xIuuE81sCKCMdcV/4Mu0UdNur2XU8WE=;
        b=h3Y5p3C6IcEW/LB2uC9ZMh0E+ZJXDhTc7VP3AAbH/v+jBHH7Qvbe4HcAd6Ze7MRpAC
         VUDS1fFs865K70NyAayA7YRjV2hQhuluTaKKg5Xo6ynoeBMPPvA6DxhM2SGhIC8b/3Yk
         oB8l0h2pHY+tvoLw1u62wDE6wnJXMVKah6Jw7lLm8wqvFctXITDes9egbB2JG8vkcQQe
         GHGzCVtdtsxu8vbqylqyum+kKzfConkrf6Pq1N0q5kUkGhCAxctlDsiZ3ryRyYwoue3c
         cqAbxnLcdM9Jsb1o2qpfiaGIbRwQeWjbPw3YLfk0/hMALDWlcn0n7Wcjud1kpDfOYvpP
         Ffpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665974; x=1748270774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSIIDWdlqzl+xIuuE81sCKCMdcV/4Mu0UdNur2XU8WE=;
        b=l+ONYwiB6Py2/OvxZPD6kSYVs7ERxUfBglPEWH9LtlNTpyTc9tof9yOaGk52tEYhyS
         o23JU3gW2CW32lo/Um2Ful9j+cbqrWnxmbQJAApzlGdVm8Wr0OKXHmJDZMh5vvPkEbC2
         dXMZ10nuqvX/e7OdCoUXUwbB1RmlRCVOsIebjuyRHa74Zc2L050kBo9cGlbcEUQkiisE
         9s8OwEqE/a5u2ak4rm7kJSJcWi/u9YJ+eQBhXluhueAF2nto8F1nH2Z6Gx/isJLuW9Bn
         5UUrN02lAxkjQ0F3zePwPo4cPQ0J+7aw/0C3DlwlbAWK16rqkzdYiK5/afSOz4Hq9b1+
         93fw==
X-Forwarded-Encrypted: i=1; AJvYcCWitTJHu8pnRAWOcFXufw0F+TpiI6LV+FIEQ43HpJ54I2NqboVvFKlfvzY2DLmThxQpz9iwQk+oKeJP0WxoudKG@lists.infradead.org
X-Gm-Message-State: AOJu0YwngiXLuWmZky8pEotTXv0WuiSKogfwUbCuD9+5uMyB/ILPamBA
	Odo1gsOCwJ+EN47IZXOOcnEP72+4CtJ9mf2CmukycfE49+NpvOsQqBEOW3d9EZtTLg==
X-Gm-Gg: ASbGncugSVZYkwWHZ0iPOyMBwZOiwYYl/htbv9B+kF+YAQZwucldwXU6zdWxfD2UhOx
	sTDQ+R/1IPsYUllNK/yZViKH70QVsvkcGhqJsacD9dzgN2iaznZmClLR7nUBHdDKk/84MycHRFN
	K2bAbU2a5GVDLB57Q0MoGQynqrZd0Yd6u12EHc8nmbXUBEahFYbnfepOdg/2F9/z6EJNPMGTw0c
	K0QhmwYQXO3F6KxLWi7Xka7Oh+COZiGz2hq7vQ7twWqnoY/r3yDRweRFD+niac7W4flykqIx7f7
	cuR3b4wZIylAb7s3gwrgpEj17uYjHwwuTX4Gd24Fl01qfeEgG47mOUDMhb1+5//2clFXd6PEDB+
	HHk6ulSvtbg==
X-Google-Smtp-Source: AGHT+IEC3KHkrShBXny3Q7Ir1m0+6kZ8RmzKZn0Y25hUeD6jm+0Maqs5MW8iW3AbNc6hR400bbV0fQ==
X-Received: by 2002:a05:6402:4415:b0:5fb:1c08:d8f7 with SMTP id 4fb4d7f45d1cf-6008a5a8caemr11231023a12.12.1747665974299;
        Mon, 19 May 2025 07:46:14 -0700 (PDT)
Received: from google.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e5383sm5849380a12.37.2025.05.19.07.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:46:13 -0700 (PDT)
Date: Mon, 19 May 2025 14:46:10 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4 02/10] KVM: arm64: Introduce for_each_hyp_page
Message-ID: <aCtEMoZSCfRAPHXN@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-3-vdonnefort@google.com>
 <86a57cg1bj.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a57cg1bj.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074616_224672_C63692C1 
X-CRM114-Status: GOOD (  21.53  )
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

On Friday 16 May 2025 at 13:57:52 (+0100), Marc Zyngier wrote:
> On Fri, 09 May 2025 14:16:58 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Add a helper to iterate over the hypervisor vmemmap. This will be
> > particularly handy with the introduction of huge mapping support
> > for the np-guest stage-2.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index eb0c2ebd1743..676a0a13c741 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -96,24 +96,24 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
> >  #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
> >  #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
> >  
> > -static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
> > +static inline enum pkvm_page_state get_host_state(struct hyp_page *p)
> >  {
> > -	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
> > +	return (enum pkvm_page_state)p->__host_state;
> 
> I'm not quite sure why we have this cast the first place. If we are so
> keen on type consistency, why isn't __host_state an enum pkvm_page_state
> the first place?

Purely for cosmetic reasons TBH. The *hyp* state (as you've seen below)
really needs accessors with some logic to decode whatever we store in
hyp_page (the _complement_ of the hyp state in practice). So we
introduced accessors for the *host* state for consistency and obfuscated
the __host_state type in hyp_page to encourage the usage of these
accessors. None of that is strictly necessary, though. And the explicit
cast can go, it is already implicit from the return type of the accessor
and the compiler should be happy enough I think.

> >  }
> >  
> > -static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
> > +static inline void set_host_state(struct hyp_page *p, enum pkvm_page_state state)
> >  {
> > -	hyp_phys_to_page(phys)->__host_state = state;
> > +	p->__host_state = state;
> >  }
> >  
> > -static inline enum pkvm_page_state get_hyp_state(phys_addr_t phys)
> > +static inline enum pkvm_page_state get_hyp_state(struct hyp_page *p)
> >  {
> > -	return hyp_phys_to_page(phys)->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
> > +	return p->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
> 
> And we don't seem that bothered here.

Cheers,
Quentin

