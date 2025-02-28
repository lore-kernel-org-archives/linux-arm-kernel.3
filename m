Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50283C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea7ysfoGL0hxym9kuH3xIfg8V89PAft4k8+18YntGKQ=; b=U9kf+AvWoNX3Sws4NA7DO8o6KV
	eOCwQWgpS6+V9mti6Ld9mOxt+yazzB+QC22GPUwvqKSIluJpiHFSTy+ZVFk7sH7E+aC3vVTZiAXBt
	zs6+R0tIg1ors4MFZzQAU7+MzD8WGvlY72txbRwgWJr0LAtAE9j+A0AFp/dbpFk0ZNVTCPZa1w9R4
	Pl872jds2Wf9xCj5f1bSpytermxMJD03IOaglV/QDj//pGPHzTmalzMyHSvvjbM5S7g9x2+LQFfDu
	RuAPdQfU4OL3p8BL/AyvQkFlpXud74gmjx2NXIBeSvcbxpzgw72GtHlGB3VLNPkoXspv7xsYwb/to
	0NN0J+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5kh-0000000CJNd-3qZQ;
	Fri, 28 Feb 2025 19:10:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5hL-0000000CIiH-3K8T
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 28 Feb 2025 19:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ea7ysfoGL0hxym9kuH3xIfg8V89PAft4k8+18YntGKQ=; b=apBAOfm4SFqlT0vPM8v8yVW1w0
	yFKpuii+qR29COp6fXfhZRU9XQTvyOkyP8RMEYXbzglrALKJxlsa4f2dfC8F6YyQkX4N3a1jN+NyD
	oBj+ka5izc4mLL4aUhlJgMjyQthgm0FFNbWxC0TXYj2cVt/s4F0STV5YO36LWJlU7X0Q51OuVa4Md
	Yx1nvvihZS+bXepPuPuXxyWcVQczLipa75wLe6xpfkyOslUhkSZh7mj+97xbtrZxl1ugY9twgFbx6
	iGwGd6keBmOcpD7U3iaxkvvcNbvc6Xu1R15hzjd2ichhwPo6UrH7KtgpYanzpG69w5YLpSR4x9Xkv
	FgdUZH0A==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5hI-000000041X9-2rwL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:06:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abb81285d33so465267366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740769611; x=1741374411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea7ysfoGL0hxym9kuH3xIfg8V89PAft4k8+18YntGKQ=;
        b=fVlqwV01Tvp/XdP7fkKb25Dp5z9EB9e2XBhuGqpLaAsVeO4+7ZrqGK9RrVPJrS8QUX
         bZAaMUsQ7OAqAXZhJQRL6SRCd+DDQyqdXZb0CBq2YQbxg/Wycl6DeBneinDQ0IkQmfGe
         Ka8JKVdW79/2z5yr1QLPxOJFQ+9tcH8srnhJ9FTr5vdJTjk0adjsFKs9EL5aHIzJixdY
         Imy0j5G2N9lcRgPek2x4jLDXInr7QmNtPgZRw+SebgPepVSIiuEFkg/STjg88i5decL7
         ZXQQZ2X8EnklmW1Wl5OfNTGIPGxW9+IA5ksmVrWjkmJ3ZOto94CyvFTd1QtNlyoPpfgA
         VxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740769611; x=1741374411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea7ysfoGL0hxym9kuH3xIfg8V89PAft4k8+18YntGKQ=;
        b=GCezfFpE5FoRdCKqLuBv65Md3FBm6ytXev14lx3Wfzsm4/7pQZb4lu2fdsXOaZuxe6
         CVA9Nq2PtCSC/Y2kdxK1Lt1YrAG85VHjCiEO72kUdJG1C/+4XsV/juhxVnUS3mP5j1Py
         zF6Ef1OhjofgVarQYQqiayZM9qfkjBdgzpi19SkQozkeA/wDDt06uy4Y7ljM/1E0+Qhc
         k1YHWUOMTTSJq3PT2okcSXgPWLC+1eEsyRZXnq5KyQ7RRqobXhKnEZGmZjzJLZD1l/QL
         mk9ZSZLwZq9mDxpawXXz/sqt1M89aa1RUZTTElx05tax4Zp8v3e6lpksV+0LZqK3Iv3B
         o0og==
X-Forwarded-Encrypted: i=1; AJvYcCW0v5SEJgjmaacmSJbMSJ2jfbhK2wxKxltI6HExPyRvQSohTW25Tb159BQ0FqTEwDYs0qMcte8xSw+9avbFZick@lists.infradead.org
X-Gm-Message-State: AOJu0YzWgT26qFwJJ2B+EEITjdxb6kE9glGEhdKvmM9PqAQKD7KzQyqU
	b4iD8JSMySf+nefVaT+Sl9O2EsYvwByPAZL7MJ8dKbFwukCObLKAtz4qLMtpHQ==
