Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6F10F931A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 03:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAhQRpBpSmCBJe7SZDFc/utVWYKkz+s/X4+iBM+yncU=; b=x4VuRFcSf7+k1JZSmyT1q58GOV
	wIKok+VY9MIsKpBqq9qQ28bcff4FTehkw+PZy5dEOCKOWnoUeR3NAUXFOWf8dSTtNCA0eTygJ+yFS
	4qp8JBMTvqHGKyfbZub7crKbAdAiDJb8NbqxFHFftsGngLKU+UiXmdWFt1tUj4W7bW/b07hhvjhhu
	sw1fVhiH1n0MbUBJAc1r4VmY+CTQCNts6vWiEn+PAHF6NiJAXn0mm1KjdA/RGshlos7RpdqwL1ZBc
	OOg/IW4ROQHt6eSc4iT+w47Bt0XTde7F/wKAUe96p19yC4HjgA3uIBhZkJuntvuEIXNWvGUu7MQ1C
	J+Avj+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lpm-0000000DsMc-18Ph;
	Wed, 01 Apr 2026 03:01:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lpk-0000000DsMC-2O3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 03:01:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so7084215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 20:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775012490; x=1775617290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pAhQRpBpSmCBJe7SZDFc/utVWYKkz+s/X4+iBM+yncU=;
        b=AoJngaVER8/biIPe6XkwtDCQvd0UxhW3FXjNDhQ+kpbk6eomuGpspMMDzd+MHtYTgA
         HM44lKuotKr3rTyt2OcTrca37K6Q9FRYdaOq5pSpgOoVcQfpHlE/xsx0ntoLqsxJyE/P
         gSJvT5fZhSFScyEUxVG/O4gC6obF74SZCdCBTMkSq3M5DVO9t0DtlpHagTBwtdT6iogN
         OCD1d2cmyHu4YXzoge1xi+TmsODjDWd3fC2dZhpx7+Y7wX51qGqlo1uQMDJr/eOP1PJN
         z80d9BVHAnNJow4fE3P1hpZZvgtw1ZOuswp+Vsjjy8UrL+TFpXnsN33kQYju+cqlHap4
         9fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775012490; x=1775617290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAhQRpBpSmCBJe7SZDFc/utVWYKkz+s/X4+iBM+yncU=;
        b=XVBPK+M6Mrl8u8VabzVL/flNJqWGOd3NG1K52AW+gnmDe0aycKEjSgLyoqfrjhDTb4
         IK4fgYLlNk5eqjjBipDuuxrhawaAmVZxJqwSH5LUy8Y7EF+wZhB1px15zHf1V17KFMYI
         e5uH14GkMYXMhDxYoS9fPWKBEr0ZzImn/xc5r2+2QEa7Pe3ZiCYetqfM+ddjBTJE6drL
         X6nmx64Gua2CL5jSlMruRQc14FzRgmq46X+0LieuuM3ALdFM7hTZKxl6k0V2keZxvsta
         omFdTEtgFipGXl57oSlacWHIcXQnyIr4wEKxK6yxobaBx9IP4Z+SgjN8rCXKHg9oIv4E
         Y5tw==
X-Forwarded-Encrypted: i=1; AJvYcCUcssgn/glVqj7v8rPQAOPfMFdaBF4TzSjVkFdEVJHfdjlFJaTya9DdzcOci2RnTpgScyLsjypJZmPdh2HYB7uN@lists.infradead.org
X-Gm-Message-State: AOJu0YyUhnYzleAIWLWO96ddMwEbFYRAgF6ufRmg6pQg1oJ/IzPg55TR
	a2mVttYN+M0JftJgwAWmWfH5WA/DBp4MX7OVOTsJMPsRU85ygW88dH9haZrOfo+oxQ==
