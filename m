Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2518606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gopevmbs;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JPCFEXT9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9h7Gytq9HCPVXq2/X5UCkV4eCMg+CFGh9wukiXakeb0=; b=gopevmbsZltwCl
	IwYktTAzDmXJ8Lx9sS5jnlsHMa6SpXt/fnNFIhIabynCRGa0FLfH6iB7dcZoHVEv4jo/49VLJtTtd
	YchxDe0oZ7YtFASXDy2Kk5vpl8hJ1gkBNUEo2+KWUqeFtsD3E5GdvGh19z/PTZ+1sRgJHFODojK7n
	erFaea38EzuyB5VdT1VKlBKoDR6Myj9r5938lUPcw3nSuUvxOnNAxz4oawTmITyG2pibeoNzznJc2
	2U4weMCdv+7Jgl+xIWhi/yJ+/DoVllg4TUF26Zgye9GWJXHu3kLHJ2Y7pz+n1MO5ZHtjCbDIorSES
	grj6g1NZ3zTDnM0jfgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoHC-0000000FzHa-1pu6;
	Mon, 02 Nov 2026 09:24:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoH8-0000000FzE9-34IW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:24:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649281691;
	Mon,  2 Nov 2026 01:24:16 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6574A3F59E;
	Mon,  2 Nov 2026 01:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793611459; bh=K1Dq/9I09sZWP43Xp3qaEUYCa73+ATXolgz26YaJ1Kg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JPCFEXT9IuhR/bA6QW0TCqOFPie0SNczPkWArQ6j6p0psmc/2iUd7C/NPS16WhaKp
	 3cc3n6plh2RtDLch0kqOTRqVcBbq/rlqSlLfdjQDTmB6aMkQVzO49B4ttqZOiq+hNn
	 R5IowOwJBmzGd6XgRc/uRmpDWyYXTDJM4Lx+WMe8=
Message-ID: <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
Date: Mon, 2 Nov 2026 09:24:15 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] KVM: arm64: Clear the VM's feature bitmap when
 kvm_setup_vcpu() fails
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>,
 Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
 <20261102075843.2556018-2-fuad.tabba@linux.dev>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261102075843.2556018-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012422_906382_E830C951 
X-CRM114-Status: GOOD (  22.69  )
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
> KVM_ARM_VCPU_INIT records the requested features in the VM-wide bitmap
> before kvm_setup_vcpu() runs, and leaves them there when setup fails
> (e.g., HAS_EL2_E2H0 on a host without FEAT_NV1). The PMU attributes
> read that bitmap before the vCPU is initialized, so after such a
> failure with PMU_V3 requested, KVM_SET_DEVICE_ATTR on the PMU group no
> longer returns -ENODEV.
> 
> Until an INIT has succeeded, every INIT that gets past the feature
> checks rewrites the bitmap. After that, kvm_vcpu_init_changed()
> requires the requested features to match it, so the copy is a no-op.
> Clear the bitmap on failure while KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED
> is clear.
> 
> Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/kvm/arm.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 157bf4b812020..3e91e01b032c4 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1856,8 +1856,13 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>   	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
>   
>   	ret = kvm_setup_vcpu(vcpu);
> -	if (ret)
> +	if (ret) {
> +		/* Clear the bitmap if setup fails on the first vCPU to be initialized. */
> +		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))

Is this check necessary ? We go into kvm_setup_vcpu() only if the bit is
cleared and we do this under the config_lock mutex. The flag is only set
after we have finished the kvm_setup_vcpu() successfully, later down.

Otherwise,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> +			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
> +
>   		goto out_unlock;
> +	}
>   
>   	/* Now we know what it is, we can reset it. */
>   	kvm_reset_vcpu(vcpu);


