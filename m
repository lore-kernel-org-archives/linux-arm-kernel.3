Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D3BFED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnmpeg9bO0Ec39bx1Hr5LHxA4B8oh38KBZBmBtPa0Q4=; b=fUWpFtLKP5IVMBaEWC88QhJXrT
	sYhcDTRtb0rJd8QovKpYItZna7/iryfdIeS/jjqLgVYIrKwfX2+NbNNxpkEW0gs6l38KpbWE82MTb
	6+adGnIbr4YfiMJgNKAtGOsJ6hjFuqZnh6Hc2+ZvYtmac86+heDw8WCbyrkd/9c0pc0R4dAzRFl0w
	FSHkD7FWucAgIPhtKJ4z5GTRSwPRZo1y4ubXUYqYHXtPffIO98TFeXJ++W8OtnyCMuq60mqGTDq8t
	MZZGTXSXK9r4HU2REZqZhaQO2jfTrL4xJaxw9Tj0zLvI9UebBart82zd0LGWNPuNOsEmtz/IddAB+
	rxDYg6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Xw2-00000006tUz-1kI2;
	Tue, 17 Mar 2026 17:10:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Xvz-00000006tUa-3H2B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:10:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC95E1477;
	Tue, 17 Mar 2026 10:10:16 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0671C3F778;
	Tue, 17 Mar 2026 10:10:20 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:10:18 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, vdonnefort@google.com
Subject: Re: [PATCH v1 11/13] KVM: arm64: Optimize early exit checks in
 kvm_s2_fault_pin_pfn()
Message-ID: <20260317171018.GC3808327@e124191.cambridge.arm.com>
References: <20260306140232.2193802-1-tabba@google.com>
 <20260306140232.2193802-12-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306140232.2193802-12-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101023_884073_E8FB0BF5 
X-CRM114-Status: GOOD (  14.76  )
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

On Fri, Mar 06, 2026 at 02:02:30PM +0000, Fuad Tabba wrote:
> Optimize the early exit checks in kvm_s2_fault_pin_pfn by grouping all
> error responses under the generic is_error_noslot_pfn check first,
> avoiding unnecessary branches in the hot path.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2d6e749c1756..9265a7fc43f7 100644
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
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

