Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D63CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 22:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+Z44FQYE3kr39+LeJ1gbg5UpwtjtjiI6+HmJr0+Ky4=; b=mR0nUm3myiVsZXG8Abcg9L29T5
	KyFK1ZjB1O3qaVp8nM7uB+s6hVMahaXV77CDiF1Zfm3bzeTdet32yJEc+s8xktJPMqFaHb90DWjRX
	iVUcEOqegUZ67zamvWkNtBYuowflVHj5CVP5cvfuQnvpgrdRzdLkPFSri9eMb5nPGx2tZB+lyPygY
	/kjW6qHOJtd0HfHH3ywsBc1+vfHa7pyDPEig6DTETE2poJkLutwWthEcPbw95t7tDAuZXoTYg5R4C
	yeJLDtLjn0mRY6sv16017s3IJuRNczPhND91EldStTg5jWz59hupn06qFaCx9R5gabXfilqvJgvUw
	BpYx4uTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGX0-0000000HOwT-3nSe;
	Thu, 04 Jun 2026 22:27:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGX0-0000000HOwM-1ght
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 22:27:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD7E3443AB;
	Thu,  4 Jun 2026 22:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5E51F00893;
	Thu,  4 Jun 2026 22:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780612037;
	bh=F+Z44FQYE3kr39+LeJ1gbg5UpwtjtjiI6+HmJr0+Ky4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YY+PWJbqFOW7MVHs2UWn9WKb/O3pLlrClAakAXKjMh1xBVdz51aK2XYVyhzzk/Yei
	 cXqj142YHZuANKznAmo7xUOCxc4ZTt7Dy+D/wO+tGgjNiqwXzGB5QU9ecuKvvp9nz4
	 LbE/Lv0Y+XlDSqFM7RKgNC9riQq325Dcru28U6nmW+aFoMZuy74lafmpFek2sVgR7W
	 +XcIOZgw97Xyw4BtM1x2fhEen2PUuQLHapOkKEnvXQ5OP8ZQKTBKDqU68RYY02L+wg
	 76UsarN/e2oiRjJjEsjwXPSlo11i3yzqpso1I9WLuesFGXP7ZT2J9L38eUo5UuE7VJ
	 IKMbxFwuk0KkQ==
Date: Thu, 4 Jun 2026 15:27:16 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, christoffer.dall@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: Reallocate the nested_mmus array under the
 mmu_lock
Message-ID: <aiH7xKnprU9bUap5@kernel.org>
References: <aiHEKOeZMVwsRlvP@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiHEKOeZMVwsRlvP@v4bel>
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

Hi,

The shortlog is very confusing, since "allocate behind $LOCK" is usually
something alarming. Maybe instead:

  KVM: arm64: Reassign nested_mmus array behind mmu_lock

On Fri, Jun 05, 2026 at 03:30:00AM +0900, Hyunwoo Kim wrote:
> Code that walks kvm->arch.nested_mmus[] holds kvm->mmu_lock. By contrast,
> kvm_vcpu_init_nested() reallocates the array and frees the old buffer while
> holding only kvm->arch.config_lock, so a walker can reference the freed
> array.

It wouldn't hurt to share slightly more information here. Are you
dealing with a concurrent MMU notifier?

> Allocate the new array outside the lock, as the allocation can sleep, and
> do only the copy and the pointer swap under the mmu_lock. After the swap no
> walker can reach the old buffer, so free it once the lock has been
> released.
> 
> Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

The diff itself LGTM

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
>  arch/arm64/kvm/nested.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 38f672e940878..6f7bc9a9992e0 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -89,21 +89,28 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
>  	 * again, and there is no reason to affect the whole VM for this.
>  	 */
>  	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
> -	tmp = kvrealloc(kvm->arch.nested_mmus,
> -			size_mul(sizeof(*kvm->arch.nested_mmus), num_mmus),
> -			GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> -	if (!tmp)
> -		return -ENOMEM;
>  
> -	swap(kvm->arch.nested_mmus, tmp);
> +	if (num_mmus > kvm->arch.nested_mmus_size) {
> +		tmp = kvcalloc(num_mmus, sizeof(*tmp), GFP_KERNEL_ACCOUNT);
> +		if (!tmp)
> +			return -ENOMEM;
>  
> -	/*
> -	 * If we went through a realocation, adjust the MMU back-pointers in
> -	 * the previously initialised kvm_pgtable structures.
> -	 */
> -	if (kvm->arch.nested_mmus != tmp)
> -		for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
> -			kvm->arch.nested_mmus[i].pgt->mmu = &kvm->arch.nested_mmus[i];
> +		write_lock(&kvm->mmu_lock);
> +
> +		if (kvm->arch.nested_mmus_size) {
> +			memcpy(tmp, kvm->arch.nested_mmus,
> +			       size_mul(sizeof(*tmp), kvm->arch.nested_mmus_size));
> +
> +			for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
> +				tmp[i].pgt->mmu = &tmp[i];
> +		}
> +
> +		swap(kvm->arch.nested_mmus, tmp);
> +
> +		write_unlock(&kvm->mmu_lock);
> +
> +		kvfree(tmp);
> +	}
>  
>  	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
>  		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
> -- 
> 2.43.0
> 

