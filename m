Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF35CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TluhHDVhZ7Q4e/zc1etRAVmQqRxZpavPzTy3fxZcCts=; b=e8nOwst6zYJcTkK8laWflr8+ym
	deZgBukOjKCKIIF1UjANcyzRkZiwDdw+X8xDHmpVZnae/JVv4TvCCtDZoe/2fUbHPpDFNAI5g41+6
	pTseJ/L/2CPmifTaRBIappFQgTmUX5Nq8oDOmg6TB3cKQqXEZx1NM6oQYbNHiJCwc6LJnC05UAAw6
	QZKvS+b3IhnmFjHHjQ1KmXpbA1f9NbofCy1MZ3OFA9QRZBRYBm1/UNfERPYADDG4QousdjWOo7d+2
	keTHx2TDFmpffZ/OLh/yMHyf5/TscWYgIsOcXqZqDz2r+LjK/P6eb+/Fs/zMK8rawGm2e8tafq8Bp
	6QuQxYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNrj-0000000APWT-0jqH;
	Fri, 24 Oct 2025 19:54:23 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNrg-0000000APW1-3W0W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:54:22 +0000
Date: Fri, 24 Oct 2025 12:54:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761335652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TluhHDVhZ7Q4e/zc1etRAVmQqRxZpavPzTy3fxZcCts=;
	b=jEMnp6kC4kWVUrNW6+DJHdUsB3AZjvBLHmaFN9WvAzSLLto9i/tI/2jJMkyC1i+FKjTWIX
	55KKAd4HhSpp0QwdjD9n8Sr2xd2hwOxUAWWziHFbcVt4oODcuee/d9RxiUkylL0WtXDfBk
	wWjCRUXOs4qs3PCdwRpmAXWo9MigZr0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	yangyccccc@gmail.com, prime.zeng@hisilicon.com, xuwei5@huawei.com
Subject: Re: [PATCH v6 3/7] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
Message-ID: <aPvZWY57ppqqWm50@linux.dev>
References: <20251024090819.4097819-1-wangzhou1@hisilicon.com>
 <20251024090819.4097819-4-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024090819.4097819-4-wangzhou1@hisilicon.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_125421_049920_2FB294F6 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Zhou,

On Fri, Oct 24, 2025 at 05:08:15PM +0800, Zhou Wang wrote:
> +/**
> + * kvm_inject_dabt_excl_atomic - inject a data abort for unsupported exclusive
> + *				 or atomic access
> + * @vcpu: The VCPU to receive the data abort
> + * @addr: The address to report in the DFAR
> + *
> + * It is assumed that this code is called from the VCPU thread and that the
> + * VCPU therefore is not currently executing guest code.
> + */
> +void kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
> +{
> +	u64 esr;
> +
> +	/* Reuse the general DABT injection routine and modify the DFSC */
> +	kvm_inject_sea(vcpu, false, addr);

This potentially injects a nested SEA which I'm not sure you want. There
still is an interaction with nested, from DDI0487L.a B2.2.6:

  For the EL1&0 translation regime, if the atomic instruction is not
  supported because of the memory type that is defined in the first
  stage of translation, or the second stage of translation is not
  enabled, then this exception is a first stage abort and is taken to
  EL1. Otherwise, the exception is a second stage abort and is taken to EL2.

We don't need to worry about the S1 memory type since hardware will
handle that for us. But we do need to consider whether the guest
hypervisor enabled stage-2 translation or not and route accordingly.

int kvm_inject_nested_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
{
	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_DABT_LOW) |
		  FIELD_PREP(ESR_ELx_FSC, ESR_ELx_FSC_EXCL_ATOMIC) |
		  ESR_ELx_IL;

	vcpu_write_sys_reg(vcpu, addr, FAR_EL2);
	return kvm_inject_nested_sync(vcpu, esr);
}

int kvm_inject_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
{
	if (is_nested_ctxt(vcpu) && (vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM))
		return kvm_inject_nested_excl_atomic(vcpu, addr);

	__kvm_inject_sea(vcpu, false, addr);
	esr = vcpu_read_sys_reg(vcpu, exception_esr_elx(vcpu));
	esr &= ~ESR_ELx_FSC;
	esr |= ESR_ELx_FSC_EXCL_ATOMIC;
	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
	return 1;
}

Thanks,
Oliver

