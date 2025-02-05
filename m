Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C120C0219A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nX4R1J3tJqgXNtmHCVf3jelvmV9h4OXD2UPjQtl2Fsw=; b=WIRjgS/hFHEGMp6tX0aR+X6HGK
	gZVxyILTD33IWOE31X0oB6RkPWeBaxE2utUXgPh+bGSmUelhfVCxH3HajOZi/OjgicLZXWUbDE6Ok
	vzR7Vp2AmlSifjVCAgJaK1l80pJPftDgy3UjxvUrO5BDWHwtloa73PmXoG7C6wxoSuXokGynLAU95
	voGmVf3Sc3wUkiBk7ST4MvKGB3deGuodH/65iSvGq1KHeXOJZY6mcgvux4O1ABF0nf2E/irVDk7Ma
	NOGnC70WuG9cIbp6OaFLBaKBbMyC7DIrDG75ZH/Mf8mNpp8C0lM76ZTNd0CVAD1KsJR5xNAlkAHxZ
	Cpbv/M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeeL-00000003EPj-2rcA;
	Wed, 05 Feb 2025 12:37:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeZU-00000003DKN-2hnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738758718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nX4R1J3tJqgXNtmHCVf3jelvmV9h4OXD2UPjQtl2Fsw=;
	b=YazgREI43LRI62wocsL5FTFExmf4q32LC5J9fuWjLZM+yIRhZhTUfZTRwVU1oGhW2NCO7V
	9eORkpxDhEHnfvsK0W/0I1epCL2kO2QORnBip4IZGnNVXg9ULf5RtBh4TRFPIkS9n1PLLE
	c/HtpXIFytvmAsMDapEpqhWBwMDO1lA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-NltjQqQ2PoehZIt-zrTktA-1; Wed, 05 Feb 2025 07:31:57 -0500
X-MC-Unique: NltjQqQ2PoehZIt-zrTktA-1
X-Mimecast-MFC-AGG-ID: NltjQqQ2PoehZIt-zrTktA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43621907030so58723785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 04:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738758716; x=1739363516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nX4R1J3tJqgXNtmHCVf3jelvmV9h4OXD2UPjQtl2Fsw=;
        b=jMCgrZHJpx3M03yxY+eKBfkXqzfq7ZdKZNfOGbZt9X6pBrRw1RVSW/Z5BMvtDVeVgy
         AQhvrXuq1tZ9F1HzTEr0Ef6WHLxSzHjbY5rHFXGAhnziwlZgH/r0+LyhSWKHJcouDb9A
         gi+Mp+mddmEX3r5kM10srT7qRtRdQeOtrCss4yAS14ZksnUr7toMZNvEch/yfgvbujTc
         ozAarVHLphG0Eyv6MUhU4VMBBIGRxBR/n/TE2IxdzN39SKG1eky5Oc8lVh51gExGfhlw
         DcU7cRWUK4QQI5tVJRG2C3WMWPRXgUurVEA31Vy4VXGeRzhUig3qSt6mgn2L6uu8FxFY
         WiVA==
X-Forwarded-Encrypted: i=1; AJvYcCWHs2UescCTVlxuO6JlNEGqUWNiXsgbJvcfKla8ukpr3EwYizLhEtppyvBjXzYd6aXsL53S+1EGgnq2RyQlupaG@lists.infradead.org
X-Gm-Message-State: AOJu0YxnvaEAkJo4oi2IM9wf/REyTIIPmuroUWRfwUOS2KsYIEIAE75Q
	e5ebztBZdrTeEI+f8inuGOwRdM5GlQHwSNLluzH3Wfx7jr1+uEbD13Obk09zW3o0FUJiZkTNT97
	pCW00FrbI1LTuJEyvcl25hAZ5yM12qgbvvCvBeZ1MPG+OqvQSTM20LMUPPxn2EmBBkYVYoNEl
