Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989B1CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0u5FTqBTXNLLGdidnrnWIaCMVX09cl5M57gIDTlUfs=; b=C60C7ngmFhM7NBXkRi3vLglRu1
	Nfl56Bm8019AhAes1gNh1uItyswcNcOl1Bv4PnArK/KeN5TbEpz/HJ2X98KvMjUbi9GrJruL9hCj1
	djjXjLDwpYeT7BzRRv1WL4iPmnqj8XgLNbLrsvH479vf48rh17WeARv0IEB6+rtVRClvYEIQl9H3T
	TApFsZdK9TDoeXeKYA6gbDU4dOvyr9rv6IKBhIii1pQQmIFFhnHKGPfTx9MbGoFnSdE9eGp4NdW33
	henGbaPhIdJAE3NKUj8E2l9rqmqXmOwJx0xbXEN0hhRuP9xtHMTsAW4+4m2HQ01awIZ8Y6LX79nNA
	lJVviq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mJ-0000000B34A-02Mw;
	Fri, 12 Jun 2026 14:22:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mG-0000000B33a-2iJ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:22:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490bb5ad3bdso62745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781274151; x=1781878951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0u5FTqBTXNLLGdidnrnWIaCMVX09cl5M57gIDTlUfs=;
        b=D07Zu3odYX5U0JRTTMUzYXBq4VICjwRaZF2TF8uBusANAZOpZHyfR1SWksfWJRFjJv
         ydciTZMxc+jYURdl85u1IJpeF6WHUEizy9yGl7ViFstBSJZ4rVwNnbafaluSJnsicZCT
         YYMWAbnJoYI8ugulO1JVU2c+NHDxLr6Evk9qh6/Y0370pp/h4tREwmFMKHKUO4t32sH1
         j+TrGB9bsEx778yAyI1b1AlU1DQHY3QfNnpwlV1jve73v6QPpk/W2enknJmo2TQiOYrJ
         xF3m0S5LXJ4/ZE8pRZG2Eo38gN7vADnSpVqoBJ3UUGnQ/VguHNSXGdyDL0cX0EgFoe2l
         Buig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274151; x=1781878951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0u5FTqBTXNLLGdidnrnWIaCMVX09cl5M57gIDTlUfs=;
        b=N/sI+5TO/2b6CxYHlE0MN0r+xqIY0esqyx2II1hpr/+tdVXpoGScRANPHHzxT/wSAd
         Yq3aMEAHLBmV3JTqcU3Smc+dNVbXWrwrlMKtssDupW1Q6teLotq6elE/6hLyC25EArCl
         7cGQKXN3q9EhK2rRal/DaxMomp7Zzn3pFYz+jg4gtqBMoiKUq4uRWdFmloFIPeI+6hUw
         gBAByrzQmBYYV3NbS3jWtmt/dTf+rUUdp3eBukUSIqo6jzvo5s+iiPn2H5f0d12f1Jz8
         2guq1TeB+2nOUjm75n4wmKmfoVqqD1wlwkCvPZVrhEgN6HMiaxLWkhfKJ61SAXQP4wGa
         RjGw==
X-Forwarded-Encrypted: i=1; AFNElJ/vTSiRmR8B10zdEHqdLvixyP5tN9rJnEq9Fuzxkgfe94vLnwRgSasvZ6veC9L/QnO5eJqK1HTbQ794vkR61sry@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/DfTCnFZ0GQNnbpT/5JmtAZhkKn1eQokNIiGMuQIC+7LDzxf
	7hW6UskyCUbzi32oyIIOykGyxj5QsM66oxPP5XJ6IhOo21kDHk+iFu0675+IZvN3qA==
