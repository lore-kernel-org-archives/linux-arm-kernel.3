Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC639606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mDMfN84y;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gccdexj1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vhiIK5PdTbwawB02fP2FOqUEIxrnLxsctWx372F2gzw=; b=mDMfN84yySJXN7
	O/gEhUMTe3k8+WU+lYSOOjGH4xRSOGlxLJZYpXi/k0XDZzFfOY/tIEdO7efxd4rN5+ZkuJG6h4HOV
	J2pRjP32zmoZlLxTDShoD4K/DIXzBHk8oxaRm4TBkRPuNq66j++LQ4Jx9M4qF/F3wTbUZqXa/8lo0
	G3SS455CINWr37/djt4dTkL1uRmFc9pcosMzPB8vkaMUxhDG8og5MeeUOjDWCE08yQUjPUed6yc1C
	6UxknL+HM1AhhrFRr4LZS63RU1fJh6jgXzQnt5B6QUXWp2oxTzuiZouSJQXFnLL4ZJFZwq0hNnayB
	DvxI/JINsVdyoPuKWsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomi-0000000G6Pd-0FHl;
	Mon, 02 Nov 2026 09:57:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomf-0000000G6Nz-3Min
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:56:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069301595;
	Mon,  2 Nov 2026 01:56:54 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CC263F59E;
	Mon,  2 Nov 2026 01:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613417; bh=41gNfj/3A8ki9t26Cg2dgECj8r+E6+sd8etdy9Thqd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gccdexj1jX8rBkY14YBg4UcTDhTgWONWIbGeArCgbRMNdU0/2G6ZZ43/73JSxGiVV
	 7jKecXSJ+s1jgCav7JcsrTvW6tVxqbDJNiseB9CxPP2+6rmo1SUz8tZ8XOh/yIwWg/
	 jUYkUKUNJop5w32l1YPjfgU4MDwn6mfs1ZxeXTMc=
Message-ID: <5f82a68f-cb2c-4155-8f9f-cf287d5b00d6@arm.com>
Date: Mon, 2 Nov 2026 09:56:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] KVM: arm64: Clear the default PMU when
 kvm_setup_vcpu() fails
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>,
 Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
 <20261102075843.2556018-3-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261102075843.2556018-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015657_954344_A3B9B10D 
X-CRM114-Status: GOOD (  23.56  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 07:58, Fuad Tabba wrote:
> Under KVM_ARM_VCPU_PMU_V3_STRICT, the VM has no PMU until userspace
> selects one, and initializing the PMU fails with -ENXIO until then.
> However, without STRICT, kvm_setup_vcpu() selects the default PMU
> before it prepares the vCPU for nested virtualization, and leaves it
> set when that preparation fails. After a retry with STRICT,
> initializing the PMU succeeds and the guest gets the PMU of the CPU
> the failed INIT ran on.
> 
> Drop the PMU and its number of counters along with the VM's feature
> bitmap. While KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is clear, no vCPU
> has been initialized and the PMU attributes return -ENODEV, so only
> such a failure can have set them. Once the flag is set, every INIT has the
> features of the first one that succeeded, which either selected a PMU
> or had none to select, so kvm_setup_vcpu() doesn't select another.
> 
> Fixes: ad220e275c398 ("KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/kvm/arm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 3e91e01b032c4..65194e02cdbc2 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1857,9 +1857,12 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>   
>   	ret = kvm_setup_vcpu(vcpu);
>   	if (ret) {
> -		/* Clear the bitmap if setup fails on the first vCPU to be initialized. */
> -		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
> +		/* Clear the bitmap and PMU if setup fails on the first vCPU to be initialized. */
> +		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags)) {
>   			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
> +			kvm->arch.arm_pmu = NULL;
> +			kvm->arch.nr_pmu_counters = 0;
> +		}

minor nit: While the above works, it looks a bit too much extracting the 
PMU details to arm.c. Alternatively we could do something like this:


diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e2b28dbc0451..7a669cccf912 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1088,6 +1088,11 @@ int kvm_arm_set_default_pmu(struct kvm *kvm)
         return 0;
  }

+int kvm_arm_clear_default_pmu(struct kvm *kvm)
+{
+       kvm_arm_set_pmu(kvm, NULL);
+}
+
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 6b4a118d17ca..571c0ba8507c 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -92,6 +92,7 @@ void kvm_vcpu_pmu_resync_el0(void);
  u8 kvm_arm_pmu_get_pmuver_limit(void);
  u64 kvm_pmu_evtyper_mask(struct kvm *kvm);
  int kvm_arm_set_default_pmu(struct kvm *kvm);
+int kvm_arm_clear_default_pmu(struct kvm *kvm);
  u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm);

  u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu);



Either ways,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com