X-Gm-Gg: ATEYQzwHM+VHVqXpLJ/q0UjuQoEOm8jHVplfThaA27iW1WuUJmBLBG8cd5SBmd4UFk9
	HvsKD6ZdpbQ/Rc/+2mjPsLp2b2a9cQTyHrzLXD2jwGt5elvlS5AXFUg7CepGmJgZuysLwo1oz4i
	EPshU2eLGUjUYFoc+rPTEIkYwNr6EpVeuoWwnE7uYTZkpQGOyNCll8qdZfmT4wYX8Jaiee8H8iM
	+/qXtobvTwkWRez4gmoCNPO04QtGb7xpVIQdP1AK86RMmNB7xum/BlYmf9Hw7bslt71jaUWhyZp
	hOBfUjQ332giP6OfEI3ZkuGwNI8JSXQJmwnJyooQFAMaOcNBp9imxvSznuLiIlQSUnmXWpLzOK1
	QRy28fXYx/kyWVVad3Xde32tyKRW6DRtkCBkDZFAsvWECeI2FKIDmJpBgBhKucrkYvEBvNrBfOj
	zR2GS/ytgIwRhTk5Xl0iAYu7nm7rlx7iXm9G0I/EtmVOB4MhhRdXMdeMdCyiJoKwPOu2vTRQpkk
	/tJeg==
X-Received: by 2002:a05:600c:c178:b0:486:f8e9:add5 with SMTP id 5b1f17b1804b1-48883591777mr27188255e9.19.1775012489318;
        Tue, 31 Mar 2026 20:01:29 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80140esm76029395e9.4.2026.03.31.20.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:01:28 -0700 (PDT)
Date: Wed, 1 Apr 2026 04:01:25 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: pkvm: Rollback refcount on hyp share/unshare
 error
Message-ID: <acyKhZL2di_QQ9xm@google.com>
References: <20260324172757.2147153-1-vdonnefort@google.com>
 <acpCq1qZCMFqocs3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpCq1qZCMFqocs3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_200132_630442_C402C558 
X-CRM114-Status: GOOD (  23.80  )
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

On Mon, Mar 30, 2026 at 09:41:01AM +0000, Quentin Perret wrote:
> Hey Vincent,
> 
> On Tuesday 24 Mar 2026 at 17:27:57 (+0000), Vincent Donnefort wrote:
> > If one of the HVC __pkvm_host_share_hyp or __pkvm_host_unshare_hyp fails,
> > rollback the refcount to ensure the hyp_shared_pfns tracking reflects
> > the actual sharing status.
> 
> If any of these hypercalls fail I think we're still in trouble as
> kvm_{un}share_hyp() work on multi-page ranges and we could leak pages in
> a borked state if we fail halfway through. And failing any of these
> hypercalls is also sign of a bigger problem somewhere else so I wasn't
> too worried.

Yes, my bad, I haven't made that clear in the commit message: a failed HVC
right now is very much unlikely. I meant more to future proof and this isn't
fixing an existing corner case. 

> 
> But if we're going to fix this properly, I'd suggest also improving the
> error handling in kvm_share_hyp(). 'Fixing' kvm_unshare_hyp() is a bit
> harder because we must tell the caller to leak the data structure that
> was shared I presume, so maybe we just keep the WARN and cross our
> fingers :)

ack

> 
> Cheers,
> Quentin
> 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 17d64a1e11e5..0fb41d2c8b44 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -493,11 +493,17 @@ static int share_pfn_hyp(u64 pfn)
> >  		goto unlock;
> >  	}
> >  
> > +	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> > +	if (ret) {
> > +		kfree(this);
> > +		goto unlock;
> > +	}
> > +
> >  	this->pfn = pfn;
> >  	this->count = 1;
> >  	rb_link_node(&this->node, parent, node);
> >  	rb_insert_color(&this->node, &hyp_shared_pfns);
> > -	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> > +
> >  unlock:
> >  	mutex_unlock(&hyp_shared_pfns_lock);
> >  
> > @@ -521,9 +527,15 @@ static int unshare_pfn_hyp(u64 pfn)
> >  	if (this->count)
> >  		goto unlock;
> >  
> > +	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
> > +	if (ret) {
> > +		this->count++;
> > +		goto unlock;
> > +	}
> > +
> >  	rb_erase(&this->node, &hyp_shared_pfns);
> >  	kfree(this);
> > -	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
> > +
> >  unlock:
> >  	mutex_unlock(&hyp_shared_pfns_lock);
> >  
> > 
> > base-commit: c369299895a591d96745d6492d4888259b004a9e
> > -- 
> > 2.53.0.1018.g2bb0e51243-goog
> > 

