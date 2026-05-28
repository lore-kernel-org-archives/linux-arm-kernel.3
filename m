Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65EACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 04:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I8KzNpXq63WE4CP85HoO7zZcc0AvIs01nVPYeq3DW0=; b=c7Ap6GWb2L9P1UDY3b1daduKOi
	SYylqx5hKzf4tY9wBgaoGguLPaWimaCOTejUG1SlWVEmVqq5uWbUzHsD6G22af2FNroqU2hvThyFl
	xtzKkInF1uBlOEbOWhLCzcTI2mmpXLe7+rOm9FVtWpQcaisT/Fc4wOeAoiK4YOPiXODR0sti7rVX3
	DZlHZvXUzdlg6B85sHfLKFBXd5iRrxDbtjlAJolPR1h9qVPbB7J8my8C7Ut8bKhkANkHenUmlB7uh
	a9uJKhJZY+1SSZP6a61nxxqoShCJXRzReRFHrP2l5jjd33r4ssutZS9igZp0BRDdy0c/iBfe+woJX
	/VIVQeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSS28-000000055eb-02G6;
	Thu, 28 May 2026 04:07:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSS24-000000055dV-3NqU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 04:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779941262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1I8KzNpXq63WE4CP85HoO7zZcc0AvIs01nVPYeq3DW0=;
	b=ISMa+96ZeHZUdBNli90Ih7fKFQCb4SszJ8p6hebdcQ42XBqfiaY6gR2TfUBOqgIL8cCZAT
	XBNuE4mMYKEDPFJNirGqmpuVbi8t+YFPjveB1uczM1drhjwbgFOY/b1vEzBe82aw/0cPF6
	F3r6lKPzkM0FUFrbi7OdsYioh432xTM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-6UE4X1QrOdO_gZM_GfWgWA-1; Thu, 28 May 2026 00:07:40 -0400
X-MC-Unique: 6UE4X1QrOdO_gZM_GfWgWA-1
X-Mimecast-MFC-AGG-ID: 6UE4X1QrOdO_gZM_GfWgWA_1779941259
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c829586e894so6701341a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 21:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779941259; x=1780546059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1I8KzNpXq63WE4CP85HoO7zZcc0AvIs01nVPYeq3DW0=;
        b=keO7iX6Ll0e4GOHKH1ECMvUAcD/0VAp6BQn6w6JOA35p9zGYkJKn7GRpnAFxn1ViKr
         ZQ7N7KiuVXCgNj1EsK0lOI4v6jGa6Dt1ebwMEAVBtO0uyZey9LNqflfh99DRWNR4t9JD
         how8E8BrzUZ2mwVAtK6GtLyUG9EYji/BY/hrsj7VNztLvm8v1YW70BbR1OhEDJ5K8CXD
         6HQFuxsZGPPBAJND0aRBBSkmTdf3CcPAZ7KQttx/9OYGllK0lMIcL9mFbRGCNnnVNaXw
         JN78eqkz024ieH4AQbVycWPvho+E5gHaJGZ6c0YmaYsBPkDIEja9F5jmC9I4e2hpO7x/
         8axA==
X-Forwarded-Encrypted: i=1; AFNElJ8crjTkCylaAfD9YqCJ6kVt5gVXlza+PV6RVG5spJogomXAeOhO4h62JcCn7KHJQw/wZncoaIJRMD1CrS7uGeYj@lists.infradead.org
X-Gm-Message-State: AOJu0YxHRJrakGABaH3zi+n4LZfD9FnnFQEjgEfOcXwVRFAWD60vic7v
	Rr3Mn7YyAsexJGlSQcQYTpxllcpfN46ZqZYtaBTrfdoNhAUcdwsC2ay+wmueAP6tHX9THsjbTDW
	utZTPLzttmQNwOr3PlzuBqQbmAj1G/RopMgGxsJRm56ZLvvouiaaQuTFb7bq/zwsFmJhe3zphbt
	Ck
