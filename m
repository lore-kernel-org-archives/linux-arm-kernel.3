Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAE0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8J6GRvshR84cVDL8+yqDVLhfMFpXsrxiE9ecLJtpmYg=; b=m4azvLjCh2JzEUU8Koj5MoxuvW
	Ygl9UMrywoRN4WDBn2fuqb5JahYG359NAkTy1jclNjb8+slKAdzMS8E+MOSOsS53jPp9h9wvJsxeg
	r2txyvATGhlEJDnpgp98Z8HTXr74YIGlXtB4BLPol8ycELAUzooTQKlZoWOfb9GSFn/pmOnpF3Aki
	MH7PoA1xmzDgwNdR7yLf3aDo9C8yIVxS487rmO+j/bdTsk/wtGpx0XgucB3OdeMKtRVSFdaLSrM+R
	8ZOydxRBMDeLSH/qzbj5RRbp9LlL9Gejq/cZY0Nw8L5rJRbnvrkVCflM9L2bcz9Im3blfnLEFyEpE
	RgsrJDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA1r-00000002pZK-1c52;
	Wed, 13 May 2026 13:53:39 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA1o-00000002pXu-3rvd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:53:38 +0000
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d864c23bdso12751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778680415; x=1779285215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8J6GRvshR84cVDL8+yqDVLhfMFpXsrxiE9ecLJtpmYg=;
        b=JvjJU3jiqqiwfVTzNHMOM1P15vaxc6XZVoI2Vmd83nRVZ4WTvuAnrybiGH0FcjicY/
         HECeQxe8ch/sGNCLFvWAl3OFGx9kkqXFeP6Rdpuk1iYFnA0XmrOgOdrQCLRgcdCqR8/o
         HmFfpqBHIyAuw2Pq5Zxr8+2zNQEQ/J7WmtTwmlr5//4Oib/LhZYLpKa2ENdOVYOvAy1b
         IqSf/fItw8xHQuotdpN+katrMGaoHrcC7hp/kdGcaUAwuyYKu5pIPfC/sxxV0dvi5xD4
         NvuUHReoJMStiTnvTPPY5tCzYn9xRqXoF9Xl4DJh+cQbG1DNd1HVfBH1uJeAwO8kJngl
         fSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680415; x=1779285215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J6GRvshR84cVDL8+yqDVLhfMFpXsrxiE9ecLJtpmYg=;
        b=Hhmkp0rMezFZYD9tVygK/GgisT1a+In/O0EnOFr/Bu027bnrajxydaGtxa0x6+3Jih
         TrpcUtIr5n/zIaj+z2hpx3nmHYZ+8YCeje6/GgzExxzTCn8OWpbTYW4EDds9BGr00moS
         JscPeBPzcYHCe9U5zJc12KOhpkYs9AzSvxYiB9qme80/8BuNUn0EDc+CG083b6xcsLG/
         zikXDPElTr2V8urT+kEmrio9XQnjFX7kGt6Q21xopMNx99PgwOjZpoFe3OewDgH0IeLA
         VbXU1hKGRysobzUg7xW3muG9/fCBwK1IpoBWg7CN6Mq3QhrBR9sh5oumJIlNVvRMDRN0
         OVnA==
X-Forwarded-Encrypted: i=1; AFNElJ/UK+Ug0wthbjNjrvVk4+mG10KRb/ioCeZ+ucJDsNH78s1MSAVcbKAgaFJvheiT8OIrQSQESACJkXisgxjvUtmi@lists.infradead.org
X-Gm-Message-State: AOJu0YyKFCVjmf84AgokKJLCOJiRa4YX/MLgXcEIYwBeYJVZ+d7doXqK
	mF0BKVGGgJ95v9V7hwIvmYhurSSk9K2Zp0JV4GainrxGjmu5i6L9WII2nqn6U2V82A==
X-Gm-Gg: Acq92OFrt2e4m5WQRnWS+M1EjCdzf57uq4GMITuxPSbXdi5svWimmnFaYvcAst4e74Z
	WC6Qayk1OWKwRhbs2ohvv2hzIclInMCzHSLFsgXUZcr3KwAikrNDanxkm21l5dYV8/Qjp5du4eD
	pCM3VjcDySWPYvt0k8MzWeE86MGetshufWmmM44BGgRpuiCOBgEv2ZM/zMMEi9nJxGJHVZV0WJw
	k3L9JgcGBbzmbj8c8p0DBXqQWcTmUhZUbF220P/f8bGIx7Kd73YpTEL32DFE1x6qF3Xi3khHyVj
	nL1fxQePFBsq+RjrKlH/YsDYAiegRF4bs5V+wcacfHPSGmpXlh9V8gyn1+ZYthjaRh/Tvcl272y
	NUtxbZVgmHq5S3/wI6981JBPKpm62ILmL53svGp7aJeoAJ7Ue5Pb9QdKBk+7o+Gf910uKOmrY0+
	mvsx3TIf0VBpfsZohHvdO/OevJ6zn8RK0jqdZjGPwPgn0E8GqX8b7FejEg/zCTnUy2Sq7Woartd
	j91tkY=
X-Received: by 2002:ac8:5c86:0:b0:510:fa1:73c5 with SMTP id d75a77b69052e-5162b16988amr18374031cf.16.1778680414453;
        Wed, 13 May 2026 06:53:34 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65db6dd6ca8sm6202887d50.4.2026.05.13.06.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:53:33 -0700 (PDT)
Date: Wed, 13 May 2026 13:53:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	sudeep.holla@kernel.org, will@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3 2/2] KVM: arm64: Validate the offset to the mem access
 descriptor
Message-ID: <agSCVMykWHY4pzlm@google.com>
References: <20260512124442.1899107-1-sebastianene@google.com>
 <20260512124442.1899107-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512124442.1899107-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_065337_001164_BA35F232 
X-CRM114-Status: GOOD (  22.62  )
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

On Tue, May 12, 2026 at 12:44:42PM +0000, Sebastian Ene wrote:
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
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..34927bc1239b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -479,7 +479,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	struct ffa_mem_region_attributes *ep_mem_access;
>  	struct ffa_composite_mem_region *reg;
>  	struct ffa_mem_region *buf;
> -	u32 offset, nr_ranges, checked_offset;
> +	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
>  	int ret = 0;
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
> @@ -508,8 +508,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	buf = hyp_buffers.tx;
>  	memcpy(buf, host_buffers.tx, fraglen);
>  
> -	ep_mem_access = (void *)buf +
> -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	if (em_mem_access_off >
> +	    KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE - sizeof(struct ffa_mem_region_attributes)) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	ep_mem_access = (void *)buf + em_mem_access_off;
>  	offset = ep_mem_access->composite_off;
>  	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
> @@ -576,7 +582,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	DECLARE_REG(u32, flags, ctxt, 3);
>  	struct ffa_mem_region_attributes *ep_mem_access;
>  	struct ffa_composite_mem_region *reg;
> -	u32 offset, len, fraglen, fragoff;
> +	u32 offset, len, fraglen, fragoff, em_mem_access_off;
>  	struct ffa_mem_region *buf;
>  	int ret = 0;
>  	u64 handle;
> @@ -599,8 +605,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	len = res->a1;
>  	fraglen = res->a2;
>  
> -	ep_mem_access = (void *)buf +
> -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	if (em_mem_access_off >
> +	    KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE - sizeof(struct ffa_mem_region_attributes)) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	ep_mem_access = (void *)buf + em_mem_access_off;
>  	offset = ep_mem_access->composite_off;
>  	/*
>  	 * We can trust the SPMD to get this right, but let's at least
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

