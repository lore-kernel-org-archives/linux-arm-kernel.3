Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16031CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M73/czaUWyBGnw72mY49ubaGrHPAbyEOgxiU49yDTv4=; b=Un5f725yzxLaWK3bodZD0lMc2a
	CZnGDecj/CgGBh+q9MGvP3nc59iArRX95gT9NgBRFaUYJSS0q6OIgDPe+E6tf/bNsPajp4egrb4hZ
	jynX7ThZ5q8swAD/VxavEYL31FmJVuUHbvjD1qnmC1Xq2XlMOj/7Fogo6y/BkRMXhAZpsM6vOb+Ju
	6pehRYF7XoUTfaLIZ4nQXPDeGYSdHiWobFGWBPLTJX6s0+HczELeiQ4nQTtJu3u1ty6yKuy8kT7N0
	9/C2nz+mQcIbdTJQJ/XvZq8kzAeaVlNYnTmJcI13ivXjOCkonLPUxZ8/ZbckApn1sO2wfYoMBJA6N
	Uc7rBXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3gU-0000000B9RF-491A;
	Fri, 12 Jun 2026 15:20:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3gT-0000000B9Qs-0F3w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:20:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b23c828aso60185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781277635; x=1781882435; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M73/czaUWyBGnw72mY49ubaGrHPAbyEOgxiU49yDTv4=;
        b=uvO3vufS4zuGlH8xnpkOyWjkludcy8w8iPFrkjvUfNiDJcWb5CVZonGbyuNxhZ8ElD
         MW3c++Q/3JXrNIjCBmGmNOaifEyCx5zXuApSSWN4MXhGYcNSYAlwlmDQLe3PhzvZYuUe
         R74vTk+BH5Ls0WW9DIGtnrsBhSCFejccZikx6hkuqYNkiuJGiyp/inVmuPlO2rxA+SgG
         zgoYo76wFvyq8x5IZU9U8Rl5fsa0I41NwfQV/PfEYVpoFexDwZ3wK/P6fzr8CEeVTO8C
         Wt3eG7yr5dFmSuPQyBVZSVTmoEBS2/nXBrj5YpIZK09P3CxyxRBW3dNyNEgSMGX91abO
         WSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781277635; x=1781882435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M73/czaUWyBGnw72mY49ubaGrHPAbyEOgxiU49yDTv4=;
        b=qqN5hjb0g+Dn86WIrNHNAwSXA3P+WdjiQ5/nuq9LKTEydkhXUbBCXEEfbAJP9JpCM8
         /fnmDe0GWFni3mSSdMDJ+KfCXrO3jCEXl/U9xP1w5+ocxI8VPVqUhNkiE5AX9/DNadJM
         KS1+3rNyP/jG4Uq4vwiRAbFFu+YpprguYnOu/d/fEZ2GapliTGk41ethyqIoYmOPM+sd
         Y5hrpaz6W00YoPaG/0A1QrQEa4xvfXeF0jVWrTjNQJnY503CFZAFiVYeOoRWbo80+v/E
         4OP7sZKSpuMBjVkNftUNxr2saDbYUfAVeyBNTxziSXeM4+3lMFG6U+l9ZlpmWyH09iyu
         aBIw==
X-Forwarded-Encrypted: i=1; AFNElJ/DUB+PUl2IDXRYS4Z6WazOchKjclM+Qudx992yp2gvO7430xGdYDqoIElP7Hf9nUOTc6Iz14EocepuPUfP+UZw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0U2/Z2tsR0qR5Gxe1v00UNp8OSnCAdWCL7kQhyAsl8APYFLB7
	61m/Lti+Sfkp9rOCJx3f9j27BGR2T7NMxhllBO+z8VnzyaRaAGmo+UP5Q3Me3od+cQ==
X-Gm-Gg: Acq92OF5BjnPlA+6NcikEL46YeOG9aZy6E96o7QuCLMkCBKuye6TgDAx0v1f4ykKIEW
	w6jjCrU4gCyCTBaRd1KW4kdY67at09OJss8iSOAgOjcM3ZDNjsj9PCBx8OhrQ/QR6ojixI5aQyX
	BjHKCKBXeaOcIYxYJCtsspaozs2F2AmpMcAr0LHQAKOzIWeMWU4khSoo/VRVSI5qjd0SpS7FsoT
	4wmHZcPrYp0GY1jCMLockFxZG0YybBdGKiloAxzphaz+b6XhvkBVPsVgit6pMozYh6c6SXhN80a
	JM093G3nJld9qHPKEpR0ux1pWjc+v0pIJC3+n09jiPU0Xd75z6iOqP1A3Vy+PFE+oJ0ce8gLUTO
	RozkpA/O+4my8HzQr4MqP60Fh7dt/vnRfJo/UD5JZ3qSUolWbwsqJFI7XKxfOPfRiKzsBOwo2He
	ZyLhuewMBlKi1RQBFffbf6KlxmWDV5OJVTItQ1Zyv/5PBTGMd4ASNFRO1kCf20Ms4XQczc7A==
