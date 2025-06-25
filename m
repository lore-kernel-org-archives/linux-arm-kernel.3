Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB99C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiG8sr1KaclHSbf6egC7naRu8LsxzyFDngHY6EqehU8=; b=V+j3WDDQqqgiA8yvfBssrGpZhO
	NKQbMoSjVbLe+MSNilNFS2+HYL+kiW7vN+Cnp4L41ao0uVs6CFFsp2ttiSYRJYGyRquJgZ/JkwW4/
	RjAGLA5Eo8TNy4VBdLnKXSFP/lP77m9AZiuY0G14sYtnfyZa+x1YDxEqKLfurFLyaLXgo88/RqBlJ
	Grr9k6ks1WZs6eI9WNXX+Er0i4PNaF9q4oqcRFQkZXpoWC1zLHC4wZ7BrtC9aSN5FjcKKw2IQoNyg
	zVs2jVm9cKec75XaYbxPd4gdHY9yxWM9QYBOyzLzsWHJOcVSCSHIKgny3DEm/xIigqpwjjVoKP4dZ
	jEXjXHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTMQ-00000009Nri-0jcA;
	Wed, 25 Jun 2025 16:52:34 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUP9U-00000008bw8-0vds
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:22:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so3155093a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854174; x=1751458974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiG8sr1KaclHSbf6egC7naRu8LsxzyFDngHY6EqehU8=;
        b=VHR7x3cZsOtxAdyQnax+SZQwSO5wtUIkKPTajSamo+6ZE/2u0F/TcNXzRpIiI5PTWy
         gG4tW2FPzL3Fr8EZW/Gz+6CnfShfuiCu6vYFIAolsZulLR24sls4wLnq34otHgKzTKiU
         nISrrO0sM5dwvRvUmVJlgsUUD0QipNkWiM4RzsBhvbOCGrzfwT8EU0UuoW+p06XXpARy
         YcoKcnouErePZfyt3rH97xNY4YliHnELo5yYk9b7AJsUo+7zVVadWO+m82likQ4AKr9J
         Ubyuq0PRUngSVTYM5mLv8X5KPf57wz6TKTF15+1cRvZb5HsDzGDLehEjyWrVvQdUqWXi
         WPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854174; x=1751458974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiG8sr1KaclHSbf6egC7naRu8LsxzyFDngHY6EqehU8=;
        b=B2nhtAE6FaB0eMaRpvxZR1tFnQN01mwQyjYVGQJIZfQuoQPe0GipCz+Xauzix4g3O4
         LQ5uWEoQQpt/1ibBw68LNWpKKI4G7UVK26r7fUT9G8TS+ZVQlNLgnfIrYHlQUJUwj/Gs
         Aw1qV/xDD573xPAHyCtXepUrqoxPKRBviHKXDFE25jWWJL5gNtILSfg3y9VX3cI6HGfY
         8MFzJaKE8lBqZIUl1XGVQmCWkjWO/sU9PtP5KhWu3V5lf2Z43L0Bhuk+C7JXXGzIO0Qs
         GHWTxV+w054OrDefNCYbtfpN7heBbOqfQgqnPsSGschMt9ofZa9eTF9AffTkQhAmbBBK
         5NtA==
X-Forwarded-Encrypted: i=1; AJvYcCWfT7mtp5k5fuSHn0JjbSaslT4dHxz3zffe+aMr+2MUa7hoIYAmzo6wTrjm2U1ZPxwbQZnz/rHkajeVe6Yz2D1p@lists.infradead.org
X-Gm-Message-State: AOJu0YxVbI4T954Y/UeBlVV99gac/gqnzsED2n6Kd78m+318CyrxHIq5
	1nU+rLRG876MT2ue4YHhnNwhuHzXt+W3FCN9ZTFJdR+T58OAgastTMeJESSYCX839raXpJUl2br
	/9p1UNS4a
X-Gm-Gg: ASbGncviYfL23vGKjuqrroQXFoNrDOK+vu2w+id5OfFXZZvX6Sx73YJVLWtPd7ZIdTH
	anRoj111dqStweZ5q3SNuyamnSioR9bkGfFN0mNqL0xY4ZWOKc65J7hiP5MHsHlg7V1+VvhNzxD
	fl1+S8Q0GJe5xZk1ci+DDOfU/Ryj0jNcqE8a22gIoxq5XrtdL2+R7OyX1/7nXjkE8DscDtg96wH
	XY5RMjYIkmno8d1aer+84kJSEL96OBG81MxiFISAu6POKFjk8mqVuO7LUKTNg2zFITH7UAbcjNy
	OKww+6UIsVqf8+fBA9n38AUiXvJpiojP4n4+oMEtHl9mTGcVHdW+5gQfdlXKHS2wSMHKuMtVNWM
	IOO25/Wfg2LMh63fYJ4Op
X-Google-Smtp-Source: AGHT+IGcp1aoFc2EzYV/tl3RR8TA0Ug87fzOHVR52rNGNEdbDQoI9r/5HqWjJE0hOyK5C5jflubayA==
X-Received: by 2002:a05:6402:27d2:b0:607:ea0c:65b2 with SMTP id 4fb4d7f45d1cf-60c4de78e8amr1953498a12.31.1750854173425;
        Wed, 25 Jun 2025 05:22:53 -0700 (PDT)
Received: from google.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4681a8sm2391073a12.38.2025.06.25.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:22:51 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:22:45 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error path in init_hyp_mode()
Message-ID: <aFvqFdwNYI0-3zWY@google.com>
References: <20250625113301.580253-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625113301.580253-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_052256_276246_D6C5A795 
X-CRM114-Status: GOOD (  16.89  )
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

On Wednesday 25 Jun 2025 at 11:33:01 (+0000), Mostafa Saleh wrote:
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 38a91bb5d4c7..5bb36c3b06b5 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2344,15 +2344,22 @@ static void __init teardown_hyp_mode(void)
>  	int cpu;
>  
>  	free_hyp_pgds();
> +	/* Order matches the order of initialization init_hyp_mode() */
>  	for_each_possible_cpu(cpu) {
> +		if (!per_cpu(kvm_arm_hyp_stack_base, cpu))
> +			continue;
>  		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
> +
> +		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
> +			continue;
>  		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
>  
>  		if (free_sve) {
>  			struct cpu_sve_state *sve_state;
>  
>  			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
> -			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
> +			if (sve_state)
> +				free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());

I'm a bit confused by these extra checks -- free_pages() should be safe
to call on NULL?

IIUC correctly, the actual issue is that per_cpu_ptr_nvhe_sym() will
dereference the per-cpu pages to find the sve state, which is entirely
bogus if the per-cpu pages have not been allocated. Now, looking at
this, it looks like the bigger problem is that we literally free the
per-cpu pages right before the sve state...

Should we at least change the freeing order here?

Thanks,
Quentin

