Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2443ECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvPD2QlzwFWzsFKSo3tRWtjQG+OHFkXfXTJssyHMdKI=; b=vKwLreHcZcwm/BIqyRjD9h+9uy
	XIzIqoBZUrWq48Urt2q9y+bS7V6xBBS076FrQp7gJ1M/R5+NgYdyZpiXtZEK3ftKqfuLqTUGXS4l1
	yVMeAA/pa5cdtil28eldNO1QbXolwkwpZ8Wgm6A5rb7xoqsRAdTcMOfjJv7/zmOsvHfSCHQ+XPSLf
	qhxuoaMND3qP8l6Xh75cQe30I26UwR3zvpeNMg15d712dPtr1fOqIIYxCpt2kx4DL8bC9rLBYXE0Z
	D8paX4lWa/TBWgbVhZIM7nY+wZAteReFPNnZvtmtXKmG43EPbYsDmlYrq2oRj+yAfD5RNo6Q3g2Z4
	xmavJHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkCe-00000005baI-1fBU;
	Fri, 31 Oct 2025 08:09:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkCb-00000005bZt-10I7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:09:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4770d4df4deso32745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761898179; x=1762502979; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvPD2QlzwFWzsFKSo3tRWtjQG+OHFkXfXTJssyHMdKI=;
        b=PuyzZY+Zk/U21Qtwhbf1ofPSt/uxKs3iL7EYjSVcofYKOzKSMCjKDWXIM/50qYuLRp
         /kg0ar2oaDbQKcCZ3G5UhB2BYRjQ9O/bKWlCMHseOw2Bl1Vwfn1a8V7AkxYCac4CzRMw
         RbEO37ZLzvemaXJacZDVrIVBqXqbDdFpCDD0qOpsVvT+TNi6XMBN3Aqn7Dy4aCWiWYao
         sz0Lkpa3cIHj31lQxTVonhfLfgNuUkZeg97qmy8THzOnFFXi/1amxd9qgX1CS7eAvabI
         7hGMGDSDUTnYU5BDD8/Ssy4m1bivoUJi84hsn1SAR3G39A4Lfnh8iDXMK+koPzkXH6Lw
         2opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761898179; x=1762502979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPD2QlzwFWzsFKSo3tRWtjQG+OHFkXfXTJssyHMdKI=;
        b=olaGvyW1KWFk8qJBSPakyWK9Z2FOCElMp/ZCvZf8AHfjA+ymGLYdKDxdgibU3iCynS
         8qiOpPakgUa1m3emeBdCgQwbY3r+jRuujiWrdlTQkFVftVLWap9snmK4cNw8g3X9R9SN
         UdCcUjMXekrG34ODsmbKgZY8p44jT9fak/riPuEptuv+6dtPgFP2S24lxQGVQuc/feBC
         Y0JoEXz5/I45fMO/ePpFF4391Tjy7rVysqKVYLKBqcWwYM4h25jSlFL2iBf3NxlDRWyn
         IpG4+4cTNbs90HWcTHlfROFg008mYyvIrUDw4qv7wWSNOIIU3l4wl7ox8zh0kzIStX5h
         g7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZXvHlR803GVqQf8O6v/ejlcNOksAaZv586Wh28n6KKnu1FP+bFqASIHRmBuPST0/D/Gs516cwQ08mmJOk1INC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuni6VyT4MBjIvLk8xt5qhSTLvr8bV77wzaxD3eCMPV4NJf9qh
	kWJok/mFgqW2nR45lwWzUrI8UAld/EybP4rQh9EUKvWACXVaxPX2YNzThOKXckGGGw==
