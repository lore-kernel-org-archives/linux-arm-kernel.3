Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5FEFF60CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maG6nfZQgH+Y/DQIl+eNNNql4z2F0EWR/JvGxahP5xw=; b=wqeoQW54cVsSdcaFNdzMSvFGdW
	NL3UykmOOp9Ksm+WPlOisdRpbtIHa4tWgA9DzZEFupjjzmJ5n/eZVmf37EH56Vsks2WaRFw8sMaq1
	fQV40YD5DB6XmNu5lwdBegj/nklMLuyQWX0jtfPdmYoRGNior1+PAc2Uk+Ub8a7kNC4zXnDXgI5qp
	Rqr7NE6Z+7/zyOs6E+L+e80KoYNzbAuXV4bdsX7Y0m1gTu/kRRQ1vKlL7P2WUklkBXafR53Gijpk6
	6wdsGXXa/fVfQHKzW4RhsfSenZASpoUUl4T4GOktxq7jfvRCTfQlCbjvoO0dZWSRoMNw3u+DZrwRc
	+rJRz8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sh4-0000000COHw-47MM;
	Tue, 31 Mar 2026 06:35:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sh2-0000000COHa-2q3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:35:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AFA5495B;
	Mon, 30 Mar 2026 23:35:09 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CC303F7D8;
	Mon, 30 Mar 2026 23:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774938914; bh=hJ/peryzDyZXWHGuHVyca0EHV/+QHTpwsvOABi0KKkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iCCd9igQkNYtcksU7nNahSiWtqNQghsVB3OVx2YC1LmA4pdcD1Wo4kstqSaW16KqR
	 ZQm/I0QvNn/DR1r99Xv36tVA2U/RRPfeGYvCQDKFlFKs5rKIipKSq0E5mTi7ce3BLW
	 A17d7CCSRFfDv4RsVbr5f8ZKCASkreqRTuwN+K5U=
Message-ID: <3870cd5d-3128-4f59-9e20-413f3651da58@arm.com>
Date: Tue, 31 Mar 2026 12:05:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/30] KVM: arm64: Optimize early exit checks in
 kvm_s2_fault_pin_pfn()
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-12-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-12-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_233516_782481_F613EB08 
X-CRM114-Status: GOOD (  14.58  )
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
> Optimize the early exit checks in kvm_s2_fault_pin_pfn by grouping all
> error responses under the generic is_error_noslot_pfn check first,
> avoiding unnecessary branches in the hot path.
> 
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2b85daaa4426b..0c71e3a9af8b0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1791,12 +1791,13 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
>  				       fault->write_fault ? FOLL_WRITE : 0,
>  				       &fault->writable, &fault->page);
> -	if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> -		kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
> -		return 0;
> -	}
> -	if (is_error_noslot_pfn(fault->pfn))
> +	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
> +		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> +			kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
> +			return 0;
> +		}
>  		return -EFAULT;
> +	}
>  
>  	return 1;
>  }


