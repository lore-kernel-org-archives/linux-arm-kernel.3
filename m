Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA91CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYHUL+Y9sDYt/84sbmqrw+bMmVqlzQNkmZJ6A0M/j4w=; b=uff0sk/Z6lSsIycLbh2z6kTlVG
	1DgD/m5bXBqIv/vKfQIqgmcRxDowHj6hCtp6yhUoaqjVeqAgex5hK6kq1HQT4vp7hp9AZaG9kMmzM
	9PvHAoez0BGqr2P6i/oHxwK/+kvON6ukIyEnOaKBsA2IBdatROtOVxX47FV8IYR/izBWqwqaGk95a
	Eb2tci26us4Iib2TZSHtYkahrgtATYtNPAeVIXfUqZuaxUCRhpg/NL/OYuHpa/Pnhv/52XsSQstzA
	hXLIgfCCtEsHo8447P8tLWkCrO+qcEaABERYxciO2tflvcFzQT8OKJ9zQ8hUI2NLW8QQFtptg2vnF
	rguqPn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waG2b-00000001bsh-0873;
	Thu, 18 Jun 2026 16:56:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waG2Z-00000001bsM-0gBB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 16:56:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490ac10e337so7383845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781801789; x=1782406589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYHUL+Y9sDYt/84sbmqrw+bMmVqlzQNkmZJ6A0M/j4w=;
        b=oV+eAAqrkIa6F/07Xm6+JeB03mpHSA7SMaY+Ld8dy6/UCM526L7CU2KjeBdE1Wd/XT
         3cgiq25t1Ec8WNYS4sXUW/lJ7SqjawOIFIM8IRx84g8vyoYOul9Tq51XOoPyytbrO1iO
         H1lyAwVuKy7qTT9zE6rM4zJmg+zu/CXB//2OKfApSA/MC645Ic0ApKy9s1AMFOoWmWDb
         uIMmsnytyObb9gd+gbMS8+cjT4YvEfnCqKxvM5HECLj/o8Bzi+L2F4wSOEw5NB0i35sy
         JvWU2Z1LE0HWC1tBguff0W0/3mtWXbPCd04YGkUBiEZIvcwUZ2y5rtempd8NIHwmruJO
         kPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801789; x=1782406589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYHUL+Y9sDYt/84sbmqrw+bMmVqlzQNkmZJ6A0M/j4w=;
        b=UdubHugMZSmTPxrXJg4wmXyQeTB3rCpd0+Ic1ErENCraY/Sb40KRpBt0xmivgEzS3W
         FM3+SeNCU2iiX/duqWjpN+DCTkzBY6wJoiLubDgHcp/ODMYyffPt9Y4uktZwKNh43giv
         geFqwGsFtfhv8hshmN6Uhx3Xx69WxI7xZKMs1qUgn6DG0JHBwgs7YIeXlojmD05b9fYF
         lHxEMmY5SAe5rUltc38ng7FMBG47hTP+VyBN6R985r1QcZ4H9/GqNwJsiX8hZL5SrkAe
         OgVb5fu7cP7dRsPtNTXB5JGBgS/gvglvAHn2M4jlRrBkji8DAyx1bexwMajlfLBZ2u+F
         Ufuw==
X-Forwarded-Encrypted: i=1; AFNElJ9V3ttOigh5+pyeMRPrL9KudRYj57IPuemP0Wi+Mq2+rT+/Tex9t4J3WyFS7qrV7zMi5YvmEzmck1WgtFEFsF0X@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1oOrWV02hHFRAivKfiAfj1tRF6wvkB76O6QiKkAWuUO1lnm0m
	Wy36DKWVpC3MYOFvOW6M2OQOz9A5qscjIVpQS7Bk8MzodC3iW4fBKN7ZqSMGnRB2rg==
