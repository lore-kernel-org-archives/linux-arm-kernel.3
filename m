Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E049FB3CEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZNGZDhto4jkAxNh9++YfrnwQanqMAXiu2o8XL7KzB8=; b=4bkL3WJp+UwScSmOWJzk2UKGTm
	zX1I0BjJX7+TLo1kR/3WYMlR2fEcJojZXUfFSnWQzzxbGMNFsH9GcAFCXYMD3DbG8rnuchBC1EWQy
	WIjetq/JLf0bvDiGxrXETVPpOBiXYz+2WxXAVZEXqinXYa48rlcNtsfmXws44SG30D37SqwcBOTkL
	5800Lpo2QAdddQYbpAwcSemk6HgwRdnT/gu60vQVABbZLgiB9VAAJyeeDfgfwJN6oVSs4I2pLRFsn
	tc71oLW2U2XTmTi7BBu9FEcCXUu2K8e4sjGh95f2ez6n/D7H0DYe6PryTFCA/FKXeqGk7+B4RJsAF
	oJt8LPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w797O-0000000Az1g-2xPS;
	Mon, 30 Mar 2026 09:41:10 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w797M-0000000Az1I-2t7b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:41:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso40505881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774863666; x=1775468466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZNGZDhto4jkAxNh9++YfrnwQanqMAXiu2o8XL7KzB8=;
        b=FMTbW4KJEhV5H7SbjZsMB7UpzbkauqliI4RAvYTq0CQ8CBc4dJCppNHdBRxJdwdwGx
         u4jSvZS7YgThBTyCz6VkmVMoYk8mD3H3zjcZ/t/ajdVIKKYb9254Tqf0kdYGKMgcqLBo
         70Gw45hzDTQ250Fsymig25M02q+rdkqsvYkp4Z0UdRKR9ZNRk1UUwnQC1r4Z1J+Xwr1r
         +qDwyXeYrf43qqMmn+7yGAkOJS1Y5qzAHKoWGLd2HIvF3H9hsp3xeZQsTA3stjpTtM4L
         tjP3Xs8wKgwncYp7fLzBLRV0gao4NN+/PMmxg2vsqATgSk3fehPaA3mU0OTLGSB5OiZI
         e20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863666; x=1775468466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZNGZDhto4jkAxNh9++YfrnwQanqMAXiu2o8XL7KzB8=;
        b=IxnK1s+y3DuO/wjxfS0+zf44ax5Ckdw8EjFQKHjjTFZSI6q5imwsRAYUr015bBlOci
         wQO4kbGdM8juLfHV1dNQ38AP2m5LLSXEzfonNnovFx778b1rhiW9Vw0T2D8a/sBmrrdA
         G1EHH4c6uHrj+kfgsMZZ/4qhlSnTH0bQsb+jqwAdXfrtgIgXOUVEayQUoEjZv8mLsj2F
         B9w/8jbpumLIM1nfXGZg4l++7AR9LlCoLNT1CjVzRSqPAvNtNJSFvmbQR4jCQxzsERCQ
         8N19I0fU2lsSkZaJKgvkOejmuzBKwtUgC4+nEl6sq2XP2nzZivEfE8mzdnMvXQI+OyP4
         umYw==
X-Forwarded-Encrypted: i=1; AJvYcCV3OueU5OtHcovDVd3ikdOwQjl+x1sFIam0Q2BpOUtwqu2elWLS0kxba37JyjXbpkZ2K2Vb9roVZ2FURHMbsWrB@lists.infradead.org
X-Gm-Message-State: AOJu0YwlrPz5vDvQZoM+TUsqMqVsSr6Uxw/1tAUqbXv6pallwusgKKFj
	MCqqB5nUqeJyU2aVxuSk6nD+iOqB2XZ1TbUNtxIpvK6SE+ussRa/muIhYyczpzdNIw==
