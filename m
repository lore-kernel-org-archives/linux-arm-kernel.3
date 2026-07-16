Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNdRSJUo1qBY84P35csVTcewoHMPny363HB2IKZXasc=; b=mnHzhKlKsXuMBIGzGxb2NJEPop
	4dqNI6YC80iB6sXvszAx5RjLIcPlmfzLfSi7VEEzqWrF+K3vyGwu68CobIEaVusZwh0nn7m6zpFBp
	J49B2gb7ParjIDGzo7BAasLdL7H7lFN9bM6sD++JD/Xoixuq78wgfwpI2ctnTV5nS4mbLQP/Ndb7g
	dicFDkfNYuM80ipoEJ8rfR2goDbHbdTOnSjlaLKIuOE3WJ6Z30hmLtmZikOqerVMp5HNq3Wb9WFSV
	j0Eb3qDWQuMnpPF9VyfALeRuqSt4tp3++ROLDsaa4sNbSUoHFL1cKqhCJ1PAlTLWw93CE0ctKw6Ug
	yuKeGIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJEV-0000000GzuU-0cvk;
	Thu, 16 Jul 2026 10:22:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJET-0000000Gzu7-0Qsa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C229E2F;
	Thu, 16 Jul 2026 03:22:15 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D5CE3F7B4;
	Thu, 16 Jul 2026 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784197339; bh=en5X+Gmc8TvyimGGC5fjEFfAJUjSA+Q3WgnPuRiMC4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qVHlpNKjhvKn3xQ+CNDb0jNA6crT5j1kcZIOGpapBhTks1C9/NkDV1ed8MvKjQNsD
	 Lq0haMITs7kx1z9rHbbn4orzHSIACc33v0EXF5UvcU3sHl4iOaS8PJHMeqR4Od64ak
	 eZpHu80hfxd7/rjOWxIrT1OkCvVZrEPQOpALUZkU=
Message-ID: <96dbe4f6-a425-4118-afb8-56361e04263b@arm.com>
Date: Thu, 16 Jul 2026 11:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 28/37] KVM: arm64: CCA: Support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-29-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260715142841.80544-29-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_032221_232085_91A59FE9 
X-CRM114-Status: GOOD (  20.94  )
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

On 15/07/2026 15:28, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Realm VMs can talk to the hypervisor using the RSI_HOST_CALL SMC. The
> RMM forwards this to the host and KVM handles them as regular
> hypercalls.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---

minor nit: Populating the results back to the Realm is added in the 
Patch 14: KVM: arm64: CCA: Handle realm enter/exit

May be a good idea to move to this one here ?

Either ways:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> Changes since v7:
>   * Avoid turning a negative return from kvm_smccc_call_handler() into a
>     error response to the guest. Instead propagate the error back to user
>     space.
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rmi-exit.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
> index c668cbfa971a..78d9189fd5ca 100644
> --- a/arch/arm64/kvm/rmi-exit.c
> +++ b/arch/arm64/kvm/rmi-exit.c
> @@ -113,6 +113,19 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>   	return -EFAULT;
>   }
>   
> +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
> +{
> +	int i;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu->stat.hvc_exit_stat++;
> +
> +	for (i = 0; i < REC_RUN_GPRS; i++)
> +		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> +
> +	return kvm_smccc_call_handler(vcpu);
> +}
> +
>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -188,6 +201,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
>   		return rec_exit_psci(vcpu);
>   	case RMI_EXIT_RIPAS_CHANGE:
>   		return rec_exit_ripas_change(vcpu);
> +	case RMI_EXIT_HOST_CALL:
> +		return rec_exit_host_call(vcpu);
>   	}
>   
>   	kvm_pr_unimpl("Unsupported exit reason: %u\n",


