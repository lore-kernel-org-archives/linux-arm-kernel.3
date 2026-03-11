Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570871062892
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSaBdCQfIX4ykm/kooU6o0hfTQH51S+BH/0JwAXTVxA=; b=wJz+thq//yQC5vCMq7H/Gm+VkT
	HrZWkT7tdYSp7htBLysD8jostwVUpIe6SQm7CI+jO4UwrREY6Ec1viToiDs3x2FCmgDhcITE6n7Jb
	ZioJrabatvSeV1XsmEXDou1NLrYPYcAOTnYJGI9N5lZHGXk5lf3ljb1/3zxgn9lOrUERb+kAmBLGG
	bsbQaeV4ZjM59RjySBJ1NMGvX1r3qHcAmlG8+xe4Bn662kun+KDfQl4IBKeZlxc8qlEC8Nu0hIWdN
	jRY00kacbbIW5GFDQb8Tw9Npi1PQC3pS3ChPKYTw3eK07IPLuEWtIFPvsDSIuqfDkPBhySFS07V8i
	4VCPq+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J0C-0000000BaXP-1cvD;
	Wed, 11 Mar 2026 12:49:28 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J0A-0000000BaX4-0rS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:49:27 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509069a7a7fso571001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 05:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773233365; cv=none;
        d=google.com; s=arc-20240605;
        b=WdGjSSLtWZMi4VG30XESxEkwmVhMSYGkKGzIDu/J/Lw6NLmP9tx+DASqD0W24Zn4md
         dfmP74EOraEEzemnTbY+wgM+Wra1CnQEefEtmmUWVPtvcVotz3upX5mvO9f3WNxEbIbL
         quyAa0yfQC9UmQF3SepNAkddYWrjaX4j4QaJs9mBiSU3tBTHZmJ5Go5mCeaNmioc5dQg
         Qa1Rt6jkOb9e5S2t8poHaqT3n943mkRuq76Q7EF785F2D6togaq39wp9jSsZOqT9Mcjc
         kPPTItQCHwvMbDEdivyjzZBjj5dSkGhlPsLXRu5NSsrG74eboZetVu0yWDf37dEFcjxo
         9zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GSaBdCQfIX4ykm/kooU6o0hfTQH51S+BH/0JwAXTVxA=;
        fh=wHaB9ATvyHYpMs6SaeWEM0Mv8oM9nVrpuW3E/tafqK8=;
        b=Hx4zZQOkt3rNu/F1ljLH3sKFGyhBVLuINvuP+OE8/i/1JWe+VW6O2UwRH3FxJP6IXj
         loFgJP2NfoQqUDMZxGQwh7CTWglfYyZNd06LTnU4qHV9e1DAdsc8SmWlq82TaidVZr5d
         LOsh//3pf9/oQRWt0bnsD0fSfpgNfusv+W7YGamvNq/393aEs3KcuLOIIfWBgMjIB67J
         HHc+Z29B4O7q8n9weJpTT6BCgU9eQPl+ZtGvqPTZ4Mwc0IXdm11WbGVYk0LBE99OaLfu
         jhHzjQ0prS9NF+DwYA7SOJ32tG5BsqYEAA7wyGwX+8QG5b/8SX5mLVidHRLa651LeueI
         EpNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773233365; x=1773838165; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GSaBdCQfIX4ykm/kooU6o0hfTQH51S+BH/0JwAXTVxA=;
        b=OjlTpQOj1uSFiPI512KG6myaUW1tSiozQXEjjhb8HpPEQWUSExjZ2vw0Aw5v6JQGfh
         W2k7S44KteKvbofeXdtEOAkURv51ZH4RwVklHUd+XsMiQoIocuXfeR5oL9k/xOeHcFi7
         RJAZOKwKpDiFT9EAQdjcDiWraIsJ/W2ZjVgMW6sAHkFrKOlJyUlauYuqWEqJt9rplZ4u
         CoOOXoz2o4Av9bQiUpdAspaK3xy0wze1GrHX8EPg8iM1/MZ2XgVNSs9hf6+54hOfA0r+
         /Az5MFL66Za+FpD0Qudis7tOtJDfONLGqTt0O2dm/ipgpjyWjz5XBTe/bdUgbLkhRNZz
         N+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233365; x=1773838165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSaBdCQfIX4ykm/kooU6o0hfTQH51S+BH/0JwAXTVxA=;
        b=PnOyhM++FMdJ1mYLjwi4L291qT+fcSUgtQdNpImMPLDU56CCVT166zE7Gq/StjSci2
         2HdmqOIMddsCQ4NqhlqqrthleaT66rjP1Oa/TnmQ9Ze8vkgrj6BLYobiSKQKRhXizRzs
         ZOx6aEgfZVOhrAYyBhT+ALS+SXoGZf3HU5XLQD+IZLH4G4SkkH98YuMHdGoEqaVA+k+c
         FT7atbHlj63hgunHrRUdgSpfpO241CfEiih9CCDH0IPl9nNd+S8pC4XOhRbxq+tv9aBM
         oUG5J6coIiHfNMw9XzC/vyeClznvUNa9IcdwQ8GEBdUhKKJw0GZiK84dEYbrLWC/iK/H
         anrg==