X-Gm-Gg: ATEYQzxWlN/91jaoXMnYFWIPZ7L36QQH4aiiF8RllZiyIXbiQv7gU0JlS8RT1e0vPAQ
	9VvJSa/2v5KFSxehekfjh73Nv6Nuyf8hjX0pSz9xjUgMbAUu4NeAIYM2kAKVDT7V6RPL4/kCuar
	Pf+hfNssRTwuW1iYs1hCzkLSnXPak2tqHoujAT2PBYC2wMcHIZiKKdE9kTucV8oaisl+HPvwUZe
	fzsRiEDafH+OQbuO8KgtBfkWwWWq0cpUPH0ciPPFVuiRcByBFZtiBq3+5fhuMuUOqRd/o99UPC9
	cWlo+WpnR3QRu5g/v9gJ4hDFGxk0WeBZzTvby1LAJ14UTQVWia/0CnpX89oXp7Z87ofahshO2gu
	alLVBS4uDqsYoYo8sWdOAdBz+Uf7tA9VlcANAL6803KY5O9LYRupof5Kz0kbF41OgWq2XWTCR7z
	jys/t0T3PTHv5urzDUCMaexd59/OchQGXG+C1p32h9ZmcKSyN3Wkm/KiEgoFppRL1ZZw==
X-Received: by 2002:a05:6512:3f0c:b0:5a2:7a31:9194 with SMTP id 2adb3069b0e04-5a2ab80d971mr3942218e87.19.1774863664954;
        Mon, 30 Mar 2026 02:41:04 -0700 (PDT)
Received: from google.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f1dfsm1563489e87.79.2026.03.30.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:41:04 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:41:01 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: pkvm: Rollback refcount on hyp share/unshare
 error
Message-ID: <acpCq1qZCMFqocs3@google.com>
References: <20260324172757.2147153-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324172757.2147153-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_024108_748517_1F2A08FF 
X-CRM114-Status: GOOD (  17.38  )
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

Hey Vincent,

On Tuesday 24 Mar 2026 at 17:27:57 (+0000), Vincent Donnefort wrote:
> If one of the HVC __pkvm_host_share_hyp or __pkvm_host_unshare_hyp fails,
> rollback the refcount to ensure the hyp_shared_pfns tracking reflects
> the actual sharing status.

If any of these hypercalls fail I think we're still in trouble as
kvm_{un}share_hyp() work on multi-page ranges and we could leak pages in
a borked state if we fail halfway through. And failing any of these
hypercalls is also sign of a bigger problem somewhere else so I wasn't
too worried.

But if we're going to fix this properly, I'd suggest also improving the
error handling in kvm_share_hyp(). 'Fixing' kvm_unshare_hyp() is a bit
harder because we must tell the caller to leak the data structure that
was shared I presume, so maybe we just keep the WARN and cross our
fingers :)

Cheers,
Quentin

> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 17d64a1e11e5..0fb41d2c8b44 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -493,11 +493,17 @@ static int share_pfn_hyp(u64 pfn)
>  		goto unlock;
>  	}
>  
> +	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> +	if (ret) {
> +		kfree(this);
> +		goto unlock;
> +	}
> +
>  	this->pfn = pfn;
>  	this->count = 1;
>  	rb_link_node(&this->node, parent, node);
>  	rb_insert_color(&this->node, &hyp_shared_pfns);
> -	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> +
>  unlock:
>  	mutex_unlock(&hyp_shared_pfns_lock);
>  
> @@ -521,9 +527,15 @@ static int unshare_pfn_hyp(u64 pfn)
>  	if (this->count)
>  		goto unlock;
>  
> +	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
> +	if (ret) {
> +		this->count++;
> +		goto unlock;
> +	}
> +
>  	rb_erase(&this->node, &hyp_shared_pfns);
>  	kfree(this);
> -	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
> +
>  unlock:
>  	mutex_unlock(&hyp_shared_pfns_lock);
>  
> 
> base-commit: c369299895a591d96745d6492d4888259b004a9e
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 

