Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0C0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/2Xaa3Dzt+5ztTkftxM7MuahK+LJjUTZ502uY5Dxyc=; b=miFatZerQ1h31MCkE2YcjiwaMj
	uwv3iggET7CUWzmd0kNKLslgS/I4hBeymv3fKRWdmESg42Ivrt1hupUqYl/jQdo7LWYlRKRmbiCn8
	0j6vZmV0a6bAVnwGhPN48xhKmcFTVNw+7MLib0+f9ji1iSs0xHYV+LxXvGWfBGT1CTxgz+3n9XdnM
	RqxXD/0C6sFJQIa9yQE4i/8N4SM4C9sbxplno9ZUB8KVWMgQ1vOQ4ogRLgW6hv39LVr/aVdGhLtA/
	WDnSGst0RTHqhGtdW1aCZ+JKl4hF2ZtOzdE1vyz2UuS/8kZO0qcYLCXKP0lendz741s7Jni0VD4e3
	lTCdRqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLzw-0000000EqPC-0fAS;
	Wed, 11 Dec 2024 12:39:24 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLys-0000000EqJ3-3JOk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:38:19 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa6332dde13so959188666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733920697; x=1734525497; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/2Xaa3Dzt+5ztTkftxM7MuahK+LJjUTZ502uY5Dxyc=;
        b=LaWs2SoqfEEYFpOMoP2B4KMd1+Lm8NzYCo9Demm6MUsO2MjOD88G44A3fK9OH34oxV
         jinJEm+3qr7b8lWSiQGMJSKvyMxgK2jQFT6m1Ksd+K2hgSGbTXSjBVBrxtem3L7zO9zB
         68PNHAGL8APjA410nlWOe6PA5R+r7V4TKYqlbbqu7tApTAh7OMlB+QhEWvSU3gLwkoLi
         Dh5lXgLxt71E1VEMR/jfSjh5aeUOdc40oQpC3M7ISjybwUEn4Et6GpzqRGGRuKb+fqBy
         7PZKNfF1I18LV4fp6gJ9zPuB+6Wbw59RnXLhaenllPLOdmyOHgnnqsZoRx0eQCJXiuPH
         pABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920697; x=1734525497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/2Xaa3Dzt+5ztTkftxM7MuahK+LJjUTZ502uY5Dxyc=;
        b=kYXqL+WWMdY2h6sAG3kVrWdItld+S44sZ8kqBxPFK6X0Ny2IAyw5oVGQb2s0ThgJeM
         J8X3hI8y5nNwoaVVztYxn814XA04Bd8LmstMAnsIRz9DPfGwT6I22W6dXdfhwjef6OVS
         pTur6FHWHjibCRqydnLk6DSScqgJL4M+GHxub+jg+B+pW03rIq0J/O+g7c/T5RLt5TIB
         Die7NltPuWOFf1fRPX6xHCN9qh9leSMmvpQqL0Kg21DhlLzqSOkKywYhGoEV9GPMx5eS
         MfOkUNoqgJJq020EUKjdPZGTdioQRs3+8LmfL4LGjSBUBZ6G7O6O73ucEgs4tZ8muCiJ
         DIug==
X-Forwarded-Encrypted: i=1; AJvYcCWa0InHFmKfQfCAxZDx6KujhqvOu3qsjuhe+loDDDC/T/aXWCxY0RLm+fwOFP1t8KEdA0aZi/umN801DpYUVhc8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1VW+KNJyM+X3fxHIwcwSTbgIKlAjONDCHALgIfWpPhzibGPJD
	RME0koF9psnBeAK1VI7f06pK51RIYQgCta0td7xDSjwwt1CmCMAtkO5RsDsJvQ==
X-Gm-Gg: ASbGncsXaYMNwTAwLUfaHxCy/xyrlrvwRWZML+ekkZRRK4qyIlsjkBA3wyk7nC/SN1j
	7Hs2kSW20qxb7F8s4g+q9wAJUTXFzoUTTWC0EN4YM0L/ZHoDhMwGrLF8gGWd8IwsMp2IspURzek
	FTbtS1lfcivaiYBw7467k6/2dHahnHNJEz8e/s1V1jh+lMTBtk4pZsCa8SOXi6YjlBhGcfIhNgD
	gjeFSPw4V2ivK8xnQStIbefsi6SsCLpi5j7xCQLbDJ4acSM/DTyO6lal0AXRP21G0/978x7yihQ
	6cpt9lQGl62C
X-Google-Smtp-Source: AGHT+IH5ipgPbbdkuBNOvIujiXUCRr4dV1jLAa3zBl9FrLSEGeuaXMb+t2LT4GmatSEIkAmek7cOMQ==
X-Received: by 2002:a17:906:2921:b0:aa6:33cf:b389 with SMTP id a640c23a62f3a-aa6b11f648dmr209782166b.34.1733920696526;
        Wed, 11 Dec 2024 04:38:16 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a7e199aasm214057766b.28.2024.12.11.04.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:38:16 -0800 (PST)
Date: Wed, 11 Dec 2024 12:38:13 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 09/14] KVM: arm64: Remove redundant setting of HCR_EL2
 trap bit
Message-ID: <Z1mHtVJ4f7_N_wk4@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-10-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-10-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_043818_823070_A5C3227F 
X-CRM114-Status: GOOD (  15.89  )
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

On Monday 02 Dec 2024 at 15:47:36 (+0000), Fuad Tabba wrote:
> In hVHE mode, HCR_E2H should be set for both protected and
> non-protected VMs. Since commit 23c9d58cb458 ("KVM: arm64: Fix

I'm not finding that sha upstream, in which branch is it?

> initializing traps in protected mode"), this has been fixed, and
> the setting of the flag here is redundant.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ffa500b500f2..cede527a59d4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -57,9 +57,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
>  	/* No support for AArch32. */
>  	val |= HCR_RW;
>  
> -	if (has_hvhe())
> -		val |= HCR_E2H;
> -
>  	/*
>  	 * Always trap:
>  	 * - Feature id registers: to control features exposed to guests
> -- 
> 2.47.0.338.g60cca15819-goog
> 