X-Forwarded-Encrypted: i=1; AJvYcCVBz7dZ3tZCzjEVc+0Li5TEusZBHjfgnuxjUL3kAd24wRSzJSAfzJAnvwmyXNibO06GZzHN1hivyUn6UyTMhNRc@lists.infradead.org
X-Gm-Message-State: AOJu0YyKYL+RoW+AQUWYNpbBE43T7OuZ6pneCrePZ7okYRDm0uRD8W+r
	LUTpx1+ILE7u4rb4bm3HpS67Yg6eVJx0HIrke+HnvGFVXYzkwkfAi9EqS/zjlraSMOlASZMHShj
	6RjXfGyMm2aUtAhKZSLTPxGXsaYOSZK9Riv71+eM9
X-Gm-Gg: ATEYQzxQiiAajYbED4OnQG1NBgelsOUxzsIsilDlGEcY4Z/8ND+Aw9fvlRx4faO0XUv
	fnavjUIU1YHDyEaBfyiii6WQ4zC/gYQIV8GbBjoVU7mkX4Sa3TlOfvx7lNR8gUgVJx7Loh4Ixlu
	aD45ntEbTxhv4CrH/paswscf28Vuj59MWIbO364I50/yJo1+ukvYFPvN8jopZ59R2NpjU5U3aO0
	+UOcxHLnJUvPf4gMJ+9etUd4cvOuvM0IiLh29P6GlMHjJZjoS+WmeVOslXY2I0EJKR0hE/cUh9Q
	2Ac52+d1tYv2V8yEouLyMEOCxnu9utOZN3F5Ww==
X-Received: by 2002:a05:622a:188f:b0:4e8:aa24:80ec with SMTP id
 d75a77b69052e-5093827a1ffmr13477151cf.14.1773233364451; Wed, 11 Mar 2026
 05:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-2-will@kernel.org>
In-Reply-To: <20260305144351.17071-2-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 12:48:47 +0000
X-Gm-Features: AaiRm507dMxugKBWMEcPWC5syr4fU1IS8EgUvWNIOKeQMcukExaumFF3n86UIpM
Message-ID: <CA+EHjTw2W3d472j0ywobH=4Fn6jXZBZAKWkBh1dJPA=Q+tTCLw@mail.gmail.com>
Subject: Re: [PATCH v3 01/36] KVM: arm64: Don't leak stage-2 page-table if VM
 fails to init under pKVM
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_054926_270234_C581002C 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> If pkvm_init_host_vm() fails, we should free the stage-2 page-table
> previously allocated by kvm_init_stage2_mmu().
>
> Cc: Fuad Tabba <tabba@google.com>
> Fixes: 07aeb70707b1 ("KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()")
> Signed-off-by: Will Deacon <will@kernel.org>

Thanks for catching this!

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/arm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 410ffd41fd73..3589fc08266c 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -236,7 +236,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>                  */
>                 ret = pkvm_init_host_vm(kvm);
>                 if (ret)
> -                       goto err_free_cpumask;
> +                       goto err_uninit_mmu;
>         }
>
>         kvm_vgic_early_init(kvm);
> @@ -252,6 +252,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>
>         return 0;
>
> +err_uninit_mmu:
> +       kvm_uninit_stage2_mmu(kvm);
>  err_free_cpumask:
>         free_cpumask_var(kvm->arch.supported_cpus);
>  err_unshare_kvm:
> --
> 2.53.0.473.g4a7958ca14-goog
>

