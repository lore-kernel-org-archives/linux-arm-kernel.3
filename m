Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566EFC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/N2L3Cw1UrT66uEmHGGmoTWSgiUKsnwQtuwgvg8Krxk=; b=ZjItzfBqeUBr0tssQYxOK/4NMI
	oD0u//s3P140DchikrY5CPg3V09is9RCAc/SUVMl7yOy+D9ydOvqpJDuX4pMV1QX353g3BUC3x9Q+
	n635BVy9c8Ca/DFLvmiGU5u7Zw8yKOQyG6PZ1YIUX/CBtESS4jWf6qI4navRrxpbAN6KW6lGMHBKY
	V2RBoaJURsKMvYv+FFicygp3Sj0WMSVWZcSLdhSMmKDl32hQ9Jf6/jIX/KAZbtvUHaLmV0Drkc6h9
	gB7fMK+v3nEWs6S0f+j6dYBqrpkYTSR179oBkUUTj90y24lNBLM9di7W7dVBldcs5toTTKbjFTeHE
	AZjCbabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVJU-00000004GBQ-2JR8;
	Tue, 01 Jul 2025 07:21:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUdw-00000004Agj-0TuU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751351939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/N2L3Cw1UrT66uEmHGGmoTWSgiUKsnwQtuwgvg8Krxk=;
	b=LLQzD4C0U8mMcvvbpWPdydKV6VNmPDI3GcXDmwFl/9/1cWTPcLA60DdLWErgkfgXEc/6kF
	tvNdXyXzuS+vOk0Wo61keCLQUF23MC9e6wrQnIP5j+N+aXtAjlMdxrk34FMkzHFqzcUH2J
	wThVwlKVbPUNgfnMi5nL8Z/eJBPqYDw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-n07zdDQ6M4u7ze1XXwZZxw-1; Tue, 01 Jul 2025 02:38:55 -0400
X-MC-Unique: n07zdDQ6M4u7ze1XXwZZxw-1
X-Mimecast-MFC-AGG-ID: n07zdDQ6M4u7ze1XXwZZxw_1751351935
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so2232267a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 23:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351935; x=1751956735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/N2L3Cw1UrT66uEmHGGmoTWSgiUKsnwQtuwgvg8Krxk=;
        b=HdqHM15grwG5M6uwJx2sKvjfG7xcjApqsXVeCaIhfubuj6kZiEFeYFblQscFpQjoJz
         yyKx5HYYd5jVXNj3vYEgU2NuyW58qMy0rddbG1N37oJeiRui5CFS/uOENoT0eSIrx1YG
         X08dAVX8W/WukyBMMiFay9ZBRF+Vbbp7v+rVR6oleKYbHkWq6JrC8qZGhh+uMTbd80zP
         OGILCnBxaLzNpPNVhnALjBK6GzeSdMi5oMjwMzG1I2y2MSa6ScgchzGqf1ifzXjxVE3q
         q5TduBkuvlwzpNVVErASp190cfcBslyK5mqN6bz8+XflNYBfUKdTemMjKByMToKMGAuW
         RWnw==
X-Forwarded-Encrypted: i=1; AJvYcCV9bbBVl2dsQbu20tJwcB44RWwKW83F5LaxHvIE1IrecDj2wgmoRgLQrj2jfuwu3p4y0jmb6zKo6yL3iAz0/5zb@lists.infradead.org
X-Gm-Message-State: AOJu0YzcKpsxf09Uc+b1rbFgVOMgegsmAjcURDLH1N4NkCYC99afiQ1T
	vSDkP4Zs4zV5iRxI/eWC//bpSIR4o3IazICJ6sxg12ZgNYmMz+bO9QlkcvKwayysGJGRA0sXftT
	ef+L68h9QOxlUirgBJGnCO4bfRbJKGP8qfbEwccxwJWUsGR/VrmZjXh+icKPSWaSmqRNOwZp7nF
	u+