X-Gm-Gg: ASbGnctMvWXAzxrwTxh93IFKwumwkm4N9UweoNacK3rclLwciVwyj5UbAzoPN33ZHW2
	AuS7AHYXXAtkMzeumx2Mm2e9CEk9f5QDIN+EogdBuPEkWX+Hp3l0/RPLvcnD+5HJOOiGCwW8E9o
	i0skz7tlX1WjgTdG8ky/hBqH8t0ojBIHdI3WkEa9Im6QTi8eL61c0ZN4qCzpbBL6TmcTMfIqrkS
	CDz4pdeQ47GnKscLowF0ElKH+53cxayoCXp71OIp6xJZ4BcN7VHH/Rw67O/CcxUGTkBrDOpO8F0
	4IvuXNGWg15RtQZp+AL11BuFWyLx0NtbYVzIaHz9ekTQasZHxaLSUzPdC0F0T+zbxUzbhyPgopU
	baKzUtZH/CgL/9PEn4iiV9SSSlUMnM38EdhG3gUJ62YLtv73syh1gqbpFDVaS4vQj0LHPKZU8th
	BDUdDd3ENmxiwIgapwZANR4hL2MQu3JHpSjbIbeji2NagCheLkt3jE3NvpLA==
X-Google-Smtp-Source: AGHT+IEowXI+Xa7Cev+Atw93C9B+sivtK/myXmK5E4UjFwYC2UVYflMXTzX7icRn1YESBGhfSybnGw==
X-Received: by 2002:a05:600c:3ba8:b0:477:1afe:b962 with SMTP id 5b1f17b1804b1-477324afbe5mr1342845e9.1.1761898178470;
        Fri, 31 Oct 2025 01:09:38 -0700 (PDT)
Received: from google.com (177.112.205.35.bc.googleusercontent.com. [35.205.112.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47733023256sm19735575e9.17.2025.10.31.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 01:09:37 -0700 (PDT)
Date: Fri, 31 Oct 2025 08:09:34 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, perlarsen@google.com,
	ayrton@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: fix FF-A call failure when ff-a driver
 is built-in
Message-ID: <aQRuvu8V3woqnqCV@google.com>
References: <20251027191729.1704744-1-yeoreum.yun@arm.com>
 <20251027191729.1704744-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027191729.1704744-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_010941_396247_D1C9C0CC 
X-CRM114-Status: GOOD (  25.37  )
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

On Mon, Oct 27, 2025 at 07:17:28PM +0000, Yeoreum Yun wrote:

Hi Yeoreum,

> Until has_version_negotiated is set to true,
> all FF-A function calls fail except FFA_VERSION.
> The has_version_negotiated flag is set to true when
> the first FFA_VERSION call is made after init_hyp_mode().
> 
> This works fine when the FF-A driver is built as a module,
> since ffa_init() is invoked after kvm_arm_init(), allowing do_ffa_version()
> to set has_version_negotiated to true.
> 
> However, when the FF-A driver is built-in (CONFIG_ARM_FFA_TRANSPORT=y),
> all FF-A calls fail. This happens because ffa_init() runs before
> kvm_arm_init() — the init level of ffa_init() is rootfs_initcall.
> As a result, the hypervisor cannot set has_version_negotiated,
> since the FFA_VERSION call made in ffa_init() does not trap to the hypervisor
> (HCR_EL2.TSC is cleared before kvm_arm_init()).
> 

I understand the reason behind the patch but this is problematic to have
the builtin driver load before pKVM because the hypervisor would be
un-aware of the host mapped buffers. (eg. the call from ffa_rxtx_map is
not trapped because it is too early). Essentially, you will end up
bypassing the hyp FF-A proxy which I think you will want to avoid.

> Consequently, this causes failures when using EFI variable services
> with secure partitions that rely on FFA_SEND_DIRECT_MSG.
> 
> To fix this, call hyp_ffa_post_init() and set has_version_negotiated
> during hyp_ffa_init() when the FF-A driver is built-in (CONFIG_ARM_FFA_TRANSPORT=y).
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 4e16f9b96f63..0ae87ff61758 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -984,5 +984,17 @@ int hyp_ffa_init(void *pages)
>  	};
>  
>  	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
> +
> +	if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT)) {
> +		hyp_spin_lock(&version_lock);
> +		if (hyp_ffa_post_init()) {
> +			hyp_spin_unlock(&version_lock);
> +			return -EOPNOTSUPP;
> +		}
> +
> +		smp_store_release(&has_version_negotiated, true);
> +		hyp_spin_unlock(&version_lock);
> +	}
> +
>  	return 0;
>  }

Thanks,
Sebastian

> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

