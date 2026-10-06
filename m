Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7E3CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlbDdSB3PruPRmOdVrnRuaAfzphnBA/AuglJGG/CjDA=; b=t49Z6OtI/+wVqEMIX59jbfUrCl
	Qu3eXBbRub/fO8Pzl7BIVJXvg+UCmUTBE0SbNfltYeoZHIyxnKrtY8iS1nxCPMPlw6wXl7L+iF2HO
	jLI7XsSvUZTDlg4rF/HEygHPpdIT2sDskpVNVvODu5gSxe4ZxgUSLZip/JKr8WMbTftPJJz9MfaIC
	2+6EFwbN5HDwV9jyOSen5K6iLsqVGD/C8eohs3BaEpw2o3BKWjRzxsoEqJ5Axb/S2dGv6RseVMhMM
	zVAeS+RKD3+BGVrFOpljsLf8J+m/QoWFuAqNuQGtQC0+tWHCMBdO+68eOts0+VLGr5RwKaQfubwpD
	9Gf2pixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxyy-0000000052c-2wJF;
	Tue, 06 Oct 2026 05:44:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxyw-0000000052D-2M6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791265493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HlbDdSB3PruPRmOdVrnRuaAfzphnBA/AuglJGG/CjDA=;
	b=H/2QPeI5HGWXZ+ZyyHFDqHw+hNrZegLbjCGCA5hxD3IR2VJ72nK43HyGh9rcKlQWhf06qo
	dsEt9MdiKS4Qvh3ISvgLRXx4+OjUk6A60Vjpv5NH7G7qFL+W2H202kpOVcBxo5jfeyIwKf
	ALSJBsxUUMg65fhZ7jEfjIQptXCg4pA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-Mq6hiRfuMZWHAQdfWMYKtg-1; Tue, 06 Oct 2026 01:44:51 -0400
X-MC-Unique: Mq6hiRfuMZWHAQdfWMYKtg-1
X-Mimecast-MFC-AGG-ID: Mq6hiRfuMZWHAQdfWMYKtg_1791265490
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2c785aa62so38092745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 22:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791265490; x=1791870290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlbDdSB3PruPRmOdVrnRuaAfzphnBA/AuglJGG/CjDA=;
        b=mGTS1jqKt1RPFlRAOGcMkvAmmwJDHf/83YkzEQrAVHWyr/65UruEHDcIOjlm8BN2e5
         J08hhQUnlQ6ZXla/HgAUIlsgpMnV9MXHo4VNo0bxdP0gdgBIEa7iScRyZQPzEZIhaXVw
         tX+xijhAs+qwy7ecOevcyFrSo9K3Wx9qD+h6QW1yBaqIZdw9mRdODJAiUG1+daK4tp8a
         EZVC9OPwEgJLS7Nefc4IfGfXAQhRKXODoO7eGR6TMb78LV4KXtgE6VphEH+FmbyjAvud
         72T/ir1Gm+P1oryevL+ngvB16lDetIpEVB9Ul+VA9j2UtaLt9DQPnSFak3bOAjCTadKU
         X00A==
X-Forwarded-Encrypted: i=1; AKwUvBwkZqsmby6bRWUTdSN2LJDSPAdqqu38hFyCewrILkT9jyPcRRpDaSxl250SW1Ym0/4O7d3D5da/5+XVRbuDCB0x@lists.infradead.org
X-Gm-Message-State: AFuF++mgx+dXpVDh2y/Kym8eVvbXX4XT8jdxBaiCgZ7L/IZlOqWoubpe
	bVM4o574Un0Nx6Pqb1MGFEdq15oEU98z3OpFEUzUZPbShNhjEY0Yi1aA6XnZnagt8/M7qWQ4UfB
	WXEf3loBwqvyoIkg8yGPC1jtN3YhtSwNdzH8IOogGNNXpHvJ3Z5+oeR85aoiAkZIGOB1BIHBdGb
	cn
