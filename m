Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EAEC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ia7NSpCs0XqiU38qUXoue+Xd0beZubPFPBr422HoB3s=; b=DzrPfgUDzIU9oVklQskrw/k9Gr
	xLBHegigOdqbvlBEGscFsZnpu5I77rY2vh4yBuPMQr2+I4cRa1QPOpN5YJRHOIgXjM/jwGcIl2tkK
	Di5jeAS0uA4ifuz4vIIUQ7qSNL0mfgD+gNJDaxGWIT8exAR1wOXQSgfd1ApeN1oWxhjfr0SU0cPwU
	tV0JOXHXyP7a3qsUXa25C6J6ooMvpwaE9EAFt9BAD6D97lctvBzfqAfRu2u4zJztocO+WV48NoThb
	neIGExX24ppY5RW218QPgRquKRiR+IW8AMXo+YMCECJmZqzgMesz9CIuZwlLgQ0lR2MCj+LSsKjf5
	UCXvSeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3caR-00000007POV-3BnQ;
	Mon, 07 Sep 2026 16:52:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3caN-00000007PNx-2Bmy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:52:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D47E1476;
	Mon,  7 Sep 2026 09:52:42 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F933F528;
	Mon,  7 Sep 2026 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788799965; bh=9KGiycjC0t79RPzsvjfZKtPbm8KkSJBkxzKIHrahiz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDQVkBbAvoRk8ASr2K6Iz+RksnpaYHjgHHet/FkQGGN4vkix5fYGu7aYvNa8MHLi6
	 4lKTZb4ak4jryOZefEYZiYh7f6WtwgQl5dbEVw4K51hqJXB6KhyLINqtY2+MHsnYkW
	 wRLsfN3MT3QtNNJicsORgjvJOdazczlrcG3NDgc0=
Date: Mon, 7 Sep 2026 17:52:35 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 12/20] KVM: arm64: Handle huge mappings in
 __pkvm_host_force_reclaim_page_guest()
Message-ID: <yzeb47zjrxdsfztilng7n4e22fnsm4ncqjeqzmryc7sqncuqw6@pjtshmjxwelh>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-13-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-13-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_095247_730507_4C9E6CA7 
X-CRM114-Status: GOOD (  16.51  )
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

On Mon, Aug 03, 2026 at 11:08:56AM +0100, Vincent Donnefort wrote:

[...]

> -static void hyp_poison_page(phys_addr_t phys)
> +static void __hyp_poison_page(void *addr, size_t size)
>  {
> -	void *addr = hyp_fixmap_map(phys);
> -
> -	memset(addr, 0, PAGE_SIZE);
> +	memset(addr, 0, size);
>  	/*
>  	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
>  	 * here as the latter may elide the CMO under the assumption that FWB
> @@ -1304,19 +1302,15 @@ static void hyp_poison_page(phys_addr_t phys)
>  	 * host stage-2 and would otherwise lead to a malicious host potentially
>  	 * being able to read the contents of newly reclaimed guest pages.
>  	 */
> -	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
> -	hyp_fixmap_unmap();
> +	kvm_flush_dcache_to_poc(addr, size);
>  }
>  
>  static void hyp_poison_range(phys_addr_t phys, u64 size)
>  {
> -	u64 offset;
> -
> -	for (offset = 0; offset < size; offset += PAGE_SIZE)
> -		hyp_poison_page(phys + offset);
> +	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
>  }

Patch 8 introduces hyp_poison_range(), and it is reimplemented in
another way here. Maybe just do it this way in the first time?

>  
> -static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
> +static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_hyp_vm **vm,
>  				      u64 *gfn)
>  {
>  	enum pkvm_page_state state;
> @@ -1344,34 +1338,43 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
>  	if (ret)
>  		return ret;
>  
> -	if (WARN_ON(level != KVM_PGTABLE_LAST_LEVEL))
> -		return -EINVAL;
> +	/* We only support either PAGE_SIZE or PMD_SIZE */
> +	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
> +		return -E2BIG;
>  
> -	return host_stage2_decode_gfn_meta(pte, vm, gfn);
> +	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
> +	if (ret)
> +		return ret;
> +
> +	*size = kvm_granule_size(level);
> +
> +	return 0;

This can also be moved into its own patch with get_valid_guest_pte(),
hyp_poison_range() changes in my opinion.

Thanks,
Wei-Lin Chang

[...]

