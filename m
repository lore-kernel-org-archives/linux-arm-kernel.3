Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D91BCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAgiiNcrQNm379JlHAgcT50PxnyZ9fON8VGxnlQuPrI=; b=gBolvYEwjp0BPODs5es3Xutucv
	qs6es8qhxK6sK4VTHnBXpUvVpSTahuJonFVHHcSDUktdiCS/Y771xqysNC7x5OtCnjtqtDDwLUcxy
	ukeWZA0tZJcgZ6cN8hOl9OQydEFQ5nAH/63+KN3Y8R+pYAqzxT0xe1QqYiUt8BZKK1NJclGsmY4yo
	PnymFKe1csbDnA3bBmu/ppzbXXYIT5a2PQ0JFXg3QNlpMzXzkwKASLKpIHV/HrLn4cNqLNwzKBxSL
	u7hWxEOkkE+qD+5o+zikvKLHXdi1JpGLMLUovShZWJxDZf+XR7bNMYBHZ6RZkKjq01v88HMA/MvKP
	vgvZMKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZKJ-00000002UPS-34tZ;
	Fri, 19 Jun 2026 13:32:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZKH-00000002UP6-3G5a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:32:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso13912605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781875924; x=1782480724; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAgiiNcrQNm379JlHAgcT50PxnyZ9fON8VGxnlQuPrI=;
        b=bZ38Jr//nZksOKhrKBzonBQ7cfe8uzEbA4uFQbYSGEE9d6niJQRDPX25CjMOVk0Vyg
         Uxy9p6HXclBL8/zQWN6GyN5zKsndRw1HfIaY4BsHZNqc1ug+0wRTHQmN8TnfQXx8j0H8
         oswQlG+CjfR8PSEkVzT68SvZ/G9kJKx5PqfiTIoj+8aX3qVQrJxIifbuT+K99qbCL8XI
         dE6xuJipg73O7jcIbfbJiXzcAVUaUt/+QT9imey8pu0su8PM33Cztg0tyAwH41Awt1gs
         sW4lvKJ50obUZXSioHdF4eQbc06MmvIgZABTye72dSpxu5lfcD7WEXq4Dpgfbbqr+y1k
         GIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875924; x=1782480724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAgiiNcrQNm379JlHAgcT50PxnyZ9fON8VGxnlQuPrI=;
        b=q7FWiZAa+1QNvOMadhXhGBL3Ub9WRC5SVeRoFvE6QZfljNB6tLVyKQHbDr71ohAx/l
         AIpW8yxF9CB80MinK9QXiZfBPILSqwu2I3+QGiSu4GPEKCp3ltnsOpwfQihMN2nCJEC/
         5PlV0YvxECCyvi7dtUk4okhiCE0oIoVW+RQOQtfAoREFsywEoxYQyfAsldbHusOOsXoe
         0MYEbHF2kdkKbkP2P4GXPAq3cmsF1u+AjgePIXzQyGmsk1BYmv/KsM6BsTi6wCzEQbER
         trcyvEZjqRyCmC2hraWMgLBVPoXzl/geNVMFsL13/MGIc/ISOU4smKCl0nLi4DNjAnb+
         F/fw==
X-Forwarded-Encrypted: i=1; AFNElJ+BaEWRBMPa7q58yYkbVYO0IVaq9kmylKk/pMw7Q2/uQ0qKIEptW5J2I1sDoojU3qApkxw9XWfYbUjZ0hmRHkfC@lists.infradead.org
X-Gm-Message-State: AOJu0YyLtLD1njetvlwks2osimZSe9J7RPcoKIYvQNuNr+D6xSELgkDw
	sK8SbxRk6DmH6efSFWTgC+VJ07qcEmCkmqE5LXP4xNAgtU30Oyy5hKk3KZNg7NACGA==
X-Gm-Gg: AfdE7cnqPt5OQ0rZ06CYhJLt+y02BG9v4XXMMouKfp3eJa7aY6wxCPnQQNTOICypVJd
	nlQMxLIRUKFm8toC413g0FeTxCy2kKVkDyd50B7gZNTgfpopzloezQu/PYakn7dCBFYNKEre/+F
	k3r3oz+HkJj19gvjg7Jz5uJkvJ0QqKz5mWTLQuhU6mtFlg2fg8OzWaZchWYqzh4EMIxCU0DbP0u
	Ch8QqtNuiNLNzktzXqWJpTKWJaqFzV8X9vGDOC64cA7Zp16iXgilb2xIXJzNS6sgN2uDK6UNFL6
	mkKJ4lKdYrjlfS36TM2Jfon8IpG22Oi/Gzw7iOslJ0S6UnUWQJEmKbTKUlO+QmQTvNuHckwrJ7p
	0gBjjNWIlhYLuubXZq5EP99bA1CMD1FReMcByPJfO0BP4ekF0tGwUtPD0dp0jXTidRgLBvAvzI1
	v39gWfWa+78hPDa6LniXOZ6WUJ4oOfY4nMvjTlQOUWiJD8PuyLAO4hq3At
