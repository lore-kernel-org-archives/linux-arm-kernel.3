Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66789FF60C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 03:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30YSwAK1yO2AXdOMPvlU9Fb0CpOoYA/G3jCUnGaulpo=; b=kOhcqOUx1qJxEmmH61ewFwJo8v
	Cg8W+eC7OYlYKVmg9Nine+Z0WErvjzTJ0O0pioGazuec7ov/Y4tIDT/0RqSF0OdbdreFCUPu7b6it
	1dB580tsEABYSQLpYVM6g+q6p0mi25QxzqmS7g+U06eUjN5dOhYL94N/ANPQ0FIl09ojqaLiAOBqG
	UtfLeZFxon6rOH5nwXwXgrUL8lpmimZFxvVKvDCEvXPXhn90apy0TZwI8mRoI7XRWhtBD7PhJ8fa7
	EDSCrElrtAsV2Zx0AF+wY6OZlUitBYGNpjEgB/UhHrV4uGGXikbCd8zewqwcb3uqhG6tmhJ5I3WBp
	dAF2rxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7QDG-0000000CFx3-3MA7;
	Tue, 31 Mar 2026 03:56:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7QDD-0000000CFwh-3QeT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 03:56:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C165814BF;
	Mon, 30 Mar 2026 20:56:10 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E793F641;
	Mon, 30 Mar 2026 20:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774929376; bh=80O4NMmB3gBu9FMGBVti7X/3T9K3gvasVuFL3fYGb24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q134Con3DS6ptSSm/vMlMBnGJSdar55NAeFdN+buDQB+PsDZJCwKdyZXSt37066kt
	 QezDfsjAADDdUOo/oZuiAZODm0XNIhTau/L2hOOX75zRmw9Ee681lV3CfC0dWNogq+
	 L9jJOoq+D7tEzYvhFKPiRjV4sEd+vqa+888fwbow=
Message-ID: <0a164ac6-fe82-4ac1-ba57-557755ee342d@arm.com>
Date: Tue, 31 Mar 2026 09:26:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/30] KVM: arm64: Simplify nested VMA shift
 calculation
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-8-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-8-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_205619_923419_E490FB07 
X-CRM114-Status: GOOD (  15.64  )
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

On 27/03/26 5:05 PM, Marc Zyngier wrote:
> From: Fuad Tabba <tabba@google.com>
> 
> In the kvm_s2_resolve_vma_size() helper, the local variable vma_pagesize
> is calculated from vma_shift, only to be used to bound the vma_pagesize
> by max_map_size and subsequently convert it back to a shift via __ffs().
> 
> Because vma_pagesize and max_map_size are both powers of two, we can
> simplify the logic by omitting vma_pagesize entirely and bounding the
> vma_shift directly using the shift of max_map_size. This achieves the
> same result while keeping the size-to-shift conversion out of the helper
> logic.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 164f1160ea33d..5572b127f8663 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1646,7 +1646,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>  				     bool *force_pte, phys_addr_t *ipa)
>  {
>  	short vma_shift;
> -	long vma_pagesize;
>  
>  	if (*force_pte)
>  		vma_shift = PAGE_SHIFT;
> @@ -1677,8 +1676,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>  		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
>  	}
>  
> -	vma_pagesize = 1UL << vma_shift;
> -
>  	if (nested) {
>  		unsigned long max_map_size;
>  
> @@ -1703,8 +1700,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>  			max_map_size = PAGE_SIZE;
>  
>  		*force_pte = (max_map_size == PAGE_SIZE);
> -		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
> -		vma_shift = __ffs(vma_pagesize);
> +		vma_shift = min_t(short, vma_shift, __ffs(max_map_size));
>  	}
>  
>  	return vma_shift;