X-Gm-Gg: Acq92OHJRkgjQ/PSKYP57q8F+auR1awpLFjcoLeD2brzJB+bFk22B05yDncmClg3G20
	iEgrYVBxj/8AXxO/sencUkXkR1+9iR5DU1iU7+G59sVnz7YQTS5m+RAi9uLKv00syCgQsJY9ju0
	ere5zDZkffqaMGgR7R4WtLYVOgLjsHww5/nJtW38w9eJV3rJBVmQ5oWLmlj9prhvbOvt8Q3cvGI
	rsDPBx1A3AHG3VwHuFqKvPrjIrkpqUEBh/+5m6Psu2Wa3S/80viwomwq5it8ABesxEhT+1H+0vZ
	h8J7zwL1JzS2LQh4rpX3nOJHryip7N21Bdd8Tq7Q62591LeCbqEHVAMo7K4wqyW70vT1IUb7HeD
	6sFCuOntvOiPVfirSU+aJW237vZZooQHfo4k764Yuew5s32BnNU0zst20UOD34FFVlRP54ZfmBm
	K9uak6WbMMjBM2nSvFiDIIO3MIBrY7QlvuZIPRTkqcRFWHzyf7EjRV/yeEM/U/tvEsd/1haQ==
X-Received: by 2002:a05:600c:6b62:b0:485:1a54:9407 with SMTP id 5b1f17b1804b1-490ea5204ffmr1201925e9.0.1781274150414;
        Fri, 12 Jun 2026 07:22:30 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7db9c6sm71157125e9.8.2026.06.12.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:22:29 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:22:25 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	jens.wiklander@linaro.org, sumit.garg@kernel.org,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v6 4/6] KVM: arm64: Fix bounds checking in
 do_ffa_mem_reclaim()
Message-ID: <aiwWIRS-l-SS-wcK@google.com>
References: <20260527150236.1978655-1-smostafa@google.com>
 <20260527150236.1978655-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527150236.1978655-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072232_711172_21674526 
X-CRM114-Status: GOOD (  27.04  )
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

On Wed, May 27, 2026 at 03:02:34PM +0000, Mostafa Saleh wrote:
> Sashiko (locally) reports out of bound write possiblity if SPMD
> returns an invalid data.
> 
> While SPMD is considered trusted, pKVM does some basic checks,
> for offset to be less than or equal len.
> 
> However, that is incorrect as even if the offset is smaller than
> len pKVM can still access out of bound memory in the next
> ffa_host_unshare_ranges().
> 
> Split this check into 2:
> 1- Check that the fixed portion of the descriptor fits.
> 2- After getting reg, check the variable array size addr_range_cnt
>    fits.
> 
> Also, drop the WARN_ONs as that will panic the kernel and in the
> next checks there are no WARNs, so that makes it consistent.
> 
> Fixes: 0a9f15fd5674 ("KVM: arm64: pkvm: Add support for fragmented FF-A descriptors")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..b6cf9ad82e12 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -607,8 +607,8 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	 * check that we end up with something that doesn't look _completely_
>  	 * bogus.
>  	 */
> -	if (WARN_ON(offset > len ||
> -		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
> +	if (offset + CONSTITUENTS_OFFSET(0) > len ||
> +	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
>  		ret = FFA_RET_ABORTED;
>  		ffa_rx_release(res);
>  		goto out_unlock;
> @@ -641,6 +641,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  		goto out_unlock;
>  
>  	reg = (void *)buf + offset;
> +	if (offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len) {
> +		ret = FFA_RET_ABORTED;
> +		goto out_unlock;
> +	}
> +

I wonder if we should do this check first and then mem_reclaim, the rational being that if the check fails
the page will be lost forever.

```
	reg = (void *)buf + offset;                                                                                                                                                                            
	if (offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len) {                                                                                                                                         
		ret = FFA_RET_ABORTED;                                                                                                                                                                         
		goto out_unlock;                                                                                                                                                                               
	}

	ffa_mem_reclaim(res, handle_lo, handle_hi, flags);                                                                                                                                                    
	if (res->a0 != FFA_SUCCESS)                                                                                                                                                                           
		goto out_unlock; 
```                                                                                                                                                                                                      

>  	/* If the SPMD was happy, then we should be too. */
>  	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
>  					reg->addr_range_cnt));
> -- 
> 2.54.0.746.g67dd491aae-goog
>

Sebastian 