X-Gm-Gg: ASbGncsbJkbi7p5L697jYn3QANVWGQPtPe/WtuCoYPZBLzyK5N+59olMX0VTG+tKPJD
	rIsX90VBv4oJB9C+5RKXPX9J/oH07siNSoc3WTSUoqb7JXwz0lMYOb4lV1Y29Yl5HZW1dk9SvAG
	BdrB7DAzMpA6ZIdVXWZ7pFJ+Sc79xVbwe8OKyL4UhKMqHGZN20nyvqbuoc8TcqGdMcmDOokmcCY
	8LlYHVX1xMLD7sdvdfd4mXKmwdF7wf12jGl/0SkPCuZg8h6+AA/tLXX+IHtuG4m35f8/LQO1Vok
	mQyVliDZGHyPiI2OjQKd2HK9eCXOPOsh0n6UpY1+NGG0Jkh7csppCciZBSAFsL0=
X-Google-Smtp-Source: AGHT+IHwpQw241bZAJUNRa/tRbDYtqAe8cu3t+94vTg5nA3MIoSIYj/LClqOfEXXyyELcdm0kfuXLg==
X-Received: by 2002:a17:907:7f0f:b0:ab6:b9c0:1ea2 with SMTP id a640c23a62f3a-abf261f2529mr471016666b.25.1740769611173;
        Fri, 28 Feb 2025 11:06:51 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c1165e7sm333069566b.82.2025.02.28.11.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:06:50 -0800 (PST)
Date: Fri, 28 Feb 2025 19:06:46 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 2/9] KVM: arm64: Add a range to __pkvm_host_share_guest()
Message-ID: <Z8IJRpoQUoGazLku@google.com>
References: <20250228102530.1229089-1-vdonnefort@google.com>
 <20250228102530.1229089-3-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228102530.1229089-3-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_190656_917907_87832FA9 
X-CRM114-Status: GOOD (  17.93  )
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

On Friday 28 Feb 2025 at 10:25:18 (+0000), Vincent Donnefort wrote:
> +int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
>  			    enum kvm_pgtable_prot prot)
>  {
>  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>  	u64 phys = hyp_pfn_to_phys(pfn);
>  	u64 ipa = hyp_pfn_to_phys(gfn);
>  	struct hyp_page *page;
> +	u64 size;
>  	int ret;
>  
>  	if (prot & ~KVM_PGTABLE_PROT_RWX)
>  		return -EINVAL;
>  
> -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);

I'm not sure it is safe to drop this check here, see below.

> +	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
>  	if (ret)
>  		return ret;
>  
>  	host_lock_component();
>  	guest_lock_component(vm);
>  
> -	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
>  	if (ret)
>  		goto unlock;
>  
>  	page = hyp_phys_to_page(phys);

Phys really needs to be a valid memory address here for 'page' to be
present in the vmemma -- dereference right below. So we can't rely on
the check in __host_check_page_state_range() sadly ...

> +	ret = __host_check_page_state_range(phys, size, page->host_state);
> +	if (ret)
> +		goto unlock;
> +
>  	switch (page->host_state) {
>  	case PKVM_PAGE_OWNED:
> -		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
> +		WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
>  		break;
>  	case PKVM_PAGE_SHARED_OWNED:
> -		if (page->host_share_guest_count)
> -			break;
> -		/* Only host to np-guest multi-sharing is tolerated */
> -		WARN_ON(1);
> -		fallthrough;
> +		for_each_hyp_page(phys, size, page) {
> +			/* Only host to np-guest multi-sharing is tolerated */
> +			if (WARN_ON(!page->host_share_guest_count)) {
> +				ret = -EPERM;
> +				goto unlock;
> +			}
> +		}
> +		break;
>  	default:
>  		ret = -EPERM;
>  		goto unlock;
>  	}
>  
> -	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> +	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
>  				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
>  				       &vcpu->vcpu.arch.pkvm_memcache, 0));
> -	page->host_share_guest_count++;
> +	__host_update_share_guest_count(phys, size, true);
>  
>  unlock:
>  	guest_unlock_component(vm);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 930b677eb9b0..00fd9a524bf7 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -361,7 +361,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  		return -EINVAL;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
> -	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
> +	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
>  	if (ret) {
>  		/* Is the gfn already mapped due to a racing vCPU? */
>  		if (ret == -EPERM)
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

