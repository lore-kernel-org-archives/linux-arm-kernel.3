Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC0C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwewWXuellUxCVLHF8M3hS9Uz8emBp8FvvCzwLugC6A=; b=yCeByfU+nKYJSTW0Pj/Agj4V4D
	Lu517A8SD3kaBbQ1C82cd2PQZzzYIVsyDlzRFjhPB7INL6eaylMI/mb6KFL1UA4M1UKuJXuBW4ZFT
	D7SVhLbf59fccB1ayqsarXDafq2v+DqaYzESNxO2YUHqF9eYQDaCLXD88bYkwWk8J6FBSlvG0XReV
	cR/kwYwXm5Rm5yRjjbtpBakL1CeH62hTrfMkF95TpMEm4QcsVGGmcnD4thNeeM+aHcBKRxpaTSHk5
	AS+zO9WH0ozf7MRYuVNKXU0V1dheTFIZokWnb/qP1ndKFEaice0NL09YnJ3EubaGQLqbRvlqjGTnS
	ENg852VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3e7t-00000007a4Z-1AHI;
	Mon, 07 Sep 2026 18:31:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3e7r-00000007a4B-1dRN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:31:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E70B1476;
	Mon,  7 Sep 2026 11:31:22 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B3E53F528;
	Mon,  7 Sep 2026 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788805886; bh=SZUjhJyyh2zwnMxlfGcwmQhqJPQPy3XgjQ6vqEO15ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lmc45SDAMBKe7AkSPW1lwmMvu5V2Pk09bHJtneTOm6g2ReQNVHeT/504qbpgSlOFd
	 TOVHrH1pMbTbzxelCNduAG1SUWkVIwzlZ5eMrFwGT+ZJfPBOm2NYe/ByDt4o6G8D/s
	 DLDS/o+hzEGDaQ6ORUIdTJoJK37bA3fGDJK/IS8Q=
Date: Mon, 7 Sep 2026 19:31:17 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 20/20] KVM: arm64: Stage-2 huge mappings for protected VMs
Message-ID: <vid5oqqbit6vrszu65so62igdxybukfyaqjdg2ymtgufsl2sqk@wnqwnrbtsajs>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-21-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-21-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_113127_494867_BAC1B9B1 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, Aug 03, 2026 at 11:09:04AM +0100, Vincent Donnefort wrote:

[...]

> @@ -1755,25 +1737,59 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  		goto unpin;
>  	}
>  
> +	pfn = page_to_pfn(page);
> +	gfn = gpa_to_gfn(s2fd->fault_ipa);
> +
> +	page_size = transparent_hugepage_adjust(kvm, s2fd->memslot, s2fd->hva, &pfn, &gfn);
> +	if (page_size < 0) {
> +		ret = page_size;
> +		goto unpin;
> +	} else if (page_size == PMD_SIZE) {
> +		if (WARN_ON(!folio_test_large(page_folio(page)))) {

folio_size() >= PMD_SIZE seems more robust here.

> +			ret = -EINVAL;
> +			goto unpin;
> +		}
> +	}
> +
> +	ret = account_locked_vm(mm, page_size / PAGE_SIZE, true);

"page_size / PAGE_SIZE" :)
Maybe call this mapping_size?

Thanks,
Wei-Lin Chang

> +	if (ret)
> +		goto unpin;
> +
>  	write_lock(&kvm->mmu_lock);
> -	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
> -				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
> +	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(gfn), page_size,
> +				      __pfn_to_phys(pfn), KVM_PGTABLE_PROT_RWX,
>  				      hyp_memcache, 0);
>  	write_unlock(&kvm->mmu_lock);
>  	if (ret) {
>  		if (ret == -EAGAIN)
>  			ret = 0;
> -		goto unpin;
> +		goto dec_account;
>  	}
>  
>  	return 0;
> +
> +dec_account:
> +	account_locked_vm(mm, page_size / PAGE_SIZE, false);
>  unpin:
>  	unpin_user_pages(&page, 1);
> -dec_account:
> -	account_locked_vm(mm, 1, false);
>  	return ret;
>  }
>  

[...]

