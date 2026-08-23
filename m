Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02053C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 05:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhied+RrHvfAlPalGsWSr2PGKdyWrajPn0cro9XXUAU=; b=rYdMfyE/spus5AfQoMDI4TgaTA
	KvQJNGLklRG/+mAKmbrqzgS0tk/UKswIDh2+vjv6eysofRC/v74q1s2yg0q7jJ21m88n/06Fwob2i
	W0B7OUFJEn4iEdV7iZthjraumA+CfWZftHxB0Lg2y//rpWS6jTPD9kIRlsw/kOJX4LSjPDHgb0AtC
	EpNkbnu8ks6GdIFqOrs4JSuPMNYUYCMEuuhMniGk9zkeT2S6w7xs3MFRGgJhT3Fbf/zNBGyGquzXe
	yg4izpHdddRljiLlReKqhM9iTY2oxRjz4N13RrR+8AL2UC79Jb1pyZsdfdGasBiDR+Hx3/9gpVP8x
	ayUe1oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0uf-0000000F6HD-1b4L;
	Sun, 23 Aug 2026 05:38:33 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0uc-0000000F6Gc-17sL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 05:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787463500; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=bhied+RrHvfAlPalGsWSr2PGKdyWrajPn0cro9XXUAU=;
	b=OVEQ85wZgpp6Lvsml17Mm8SAwmnYgDuFVDSEDyhGQqFI73fm5nMNcLq6v2HghxDZtqd64JrbjZmL7efNqA1CDZOKgMzjF1IS1z1f7/piSGX7NDYp+i1SzGJdKygZsf6GsCHgbBn9G7QnzLwCmqod/ESqkMg8J3mpKfGMDKA4vZI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X9PtKmb_1787463498;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X9PtKmb_1787463498 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 23 Aug 2026 13:38:19 +0800
Date: Sun, 23 Aug 2026 13:38:18 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Christoffer Dall <christoffer.dall@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix spurious warning for benign stage
 2 teardown race
Message-ID: <dycpfrkpphjy5xnb57t2zvdmlpkx76lbow7w23l3d2fwgbfjjj@lbk4uh7awc2p>
References: <20260822-kvm-arm-nested-virt-fix-v2-0-ac4059a0eaa6@kernel.org>
 <20260822-kvm-arm-nested-virt-fix-v2-1-ac4059a0eaa6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822-kvm-arm-nested-virt-fix-v2-1-ac4059a0eaa6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_223830_897190_A095343C 
X-CRM114-Status: GOOD (  19.71  )
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

On Sat, Aug 22, 2026 at 06:46:53PM +0800, Lorenzo Stoakes (ARM) wrote:
> A batch of kernel warnings were triggered in the L0 host kernel when using
> kvmtool to experiment with nested virtualisation.

...

> Fixes: ec14c272408a ("KVM: arm64: nv: Unmap/flush shadow stage 2 page tables")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 74e7e7f7564c..31e049ded093 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -59,19 +59,25 @@ static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
>   * long will also starve other vCPUs. We have to also make sure that the page
>   * tables are not freed while we released the lock.
>   */
> -static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
> +static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>  			      phys_addr_t end,
>  			      int (*fn)(struct kvm_pgtable *, u64, u64),
>  			      bool resched)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +	phys_addr_t addr = start;
>  	int ret;
>  	u64 next;
>
>  	do {
>  		struct kvm_pgtable *pgt = mmu->pgt;
> +		/*
> +		 * We may be raced on PGT teardown when we release the
> +		 * kvm->mmu_lock. That's fine as the PGT is legitimately no
> +		 * longer present.
> +		 */
>  		if (!pgt)
> -			return -EINVAL;
> +			return resched && addr > start ? 0 : -EINVAL;

Hi,

I can understand the addr checking makes sure only return 0
when the mmu_lock is dropped at least once and get pgt =
NULL, may a variable like drop_lock = true when
cond_resched_rwlock_write(&kvm->mmu_lock) happens can have
better readability, but depends on you and others' opinion.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
>  		next = stage2_range_addr_end(addr, end);
>  		ret = fn(pgt, addr, next - addr);
>
> --
> 2.55.0

