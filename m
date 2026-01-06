Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EFCE9D6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REzMItOKRjoF4vczIgVji7C5aDimDWmguKzGPV8mrrY=; b=HcMePCXI7Nm9uVm5lvIPXpCAq6
	tWuMaZX/Kin/N7LZWioE3Zzg0/6RP1sBHxEm31sPJMPi4A0OHPduY+2EHepbtyE202GlDsgdpua+d
	Gr/GthsW7sbcNsmKPkPCuIPZcI+Yl17wXe8+HqixTHDU0yZPCPYWGUQsySQttHlM5PIKpEkDLFpF7
	C13Gn1sXtI7kwgDCIQja1g7S7JdPRUgpS/GQVL1BjYe/KpSE+TN4cMLTIGWuYL6JvUBQ0ba7pHF0M
	d3CL4yxx0Mp4KlUAu87b60LTLT3EouBcZ9ufPF83C/vsB9CfZdeWaYIiw1LXCcBehZAuDQ4juFZV0
	duJkwnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Mf-0000000DRLB-2xiQ;
	Tue, 06 Jan 2026 15:52:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Mc-0000000DRKp-2In7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:52:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so8621635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767714773; x=1768319573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=REzMItOKRjoF4vczIgVji7C5aDimDWmguKzGPV8mrrY=;
        b=w0jXcVRsR5oO3plUbi97+ggBd1QNEG9WOS3/KlLeQQKozW/ygtlSKlHnNyUVCmcSrA
         UuhyD0hocK02lG9JCy1dYRCD/dCeZysrffXKLjC+mVfGJvg515+Sm5OFO/RvKLrEQahM
         G1izA110tpdElP2WeTqUT3n5ECHO0H6h4P6ABwLsLg6A4qYBdH4nzF++x4Y7AVvweUaz
         zoVHn/xcg8qOz7tY1j4qhg0oVap0jMBXcerVWhvczZ8EZldsoY2UVnR6Pk3zo8KXnBAR
         P8VI7fhPZfrpEW4+b8kwMzOM1dE67iE+EK8Da1tx3nbG9TEAUj3E0dOoeO/uDTFytyMO
         WM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714773; x=1768319573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REzMItOKRjoF4vczIgVji7C5aDimDWmguKzGPV8mrrY=;
        b=jaMinNGb/GIb9O+qeZQuPGshdMh34y6TUdSZfX9FgZ33Qk8bPmZvLRQb3F9idSTntt
         AEjUeyW8jfT0UK5XhXWLV+UY3o/5Lms3Kfy1+7jNW/YkGwDrxRUe70j/H9VYDAjRfT7C
         9S0hh4poDTkdlapOizy7S77A6IB6hfjZriEj8Mm3jTFs0vE02Rym+lnxT4wFYrocXwhT
         SVovZYsBDHXRdHU17GOx70muqpzVhGZPvsdcIx+oYMgTqCEeqhvXMufZ++V1KsKwnVnj
         XuMcAYwZ8Koxm99oGPCWPARD4A9TrDlZ9mAPFUfj46DJMa4/C4NhFpfcyLEPrX2+2ycz
         dAlg==
X-Forwarded-Encrypted: i=1; AJvYcCV4M99zZhUYv3QhnB/R9hgQpPK0h7mp4KVl1+4YCHCa+yXV4bqCBQblBT8K8YbY4bDa7eWSBe0Ye1HRtagd+dqb@lists.infradead.org
X-Gm-Message-State: AOJu0YyGSjuwgqxggUJP4rYGNi0RlOXMVg+pHdHn7fqPZFhaHocfZKeM
	jT8pfMWWj342PavkEEWTOhhXKxegV05HE8MLDI39ggLkB9S7OFiRltT5oymiPY3VGg==
