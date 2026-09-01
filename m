Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A207C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 04:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCQU+V95xqEH8EbNTciL/CsMqe3BTX/wUO0rCYM10FE=; b=s8HzflZMUaNYi8Q1AzYzW4s3i+
	0zSuW1JoxeZMvuwi53SZAwPhkDyyyp68dNoI1cA8UEuUgAuFjiU2dlbOXJWhgHFZKhQCymhrjcl5s
	CeuDsArycVunLq7FeAtCCkT9a2WhuZpTEcCimWUHFiNKyAAUGLGmVDswPrb7akEdXnGRk8fxpR6+7
	63aRCfyxQHZtl3LgW6D7lZFZO633wCX0/HQBk1H9rgpLQKhmhhSeKn21IXFLCDPRcJ5wh/mabcY+R
	hV46m+TVb/dAGJawHUYOrcBQhtbEsn+Zq4K3ji8WYzaM1z2Z+8QBIFPbvav9LWm8+p6x/niQOCVMu
	5lVIkQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1G7x-0000000Aymt-1NSl;
	Tue, 01 Sep 2026 04:29:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1G7u-0000000AymY-22Sc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 04:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788236977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCQU+V95xqEH8EbNTciL/CsMqe3BTX/wUO0rCYM10FE=;
	b=GWxKqtgK8S2BuWyL/wgEuKKQK/FXrIh/kQTWhULxzke9BC7DU6MusYuRHjQxeSLfGyYKDH
	Q/bTrFbq+71etYN2XIf68vG30R6iwkdeav+v7zoGTd1Unp6wAy5pCxta/fiFnjwl6pKA0Q
	Yr6uVjjm/j8VKAW5kgYXfV80L/M8uhw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-ONqGRtmqM4-pnfr5KXyNCA-1; Tue, 01 Sept 2026 00:29:35 -0400
X-MC-Unique: ONqGRtmqM4-pnfr5KXyNCA-1
X-Mimecast-MFC-AGG-ID: ONqGRtmqM4-pnfr5KXyNCA_1788236975
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so41475815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 21:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788236974; x=1788841774;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCQU+V95xqEH8EbNTciL/CsMqe3BTX/wUO0rCYM10FE=;
        b=lO6ptrFG5yzVRFtqH462pbNPWtcnVjreLW9GEd3IHByeKTEWqCZLt/yI2heKYEZEbU
         YKld0ux1TJyCvf383XoFtCKgAyfcW2eySodbemDK1kn7Of7KIYb4CnE7/pm9RC7qWHLR
         7EXWnW94vAlSdK4k7pbTG5gj2QH/Zidftr6svUox1fDvmlapG35YnfNzjbPOzEIhWBFY
         Ub6m7LexgfSV9u+RjSm4KmgLgoK/THIaxuVITN/baFolQYxQKQNqGWvCssgA1zPQtcej
         VFZohHmhcJP3MfMdncxr6g3L6uFPePAoZQO90h+10kVYrblsoAoqkHxfYhTt4k6EV1hb
         RhMg==
X-Forwarded-Encrypted: i=1; AKwUvBwkm1W27TrAodprKk/tqRczXYTy+wLBcp24RUWWspSTSLUgv6yJo+SQ2T7kjKPC7/J3dilGcsU8FLLUb8RYm+Vx@lists.infradead.org
X-Gm-Message-State: AFuF++n0N5+aSYn6Tgq/sNvFxbrSolSQObdPx6ylDMA++DOEsMQzLM/U
	ceBzDCCwJdOOADdLjYLCsDgcsEn4kVl4UVcen/LJkKv2ncLUJfnJa8pLElGeDBkjKnnwOx2DQVy
	2Blvfvs+9WvHpfHxsdYvDzIlITDMiicCx3r+QEwkIuiztWZDYdM5XDguEPI4ttWLoakdOTxbr2+
	ya
X-Gm-Gg: AYBFou0WhSmLXDl2xRvrNZwuub8dtr0N1wCJqfir6Qa5J8JCIOhLeULeebkYsRlXczr
	PyNIvVZipJILsCiULGeYU4ZRzwmYLFkTgEg38m1dS+qQJms82EhwSUPj4suOwITWbs1STDnjsvZ
	jyPfyd7EDgak83xP9Td/WhBfMyaTgjrfKA9FgakDrxR749tbM4DjPCKmyWU3vMgi+C4hVghBj1l
	YnvzeP+HqXhkFZEpuXozBybdZGL8uXLWvcKN1b9OysUxo3RUOiuE2XIr3xdebe0MvLs7Uf+xbj2
	h1KoTO1ZbuNzo8fMODKqFDATTnENBIyTNdES57aMftGCO/FWRQm7cnFCC8nPLZRBvK7uG5SSLuC
	HIes3J+ycaEBOvGEa+/+BITm4czKMe32gTA9fNAz5Tg==
