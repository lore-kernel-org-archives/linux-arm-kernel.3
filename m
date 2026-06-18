Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E9FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MNzaKBiFWGgNDTUfrZ2uI/mAEuS8g827vmh39Qo+Zo=; b=LwYI6tQpOFxhOAZal+0lxVtKWQ
	BwgPymV7Zi1REmIqwc0a4rP1UV7qFUIrZTWEovfCg6mkz4OnyGcTr+5Zmons03OyCeKpgQ/fpYgKv
	6VIhzixIlFJozjKEe4riwaZHBPluWwNzjMPbLIDzDefCCBw1hemUWt2wOb9fBdS+XxmVGvkFAnNji
	zlFajE3EURM3d5h55dkY86HZ8Li3sjv+iYsqRPdO0+UZZHOqhCCGo2n7QoVVZKKKzCU4GmAKGq8jn
	fx5pWDDkc5qQDTMD11AKRcutFtr+71xmQhJqTa7rzoVr+iHUe7uUqPGZGRxMgD4aKzO6yqsXJMq6R
	UYmueMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFSl-00000001ZcJ-1ymf;
	Thu, 18 Jun 2026 16:19:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFSj-00000001Zbj-0f70
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 16:19:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-464192ab2e1so617271f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781799566; x=1782404366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MNzaKBiFWGgNDTUfrZ2uI/mAEuS8g827vmh39Qo+Zo=;
        b=Py7rU58zV1TX7tVScgjdlYm9pkT3a0tX8yoDh+rPEClG+IDKQl/p+zMSGScgKoZEfZ
         SnPR3+AUjOOtMDrqQL93x1NK9dEFigP7qAdhdR++1MZSXUGkSt3Po9/wJ2F3tALuOv5g
         wVaLsPvEwDguMvCscGeSZglmi2SSiVMy4mv1ZI9JcQjXe/TM7YMZTnI+WJS6xsMLA5mC
         fbxWqnkoydGio5ngKhpFgn9JlxBCfkU7pwlUOASVjk/pyCIZEMX+SjNOD/52cRes/giy
         bskXFqyrHHbOy7j/GXOe6ftEb4BgEqacosO3bs5XFGoxKXtS7ZZisKHsvNtBIiRIdPnx
         vIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781799566; x=1782404366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MNzaKBiFWGgNDTUfrZ2uI/mAEuS8g827vmh39Qo+Zo=;
        b=GWmqd7Hg7r98bUYcUKM2p6My7G38paZrq56oeUnR6q0vaKgyj31m3ssAZWGRVtWAO5
         cU1z2w2ju2bUTUPn5XvdRw89mxBJHRqxicimD95OejuIfRVjzWqNGNTnI6LWX2gFXTHX
         jKg02CHhgMAPPXIOh5lomSYLvmbgksXXsYWrfbZ3UuTXiboN5L6NsSaN8JgtiwSRHLQD
         0f5qosEZIhwY2au1NW1hv5VX+AWEF3b6qqitvQO49wBBUX+2/CvHXRdeBuix4ke6rJ7B
         AkxtwIj1PSrEDbkxI3uZv/WIAkzW1gJrOJCiGML1y5hVDFZjEL54uZbw1FoV0ngtOJHe
         11lQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w8Whj75XR97DS8pzLcr5ed++DV+bvugP73QpqdIn4VlI+oPUNS0aRPTWvL7W15cKBwxIUqVlGlmotsrvYCaos@lists.infradead.org
X-Gm-Message-State: AOJu0YyrK7iRU6LgQX9EHABbvj1I1jK5JJQDvm4Zu2g/Hbmq0PlzvITa
	6uY6+XSpZjYJUhVXK8+PzRSioJzAMfDDCjKNpdz7v/A1HDZgjSyUCdLoEOGMhYJgSA==
X-Gm-Gg: AfdE7clj8M4KyXgpVL8+32mHpLtraTfHoWF7Umaj1cDie6ZYDZCJkh58X9JuHPq2a/R
	v14o2or4OlcxKBMVr+6E4G5Wt4gJzAXGzqnksf4DbrQEow6DXmTLUCrjdbS/Semrie7ulnPHckq
	HLSFkdRCMOFGllHIbUosAgw5TbjqHiwZKT+I9wRmN+fFp9o2rrg3IU4xG2gtKeKiXzxGZzeKr1h
	O4BEC+Dur+OrBWUUKiVPsbTGAI2OYokdZoffaHYf9poegU2VVNVY56ir7mpfSU8yn/321Cjm4Rk
	wMPRYnHkeAZKqwevM0M06UScgTWnIkmdaOebJ0S9poFSd/4aoZumv0BIqFFK8nPcxRA5VRbRTzT
	ETEmw+mpbfHSB7Ap0eS8ZrH5ZZjEJkXPDBac4D8W7xrzsltQi+NAplnMmVT0K0v+5QfEKJepnGe
	JnALe7sUDveodMieclwhLlnFtYG35hMLyfxxRP7olXsKuXnsXhPi2R4/O1
X-Received: by 2002:a05:6000:2384:b0:464:1462:2286 with SMTP id ffacd0b85a97d-4650052fe2amr287936f8f.16.1781799565346;
        Thu, 18 Jun 2026 09:19:25 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46289c3b3a3sm16235705f8f.30.2026.06.18.09.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:19:24 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:19:20 +0100
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
Subject: Re: [PATCH v7 4/7] KVM: arm64: Fix bounds checking in
 do_ffa_mem_reclaim()
Message-ID: <ajQaiM7pIXzzl_vA@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-5-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617145130.3729015-5-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_091929_215331_A35125E6 
X-CRM114-Status: GOOD (  27.48  )
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

On Wed, Jun 17, 2026 at 02:51:27PM +0000, Sebastian Ene wrote:
> From: Mostafa Saleh <smostafa@google.com>
> 
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
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

FTR, I believe the comment about composite_off in include/linux/arm_ffa.h is
incorrect. It is an offset to a ffa_composite_mem_region (not a
ffa_mem_region_addr_range)

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..2d211661952e 100644
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
> @@ -636,11 +636,17 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  		ffa_rx_release(res);
>  	}
>  
> +	reg = (void *)buf + offset;
> +	if (offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len) {
> +		ret = FFA_RET_ABORTED;
> +		ffa_rx_release(res);
> +		goto out_unlock;
> +	}
> +
>  	ffa_mem_reclaim(res, handle_lo, handle_hi, flags);
>  	if (res->a0 != FFA_SUCCESS)
>  		goto out_unlock;
>  
> -	reg = (void *)buf + offset;
>  	/* If the SPMD was happy, then we should be too. */
>  	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
>  					reg->addr_range_cnt));
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

