Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2440D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Fh53Gd0;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jet83GLP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YSDSgjpQLJHyewcbdkRbRSJusGm4cUM3Dgl9o9009Ec=; b=1Fh53Gd0hFh6SZ
	GaE5MHMK0Hgj8F/mzgQmaqJlwkvokMXVkDyhG1i0lYljOpJf1VtvgyR6cUGBGvoNG9UYGotMIaFsN
	1+DwVWQre3U+4KXJ/jhWf1KKJlB0FYjczu2UNcdk1oZnAARnJ77qX3eFg5TFCF7WFn85isf4POY77
	QNAP3mOvIotGtOV585/VIT172widqt8RqdalCbYT5ZzWx7MlJsGSfiTqpdQ1i7HEKLiRcaSnPkhOY
	DQmiesm/XddMmMAOyvXnLt7pXuJwSxZ13TfZCFUHIaynlZHVfLsloGeZaAoP3em5UuIIITFKS1999
	xvgEhaVcvVEwg4WLvhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6tZ-00000007b6m-2dMt;
	Wed, 28 Oct 2026 16:53:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6tW-00000007b62-2pjI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:53:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 049651756;
	Wed, 28 Oct 2026 09:52:54 -0700 (PDT)
Received: from [10.57.16.117] (unknown [10.57.16.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A7D13F59E;
	Wed, 28 Oct 2026 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793206377; bh=vJ+LPeiA2zykY87kypyN7HwDrT7gAk57eYzbxdUxVq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jet83GLPCj8+yixKuGbe68KlDg4d2iybThkNYU9F6Ea5jitw0eidM9kZcZqQi/3CI
	 wH8bTu5nposSzApqJwqyOjNNTxMt89rNL8giOw0LyOem6IL6V38coDJrAtDRYej3Vj
	 cEYZJPrASJc4Y8RsPiHVO6F6RpxaKrrqmcgFFO1U=
Message-ID: <69288872-2576-4697-a62d-87ab2bcedd49@arm.com>
Date: Wed, 28 Oct 2026 16:52:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 12/28] KVM: arm64: Add SPE VCPU device attribute to
 set the interrupt number
Content-Language: en-GB
To: Alexandru Elisei <alexandru.elisei@arm.com>, maz@kernel.org,
 oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com,
 seiden@linux.ibm.com, yuzenghui@huawei.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
 catalin.marinas@arm.com, james.clark@linaro.org
Cc: Sudeep Holla <sudeep.holla@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-13-alexandru.elisei@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260903160623.315525-13-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_095258_859235_B4445D21 
X-CRM114-Status: GOOD (  16.57  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/09/2026 17:06, Alexandru Elisei wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
> 
> Add KVM_ARM_VCPU_SPE_CTRL(KVM_ARM_VCPU_SPE_IRQ) to allow the user to set
> the interrupt number for the buffer management interrupt.
> 
> [ Alexandru E: Split from "KVM: arm64: Add a new VCPU device control group
>                 for SPE" ]
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---

...

> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index fe45ad4c703a..dd5f80318ba4 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -59,17 +59,99 @@ bool kvm_supports_spe(void)
>   	return !list_empty(&spe_pmus);
>   }
>   

...

>   int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>   {
> +	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
> +	struct kvm *kvm = vcpu->kvm;
> +
> +	if (!vcpu_has_spe(vcpu))
> +		return -ENODEV;
> +
> +	switch (attr->attr) {
> +	case KVM_ARM_VCPU_SPE_IRQ: {
> +		int __user *uaddr = (int __user *)(long)attr->addr;
> +		int irq;
> +
> +		if (!irqchip_in_kernel(kvm))
> +			return -EINVAL;
> +
> +		if (!vcpu_spe->irq_num)
> +			return -ENXIO;
> +
> +		irq = vcpu_spe->irq_num;
> +		if (put_user(irq, uaddr))
> +			return -EFAULT;
> +
> +		return 0;
> +	}
> +	}
> +
>   	return -ENXIO;
>   }
>   
>   int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>   {
> +	if (!vcpu_has_spe(vcpu))
> +		return -ENODEV;
> +
> +	switch(attr->attr) {
> +	case KVM_ARM_VCPU_SPE_IRQ:
> +		return 0;

Should we gate this too on irqchip_in_kernel(vcpu->kvm) ? Otherwise
we would advertise to the userspace that it has the SPE_IRQ, but
would return -EINVAL when we try get_attr if the irqchip is not
in kernel.

Also, do we need to mandate the ordering of the SPE configuration on
VGIC ?

Cheers
Suzuki


> +	}
> +
>   	return -ENXIO;
>   }


