Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD9ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpqw4QLrpkREL7g/4BVWyuKQK/UEFizfufMyRoTb7uU=; b=JNFktfpEj+SGo7K4JEB1LYjQ7q
	J9akFj6uGo4jL4ksYoEDAvNglYTQ9wkidR2OLmWmBx86WX1Xhdcq8ldzjAyCSLJ3X0s8xAdC3dYwk
	ek+o51+rkIiKcDZslNp8Qzf2sS3Li8fGM7dmT4axofRRryzbQXzUr6sFqNbwKsoim4TFXTW3KKvL1
	uXPjDpyS1acyUlf30r4PwFWGqg+pENbgjlMmsjIMPOho9z4XfGupJ46QpGCV4+o4pyljsvEUA5orn
	engX+R92F/34XmYh4Wu1nKfdCBgc3GGFa4BQyRZDJ+IeXT3SZZFUJyK6F5ooIDtr427uytc+9PiWi
	3ba3gezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20k-00000008vUa-0XKp;
	Tue, 09 Sep 2025 17:20:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvygM-00000007Uzw-2LyT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E529A6021E;
	Tue,  9 Sep 2025 13:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C10C4CEF4;
	Tue,  9 Sep 2025 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757425609;
	bh=fzqqDDXTXgc1xKVVIHwn9vLmbH7HU5zTtM5qBx+V1ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6O+tDe2nrg87Y7/S+Zk9CUrbY2AdJMilB+urbthEyUsD50w1xb2noRQ1hCfq76IO
	 OC9sU4Hg0uJfdwkJkJOdPfYuPYJ3kLD6dm4xpaPKqMxOpRvB6YOhyKHGaoqDDtJNMk
	 dwqSNFvk3G51DEKHhMh5plT2MAealjDxEpioHpsZDuSJmRqbkzRxgN5bRqAXaPdL4Z
	 qecqt2l8gxUclecmElV1DM1/ODvksxyOjKEL6UsI40CQDjtXObCrGsN+vpMdcM4jU+
	 xFO2svDAchpW7sWBsiJrHobI4p46x7Kj0bJp+Tgv4oE94k83/EhbqFzHRLuvO3gP6j
	 fXLkQS3/pTCCg==
Date: Tue, 9 Sep 2025 14:46:42 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 01/28] KVM: arm64: Add a new function to donate memory
 with prot
Message-ID: <aMAvwlMQ-Jf2MWzd@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-2-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:29PM +0000, Mostafa Saleh wrote:
> Soon, IOMMU drivers running in the hypervisor might interact with
> non-coherent devices, so it needs a mechanism to map memory as
> non cacheable.
> Add ___pkvm_host_donate_hyp() which accepts a new argument for prot,
> so the driver can add KVM_PGTABLE_PROT_NORMAL_NC.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 5f9d56754e39..52d7ee91e18c 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -36,6 +36,7 @@ int __pkvm_prot_finalize(void);
>  int __pkvm_host_share_hyp(u64 pfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 8957734d6183..861e448183fd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -769,13 +769,15 @@ int __pkvm_host_unshare_hyp(u64 pfn)
>  	return ret;
>  }
>  
> -int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
>  	u64 size = PAGE_SIZE * nr_pages;
>  	void *virt = __hyp_va(phys);
>  	int ret;
>  
> +	WARN_ON(prot & KVM_PGTABLE_PROT_X);

Should this actually just enforce that the permissions are
KVM_PGTABLE_PROT_RW:

	WARN_ON((prot & KVM_PGTABLE_PROT_RWX) != KVM_PGTABLE_PROT_RW);

?

Since the motivation is about the memory type rather than the
permissions, it would be best to preserve the current behaviour.

Will