X-Gm-Gg: ASbGncvbpJQciwVs3Zg5XzW+ga7ZmtjdXPwGggDK58iwC+LTa3xAXwCR2ZQJ+rHmLtZ
	FWR8TnApFUWkiWDI2hT68g7nSx80GpSAsZrc0Me+QxC/nckKRemNsTR75PuK4zQg8Vifw/1xCVc
	fzBY7coKuF5El68bl3BrMDchf2vEomFtUgpkQIdgTlbYu/of53fBEaYX3pIiP5szfv88LnqAFM3
	ExN6jAv91NN5Z/1p2baYGQ4EHl50dv7+ird5xH7wnzEBrp1MLkeJrYxkYkAKFrOlO4gCp+ds1fS
	DSyhoOsFGAbgKQob2SLQLZLs3JWds+bRoBvsshWydC51x3Q=
X-Received: by 2002:a05:600c:5127:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4390d43e4fdmr22441025e9.13.1738758715854;
        Wed, 05 Feb 2025 04:31:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu8UQolYnAq5L4ETol9e+CppDVauJEFOX/uqtF/MVCF19JA9RxfWAWC3l0svk2IQEOGRJbqQ==
X-Received: by 2002:a05:600c:5127:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4390d43e4fdmr22440555e9.13.1738758715452;
        Wed, 05 Feb 2025 04:31:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390da6e653sm19539215e9.24.2025.02.05.04.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 04:31:54 -0800 (PST)
Message-ID: <d1302cfe-486c-4516-a875-d9467529482a@redhat.com>
Date: Wed, 5 Feb 2025 13:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org, catalin.marinas@arm.com, fweimer@redhat.com,
 jeremy.linton@arm.com, maz@kernel.org, oliver.upton@linux.dev,
 pbonzini@redhat.com, stable@vger.kernel.org, tabba@google.com,
 wilco.dijkstra@arm.com, will@kernel.org
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-2-mark.rutland@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250204152100.705610-2-mark.rutland@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P-ja3Vpnj33JgRe-37_QGorRb8T-zzrHZvvlLyErMZI_1738758716
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_043200_766931_F2A71786 
X-CRM114-Status: GOOD (  41.46  )
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

Hi Mark,

On 2/4/25 4:20 PM, Mark Rutland wrote:
> There are several problems with the way hyp code lazily saves the host's
> FPSIMD/SVE state, including:
> 
> * Host SVE being discarded unexpectedly due to inconsistent
>   configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
>   result in QEMU crashes where SVE is used by memmove(), as reported by
>   Eric Auger:
> 
>   https://issues.redhat.com/browse/RHEL-68997

