Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D6D1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+gWQBW59oA/smxkvbCMiuP+EZcz3YoEze7WyvjSzCI=; b=BRBeMDojShRgAW25Wbbjix4m+8
	8wi6+LPl/orbQJah75Gs2v1mv5E6tgSvPC9gAO+a/Dlke1a9Z8HYnC9dOBlGGACwmoL5EyAUT4fhY
	q6YsntOq3OekeW0EvuYfzi+lChtEsI7idcFQGCvsKaCaJFfYW+w2uxN8fFGcMY00/y6gwNvNUxVX8
	2cpeTFXGFq9r33yiC3zuUZsY0rbZyK+UTckhxLi3IgVwmpmJ/BEJi1qQTBrqR/Hdn7k0tN6uufu1+
	l+awiG9HtfVCqtOP/Ybb4SHp57LuNyMslfDk8Xl5u/7mWkgix879t7gE8iYBX/MKbvuiqn14QgXwJ
	5r+QYUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81P7-0000000Edm5-21u7;
	Mon, 04 Nov 2024 18:02:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80vl-0000000EXmH-38A2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:31:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e681ba70so31551e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 09:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730741514; x=1731346314; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+gWQBW59oA/smxkvbCMiuP+EZcz3YoEze7WyvjSzCI=;
        b=fGVZvQHVHJn5drBiuZudFgemKt58zYLGgUyNjssoTePoaBeY5j9gxsCfzSdmADALP4
         q2P7IUheDeSogTg+fzAKDWxslWxDeUJa6yO2hv5a4aFxhdunELmy7GcT9U5x/8Ec9y4B
         r7rYo/Nnxhw6JH8V3A4cisrH9HnanYrB0j6+NU7VhAKpNUnsc9IRo7pOWCfjK+8XIXQ3
         XPil6WJZ5QOmzFo8Q6bsTzos2hxzBPwoyRehdw8/w8iqZPGgGohjEkSKT/fRExbx4k1T
         P3RRNkX539joWG9QwOfFB1zNp/BCNeZthXi8GPaXXQEgYe0DHY2U8PbTpoYSC9iBaoHN
         7AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730741514; x=1731346314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+gWQBW59oA/smxkvbCMiuP+EZcz3YoEze7WyvjSzCI=;
        b=jjL8a67/T78k5mdE5GtWF3WkJo8nrMIZnqw2+50H2+YkokQu385ApCFK2TbgNLx6pO
         qsBkh1lUbrcdrgum/05gbdLHTZ+KYdxwaJ64kMFrmOyi0g9mNwC3fSpokHNIsbgoBNqR
         MoivQC0aUKN/cqzR/b/oTZAHKGj3DMOHggLnv0zE3w3BBu676VbZtZD6j3+QSkySzrvw
         cgv/oEEWmttQ+lnguYrREXnixHwcA9S1UNiGhntvoPtHGIGaPaBJqXvb/rTPfGKLRyfs
         lQWGwxpu19CjP2hnE69e/Mi8+YeSI8fX/U0o26lrcucN/Jz+NewZzE9ZuzN1tSK8paAA
         buuw==
X-Forwarded-Encrypted: i=1; AJvYcCUwazIH+UNxAOwEpLT0Cx9Ihzst9qfGj9hmj0BseBPb03N5DGRD9pLha4swUrxAMXYs//UaKYNMFzCz/pKnt3LX@lists.infradead.org
X-Gm-Message-State: AOJu0YwnrDMool5jaEVXxazBeVrXGDwWA49m1trlR1laGkY0oKLkPPUK
	Z/R6KW5pfyi26Koz5NhopSKomzrYH1Mj4Mym+cXWV7+9kIiBcWHU8kQK3+XFmA==
X-Gm-Gg: ASbGncudYa9rM1xjTyIc+4+dyd76Dl6Lp2TwwwkiStZdeh0v0n1L1dAmzaIS/Xs3dvx
	EPqlzrMrGNJWvWEXF3j7MXZAxR+In+U4OKXJHBpy2dJhIJ2Rxj0locPKYIPI9DqZHriiRKBrylQ
	rfTYj3eKzP6Jixw+OExoISiqxa2+Vspucujp5rmmdRajKBxNYnYHg9IeTcFxefXWu7GLrgsUKuZ
	SrBAq+An7eSv9Sc1IfjZJZLMK5o7PgXweEDTz7OGoDqdwUVVxjemDcFIt96esgg90WkpcLLEYND
	7TWkLKoyjnACKDQ=
X-Google-Smtp-Source: AGHT+IEFzR5K452HH5vqMM377aknN6V/3WvRGaWelqf2PQHhiSRldASVdDARr7JWsAF1t8ICdL9ygQ==
X-Received: by 2002:a05:6512:3985:b0:530:ae18:810e with SMTP id 2adb3069b0e04-53d6b1b3362mr519219e87.5.1730741514166;
        Mon, 04 Nov 2024 09:31:54 -0800 (PST)
Received: from google.com (145.16.38.34.bc.googleusercontent.com. [34.38.16.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm189791515e9.41.2024.11.04.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:31:52 -0800 (PST)
Date: Mon, 4 Nov 2024 17:31:50 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] KVM: arm64: Change the layout of enum
 pkvm_page_state
Message-ID: <ZykFBhlzrUQtjEjy@google.com>
References: <20241104133204.85208-1-qperret@google.com>
 <20241104133204.85208-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104133204.85208-2-qperret@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_093157_813574_12E80A71 
X-CRM114-Status: GOOD (  23.08  )
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

On Mon, Nov 04, 2024 at 01:31:47PM +0000, Quentin Perret wrote:

Hi Quentin,

> The 'concrete' (a.k.a non-meta) page states are currently encoded using
> software bits in PTEs. For performance reasons, the abstract
> pkvm_page_state enum uses the same bits to encode these states as that
> makes conversions from and to PTEs easy.
> 
> In order to prepare the ground for moving the 'concrete' state storage
> to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
> purpose.
> 
> No functional changes intended.
> 
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 0972faccc2af..ca3177481b78 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -24,25 +24,28 @@
>   */
>  enum pkvm_page_state {
>  	PKVM_PAGE_OWNED			= 0ULL,
> -	PKVM_PAGE_SHARED_OWNED		= KVM_PGTABLE_PROT_SW0,
> -	PKVM_PAGE_SHARED_BORROWED	= KVM_PGTABLE_PROT_SW1,
> -	__PKVM_PAGE_RESERVED		= KVM_PGTABLE_PROT_SW0 |
> -					  KVM_PGTABLE_PROT_SW1,
> +	PKVM_PAGE_SHARED_OWNED		= BIT(0),
> +	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
> +	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
>  
>  	/* Meta-states which aren't encoded directly in the PTE's SW bits */
> -	PKVM_NOPAGE,
> +	PKVM_NOPAGE			= BIT(2),
>  };

I guess we will still have to keep around the software bit annotation
for sharing MMIO regions from the host. This would not be tracked by the
vmemmap but it will still be in the s2 pagetable. As this is tagged with no
functional changes intended, are we safe because we are not supporting
MMIO sharing currently ?

> +#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
>  
>  #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
>  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
>  						 enum pkvm_page_state state)
>  {
> -	return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
> +	BUG_ON(state & PKVM_PAGE_META_STATES_MASK);
> +	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> +	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> +	return prot;
>  }
>  
>  static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
>  {
> -	return prot & PKVM_PAGE_STATE_PROT_MASK;
> +	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
>  }
>

Thanks,
Sebastian

>  struct host_mmu {
> --
> 2.47.0.163.g1226f6d8fa-goog
> 