X-Gm-Gg: Acq92OHLuCzYSWM9I8UGUJ3VtZ3VL26HkUsBfLL8QVyDfWd2/HVX7pUGAsYTWVZCTL6
	HXlQRzlBXJ3umtjIibBKzRwBtLV3o+Xlw4A++YpgGOEmRb7XF4zUUXfzLadn4YQf9qG04UjOUGg
	1mO+697y6rExc3hMosLMRDoeqnmkKAMCp0p9WF8TsOfbQTvf7wqOb393gZiuR/+mCs6Nq8ojP5S
	SrUZpJOfM8sLIQ9b0QnZgk7m3rAw3uBYyddB6fa6BzEOd22zizcYKkpAG/ckTBnBSgO55sLcNqs
	gOyh1gb3hsUimgD3msdwiKzKhsuYkpH2LKCpb1rN8nnpK5NPOzkGyUzQCe44eWhalbpr4HnOOn9
	OG/LScZffuTzbsmVYLzIk8o8P7COrNiRb2t+0haFSxMoDEflJ6MVoSqs6OjwlKSDmoNN4uuTlcc
	U=
X-Received: by 2002:a05:6a00:194f:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-8415f329ac5mr24016475b3a.16.1779941259192;
        Wed, 27 May 2026 21:07:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-8415f329ac5mr24016447b3a.16.1779941258714;
        Wed, 27 May 2026 21:07:38 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7300ea4sm3790751b3a.56.2026.05.27.21.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 21:07:37 -0700 (PDT)
Message-ID: <5ea74b6a-a51a-415e-b53f-5ece9829dee8@redhat.com>
Date: Thu, 28 May 2026 14:07:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 20/44] arm64: RMI: Support for the VGIC in realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-21-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-21-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RZMlAOqYkn3wFle6xHV3Z8FTl7TJYBvN2_H-kqEwuoE_1779941259
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_210744_929282_91EF8BEB 
X-CRM114-Status: GOOD (  23.99  )
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

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
> The RMM provides emulation of a VGIC to the realm guest. With RMM v2.0
> the registers are passed in the system registers so this works similar
> to a normal guest, but kvm_arch_vcpu_put() need reordering to early out,
> and realm guests don't support GICv2 even if the host does.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v12:
>   * GIC registers are now passed in the system registers rather than via
>     rec_entry/rec_exit which removes most of the changes.
> Changes from v11:
>   * Minor changes to align with the previous patches. Note that the VGIC
>     handling will change with RMM v2.0.
> Changes from v10:
>   * Make sure we sync the VGIC v4 state, and only populate valid lrs from
>     the list.
> Changes from v9:
>   * Copy gicv3_vmcr from the RMM at the same time as gicv3_hcr rather
>     than having to handle that as a special case.
> Changes from v8:
>   * Propagate gicv3_hcr to from the RMM.
> Changes from v5:
>   * Handle RMM providing fewer GIC LRs than the hardware supports.
> ---
>   arch/arm64/kvm/arm.c            | 11 ++++++++---
>   arch/arm64/kvm/vgic/vgic-init.c |  2 +-
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 93d34762db91..21d9dfdb1ea0 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -786,19 +786,24 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>   	}
>   
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +
> +	vcpu->cpu = -1;
> +
> +	if (vcpu_is_rec(vcpu))
> +		return;
> +

For a REC, kvm_vcpu_{load, put}_debug() becomes unbalanced in kvm_arch_vcpu_{load, put}().
kvm_vcpu_load_debug() is called in kvm_arch_vcpu_load(), but kvm_vcpu_put_debug() won't
be called in kvm_arch_vcpu_put() after this whole series is applied.

>   	kvm_vcpu_put_debug(vcpu);
>   	kvm_arch_vcpu_put_fp(vcpu);
>   	if (has_vhe())
>   		kvm_vcpu_put_vhe(vcpu);
> -	kvm_timer_vcpu_put(vcpu);
> -	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
>   
>   	vcpu_clear_on_unsupported_cpu(vcpu);
> -	vcpu->cpu = -1;
>   }
>   
>   static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 933983bb2005..a9db963dfd23 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -81,7 +81,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>   	 * the proper checks already.
>   	 */
>   	if (type == KVM_DEV_TYPE_ARM_VGIC_V2 &&
> -		!kvm_vgic_global_state.can_emulate_gicv2)
> +	    (!kvm_vgic_global_state.can_emulate_gicv2 || kvm_is_realm(kvm)))
>   		return -ENODEV;
>   
>   	/*

Thanks,
Gavin