X-Gm-Gg: AYBFou0+hm2IFAvSu4FbihOhinct/MhKkfHiaTCpR3fZ76RuGkzy0wDmgCHGuTigC1z
	AyWCHJJRZbGx+UFltVaded3kQyDrBmAKF6d6Qj3vbc7kqj8sm2TwwM8LJ785+SCX3rJeUugwSRk
	+BZHdPMJHrhhg37BMnhVt1a6avCiuxIqN3rzsUE7OYtmx5XGYbAhgl062RN2M9LK1TjkbPeMrz4
	MFJumgoBPx8IGhHPsNFi4hMe3SJDXM8BlGYEgs93Af5xwNrmby6t97F0K1PapMglDmp9j9kb0PN
	9fsVwo/5YcHKeq3ZwI1CW08w4Wvryv7Gm/lCadN5r3g7XtzgAiU74Oa35PKv3c0LusN4uaTao7y
	uELnfdXOKT+nqTmFegPn2kv3y8Vz5ddv17LnzuWNlDw==
X-Received: by 2002:a17:902:d584:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2e5dcd90b05mr3769915ad.11.1791265489976;
        Mon, 05 Oct 2026 22:44:49 -0700 (PDT)
X-Received: by 2002:a17:902:d584:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2e5dcd90b05mr3769785ad.11.1791265489595;
        Mon, 05 Oct 2026 22:44:49 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecbdd3sm17417165ad.48.2026.10.05.22.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 22:44:48 -0700 (PDT)
Message-ID: <830e8afc-b208-4972-a45a-32c828c14206@redhat.com>
Date: Tue, 6 Oct 2026 15:44:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 21/23] KVM: arm64: CCA: Support timers in realm RECs
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-22-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-22-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bLez87G5EkbiEV28vws5pkZ8LFyUAAUWuB1WM9CJgWs_1791265490
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_224454_682326_0AA6080E 
X-CRM114-Status: GOOD (  23.60  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM keeps track of the timer while the realm REC is running, but on
> exit to the normal world KVM is responsible for handling the timers.
> 
> A later patch adds the support for propagating the timer values from the
> exit data structure and making sure the values are in sync for KVM.
> 
> Also, RMM doesn't support injecting virtual interrupts backed by Physical
> interrupts. So, use the existing software resampling mechanims for Realm
                                                        ^^^^^^^^^
typo: mechanism

> timer interrupts.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arch_timer.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index a45845f4ae4ea..428709f499205 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -56,11 +56,25 @@ static unsigned long kvm_arch_timer_get_irq_flags(void)
>   	return kvm_vgic_global_state.no_hw_deactivation ? VGIC_IRQ_SW_RESAMPLE : 0;
>   }
>   
> +static unsigned long kvm_realm_timer_get_irq_flags(void)
> +{
> +	/*
> +	 * RMI_REC_ENTER rejects LRs with the HW bit set, so use the existing
> +	 * software resampling mechanism for Realm timer interrupts.
> +	 */
> +	return VGIC_IRQ_SW_RESAMPLE;
> +}
> +
>   static const struct irq_ops arch_timer_irq_ops = {
>   	.get_flags	 = kvm_arch_timer_get_irq_flags,
>   	.get_input_level = kvm_arch_timer_get_input_level,
>   };
>   
> +static const struct irq_ops realm_timer_irq_ops = {
> +	.get_flags	 = kvm_realm_timer_get_irq_flags,
> +	.get_input_level = kvm_arch_timer_get_input_level,
> +};
> +
>   static const struct irq_ops arch_timer_irq_ops_vgic_v5 = {
>   	.get_input_level = kvm_arch_timer_get_input_level,
>   	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
> @@ -1617,8 +1631,12 @@ int kvm_timer_enable(struct kvm_vcpu *vcpu)
>   
>   	get_timer_map(vcpu, &map);
>   
> -	ops = vgic_is_v5(vcpu->kvm) ? &arch_timer_irq_ops_vgic_v5 :
> -				      &arch_timer_irq_ops;
> +	if (vcpu_is_rec(vcpu))
> +		ops = &realm_timer_irq_ops;
> +	else if (vgic_is_v5(vcpu->kvm))
> +		ops = &arch_timer_irq_ops_vgic_v5;
> +	else
> +		ops = &arch_timer_irq_ops;
>   
>   	for (int i = 0; i < nr_timers(vcpu); i++)
>   		kvm_vgic_set_irq_ops(vcpu, timer_irq(vcpu_get_timer(vcpu, i)), ops);


