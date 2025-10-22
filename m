Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341D3CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42ue3TfuagWkQ2V7EUMjj15D8DxB3zkbZ2dEcUmvfhI=; b=Wp9pVd2C8EChuT7rwMRkzjaOCy
	lg3lAd3QGgTskeNpxW8wUYSZBiyRCnSOo5vm9HVSBQMFtpMW59iTWfDSQ7/zzaYVEnEd8g71YfjB/
	8xa/KXDksvy/8hdLAIFJFi5Lr+E1Ev5wp30ki1MihBejtb8wjO8omhwmUvUNwKInmtHlmVZsX9iUy
	w8CmjQpssSWAtyY5fPHAb9ZPRBb/ECrYLgPl+R7Y3PUh7NDDvZSFatmqq0Oz1hPBSvrJPQgxuO3KD
	qixH89XE/xyQgjSCZmD/K2G1lU/FY4fX+n6F2pawLEC2zTq5MYg2b0+4EaOZ7wcFUVSRSF0oKHTNR
	LfMtINBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaes-00000003NBk-0zdg;
	Wed, 22 Oct 2025 15:21:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaep-00000003NB5-3dpR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:21:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4711810948aso49784235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761146505; x=1761751305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=42ue3TfuagWkQ2V7EUMjj15D8DxB3zkbZ2dEcUmvfhI=;
        b=TfTdkT9lKiOFHcU54cinigwf54baNNpxs+OxFIWUbjk3nytzP6nkLvwtZY6EipD8sQ
         4PCOYcuLhp7/ia/tj6J+kT26gYBuexnAztBTjwwoSgXqPXrLrQfGdFT2gs24yMoUO+x8
         VoUlXBlbmMCLe+hNQIF+iVmYHw5Psd4l8HLSU0a/CYw4BBMbpDHIo2pnZINKn0V91+/C
         qLw+ODrD1vqjz1CkeTtKo70Z1ezRHc/KDnqI7SOOhTL+F/zdl2GA/J3wEAkzqv1E4rlm
         42kCqbAOEHVdMQb+wYoE5kvoLq3bRhfkJq95DCfeJ2OEoQSBOoeeAJ9RNflkdKoVPnHg
         wY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146505; x=1761751305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42ue3TfuagWkQ2V7EUMjj15D8DxB3zkbZ2dEcUmvfhI=;
        b=kqBrggobPxQQpKoDeJkgMSgnqBVlTmV+VKXuaNLlzGEAyCMUdEv5ZI/rv18RPaDAYD
         K4Dkhpp0PBmnG/pAPfTt6lg6HKR3Ns7IZAArxMxDm3W6kZq3lLRNmiqnggfytVGZjMHW
         rTbOJREYVchkQEr/jVfcxPcDIVg1F5vILQDdFcuxpHNbHgQKRzs+brvojgFAjgUIDUyI
         e5nVke0Srm6Kbs0OY9xLRI3Tgb6PijKoIi8raxl6m8LbjXPuanHRmfEsohF4r7AcIGxq
         DdzcZPVe2oMK/V0AervaZPvAqxH1ExA4iVc/qRuSG08s7G/eXInEv2HmoheY+MA4EPxH
         XvkA==
X-Forwarded-Encrypted: i=1; AJvYcCWZsN9dSvaNZeaAVbnpPto7ZIYNypPhI249g/2WFJsdlaXWqk5CquujUnbm2azMNXo7eyoKbZbw/HpIFbbKpzDh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw82fZF3OKkoH8FhrHnKOCXH2Gdg35fyz7vQ1RTvDeBP+9SzN8K
	YLBAgjw2kLXrctvxXLK48nq2jF1qAAOIEBOtF9/4r8SEguUi7GZM2xh/AYG7AMOAYg==
X-Gm-Gg: ASbGncslnpdHMHELprkwlnQ8po5GxRddmIdFhz7GwcHI6RCPF9o6O5ahgYCUiPLIIEL
	i4kYhoedbtjfEtJ79ZeGL0j2Soyy2a2e1lqNegFAtFcevafOOcpMG0IJwoZvQjt2rD3d3w6ZZrb
	xnc833YDNiN3uQFtt4uVZMYSszJd+Cg66rnyEbaPEUujGpJZLfRh9XjUFEq3SSiwYjDySLgZUN6
	XGojBpI94+a5MA0cpAXPI0p1EuMXqQCp4yLfeCNnzYGEu5YZNt6iSRoqurnOHAxhXRkZH0qKeV9
	KqEnAguUGk2rHyTUTXTN8oRrMFyi3D3hroYMlJPnWqJtaSCHZghGo0qkh7ScjpFkKolytY76lfa
	z6bsWAq01kyJtI7oX3BY/3tpi0uRjZ8p0BhcJCEzxgqLNgmZshqPYaPzzYE9W8H+si1DBkGrr1w
	ihMtguItoKXdRoqpNlGK0zXuUefqQ1GzS+a93TWDFB
X-Google-Smtp-Source: AGHT+IEnnK8G84/RCGIcEvbmU2iJ6PJ59Y6J0A2B+/Z8jT2K1jKw12A1VxcO8AZhiMzei5pC8Fi4cw==
X-Received: by 2002:a05:600c:4f95:b0:46e:345d:dfde with SMTP id 5b1f17b1804b1-471178ac017mr140699355e9.16.1761146505106;
        Wed, 22 Oct 2025 08:21:45 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm25217515f8f.36.2025.10.22.08.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:21:44 -0700 (PDT)
Date: Wed, 22 Oct 2025 16:21:41 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	catalin.marinas@arm.com, suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, joey.gouly@arm.com, ayrton@google.com,
	yuzenghui@huawei.com, qperret@google.com, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Check the untrusted offset in FF-A memory
 share
Message-ID: <aPj2hTXbGUseUqhE@google.com>
References: <20251017075710.2605118-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017075710.2605118-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_082147_939972_3DCDAFED 
X-CRM114-Status: GOOD (  21.82  )
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

On Fri, Oct 17, 2025 at 07:57:10AM +0000, Sebastian Ene wrote:
> Verify the offset to prevent OOB access in the hypervisor

I believe that would be just a read, so probably it would be difficult to use
this to compromise anything, except crashing the system?

> FF-A buffer in case an untrusted large enough value
> [U32_MAX - sizeof(struct ffa_composite_mem_region) + 1, U32_MAX]
> is set from the host kernel.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 4e16f9b96f63..58b7d0c477d7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -479,7 +479,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	struct ffa_mem_region_attributes *ep_mem_access;
>  	struct ffa_composite_mem_region *reg;
>  	struct ffa_mem_region *buf;
> -	u32 offset, nr_ranges;
> +	u32 offset, nr_ranges, checked_offset;
>  	int ret = 0;
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
> @@ -516,7 +516,12 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  		goto out_unlock;
>  	}
>  
> -	if (fraglen < offset + sizeof(struct ffa_composite_mem_region)) {
> +	if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	if (fraglen < checked_offset) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out_unlock;
>  

Perhaps this could be easier to reason about by moving this check with the nr_ranges?

        reg = (void *)buf + offset;
        if ((void *)reg->constituents > (void *)buf + fraglen) {
                ret = FFA_RET_INVALID_PARAMETERS;
                goto out_unlock;
        }
 
        nr_ranges = ((void *)buf + fraglen) - (void *)reg->constituents;
        if (nr_ranges % sizeof(reg->constituents[0])) {
                ret = FFA_RET_INVALID_PARAMETERS;

}
> -- 
> 2.51.0.858.gf9c4a03a3a-goog
> 

