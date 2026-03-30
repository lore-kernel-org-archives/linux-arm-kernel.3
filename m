Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C7FFB3D00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrz/9TK1bCHdQJ7YP4gayJJSBKVxsoIB10nRvn63rxs=; b=feF7PLvWqxmoZe0gx8N9anA8xQ
	yFPCDbO6e9wAjDZ91l74+Tp3SokhUP4OSKWh61PJ4BTYgu3KAo6fW8JsOrMU3juG3SCiA1/LA2mZy
	0X1hGbTQbfVqZbiJpc7hz+SO/lMq/MfoL88c6oUwHwLKjy75vK1y6I4JL7adxqlVTd19EENPqdfH0
	YzW+IHwSBwBjR2x4ZodMwAzmZjGMCHvrCjkRXlURRpBqVQWsPIvSfiKG4oOgbo9mKC/OIgGVnFTQl
	9SAwWaidXsDPGHRxDXwyHpyYk3KK9Ag7XZkDQxJCAdiJ39dYGVNMHQcGWQi4WD+4jZVLJgI6DRLsi
	qjsl80vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AEt-0000000B6c1-3YML;
	Mon, 30 Mar 2026 10:52:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AEs-0000000B6bp-44e3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wrz/9TK1bCHdQJ7YP4gayJJSBKVxsoIB10nRvn63rxs=; b=CZPIXGkIwJWhBW4YZgKnvEp4Xy
	hwdS6YhX2OvoEYRknbFa5csSpIEZTHjgLsv1pmVqByuQlE5nmIkdVJcSJRdd3v3E3k+O+as6pR9yl
	S6BPIVEwu9VhiaZWifrxL1lyIq/YqMO9aqz451apDnzttl6wpyl9YHDBZtOiVOER8ud53Z2w8o0ql
	UcMNWZf02igj+bN73lOe7xQRmrMBhXGvJ0nHvXHaqenUnx5lfglOPEiNxm2Wx+xbO4kIXN2/awkiD
	/Rz5yy2xx0MVU+TrTbYn3iNvVJV5+GqUJcG7eASqvKD8DkBJro0cM9KJo9x8Lxi50/BGYDwxVHfUR
	r8CMTTpA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AEp-0000000DdUE-2Kp3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:52:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43A1B1C2B;
	Mon, 30 Mar 2026 03:52:47 -0700 (PDT)
Received: from [10.57.13.56] (unknown [10.57.13.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEE5E3F915;
	Mon, 30 Mar 2026 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774867973; bh=+19Be+jxc7eVo6ptCT9N5p5AxdrCYoGU6ESzG8t9WMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ww1bWqYFHkJLZhcCE6e8ZBiflNW2C5IphbVCSs/zVp/vxuEClcMS56xJox2ODahwj
	 LRbyhNBB3fyWq5WX4kJWb+mBsO+xQWPASS6t7IPQrBSXBMZlSMjqaAR1bIi5HLon85
	 iF0M837dqYrazZwcQ7FR4BsQCvEpvt9PN+k5O8Co=
Message-ID: <4a2ab5b0-dec6-4ee2-8790-f27c2501f653@arm.com>
Date: Mon, 30 Mar 2026 11:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 32/48] arm64: Don't expose stolen time for realm
 guests
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-33-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260318155413.793430-33-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_115256_043318_11CB300C 
X-CRM114-Status: GOOD (  18.38  )
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

On 18/03/2026 15:53, Steven Price wrote:
> It doesn't make much sense as a realm guest wouldn't want to trust the
> host. It will also need some extra work to ensure that KVM will only
> attempt to write into a shared memory region. So for now just disable
> it.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Update the documentation to add a note about stolen time being
>     unavailable in a realm.
> ---
>   Documentation/virt/kvm/api.rst | 3 +++
>   arch/arm64/kvm/arm.c           | 5 ++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index bc180c853faf..70911fe6d435 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -9240,6 +9240,9 @@ is supported, than the other should as well and vice versa.  For arm64
>   see Documentation/virt/kvm/devices/vcpu.rst "KVM_ARM_VCPU_PVTIME_CTRL".
>   For x86 see Documentation/virt/kvm/x86/msr.rst "MSR_KVM_STEAL_TIME".
>   
> +Note that steal time accounting is not available when a guest is running
> +within a Arm CCA realm (machine type KVM_VM_TYPE_ARM_REALM).
> +
>   8.25 KVM_CAP_S390_DIAG318
>   -------------------------
>   
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 61182eb0cf70..7d92ddb06460 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -469,7 +469,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = system_supports_mte();
>   		break;
>   	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		if (kvm_is_realm(kvm))
> +			r = 0;
> +		else
> +			r = kvm_arm_pvtime_supported();

Could this be handled in kvm_realm_ext_allowed() ?

Suzuki


>   		break;
>   	case KVM_CAP_ARM_EL1_32BIT:
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);