I tested the above test case with the whole series.

Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
> * Host SVE state is discarded *after* modification by ptrace, which was an
>   unintentional ptrace ABI change introduced with lazy discarding of SVE state.
> 
> * The host FPMR value can be discarded when running a non-protected VM,
>   where FPMR support is not exposed to a VM, and that VM uses
>   FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
>   before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
>   value in memory.
> 
> Avoid these by eagerly saving and "flushing" the host's FPSIMD/SVE/SME
> state when loading a vCPU such that KVM does not need to save any of the
> host's FPSIMD/SVE/SME state. For clarity, fpsimd_kvm_prepare() is
> removed and the necessary call to fpsimd_save_and_flush_cpu_state() is
> placed in kvm_arch_vcpu_load_fp(). As 'fpsimd_state' and 'fpmr_ptr'
> should not be used, they are set to NULL; all uses of these will be
> removed in subsequent patches.
> 
> Historical problems go back at least as far as v5.17, e.g. erroneous
> assumptions about TIF_SVE being clear in commit:
> 
>   8383741ab2e773a9 ("KVM: arm64: Get rid of host SVE tracking/saving")
> 
> ... and so this eager save+flush probably needs to be backported to ALL
> stable trees.
> 
> Fixes: 93ae6b01bafee8fa ("KVM: arm64: Discard any SVE state when entering KVM guests")
> Fixes: 8c845e2731041f0f ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")
> Fixes: ef3be86021c3bdf3 ("KVM: arm64: Add save/restore support for FPMR")
> Reported-by: Eric Auger <eauger@redhat.com>
> Reported-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
> Cc: stable@vger.kernel.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Florian Weimer <fweimer@redhat.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/kernel/fpsimd.c | 25 -------------------------
>  arch/arm64/kvm/fpsimd.c    | 35 ++++++++++-------------------------
>  2 files changed, 10 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 2b601d88762d4..8370d55f03533 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1694,31 +1694,6 @@ void fpsimd_signal_preserve_current_state(void)
>  		sve_to_fpsimd(current);
>  }
>  
> -/*
> - * Called by KVM when entering the guest.
> - */
> -void fpsimd_kvm_prepare(void)
> -{
> -	if (!system_supports_sve())
> -		return;
> -
> -	/*
> -	 * KVM does not save host SVE state since we can only enter
> -	 * the guest from a syscall so the ABI means that only the
> -	 * non-saved SVE state needs to be saved.  If we have left
> -	 * SVE enabled for performance reasons then update the task
> -	 * state to be FPSIMD only.
> -	 */
> -	get_cpu_fpsimd_context();
> -
> -	if (test_and_clear_thread_flag(TIF_SVE)) {
> -		sve_to_fpsimd(current);
> -		current->thread.fp_type = FP_STATE_FPSIMD;
> -	}
> -
> -	put_cpu_fpsimd_context();
> -}
> -
>  /*
>   * Associate current's FPSIMD context with this cpu
>   * The caller must have ownership of the cpu FPSIMD context before calling
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 4d3d1a2eb1570..ceeb0a4893aa7 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -54,16 +54,18 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
>  	if (!system_supports_fpsimd())
>  		return;
>  
> -	fpsimd_kvm_prepare();
> -
>  	/*
> -	 * We will check TIF_FOREIGN_FPSTATE just before entering the
> -	 * guest in kvm_arch_vcpu_ctxflush_fp() and override this to
> -	 * FP_STATE_FREE if the flag set.
> +	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
> +	 * that the host kernel is responsible for restoring this state upon
> +	 * return to userspace, and the hyp code doesn't need to save anything.
> +	 *
> +	 * When the host may use SME, fpsimd_save_and_flush_cpu_state() ensures
> +	 * that PSTATE.{SM,ZA} == {0,0}.
>  	 */
> -	*host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
> -	*host_data_ptr(fpsimd_state) = kern_hyp_va(&current->thread.uw.fpsimd_state);
> -	*host_data_ptr(fpmr_ptr) = kern_hyp_va(&current->thread.uw.fpmr);
> +	fpsimd_save_and_flush_cpu_state();
> +	*host_data_ptr(fp_owner) = FP_STATE_FREE;
> +	*host_data_ptr(fpsimd_state) = NULL;
> +	*host_data_ptr(fpmr_ptr) = NULL;
>  
>  	host_data_clear_flag(HOST_SVE_ENABLED);
>  	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
> @@ -73,23 +75,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
>  		host_data_clear_flag(HOST_SME_ENABLED);
>  		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
>  			host_data_set_flag(HOST_SME_ENABLED);
> -
> -		/*
> -		 * If PSTATE.SM is enabled then save any pending FP
> -		 * state and disable PSTATE.SM. If we leave PSTATE.SM
> -		 * enabled and the guest does not enable SME via
> -		 * CPACR_EL1.SMEN then operations that should be valid
> -		 * may generate SME traps from EL1 to EL1 which we
> -		 * can't intercept and which would confuse the guest.
> -		 *
> -		 * Do the same for PSTATE.ZA in the case where there
> -		 * is state in the registers which has not already
> -		 * been saved, this is very unlikely to happen.
> -		 */
> -		if (read_sysreg_s(SYS_SVCR) & (SVCR_SM_MASK | SVCR_ZA_MASK)) {
> -			*host_data_ptr(fp_owner) = FP_STATE_FREE;
> -			fpsimd_save_and_flush_cpu_state();
> -		}
>  	}
>  
>  	/*