X-Gm-Gg: AfdE7cmgv8oc8WrhKWlXBsctTkHRgnMVMcJFdLjIoyRLEJYacEtvu4A5XE8vGuid68r
	4pC8yxBjBxZVs51UpYe2g39Bd+QDJT1zDx+HIl7p5L8d3ILJLPasK01cB4OZdwpPiHYrMsmItjP
	Xd7OS+meRPg1VIQyhKyyBTItlA3//MbAOo6v29ZwoPne1n+kZque2bZlSeJ7lKr6mIam/uNyuHy
	Y4rYQbvzrXuKa/1wFb6v3X3ZGyBaoaWZZex7OEXup/zAFEfDs6HD5W9yrJKNJjyLvABtUcO4uJs
	9AxUwiXcm8q2j6YEOgOP9rToTWVzf9BCFoecxsqjn/wrNDkCc3fSaP0bUNLQiBSYCOhDdsD5lqi
	BaIpfIb/RMRiDkzzRL9aZNFUzwdZCBTS3l65K4uIieNPbDTwOGDc5/+ejMzAZV1ClSBC4cmVzkO
	18huTTpt6i0VKkuwMwKytoWXNj52fd8WnEMhf3pgTHOZo/mL8r3m8MN3ZR
X-Received: by 2002:a05:600c:8217:b0:492:3d05:5639 with SMTP id 5b1f17b1804b1-4923f6a949dmr6700535e9.36.1781801788773;
        Thu, 18 Jun 2026 09:56:28 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b67a33csm153604f8f.17.2026.06.18.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:56:28 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:56:24 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v7 5/7] KVM: arm64: Validate the offset to the mem access
 descriptor
Message-ID: <ajQjOH9Cjk1UqdT-@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-6-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617145130.3729015-6-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_095631_250076_F56178E4 
X-CRM114-Status: GOOD (  25.18  )
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

On Wed, Jun 17, 2026 at 02:51:28PM +0000, Sebastian Ene wrote:
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
> Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 2d211661952e..1a2abd0154c6 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -476,11 +476,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	DECLARE_REG(u32, fraglen, ctxt, 2);
>  	DECLARE_REG(u64, addr_mbz, ctxt, 3);
>  	DECLARE_REG(u32, npages_mbz, ctxt, 4);
> +	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
>  	struct ffa_mem_region_attributes *ep_mem_access;
>  	struct ffa_composite_mem_region *reg;
>  	struct ffa_mem_region *buf;
> -	u32 offset, nr_ranges, checked_offset;
>  	int ret = 0;
> +	size_t mem_region_len = !FFA_MEM_REGION_HAS_EP_MEM_OFFSET(hyp_ffa_version) ?
> +		offsetof(struct ffa_mem_region, ep_mem_offset) :
> +		sizeof(struct ffa_mem_region);
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
>  	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> @@ -488,8 +491,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  		goto out;
>  	}
>  
> -	if (fraglen < sizeof(struct ffa_mem_region) +
> -		      sizeof(struct ffa_mem_region_attributes)) {
> +	if (fraglen < mem_region_len + ffa_emad_size_get(hyp_ffa_version)) {

Can't we replace mem_region_len with ffa_mem_desc_offset()? that pretty much
looks like the same thing.


>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;
>  	}
> @@ -508,8 +510,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	buf = hyp_buffers.tx;
>  	memcpy(buf, host_buffers.tx, fraglen);
>  
> -	ep_mem_access = (void *)buf +
> -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {

This check looks like ffa_mem_desc_offset() with count to 1.


> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	ep_mem_access = (void *)buf + em_mem_access_off;
>  	offset = ep_mem_access->composite_off;
>  	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
> @@ -574,9 +581,9 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
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
> @@ -599,8 +606,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	len = res->a1;
>  	fraglen = res->a2;
>  
> -	ep_mem_access = (void *)buf +
> -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {

ditto. ffa_mem_desc_offset()

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
> 2.54.0.1136.gdb2ca164c4-goog
> 

