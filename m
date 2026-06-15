Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A43ECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUgsqjBTFZvdCdtQA3mADF26jeRTv++PPR68ymFBShw=; b=D9sd37ZIwlibyj1Fq2GJjxMpyB
	CuJcMuBbcLIyEuccAp94dvLhfJLR6UaxAhWP5Q6gnPB5oJLFZnWIkD837nrLVHclAg+P1PKH2W600
	nhZBA3wQJfF8R58GxY87TNu3NzgR2ogDweV2EVQcrFV2PUPN/u50QBkOwQuyifcDlwMmuGpyx2q5v
	AIUeOgVQkEipN94KXe9yLHheBEi8sp3MRE7LHxL2xzT8IpYByReXsD0aK35o51r9qswM29tCLigzQ
	/FpSyC4nZ0hkUkIBr3x06inhip/vtuk1zK6Fop6drlv1G5IwXNRgPdC6IcJcL3/ShkdPXHmCs6W7H
	ThKZfUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ76D-0000000EGah-26f6;
	Mon, 15 Jun 2026 13:11:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ76B-0000000EGZc-2z8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:11:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22861935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781529090; x=1782133890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUgsqjBTFZvdCdtQA3mADF26jeRTv++PPR68ymFBShw=;
        b=dAVUBkLD0yzmdi4NLdILsjqZzgBPm5UxZ8Nkh3CtMTterZAJrGN1mFR2SM/31GaTCy
         +0lNZH5Yqghex9MaHkLLiYn3U/d//3FqlpLQAZHTn0EzSIIuZmx87muM4b2+ocrzcbWO
         g7LzQ8EuOR8VuDzo2wCFULRgDy63rx7cBJyqLyeGToerUYb1q7jtEl/FibmHq0Af5Rez
         qrU5e2+3vmicwkmyK1ahjw77lBzTLPrcbc5rTD1pnEr1rH20IKZ35edO86EjbLRRsMjn
         0vXQYnMLRLz23nvUOgiaXEJc+6QRlmbwg3hwMk0dqqkLPFpipoBYucAeF/Tdk1Vx6z6m
         jR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529090; x=1782133890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUgsqjBTFZvdCdtQA3mADF26jeRTv++PPR68ymFBShw=;
        b=MM7yhVb3sOZ+f6DLLr4hFeHNswPiuh7xC96vRL8P4g3qpfHLBPGrTjimviMfKxbviS
         VpC+XqfWFmuRfYLYcUI+C+rnGzBnWfpJYmivOGvQqyaEbmLfobSCWi9oYL0fNbzARkwY
         IMFSluV6ozCsslo35POBJBvoTbIuc81cMJ14h6DMITZn9aZb3f51JqTnS9GXMg4gv8+x
         Pv8FDOQIRRqLCCnbMGEfmLMhPzt1xRHx5RZJxf6+bfmgg0P2ViahY25VQ3tT5iExN72S
         dq416xfjGUaarC877ZAyUhIiKUShtwV5VZOTw354sE0NrcYTtJxUFdG3TDjgfI5rTGmY
         61Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9HsK+SgHHm6dDICUFZMA2jzXL9DLj1mEUoQX1mi6KXctVHfO00jnR4gO95amQ+vEiChFjuhmUJeXwinl4zIUMw@lists.infradead.org
X-Gm-Message-State: AOJu0YwRGKdhQvUd3zFTenegq2ai65/dtVbknJfFLhrkqzDXAO7d3XIf
	0DOFtk60KtcSO52a7kG8ELPZXtGYwVRaUwRwKgOBgyOJMqiMYRhKjzBvpQr6IMqjSw==
X-Gm-Gg: Acq92OGbUrDgkXC0EMluBVIwOhIgzdoOX9jx5FYbnP7T3VzNKjO3PotQ1i5C6zifLuZ
	IPY4K/KVRCBftD+hSwT9twLsswZrD7lCI1Dpp3wEnkSBlPzXZqUqDT1dI/wXWfI0NZV8CuZvawT
	hddi6MQMqFos36ECtwmueoQFyfQdWpUwWVUHRDkMM8Pu7nBO0y9yTcoZhaMEqvbzRuwy37mWb+v
	mHEbfWJ15maYBAfqVAiIecyEQRdbMZkfGN4C+aB3KcMk+njwpswOPI3AmJ0OSODegj/mqombImM
	l8rtbHIxawWcmNEqRU1BnWswpgyDKJZP0Tu8IeSI8bCSqsEyQpsYzmUXecOCSWREkjVte+DDbyt
	OwW9nIsYySPwHnSNiwUepPajVuB9xqx+HDeHYmJ1tj5ZVcwQLeAJUCIhxsKJEUSs2EFo/oCUieJ
	EHdMUfYmv2ny0G5tcCOvfFId8dHxFrw5PBwcjw/eJhACI3L5KJ1chCGTuHRlUqwQNePk4=
X-Received: by 2002:a05:600c:628f:b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4922017b005mr126783175e9.36.1781529088951;
        Mon, 15 Jun 2026 06:11:28 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95b274sm341373985e9.1.2026.06.15.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:11:28 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:11:24 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: tabba@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Per Larsen <perlarsen@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/11] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
Message-ID: <ai_5_CoRm-LdoVMm@google.com>
References: <20260612065925.755562-1-tabba@google.com>
 <20260612065925.755562-6-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612065925.755562-6-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_061131_770135_1E90B3DE 
X-CRM114-Status: GOOD (  21.39  )
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

On Fri, Jun 12, 2026 at 07:59:19AM +0100, tabba@google.com wrote:
> The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
> built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
> shared with hyp code. Add _vcpu_read_sys_reg()/_vcpu_write_sys_reg()
> inlines in kvm_emulate.h that dispatch on is_nvhe_hyp_code() to the
> host- or hyp-side accessor. A follow-up series uses this to share that
> emulation code at EL2.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c..aed9fc0b717b 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
>  	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
>  }
>  
> +static inline u64 _vcpu_read_sys_reg(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)

I am not sure a single underscore is widely used in the kernel.

Why not move __vcpu_read_sys_reg() and __vcpu_write_sys_reg() from exception.c
to kvm_emulate.h? especially this already checks has_vhe().

> +{
> +	if (!is_nvhe_hyp_code())
> +		return vcpu_read_sys_reg(vcpu, reg);
> +
> +	return __vcpu_sys_reg(vcpu, reg);
> +}
> +
> +static inline void _vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
> +{
> +	if (!is_nvhe_hyp_code())
> +		vcpu_write_sys_reg(vcpu, val, reg);
> +	else
> +		__vcpu_assign_sys_reg(vcpu, reg, val);
> +}
> +
>  static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_mode_is_32bit(vcpu)) {
> @@ -516,9 +532,9 @@ static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  
>  		r = vcpu_has_nv(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
>  
> -		sctlr = vcpu_read_sys_reg(vcpu, r);
> +		sctlr = _vcpu_read_sys_reg(vcpu, r);
>  		sctlr |= SCTLR_ELx_EE;
> -		vcpu_write_sys_reg(vcpu, sctlr, r);
> +		_vcpu_write_sys_reg(vcpu, sctlr, r);
>  	}
>  }
>  
> @@ -533,7 +549,7 @@ static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
>  	r = is_hyp_ctxt(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
>  	bit = vcpu_mode_priv(vcpu) ? SCTLR_ELx_EE : SCTLR_EL1_E0E;
>  
> -	return vcpu_read_sys_reg(vcpu, r) & bit;
> +	return _vcpu_read_sys_reg(vcpu, r) & bit;
>  }
>  
>  static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