X-Received: by 2002:a05:600c:2309:b0:489:1f6a:4ac0 with SMTP id 5b1f17b1804b1-490ea51dfb4mr951915e9.0.1781277634812;
        Fri, 12 Jun 2026 08:20:34 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm6626262f8f.27.2026.06.12.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:20:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:20:30 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	jens.wiklander@linaro.org, sumit.garg@kernel.org,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v6 5/6] KVM: arm64: Validate the offset to the mem access
 descriptor
Message-ID: <aiwjvihrwbInBqGn@google.com>
References: <20260527150236.1978655-1-smostafa@google.com>
 <20260527150236.1978655-6-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527150236.1978655-6-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_082037_133772_8813EE44 
X-CRM114-Status: GOOD (  28.68  )
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

On Wed, May 27, 2026 at 03:02:35PM +0000, Mostafa Saleh wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Prevent the pKVM hypervisor from making assumptions that the
> endpoint memory access descriptor (EMAD) comes right after the
> FF-A memory region header.
> Prior to FF-A version 1.1 the header of the memory region
> didn't contain an offset to the endpoint memory access descriptor.
> The layout of a memory transaction looks like this from 1.1 onward:
> Type | Field name | Offset
> [ Header | ffa_mem_region  | 0
>   EMAD 1 | ffa_mem_region_attributes) | ffa_mem_region.ep_mem_offset
> ]
> Verify that the offset to the first endpoint memory access descriptor
> is within the mailbox buffer bounds.
> 
> Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
> should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.
> 
> [@Mostafa, Add missing call to ffa_rx_release() and use fraglen
>  as the max buffer size as it is the only intialised part]
> 
> Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index b6cf9ad82e12..a12e01883314 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -476,10 +476,10 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	DECLARE_REG(u32, fraglen, ctxt, 2);
>  	DECLARE_REG(u64, addr_mbz, ctxt, 3);
>  	DECLARE_REG(u32, npages_mbz, ctxt, 4);
> +	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
>  	struct ffa_mem_region_attributes *ep_mem_access;
>  	struct ffa_composite_mem_region *reg;
>  	struct ffa_mem_region *buf;
> -	u32 offset, nr_ranges, checked_offset;
>  	int ret = 0;
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
> @@ -489,7 +489,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	}
>  

Hi Mostafa,

>  	if (fraglen < sizeof(struct ffa_mem_region) +
> -		      sizeof(struct ffa_mem_region_attributes)) {
> +		      ffa_emad_size_get(hyp_ffa_version)) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;
>  	}

Here sashiko complains about a compatibility break with v1.0 even though
it is not from this change. This is because the size of sizeof(struct
ffa_mem_region) was 36 bytes in v1.0 and now it is 48.

This check can cause "perfectly valid v1.0 memory transfers to be rejected"
(from sashiko).

Other than that this looks good. I will spin a new version of this
series.

> @@ -508,8 +508,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	buf = hyp_buffers.tx;
>  	memcpy(buf, host_buffers.tx, fraglen);
>  
> -	ep_mem_access = (void *)buf +
> -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	ep_mem_access = (void *)buf + em_mem_access_off;
>  	offset = ep_mem_access->composite_off;
>  	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
> @@ -574,9 +579,9 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	DECLARE_REG(u32, handle_lo, ctxt, 1);
>  	DECLARE_REG(u32, handle_hi, ctxt, 2);
>  	DECLARE_REG(u32, flags, ctxt, 3);
> +	u32 offset, len, fraglen, fragoff, em_mem_access_off;
>  	struct ffa_mem_region_attributes *ep_mem_access;
>  	struct ffa_composite_mem_region *reg;
> -	u32 offset, len, fraglen, fragoff;
>  	struct ffa_mem_region *buf;
>  	int ret = 0;
>  	u64 handle;
> @@ -599,8 +604,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	len = res->a1;
>  	fraglen = res->a2;
>  
> -	ep_mem_access = (void *)buf +
> -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		ffa_rx_release(res);
> +		goto out_unlock;
> +	}
> +
> +	ep_mem_access = (void *)buf + em_mem_access_off;
>  	offset = ep_mem_access->composite_off;
>  	/*
>  	 * We can trust the SPMD to get this right, but let's at least
> -- 
> 2.54.0.746.g67dd491aae-goog
>

Thanks,
Sebastian