X-Received: by 2002:a17:903:2acb:b0:2d9:1c02:5a19 with SMTP id d9443c01a7336-2d94a956b48mr72439865ad.22.1788236974298;
        Mon, 31 Aug 2026 21:29:34 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2d9:1c02:5a19 with SMTP id d9443c01a7336-2d94a956b48mr72439155ad.22.1788236973766;
        Mon, 31 Aug 2026 21:29:33 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm30663601eec.17.2026.08.31.21.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 21:29:33 -0700 (PDT)
Message-ID: <8e699e2d-c04c-4ff7-98a3-c01e573ee817@redhat.com>
Date: Tue, 1 Sep 2026 14:29:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 15/45] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-16-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260803134403.80630-16-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NsqmXFtVon3XUJr5jm8TLsdig6GlrSBIpiWVili5zaA_1788236975
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_212938_632438_72AC89FD 
X-CRM114-Status: GOOD (  23.44  )
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

On 8/3/26 11:43 PM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> RMM v2.0 provides no mechanism for the host to perform debug operations
> on the guest. So limit the extensions that are visible to an allowlist
> so that only those capabilities we can support are advertised.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>   * Add missing check in kvm_vm_ioctl_enable_cap().
> Changes since v10:
>   * Add a kvm_realm_ext_allowed() function which limits which extensions
>     are exposed to an allowlist. This removes the need for special casing
>     various extensions.
> Changes since v7:
>   * Remove the helper functions and inline the kvm_is_realm() check with
>     a ternary operator.
>   * Rewrite the commit message to explain this patch.
> ---
>   arch/arm64/kvm/arm.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index c4d906861736..6f39831dcf5d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -135,6 +135,26 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>   	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>   }
>   
> +static bool kvm_realm_ext_allowed(long ext)
> +{
> +	switch (ext) {
> +	case KVM_CAP_IRQCHIP:
> +	case KVM_CAP_ARM_PSCI:
> +	case KVM_CAP_ARM_PSCI_0_2:
> +	case KVM_CAP_NR_VCPUS:
> +	case KVM_CAP_MAX_VCPUS:
> +	case KVM_CAP_MAX_VCPU_ID:
> +	case KVM_CAP_MSI_DEVID:
> +	case KVM_CAP_ARM_VM_IPA_SIZE:
> +	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> +	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +	case KVM_CAP_ARM_RMI:
> +	case KVM_CAP_SYNC_MMU:
> +		return true;
> +	}
> +	return false;
> +}
> +

Nitpick: The code can be simplified a bit if @kvm is passed to kvm_realm_ext_allowed().
In this way, kvm_realm_ext_allowed() looks similar to kvm_pkvm_ext_allowed().

static bool kvm_realm_ext_allowed(struct kvm *kvm, long ext)
{
	if (!kvm || !kvm_is_realm(kvm))
		return true;

	switch (ext) {
	case KVM_CAP_IRQCHIP:
		:
	case KVM_CAP_SYNC_MMU:
		return true;
	}

	return false;
}

>   int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   			    struct kvm_enable_cap *cap)
>   {
> @@ -146,6 +166,9 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
>   		return -EINVAL;
>   
> +	if (kvm && kvm_is_realm(kvm) && !kvm_realm_ext_allowed(cap->cap))
> +		return -EINVAL;
> +

	if (!kvm_realm_ext_allowed(kvm, cap->cap))
		return -EINVAL;

>   	switch (cap->cap) {
>   	case KVM_CAP_ARM_NISV_TO_USER:
>   		r = 0;
> @@ -380,6 +403,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
>   		return 0;
>   
> +	if (kvm && kvm_is_realm(kvm) && !kvm_realm_ext_allowed(ext))
> +		return 0;
> +

	if (!kvm_realm_ext_allowed(kvm, ext))
		return 0;

>   	switch (ext) {
>   	case KVM_CAP_IRQCHIP:
>   		r = vgic_present;

Thanks,
Gavin


