Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF558C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDTuzwNOrfnRWzb35HLSmzXt08GEKPQgr4fYc5Z/ZD4=; b=lbX3tJHE+PfusIrP1Um0/cNLau
	/ULcGBUgCWwGkNnbTIcVouj0O8sX/I8wAx1dhTNeBixMN1sa5YZU6b9rmmZYQtITDgC4joVE5GeFR
	6iAK7eGS0A//j2dhzX/ZEUzZASTYkqEkr5L8pZ3SXJikcv6XoaM8C5+g4+QHwlr9c7kiubatLoFrz
	SPaVdHo92pT4qnKZWDGI54qhLPQsoCusbojGvTprRFPUxl/20JwgXfk2+rBLRDriwl7rZXU3q9/Eo
	gle3PlJI34Rn+3DIGs92Oc7mythmFF3qjs5/azdPqFPT0oo8hc7htN3TsdCd+o2I5QCbHI21SDX0h
	PYoS5qyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTZc-00000009Xml-0oYL;
	Wed, 12 Mar 2025 21:25:08 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTXw-00000009XPT-2V1d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:23:25 +0000
Date: Wed, 12 Mar 2025 14:23:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741814602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDTuzwNOrfnRWzb35HLSmzXt08GEKPQgr4fYc5Z/ZD4=;
	b=TtVPrJCZGys80899AIs26b1+F9CgqiQotdcfYeWFwylBeD++8Wl5es4XbkJ2ve2pvh4JEx
	BnqZEhXeqdU2VXDiiP1Jz0CsyTJHB40ppG97regrCRFek3z/LJkIDyJgN0DecQsGYmbaAi
	p57J3CTrLudNMoOntMTJlWajGndLhNk=
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
Subject: Re: [PATCH v3 6/6] KVM: arm64: Reload PMCNTENSET_EL0
Message-ID: <Z9H7RYEI_cPwNe7h@linux.dev>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
 <20250312-pmc-v3-6-0411cab5dc3d@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-pmc-v3-6-0411cab5dc3d@daynix.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_142324_778931_AAE127C6 
X-CRM114-Status: GOOD (  15.59  )
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

On Wed, Mar 12, 2025 at 08:56:00PM +0900, Akihiko Odaki wrote:
> Disable counters that are no longer included in PMCNTENSET_EL0. It is
> not necessary to enable counters included in PMCNTENSET_EL0 because
> kvm_pmu_handle_pmcr() does so if appropriate.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  arch/arm64/kvm/pmu-emul.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 2d19c6048091..b14655dda6db 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -831,6 +831,8 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
>  {
>  	u64 mask = kvm_pmu_valid_counter_mask(vcpu);
>  
> +	kvm_pmu_disable_counter_mask(vcpu, ~__vcpu_sys_reg(vcpu, PMCNTENSET_EL0));
> +

Just so this function appears consistent, can we move this after the
point where the mask is applied?

There's no functional impact of course since PMCR_EL0.N can only be
changed before the VM is started, i.e. not possible to have running
counters >= N.

Thanks,
Oliver

