Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E866FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcrtc5H86cWPh0Did9l6A+KNce8iS/2PQzso7zvGK7g=; b=ttUn3EdSyyZ568YJdTUPZw4y/S
	MZAcOxiVdrdTTs8ufGqowhXnUBe+hWxamEjjsKZ9XqpprY7aiseSUtb8DZwuVkujrOGLhmt3/BxeD
	Dot/NigMgzXkRsK+7x/dYyNIHPjIyj6ufA/WnFntRcVW2IYu3d1I9lLi7GgbLPR+eumzangvaFdDl
	JwBHY24YQq0foBxIjrP7ITL3qzqU1A6DnNFuimK9iZvK9JjZOYdmoz1HttC43Bma1kUC3SiLLVGKp
	MSx+GgQwA8l8+1aM3cz3Q/00YCPe/GodgVTBVcl+GvsgfFzf2LW+S9ZdBNw4V/bM7Mg8YRmesog+K
	90Gng9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfO-0000000784h-0TW1;
	Wed, 10 Jun 2026 08:52:06 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfL-0000000782O-05HR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bed2195323cso967184266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781081520; x=1781686320; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lcrtc5H86cWPh0Did9l6A+KNce8iS/2PQzso7zvGK7g=;
        b=RdvkdrWQz6pecfe/SjVUO0Ur1DfQhd6UNsMV3uwnRUNWP8LlEn+fGqUCs+BM/Rvshm
         uPQprpdRTQycTarWj/sIaDyY730JYmh/vTfHi8qF+GlCef9g3FaELxXK2XpFs6rZLaaR
         5qOdGzziOfo0K8JTCn1hhBZz1M5KBGnGiM0NZIBomf/xPzg+5PMNM3W8+qmGtF4PHsuQ
         NMsuPgPsQFZD172qlldI28k1Um/60cgvIKjXhVuCibdmyNpSzGPwpDngk7ZwSqpRilVi
         BT8MjNJ7Jz9sxbtMSDLAJ5mfK/hRs7YxCEIMULbPFtGxO9bQ77Gw8d5+adwVUZkn9dVP
         mynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081520; x=1781686320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcrtc5H86cWPh0Did9l6A+KNce8iS/2PQzso7zvGK7g=;
        b=bTlIWGtzHcQy+kzJ/IFlBr0zOBuY/Ueqpt3n/S4JhOCYKY9Ep8M/jAUBOvIF+0b22j
         EXr+QdpfkLzNgFi6xgPI89B0a53eeOajfU3zddGNUscHA6iu9EOJElRpGCVMFIbpTWxt
         oExeNaB1oILKX2q57kdgW7AoqlXI/euuoQayUKky4G6OeoMyig2h7rZ/jJtHIYoHoqxn
         4+oiqlhCeh1qpTF5dwITLCFBewOGyIbjs8jYNA/AIRaIBvBaCo0tW7W1XOVhgTrZDag+
         a655KadLRBmjZmrLnWKUuJNSWmTv3Ajat4oIWGY5wH0/tJBLmrSANmUQgWu22wFmqmc3
         B47w==
X-Forwarded-Encrypted: i=1; AFNElJ/E6A0YlGiTJ3i2DZmYirns5jPTPBWwT/l1LXZcQaQMgYjP5Caox0nAI3+8kz89TWOp2XdOZ2OGAHqyAHVrDrU4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkoh0CV6+WGid2YIh/m9AL/T1LiyiRnJkrR4iVAXkDcyFgxanM
	JoSlOXn0FGPw5+vbxCWbudKmFMFxaEr3lU9NpFYV+lZikbXOlvg3KNnar4W+RQi9XQ==
X-Gm-Gg: Acq92OExLW3+AW7B3lOPSgGgP09XZV0Y3r0n8eGUn9n6P2IDeWTx4Em+Ici+eyWTS+8
	tmAfCA0w3haNAzy8XJAnDpI6zJAc5R0IxEvYW1wQFUuFarWaWMleGC4hz+WhFSN0nVS7JGRNYdw
	br1acFvmxhT3HGMwHJcUbAU1XU1E17j7F3IdTnuU6KS0ok0G+DO0wHZq9YKUZszfRofnX32pTI5
	yXKK0LR1/idW4euFgaMQQITd/RYDhYDG60ZOsLevnv3CHPrTJ+rWoSPHoY2p9MiIkOVHt+Bmq7e
	VlmttwDHCPQxlFTsoMRUFixV+VcHwzrCx4ER0uU9+5ooKVu23y16cqDLH4t07DHx8nolGvQNE3/
	StbW65FOnMV5UyAetWGWhO0Ku6myQ6/v0oLOUU30/QhywB8tNMOq8Yn6pHSm+QPgeUD2CmcFWQf
	8D813LyvDBB4cMt3zT2UYaE6Dhre/R5oFZYSkOTzacBvPCdQqdd8E4ScKxM1AWyCnmOi148TUj1
	uWetA==
X-Received: by 2002:a17:907:6e94:b0:bf0:550:d9f with SMTP id a640c23a62f3a-bf372159fe1mr1255552166b.31.1781081519868;
        Wed, 10 Jun 2026 01:51:59 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9549446a12.15.2026.06.10.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:51:59 -0700 (PDT)
Date: Wed, 10 Jun 2026 09:51:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 1/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_CREATE in host handler
Message-ID: <aiklq5QvztNk8FZR@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608165549.1479409-2-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015203_092535_398E06EC 
X-CRM114-Status: GOOD (  23.19  )
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

Hi Seb,

On Mon, Jun 08, 2026 at 04:55:43PM +0000, Sebastian Ene wrote:
> Allow FF-A notification bitmap creation messages to be forwarded to
> Trustzone from the host and introduce a helper to check for SBZ
> register fields.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 36 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..c20d45191085 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> +{
> +	int reg;
> +
> +	for (reg = first_reg; reg < 17; reg++) {

The upper limit should probably be something like ARRAY_SIZE(ctx->regs.regs) - first_reg?

> +		if (cpu_reg(ctxt, reg))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>  {
>  	*res = (struct arm_smccc_1_2_regs) {
> @@ -676,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_BITMAP_CREATE:
>  	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  	case FFA_NOTIFICATION_BIND:
>  	case FFA_NOTIFICATION_UNBIND:
> @@ -862,6 +873,26 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_notif_bitmap_create(struct arm_smccc_1_2_regs *res,
> +				       struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, vmid, ctxt, 1);
> +	struct arm_smccc_1_2_regs *args;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 3)) {

Is that expected we start at 3 but only read 0 and 1?

> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (vmid != HOST_FFA_ID) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	arm_smccc_1_2_smc(args, res);

Should be hyp_smccc_1_2_smc()

> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -920,6 +951,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_BITMAP_CREATE:
> +		do_ffa_notif_bitmap_create(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1064.gd145956f57-goog
> 

