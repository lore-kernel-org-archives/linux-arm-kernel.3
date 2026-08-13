Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5792C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR5n5krmzOY/eFxgrW8FpUGIU90hLuNiWXw37fblaMA=; b=X9zHvjB9Ngi0i/8f1khgUH3Yln
	Jog9I/B4k86SvS5/ew6Tw/iQoW2L70nbyXHp+JakRM50iCg+lKZOJkFj+1l8UFPRphVbpwBUdYlHY
	htxY3AUb8R0ffGyONjfJKW0+bCOOCHVNbhWiJRsEjqxoKZGD99SxH3+SHZeKXmR/c11mSoM+tCpgi
	EiLqP+w7lxWGQAmS/Q/p3QBQGSGfFj7pV3rabDPGZLfILio1FRBkVxowhU+Hexxg7wWg1OG/+3f/Z
	6s0RlWJieH5TYmu55WTMXmSdUl17kMnW7PrfCm2Ge6hind2u6Sm93g2XLeQZviOKaA+ohcli6EjMQ
	T2W+PgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXN5-000000011lk-3lYv;
	Thu, 13 Aug 2026 15:29:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXMj-000000011dO-03A5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:29:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A52D1576;
	Thu, 13 Aug 2026 08:29:03 -0700 (PDT)
Received: from [10.1.25.28] (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AEDE3F632;
	Thu, 13 Aug 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786634947; bh=hwSP41DeEmtt7lyKNcI/TpZqJSs8Qf3xJssO3OjtPzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=itBB1IFKjNP9DbOkr/kHIFoks2lYJmw2ANl9SZOyFtDGubOYpdT76oI7qrubQEhvS
	 5CjB+gB8LUXcDTjQRcQSWY6Q6ualkMYYZmfwi0DTp/zbv1DYBQRKXsuxkDEpuSoxfE
	 QqxzU6p1Q2t+mx6kzqQs9ixwC+4AMFZV+Ve9mJkc=
Message-ID: <adba8512-ac9e-4d22-86a8-2ffcff837f11@arm.com>
Date: Thu, 13 Aug 2026 15:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 21/45] KVM: arm64: CCA: Handle realm enter/exit
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-22-steven.price@arm.com> <yq5a5x1q461s.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5a5x1q461s.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_082909_411167_0D45C8F6 
X-CRM114-Status: GOOD (  15.04  )
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

On 04/08/2026 09:57, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> +	switch (rec->run->exit.exit_reason) {
>> +	case RMI_EXIT_SYNC:
>> +		/*
>> +		 * HPFAR_EL2_NS is hijacked to indicate a valid HPFAR value,
>> +		 * see __get_fault_info()
>> +		 */
>> +		vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar | HPFAR_EL2_NS;
>> +		rec_exit_sync(vcpu);
>> +		return ARM_EXCEPTION_TRAP;
>> +	case RMI_EXIT_IRQ:
>> +	case RMI_EXIT_FIQ:
>> +		return ARM_EXCEPTION_IRQ;
>> +	case RMI_EXIT_SERROR:
>> +		return ARM_EXCEPTION_EL1_SERROR;
>> +	case RMI_EXIT_PSCI:
>> +		rec_exit_hvc(vcpu);
>> +		kvm_make_request(KVM_REQ_RMI, vcpu);
>> +		return ARM_EXCEPTION_TRAP;
>> +	case RMI_EXIT_RIPAS_CHANGE:
>> +		rec_exit_hvc(vcpu);
>> +		return ARM_EXCEPTION_TRAP;
>> +	}
> 
> Should we handle RMI_EXIT_RIPAS_CHANGE differently? Currently, the call path is:
> 
> kvm_rec_exit()
> -> RMI_EXIT_RIPAS_CHANGE
> -> handle_hvc()
> -> kvm_rec_handle_hvc()
> -> kvm_prepare_memory_fault_exit()
> 
> Could we instead treat RMI_EXIT_RIPAS_CHANGE as a special case and avoid
> redirecting it through handle_hvc()? The completion part of the RIPAS
> change could still be handled by kvm_rec_handle_request().

Yes that seems like it's slightly neater.

Thanks,
Steve

> 
> -bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret)
> +static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>  {
> -	struct realm_rec *rec;
> +	struct realm_rec *rec = &vcpu->arch.rec;
>  	struct realm *realm;
>  	unsigned long base;
>  	unsigned long ripas;
>  	unsigned long top;
>  
> -	if (!vcpu_is_rec(vcpu))
> -		return false;
> -
> -	rec = &vcpu->arch.rec;
> -	if (rec->run->exit.exit_reason != RMI_EXIT_RIPAS_CHANGE)
> -		return false;
> -
>  	realm = &vcpu->kvm->arch.realm;
>  	base = rec->run->exit.ripas_base;
>  	top = rec->run->exit.ripas_top;
> @@ -89,8 +83,7 @@ bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret)
>  			 base, top, ripas);
>  		/* Set RMI_REJECT bit */
>  		rec->run->enter.flags = REC_ENTER_FLAG_RIPAS_RESPONSE;
> -		*ret = -EINVAL;
> -		return true;
> +		return -EINVAL;
>  	}
>  
>  	/* Exit to VMM, the actual RIPAS change is done on next entry */
> @@ -102,8 +95,7 @@ bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret)
>  	 * KVM_EXIT_MEMORY_FAULT requires a return code of -EFAULT, see the
>  	 * API documentation
>  	 */
> -	*ret = -EFAULT;
> -	return true;
> +	return -EFAULT;
>  }
>  
>  int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
> @@ -169,8 +161,7 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
>  		kvm_make_request(KVM_REQ_RMI, vcpu);
>  		return ARM_EXCEPTION_TRAP;
>  	case RMI_EXIT_RIPAS_CHANGE:
> -		rec_exit_hvc(vcpu);
> -		return ARM_EXCEPTION_TRAP;
> +		return rec_exit_ripas_change(vcpu);
>  	}
>  
>  	return rec_exit_fatal(vcpu, "Unsupported Realm exit reason",
> 
> -aneesh


