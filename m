Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447ADC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tlr+U+ggvV9b6qUUYsEDpFnGs799KYouZS0u/xqDZw=; b=s5Z6+r9TuYon6q/aSZ9BihYy6S
	u6i1C2YgGxVBVtfczfenz58AkGuZ9BsiZsRR9hd/L/g2mMNoyC2JNTZa6fzRv7B0TJzt7hKeABhGc
	3NveAekWDHwuMqswQD5yKvcl6QRWRbwCY7E+nKncJCuiegQVjGRdOago4rEVHI0bJOrTTe25zMVT1
	oNypP1Bhzrmk0K1yX2QiEOFFAczUT/XOH2xwyK1smU5gjX1EfXRS/WJKAdLiBWYkCSijNPfAr9WA8
	vdpvS1+LS/vPCXHBzkyV+XL5JwidD86wrYgyqfWWHGyjEBgj5dMELH3sCpH1XlPPVuCb72EKn4Tn/
	K+kdUj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5oa3-0000000GwSB-1NQw;
	Fri, 18 Apr 2025 16:28:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nQa-0000000GcDp-0HvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 15:14:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227914acd20so25108315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989291; x=1745594091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8tlr+U+ggvV9b6qUUYsEDpFnGs799KYouZS0u/xqDZw=;
        b=N6WTJC0EGtXmYLkR5S53NI/63qSbe3ggi96KWv8h2By17ruB//J/eDJTG3HeMGAiNL
         z6igWPptzl8HxqD/TDYxSJNXxc/jBMav3wY0azoz5jMfFDAhWc/DsYfHCjITI4p5qmOi
         rezMD+UVZrRWBwHbNMnbRtN/m9OrtbUJIeb8RoLZ4W2DNgbCwUEZfPgXtnALw3NivwLj
         OCwOTrCtRDFXsY0RcMpjubWsOEBYvdhAiZff1qTRYGrJD2la+PATQNU0zox0TlDA9ThO
         9yDzIdmdZLiWOkfcM3fU6pLKYz1Z9fWSEbIAb1MQ7ZVbrN97jquQO36OpniWvkr8ILgi
         4qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989291; x=1745594091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tlr+U+ggvV9b6qUUYsEDpFnGs799KYouZS0u/xqDZw=;
        b=RXHg4PvPr91jZPJm89LEtg1gu/bb1mLHLdYjiaDVAFGY5YFlFq5puaIpI+kMQ+rI7+
         ai80POY0UuAe4hwUM64EKt1ltaFyli3bMq1A9993G+ut8ONvDWoQ0qD3zXQ24ps45NHZ
         KVZo+lzo55w2/Fi3vdu6ee+GUMiUe8tfMllgyUbmZN0SzrlXvYz13WfLXyTxON0jmiO6
         rOhPg0wM/knJh0IWaLRsvGnDg1lZX+Y+z2I8paf4S7bVP0AHM/wEaUhcWa9XRoTwPRA0
         Fs6Nd0FB3JkKyvmjnqgR+2gGCXv5P46sxo/eLr6hSEwTNEqLQnOPAQny3B9a3Iqwgnzp
         5cgg==
X-Forwarded-Encrypted: i=1; AJvYcCWYVp17CQ7LZeR14ygXrFz2GossaQhYDuZNnfvjpOyKWrElBd1KlyQK8j3bM7Ia7jgicRNzLM2SDDjYgxUQkmVo@lists.infradead.org
X-Gm-Message-State: AOJu0YwTKOrBT68VQGtRNkggx5Nu7ajjwHgYXsJcGbvAYogGIZSzKciP
	NM3uWO2FDHAlKZn1IaH2zSPlXXj5jQVHFMdlStAgj5DM3dJJ6ZU/
X-Gm-Gg: ASbGnctVRK2kE2aFJNiXk+LYKSonKgzI1PztAktGzQnQ+RSkU13VlPg8V8zTg+GAPRm
	zRoLitYbRhHyozbKyn6UHA9+QWlSl594R4o/xIVMVoLsnTvkMQy4WsPErz9vvZQ8Mqz30cFjI+X
	V0IU7W8q7AYeW7RdGrwVJl37Fcb+oLg/fZh+Wn9MlzS3ybR0/iWLxmR0TlvPLFzfkXLldp3iNxw
	1lNihp2iZHsqQc91WdsDZrZ9/81C08nuRktfFPpAK3p8YBXTgHsvNS7MadS/oHbnF7T8OAkCKMI
	6JVC2ABkw7Wt9dLwbEyGqgxyupfIYsxXY/CbVFjY
X-Google-Smtp-Source: AGHT+IFgH6kH8q8Ukkj38k3Ycwx8mgsM0+PlhclwOyMownQr5Lp6Z8YsDqQFALXwipkdJoGcEZeG3A==
X-Received: by 2002:a17:902:fc4d:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22c50bd610fmr55082235ad.4.1744989291024;
        Fri, 18 Apr 2025 08:14:51 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb64fbsm17891505ad.158.2025.04.18.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:14:50 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:14:48 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 4/6] arm64: nvhe: Convert the opencoded field modify
Message-ID: <aAJsaNdznnz-1qap@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-4-6f7992aafcb7@quicinc.com>
 <86r01rjald.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86r01rjald.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_081452_108594_97B5162B 
X-CRM114-Status: GOOD (  21.15  )
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

On Thu, Apr 17, 2025 at 12:23:10PM +0100, Marc Zyngier wrote:
> On Thu, 17 Apr 2025 11:47:11 +0100,
> Luo Jie <quic_luoj@quicinc.com> wrote:
> > 
> > Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > - reg &= ~MASK;
> > - reg |= FIELD_PREP(MASK, val);
> > The semantic patch that makes this change is available
> > in scripts/coccinelle/misc/field_modify.cocci.
> > 
> > More information about semantic patching is available at
> > https://coccinelle.gitlabpages.inria.fr/website
> > 
> > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 34233d586060..b2af748964d0 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -30,8 +30,7 @@ enum pkvm_page_state {
> >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> >  						 enum pkvm_page_state state)
> >  {
> > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > +	FIELD_MODIFY(PKVM_PAGE_STATE_PROT_MASK, &prot, state);
> >  	return prot;
> >  }
> 
> Following up on my suggestion to *not* add anything new, this patch
> could be written as:
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> index 34233d5860607..08cb6ba0e0716 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> @@ -30,9 +30,8 @@ enum pkvm_page_state {
>  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
>  						 enum pkvm_page_state state)
>  {
> -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> -	return prot;
> +	u64 p = prot;
> +	return u64_replace_bits(p, state, PKVM_PAGE_STATE_PROT_MASK);
>  }

This is a great example where u64_replace_bit() should NOT be used. 

Thanks,
Yury