X-Gm-Gg: ASbGncvaaO8RBn/2DSmgEPK7ZbJkbBybj6jENI5Ns8/PDR83/Dp5AA/JzmwFUCGQyoS
	/MnnLw+j10ul9hV6yAq+pX24t3YJHr/hts1JeHHX9U1Qo2KSDbyf5lq0tyvZt/Zvot7olBMLQpx
	uNHRPhb4dfL35/84tnlLu/ynTJ0OWqtbk7NH5WKpjPF1l0ipH9KGTJ4Fb1Nk/zYFumowIuOu1yV
	q/3boORm7ikCgN1hP+92KXZSgL6HrgZjQwgxJ3XgIKzUp84jjCe9yW05lLSLYxirfCdXLXd5n19
	2j92gymkhrii4iH1YB1PV6VA+Wkir88cL2Hm0g1yevsTgOV+gvEN9pT26n+atQ==
X-Received: by 2002:a17:90b:3c50:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-318c8ec5177mr22460864a91.5.1751351934650;
        Mon, 30 Jun 2025 23:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXGVdcl+epWZi9VPn55ApO38WReIopBQVp1X+PhM6QPcmIdOqHMzKdtlUHTKMJd/V5XIritA==
X-Received: by 2002:a17:90b:3c50:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-318c8ec5177mr22460805a91.5.1751351934113;
        Mon, 30 Jun 2025 23:38:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1523351sm10913306a91.48.2025.06.30.23.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:38:53 -0700 (PDT)
Message-ID: <e33e6268-a6a5-421d-97c1-b26044e3cfa5@redhat.com>
Date: Tue, 1 Jul 2025 16:38:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/43] KVM: arm64: Allow passing machine type in KVM
 creation
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
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-10-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-10-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZjLzitfaAkrbkWPpdemyYl40Xw0DyfP25qcKoEbt9ZM_1751351935
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_233900_270341_0ECD97B9 
X-CRM114-Status: GOOD (  27.71  )
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

On 6/11/25 8:48 PM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Add some documentation explaining the new machine type.
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   Documentation/virt/kvm/api.rst | 16 ++++++++++++++--
>   arch/arm64/kvm/arm.c           | 15 +++++++++++++++
>   arch/arm64/kvm/mmu.c           |  3 ---
>   include/uapi/linux/kvm.h       | 19 +++++++++++++++----
>   4 files changed, 44 insertions(+), 9 deletions(-)
> 

One nitpick below.

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 65543289f75c..0049d67fe38f 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -181,8 +181,20 @@ flag KVM_VM_MIPS_VZ.
>   ARM64:
>   ^^^^^^
>   
> -On arm64, the physical address size for a VM (IPA Size limit) is limited
> -to 40bits by default. The limit can be configured if the host supports the
> +On arm64, the machine type identifier is used to encode a type and the
> +physical address size for the VM. The lower byte (bits[7-0]) encode the
> +address size and the upper bits[11-8] encode a machine type. The machine
> +types that might be available are:
> +
> + ======================   ============================================
> + KVM_VM_TYPE_ARM_NORMAL   A standard VM
> + KVM_VM_TYPE_ARM_REALM    A "Realm" VM using the Arm Confidential
> +                          Compute extensions, the VM's memory is
> +                          protected from the host.
> + ======================   ============================================
> +
> +The physical address size for a VM (IPA Size limit) is limited to 40bits
> +by default. The limit can be configured if the host supports the
>   extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>   KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
>   identifier, where IPA_Bits is the maximum width of any physical
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8080443d24af..b3e3323573c6 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -172,6 +172,21 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	if (type & ~(KVM_VM_TYPE_ARM_MASK | KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
> +		return -EINVAL;
> +
> +	switch (type & KVM_VM_TYPE_ARM_MASK) {
> +	case KVM_VM_TYPE_ARM_NORMAL:
> +		break;
> +	case KVM_VM_TYPE_ARM_REALM:
> +		if (!static_branch_unlikely(&kvm_rme_is_available))
> +			return -EPERM;
> +		kvm->arch.is_realm = true;
> +		break;

Here we need to explicitly set the realm's state to REALM_STATE_NONE even though
it's equal to zero, and the struct vm should have been cleared on allocation.

		WRITE_ONCE(kvm->arch.realm.state, REALM_STATE_NONE);
		kvm->arch.is_realm = true;
		break;

> +	default:
> +		return -EINVAL;
> +	}
> +
>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);

[...]

Thanks,
Gavin


