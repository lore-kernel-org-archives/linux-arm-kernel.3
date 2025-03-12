Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AD2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nketLiJPdF1cG5+xhffp3E+xo58pUFnxytm5pkfSk9c=; b=3YiLl7CghXMJewQkap2KcsNZG8
	qGzzjL/yPIn1uw+3L6ptx2gzrzOxirspqigcCIYw5FfSxuASwZjqVHR2Fi4WLc3qLHQISBBB/ZC88
	B1Y3amYl5EDe2NHvTzZNHV3lwiqthNgB6dcDZ2zmKjjbkFfTudN7T0tNa/t2fpOSiBKuYxIGuvD6O
	A5dw/rssQ/fr3XJFsCw+4Qw/tJcvLead8wXUXRJW/gpK5jLvtcctnlf//YuigNa47KlFVXOFkUD8O
	BXfvqkJzmVPBS9G2QEyqg8VbmeDDafVCht6MtKWOjx2A9D6uo3fZu/Z4dHGuzwIlAJEEVlq7L1Un3
	zS23Mn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTLK-00000009Vt9-0oTv;
	Wed, 12 Mar 2025 21:10:22 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTJf-00000009Vfc-1tyP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:08:40 +0000
Date: Wed, 12 Mar 2025 14:08:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741813717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nketLiJPdF1cG5+xhffp3E+xo58pUFnxytm5pkfSk9c=;
	b=tXAIgqwOxyhkyQX9b3ctNlNNWv6ooqSGxQgRaPhObowdsl5KRSSHxy8AxV/U0HPzt8f+Wl
	hqYXrgYCNtu9QnGy0iXJBJ1JAvF1grz9I/e6QgQ42M5CHiv38XbprKCHUOKoaWnSie8fzP
	rEzD/JEgYy9tovZ0eU+shdnFwXGOv+E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, devel@daynix.com
Subject: Re: [PATCH v3 2/6] KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
Message-ID: <Z9H3yuv96gBPty76@linux.dev>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
 <20250312-pmc-v3-2-0411cab5dc3d@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-pmc-v3-2-0411cab5dc3d@daynix.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_140839_634629_F6A5E9BC 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Akihiko,

On Wed, Mar 12, 2025 at 08:55:56PM +0900, Akihiko Odaki wrote:

[...]

> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 962f985977c2..fc09eec3fd94 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -951,6 +951,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
>  
>  	switch (attr->group) {
>  	case KVM_ARM_VCPU_PMU_V3_CTRL:
> +		if (!kvm_vcpu_has_pmu(vcpu)) {
> +			ret = -ENODEV;
> +			break;
> +		}
>  		mutex_lock(&vcpu->kvm->arch.config_lock);
>  		ret = kvm_arm_pmu_v3_set_attr(vcpu, attr);
>  		mutex_unlock(&vcpu->kvm->arch.config_lock);
> @@ -976,6 +980,10 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>  
>  	switch (attr->group) {
>  	case KVM_ARM_VCPU_PMU_V3_CTRL:
> +		if (!kvm_vcpu_has_pmu(vcpu)) {
> +			ret = -ENODEV;
> +			break;
> +		}
>  		ret = kvm_arm_pmu_v3_get_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_TIMER_CTRL:
> @@ -999,6 +1007,10 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>  
>  	switch (attr->group) {
>  	case KVM_ARM_VCPU_PMU_V3_CTRL:
> +		if (!kvm_vcpu_has_pmu(vcpu)) {
> +			ret = -ENXIO;
> +			break;
> +		}
>  		ret = kvm_arm_pmu_v3_has_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_TIMER_CTRL:

I agree with you for the most part on this patch, but I prefer we keep
the kvm_vcpu_has_pmu() with the ioctl implemementations rather than the
spot at which we demux the ioctl.

Thanks,
Oliver