X-Gm-Gg: AY/fxX4PdL5P+MSUj1HsIFMun1p/xfG8pGdd7kdaLyLcCtnGMXAzSjxiTw8wfdAv3ep
	L32SnZcXLHZJ5HkpIct7VQStGE7nUavli3L/azQvQKmU2eBEH8hF9ZKPaOgmIemcOgq4Rgr1uSv
	Y6QGQZ49QmSEkEXvBYXce8Q2hW9mcCgFhqtN73CS08rGOxZ7q8Hv2sriZN1xtLWobqMGvjO721o
	1/djVkT3D9979I2aZkDNUVB1WHE24DLg00wBhQZjADo8eKrmgPqvgPN7YwjlkDqxy5eKny9PuTK
	OhyZbnhQjefXuLiMhfeyAUmlu+Kn+LiZC//P5adzAPL+UHQ6u8OG2GxfsQmYAGeZXe3pw/Exc2u
	CzNZqSJWRGX28tRINuk0+jSabfrTdszJFCawcAYrgWuQ2+5WG1tRqAj367UOwYItFNMGt1pqFzI
	S8BR64FxF+99bB2XHSeQQs1LTpJ/kWWmn8AnsAd0XnYxNesiraYw==
X-Google-Smtp-Source: AGHT+IEMfxjN3FxPle45sdSpE9DcCNTEP+ANJOmomnv50tX3o9Ne4hQ0H16mskrmCeiSoTeIbY2MCQ==
X-Received: by 2002:a05:600c:34c6:b0:47d:3ffa:980e with SMTP id 5b1f17b1804b1-47d7f09b759mr32272115e9.28.1767714772302;
        Tue, 06 Jan 2026 07:52:52 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm5154284f8f.16.2026.01.06.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:52:51 -0800 (PST)
Date: Tue, 6 Jan 2026 15:52:48 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 23/30] KVM: arm64: Add hvc handler at EL2 for hypercalls
 from protected VMs
Message-ID: <aV0v0CaUvhaYdavG@google.com>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-24-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-24-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_075254_614466_6076735F 
X-CRM114-Status: GOOD (  24.25  )
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

On Mon, Jan 05, 2026 at 03:49:31PM +0000, Will Deacon wrote:
> Add a hypercall handler at EL2 for hypercalls originating from protected
> VMs. For now, this implements only the FEATURES and MEMINFO calls, but
> subsequent patches will implement the SHARE and UNSHARE functions
> necessary for virtio.
> 
> Unhandled hypercalls (including PSCI) are passed back to the host.
> 
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 37 ++++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/switch.c       |  1 +
>  3 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index a5a7bb453f3e..c904647d2f76 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -88,6 +88,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
>  struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle);
>  void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
>  
> +bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
>  bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
>  bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
>  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index df340de59eed..5cdec49e989b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -4,6 +4,8 @@
>   * Author: Fuad Tabba <tabba@google.com>
>   */
>  
> +#include <kvm/arm_hypercalls.h>
> +
>  #include <linux/kvm_host.h>
>  #include <linux/mm.h>
>  
> @@ -934,3 +936,38 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>  	hyp_spin_unlock(&vm_table_lock);
>  	return err;
>  }
> +/*
> + * Handler for protected VM HVC calls.
> + *
> + * Returns true if the hypervisor has handled the exit (and control
> + * should return to the guest) or false if it hasn't (and the handling
> + * should be performed by the host).
> + */
> +bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
> +{
> +	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
> +	bool handled = true;
> +
> +	switch (smccc_get_function(vcpu)) {
> +	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> +		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
> +		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
> +		break;
> +	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
> +		if (smccc_get_arg1(vcpu) ||
> +		    smccc_get_arg2(vcpu) ||
> +		    smccc_get_arg3(vcpu)) {
> +			break;
> +		}
> +
> +		val[0] = PAGE_SIZE;
> +		break;
> +	default:
> +		/* Punt everything else back to the host, for now. */
> +		handled = false;
> +	}
> +
> +	if (handled)
> +		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
> +	return handled;
> +}
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index d3b9ec8a7c28..b62e25e8bb7e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -190,6 +190,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>  
>  static const exit_handler_fn pvm_exit_handlers[] = {
>  	[0 ... ESR_ELx_EC_MAX]		= NULL,
> +	[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
>  	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
>  	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
>  	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