X-Received: by 2002:a05:600c:21c4:b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-4923f437203mr47993525e9.15.1781875923118;
        Fri, 19 Jun 2026 06:32:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a04b55sm8348813f8f.5.2026.06.19.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:32:01 -0700 (PDT)
Date: Fri, 19 Jun 2026 14:31:58 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH v2 5/8] KVM: arm64: Add host and hypervisor vCPU lookup
 primitives
Message-ID: <ajVEzllsP9OIswhS@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-6-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619070719.812227-6-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_063205_848388_7FD8BF4D 
X-CRM114-Status: GOOD (  26.39  )
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

On Fri, Jun 19, 2026 at 08:07:16AM +0100, Fuad Tabba wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> The nVHE hypervisor repeatedly resolves a host vCPU into the EL2
> address space and validates that the loaded hyp vCPU matches it, with
> that logic open-coded in each handler.
> 
> Add __get_host_hyp_vcpus() and the get_host_hyp_vcpus() macro, which
> translate the host vCPU into the hypervisor's address space and, when
> pKVM is enabled, also return the loaded hyp vCPU if it matches. If pKVM
> is enabled but the loaded hyp vCPU does not correspond to the requested
> host vCPU, both the host and hyp vCPU are returned as NULL. Convert
> handle___kvm_vcpu_run() to use it.
> 
> No functional change intended.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Co-developed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 52 ++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 1d01c6e547f5..8923f594c264 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -212,14 +212,45 @@ static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
>  		pkvm_put_hyp_vcpu(hyp_vcpu);
>  }
>  
> -static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> +static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
> +					     struct pkvm_hyp_vcpu **hyp_vcpup)
>  {
> -	DECLARE_REG(struct kvm_vcpu *, host_vcpu, host_ctxt, 1);
> -	int ret;
> +	struct kvm_vcpu *host_vcpu = kern_hyp_va(arg);
> +	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
>  
>  	if (unlikely(is_protected_kvm_enabled())) {
> -		struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +		hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  
> +		if (!hyp_vcpu || hyp_vcpu->host_vcpu != host_vcpu) {
> +			hyp_vcpu = NULL;
> +			host_vcpu = NULL;
> +		}
> +	}
> +
> +	*hyp_vcpup = hyp_vcpu;
> +	return host_vcpu;
> +}
> +
> +#define get_host_hyp_vcpus(ctxt, regnr, hyp_vcpup)			\
> +	({								\
> +		DECLARE_REG(struct kvm_vcpu *, __vcpu, ctxt, regnr);	\
> +		__get_host_hyp_vcpus(__vcpu, hyp_vcpup);		\
> +	})
> +
> +static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> +{
> +	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	struct kvm_vcpu *host_vcpu;
> +	int ret;
> +
> +	host_vcpu = get_host_hyp_vcpus(host_ctxt, 1, &hyp_vcpu);
> +
> +	if (!host_vcpu) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (unlikely(hyp_vcpu)) {
>  		/*
>  		 * KVM (and pKVM) doesn't support SME guests for now, and
>  		 * ensures that SME features aren't enabled in pstate when
> @@ -231,23 +262,16 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
>  			goto out;
>  		}
>  
> -		if (!hyp_vcpu) {
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -
>  		flush_hyp_vcpu(hyp_vcpu);
>  
>  		ret = __kvm_vcpu_run(&hyp_vcpu->vcpu);
>  
>  		sync_hyp_vcpu(hyp_vcpu);
>  	} else {
> -		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
> -
>  		/* The host is fully trusted, run its vCPU directly. */
> -		fpsimd_lazy_switch_to_guest(vcpu);
> -		ret = __kvm_vcpu_run(vcpu);
> -		fpsimd_lazy_switch_to_host(vcpu);
> +		fpsimd_lazy_switch_to_guest(host_vcpu);
> +		ret = __kvm_vcpu_run(host_vcpu);
> +		fpsimd_lazy_switch_to_host(host_vcpu);
>  	}
>  out:
>  	cpu_reg(host_ctxt, 1) =  ret;
> -- 
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
> 

